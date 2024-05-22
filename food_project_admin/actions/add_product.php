<?php

require "../helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

$sql = "INSERT INTO produk (nama, deskripsi, harga, idKategori, stock) VALUES (?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $nama, $deskripsi, $harga, $idKategori, $stock);
extract($_POST);

if ($stmt->execute()) {
  $sql = "SELECT id FROM produk ORDER BY id DESC LIMIT 1";
  $id = $conn->query($sql)->fetch_assoc()["id"];
  $response = array("status"=>true, "id"=>$id);
  echo json_encode($response);
} else {
  $response = array("status"=>false, "id"=>null);
  echo json_encode($response);
}