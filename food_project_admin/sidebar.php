<div class="sidebar">
    <div class="logo-container">
        <img src="assets/logo.png" alt="Logo" class="logo">
    </div>
    <nav>
        <ul>
            <li>
                <a href="./" id="nav-dashboard">
                    <?php include "./assets/ic_dashboard.svg" ?>
                    DASHBOARD
                </a>
            </li>
            <li>
                <a href="all_products.php" id="nav-products">
                    <?php include "./assets/ic_products.svg" ?>
                    ALL PRODUCTS
                </a>
            </li>
            <li>
                <a href="order_list.php" class="fill" id="nav-orders">
                    <?php include "./assets/ic_orders.svg" ?>
                    ORDER LIST
                </a>
            </li>
        </ul>
    </nav>
</div>

<script>
    function setSidebar(id) {
        const active = document.getElementById(id)
        active.classList.add("active")
    }
</script>

<?php include 'header.php'; ?>
