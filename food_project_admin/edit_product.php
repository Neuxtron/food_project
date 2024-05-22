<?php

include "./helper/auth.php";
include "./helper/connection.php";
$dbh = new Dbh();
$conn = $dbh->connect();

if (!isset($_GET["id"])) header("Location: ./all_products.php");
$idProduk = $_GET["id"];

$sql = "SELECT * FROM produk WHERE id=$idProduk";
$produk = $conn->query($sql)->fetch_assoc();

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Product</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" href="css/add_product.css">
  <link rel="stylesheet" href="css/edit_product.css">
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
  
  <?php include 'sidebar.php'; ?>
  <div class="main-content">
    <div class="header">
        <h1>Edit Product</h1>
        <p>Home > All Products > Edit Product</p>
    </div>

      <div class="container flex">
        <form action="./actions/edit_product.php" method="post" id="edit-form">
          <input type="hidden" name="id" value="<?= $idProduk ?>">
          <h1>Product Name</h1>
          <input type="text" name="nama" id="nama" placeholder="Type name here" value="<?= $produk["nama"] ?>" required>
          
          <h1>Description</h1>
          <textarea name="deskripsi" id="deskripsi" cols="30" rows="10" placeholder="Type descrption here" required><?= $produk["deskripsi"] ?></textarea>
  
          <h1>Category</h1>
          <select name="idKategori" id="idKategori" required>
            <option value="">--- Select Category ---</option>
            <?php
            
            $sql = "SELECT * from kategori";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
              $selected = $row["id"] == $produk["idKategori"]
              ?>
                <option value="<?= $row["id"] ?>" <?= $selected ? "selected" : "" ?>><?= $row["title"] ?></option>
              <?php
            }
            
            ?>
          </select>
  
          <h1>Stock Quantity</h1>
          <input type="number" name="stock" id="stock" min="1" placeholder="Type stock quantity here" value="<?= $produk["stock"] ?>" required>
  
          <h1>Sale Price</h1>
          <input type="number" name="harga" id="harga" min="1000" step="1000" placeholder="Type sale price here" value="<?= $produk["harga"] ?>" required>
        </form>
        <div id="gambar-section">
          <h1>Product Gallery</h1>
          <label for="gambar" id="gambar-label">
            <?php include "./assets/ic_gambar.svg" ?>
            Select your image here
          </label>
          <input type="file" name="gambar" id="gambar" accept="image/*">
          
          <div id="gambar-holder">
            <?php
            
            $idProduk = $produk["id"];
            $sql = "SELECT fileName from gambar_produk WHERE idProduk=$idProduk";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
              ?>
                <div class="flex gambar-item items-center">
                  <?php include "./assets/ic_gambar.svg" ?>
                  <p><?= $row["fileName"] ?></p>
                  <div class="dot"></div>
                </div>
              <?php
            }
            
            ?>
          </div>
          <div id="actions" class="flex">
            <button class="filled" id="submit">Update</button>
            <button class="filled" id="delete">Delete</button>
            <button class="outlined active">Cancel</button>
          </div>
        </div>
      </div>
  </div>

  <script src="./js/edit_product.js"></script>
  <script>
    const idProduct = <?= $idProduk ?>;
  </script>
</body>
</html>