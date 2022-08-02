<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Katalog Vendor</a></div>
        <div class="breadcrumb-item">Edit Katalog Vendor</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('edit-detail-vendor/'.$id_vendor.'/'.$vendor['id_detail_vendor']); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Edit Katalog Vendor</h4>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label>Nama Bahan</label>
                  <input type="text" name="nama_bahan" class="form-control" value="<?= set_value('nama_bahan', $vendor['nama_bahan']); ?>" required="">
                  <?= form_error('nama_bahan', '<span class="text-danger small">', '</span>'); ?>
                </div>

                <div class="form-group">
                  <label>Warna</label>
                  <input type="text" name="warna" class="form-control" value="<?= set_value('warna', $vendor['warna']); ?>" >
                  <?= form_error('warna', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Satuan</label>
                  <input type="text" name="satuan" class="form-control" value="<?= set_value('satuan', $vendor['satuan']); ?>" required="">
                  <?= form_error('satuan', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Harga Satuan</label>
                  <input type="number" name="harga_satuan" class="form-control" value="<?= set_value('harga_satuan', $vendor['harga_satuan']); ?>" required="">
                  <?= form_error('harga_satuan', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('detail-vendor/'.$id_vendor);?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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