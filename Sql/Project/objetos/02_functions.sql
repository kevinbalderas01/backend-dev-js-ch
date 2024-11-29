USE kebacommerce;
-- Generar función para saber si el pedido lo hizo una persona mayor de edad
DELIMITER //
DROP FUNCTION IF EXISTS kebacommerce.fx_mayor_edad //
CREATE FUNCTION kebacommerce.fx_mayor_edad(dob DATE)
    RETURNS BOOLEAN
    READS SQL DATA
BEGIN
    RETURN (DATEDIFF(current_date(), dob) / 365) > 18;
END //
DELIMITER ;

-- Comprobamos resultado
SELECT 
    V.*,
    fx_mayor_edad(v.fecha_nacimiento) AS Mayor_edad
FROM
kebacommerce.clientes AS V ;

-- Generar función para obtener lada de telefonos
DELIMITER //
DROP FUNCTION IF EXISTS kebacommerce.fx_obtener_lada //
CREATE FUNCTION kebacommerce.fx_obtener_lada(telefono VARCHAR(20))
    RETURNS CHAR(10)
    DETERMINISTIC
BEGIN
    RETURN (SUBSTRING_INDEX(telefono, '-',1));
END //
DELIMITER ;

-- Comprobamos resultado
SELECT 
    V.*,
    fx_obtener_lada(v.telefono) AS Lada_Telefonica
FROM
kebacommerce.clientes AS V ;


