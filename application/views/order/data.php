<?php $this->load->view('template/header');?>
<?php $this->load->view('template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Order</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Data Order</h4>
              <div class="card-header-action">
                <?php if(is_admin() || is_marketing() || is_k_marketing() || is_produksi()):?> 
                <a href="<?= base_url('tambah-order');?>" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Data</a>
                <?php endif;?>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped" id="datatables-user">
                  <thead>
                    <tr>
                      <th rowspan="2" class="text-center">#</th>
                      <th rowspan="2">Tgl Order</th>
                      <th rowspan="2">Klien</th>
                      <th rowspan="2">Produk</th>
                      <th colspan="2" class="text-center">Jumlah</th>
                      <th rowspan="2">Nama Marketing</th>
                      <th rowspan="2">Status</th>
                      <th rowspan="2">Progres</th>
                      <th rowspan="2" class="text-center" style="width: 250px;">Aksi</th>
                    </tr>
                    <tr>
                      <th class="text-center">Pendek</th>
                      <th class="text-center">Panjang</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($order as $u):?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['tgl_order'];?></td>
                      <td>
                        <?= $u['nama_pelanggan'];?><br>
                        (<?= $u['no_telepon'];?>)<br>
                        <?= $u['instansi'];?><br>
                      </td>
                      <td><?= $u['nama_produk'];?></td>
                      <td>
                        S : <?= $u['jumlah_ukuran_s'];?><br>
                        M : <?= $u['jumlah_ukuran_m'];?><br>
                        L : <?= $u['jumlah_ukuran_l'];?><br>
                        XL : <?= $u['jumlah_ukuran_xl'];?><br>
                        XXL : <?= $u['jumlah_ukuran_xxl'];?>
                      </td>
                      <td>
                        S : <?= $u['jumlah_ukuran_s_p'];?><br>
                        M : <?= $u['jumlah_ukuran_m_p'];?><br>
                        L : <?= $u['jumlah_ukuran_l_p'];?><br>
                        XL : <?= $u['jumlah_ukuran_xl_p'];?><br>
                        XXL : <?= $u['jumlah_ukuran_xxl_p'];?>
                      </td>
                      <td><?= $u['nama'];?></td>
                      <td><?= status($u['status_order']);?></td>
                      <td><?= $u['progres'];?></td>
                      <td class="text-center">
                        <a href="<?= base_url('detail-order/'.$u['id_order']);?>" class="btn btn-light"><i class="fa fa-eye"></i> Detail</a>
                        <?php if(is_admin() || is_marketing() || is_k_marketing() || is_produksi()):?> 
                        <a href="<?= base_url('edit-order/'.$u['id_order']);?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a>
                        <button class="btn btn-danger" data-confirm="Anda yakin ingin menghapus data ini?|Data yang sudah dihapus tidak akan kembali." data-confirm-yes="document.location.href='<?= base_url('hapus-order/'.$u['id_order']); ?>';"><i class="fa fa-trash"></i> Delete</button>
                        <?php endif;?>
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