<?php

require "../helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

$sql = "DELETE FROM produk WHERE id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $id);
extract($_GET);

$stmt->execute();
header("Location: ../all_products.php");