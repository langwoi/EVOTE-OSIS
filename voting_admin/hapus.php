<?php
session_start();
if (empty($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}

include "koneksi.php";

if (!isset($_GET['id'])) {
    header("Location: dashboard.php");
    exit;
}

$id = intval($_GET['id']);

mysqli_query($koneksi, "DELETE FROM candidates WHERE id=$id");

header("Location: dashboard.php");
exit;
?>
