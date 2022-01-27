/*
MySQL Data Transfer
Source Host: localhost
Source Database: konecta
Target Host: localhost
Target Database: konecta
Date: 26/01/2022 6:29:31 p. m.
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tipo_cliente_id` int(11) DEFAULT NULL,
  `tipo_documento_id` int(11) DEFAULT NULL,
  `num_documento` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_cliente_idx` (`tipo_cliente_id`),
  KEY `fk_tipo_documento_idx` (`tipo_documento_id`),
  CONSTRAINT `fk_tipo_cliente` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipo_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_documento` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_detalle_idx` (`venta_id`),
  KEY `fk_producto_detalle_idx` (`producto_id`),
  CONSTRAINT `fk_producto_detalle` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_detalle` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `insert` int(11) DEFAULT NULL,
  `update` int(11) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menus_idx` (`menu_id`),
  KEY `fk_rol_idx` (`rol_id`),
  CONSTRAINT `fk_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `peso` float(5,2) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `codigo_UNIQUE` (`referencia`),
  KEY `fk_categoria_producto_idx` (`categoria_id`),
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tipo_cliente
-- ----------------------------
DROP TABLE IF EXISTS `tipo_cliente`;
CREATE TABLE `tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tipo_comprobante
-- ----------------------------
DROP TABLE IF EXISTS `tipo_comprobante`;
CREATE TABLE `tipo_comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_rol_usuarios_idx` (`rol_id`),
  CONSTRAINT `fk_rol_usuarios` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `subtotal` decimal(13,2) DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `tipo_comprobante_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `num_documento` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_venta_idx` (`usuario_id`),
  KEY `fk_cliente_venta_idx` (`cliente_id`),
  KEY `fk_tipo_comprobante_venta_idx` (`tipo_comprobante_id`),
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_comprobante_venta` FOREIGN KEY (`tipo_comprobante_id`) REFERENCES `tipo_comprobante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Yogures', 'Yogures de cualquier marca', '1');
INSERT INTO `categorias` VALUES ('2', 'Sanduches', 'Saduches preparados en cafeteria', '1');
INSERT INTO `categorias` VALUES ('3', 'Jugos', 'Jugos de cualquier marca', '1');
INSERT INTO `categorias` VALUES ('4', 'Gaseosas', 'Gaseosa de toda marca', '1');
INSERT INTO `categorias` VALUES ('5', 'Almojabanas', 'Almojabanas preparadas en cafeteria', '1');
INSERT INTO `categorias` VALUES ('6', 'Tortas', 'Tortas caseras', '1');

INSERT INTO `menus` VALUES ('1', 'Inicio', 'dashboard');
INSERT INTO `menus` VALUES ('2', 'Categorias', 'mantenimiento/categorias');
INSERT INTO `menus` VALUES ('3', 'Clientes', 'mantenimiento/clientes');
INSERT INTO `menus` VALUES ('4', 'Productos', 'mantenimiento/productos');
INSERT INTO `menus` VALUES ('5', 'Ventas', 'movimientos/ventas');
INSERT INTO `menus` VALUES ('6', 'Reporte Ventas', 'reportes/ventas');
INSERT INTO `menus` VALUES ('7', 'Usuarios', 'administrador/usuarios');
INSERT INTO `menus` VALUES ('8', 'Permisos', 'administrador/permisos');


INSERT INTO `roles` VALUES ('1', 'superadmin', null);
INSERT INTO `roles` VALUES ('2', 'admin', null);

INSERT INTO `tipo_cliente` VALUES ('1', 'Konecta', 'Empleado Konecta');
INSERT INTO `tipo_cliente` VALUES ('2', 'Externo', 'Cliente Externo');

INSERT INTO `tipo_comprobante` VALUES ('1', 'Venta', '13', '19', '1');
INSERT INTO `tipo_comprobante` VALUES ('2', 'Compra', '1', '19', '1');

INSERT INTO `tipo_documento` VALUES ('1', 'Cédula Ciudadanía');
INSERT INTO `tipo_documento` VALUES ('3', 'Pasaporte');
INSERT INTO `tipo_documento` VALUES ('2', 'Permiso Especial de Permanencia');

INSERT INTO `productos` VALUES ('1', '10001', 'Sanduche de Jamón y Queso', 'Sanduche de Jamón y Queso', '8000', '5', '0.50', '2022-01-25', '2', '1');
INSERT INTO `productos` VALUES ('2', '10002', 'Coca Cola 500 ml', 'Coca Cola 500 ml', '3000', '7', '0.70', '2022-01-26', '4', '1');
INSERT INTO `productos` VALUES ('3', '10003', 'Coca Cola 400 ml', 'Coca Cola 400 ml', '2500', '10', '0.60', '2022-01-25', '4', '1');
INSERT INTO `productos` VALUES ('4', '10004', 'Almojabana Con Queso', 'Almojabana Con Queso', '2000', '13', '0.30', '2022-01-26', '5', '1');
INSERT INTO `productos` VALUES ('5', '10005', 'Almojabana Con Queso y Bocadillo', 'Almojabana Con Queso y Bocadillo', '2000', '14', '0.30', '2022-01-25', '5', '1');
INSERT INTO `productos` VALUES ('6', '10006', 'Jugo Hit Tropical', 'Jugo Hit Tropical', '2500', '29', '0.60', '2022-01-26', '3', '1');
INSERT INTO `productos` VALUES ('7', '10007', 'Jugo Hit Mango', 'Jugo Hit Mango', '2500', '28', '0.60', '2022-01-25', '3', '1');
INSERT INTO `productos` VALUES ('8', '10008', 'Sanduche de Atún', 'Sanduche de Atún', '6000', '24', '0.50', '2022-01-26', '2', '1');
INSERT INTO `productos` VALUES ('9', '10009', 'Yogurt Alpina Mora', 'Yogurt Alpina Mora', '2500', '26', '0.50', '2022-01-25', '1', '1');
INSERT INTO `productos` VALUES ('10', '10010', 'Yogurt Alpina Fresa', 'Yogurt Alpina Fresa', '2500', '7', '0.50', '2022-01-26', '1', '1');
INSERT INTO `productos` VALUES ('11', '10011', 'Yogurt Alpina Melocotón', 'Yogurt Alpina Melocotón', '2500', '5', '0.50', '2022-01-25', '1', '1');
INSERT INTO `productos` VALUES ('12', '10012', 'Jugo Hit Mora', 'Jugo Hit Mora', '2500', '2', '0.50', '2022-01-26', '3', '1');
INSERT INTO `productos` VALUES ('13', '10013', 'Torta Casera', 'Torta Casera', '2000', '4', '0.20', '2022-01-26', '6', '1');


INSERT INTO `clientes` VALUES ('1', 'José Rodríguez', '3196530669', 'calle 54 A Sur', '1', '1', '79495926', '1');
INSERT INTO `clientes` VALUES ('2', 'Maria Perez', '3001234567', 'calle 2', '1', '1', '12345678', '1');
INSERT INTO `clientes` VALUES ('3', 'Juan Benitez', '3101234567', 'calle 2', '2', '1', '45454546', '1');
INSERT INTO `clientes` VALUES ('4', 'Pedro Martinez', '3111234567', 'calle 3', '2', '1', '45434343', '1');
INSERT INTO `clientes` VALUES ('5', 'Luisa Casas', '3107894561', 'calle 4', '1', '1', '46464646', '1');
INSERT INTO `clientes` VALUES ('6', 'Pedro Rodriguez', '3114567891', 'calle 5', '1', '2', '45454545', '1');
INSERT INTO `clientes` VALUES ('7', 'Ana Duarte', '3007894561', 'calle 6', '1', '1', '78945600', '1');
INSERT INTO `clientes` VALUES ('8', 'Mario Casas', '3118521470', 'calle 7', '1', '1', '48484848', '1');
INSERT INTO `clientes` VALUES ('9', 'Claudia Pineda', '3109632580', 'calle 8', '1', '2', '20444444409', '0');
INSERT INTO `clientes` VALUES ('10', 'Camilo Fuentes', '3001472583', 'Calle 10', '1', '1', '46477687', '1');
INSERT INTO `clientes` VALUES ('11', 'Lucia Gomez', '3002001000', 'calle 11', '1', '1', '52123456', '0');
INSERT INTO `clientes` VALUES ('12', 'Manuel Rodriguez', '3007891230', 'calle 12', '2', '1', '20104050', '1');
INSERT INTO `clientes` VALUES ('13', 'Fernanda Motta', '3183506002', 'calle 13', '2', '1', '5278945612', '1');

INSERT INTO `usuarios` VALUES ('1', 'Edward', 'Rodríguez', '3196530669', 'ing.erodriguez@outlook.com', 'ingedward', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2', '1');
INSERT INTO `ventas` VALUES ('1', '2022-01-26', null, '19.00', null, '19000.00', '1', '1', '1', '000008', null);
INSERT INTO `ventas` VALUES ('2', '2022-01-26', null, '19.00', null, '5000.00', '1', '3', '1', '000009', null);
INSERT INTO `ventas` VALUES ('3', '2022-01-26', null, '19.00', null, '9000.00', '1', '5', '1', '000010', null);
INSERT INTO `ventas` VALUES ('4', '2022-01-26', null, '19.00', null, '10500.00', '1', '6', '1', '000011', null);
INSERT INTO `ventas` VALUES ('5', '2022-01-26', null, '19.00', null, '32000.00', '1', '7', '1', '000012', null);
INSERT INTO `ventas` VALUES ('6', '2022-01-27', null, '19.00', null, '12000.00', '1', '13', '1', '000013', null);

INSERT INTO `detalle_venta` VALUES ('1', '9', '1', '2500.00', '2', '5000.00');
INSERT INTO `detalle_venta` VALUES ('2', '1', '1', '8000.00', '1', '8000.00');
INSERT INTO `detalle_venta` VALUES ('3', '8', '1', '6000.00', '1', '6000.00');
INSERT INTO `detalle_venta` VALUES ('4', '2', '2', '3000.00', '1', '3000.00');
INSERT INTO `detalle_venta` VALUES ('5', '5', '2', '2000.00', '1', '2000.00');
INSERT INTO `detalle_venta` VALUES ('6', '6', '3', '2500.00', '1', '2500.00');
INSERT INTO `detalle_venta` VALUES ('7', '7', '3', '2500.00', '1', '2500.00');
INSERT INTO `detalle_venta` VALUES ('8', '4', '3', '2000.00', '2', '4000.00');
INSERT INTO `detalle_venta` VALUES ('9', '1', '4', '8000.00', '1', '8000.00');
INSERT INTO `detalle_venta` VALUES ('10', '7', '4', '2500.00', '1', '2500.00');
INSERT INTO `detalle_venta` VALUES ('11', '10', '5', '2500.00', '2', '5000.00');
INSERT INTO `detalle_venta` VALUES ('12', '1', '5', '8000.00', '3', '24000.00');
INSERT INTO `detalle_venta` VALUES ('13', '2', '5', '3000.00', '1', '3000.00');
INSERT INTO `detalle_venta` VALUES ('14', '13', '6', '2000.00', '6', '12000.00');

INSERT INTO `permisos` VALUES ('1', '1', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('2', '2', '2', '1', '1', '0', '0');
INSERT INTO `permisos` VALUES ('3', '3', '2', '1', '1', '1', '0');
INSERT INTO `permisos` VALUES ('4', '4', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('5', '5', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('7', '6', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('8', '7', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('9', '8', '2', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('10', '1', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('11', '2', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('12', '4', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('13', '5', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('14', '6', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('15', '7', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('16', '3', '1', '1', '1', '1', '1');
INSERT INTO `permisos` VALUES ('17', '8', '1', '1', '1', '1', '1');
