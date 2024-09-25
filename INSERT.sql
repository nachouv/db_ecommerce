INSERT INTO usuarios (nombre_usuario, email, password_user, nombres, apellido_paterno, apellido_materno, direccion, telefono, fecha_registro)
VALUES
('jrodriguez', 'jrodriguez@mail.com', 'pass1234', 'Juan', 'Rodriguez', 'Lopez', 'Av. Larco 123, Miraflores, Lima', '987654321', '2024-07-05'),
('mhernandez', 'mhernandez@mail.com', 'pass5678', 'Maria', 'Hernandez', 'Gonzalez', 'Jr. Puno 456, San Isidro, Lima', '987654322', '2024-07-12'),
('aperez', 'aperez@mail.com', 'pass8765', 'Ana', 'Perez', 'Martinez', 'Calle Cusco 789, Barranco, Lima', '987654323', '2024-07-25'),
('cfernandez', 'cfernandez@mail.com', 'pass2345', 'Carlos', 'Fernandez', 'Morales', 'Av. Grau 321, Miraflores, Lima', '987654324', '2024-08-02'),
('fgarcia', 'fgarcia@mail.com', 'pass4321', 'Francisco', 'Garcia', 'Santos', 'Calle Arequipa 654, San Isidro, Lima', '987654325', '2024-08-10'),
('lgutierrez', 'lgutierrez@mail.com', 'pass3456', 'Luis', 'Gutierrez', 'Vargas', 'Av. Bolívar 987, Miraflores, Lima', '987654326', '2024-08-20'),
('mpalacios', 'mpalacios@mail.com', 'pass5432', 'Maria', 'Palacios', 'Ruiz', 'Jr. Tacna 258, La Victoria, Lima', '987654327', '2024-08-30'),
('nrojas', 'nrojas@mail.com', 'pass6789', 'Natalia', 'Rojas', 'Paredes', 'Calle San Martín 159, Jesús María, Lima', '987654328', '2024-09-05'),
('ojimenez', 'ojimenez@mail.com', 'pass7890', 'Oscar', 'Jimenez', 'Cano', 'Av. Javier Prado 753, Surco, Lima', '987654329', '2024-09-10'),
('mcastro', 'mcastro@mail.com', 'pass8901', 'Miguel', 'Castro', 'Castro', 'Calle Libertad 963, San Borja, Lima', '987654330', '2024-09-15'),
('emartinez', 'emartinez@mail.com', 'pass2341', 'Elena', 'Martinez', 'Vega', 'Av. Benavides 1234, Miraflores, Lima', '987654331', '2024-09-17'),
('dlopez', 'dlopez@mail.com', 'pass3412', 'Diego', 'Lopez', 'Mendoza', 'Calle Zela 567, San Miguel, Lima', '987654332', '2024-09-18'),
('acarvajal', 'acarvajal@mail.com', 'pass4123', 'Alvaro', 'Carvajal', 'Diaz', 'Jr. Lima 432, San Isidro, Lima', '987654333', '2024-09-19'),
('nnavarro', 'nnavarro@mail.com', 'pass1235', 'Nora', 'Navarro', 'Perez', 'Av. Angamos 543, Miraflores, Lima', '987654334', '2024-09-20'),
('jluna', 'jluna@mail.com', 'pass3457', 'Javier', 'Luna', 'Rios', 'Jr. Lampa 654, Pueblo Libre, Lima', '987654335', '2024-09-21');


SELECT * FROM usuarios
GO


