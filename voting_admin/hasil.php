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
 <link rel="icon" type="image/png" id="favicon" href="FOTO/Logo OSIS SMK-min.png">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="style/dashboard.css">
</head>
<body>
    <!-- BUTTON MOBILE -->
<button class="open-circle" id="openSidebar">☰</button>

<!-- SIDEBAR -->
<?php include "sidebar.php"; ?>

<!-- CONTENT -->
<div class="content full">
    <div class="container">

        <h1>📊 HASIL PEMILIHAN OSIS</h1>
        <p class="subtitle">Data suara realtime</p>

        <table>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Suara</th>
            </tr>

            <?php
            $no = 1;
            $nama = [];
            $suara = [];

            while ($d = mysqli_fetch_assoc($data)) {
                $nama[] = $d['name'];
                $suara[] = $d['vote'];
            ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= htmlspecialchars($d['name']) ?></td>
                <td><strong><?= $d['vote'] ?></strong></td>
            </tr>
            <?php } ?>
        </table>

        <div class="chartBox">
            <canvas id="barChart"></canvas>
        </div>

        <div class="btn-area">
            <a href="dashboard.php" class="btn back">⬅ Kembali</a>
        </div>

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
openBtn.addEventListener("click", function () {
        sidebar.classList.toggle("active");
            document.addEventListener("click", function (e) {
        if (
            sidebar.classList.contains("active") &&
            !sidebar.contains(e.target) &&
            !openBtn.contains(e.target)
        ) {
            sidebar.classList.remove("active");
        }
    });
    });


</script>



</body>
</html>
