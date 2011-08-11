<?php
# Call by method post
# file=&feedback=...
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);
$sql = "select status from customer where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) <= 0) {
	echo "{'code':4}"; // no such product
} else if ( $_FILES["file"]["size"] > 300000 ) {
	echo "{'code':1}"; // file too big
} else if ( $_FILES["file"]["error"] == 4 ) {
	$sql = "SET CHARACTER_SET_CONNECTION=utf8";
	$result = mysql_query($sql, $db);
	$sql = "SET CHARACTER_SET_CLIENT=utf8";
	$result = mysql_query($sql, $db);
	$sql = "insert into feedback (filename, feedback) values('<none>','" .
$_POST["feedback"] . "');";
	$result = mysql_query($sql, $db);
	echo "{'code':0}";
} else if ( $_FILES["file"]["error"] > 0 ) {
	echo "{'code':2}"; // transfer error
} else if (($_FILES["file"]["type"] == "image/gif")
	|| ($_FILES["file"]["type"] == "image/png")
	|| ($_FILES["file"]["type"] == "image/x-png")
	|| ($_FILES["file"]["type"] == "image/jpeg")
	|| ($_FILES["file"]["type"] == "image/pjpeg")) {
	if (($_FILES["file"]["type"] == "image/jpeg")
		|| ($_FILES["file"]["type"] == "image/pjpeg")) {
		$ext = ".jpg";
	} else if (($_FILES["file"]["type"] == "image/png")
		|| ($_FILES["file"]["type"] == "image/x-png")) {
		$ext = ".png";
	}
	$filename = randString(12) . $ext;
	move_uploaded_file($_FILES["file"]["tmp_name"], "upload/" . $filename);
	$sql = "SET CHARACTER_SET_CONNECTION=utf8";
	$result = mysql_query($sql, $db);
	$sql = "SET CHARACTER_SET_CLIENT=utf8";
	$result = mysql_query($sql, $db);
	$sql = "insert into feedback (filename, feedback) values('" .
$filename . "','" .
$_POST["feedback"] . "');";
	$result = mysql_query($sql, $db);
	echo "{'code':0}";
} else {
	echo "{'code':3}"; // not support file type
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
