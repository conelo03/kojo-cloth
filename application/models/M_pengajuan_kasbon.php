<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_pengajuan_kasbon extends CI_Model {

	public $table	= 'tb_pengajuan_kasbon';

	public function get_data()
	{
		$id_pegawai = $this->session->userdata('id_pegawai');

		$this->db->select('*');
		$this->db->from($this->table);
		$this->db->join('tb_jenis_pengeluaran', 'tb_jenis_pengeluaran.id_jenis_pengeluaran=tb_pengajuan_kasbon.id_jenis_pengeluaran');
		$this->db->join('tb_pegawai', 'tb_pegawai.id_pegawai=tb_pengajuan_kasbon.id_pegawai');
		if(is_admin() || is_owner() || is_keuangan()){

		}else{
			$this->db->where('tb_pengajuan_kasbon.id_pegawai', $id_pegawai);
		}
		$this->db->order_by('tanggal', 'DESC');
    return $this->db->get();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
	}

	public function get_by_id($id_pengajuan_kasbon)
	{
		return $this->db->get_where($this->table, ['id_pengajuan_kasbon' => $id_pengajuan_kasbon])->row_array();
	}

	public function get_by_role($role)
	{
		return $this->db->get_where($this->table, ['role' => $role])->result_array();
	}

	public function update($data)
	{
		$this->db->where('id_pengajuan_kasbon', $data['id_pengajuan_kasbon']);
		$this->db->update($this->table, $data);
	}

	public function delete($id_pengajuan_kasbon)
	{
		$this->db->delete($this->table, ['id_pengajuan_kasbon' => $id_pengajuan_kasbon]);
	}
}
