<?php
$id_pegawai = $this->session->userdata('id_pegawai');
$get_user = $this->db->get_where('tb_pegawai', ['id_pegawai' => $id_pegawai])->row_array();
$jml_pengajuan = $this->db->get_where('tb_pengajuan', ['status' => 0])->num_rows();
$jml_pengajuan_hpp = $this->db->get_where('tb_pengajuan_hpp', ['status' => 1])->num_rows();
$jml_gaji = $this->db->get_where('tb_gaji', ['status' => 0])->num_rows();
$jml_gaji_produksi = $this->db->get_where('tb_gaji_produksi', ['status' => 1])->num_rows();
?>
  <div id="app">
    <div class="main-wrapper">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <ul class="navbar-nav mr-auto">
          <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
        </ul>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="<?= base_url('assets/img/profile/user.png'); ?>" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block"><?= $get_user['nama'] ?></div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="<?= base_url('setting');?>" class="dropdown-item has-icon">
                <i class="fas fa-cog"></i> Edit Akun
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item has-icon text-danger" data-confirm="Logout|Anda yakin ingin keluar?" data-confirm-yes="document.location.href='<?= base_url('logout'); ?>';"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
          </li>
        </ul>
      </nav>

      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">Kojo Cloth</a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="#">KC</a>
          </div>
          <?php
            $judul = explode(' ', $title);
          ?>
          <ul class="sidebar-menu">
            <li class="menu-header">Menu</li>
            <li class="<?= $title == 'Dashboard' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('dashboard');?>"><i class="fas fa-fire"></i> <span>Dashboard</span></a></li>  

            <li class="<?= $title == 'Profil Pribadi' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('profile');?>"><i class="fas fa-user"></i> <span>Profil Pribadi</span></a></li> 
            
            <?php if(is_admin() || is_marketing() || is_k_marketing() || is_keuangan() || is_produksi()):?>
            <li class="menu-header">Data Master</li>  
            <?php endif;?>

            <?php if(is_admin()):?>      
            <li class="<?= $title == 'Data Pegawai' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pegawai');?>"><i class="fas fa-users"></i> <span>Data Pegawai</span></a></li> 
            <li class="<?= $title == 'Data Akun' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('akun');?>"><i class="fas fa-users"></i> <span>Data Akun</span></a></li> 
            <?php endif;?>

            <?php if(is_admin() || is_produksi()):?>
            <li class="<?= $title == 'Data Produk' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('produk');?>"><i class="fas fa-box"></i> <span>Data Produk</span></a></li> 
            <?php endif;?>

            <?php if(is_admin() || is_marketing() || is_k_marketing()):?>
              <li class="<?= $title == 'Data Pelanggan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pelanggan');?>"><i class="fas fa-users"></i> <span>Data Pelanggan</span></a></li> 
            <?php endif;?>

            <?php if(is_admin() || is_keuangan()):?>
              <li class="<?= $title == 'Data Rekening' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('rekening');?>"><i class="fas fa-building"></i> <span>Data Rekening</span></a></li> 
            <li class="<?= $title == 'Data Jenis Pemasukan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('jenis-pemasukan');?>"><i class="fas fa-download"></i> <span>Data Jenis Pemasukan</span></a></li>
            <li class="<?= $title == 'Data Jenis Pengeluaran' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('jenis-pengeluaran');?>"><i class="fas fa-upload"></i> <span>Data Jenis Pengeluaran</span></a></li> 
            <?php endif;?>


            <li class="menu-header">Data Order</li>   
            <li class="nav-item dropdown <?= $title == 'Order Belum Dikonfirmasi' || $title == 'Data Order' ? 'active' : ''; ?>">
              <a href="#" class="nav-link has-dropdown"><i class="fas fa-cart-plus"></i> <span>Data Order</span></a>
              <ul class="dropdown-menu">
                <li class="<?= $title == 'Order Belum Dikonfirmasi' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('all-order');?>">Order Belum Dikonfirmasi</a></li>
                <li class="<?= $title == 'Data Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('order');?>"><?= is_admin() || is_produksi() || is_owner() || is_keuangan() || is_purchase() ? 'Data Order' : 'My Order' ?></a></li>
              </ul>
            </li> 
            <li class="<?= $title == 'Riwayat Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('riwayat-order');?>"><i class="fas fa-list"></i> <span>Riwayat Order</span></a></li>    
            <li class="<?= $title == 'Ulasan Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('ulasan-order');?>"><i class="fas fa-list"></i> <span>Ulasan Order</span></a></li>    
            
            <?php if(is_admin() || is_k_marketing()):?>  
              <li class="<?= $title == 'Rekapitulasi Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('rekapitulasi-order');?>"><i class="fas fa-calendar"></i> <span>Rekapitulasi Order</span></a></li> 
            <?php endif;?>
            
            <?php if(is_admin() || is_k_marketing() || is_marketing() || is_owner()):?>
            <li class="menu-header">Data Agenda</li>  
            <li class="<?= $title == 'Data Agenda' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('agenda');?>"><i class="fas fa-calendar"></i> <span>Data Agenda</span></a></li>
            <?php endif;?>

            <?php if(is_produksi() || is_marketing() || is_purchase() || is_k_marketing()):?>
            <li class="menu-header">Data Pengajuan</li>    
              <?php if(is_produksi() || is_purchase()):?>
              <li class="<?= $title == 'Data Pengajuan HPP' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan-hpp');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pengajuan HPP</span></a></li>    
              <?php endif;?>
            <li class="<?= $title == 'Data Pengajuan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan');?>"><i class="fas fa-clipboard-check"></i> <span>Pengajuanku</span></a></li> 
            <?php endif;?>


            <?php if(is_keuangan() || is_admin()):?>
            <li class="menu-header">Data Gaji</li>       
            <li class="<?= $title == 'Data Gaji' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('gaji');?>"><i class="fas fa-file-invoice-dollar"></i> <span>Data Gaji</span></a></li> 
            <li class="<?= $title == 'Data Gaji Produksi' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('gaji-produksi');?>"><i class="fas fa-file-invoice-dollar"></i> <span>Data Gaji Produksi</span></a></li> 
            <li class="menu-header">Data Pengajuan</li>
            <li class="<?= $title == 'Data Pengajuan HPP' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan-hpp');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pengajuan HPP</span></a></li> 
            <li class="<?= $title == 'Data Pengajuan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pengajuan</span></a></li> 
            <li class="menu-header">Data Pendapatan</li>
            <li class="<?= $title == 'Data Pendapatan Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pendapatan-order');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pendapatan Order</span></a></li> 
            <li class="menu-header">Data Transaksi</li>
            <li class="<?= $title == 'Data Pemasukan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pemasukan');?>"><i class="fas fa-download"></i> <span>Data Pemasukan</span></a></li> 
            <li class="<?= $title == 'Data Pengeluaran' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengeluaran');?>"><i class="fas fa-upload"></i> <span>Data Pengeluaran</span></a></li> 
            <!-- <li class="<?= $title == 'Cash Flow' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('cash-flow');?>"><i class="fas fa-sync"></i> <span>Cash Flow</span></a></li>       -->
            <?php endif;?>


            <?php if(is_owner()):?>
            <li class="menu-header">Data Gaji</li>       
            <li class="<?= $title == 'Data Gaji' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('gaji');?>"><i class="fas fa-file-invoice-dollar"></i> <span>Data Gaji<?= $jml_gaji == 0 ? '': '<span class="badge badge-warning" style="max-width: 30px;">'.$jml_gaji.'</span>' ?></span></a></li> 
            <li class="<?= $title == 'Data Gaji Produksi' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('gaji-produksi');?>"><i class="fas fa-file-invoice-dollar"></i> <span>Data Gaji Produksi<?= $jml_gaji_produksi == 0 ? '': '<span class="badge badge-warning" style="max-width: 30px;">'.$jml_gaji_produksi.'</span>' ?></span></a></li> 
            <li class="menu-header">Data Pengajuan</li>    
            <li class="<?= $title == 'Data Pengajuan HPP' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan-hpp');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pengajuan HPP<?= $jml_pengajuan_hpp == 0 ? '': '<span class="badge badge-warning" style="max-width: 30px;">'.$jml_pengajuan_hpp.'</span>' ?></span></a></li>       
            <li class="<?= $title == 'Data Pengajuan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pengajuan');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pengajuan<?= $jml_pengajuan == 0 ? '': '<span class="badge badge-warning" style="max-width: 30px;">'.$jml_pengajuan.'</span>' ?></span></a></li> 
            <!-- <li class="menu-header">Data Transaksi</li>
            <li class="<?= $title == 'Cash Flow' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('cash-flow');?>"><i class="fas fa-sync"></i> <span>Cash Flow</span></a></li>       -->
            <?php endif;?>

            <?php if(is_marketing()):?>
            <li class="menu-header">Data Pendapatan</li>
            <li class="<?= $title == 'Data Pendapatan Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('pendapatan-order');?>"><i class="fas fa-clipboard-check"></i> <span>Data Pendapatan Order</span></a></li> 
            <?php endif;?>

            <?php if(is_admin() || is_produksi() || is_keuangan() || is_owner()):?> 
            <li class="menu-header">Laporan</li>  
            <?php endif;?> 
            <?php if(is_admin() || is_produksi() || is_owner()):?>  
              <li class="<?= $title == 'Laporan Order' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('laporan-order');?>"><i class="fas fa-file"></i> <span>Laporan Order</span></a></li> 
            <?php endif;?>   
            <?php if(is_admin() || is_keuangan() || is_owner()):?>  
              <li class="<?= $title == 'Laporan Pemasukan' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('laporan-pemasukan');?>"><i class="fas fa-file"></i> <span>Laporan Pemasukan</span></a></li> 
              <li class="<?= $title == 'Laporan Pengeluaran' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('laporan-pengeluaran');?>"><i class="fas fa-file"></i> <span>Laporan Pengeluaran</span></a></li> 
              <li class="<?= $title == 'Laporan Cash Flow' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('laporan-cash-flow');?>"><i class="fas fa-file"></i> <span>Laporan Cash Flow</span></a></li> 
              <!-- <li class="<?= $title == 'Laporan Laba Rugi' ? 'active' : ''; ?>"><a class="nav-link" href="<?= base_url('laporan-laba-rugi');?>"><i class="fas fa-file"></i> <span>Laporan Laba Rugi</span></a></li>  -->
            <?php endif;?>     

          </ul>

          <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
            <button class="btn btn-danger btn-lg btn-block btn-icon-split" data-confirm="Logout|Anda yakin ingin keluar?" data-confirm-yes="document.location.href='<?= base_url('logout'); ?>';"><i class="fa fa-sign-out-alt"></i> Logout</button>
          </div>
        </aside>
      </div>
      