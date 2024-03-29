<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'HomePelanggan';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['home-pelanggan']				= 'HomePelanggan';
$route['detail-produk-pelanggan/(:any)']				= 'HomePelanggan/produk/$1';
$route['ulasan-pelanggan']				= 'HomePelanggan/ulasan';
$route['registrasi-pelanggan']				= 'HomePelanggan/registrasi';

//pelanggan
$route['login-pelanggan'] 				= 'LoginPelanggan/proses';
$route['logout-pelanggan'] 				= 'LoginPelanggan/logout';
$route['dashboard-pelanggan']				= 'DashboardPelanggan';

$route['detail-produk/(:any)']				= 'HomePelanggan/produk/$1';
$route['profile-pelanggan/(:any)']				= 'DashboardPelanggan/profile/$1';
$route['password-pelanggan/(:any)']				= 'DashboardPelanggan/password/$1';
$route['my-order'] 	        = 'DashboardPelanggan/order';
$route['riwayat-order-pelanggan'] 	        = 'DashboardPelanggan/riwayat_order';
$route['tambah-order-pelanggan/(:any)'] 	        = 'DashboardPelanggan/tambah_order/$1';
$route['tambah-order-pelanggan'] 	        = 'DashboardPelanggan/tambah_order';
$route['edit-order-pelanggan/(:any)'] 	    = 'DashboardPelanggan/edit_order/$1';
$route['hapus-order-pelanggan/(:any)']    	= 'DashboardPelanggan/hapus_order/$1';
$route['ulasan-order/(:any)']    	= 'DashboardPelanggan/ulasan_order/$1';

$route['my-survey'] 	        = 'DashboardPelanggan/survey';
$route['tambah-survey-pelanggan'] 	        = 'DashboardPelanggan/tambah_survey';
$route['edit-survey-pelanggan/(:any)'] 	    = 'DashboardPelanggan/edit_survey/$1';
$route['hapus-survey-pelanggan/(:any)']    	= 'DashboardPelanggan/hapus_survey/$1';

// pegawai
$route['administrator'] 				= 'Login';
$route['login'] 				= 'Login/proses';
$route['logout'] 				= 'Login/logout';
$route['dashboard']				= 'Dashboard';

//admin
$route['pegawai'] 				    = 'Pegawai';
$route['tambah-pegawai'] 	        = 'Pegawai/tambah';
$route['tambah-pegawai-modal'] 		= 'Pegawai/tambah_modal';
$route['edit-pegawai/(:any)'] 	    = 'Pegawai/edit/$1';
$route['hapus-pegawai/(:any)']    	= 'Pegawai/hapus/$1';
$route['profile'] 	       			= 'Pegawai/profile';
$route['setting']			   		= 'Pegawai/setting';

$route['akun'] 				    = 'Akun';
$route['tambah-akun'] 	        = 'Akun/tambah';
$route['edit-akun/(:any)'] 	    = 'Akun/edit/$1';
$route['hapus-akun/(:any)']    	= 'Akun/hapus/$1';

$route['produk'] 				    = 'Produk';
$route['tambah-produk'] 	        = 'Produk/tambah';
$route['edit-produk/(:any)'] 	    = 'Produk/edit/$1';
$route['hapus-produk/(:any)']    	= 'Produk/hapus/$1';

$route['vendor'] 				    = 'Vendor';
$route['tambah-vendor'] 	        = 'Vendor/tambah';
$route['edit-vendor/(:any)'] 	    = 'Vendor/edit/$1';
$route['hapus-vendor/(:any)']    	= 'Vendor/hapus/$1';

$route['upah-produksi'] 				    = 'Upah_produksi';
$route['tambah-upah-produksi'] 	        = 'Upah_produksi/tambah';
$route['aktif-upah-produksi/(:any)'] 	    = 'Upah_produksi/aktif/$1';

$route['detail-vendor/(:any)'] 				    = 'Vendor/detail/$1';
$route['tambah-detail-vendor/(:any)'] 	        = 'Vendor/tambah_detail/$1';
$route['edit-detail-vendor/(:any)/(:any)'] 	    = 'Vendor/edit_detail/$1/$2';
$route['hapus-detail-vendor/(:any)/(:any)']    	= 'Vendor/hapus_detail/$1/$2';

$route['pelanggan'] 				    = 'Pelanggan';
$route['tambah-pelanggan'] 	        = 'Pelanggan/tambah';
$route['edit-pelanggan/(:any)'] 	    = 'Pelanggan/edit/$1';
$route['hapus-pelanggan/(:any)']    	= 'Pelanggan/hapus/$1';

