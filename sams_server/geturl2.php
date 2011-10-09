<?php
# Call by method post
# productid=pid&version_major=major&version_minner=minner&revision=revision&functions=functions&encrypt_limit=encrypt_limit
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);

# change charactor set for select
$sql = "SET CHARACTER_SET_RESULTS=utf8";
$result2 = mysql_query($sql, $db);

$sql = "select device_id,status,functions,random,version_major,revision,encrypt_limit from product where product_id='"
       	. $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 0) {
		# update status to cumtomer
		$sql = "update product set status=0 where product_id='" . $_POST["product_id"] . "'";
		$result = mysql_query($sql, $db);
		if(!$result) {
			echo "{'code':6}"; # update status error
			mysql_close($db);
			die();
		}

		# check args
		$revision = $_POST["revision"] == 0 ? $myrow["revision"] : $_POST["revision"];
		$version_major = $myrow["version_major"] > $_POST["version_major"] ? $myrow["version_major"] : $_POST["version_major"];
		$functions = isset($_POST["functions"]) ? $_POST["functions"] : "";
		$encrypt_limit = isset($_POST["encrypt_limit"]) ? $_POST["encrypt_limit"] : "";

		# generate limit and encrypt_limit
		echo "{'encrypt_limit':'" . $myrow["encrypt_limit"] . "'";

		# generate revision list as revisions[], sql list as sqls[]
		$sql = "select revision,version_major,version_minner,alter_sql from version where revision > "
			. $revision
			. " and version_major=" . $version_major
		       	. " order by revision asc";
		$result3 = mysql_query($sql, $db);
		$sqls = array();
		$revisions = array();
		$version_major=1;
		$version_minner=0;
		while($r3 = mysql_fetch_assoc($result3)) {
			$revisions[] = $r3["revision"];
			$sqls[] = $r3["alter_sql"];
			$version_major=$r3["version_major"];
			$version_minner=$r3["version_minner"];
		}
		echo ",'revisions':";
		echo json_encode($revisions);
		echo ",'sqls':";
		echo json_encode($sqls);

		# generate url_installer
		if (($version_major == $_POST["version_major"]) &&
		       	($version_minner == $_POST["version_minner"]) ) {
			$installer = "installer.exe";
		} else {
			$installer = "full_installer.exe";
		}
		$url_installer = "download/" . $installer;
		echo ",'url_installer':'" . $url_installer . "'";

		# generate function list
		$sql = "select id,a1,a2,bh,parent,a5,a6,a7,level,isLeaf,showindex,a8 from functions where id in ("
			. $myrow["functions"] .")";
		$result2 = mysql_query($sql, $db);
		$rows = array();
		while($r = mysql_fetch_assoc($result2)) {
			$rows[] = $r;
		}
		echo ",'functions':";
		echo json_encode($rows);

		# if current version is already newest
		if(!$revisions) {
			echo ",'code':0}";
			mysql_close($db);
			die();
		}

		# log update infomation
		$sql = "insert into product_detail (device_id,revision_from,revision_to,function_from,function_to,limit_from,limit_to) values('" . 
			$myrow["device_id"] . "'," .
			$revision . "," .
			max($revisions) . ",'" .
			$functions . "','" .
			$myrow["functions"] . "','" .
			$encrypt_limit . "','" .
			$myrow["encrypt_limit"] . "')";
		$result3 = mysql_query($sql, $db);
		
		# generate code
		if($result3) {
			echo ",'code':0}";
		} else {
			echo ",'code':3}";
		}

	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such product
}
mysql_close($db);
?>
