<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Produk</a></div>
        <div class="breadcrumb-item">Tambah Produk</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('tambah-produk'); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Tambah Produk</h4>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Jenis Produk</label>
                    <select name="jenis_produk" class="form-control" id="select-jenis-produk">
                      <option>-- Pilih Jenis Produk --</option>
                      <?php foreach ($jenis_produk as $key) { ?>
                        <option value="<?= $key['jenis_produk'].'||'.$key['kebutuhan'] ?>" <?= set_value('jenis_produk') == $key['jenis_produk'].'||'.$key['kebutuhan'] ? 'selected' : '' ?>><?= $key['jenis_produk'] ?></option>
                      <?php } ?>
                      
                      
                    </select>
                    <?= form_error('jenis_produk', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Nama Produk</label>
                    <input type="text" name="nama_produk" class="form-control" value="<?= set_value('nama_produk'); ?>" required="">
                    <?= form_error('nama_produk', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Bahan</label>
                    <input type="text" name="bahan" class="form-control" value="<?= set_value('bahan'); ?>" required="">
                    <?= form_error('bahan', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Foto Produk</label>
                    <input type="file" name="foto_produk" class="form-control" value="<?= set_value('nama_produk'); ?>" required="">
                    <span class="text-danger small">*) File yg diupload berformat (.jpg, .jpeg, .png)</span>
                  </div>
                </div>

                <h6>Kebutuhan Benang :</h6>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Jumlah Benang (dalam Roll)</label>
                    <input type="text" name="jml_benang" class="form-control" value="<?= set_value('jml_benang', 0); ?>" required="">
                    <?= form_error('jml_benang', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Harga Benang (dalam Roll)</label>
                    <input type="text" name="harga_benang" class="form-control" value="<?= set_value('harga_benang', 0); ?>" required="">
                    <?= form_error('harga_benang', '<span class="text-danger small">', '</span>'); ?>
                  </div>
                </div>

                <div id="kain">

                </div>

                <div id="kancing">

                </div>

                <div id="resleting">

                </div>

                <div id="prepet">

                </div>

                <div id="rib">

                </div>

              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('produk');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
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