<link rel="stylesheet" href="./css/header.css">

<header>
  <button class="outlined active" id="logout-btn">
    <span>ADMIN</span>
    <?php include "./assets/ic_dropdown.svg" ?>
  </button>
</header>

<div id="logout-section">
  <div id="logout-overlay"></div>
  <div id="logout-container">
    <h1>ADMIN</h1>
    <a href="./actions/logout.php">
      LOG OUT
      <?php include "./assets/ic_logout.svg" ?>
    </a>
  </div>
</div>

<script src="./js/header.js"></script>