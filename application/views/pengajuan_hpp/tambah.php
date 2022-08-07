<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengajuan HPP</a></div>
        <div class="breadcrumb-item">Tambah Pengajuan HPP</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('tambah-pengajuan-hpp'); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Tambah Pengajuan Bahan Baku</h4>
              </div>
              <div class="card-body">
              <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Tanggal</label>
                    <input type="date" name="tanggal" class="form-control" value="<?= set_value('tanggal'); ?>" required="">
                    <?= form_error('tanggal', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Jenis Pengeluaran</label>
                    <select name="id_jenis_pengeluaran" class="form-control" required>
                      <option selected disabled>-- Pilih Jenis --</option>
                      <?php 
                        foreach ($jenis_pengeluaran as $key) { ?>
                          <option value="<?= $key['id_jenis_pengeluaran'] ?>" <?= set_value('id_jenis_pengeluaran', 1) == $key['id_jenis_pengeluaran'] ? 'selected' : '' ?>><?= $key['jenis_pengeluaran'] ?></option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_jenis_pengeluaran', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Order</label>
                    <select name="id_order" class="form-control" id="select-order" data-live-search="true" required>
                      <option selected disabled>-- Pilih Order --</option>
                      <?php 
                        foreach ($order as $key) { ?>
                          <option value="<?= $key['id_order'] ?>" <?= set_value('id_order') == $key['id_order'] ? 'selected' : '' ?>><?= $key['nama_produk'] ?> - <?= $key['instansi'] ?></option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_order', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Keterangan</label>
                    <input type="text" name="keterangan" id="keterangan" class="form-control" value="<?= set_value('keterangan'); ?>" required="">
                    <span class="text-danger small">*) Tambahkan Keterangan</span>
                    <?= form_error('keterangan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 form-group">
                    <label>Rekening Penerima</label>
                    <select name="id_rekening" class="form-control" id="select-pelanggan" data-live-search="true" required>
                      <option selected disabled>-- Pilih No Rekening --</option>
                      <?php 
                        foreach ($rekening as $key) { ?>
                          <option value="<?= $key['id_rekening'] ?>" <?= set_value('id_rekening') == $key['id_rekening'] ? 'selected' : '' ?>><?= $key['no_rekening'] ?> A/N <?= $key['nama_rekening'] ?> (<?= $key['bank'] ?>) </option>
                      <?php  }
                      ?>
                    </select>
                    <?= form_error('id_rekening', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                
              </div>
              

              <div class="card-footer text-right">
                <a href="<?= base_url('pengajuan_hpp');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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