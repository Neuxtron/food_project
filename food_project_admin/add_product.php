<?php

include "./helper/auth.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>New Product</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" href="css/add_product.css">
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
  
  <?php include 'sidebar.php'; ?>
  <div class="main-content">
    <div class="header">
        <h1>New Product</h1>
        <p>Home > All Products > Add New Product</p>
    </div>

      <div class="container flex">
        <form action="./actions/add_product.php" method="post" id="add-form">
          <h1>Product Name</h1>
          <input type="text" name="nama" id="nama" placeholder="Type name here" required>
          
          <h1>Description</h1>
          <textarea name="deskripsi" id="deskripsi" cols="30" rows="10" placeholder="Type descrption here" required></textarea>
  
          <h1>Category</h1>
          <select name="idKategori" id="idKategori" required>
            <option value="">--- Select Category ---</option>
            <?php
            
            include "./helper/connection.php";
            $dbh = new Dbh();
            $conn = $dbh->connect();
  
            $sql = "SELECT * from kategori";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
              ?>
                <option value="<?= $row["id"] ?>"><?= $row["title"] ?></option>
              <?php
            }
            
            ?>
          </select>
  
          <h1>Stock Quantity</h1>
          <input type="number" name="stock" id="stock" min="1" placeholder="Type stock quantity here" required>
  
          <h1>Sale Price</h1>
          <input type="number" name="harga" id="harga" min="1000" step="1000" placeholder="Type sale price here" required>
        </form>
        <div id="gambar-section">
          <h1>Product Gallery</h1>
          <label for="gambar" id="gambar-label">
            <?php include "./assets/ic_gambar.svg" ?>
            Select your image here
          </label>
          <input type="file" name="gambar" id="gambar" accept="image/*">
          
          <div id="gambar-holder"></div>
          <div id="actions" class="flex">
            <button class="filled" id="submit">Add</button>
            <button class="outlined active">Cancel</button>
          </div>
        </div>
      </div>
  </div>

  <script src="./js/add_product.js"></script>
</body>
</html>