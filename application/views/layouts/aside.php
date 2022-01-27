        <!-- =============================================== -->

        <!-- Left side column. contains the sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">      
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MENÚ PRINCIPAL</li>
                    <li>
                        <a href="<?php echo base_url();?>dashboard">
                            <i class="fa fa-home"></i> 
                            <span>Inicio</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-cogs"></i> 
                            <span>Mantenimiento</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="<?php echo base_url();?>mantenimiento/Categorias">
                                    <i class="fa fa-circle-o"></i> 
                                    Categorias
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo base_url();?>mantenimiento/Clientes">
                                    <i class="fa fa-circle-o"></i> 
                                    Clientes
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo base_url(); ?>mantenimiento/Productos">
                                    <i class="fa fa-circle-o"></i> 
                                    Productos
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-share-alt"></i> 
                            <span>Movimientos</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="<?php echo base_url();?>movimientos/Ventas">
                                    <i class="fa fa-circle-o"></i> 
                                    Ventas
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-print"></i> <span>Reportes</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="<?php echo base_url();?>reportes/Ventas">
                                    <i class="fa fa-circle-o"></i> 
                                    Reporte Ventas
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo base_url();?>reportes/Productos_stock">
                                    <i class="fa fa-circle-o"></i> 
                                    Productos Stock 
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo base_url();?>reportes/Productos_ventas">
                                    <i class="fa fa-circle-o"></i> 
                                    Productos Ventas
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-user-circle-o"></i> 
                            <span>Administrador</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="<?php echo base_url();?>administrador/Usuarios">
                                    <i class="fa fa-circle-o"></i> 
                                    Usuarios
                                </a>
                            </li>
<!-- 
                            <li>
                                <a href="<?php echo base_url();?>administrador/permisos">
                                    <i class="fa fa-circle-o"></i> Permisos
                                </a>
                            </li>
 -->
                        </ul>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- =============================================== -->