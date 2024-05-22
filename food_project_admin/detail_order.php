<?php

include "./helper/connection.php";
include "./helper/auth.php";
$dbh = new Dbh();
$conn = $dbh->connect();

if (!isset($_GET["id"])) header("Location: ./order_list.php");
$idOrder = $_GET["id"];

$sql = "
  SELECT users.nama, users.hp, users.alamat,
  orders.status, orders.createdAt as tanggal, orders.ongkir,
  metode_bayar.nama as metodeBayar
  FROM orders LEFT JOIN users ON users.id=orders.idUser 
  LEFT JOIN metode_bayar ON metode_bayar.id=orders.idMetodeBayar
  WHERE orders.id=$idOrder
";
$order = $conn->query($sql)->fetch_assoc();
$tanggal = $date = date_create($order["tanggal"]);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Details</title>
  <link rel="stylesheet" href="./css/style.css">
  <link rel="stylesheet" href="./css/global.css">
  <link rel="stylesheet" href="./css/detail_order.css">
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
  
  <?php include "./sidebar.php" ?>
  <div class="main-content">
    <div class="header">
      <h1>Order Details</h1>
      <p>Home > Order List > Order Details</p>
    </div>

    <div class="container">
      <div class="flex">
        <h1>Orders ID: #<?= $idOrder ?></h1>
          <div id="order-status" class="btn-filled"><?= $order["status"] ?></div>
      </div>
      <div id="header" class="flex items-center">
        <?php include "./assets/ic_calendar.svg" ?>
        <p><?= date_format($tanggal, "j M Y") ?></p>

        <form action="./actions/ubah_status.php" method="post" class="flex">
          <input type="hidden" name="id" value="<?= $idOrder ?>">
          <div class="filled flex">
            <select name="status" id="status" class="filled" required>
              <option value="">Change Status</option>
              <option value="Pending">Pending</option>
              <option value="Dikirim">Dikirim</option>
              <option value="Selesai">Selesai</option>
            </select>
            <?php include "./assets/ic_dropdown.svg" ?>
          </div>
          <button class="filled">Save</button>
        </form>
      </div>

      <div class="cards">
        <div class="card">
          <div class="icon"><?php include "./assets/ic_customer.svg" ?></div>
          <div>
            <h1>Customer</h1>
            <p>Full Name: <?= $order["nama"] ?></p>
            <p>Phone: <?= $order["hp"] ?></p>
          </div>
        </div>
        <div class="card">
          <div class="icon"><?php include "./assets/ic_bag.svg" ?></div>
          <div>
            <h1>Order Info</h1>
            <p>Payment Method: <?= $order["metodeBayar"] ?></p>
            <p>Status: <?= $order["status"] ?></p>
          </div>
        </div>
        <div class="card">
          <div class="icon"><?php include "./assets/ic_bag.svg" ?></div>
          <div>
            <h1>Delvier To</h1>
            <p>Address: <?= $order["alamat"] ?></p>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <h1>Products</h1>
      <table>
        <thead>
          <tr>
            <th>Product Name</th>
            <th>Order ID</th>
            <th>Quantity</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <?php
          
          $sql = "
            SELECT *,
            produk.id as idProduk,
            keranjang.amount * produk.harga as total
            FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk
            WHERE keranjang.idOrder = $idOrder
          ";
          $result = $conn->query($sql);

          $subtotal = 0;
          while ($row = $result->fetch_assoc()) {
            $idProduk = $row["idProduk"];
            $subtotal += $row["total"];
            $sql = "SELECT fileName from gambar_produk WHERE idProduk=$idProduk";
            $gambar = $conn->query($sql)->fetch_assoc()["fileName"];
            ?>
            
            <tr>
              <td>
                <div class="flex items-center">
                  <input type="checkbox">
                  <img src="./images/<?= $gambar ?>" alt="">
                  <?= $row["nama"] ?>
                </div>
              </td>
              <td>#<?= $idOrder ?></td>
              <td><?= $row["amount"] ?></td>
              <td>Rp <?= number_format($row["total"]) ?></td>
            </tr>
            
            <?php
          }
          
          ?>
        </tbody>
      </table>

      <div id="total-section">
        <div class="flex">
          <p>Subtotal</p>
          <p>Rp <?= number_format($subtotal) ?></p>
        </div>
        <div class="flex">
          <p>Ongkir</p>
          <p>Rp <?= number_format($order["ongkir"]) ?></p>
        </div>
        <div class="flex" id="grand-total">
          <p>Total</p>
          <p>Rp <?= number_format($subtotal + $order["ongkir"]) ?></p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>