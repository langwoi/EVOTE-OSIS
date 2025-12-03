<?php 
session_start();
include "koneksi.php"; 

// Proteksi halaman
if (!isset($_SESSION['voter_id']) && !isset($_SESSION['guru_id']))  {
    header("Location: login_vote.php");
    exit;
}

// =====================
//     CEK USER LOGIN
// =====================
if (isset($_SESSION['voter_id'])) {

    // LOGIN SISWA
    $id = $_SESSION['voter_id'];
    $role = "siswa";

    $cek = mysqli_query($koneksi, 
        "SELECT name, class, has_voted FROM voters WHERE id='$id'"
    );
    if (!$cek) die("Query Voters Error: " . mysqli_error($koneksi)); 
    $user = mysqli_fetch_assoc($cek);

} else if (isset($_SESSION['guru_id'])) {

    // LOGIN GURU / STAFF
    $id = $_SESSION['guru_id'];
    $role = "guru";

    $cek = mysqli_query($koneksi, 
        "SELECT username AS name, has_voted FROM guru_admin WHERE id='$id'"
    );
    if (!$cek) die("Query Guru Error: " . mysqli_error($koneksi));
    $user = mysqli_fetch_assoc($cek);
}

// Buat variabel has_voted biar tidak error
$has_voted = $user['has_voted'];

?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Online</title>
    <link rel="stylesheet" href="style/index_public.css">
</head>

<body>

<div id="pageContent">

<header class="hero">
    <div class="overlay"></div>
    <div class="hero-content">
        <img src="FOTO/logo_smksg.png" class="logo-header" alt="Logo Sekolah">
        <div class="hero-text">
            <h1>SISTEM PEMILIHAN KETUA & WAKIL KETUA OSIS SMKSG 25/26</h1>
            <p>Selamat Datang di Website Voting Sekolah</p>
        </div>
        <img src="FOTO/Logo OSIS SMK.png" class="logo-header" alt="Logo Sekolah">
    </div>
</header>

<section class="container">

    <!-- ========= SAPAAN ========= -->
<div class="welcome-box">

<?php if ($role == "siswa") { ?>

    <p style="font-size:16px;">
        👋 Halo, <b><?= $user['name']; ?></b>!  
        <br>📘 Kamu terdaftar sebagai siswa dari kelas <b><?= $user['class']; ?></b>.  
        <br>🗳️ Silakan baca visi misi dan pilih kandidat terbaikmu!
    </p>

<?php } else { ?>

    <p style="font-size:16px;">
        🙌 Selamat datang, <b><?= $user['name']; ?></b>!  
        <br>🏫 Status Anda: <b>Guru / Staff SMK Semen Gresik</b>.  
        <br>🗳️ Silakan berpartisipasi dalam pemilihan OSIS tahun ini.
    </p>

<?php } ?>

</div>


    <h2>DAFTAR KANDIDAT</h2>

    <div class="card-wrapper">
        <?php
        $data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY name ASC");
        while ($row = mysqli_fetch_assoc($data)) {
        ?>
        <div class="card">

            <img src="FOTO/<?= $row['photo']; ?>" alt="<?= $row['name']; ?>" class="candidate-photo">

            <h3><?= $row['name']; ?></h3>
            <div class="visi-misi">
                <p><b>Visi:</b> <?= $row['visi']; ?></p>
                <p><b>Misi:</b> <?= nl2br($row['misi']); ?></p>
            </div>

            <?php if ($has_voted == 1): ?>
                <span class="btn-disabled">Sudah Memilih</span>
            <?php else: ?>
                <a href="javascript:void(0);" class="btn-vote"
                    onclick="openModal('vote_proses.php?id=<?= $row['id']; ?>&role=<?= $role ?>', '<?= $row['name']; ?>')">
                    Vote
                </a>
            <?php endif; ?>

        </div>
        <?php } ?>
    </div>

    <!-- ========= MODAL KONFIRMASI ========= -->
    <div id="voteModal" class="modal">
        <div class="modal-content">
            <h2>Konfirmasi Voting</h2>
            <p id="modalText">Apakah Anda yakin memilih kandidat ini?</p>
            <div class="modal-buttons">
                <button class="cancel" onclick="closeModal()">Batal</button>
                <button class="confirm" id="confirmVote">Ya, Pilih</button>
            </div>
        </div>
    </div>

    <div class="link-group">
        <a href="maintenance.php" class="btn view">Lihat Hasil Voting</a>
        <a href="logout.php" class="btn admin" style="background:red;">Logout</a>
    </div>

</section>

<footer>
    <div class="footer-logos">
        <img src="FOTO/logo_smksg.png" width="55" alt="logo smk">
        <img src="FOTO/Logo OSIS SMK.png" width="55" alt="logo osis">
    </div>
    <h3>OSIS SMK SEMEN GRESIK — Sistem E-Voting</h3>
    <p>JLN. ARIEF RAHMAN HAKIM NO 90. GRESIK</p>
    <p>WEBSITE BY GALANG CIPTA R, BANTUAN CHATGPT</p>
    <p class="copy">&copy; 2025 All Rights Reserved.</p>
</footer>

</div>

<!-- ========= POPUP RULES ========= -->
<?php if ($has_voted == 0): ?>
<div id="rulesPopup" class="rules-modal">
    <div class="rules-content">
        <h2>TATA CARA MEMILIH ANGGOTA KETUA OSIS PERIODE 2025/2026</h2>

        <ul>
            <li>Baca profil calon sebelum memilih.</li>
            <li>Pilih satu pasangan calon.</li>
            <li>Konfirmasi voting sebelum menekan tombol YA.</li>
            <li>Jika muncul warna hijau, pilih "Kembali ke Beranda".</li>
            <li>Lalu logout akun.</li>
        </ul>

        <label class="check-wrap">
            <input type="checkbox" id="agreeCheck">
            <span>Saya sudah membaca & memahami aturan</span>
        </label>

        <button class="rules-btn" id="rulesBtn" onclick="closeRules()" disabled>
            Saya Mengerti & Lanjut
        </button>
    </div>
</div>
<?php endif; ?>


<script>
let voteUrl = "";

// Modal Vote
function openModal(url, name) {
    voteUrl = url;
    document.getElementById('modalText').textContent = `Apakah Anda yakin memilih ${name}?`;
    document.getElementById('voteModal').style.display = 'flex';
}

function closeModal() {
    document.getElementById('voteModal').style.display = 'none';
}

document.getElementById('confirmVote').addEventListener('click', function() {
    window.location.href = voteUrl;
});

// Popup rules
<?php if ($has_voted == 0): ?>
window.onload = function() {
    document.getElementById("rulesPopup").style.display = "flex";
    document.getElementById("pageContent").classList.add("blur-active");
};
<?php endif; ?>

function closeRules() {
    document.getElementById("rulesPopup").style.display = "none";
    document.getElementById("pageContent").classList.remove("blur-active");
}

<?php if ($has_voted == 0): ?>
document.getElementById("agreeCheck").addEventListener("change", function() {
    document.getElementById("rulesBtn").disabled = !this.checked;
});
<?php endif; ?>
</script>

</body>
</html>
