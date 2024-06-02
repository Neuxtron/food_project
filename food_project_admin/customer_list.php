<?php

include "./helper/auth.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers List</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/customer_list.css">
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>
<body>
    <?php include 'sidebar.php'; ?>
    <div class="main-content">
        <div class="header">
            <h1>Customers List</h1>
            <p>Home > Customers List</p>
        </div>
    <div class="recent-orders-container">
    <h2>Recent Orders</h2>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Address</th>
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
                
            $sql = "SELECT * from users LIMIT $rowsPerPage OFFSET $offest";
            
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                $nomor = 1;
                while ($row = $result->fetch_assoc()) {
                    ?>
                    
                    <tr>
                        <td><?= $nomor++ ?></td>
                        <td><?= $row["nama"] ?></td>
                        <td><?= $row["hp"] ?></td>
                        <td><?= $row["alamat"] ?></td>
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
            
            $sql = "SELECT CEILING(COUNT(*) / $rowsPerPage) as pages FROM users";
            $pages = $conn->query($sql)->fetch_assoc()["pages"];
            if ($page > 1) {
                ?>
                    <a href="./customer_list.php?page=<?= $page - 1 ?>" class="btn-outlined">< PREV</a>
                <?php
            }
            for ($i=1; $i <= $pages; $i++) { 
                ?>
                    <a
                        href="./customer_list.php?page=<?= $i ?>"
                        class="btn-outlined <?= $i == $page ? "active" : "" ?>"
                    ><?= $i ?></a>
                <?php
            }
            if ($page < $pages) {
                ?>
                    <a href="./customer_list.php?page=<?= $page + 1 ?>" class="btn-outlined">NEXT ></a>
                <?php
            }
            
            ?>
        </div>
    </div>
    
    <script>setSidebar("nav-customers")</script>
</body>
</html>
