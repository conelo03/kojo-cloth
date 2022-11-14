<?php $this->load->view('pelanggan-page/template/header');?>
<?php $this->load->view('pelanggan-page/template/sidebar');?>
<!-- Main Content -->
<div class="main-content" style="padding-top: 100px;">
  <section class="section">
    <div class="section-header">
      <h1>My Survey</h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Home</a></div>
        <div class="breadcrumb-item"><a href="#">My Survey</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="card">
        <div class="card-header">
          <h4>Data Survey</h4>
          <div class="card-header-action">
            <a href="<?= base_url('tambah-survey-pelanggan');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
          </div>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped" id="datatables-user">
              <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th>Nama</th>
                  <th>Tgl Survey</th>
                  <th class="text-center" style="width: 250px;">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no = 1; 
                foreach($survey as $u):?>
                <tr>
                  <td class="text-center"><?= $no++;?></td>
                  <td><?= $u['nama_pelanggan'];?></td>
                  <td><?= $u['tanggal_survey'];?></td>
                  <td class="text-center">
                    <a href="<?= base_url('edit-survey-pelanggan/'.$u['id_survey']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                    <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-survey-pelanggan/'.$u['id_survey']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                  </td>
                </tr>
                <?php endforeach;?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('pelanggan-page/template/footer');?>