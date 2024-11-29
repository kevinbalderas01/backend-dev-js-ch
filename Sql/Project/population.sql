USE kebacommerce;
-- Insertando registros en la tabla productos
INSERT INTO productos (cantidad, tipo_producto, descripcion) VALUES
    (50, 'Laptop', 'Laptop HP 15 pulgadas 8GB RAM 256GB SSD'),
    (30, 'Smartphone', 'iPhone 13 128GB Negro'),
    (100, 'Audífonos', 'Audífonos inalámbricos Bluetooth con cancelación de ruido'),
    (25, 'Tablet', 'iPad Air 64GB WiFi Gris Espacial'),
    (75, 'Monitor', 'Monitor Gaming 27 pulgadas 144Hz 2K');

-- Insertando registros en la tabla metodos_pago
INSERT INTO metodos_pago (tipo_pago_desc) VALUES
    ('Tarjeta de Crédito'),
    ('PayPal'),
    ('Transferencia Bancaria'),
    ('Efectivo'),
    ('Tarjeta de Débito');

-- Insertando registros para categoria_operadores
INSERT INTO categoria_operadores (nombre_categoria, desc_puesto) VALUES
    ('Supervisor', 'Encargado de supervisar y coordinar las actividades del equipo de operadores'),
    ('Operador Senior', 'Operador con más de 3 años de experiencia y capacidad de entrenamiento'),
    ('Operador Junior', 'Operador con experiencia menor a 2 años'),
    ('Especialista Técnico', 'Encargado de soporte técnico y mantenimiento de equipos'),
    ('Coordinador', 'Responsable de la planificación y distribución de tareas');

-- Insertando registros para datos_ubicacion_clientes
INSERT INTO datos_ubicacion_clientes (codigo_postal, estado, pais, municipio) VALUES
    (64000, 'Nuevo León', 'México', 'Monterrey'),
    (06500, 'Ciudad de México', 'México', 'Cuauhtémoc'),
    (44100, 'Jalisco', 'México', 'Guadalajara'),
    (20000, 'Aguascalientes', 'México', 'Aguascalientes'),
    (31000, 'Chihuahua', 'México', 'Chihuahua');

-- Insertando registros para datos_ubicacion_centros_recepcion
INSERT INTO datos_ubicacion_centros_recepcion (codigo_postal, estado, pais, municipio, direccion) VALUES
    (64000, 'Nuevo León', 'México', 'Monterrey', 'Av. Constitución #123, Col. Centro'),
    (06500, 'Ciudad de México', 'México', 'Cuauhtémoc', 'Paseo de la Reforma #456, Col. Juárez'),
    (44100, 'Jalisco', 'México', 'Guadalajara', 'Av. Vallarta #789, Col. Americana'),
    (20000, 'Aguascalientes', 'México', 'Aguascalientes', 'Av. López Mateos #321, Col. Centro'),
    (31000, 'Chihuahua', 'México', 'Chihuahua', 'Av. Universidad #654, Col. Centro');

-- Insertando registros para datos_ubicacion_ventas
INSERT INTO datos_ubicacion_ventas (codigo_postal, estado, pais, municipio) VALUES
    (64100, 'Nuevo León', 'México', 'San Nicolás'),
    (06600, 'Ciudad de México', 'México', 'Benito Juárez'),
    (45010, 'Jalisco', 'México', 'Zapopan'),
    (20130, 'Aguascalientes', 'México', 'Aguascalientes'),
    (31200, 'Chihuahua', 'México', 'Chihuahua');

-- Insertando registros para categoria_vendedor
INSERT INTO categoria_vendedor (tipo_vendedor, desc_tipo) VALUES
    ('Vendedor Senior', 'Vendedor con más de 5 años de experiencia y alto rendimiento en ventas'),
    ('Vendedor Junior', 'Vendedor con menos de 2 años de experiencia en proceso de desarrollo'),
    ('Vendedor Especializado', 'Vendedor especializado en productos técnicos o específicos'),
    ('Supervisor de Ventas', 'Encargado de coordinar y supervisar equipo de vendedores'),
    ('Vendedor Corporativo', 'Especializado en cuentas empresariales y clientes mayoristas');


-- Insertando registros para centros_recepcion
INSERT INTO centros_recepcion (id_datos_ubicacion_centros_recepcion, fecha_creacion) VALUES
    (1, '2023-01-15 08:00:00'),
    (2, '2023-02-20 09:30:00'),
    (3, '2023-03-25 10:15:00'),
    (4, '2023-04-30 11:00:00'),
    (5, '2023-05-05 13:45:00'),
    (1, '2023-06-10 14:30:00'),
    (2, '2023-07-15 15:20:00'),
    (3, '2023-08-20 16:10:00'),
    (4, '2023-09-25 09:00:00'),
    (5, '2023-10-30 10:45:00');

