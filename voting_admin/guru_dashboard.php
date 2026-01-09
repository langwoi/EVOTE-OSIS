<?php
session_start();
include "koneksi.php";

// Proteksi halaman
if (!isset($_SESSION['guru_id'])) {
    header("Location: login_guru.php");
    exit;
}

// Ambil status voting guru
$id = $_SESSION['guru_id'];
$q = mysqli_query($koneksi, "SELECT has_voted FROM guru_admin WHERE id='$id'");
$data = mysqli_fetch_assoc($q);

// Jika sudah vote → arahkan

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Guru</title>
    <link rel="stylesheet" href="style/index_public.css"> <!-- pakai style yang sama -->
     <link rel="icon" type="image/png" id="favicon" href="FOTO/Logo OSIS SMK-min.png">
</head>

<body>

<div id="pageContent">

<header class="hero">
    <div class="overlay"></div>
    <div class="hero-content">
        <img src="FOTO/logo_smksg.png" class="logo-header" alt="Logo Sekolah">
        <div class="hero-text">
            <h1>DASHBOARD GURU & STAFF SMKSG</h1>
            <p>Selamat Datang, <?= $_SESSION['guru']; ?></p>
        </div>
        <img src="FOTO/Logo OSIS SMK.png" class="logo-header" alt="Logo Sekolah">
    </div>
</header>

<section class="container">

    <div class="welcome-box">
        <h3>Hai, <?= $_SESSION['guru']; ?>! 👋</h3>
        <p>Anda masuk sebagai <b>Guru / Staff</b>.</p>
    </div>

    <h2>DAFTAR KANDIDAT</h2>

    <div class="card-wrapper">
        <?php
        $data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY name ASC");
        while ($row = mysqli_fetch_assoc($data)) {
        ?>
        <div class="card">
            <img src="FOTO/<?= $row['photo']; ?>" alt="<?= $row['name']; ?>" class="candidate-photo">
            <h3><?= $row['name']; ?></h3>

            <div class="visi-misi">
                <p><b>Visi:</b> <?= $row['visi']; ?></p>
                <p><b>Misi:</b> <?= nl2br($row['misi']); ?></p>
            </div>

           <?php if ($status == 0) { ?>
            <a class="btn vote" href="guru_vote.php?id=<?=  $row['id']; ?>">Vote Kandidat</a>
          <?php } else { ?>
            <span class="btn-disabled">Anda Sudah Voting</span>
         <?php } ?>
        </div>
        <?php } ?>

    </div>

    <div class="link-group">
        <a href="maintenance.php" class="btn view">Lihat Hasil Voting</a>
        <a href="logout_guru.php" class="btn admin" style="background:red;">Logout</a>
    </div>

</section>

<footer>
    <div class="footer-logos">
        <img src="FOTO/logo_smksg.png" width="55" alt="logo smk">
        <img src="FOTO/Logo OSIS SMK.png" width="55" alt="logo osis">
    </div>
    <h3>OSIS SMK SEMEN GRESIK — Sistem E-Voting</h3>
    <p>JLN. ARIEF RAHMAN HAKIM NO 90. GRESIK</p>
    <p>Website by Galang Cipta R — Bantuan ChatGPT</p>
    <p class="copy">&copy; 2025 All Rights Reserved.</p>
</footer>

</div>

</body>
</html>
