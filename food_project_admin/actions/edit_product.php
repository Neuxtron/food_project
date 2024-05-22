<?php

require "../helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

$sql = "UPDATE produk SET nama=?, deskripsi=?, harga=?, idKategori=?, stock=? WHERE id=?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssss", $nama, $deskripsi, $harga, $idKategori, $stock, $id);
extract($_POST);

if ($stmt->execute()) {
  $response = array("status"=>true);
  echo json_encode($response);
} else {
  $response = array("status"=>false);
  echo json_encode($response);
}