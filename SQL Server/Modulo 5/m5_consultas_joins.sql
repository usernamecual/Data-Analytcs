 
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
--consigna:
--ventas con clientes, productos y cualquier otra dimensión de tu caso de negocio 
--fecha, identificación del cliente, descripción del producto, cantidad, precio unitario y total de venta.
--segmento de cliente, categoría de producto o región,

USE ventas_tech_db;

SELECT 
v.fecha_venta, 
v.id_cliente, 
cl.nombre AS nombre_cliente,
cl.ciudad AS ciudad_cliente,  --segmento cliente/region
p.nombre_producto,
c.nombre_categoria, 
c.descripcion AS descripcion_categoria, --segmento categoria/descripcion
v.cantidad, 
v.precio_unitario,
(v.cantidad * v.precio_unitario) AS total_venta
FROM ventas AS v
JOIN productos AS p
ON v.id_producto = p.id_producto
JOIN categorias AS c
ON p.id_categoria = c.id_categoria
JOIN clientes AS cl
ON v.id_cliente = cl.id_cliente;

--Consulta 2 — Clientes sin ventas (LEFT JOIN) 
--consigna: 
--Identificá clientes registradosque aún no han realizado ninguna compra
--Mostrá su nombre, email y fecha de registro. Usá WHERE ... IS NULL para aislar los casos

SELECT
c.nombre,
c.email,
c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v 
ON c.id_cliente = v.id_cliente
WHERE v.id_venta is null

--Consulta 3 — Productos sin ventas (LEFT JOIN)
--consigna:
--Identificá productos del catálogo que no tienen ninguna venta registrada.
--Mostrá nombre del producto, categoría y precio. Usá WHERE ... IS NULL.


SELECT
p.nombre_producto,
c.nombre_categoria,
p.precio
FROM productos AS p
LEFT JOIN ventas AS v
ON p.id_producto = v.id_producto
LEFT JOIN categorias AS c
ON p.id_categoria = c.id_categoria
WHERE v.id_venta IS NULL 


--Consulta 4 — Consolidado por canal (UNION ALL)
--consigna:
--generar la columna canal dentro de cada select
--dos SELECT sobre tus ventas, separados por el criterio que corresponda
--(ej.: ventas de dos períodos, dos sucursales o dos orígenes distintos)
--agregá en cada uno una columna de texto fija que identifique el origen
--Unilos con UNION ALL y cerrá con un GROUP BY para obtener el total por cada origen.

--La estructura es esta:
--SELECT fecha, total, 'Online' AS canal FROM ventas WHERE..
--UNION ALL SELECT fecha, total, 'Presencial' AS canal FROM ventas WHERE..

SELECT
canal,
sum (total_ventas) as total_ventas
FROM
(
SELECT
(cantidad*precio_unitario) as total_ventas,
'Mayorista' AS canal
FROM
ventas
WHERE cantidad >3 
UNION ALL
SELECT 
(cantidad*precio_unitario) as total_ventas,
'Minorista' AS canal
FROM
ventas
WHERE cantidad <3
) AS c
GROUP BY canal;