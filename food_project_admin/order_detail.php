<?php

include "./helper/auth.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php include 'sidebar.php'; ?>
    <div class="main-content">
        <div class="header">
            <h1>Order Details</h1>
            <p>Home > Order List > Order Details</p>
        </div>
        <div class="order-container">
            <h2>Order ID: #123131</h2>
            <div class="date">
                <img src="assets/ic_calendar.svg" alt="Calendar Icon" class="calendar-icon">
                <span>25 Mei 2024 - 30 Mei 2024</span>
            </div>
            <div class="cards-order-details">
                <div class="card-order-details">
                    <div class="card-content-order-details">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon-order-details">
                        <div class="info">
                            <p class="customer">Customer</p>
                            <p class="name">Nama: Heru Aryasuta</p>
                            <p class="phone">Nomor Hp: 01231312</p>
                        </div>
                    </div>
                </div>
                <!-- card 2 -->
                <div class="card-order-details">
                    <div class="card-content-order-details">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon-order-details">
                        <div class="info">
                            <p class="customer">Customer</p>
                            <p class="name">Nama: Heru Aryasuta</p>
                            <p class="phone">Nomor Hp: 01231312</p>
                        </div>
                    </div>
                </div>
                <!-- card 3 -->
                <div class="card-order-details">
                    <div class="card-content-order-details">
                        <img src="assets/ic_bag.svg" alt="Bag Icon" class="card-icon-order-details">
                        <div class="info">
                            <p class="customer">Customer</p>
                            <p class="name">Nama: Heru Aryasuta</p>
                            <p class="phone">Nomor Hp: 01231312</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-container-order-details">
            <h2>Products</h2>
            <table class="order-table-order-details">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Order ID</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product A</td>
                        <td>#12345</td>
                        <td>2</td>
                        <td>$50.00</td>
                    </tr>
                    <tr>
                        <td>Product B</td>
                        <td>#12346</td>
                        <td>1</td>
                        <td>$30.00</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
