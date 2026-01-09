<?php
session_start();
include "koneksi.php";

// Jika sudah login siswa → langsung ke index
if (isset($_SESSION['voter_id'])) {
    header("Location: index_public.php");
    exit;
}

// Proses login siswa
if (isset($_POST['login'])) {

    // Ambil input dan escape untuk keamanan
    $name  = mysqli_real_escape_string($koneksi, trim($_POST['name']));
    $class = mysqli_real_escape_string($koneksi, trim($_POST['class']));
    $absen = mysqli_real_escape_string($koneksi, trim($_POST['absen']));

    // =========================
    // CEK NOMOR ABSEN DI KELAS
    // =========================
    $cekAbsen = mysqli_query($koneksi,
        "SELECT * FROM voters WHERE class='$class' AND absen='$absen'"
    );
    if (!$cekAbsen) {
        die("Query Error: " . mysqli_error($koneksi));
    }

    $absenData = mysqli_fetch_assoc($cekAbsen);

    if ($absenData) {
        // Sudah voting → tolak
        if ($absenData['has_voted'] == 1) {
            echo "<script>
                    alert('Nomor absen ini sudah digunakan untuk voting!');
                    window.location='login_vote.php';
                  </script>";
            exit;
        }

        // Belum voting → login
        $_SESSION['voter_id']    = $absenData['id'];
        $_SESSION['voter_name']  = $absenData['name'];
        $_SESSION['voter_class'] = $absenData['class'];
        $_SESSION['voter_absen'] = $absenData['absen'];

        header("Location: index_public.php");
        exit;
    } else {
        // Nomor absen belum terdaftar → buat akun baru
        $insert = mysqli_query($koneksi,
            "INSERT INTO voters (name, class, absen, has_voted) VALUES ('$name', '$class', '$absen', 0)"
        );
        if (!$insert) {
            die("Gagal membuat akun baru: " . mysqli_error($koneksi));
        }

        $id = mysqli_insert_id($koneksi);

        $_SESSION['voter_id']    = $id;
        $_SESSION['voter_name']  = $name;
        $_SESSION['voter_class'] = $class;
        $_SESSION['voter_absen'] = $absen;

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
    <title>Login Pemilih</title>
    <link rel="stylesheet" href="style/login_vote.css">
    <link rel="icon" type="image/png" id="favicon" href="FOTO/Logo OSIS SMK-min.png">
</head>
<body>
    
<div class="login-box">
    <div class="head-foto">
        <img src="FOTO/Logo OSIS SMK-min.png" alt="" class="osis">
        <img src="FOTO/logo_smksg-min.png" alt="">
    </div>

    <form method="POST" class="form_container">

        <div class="title_container">
            <p class="title">REGISTER SISWA SMK SEMEN GRESIK</p>
            <span class="subtitle">Silakan masukkan data Anda</span>
        </div>

        <!-- Nama -->
        <div class="input_container">
            <label class="input_label">Nama</label>
            <input placeholder="Masukkan nama lengkap" name="name" type="text" class="input_field" required>
        </div>

        <!-- Kelas -->
        <div class="input_container">
            <label class="input_label">Kelas</label>
            <select name="class" required class="input_field">
               <option value="">-- Pilih Kelas --</option>

        <optgroup label="Kelas X">
            <option value="X RPL 1">X RPL 1</option>
            <option value="X RPL 2">X RPL 2</option>
            <option value="X TPM 1">X TPM 1</option>
            <option value="X TPM 2">X TPM 2</option>
            <option value="X TITL 1">X TITL 1</option>
            <option value="X TITL 2">X TITL 2</option>
            <option value="X TOI">X TOI</option>
            <option value="X PH">X PH</option>
            <option value="X TKRO">X TKRO</option>
            <option value="X TP">X TP</option>
            <option value="X TKI">X TKI</option>
        </optgroup>

        <optgroup label="Kelas XI">
            <option value="XI RPL 1">XI RPL 1</option>
            <option value="XI RPL 2">XI RPL 2</option>
            <option value="XI TPM 1">XI TPM 1</option>
            <option value="XI TPM 2">XI TPM 2</option>
            <option value="XI TITL 1">XI TITL 1</option>
            <option value="XI TITL 2">XI TITL 2</option>
            <option value="XI TOI">XI TOI</option>
            <option value="XI PH">XI PH</option>
            <option value="XI TKRO">XI TKRO</option>
            <option value="XI TP">XI TP</option>
            <option value="XI TKI">XI TKI</option>
        </optgroup>

        <optgroup label="Kelas XII">
            <option value="XII RPL 1">XII RPL 1</option>
            <option value="XII RPL 2">XII RPL 2</option>
            <option value="XII TPM">XII TPM</option>
            <option value="XII TITL 1">XII TITL 1</option>
            <option value="XII TITL 2">XII TITL 2</option>
            <option value="XII TOI">XII TOI</option>
            <option value="XII PH">XII PH</option>
            <option value="XII TKRO">XII TKRO</option>
            <option value="XII TP">XII TP</option>
            <option value="XII TKI">XII TKI</option>
        </optgroup>
            </select>
        </div>

        <!-- Nomor Absen -->
        <div class="input_container">
            <label class="input_label">Absen</label>
            <input placeholder="Nomor absen" name="absen" type="number" class="input_field" required>
        </div>

        <button type="submit" class="sign-in_btn" name="login">Register</button>

        <div class="separator">
            <hr class="line"><span>Or</span><hr class="line">
        </div>

        <button type="button" class="sign-in_ggl" onclick="window.location.href='login_guru.php'">
            Guru / Staff? Klik disini
        </button>
    </form>
</div>

</body>
</html>
