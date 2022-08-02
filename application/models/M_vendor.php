<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_vendor extends CI_Model {

	public $table	= 'tb_vendor';

	public function get_data()
	{
		$this->db->select('*');
		$this->db->from($this->table);
    return $this->db->get();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
	}

	public function get_by_id($id_vendor)
	{
		return $this->db->get_where($this->table, ['id_vendor' => $id_vendor])->row_array();
	}

	public function get_by_role($role)
	{
		return $this->db->get_where($this->table, ['role' => $role])->result_array();
	}

	public function update($data)
	{
		$this->db->where('id_vendor', $data['id_vendor']);
		$this->db->update($this->table, $data);
	}

	public function delete($id_vendor)
	{
		$this->db->delete($this->table, ['id_vendor' => $id_vendor]);
	}
}
