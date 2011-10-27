<?php
# Call by method post
# device_id
# version_major
# version_minner
# revision
# (OPTION)
# functions
# encrypt_limit
# pt_id ukey=1(default), noukey=2
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("sams", $db);

# change charactor set for select
$sql = "SET CHARACTER_SET_RESULTS=utf8";
$result2 = mysql_query($sql, $db);

$sql = "select device_id,status,functions,random,version_major,revision,encrypt_limit from product where device_id='"
       	. $_POST["device_id"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] == 0 || $myrow["status"] == 12 || $myrow["status"] == 13) {
		# update status to cumtomer
		#$sql = "update product set status=0 where device_id='" . $_POST["device_id"] . "'";
		#$result = mysql_query($sql, $db);
		#if(!$result) {
		#	echo "{'code':6}"; # update status error
		#	mysql_close($db);
		#	die();
		#}

		# check args
		$revision = $_POST["revision"] == 0 ? $myrow["revision"] : $_POST["revision"];
		$version_major = $myrow["version_major"] > $_POST["version_major"] ? $myrow["version_major"] : $_POST["version_major"];
		$functions = isset($_POST["functions"]) ? $_POST["functions"] : "";
		$encrypt_limit = isset($_POST["encrypt_limit"]) ? $_POST["encrypt_limit"] : "";
		$pt_id = isset($_POST["pt_id"]) ? $_POST["pt_id"] : 1;

		# generate limit and encrypt_limit
		echo "{'encrypt_limit':'" . $myrow["encrypt_limit"] . "'";

		# generate revision list as revisions[], sql list as sqls[]
		$sql = "select revision,version_major,version_minner,alter_sql from version where revision > "
			. $revision
			. " and pt_id=" . $pt_id
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

		# get max_revisions
		if (empty($revisions)) {
			$max_revision = 0;
		} else {
			$max_revision = max($revisions);
		}

		# generate url_installer
		if ($pt_id == 1 || $pt_id == 2) {
			if (($version_major == $_POST["version_major"]) &&
			       	($version_minner == $_POST["version_minner"]) ) {
				$installer = $max_revision . ".sams.exe";
			} else {
				$installer = $max_revision . ".sams.full.exe";
			}
		} else {
			$installer = "unknown";
		}
		$url_installer = "download/" . $installer;
		echo ",'url_installer':'" . $url_installer . "'";

		# generate function list
		if ($myrow["functions"] != "") {
			if (substr($myrow["functions"], -1) == ",") {
				$functions_t = substr($myrow["functions"], 0, -1);
			} else {
				$functions_t = $myrow["functions"];
			}
			$sql = "select id,a1,a2,bh,parent,a5,a6,a7,level,isLeaf,showindex,a8 from functions where id in ("
				. $functions_t .")";
			$result2 = mysql_query($sql, $db);
			$rows = array();
			while($result2 && ($r = mysql_fetch_assoc($result2))) {
				$rows[] = $r;
			}
			echo ",'sql':'" . $sql . "','functions':";
			echo json_encode($rows);
		}
		else {
			echo ",'functions':''";
		}

		# if current version is already newest
		if(!$revisions) {
			echo ",'code':0}";
			mysql_close($db);
			die();
		}

		# log update infomation
		$sql = "insert into product_detail (device_id,pt_id,revison_from,revision_to,function_from,function_to,limit_from,limit_to) values('" . 
			$_POST["device_id"] . "'," .
			$pt_id . "," .
			$revision . "," .
			$max_revision . ",'" .
			$functions . "','" .
			$myrow["functions"] . "','" .
			$encrypt_limit . "','" .
			$myrow["encrypt_limit"] . "')";
		$result3 = mysql_query($sql, $db);
		
		# generate code
		if($result3) {
			echo ",'code':0}";
		} else {
			echo ",'code':3,'sql'='" . $sql . "'}";
		}

	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such product
}
mysql_close($db);
?>
