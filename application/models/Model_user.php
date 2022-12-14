<?php 
 
class Model_user extends CI_Model{
	
	public $user = "user";	

	public function auth($where){		
		return $this->db->get_where($this->user, $where);
	}	

	public function getLogin($user){
		$this->db->from($this->user);
		$this->db->where('username',$user);
		return $this->db->get(); 		
	}	

	public function getAll(){
		$this->db->select('*');
		$this->db->from($this->user);
		$this->db->join('tb_hak_akses', 'tb_hak_akses.id_hak = '.$this->user.'.id_hak', 'left');
		$this->db->order_by('fullname','ASC');
		return $this->db->get(); 		
	}

	public function getByAlias($hak){
		$this->db->select('*');
		$this->db->from($this->user);
		$this->db->join('akses', 'akses.id_akses = '.$this->user.'.id_akses', 'left');
		$this->db->where('akses.alias',$hak);
		return $this->db->get(); 		
	}

	public function getById($id){
		$this->db->select('*');
		$this->db->from($this->user);
		$this->db->where('id_user', $id);
		return $this->db->get(); 		
	}

	public function simpan($data){
        return $this->db->insert($this->user, $data);
    }

	public function delete($id){
	    $this->db->where('id_user', $id);
	    $this->db->delete($this->user);
	    return true;
	}

	public function update($id, $data){ 
		$this->db->where('id_user',$id);
		$this->db->update($this->tabel, $data);
	}
}