<?php
session_start();
if (empty($_SESSION['admin'])) header("Location: login.php");
include "koneksi.php";

$id = $_GET['id'];
mysqli_query($koneksi, "DELETE FROM candidates WHERE id='$id'");
header("Location: dashboard.php");
?>
