<?php
# Call by method post
# productid=pid
$db = mysql_connect("localhost", "root", "qu-cg123");
mysql_select_db("sams", $db);
$sql = "select status,functions,random from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 2){
		# xml  = encrypt($ukey_id, generate_xml($myrow["functions"]));
		$xml = "encrypted.xml";
		$installer = "installer.exe";
		$url_xml = "download/" . $myrow["random"] . "/" . $xml;
		$url_installer = "download/" . $myrow["random"] . "/" . $installer;
		echo "{'code':0,'url_xml':'" . $url_xml . "','url_installer':'" . $url_installer . "'}"; # download urls
		$sql = "update customer set status=0 where product_id='" . $_POST["product_id"] . "'";
		$result = mysql_query($sql, $db);
	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such product
}
?>
