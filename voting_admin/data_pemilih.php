<?php
session_start();
include "koneksi.php";

if (!isset($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}

$tab = $_GET['tab'] ?? 'siswa';

/* =======================
   KELAS SISWA
======================= */
$kelasQ = mysqli_query($koneksi, "
    SELECT DISTINCT class 
    FROM voters 
    ORDER BY class ASC
");
$kelasList = [];
while ($k = mysqli_fetch_assoc($kelasQ)) {
    $kelasList[] = $k['class'];
}
$currentClass = $_GET['kelas'] ?? ($kelasList[0] ?? '');

/* =======================
   DATA SISWA
======================= */
$dataSiswa = mysqli_query($koneksi, "
    SELECT 
        v.name AS nama,
        v.absen,
        c.name AS kandidat
    FROM voters v
    LEFT JOIN candidates c ON v.candidate_id = c.id
    WHERE v.class = '$currentClass'
    ORDER BY v.absen ASC
");

/* =======================
   DATA GURU (REAL)
======================= */
$dataGuru = mysqli_query($koneksi, "
    SELECT 
        g.username AS nama,
        g.mapel,
        c.name AS kandidat
    FROM guru_admin g
    LEFT JOIN candidates c ON g.candidate_id = c.id
    ORDER BY g.username ASC
");

/* =======================
   GRAFIK SISWA PER KELAS
======================= */
$qGrafikSiswa = mysqli_query($koneksi, "
    SELECT 
        v.class,
        c.name AS kandidat,
        COUNT(*) AS total
    FROM voters v
    JOIN candidates c ON v.candidate_id = c.id
    GROUP BY v.class, c.name
");

$grafikSiswa = [];
while ($r = mysqli_fetch_assoc($qGrafikSiswa)) {
    $grafikSiswa[] = $r;
}

/* =======================
   GRAFIK GURU
======================= */
$qGrafikGuru = mysqli_query($koneksi, "
    SELECT 
        c.name AS kandidat,
        COUNT(*) AS total
    FROM guru_admin g
    JOIN candidates c ON g.candidate_id = c.id
    GROUP BY c.name
");

$grafikGuru = [];
while ($r = mysqli_fetch_assoc($qGrafikGuru)) {
    $grafikGuru[] = $r;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rekap Voting</title>

<link rel="stylesheet" href="style/data_pemilih.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<h2>📊 Rekap Voting PILKETOS</h2>

<!-- TAB -->
<div class="tabs">
    <a href="?tab=siswa" class="<?= $tab=='siswa'?'active':'' ?>">👩‍🎓 Siswa</a>
    <a href="?tab=guru" class="<?= $tab=='guru'?'active':'' ?>">👨‍🏫 Guru</a>
</div>

<!-- ================= SISWA ================= -->
<?php if ($tab == 'siswa'): ?>

<div class="chart-box">
    <canvas id="chartSiswa"></canvas>
</div>

<div class="class-nav">
<?php foreach ($kelasList as $k): ?>
    <a href="?tab=siswa&kelas=<?= urlencode($k) ?>"
       class="<?= $k==$currentClass?'active':'' ?>">
        <?= htmlspecialchars($k) ?>
    </a>
<?php endforeach; ?>
</div>

<div class="table-wrap">
<table>
<tr>
    <th>No</th>
    <th>Nama</th>
    <th>Absen</th>
    <th>Pilihan</th>
</tr>
<?php
$no = 1;
while ($s = mysqli_fetch_assoc($dataSiswa)):
?>
<tr>
    <td><?= $no++ ?></td>
    <td><?= htmlspecialchars($s['nama']) ?></td>
    <td><?= htmlspecialchars($s['absen']) ?></td>
    <td><?= htmlspecialchars($s['kandidat'] ?? '-') ?></td>
</tr>
<?php endwhile; ?>
</table>
</div>

<?php endif; ?>

<!-- ================= GURU ================= -->
<?php if ($tab == 'guru'): ?>

<div class="chart-box">
    <canvas id="chartGuru"></canvas>
</div>

<div class="table-wrap">
<table>
<tr>
    <th>No</th>
    <th>Nama Guru</th>
    <th>Jabatan</th>
    <th>Pilihan</th>
</tr>
<?php
$no = 1;
while ($g = mysqli_fetch_assoc($dataGuru)):
?>
<tr>
    <td><?= $no++ ?></td>
    <td><?= htmlspecialchars($g['nama']) ?></td>
    <td><?= htmlspecialchars($g['mapel']) ?></td>
    <td><?= htmlspecialchars($g['kandidat'] ?? 'Belum memilih') ?></td>
</tr>
<?php endwhile; ?>
</table>
</div>

<?php endif; ?>

<a href="dashboard.php" class="back">⬅ Dashboard</a>

<script>
// ================= GRAFIK SISWA =================
<?php if ($tab == 'siswa'): ?>
const siswaData = <?= json_encode($grafikSiswa) ?>;

const kelas = [...new Set(siswaData.map(d => d.class))];
const kandidat = [...new Set(siswaData.map(d => d.kandidat))];

const datasets = kandidat.map(k => ({
    label: k,
    data: kelas.map(c => {
        const f = siswaData.find(d => d.class === c && d.kandidat === k);
        return f ? f.total : 0;
    })
}));

new Chart(document.getElementById('chartSiswa'), {
    type: 'bar',
    data: { labels: kelas, datasets },
    options: {
        responsive: true,
        plugins: { legend: { position: 'bottom' } }
    }
});
<?php endif; ?>

// ================= GRAFIK GURU =================
<?php if ($tab == 'guru'): ?>
const guruData = <?= json_encode($grafikGuru) ?>;

new Chart(document.getElementById('chartGuru'), {
    type: 'pie',
    data: {
        labels: guruData.map(d => d.kandidat),
        datasets: [{
            data: guruData.map(d => d.total)
        }]
    },
    options: { responsive: true }
});
<?php endif; ?>
</script>

</body>
</html>
