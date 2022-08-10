<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengajuan Kasbon Produksi</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Detail Pembayaran Kasbon</h4>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-4"><h6>Tanggal</h6></div>
                <div class="col-8">: <?= $p['tanggal']; ?></div>
                <div class="col-4"><h6>Nama Pegawai</h6></div>
                <div class="col-8">: <?= $p['nama']; ?></div>
                <div class="col-4"><h6>Jumlah</h6></div>
                <div class="col-8">: <?= 'Rp '.number_format($p['jumlah'], 2, ',', '.'); ?></div>
                <div class="col-4"><h6>Sisa</h6></div>
                <div class="col-8">: <?= 'Rp '.number_format($p['sisa'], 2, ',', '.'); ?></div>
              </div>
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Tanggal</th>
                      <th>Jumlah</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($pengajuan_kasbon as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['created_at'];?></td>
                      <td>Rp <?= number_format($u['kasbon'], '2',',','.' );?></td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                </table>
              </div>
              <a href="<?= base_url('pengajuan-kasbon') ?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<?php $this->load->view('template/footer');?>