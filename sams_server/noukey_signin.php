<?php
# Call by method post
# product_id=pid
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);

# check product
$sql = "select status from product where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	echo "{'code':1}"; # already have this product error: registered before?
}
$random = randString(16);

# insert product to table `product`
$sql = "insert into product (`device_id`,`pt_id`,`product_id`,`version_major`,`revision`,`limit`,`encrypt_id`,`ukey_id`,`functions`,`status`,`random`) values ('" .
randString(8) . "' , '" .
2 . "' , '" .
$_POST["product_id"] . "' , '" .
$_POST["version_major"] . "' , '" .
$_POST["revision"] . "' , '" .
$_POST["limit"] . "' , '" .
randString(16) . "' , '" .
randString(16) . "' , '" .
$_POST["functions"] . "' , '" .
11 . "' , '" .
$random . "'";
$result = mysql_query($sql, $db);
if(!$result) {
	echo "{'code':2}"; # insert product error
} else {
	echo "{'code':0,'random':'" . $random . "'}"; # random code
}
mysql_close($db);

function randString($len)
{
	$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz'; // characters to build the password from
	$string='';
	for(; $len>=1; $len--) {
		$position=rand()%strlen($chars);
		$string.=substr($chars, $position, 1);
	}
	return $string;
}
?>
