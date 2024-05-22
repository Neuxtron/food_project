<?php
require_once "../helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

extract ($_POST);
if (!isset($id) || !isset($status)) {
  header("Location: ../order_list.php");
}

$sql = "UPDATE orders SET status='$status' WHERE id=$id";
$conn->query($sql);

header("Location: ../order_list.php");