<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");
include "../koneksi.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Voting — Admin</title>
<link rel="stylesheet" href="../style/vote.css">
</head>
<body>
<div class="container">
<h2>🏆 Panel Voting — Admin</h2>
<hr><br>

<?php
$data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY id ASC");
while ($row = mysqli_fetch_assoc($data)) {
    echo "<div class='candidate'>
            <div class='name'>{$row['name']}</div>
            <a class='btn-vote' href='vote_proses.php?id={$row['id']}'>Vote</a>
          </div>";
}
?>
<br>
<a class="back" href="index_public.php">⟵ Kembali</a>

</div>
</body>
</html>
