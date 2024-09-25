CREATE DATABASE E_commerce
GO

USE E_commerce
GO


CREATE TABLE usuarios
	
	(
		id						INT PRIMARY KEY IDENTITY(101, 1),
		nombre_usuario			VARCHAR(255) UNIQUE NOT NULL,
		email					VARCHAR(255) UNIQUE NOT NULL,
		password_user			VARCHAR(255) NOT NULL,
		nombres					VARCHAR(255) NOT NULL,
		apellido_paterno		VARCHAR(255) NOT NULL,
		apellido_materno		VARCHAR(255) NOT NULL,
		direccion				NVARCHAR(1000) NOT NULL,
		telefono				VARCHAR(20) NOT NULL,
		fecha_registro			DATETIME DEFAULT GETDATE() NOT NULL	
	)
GO




CREATE TABLE categorias

	(
		id					INT PRIMARY KEY IDENTITY(12258, 1),
		nombre_categoria	VARCHAR(255) UNIQUE NOT NULL,
		descripcion			NVARCHAR(500) NULL
	)
GO

CREATE TABLE productos

	(
		id					INT PRIMARY KEY IDENTITY(1001, 1),
		categoria_id		INT NOT NULL,
		nombre_producto		VARCHAR(255) NOT NULL,
		descripcion			NVARCHAR(1000) NOT NULL,
		precio				DECIMAL(10, 2) NOT NULL,
		stock				INT NOT NULL,
		fecha_agregado		DATETIME DEFAULT GETDATE() NOT NULL,

	CONSTRAINT FK_categoria_producto FOREIGN KEY (categoria_id) REFERENCES categorias (id)
	)
GO

CREATE TABLE carrito

	(
		id					INT PRIMARY KEY IDENTITY(201, 1),
		usuario_id			INT NOT NULL,
		fecha_creacion		DATETIME DEFAULT GETDATE() NOT NULL,

	CONSTRAINT FK_usuario_carrito FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
	)
GO

CREATE TABLE carrito_productos
	
	(
		id					INT PRIMARY KEY IDENTITY(301, 1),
		carrito_id			INT NOT NULL,
		producto_id			INT NOT NULL,
		cantidad			INT NOT NULL,
	
	CONSTRAINT FK_carrito_carrito_productos		FOREIGN KEY (carrito_id)	REFERENCES carrito (id),
	CONSTRAINT FK_producto_carrito_productos	FOREIGN KEY (producto_id)	REFERENCES productos (id)
	)
GO


CREATE TABLE pedidos

	(
		id					INT PRIMARY KEY IDENTITY(501, 1),
		usuario_id			INT NOT NULL,
		monto_total_pedido	DECIMAL(10, 2) NOT NULL,
		estado				VARCHAR(50) NOT NULL,
		fecha_orden			DATETIME DEFAULT GETDATE() NOT NULL,
		direccion_envio		NVARCHAR(1000) NOT NULL,

	CONSTRAINT FK_usuario_pedidos FOREIGN KEY (usuario_id) REFERENCES usuarios (id)	
	)
GO

CREATE TABLE detalle_pedidos

	(
		id					INT PRIMARY KEY IDENTITY(601, 1),
		pedido_id			INT NOT NULL,
		producto_id			INT NOT NULL,
		cantidad			INT NOT NULL,
		precio_unitario		DECIMAL(10, 2) NOT NULL,

	CONSTRAINT FK_pedido_detalle_pedidos FOREIGN KEY (pedido_id) REFERENCES pedidos (id),
	CONSTRAINT FK_producto_detalle_pedido FOREIGN KEY (producto_id) REFERENCES productos (id)
	)
GO

CREATE TABLE metodos_pago

	(
		id					INT PRIMARY KEY IDENTITY(701, 1),
		nombre				VARCHAR(255) UNIQUE NOT NULL,
		descripcion			NVARCHAR(500) NOT NULL	
	)
GO


CREATE TABLE pagos
	
	(
		id					INT PRIMARY KEY IDENTITY(801, 1),
		pedido_id			INT NOT NULL,
		metodo_pago_id		INT NOT NULL,
		monto				DECIMAL(10, 2) NOT NULL,
		fecha_pago			DATETIME DEFAULT GETDATE() NOT NULL,
		estado				VARCHAR(50) NOT NULL,

	CONSTRAINT FK_pedido_pago FOREIGN KEY (pedido_id)		REFERENCES pedidos (id),
	CONSTRAINT FK_metodo_pago FOREIGN KEY (metodo_pago_id)	REFERENCES metodos_pago (id)	
	)
GO


CREATE TABLE envios
	
	(
		id					INT PRIMARY KEY IDENTITY(901, 1),
		pedido_id			INT NOT NULL,
		fecha_envio			DATETIME DEFAULT GETDATE(),
		fecha_entrega		DATETIME,
		estado_envio		VARCHAR(50) NOT NULL,

	CONSTRAINT FK_pedido_envio FOREIGN KEY (pedido_id) REFERENCES pedidos (id)
	)
GO








