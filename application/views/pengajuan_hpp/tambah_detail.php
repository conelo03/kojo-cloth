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
                    <label>Vendor</label>
                    <select name="id_vendor" class="form-control" id="select-vendor" data-live-search="true" required>
                      <option selected disabled>-- Pilih Vendor --</option>
                      <?php 
                        foreach ($vendor as $key) { ?>
                          <option value="<?= $key['id_vendor'] ?>" <?= set_value('id_vendor') == $key['id_vendor'] ? 'selected' : '' ?>><?= $key['nama_vendor'] ?></option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_vendor', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Pilih Item</label>
                    <select name="id_detail_vendor" class="form-control" id="select-detail-vendor" data-live-search="true" required>

                    </select>
                    <?= form_error('id_detail_vendor', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3 form-group">
                    <label>Satuan</label>
                    <input type="text" name="satuan" id="satuan" class="form-control" value="<?= set_value('satuan'); ?>" required="">
                    <?= form_error('satuan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-3 form-group">
                    <label>Jumlah</label>
                    <input type="text" name="jumlah" class="form-control" value="<?= set_value('jumlah'); ?>" required="">
                    <span class="text-danger small" id="jumlah-item"></span>
                    <?= form_error('jumlah', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Harga Satuan</label>
                    <input type="number" name="harga" id="harga" class="form-control" value="<?= set_value('harga'); ?>" required="">
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