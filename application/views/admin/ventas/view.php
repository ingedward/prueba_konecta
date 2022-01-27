
<div class="row">
	<div class="col-xs-12 text-center">
		<b>Cafeteria Konecta</b><br>
		Av. El Dorado #85-55 <br>
		Tel. 3431920 <br>
		Email:info@grupokonecta.com
	</div>
</div> <br>
<div class="row">
	<div class="col-xs-6">	
		<b>CLIENTE</b><br>
		<b>Nombre:</b> <?php echo $venta->nombre;?> <br>
		<b>Nro Documento:</b> <?php echo $venta->documento;?><br>
		<b>Telefono:</b> <?php echo $venta->telefono;?> <br>
		<b>Direccion</b> <?php echo $venta->direccion;?><br>
	</div>	
	<div class="col-xs-6">	
		<b>COMPROBANTE</b> <br>
		<b>Tipo de Comprobante:</b> <?php echo $venta->tipocomprobante;?><br>
		<b>Nro de Comprobante:</b><?php echo $venta->num_documento;?><br>
		<b>Fecha</b> <?php echo $venta->fecha;?>
	</div>	
</div>
<br>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Referencia</th>
					<th>Nombre</th>
					<th>Precio</th>
					<th>Cantidad</th>
					<th>Importe</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach($detalles as $detalle):?>
				<tr>
					<td><?php echo $detalle->referencia;?></td>
					<td><?php echo $detalle->nombre;?></td>
					<td><?php echo $detalle->precio;?></td>
					<td><?php echo $detalle->cantidad;?></td>
					<td><?php echo $detalle->importe;?></td>
				</tr>
				<?php endforeach;?>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" class="text-right">
						<strong>Subtotal:</strong>
					</td>
					<td class="text-right">
						<?php echo number_format($venta->total);?>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<strong>IVA:</strong>
					</td>
					<td class="text-right">
						<?php
							$valor_iva = $venta->total * ($venta->iva/100);
							echo number_format($valor_iva);
						?>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<strong>Total:</strong>
					</td>
					<td class="text-right">
						<?php
							$total = $venta->total + $valor_iva; 
							echo number_format($total);
						?>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>