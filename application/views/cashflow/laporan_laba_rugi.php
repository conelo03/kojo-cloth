<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Laba Rugi</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Laporan Laba Rugi</h4>
            </div>
            <div class="card-body">
              <form action="<?= base_url('laporan-laba-rugi'); ?>" method="post">
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
                    <button type="submit" value="filter" name="mode" class="btn btn-primary"><i class="fa fa-filter"></i> Filter</button>
                    <button type="submit" value="cetak" name="mode" class="btn btn-light"><i class="fa fa-print"></i> Cetak</button>
                  </div>
                </div>
              </form>
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th colspan="4">Pendapatan</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="200px" class="text-center">&nbsp;</td>
                      <td class="">Penjualan</td>
                      <td width="20px">Rp</td>
                      <td width="200px" class="text-right"><?= number_format($penjualan['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <tr>
                      <td width="200px" class="">Total Pendapatan</td>
                      <td class=""></td>
                      <td width="20px">Rp</td>
                      <td width="200px" class="text-right"><?= number_format($penjualan['jumlah'], '2',',','.' );?></td>
                    </tr>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="4">Harga Pokok Produksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="200px" class="text-center">&nbsp;</td>
                      <td class="">HPP</td>
                      <td width="20px">Rp</td>
                      <td width="200px" class="text-right"><?= number_format($hpp['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <tr>
                      <td width="200px" class="">Total HPP</td>
                      <td class=""></td>
                      <td width="20px">Rp</td>
                      <td width="200px" class="text-right"><?= number_format($hpp['jumlah'], '2',',','.' );?></td>
                    </tr>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="2">Pendapatan Kotor</th>
                      <th width="20px">Rp</th>
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
                      <td width="200px" class="text-center">&nbsp;</td>
                      <td class=""><?= $u['jenis_pengeluaran'] ?></td>
                      <td width="20px">Rp</td>
                      <td width="200px" class="text-right"><?= number_format($u['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="2">Laba Bersih</th>
                      <th width="20px">Rp</th>
                      <th width="200px" class="text-right">
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
  </section>
</div>
<?php $this->load->view('template/footer');?>