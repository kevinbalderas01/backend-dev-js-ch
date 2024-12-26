USE kebacommerce;
-- Validación de telefonos (en clientes)
DELIMITER //
DROP TRIGGER IF EXISTS kebacommerce.tg_validar_cliente_telefono //
CREATE TRIGGER kebacommerce.tg_validar_cliente_telefono
BEFORE INSERT ON kebacommerce.clientes
FOR EACH ROW
BEGIN
    SET @msg = "DEBE TENER 10 DIGITOS TOTALES, TODOS NUMEROS";
    IF NOT NEW.telefono REGEXP '^[0-9]{2}-[0-9]{4}-[0-9]{4}$' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg ;
    END IF;
END //
DELIMITER ;

-- Insertamos nuevos registros para validar trigger
INSERT INTO clientes (id_datos_ubicacion_clientes, id_metodos_pago, nombre, apellido, telefono, calle, correo, fecha_nacimiento) VALUES
    (4, 2, 'Kevin', 'Balderas', '42-2341-0689', 'La Real Joya', 'kevin.martinez@email.com', '1998-12-19 11:00:00');

    
-- Trigger para auditar nuevos clientes agregados
DROP TRIGGER IF EXISTS kebacommerce.tg_agregar_nuevo_cliente ;
CREATE TRIGGER kebacommerce.tg_agregar_nuevo_cliente
AFTER INSERT ON kebacommerce.clientes
FOR EACH ROW
INSERT INTO kebacommerce.nuevos_clientes (nombre, apellido, telefono) 
VALUES(NEW.nombre, NEW.apellido, NEW.telefono);

-- Insertamos nuevos registros para validar trigger
INSERT INTO nuevos_clientes (nombre, apellido, telefono) VALUES
    ('Jose', 'Rodríguez Méndez', '81-1234-5675'),
    ('Pepe', 'López García', '33-9876-5430'),
    ('Santiago', 'García Torres', '55-8765-3851'),
    ('Juan', 'Balderas', '42-2341-0689'),
    ('Jake', 'Sánchez Ruiz', '61-3450-7890');



