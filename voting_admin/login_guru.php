<?php
session_start();
include "koneksi.php";

$error = "";

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($koneksi, $_POST['username']);
    $password = mysqli_real_escape_string($koneksi, $_POST['password']);

    $query = "SELECT * FROM guru_admin WHERE username='$username' AND password='$password' LIMIT 1";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);

        $_SESSION['guru_id'] = $row['id'];
        header("Location: index_public.php");
        exit;
    } else {
        $error = "Username atau password salah.";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login Guru / Staff</title>
    <link rel="stylesheet" href="style/login_guru.css">
</head>
<body>

<div class="login-box">
    <h2>Login Guru / Staff</h2>

    <?php if ($error != "") echo "<p style='color:red; text-align:center;'>$error</p>"; ?>

    <form method="POST">
        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit" name="login">Masuk</button>

        <div class="back-link">
            <a href="login_vote.php">← Kembali ke Login Siswa</a>
        </div>
    </form>
</div>

</body>
</html>
