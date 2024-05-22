<?php

require_once "../helper/connection.php";
session_start();

$dbh = new Dbh();
$conn = $dbh->connect();

extract($_POST);
if (!isset($email) || !isset($password)) {
  header("Location: ../login.php");
}

$sql = "SELECT * FROM admin WHERE email='$email' AND password='$password' LIMIT 1";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$route = "../login.php";

if ($result->num_rows > 0) {
  $_SESSION["food-project"] = $email;
  $route = "../index.php";
} else {
  $msg = "Email atau password salah";
}
header("Location: $route?&msg=$msg");
