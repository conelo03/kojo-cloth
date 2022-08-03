<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengajuan extends CI_Controller {

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
    $data['title']		= 'Data Pengajuan';
		$data['pengajuan']		= $this->M_pengajuan->get_data()->result_array();
		$this->load->view('pengajuan/data', $data);
	}

	public function my()
	{
		$id_pegawai = $this->session->userdata('id_pegawai');
    $data['title']		= 'Pengajuanku';
		$data['pengajuan']		= $this->M_pengajuan->get_data()->result_array();
		$this->load->view('pengajuan/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan';
			$data['rekening'] = $this->db->get('tb_rekening')->result_array();
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$this->load->view('pengajuan/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$file = $this->upload_file('bukti_pengajuan');
			$rek = $this->M_rekening->get_by_id($data['id_rekening']);
			$data_user	= [
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'keterangan'			=> $data['keterangan'],
				'id_pegawai'			=> $this->session->userdata('id_pegawai'),
				'bank'			=> $rek['bank'],
				'no_rekening'			=> $rek['no_rekening'],
				'nama_rekening'			=> $rek['nama_rekening'],
				'jumlah'			=> $data['jumlah'],
				'bukti_pengajuan' => $file
			];

			if ($this->M_pengajuan->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-pengajuan');
			} else {
				$judul = "Notifikasi Kojo Cloth";
				$konten = "Ada 1 Pengajuan Baru!";
				$url = "https://kojo-cloth.elearningpolsub.com/pengajuan";
				$response = $this->send_message($judul, $konten, $url);
				$this->send_notif_wa();
				$this->session->set_flashdata('msg', 'success');
				redirect('pengajuan');
			}
		}
	}

	public function edit($id_pengajuan)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan';
			$data['rekening'] = $this->db->get('tb_rekening')->result_array();
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$data['p']	= $this->M_pengajuan->get_by_id($id_pengajuan);
			$this->load->view('pengajuan/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			if (empty($_FILES['bukti_pengajuan']['name'])) {
				$file = $data['bukti_pengajuan_old'];
			}else{
				$file = $this->upload_file('bukti_pengajuan');
			}
			$rek = $this->M_rekening->get_by_id($data['id_rekening']);
			$data_user	= [
				'id_pengajuan'		=> $id_pengajuan,
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'keterangan'			=> $data['keterangan'],
				'jumlah'			=> $data['jumlah'],
				'bank'			=> $rek['bank'],
				'no_rekening'			=> $rek['no_rekening'],
				'nama_rekening'			=> $rek['nama_rekening'],
				'bukti_pengajuan' => $file
			];
			
			if ($this->M_pengajuan->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-pengajuan/'.$id_pengajuan);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('pengajuan');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required|trim');
		$this->form_validation->set_rules('id_jenis_pengeluaran', 'Jenis pengeluaran', 'required|trim');
		$this->form_validation->set_rules('id_rekening', 'Rekening Penerima', 'required|trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
		$this->form_validation->set_rules('jumlah', 'Jumlah', 'required|trim');
	}

	public function hapus($id_pengajuan)
	{
		$this->M_pengajuan->delete($id_pengajuan);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('pengajuan');
	}

	public function approve($id_pengajuan)
	{
		$data_user	= [
			'id_pengajuan'		=> $id_pengajuan,
			'status'			=> 1,
		];

		$this->M_pengajuan->update($data_user);
		$this->session->set_flashdata('msg', 'verifikasi');
		redirect('pengajuan');
	}

	public function posting($id_pengajuan)
	{
		$gp = $this->M_pengajuan->get_by_id($id_pengajuan);
		$data = [
			'tanggal' => $gp['tanggal'],
			'id_jenis_pengeluaran' => $gp['id_jenis_pengeluaran'],
			'keterangan' => $gp['keterangan'],
			'referensi' => '-',
			'jumlah' => $gp['jumlah']
		];
		$this->M_pengeluaran->insert($data);
		$data = [
			'id_pengajuan' => $id_pengajuan,
			'status' => 2
		];
		$this->M_pengajuan->update($data);
		$this->session->set_flashdata('msg', 'posting');
		redirect('pengajuan');
	}

	private function upload_file($file)
	{
		$config['upload_path'] = './assets/upload/'.$file;
		$config['allowed_types'] = 'jpg|png|jpeg|pdf';
		$config['max_size'] = 10000;
		$this->upload->initialize($config);
		$this->load->library('upload', $config);

		if(! $this->upload->do_upload($file))
		{
			return '';
		}

		return $this->upload->data('file_name');
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
      CURLOPT_URL => "https://api.ultramsg.com/instance13688/messages/chat",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30,
      CURLOPT_SSL_VERIFYHOST => 0,
      CURLOPT_SSL_VERIFYPEER => 0,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => "token=q4s6bv4r3q9s9mbg&to=+6289604359031&body=Ada 1 Pengajuan Baru! Cek segera tautan dibawah ini.
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
