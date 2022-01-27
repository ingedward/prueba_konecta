<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos_model extends CI_Model {

	public function getProductos()
	{
		$this->db->select("p.*,c.nombre as categoria");
		$this->db->from("productos p");
		$this->db->join("categorias c","p.categoria_id = c.id");
		$this->db->where("p.estado","1");
		$resultados = $this->db->get();
		return $resultados->result();
	}

	public function getStockProductos()
	{
		$this->db->select("p.*,c.nombre as categoria");
		$this->db->from("productos p");
		$this->db->join("categorias c","p.categoria_id = c.id");
		$this->db->order_by("p.stock");
		$resultados = $this->db->get();
		return $resultados->result();
	}

	public function getVentasProductos()
	{
		$this->db->select("p.*,c.nombre as categoria, SUM(dv.cantidad) as ventas");
		$this->db->from("productos p");
		$this->db->join("categorias c","p.categoria_id = c.id");
		$this->db->join("detalle_venta dv","p.id = dv.producto_id");
    	$this->db->group_by('dv.producto_id');
		$resultados = $this->db->get();
		return $resultados->result();
	}

	public function getProducto($id)
	{
		$this->db->where("id",$id);
		$resultado = $this->db->get("productos");
		return $resultado->row();
	}

	public function save($data)
	{
		return $this->db->insert("productos",$data);
	}

	public function update($id,$data)
	{
		$this->db->where("id",$id);
		return $this->db->update("productos",$data);
	}

}