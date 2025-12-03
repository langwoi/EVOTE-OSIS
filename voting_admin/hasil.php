<?php
session_start();
include "koneksi.php";
if (empty($_SESSION['admin'])) header("Location: login.php");
$data = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY votes DESC");
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Hasil Voting OSIS</title>
<link rel="stylesheet" href="style/hasil.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="container">
    <h1>📊 HASIL PEMILIHAN KETUA & WAKIL KETUA OSIS</h1>
    <p class="subtitle">Data suara ditampilkan secara realtime</p>

    <table>
        <tr>
            <th>No</th>
            <th>Nama Kandidat</th>
            <th>Jumlah Suara</th>
        </tr>

        <?php
        $no = 1;
        $nama = [];
        $suara = [];
        while ($d = mysqli_fetch_assoc($data)) {
            $nama[] = $d['name'];
            $suara[] = $d['votes'];
        ?>
        <tr>
            <td><?= $no++; ?></td>
            <td><?= $d['name']; ?></td>
            <td><strong><?= $d['votes']; ?></strong></td>
        </tr>
        <?php } ?>
    </table>

    <div class="btn-area">
        <a href="export.php" class="btn excel">📥 Download Excel</a>
        <a href="dashboard.php" class="btn back">⬅ Kembali</a>
    </div>

    <div class="chartBox">
        <canvas id="barChart"></canvas>
    </div>
</div>

<script>
const ctx = document.getElementById('barChart');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?= json_encode($nama); ?>,
        datasets: [{
            label: 'Jumlah Suara',
            data: <?= json_encode($suara); ?>,
            backgroundColor: [
                '#1abc9c', '#3498db', '#9b59b6', '#e67e22', '#e74c3c',
                '#16a085', '#2980b9', '#8e44ad', '#d35400', '#c0392b'
            ],
            borderRadius: 6
        }]
    },
    options: {
        animations: {
            y: {
                duration: 1500,
                easing: 'easeOutQuart',
                from: (ctx) => {
                    if (ctx.type === 'data') {
                        return ctx.chart.scales.y.min;  // **NAIK DARI BAWAH**
                    }
                }
            }
        },
        plugins: {
            legend: { display: false }
        },
        scales: {
            y: { beginAtZero: true }
        }
    }
});
</script>



</body>
</html>
