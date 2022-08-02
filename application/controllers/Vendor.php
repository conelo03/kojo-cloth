<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendor extends CI_Controller {

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
    $data['title']		= 'Data Vendor';
		$data['vendor']	= $this->M_vendor->get_data()->result_array();
		$this->load->view('vendor/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Vendor';
			$this->load->view('vendor/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'nama_vendor'		=> $data['nama_vendor'],
				'alamat_vendor'		=> $data['alamat_vendor'],
				'kontak_vendor'		=> $data['kontak_vendor'],
				'no_rekening_vendor'		=> $data['no_rekening_vendor'],
				'nama_rekening_vendor'		=> $data['nama_rekening_vendor'],
				'bank_vendor'		=> $data['bank_vendor']
			];
			if ($this->M_vendor->insert($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-vendor');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('vendor');
			}
		}
	}

	public function edit($id_vendor)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Vendor';
			$data['vendor']	= $this->M_vendor->get_by_id($id_vendor);
			$this->load->view('vendor/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'id_vendor' => $id_vendor,
				'nama_vendor'		=> $data['nama_vendor'],
				'alamat_vendor'		=> $data['alamat_vendor'],
				'kontak_vendor'		=> $data['kontak_vendor'],
				'no_rekening_vendor'		=> $data['no_rekening_vendor'],
				'nama_rekening_vendor'		=> $data['nama_rekening_vendor'],
				'bank_vendor'		=> $data['bank_vendor']
			];
			
			if ($this->M_vendor->update($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-vendor/'.$id_vendor);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('vendor');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('nama_vendor', 'Nama Vendor', 'required|trim');
		$this->form_validation->set_rules('alamat_vendor', 'Alamat Vendor', 'required|trim');
		$this->form_validation->set_rules('kontak_vendor', 'Kontak Vendor', 'required|trim');
		$this->form_validation->set_rules('no_rekening_vendor', 'No Rekening', 'required|trim');
		$this->form_validation->set_rules('nama_rekening_vendor', 'Nama Rekening', 'required|trim');
		$this->form_validation->set_rules('bank_vendor', 'Bank', 'required|trim');
	}

	public function hapus($id_vendor)
	{
		$this->M_vendor->delete($id_vendor);
		$this->db->where('id_vendor', $id_vendor);
		$this->db->delete('tb_detail_vendor');
		$this->session->set_flashdata('msg', 'hapus');
		redirect('vendor');
	}

	public function detail($id_vendor)
	{
    $data['title']		= 'Data Vendor';
		$data['id_vendor'] = $id_vendor;
		$data['v']	= $this->M_vendor->get_by_id($id_vendor);
		$data['vendor']	= $this->M_detail_vendor->get_data($id_vendor)->result_array();
		$this->load->view('detail-vendor/data', $data);
	}

	public function tambah_detail($id_vendor)
	{
		$this->validation_vendor();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Vendor';
			$data['id_vendor'] = $id_vendor;
			$data['v']	= $this->M_vendor->get_by_id($id_vendor);
			$this->load->view('detail-vendor/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'id_vendor'		=> $id_vendor,
				'nama_bahan'		=> $data['nama_bahan'],
				'warna'		=> $data['warna'],
				'satuan'		=> $data['satuan'],
				'harga_satuan'		=> $data['harga_satuan']
			];
			if ($this->M_detail_vendor->insert($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-detail-vendor/'.$id_vendor);
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('detail-vendor/'.$id_vendor);
			}
		}
	}

	public function edit_detail($id_vendor, $id_detail_vendor)
	{
		$this->validation_vendor();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Vendor';
			$data['id_vendor'] = $id_vendor;
			$data['v']	= $this->M_vendor->get_by_id($id_vendor);
			$data['vendor']	= $this->M_detail_vendor->get_by_id($id_detail_vendor);
			$this->load->view('detail-vendor/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'id_detail_vendor'		=> $id_detail_vendor,
				'id_vendor'		=> $id_vendor,
				'nama_bahan'		=> $data['nama_bahan'],
				'warna'		=> $data['warna'],
				'satuan'		=> $data['satuan'],
				'harga_satuan'		=> $data['harga_satuan']
			];
			
			if ($this->M_detail_vendor->update($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-detail-vendor/'.$id_vendor.'/'.$id_detail_vendor);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('detail-vendor/'.$id_vendor);
			}
		}
	}

	public function hapus_detail($id_vendor, $id_detail_vendor)
	{
		$this->M_detail_vendor->delete($id_detail_vendor);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-vendor/'.$id_vendor);
	}

	private function validation_vendor()
	{
		$this->form_validation->set_rules('nama_bahan', 'Nama Bahan', 'required|trim');
		$this->form_validation->set_rules('warna', 'Warna', 'trim');
		$this->form_validation->set_rules('satuan', 'Satuan', 'required|trim');
		$this->form_validation->set_rules('harga_satuan', 'Harga Satuan', 'required|trim');
		
	}

	public function get_katalog()
	{
    $id_vendor = $this->input->post('id_vendor');
		$katalog = $this->M_detail_vendor->get_data($id_vendor)->result_array();
		
		$html = "<option disabled selected>-- Pilih Item --</option>";
		foreach($katalog as $data){ // Ambil semua data dari hasil eksekusi $sql
			$html .= "<option value='".$data['id_detail_vendor']."'> Item : ".$data['nama_bahan']." || Warna : ".$data['warna']." || Satuan : ".$data['satuan']."</option>"; // Tambahkan tag option ke variabel $html
		}
		$callback = array('data'=>$html); // Masukan variabel html tadi ke dalam array $callback dengan index array : data_kota
		$response = [
			'response' => true,
			'data_katalog'	=> $callback

		]; 
		echo json_encode($response);
	}

	public function get_detail_katalog()
	{
		$id_detail_vendor = $this->input->post('id_detail_vendor');
		$dv = $this->M_detail_vendor->get_by_id($id_detail_vendor);

		$data = [
			'satuan' => $dv['satuan'],
			'harga' => $dv['harga_satuan'],
		];
		
		$response = [
			'response' => true,
			'data'	=> $data

		]; 
		echo json_encode($response);
	}
}
