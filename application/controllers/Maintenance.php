<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Maintenance extends CI_Controller
{
  public function backup() {
    $this->load->dbutil();

    $config = array(
      'format' => 'sql'
    );

    $backup = $this->dbutil->backup($config);

    $db_name = 'db_kojo_cloth (backup-on-'.date("Y-m-d").').sql';
    $save = 'database/'.$db_name;

    $a = $this->load->helper('file');
    write_file($save, $backup);

    $this->load->helper('download');
    force_download($db_name, $backup);

    if($a>0){
    	echo 'Berhasil';
    }else{
    	echo 'Gagal';
    }
    
  }

  // public function xyz()
  // {
  //   $proj = $this->db->get_where('tb_project', ['status' => '1'])->result_array();

  //   foreach ($proj as $p) {
  //     $u = $this->db->get_where('tb_user', ['user_id' => $p['project_marketing']])->row_array();
  //     $data = [
  //       'id_esop' => $p['project_id'],
  //       'nama_project' => $p['project_nama'],
  //       'tanggal_project' => $p['project_tgl'],
  //       'nama_marketing' => $u['user_nama'],
  //       'keterangan' => $p['project_keterangan']
  //     ];


  //     $db2 = $this->load->database('db_maintenance', TRUE);
  //     $db2->insert('project', $data);
  //   }

  //   echo "sukses";
  // }
}
