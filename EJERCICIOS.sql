-- Consulta de pedidos y productos relacionados JUAN IGNACIO URETA
SELECT u.nombres + ' ' + u.apellido_paterno AS Nombre_Completo,
       p.nombre_producto,
       dp.cantidad,
       (dp.cantidad * dp.precio_unitario) AS Total_Producto
FROM pedidos pe
JOIN detalle_pedidos dp ON pe.id = dp.pedido_id
JOIN productos p ON dp.producto_id = p.id
JOIN usuarios u ON pe.usuario_id = u.id
WHERE pe.estado = 'Completado';


-- Promedio de productos por pedido completado JUAN IGNACIO URETA
SELECT AVG(Producto_Por_Pedido) AS Promedio_Productos
FROM (
    SELECT pe.id,
           SUM(dp.cantidad) AS Producto_Por_Pedido
    FROM pedidos pe
    JOIN detalle_pedidos dp ON pe.id = dp.pedido_id
    WHERE pe.estado = 'Completado'
    GROUP BY pe.id
) AS subquery;


-- Métodos de pago más utilizados JUAN IGNACIO URETA
SELECT mp.nombre AS Metodo_Pago,
       COUNT(pa.metodo_pago_id) AS Veces_Utilizado
FROM pagos pa
JOIN metodos_pago mp ON pa.metodo_pago_id = mp.id
WHERE pa.estado = 'Completado'
GROUP BY mp.nombre
ORDER BY Veces_Utilizado DESC;



-- Total de ventas por categoría de productos JUAN IGNACIO URETA
SELECT c.nombre_categoria,
       SUM(dp.cantidad * dp.precio_unitario) AS Total_Ventas
FROM detalle_pedidos dp
JOIN productos p ON dp.producto_id = p.id
JOIN categorias c ON p.categoria_id = c.id
JOIN pedidos pe ON dp.pedido_id = pe.id
WHERE pe.estado = 'Completado'
GROUP BY c.nombre_categoria
ORDER BY Total_Ventas DESC;


-- Procedure para obtener pedidos por estado JUAN IGNACIO URETA
CREATE PROCEDURE ObtenerPedidosPorUsuario
    @usuario_id INT
AS
BEGIN
    SELECT p.id,
           u.nombres + ' ' + u.apellido_paterno AS nombre_completo,
           p.monto_total_pedido,
           p.estado,
           p.fecha_orden,
           p.direccion_envio
    FROM pedidos p
    JOIN usuarios u ON p.usuario_id = u.id
    WHERE p.usuario_id = @usuario_id;
END;
GO

EXEC ObtenerPedidosPorUsuario @usuario_id = 101;

-- 1. Mostrar los productos cuyo precio supere los 1000 soles. MILAGROS CHOQUEPUMA

	SELECT nombre_producto, precio 
	FROM productos 
	WHERE precio > 1000.00;

-- 2. Mostrar los 5 productos más vendidos MILAGROS CHOQUEPUMA

	SELECT TOP 5 p.nombre_producto, SUM(dp.cantidad) AS cantidad_vendida
	FROM detalle_pedidos dp
	JOIN productos p ON dp.producto_id = p.id
	GROUP BY p.nombre_producto
	ORDER BY cantidad_vendida DESC;

-- 3. Mostrar los Electrodomesticos más vendidos MILAGROS CHOQUEPUMA

	SELECT p.nombre_producto, SUM(dp.cantidad) AS cantidad_vendida
	FROM detalle_pedidos dp
	JOIN productos p ON dp.producto_id = p.id
	WHERE p.categoria_id = (SELECT id FROM categorias WHERE nombre_categoria = 'Electrodomésticos')
	GROUP BY p.nombre_producto
	ORDER BY cantidad_vendida DESC

-- 4. Mostrar los pedidos que están PENDIENTES de envío MILAGROS CHOQUEPUMA

	SELECT pd.id AS pedido_id, u.nombres, u.apellido_paterno, pd.monto_total_pedido, e.estado_envio
	FROM pedidos pd
	JOIN usuarios u ON pd.usuario_id = u.id
	JOIN envios e ON pd.id = e.pedido_id
	WHERE e.estado_envio = 'Pendiente'

-- 5. Mostrar los productos con menos de 10 unidades en stock MILAGROS CHOQUEPUMA

	SELECT nombre_producto, stock
	FROM productos
	WHERE stock < 10;

