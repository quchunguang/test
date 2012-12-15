<?php
# Call by method post
# product_id=pid
# mac="MAC_112233445566"
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);

# check if mac already exist
$sql = "select `device_id`,`random` from `product` where `product_id`='" . $_POST["product_id"] . "' and `ukey_id`='" . $_POST["mac"] . "'";
$result = mysql_query($sql, $db);
if ($result && $myrow = mysql_fetch_array($result)) {
	echo "{'code':3,'device_id':'" . $myrow["device_id"] . "','random':'" . $myrow["random"] . "'}"; # info: mac already exist, return random before to restore license
	mysql_close($db);
	die();
}

# check product
$sql = "select count(product_id) as pc_number from `product` where `product_id`='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($result && $myrow = mysql_fetch_array($result)) {
	if($myrow["pc_number"] >= 3) {
		echo "{'code':1}"; # error: arrived at max pc_number with same product_id
		mysql_close($db);
		die();
	}
}

$random = randString(16);
$device_id = randString(8);

# insert product to table `product`
$sql = "insert into product (`device_id`,`pt_id`,`product_id`,`version_major`,`revision`,`limit`,`encrypt_id`,`ukey_id`,`functions`,`status`,`random`) values ('" .
$device_id . "' , '" .
2 . "' , '" .
$_POST["product_id"] . "' , '" .
$_POST["version_major"] . "' , '" .
$_POST["revision"] . "' , '" .
$_POST["limit"] . "' , '" .
randString(16) . "' , '" .
$_POST["mac"] . "' , '" .
$_POST["functions"] . "' , '" .
11 . "' , '" .
$random . "')";
$result = mysql_query($sql, $db);
if(!$result) {
	echo "{'code':2}"; # insert product error
} else {
	echo "{'code':0,'device_id':'" . $device_id . "','random':'" . $random . "'}"; # random code
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
