<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>Laporan Cash Flow</title>
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
                <h3 class="text-center mb-4">Laporan Cash Flow <?= date('F Y', strtotime($month_c)) ?></h3>
                <br>
                <table width="100%" border='1'>
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 30px;">#</th>
                      <th class="text-center" style="width: 80px;">Tanggal</th>
                      <th>Keterangan</th>
                      <th class="text-center" style="width: 100px;">Ref</th>
                      <th class="text-center" style="width: 130px;">Pemasukan</th>
                      <th class="text-center" style="width: 130px;">Pengeluaran</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    $pemasukan = 0;
                    $pengeluaran = 0;
                    foreach($cash as $u):
                      $pemasukan += $u['pemasukan'] != '' ? $u['pemasukan'] : 0;
                      $pengeluaran += $u['pengeluaran'] != '' ? $u['pengeluaran'] : 0;
                    ?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td class="text-center"><?= $u['tgl'];?></td>
                      <td><?= $u['ket'];?></td>
                      <td class="text-center"><?= $u['ref'];?></td>
                      <td class="text-right"><?= $u['pemasukan'] != '' ? number_format($u['pemasukan'], '2',',','.' ) : '';?></td>
                      <td class="text-right"><?= $u['pengeluaran'] != '' ? number_format($u['pengeluaran'], '2',',','.' ) : '';?></td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                  <thead>
                    <tr>
                      <th class="text-center" colspan="4">TOTAL</th>
                      <th class="text-center" style="width: 130px;"><?= number_format($pemasukan, '2',',','.' );?></th>
                      <th class="text-center" style="width: 130px;"><?= number_format($pengeluaran, '2',',','.' );?></th>
                    </tr>
                    <tr>
                      <th class="text-center" colspan="4">SELISIH</th>
                      <th class="text-center" colspan="2">
                        <?php
                        $selisih; 
                        if($pemasukan - $pengeluaran < 0) {
                          $selisih = '<span style="color: red;">( '.number_format($pemasukan - $pengeluaran, '2',',','.' ).')</span';
                        } else {
                          $selisih = number_format($pemasukan - $pengeluaran, '2',',','.' );
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