<?php
session_start();
include "koneksi.php";

// =====================
// Cek Login
// =====================
if (!isset($_SESSION['voter_id']) && !isset($_SESSION['guru_id'])) {
    die("Akses ditolak. Silakan login terlebih dahulu.");
}

// Ambil data dari URL
$id_candidate = $_GET['id'] ?? '';
$role = $_GET['role'] ?? '';

if ($id_candidate == '' || $role == '') {
    die("Data tidak valid");
}

// =====================
// Proses Voting
// =====================
if ($role == "siswa" && isset($_SESSION['voter_id'])) {

    $user_id = $_SESSION['voter_id'];

    // Cek status voting siswa
    $cek = mysqli_query($koneksi, "SELECT has_voted FROM voters WHERE id='$user_id' LIMIT 1");
    if (!$cek) die("Query Error: " . mysqli_error($koneksi));
    $user = mysqli_fetch_assoc($cek);

    if ($user['has_voted'] == 1) {
        die("❌ Anda sudah melakukan voting!");
    }

    // Tambah vote kandidat
    $update_vote = mysqli_query($koneksi, "UPDATE candidates SET vote = vote + 1 WHERE id='$id_candidate'");
    if (!$update_vote) die("Gagal update vote: " . mysqli_error($koneksi));

    // Tandai siswa sudah voting
    $update_user = mysqli_query($koneksi, "UPDATE voters SET has_voted = 1 WHERE id='$user_id'");
    if (!$update_user) die("Gagal update status voting: " . mysqli_error($koneksi));

} else if ($role == "guru" && isset($_SESSION['guru_id'])) {

    $username = $_SESSION['guru_id'];

    // Cek status voting guru
    $cek = mysqli_query($koneksi, "SELECT has_voted FROM guru_admin WHERE username='$username' LIMIT 1");
    if (!$cek) die("Query Error: " . mysqli_error($koneksi));
    $user = mysqli_fetch_assoc($cek);

    if ($user['has_voted'] == 1) {
        die("❌ Anda sudah melakukan voting!");
    }

    // Tambah vote kandidat
    $update_vote = mysqli_query($koneksi, "UPDATE candidates SET vote = vote + 1 WHERE id='$id_candidate'");
    if (!$update_vote) die("Gagal update vote: " . mysqli_error($koneksi));

    // Tandai guru sudah voting
    $update_user = mysqli_query($koneksi, "UPDATE guru_admin SET has_voted = 1 WHERE username='$username'");
    if (!$update_user) die("Gagal update status voting: " . mysqli_error($koneksi));

} else {
    die("Akses tidak sah.");
}

// Redirect setelah voting sukses
header("Location: sukses.php");
exit;
?>
