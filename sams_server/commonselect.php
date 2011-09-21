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

# change charactor set for select
$sql = "SET CHARACTER_SET_RESULTS=utf8";
if(!mysql_query($sql, $db)) {
	echo "{'code':1}";
	mysql_close($db);
	die();
}

# get data
if ($key_value == -1) {
	$sql = "select * from " . $table_name;
} else {
	$sql = "select * from " . $table_name . " where " . $key_name . "='" . $key_value . "'";
}
$result = mysql_query($sql, $db);
if(!$result) {
	echo "{'code':2, 'sql': '" . $sql . "'}";
	mysql_close($db);
	die();
}
$rows = array();
while ($myrow = mysql_fetch_assoc($result)) {
	$rows[] = $myrow;
}
echo "{'code':0, 'result':";
echo json_encode($rows);
echo "}";
mysql_close($db);
?>
