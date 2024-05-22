<?php
require_once "../helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

$target_dir = "../images/";
$prefix_file = time() . "-";
$idProduk = $_POST["id"];

echo $idProduk;

foreach ($_FILES as $file) {
  $file_name = $prefix_file . basename($file["name"]);
  $target_file = $target_dir . $file_name;
  move_uploaded_file($file["tmp_name"], $target_file);

  $sql = "INSERT INTO gambar_produk (fileName, idProduk) VALUES ('$file_name', '$idProduk')";
  $conn->query($sql);
}