<?php
# Call by method post
# productid=pid&revision=revision
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select revision from customer where product_id='" . $_POST["product_id"] . "'";
if (!mysql_query($sql, $db)) {
	echo "{'code':1}";  # error: no such product
	die();
}
$sql = "select revision from version where revision='" . $_POST["revision"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	$sql = "update customer set revision=" . $_POST["revision"] . " where product_id='" . $_POST["product_id"] . "'";
	if (mysql_query($sql, $db)) {
		echo "{'code':0}"; # ok
	} else {
		echo "{'code':3}"; # error: update revision error
	}
} else {
	echo "{'code':2}"; # error: no such revision
}
mysql_close($db);
?>
