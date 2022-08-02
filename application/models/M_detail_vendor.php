<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_detail_vendor extends CI_Model {

	public $table	= 'tb_detail_vendor';

	public function get_data($id_vendor = null)
	{
		$this->db->select('*');
		$this->db->from($this->table);
		if(!is_null($id_vendor)){
			$this->db->where('id_vendor', $id_vendor);
		}
    return $this->db->get();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
	}

	public function get_by_id($id_detail_vendor)
	{
		return $this->db->get_where($this->table, ['id_detail_vendor' => $id_detail_vendor])->row_array();
	}

	public function get_by_role($role)
	{
		return $this->db->get_where($this->table, ['role' => $role])->result_array();
	}

	public function update($data)
	{
		$this->db->where('id_detail_vendor', $data['id_detail_vendor']);
		$this->db->update($this->table, $data);
	}

	public function delete($id_detail_vendor)
	{
		$this->db->delete($this->table, ['id_detail_vendor' => $id_detail_vendor]);
	}
}
