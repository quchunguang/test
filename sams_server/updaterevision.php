<?php
# Call by method post
# productid=pid&revision=revision
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select device_id,revision from product where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if (!$result) {
	echo "{'code':1}";  # error: no such product
	mysql_close($db);
	die();
}
$myrow = mysql_fetch_array($result);

$sql = "select revision from version where revision='" . $_POST["revision"] . "'";
if (mysql_query($sql, $db)) {
	$sql = "update product set revision=" . $_POST["revision"] . " where product_id='" . $_POST["product_id"] . "'";
	if (!mysql_query($sql, $db)) {
		echo "{'code':3}"; # error: update revision error
		mysql_close($db);
		die();
	}
	$sql = "select max(id) as `id` from product_detail where device_id='" . $myrow["device_id"] . "'";
	$result = mysql_query($sql, $db);
	if (!$result) {
		echo "{'code':4}"; # error: cannot find item in product_detail
		mysql_close($db);
		die();
	}
	$myrow2 = mysql_fetch_array($result);

	$sql = "update product_detail set status=0 where id=" . $myrow2["id"];
	if (!mysql_query($sql, $db)) {
		echo "{'code':5}"; # error: update status in product_detail
		mysql_close($db);
		die();
	}

	echo "{'code':0}"; # ok
} else {
	echo "{'code':2}"; # error: no such revision
}
mysql_close($db);
?>
