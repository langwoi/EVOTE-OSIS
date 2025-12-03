<?php
session_start();
include "koneksi.php";

// Pastikan guru login
if (!isset($_SESSION['guru'])) {
    header("Location: login_guru.php");
    exit;
}

// Pastikan id kandidat ada
if (!isset($_GET['id'])) {
    die("ID kandidat tidak ditemukan");
}

$id = intval($_GET['id']); // aman dari injection

// Update suara
$query = "UPDATE candidates SET votes = votes + 1 WHERE id = $id";
$run = mysqli_query($koneksi, $query);

if (!$run) {
    die("Query gagal: " . mysqli_error($koneksi));
}

// Arahkan kembali
header("Location: guru_dashboard.php?success=1");
exit;
?>
