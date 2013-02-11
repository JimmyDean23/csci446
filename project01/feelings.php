<?php

$name = $_POST['name'];
$created_at = date();
$how_to_feel = $_POST['how_to_feel'];

mysql_connect(localhost, $username, $password, $database);
$query = "INSERT INTO feelings(name, created_at, how_to_feel) VALUES ('$name', $created_at,'$how_to_feel');";

mysql_query($query);
mysql_close();

?>
<h1>You are feeling <?= $name ?> <?= $created_at ?></h1>
<p>You'd rather be <?= $how_to_feel ?>.</p>