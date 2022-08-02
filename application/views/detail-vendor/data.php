<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Katalog Vendor</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Katalog Vendor (<?= $v['nama_vendor'] ?>)</h4>
              <div class="card-header-action">
              <a href="<?= base_url('tambah-detail-vendor/'.$id_vendor);?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Nama Bahan</th>
                      <th>Warna</th>
                      <th>Satuan</th>
                      <th>Harga Satuan</th>
                      <th class="text-center" style="width: 250px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($vendor as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['nama_bahan'];?></td>
                      <td><?= $u['warna'];?></td>
                      <td><?= $u['satuan'];?></td>
                      <td>Rp <?= number_format($u['harga_satuan'], 2, '.', ',');?></td>
                      <td class="text-center">
                        <a href="<?= base_url('edit-detail-vendor/'.$id_vendor.'/'.$u['id_detail_vendor']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                        <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-detail-vendor/'.$id_vendor.'/'.$u['id_detail_vendor']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                        
                      </td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                </table>
              </div>
              <a href="<?= base_url('vendor');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>