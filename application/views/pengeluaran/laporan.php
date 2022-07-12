<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengeluaran</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Laporan Pengeluaran</h4>
            </div>
            <div class="card-body">
              <form action="<?= base_url('laporan-pengeluaran'); ?>" method="post">
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
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th style="width: 80px;">Tanggal</th>
                      <th>Jenis</th>
                      <th>Keterangan</th>
                      <th>Ref</th>
                      <th>Jumlah</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($pengeluaran as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tanggal'];?></td>
                      <td><?= $u['jenis_pengeluaran'];?></td>
                      <td><?= $u['keterangan'];?></td>
                      <td><?= $u['referensi'];?></td>
                      <td>Rp <?= number_format($u['jumlah'], '2',',','.' );?></td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
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