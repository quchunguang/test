<?php
# Call by method post
# productid=pid
$db = mysql_connect("localhost", "root", "qu-cg123");
if (!$db) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("sams", $db);

$device_id = randString(8);
$encrypt_id = randString(16);
$ukey_id = randString(16);
$sql = "insert into customer (device_id, product_id, revision, encrypt_id, ukey_id) values('" .
	$device_id . "','" .
	$_POST["product_id"] . "','" .
	$_POST["revision"] . "','" .
	$encrypt_id . "','" .
	$ukey_id . "');";
$result = mysql_query($sql, $db);

$file_tmpl = "/var/www/sams_server/senseCrypt/f001.hex";
$file = file_get_contents($file_tmpl);
$from = ":100A4600000102030405060708090A0B0C0D0E0F28";
$encrypt_id = bin2hex($encrypt_id);
$ukey_id = bin2hex($ukey_id);
$to1 =  ":100A4600" . $encrypt_id . "28";
$to2 =  ":100A4600" . $ukey_id . "28";
$f001 = str_replace($from, $to1, $file);
$f002 = str_replace($from, $to2, $file);

echo "{'device_id':'" . $device_id . "','f001':'" . $f001 . "','f002':'" . $f002 . "'}";
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
