<html>
<body>

<a href="http://www.w3school.com.cn/default.php">Home</a> |
<a href="http://www.w3school.com.cn/about.php">About Us</a> | 
<a href="http://www.w3school.com.cn/contact.php">Contact Us</a>
<br/>
<br/>

<?php
$d=date("D");
if ($d=="Fri")
	  echo "Have a nice weekend!<br/>"; 
else
	  echo "Have a nice day!<br/>"; 

$names = array("Peter","Quagmire","Joe");
$names[0] = "Peter";
$names[1] = "Quagmire";
$names[2] = "Joe";
echo $names[1] . " and " . $names[2] . " are ". $names[0] . "'s neighbors<br/>";
$ages = array("Peter"=>32, "Quagmire"=>30, "Joe"=>34);
$ages['Peter'] = "32";
$ages['Quagmire'] = "30";
$ages['Joe'] = "34";
echo "Peter is " . $ages['Peter'] . " years old.<br/>";
$families = array
(
  "Griffin"=>array
  (
  "Peter",
  "Lois",
  "Megan"
  ),
  "Quagmire"=>array
  (
  "Glenn"
  ),
  "Brown"=>array
  (
  "Cleveland",
  "Loretta",
  "Junior"
  )
);
echo "Is " . $families['Griffin'][2] . 
" a part of the Griffin family?<br/>"; 

$i=1;
while($i<=5)
  {
  echo "The number is " . $i . "<br/>";
  $i++;
  }

$arr=array("one", "two", "three");
foreach ($arr as $value)
{
  echo "Value: " . $value . "<br>";
}

function writeMyName()
  {
  echo "David Yang";
  }
writeMyName();

?>
<form action="welcome.php" method="post">
Name: <input type="text" name="name" />
Age: <input type="text" name="age" />
<input type="submit" />
</form>

</body>
</html>
