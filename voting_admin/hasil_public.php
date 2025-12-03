<?php
session_start();
include "koneksi.php";

if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Cegah vote lebih dari 1 kali
if (isset($_SESSION['sudah_vote']) && $_SESSION['sudah_vote'] === true) {
    header("Location: sudah_vote.php");
    exit;
}

// Pastikan parameter id ada
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("ID kandidat tidak valid");
}

$id = intval($_GET['id']);

// Cek apakah kandidat ada
$cek = mysqli_query($koneksi, "SELECT id FROM candidates WHERE id = $id");
if (mysqli_num_rows($cek) == 0) {
    die("Kandidat tidak ditemukan");
}

// Tambahkan suara
$update = mysqli_query($koneksi, "UPDATE candidates SET votes = votes + 1 WHERE id = $id");

if ($update) {
    $_SESSION['sudah_vote'] = true;
    header("Location: sukses.php");
} else {
    die("Gagal update suara: " . mysqli_error($koneksi));
}
?>
