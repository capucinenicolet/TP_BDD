<?php

$server = "127.0.0.1";
$username = "root";
$password = "";
$database = "tp_bdd";

$link = mysqli_connect ($server, $username, $password, $database);

if(!$link) {
	echo "Error: Unable to connect to MySQL." . PHP_EOL;
	echo "Debbuging errno: " . mysqli_connect_errno() . PHP_EOL;
	echo "Debbuging error: " . mysqli_connect_error() . PHP_EOL;
	exit;

}

echo "Success.<br>" . PHP_EOL;
echo "Host information: " . mysqli_get_host_info($link) . "<br>". PHP_EOL;