-- PERMISOS COMPLETOS A ADMIN_GERENTE
DROP USER IF EXISTS 'admin_gerente'@'%';
CREATE USER 'admin_gerente'@'%' IDENTIFIED BY 'password_12345';
-- PERMISOS DE SOLO LECTURA A AUDITORIA
DROP USER IF EXISTS 'auditoria_only_read'@'%';
CREATE USER 'auditoria_only_read'@'%' IDENTIFIED BY 'audit_only123_read';
DROP USER IF EXISTS 'encargado_pedidos'@'%';
-- PERMISOS DE SOLO MODIFICACIÓN A TABLA PEDIDOS
CREATE USER 'encargado_pedidos'@'%' IDENTIFIED BY 'pedidos_123_host';

-- DAMOS PRIVILEGIOS
GRANT ALL PRIVILEGES ON *.* TO 'admin_gerente'@'%' WITH GRANT OPTION;
GRANT SELECT ON *.* TO 'auditoria_only_read'@'%';
GRANT SELECT, INSERT, UPDATE ON kebacommerce.pedidos TO 'encargado_pedidos'@'%';
FLUSH PRIVILEGES;
