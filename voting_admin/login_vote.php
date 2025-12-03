<?php
session_start();
include "koneksi.php";

// Jika sudah login sebelumnya tapi belum voting → masuk langsung
if (isset($_SESSION['voter_id'])) {
    header("Location: index_public.php");
    exit;
}

if (isset($_POST['login'])) {
    $name  = $_POST['name'];
    $class = $_POST['class'];
    $absen = $_POST['absen'];

    // ================================
    // CEK ABSEN DI KELAS YANG SAMA
    // ================================
    $cekAbsen = mysqli_query($koneksi,
        "SELECT * FROM voters WHERE class='$class' AND absen='$absen'"
    );
    $absenData = mysqli_fetch_assoc($cekAbsen);

    // Jika nomor absen sudah dipakai di kelas itu
    if ($absenData) {

        // Jika sudah voting → TOLAK login
        if ($absenData['has_voted'] == 1) {
            echo "<script>
                    alert('Nomor absen ini sudah digunakan untuk voting!');
                    window.location='login_vote.php';
                  </script>";
            exit;
        }

        // Jika BELUM voting → izinkan login pakai akun itu
        $_SESSION['voter_id']    = $absenData['id'];
        $_SESSION['voter_name']  = $absenData['name'];
        $_SESSION['voter_class'] = $absenData['class'];
        $_SESSION['voter_absen'] = $absenData['absen'];

        header("Location: index_public.php");
        exit;
    }

    // =========================================
    // Jika nomor absen belum pernah dipakai → buat akun baru
    // =========================================
    mysqli_query($koneksi,
        "INSERT INTO voters (name, class, absen) VALUES ('$name', '$class', '$absen')"
    );

    $id = mysqli_insert_id($koneksi);

    $_SESSION['voter_id']    = $id;
    $_SESSION['voter_name']  = $name;
    $_SESSION['voter_class'] = $class;
    $_SESSION['voter_absen'] = $absen;

    header("Location: index_public.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Pemilih</title>
    <link rel="stylesheet" href="style/login_vote.css">
</head>
<body>

<div class="login-box">
    <h2>Login Pemilih Kandidat Ketua Osis</h2>

   <form method="POST">

    <label>Nama Lengkap</label>
    <input type="text" name="name" required placeholder="Nama Lengkap">

    <label>Nomor Absen</label>
    <input type="number" name="absen" required placeholder="Nomor Absen" min="1" max="50">

    <label>Kelas</label>
    <select name="class" required style="width:100%; padding:10px; border-radius:8px;">
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
        </optgroup>

        <optgroup label="Kelas XII">
            <option value="XII RPL 1">XII RPL 1</option>
            <option value="XII RPL 2">XII RPL 2</option>
            <option value="XII TPM 1">XII TPM 1</option>
            <option value="XII TPM 2">XII TPM 2</option>
            <option value="XII TITL 1">XII TITL 1</option>
            <option value="XII TITL 2">XII TITL 2</option>
            <option value="XII TOI">XII TOI</option>
            <option value="XII PH">XII PH</option>
            <option value="XII TKRO">XII TKRO</option>
            <option value="XII TP">XII TP</option>
        </optgroup>
    </select>

    <button type="submit" name="login">Masuk Voting</button>

    <p class="staff-link">
    Apakah anda guru/staff lainnya? 
    <a href="login_guru.php">Klik di sini</a>
</p>

</form>

</div>

</body>
</html>
