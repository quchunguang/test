<?php
for ($i = 1; $i <= 20; $i++) {
	$key = randString(16);
	echo $key . "\n";
}
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
