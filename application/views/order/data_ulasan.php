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
              <h4>Data Ulasan Order per Produk</h4>
              <div class="card-header-action">
              </div>
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
                              if ($i <= round($u['rate'])) {?>
                                <span class="fa fa-star" style="color: orange"></span>
                              <?php } else { ?>
                                <span class="fa fa-star"></span>
                              <?php }
                            }
                          }
                        ?>
                        <?php
                          if ($u['rate'] != 0 || $u['rate'] != NULL) {
                            $rate = round($u['rate']);
                            switch ($rate) {
                              case 1:
                                echo "(Buruk)";
                                break;
                              case 2:
                                echo "(Kurang)";
                                break;
                              case 3:
                                echo "(Cukup)";
                                break;
                              case 4:
                                echo "(Baik)";
                                break;
                              case 5:
                                echo "(Sangat Baik)";
                                break;
                              default:
                                echo '';
                                break;
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
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>