<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengajuan HPP</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Detail Pengajuan <?= $p['keterangan'] ?></h4>
              <div class="card-header-action">
                <?php if(is_admin() || is_produksi()): ?>
                  <?php if ($p['status'] == 0) { ?>
                      <a href="<?= base_url('tambah-detail-pengajuan-hpp/'.$id_pengajuan_hpp);?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                  <?php } ?>
                <?php endif; ?>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Nama Bahan</th>
                      <th>Vendor</th>
                      <th>Satuan</th>
                      <th>Jumlah</th>
                      <th>Harga</th>
                      <th>Total</th>
                      <th class="text-center" style="width: 160px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($pengajuan_hpp as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['nama_bahan'];?></td>
                      <td><?= $u['vendor'];?></td>
                      <td><?= $u['satuan'];?></td>
                      <td><?= $u['jumlah'];?></td>
                      <td>Rp <?= number_format($u['harga'], '2',',','.' );?></td>
                      <td>Rp <?= number_format($u['total'], '2',',','.' );?></td>
                      <td class="text-center">
                        <?php if(is_admin() || is_produksi()): ?>
                          <?php if ($p['status'] == 0) { ?>
                            <a href="<?= base_url('edit-detail-pengajuan-hpp/'.$id_pengajuan_hpp.'/'.$u['id_detail_pengajuan_hpp']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                            <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-detail-pengajuan-hpp/'.$id_pengajuan_hpp.'/'.$u['id_detail_pengajuan_hpp']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                          <?php } ?>
                        <?php endif; ?>
                      </td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                </table>
              </div>
              <a href="<?= base_url('pengajuan-hpp');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>