<?php
# Call by method post
#
# table_name=version
# key_name
# key_value
# (field=value)*

$fieldlist = "";
$valuelist = "";
foreach ($_POST as $key => $value) {
	if($key=="table_name") {
		$table_name = $value;
	} else if($key=="key_name") {
		$key_name = $value;
	} else if($key=="key_value") {
		$key_value = $value;
	} else {
		$fieldlist .= $key . ",";
		$valuelist .= "'" . $value . "',";
	}
}
$fieldlist = rtrim($fieldlist, ",");
$valuelist = rtrim($valuelist, ",");

$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	echo "{'code':9}";  			# error: db connection
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);

# check if exist
$sql = "select " . $key_name .
       " from " . $table_name .
       " where " . $key_name . "='" . $key_value . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) > 0) {
	echo "{'code':1}";  			# error: recode by key already exist
	mysql_close($db);
	die();
}

# set unicode support
$sql = "SET CHARACTER_SET_CONNECTION=utf8";
if(!mysql_query($sql, $db)) {
	echo "{'code':3}";
	mysql_close($db);
	die();
}
$sql = "SET CHARACTER_SET_CLIENT=utf8";
if(!mysql_query($sql, $db)) {
	echo "{'code':4}";
	mysql_close($db);
	die();
}

# insert data
$sql = "insert into " . $table_name .
       " ( " . $fieldlist . " ) values ( " .
       $valuelist . " )";
if (mysql_query($sql, $db)) {
	echo "{'code':0}"; 			# ok
} else {
	echo "{'code':2, 'sql':'" . $sql . "'}";# error: insert operation error
}
mysql_close($db);
?>
