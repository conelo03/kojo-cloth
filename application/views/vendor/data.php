<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola vendor</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data vendor</h4>
              <?php if (is_admin() || is_produksi()) { ?>
                <div class="card-header-action">
                  <a href="<?= base_url('tambah-vendor');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                </div>
              <?php } ?>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Nama Vendor</th>
                      <th>Kontak Vendor</th>
                      <th>Alamat Vendor</th>
                      <th>No Rekening Vendor</th>
                      <th class="text-center" style="width: 250px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($vendor as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['nama_vendor'];?></td>
                      <td><?= $u['kontak_vendor'];?></td>
                      <td><?= $u['alamat_vendor'];?></td>
                      <td><?= $u['no_rekening_vendor'];?> A/N <?= $u['nama_rekening_vendor'];?> (<?= $u['bank_vendor'];?>)</td>
                      <td class="text-center">
                        <?php if (is_admin() || is_produksi()) { ?>
                          <a href="<?= base_url('detail-vendor/'.$u['id_vendor']);?>" class="btn btn-light"><i class="fa fa-list"></i> Katalog</a>
                          <a href="<?= base_url('edit-vendor/'.$u['id_vendor']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                          <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-vendor/'.$u['id_vendor']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                        <?php } ?>
                      </td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>