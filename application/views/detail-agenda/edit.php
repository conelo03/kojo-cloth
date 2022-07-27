<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Hasil Agenda</a></div>
        <div class="breadcrumb-item">Edit Hasil Agenda</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('edit-detail-agenda/'.$id_agenda.'/'.$agenda['id_detail_agenda']); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Edit Hasil Agenda <?= $a['nama_agenda'] ?></h4>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label>Foto Agenda</label>
                  <input type="hidden" name="foto_agenda_old" class="form-control" value="<?= $agenda['foto_agenda'] ?>" required="">
                  <input type="file" name="foto_agenda" class="form-control" >
                </div>  
                <div class="form-group">
                  <label>Tautan</label>
                  <input type="text" name="tautan" class="form-control" value="<?= set_value('tautan', $agenda['tautan']); ?>">
                  <?= form_error('tautan', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label>Keterangan</label>
                  <input type="text" name="keterangan" class="form-control" value="<?= set_value('keterangan', $agenda['keterangan']); ?>" required="">
                  <?= form_error('keterangan', '<span class="text-danger small">', '</span>'); ?>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('detail-agenda/'.$id_agenda);?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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