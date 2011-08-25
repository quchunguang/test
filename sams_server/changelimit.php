<?php
# Call by method post
# productid=pid&revision=revision&type=type
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

if($_POST["type"] != "u500" && $_POST["type"] != "u1000" && $_POST["type"] != "unlimit") {
	echo "{'code':3}"; # type error
	die();
}

mysql_select_db("sams", $db);
$sql = "select ukey_id from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	$sql = "select " . $_POST["type"] . " from version where revision='" . $_POST["revision"] . "'";
	$result = mysql_query($sql, $db);

	if ($myrow2 = mysql_fetch_array($result)) {
		exec("d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCryptBase64.exe 0 '" . $myrow["ukey_id"] . " " . $_POST["product_id"] . " 36", $lines, $ret);
		if ($ret == 0) {
			$sql = "update customer set encrypt_limit='" . $lines[0] . "' where product_id='" . $_POST["product_id"] . "'";
			$result = mysql_query($sql, $db);
			if(!$result) {
				echo "{'code':6}"; # update status error
				die();
			}
		}
		echo "{'code':" . $ret . "}";
	} else {
		echo "{'code':2}"; # revision error
	}
} else {
	echo "{'code':1}"; # no such product
}
mysql_close($db);
?>
