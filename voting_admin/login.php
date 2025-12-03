<?php
session_start();
include "koneksi.php";

$err = "";
if (isset($_POST['login'])) {
    $user = $_POST['username'];
    $pass = $_POST['password'];
    $sql = mysqli_query($koneksi, "SELECT * FROM admin WHERE username='$user' AND password='$pass'");
    if (mysqli_num_rows($sql) > 0) {
        $_SESSION['admin'] = $user;
        header("Location: dashboard.php");
        exit;
    } else {
        $err = "Login gagal! Username atau password salah";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login Admin Web</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/login.css">
</head>
<body>

<div class="login-box">
    <h2>Login Admin EVOTE PILKETOS OSISSMKSG 25/26</h2>

    <?php if ($err != "") { echo "<div class='error'>$err</div>"; } ?>

    <form method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button name="login">Login</button>
    </form>
</div>

</body>
</html>
