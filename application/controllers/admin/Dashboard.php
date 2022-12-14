<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct(){
		parent::__construct();
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		$this->load->model('Model_login');
    }

	public function index()
	{
		$login = $this->session->userdata('id');
		$data['user'] = $this->Model_login->getById($login)->row();
		$this->load->view('admin/layout/header',$data);
		$this->load->view('admin/dashboard',$data);
		$this->load->view('admin/layout/footer');
	}
}
