<?php

session_start();
if (!isset($_SESSION["food-project"])) {
  header("Location: login.php");
}