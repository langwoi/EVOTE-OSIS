<?php
$ip_allow = ['172.20.131.35'];
if (!in_array($_SERVER['REMOTE_ADDR'], $ip_allow)) {
    die("AKSES TERTOLAKKK");
}
header("Location: voting_admin/login_vote.php");
exit;
?>  