-- 1. Mostrar producto que nunca se ha vendido. SECI CULQUICONDOR RIVERA
	SELECT p.nombre_producto
	FROM productos p
	LEFT JOIN detalle_pedidos dp ON p.id = dp.producto_id
	WHERE dp.producto_id IS NULL;

--2. Contar usuarios según el dominio de su correo electrónico. SECI CULQUICONDOR RIVERA

SELECT COUNT(*) AS usuarios_gmail
FROM usuarios
WHERE email LIKE '%@mail.com';

-- 3. Mostrar el total de ventas realizadas por cada método de pago. SECI CULQUICONDOR RIVERA

	SELECT mp.nombre AS metodo_pago, COUNT(p.id) AS total_ventas
	FROM pagos p
	JOIN metodos_pago mp ON p.metodo_pago_id = mp.id
	GROUP BY mp.nombre

--4. Contar usuarios por año de registro. SECI CULQUICONDOR RIVERA

SELECT YEAR(fecha_registro) AS anio, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY YEAR(fecha_registro)
ORDER BY anio DESC;

-- 5. Mostrar el producto más costoso que se ha vendido hasta el momento SECI CULQUICONDOR RIVERA

	SELECT TOP 1 p.nombre_producto, MAX(dp.precio_unitario) AS precio_mas_caro
	FROM detalle_pedidos dp
	JOIN productos p ON dp.producto_id = p.id
	GROUP BY p.nombre_producto
	ORDER BY precio_mas_caro DESC;


--- Consulta nº1 - Historial de pedidos de un usuario - RODRIGO ESTRADA
SELECT u.nombre_usuario, p.id AS pedido_id, p.fecha_orden, p.estado
FROM usuarios u
JOIN pedidos p ON u.id = p.usuario_id
WHERE u.nombre_usuario = 'jrodriguez';

--- Consulta nº2 - Ingresos totales por método de pago - RODRIGO ESTRADA
SELECT mp.nombre, SUM(p.monto) AS total_ingresos
FROM metodos_pago mp
JOIN pagos p ON mp.id = p.metodo_pago_id
GROUP BY mp.nombre;

--- consulta nº3  usuarios con mayor numero de pedidos - RODRIGO ESTRADA
SELECT u.nombre_usuario, COUNT(p.id) AS total_pedidos
FROM usuarios u
JOIN pedidos p ON u.id = p.usuario_id
GROUP BY u.nombre_usuario
HAVING COUNT(p.id) = (
    SELECT MAX(total)
    FROM (
        SELECT COUNT(id) AS total
        FROM pedidos
        GROUP BY usuario_id
    ) AS subquery
);

--- 4ª Ranking de categorías por ingresos - RODRIGO ESTRADA 
SELECT c.nombre_categoria, SUM(dp.cantidad * p.precio) AS ingresos_totales
FROM categorias c
JOIN productos p ON c.id = p.categoria_id
JOIN detalle_pedidos dp ON p.id = dp.producto_id
GROUP BY c.nombre_categoria
ORDER BY ingresos_totales DESC;

--- 5ª Estado de pedidos por usuario y fecha - RODRIGO ESTRADA
SELECT 
    FORMAT(p.fecha_orden, 'MMMM yyyy') AS mes,
    SUM(p.monto_total_pedido) AS total_vendido
FROM pedidos p
WHERE p.fecha_orden >= DATEADD(MONTH, -6, GETDATE())
GROUP BY 
    FORMAT(p.fecha_orden, 'MMMM yyyy')
ORDER BY 
    MIN(p.fecha_orden);


/*
1. Los 3 primeros usuarios que mas gastos han hecho en la tienda 
	(JONATHAN ACOSTA LLALLE)
*/

SELECT TOP 3
	U.nombres, 
	U.email, 
	SUM(pe.monto_total_pedido) AS TotalGastado
FROM usuarios U
JOIN pedidos pe ON U.id = pe.usuario_id
GROUP BY U.nombres, U.email
ORDER BY TotalGastado DESC
GO

/*
2. Precio promedio de los productos mostrando su nombre 
	y la cantidad stock de cada producto
	(JONATHAN ACOSTA LLALLE)
*/
SELECT 
	p.nombre_producto, 
	AVG(p.precio) AS PrecioPromedio,
	dp.cantidad
