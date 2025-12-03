<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");

include "koneksi.php";

// --- Ambil data calon berdasarkan ID ---
$id = $_GET['id'];
$data = mysqli_query($koneksi, "SELECT * FROM candidates WHERE id='$id'");
$calon = mysqli_fetch_assoc($data);

// Jika tombol submit ditekan
if (isset($_POST['update'])) {

    $nama = $_POST['nama'];
    $fotoLama = $calon['photo'];

    // Cek apakah upload foto baru
    if ($_FILES['foto']['name'] != "") {

        $namaFile = $_FILES['foto']['name'];
        $tmp = $_FILES['foto']['tmp_name'];
        $ext = pathinfo($namaFile, PATHINFO_EXTENSION);
        $namaBaru = "foto_" . time() . "." . $ext;

        // Upload
        move_uploaded_file($tmp, "FOTO/" . $namaBaru);

        // Hapus foto lama jika ada
        if (file_exists("FOTO/" . $fotoLama) && $fotoLama != "") {
            unlink("FOTO/" . $fotoLama);
        }

        $fotoFix = $namaBaru;
    } else {
        $fotoFix = $fotoLama;
    }

    // Update database
    mysqli_query($koneksi, 
        "UPDATE candidates SET name='$nama', photo='$fotoFix' WHERE id='$id'"
    );

    header("Location: dashboard.php?msg=updated");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Edit Calon</title>
    <link rel="stylesheet" href="../style/edit.css">
</head>
<body>

<div class="form-container">
    <h2>Edit Calon</h2>

    <form method="POST" enctype="multipart/form-data">

        <label>Nama Calon</label>
        <input type="text" name="nama" value="<?= $calon['name']; ?>" required>

        <label>Foto Saat Ini</label><br>
        <img src="uploads/<?= $calon['photo']; ?>" width="140" style="border-radius:8px; margin-bottom:12px;"><br>

        <label>Upload Foto Baru (opsional)</label>
        <input type="file" name="foto" accept="image/*">

        <button type="submit" name="update">Update Data</button>
        <a href="dashboard.php" class="back-btn">Kembali</a>

    </form>
</div>

</body>
</html>
