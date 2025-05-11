<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Cek Umur</title>
</head>
<body>

  <h2>Form Cek Umur</h2>

  <form method="POST" action="">
    Nama: <input type="text" name="nama" required><br><br>
    Umur: <input type="number" name="umur" required><br><br>
    <input type="submit" value="Cek">
  </form>

  <?php
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $nama = $_POST["nama"];
      $umur = $_POST["umur"];

      if ($umur >= 18) {
          echo "<p><strong>$nama</strong>, Anda termasuk <b>DEWASA</b>.</p>";
      } else {
          echo "<p><strong>$nama</strong>, Anda <b>BELUM dewasa</b>.</p>";
      }
  }
  ?>

</body>
</html>
