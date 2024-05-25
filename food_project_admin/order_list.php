<?php

include "./helper/auth.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
    <?php include 'sidebar.php'; ?>
    <div class="main-content">
        <div class="header">
            <h1>Order List</h1>
            <p>Home > Order List</p>
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
                <th>Payment Method</th>
                <th>Customer Name</th>
                <th>Status</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <?php

            include "./helper/connection.php";
            $dbh = new Dbh();
            $conn = $dbh->connect();
            
            $page = $_GET["page"] ?? 1;
            $rowsPerPage = 8;
            $offest = $rowsPerPage * ($page - 1);
                
            $sql = "
                SELECT orders.*,
                users.nama, users.id as idUser,
                metode_bayar.nama as metodeBayar
                FROM orders LEFT JOIN users ON users.id=orders.idUser
                LEFT JOIN metode_bayar ON metode_bayar.id=orders.idMetodeBayar
                ORDER BY createdAt DESC
                LIMIT $rowsPerPage OFFSET $offest
            ";
            
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
                        <td><?= $order["metodeBayar"] ?></td>
                        <td><?= $order["nama"] ?></td>
                        <td><?= $order["status"] ?></td>
                        <td>RP <?= number_format($amount + $order["idUser"]) ?></td>
                    </tr>
                    
                    <?php
                }
            }
            
            ?>
        </tbody>
    </table>
        </div>
        <div class="pagination">
            <?php
            
            $sql = "SELECT CEILING(COUNT(*) / $rowsPerPage) as pages FROM orders";
            $pages = $conn->query($sql)->fetch_assoc()["pages"];
            if ($page > 1) {
                ?>
                    <a href="./order_list.php?page=<?= $page - 1 ?>" class="btn-outlined">< PREV</a>
                <?php
            }
            for ($i=1; $i <= $pages; $i++) { 
                ?>
                    <a
                        href="./order_list.php?page=<?= $i ?>"
                        class="btn-outlined <?= $i == $page ? "active" : "" ?>"
                    ><?= $i ?></a>
                <?php
            }
            if ($page < $pages) {
                ?>
                    <a href="./order_list.php?page=<?= $page + 1 ?>" class="btn-outlined">NEXT ></a>
                <?php
            }
            
            ?>
        </div>
    </div>
    
    <script>setSidebar("nav-orders")</script>
    <script src="./js/orders.js"></script>
</body>
</html>
