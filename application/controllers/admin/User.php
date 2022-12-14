<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

    function __construct(){
		parent::__construct();
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		$this->load->model('Model_user');
		$this->load->model('Model_akses');
    }

	public function akses()
	{
		$login = $this->session->userdata('id');
		$data['user'] = $this->Model_user->getById($login)->row();
		$data['akses'] = $this->Model_akses->getAll()->result();
        $data['title'] = "Hak Akses";
		$this->load->view('admin/layout/header',$data);
		$this->load->view('admin/user/akses',$data);
		$this->load->view('admin/layout/footer');
	}

	public function data($hak)
	{
		$login = $this->session->userdata('id');
		$data['user'] = $this->Model_user->getById($login)->row();
		$data['data'] = $this->Model_user->getByAlias($hak)->result();
		$data['akses'] = $this->Model_akses->getAll()->result();
		$data['aks'] = $this->Model_akses->getByAlias($hak)->row();
        $data['title'] = "Data ".$data['aks']->nama_akses;
		echo $data['title'];
		$this->load->view('admin/layout/header',$data);
		$this->load->view('admin/user/data',$data);
		$this->load->view('admin/layout/footer');
	}

}
