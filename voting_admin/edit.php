<?php
session_start();
if (empty($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}

include "koneksi.php";

$id = $_GET['id'];
$data = mysqli_fetch_assoc(
    mysqli_query($koneksi, "SELECT * FROM candidates WHERE id='$id'")
);

if (isset($_POST['update'])) {

    $nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $visi = mysqli_real_escape_string($koneksi, $_POST['visi']);
    $misi = mysqli_real_escape_string($koneksi, $_POST['misi']);

    if (!empty($_FILES['foto']['name'])) {
        $foto = time() . "_" . $_FILES['foto']['name'];
        move_uploaded_file($_FILES['foto']['tmp_name'], "FOTO/".$foto);

        mysqli_query($koneksi,
            "UPDATE candidates SET
             name='$nama', photo='$foto', visi='$visi', misi='$misi'
             WHERE id='$id'"
        );
    } else {
        mysqli_query($koneksi,
            "UPDATE candidates SET
             name='$nama', visi='$visi', misi='$misi'
             WHERE id='$id'"
        );
    }

    header("Location: dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Kandidat</title>
    <link rel="stylesheet" href="style/edit.css">
</head>
<body>

<div class="container">
    <h2>Edit Kandidat</h2>

    <form method="POST" enctype="multipart/form-data">

        <label>Nama</label>
        <input type="text" name="nama" value="<?= htmlspecialchars($data['name']) ?>" required>

        <label>Foto (opsional)</label>
        <input type="file" name="foto">

        <label>Visi</label>
        <textarea name="visi" rows="4" required><?= htmlspecialchars($data['visi']) ?></textarea>

        <label>Misi</label>
        <textarea name="misi" rows="6" required><?= htmlspecialchars($data['misi']) ?></textarea>

        <button name="update">Update</button>
    </form>
</div>

</body>
</html>
