<?php
session_start();
unset($_SESSION['sudah_vote']);
header("Location: index_public.php");
?>
