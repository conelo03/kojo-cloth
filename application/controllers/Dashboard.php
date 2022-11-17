<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if($this->session->userdata('login') != TRUE)
		{
			set_pesan('Silahkan login terlebih dahulu', false);
			redirect('administrator');
		}
		date_default_timezone_set("Asia/Jakarta");
	}

	public function index()
	{
		$data['title']	= 'Dashboard';
		$this->db->select('tb_produk.nama_produk, count(tb_order.id_order) as terjual');
		$this->db->from('tb_order');
		$this->db->join('tb_produk', 'tb_produk.id_produk=tb_order.id_produk', 'right');
		$this->db->where('tb_order.status_order', 4);
		$this->db->group_by('tb_order.id_produk');
		$grafik	= $this->db->get()->result_array();
		$arr_jml = [];
		$arr_produk = [];
		foreach ($grafik as $key) {
			array_push($arr_produk, $key['nama_produk']);
			array_push($arr_jml, $key['terjual']);
		}
		$data['pemasukan']		= $this->db->select_sum('jumlah')->from('tb_pemasukan')->get()->row_array();
		$data['pengeluaran']		= $this->db->select_sum('jumlah')->from('tb_pengeluaran')->get()->row_array();
		$data['pengajuan'] = $this->db->get_where('tb_pengajuan', ['status' => 0])->num_rows();
		$data['gaji'] = $this->db->get_where('tb_gaji', ['status' => 0])->num_rows();
		$data['gaji_produksi'] = $this->db->get_where('tb_gaji_produksi', ['status' => 1])->num_rows();
		$this->db->select('*');
		$this->db->from('tb_order');
		$this->db->join('tb_produk', 'tb_produk.id_produk=tb_order.id_produk');
		$this->db->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_order.id_pegawai');
		$this->db->join('tb_pelanggan', 'tb_pelanggan.id_pelanggan=tb_order.id_pelanggan');
		$this->db->where_not_in('tb_order.status_order', 4);
		$this->db->order_by('DATE(tb_order.tgl_order)', 'DESC');
		$data['order']		= $this->db->get()->result_array();
		$tanggal = date('Y-m-d');
		$this->db->select('*');
		$this->db->from('tb_agenda');
		$this->db->where('tanggal_agenda <=', $tanggal);
		$this->db->where('tenggat_agenda >=', $tanggal);
		$data['agenda']		= $this->db->get()->result_array();
		$data['json_terjual'] = json_encode($arr_jml);
		$data['json_produk'] = json_encode($arr_produk);

		$this->db->select_avg('keseluruhan');
		$this->db->select_avg('aspek_tanggal');
		$this->db->select_avg('aspek_lokasi');
		$this->db->select_avg('aspek_sesi');
		$this->db->select_avg('pembicara');
		$this->db->from('tb_survey');
		$survey		= $this->db->get()->row_array();
		$arr_nilai_survey = [$survey['keseluruhan'], $survey['aspek_tanggal'], $survey['aspek_lokasi'], $survey['aspek_sesi'], $survey['pembicara']];
		$arr_label_survey = ['Keseluruhan', 'Aspek Tanggal', 'Aspek Lokasi', 'Aspek Sesi', 'Pembicara'];
		$data['json_nilai_survey'] = json_encode($arr_nilai_survey);
		$data['json_label_survey'] = json_encode($arr_label_survey);
		$this->load->view('dashboard', $data);
	}
}
