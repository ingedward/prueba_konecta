<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ventas extends CI_Controller 
{
	public function __construct(){
		parent::__construct();
		if (!$this->session->userdata("login")) 
		{
			redirect(base_url());
		}
		$this->load->model("Ventas_model");
		$this->load->model("Clientes_model");
		$this->load->model("Productos_model");
		$this->load->model("Categorias_model");
	}

	public function index()
	{
		$data  = array(
			'ventas' => $this->Ventas_model->getVentas(), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/ventas/list",$data);
		$this->load->view("layouts/footer");
	}

	public function add()
	{
		$data = array(
			"tipocomprobantes" => $this->Ventas_model->getComprobantes(),
			"clientes" => $this->Clientes_model->getClientes(),
			'categorias' => $this->Categorias_model->getCategorias(),
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/ventas/add",$data);
		$this->load->view("layouts/footer");
	}

	public function getproductos(){
		$valor = $this->input->post("valor");
		$clientes = $this->Ventas_model->getproductos($valor);
		echo json_encode($clientes);
	}

	public function store()
	{
		$idusuario 		= $this->session->userdata("id");
		$fecha 			= date("Y-m-d");
		$subtotal 		= $this->input->post("subtotal");
		$iva 			= $this->input->post("iva");
		$descuento 		= $this->input->post("descuento");
		$total 			= $this->input->post("total");
		$idcliente 		= $this->input->post("idcliente");
		$idcomprobante 	= $this->input->post("idcomprobante");
		$numero 		= $this->input->post("numero");
		$serie 			= $this->input->post("serie");
		$idproductos 	= $this->input->post("productos");
		$precios 		= $this->input->post("precios");
		$cantidades 	= $this->input->post("cantidades");
		$importes 		= $this->input->post("importes");
		#--- array igual a la tabla ventas
		$data = array(
			'fecha' 				=> $fecha,
			'subtotal' 				=> $subtotal,
			'iva' 					=> $iva,
			'descuento' 			=> $descuento,
			'total' 				=> $total,
			'tipo_comprobante_id' 	=> $idcomprobante,
			'cliente_id' 			=> $idcliente,
			'usuario_id' 			=> $idusuario,
			'num_documento' 		=> $numero,
			'serie' 				=> $serie,
		);
		if ($this->Ventas_model->save($data)) 
		{
			$idventa = $this->Ventas_model->lastID();
			$this->updateComprobante($idcomprobante);
			$this->save_detalle($idproductos,$idventa,$precios,$cantidades,$importes);
//			$this->save_detalle(3,$idventa,6,1,1);
			redirect(base_url()."movimientos/ventas");
		}
		else
		{
			redirect(base_url()."movimientos/ventas/add");
		}
	}
	#--- actualiza los comprobantes con el valor del ultimo
	protected function updateComprobante($idcomprobante){
		$comprobanteActual = $this->Ventas_model->getComprobante($idcomprobante);
		$data  = array(
			'cantidad' => $comprobanteActual->cantidad + 1, 
		);
		$this->Ventas_model->updateComprobante($idcomprobante,$data);
	}
	#--- guarda los productos del formulario de ventas
	protected function save_detalle($productos,$idventa,$precios,$cantidades,$importes)
	{
		for ($i=0; $i < count($productos); $i++) 
		{ 
			$data  = array(
				'producto_id' 	=> $productos[$i], 
				'venta_id' 		=> $idventa,
				'precio' 		=> $precios[$i],
				'cantidad' 		=> $cantidades[$i],
				'importe'		=> $importes[$i],
			);
			$this->Ventas_model->save_detalle($data);
			$this->updateProducto($productos[$i],$cantidades[$i]);
		}
	}

	protected function updateProducto($idproducto,$cantidad){
		$productoActual = $this->Productos_model->getProducto($idproducto);
		$data = array(
			'stock' => $productoActual->stock - $cantidad, 
		);
		$this->Productos_model->update($idproducto,$data);
	}

	public function view()
	{
		$idventa = $this->input->post("id");
		$data = array(
			"venta" 	=> $this->Ventas_model->getVenta($idventa),
			"detalles" 	=>$this->Ventas_model->getDetalle($idventa)
		);
		$this->load->view("admin/ventas/view",$data);
	}

	public function getProductosByCategoria(){
		$idcategoria = $this->input->post("idcategoria");
		$productos = $this->Ventas_model->getProductosByCategoria($idcategoria);
		echo json_encode($productos);
	}

	public function getProductoByCode(){
		$codigo_barra = $this->input->post("codigo_barra");
		$producto = $this->Ventas_model->getProductoByCode($codigo_barra);

		if ($producto != false) {
			echo json_encode($producto);
		}else{
			echo "0";
		}
	}

}