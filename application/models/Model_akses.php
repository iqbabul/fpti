<?php 
 
class Model_akses extends CI_Model{
	
	public $akses = "akses";	

	public function getAll(){		
		return $this->db->get($this->akses);
	}	

	public function getByAlias($alias){		
		return $this->db->get_where('akses', array('alias'=>$alias));
	}	
}