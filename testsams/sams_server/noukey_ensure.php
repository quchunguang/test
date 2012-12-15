<?php
# Call by method post
# device_id
# random
# encrypt

# connect db
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

# generate license
mysql_select_db("sams", $db);
$sql = "select `pt_id`,`random`,`product_id`,`status`,`datetime`,`ukey_id` from `product` where `device_id`='" .
	$_POST["device_id"] . "' and `random`='" . $_POST["random"] . "'";
$result = mysql_query($sql, $db);
if ($result && $myrow = mysql_fetch_array($result)) {
	# check status
	if (($myrow["status"] != 11 && $myrow["status"] != 12 && $myrow["status"] != 13) || $myrow["pt_id"] != 2){
		echo "{'code':3}"; # status or pt_id error, what product type?
		mysql_close($db);
		die();
	}

	# ensure encrypt string
	$exe_result = exec('d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCryptExe.exe "' . urldecode($_POST["encrypt"]) . '" 0', $output, $ret);
	if ($ret != 0) {
		echo "{'code':4, 'info':'" . urldecode($_POST["encrypt"]) . "'}"; # excute outside exe error!
		mysql_close($db);
		die();
	}

	$exe_result_arr = explode("|", $exe_result);
	$user_random = $exe_result_arr[0];
	$user_mac = $exe_result_arr[1];

	if ($user_random != $myrow["random"] || $user_mac != $myrow["ukey_id"]) {
		echo "{'code':5}"; # ensure fail, random error or mac address error!
		mysql_close($db);
		die();
	}

	# update to try status(12)
	$status_try = 12;
	$sql = "update product set status=" . $status_try . " where device_id='" . $_POST["device_id"] . "'";
	$result = mysql_query($sql, $db);
	if(!$result) {
		echo "{'code':6}"; # update status error
		echo $sql;
		mysql_close($db);
		die();
	}

	# generate license
	$clear_text = $myrow["datetime"] . "|" . $user_mac . "|" . $myrow["random"] . "|" . $status_try;
	$sign_text = exec('d:\\qcg\\PHPnow\\htdocs\\sams_server\\senseCryptExe.exe "' . $clear_text . '" 2', $output, $ret);
	if ($ret != 0) {
		echo "{'code':7}"; # excute outside exe 2 error!
		mysql_close($db);
		die();
	}

	# ok
	echo "{'code':0,'license':'" . $sign_text .
		"','datetime':'" . $myrow["datetime"] .
		"','random':'" . $myrow["random"] .
		"','status':'" . $status_try . "'}";
} else {
	echo "{'code':1}"; # no such product, resign please!
}
mysql_close($db);
?>
