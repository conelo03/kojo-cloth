<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>Laporan Pemasukan</title>
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
                <h3 class="text-center mb-4">Laporan Pemasukan <?= date('F Y', strtotime($month_c)) ?></h3>
                <br>
                <table width="100%" border='1'>
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 20px;">#</th>
                      <th class="text-center" style="width: 80px;">Tanggal</th>
                      <th style="width: 80px;">Jenis</th>
                      <th>Keterangan</th>
                      <th style="width: 80px;" class="text-center">Ref</th>
                      <th style="width: 150px;" class="text-center">Jumlah</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    $total=0;
                    foreach($pemasukan as $u):
                      $total += $u['jumlah'];
                    ?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tanggal'];?></td>
                      <td><?= $u['jenis_pemasukan'];?></td>
                      <td><?= $u['keterangan'];?></td>
                      <td class="text-center"><?= $u['referensi'];?></td>
                      <td class="text-right"><?= number_format($u['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <?php endforeach;?>
                    <tr>
                      <td colspan="5" class="text-center">TOTAL</td>
                      <td class="text-right"><?= number_format($total, '2',',','.' );?></td>
                    </tr>
                  </tbody>
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