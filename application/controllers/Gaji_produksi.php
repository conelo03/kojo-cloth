<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gaji_produksi extends CI_Controller {

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
    $data['title']		= 'Data Gaji Produksi';
		$data['gaji_produksi']		= $this->M_gaji_produksi->get_data()->result_array();
		$this->load->view('gaji_produksi/data', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Gaji Produksi';
			$this->load->view('gaji_produksi/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'tanggal_pencairan'			=> $data['tanggal_pencairan'],
				'id_jenis_pengeluaran' => '1',
				'keterangan'			=> $data['keterangan'],
			];

			if ($this->M_gaji_produksi->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-gaji-produksi');
			} else {
				$this->session->set_flashdata('msg', 'success');
				redirect('gaji-produksi');
			}
		}
	}

	public function edit($id_gaji_produksi)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Gaji Produksi';
			$data['gaji_produksi']	= $this->M_gaji_produksi->get_by_id($id_gaji_produksi);
			$this->load->view('gaji_produksi/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			$data_user	= [
				'id_gaji_produksi' => $id_gaji_produksi,
				'tanggal_pencairan'			=> $data['tanggal_pencairan'],
				'keterangan'			=> $data['keterangan'],
			];
			
			if ($this->M_gaji_produksi->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-gaji-produksi/'.$id_gaji_produksi);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('gaji-produksi');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tanggal_pencairan', 'Tanggal', 'required|trim');
		$this->form_validation->set_rules('keterangan', 'Keterangan', 'required|trim');
		
	}

	public function hapus($id_gaji_produksi)
	{
		$this->M_gaji_produksi->delete($id_gaji_produksi);
		$this->db->where('id_gaji_produksi', $id_gaji_produksi);
		$this->db->delete('tb_detail_gaji_produksi');
		$this->session->set_flashdata('msg', 'hapus');
		redirect('gaji-produksi');
	}

	public function generate($id_gaji_produksi)
	{
		$gaji = $this->M_gaji_produksi->get_by_id($id_gaji_produksi);
		$pegawai = $this->db->get_where('tb_pegawai', ['jabatan' => 'Pegawai Produksi'])->result_array();
		foreach ($pegawai as $p) {
			$id_pegawai = $p['id_pegawai'];
			$tanggal_pencairan = $gaji['tanggal_pencairan'];

			$get_gaji_cutting = $this->db->query("SELECT SUM(jumlah * harga) as jumlah, SUM(kasbon) as kasbon, SUM((jumlah * harga) - kasbon) as total FROM tb_pegawai_cutting WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
			$get_gaji_jahit = $this->db->query("SELECT SUM(jumlah * harga) as jumlah, SUM(kasbon) as kasbon, SUM((jumlah * harga) - kasbon) as total FROM tb_pegawai_jahit WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
			$get_gaji_qc = $this->db->query("SELECT SUM(jumlah * harga) as jumlah, SUM(kasbon) as kasbon, SUM((jumlah * harga) - kasbon) as total FROM tb_pegawai_qc WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
			$total_jumlah = $get_gaji_cutting['jumlah'] + $get_gaji_jahit['jumlah'] + $get_gaji_qc['jumlah'];
			$total_kasbon = $get_gaji_cutting['kasbon'] + $get_gaji_jahit['kasbon'] + $get_gaji_qc['kasbon'];
			$total_total = $get_gaji_cutting['total'] + $get_gaji_jahit['total'] + $get_gaji_qc['total'];

			if(($total_jumlah == 0) && ($total_kasbon == 0) && ($total_total == 0)){
				
			}else{
				$data = [
					'id_gaji_produksi' => $id_gaji_produksi,
					'id_pegawai' => $id_pegawai,
					'jumlah' => $total_jumlah,
					'kasbon' => $total_kasbon,
					'total' => $total_total
				];

				$this->db->insert('tb_detail_gaji_produksi', $data);
			}
			
		}
		$sum_gaji = $this->db->query("SELECT SUM(total) as total FROM tb_detail_gaji_produksi WHERE id_gaji_produksi='$id_gaji_produksi'")->row_array();
		$data = [
			'id_gaji_produksi' => $id_gaji_produksi,
			'jumlah' => $sum_gaji['total'],
			'status' => 1
		];
		$this->M_gaji_produksi->update($data);

		$this->session->set_flashdata('msg', 'generate');
		redirect('gaji-produksi');
	}

	public function approve($id_gaji_produksi)
	{
		$data_user	= [
			'id_gaji_produksi'		=> $id_gaji_produksi,
			'status'			=> 2,
		];

		$this->M_gaji_produksi->update($data_user);
		$this->session->set_flashdata('msg', 'verifikasi');
		redirect('gaji-produksi');
	}

	public function posting($id_gaji_produksi)
	{
		$pemasukan		= $this->db->select_sum('jumlah')->from('tb_pemasukan')->get()->row_array();
		$pengeluaran		= $this->db->select_sum('jumlah')->from('tb_pengeluaran')->get()->row_array();
		$saldo = $pemasukan['jumlah'] - $pengeluaran['jumlah'];

		$gp = $this->M_gaji_produksi->get_by_id($id_gaji_produksi);

		if($saldo < $gp['jumlah']){
			$this->session->set_flashdata('msg', 'saldo-tidak-cukup');
			redirect('gaji-produksi');
		}

		$data = [
			'tanggal' => $gp['tanggal_pencairan'],
			'id_jenis_pengeluaran' => $gp['id_jenis_pengeluaran'],
			'keterangan' => $gp['keterangan'],
			'referensi' => '-',
			'jumlah' => $gp['jumlah']
		];
		$this->M_pengeluaran->insert($data);
		$data = [
			'id_gaji_produksi' => $id_gaji_produksi,
			'status' => 3
		];
		$this->M_gaji_produksi->update($data);
		$this->session->set_flashdata('msg', 'posting');
		redirect('gaji-produksi');
	}

	public function detail($id_gaji_produksi)
	{
    $data['title']		= 'Data Gaji Produksi';
		$data['gaji_produksi']		= $this->db->select('*')
		->from('tb_detail_gaji_produksi')
		->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_detail_gaji_produksi.id_pegawai')
		->where('tb_detail_gaji_produksi.id_gaji_produksi', $id_gaji_produksi)
		->get()->result_array();
		$this->load->view('gaji_produksi/detail', $data);
	}

	public function detail_gaji($id_gaji_produksi, $id_pegawai)
	{
		$gaji = $this->M_gaji_produksi->get_by_id($id_gaji_produksi);
		$tanggal_pencairan = $gaji['tanggal_pencairan'];

    $data['title']		= 'Detail Gaji Produksi';
		$data['id_gaji_produksi'] = $id_gaji_produksi;
		$data['pegawai'] = $this->M_pegawai->get_by_id($id_pegawai);
		$data['cutting'] = $this->db->query("SELECT * FROM tb_pegawai_cutting, tb_order, tb_produk, tb_pelanggan WHERE tb_pegawai_cutting.id_order=tb_order.id_order AND tb_order.id_produk=tb_produk.id_produk AND tb_order.id_pelanggan=tb_pelanggan.id_pelanggan AND tb_pegawai_cutting.id_pegawai='$id_pegawai' AND tb_pegawai_cutting.tgl_cair='$tanggal_pencairan'")->result_array();
		$data['jahit'] = $this->db->query("SELECT * FROM tb_pegawai_jahit, tb_order, tb_produk, tb_pelanggan WHERE tb_pegawai_jahit.id_order=tb_order.id_order AND tb_order.id_produk=tb_produk.id_produk AND tb_order.id_pelanggan=tb_pelanggan.id_pelanggan AND tb_pegawai_jahit.id_pegawai='$id_pegawai' AND tb_pegawai_jahit.tgl_cair='$tanggal_pencairan'")->result_array();
		$data['qc'] = $this->db->query("SELECT * FROM tb_pegawai_qc, tb_order, tb_produk, tb_pelanggan WHERE tb_pegawai_qc.id_order=tb_order.id_order AND tb_order.id_produk=tb_produk.id_produk AND tb_order.id_pelanggan=tb_pelanggan.id_pelanggan AND tb_pegawai_qc.id_pegawai='$id_pegawai' AND tb_pegawai_qc.tgl_cair='$tanggal_pencairan'")->result_array();
		$this->load->view('gaji_produksi/detail_gaji_by_pegawai', $data);
	}

	public function cetak_slip($id_gaji_produksi, $id_pegawai)
	{
		$gaji = $this->M_gaji_produksi->get_by_id($id_gaji_produksi);
		$tanggal_pencairan = $gaji['tanggal_pencairan'];

    $data['title']		= 'Slip Gaji Produksi';
		$data['id_gaji_produksi'] = $id_gaji_produksi;
		$data['pegawai'] = $this->M_pegawai->get_by_id($id_pegawai);
		$data['cutting'] = $this->db->query("SELECT * FROM tb_pegawai_cutting WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->result_array();
		$data['jahit'] = $this->db->query("SELECT * FROM tb_pegawai_jahit WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->result_array();
		$data['qc'] = $this->db->query("SELECT * FROM tb_pegawai_qc WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->result_array();
		$data['total_cutting'] = $this->db->query("SELECT sum(jumlah*harga) as upah, sum(kasbon) as kasbon, sum(jumlah*harga-kasbon) as total FROM tb_pegawai_cutting WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
		$data['total_jahit'] = $this->db->query("SELECT sum(jumlah*harga) as upah, sum(kasbon) as kasbon, sum(jumlah*harga-kasbon) as total FROM tb_pegawai_jahit WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
		$data['total_qc'] = $this->db->query("SELECT sum(jumlah*harga) as upah, sum(kasbon) as kasbon, sum(jumlah*harga-kasbon) as total FROM tb_pegawai_qc WHERE id_pegawai='$id_pegawai' AND tgl_cair='$tanggal_pencairan'")->row_array();
		$data['total_upah'] = $data['total_cutting']['upah'] + $data['total_jahit']['upah'] + $data['total_qc']['upah'];
		$data['total_kasbon'] = $data['total_cutting']['kasbon'] + $data['total_jahit']['kasbon'] + $data['total_qc']['kasbon'];
		$data['total_upah_dibayar'] = $data['total_cutting']['total'] + $data['total_jahit']['total'] + $data['total_qc']['total'];
		$this->load->view('gaji_produksi/cetak_slip_gaji_produksi', $data);
	}
}
