-- Monto total de ventas (Tendencia mensual)
DROP VIEW IF EXISTS kebacommerce.vw_ventas_por_periodo;
CREATE VIEW kebacommerce.vw_ventas_por_periodo AS
SELECT
    DATE_FORMAT(fecha_pedido, '%Y-%m') as periodo,
    COUNT(*) as total_ventas,
    SUM(monto) as monto_total,
    AVG(monto) as venta_promedio
FROM kebacommerce.pedidos
GROUP BY DATE_FORMAT(fecha_pedido, '%Y-%m');

-- Top 3 de categorías más vendidas
DROP VIEW IF EXISTS kebacommerce.vw_top3_categorias_prod;
CREATE VIEW kebacommerce.vw_top3_categorias_prod AS
SELECT 
tipo_producto , COUNT(*) AS numero_cat
FROM kebacommerce.pedidos as ped
JOIN kebacommerce.productos as prod
ON ped.id_productos= prod.id_productos
GROUP BY tipo_producto
ORDER BY 2 DESC
LIMIT 3;