$route['rekening'] 				    = 'Rekening';
$route['tambah-rekening'] 	        = 'Rekening/tambah';
$route['edit-rekening/(:any)'] 	    = 'Rekening/edit/$1';
$route['hapus-rekening/(:any)']    	= 'Rekening/hapus/$1';

$route['jenis-pemasukan'] 				    = 'Jenis_pemasukan';
$route['tambah-jenis-pemasukan'] 	        = 'Jenis_pemasukan/tambah';
$route['edit-jenis-pemasukan/(:any)'] 	    = 'Jenis_pemasukan/edit/$1';
$route['hapus-jenis-pemasukan/(:any)']    	= 'Jenis_pemasukan/hapus/$1';

$route['jenis-pengeluaran'] 				    = 'Jenis_pengeluaran';
$route['tambah-jenis-pengeluaran'] 	        = 'Jenis_pengeluaran/tambah';
$route['edit-jenis-pengeluaran/(:any)'] 	    = 'Jenis_pengeluaran/edit/$1';
$route['hapus-jenis-pengeluaran/(:any)']    	= 'Jenis_pengeluaran/hapus/$1';

$route['order'] 				    = 'Order';
$route['all-order'] 	        = 'Order/all';
$route['confirm-order/(:any)']		= 'Order/confirm/$1';
$route['detail-all-order/(:any)']		= 'Order/detail_all/$1';
$route['tambah-order'] 	        = 'Order/tambah';
$route['edit-order/(:any)'] 	    = 'Order/edit/$1';
$route['hapus-order/(:any)']    	= 'Order/hapus/$1';
$route['detail-order/(:any)']		= 'Order/detail/$1';
$route['cetak-order/(:any)']		= 'Order/cetak/$1';
$route['riwayat-order']		= 'Order/riwayat';
$route['ulasan-order']		= 'Order/ulasan';
$route['laporan-order']		= 'Order/laporan';
$route['cetak-bom-list/(:any)']		= 'Order/cetak_bom_list/$1';

$route['rekapitulasi-order'] = 'Order/klasterisasi_new';

$route['agenda'] 				    = 'Agenda';
$route['tambah-agenda'] 	        = 'Agenda/tambah';
$route['edit-agenda/(:any)'] 	    = 'Agenda/edit/$1';
$route['hapus-agenda/(:any)']    	= 'Agenda/hapus/$1';

$route['detail-agenda/(:any)'] 				    = 'Agenda/detail/$1';
$route['tambah-detail-agenda/(:any)'] 	        = 'Agenda/tambah_detail/$1';
$route['edit-detail-agenda/(:any)/(:any)'] 	    = 'Agenda/edit_detail/$1/$2';
$route['hapus-detail-agenda/(:any)/(:any)']    	= 'Agenda/hapus_detail/$1/$2';

$route['survey'] 				    = 'Agenda/survey';
$route['detail-survey/(:any)'] 				    = 'Agenda/detail_survey/$1';

$route['pemasukan'] 				    = 'Pemasukan';
$route['tambah-pemasukan'] 	        = 'Pemasukan/tambah';
$route['edit-pemasukan/(:any)'] 	    = 'Pemasukan/edit/$1';
$route['hapus-pemasukan/(:any)']    	= 'Pemasukan/hapus/$1';
$route['laporan-pemasukan'] 	        = 'Pemasukan/laporan';

$route['pengeluaran'] 				    = 'Pengeluaran';
$route['tambah-pengeluaran'] 	        = 'Pengeluaran/tambah';
$route['edit-pengeluaran/(:any)'] 	    = 'Pengeluaran/edit/$1';
$route['hapus-pengeluaran/(:any)']    	= 'Pengeluaran/hapus/$1';
$route['laporan-pengeluaran'] 	        = 'Pengeluaran/laporan';

$route['cash-flow'] 				    = 'Cashflow';
$route['laporan-cash-flow'] 				    = 'Cashflow/laporan';

$route['laporan-laba-rugi'] 				    = 'Cashflow/laporan_laba_rugi';

$route['gaji'] 				    = 'Gaji';
$route['tambah-gaji'] 	        = 'Gaji/tambah';
$route['edit-gaji/(:any)'] 	    = 'Gaji/edit/$1';
$route['hapus-gaji/(:any)']    	= 'Gaji/hapus/$1';
$route['approve-gaji/(:any)']    	= 'Gaji/approve/$1';
$route['posting-gaji/(:any)']    	= 'Gaji/posting/$1';
$route['detail-gaji/(:any)']    	= 'Gaji/detail/$1';
$route['tambah-detail-gaji/(:any)'] 	        = 'Gaji/tambah_detail/$1';
$route['edit-detail-gaji/(:any)/(:any)'] 	    = 'Gaji/edit_detail/$1/$2';
$route['hapus-detail-gaji/(:any)/(:any)']    	= 'Gaji/hapus_detail/$1/$2';
$route['cetak-slip-gaji/(:any)']    	= 'Gaji/cetak_slip/$1';

