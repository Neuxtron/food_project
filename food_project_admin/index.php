<?php

include "./helper/connection.php";
include "./helper/auth.php";
$dbh = new Dbh();
$conn = $dbh->connect();

$sql = "SELECT COUNT(*) as total FROM orders";
$total = $conn->query($sql)->fetch_assoc()["total"];
$sql = "SELECT COUNT(*) as total FROM orders WHERE status!='Selesai'";
$antrian = $conn->query($sql)->fetch_assoc()["total"];
$sql = "SELECT COUNT(*) as total FROM orders WHERE status='Selesai'";
$selesai = $conn->query($sql)->fetch_assoc()["total"];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/dashboard.css">
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
    <?php include 'sidebar.php'; ?>
    <div class="main-content">
        <div class="header">
            <h1>Dashboard</h1>
            <p>Home > Dashboard</p>
        </div>
        <div class="cards">
            <div class="card">
                <div class="card-content">
                    <div class="card-text">
                        <p>Total Pemesanan</p>
                    </div>
                    <div class="card-stats">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon">
                        <span class="card-number"><?= $total ?></span>
                        <div class="card-percentage">
                            <span class="percentage"><?= number_format(($total / $total) * 100, 1) ?>%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-text">
                        <p>Antrian Pemesanan</p>
                    </div>
                    <div class="card-stats">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon">
                        <span class="card-number"><?= $antrian ?></span>
                        <div class="card-percentage">
                            <span class="percentage"><?= number_format(($antrian / $total) * 100, 1) ?>%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-text">
                        <p>Pemesanan Selesai</p>
                    </div>
                    <div class="card-stats">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon">
                        <span class="card-number"><?= $selesai ?></span>
                        <div class="card-percentage">
                            <span class="percentage"><?= number_format(($selesai / $total) * 100, 1) ?>%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="recent-orders-container">
    <h2>Recent Orders</h2>
    <table>
        <thead>
            <tr>
                <th><input type="checkbox" name="order" value="12345"></th>
                <th>Product</th>
                <th>Order ID</th>
                <th>Date</th>
                <th>Customer Name</th>
                <th>Status</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <?php
            
            $sql = "SELECT orders.*, users.nama FROM orders LEFT JOIN users ON users.id=orders.idUser ORDER BY createdAt DESC LIMIT 6";
            
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while ($order = $result->fetch_assoc()) {
                    $date = date_create($order["createdAt"]);
                    $idOrder = $order["id"];
        
                    $sqlKeranjang = "
                      SELECT keranjang.amount * produk.harga as amount,
                      produk.nama as namaProduk
                      FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk
                      WHERE keranjang.idOrder=$idOrder
                    ";
                    $resultKeranjang = $conn->query($sqlKeranjang);
                    
                    $daftarProduk = "";
                    $amount = 0;
                    if ($resultKeranjang->num_rows > 0) {
                      while ($keranjang = $resultKeranjang->fetch_assoc()) {
                        $namaProduk = $keranjang["namaProduk"];
                        $daftarProduk = "$daftarProduk, $namaProduk";
                        $amount += $keranjang["amount"];
                      }
                      $daftarProduk = substr($daftarProduk, 2);
                    }

                    ?>
                    
                    <tr class="order <?= $idOrder ?>">
                        <td><input type="checkbox" name="order" value="12345"></td>
                        <td><?= $daftarProduk ?></td>
                        <td>#<?= $order["id"] ?></td>
                        <td><?= date_format($date, "M j\\t\h, Y") ?></td>
                        <td><?= $order["nama"] ?></td>
                        <td><?= $order["status"] ?></td>
                        <td>RP <?= number_format($amount) ?></td>
                    </tr>
                    
                    <?php
                }
            }
            
            ?>
        </tbody>
    </table>
</div>
    </div>

    <script>setSidebar("nav-dashboard")</script>
    <script src="./js/orders.js"></script>
</body>
</html>