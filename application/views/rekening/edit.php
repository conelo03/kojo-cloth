<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Rekening</a></div>
        <div class="breadcrumb-item">Edit Rekening</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('edit-rekening/'. $rekening['id_rekening']); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Edit Rekening</h4>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label>No Rekening</label>
                  <input type="text" name="no_rekening" class="form-control" value="<?= set_value('no_rekening', $rekening['no_rekening']); ?>" required="">
                  <?= form_error('no_rekening', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Nama rekening</label>
                  <input type="text" name="nama_rekening" class="form-control" value="<?= set_value('nama_rekening', $rekening['nama_rekening']); ?>" required="">
                  <?= form_error('nama_rekening', '<span class="text-danger small">', '</span>'); ?>
                </div> 
                <div class="form-group">
                  <label>Bank</label>
                  <input type="text" name="bank" class="form-control" value="<?= set_value('bank', $rekening['bank']); ?>" required="">
                  <?= form_error('bank', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('rekening');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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