<?php

require_once "../helper/connection.php";
session_start();
session_unset();
session_destroy();

$dbh = new Dbh();
$conn = $dbh->connect();

extract($_POST);
if (
  !isset($firstName)
  || !isset($lastName)
  || !isset($email)
  || !isset($password)
) {
  header("Location: daftar.php");
}

function checkInput() {
  global $conn;
  global $email;
  global $password;
  
  if (strlen($password) < 6) return "Password minimal 6 karakter";

  $sql = "SELECT email FROM admin WHERE email='$email'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) return "Email sudah terdaftar";

  return "";
}

$msg = checkInput();
$route = "../signup.php";

if ($msg == "") {
  $sql = "INSERT INTO admin (firstName, lastName, email, password) VALUES ('$firstName', '$pemda', '$email', '$password')";
  $result = $conn->query($sql);
  
  if ($result) {
    $route = "../login.php";
  } else {
    $msg = "Terjadi kesalahan, silahkan coba lagi";
  }
} else {
  $status = "gagal";
}
header("Location: $route?msg=$msg");