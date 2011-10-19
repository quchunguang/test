<?php
# Call by method post
# product_id
# random
# encrypt
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);
$sql = "select pt_id,random,status,datetime from product where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["random"] != $_POST["random"]) {
		echo "{'code':2}"; # random error, this product are not yours!
		mysql_close($db);
		die();
	}
	if ($myrow["status"] != 11 || $myrow["pt_id"] != 2){
		echo "{'code':3}"; # status or pt_id error, what product type?
		mysql_close($db);
		die();
	}

	# ensure 
	$exe_result = exec('d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCryptExe.exe "' . $_POST["encrypt"] . '" 0';
	if ($ret != 0) {
		echo "{'code':4}"; # excute outside exe error!
		mysql_close($db);
		die();
	}

	$exe_result_arr = explode("|", $exe_result);
	$user_random = $exe_result_arr[0];
	$user_mac = $exe_result_arr[1];

	if ($user_radom != $myrow["random"] || strlen($user_mac) != 17) {
		echo "{'code':5}"; # ensure fail, random error or mac address error!
		mysql_close($db);
		die();
	}

	# update mac address to ukey_id (length 16->17 in DB)
	# try status
	$status_try = 12;
	$sql = "update product set status=" . $status_try . ", ukey_id=" . $user_mac . " where product_id='" . $_POST["product_id"] . "'";
	$result = mysql_query($sql, $db);
	if(!$result) {
		echo "{'code':6}"; # update status error
		mysql_close($db);
		die();
	}

	# generate license
	$clear_text = $myrow["datetime"] . $user_mac . $myrow["random"] . $status_try;
	$sign_text = exec('d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCryptExe.exe "' . $clear_text . '" 2';
	if ($ret != 0) {
		echo "{'code':7}"; # excute outside exe 2 error!
		mysql_close($db);
		die();
	}

	# ok
	echo "{'code':0,'license':'" . $sign_text . "','datetime':'" . $myrow["datetime"] . "','status':'" . $status_try . "'}";
} else {
	echo "{'code':1}"; # no such product, resign please!
}
mysql_close($db);
?>