-- Insertando registros para clientes
INSERT INTO clientes (id_datos_ubicacion_clientes, id_metodos_pago, nombre, apellido, telefono, calle, correo, fecha_nacimiento) VALUES
    (1, 2, 'Alejandro', 'Rodríguez Méndez', '81-1234-5678', 'Av. Reforma 123', 'alejandro.rodriguez@email.com', '1970-01-10 08:00:00'),
    (3, 1, 'Marina', 'López García', '33-9876-5432', 'Calle Juárez 456', 'marina.lopez@email.com', '1980-01-15 09:30:00'),
    (2, 3, 'José', 'García Torres', '55-8765-4321', 'Insurgentes 789', 'jose.garcia@email.com', '1990-02-01 10:15:00'),
    (4, 2, 'Lucía', 'Martínez Silva', '44-2345-6789', 'Hidalgo 321', 'lucia.martinez@email.com', '1964-02-10 11:00:00'),
    (5, 4, 'Pedro', 'Sánchez Ruiz', '61-3456-7890', 'Morelos 654', 'pedro.sanchez@email.com', '2010-02-15 13:45:00'),
    (1, 5, 'Carla', 'Flores Vega', '81-4567-8901', 'Madero 987', 'carla.flores@email.com', '2000-02-20 14:30:00'),
    (2, 1, 'Gabriel', 'Torres Luna', '55-5678-9012', 'Zaragoza 147', 'gabriel.torres@email.com', '1988-03-01 15:20:00'),
    (3, 2, 'Valeria', 'Ramírez Cruz', '33-6789-0123', 'Allende 258', 'valeria.ramirez@email.com', '1998-03-05 16:10:00'),
    (4, 3, 'Diego', 'González Mora', '44-7890-1234', 'Victoria 369', 'diego.gonzalez@email.com', '2005-03-10 09:00:00'),
    (5, 4, 'Fernanda', 'Castro Díaz', '61-8901-2345', 'Aldama 741', 'fernanda.castro@email.com', '1974-03-15 10:45:00');

INSERT INTO nuevos_clientes (nombre, apellido, telefono) VALUES
    ('Remi', 'Rodríguez Méndez', '81-1234-5678'),
    ('Tortuga', 'López García', '33-9876-5432'),
    ('Jake', 'García Torres', '55-8765-4321'),
    ('Kevin', 'Martínez Silva', '44-2345-6789'),
    ('Juan Ma', 'Sánchez Ruiz', '61-3456-7890');

-- Insertando 10 registros de operadores
INSERT INTO operadores_logistica (id_centros_recepcion, id_categoria_operadores, nombre, apellido, telefono) VALUES
    (1, 2, 'Juan', 'Pérez Rodríguez', '81-1234-5678'),
    (3, 1, 'María', 'González López', '33-9876-5432'),
    (2, 3, 'Carlos', 'Martínez Silva', '55-8765-4321'),
    (4, 2, 'Ana', 'Sánchez Torres', '44-2345-6789'),
    (5, 4, 'Roberto', 'López García', '61-3456-7890'),
    (1, 3, 'Laura', 'Ramírez Flores', '81-2345-6789'),
    (2, 2, 'Miguel', 'Torres Ruiz', '55-3456-7890'),
    (3, 4, 'Patricia', 'García Morales', '33-4567-8901'),
    (4, 1, 'Fernando', 'Hernández Cruz', '44-5678-9012'),
    (5, 2, 'Diana', 'Morales Vega', '61-6789-0123');


-- Insertando 10 registros de vendedores
INSERT INTO vendedores (id_categoria_vendedor, id_datos_ubicacion_ventas, nombre, apellido, telefono, correo, fecha_alta) VALUES
    (1, 3, 'Ricardo', 'Martínez López', '33-1234-5678', 'ricardo.martinez@empresa.com', '2024-01-15 08:00:00'),
    (2, 1, 'Sofía', 'García Pérez', '81-9876-5432', 'sofia.garcia@empresa.com', '2024-01-20 09:30:00'),
    (3, 2, 'Eduardo', 'Sánchez Ruiz', '55-8765-4321', 'eduardo.sanchez@empresa.com', '2024-02-01 10:15:00'),
    (1, 4, 'Carmen', 'López Torres', '44-2345-6789', 'carmen.lopez@empresa.com', '2024-02-10 11:00:00'),
    (2, 5, 'Daniel', 'Torres Morales', '61-3456-7890', 'daniel.torres@empresa.com', '2024-02-15 13:45:00'),
    (4, 1, 'Isabel', 'Ramírez Silva', '81-4567-8901', 'isabel.ramirez@empresa.com', '2024-02-20 14:30:00'),
    (3, 2, 'Javier', 'González Flores', '55-5678-9012', 'javier.gonzalez@empresa.com', '2024-03-01 15:20:00'),
    (5, 3, 'Martha', 'Hernández Cruz', '33-6789-0123', 'martha.hernandez@empresa.com', '2024-03-05 16:10:00'),
    (4, 4, 'Luis', 'Morales Vega', '44-7890-1234', 'luis.morales@empresa.com', '2024-03-10 09:00:00'),
    (5, 5, 'Ana', 'Flores Díaz', '61-8901-2345', 'ana.flores@empresa.com', '2024-03-15 10:45:00');

