<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rekening extends CI_Controller {

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
    $data['title']		= 'Data Rekening';
		$data['rekening']	= $this->M_rekening->get_data()->result_array();
		$this->load->view('rekening/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Rekening';
			$this->load->view('rekening/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'nama_rekening'		=> $data['nama_rekening'],
				'no_rekening'		=> $data['no_rekening'],
				'bank'		=> $data['bank'],
			];
			if ($this->M_rekening->insert($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-rekening');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('rekening');
			}
		}
	}

	public function edit($id_rekening)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data rekening';
			$data['rekening']	= $this->M_rekening->get_by_id($id_rekening);
			$this->load->view('rekening/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'id_rekening' => $id_rekening,
				'nama_rekening'		=> $data['nama_rekening'],
				'no_rekening'		=> $data['no_rekening'],
				'bank'		=> $data['bank'],
			];
			
			if ($this->M_rekening->update($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-rekening/'.$id_rekening);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('rekening');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('nama_rekening', 'Nama Rekening', 'required|trim');
		$this->form_validation->set_rules('no_rekening', 'No Rekening', 'required|trim');
		$this->form_validation->set_rules('bank', 'Bank', 'required|trim');
	}

	public function hapus($id_rekening)
	{
		$this->M_rekening->delete($id_rekening);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('rekening');
	}
}
