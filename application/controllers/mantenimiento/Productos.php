<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Productos_model");
		$this->load->model("Categorias_model");
	}

	public function index()
	{
		$data  = array(
			'productos' => $this->Productos_model->getProductos(), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/productos/list",$data);
		$this->load->view("layouts/footer");

	}
	public function add()
	{
		$data =array( 
			"categorias" => $this->Categorias_model->getCategorias()
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/productos/add",$data);
		$this->load->view("layouts/footer");
	}

	public function store()
	{
		$referencia 	= $this->input->post("referencia");
		$nombre 		= $this->input->post("nombre");
		$descripcion 	= $this->input->post("descripcion");
		$precio 		= $this->input->post("precio");
		$stock 			= $this->input->post("stock");
		$peso 			= $this->input->post("peso");
		$categoria 		= $this->input->post("categoria");
		$fecha_creacion = $this->input->post("fecha_creacion");

		$this->form_validation->set_rules("referencia","Referencia","required|is_unique[productos.referencia]");
		$this->form_validation->set_rules("nombre","Nombre","required");
		$this->form_validation->set_rules("precio","Precio","required");
		$this->form_validation->set_rules("stock","Stock","required");
		$this->form_validation->set_rules("peso","Peso","required");
		$this->form_validation->set_rules("fecha_creacion","Fecha creacion","required");

		if ($this->form_validation->run()) 
		{
			$data  = array(
				'referencia' 	=> $referencia, 
				'nombre' 		=> $nombre,
				'descripcion' 	=> $descripcion,
				'precio' 		=> $precio,
				'stock' 		=> $stock,
				'peso' 			=> $peso,
				'categoria_id' 	=> $categoria,
				'fecha_creacion'=> $fecha_creacion,
				'estado' 		=> "1"
			);

			if ($this->Productos_model->save($data)) 
			{
				redirect(base_url()."mantenimiento/productos");
			}
			else
			{
				$this->session->set_flashdata("error","No se pudo guardar la informacion");
				redirect(base_url()."mantenimiento/productos/add");
			}
		}
		else
		{
			$this->add();
		}

		
	}

	public function edit($id)
	{
		$data =array( 
			"producto" 		=> $this->Productos_model->getProducto($id),
			"categorias" 	=> $this->Categorias_model->getCategorias()
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/productos/edit",$data);
		$this->load->view("layouts/footer");
	}

	public function update()
	{
		$idproducto 	= $this->input->post("idproducto");
		$referencia 	= $this->input->post("referencia");
		$nombre 		= $this->input->post("nombre");
		$descripcion 	= $this->input->post("descripcion");
		$precio 		= $this->input->post("precio");
		$stock 			= $this->input->post("stock");
		$peso 			= $this->input->post("peso");
		$categoria 		= $this->input->post("categoria");
		$fecha_creacion = $this->input->post("fecha_creacion");

		$productoActual = $this->Productos_model->getProducto($idproducto);

		if ($referencia == $productoActual->referencia) 
		{
			$is_unique = '';
		}
		else
		{
			$is_unique = '|is_unique[productos.referencia]';
		}

		$this->form_validation->set_rules("referencia","Referencia","required".$is_unique);
		$this->form_validation->set_rules("nombre","Nombre","required");
		$this->form_validation->set_rules("precio","Precio","required");
		$this->form_validation->set_rules("stock","Stock","required");
		$this->form_validation->set_rules("peso","Peso","required");
		$this->form_validation->set_rules("fecha_creacion","Fecha Creacion","required");

		if ($this->form_validation->run()) 
		{
			$data  = array(
				'referencia' 	=> $referencia, 
				'nombre' 		=> $nombre,
				'descripcion' 	=> $descripcion,
				'precio' 		=> $precio,
				'stock' 		=> $stock,
				'peso' 			=> $peso,
				'categoria_id' 	=> $categoria,
				'fecha_creacion'=> $fecha_creacion,
			);
			if ($this->Productos_model->update($idproducto,$data)) 
			{
				redirect(base_url()."mantenimiento/productos");
			}
			else
			{
				$this->session->set_flashdata("error","No se pudo guardar la informacion");
				redirect(base_url()."mantenimiento/productos/edit/".$idproducto);
			}
		}
		else
		{
			$this->edit($idproducto);
		}

		
	}
	public function delete($id)
	{
		$data  = array(
			'estado' => "0", 
		);
		$this->Productos_model->update($id,$data);
		echo "mantenimiento/productos";
	}

}