INSERT INTO categorias (nombre_categoria, descripcion)
VALUES 
('Electrodomésticos', 'Aparatos eléctricos para el hogar como refrigeradoras, lavadoras, microondas, etc.'),
('Celulares', 'Teléfonos móviles de diversas marcas y modelos.'),
('Laptops', 'Portátiles de diferentes marcas para uso personal o profesional.'),
('Televisores', 'Televisores de distintas pulgadas y tecnologías como LED, OLED, Smart TV.'),
('Tablets', 'Dispositivos móviles con pantalla táctil para entretenimiento y trabajo.'),
('Aires Acondicionados', 'Equipos para la climatización de espacios, portátiles o fijos.'),
('Cámaras Fotográficas', 'Cámaras digitales y profesionales de diferentes marcas.'),
('Consolas de Videojuegos', 'Equipos de entretenimiento como PlayStation, Xbox, Nintendo.'),
('Electrónica de Audio', 'Audífonos, parlantes, y sistemas de sonido.'),
('Impresoras', 'Impresoras multifuncionales y de oficina.'),
('Monitores', 'Monitores de diferentes tamaños y resoluciones para computadoras.'),
('Routers', 'Equipos de conectividad para redes Wi-Fi.'),
('Smartwatches', 'Relojes inteligentes con funciones de salud y conectividad.'),
('Auriculares', 'Auriculares con cancelación de ruido y alta calidad de sonido.'),
('Proyectores', 'Equipos para proyección de imágenes y videos en grandes pantallas.');


SELECT * FROM categorias
GO


INSERT INTO productos (categoria_id, nombre_producto, descripcion, precio, stock, fecha_agregado)
VALUES 
(12258, 'Refrigeradora LG 300L', 'Refrigeradora de 300 litros con tecnología inverter, eficiencia energética A++.', 4800.00, 10, '2024-07-01'),
(12258, 'Lavadora Samsung 8kg', 'Lavadora automática de carga frontal de 8 kg, con función de vapor.', 3600.00, 15, '2024-07-05'),
(12259, 'iPhone 13', 'Teléfono móvil con pantalla de 6.1 pulgadas y 128 GB de almacenamiento.', 3200.00, 20, '2024-07-10'),
(12259, 'Samsung Galaxy A32', 'Teléfono móvil con pantalla de 6.4 pulgadas y 64 GB de almacenamiento.', 900.00, 30, '2024-06-15'),
(12260, 'Dell XPS 13', 'Laptop de 13.3 pulgadas con procesador i7 y 16 GB de RAM.', 6000.00, 5, '2024-06-20'),
(12260, 'HP Pavilion 15', 'Laptop de 15.6 pulgadas con procesador AMD Ryzen 5 y 8 GB de RAM.', 2800.00, 8, '2024-06-25'),
(12261, 'Televisor Samsung 55" 4K', 'Televisor LED de 55 pulgadas con resolución 4K y Smart TV.', 2400.00, 12, '2024-06-30'),
(12262, 'iPad 10.2"', 'Tablet de 10.2 pulgadas con 64 GB de almacenamiento y Apple Pencil.', 1400.00, 25, '2024-06-05'),
(12263, 'Aire Acondicionado LG 12000 BTU', 'Aire acondicionado portátil de 12,000 BTU, eficiencia energética A.', 3200.00, 6, '2024-06-10'),
(12264, 'Cámara Canon EOS M50', 'Cámara digital con lente intercambiable y 24 MP, ideal para vloggers.', 2800.00, 10, '2024-06-15'),
(12265, 'Consola PlayStation 5', 'Consola de videojuegos de última generación con gráficos 4K.', 2300.00, 25, '2024-06-18'),
(12266, 'Monitor LG 27"', 'Monitor de 27 pulgadas con resolución 4K y tasa de refresco de 144Hz.', 1600.00, 20, '2024-06-20'),
(12267, 'Router TP-Link', 'Router Wi-Fi de doble banda con velocidad de hasta 1200 Mbps.', 550.00, 50, '2024-06-21'),
(12268, 'Apple Watch Series 6', 'Reloj inteligente con monitor de ritmo cardíaco y GPS.', 1200.00, 30, '2024-06-22'),
(12271, 'Auriculares Sony WH-1000XM4', 'Auriculares con cancelación de ruido activa y sonido de alta fidelidad.', 1400.00, 40, '2024-06-23'),
(12260, 'MacBook Air M1', 'Laptop ultraligera con procesador M1 de Apple y 256 GB de almacenamiento.', 4800.00, 10, '2024-06-24'),
(12258, 'Microondas Panasonic 25L', 'Microondas con 25 litros de capacidad y función grill.', 1200.00, 20, '2024-06-24'),
(12261, 'Televisor LG OLED 65"', 'Televisor OLED de 65 pulgadas con resolución 4K y HDR.', 5000.00, 5, '2024-07-02'),
(12259, 'Xiaomi Redmi Note 11', 'Teléfono móvil con pantalla de 6.5 pulgadas y 128 GB de almacenamiento.', 900.00, 30, '2024-06-05'),
(12264, 'Cámara Nikon D5600', 'Cámara réflex digital con lente de 18-55 mm y 24 MP.', 2400.00, 10, '2024-06-14');