$route['gaji-produksi'] 				    = 'Gaji_produksi';
$route['tambah-gaji-produksi'] 	        = 'Gaji_produksi/tambah';
$route['edit-gaji-produksi/(:any)'] 	    = 'Gaji_produksi/edit/$1';
$route['hapus-gaji-produksi/(:any)']    	= 'Gaji_produksi/hapus/$1';
$route['generate-gaji-produksi/(:any)']    	= 'Gaji_produksi/generate/$1';
$route['approve-gaji-produksi/(:any)']    	= 'Gaji_produksi/approve/$1';
$route['posting-gaji-produksi/(:any)']    	= 'Gaji_produksi/posting/$1';
$route['detail-gaji-produksi/(:any)']    	= 'Gaji_produksi/detail/$1';
$route['detail-gaji-by-pegawai/(:any)/(:any)'] = 'Gaji_produksi/detail_gaji/$1/$2';
$route['cetak-slip-gaji-produksi/(:any)/(:any)'] = 'Gaji_produksi/cetak_slip/$1/$2';

$route['pengajuan'] 				    = 'Pengajuan';
$route['tambah-pengajuan'] 	        = 'Pengajuan/tambah';
$route['edit-pengajuan/(:any)'] 	    = 'Pengajuan/edit/$1';
$route['hapus-pengajuan/(:any)']    	= 'Pengajuan/hapus/$1';
$route['posting-pengajuan/(:any)']    	= 'Pengajuan/posting/$1';
$route['approve-pengajuan/(:any)']    	= 'Pengajuan/approve/$1';

$route['pengajuan-hpp'] 				    = 'Pengajuan_hpp';
$route['tambah-pengajuan-hpp'] 	        = 'Pengajuan_hpp/tambah';
$route['edit-pengajuan-hpp/(:any)'] 	    = 'Pengajuan_hpp/edit/$1';
$route['hapus-pengajuan-hpp/(:any)']    	= 'Pengajuan_hpp/hapus/$1';
$route['ajukan-pengajuan-hpp/(:any)']    	= 'Pengajuan_hpp/ajukan/$1';
$route['batal-pengajuan-hpp/(:any)']    	= 'Pengajuan_hpp/batal/$1';
$route['posting-pengajuan-hpp/(:any)']    	= 'Pengajuan_hpp/posting/$1';
$route['approve-pengajuan-hpp/(:any)']    	= 'Pengajuan_hpp/approve/$1';

$route['pengajuan-kasbon'] 				    = 'Pengajuan_kasbon';
$route['tambah-pengajuan-kasbon'] 	        = 'Pengajuan_kasbon/tambah';
$route['edit-pengajuan-kasbon/(:any)'] 	    = 'Pengajuan_kasbon/edit/$1';
$route['hapus-pengajuan-kasbon/(:any)']    	= 'Pengajuan_kasbon/hapus/$1';
$route['posting-pengajuan-kasbon/(:any)']    	= 'Pengajuan_kasbon/posting/$1';
$route['approve-pengajuan-kasbon/(:any)']    	= 'Pengajuan_kasbon/approve/$1';
$route['bayar-pengajuan-kasbon/(:any)']    	= 'Pengajuan_kasbon/bayar/$1';
$route['detail-pengajuan-kasbon/(:any)']    	= 'Pengajuan_kasbon/detail/$1';

$route['detail-pengajuan-hpp/(:any)'] 				    = 'Pengajuan_hpp/detail/$1';
$route['tambah-detail-pengajuan-hpp/(:any)'] 	        = 'Pengajuan_hpp/tambah_detail/$1';
$route['edit-detail-pengajuan-hpp/(:any)/(:any)'] 	    = 'Pengajuan_hpp/edit_detail/$1/$2';
$route['hapus-detail-pengajuan-hpp/(:any)/(:any)']    	= 'Pengajuan_hpp/hapus_detail/$1/$2';

$route['pendapatan-order'] 				    = 'Pendapatan_order';
$route['tambah-pendapatan-order'] 	        = 'Pendapatan_order/tambah';
$route['edit-pendapatan-order/(:any)'] 	    = 'Pendapatan_order/edit/$1';
$route['hapus-pendapatan-order/(:any)']    	= 'Pendapatan_order/hapus/$1';
$route['posting-pendapatan-order/(:any)']    	= 'Pendapatan_order/posting/$1';
$route['approve-pendapatan-order/(:any)']    	= 'Pendapatan_order/approve/$1';