FROM productos p
JOIN detalle_pedidos dp ON p.id = dp.producto_id
WHERE p.precio > 1500
GROUP BY p.nombre_producto, dp.cantidad
ORDER BY PrecioPromedio DESC
GO

/*

3. Total de ingresos agrupados por Año y Mes

	(JONATHAN ACOSTA LLALLE)
*/

SELECT 
	YEAR(pe.fecha_orden)			AS Año, 
	MONTH(pe.fecha_orden)			AS Mes, 
	SUM(pe.monto_total_pedido)		AS IngresosMensuales
FROM pedidos pe
GROUP BY YEAR(pe.fecha_orden), MONTH(pe.fecha_orden)
ORDER BY Año, Mes
GO

/*

4. Actualización de los precios de los productos en funcion de su stock disponible
Si el stock es mayor a 20, reduce el precio en un 10%, y si es menor a 10, 
aumenta el precio en un 10%.
	
	(JONATHAN ACOSTA LLALLE)
*/

UPDATE productos
SET precio = CASE
    WHEN stock > 20 THEN Precio * 0.9
    WHEN stock < 10 THEN Precio * 1.10
    ELSE precio
END
GO

SELECT * FROM productos
GO

/*

5. Segmentación de clientes basada en compras o montos realizados
Segmentamos a los clientes en tres grupos ( Alto(1), Medio(2), Bajo(3) ) en función del monto total. 

	(JONATHAN ACOSTA LLALLE)
*/

WITH TotalCompras AS (
    SELECT U.id, U.nombres, SUM(pe.monto_total_pedido) AS TotalGastado
    FROM usuarios U
    JOIN pedidos pe ON U.id = pe.usuario_id
    GROUP BY U.id, U.nombres
)
SELECT id, nombres, TotalGastado,
       NTILE(3) OVER (ORDER BY TotalGastado DESC) AS Segmento
FROM TotalCompras
GO

--Contar usuarios registrados en fines de semana Jerson Brayan Huamali Paucar
SELECT COUNT(*) AS usuarios_finde
FROM usuarios
WHERE DATEPART(WEEKDAY, fecha_registro) IN (7, 1); -- 7 para sábado y 1 para domingo

--Contar usuarios por código de área de teléfono Jerson Brayan Huamali Paucar

SELECT LEFT(telefono, 3) AS codigo_area, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY LEFT(telefono, 3)
ORDER BY total_usuarios DESC;


-- Contar usuarios por la primera letra de su nombre de usuario Jerson Brayan Huamali Paucar
SELECT LEFT(nombre_usuario, 1) AS inicial, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY LEFT(nombre_usuario, 1)
ORDER BY inicial;

-- Contar usuarios que se han registrado en un rango de fechas específico  Jerson Brayan Huamali Paucar

SELECT COUNT(*) AS usuarios_registrados
FROM usuarios
WHERE fecha_registro BETWEEN '2024-01-01' AND '2024-12-31';

--Contar usuarios registrados en el último mes - Jerson Brayan Huamali Paucar

SELECT COUNT(*) AS usuarios_recientes
From usuarios 
WHERE fecha_registro >=DATEADD(MONTH, -1, GETDATE());

-- Contar todos los usuarios registrados - Lizeth Tocto Gonza
SELECT COUNT(*) AS total_usuarios
FROM usuarios;

-- Mostrar la media y desviación estándar de los precios de los Celulares Lizeth Tocto Gonza
.-- Media
SELECT AVG (precio) AS media_precio
FROM productos
WHERE categoria_id = (SELECT id FROM categorias WHERE nombre_categoria = 'Celulares');

--Mostrar el monto total de ventas para cada categoría - Lizeth Tocto Gonza
SELECT c. nombre_categoria, SUM(dp. precio_unitario * dp. cantidad) AS total_ventas_categoria
FROM detalle_pedidos dp
JOIN productos p ON dp. producto_id = p. id
JOIN categorias c ON p. categoria_id = c. id
GROUP BY c. nombre_categoria;

-- Contar usuarios con nombres duplicados - Lizeth Tocto Gonza
SELECT nombre_usuario, COUNT(*) AS cantidad
FROM usuarios
GROUP BY nombre_usuario
HAVING COUNT (*) > 1;