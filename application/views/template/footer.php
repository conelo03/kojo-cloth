      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2020 <div class="bullet"></div> <a href="#">Stisla</a>
        </div>
        <div class="footer-right">
          Version 1.1
        </div>
      </footer>
    </div>
  </div>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="<?= base_url(); ?>assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="<?= base_url(); ?>assets/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<?= base_url(); ?>assets/vendor/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="<?= base_url(); ?>assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url().'assets/vendor/izitoast/js/iziToast.min.js'?>"></script>

  <!-- Template JS File -->
  <script src="<?= base_url(); ?>assets/js/scripts.js"></script>
  <script src="<?= base_url(); ?>assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="<?= base_url(); ?>assets/js/page/index-0.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      
      $("#select-pegawai").change(function(){ 
      
        $.ajax({
          type: "POST", 
          url: "<?= base_url("Pegawai/get_gaji"); ?>", 
          data: {id_pegawai : $("#select-pegawai").val()}, 
          async : true,
          dataType: "JSON",
          success: function(res) {
            console.log(res);
            if(res.response === true){
              document.getElementById("gaji_pokok").setAttribute('value', res.data.gaji_pokok);
              document.getElementById("rekening_pegawai").setAttribute('value', res.data.rekening_pegawai);
              $('#item-error').html('');
            } else {
              $('#item-error').html('Item tidak ditemukan!');
              document.getElementById("gaji_pokok").setAttribute('value', '');
              document.getElementById("rekening_pegawai").setAttribute('value', '');
            }
          }, 
        });
      });

      $("#select-order").change(function(){ 
      
        $.ajax({
          type: "POST", 
          url: "<?= base_url("Pendapatan_order/get_order"); ?>", 
          data: {id_order : $("#select-order").val()}, 
          async : true,
          dataType: "JSON",
          success: function(res) {
            console.log(res);
            if(res.response === true){
              document.getElementById("keterangan").setAttribute('value',res.data.keterangan);
              $('#item-error').html('');
            } else {
              $('#item-error').html('Item tidak ditemukan!');
              document.getElementById("keterangan").setAttribute('value', '');
            }
          }, 
        });
      });

      // $("#select-detail-vendor").hide();

      $("#select-vendor").change(function(){ 
        
        $.ajax({
          type: "POST", 
          url: "<?= base_url("Vendor/get_katalog"); ?>", 
          data: {id_vendor : $("#select-vendor").val()}, 
          async : true,
          dataType: "JSON",
          success: function(res) {
            if(res.response === true){
              $("#select-detail-vendor").html(res.data_katalog.data).show();
              document.getElementById("satuan").setAttribute('value', '');
              document.getElementById("harga").setAttribute('value', '');
            } else {
              $('#item-error').html('Katalog tidak ditemukan!');
            }
          }, 
        });
      });

      $("#select-detail-vendor").change(function(){ 
        
        $.ajax({
          type: "POST", 
          url: "<?= base_url("Vendor/get_detail_katalog"); ?>", 
          data: {id_detail_vendor : $("#select-detail-vendor").val()}, 
          async : true,
          dataType: "JSON",
          success: function(res) {
            if(res.response === true){
              document.getElementById("satuan").setAttribute('value',res.data.satuan);
              document.getElementById("harga").setAttribute('value',res.data.harga);
              $('#jumlah-item').html('Masukan Jumlah!').show();
            } else {
              $('#item-error').html('Katalog tidak ditemukan!');
            }
          }, 
        });
      });

      $("#select-jenis-produk").change(function(){ 
        $("#kain").html('');
        $("#kancing").html('');
        $("#resleting").html('');
        $("#prepet").html('');
        $("#rib").html('');
        var val = $(this).val();
        let arr_val = val.split("||");
        let arr_keb = arr_val[1].split(",");

        if(arr_keb.includes('kain')){
          $("#kain").html('<h6>Kebutuhan Kain :</h6><div class="row"><div class="col-md-6"><h6 class="text-center">Lengan Pendek</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s" class="form-control" value="<?= set_value('pnj_kain_s', 0); ?>" required=""><?= form_error('pnj_kain_s', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m" class="form-control" value="<?= set_value('pnj_kain_m', 0); ?>" required=""><?= form_error('pnj_kain_m', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l" class="form-control" value="<?= set_value('pnj_kain_l', 0); ?>" required=""><?= form_error('pnj_kain_l', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl" class="form-control" value="<?= set_value('pnj_kain_xl', 0); ?>" required=""><?= form_error('pnj_kain_xl', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl" class="form-control" value="<?= set_value('pnj_kain_xxl', 0); ?>" required=""><?= form_error('pnj_kain_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="col-md-6"><h6 class="text-center">Lengan Panjang</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s_p" class="form-control" value="<?= set_value('pnj_kain_s_p', 0); ?>" required=""><?= form_error('pnj_kain_s_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m_p" class="form-control" value="<?= set_value('pnj_kain_m_p', 0); ?>" required=""><?= form_error('pnj_kain_m_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l_p" class="form-control" value="<?= set_value('pnj_kain_l_p', 0); ?>" required=""><?= form_error('pnj_kain_l_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl_p" class="form-control" value="<?= set_value('pnj_kain_xl_p', 0); ?>" required=""><?= form_error('pnj_kain_xl_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl_p" class="form-control" value="<?= set_value('pnj_kain_xxl_p', 0); ?>" required=""><?= form_error('pnj_kain_xxl_p', '<span class="text-danger small">', '</span>'); ?></div></div>                  </div><div class="row"><div class="col-md-12 form-group"><label>Harga Kain per Meter</label><input type="text" name="harga_kain" class="form-control" value="<?= set_value('harga_kain', 0); ?>" required=""><?= form_error('harga_kain', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('kancing')){
          $("#kancing").html('<h6>Kebutuhan Kancing :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran S</label><input type="text" name="jml_kancing_s" class="form-control" value="<?= set_value('jml_kancing_s', 0); ?>" required=""><?= form_error('jml_kancing_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XL</label><input type="text" name="jml_kancing_xl" class="form-control" value="<?= set_value('jml_kancing_xl', 0); ?>" required=""><?= form_error('jml_kancing_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran M</label><input type="text" name="jml_kancing_m" class="form-control" value="<?= set_value('jml_kancing_m', 0); ?>" required=""><?= form_error('jml_kancing_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XXL</label><input type="text" name="jml_kancing_xxl" class="form-control" value="<?= set_value('jml_kancing_xxl', 0); ?>" required=""><?= form_error('jml_kancing_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran L</label><input type="text" name="jml_kancing_l" class="form-control" value="<?= set_value('jml_kancing_l', 0); ?>" required=""><?= form_error('jml_kancing_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Kancing Satuan</label><input type="text" name="harga_kancing" class="form-control" value="<?= set_value('harga_kancing', 0); ?>" required=""><?= form_error('harga_kancing', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('resleting')){
          $("#resleting").html('<h6>Kebutuhan Resleting :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran S</label><input type="text" name="pnj_resleting_s" class="form-control" value="<?= set_value('pnj_resleting_s', 0); ?>" required=""><?= form_error('pnj_resleting_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XL</label><input type="text" name="pnj_resleting_xl" class="form-control" value="<?= set_value('pnj_resleting_xl', 0); ?>" required=""><?= form_error('pnj_resleting_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran M</label><input type="text" name="pnj_resleting_m" class="form-control" value="<?= set_value('pnj_resleting_m', 0); ?>" required=""><?= form_error('pnj_resleting_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XXL</label><input type="text" name="pnj_resleting_xxl" class="form-control" value="<?= set_value('pnj_resleting_xxl', 0); ?>" required=""><?= form_error('pnj_resleting_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran L</label><input type="text" name="pnj_resleting_l" class="form-control" value="<?= set_value('pnj_resleting_l', 0); ?>" required=""><?= form_error('pnj_resleting_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Resleting per Meter</label><input type="text" name="harga_resleting" class="form-control" value="<?= set_value('harga_resleting', 0); ?>" required=""><?= form_error('harga_resleting', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('prepet')){
          $("#prepet").html('<h6>Kebutuhan Prepet :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran S</label><input type="text" name="jml_prepet_s" class="form-control" value="<?= set_value('jml_prepet_s', 0); ?>" required=""><?= form_error('jml_prepet_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XL</label><input type="text" name="jml_prepet_xl" class="form-control" value="<?= set_value('jml_prepet_xl', 0); ?>" required=""><?= form_error('jml_prepet_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran M</label><input type="text" name="jml_prepet_m" class="form-control" value="<?= set_value('jml_prepet_m', 0); ?>" required=""><?= form_error('jml_prepet_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XXL</label><input type="text" name="jml_prepet_xxl" class="form-control" value="<?= set_value('jml_prepet_xxl', 0); ?>" required=""><?= form_error('jml_prepet_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran L</label><input type="text" name="jml_prepet_l" class="form-control" value="<?= set_value('jml_prepet_l', 0); ?>" required=""><?= form_error('jml_prepet_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Prepet Satuan</label><input type="text" name="harga_prepet" class="form-control" value="<?= set_value('harga_prepet', 0); ?>" required=""><?= form_error('harga_prepet', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('rib')){
          $("#rib").html('<h6>Kebutuhan Rib :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran S</label><input type="text" name="pnj_rib_s" class="form-control" value="<?= set_value('pnj_rib_s', 0); ?>" required=""><?= form_error('pnj_rib_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XL</label><input type="text" name="pnj_rib_xl" class="form-control" value="<?= set_value('pnj_rib_xl', 0); ?>" required=""><?= form_error('pnj_rib_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran M</label><input type="text" name="pnj_rib_m" class="form-control" value="<?= set_value('pnj_rib_m', 0); ?>" required=""><?= form_error('pnj_rib_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XXL</label><input type="text" name="pnj_rib_xxl" class="form-control" value="<?= set_value('pnj_rib_xxl', 0); ?>" required=""><?= form_error('pnj_rib_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran L</label><input type="text" name="pnj_rib_l" class="form-control" value="<?= set_value('pnj_rib_l', 0); ?>" required=""><?= form_error('pnj_rib_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Rib per Meter</label><input type="text" name="harga_rib" class="form-control" value="<?= set_value('harga_rib', 0); ?>" required=""><?= form_error('harga_rib', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }
        
      });

    });

    <?php if(isset($produk_segment)): ?>
    $(document).ready( function () {
      let val = $("#select-jenis-produk-edit").val();
      // $("#kain").html('');
      // $("#kancing").html('');
      // $("#resleting").html('');
      // $("#prepet").html('');
      // $("#rib").html('');
      // var val = $(this).val();
      let arr_val = val.split("||");
      let arr_keb = arr_val[1].split(",");

      if(arr_keb.includes('kain')){
        $("#kain").html('<h6>Kebutuhan Kain :</h6><div class="row"><div class="col-md-6"><h6 class="text-center">Lengan Pendek</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s" class="form-control" value="<?= set_value('pnj_kain_s', $produk['pnj_kain_s']); ?>" required=""><?= form_error('pnj_kain_s', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m" class="form-control" value="<?= set_value('pnj_kain_m', $produk['pnj_kain_m']); ?>" required=""><?= form_error('pnj_kain_m', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l" class="form-control" value="<?= set_value('pnj_kain_l', $produk['pnj_kain_l']); ?>" required=""><?= form_error('pnj_kain_l', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl" class="form-control" value="<?= set_value('pnj_kain_xl', $produk['pnj_kain_xl']); ?>" required=""><?= form_error('pnj_kain_xl', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl" class="form-control" value="<?= set_value('pnj_kain_xxl', $produk['pnj_kain_xxl']); ?>" required=""><?= form_error('pnj_kain_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="col-md-6"><h6 class="text-center">Lengan Panjang</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s_p" class="form-control" value="<?= set_value('pnj_kain_s_p', $produk['pnj_kain_s_p']); ?>" required=""><?= form_error('pnj_kain_s_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m_p" class="form-control" value="<?= set_value('pnj_kain_m_p', $produk['pnj_kain_m_p']); ?>" required=""><?= form_error('pnj_kain_m_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l_p" class="form-control" value="<?= set_value('pnj_kain_l_p', $produk['pnj_kain_l_p']); ?>" required=""><?= form_error('pnj_kain_l_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl_p" class="form-control" value="<?= set_value('pnj_kain_xl_p', $produk['pnj_kain_xl_p']); ?>" required=""><?= form_error('pnj_kain_xl_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl_p" class="form-control" value="<?= set_value('pnj_kain_xxl_p', $produk['pnj_kain_xxl_p']); ?>" required=""><?= form_error('pnj_kain_xxl_p', '<span class="text-danger small">', '</span>'); ?></div></div>                  </div><div class="row"><div class="col-md-12 form-group"><label>Harga Kain per Meter</label><input type="text" name="harga_kain" class="form-control" value="<?= set_value('harga_kain', $produk['harga_kain']); ?>" required=""><?= form_error('harga_kain', '<span class="text-danger small">', '</span>'); ?></div></div>');
      }

      if(arr_keb.includes('kancing')){
        $("#kancing").html('<h6>Kebutuhan Kancing :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran S</label><input type="text" name="jml_kancing_s" class="form-control" value="<?= set_value('jml_kancing_s', $produk['jml_kancing_s']); ?>" required=""><?= form_error('jml_kancing_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XL</label><input type="text" name="jml_kancing_xl" class="form-control" value="<?= set_value('jml_kancing_xl', $produk['jml_kancing_xl']); ?>" required=""><?= form_error('jml_kancing_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran M</label><input type="text" name="jml_kancing_m" class="form-control" value="<?= set_value('jml_kancing_m', $produk['jml_kancing_m']); ?>" required=""><?= form_error('jml_kancing_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XXL</label><input type="text" name="jml_kancing_xxl" class="form-control" value="<?= set_value('jml_kancing_xxl', $produk['jml_kancing_xxl']); ?>" required=""><?= form_error('jml_kancing_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran L</label><input type="text" name="jml_kancing_l" class="form-control" value="<?= set_value('jml_kancing_l', $produk['jml_kancing_l']); ?>" required=""><?= form_error('jml_kancing_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Kancing Satuan</label><input type="text" name="harga_kancing" class="form-control" value="<?= set_value('harga_kancing', $produk['harga_kancing']); ?>" required=""><?= form_error('harga_kancing', '<span class="text-danger small">', '</span>'); ?></div></div>');
      }

      if(arr_keb.includes('resleting')){
        $("#resleting").html('<h6>Kebutuhan Resleting :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran S</label><input type="text" name="pnj_resleting_s" class="form-control" value="<?= set_value('pnj_resleting_s', $produk['pnj_resleting_s']); ?>" required=""><?= form_error('pnj_resleting_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XL</label><input type="text" name="pnj_resleting_xl" class="form-control" value="<?= set_value('pnj_resleting_xl', $produk['pnj_resleting_xl']); ?>" required=""><?= form_error('pnj_resleting_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran M</label><input type="text" name="pnj_resleting_m" class="form-control" value="<?= set_value('pnj_resleting_m', $produk['pnj_resleting_m']); ?>" required=""><?= form_error('pnj_resleting_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XXL</label><input type="text" name="pnj_resleting_xxl" class="form-control" value="<?= set_value('pnj_resleting_xxl', $produk['pnj_resleting_xxl']); ?>" required=""><?= form_error('pnj_resleting_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran L</label><input type="text" name="pnj_resleting_l" class="form-control" value="<?= set_value('pnj_resleting_l', $produk['pnj_resleting_l']); ?>" required=""><?= form_error('pnj_resleting_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Resleting per Meter</label><input type="text" name="harga_resleting" class="form-control" value="<?= set_value('harga_resleting', $produk['harga_resleting']); ?>" required=""><?= form_error('harga_resleting', '<span class="text-danger small">', '</span>'); ?></div></div>');
      }

      if(arr_keb.includes('prepet')){
        $("#prepet").html('<h6>Kebutuhan Prepet :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran S</label><input type="text" name="jml_prepet_s" class="form-control" value="<?= set_value('jml_prepet_s', $produk['jml_prepet_s']); ?>" required=""><?= form_error('jml_prepet_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XL</label><input type="text" name="jml_prepet_xl" class="form-control" value="<?= set_value('jml_prepet_xl', $produk['jml_prepet_xl']); ?>" required=""><?= form_error('jml_prepet_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran M</label><input type="text" name="jml_prepet_m" class="form-control" value="<?= set_value('jml_prepet_m', $produk['jml_prepet_m']); ?>" required=""><?= form_error('jml_prepet_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XXL</label><input type="text" name="jml_prepet_xxl" class="form-control" value="<?= set_value('jml_prepet_xxl', $produk['jml_prepet_xxl']); ?>" required=""><?= form_error('jml_prepet_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran L</label><input type="text" name="jml_prepet_l" class="form-control" value="<?= set_value('jml_prepet_l', $produk['jml_prepet_l']); ?>" required=""><?= form_error('jml_prepet_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Prepet Satuan</label><input type="text" name="harga_prepet" class="form-control" value="<?= set_value('harga_prepet', $produk['harga_prepet']); ?>" required=""><?= form_error('harga_prepet', '<span class="text-danger small">', '</span>'); ?></div></div>');
      }

      if(arr_keb.includes('rib')){
        $("#rib").html('<h6>Kebutuhan Rib :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran S</label><input type="text" name="pnj_rib_s" class="form-control" value="<?= set_value('pnj_rib_s', $produk['pnj_rib_s']); ?>" required=""><?= form_error('pnj_rib_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XL</label><input type="text" name="pnj_rib_xl" class="form-control" value="<?= set_value('pnj_rib_xl', $produk['pnj_rib_xl']); ?>" required=""><?= form_error('pnj_rib_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran M</label><input type="text" name="pnj_rib_m" class="form-control" value="<?= set_value('pnj_rib_m', $produk['pnj_rib_m']); ?>" required=""><?= form_error('pnj_rib_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XXL</label><input type="text" name="pnj_rib_xxl" class="form-control" value="<?= set_value('pnj_rib_xxl', $produk['pnj_rib_xxl']); ?>" required=""><?= form_error('pnj_rib_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran L</label><input type="text" name="pnj_rib_l" class="form-control" value="<?= set_value('pnj_rib_l', $produk['pnj_rib_l']); ?>" required=""><?= form_error('pnj_rib_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Rib per Meter</label><input type="text" name="harga_rib" class="form-control" value="<?= set_value('harga_rib', $produk['harga_rib']); ?>" required=""><?= form_error('harga_rib', '<span class="text-danger small">', '</span>'); ?></div></div>');
      }

      $("#select-jenis-produk-edit").change(function(){ 
        $("#kain").html('');
        $("#kancing").html('');
        $("#resleting").html('');
        $("#prepet").html('');
        $("#rib").html('');
        var val = $(this).val();
        let arr_val = val.split("||");
        let arr_keb = arr_val[1].split(",");
        console.log("ini");

        if(arr_keb.includes('kain')){
          $("#kain").html('<h6>Kebutuhan Kain :</h6><div class="row"><div class="col-md-6"><h6 class="text-center">Lengan Pendek</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s" class="form-control" value="<?= set_value('pnj_kain_s', $produk['pnj_kain_s']); ?>" required=""><?= form_error('pnj_kain_s', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m" class="form-control" value="<?= set_value('pnj_kain_m', $produk['pnj_kain_m']); ?>" required=""><?= form_error('pnj_kain_m', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l" class="form-control" value="<?= set_value('pnj_kain_l', $produk['pnj_kain_l']); ?>" required=""><?= form_error('pnj_kain_l', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl" class="form-control" value="<?= set_value('pnj_kain_xl', $produk['pnj_kain_xl']); ?>" required=""><?= form_error('pnj_kain_xl', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl" class="form-control" value="<?= set_value('pnj_kain_xxl', $produk['pnj_kain_xxl']); ?>" required=""><?= form_error('pnj_kain_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="col-md-6"><h6 class="text-center">Lengan Panjang</h6><div class="form-group"><label>Panjang Kain ukuran S (meter)</label><input type="text" name="pnj_kain_s_p" class="form-control" value="<?= set_value('pnj_kain_s_p', $produk['pnj_kain_s_p']); ?>" required=""><?= form_error('pnj_kain_s_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran M (meter)</label><input type="text" name="pnj_kain_m_p" class="form-control" value="<?= set_value('pnj_kain_m_p', $produk['pnj_kain_m_p']); ?>" required=""><?= form_error('pnj_kain_m_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran L (meter)</label><input type="text" name="pnj_kain_l_p" class="form-control" value="<?= set_value('pnj_kain_l_p', $produk['pnj_kain_l_p']); ?>" required=""><?= form_error('pnj_kain_l_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XL (meter)</label><input type="text" name="pnj_kain_xl_p" class="form-control" value="<?= set_value('pnj_kain_xl_p', $produk['pnj_kain_xl_p']); ?>" required=""><?= form_error('pnj_kain_xl_p', '<span class="text-danger small">', '</span>'); ?></div><div class="form-group"><label>Panjang Kain ukuran XXL (meter)</label><input type="text" name="pnj_kain_xxl_p" class="form-control" value="<?= set_value('pnj_kain_xxl_p', $produk['pnj_kain_xxl_p']); ?>" required=""><?= form_error('pnj_kain_xxl_p', '<span class="text-danger small">', '</span>'); ?></div></div>                  </div><div class="row"><div class="col-md-12 form-group"><label>Harga Kain per Meter</label><input type="text" name="harga_kain" class="form-control" value="<?= set_value('harga_kain', $produk['harga_kain']); ?>" required=""><?= form_error('harga_kain', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('kancing')){
          $("#kancing").html('<h6>Kebutuhan Kancing :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran S</label><input type="text" name="jml_kancing_s" class="form-control" value="<?= set_value('jml_kancing_s', $produk['jml_kancing_s']); ?>" required=""><?= form_error('jml_kancing_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XL</label><input type="text" name="jml_kancing_xl" class="form-control" value="<?= set_value('jml_kancing_xl', $produk['jml_kancing_xl']); ?>" required=""><?= form_error('jml_kancing_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran M</label><input type="text" name="jml_kancing_m" class="form-control" value="<?= set_value('jml_kancing_m', $produk['jml_kancing_m']); ?>" required=""><?= form_error('jml_kancing_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran XXL</label><input type="text" name="jml_kancing_xxl" class="form-control" value="<?= set_value('jml_kancing_xxl', $produk['jml_kancing_xxl']); ?>" required=""><?= form_error('jml_kancing_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Kancing ukuran L</label><input type="text" name="jml_kancing_l" class="form-control" value="<?= set_value('jml_kancing_l', $produk['jml_kancing_l']); ?>" required=""><?= form_error('jml_kancing_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Kancing Satuan</label><input type="text" name="harga_kancing" class="form-control" value="<?= set_value('harga_kancing', $produk['harga_kancing']); ?>" required=""><?= form_error('harga_kancing', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('resleting')){
          $("#resleting").html('<h6>Kebutuhan Resleting :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran S</label><input type="text" name="pnj_resleting_s" class="form-control" value="<?= set_value('pnj_resleting_s', $produk['pnj_resleting_s']); ?>" required=""><?= form_error('pnj_resleting_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XL</label><input type="text" name="pnj_resleting_xl" class="form-control" value="<?= set_value('pnj_resleting_xl', $produk['pnj_resleting_xl']); ?>" required=""><?= form_error('pnj_resleting_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran M</label><input type="text" name="pnj_resleting_m" class="form-control" value="<?= set_value('pnj_resleting_m', $produk['pnj_resleting_m']); ?>" required=""><?= form_error('pnj_resleting_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Resleting ukuran XXL</label><input type="text" name="pnj_resleting_xxl" class="form-control" value="<?= set_value('pnj_resleting_xxl', $produk['pnj_resleting_xxl']); ?>" required=""><?= form_error('pnj_resleting_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Resleting ukuran L</label><input type="text" name="pnj_resleting_l" class="form-control" value="<?= set_value('pnj_resleting_l', $produk['pnj_resleting_l']); ?>" required=""><?= form_error('pnj_resleting_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Resleting per Meter</label><input type="text" name="harga_resleting" class="form-control" value="<?= set_value('harga_resleting', $produk['harga_resleting']); ?>" required=""><?= form_error('harga_resleting', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('prepet')){
          $("#prepet").html('<h6>Kebutuhan Prepet :</h6><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran S</label><input type="text" name="jml_prepet_s" class="form-control" value="<?= set_value('jml_prepet_s', $produk['jml_prepet_s']); ?>" required=""><?= form_error('jml_prepet_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XL</label><input type="text" name="jml_prepet_xl" class="form-control" value="<?= set_value('jml_prepet_xl', $produk['jml_prepet_xl']); ?>" required=""><?= form_error('jml_prepet_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran M</label><input type="text" name="jml_prepet_m" class="form-control" value="<?= set_value('jml_prepet_m', $produk['jml_prepet_m']); ?>" required=""><?= form_error('jml_prepet_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran XXL</label><input type="text" name="jml_prepet_xxl" class="form-control" value="<?= set_value('jml_prepet_xxl', $produk['jml_prepet_xxl']); ?>" required=""><?= form_error('jml_prepet_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Jumlah Prepet ukuran L</label><input type="text" name="jml_prepet_l" class="form-control" value="<?= set_value('jml_prepet_l', $produk['jml_prepet_l']); ?>" required=""><?= form_error('jml_prepet_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Prepet Satuan</label><input type="text" name="harga_prepet" class="form-control" value="<?= set_value('harga_prepet', $produk['harga_prepet']); ?>" required=""><?= form_error('harga_prepet', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }

        if(arr_keb.includes('rib')){
          $("#rib").html('<h6>Kebutuhan Rib :</h6><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran S</label><input type="text" name="pnj_rib_s" class="form-control" value="<?= set_value('pnj_rib_s', $produk['pnj_rib_s']); ?>" required=""><?= form_error('pnj_rib_s', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XL</label><input type="text" name="pnj_rib_xl" class="form-control" value="<?= set_value('pnj_rib_xl', $produk['pnj_rib_xl']); ?>" required=""><?= form_error('pnj_rib_xl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran M</label><input type="text" name="pnj_rib_m" class="form-control" value="<?= set_value('pnj_rib_m', $produk['pnj_rib_m']); ?>" required=""><?= form_error('pnj_rib_m', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Panjang Rib ukuran XXL</label><input type="text" name="pnj_rib_xxl" class="form-control" value="<?= set_value('pnj_rib_xxl', $produk['pnj_rib_xxl']); ?>" required=""><?= form_error('pnj_rib_xxl', '<span class="text-danger small">', '</span>'); ?></div></div><div class="row"><div class="col-md-6 form-group"><label>Panjang Rib ukuran L</label><input type="text" name="pnj_rib_l" class="form-control" value="<?= set_value('pnj_rib_l', $produk['pnj_rib_l']); ?>" required=""><?= form_error('pnj_rib_l', '<span class="text-danger small">', '</span>'); ?></div><div class="col-md-6 form-group"><label>Harga Rib per Meter</label><input type="text" name="harga_rib" class="form-control" value="<?= set_value('harga_rib', $produk['harga_rib']); ?>" required=""><?= form_error('harga_rib', '<span class="text-danger small">', '</span>'); ?></div></div>');
        }
        
      });
        
    });
    <?php endif; ?>

    $(document).ready( function () {
      $('#datatables-user').DataTable({
        "ordering": false,
      });
      $('#datatables-cutting').DataTable({
        "ordering": false,
      });
      $('#datatables-jahit').DataTable({
        "ordering": false,
      });
      $('#datatables-qc').DataTable({
        "ordering": false,
      });
      $('#datatables-pegawai').DataTable({
        "ordering": false,
      });
      $('#datatables-jabatan').DataTable({
        "ordering": false,
      });
      $('#datatables-bidang').DataTable({
        "ordering": false,
      });
      $('#datatables-golongan').DataTable({
        "ordering": false,
      });
      $('#datatables-cuti').DataTable({
        "ordering": false,
      });
      $('#datatables-izin').DataTable({
        "ordering": false,
      });
      $('#select-pegawai').selectpicker({
        search : true,
      });
      $('#select-produk').selectpicker({
        search : true,
      });
      $('#select-pelanggan').selectpicker({
        search : true,
      });
      $('#select-jabatan').selectpicker({
        search : true,
      });
      $('#select-atasan').selectpicker({
        search : true,
      });
      $('#select-pejabat').selectpicker({
        search : true,
      });
      $('#select-order').selectpicker({
        search : true,
      });
      
    });

  </script>
  <?php if($this->session->flashdata('msg')=='success'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil disimpan!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='iterasi-selesai'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Iterasi Selesai!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='confirm'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data telah dikonfirmasi!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='lunas'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Barang telah Lunas!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='error'):?>
    <script type="text/javascript">
      iziToast.error({
          title: 'Gagal!',
          message: 'Data gagal disimpan!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='edit'):?>
    <script type="text/javascript">
      iziToast.info({
          title: 'Sukses!',
          message: 'Data berhasil diedit!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='hapus'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil dihapus!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='generate'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil digenerate!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='posting'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil diposting!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='password-salah'):?>
    <script type="text/javascript">
      iziToast.error({
          title: 'Gagal!',
          message: 'Password Lama Salah!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='verifikasi'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil diverifikasi!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='ajukan'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil Diajukan!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='update-status'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Data berhasil diupdate!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='error-stock'):?>
    <script type="text/javascript">
      iziToast.error({
          title: 'Gagal!',
          message: 'Stock tidak cukup!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php elseif($this->session->flashdata('msg')=='berhasil-bayar'):?>
    <script type="text/javascript">
      iziToast.success({
          title: 'Sukses!',
          message: 'Pembayaran berhasil!',
          position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
      });
    </script>
  <?php endif; ?>
</body>
</html>
