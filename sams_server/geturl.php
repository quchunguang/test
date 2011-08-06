<?php
# Call by method post
# productid=pid
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select status,functions,random from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 2){
		$sql = "update customer set status=0 where product_id='" . $_POST["product_id"] . "'";
		$result = mysql_query($sql, $db);
		if(!$result) {
			echo "{'code':6}"; # update status error
		}
		$installer = "installer.exe";
		$url_installer = "download/" . $installer;
		echo "{'code':0,'url_installer':'" . $url_installer . "','functions':";
		$sql = "SET CHARACTER_SET_RESULTS=utf8";
		$result = mysql_query($sql, $db);
		$sql = "select a1,a2,bh,parent,a5,a6,a7,level,isLeaf,showindex,a8 from functions where id in (". $myrow["functions"] .")";
		$result = mysql_query($sql, $db);
		$rows = array();
		while($r = mysql_fetch_assoc($result)) {
			$rows[] = $r;
		}
		echo json_encode($rows);
		echo "}";
	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such product
}
mysql_close($db);
?>
