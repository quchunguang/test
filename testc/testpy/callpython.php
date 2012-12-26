<!DOCTYPE html>
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type='text/css'>
 body{
 background:#000;
 color: #7FFF00;
 font-family:'Lucida Console',sans-serif !important;
 font-size: 12px;
 }
</style>
</head><body>
<pre>
<?php
$param1 = "first";
$param2 = "second";
$param3 = "third";
$command = "python callpython.py";
$command .= " $param1 $param2 $param3 2>&1";
$pid = popen($command,"r");
while(!feof($pid))
{
 echo fread($pid, 256);
 flush();
 ob_flush();
 usleep(100000);
}
pclose($pid);
?>
</pre>
<script>window.scrollTo(0,99999);</script>
<br /><br />by Kevin Qu<br /><br />
</body></html>
