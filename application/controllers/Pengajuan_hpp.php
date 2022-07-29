<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengajuan_hpp extends CI_Controller {

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
    $data['title']		= 'Data Pengajuan HPP';
		$data['pengajuan_hpp']		= $this->M_pengajuan_hpp->get_data()->result_array();
		$this->load->view('pengajuan_hpp/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan HPP';
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$data['order'] = $this->M_order->get_data(null, null, true)->result_array();
			$this->load->view('pengajuan_hpp/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'id_order'			=> $data['id_order'],
				'bank'			=> $data['bank'],
				'no_rekening'			=> $data['no_rekening'],
				'nama_rekening'			=> $data['nama_rekening'],
				'keterangan'			=> $data['keterangan'],
				'id_pegawai'			=> $this->session->userdata('id_pegawai'),
			];

			if ($this->M_pengajuan_hpp->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-pengajuan-hpp');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('pengajuan_hpp');
			}
		}
	}

	public function edit($id_pengajuan_hpp)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan HPP';
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$data['order'] = $this->M_order->get_data(null, null, true)->result_array();
			$data['p']	= $this->M_pengajuan_hpp->get_by_id($id_pengajuan_hpp);
			$this->load->view('pengajuan_hpp/edit', $data);
		} else {
			$data		= $this->input->post(null, true);

			$data_user	= [
				'id_pengajuan_hpp'		=> $id_pengajuan_hpp,
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'id_order'			=> $data['id_order'],
				'bank'			=> $data['bank'],
				'no_rekening'			=> $data['no_rekening'],
				'nama_rekening'			=> $data['nama_rekening'],
				'keterangan'			=> $data['keterangan'],
				'id_pegawai'			=> $this->session->userdata('id_pegawai'),
			];
			
			if ($this->M_pengajuan_hpp->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-pengajuan-hpp/'.$id_pengajuan_hpp);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('pengajuan_hpp');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required|trim');
		$this->form_validation->set_rules('id_jenis_pengeluaran', 'Jenis pengeluaran', 'required|trim');
		$this->form_validation->set_rules('id_order', 'ID Order', 'required|trim');
		$this->form_validation->set_rules('bank', 'Bank', 'required|trim');
		$this->form_validation->set_rules('no_rekening', 'No Rekening', 'required|trim');
		$this->form_validation->set_rules('nama_rekening', 'Nama Rekening', 'required|trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
	}

	public function hapus($id_pengajuan_hpp)
	{
		$this->db->where('id_pengajuan_hpp', $id_pengajuan_hpp);
		$this->db->delete('tb_detail_pengajuan_hpp');
		$this->M_pengajuan_hpp->delete($id_pengajuan_hpp);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('pengajuan-hpp');
	}

	public function ajukan($id_pengajuan_hpp)
	{
		$data_user	= [
			'id_pengajuan_hpp'		=> $id_pengajuan_hpp,
			'status'			=> 1,
		];

		$this->M_pengajuan_hpp->update($data_user);
		$judul = "Notifikasi Kojo Cloth";
		$konten = "Ada 1 Pengajuan HPP Baru!";
		$url = "https://kojo-cloth.elearningpolsub.com/pengajuan-hpp";
		$response = $this->send_message($judul, $konten, $url);
		$this->send_notif_wa();
		$this->session->set_flashdata('msg', 'ajukan');
		redirect('pengajuan-hpp');
	}

	public function batal($id_pengajuan_hpp)
	{
		$data_user	= [
			'id_pengajuan_hpp'		=> $id_pengajuan_hpp,
			'status'			=> 0,
		];

		$this->M_pengajuan_hpp->update($data_user);
		$this->session->set_flashdata('msg', 'edit');
		redirect('pengajuan-hpp');
	}

	public function approve($id_pengajuan_hpp)
	{
		$data_user	= [
			'id_pengajuan_hpp'		=> $id_pengajuan_hpp,
			'status'			=> 2,
		];

		$this->M_pengajuan_hpp->update($data_user);
		$this->session->set_flashdata('msg', 'verifikasi');
		redirect('pengajuan-hpp');
	}

	public function posting($id_pengajuan_hpp)
	{
		$gp = $this->M_pengajuan_hpp->get_by_id($id_pengajuan_hpp);
		$data = [
			'tanggal' => $gp['tanggal'],
			'id_jenis_pengeluaran' => $gp['id_jenis_pengeluaran'],
			'keterangan' => $gp['keterangan'],
			'referensi' => '-',
			'jumlah' => $gp['jumlah']
		];
		$this->M_pengeluaran->insert($data);
		$data = [
			'id_pengajuan_hpp' => $id_pengajuan_hpp,
			'status' => 3
		];
		$this->M_pengajuan_hpp->update($data);
		$this->session->set_flashdata('msg', 'posting');
		redirect('pengajuan-hpp');
	}

	public function detail($id_pengajuan_hpp)
	{
    $data['title']		= 'Data Pengajuan HPP';
		$data['p'] = $this->M_pengajuan_hpp->get_by_id($id_pengajuan_hpp);
		$data['pengajuan_hpp']		= $this->db->select('*, tb_detail_pengajuan_hpp.jumlah as jumlah')
		->from('tb_detail_pengajuan_hpp')
		->join('tb_pengajuan_hpp', 'tb_pengajuan_hpp.id_pengajuan_hpp=tb_detail_pengajuan_hpp.id_pengajuan_hpp')
		->where('tb_detail_pengajuan_hpp.id_pengajuan_hpp', $id_pengajuan_hpp)
		->get()->result_array();
		$data['id_pengajuan_hpp'] = $id_pengajuan_hpp;
		$this->load->view('pengajuan_hpp/detail', $data);
	}

	public function tambah_detail($id_pengajuan_hpp)
	{
		$this->validation_detail();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan Hpp';
			$data['id_pengajuan_hpp'] = $id_pengajuan_hpp;
			$this->load->view('pengajuan_hpp/tambah_detail', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'id_pengajuan_hpp' => $id_pengajuan_hpp,
				'nama_bahan'			=> $data['nama_bahan'],
				'vendor'			=> $data['vendor'],
				'satuan'			=> $data['satuan'],
				'jumlah'			=> $data['jumlah'],
				'harga'			=> $data['harga'],
				'total'			=> $data['jumlah']*$data['harga'],
			];
			$query = $this->db->insert('tb_detail_pengajuan_hpp', $data_user);
			if (!$query) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-detail-pengajuan-hpp/'.$id_pengajuan_hpp);
			} else {
				$this->session->set_flashdata('msg', 'success');
				$this->sum_pengajuan_hpp($id_pengajuan_hpp);
				redirect('detail-pengajuan-hpp/'.$id_pengajuan_hpp);
			}
		}
	}

	public function edit_detail($id_pengajuan_hpp, $id_detail_pengajuan_hpp)
	{
		$this->validation_detail();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan Hpp';
			$data['p'] = $this->db->get_where('tb_detail_pengajuan_hpp', ['id_detail_pengajuan_hpp' => $id_detail_pengajuan_hpp])->row_array();
			$data['id_pengajuan_hpp'] = $id_pengajuan_hpp;
			$this->load->view('pengajuan_hpp/edit_detail', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'id_detail_pengajuan_hpp' => $id_detail_pengajuan_hpp,
				'id_pengajuan_hpp' => $id_pengajuan_hpp,
				'nama_bahan'			=> $data['nama_bahan'],
				'vendor'			=> $data['vendor'],
				'satuan'			=> $data['satuan'],
				'jumlah'			=> $data['jumlah'],
				'harga'			=> $data['harga'],
				'total'			=> $data['jumlah']*$data['harga'],
			];

			$this->db->where('id_detail_pengajuan_hpp', $id_detail_pengajuan_hpp);
			$query = $this->db->update('tb_detail_pengajuan_hpp', $data_user);
			if (!$query) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-detail-pengajuan-hpp/'.$id_pengajuan_hpp.'/'.$id_detail_pengajuan_hpp);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				$this->sum_pengajuan_hpp($id_pengajuan_hpp);
				redirect('detail-pengajuan-hpp/'.$id_pengajuan_hpp);
			}
		}
	}

	public function hapus_detail($id_pengajuan_hpp, $id_detail_pengajuan_hpp)
	{
		$this->db->where('id_detail_pengajuan_hpp', $id_detail_pengajuan_hpp);
		$this->db->delete('tb_detail_pengajuan_hpp');
		$this->sum_pengajuan_hpp($id_pengajuan_hpp);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-pengajuan-hpp/'.$id_pengajuan_hpp);
	}

	private function validation_detail()
	{
		$this->form_validation->set_rules('nama_bahan', 'Nama Bahan', 'required|trim');
		$this->form_validation->set_rules('vendor', 'Vendor', 'required');
		$this->form_validation->set_rules('satuan', 'satuan', 'required');
		$this->form_validation->set_rules('jumlah', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('harga', 'Harga Satuan', 'required|trim');
		
	}

	private function sum_pengajuan_hpp($id_pengajuan_hpp)	
	{
		$sum_pengajuan_hpp = $this->db->query("SELECT SUM(total) as total FROM tb_detail_pengajuan_hpp WHERE id_pengajuan_hpp='$id_pengajuan_hpp'")->row_array();
		$data = [
			'id_pengajuan_hpp' => $id_pengajuan_hpp,
			'jumlah' => $sum_pengajuan_hpp['total']
		];
		$this->M_pengajuan_hpp->update($data);

		return true;
	}

	private function send_message($judul, $konten, $url) {
    $content      = array(
        "en" => $konten
    );
    $heading =array(
        "en" => $judul
    );

    $fields = array(
        'app_id' => "bebe38a0-12a2-434c-b4e5-8b54ffeb6b28",
        'included_segments' => array(
            'All'
        ),
        'contents' => $content,
        'headings' => $heading,
        'url' => $url
    );

    $fields = json_encode($fields);
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        "Content-Type: application/json; charset=utf-8",
        "Authorization: Basic YWFiNjE0MTMtNjQwNS00M2IyLWI2NWQtYjM0YzRmZThhZTlk"
    ));
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_HEADER, FALSE);
    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_VERBOSE, TRUE);
    curl_setopt($ch, CURLOPT_STDERR, fopen('php://stderr', 'w'));
    
    $response = curl_exec($ch);
    curl_close($ch);
 
    return $response;
  }

	private function send_notif_wa(){
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://api.ultramsg.com/instance13308/messages/chat",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30,
      CURLOPT_SSL_VERIFYHOST => 0,
      CURLOPT_SSL_VERIFYPEER => 0,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => "token=y7bhoiqsgp28soe9&to=+6285936570953&body=Ada 1 Pengajuan Baru! Cek segera tautan dibawah ini.
    https://kojo-cloth.elearningpolsub.com/pengajuan&priority=1&referenceId=",
      CURLOPT_HTTPHEADER => array(
        "content-type: application/x-www-form-urlencoded"
      ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    return true;
    
  }
}
