<?php
# Call by method post:
#
# productid=pid
# functionlist
# addlist
# deletelist
# modifylist
# selectlist
# otherlist
# exportlist
# from_date
# to_date

# db connection
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	echo "{'code':100}"; # cannot connect to db
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);

# get device_id
$sql = "select device_id from product where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) == 0) {
	echo "{'code':1}"; # no such product
	mysql_close($db);
	die();
}
$myrow = mysql_fetch_array($result);
$device_id=$myrow["device_id"];

$sql = "select device_id from usecount where device_id='" . $device_id . "'";
$result = mysql_query($sql, $db);
if ($result && (mysql_num_rows($result) == 1)) {
	# recode already exist
	$sql = "update usecount set " .
		"functionlist='" . $_POST["functionlist"] . "', " .
		"addlist='" . $_POST["addlist"] . "', " .
		"deletelist='" . $_POST["deletelist"] . "', " .
		"modifylist='" . $_POST["modifylist"] . "', " .
		"selectlist='" . $_POST["selectlist"] . "', " .
		"otherlist='" . $_POST["otherlist"] . "', " .
		"exportlist='" . $_POST["exportlist"] . "', " .
		"from_date='" . $_POST["from_date"] . "', " .
		"to_date='" . $_POST["to_date"] .
		"' where device_id='" . $device_id . "'";
	if (!mysql_query($sql, $db)) {
		echo "{'code':3, 'sql':'" . $sql . "'}"; # update error
		mysql_close($db);
		die();
	}
} else {
	# insert record
	$sql = "insert into usecount (device_id, functionlist, addlist, deletelist, modifylist, selectlist, otherlist, exportlist, from_date, to_date) values('" .
		$device_id . "','" .
		$_POST["functionlist"] . "','" .
		$_POST["addlist"] . "','" .
		$_POST["deletelist"] . "','" .
		$_POST["modifylist"] . "','" .
		$_POST["selectlist"] . "','" .
		$_POST["otherlist"] . "','" .
		$_POST["exportlist"] . "','" .
		$_POST["from_date"] . "','" .
		$_POST["to_date"] . "')";
	if (!mysql_query($sql, $db)) {
		echo "{'code':2, 'sql':'" . $sql . "'}"; # insert error
		mysql_close($db);
		die();
	}
}
echo "{'code':0}"; # ok

mysql_close($db);
?>
