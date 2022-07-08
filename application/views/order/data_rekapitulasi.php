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
              <h4>Data Riwayat Order</h4>
              <div class="card-header-action">
              </div>
            </div>
            <div class="card-body">
              <form action="<?= base_url('rekapitulasi-order'); ?>" method="post">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Pilih Bulan</label>
                    <select name="month" class="form-control" required>
                      <option selected disabled>-- Pilih Bulan --</option>
                      <?php 
                        foreach ($month as $key) { ?>
                          <option value="<?= $key['tgl1'] ?>" <?= $month_c == $key['tgl1'] ? 'selected' : '' ?>><?= $key['tgl'] ?></option>
                      <?php  }
                      ?>
                    </select>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>&nbsp;</label><br>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-filter"></i> Filter</button>
                  </div>
                </div>
              </form>
              <div class="table-responsive">
                <table class="table table-striped" id="">
                  <thead>
                    <tr>
                      <th class="text-center">#</th>
                      <th>Instansi</th>
                      <th>Jas</th>
                      <th>Jaket</th>
                      <th>Kemeja</th>
                      <th>Kaos</th>
                      <th>Sweater</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 1; 
                    foreach($order as $u):
                    ?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['instansi'];?></td>
                      <td><?= $u['jas'];?></td>
                      <td><?= $u['jaket'];?></td>
                      <td><?= $u['kemeja'];?></td>
                      <td><?= $u['kaos'];?></td>
                      <td><?= $u['sweater'];?></td>
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
    <?php
      $c_c1 = [0, 0, 286, 0, 0];
      $c_c2 = [0, 92, 0, 32, 0];
      $c_c3 = [17, 0, 8, 0, 0];
    ?>
    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>Iterasi 1</h4>
              <div class="card-header-action">
                <a class="btn btn-success" href="<?php echo base_url('rekapitulasi-order-next')?>"><span class="fa fa-sync"></span> Proses Selanjutnya</a>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="">
                  <thead>
                    <tr>
                      <th class="text-center" rowspan="2">#</th>
                      <th rowspan="2">Instansi</th>
                      <th class="text-center" colspan="5">Jumlah Penjualan Produk</th>
                      <th class="text-center" colspan="5">C1</th>
                      <th class="text-center" colspan="5">C2</th>
                      <th class="text-center" colspan="5">C3</th>
                    </tr>
                    <tr>
                      <th>Jas</th>
                      <th>Jaket</th>
                      <th>Kemeja</th>
                      <th>Kaos</th>
                      <th>Sweater</th>
                      <?php for ($i=0; $i < count($c_c1); $i++) { ?>
                        <th><?= $c_c1[$i] ?></th>
                      <?php } ?>
                      <?php for ($i=0; $i < count($c_c2); $i++) { ?>
                        <th><?= $c_c2[$i] ?></th>
                      <?php } ?>
                      <?php for ($i=0; $i < count($c_c3); $i++) { ?>
                        <th><?= $c_c3[$i] ?></th>
                      <?php } ?>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $c1a = $c_c1[0];
                    $c1b = $c_c1[1];
                    $c1c = $c_c1[2];
                    $c1d = $c_c1[3];
                    $c1e = $c_c1[4];
                    
                    $c2a = $c_c2[0];
                    $c2b = $c_c2[1];
                    $c2c = $c_c2[2];
                    $c2d = $c_c2[3];
                    $c2e = $c_c2[4];
                    
                    $c3a = $c_c3[0];
                    $c3b = $c_c3[1];
                    $c3c = $c_c3[2];
                    $c3d = $c_c3[3];
                    $c3e = $c_c3[4];

                    $this->db->query('TRUNCATE table tb_centroid_temp');
                    $this->db->query('TRUNCATE table tb_hasil_centroid');
                    $this->db->query('TRUNCATE table tb_hasil_klasterisasi');

                    $no = 1; 
                    $x = 0;
                    foreach($order as $u):
                      $hc1 = sqrt(pow(($u['jas']-$c1a),2)+pow(($u['jaket']-$c1b),2)+pow(($u['kemeja']-$c1c),2)+pow(($u['kaos']-$c1d),2)+pow(($u['sweater']-$c1e),2));
                      $hc2 = sqrt(pow(($u['jas']-$c2a),2)+pow(($u['jaket']-$c2b),2)+pow(($u['kemeja']-$c2c),2)+pow(($u['kaos']-$c2d),2)+pow(($u['sweater']-$c2e),2));
                      $hc3 = sqrt(pow(($u['jas']-$c3a),2)+pow(($u['jaket']-$c3b),2)+pow(($u['kemeja']-$c3c),2)+pow(($u['kaos']-$c3d),2)+pow(($u['sweater']-$c3e),2));
                      $hc = [$hc1, $hc2, $hc3];
                      $min_hc = min($hc);
                      $arr_c = [
                        'iterasi' => 1,
                        'c1' => $hc1 == $min_hc ? 1 : 0,
                        'c2' => $hc2 == $min_hc ? 1 : 0,
                        'c3' => $hc3 == $min_hc ? 1 : 0
                      ];
                      $arr_c1[$x] = $hc1 == $min_hc ? 1 : 0;
                      $arr_c2[$x] = $hc2 == $min_hc ? 1 : 0;
                      $arr_c3[$x] = $hc3 == $min_hc ? 1 : 0;

                      $arr_c1_temp[$x] = $u['jas'];
                      $arr_c2_temp[$x] = $u['jaket'];
                      $arr_c3_temp[$x] = $u['kemeja'];
                      $arr_c4_temp[$x] = $u['kaos'];
                      $arr_c5_temp[$x] = $u['sweater'];
                      $x++;
                      $this->db->insert('tb_centroid_temp', $arr_c);
                    ?>
                    <tr>
                      <td class="text-center"><?= $no++;?></td>
                      <td><?= $u['instansi'];?></td>
                      <td><?= $u['jas'];?></td>
                      <td><?= $u['jaket'];?></td>
                      <td><?= $u['kemeja'];?></td>
                      <td><?= $u['kaos'];?></td>
                      <td><?= $u['sweater'];?></td>
                      <td class="text-center" colspan="5" bgcolor="<?= $hc1 == $min_hc ? '#FFFF00' : '' ?>">
                        <?= $hc1; ?>
                      </td>
                      <td class="text-center" colspan="5" bgcolor="<?= $hc2 == $min_hc ? '#FFFF00' : '' ?>">
                        <?= $hc2; ?>
                      </td>
                      <td class="text-center" colspan="5" bgcolor="<?= $hc3 == $min_hc ? '#FFF00' : '' ?>">
                        <?= $hc3; ?>
                      </td>
                    </tr>
                    <?php endforeach;?>
                  </tbody>
                </table>
              </div>
              <?php
              
                $arr1 = $arr2 = $arr3 = $arr4 = $arr5 = $arr6 = $arr7 = $arr8 = $arr9 = $arr10 = $arr11 = $arr12 = $arr13 = $arr14 = $arr15 = [];
                $jum1 = $jum2 = $jum3 = $jum4 = $jum5 = $jum6 = $jum7 = $jum8 = $jum9 = $jum10 = $jum11 = $jum12 = $jum13 = $jum14 = $jum15 = 0;
                for ($i=0; $i < count($arr_c1); $i++) { 
                  $arr1[$i] = $arr_c1_temp[$i]*$arr_c1[$i];
                  if($arr_c1[$i]==1)
                  {
                    $jum1++;
                  }

                  $arr2[$i] = $arr_c2_temp[$i]*$arr_c1[$i];
                  if($arr_c1[$i]==1)
                  {
                    $jum2++;
                  }

                  $arr3[$i] = $arr_c3_temp[$i]*$arr_c1[$i];
                  if($arr_c1[$i]==1)
                  {
                    $jum3++;
                  }

                  $arr4[$i] = $arr_c4_temp[$i]*$arr_c1[$i];
                  if($arr_c1[$i]==1)
                  {
                    $jum4++;
                  }

                  $arr5[$i] = $arr_c5_temp[$i]*$arr_c1[$i];
                  if($arr_c1[$i]==1)
                  {
                    $jum5++;
                  }

                  //c2
                  $arr6[$i] = $arr_c1_temp[$i]*$arr_c2[$i];
                  if($arr_c2[$i]==1)
                  {
                    $jum6++;
                  }

                  $arr7[$i] = $arr_c2_temp[$i]*$arr_c2[$i];
                  if($arr_c2[$i]==1)
                  {
                    $jum7++;
                  }

                  $arr8[$i] = $arr_c3_temp[$i]*$arr_c2[$i];
                  if($arr_c2[$i]==1)
                  {
                    $jum8++;
                  }

                  $arr9[$i] = $arr_c4_temp[$i]*$arr_c2[$i];
                  if($arr_c2[$i]==1)
                  {
                    $jum9++;
                  }

                  $arr10[$i] = $arr_c5_temp[$i]*$arr_c2[$i];
                  if($arr_c2[$i]==1)
                  {
                    $jum10++;
                  }

                  //c3
                  $arr11[$i] = $arr_c1_temp[$i]*$arr_c3[$i];
                  if($arr_c3[$i]==1)
                  {
                    $jum11++;
                  }

                  $arr12[$i] = $arr_c2_temp[$i]*$arr_c3[$i];
                  if($arr_c3[$i]==1)
                  {
                    $jum12++;
                  }

                  $arr13[$i] = $arr_c3_temp[$i]*$arr_c3[$i];
                  if($arr_c3[$i]==1)
                  {
                    $jum13++;
                  }

                  $arr14[$i] = $arr_c4_temp[$i]*$arr_c3[$i];
                  if($arr_c3[$i]==1)
                  {
                    $jum14++;
                  }

                  $arr15[$i] = $arr_c5_temp[$i]*$arr_c3[$i];
                  if($arr_c3[$i]==1)
                  {
                    $jum15++;
                  }

                }
                if($jum1==0){
                  $c1a_b = 0;
                }else{
                  $c1a_b = array_sum($arr1)/$jum1;
                }

                if($jum2==0){
                  $c1b_b = 0;
                }else{
                  $c1b_b = array_sum($arr2)/$jum2;
                }

                if($jum3==0){
                  $c1c_b = 0;
                }else{
                  $c1c_b = array_sum($arr3)/$jum3;
                }

                if($jum4==0){
                  $c1d_b = 0;
                }else{
                  $c1d_b = array_sum($arr4)/$jum4;
                }

                if($jum5==0){
                  $c1e_b = 0;
                }else{
                  $c1e_b = array_sum($arr5)/$jum5;
                }
                
                //c2
                if($jum6==0){
                  $c2a_b = 0;
                }else{
                  $c2a_b = array_sum($arr6)/$jum6;
                }

                if($jum7==0){
                  $c2b_b = 0;
                }else{
                  $c2b_b = array_sum($arr7)/$jum7;
                }

                if($jum8==0){
                  $c2c_b = 0;
                }else{
                  $c2c_b = array_sum($arr8)/$jum8;
                }

                if($jum9==0){
                  $c2d_b = 0;
                }else{
                  $c2d_b = array_sum($arr9)/$jum9;
                }

                if($jum10==0){
                  $c2e_b = 0;
                }else{
                  $c2e_b = array_sum($arr10)/$jum10;
                }

                //c3
                if($jum11==0){
                  $c3a_b = 0;
                }else{
                  $c3a_b = array_sum($arr11)/$jum11;
                }

                if($jum12==0){
                  $c3b_b = 0;
                }else{
                  $c3b_b = array_sum($arr12)/$jum12;
                }

                if($jum13==0){
                  $c3c_b = 0;
                }else{
                  $c3c_b = array_sum($arr13)/$jum13;
                }

                if($jum14==0){
                  $c3d_b = 0;
                }else{
                  $c3d_b = array_sum($arr14)/$jum14;
                }

                if($jum15==0){
                  $c3e_b = 0;
                }else{
                  $c3e_b = array_sum($arr15)/$jum15;
                }

                $data = [
                  'c1a' => $c1a_b,
                  'c1b' => $c1b_b,
                  'c1c' => $c1c_b,
                  'c1d' => $c1d_b,
                  'c1e' => $c1e_b,
                  'c2a' => $c2a_b,
                  'c2b' => $c2b_b,
                  'c2c' => $c2c_b,
                  'c2d' => $c2d_b,
                  'c2e' => $c2e_b,
                  'c3a' => $c3a_b,
                  'c3b' => $c3b_b,
                  'c3c' => $c3c_b,
                  'c3d' => $c3d_b,
                  'c3e' => $c3e_b,
                ];

                $this->db->insert('tb_hasil_centroid', $data);
              ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('template/footer');?>