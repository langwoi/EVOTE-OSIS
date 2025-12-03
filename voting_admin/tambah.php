<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");
include "koneksi.php";

if (isset($_POST['simpan'])) {

    $nama = $_POST['nama'];
    $visi = $_POST['visi'];
    $misi = $_POST['misi'];

    // upload foto
    $foto = $_FILES['foto']['name'];
    $tmp  = $_FILES['foto']['tmp_name'];

    $fotoBaru = time() . "_" . $foto;
    $folder   = "FOTO/" . $fotoBaru;

    if (move_uploaded_file($tmp, $folder)) {

        // SIMPAN KE DATABASE
        mysqli_query($koneksi,
            "INSERT INTO candidates (name, photo, visi, misi)
             VALUES ('$nama', '$fotoBaru', '$visi', '$misi')"
        );
    }

    header("Location: dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style/tambah.css">
    <title>Tambah Calon</title>
</head>
<body>

<div class="container">
    <h2>Tambah Calon OSIS</h2>

    <form method="POST" enctype="multipart/form-data">

        <label>Nama Kandidat</label>
        <input type="text" name="nama" required>

        <label>Foto Kandidat</label>
        <input type="file" name="foto" accept="image/*" required>

        <label>Visi</label>
        <textarea name="visi" required></textarea>

        <label>Misi</label>
        <textarea name="misi" required></textarea>

        <button name="simpan">Simpan</button>
    </form>

    <a href="dashboard.php" class="back">Kembali</a>
</div>

</body>
</html>
