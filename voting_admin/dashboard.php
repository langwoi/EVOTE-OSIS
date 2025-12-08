<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");
include "koneksi.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>

<div class="dashboard-container">
    <h2>Dashboard Admin</h2>

    <!-- Menu Navigasi -->
    <div class="nav-menu">
        <a href="tambah.php">Tambah Calon</a>
        <a href="maintenance.php">Voting</a>
        <a href="hasil.php">Hasil Voting</a>
        <a href="logout.php">Logout</a>
    </div>

    <!-- Tabel Kandidat -->
    <table class="candidate-table">
        <thead>
            <tr>
                <th>Nama Calon</th>
                <th>Suara</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY name ASC");
        while ($row = mysqli_fetch_assoc($data)) { ?>
            <tr>
                <td><?= htmlspecialchars($row['name']); ?></td>
                <td><?= htmlspecialchars($row['vote']); ?></td>
                <td class="action-cell">
                    <a href="edit.php?id=<?= $row['id']; ?>" class="btn edit-btn" title="Edit">
                        ✏️ Edit
                    </a>
                    <a href="hapus.php?id=<?= $row['id']; ?>" class="btn delete-btn" title="Hapus"
                       onclick="return confirm('Yakin ingin menghapus calon ini?')">
                        🗑️ Hapus
                    </a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>

</body>
</html>
