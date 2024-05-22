<?php

include "./helper/auth.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/all_products.css">
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
    <?php include 'sidebar.php'; ?>
    <div class="main-content">
        <div class="header">
            <div>
                <h1>All Products</h1>
                <p>Home > All Products</p>
            </div>
            <a href="./add_product.php" class="btn-outlined active" id="add">
                <?php include "./assets/ic_add.svg" ?>
                ADD NEW PRODUCT
            </a>
        </div>
        
        <div id="products">
            <?php
            
            include "./helper/connection.php";
            $dbh = new Dbh();
            $conn = $dbh->connect();

            $sql = "SELECT produk.*, kategori.title as namaKategori FROM produk LEFT JOIN kategori ON kategori.id=produk.idKategori";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $id = $row["id"];
                    $sql = "SELECT fileName FROM gambar_produk WHERE idProduk=$id LIMIT 1";
                    $gambar = $conn->query($sql)->fetch_assoc()["fileName"];

                    ?>
                    
                    <div class="product-container">
                        <div class="flex">
                            <img src="./images/<?= $gambar ?>" alt="">
                            <div>
                                <h1><?= $row["nama"] ?></h1>
                                <h2><?= $row["namaKategori"] ?></h2>
                                <p class="price">Rp <?= number_format($row["harga"]) ?></p>
                            </div>
                            <a href="./edit_product.php?id=<?= $id ?>" class="details"><?php include "./assets/ic_details.svg" ?></a>
                        </div>
                        <h1>Deskripsi</h1>
                        <p><?= $row["deskripsi"] ?></p>
                    </div>
                    
                    <?php
                }
            }
            
            ?>
        </div>
    </div>

    <script>setSidebar("nav-products")</script>
</body>
</html>
