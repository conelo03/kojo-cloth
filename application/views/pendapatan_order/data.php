<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pendapatan Order</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Pendapatan Order</h4>
              <div class="card-header-action">
                <?php if(is_marketing() || is_k_marketing() || is_keuangan() || is_admin()): ?>
                <a href="<?= base_url('tambah-pendapatan-order');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                <?php endif; ?>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Tanggal</th>
                      <th>Keterangan</th>
                      <th>Jumlah</th>
                      <th>Pegawai</th>
                      <th>Status</th>
                      <th class="text-center" style="width: 350px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($pendapatan_order as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tanggal'];?></td>
                      <td><?= $u['keterangan'];?></td>
                      <td>Rp <?= number_format($u['jumlah'], '2',',','.' );?></td>
                      <td><?= $u['nama'];?></td>
                      <td>
                        <?php
                          if($u['status'] == 0){
                            echo 'Belum Diposting';
                          }elseif($u['status'] == 1){
                            echo 'Sudah Diposting';
                          }
                        ?>  
                      </td>
                      <td class="text-center">
                      <a href="#" data-toggle="modal" data-target="#preview<?= $u['id_pendapatan_order'] ?>" class="btn btn-light"><i class="fa fa-list"></i> Detail</a>
                        <?php if($u['status'] == 0): ?>
                          <?php if(is_keuangan() || is_admin()): ?>
                            <button class="btn btn-success" data-confirm="Anda yakin ingin posting pendapatan order?|Data yang sudah diposting tidak akan bisa dibatalkan." data-confirm-yes="document.location.href='<?= base_url('posting-pendapatan-order/'.$u['id_pendapatan_order']); ?>';"><i class="fa fa-paper-plane"></i> Posting</button>
                          <?php endif; ?>
                          <?php if(is_marketing() || is_k_marketing() || is_keuangan() || is_admin()): ?>
                            <a href="<?= base_url('edit-pendapatan-order/'.$u['id_pendapatan_order']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                            <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-pendapatan-order/'.$u['id_pendapatan_order']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                          <?php endif; ?>
                          
                        <?php elseif($u['status'] == 1): ?>
                          <?php if(is_keuangan() || is_admin()): ?>
                            <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-pendapatan-order/'.$u['id_pendapatan_order']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                          <?php endif; ?>
                        <?php endif; ?>
                        
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

<?php foreach($pendapatan_order as $u):?>
<div class="modal fade " id="preview<?= $u['id_pendapatan_order'] ?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Bukti Pendapatan</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <?php if ($u['bukti_pendapatan'] != null) { ?>
          <iframe src="<?= base_url('assets/upload/bukti_pendapatan/'.$u['bukti_pendapatan']);?>" width="100%" height="500px">
          </iframe>
        <?php } else {
          echo 'Tidak ada file.';
        } ?>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">Tutup</button>
      </div>
    </div>
  </div>
</div>
<?php endforeach;?>
<?php $this->load->view('template/footer');?>