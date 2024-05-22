<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
  <link rel="stylesheet" href="./css/global.css">
  <link rel="stylesheet" href="./css/login.css">
</head>
<body>
  <div id="container" class="flex col">
    <h1>Sign Up</h1>
    <p id="error"></p>
    <form action="./actions/signup.php" method="post" class="flex col">
      <input type="text" name="firstName" id="firstName" class="auth" placeholder="First Name" required>
      <input type="text" name="lastName" id="lastName" class="auth" placeholder="Last Name" required>
      <input type="text" name="email" id="email" class="auth" placeholder="Email" required>
      <input type="password" name="password" id="password" class="auth" placeholder="Password" required>
      <button class="filled">Create Account</button>
      <div class="flex">
        <p>Already have an account? </p>
        <a href="./login.php">Login</a>
      </div>
    </form>
  </div>
  
  <script src="./js/login.js"></script>
</body>
</html>