<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Upah Produksi</a></div>
        <div class="breadcrumb-item">Tambah Upah Produksi</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('tambah-upah-produksi'); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Tambah Upah Produksi</h4>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Jenis Produk</label>
                    <select name="jenis_produk" class="form-control" id="">
                      <option disabled selected>-- Pilih Jenis Produk --</option>
                      <?php foreach ($jenis_produk as $key) { ?>
                        <option value="<?= $key['jenis_produk'] ?>" <?= set_value('jenis_produk') == $key['jenis_produk'] ? 'selected' : '' ?>><?= $key['jenis_produk'] ?></option>
                      <?php } ?>
                      
                      
                    </select>
                    <?= form_error('jenis_produk', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Jenis Pekerjaan</label>
                    <select name="jenis_pekerjaan" class="form-control" id="">
                      <option disabled selected>-- Pilih Jenis Pekerjaan --</option>
                      <option value="Cutting" <?= set_value('jenis_pekerjaan') == 'Cutting' ? 'selected' : '' ?>>Cutting</option>
                      <option value="Jahit" <?= set_value('jenis_pekerjaan') == 'Jahit' ? 'selected' : '' ?>>Jahit</option>
                      <option value="QC" <?= set_value('jenis_pekerjaan') == 'QC' ? 'selected' : '' ?>>QC</option>
                      
                    </select>
                    <?= form_error('jenis_pekerjaan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div> 
                <div class="form-group">
                  <label>Upah</label>
                  <input type="text" name="upah" class="form-control" value="<?= set_value('upah'); ?>" required="">
                  <?= form_error('upah', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('upah-produksi');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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