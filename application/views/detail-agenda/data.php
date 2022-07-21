<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Hasil Kegiatan</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Hasil Kegiatan <?= $a['nama_agenda'] ?></h4>
              <div class="card-header-action">
                <?php if ($tgl_sekarang < $a['tenggat_agenda']) { ?>
                  <a href="<?= base_url('tambah-detail-agenda/'.$id_agenda);?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                <?php } ?>
                
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Hasil Kegiatan</th>
                      <th>Tautan</th>
                      <th>Keterangan</th>
                      <th class="text-center" style="width: 250px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($agenda as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><a href="#" data-toggle="modal" data-target="#preview<?= $u['id_detail_agenda'] ?>"><img src="<?= base_url('assets/upload/foto_agenda/'.$u['foto_agenda']) ?>" width="150px" /></a></td>
                      <td><a href="http://<?= $u['tautan'] ?>" target="_blank"><?= $u['tautan'];?></a></td>
                      <td><?= $u['keterangan'];?></td>
                      <td class="text-center">
                        <?php if ($tgl_sekarang < $a['tenggat_agenda']) { ?>
                          <a href="<?= base_url('edit-detail-agenda/'.$id_agenda.'/'.$u['id_detail_agenda']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                          <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-detail-agenda/'.$id_agenda.'/'.$u['id_detail_agenda']); ?>';"><i class="fa fa-trash"></i> Delete</button>
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

<?php foreach($agenda as $u):?>
<div class="modal fade " id="preview<?= $u['id_detail_agenda'] ?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Hasil Kegiatan</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img src="<?= base_url('assets/upload/foto_agenda/'.$u['foto_agenda']);?>" width="100%" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">Tutup</button>
      </div>
    </div>
  </div>
</div>
<?php endforeach;?>
<?php $this->load->view('template/footer');?>