-- Insertando 10 registros de vendedor_centros_recepcion
INSERT INTO vendedor_centros_recepcion (id_vendedor, id_centros_recepcion, fecha_recibo, fecha_envio) VALUES
    (1, 3, '2024-03-15 09:00:00', '2024-03-16 14:30:00'),
    (2, 1, '2024-03-15 10:30:00', '2024-03-16 16:00:00'),
    (3, 2, '2024-03-16 11:15:00', '2024-03-17 15:45:00'),
    (4, 5, '2024-03-16 13:00:00', '2024-03-17 17:30:00'),
    (5, 4, '2024-03-17 09:30:00', '2024-03-18 14:00:00'),
    (1, 2, '2024-03-17 14:45:00', '2024-03-18 16:30:00'),
    (2, 3, '2024-03-18 10:00:00', '2024-03-19 15:15:00'),
    (3, 1, '2024-03-18 11:30:00', '2024-03-19 17:00:00'),
    (4, 4, '2024-03-19 09:15:00', '2024-03-20 14:45:00'),
    (5, 5, '2024-03-19 13:30:00', '2024-03-20 16:15:00');

-- Insertando registros para envios
INSERT INTO envios (fecha_envio, fecha_entrega) VALUES
    ('2024-03-15 10:00:00', '2024-03-17 14:30:00'),
    ('2024-03-15 11:30:00', '2024-03-17 16:00:00'),
    ('2024-03-16 12:15:00', '2024-03-18 15:45:00'),
    ('2024-03-16 14:00:00', '2024-03-18 17:30:00'),
    ('2024-03-17 10:30:00', '2024-03-19 14:00:00'),
    ('2024-03-17 15:45:00', '2024-03-19 16:30:00'),
    ('2024-03-18 11:00:00', '2024-03-20 15:15:00'),
    ('2024-03-18 12:30:00', '2024-03-20 17:00:00'),
    ('2024-03-19 10:15:00', '2024-03-21 14:45:00'),
    ('2024-03-19 14:30:00', '2024-03-21 16:15:00');

-- Insertando registros para envio_centro_recepcion
INSERT INTO envio_centro_recepcion (id_centros_recepcion, id_envios, fecha_recibo, fecha_salida) VALUES
    (1, 3, '2024-03-15 08:00:00', '2024-03-15 14:30:00'),
    (2, 1, '2024-03-15 09:30:00', '2024-03-15 16:00:00'),
    (3, 4, '2024-03-16 10:15:00', '2024-03-16 15:45:00'),
    (4, 2, '2024-03-16 11:00:00', '2024-03-16 17:30:00'),
    (5, 5, '2024-03-17 09:30:00', '2024-03-17 14:00:00'),
    (1, 2, '2024-03-17 13:45:00', '2024-03-17 18:30:00'),
    (2, 4, '2024-03-18 08:30:00', '2024-03-18 15:15:00'),
    (3, 1, '2024-03-18 10:30:00', '2024-03-18 17:00:00'),
    (4, 3, '2024-03-19 09:15:00', '2024-03-19 14:45:00'),
    (5, 5, '2024-03-19 11:30:00', '2024-03-19 16:15:00');



-- Insertando registros para pedidos
INSERT INTO pedidos (id_cliente, id_productos, id_centros_recepcion, id_metodos_pago, id_envios, detalles_entrega, monto, fecha_pedido) VALUES
    (1, 3, 2, 2, 1, 'Entregar en horario matutino', 15999.99, '2024-03-15 09:00:00'),
    (2, 1, 3, 1, 2, 'Dejar con el portero', 12499.50, '2024-03-15 10:30:00'),
    (3, 4, 1, 3, 3, 'Llamar antes de entregar', 8999.99, '2024-03-16 11:15:00'),
    (4, 2, 4, 2, 4, 'Entregar en oficina', 20999.99, '2024-03-16 13:00:00'),
    (5, 5, 5, 4, 5, 'Timbre en segundo piso', 5999.99, '2024-03-17 09:30:00'),
    (6, 2, 1, 5, 1, 'Entregar en recepción', 13499.99, '2024-03-17 14:45:00'),
    (7, 3, 2, 1, 2, 'Confirmar por teléfono', 18999.99, '2024-03-18 10:00:00'),
    (8, 1, 3, 2, 3, 'Dejar en paquetería', 9999.99, '2024-03-18 11:30:00'),
    (9, 5, 4, 3, 4, 'Entregar solo en días hábiles', 6499.99, '2024-03-19 09:15:00'),
    (10, 4, 5, 4, 5, 'Tocar el timbre tres veces', 11999.99, '2024-03-19 13:30:00');


-- Insertando registros para envio_pedido
INSERT INTO envio_pedido (id_envios, id_pedidos) VALUES
    (1, 3),
    (2, 1),
    (3, 4),
    (4, 2),
    (5, 5),
    (1, 2),
    (2, 4),
    (3, 1),
    (4, 5),
    (5, 3);





