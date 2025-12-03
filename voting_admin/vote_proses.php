<?php
session_start();
include "koneksi.php";

$voter_id = $_SESSION['voter_id'];
$id_kandidat = $_GET['id'];

// Cek apakah sudah voting
$cek = mysqli_query($koneksi, "SELECT has_voted FROM voters WHERE id='$voter_id'");
$cek = mysqli_fetch_assoc($cek);

if ($cek['has_voted'] == 1) {
    echo "<script>alert('Anda sudah memilih! Voting hanya boleh 1 kali.'); window.location='index_public.php';</script>";
    exit;
}

$role =  $_GET['role'];
if($role == "Siswa"){
     mysqli_query($koneksi, "UPDATE voters SET has_voted=1, voted_at=NOW() WHERE id='{$_SESSION['voter_id']}'");
}

else if ($role == "guru") {
     mysqli_query($koneksi, "UPDATE guru SET has_voted=1, voted_at=NOW() WHERE id='{$_SESSION['guru_id']}'");
}
// Update voting
mysqli_query($koneksi, "UPDATE candidates SET votes = votes + 1 WHERE id='$id_kandidat'");
mysqli_query($koneksi, "UPDATE voters SET has_voted = 1 WHERE id='$voter_id'");

// Arahkan ke halaman sukses
header("Location: sukses.php");
exit;
