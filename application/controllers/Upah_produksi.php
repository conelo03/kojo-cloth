<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Upah_produksi extends CI_Controller {

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
    $data['title']		= 'Data Upah Produksi';
		$data['up']	= $this->db->order_by('created_at', 'DESC')->get('tb_upah_produksi')->result_array();
		$this->load->view('upah_produksi/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Upah Produksi';
			$data['jenis_produk'] = $this->db->get('tb_jenis_produk')->result_array();
			$this->load->view('upah_produksi/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_akun	= [
				'jenis_produk'		=> $data['jenis_produk'],
				'jenis_pekerjaan'		=> $data['jenis_pekerjaan'],
				'upah'		=> $data['upah'],
				'status'		=> 0,
				'created_by'		=> $this->session->userdata('nama'),
				'created_at'		=> date('Y-m-d H:i:s'),
			];
			if ($this->db->insert('tb_upah_produksi', $data_akun)) {
				$this->session->set_flashdata('msg', 'success');
				redirect('upah-produksi');
			} else {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-upah-produksi');
				
			}
		}
	}

	public function aktif($id_upah_produksi)
	{
		$up = $this->db->get_where('tb_upah_produksi', ['id_upah_produksi' => $id_upah_produksi])->row_array();
		$this->db->where('jenis_produk', $up['jenis_produk']);
		$this->db->where('jenis_pekerjaan', $up['jenis_pekerjaan']);
		$this->db->update('tb_upah_produksi', ['status' => 0]);

		$this->db->where('id_upah_produksi', $up['id_upah_produksi']);
		$this->db->update('tb_upah_produksi', ['status' => 1]);

		$this->session->set_flashdata('msg', 'edit');
		redirect('upah-produksi');
	}

	private function validation()
	{
		$this->form_validation->set_rules('jenis_produk', 'Jenis Produk', 'required|trim');
		$this->form_validation->set_rules('jenis_pekerjaan', 'Jenis Pekerjaan', 'required|trim');
		$this->form_validation->set_rules('upah', 'Upah', 'required|trim');
	}

	public function hapus($id_agenda)
	{
		$this->M_agenda->delete($id_agenda);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('agenda');
	}

	public function detail($id_agenda)
	{
    $data['title']		= 'Data Agenda';
		$data['id_agenda'] = $id_agenda;
		$data['tgl_sekarang'] = date('Y-m-d');
		$data['a']	= $this->M_agenda->get_by_id($id_agenda);
		$data['agenda']	= $this->M_detail_agenda->get_data($id_agenda)->result_array();
		$this->load->view('detail-agenda/data', $data);
	}

	public function tambah_detail($id_agenda)
	{
		$this->validation_agenda();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Agenda';
			$data['id_agenda'] = $id_agenda;
			$data['a']	= $this->M_agenda->get_by_id($id_agenda);
			$this->load->view('detail-agenda/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$file = $this->upload_file('foto_agenda');
			$data_akun	= [
				'id_agenda'		=> $id_agenda,
				'foto_agenda'		=> $file,
				'tautan'		=> $data['tautan'],
				'keterangan'		=> $data['keterangan']
			];
			if ($this->M_detail_agenda->insert($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-detail-agenda/'.$id_agenda);
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('detail-agenda/'.$id_agenda);
			}
		}
	}

	public function edit_detail($id_agenda, $id_detail_agenda)
	{
		$this->validation_agenda();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Agenda';
			$data['id_agenda'] = $id_agenda;
			$data['a']	= $this->M_agenda->get_by_id($id_agenda);
			$data['agenda']	= $this->M_detail_agenda->get_by_id($id_detail_agenda);
			$this->load->view('detail-agenda/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			if (empty($_FILES['foto_agenda']['name'])) {
				$file = $data['foto_agenda_old'];
			}else{
				$file = $this->upload_file('foto_agenda');
			}
			$data_akun	= [
				'id_detail_agenda'		=> $id_detail_agenda,
				'id_agenda'		=> $id_agenda,
				'foto_agenda'		=> $file,
				'tautan'		=> $data['tautan'],
				'keterangan'		=> $data['keterangan']
			];
			
			if ($this->M_detail_agenda->update($data_akun)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-detail-agenda/'.$id_agenda.'/'.$id_detail_agenda);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('detail-agenda/'.$id_agenda);
			}
		}
	}

	public function hapus_detail($id_agenda, $id_detail_agenda)
	{
		$this->M_detail_agenda->delete($id_detail_agenda);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-agenda/'.$id_agenda);
	}

	private function validation_agenda()
	{
		$this->form_validation->set_rules('tautan', 'Tautan', 'trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
		
	}

	private function upload_file($file)
	{
		$config['upload_path'] = './assets/upload/'.$file;
		$config['allowed_types'] = 'jpg|png|jpeg|pdf|docx|xlsx|doc|xls';
		$config['max_size'] = 10000;
		$this->upload->initialize($config);
		$this->load->library('upload', $config);

		if(! $this->upload->do_upload($file))
		{
			return '';
		}

		return $this->upload->data('file_name');
	}
}
