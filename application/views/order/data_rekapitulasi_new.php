<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Order</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Riwayat Order</h4>
              <div class="card-header-action">
              </div>
            </div>
            <div class="card-body">
              <form action="<?= base_url('rekapitulasi-order'); ?>" method="post">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Pilih Bulan</label>
                    <select name="month" class="form-control" required>
                      <option selected disabled>-- Pilih Bulan --</option>
                      <?php 
                        foreach ($month as $key) { ?>
                          <option value="<?= $key['tgl1'] ?>" <?= $month_c == $key['tgl1'] ? 'selected' : '' ?>><?= $key['tgl'] ?></option>
                      <?php  }
                      ?>
                    </select>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>&nbsp;</label><br>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-filter"></i> Filter</button>
                  </div>
                </div>
              </form>
              <?php foreach ($list_all_data as $index => $value) { ?>

                Centeroid <?= $index + 1 ?>
                <table class="centeroid table table-striped">
                  <tr>
                    <td>C1</td>
                    <td><?= $c1[$index]['jas'] ?></td>
                    <td><?= $c1[$index]['jaket'] ?></td>
                    <td><?= $c1[$index]['kemeja'] ?></td>
                    <td><?= $c1[$index]['kaos'] ?></td>
                    <td><?= $c1[$index]['sweater'] ?></td>
                  </tr>
                  <tr>
                    <td>C2</td>
                    <td><?= $c2[$index]['jas'] ?></td>
                    <td><?= $c2[$index]['jaket'] ?></td>
                    <td><?= $c2[$index]['kemeja'] ?></td>
                    <td><?= $c2[$index]['kaos'] ?></td>
                    <td><?= $c2[$index]['sweater'] ?></td>
                  </tr>
                  <tr>
                    <td>C3</td>
                    <td><?= $c3[$index]['jas'] ?></td>
                    <td><?= $c3[$index]['jaket'] ?></td>
                    <td><?= $c3[$index]['kemeja'] ?></td>
                    <td><?= $c3[$index]['kaos'] ?></td>
                    <td><?= $c3[$index]['sweater'] ?></td>
                  </tr>
                </table>

                <br>

                Iteration <?= $index + 1 ?>
                <div class="table-responsive">
                  <table class="iteration table table-striped">
                    <tr>
                      <th>No</th>
                      <th>Instansi</th>
                      <th>Jas</th>
                      <th>Jaket</th>
                      <th>Kemeja</th>
                      <th>Kaos</th>
                      <th>Sweater</th>
                      <th>(C1)</th>
                      <th>(C2)</th>
                      <th>(C3)</th>
                      <th>Jarak Terdekat</th>
                    </tr>
                    <?php $no = 1;
                    foreach ($value as $index2 => $value2) { ?>
                      <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $value2['instansi'] ?></td>
                        <td><?= $value2['jas'] ?></td>
                        <td><?= $value2['jaket'] ?></td>
                        <td><?= $value2['kemeja'] ?></td>
                        <td><?= $value2['kaos'] ?></td>
                        <td><?= $value2['sweater'] ?></td>
                        <td style="<?= $value2['label'] == 'c1' ? 'background-color:yellow' : '' ?>"><?= $value2['c1'] ?></td>
                        <td style="<?= $value2['label'] == 'c2' ? 'background-color:yellow' : '' ?>"><?= $value2['c2'] ?></td>
                        <td style="<?= $value2['label'] == 'c3' ? 'background-color:yellow' : '' ?>"><?= $value2['c3'] ?></td>
                        <td><?= $value2['jarak'] ?></td>
                      </tr>
                    <?php } ?>
                    <tr>
                      <td colspan="2">Total</td>
                      <td><?= array_sum(array_column($value, 'jas')) ?></td>
                      <td><?= array_sum(array_column($value, 'jaket')) ?></td>
                      <td><?= array_sum(array_column($value, 'kemeja')) ?></td>
                      <td><?= array_sum(array_column($value, 'kaos')) ?></td>
                      <td><?= array_sum(array_column($value, 'sweater')) ?></td>
                      <td><?= array_sum(array_column($value, 'c1')) ?></td>
                      <td><?= array_sum(array_column($value, 'c2')) ?></td>
                      <td><?= array_sum(array_column($value, 'c3')) ?></td>
                      <td><?= array_sum(array_column($value, 'jarak')) ?></td>
                    </tr>
                  </table>
                </div>
                <br>
                <br>
                <br>

              <?php } ?>
              <table class="iteration table table-striped">
              <tr>
                <th colspan="8">
                  Hasil Cluster 1
                </th>
              </tr>
              <tr>
                <th>No</th>
                <th>Instansi</th>
                <th>Jas</th>
                <th>Jaket</th>
                <th>Kemeja</th>
                <th>Kaos</th>
                <th>Sweater</th>
              </tr>
              <?php if (count($result_c1) > 0) { ?>
                <?php $no = 1;
                foreach ($result_c1 as $index => $value) { ?>
                  <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $value['instansi'] ?></td>
                    <td><?= $value['jas'] ?></td>
                    <td><?= $value['jaket'] ?></td>
                    <td><?= $value['kemeja'] ?></td>
                    <td><?= $value['kaos'] ?></td>
                    <td><?= $value['sweater'] ?></td>
                  </tr>
                <?php } ?>
              <?php } else { ?>
                <tr>
                  <td colspan="7" class="center">Data Tidak Ada</td>
                </tr>
              <?php } ?>

            </table>

            <br>
            <br>
            <br>

            <table class="iteration table table-striped">
              <tr>
                <th colspan="7">
                  Hasil Cluster 2 
                </th>
              </tr>
              <tr>
                <th>No</th>
                <th>Instansi</th>
                <th>Jas</th>
                <th>Jaket</th>
                <th>Kemeja</th>
                <th>Kaos</th>
                <th>Sweater</th>
              </tr>
              <?php if (count($result_c2) > 0) { ?>
                <?php $no = 1;
                foreach ($result_c2 as $index => $value) { ?>
                  <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $value['instansi'] ?></td>
                    <td><?= $value['jas'] ?></td>
                    <td><?= $value['jaket'] ?></td>
                    <td><?= $value['kemeja'] ?></td>
                    <td><?= $value['kaos'] ?></td>
                    <td><?= $value['sweater'] ?></td>
                  </tr>
                <?php } ?>
              <?php } else { ?>
                <tr>
                  <td colspan="7" class="center">Data Tidak Ada</td>
                </tr>
              <?php } ?>

            </table>

            <br>
            <br>
            <br>

            <table class="iteration table table-striped">
              <tr>
                <th colspan="7">
                  Hasil Cluster 3
                </th>
              </tr>
              <tr>
                <th>No</th>
                <th>Instansi</th>
                <th>Jas</th>
                <th>Jaket</th>
                <th>Kemeja</th>
                <th>Kaos</th>
                <th>Sweater</th>
              </tr>
              <?php if (count($result_c3) > 0) { ?>
                <?php $no = 1;
                foreach ($result_c3 as $index => $value) { ?>
                  <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $value['instansi'] ?></td>
                    <td><?= $value['jas'] ?></td>
                    <td><?= $value['jaket'] ?></td>
                    <td><?= $value['kemeja'] ?></td>
                    <td><?= $value['kaos'] ?></td>
                    <td><?= $value['sweater'] ?></td>
                  </tr>
                <?php } ?>
              <?php } else { ?>
                <tr>
                  <td colspan="7" class="center">Data Tidak Ada</td>
                </tr>
              <?php } ?>

            </table>

            <br>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>