<?php
# Call by method post
# username=uname&password=passwd_md5
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	echo "{'code':10}"; # db connection error
	die();
}

mysql_select_db("sams", $db);
$sql = "select sales_id,username,password,rights,isSuper,status from sales where username='" .
	$_POST["username"] . "'";
$result = mysql_query($sql, $db);
if ($myrow = mysql_fetch_array($result)) {
	if ($myrow["status"] != 0){
		if($_POST["password"] != $myrow["password"]) {
			echo "{'code':3}"; # password error
		} else {
			echo "{'code':0,'sales_id':" . $myrow["sales_id"] .
				",'rights':'" . $myrow["rights"]."',"."'isSuper':".$myrow["isSuper"].
				"}"; # success !
		}
	} else {
		echo "{'code':2}"; # status error
	}
} else {
	echo "{'code':1}"; # no such user
}
mysql_close($db);
?>
