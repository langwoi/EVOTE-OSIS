<?php
session_start();
include "koneksi.php";

if (!isset($_SESSION['voter_id']) && !isset($_SESSION['guru_id'])) {
    die("Akses ditolak");
}

$id_candidate = $_GET['id'] ?? '';
$role = $_GET['role'] ?? '';

if ($id_candidate == '' || $role == '') {
    die("Data tidak valid");
}

/* SISWA*/
if ($role == "siswa" && isset($_SESSION['voter_id'])) {

    $user_id = $_SESSION['voter_id'];

    $cek = mysqli_query($koneksi,
        "SELECT has_voted FROM voters WHERE id='$user_id'"
    );
    $user = mysqli_fetch_assoc($cek);

    if ($user['has_voted'] == 1) {
        die("Sudah voting");
    }

    // 🔥 NAIKKAN SUARA (BENAR)
    mysqli_query($koneksi,
        "UPDATE candidates SET vote = vote + 1 WHERE id='$id_candidate'"
    );

    // 🔥 SIMPAN PILIHAN
    mysqli_query($koneksi,
        "UPDATE voters 
         SET has_voted = 1, candidate_id = '$id_candidate' 
         WHERE id='$user_id'"
    );
}

/* =====================
   GURU
===================== */
elseif ($role == "guru" && isset($_SESSION['guru_id'])) {

    $username = $_SESSION['guru_id'];

    $cek = mysqli_query($koneksi,
        "SELECT has_voted FROM guru_admin WHERE username='$username'"
    );
    $user = mysqli_fetch_assoc($cek);

    if ($user['has_voted'] == 1) {
        die("Sudah voting");
    }

    // 🔥 NAIKKAN SUARA (BENAR)
    mysqli_query($koneksi,
        "UPDATE candidates SET vote = vote + 1 WHERE id='$id_candidate'"
    );

    // 🔥 SIMPAN PILIHAN
    mysqli_query($koneksi,
        "UPDATE guru_admin 
         SET has_voted = 1, candidate_id = '$id_candidate' 
         WHERE username='$username'"
    );
}

header("Location: sukses.php");
exit;
