<?php session_start(); ?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Voting Ditolak</title>
<link rel="stylesheet" href="style/sudahvote.css">
</head>
<body>

<div class="box">
    <div class="icon failed">✖</div>
    <h2>Anda Sudah Melakukan Voting</h2>
    <p>Setiap pemilih hanya diperbolehkan 1 kali memilih.</p>

    <div class="btn-group">
        <a href="index_public.php" class="btn home">Kembali ke Beranda</a>
        <a href="logout.php" class="btn reset">Logout</a>
    </div>
</div>

</body>
</html>
