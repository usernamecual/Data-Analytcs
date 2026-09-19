USE ventas_tech_db;

-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH (fecha_venta);

-- CONSULTA 2 - RANKING DE PRODUCTOS
SELECT
TOP 5 ID_producto,
SUM (cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY ID_producto
ORDER BY total_facturado desc;

-- CONSULTA 3 - CLIENTES RECURRENTES
SELECT
ID_cliente, 
SUM(cantidad * precio_unitario) AS total_facturado,
SUM (cantidad) AS cantidad_pedidos
FROM ventas
GROUP BY ID_cliente
HAVING COUNT(*) > 1;

-- CONSULTA 4 - MES POR ENCIMA/POR DEBAJO DEL PROMEDIO

SELECT 
mes,
total_mes,
CASE WHEN total_mes >= AVG(total_mes) OVER() THEN 'Por encima' ELSE 'Por debajo'
END AS etiqueta_promedio
FROM (
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_mes
FROM ventas
GROUP BY MONTH(fecha_venta)
) AS t;

-- BLOQUE DE CIERRE 
-- Las ventas se concentraron en el mes 3
-- De los clientes recurrentes, los ID_cliente 2 y 3 son los que concentraron la mayor cantidad de pedidos
-- Sin embargo, de los clientes recurrentes, ninguno supera el valor del ticket promedio, compran en cantidad, pero no generan un alto ingreso  
