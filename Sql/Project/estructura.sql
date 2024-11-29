DROP DATABASE IF EXISTS kebacommerce;

CREATE DATABASE kebacommerce;
USE kebacommerce;


-- TABLAS SOLO CON PK
CREATE TABLE productos (
    id_productos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cantidad INT,
    tipo_producto VARCHAR(40),
    descripcion VARCHAR(200)
);

CREATE TABLE metodos_pago (
    id_metodos_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_pago_desc VARCHAR(50)
);
CREATE TABLE categoria_operadores (
    id_categoria_operadores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50),
    desc_puesto VARCHAR(200)
);
CREATE TABLE datos_ubicacion_clientes (
    id_datos_ubicacion_clientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_postal INT,
    estado VARCHAR(40),
    pais VARCHAR(40),
    municipio VARCHAR(40)
);
CREATE TABLE datos_ubicacion_centros_recepcion (
    id_datos_ubicacion_centros_recepcion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_postal INT,
    estado VARCHAR(40),
    pais VARCHAR(40),
    municipio VARCHAR(40),
    direccion VARCHAR(200)
);
CREATE TABLE datos_ubicacion_ventas (
    id_datos_ubicacion_ventas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_postal INT,
    estado VARCHAR(40),
    pais VARCHAR(40),
    municipio VARCHAR(40)
);

CREATE TABLE categoria_vendedor (
    id_categoria_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_vendedor VARCHAR(40),
    desc_tipo VARCHAR(200)
);

CREATE TABLE operadores_logistica (
    id_operadores_logistica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_centros_recepcion INT,
    id_categoria_operadores INT,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    telefono VARCHAR(20)
);

CREATE TABLE vendedores(
    id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_categoria_vendedor INT,
    id_datos_ubicacion_ventas INT, 
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    telefono VARCHAR(20),
    correo VARCHAR(200) UNIQUE,
    fecha_alta DATETIME DEFAULT (CURRENT_DATE)

);

CREATE TABLE vendedor_centros_recepcion (
    id_vendedor_centros_recepcion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT,
    id_centros_recepcion INT,
    fecha_recibo DATETIME,
    fecha_envio DATETIME
);

CREATE TABLE envio_centro_recepcion (
    id_envio_centro_recepcion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_centros_recepcion INT,
    id_envios INT,
    fecha_recibo DATETIME,
    fecha_salida DATETIME
);
CREATE TABLE envio_pedido (
    id_envio_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_envios INT,
    id_pedidos INT
);

CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_datos_ubicacion_clientes INT,
    id_metodos_pago INT,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    telefono VARCHAR(20),
    calle VARCHAR(40),
    correo VARCHAR(200) UNIQUE,
    fecha_nacimiento DATETIME DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE nuevos_clientes(
    id_nuevo_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    telefono VARCHAR(20)
);

CREATE TABLE pedidos(
    id_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_productos INT,
    id_centros_recepcion INT, 
    id_metodos_pago INT, 
    id_envios INT, 
    detalles_entrega VARCHAR(200),
    monto DECIMAL(15,2),
    fecha_pedido DATETIME DEFAULT (CURRENT_DATE)
    
);



CREATE TABLE centros_recepcion(
    id_centros_recepcion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_datos_ubicacion_centros_recepcion INT, 
    fecha_creacion DATETIME DEFAULT (CURRENT_DATE)

);

CREATE TABLE envios (
    id_envios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_envio DATETIME,
    fecha_entrega DATETIME
);

-- FOREIGN KEYS

ALTER TABLE clientes 
ADD CONSTRAINT fk_constraint_id_datos_ubicacion_clientes 
FOREIGN KEY(id_datos_ubicacion_clientes) REFERENCES datos_ubicacion_clientes(id_datos_ubicacion_clientes);

ALTER TABLE clientes 
ADD CONSTRAINT fk_constraint_id_metodos_pago 
FOREIGN KEY(id_metodos_pago) REFERENCES metodos_pago(id_metodos_pago);

ALTER TABLE pedidos
ADD CONSTRAINT fk_constraint_id_cliente
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE pedidos 
ADD CONSTRAINT fk_constraint_id_productos
FOREIGN KEY(id_productos) REFERENCES productos(id_productos);

ALTER TABLE pedidos 
ADD CONSTRAINT fk_constraint_id_centros_recepcion
FOREIGN KEY(id_centros_recepcion) REFERENCES centros_recepcion(id_centros_recepcion);

ALTER TABLE pedidos 
ADD CONSTRAINT fk_constraint_id_metodos_pago_pedidos
FOREIGN KEY(id_metodos_pago) REFERENCES metodos_pago(id_metodos_pago);

ALTER TABLE pedidos 
ADD CONSTRAINT fk_constraint_id_envios
FOREIGN KEY(id_envios) REFERENCES envios(id_envios);

ALTER TABLE centros_recepcion 
ADD CONSTRAINT fk_constraint_id_datos_ubicacion_centros_recepcion
FOREIGN KEY(id_datos_ubicacion_centros_recepcion) REFERENCES datos_ubicacion_centros_recepcion(id_datos_ubicacion_centros_recepcion);

ALTER TABLE operadores_logistica 
ADD CONSTRAINT fk_constraint_id_centros_recepcion_logistica
FOREIGN KEY(id_centros_recepcion) REFERENCES centros_recepcion(id_centros_recepcion);

ALTER TABLE operadores_logistica 
ADD CONSTRAINT fk_constraint_id_categoria_operadores
FOREIGN KEY(id_categoria_operadores) REFERENCES categoria_operadores(id_categoria_operadores);

ALTER TABLE vendedores 
ADD CONSTRAINT fk_constraint_id_categoria_vendedor
FOREIGN KEY(id_categoria_vendedor) REFERENCES categoria_vendedor(id_categoria_vendedor);

ALTER TABLE vendedores 
ADD CONSTRAINT fk_constraint_id_datos_ubicacion_ventas
FOREIGN KEY(id_datos_ubicacion_ventas) REFERENCES datos_ubicacion_ventas(id_datos_ubicacion_ventas);

ALTER TABLE vendedor_centros_recepcion 
ADD CONSTRAINT fk_constraint_id_vendedor
FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor);

ALTER TABLE vendedor_centros_recepcion 
ADD CONSTRAINT fk_constraint_id_centros_recepcion_vendedor
FOREIGN KEY(id_centros_recepcion) REFERENCES centros_recepcion(id_centros_recepcion);

ALTER TABLE envio_centro_recepcion 
ADD CONSTRAINT fk_constraint_id_centros_recepcion_envio
FOREIGN KEY(id_centros_recepcion) REFERENCES centros_recepcion(id_centros_recepcion);

ALTER TABLE envio_centro_recepcion 
ADD CONSTRAINT fk_constraint_id_envios_centro
FOREIGN KEY(id_envios) REFERENCES envios(id_envios);


ALTER TABLE envio_pedido 
ADD CONSTRAINT fk_constraint_id_envios_pedido
FOREIGN KEY(id_envios) REFERENCES envios(id_envios);

ALTER TABLE envio_pedido 
ADD CONSTRAINT fk_constraint_id_pedidos_envio
FOREIGN KEY(id_pedidos) REFERENCES pedidos(id_pedidos);

