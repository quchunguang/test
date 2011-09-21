<?php
# Call by method post
#
# table_name=version
# key_name
# key_value

$table_name = $_POST["table_name"];
$key_name = $_POST["key_name"];
$key_value = $_POST["key_value"];

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

# delete recode
$sql = "delete from " . $table_name .
       " where " .
       $key_name . " = '" . $key_value . "'";
if (mysql_query($sql, $db)) {
	echo "{'code':0}"; 			# ok
} else {
	echo "{'code':2, 'sql':'" . $sql . "'}";# error: insert operation error
}
mysql_close($db);
?>
