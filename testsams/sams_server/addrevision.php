<?php
# Call by method post
# revision
# pt_id
# version_major
# version_minner
# release_notes
# alter_sql
# u500
# u1000
# unlimit
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select revision from version where revision='" . $_POST["revision"] . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) > 0) {
	echo "{'code':1}";  # error: revision already exist
	mysql_close($db);
	die();
}

$sql = "SET CHARACTER_SET_CONNECTION=utf8";
$result = mysql_query($sql, $db);
$sql = "SET CHARACTER_SET_CLIENT=utf8";
$result = mysql_query($sql, $db);
$sql = "insert into version (revision, version_major, version_minner, release_notes, alter_sql, u500, u1000, unlimit, pt_id) values(" .
$_POST["revision"] . "," .
$_POST["version_major"] . "," .
$_POST["version_minner"] . ",'" .
$_POST["release_notes"] . "','" .
$_POST["alter_sql"] . "','" .
$_POST["u500"] . "','" .
$_POST["u1000"] . "','" .
$_POST["unlimit"] . "'," .
$_POST["pt_id"] . ");";
if (mysql_query($sql, $db)) {
	echo "{'code':0}"; # ok
} else {
	echo "{'code':2}"; # error: insert revision error
}
mysql_close($db);
?>
