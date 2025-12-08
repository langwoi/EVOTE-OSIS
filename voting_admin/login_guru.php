<?php
session_start();
include "koneksi.php";

// Jika sudah login guru → langsung ke index
if (isset($_SESSION['guru_id'])) {
    header("Location: index_public.php");
    exit;
}

// Proses login / register guru
if (isset($_POST['login'])) {

    $username = mysqli_real_escape_string($koneksi, trim($_POST['username']));
    $mapel    = mysqli_real_escape_string($koneksi, trim($_POST['mapel']));

    // Cek apakah sudah ada
    $cek = mysqli_query($koneksi, "SELECT * FROM guru_admin WHERE username='$username' AND mapel='$mapel'");
    if (!$cek) die("Query Error: " . mysqli_error($koneksi));

    if (mysqli_num_rows($cek) > 0) {
        // Kalau sudah ada → login
        $_SESSION['guru_id'] = $username;
        header("Location: index_public.php");
        exit;
    } else {
        // Kalau belum ada → register otomatis kocak
        $insert = mysqli_query($koneksi, "INSERT INTO guru_admin (username, mapel, has_voted) VALUES ('$username', '$mapel', 0)");
        if (!$insert) die("Gagal register: " . mysqli_error($koneksi));

        $_SESSION['guru_id'] = $username;
        echo "<script>alert('Akun baru dibuat kocak! Selamat datang, $username');</script>";
        header("Location: index_public.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Register Guru</title>
    <link rel="stylesheet" href="style/login_vote.css">
</head>
<body>

<div class="login-box">
    <form method="POST" class="form_container">

        <div class="title_container">
            <p class="title">LOGIN / REGISTER GURU / STAFF</p>
            <span class="subtitle">Isi username & mapel, nanti otomatis dibuat akun kalau belum ada 😎</span>
        </div>

        <div class="input_container">
            <label class="input_label">Username</label>
            <input placeholder="Masukkan username" name="username" type="text" class="input_field" required>
        </div>

        <div class="input_container">
            <label class="input_label">Mata Pelajaran</label>
            <input placeholder="Masukkan mata pelajaran" name="mapel" type="text" class="input_field" required>
        </div>

        <button type="submit" class="sign-in_btn" name="login">Login / Register</button>

        <div class="separator">
            <hr class="line"><span>Or</span><hr class="line">
        </div>

        <button type="button" class="sign-in_ggl" onclick="window.location.href='login_vote.php'">
            Kembali ke Login Siswa
        </button>
    </form>
</div>

</body>
</html>
