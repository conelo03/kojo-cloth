<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>Laporan Laba Rugi</title>
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
                <h3 class="text-center mb-4">Laporan Laba Rugi Per <?= date('F Y', strtotime($month_c)) ?></h3>
                <br>
                <table width="100%" border='0'>
                <thead>
                    <tr>
                      <th colspan="4">Pendapatan</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="180px" class="text-center">&nbsp;</td>
                      <td class="">Penjualan</td>
                      <td width="25px">Rp</td>
                      <td width="200px" class="text-right" style="border-bottom: 1px solid black"><?= number_format($penjualan['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <tr>
                      <td width="180px" class="">Total Pendapatan</td>
                      <td class=""></td>
                      <td width="25px">Rp</td>
                      <td width="200px" class="text-right" style="border-bottom: 2px solid black"><?= number_format($penjualan['jumlah'], '2',',','.' );?></td>
                    </tr>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="4">Harga Pokok Produksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="180px" class="text-center">&nbsp;</td>
                      <td class="">HPP</td>
                      <td width="25px">Rp</td>
                      <td width="200px" class="text-right" style="border-bottom: 1px solid black"><?= number_format($hpp['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <tr>
                      <td width="180px" class="">Total HPP</td>
                      <td class=""></td>
                      <td width="25px">Rp</td>
                      <td width="200px" class="text-right" style="border-bottom: 2px solid black"><?= number_format($hpp['jumlah'], '2',',','.' );?></td>
                    </tr>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="2">Pendapatan Kotor</th>
                      <th width="25px">Rp</th>
                      <th width="200px" class="text-right"><?= number_format($penjualan['jumlah']-$hpp['jumlah'], '2',',','.' );?></th>
                    </tr>
                  </thead>
                  <thead>
                    <tr>
                      <th colspan="4">Beban</th>
                    </tr>
                  </thead>
                  <tbody>

                  <?php
                    $total_beban = 0;
                    foreach($beban as $u):
                      $total_beban += $u['jumlah'];
                    ?>
                    <tr>
                      <td width="180px" class="text-center">&nbsp;</td>
                      <td class=""><?= $u['jenis_pengeluaran'] ?></td>
                      <td width="25px">-Rp</td>
                      <td width="200px" class="text-right"><?= number_format($u['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="2">Laba Bersih</th>
                      <th width="25px">Rp</th>
                      <th width="200px" class="text-right" style="border-bottom: 2px solid black;border-top: 1px solid black;">
                      <?php
                        $selisih; 
                        if($penjualan['jumlah']-$hpp['jumlah']-$total_beban < 0) {
                          $selisih = '<span style="color: red;">('.number_format($penjualan['jumlah']-$hpp['jumlah']-$total_beban, '2',',','.' ).')</span';
                        } else {
                          $selisih = number_format($penjualan['jumlah']-$hpp['jumlah']-$total_beban, '2',',','.' );
                        } ?>
                        <?= $selisih;?>
                      </th>
                    </tr>
                  </thead>
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
      //window.print();
    </script>
  </body>
</html>