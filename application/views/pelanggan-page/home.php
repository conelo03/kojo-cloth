<?php $this->load->view('pelanggan-page/template/header');?>
<?php $this->load->view('pelanggan-page/template/sidebar_nolog');?>
<!-- Main Content -->
<div class="main-content" style="padding-top: 100px;">
  <section class="section">
    <div class="section-header">
      <h1>Produk</h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Home</a></div>
        <div class="breadcrumb-item"><a href="#">Produk</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <?php foreach ($produk as $p) { 
          $this->db->select('count(tb_order.id_order) as terjual');
          $this->db->select_avg('tb_order.rate');
          $this->db->from('tb_order');
          $this->db->join('tb_produk', 'tb_produk.id_produk=tb_order.id_produk');
          $this->db->where('tb_order.status_order', 4);
          $this->db->where('tb_order.id_produk', $p['id_produk']);
          $this->db->group_by('tb_order.id_produk');
          $o = $this->db->get()->row_array();
          //var_dump($o);
        ?>
          <div class="col-12 col-sm-6 col-md-6 col-lg-4">
            <article class="article article-style-b">
              <div class="article-header">
                <div class="article-image" data-background="<?= base_url('assets/upload/foto_produk/'.$p['foto_produk']) ?>">
                <img src="<?= base_url('assets/upload/foto_produk/'.$p['foto_produk']) ?>" width="100%" height="100%" />
                </div>
              </div>
              <div class="article-details">
                <div class="article-title">
                  <h2><a href="#"><?= $p['nama_produk'] ?></a></h2>
                  <?php 
                  if($o) {
                    if ($o['rate'] != 0 || $o['rate'] != NULL) {
                      for ($i=1; $i <= 5; $i++) { 
                        if ($i <= $o['rate']) {?>
                          <span class="fa fa-star" style="color: orange"></span>
                        <?php } else { ?>
                          <span class="fa fa-star"></span>
                        <?php }
                      }
                    } else {
                      echo 'Belum ada rating.';
                    }
                    if ($o['terjual'] != 0 || $o['terjual'] != NULL) {                      
                      echo " (".$o['terjual']." terjual)";
                    } else {
                      echo " (0 terjual)";
                    }
                  } else {
                    echo 'Belum ada rating. (0 terjual)';
                  }
                  ?>
                </div>
                <!-- <p>Rp <?= number_format($p['harga_produk'], 2, '.', ',') ?></p> -->
                <div class="article-cta">
                  <a href="<?= base_url('detail-produk-pelanggan/'.$p['id_produk']) ?>">Check Out <i class="fas fa-chevron-right"></i></a>
                </div>
              </div>
            </article>
          </div>
        <?php } ?>
        
      </div>
    </div>
  </section>
</div>

<?php $this->load->view('pelanggan-page/template/footer');?>