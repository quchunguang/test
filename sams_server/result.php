<html>
<body>
<?php
$db = mysql_connect("localhost", "root", "qu-cg123");
mysql_select_db("sams", $db);
$sql = "insert into customer (product_id, ukey_id, functions, version, username, tel, email, contact) values('" .
$_POST["product_id"] . "','" .
$_POST["ukey_id"] . "','" .
$_POST["functions"] . "','" .
$_POST["version"] . "','" .
$_POST["username"] . "','" .
$_POST["tel"] . "','" .
$_POST["email"] . "','" .
$_POST["contact"] . "');";
$result = mysql_query($sql, $db);
echo "Informationn entered, Now\n";
$result = mysql_query("select * from customer", $db);
echo "<table border=1>\n";
echo "<tr><td>product_id</td><td>ukey_id</td><td>functions</td><td>version</td><td>username</td><td>tel</td><td>email</td><td>contact</td></tr>\n";
while ($myrow = mysql_fetch_array($result)) {
	printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n",
		$myrow["product_id"], $myrow["ukey_id"], $myrow["functions"], $myrow["version"], $myrow["username"], $myrow["tel"], $myrow["email"], $myrow["contact"] );
}
echo "</table>\n";
?>
</body>
</html>
