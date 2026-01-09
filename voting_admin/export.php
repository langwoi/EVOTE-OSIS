<?php
include "koneksi.php";

header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Hasil_Voting.xls");

echo "<table border='1'>
<tr>
<th>No</th>
<th>Nama Kandidat</th>
<th>Jumlah Suara</th>
</tr>";

$no = 1;
$q = mysqli_query($koneksi, "SELECT * FROM candidates ORDER BY votes DESC");
while ($d = mysqli_fetch_assoc($q)) {
    echo "<tr>
        <td>".$no++."</td>
        <td>".$d['name']."</td>
        <td>".$d['vote']."</td>
    </tr>";
}

echo "</table>";
?>
