<?php
# Call by method post
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

$sql = "insert into version (revision, version_major, version_minner, release_notes, alter_sql, u500, u1000, unlimit) values(" .
$_POST["revision"] . "," .
$_POST["version_major"] . "," .
$_POST["version_minner"] . ",'" .
$_POST["release_notes"] . "','" .
$_POST["alter_sql"] . "','" .
$_POST["u500"] . "','" .
$_POST["u1000"] . "','" .
$_POST["unlimit"] . "');";
if (mysql_query($sql, $db)) {
	echo "{'code':0}"; # ok
} else {
	echo "{'code':2}"; # error: insert revision error
}
mysql_close($db);
?>
