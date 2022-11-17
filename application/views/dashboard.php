<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1>Dashboard</h1>
    </div>

    <div class="section-header">
      <h6>Selamat Datang di Aplikasi Manajemen <b>Kojo Cloth</b></h6>

    </div>

    <?php if(is_admin() || is_keuangan() || is_owner()):?>
    <div class="section-body">
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="card card-statistic-2">
            <div class="card-stats">
              <div class="card-stats-title">
                <h5>Total Pemasukan</h5>
              </div>
            </div>
            <div class="card-icon shadow-primary bg-primary">
              <i class="fas fa-dollar-sign"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Balance</h4>
              </div>
              <div class="card-body">
                <h6><?= 'Rp '.number_format($pemasukan['jumlah'], 0, ',', '.');?></h6>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="card card-statistic-2">
            <div class="card-stats">
              <div class="card-stats-title">
                <h5>Total Pengeluaran</h5>
              </div>
            </div>
            <div class="card-icon shadow-primary bg-primary">
              <i class="fas fa-dollar-sign"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Balance</h4>
              </div>
              <div class="card-body">
                <h6><?= 'Rp '.number_format($pengeluaran['jumlah'], 0, ',', '.');?></h6>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="card card-statistic-2">
            <div class="card-stats">
              <div class="card-stats-title">
                <h5>Total Saldo</h5>
              </div>
            </div>
            <div class="card-icon shadow-primary bg-primary">
              <i class="fas fa-dollar-sign"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Balance</h4>
              </div>
              <div class="card-body">
                <h6>
                <?php
                  $selisih; 
                  if($pemasukan['jumlah'] - $pengeluaran['jumlah'] < 0) {
                    $selisih = '<span style="color: red;">(Rp '.number_format($pemasukan['jumlah'] - $pengeluaran['jumlah'], '2',',','.' ).')</span';
                  } else {
                    $selisih = 'Rp '.number_format($pemasukan['jumlah'] - $pengeluaran['jumlah'], '2',',','.' );
                  } ?>
                  <?= $selisih;?>
                </h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	  <?php endif;?>

    <?php if(is_admin() || is_owner()):?>
    <div class="section-body">
      <div class="row">
        <div class="col-lg-4 col-md-6 col-sm-6 col-12">
          <div class="card card-statistic-1">
            <div class="card-icon bg-warning">
              <i class="fas fa-check"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Data Pengajuan Belum Diapprove</h4>
              </div>
              <div class="card-body">
                <?= $pengajuan ?>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-12">
          <div class="card card-statistic-1">
            <div class="card-icon bg-warning">
              <i class="fas fa-check"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Data Gaji Belum Diapprove</h4>
              </div>
              <div class="card-body">
              <?= $gaji ?>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-12">
          <div class="card card-statistic-1">
            <div class="card-icon bg-warning">
              <i class="fas fa-check"></i>
            </div>
            <div class="card-wrap">
              <div class="card-header">
                <h4>Data Gaji Produksi Belum Diapprove</h4>
              </div>
              <div class="card-body">
              <?= $gaji_produksi ?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	  <?php endif;?>

    <?php if(is_admin() || is_produksi() || is_owner()):?>
    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Order Yang Masih Berjalan</h4>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Tgl Order</th>
                      <th>Klien</th>
                      <th>Produk</th>
                      <th>Jumlah</th>
                      <th>Nama Marketing</th>
                      <th>Status</th>
                      <th class="text-center" style="width: 250px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($order as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tgl_order'];?></td>
                      <td>
                        <?= $u['nama_pelanggan'];?><br>
                        (<?= $u['no_telepon'];?>)<br>
                        <?= $u['instansi'];?><br>
                      </td>
                      <td><?= $u['nama_produk'];?></td>
                      <td>
                        S : <?= $u['jumlah_ukuran_s'];?><br>
                        M : <?= $u['jumlah_ukuran_m'];?><br>
                        L : <?= $u['jumlah_ukuran_l'];?><br>
                        XL : <?= $u['jumlah_ukuran_xl'];?><br>
                        XXL : <?= $u['jumlah_ukuran_xxl'];?>
                      </td>
                      <td><?= $u['nama'];?></td>
                      <td><?= status($u['status_order']);?></td>
                      <td class="text-center">
                        <a href="<?= base_url('detail-order/'.$u['id_order']);?>" class="btn btn-light"><i class="fa fa-eye"></i> Detail</a>
                      </td>
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
	  <?php endif;?>

    <?php if(is_admin() || is_marketing() || is_k_marketing() || is_owner()):?>
    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Grafik Penjualan per Produk</h4>
            </div>
            <div class="card-body">
              <canvas id="myChart" height="158"></canvas>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Grafik Survey</h4>
            </div>
            <div class="card-body">
              <canvas id="surveyChart" height="158"></canvas>
            </div>
            <div class="card-footer">
              Keterangan :
              <div class="row">
                <div class="col-md-1">5</div>
                <div class="col-md-4">: Sangat Baik</div>
              </div>
              <div class="row">
                <div class="col-md-1">4</div>
                <div class="col-md-4">: Baik</div>
              </div>
              <div class="row">
                <div class="col-md-1">3</div>
                <div class="col-md-4">: Cukup</div>
              </div>
              <div class="row">
                <div class="col-md-1">2</div>
                <div class="col-md-4">: Kurang</div>
              </div>
              <div class="row">
                <div class="col-md-1">1</div>
                <div class="col-md-4">: Buruk</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Agenda yang Berjalan</h4>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-pegawai">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Nama Kegiatan</th>
                      <th>Tanggal</th>
                      <th>Tenggat Waktu</th>
                      <th>Tempat</th>
                      <th>Waktu</th>
                      <th>Keterangan</th>
                      <th class="text-center" style="width: 100px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($agenda as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['nama_agenda'];?></td>
                      <td><?= $u['tanggal_agenda'];?></td>
                      <td><?= $u['tenggat_agenda'];?></td>
                      <td><?= $u['tempat'];?></td>
                      <td><?= $u['waktu'];?></td>
                      <td><?= $u['keterangan'];?></td>
                      <td class="text-center">
                        <a href="<?= base_url('detail-agenda/'.$u['id_agenda']);?>" class="btn btn-light"><i class="fa fa-list"></i> Hasil</a>
                      </td>
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
	  <?php endif;?>

  </section>
  
</div>
<?php $this->load->view('template/footer');?>