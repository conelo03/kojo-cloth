<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Agenda</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Agenda</h4>
              <?php if (is_admin() || is_produksi()) { ?>
                <div class="card-header-action">
                  <a href="<?= base_url('tambah-upah-produksi');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                </div>
              <?php } ?>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Jenis Produk</th>
                      <th>Pekerjaan</th>
                      <th>Upah</th>
                      <th>Status</th>
                      <th>Created By</th>
                      <th>Created At</th>
                      <th class="text-center" style="width: 100px;">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($up as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['jenis_produk'];?></td>
                      <td><?= $u['jenis_pekerjaan'];?></td>
                      <td><?= $u['upah'];?></td>
                      <td><?= $u['status'] == 1 ? 'Aktif' : 'Tidak Aktif';?></td>
                      <td><?= $u['created_by'];?></td>
                      <td><?= $u['created_at'];?></td>
                      <td class="text-center">
                        <?php if ((is_admin() || is_produksi()) && $u['status'] == 0) { ?>
                          <button class="btn btn-success" data-confirm="Anda yakin ingin mengaktifkan data ini?|Data lain yang sejenis akan menjadi tidak aktif." data-confirm-yes="document.location.href='<?= base_url('aktif-upah-produksi/'.$u['id_upah_produksi']); ?>';"><i class="fa fa-check"></i> Aktif</button>
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