SELECT * FROM productos
GO

INSERT INTO carrito (usuario_id, fecha_creacion) -- despues de carrito_productos
VALUES 
(101, '2024-07-16'),
(102, '2024-07-13'),
(103, '2024-07-26'),
(104, '2024-08-03'),
(105, '2024-08-11'),
(106, '2024-08-21'),
(107, '2024-09-01'),
(108, '2024-09-06'),
(109, '2024-09-11'),
(110, '2024-08-16'),
(111, '2024-08-24'),
(112, '2024-09-10'),
(113, '2024-09-20'),
(114, '2024-09-15'),
(115, '2024-09-01')
GO

SELECT * FROM carrito
GO

INSERT INTO carrito_productos (carrito_id, producto_id, cantidad)
VALUES
(201, 1001, 1),
(202, 1003, 2),
(203, 1006, 3),
(204, 1007, 1),
(205, 1008, 3),
(206, 1009, 1),
(207, 1020, 1),
(208, 1011, 2),
(209, 1012, 2),
(210, 1013, 1),
(211, 1014, 1),
(212, 1018, 2),
(213, 1013, 1),
(214, 1016, 1),
(215, 1019, 2),
(202, 1001, 1),
(209, 1008, 2),
(210, 1011, 1),
(213, 1018, 1),
(204, 1005, 2);

SELECT * FROM carrito_productos
GO


----

INSERT INTO pedidos (usuario_id, monto_total_pedido, estado, fecha_orden, direccion_envio)
VALUES
(101, 4800.00, 'Completado', '2024-08-01', 'Av. Larco 123, Miraflores, Lima'),
(102, 11200.00, 'Completado', '2024-07-13', 'Jr. Puno 456, San Isidro, Lima'),
(103, 8400.00, 'Completado', '2024-08-02', 'Calle Cusco 789, Barranco, Lima'),
(104, 14400.00, 'Completado', '2024-08-12', 'Av. Grau 321, Miraflores, Lima'),
(105, 4200.00, 'Completado', '2024-08-14', 'Calle Arequipa 654, San Isidro, Lima'),
(106, 3200.00, 'Completado', '2024-08-25', 'Av. Bolívar 987, Miraflores, Lima'),
(107, 2400.00, 'En proceso', '2024-09-05', 'Jr. Tacna 258, La Victoria, Lima'),
(108, 4600.00, 'En proceso', '2024-09-06', 'Calle San Martín 159, Jesús María, Lima'),
(109, 6000.00, 'Pendiente', '2024-09-13', 'Av. Javier Prado 753, Surco, Lima'),
(110, 2850.00, 'Completado', '2024-08-20', 'Calle Libertad 963, San Borja, Lima'),
(111, 1200.00, 'Pendiente', '2024-08-30', 'Av. Benavides 1234, Miraflores, Lima'),
(112, 10000.00, 'En proceso', '2024-09-12', 'Calle Zela 567, San Miguel, Lima'),
(113, 5550.00, 'Pendiente', '2024-09-24', 'Jr. Lima 432, San Isidro, Lima'),
(114, 4800.00, 'Pendiente', '2024-09-19', 'Av. Angamos 543, Miraflores, Lima'),
(115, 1800.00, 'Completado', '2024-09-06', 'Jr. Lampa 654, Pueblo Libre, Lima')
GO

