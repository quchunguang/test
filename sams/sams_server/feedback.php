<?php
# Call by method post
# file=&feedback=...
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);
$sql = "select device_id,sales_id,customer_id,status from product where product_id='" . $_POST["product_id"] . "'";
$result = mysql_query($sql, $db);
if (mysql_num_rows($result) <= 0) {
	echo makeRetHtml("数据提交失败！您的产品序列号不正确。", false);
	die(1);
}
$myrow = mysql_fetch_array($result);

$filename1 = processFile($_FILES["file1"]["error"], $_FILES["file1"]["type"], $_FILES["file1"]["size"], $_FILES["file1"]["tmp_name"]);
$filename2 = processFile($_FILES["file2"]["error"], $_FILES["file2"]["type"], $_FILES["file2"]["size"], $_FILES["file2"]["tmp_name"]);
$filename3 = processFile($_FILES["file3"]["error"], $_FILES["file3"]["type"], $_FILES["file3"]["size"], $_FILES["file3"]["tmp_name"]);
$filename4 = processFile($_FILES["file4"]["error"], $_FILES["file4"]["type"], $_FILES["file4"]["size"], $_FILES["file4"]["tmp_name"]);

$sql = "SET CHARACTER_SET_CONNECTION=utf8";
$result = mysql_query($sql, $db);
$sql = "SET CHARACTER_SET_CLIENT=utf8";
$result = mysql_query($sql, $db);
$sql = "insert into feedback (customer_id,sales_id,device_id,feedback,filename1,filename2,filename3,filename4) values('" .
	$myrow["customer_id"] . "','" .
	$myrow["sales_id"] . "','" .
	$myrow["device_id"] . "','" .
	$_POST["feedback"] . "','" .
	$filename1 . "','" .
	$filename2 . "','" .
	$filename3 . "','" .
	$filename4 . "');";
$result = mysql_query($sql, $db);
echo makeRetHtml("数据提交成功！感谢您的支持！", false);

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

function makeRetHtml($strMsg, $bRetBak)
{
	$strRet = "<div id=\"divFeedBack\" style=\"margin: 0 auto; padding:10px; font-size:12px; color:#996600;\">";
	$strRet .= $strMsg;
	$strRet .= "</div>";
	if($bRetBak){
		//$strRet .= '<div style="height:52px; width:95px; padding: 8px 0px 0 8px; border:0px;"><a style="float:right; display:block; width:95px; height:31px; background: url("images/fh_hover.png") 0 0 no-repeat;" href="javascript:history.back()" ><<返回</a></div>';
		$strRet .= '<div><a style="display:block;background:url(images/fh_hover.png) 0 0 no-repeat;height:31px; width:95px;" href="javascript:history.back()" a></div>';
		//$strRet .= '<div><a href="javascript:history.back()" ><<返回</a></div>';
	}
	return $strRet;	
}

function generateFilename($filetype)
{
	if (($filetype == "image/jpeg")
		|| ($filetype == "image/pjpeg")) {
		$ext = ".jpg";
	} else if (($filetype == "image/png")
		|| ($filetype == "image/x-png")) {
		$ext = ".png";
	} else if ($filetype == "image/gif") {
		$ext = ".gif";
	}
	return randString(12) . $ext;
}

function processFile($error, $type, $size, $tmp_name)
{
	if($error == 4){
		return "<none>";
	}
	if($size > 300000) {
		echo makeRetHtml("数据提交失败！图片超过300KB，请修改图片大小。", true);
		die(2);
	}
	if ( ($type == "image/png")
	|| ($type == "image/x-png")
	|| ($type == "image/gif")
	|| ($type == "image/jpeg")
	|| ($type == "image/pjpeg") ) {
		$filename = generateFilename($type);
		move_uploaded_file($tmp_name, "upload/" . $filename);
		return $filename;
	} else {
		echo makeRetHtml("数据提交失败！上传截图仅支持PNG/JPG/GIF格式。", true);
		die(3);
	}
}

?>
