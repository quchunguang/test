<?php
function pkcs5_pad($text, $blocksize)  
{  
  $pad = $blocksize - (strlen($text) % $blocksize);  
  return $text . str_repeat(chr($pad), $pad);  
}  
  
function pkcs5_unpad($text)  
{  
  $pad = ord($text{strlen($text)-1});  
  if ($pad > strlen($text))   
  {  
    return false;  
  }  
  if( strspn($text, chr($pad), strlen($text) - $pad) != $pad)  
  {  
    return false;  
  }  
  return substr($text, 0, -1 * $pad);  
}  
  
$key = "20C86125F86DB932D0139D32D9208CEF52BAEC98F1E9BA2A";  
$key = pack("H48", $key);  
$iv = "0102030405060708";  
$iv = pack("H16", $iv);  
  
$td = mcrypt_module_open(MCRYPT_3DES, '', MCRYPT_MODE_CBC, '');  
mcrypt_generic_init($td, $key, $iv);  
  
$str = base64_encode(mcrypt_generic($td,pkcs5_pad("123456",8)));  
echo $str;
mcrypt_generic_deinit($td);  
mcrypt_module_close($td);  
  
$td = mcrypt_module_open(MCRYPT_3DES, '', MCRYPT_MODE_CBC, '');  
mcrypt_generic_init($td, $key, $iv);  
$ttt  = pkcs5_unpad(mdecrypt_generic($td, base64_decode($str)));  
mcrypt_generic_deinit($td);  
mcrypt_module_close($td);  
#echo $ttt;
?>
