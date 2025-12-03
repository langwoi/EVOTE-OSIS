<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");
include "koneksi.php";
?>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>

<div class="dashboard-container">
    <h2>Dashboard Admin</h2>

    <div class="nav-menu">
        <a href="tambah.php">Tambah Calon</a>
        <a href="vote.php">Voting</a>
        <a href="hasil.php">Hasil Voting</a>
        <a href="logout.php">Logout</a>
    </div>

    <table class="table-candidates">
        <tr>
            <th>Nama Calon</th>
            <th>Suara</th>
            <th>Aksi</th>
        </tr>

        <?php
        $data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY name ASC");
        while ($row = mysqli_fetch_assoc($data)) { ?>
            <tr>
                <td><?= $row['name']; ?></td>
                <td><?= $row['votes']; ?></td>

                <td class="action-buttons">
                    <a class="edit-btn" 
                       href="edit.php?id=<?= $row['id']; ?>" 
                       title="Edit">
                        ✏️
                    </a>

                    <a class="delete-btn" 
                       href="hapus.php?id=<?= $row['id']; ?>" 
                       title="Hapus"
                       onclick="return confirm('Yakin ingin menghapus calon ini?')">
                        🗑️
                    </a>
                </td>
            </tr>
        <?php } ?>
    </table>
</div>

</body>
</html>
