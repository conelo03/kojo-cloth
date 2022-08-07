<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cashflow extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if($this->session->userdata('login') != TRUE)
		{
			set_pesan('Silahkan login terlebih dahulu', false);
			redirect('administrator');
		}
		date_default_timezone_set("Asia/Jakarta");
		$this->load->library('upload');
	}

	public function index()
	{
		$post_m = $this->input->post('month');
    $data['title']		= 'Cash Flow';
		$data['pemasukan'] = $this->db->select_sum('jumlah')->get('tb_pemasukan')->row_array();
		$data['pengeluaran'] = $this->db->select_sum('jumlah')->get('tb_pengeluaran')->row_array();
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}
		$data['month_c'] = $month;
		$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan UNION SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pengeluaran GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
		$data['cash']		= $this->db->query("SELECT tanggal as tgl, keterangan as ket, referensi as ref, jumlah as pemasukan, '' as pengeluaran 
		FROM tb_pemasukan 
		WHERE tanggal like '$month%'
		UNION 
		SELECT tanggal as tgl, keterangan as ket, referensi as ref, '' as pemasukan, jumlah as pengeluaran 
		FROM tb_pengeluaran 
		WHERE tanggal like '$month%'
		order by tgl ASC")->result_array();
		$this->load->view('cashflow/data', $data);
	}

	public function laporan()
	{
		$post_m = $this->input->post('month');
		$mode = $this->input->post('mode');
    $data['title']		= 'Laporan Cash Flow';
		$data['pemasukan'] = $this->db->select_sum('jumlah')->get('tb_pemasukan')->row_array();
		$data['pengeluaran'] = $this->db->select_sum('jumlah')->get('tb_pengeluaran')->row_array();
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}
		if($mode == 'cetak'){
			$data['month_c'] = $month;
			$data['title']		= 'Laporan Cash Flow';
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan UNION SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pengeluaran GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['cash']		= $this->db->query("SELECT tanggal as tgl, keterangan as ket, referensi as ref, jumlah as pemasukan, '' as pengeluaran 
			FROM tb_pemasukan 
			WHERE tanggal like '$month%'
			UNION 
			SELECT tanggal as tgl, keterangan as ket, referensi as ref, '' as pemasukan, jumlah as pengeluaran 
			FROM tb_pengeluaran 
			WHERE tanggal like '$month%'
			order by tgl ASC")->result_array();
			$this->load->library('pdf');
			$html_content = $this->load->view('cashflow/cetak_laporan', $data, true);
			$filename = 'Laporan Cash Flow - '.date('F Y', strtotime($month)).' .pdf';

			$this->pdf->loadHtml($html_content);

			$this->pdf->set_paper('a4','potrait');
			
			$this->pdf->render();
			$this->pdf->stream($filename, ['Attachment' => 1]);
			//$this->load->view('cashflow/cetak_laporan', $data);
			
		}else{
			$data['month_c'] = $month;
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan UNION SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pengeluaran GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['cash']		= $this->db->query("SELECT tanggal as tgl, keterangan as ket, referensi as ref, jumlah as pemasukan, '' as pengeluaran 
			FROM tb_pemasukan 
			WHERE tanggal like '$month%'
			UNION 
			SELECT tanggal as tgl, keterangan as ket, referensi as ref, '' as pemasukan, jumlah as pengeluaran 
			FROM tb_pengeluaran 
			WHERE tanggal like '$month%'
			order by tgl ASC")->result_array();
			$this->load->view('cashflow/laporan', $data);
		}
	}

	public function laporan_laba_rugi()
	{
		$post_m = $this->input->post('month');
		$mode = $this->input->post('mode');
    $data['title']		= 'Laporan Laba Rugi';
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}
		if($mode == 'cetak'){
			$data['month_c'] = $month;
			$data['title']		= 'Laporan Laba Rugi';
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan UNION SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pengeluaran GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['penjualan']	= $this->db->query("SELECT sum(jumlah) as jumlah FROM tb_pemasukan WHERE id_jenis_pemasukan=1")->row_array();
			$data['hpp']	= $this->db->query("SELECT sum(jumlah) as jumlah FROM tb_pengeluaran WHERE id_jenis_pengeluaran=1")->row_array();
			$data['beban']	= $this->db->query("SELECT tb_jenis_pengeluaran.jenis_pengeluaran, sum(tb_pengeluaran.jumlah) as jumlah FROM tb_pengeluaran, tb_jenis_pengeluaran WHERE tb_pengeluaran.id_jenis_pengeluaran=tb_jenis_pengeluaran.id_jenis_pengeluaran AND tb_pengeluaran.id_jenis_pengeluaran != 1 AND tanggal like '$month%' GROUP BY tb_pengeluaran.id_jenis_pengeluaran")->result_array();
			$this->load->library('pdf');
			$html_content = $this->load->view('cashflow/cetak_laporan_laba_rugi', $data, true);
			$filename = 'Laporan Laba Rugi Per - '.date('F Y', strtotime($month)).' .pdf';

			$this->pdf->loadHtml($html_content);

			$this->pdf->set_paper('a4','potrait');
			
			$this->pdf->render();
			$this->pdf->stream($filename, ['Attachment' => 1]);
			//$this->load->view('cashflow/cetak_laporan', $data);
			
		}else{
			$data['month_c'] = $month;
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan UNION SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pengeluaran GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['penjualan']	= $this->db->query("SELECT sum(jumlah) as jumlah FROM tb_pemasukan WHERE id_jenis_pemasukan=1")->row_array();
			$data['hpp']	= $this->db->query("SELECT sum(jumlah) as jumlah FROM tb_pengeluaran WHERE id_jenis_pengeluaran=1")->row_array();
			$data['beban']	= $this->db->query("SELECT tb_jenis_pengeluaran.jenis_pengeluaran, sum(tb_pengeluaran.jumlah) as jumlah FROM tb_pengeluaran, tb_jenis_pengeluaran WHERE tb_pengeluaran.id_jenis_pengeluaran=tb_jenis_pengeluaran.id_jenis_pengeluaran AND tb_pengeluaran.id_jenis_pengeluaran != 1 AND tanggal like '$month%' GROUP BY tb_pengeluaran.id_jenis_pengeluaran")->result_array();

			$this->load->view('cashflow/laporan_laba_rugi', $data);
		}
	}
}
