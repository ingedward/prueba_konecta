
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
        Productos
        <small>Editar</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <?php if($this->session->flashdata("error")):?>
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <p>
                                    <i class="icon fa fa-ban"></i>
                                    <?php echo $this->session->flashdata("error"); ?>
                                </p>
                                
                             </div>
                        <?php endif;?>
                        <form action="<?php echo base_url();?>mantenimiento/productos/update" method="POST">
                            <input type="hidden" name="idproducto" value="<?php echo $producto->id;?>">
                            <div class="form-group <?php echo !empty(form_error('referencia')) ? 'has-error':'';?>">
                                <label for="referencia">Referencia:</label>
                                <input type="text" class="form-control" id="referencia" name="referencia" value="<?php echo !empty(form_error('referencia')) ? set_value('referencia'):$producto->referencia?>">
                                <?php echo form_error("referencia","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group <?php echo !empty(form_error('nombre')) ? 'has-error':'';?>">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<?php echo !empty(form_error('nombre')) ? set_value('nombre'):$producto->nombre?>">
                                <?php echo form_error("nombre","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripcion:</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" value="<?php echo $producto->descripcion?>">
                            </div>
                            <div class="form-group <?php echo !empty(form_error('precio')) ? 'has-error':'';?>">
                                <label for="precio">Precio:</label>
                                <input type="text" class="form-control" id="precio" name="precio" value="<?php echo !empty(form_error('precio')) ? set_value('precio'):$producto->precio?>">
                                <?php echo form_error("precio","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group <?php echo !empty(form_error('stock')) ? 'has-error':'';?>">
                                <label for="stock">Stock:</label>
                                <input type="text" class="form-control" id="stock" name="stock" value="<?php echo !empty(form_error('stock')) ? set_value('stock'):$producto->stock?>">
                                <?php echo form_error("stock","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group <?php echo !empty(form_error('peso')) ? 'has-error':'';?>">
                                <label for="peso">Peso:</label>
                                <input type="text" class="form-control" id="peso" name="peso" value="<?php echo !empty(form_error('peso')) ? set_value('peso'):$producto->peso?>">
                                <?php echo form_error("peso","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group">
                                <label for="categoria">Categoria:</label>
                                <select name="categoria" id="categoria" class="form-control">
                                    <?php foreach($categorias as $categoria):?>
                                        <?php if($categoria->id == $producto->categoria_id):?>
                                        <option value="<?php echo $categoria->id?>" selected><?php echo $categoria->nombre;?></option>
                                    <?php else:?>
                                        <option value="<?php echo $categoria->id?>"><?php echo $categoria->nombre;?></option>
                                        <?php endif;?>
                                    <?php endforeach;?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="fecha">Fecha Creación:</label>
                                <input type="date" class="form-control" id="fecha_creacion" name="fecha_creacion" value="<?php echo !empty(form_error('fecha_creacion')) ? set_value('fecha_creacion'):$producto->fecha_creacion?>">
                                <?php echo form_error("fecha_creacion","<span class='help-block'>","</span>");?>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-flat">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
