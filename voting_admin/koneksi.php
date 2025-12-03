<?php
$koneksi = mysqli_connect("localhost", "root", "", "voting_admin");
if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
