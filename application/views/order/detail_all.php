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
              <h4>Detail Order <?= $order['nama_produk'] ?></h4>
            </div>
            <div class="card-body">
              <h5>Overview</h5>
              <br>
              <div class="row">
                <div class="col-md-4"><h6>Tgl Order</h6></div>
                <div class="col-md-8"><h6>: <?= $order['tgl_order'] ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Nama Pelanggan</h6></div>
                <div class="col-md-8"><h6>: <?= $order['nama_pelanggan'] ?> (<?= $order['no_telepon'] ?>)</h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Instansi</h6></div>
                <div class="col-md-8"><h6>: <?= $order['instansi'] ?> </h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Produk</h6></div>
                <div class="col-md-8"><h6>: <?= $order['nama_produk'] ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Jumlah Order</h6></div>
                <div class="col-md-8">
                  <table width="100%" border="1">
                    <tr>
                      <th class="text-center">Ukuran</th>
                      <th class="text-center">Lengan Pendek</th>
                      <th class="text-center">Lengan Panjang</th>
                    </tr>
                    <tr>
                      <th class="text-center">S</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_s'] ?> pcs</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_s_p'] ?> pcs</th>
                    </tr>
                    <tr>
                      <th class="text-center">M</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_m'] ?> pcs</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_m_p'] ?> pcs</th>
                    </tr>
                    <tr>
                      <th class="text-center">L</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_l'] ?> pcs</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_l_p'] ?> pcs</th>
                    </tr>
                    <tr>
                      <th class="text-center">XL</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_xl'] ?> pcs</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_xl_p'] ?> pcs</th>
                    </tr>
                    <tr>
                      <th class="text-center">XXL</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_xxl'] ?> pcs</th>
                      <th class="text-center"><?= $order['jumlah_ukuran_xxl_p'] ?> pcs</th>
                    </tr>
                    <tr>
                      <th class="text-center">TOTAL</th>
                      <th class="text-center" colspan="2"><?= $jumlah_order ?> </th>
                    </tr>
                  </table>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Nama Marketing</h6></div>
                <div class="col-md-8"><h6>: <?= $order['nama'] ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Catatan</h6></div>
                <div class="col-md-8"><h6>: <?= $order['catatan'] ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Status</h6></div>
                <div class="col-md-8"><h6>: <?= status($order['status_order']) ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Created At</h6></div>
                <div class="col-md-8"><h6>: <?= $order['created_at'] ?></h6></div>
              </div>
              <div class="row">
                <div class="col-md-4"><h6>Design Order</h6></div>
                <div class="col-md-8">
                  <h6>: 
                    <?php if (empty($order['design_order'])) {
                      echo "Tidak ada gambar.";
                    } else { ?>
                    <img src="<?= base_url('assets/upload/design_order/'.$order['design_order']) ?>" class="img" style="width: 100%"/>
                    <?php } ?>
                  </h6>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>