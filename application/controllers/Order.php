<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller {

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
    $data['title']		= 'Data Order';
		$data['order']		= $this->M_order->get_data(is_admin() || is_produksi() || is_owner() || is_keuangan() || is_purchase() ? null : $this->session->userdata('id_pegawai'), null, true)->result_array();
		$this->load->view('order/data', $data);
	}

	public function all()
	{
    $data['title']		= 'Order Belum Dikonfirmasi';
		$this->db->select('*');
		$this->db->from('tb_order');
		$this->db->join('tb_produk', 'tb_produk.id_produk=tb_order.id_produk');
		$this->db->join('tb_pelanggan', 'tb_pelanggan.id_pelanggan=tb_order.id_pelanggan');
		$this->db->where('tb_order.id_pegawai =', 0);
		$data['order']		= $this->db->get()->result_array();
		$this->load->view('order/data_all', $data);
	}

	public function detail_all($id_order)
	{
    $data['title']		= 'Order Belum Dikonfirmasi';
		$data['order']		= $this->M_order->get_all_by_id($id_order);
		$data['jumlah_order'] = $data['order']['jumlah_ukuran_s'] + $data['order']['jumlah_ukuran_m'] + $data['order']['jumlah_ukuran_l'] + $data['order']['jumlah_ukuran_xl'] + $data['order']['jumlah_ukuran_xxl']
		+ $data['order']['jumlah_ukuran_s_p'] + $data['order']['jumlah_ukuran_m_p'] + $data['order']['jumlah_ukuran_l_p'] + $data['order']['jumlah_ukuran_xl_p'] + $data['order']['jumlah_ukuran_xxl_p'];
		$this->load->view('order/detail_all', $data);
	}

	public function confirm($id_order)
	{
		$data = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'status_order'			=> 0,
		];
		$this->db->where('id_order', $id_order);
		$this->db->update('tb_order', $data);
		$this->add_detail_order($id_order);
		$this->session->set_flashdata('msg', 'confirm');
		redirect('order');
	}

	public function riwayat()
	{
    $data['title']		= 'Riwayat Order';
		$data['order']		= $this->M_order->get_data_riwayat()->result_array();
		$this->load->view('order/data_riwayat', $data);
	}

	public function ulasan()
	{
    $data['title']		= 'Ulasan Order';
		$data['order']		= $this->M_order->get_data_ulasan()->result_array();
		$this->load->view('order/data_ulasan', $data);
	}

	public function laporan()
	{
    $data['title']		= 'Laporan Order';
		$data['order']		= $this->M_order->get_data_riwayat()->result_array();
		$this->load->view('order/data_laporan', $data);
	}

	public function tambah()
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Order';
			$data['produk']		= $this->M_produk->get_data()->result_array();
			$data['pelanggan']		= $this->M_pelanggan->get_data()->result_array();
			$this->load->view('order/tambah', $data);
		} else {
			$data		= $this->input->post(null, true);
			$file = $this->upload_file('design_order');
			$data_user	= [
				'tgl_order'			=> $data['tgl_order'],
				'id_pelanggan'			=> $data['id_pelanggan'],
				'id_produk'			=> $data['id_produk'],
				'jumlah_ukuran_s'			=> $data['jumlah_ukuran_s'],
				'jumlah_ukuran_m'			=> $data['jumlah_ukuran_m'],
				'jumlah_ukuran_l'			=> $data['jumlah_ukuran_l'],
				'jumlah_ukuran_xl'			=> $data['jumlah_ukuran_xl'],
				'jumlah_ukuran_xxl'			=> $data['jumlah_ukuran_xxl'],
				'jumlah_ukuran_s_p'			=> $data['jumlah_ukuran_s_p'],
				'jumlah_ukuran_m_p'			=> $data['jumlah_ukuran_m_p'],
				'jumlah_ukuran_l_p'			=> $data['jumlah_ukuran_l_p'],
				'jumlah_ukuran_xl_p'			=> $data['jumlah_ukuran_xl_p'],
				'jumlah_ukuran_xxl_p'			=> $data['jumlah_ukuran_xxl_p'],
				'design_order'		=> $file,
				'catatan'			=> $data['catatan'],
				'id_pegawai' => $this->session->userdata('id_pegawai'),
				'status_order'			=> 0,
				'created_at' => date('Y-m-d H:i:s')
			];
			if ($this->M_order->insert($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('tambah-order');
			} else {
				$order = $this->db->select('id_order')->from('tb_order')->order_by('id_order', 'DESC')->get()->row_array();
				$this->add_detail_order($order['id_order']);
				$judul = "Notifikasi Kojo Cloth";
				$konten = "Ada 1 Order Baru!";
				$url = "https://kojo-cloth.elearningpolsub.com/order";
				$this->session->set_flashdata('msg', 'success');
				redirect('order');
			}
		}
	}

	public function edit($id_order)
	{
		$this->validation();
		if (!$this->form_validation->run()) {
			$data['title']		= 'Data Order';
			$data['order']	= $this->M_order->get_by_id($id_order);
			$data['produk']		= $this->M_produk->get_data()->result_array();
			$data['pelanggan']		= $this->M_pelanggan->get_data()->result_array();
			$this->load->view('order/edit', $data);
		} else {
			$data		= $this->input->post(null, true);
			if (empty($_FILES['design_order']['name'])) {
				$file = $data['design_order_old'];
			}else{
				$file = $this->upload_file('design_order');
			}
			$data_user	= [
				'id_order'		=> $id_order,
				'tgl_order'			=> $data['tgl_order'],
				'id_pelanggan'			=> $data['id_pelanggan'],
				'id_produk'			=> $data['id_produk'],
				'jumlah_ukuran_s'			=> $data['jumlah_ukuran_s'],
				'jumlah_ukuran_m'			=> $data['jumlah_ukuran_m'],
				'jumlah_ukuran_l'			=> $data['jumlah_ukuran_l'],
				'jumlah_ukuran_xl'			=> $data['jumlah_ukuran_xl'],
				'jumlah_ukuran_xxl'			=> $data['jumlah_ukuran_xxl'],
				'jumlah_ukuran_s_p'			=> $data['jumlah_ukuran_s_p'],
				'jumlah_ukuran_m_p'			=> $data['jumlah_ukuran_m_p'],
				'jumlah_ukuran_l_p'			=> $data['jumlah_ukuran_l_p'],
				'jumlah_ukuran_xl_p'			=> $data['jumlah_ukuran_xl_p'],
				'jumlah_ukuran_xxl_p'			=> $data['jumlah_ukuran_xxl_p'],
				'design_order'		=> $file,
				'catatan'			=> $data['catatan'],
				'status_order'			=> $data['status_order']
			];
			
			if ($this->M_order->update($data_user)) {
				$this->session->set_flashdata('msg', 'error');
				redirect('edit-order/'.$id_order);
			} else {
				$this->session->set_flashdata('msg', 'edit');
				redirect('order');
			}
		}
	}

	private function validation()
	{
		$this->form_validation->set_rules('tgl_order', 'Tgl Order', 'required|trim');
		$this->form_validation->set_rules('id_produk', 'Produk', 'required|trim');
		$this->form_validation->set_rules('id_pelanggan', 'Pelanggan', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_s', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_m', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_l', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_xl', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_xxl', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_s_p', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_m_p', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_l_p', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_xl_p', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('jumlah_ukuran_xxl_p', 'Jumlah', 'required|trim');
		$this->form_validation->set_rules('catatan', 'Catatan', 'required|trim');
		
	} 

	private function add_detail_order($id_order)
	{
		$this->db->insert('tb_keuangan', ['id_order' => $id_order]);
		$this->db->insert('tb_purchase', ['id_order' => $id_order]);
		$this->db->insert('tb_cutting', ['id_order' => $id_order]);
		$this->db->insert('tb_bordir', ['id_order' => $id_order]);
		$this->db->insert('tb_jahit', ['id_order' => $id_order]);
		$this->db->insert('tb_qc', ['id_order' => $id_order]);
		$this->db->insert('tb_pengiriman', ['id_order' => $id_order]);

		return true;
	}

	public function hapus($id_order)
	{
		$this->M_order->delete($id_order);
		$this->session->set_flashdata('msg', 'hapus');
		redirect('order');
	}

	public function detail($id_order)
	{
    $data['title']		= 'Data Order';
		$data['order']		= $this->M_order->get_by_id($id_order);
		$data['produk']		= $this->M_produk->get_by_id($data['order']['id_produk']);
		$data['jumlah_order_pendek']		= $data['order']['jumlah_ukuran_s'] + $data['order']['jumlah_ukuran_m'] + $data['order']['jumlah_ukuran_l'] + $data['order']['jumlah_ukuran_xl'] + $data['order']['jumlah_ukuran_xxl'];
		$data['jumlah_order_panjang']		= $data['order']['jumlah_ukuran_s_p'] + $data['order']['jumlah_ukuran_m_p'] + $data['order']['jumlah_ukuran_l_p'] + $data['order']['jumlah_ukuran_xl_p'] + $data['order']['jumlah_ukuran_xxl_p'];
		$data['keuangan']		= $this->db->get_where('tb_keuangan', ['id_order' => $id_order])->row_array();
		$data['purchase']		= $this->db->get_where('tb_purchase', ['id_order' => $id_order])->row_array();
		$data['cutting']		= $this->db->get_where('tb_cutting', ['id_order' => $id_order])->row_array();
		$data['bordir']		= $this->db->get_where('tb_bordir', ['id_order' => $id_order])->row_array();
		$data['jahit']		= $this->db->get_where('tb_jahit', ['id_order' => $id_order])->row_array();
		$data['qc']		= $this->db->get_where('tb_qc', ['id_order' => $id_order])->row_array();
		$data['pengiriman']		= $this->db->get_where('tb_pengiriman', ['id_order' => $id_order])->row_array();
		$data['pegawai']		= $this->db->get_where('tb_pegawai', ['jabatan' => 'Pegawai Produksi'])->result_array();
		$this->db->select('*, tb_pegawai_cutting.id_pegawai as id_pegawai')->from('tb_pegawai_cutting')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_cutting.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_cutting.id_order')->where('tb_pegawai_cutting.id_order', $id_order);
		$data['pegawai_cutting']		= $this->db->get()->result_array();
		$this->db->select('*, tb_pegawai_jahit.id_pegawai as id_pegawai')->from('tb_pegawai_jahit')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_jahit.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_jahit.id_order')->where('tb_pegawai_jahit.id_order', $id_order);
		$data['pegawai_jahit']		= $this->db->get()->result_array();
		$this->db->select('*, tb_pegawai_qc.id_pegawai as id_pegawai')->from('tb_pegawai_qc')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_qc.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_qc.id_order')->where('tb_pegawai_qc.id_order', $id_order);
		$data['pegawai_qc']		= $this->db->get()->result_array();
		$data['jumlah_order'] = $data['order']['jumlah_ukuran_s'] + $data['order']['jumlah_ukuran_m'] + $data['order']['jumlah_ukuran_l'] + $data['order']['jumlah_ukuran_xl'] + $data['order']['jumlah_ukuran_xxl']
		+ $data['order']['jumlah_ukuran_s_p'] + $data['order']['jumlah_ukuran_m_p'] + $data['order']['jumlah_ukuran_l_p'] + $data['order']['jumlah_ukuran_xl_p'] + $data['order']['jumlah_ukuran_xxl_p'];
		$data['upah_cutting'] = $this->db->get_where('tb_upah_produksi', ['jenis_produk' => $data['produk']['jenis_produk'], 'jenis_pekerjaan' => 'Cutting', 'status' => 1])->row_array();
		$data['upah_jahit'] = $this->db->get_where('tb_upah_produksi', ['jenis_produk' => $data['produk']['jenis_produk'], 'jenis_pekerjaan' => 'Jahit', 'status' => 1])->row_array();
		$data['upah_qc'] = $this->db->get_where('tb_upah_produksi', ['jenis_produk' => $data['produk']['jenis_produk'], 'jenis_pekerjaan' => 'QC', 'status' => 1])->row_array();

		$data['jml_all_cutting'] = $this->db->query("SELECT SUM(jumlah) as jumlah FROM `tb_pegawai_cutting` where id_order='$id_order'")->row_array();
		$data['jml_all_jahit'] = $this->db->query("SELECT SUM(jumlah) as jumlah FROM `tb_pegawai_jahit` where id_order='$id_order'")->row_array();
		$data['jml_all_qc'] = $this->db->query("SELECT SUM(jumlah) as jumlah FROM `tb_pegawai_qc` where id_order='$id_order'")->row_array();
		$data['jml_cutting_s'] = $this->db->query("SELECT SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_cutting` where id_order='$id_order' AND detail_ukuran='S'")->row_array();
		$data['jml_cutting_m'] = $this->db->query("SELECT SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_cutting` where id_order='$id_order' AND detail_ukuran='M'")->row_array();
		$data['jml_cutting_l'] = $this->db->query("SELECT SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_cutting` where id_order='$id_order' AND detail_ukuran='L'")->row_array();
		$data['jml_cutting_xl'] = $this->db->query("SELECT SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_cutting` where id_order='$id_order' AND detail_ukuran='XL'")->row_array();
		$data['jml_cutting_xxl'] = $this->db->query("SELECT SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_cutting` where id_order='$id_order' AND detail_ukuran='XXL'")->row_array();
		$data['jml_jahit_s'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_jahit` where id_order='$id_order' AND detail_ukuran='S'")->row_array();
		$data['jml_jahit_m'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_jahit` where id_order='$id_order' AND detail_ukuran='M'")->row_array();
		$data['jml_jahit_l'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_jahit` where id_order='$id_order' AND detail_ukuran='L'")->row_array();
		$data['jml_jahit_xl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_jahit` where id_order='$id_order' AND detail_ukuran='XL'")->row_array();
		$data['jml_jahit_xxl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah, detail_ukuran FROM `tb_pegawai_jahit` where id_order='$id_order' AND detail_ukuran='XXL'")->row_array();
		$data['jml_qc_s'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Lolos' AND detail_ukuran='S' GROUP BY id_order")->row_array();
		$data['jml_qc_m'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Lolos' AND detail_ukuran='M' GROUP BY id_order")->row_array();
		$data['jml_qc_l'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Lolos' AND detail_ukuran='L' GROUP BY id_order")->row_array();
		$data['jml_qc_xl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Lolos' AND detail_ukuran='XL' GROUP BY id_order")->row_array();
		$data['jml_qc_xxl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Lolos' AND detail_ukuran='XXL' GROUP BY id_order")->row_array();
		$data['jml_qc_tl_s'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Tidak Lolos' AND detail_ukuran='S' GROUP BY id_order")->row_array();
		$data['jml_qc_tl_m'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Tidak Lolos' AND detail_ukuran='M' GROUP BY id_order")->row_array();
		$data['jml_qc_tl_l'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Tidak Lolos' AND detail_ukuran='L' GROUP BY id_order")->row_array();
		$data['jml_qc_tl_xl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Tidak Lolos' AND detail_ukuran='XL' GROUP BY id_order")->row_array();
		$data['jml_qc_tl_xxl'] = $this->db->query("SELECT SUM(ukuran_pendek) as jml, SUM(ukuran_panjang) as jml_p, SUM(jumlah) as jumlah FROM `tb_pegawai_qc`where id_order='$id_order' AND keterangan='Tidak Lolos' AND detail_ukuran='XXL' GROUP BY id_order")->row_array();
		$this->load->view('order/detail', $data);
	}

	public function cetak($id_order)
	{
		$this->load->library('pdf');
    $data['title']		= 'Data Order';
		$data['order']		= $this->M_order->get_by_id($id_order);
		$this->db->select('*, tb_pegawai_cutting.id_pegawai as id_pegawai')->from('tb_pegawai_cutting')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_cutting.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_cutting.id_order')->where('tb_pegawai_cutting.id_order', $id_order);
		$data['pegawai_cutting']		= $this->db->get()->result_array();
		$this->db->select('*, tb_pegawai_jahit.id_pegawai as id_pegawai')->from('tb_pegawai_jahit')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_jahit.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_jahit.id_order')->where('tb_pegawai_jahit.id_order', $id_order);
		$data['pegawai_jahit']		= $this->db->get()->result_array();
		$this->db->select('*, tb_pegawai_qc.id_pegawai as id_pegawai')->from('tb_pegawai_qc')->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pegawai_qc.id_pegawai')->join('tb_order', 'tb_order.id_order=tb_pegawai_qc.id_order')->where('tb_pegawai_qc.id_order', $id_order);
		$data['pegawai_qc']		= $this->db->get()->result_array();
		
		$html_content = $this->load->view('order/cetak', $data, true);
		$filename = 'Laporan Order - '.$data['order']['nama_pelanggan'].'('.$data['order']['no_telepon'].')'.' .pdf';

		$this->pdf->loadHtml($html_content);

		$this->pdf->set_paper('a4','potrait');
		
		$this->pdf->render();
		$this->pdf->stream($filename, ['Attachment' => 1]);
		//$this->load->view('order/cetak', $data);
	}

	public function cetak_bom_list($id_order)
	{
		$this->load->library('pdf');
		$data['title']		= 'Data Order';
		$data['order']		= $this->M_order->get_by_id($id_order);
		$data['produk']		= $this->M_produk->get_by_id($data['order']['id_produk']);
		$order		= $this->M_order->get_by_id($id_order);
		$produk		= $this->M_produk->get_by_id($data['order']['id_produk']);

		$data['jml_benang'] = ($data['order']['jumlah_ukuran_s'] + 
		$data['order']['jumlah_ukuran_m'] + 
		$data['order']['jumlah_ukuran_l'] + 
		$data['order']['jumlah_ukuran_xl'] + 
		$data['order']['jumlah_ukuran_xxl'] + 
		$data['order']['jumlah_ukuran_s_p'] + 
		$data['order']['jumlah_ukuran_m_p'] + 
		$data['order']['jumlah_ukuran_l_p'] + 
		$data['order']['jumlah_ukuran_xl_p'] + 
		$data['order']['jumlah_ukuran_xxl_p']) * $produk['jml_benang'];
		$data['total_harga_benang'] = $data['jml_benang'] * $produk['harga_benang'];

		$data['jml_kain_s'] = ($order['jumlah_ukuran_s'] * $produk['pnj_kain_s']) + ($order['jumlah_ukuran_s_p'] * $produk['pnj_kain_s_p']);
		$data['jml_kain_m'] = ($order['jumlah_ukuran_m'] * $produk['pnj_kain_m']) + ($order['jumlah_ukuran_m_p'] * $produk['pnj_kain_m_p']);
		$data['jml_kain_l'] = ($order['jumlah_ukuran_l'] * $produk['pnj_kain_l']) + ($order['jumlah_ukuran_l_p'] * $produk['pnj_kain_l_p']);
		$data['jml_kain_xl'] = ($order['jumlah_ukuran_xl'] * $produk['pnj_kain_xl']) + ($order['jumlah_ukuran_xl_p'] * $produk['pnj_kain_xl_p']);
		$data['jml_kain_xxl'] = ($order['jumlah_ukuran_xxl'] * $produk['pnj_kain_xxl']) + ($order['jumlah_ukuran_xxl_p'] * $produk['pnj_kain_xxl_p']);
		$data['total_harga_kain'] = ($data['jml_kain_s'] * $produk['harga_kain']) + 
		($data['jml_kain_m'] * $produk['harga_kain']) + 
		($data['jml_kain_l'] * $produk['harga_kain']) + 
		($data['jml_kain_xl'] * $produk['harga_kain']) + 
		($data['jml_kain_xxl'] * $produk['harga_kain']);

		$data['jml_kancing_s'] = ($order['jumlah_ukuran_s'] + $order['jumlah_ukuran_s_p']) * $produk['jml_kancing_s'];
		$data['jml_kancing_m'] = ($order['jumlah_ukuran_m'] + $order['jumlah_ukuran_m_p']) * $produk['jml_kancing_m'];
		$data['jml_kancing_l'] = ($order['jumlah_ukuran_l'] + $order['jumlah_ukuran_l_p']) * $produk['jml_kancing_l'];
		$data['jml_kancing_xl'] = ($order['jumlah_ukuran_xl'] + $order['jumlah_ukuran_xl_p']) * $produk['jml_kancing_xl'];
		$data['jml_kancing_xxl'] = ($order['jumlah_ukuran_xxl'] + $order['jumlah_ukuran_xxl_p']) * $produk['jml_kancing_xxl'];
		$data['total_harga_kancing'] = ($data['jml_kancing_s'] * $produk['harga_kancing']) + 
		($data['jml_kancing_m'] * $produk['harga_kancing']) + 
		($data['jml_kancing_l'] * $produk['harga_kancing']) + 
		($data['jml_kancing_xl'] * $produk['harga_kancing']) + 
		($data['jml_kancing_xxl'] * $produk['harga_kancing']);

		$data['jml_resleting_s'] = ($order['jumlah_ukuran_s'] + $order['jumlah_ukuran_s_p']) * $produk['pnj_resleting_s'];
		$data['jml_resleting_m'] = ($order['jumlah_ukuran_m'] + $order['jumlah_ukuran_m_p']) * $produk['pnj_resleting_m'];
		$data['jml_resleting_l'] = ($order['jumlah_ukuran_l'] + $order['jumlah_ukuran_l_p']) * $produk['pnj_resleting_l'];
		$data['jml_resleting_xl'] = ($order['jumlah_ukuran_xl'] + $order['jumlah_ukuran_xl_p']) * $produk['pnj_resleting_xl'];
		$data['jml_resleting_xxl'] = ($order['jumlah_ukuran_xxl'] + $order['jumlah_ukuran_xxl_p']) * $produk['pnj_resleting_xxl'];
		$data['total_harga_resleting'] = ($data['jml_resleting_s'] * $produk['harga_resleting']) + 
		($data['jml_resleting_m'] * $produk['harga_resleting']) + 
		($data['jml_resleting_l'] * $produk['harga_resleting']) + 
		($data['jml_resleting_xl'] * $produk['harga_resleting']) + 
		($data['jml_resleting_xxl'] * $produk['harga_resleting']);

		$data['jml_prepet_s'] = ($order['jumlah_ukuran_s'] + $order['jumlah_ukuran_s_p']) * $produk['jml_prepet_s'];
		$data['jml_prepet_m'] = ($order['jumlah_ukuran_m'] + $order['jumlah_ukuran_m_p']) * $produk['jml_prepet_m'];
		$data['jml_prepet_l'] = ($order['jumlah_ukuran_l'] + $order['jumlah_ukuran_l_p']) * $produk['jml_prepet_l'];
		$data['jml_prepet_xl'] = ($order['jumlah_ukuran_xl'] + $order['jumlah_ukuran_xl_p']) * $produk['jml_prepet_xl'];
		$data['jml_prepet_xxl'] = ($order['jumlah_ukuran_xxl'] + $order['jumlah_ukuran_xxl_p']) * $produk['jml_prepet_xxl'];
		$data['total_harga_prepet'] = ($data['jml_prepet_s'] * $produk['harga_prepet']) + 
		($data['jml_prepet_m'] * $produk['harga_prepet']) + 
		($data['jml_prepet_l'] * $produk['harga_prepet']) + 
		($data['jml_prepet_xl'] * $produk['harga_prepet']) + 
		($data['jml_prepet_xxl'] * $produk['harga_prepet']);

		$data['jml_rib_s'] = ($order['jumlah_ukuran_s'] + $order['jumlah_ukuran_s_p']) * $produk['pnj_rib_s'];
		$data['jml_rib_m'] = ($order['jumlah_ukuran_m'] + $order['jumlah_ukuran_m_p']) * $produk['pnj_rib_m'];
		$data['jml_rib_l'] = ($order['jumlah_ukuran_l'] + $order['jumlah_ukuran_l_p']) * $produk['pnj_rib_l'];
		$data['jml_rib_xl'] = ($order['jumlah_ukuran_xl'] + $order['jumlah_ukuran_xl_p']) * $produk['pnj_rib_xl'];
		$data['jml_rib_xxl'] = ($order['jumlah_ukuran_xxl'] + $order['jumlah_ukuran_xxl_p']) * $produk['pnj_rib_xxl'];
		$data['total_harga_rib'] = ($data['jml_rib_s'] * $produk['harga_rib']) + 
		($data['jml_rib_m'] * $produk['harga_rib']) + 
		($data['jml_rib_l'] * $produk['harga_rib']) + 
		($data['jml_rib_xl'] * $produk['harga_rib']) + 
		($data['jml_rib_xxl'] * $produk['harga_rib']);

		$data['total_biaya'] = $data['total_harga_benang'] + $data['total_harga_kain'] + $data['total_harga_kancing'] + $data['total_harga_resleting'] + $data['total_harga_prepet'] + $data['total_harga_rib'];

		$this->db->where('id_order', $id_order);
		$this->db->update('tb_order', ['total_harga_bomlist' => $data['total_biaya']]);
		
		$html_content = $this->load->view('order/cetak_bom_list', $data, true);
		$filename = 'BOM List .pdf';

		$this->pdf->loadHtml($html_content);

		$this->pdf->set_paper('a4','potrait');
		
		$this->pdf->render();
		$this->pdf->stream($filename, ['Attachment' => 1]);
    
		//$this->load->view('order/cetak', $data);
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

	public function download_file($file)
	{
		$file = explode("7C", $file);
		force_download('/assets/upload/file_keuangan/5533-15688-1-PB.pdf', NULL);
	}

	private function update_progres($id_order, $progress)
	{
		$data_user	= [
			'id_order'		=> $id_order,
			'progres'			=> $progress
		];
		
		$this->M_order->update($data_user);

		return true;
	}

	public function update_keuangan($id_order, $id_keuangan)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_keuangan']['name'])) {
			$file = $data['file_keuangan_old'];
		}else{
			$file = $this->upload_file('file_keuangan');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_keuangan' => $file,
			'catatan_keuangan' => $data['catatan_keuangan'],
			'status_keuangan' => $data['status_keuangan']
		];

		$this->db->where('id_keuangan', $id_keuangan);
		$this->db->update('tb_keuangan', $data_);

		$this->update_progres($id_order, 'Keuangan - '.status_text($data['status_keuangan']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_purchase($id_order, $id_purchase)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_purchase']['name'])) {
			$file = $data['file_purchase_old'];
		}else{
			$file = $this->upload_file('file_purchase');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_purchase' => $file,
			'catatan_purchase' => $data['catatan_purchase'],
			'status_purchase' => $data['status_purchase']
		];

		$this->db->where('id_purchase', $id_purchase);
		$this->db->update('tb_purchase', $data_);

		$this->update_progres($id_order, 'Purchase - '.status_text($data['status_purchase']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_cutting($id_order, $id_cutting)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_cutting']['name'])) {
			$file = $data['file_cutting_old'];
		}else{
			$file = $this->upload_file('file_cutting');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_cutting' => $file,
			'catatan_cutting' => $data['catatan_cutting'],
			'status_cutting' => $data['status_cutting']
		];

		$this->db->where('id_cutting', $id_cutting);
		$this->db->update('tb_cutting', $data_);

		$this->update_progres($id_order, 'Cutting - '.status_text($data['status_cutting']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_bordir($id_order, $id_bordir)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_bordir']['name'])) {
			$file = $data['file_bordir_old'];
		}else{
			$file = $this->upload_file('file_bordir');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_bordir' => $file,
			'catatan_bordir' => $data['catatan_bordir'],
			'status_bordir' => $data['status_bordir']
		];

		$this->db->where('id_bordir', $id_bordir);
		$this->db->update('tb_bordir', $data_);

		$this->update_progres($id_order, 'Bordir - '.status_text($data['status_bordir']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_jahit($id_order, $id_jahit)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_jahit']['name'])) {
			$file = $data['file_jahit_old'];
		}else{
			$file = $this->upload_file('file_jahit');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_jahit' => $file,
			'catatan_jahit' => $data['catatan_jahit'],
			'status_jahit' => $data['status_jahit']
		];

		$this->db->where('id_jahit', $id_jahit);
		$this->db->update('tb_jahit', $data_);

		$this->update_progres($id_order, 'Jahit - '.status_text($data['status_jahit']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_qc($id_order, $id_qc)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_qc']['name'])) {
			$file = $data['file_qc_old'];
		}else{
			$file = $this->upload_file('file_qc');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_qc' => $file,
			'catatan_qc' => $data['catatan_qc'],
			'status_qc' => $data['status_qc']
		];

		$this->db->where('id_qc', $id_qc);
		$this->db->update('tb_qc', $data_);

		$this->update_progres($id_order, 'QC & Package - '.status_text($data['status_qc']));

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function update_pengiriman($id_order, $id_pengiriman)
	{
		$data		= $this->input->post(null, true);
		if (empty($_FILES['file_pengiriman']['name'])) {
			$file = $data['file_pengiriman_old'];
		}else{
			$file = $this->upload_file('file_pengiriman');
		}

		$data_ = [
			'id_pegawai' => $this->session->userdata('id_pegawai'),
			'file_pengiriman' => $file,
			'catatan_pengiriman' => $data['catatan_pengiriman'],
			'status_pengiriman' => $data['status_pengiriman']
		];

		$this->db->where('id_pengiriman', $id_pengiriman);
		$this->db->update('tb_pengiriman', $data_);

		$this->update_progres($id_order, 'Pengiriman - '.status_text($data['status_pengiriman']));

		if ($data['status_pengiriman'] == 4) {
			$data_user	= [
				'id_order'		=> $id_order,
				'status_order'			=> $data['status_pengiriman']
			];
			
			$this->M_order->update($data_user);
		}
		

		$this->session->set_flashdata('msg', 'update-status');
		redirect('detail-order/'.$id_order);
	}

	public function tambah_pegawai_cutting($id_order)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'pola_potongan' => $data['pola_potongan'],
			'detail_ukuran' => $data['detail_ukuran'],
			'catatan_potongan' => $data['catatan_potongan'],
			'created_at' => date('Y-m-d H:i:s')
		];

		$cek = $this->db->get_where('tb_pegawai_cutting', ['id_pegawai' => $data['id_pegawai'], 'pola_potongan' => $data['pola_potongan'], 'detail_ukuran' => $data['detail_ukuran'], 'tgl_cair' => $data['tgl_cair']]);

		if($cek->num_rows() > 0 ){
			$this->session->set_flashdata('msg', 'error');
			redirect('detail-order/'.$id_order);
		}	

		$this->db->insert('tb_pegawai_cutting', $data_);

		$this->session->set_flashdata('msg', 'success');
		redirect('detail-order/'.$id_order);
	}

	public function edit_pegawai_cutting($id_order, $id_pegawai_cutting)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'pola_potongan' => $data['pola_potongan'],
			'detail_ukuran' => $data['detail_ukuran'],
			'catatan_potongan' => $data['catatan_potongan'],
		];

		$this->db->where('id_pegawai_cutting', $id_pegawai_cutting);
		$this->db->update('tb_pegawai_cutting', $data_);

		$this->session->set_flashdata('msg', 'edit');
		redirect('detail-order/'.$id_order);
	}

	public function hapus_pegawai_cutting($id_order, $id_pegawai_cutting)
	{
		$this->db->where('id_pegawai_cutting', $id_pegawai_cutting);
		$this->db->delete('tb_pegawai_cutting');

		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-order/'.$id_order);
	}

	public function tambah_pegawai_jahit($id_order)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'ukuran_pendek' => $data['ukuran_pendek'],
			'ukuran_panjang' => $data['ukuran_panjang'],
			'detail_ukuran' => $data['detail_ukuran'],
			'created_at' => date('Y-m-d H:i:s')
		];

		$cek = $this->db->get_where('tb_pegawai_jahit', ['id_pegawai' => $data['id_pegawai'], 'ukuran_pendek' => $data['ukuran_pendek'], 'ukuran_panjang' => $data['ukuran_panjang'], 'detail_ukuran' => $data['detail_ukuran'], 'tgl_cair' => $data['tgl_cair']]);

		if($cek->num_rows() > 0 ){
			$this->session->set_flashdata('msg', 'error');
			redirect('detail-order/'.$id_order);
		}	

		$this->db->insert('tb_pegawai_jahit', $data_);

		$this->session->set_flashdata('msg', 'success');
		redirect('detail-order/'.$id_order);
	}

	public function edit_pegawai_jahit($id_order, $id_pegawai_jahit)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'ukuran_pendek' => $data['ukuran_pendek'],
			'ukuran_panjang' => $data['ukuran_panjang'],
			'detail_ukuran' => $data['detail_ukuran'],
		];

		$this->db->where('id_pegawai_jahit', $id_pegawai_jahit);
		$this->db->update('tb_pegawai_jahit', $data_);

		$this->session->set_flashdata('msg', 'edit');
		redirect('detail-order/'.$id_order);
	}

	public function hapus_pegawai_jahit($id_order, $id_pegawai_jahit)
	{
		$this->db->where('id_pegawai_jahit', $id_pegawai_jahit);
		$this->db->delete('tb_pegawai_jahit');

		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-order/'.$id_order);
	}

	public function tambah_pegawai_qc($id_order)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'ukuran_pendek' => $data['ukuran_pendek'],
			'ukuran_panjang' => $data['ukuran_panjang'],
			'detail_ukuran' => $data['detail_ukuran'],
			'keterangan' => $data['keterangan'],
			'catatan_revisi' => $data['catatan_revisi'],
			'created_at' => date('Y-m-d H:i:s')
		];

		$cek = $this->db->get_where('tb_pegawai_qc', ['id_pegawai' => $data['id_pegawai'], 'ukuran_pendek' => $data['ukuran_pendek'], 'ukuran_panjang' => $data['ukuran_panjang'], 'detail_ukuran' => $data['detail_ukuran'], 'tgl_cair' => $data['tgl_cair']]);

		if($cek->num_rows() > 0 ){
			$this->session->set_flashdata('msg', 'error');
			redirect('detail-order/'.$id_order);
		}	

		$this->db->insert('tb_pegawai_qc', $data_);

		$this->session->set_flashdata('msg', 'success');
		redirect('detail-order/'.$id_order);
	}

	public function edit_pegawai_qc($id_order, $id_pegawai_qc)
	{
		$data		= $this->input->post(null, true);
		$data_ = [
			'id_order'	=> $id_order,
			'id_pegawai' => $data['id_pegawai'],
			'jumlah' => $data['jumlah'],
			'harga' => $data['harga'],
			'kasbon' => $data['kasbon'],
			'tgl_cair' => $data['tgl_cair'],
			'ukuran_pendek' => $data['ukuran_pendek'],
			'ukuran_panjang' => $data['ukuran_panjang'],
			'detail_ukuran' => $data['detail_ukuran'],
			'keterangan' => $data['keterangan'],
			'catatan_revisi' => $data['catatan_revisi'],
		];

		$this->db->where('id_pegawai_qc', $id_pegawai_qc);
		$this->db->update('tb_pegawai_qc', $data_);

		$this->session->set_flashdata('msg', 'edit');
		redirect('detail-order/'.$id_order);
	}

	public function hapus_pegawai_qc($id_order, $id_pegawai_qc)
	{
		$this->db->where('id_pegawai_qc', $id_pegawai_qc);
		$this->db->delete('tb_pegawai_qc');

		$this->session->set_flashdata('msg', 'hapus');
		redirect('detail-order/'.$id_order);
	}

	public function klasterisasi()
	{
		$this->db->truncate('tb_rekapitulasi');
    $data['title']		= 'Rangkum Order';
		$post_m = $this->input->post('month');
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}

		$pelanggan = $this->db->query("SELECT * FROM tb_pelanggan join tb_order ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) WHERE tb_order.tgl_order LIKE '$month%' GROUP BY tb_pelanggan.id_pelanggan")->result_array();

		$order = [];
		foreach ($pelanggan as $p) {
			$id_pelanggan = $p['id_pelanggan'];
			$jaket = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Jaket' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$kaos = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Kaos' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$jas = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Jas' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$kemeja = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Kemeja' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$sweater = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Sweater' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$jaket = is_null($jaket['jumlah']) ? 0 : (int)$jaket['jumlah'];
			$kaos = is_null($kaos['jumlah']) ? 0 : (int)$kaos['jumlah'];
			$jas = is_null($jas['jumlah']) ? 0 : (int)$jas['jumlah'];
			$kemeja = is_null($kemeja['jumlah']) ? 0 : (int)$kemeja['jumlah'];
			$sweater = is_null($sweater['jumlah']) ? 0 : (int)$sweater['jumlah'];
			$data = [
				'id_pelanggan' => $id_pelanggan,
				'jaket' => $jaket,
				'kaos' => $kaos,
				'jas' => $jas,
				'kemeja' => $kemeja,
				'sweater' => $sweater,
				'total' => $jaket+$kaos+$jas+$kemeja+$sweater,
			];

			$this->db->insert('tb_rekapitulasi', $data);

			//array_push($order, $data);
		}

		$count_all = $this->db->count_all('tb_rekapitulasi');
		$offset = ($count_all / 2) - 1;

		$c1 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` DESC")->row_array();
		$c2;
		if($offset <= 0){
			$c2 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC LIMIT 1")->row_array();
		}else{
			$c2 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC LIMIT 1 OFFSET $offset")->row_array();
		}
		
		$c3 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC")->row_array();

		$data['title']		= 'Rekapitulasi Order';
		$data['month_c'] = $month;
		$data['month']		= $this->db->query("SELECT DATE_FORMAT(tgl_order, '%Y-%m') as tgl1, DATE_FORMAT(tgl_order, '%M %Y') as tgl FROM tb_order GROUP BY DATE_FORMAT(tgl_order, '%M %Y') order by tgl_order ASC")->result_array();
		$data['order'] = $this->db->query("SELECT * FROM tb_rekapitulasi JOIN tb_pelanggan ON(tb_rekapitulasi.id_pelanggan=tb_pelanggan.id_pelanggan)")->result_array();
		$data['c_c1'] = [$c1['jas'], $c1['jaket'], $c1['kaos'], $c1['kemeja'], $c1['sweater']];
		$data['c_c2'] = [$c2['jas'], $c2['jaket'], $c2['kaos'], $c2['kemeja'], $c2['sweater']];
		$data['c_c3'] = [$c3['jas'], $c3['jaket'], $c3['kaos'], $c3['kemeja'], $c3['sweater']];

		$this->load->view('order/data_rekapitulasi', $data);
	}

	public function klasterisasi_next()
	{    
    $id = "";
    $id = $this->db->query('select max(nomor) as m from tb_hasil_centroid');
    foreach($id->result() as $i)
    {
      $id = $i->m;
    }
    $this->db->where('nomor', $id);
    $data['centroid'] = $this->db->get('tb_hasil_centroid')->row_array();
    $data['id'] = $id+1;
    
    $it = "";
    $it = $this->db->query('select max(iterasi) as it from tb_centroid_temp');
    foreach($it->result() as $i)
    {
      $it = $i->it;
    }
    
    $it_temp = $it-1;
    $this->db->where('iterasi', $it_temp);
    $it_sebelum = $this->db->get('tb_centroid_temp');
    $c1_sebelum = array();
    $c2_sebelum = array();
    $c3_sebelum = array();
    $no=0;
    foreach($it_sebelum->result() as $it_prev)
    {
      $c1_sebelum[$no] = $it_prev->c1;
      $c2_sebelum[$no] = $it_prev->c2;
      $c3_sebelum[$no] = $it_prev->c3;
      $no++;
    }
    
    $this->db->where('iterasi', $it);
    $it_sesesudah = $this->db->get('tb_centroid_temp');
    $c1_sesesudah = array();
    $c2_sesesudah = array();
    $c3_sesesudah = array();
    $no=0;
    foreach($it_sesesudah->result() as $it_next)
    {
      $c1_sesesudah[$no] = $it_next->c1;
      $c2_sesesudah[$no] = $it_next->c2;
      $c3_sesesudah[$no] = $it_next->c3;
      $no++;
    }
    
    if($c1_sebelum==$c1_sesesudah && 
      $c2_sebelum==$c2_sesesudah && 
      $c3_sebelum==$c3_sesesudah  )
    {
      echo $this->session->set_flashdata('msg','iterasi-selesai');
      redirect('rekapitulasi-order-end');
    }
    else
    {
			$data['title'] = "Rekapitulasi Order";
			$data['order'] = $this->db->query("SELECT * FROM tb_rekapitulasi JOIN tb_pelanggan ON(tb_rekapitulasi.id_pelanggan=tb_pelanggan.id_pelanggan)")->result_array();
      $this->load->view('order/data_rekapitulasi_next', $data); 
    }
    
  }
	
	function klasterisasi_end()
  {
    $data['title'] = "Rekapitulasi Order";
    $data['order'] = $this->db->query("SELECT * FROM tb_rekapitulasi JOIN tb_pelanggan ON(tb_rekapitulasi.id_pelanggan=tb_pelanggan.id_pelanggan)")->result_array();

    $data['q'] = $this->db->query('SELECT * from tb_centroid_temp group by iterasi')->result_array();
    $get_max = $this->db->query("SELECT max(iterasi) as iterasi from tb_centroid_temp")->row();
    $max = $get_max->iterasi;
    $iterasi = $this->db->query("SELECT * from tb_centroid_temp where iterasi='$max' ")->result_array();
    $id_pelangan = array();
    $instansi = array();

    foreach ($data['order'] as $a) {
      $id_pelangan[]=$a['id_pelanggan'];
      $instansi[]=$a['instansi'];
    }

    $no = 0;
    foreach ($iterasi as $i) {
      $id_pelanggan = $id_pelangan[$no];
      $instansi = $instansi[$no];

      if($i['c1'] == 1){
        $klaster = 'C1';
      } elseif($i['c2'] == 1){
        $klaster = 'C2';
      } elseif($i['c3'] == 1){
        $klaster = 'C3';
      }


      $hasil['id_pelanggan'] = $id_pelanggan;
      $hasil['instansi'] = $instansi;
      $hasil['klaster'] = $klaster;

      $this->db->insert('tb_hasil_klasterisasi', $hasil);
      $no++;
    }

		$this->db->select('*');
		$this->db->from('tb_hasil_klasterisasi');
		$this->db->join('tb_pelanggan', 'tb_pelanggan.id_pelanggan=tb_hasil_klasterisasi.id_pelanggan');
		$this->db->join('tb_kota', 'tb_kota.id_kota=tb_pelanggan.id_kota');
    $data['hasil_klasterisasi'] = $this->db->get()->result_array();

    $this->load->view('order/data_rekapitulasi_end', $data); 
  }

	public function klasterisasi_new()
	{
		$this->db->truncate('tb_rekapitulasi');
    $data['title']		= 'Rangkum Order';
		$post_m = $this->input->post('month');
		if(empty($post_m)){
			$month = date('Y-m');
		} else {
			$month = $post_m;
		}

		$pelanggan = $this->db->query("SELECT * FROM tb_pelanggan join tb_order ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) WHERE tb_order.tgl_order LIKE '$month%' GROUP BY tb_pelanggan.id_pelanggan")->result_array();

		$order = [];
		foreach ($pelanggan as $p) {
			$id_pelanggan = $p['id_pelanggan'];
			$jaket = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Jaket' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$kaos = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Kaos' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$jas = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Jas' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$kemeja = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Kemeja' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$sweater = $this->db->query("SELECT tb_order.id_produk, tb_pelanggan.id_pelanggan, SUM(tb_order.jumlah_ukuran_s + tb_order.jumlah_ukuran_m + tb_order.jumlah_ukuran_l + tb_order.jumlah_ukuran_xl + tb_order.jumlah_ukuran_xxl) as jumlah FROM tb_order JOIN tb_pelanggan join tb_produk ON(tb_pelanggan.id_pelanggan=tb_order.id_pelanggan) and (tb_produk.id_produk=tb_order.id_produk) WHERE tb_produk.jenis_produk = 'Sweater' AND tb_order.tgl_order LIKE '$month%' AND tb_pelanggan.id_pelanggan = '".$p['id_pelanggan']."'")->row_array();
			$jaket = is_null($jaket['jumlah']) ? 0 : (int)$jaket['jumlah'];
			$kaos = is_null($kaos['jumlah']) ? 0 : (int)$kaos['jumlah'];
			$jas = is_null($jas['jumlah']) ? 0 : (int)$jas['jumlah'];
			$kemeja = is_null($kemeja['jumlah']) ? 0 : (int)$kemeja['jumlah'];
			$sweater = is_null($sweater['jumlah']) ? 0 : (int)$sweater['jumlah'];
			$data = [
				'id_pelanggan' => $id_pelanggan,
				'jaket' => $jaket,
				'kaos' => $kaos,
				'jas' => $jas,
				'kemeja' => $kemeja,
				'sweater' => $sweater,
				'total' => $jaket+$kaos+$jas+$kemeja+$sweater,
			];

			$this->db->insert('tb_rekapitulasi', $data);

			//array_push($order, $data);
		}

		$count_all = $this->db->count_all('tb_rekapitulasi');
		$offset = 0;
		if ($count_all % 2 == 0){ //Kondisi
			$offset = ($count_all / 2) - 1;
		}else {
			$offset = (($count_all - 1) / 2) + 1;
		}

		$c1 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` DESC")->row_array();
		$c2;
		if($offset <= 0){
			$c2 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC LIMIT 1")->row_array();
		}else{
			$c2 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC LIMIT 1 OFFSET $offset")->row_array();
		}
		
		$c3 = $this->db->query("SELECT * FROM `tb_rekapitulasi` ORDER BY `tb_rekapitulasi`.`total` ASC")->row_array();

		$centeroid = [
			0 => [
				'jas' => $c1['jas'],
				'jaket' => $c1['jaket'],
				'kaos' => $c1['kaos'],
				'kemeja' => $c1['kemeja'],
				'sweater' => $c1['sweater']
			],
			1 => [
				'jas' => $c2['jas'],
				'jaket' => $c2['jaket'],
				'kaos' => $c2['kaos'],
				'kemeja' => $c2['kemeja'],
				'sweater' => $c2['sweater']
			],
			2 => [
				'jas' => $c3['jas'],
				'jaket' => $c3['jaket'],
				'kaos' => $c3['kaos'],
				'kemeja' => $c3['kemeja'],
				'sweater' => $c3['sweater']
			],
		];
		

		$all_data = $this->db->query("SELECT * FROM tb_rekapitulasi JOIN tb_pelanggan ON(tb_rekapitulasi.id_pelanggan=tb_pelanggan.id_pelanggan)")->result_array();

    $iteration = 1;

    $c1[0] = $centeroid[0];
    $c2[0] = $centeroid[1];
    $c3[0] = $centeroid[2];

		// c1 , c2 , c3
    $data_c1 = [];
    $data_c2 = [];
    $data_c3 = [];
    $list_all_data[0] = $all_data;
    foreach ($list_all_data[0] as $index => $item_data) {
      $list_all_data[0][$index]['c1'] = sqrt(pow($item_data['jas'] - $centeroid[0]['jas'], 2) + pow($item_data['jaket'] - $centeroid[0]['jaket'], 2) + pow($item_data['kaos'] - $centeroid[0]['kaos'], 2) + pow($item_data['kemeja'] - $centeroid[0]['kemeja'], 2) + pow($item_data['sweater'] - $centeroid[0]['sweater'], 2));
      $list_all_data[0][$index]['c2'] = sqrt(pow($item_data['jas'] - $centeroid[1]['jas'], 2) + pow($item_data['jaket'] - $centeroid[1]['jaket'], 2) + pow($item_data['kaos'] - $centeroid[1]['kaos'], 2) + pow($item_data['kemeja'] - $centeroid[1]['kemeja'], 2) + pow($item_data['sweater'] - $centeroid[1]['sweater'], 2));
      $list_all_data[0][$index]['c3'] = sqrt(pow($item_data['jas'] - $centeroid[2]['jas'], 2) + pow($item_data['jaket'] - $centeroid[2]['jaket'], 2) + pow($item_data['kaos'] - $centeroid[2]['kaos'], 2) + pow($item_data['kemeja'] - $centeroid[2]['kemeja'], 2) + pow($item_data['sweater'] - $centeroid[2]['sweater'], 2));
      $list_all_data[0][$index]['jarak'] = min($list_all_data[0][$index]['c1'], $list_all_data[0][$index]['c2'], $list_all_data[0][$index]['c3']);
      if ($list_all_data[0][$index]['jarak'] == $list_all_data[0][$index]['c1']) {
        $list_all_data[0][$index]['label'] = 'c1';
        array_push($data_c1, $list_all_data[0][$index]);
      } else if ($list_all_data[0][$index]['jarak'] == $list_all_data[0][$index]['c2']) {
        $list_all_data[0][$index]['label'] = 'c2';
        array_push($data_c2, $list_all_data[0][$index]);
      } else if ($list_all_data[0][$index]['jarak'] == $list_all_data[0][$index]['c3']) {
        $list_all_data[0][$index]['label'] = 'c3';
        array_push($data_c3, $list_all_data[0][$index]);
      } else {
        $list_all_data[0][$index]['label'] = 'undefined';
      }
    }

		$iteration++;

    $any_error = 1;

    while ($any_error > 0) {
      $any_error = 0;

      // prepare mencari centeroid 2
      $c1[$iteration - 1] = [
        'jas' => count($data_c1) == 0 ? 0 : array_sum(array_column($data_c1, 'jas')) / count($data_c1),
        'jaket' => count($data_c1) == 0 ? 0 : array_sum(array_column($data_c1, 'jaket')) / count($data_c1),
        'kaos' => count($data_c1) == 0 ? 0 : array_sum(array_column($data_c1, 'kaos')) / count($data_c1),
				'kemeja' => count($data_c1) == 0 ? 0 : array_sum(array_column($data_c1, 'kemeja')) / count($data_c1),
				'sweater' => count($data_c1) == 0 ? 0 : array_sum(array_column($data_c1, 'sweater')) / count($data_c1),
      ];
      $c2[$iteration - 1] = [
        'jas' => count($data_c2) == 0 ? 0 : array_sum(array_column($data_c2, 'jas')) / count($data_c2),
        'jaket' => count($data_c2) == 0 ? 0 : array_sum(array_column($data_c2, 'jaket')) / count($data_c2),
        'kaos' => count($data_c2) == 0 ? 0 : array_sum(array_column($data_c2, 'kaos')) / count($data_c2),
				'kemeja' => count($data_c2) == 0 ? 0 : array_sum(array_column($data_c2, 'kemeja')) / count($data_c2),
				'sweater' => count($data_c2) == 0 ? 0 : array_sum(array_column($data_c2, 'sweater')) / count($data_c2),
      ];
      $c3[$iteration - 1] = [
        'jas' => count($data_c3) == 0 ? 0 : array_sum(array_column($data_c3, 'jas')) / count($data_c3),
        'jaket' => count($data_c3) == 0 ? 0 : array_sum(array_column($data_c3, 'jaket')) / count($data_c3),
        'kaos' => count($data_c3) == 0 ? 0 : array_sum(array_column($data_c3, 'kaos')) / count($data_c3),
				'kemeja' => count($data_c3) == 0 ? 0 : array_sum(array_column($data_c3, 'kemeja')) / count($data_c3),
				'sweater' => count($data_c3) == 0 ? 0 : array_sum(array_column($data_c3, 'sweater')) / count($data_c3),
      ];

			$list_all_data[$iteration - 1] = $list_all_data[$iteration - 2];

      $data_c1 = [];
      $data_c2 = [];
      $data_c3 = [];

			foreach ($list_all_data[$iteration - 1] as $index => $item_data) {
        $list_all_data[$iteration - 1][$index]['c1'] = sqrt(pow($item_data['jas'] - $c1[$iteration - 1]['jas'], 2) + pow($item_data['jaket'] - $c1[$iteration - 1]['jaket'], 2) + pow($item_data['kaos'] - $c1[$iteration - 1]['kaos'], 2) + pow($item_data['kemeja'] - $c1[$iteration - 1]['kemeja'], 2) + pow($item_data['sweater'] - $c1[$iteration - 1]['sweater'], 2));
        $list_all_data[$iteration - 1][$index]['c2'] = sqrt(pow($item_data['jas'] - $c2[$iteration - 1]['jas'], 2) + pow($item_data['jaket'] - $c2[$iteration - 1]['jaket'], 2) + pow($item_data['kaos'] - $c2[$iteration - 1]['kaos'], 2) + pow($item_data['kemeja'] - $c2[$iteration - 1]['kemeja'], 2) + pow($item_data['sweater'] - $c2[$iteration - 1]['sweater'], 2));
        $list_all_data[$iteration - 1][$index]['c3'] = sqrt(pow($item_data['jas'] - $c3[$iteration - 1]['jas'], 2) + pow($item_data['jaket'] - $c3[$iteration - 1]['jaket'], 2) + pow($item_data['kaos'] - $c3[$iteration - 1]['kaos'], 2) + pow($item_data['kemeja'] - $c3[$iteration - 1]['kemeja'], 2) + pow($item_data['sweater'] - $c3[$iteration - 1]['sweater'], 2));
        $list_all_data[$iteration - 1][$index]['jarak'] = min($list_all_data[$iteration - 1][$index]['c1'], $list_all_data[$iteration - 1][$index]['c2'], $list_all_data[$iteration - 1][$index]['c3']);
        if ($list_all_data[$iteration - 1][$index]['jarak'] == $list_all_data[$iteration - 1][$index]['c1']) {
          $list_all_data[$iteration - 1][$index]['label'] = 'c1';
          array_push($data_c1,  $list_all_data[$iteration - 1][$index]);
        } else if ($list_all_data[$iteration - 1][$index]['jarak'] == $list_all_data[$iteration - 1][$index]['c2']) {
          $list_all_data[$iteration - 1][$index]['label'] = 'c2';
          array_push($data_c2,  $list_all_data[$iteration - 1][$index]);
        } else if ($list_all_data[$iteration - 1][$index]['jarak'] == $list_all_data[$iteration - 1][$index]['c3']) {
          $list_all_data[$iteration - 1][$index]['label'] = 'c3';
          array_push($data_c3,  $list_all_data[$iteration - 1][$index]);
        } else {
          $list_all_data[$iteration - 1][$index]['label'] = 'undefined';
        }
      }

			// membandingkan pola
      $compare1 = array_column($list_all_data[$iteration - 1], 'label');
      $compare2 = array_column($list_all_data[$iteration - 2], 'label');

      if ($compare1 != $compare2) {
        $any_error = 1;
      }

      $iteration++;
    }

		$result_c1 = [];
    $result_c2 = [];
    $result_c3 = [];

    foreach ($list_all_data[$iteration - 2] as $item) {
      $item['instansi'] = $item['instansi'];
      if ($item['label'] == 'c1') {
        array_push($result_c1, $item);
      } else if ($item['label'] == 'c2') {
        array_push($result_c2, $item);
      } else if ($item['label'] == 'c3') {
        array_push($result_c3, $item);
      }
    }

		$data['title']		= 'Rekapitulasi Order';
		$data['month_c'] = $month;
		$data['month']		= $this->db->query("SELECT DATE_FORMAT(tgl_order, '%Y-%m') as tgl1, DATE_FORMAT(tgl_order, '%M %Y') as tgl FROM tb_order GROUP BY DATE_FORMAT(tgl_order, '%M %Y') order by tgl_order ASC")->result_array();
		$data['list_all_data'] = $list_all_data;
		$data['c1'] = $c1;
		$data['c2'] = $c2;
		$data['c3'] = $c3;
		$data['result_c1'] = $result_c1;
		$data['result_c2'] = $result_c2;
		$data['result_c3'] = $result_c3;

		$this->load->view('order/data_rekapitulasi_new', $data);
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
}
