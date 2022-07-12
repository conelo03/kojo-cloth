<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pemasukan extends CI_Controller {

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
    $data['title']		= 'Data Pemasukan';
		$data['pemasukan']		= $this->M_pemasukan->get_data()->result_array();
		$this->load->view('pemasukan/data', $data);
	}

	public function laporan()
	{
		$post_m = $this->input->post('month');
		$mode = $this->input->post('mode');
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}
		if($mode == 'cetak'){
			$data['month_c'] = $month;
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['title']		= 'Laporan Pemasukan';
			$data['pemasukan']		= $this->M_pemasukan->get_data($month)->result_array();
			$this->load->library('pdf');
			$html_content = $this->load->view('pemasukan/cetak_laporan', $data, true);
			$filename = 'Laporan Pemasukan - '.date('F Y', strtotime($month)).' .pdf';

			$this->pdf->loadHtml($html_content);

			$this->pdf->set_paper('a4','potrait');
			
			$this->pdf->render();
			$this->pdf->stream($filename, ['Attachment' => 1]);
			//$this->load->view('pemasukan/cetak_laporan', $data);
			
		}else{
			$data['month_c'] = $month;
			$data['month']		= $this->db->query("SELECT DATE_FORMAT(tanggal, '%Y-%m') as tgl1, DATE_FORMAT(tanggal, '%M %Y') as tgl FROM tb_pemasukan GROUP BY DATE_FORMAT(tanggal, '%M %Y') order by tgl1 ASC")->result_array();
			$data['title']		= 'Laporan Pemasukan';
			$data['pemasukan']		= $this->M_pemasukan->get_data($month)->result_array();
			$this->load->view('pemasukan/laporan', $data);
		}
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pemasukan';
			$data['jenis_pemasukan'] = $this->db->get('tb_jenis_pemasukan')->result_array();
			$this->load->view('pemasukan/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pemasukan'			=> $data['id_jenis_pemasukan'],
				'keterangan'			=> $data['keterangan'],
				'referensi'			=> $data['referensi'],
				'jumlah'			=> $data['jumlah'],
			];

			if ($this->M_pemasukan->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-pemasukan');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('pemasukan');
			}
		}
	}

	public function edit($id_pemasukan)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pemasukan';
			$data['jenis_pemasukan'] = $this->db->get('tb_jenis_pemasukan')->result_array();
			$data['pemasukan']	= $this->M_pemasukan->get_by_id($id_pemasukan);
			$this->load->view('pemasukan/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'id_pemasukan' => $id_pemasukan,
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pemasukan'			=> $data['id_jenis_pemasukan'],
				'keterangan'			=> $data['keterangan'],
				'referensi'			=> $data['referensi'],
				'jumlah'			=> $data['jumlah'],
			];
			
			if ($this->M_pemasukan->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-pemasukan/'.$id_pemasukan);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('pemasukan');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required|trim');
		$this->form_validation->set_rules('id_jenis_pemasukan', 'Jenis Pemasukan', 'required|trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
		$this->form_validation->set_rules('referensi', 'Ref', 'required|trim');
		$this->form_validation->set_rules('jumlah', 'Jumlah', 'required|trim');
		
	}

	public function hapus($id_pemasukan)
	{
		$this->M_pemasukan->delete($id_pemasukan);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('pemasukan');
	}
}
