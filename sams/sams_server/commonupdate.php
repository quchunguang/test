<?php
# Call by method post
#
# table_name=version
# key_name
# key_value
# (field=value)*

$changelist = "";
foreach ($_POST as $key => $value) {
	if($key=="table_name") {
		$table_name = $value;
	} else if($key=="key_name") {
		$key_name = $value;
	} else if($key=="key_value") {
		$key_value = $value;
	} else {
		$changelist .= $key . " = '" . $value . "',";
	}
}
$changelist = rtrim($changelist, ",");

$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	echo "{'code':9}";  			# error: db connection
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);

# check if not exist
$sql = "select " . $key_name .
       " from " . $table_name .
       " where " . $key_name . "='" . $key_value . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) == 0) {
	echo "{'code':1}";  			# error: recode by key not exist
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

# update data
$sql = "update " . $table_name .
       " set " . $changelist . " where " .
       $key_name . " = '" . $key_value . "'";
if (mysql_query($sql, $db)) {
	echo "{'code':0}"; 			# ok
} else {
	echo "{'code':2, 'sql':'" . $sql . "'}";# error: insert operation error
}
mysql_close($db);
?>
