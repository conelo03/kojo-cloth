<?php $this->load->view('pelanggan-page/template/header');?>
<?php 
  if($this->session->userdata('login_pelanggan') == TRUE){
    $this->load->view('pelanggan-page/template/sidebar');
  }else{
    $this->load->view('pelanggan-page/template/sidebar_nolog');
  }
?>
<!-- Main Content -->
<div class="main-content" style="padding-top: 100px;">
  <section class="section">
    <div class="section-header">
      <h1>Ulasan Order</h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Home</a></div>
        <div class="breadcrumb-item"><a href="#">Ulasan Order</a></div>
      </div>
    </div>

    <div class="section-body">
      <div class="card">
        <div class="card-header">
          <h4>Data Riwayat Order</h4>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped" id="datatables-user">
              <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th>Produk</th>
                  <th>Terjual</th>
                  <th>Ulasan</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no = 1; 
                foreach($order as $u):?>
                <tr>
                  <td class="text-center"><?= $no++;?></td>
                  <td><?= $u['nama_produk'];?></td>
                  <td><?= $u['terjual'];?></td>
                  <td>
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
                    ?>
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