<?php
session_start();
if (!isset($_SESSION['login_user'])) {
  header('Location: index.php');
  exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h2>Selamat datang, <?= $_SESSION['login_user'] ?>!</h2>
    <a href="logout.php" class="btn btn-danger">Logout</a>
  </div>
</body>
</html>
