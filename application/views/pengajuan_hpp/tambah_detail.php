<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Detail Pengajuan HPP</a></div>
        <div class="breadcrumb-item">Tambah Detail Pengajuan HPP</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('tambah-detail-pengajuan-hpp/'.$id_pengajuan_hpp); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Tambah Detail Pengajuan HPP</h4>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Nama Bahan</label>
                    <input type="text" name="nama_bahan" class="form-control" value="<?= set_value('nama_bahan'); ?>" required="">
                    <?= form_error('nama_bahan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Vendor</label>
                    <input type="text" name="vendor" class="form-control" value="<?= set_value('vendor'); ?>" required="">
                    <?= form_error('vendor', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3 form-group">
                    <label>Satuan</label>
                    <input type="text" name="satuan" class="form-control" value="<?= set_value('satuan'); ?>" required="">
                    <?= form_error('satuan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-3 form-group">
                    <label>Jumlah</label>
                    <input type="text" name="jumlah" class="form-control" value="<?= set_value('jumlah'); ?>" required="">
                    <?= form_error('jumlah', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Harga Satuan</label>
                    <input type="number" name="harga" class="form-control" value="<?= set_value('harga'); ?>" required="">
                    <?= form_error('harga', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('detail-pengajuan-hpp/'.$id_pengajuan_hpp);?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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