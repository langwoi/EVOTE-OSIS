<?php
session_start();
if(empty($_SESSION['admin'])) header("Location: login.php");
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
<button class="open-circle" id="openSidebar">☰</button>


<?php include "sidebar.php"; ?>

<main class="content" id="mainContent">
    <h2>Dashboard Admin</h2><br>

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
        $q=mysqli_query($koneksi,"SELECT * FROM candidates");
        while($r=mysqli_fetch_assoc($q)){ ?>
            <tr>
                <td><?= htmlspecialchars($r['name']) ?></td>
                <td><?= $r['vote'] ?></td>
                <td class="action-cell">
                    <a class="btn edit-btn" href="edit.php?id=<?= $r['id'] ?>">Edit</a>
                    <a class="btn delete-btn" href="hapus.php?id=<?= $r['id'] ?>" onclick="return confirm('Hapus?')">Hapus</a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</main>

<script src="sidebar.js"></script>

</body>
</html>
