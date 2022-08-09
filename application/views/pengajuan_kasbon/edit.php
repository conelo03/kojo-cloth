<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengajuan Kasbon Produksi</a></div>
        <div class="breadcrumb-item">Edit Pengajuan Kasbon Produksi</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('edit-pengajuan-kasbon/'.$p['id_pengajuan_kasbon']); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Edit Pengajuan Kasbon Produksi</h4>
              </div>
              <div class="card-body">
              <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Tanggal</label>
                    <input type="date" name="tanggal" class="form-control" value="<?= set_value('tanggal', $p['tanggal']); ?>" required="">
                    <?= form_error('tanggal', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Jenis Pengeluaran</label>
                    <select name="id_jenis_pengeluaran" class="form-control" required>
                      <option selected disabled>-- Pilih Jenis --</option>
                      <?php 
                        foreach ($jenis_pengeluaran as $key) { ?>
                          <option value="<?= $key['id_jenis_pengeluaran'] ?>" <?= set_value('id_jenis_pengeluaran', $p['id_jenis_pengeluaran']) == $key['id_jenis_pengeluaran'] ? 'selected' : '' ?>><?= $key['jenis_pengeluaran'] ?></option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_jenis_pemasukan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Pegawai Produksi</label>
                    <select name="id_pegawai" class="form-control" required>
                      <option selected disabled>-- Pilih Pegawai --</option>
                      <?php 
                        foreach ($pegawai as $key) { ?>
                          <option value="<?= $key['id_pegawai'] ?>" <?= set_value('id_pegawai', $p['id_pegawai']) == $key['id_pegawai'] ? 'selected' : '' ?>><?= $key['nama'] ?></option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_pegawai', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Keterangan</label>
                    <input type="text" name="keterangan" class="form-control" value="<?= set_value('keterangan', $p['keterangan']); ?>" required="">
                    <?= form_error('keterangan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="form-group">
                  <label>Jumlah</label>
                  <input type="number" name="jumlah" class="form-control" value="<?= set_value('jumlah', $p['jumlah']); ?>" required="">
                  <?= form_error('jumlah', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>
              

              <div class="card-footer text-right">
                <a href="<?= base_url('pengajuan-kasbon');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
                <button type="reset" class="btn btn-danger"><i class="fa fa-sync"></i> Reset</button>
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>