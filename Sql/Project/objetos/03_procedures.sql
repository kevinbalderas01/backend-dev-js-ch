USE kebacommerce;
-- Procedimiento para reportar clientes que no son mayores de edad
DELIMITER //
DROP PROCEDURE IF EXISTS kebacommerce.sp_clientes_no_mayores //
CREATE PROCEDURE kebacommerce.sp_clientes_no_mayores()
BEGIN
    DROP TABLE IF EXISTS kebacommerce.clientes_no_legales;
    CREATE TABLE kebacommerce.clientes_no_legales 
    AS
    SELECT c.nombre, c.apellido , kebacommerce.fx_mayor_edad(c.fecha_nacimiento) as Legal
    FROM kebacommerce.clientes AS c
    WHERE kebacommerce.fx_mayor_edad(c.fecha_nacimiento) = 0;
END //
DELIMITER ;

-- Verificamos salida exitosa
CALL kebacommerce.sp_clientes_no_mayores();
SELECT * FROM kebacommerce.clientes_no_legales;


-- Procedimiento para calcular detalles a niveles de granularidad de en fecha de entrega y fecha envio
DELIMITER //
DROP PROCEDURE IF EXISTS kebacommerce.sp_envio_diff //
CREATE PROCEDURE kebacommerce.sp_envio_diff()
BEGIN
	DROP TABLE IF EXISTS kebacommerce.envios_details;
	CREATE TABLE kebacommerce.envios_details
    SELECT env.*, TIMESTAMPDIFF(DAY, fecha_envio, fecha_entrega) AS diff_dias, TIMESTAMPDIFF(HOUR, fecha_envio, fecha_entrega) AS diff_horas , TIMESTAMPDIFF(MINUTE, fecha_envio, fecha_entrega) AS diff_minutos
    FROM kebacommerce.envios AS env;
END //
DELIMITER ;

-- Verificamos salida exitosa
CALL kebacommerce.sp_envio_diff();
SELECT * FROM kebacommerce.envios_details;