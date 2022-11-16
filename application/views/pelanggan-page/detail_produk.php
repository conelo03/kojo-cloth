<?php $this->load->view('pelanggan-page/template/header');?>
<?php $this->load->view('pelanggan-page/template/sidebar');?>
<!-- Main Content -->
<div class="main-content" style="padding-top: 100px;">
  <section class="section">
    <div class="section-header">
      <h1><?= $produk['nama_produk'] ?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Home</a></div>
        <div class="breadcrumb-item"><a href="#">My Order</a></div>
      </div>
    </div>

    <div class="section-body mt-4">
      <div class="card">
        <div class="card-body">
          <div class="row mb-4">
            <div class="col-12 col-md-4">
              <img src="<?= base_url('assets/upload/foto_produk/'.$produk['foto_produk']) ?>" width="100%" />
            </div>
            <div class="col-12 col-md-6">
              <div class="row">
                <div class="col-12 col-md-12"><h3><?= $produk['nama_produk'] ?></h3></div>
                <div class="col-12 col-md-12"><h6>Jenis : <?= $produk['jenis_produk'] ?></h6></div>
                <div class="col-12 col-md-12"><h6>Bahan : <?= $produk['bahan'] ?></h6></div>
              </div>
            </div>
          </div>
          
          <h4>Ulasan :</h4>
          <div class="row mt-4">
            <div class="col-12 col-md-12">
              <?php foreach ($order as $u) { ?>
                <div class="row">
                  <div class="col-12 col-md-12"><h6><?= $u['nama_pelanggan'] ?></h6></div>
                  <div class="col-12 col-md-12">
                    <?php if ($u['rate'] != 0 && $u['rate'] != NULL && $u['ulasan'] != NULL ) { ?>
                    <?php 
                      if ($u['rate'] != 0 || $u['rate'] != NULL) {
                        for ($i=1; $i <= 5; $i++) { 
                          if ($i <= $u['rate']) {?>
                            <span class="fa fa-star" style="color: orange"></span>
                          <?php } else { ?>
                            <span class="fa fa-star"></span>
                          <?php }
                        }
                      }
                    } ?>  
                    <br/>
                      
                  </div>
                  <br>
                  <div class="col-12 col-md-12">
                    <h6>
                      <?php 
                        echo $u['ulasan'];
                      ?>
                    </h6>
                  </div>
                </div>
                <hr>
              <?php } ?>
              
            </div>
          </div>
        </div>
        <div class="card-footer text-right">
          <a href="<?= base_url('tambah-order-pelanggan/'.$produk['id_produk']) ?>" class="btn btn-info">Check Out</i></a>
        </div>
      </div>
    </div>
  </section>
</div>

<?php $this->load->view('pelanggan-page/template/footer');?>