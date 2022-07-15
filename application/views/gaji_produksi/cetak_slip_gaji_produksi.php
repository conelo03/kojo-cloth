<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>Slip Gaji Produksi</title>
    <style>
      .break {
        page-break-after: always; 
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <div class="mt-2">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h3 class="text-center mb-4">Slip Gaji</h3>
                <br>
                <table width="100%" border='0'>
                  <tr>
                    <td width="20%">Nama</td>
                    <td>: <?= $pegawai['nama'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">NIP</td>
                    <td>: <?= $pegawai['nip'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Jabatan</td>
                    <td>: <?= $pegawai['jabatan'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Tempat, Tanggal Lahir</td>
                    <td>: <?= $pegawai['tempat_lahir'] ?>, <?= $pegawai['tanggal_lahir'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Jenis Kelamin</td>
                    <td>: <?= $pegawai['jenis_kelamin'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Alamat</td>
                    <td>: <?= $pegawai['alamat'] ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Total Upah</td>
                    <td>: Rp <?= number_format($total_upah, 0, ',', '.') ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Total Kasbon</td>
                    <td>: Rp <?= number_format($total_kasbon, 0, ',', '.') ?></td>
                  </tr>
                  <tr>
                    <td width="20%">Total Upah Dibayar</td>
                    <td>: Rp <?= number_format($total_upah_dibayar, 0, ',', '.') ?></td>
                  </tr>
                </table>

                <br>
                <h5>Rincian Upah :</h5>
                <h5>Upah Cutting :</h5>
                <table width="100%" border="1">
                  <tr>
                    <th width="3%" class="text-center">#</th>
                    <th>Pola Potongan</th>
                    <th>Detail Ukuran</th>
                    <th class="text-center" width="7%">Jml</th>
                    <th class="text-center" width="15%">Upah</th>
                    <th class="text-center" width="15%">Total Upah</th>
                    <th class="text-center" width="15%">Kasbon</th>
                    <th class="text-center" width="15%">Total Bayar</th>
                  </tr>
                  <?php 
                    if($cutting):
                    $no = 1;
                    foreach ($cutting as $u): ?>
                      <tr>
                        <td class="text-center"><?= $no++ ?></td>
                        <td><?= $u['pola_potongan'] ?></td>
                        <td><?= $u['detail_ukuran'] ?></td>
                        <td class="text-center"><?= $u['jumlah'] ?></td>
                        <td class="text-right"><?= number_format($u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['jumlah']*$u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['kasbon'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format(($u['jumlah']*$u['harga'])-$u['kasbon'], 0, ',', '.') ?></td>
                      </tr>
                    <?php endforeach; ?>
                    <?php else: ?>
                      <tr>
                        <td colspan="8" class="text-center">Tidak ada data.</td>
                      </tr>
                    <?php endif; ?>
                </table>

                <br>
                <h5>Upah Jahit :</h5>
                <table width="100%" border="1">
                  <tr>
                    <th width="3%" class="text-center">#</th>
                    <th>Ukuran Pendek</th>
                    <th>Ukuran Panjang</th>
                    <th class="text-center" width="7%">Jml</th>
                    <th class="text-center" width="15%">Upah</th>
                    <th class="text-center" width="15%">Total Upah</th>
                    <th class="text-center" width="15%">Kasbon</th>
                    <th class="text-center" width="15%">Total Bayar</th>
                  </tr>
                  <?php 
                  if($jahit):
                    $no = 1;
                    foreach ($jahit as $u): ?>
                      <tr>
                        <td class="text-center"><?= $no++ ?></td>
                        <td><?= $u['ukuran_pendek'] ?></td>
                        <td><?= $u['ukuran_panjang'] ?></td>
                        <td class="text-center"><?= $u['jumlah'] ?></td>
                        <td class="text-right"><?= number_format($u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['jumlah']*$u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['kasbon'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format(($u['jumlah']*$u['harga'])-$u['kasbon'], 0, ',', '.') ?></td>
                      </tr>
                    <?php endforeach; ?>
                    <?php else: ?>
                      <tr>
                        <td colspan="8" class="text-center">Tidak ada data.</td>
                      </tr>
                    <?php endif; ?>
                </table>

                <br>
                <h5>Upah QC / Packaging :</h5>
                <table width="100%" border="1">
                  <tr>
                    <th width="3%" class="text-center">#</th>
                    <th>Ukuran Pendek</th>
                    <th>Ukuran Panjang</th>
                    <th class="text-center" width="7%">Jml</th>
                    <th class="text-center" width="15%">Upah</th>
                    <th class="text-center" width="15%">Total Upah</th>
                    <th class="text-center" width="15%">Kasbon</th>
                    <th class="text-center" width="15%">Total Bayar</th>
                  </tr>
                  <?php 
                  if($qc):
                    $no = 1;
                    foreach ($qc as $u): ?>
                      <tr>
                        <td class="text-center"><?= $no++ ?></td>
                        <td><?= $u['ukuran_pendek'] ?></td>
                        <td><?= $u['ukuran_panjang'] ?></td>
                        <td class="text-center"><?= $u['jumlah'] ?></td>
                        <td class="text-right"><?= number_format($u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['jumlah']*$u['harga'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format($u['kasbon'], 0, ',', '.') ?></td>
                        <td class="text-right"><?= number_format(($u['jumlah']*$u['harga'])-$u['kasbon'], 0, ',', '.') ?></td>
                      </tr>
                    <?php endforeach; ?>
                    <?php else: ?>
                      <tr>
                        <td colspan="8" class="text-center">Tidak ada data.</td>
                      </tr>
                    <?php endif; ?>
                </table>
                
              </div>
            </div>
          </div>
        </div>
      </div>
      

    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script>
      window.print();
    </script>
  </body>
</html>