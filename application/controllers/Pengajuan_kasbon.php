<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengajuan_kasbon extends CI_Controller {

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
    $data['title']		= 'Data Pengajuan Kasbon Produksi';
		$data['pengajuan_kasbon']		= $this->M_pengajuan_kasbon->get_data()->result_array();

		$this->load->view('pengajuan_kasbon/data', $data);
	}

	public function my()
	{
		$id_pegawai = $this->session->userdata('id_pegawai');
    $data['title']		= 'pengajuan_kasbonku';
		$data['pengajuan_kasbon']		= $this->M_pengajuan_kasbon->get_data()->result_array();
		$this->load->view('pengajuan_kasbon/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan Kasbon Produksi';
			$data['pegawai'] = $this->db->get_where('tb_pegawai', ['jabatan' => 'Pegawai Produksi'])->result_array();
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$this->load->view('pengajuan_kasbon/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'keterangan'			=> $data['keterangan'],
				'id_pegawai'			=> $data['id_pegawai'],
				'jumlah'			=> $data['jumlah'],
				'sisa'			=> $data['jumlah'],
			];

			if ($this->M_pengajuan_kasbon->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-pengajuan-kasbon');
			} else {
				$judul = "Notifikasi Kojo Cloth";
				$konten = "Ada 1 Pengajuan Kasbon Baru!";
				$url = "https://kojo-cloth.elearningpolsub.com/pengajuan-kasbon";
				$response = $this->send_message($judul, $konten, $url);
				$this->send_notif_wa();
				$this->session->set_flashdata('msg', 'success');
				redirect('pengajuan-kasbon');
			}
		}
	}

	public function edit($id_pengajuan_kasbon)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Pengajuan Kasbon Produksi';
			$data['pegawai'] = $this->db->get_where('tb_pegawai', ['jabatan' => 'Pegawai Produksi'])->result_array();
			$data['jenis_pengeluaran'] = $this->db->get('tb_jenis_pengeluaran')->result_array();
			$data['p']	= $this->M_pengajuan_kasbon->get_by_id($id_pengajuan_kasbon);
			$this->load->view('pengajuan_kasbon/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'id_pengajuan_kasbon'		=> $id_pengajuan_kasbon,
				'tanggal'			=> $data['tanggal'],
				'id_jenis_pengeluaran'			=> $data['id_jenis_pengeluaran'],
				'keterangan'			=> $data['keterangan'],
				'id_pegawai'			=> $data['id_pegawai'],
				'jumlah'			=> $data['jumlah'],
				'sisa'			=> $data['jumlah'],
			];
			
			if ($this->M_pengajuan_kasbon->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-pengajuan-kasbon/'.$id_pengajuan_kasbon);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('pengajuan-kasbon');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required|trim');
		$this->form_validation->set_rules('id_jenis_pengeluaran', 'Jenis pengeluaran', 'required|trim');
		$this->form_validation->set_rules('id_pegawai', 'Rekening Penerima', 'required|trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
		$this->form_validation->set_rules('jumlah', 'Jumlah', 'required|trim');
	}

	public function hapus($id_pengajuan_kasbon)
	{
		$this->M_pengajuan_kasbon->delete($id_pengajuan_kasbon);

		$this->db->where('id_pengajuan_kasbon', $id_pengajuan_kasbon);
		$this->db->update('tb_pegawai_cutting', ['id_pengajuan_kasbon' => 0]);

		$this->db->where('id_pengajuan_kasbon', $id_pengajuan_kasbon);
		$this->db->update('tb_pegawai_jahit', ['id_pengajuan_kasbon' => 0]);

		$this->db->where('id_pengajuan_kasbon', $id_pengajuan_kasbon);
		$this->db->update('tb_pegawai_qc', ['id_pengajuan_kasbon' => 0]);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('pengajuan-kasbon');
	}

	public function approve($id_pengajuan_kasbon)
	{
		$data_user	= [
			'id_pengajuan_kasbon'		=> $id_pengajuan_kasbon,
			'status'			=> 1,
		];

		$this->M_pengajuan_kasbon->update($data_user);
		$this->session->set_flashdata('msg', 'verifikasi');
		redirect('pengajuan-kasbon');
	}

	public function posting($id_pengajuan_kasbon)
	{
		$pemasukan		= $this->db->select_sum('jumlah')->from('tb_pemasukan')->get()->row_array();
		$pengeluaran		= $this->db->select_sum('jumlah')->from('tb_pengeluaran')->get()->row_array();
		$saldo = $pemasukan['jumlah'] - $pengeluaran['jumlah'];

		$gp = $this->M_pengajuan_kasbon->get_by_id($id_pengajuan_kasbon);

		if($saldo < $gp['jumlah']){
			$this->session->set_flashdata('msg', 'saldo-tidak-cukup');
			redirect('pengajuan_kasbon');
		}
		
		$data = [
			'tanggal' => $gp['tanggal'],
			'id_jenis_pengeluaran' => $gp['id_jenis_pengeluaran'],
			'keterangan' => $gp['keterangan'],
			'referensi' => '-',
			'jumlah' => $gp['jumlah']
		];
		$this->M_pengeluaran->insert($data);
		$data = [
			'id_pengajuan_kasbon' => $id_pengajuan_kasbon,
			'status' => 2
		];
		$this->M_pengajuan_kasbon->update($data);
		$this->session->set_flashdata('msg', 'posting');
		redirect('pengajuan-kasbon');
	}

	public function bayar($id_pengajuan_kasbon)
	{
		$pk = $this->M_pengajuan_kasbon->get_by_id($id_pengajuan_kasbon);
		$data = $this->input->post('data_pegawai');
		$data = explode("||", $data);
		$id = $data[0];
		$id_pegawai = $data[1];
		$kasbon = $data[2];
		$tgl_cair = $data[3];

		$sisa = $pk['sisa'] - $kasbon;

		if($kasbon > $pk['sisa']){
			$this->session->set_flashdata('msg', 'error');
			redirect('pengajuan-kasbon');
		}
		
		$cutting = $this->db->get_where('tb_pegawai_cutting', ['id_pegawai_cutting' => $id, 'id_pegawai' => $id_pegawai, 'kasbon' => $kasbon, 'tgl_cair' => $tgl_cair, 'id_pengajuan_kasbon' => 0]);
		$jahit = $this->db->get_where('tb_pegawai_jahit', ['id_pegawai_jahit' => $id, 'id_pegawai' => $id_pegawai, 'kasbon' => $kasbon, 'tgl_cair' => $tgl_cair, 'id_pengajuan_kasbon' => 0]);
		$qc = $this->db->get_where('tb_pegawai_qc', ['id_pegawai_qc' => $id, 'id_pegawai' => $id_pegawai, 'kasbon' => $kasbon, 'tgl_cair' => $tgl_cair, 'id_pengajuan_kasbon' => 0]);

		if($cutting->num_rows() == 1){
			$cutting = $cutting->row_array();
			$id_pegawai_cutting = $cutting['id_pegawai_cutting'];
			$this->db->where('id_pegawai_cutting', $id_pegawai_cutting);
			$this->db->update('tb_pegawai_cutting', ['id_pengajuan_kasbon' => $id_pengajuan_kasbon]);
		}else if($jahit->num_rows() == 1){
			$jahit = $jahit->row_array();
			$id_pegawai_jahit = $jahit['id_pegawai_jahit'];
			$this->db->where('id_pegawai_jahit', $id_pegawai_jahit);
			$this->db->update('tb_pegawai_jahit', ['id_pengajuan_kasbon' => $id_pengajuan_kasbon]);
		}else if($qc->num_rows() == 1){
			$qc = $qc->row_array();
			$id_pegawai_qc = $qc['id_pegawai_qc'];
			$this->db->where('id_pegawai_qc', $id_pegawai_qc);
			$this->db->update('tb_pegawai_qc', ['id_pengajuan_kasbon' => $id_pengajuan_kasbon]);
		}

		$this->db->where('id_pengajuan_kasbon', $id_pengajuan_kasbon);
		$this->db->update('tb_pengajuan_kasbon', ['sisa' => $sisa]);

		$this->session->set_flashdata('msg', 'bayar-kasbon');
		redirect('pengajuan-kasbon');
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
      CURLOPT_POSTFIELDS => "token=q4s6bv4r3q9s9mbg&to=+6289604359031&body=Ada 1 pengajuan_kasbon Baru! Cek segera tautan dibawah ini.
    https://kojo-cloth.elearningpolsub.com/pengajuan_kasbon&priority=1&referenceId=",
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