SELECT * FROM pedidos
GO
--------------

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES
(501, 1001, 1, 4800.00),  
(502, 1003, 2, 3200.00),   
(502, 1001, 1, 4800.00),  
(503, 1006, 3, 2800.00),  
(504, 1007, 1, 2400.00),  
(504, 1005, 2, 6000.00),  
(505, 1008, 3, 1400.00),  
(506, 1009, 1, 3200.00),   
(507, 1020, 1, 2400.00),   
(508, 1011, 2, 2300.00),  
(509, 1012, 2, 1600.00),
(509, 1008, 2, 1400.00),
(510, 1013, 1, 550.00),
(510, 1011, 1, 2300.00),
(511, 1014, 1, 1200.00),
(512, 1018, 2, 5000.00),
(513, 1013, 1, 550.00),
(513, 1018, 1, 5000.00),
(514, 1016, 1, 4800.00),
(515, 1019, 2, 900.00)
GO

SELECT * FROM detalle_pedidos

--------

INSERT INTO metodos_pago (nombre, descripcion)
VALUES
('Tarjeta de crédito', 'Pago con tarjeta de crédito Visa, MasterCard.'),
('PayPal', 'Pago a través de cuenta PayPal.'),
('Transferencia bancaria', 'Pago mediante transferencia a cuenta bancaria.'),
('Pago contra entrega', 'Pago en efectivo al momento de la entrega del producto.'),
('Crédito tienda', 'Pago con crédito otorgado por la tienda.'),
('Apple Pay', 'Pago rápido con Apple Pay.'),
('Google Pay', 'Pago rápido con Google Pay.'),
('Western Union', 'Pago mediante Western Union.'),
('Bitcoin', 'Pago con criptomonedas.'),
('Cheque', 'Pago mediante cheque.')
GO

SELECT * FROM metodos_pago

-------

INSERT INTO pagos (pedido_id, metodo_pago_id, monto, fecha_pago, estado)
VALUES
(501, 701, 4800.00, '2024-08-02', 'Completado'),
(502, 702, 11200.00, '2024-07-16', 'Completado'),
(503, 703, 8400.00, '2024-08-10', 'Completado'),
(504, 704, 14400.00, '2024-08-03', 'Completado'),
(505, 701, 4200.00, '2024-08-14', 'Pendiente'),
(506, 705, 3200.00, '2024-08-26', 'Completado'),
(507, 706, 2400.00, '2024-09-09', 'Completado'),
(508, 707, 4600.00, '2024-09-06', 'Completado'),
(509, 708, 6000.00, '2024-09-15', 'Pendiente'),
(510, 704, 2850.00, '2024-08-25', 'Pendiente'),
(511, 701, 1200.00, '2024-09-01', 'Completado'),
(512, 704, 10000.00, '2024-09-15', 'Pendiente'),
(513, 701, 5550.00, '2024-09-24', 'Pendiente'),
(514, 704, 4800.00, '2024-09-20', 'Pendiente'),
(515, 710, 1800.00, '2024-09-08', 'Completado')
GO

SELECT * FROM pagos

------------

INSERT INTO envios (pedido_id, fecha_envio, fecha_entrega, estado_envio)
VALUES
(501, '2024-08-03', '2024-08-05', 'Entregado'),
(502, '2024-07-17', '2024-07-19', 'Entregado'),
(503, '2024-08-11', '2024-08-13', 'Entregado'),
(504, '2024-08-04', '2024-08-06', 'Entregado'),
(505, '2024-08-15', '2024-08-17', 'Entregado'),
(506, '2024-08-27', '2024-08-29', 'Entregado'),
(507, '2024-09-22', '2024-09-24', 'En camino'),
(508, '2024-09-07', '2024-09-09', 'Entregado'),
(509, '2024-09-23', '2024-09-25', 'En camino'),
(510, '2024-09-20', '2024-09-22', 'Pendiente'),
(511, '2024-09-02', '2024-09-04', 'Entregado'),
(512, '2024-09-16', '2024-09-25', 'Pendiente'),
(513, '2024-09-25', '2024-09-27', 'Pendiente'),
(514, '2024-09-21', '2024-09-24', 'En camino'),
(515, '2024-09-09', '2024-09-11', 'Entregado');
GO

SELECT * FROM pedidos
GO
