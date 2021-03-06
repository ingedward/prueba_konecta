<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos_Ventas extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Productos_model");
		$this->load->model("Categorias_model");
	}

	public function index()
	{
		$data  = array(
			'productos' => $this->Productos_model->getVentasProductos(), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/reportes/productos_ventas",$data);
		$this->load->view("layouts/footer");

	}

}