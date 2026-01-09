<?php
session_start();
if (empty($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}

include "koneksi.php";

if (isset($_POST['simpan'])) {

    $nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $visi = mysqli_real_escape_string($koneksi, $_POST['visi']);
    $misi = mysqli_real_escape_string($koneksi, $_POST['misi']);

    $foto = $_FILES['foto']['name'];
    $tmp  = $_FILES['foto']['tmp_name'];

    $fotoBaru = time() . "_" . $foto;
    $folder   = "FOTO/" . $fotoBaru;

    if (move_uploaded_file($tmp, $folder)) {
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
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Kandidat</title>
    <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>

<?php include "sidebar.php"; ?>

<div class="container">
    <h2>Tambah Kandidat OSIS</h2>

    <form method="POST" enctype="multipart/form-data" class="form-card">

        <label>Nama Kandidat</label>
        <input type="text" name="nama" required>

        <label>Foto Kandidat</label>
        <input type="file" name="foto" accept="image/*" required>

        <label>Visi</label>
        <textarea name="visi" rows="4" required
            placeholder="ENTER = baris baru"></textarea>

        <label>Misi</label>
        <textarea name="misi" rows="6" required
            placeholder="ENTER = baris baru"></textarea>

        <button type="submit" name="simpan">Simpan</button>
    </form>

</div>

</body>
</html>
