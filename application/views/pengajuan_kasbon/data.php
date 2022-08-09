<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Pengajuan Kasbon Produksi</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Pengajuan Kasbon Produksi</h4>
              <div class="card-header-action">
                <a href="<?= base_url('tambah-pengajuan-kasbon');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Tanggal</th>
                      <th>Jenis</th>
                      <th>Keterangan</th>
                      <th>Jumlah</th>
                      <th>Sisa</th>
                      <th>Pegawai</th>
                      <th>Status</th>
                      <th class="text-center" style="width: 350px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($pengajuan_kasbon as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tanggal'];?></td>
                      <td><?= $u['jenis_pengeluaran'];?></td>
                      <td><?= $u['keterangan'];?></td>
                      <td>Rp <?= number_format($u['jumlah'], '2',',','.' );?></td>
                      <td>Rp <?= number_format($u['sisa'], '2',',','.' );?></td>
                      <td><?= $u['nama'];?></td>
                      <td>
                        <?php
                          if($u['status'] == 0){
                            echo 'Belum Disetujui';
                          }elseif($u['status'] == 1){
                            echo 'Disetujui';
                          }else{
                            echo 'Sudah Diposting';
                          }
                        ?>  
                      </td>
                      <td class="text-center">
                      <?php if((is_produksi() || is_admin()) && $u['sisa'] > 0): ?>
                        <button class="btn btn-success" data-target="#preview<?= $u['id_pengajuan_kasbon'] ?>" data-toggle="modal"><i class="fa fa-check"></i> Bayar</button>
                      <?php endif; ?> 
                        <?php if($u['status'] == 0): ?>
                          <?php if(is_owner() || is_admin()): ?>
                            <button class="btn btn-success" data-confirm="Anda yakin ingin menyetujui Pengajuan Kasbon?|Data yang sudah disetujui tidak akan bisa dibatalkan." data-confirm-yes="document.location.href='<?= base_url('approve-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']); ?>';"><i class="fa fa-check"></i> Approve</button>
                          <?php endif; ?>
                          <?php if(is_produksi() || is_admin()): ?>
                            <a href="<?= base_url('edit-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                            <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                          <?php endif; ?>
                        <?php elseif($u['status'] == 1): ?>
                          <?php if(is_keuangan() || is_admin()): ?>
                            <button class="btn btn-success" data-confirm="Anda yakin ingin posting data Pengajuan Kasbon ini?|Data yang sudah diposting tidak akan bisa diedit kembali." data-confirm-yes="document.location.href='<?= base_url('posting-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']); ?>';"><i class="fa fa-paper-plane"></i> Posting</button>
                          <?php endif; ?>
                        <?php elseif($u['status'] == 2): ?>
                          <?php if(is_keuangan() || is_admin()): ?>
                            <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']); ?>';"><i class="fa fa-trash"></i> Delete</button>
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

<?php foreach($pengajuan_kasbon as $u):
  $id_pegawai = $u['id_pegawai'];  
?>
<div class="modal fade " id="preview<?= $u['id_pengajuan_kasbon'] ?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Pembayaran Kasbon</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?= base_url('bayar-pengajuan-kasbon/'.$u['id_pengajuan_kasbon']) ?>" method="POST">
      <div class="modal-body">
        <?php 
          $data_pegawai = $this->db->query("SELECT id_pegawai_qc as id, id_pegawai, kasbon, tgl_cair FROM tb_pegawai_qc where id_pegawai='$id_pegawai' AND kasbon != 0 AND id_pengajuan_kasbon = 0 
          UNION 
          SELECT id_pegawai_cutting as id, id_pegawai, kasbon, tgl_cair FROM tb_pegawai_cutting where id_pegawai='$id_pegawai' AND kasbon != 0 AND id_pengajuan_kasbon = 0 
          UNION 
          SELECT id_pegawai_jahit as id, id_pegawai, kasbon, tgl_cair FROM tb_pegawai_jahit where id_pegawai='$id_pegawai' AND kasbon != 0 AND id_pengajuan_kasbon = 0")->result_array();
        ?>

        <div class="form-group">
          <label>Kasbon</label>
          <select name="data_pegawai" class="form-control" required>
            <option selected disabled>-- Pilih Kasbon --</option>
            <?php 
              foreach ($data_pegawai as $key) { ?>
                <option value="<?= $key['id'] ?>||<?= $key['id_pegawai'] ?>||<?= $key['kasbon'] ?>||<?= $key['tgl_cair'] ?>" <?= set_value('data_pegawai') == $key['id'] ? 'selected' : '' ?>><?= $key['kasbon'] ?> - <?= $key['tgl_cair'] ?></option>
            <?php  }
            ?>
          </select>
          <?= form_error('data_pegawai', '<span class="text-danger small">', '</span>'); ?>
        </div>

        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Bayar</button>
      </div>
      </form>
    </div>
  </div>
</div>
<?php endforeach;?>
<?php $this->load->view('template/footer');?>