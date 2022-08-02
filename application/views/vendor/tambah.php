<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Vendor</a></div>
        <div class="breadcrumb-item">Tambah Vendor</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('tambah-vendor'); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Tambah Vendor</h4>
              </div>
              <div class="card-body">
                
                <div class="form-group">
                  <label>Nama vendor</label>
                  <input type="text" name="nama_vendor" class="form-control" value="<?= set_value('nama_vendor'); ?>" required="">
                  <?= form_error('nama_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Kontak Vendor</label>
                  <input type="text" name="kontak_vendor" class="form-control" value="<?= set_value('kontak_vendor'); ?>" required="">
                  <?= form_error('kontak_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Alamat Vendor</label>
                  <input type="text" name="alamat_vendor" class="form-control" value="<?= set_value('alamat_vendor'); ?>" required="">
                  <?= form_error('alamat_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div> 
                <div class="form-group">
                  <label>No Rekening</label>
                  <input type="text" name="no_rekening_vendor" class="form-control" value="<?= set_value('no_rekening_vendor'); ?>" required="">
                  <?= form_error('no_rekening_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Atas Nama</label>
                  <input type="text" name="nama_rekening_vendor" class="form-control" value="<?= set_value('nama_rekening_vendor'); ?>" required="">
                  <?= form_error('nama_rekening_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Bank Vendor</label>
                  <input type="text" name="bank_vendor" class="form-control" value="<?= set_value('bank_vendor'); ?>" required="">
                  <?= form_error('bank_vendor', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('vendor');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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