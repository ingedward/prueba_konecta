USE konecta;

-- ----------------------------
-- Consulta producto mas vendido
-- ----------------------------
SELECT  p.id, p.nombre, MAX(dv.cantidad) as masVentas 
FROM detalle_venta dv
INNER JOIN productos p ON dv.producto_id = p.id;

-- ----------------------------
-- Consulta producto con mas Stock
-- ----------------------------
SELECT id, nombre, MAX(stock) as masStock FROM productos;




