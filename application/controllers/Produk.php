<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends CI_Controller {

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
    $data['title']		= 'Data Produk';
		$data['produk']		= $this->M_produk->get_data()->result_array();
		$this->load->view('produk/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Produk';
			$data['jenis_produk'] = $this->db->get('tb_jenis_produk')->result_array();
			$this->load->view('produk/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			
			$jenis_produk = explode("||", $data['jenis_produk']);
			$file = $this->upload_file('foto_produk');
			$data_user	= [
				'jenis_produk'			=> $jenis_produk[0],
				'nama_produk'			=> $data['nama_produk'],
				'bahan'			=> $data['bahan'],
				'foto_produk'			=> $file,
				'jml_benang'			=> $data['jml_benang'],
				'harga_benang'			=> $data['harga_benang'],
				
				'pnj_kain_s'			=> $data['pnj_kain_s'],
				'pnj_kain_m'			=> $data['pnj_kain_m'],
				'pnj_kain_l'			=> $data['pnj_kain_l'],
				'pnj_kain_xl'			=> $data['pnj_kain_xl'],
				'pnj_kain_xxl'			=> $data['pnj_kain_xxl'],
				'pnj_kain_s_p'			=> $data['pnj_kain_s_p'],
				'pnj_kain_m_p'			=> $data['pnj_kain_m_p'],
				'pnj_kain_l_p'			=> $data['pnj_kain_l_p'],
				'pnj_kain_xl_p'			=> $data['pnj_kain_xl_p'],
				'pnj_kain_xxl_p'			=> $data['pnj_kain_xxl_p'],
				'harga_kain'			=> $data['harga_kain'],

				'jml_kancing_s'			=> isset($data['jml_kancing_s']) ? $data['jml_kancing_s'] : 0,
				'jml_kancing_m'			=> isset($data['jml_kancing_m']) ? $data['jml_kancing_m'] : 0,
				'jml_kancing_l'			=> isset($data['jml_kancing_l']) ? $data['jml_kancing_l'] : 0,
				'jml_kancing_xl'			=> isset($data['jml_kancing_xl']) ? $data['jml_kancing_xl'] : 0,
				'jml_kancing_xxl'			=> isset($data['jml_kancing_xxl']) ? $data['jml_kancing_xxl'] : 0,
				'harga_kancing'			=> isset($data['harga_kancing']) ? $data['harga_kancing'] : 0,

				'pnj_resleting_s'			=> isset($data['pnj_resleting_s']) ? $data['pnj_resleting_s'] : 0,
				'pnj_resleting_m'			=> isset($data['pnj_resleting_m']) ? $data['pnj_resleting_m'] : 0,
				'pnj_resleting_l'			=> isset($data['pnj_resleting_l']) ? $data['pnj_resleting_l'] : 0,
				'pnj_resleting_xl'			=> isset($data['pnj_resleting_xl']) ? $data['pnj_resleting_xl'] : 0,
				'pnj_resleting_xxl'			=> isset($data['pnj_resleting_xxl']) ? $data['pnj_resleting_xxl'] : 0,
				'harga_resleting'			=> isset($data['harga_resleting']) ? $data['harga_resleting'] : 0,

				'jml_prepet_s'			=> isset($data['jml_prepet_s']) ? $data['jml_prepet_s'] : 0,
				'jml_prepet_m'			=> isset($data['jml_prepet_m']) ? $data['jml_prepet_m'] : 0,
				'jml_prepet_l'			=> isset($data['jml_prepet_l']) ? $data['jml_prepet_l'] : 0,
				'jml_prepet_xl'			=> isset($data['jml_prepet_xl']) ? $data['jml_prepet_xl'] : 0,
				'jml_prepet_xxl'			=> isset($data['jml_prepet_xxl']) ? $data['jml_prepet_xxl'] : 0,
				'harga_prepet'			=> isset($data['harga_prepet']) ? $data['harga_prepet'] : 0,

				'pnj_rib_s'			=> isset($data['pnj_rib_s']) ? $data['pnj_rib_s'] : 0,
				'pnj_rib_m'			=> isset($data['pnj_rib_m']) ? $data['pnj_rib_m'] : 0,
				'pnj_rib_l'			=> isset($data['pnj_rib_l']) ? $data['pnj_rib_l'] : 0,
				'pnj_rib_xl'			=> isset($data['pnj_rib_xl']) ? $data['pnj_rib_xl'] : 0,
				'pnj_rib_xxl'			=> isset($data['pnj_rib_xxl']) ? $data['pnj_rib_xxl'] : 0,
				'harga_rib'			=> isset($data['harga_rib']) ? $data['harga_rib'] : 0,
			];

			if ($this->M_produk->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-produk');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('produk');
			}
		}
	}

	public function edit($id_produk)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Produk';
			$data['produk_segment'] = true;
			$data['jenis_produk'] = $this->db->get('tb_jenis_produk')->result_array();
			$data['produk']	= $this->M_produk->get_by_id($id_produk);
			$this->load->view('produk/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$jenis_produk = explode("||", $data['jenis_produk']);
			if (empty($_FILES['foto_produk']['name'])) {
				$file = $data['foto_produk_old'];
			}else{
				$file = $this->upload_file('foto_produk');
			}
			$data_user	= [
				'id_produk'		=> $id_produk,
				'jenis_produk'			=> $jenis_produk[0],
				'nama_produk'			=> $data['nama_produk'],
				'bahan'			=> $data['bahan'],
				'foto_produk'			=> $file,
				'jml_benang'			=> $data['jml_benang'],
				'harga_benang'			=> $data['harga_benang'],
				
				'pnj_kain_s'			=> $data['pnj_kain_s'],
				'pnj_kain_m'			=> $data['pnj_kain_m'],
				'pnj_kain_l'			=> $data['pnj_kain_l'],
				'pnj_kain_xl'			=> $data['pnj_kain_xl'],
				'pnj_kain_xxl'			=> $data['pnj_kain_xxl'],
				'pnj_kain_s_p'			=> $data['pnj_kain_s_p'],
				'pnj_kain_m_p'			=> $data['pnj_kain_m_p'],
				'pnj_kain_l_p'			=> $data['pnj_kain_l_p'],
				'pnj_kain_xl_p'			=> $data['pnj_kain_xl_p'],
				'pnj_kain_xxl_p'			=> $data['pnj_kain_xxl_p'],
				'harga_kain'			=> $data['harga_kain'],

				'jml_kancing_s'			=> isset($data['jml_kancing_s']) ? $data['jml_kancing_s'] : 0,
				'jml_kancing_m'			=> isset($data['jml_kancing_m']) ? $data['jml_kancing_m'] : 0,
				'jml_kancing_l'			=> isset($data['jml_kancing_l']) ? $data['jml_kancing_l'] : 0,
				'jml_kancing_xl'			=> isset($data['jml_kancing_xl']) ? $data['jml_kancing_xl'] : 0,
				'jml_kancing_xxl'			=> isset($data['jml_kancing_xxl']) ? $data['jml_kancing_xxl'] : 0,
				'harga_kancing'			=> isset($data['harga_kancing']) ? $data['harga_kancing'] : 0,

				'pnj_resleting_s'			=> isset($data['pnj_resleting_s']) ? $data['pnj_resleting_s'] : 0,
				'pnj_resleting_m'			=> isset($data['pnj_resleting_m']) ? $data['pnj_resleting_m'] : 0,
				'pnj_resleting_l'			=> isset($data['pnj_resleting_l']) ? $data['pnj_resleting_l'] : 0,
				'pnj_resleting_xl'			=> isset($data['pnj_resleting_xl']) ? $data['pnj_resleting_xl'] : 0,
				'pnj_resleting_xxl'			=> isset($data['pnj_resleting_xxl']) ? $data['pnj_resleting_xxl'] : 0,
				'harga_resleting'			=> isset($data['harga_resleting']) ? $data['harga_resleting'] : 0,

				'jml_prepet_s'			=> isset($data['jml_prepet_s']) ? $data['jml_prepet_s'] : 0,
				'jml_prepet_m'			=> isset($data['jml_prepet_m']) ? $data['jml_prepet_m'] : 0,
				'jml_prepet_l'			=> isset($data['jml_prepet_l']) ? $data['jml_prepet_l'] : 0,
				'jml_prepet_xl'			=> isset($data['jml_prepet_xl']) ? $data['jml_prepet_xl'] : 0,
				'jml_prepet_xxl'			=> isset($data['jml_prepet_xxl']) ? $data['jml_prepet_xxl'] : 0,
				'harga_prepet'			=> isset($data['harga_prepet']) ? $data['harga_prepet'] : 0,

				'pnj_rib_s'			=> isset($data['pnj_rib_s']) ? $data['pnj_rib_s'] : 0,
				'pnj_rib_m'			=> isset($data['pnj_rib_m']) ? $data['pnj_rib_m'] : 0,
				'pnj_rib_l'			=> isset($data['pnj_rib_l']) ? $data['pnj_rib_l'] : 0,
				'pnj_rib_xl'			=> isset($data['pnj_rib_xl']) ? $data['pnj_rib_xl'] : 0,
				'pnj_rib_xxl'			=> isset($data['pnj_rib_xxl']) ? $data['pnj_rib_xxl'] : 0,
				'harga_rib'			=> isset($data['harga_rib']) ? $data['harga_rib'] : 0,
			];
			
			if ($this->M_produk->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-produk/'.$id_produk);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('produk');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('nama_produk', 'Nama Produk', 'required|trim');
		$this->form_validation->set_rules('jenis_produk', 'Jenis Produk', 'required|trim');
		$this->form_validation->set_rules('bahan', 'Bahan', 'required|trim');
		
	}

	public function hapus($id_produk)
	{
		$this->M_produk->delete($id_produk);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('produk');
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
