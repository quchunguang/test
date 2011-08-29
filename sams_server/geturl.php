<?php
# Call by method post
# productid=pid
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select status,functions,random,revision,encrypt_limit from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 0){
		$sql = "update customer set status=0 where product_id='" . $_POST["product_id"] . "'";
		$result = mysql_query($sql, $db);
		if(!$result) {
			echo "{'code':6}"; # update status error
		}
		$installer = "installer.exe";
		$url_installer = "download/" . $installer;
		echo "{'code':0,'url_installer':'" . $url_installer . "'";

		# generate limit and encrypt_limit
		echo ",'encrypt_limit':'" . $myrow["encrypt_limit"] . "'";

		# generate revision list as revisions[], sql list as sqls[]
		$sql = "select revision,alter_sql from version where revision > " . $myrow["revision"] . " and alter_sql is not null order by revision asc;";
		$result3 = mysql_query($sql, $db);
		$sqls = array();
		$revisions = array();
		while($r3 = mysql_fetch_assoc($result3)) {
			$revisions[] = $r3["revision"];
			$sqls[] = $r3["alter_sql"];
		}
		echo ",'revisions':";
		echo json_encode($revisions);
		echo ",'sqls':";
		echo json_encode($sqls);

		# generate function list
		$sql = "SET CHARACTER_SET_RESULTS=utf8";
		$result2 = mysql_query($sql, $db);
		$sql = "select a1,a2,bh,parent,a5,a6,a7,level,isLeaf,showindex,a8 from functions where id in (". $myrow["functions"] .")";
		$result2 = mysql_query($sql, $db);
		$rows = array();
		while($r = mysql_fetch_assoc($result2)) {
			$rows[] = $r;
		}
		echo ",'functions':";
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
