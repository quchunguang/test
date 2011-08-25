<?php
# Call by method post
# productid=pid&encrypt=encrypted_random
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select ukey_id,random,status from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 1){
		exec("d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCrypt.exe '" . $_POST["encrypt"] . "' '" . $myrow["ukey_id"] . "' '" . $myrow["random"] . "'", $lines, $ret);
		if ($ret == 0) {
			$sql = "update customer set status=2 where product_id='" . $_POST["product_id"] . "'";
			$result = mysql_query($sql, $db);
			if(!$result) {
				echo "{'code':6}"; # update status error
			}
		}
		echo "{'code':" . $ret . "}";
	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such product
}
mysql_close($db);
?>
