-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: kebacommerce
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_operadores`
--

DROP TABLE IF EXISTS `categoria_operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_operadores` (
  `id_categoria_operadores` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) DEFAULT NULL,
  `desc_puesto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_operadores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_operadores`
--

LOCK TABLES `categoria_operadores` WRITE;
/*!40000 ALTER TABLE `categoria_operadores` DISABLE KEYS */;
INSERT INTO `categoria_operadores` VALUES (1,'Supervisor','Encargado de supervisar y coordinar las actividades del equipo de operadores'),(2,'Operador Senior','Operador con más de 3 años de experiencia y capacidad de entrenamiento'),(3,'Operador Junior','Operador con experiencia menor a 2 años'),(4,'Especialista Técnico','Encargado de soporte técnico y mantenimiento de equipos'),(5,'Coordinador','Responsable de la planificación y distribución de tareas');
/*!40000 ALTER TABLE `categoria_operadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_vendedor`
--

DROP TABLE IF EXISTS `categoria_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_vendedor` (
  `id_categoria_vendedor` int NOT NULL AUTO_INCREMENT,
  `tipo_vendedor` varchar(40) DEFAULT NULL,
  `desc_tipo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_vendedor`
--

LOCK TABLES `categoria_vendedor` WRITE;
/*!40000 ALTER TABLE `categoria_vendedor` DISABLE KEYS */;
INSERT INTO `categoria_vendedor` VALUES (1,'Vendedor Senior','Vendedor con más de 5 años de experiencia y alto rendimiento en ventas'),(2,'Vendedor Junior','Vendedor con menos de 2 años de experiencia en proceso de desarrollo'),(3,'Vendedor Especializado','Vendedor especializado en productos técnicos o específicos'),(4,'Supervisor de Ventas','Encargado de coordinar y supervisar equipo de vendedores'),(5,'Vendedor Corporativo','Especializado en cuentas empresariales y clientes mayoristas');
/*!40000 ALTER TABLE `categoria_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centros_recepcion`
--

DROP TABLE IF EXISTS `centros_recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centros_recepcion` (
  `id_centros_recepcion` int NOT NULL AUTO_INCREMENT,
  `id_datos_ubicacion_centros_recepcion` int DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT (curdate()),
  PRIMARY KEY (`id_centros_recepcion`),
  KEY `fk_constraint_id_datos_ubicacion_centros_recepcion` (`id_datos_ubicacion_centros_recepcion`),
  CONSTRAINT `fk_constraint_id_datos_ubicacion_centros_recepcion` FOREIGN KEY (`id_datos_ubicacion_centros_recepcion`) REFERENCES `datos_ubicacion_centros_recepcion` (`id_datos_ubicacion_centros_recepcion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros_recepcion`
--

LOCK TABLES `centros_recepcion` WRITE;
/*!40000 ALTER TABLE `centros_recepcion` DISABLE KEYS */;
INSERT INTO `centros_recepcion` VALUES (1,1,'2023-01-15 08:00:00'),(2,2,'2023-02-20 09:30:00'),(3,3,'2023-03-25 10:15:00'),(4,4,'2023-04-30 11:00:00'),(5,5,'2023-05-05 13:45:00'),(6,1,'2023-06-10 14:30:00'),(7,2,'2023-07-15 15:20:00'),(8,3,'2023-08-20 16:10:00'),(9,4,'2023-09-25 09:00:00'),(10,5,'2023-10-30 10:45:00');
/*!40000 ALTER TABLE `centros_recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_datos_ubicacion_clientes` int DEFAULT NULL,
  `id_metodos_pago` int DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `calle` varchar(40) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT (now()),
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_constraint_id_datos_ubicacion_clientes` (`id_datos_ubicacion_clientes`),
  KEY `fk_constraint_id_metodos_pago` (`id_metodos_pago`),
  CONSTRAINT `fk_constraint_id_datos_ubicacion_clientes` FOREIGN KEY (`id_datos_ubicacion_clientes`) REFERENCES `datos_ubicacion_clientes` (`id_datos_ubicacion_clientes`),
  CONSTRAINT `fk_constraint_id_metodos_pago` FOREIGN KEY (`id_metodos_pago`) REFERENCES `metodos_pago` (`id_metodos_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,2,'Alejandro','Rodríguez Méndez','81-1234-5678','Av. Reforma 123','alejandro.rodriguez@email.com','1970-01-10 08:00:00'),(2,3,1,'Marina','López García','33-9876-5432','Calle Juárez 456','marina.lopez@email.com','1980-01-15 09:30:00'),(3,2,3,'José','García Torres','55-8765-4321','Insurgentes 789','jose.garcia@email.com','1990-02-01 10:15:00'),(4,4,2,'Lucía','Martínez Silva','44-2345-6789','Hidalgo 321','lucia.martinez@email.com','1964-02-10 11:00:00'),(5,5,4,'Pedro','Sánchez Ruiz','61-3456-7890','Morelos 654','pedro.sanchez@email.com','2010-02-15 13:45:00'),(6,1,5,'Carla','Flores Vega','81-4567-8901','Madero 987','carla.flores@email.com','2000-02-20 14:30:00'),(7,2,1,'Gabriel','Torres Luna','55-5678-9012','Zaragoza 147','gabriel.torres@email.com','1988-03-01 15:20:00'),(8,3,2,'Valeria','Ramírez Cruz','33-6789-0123','Allende 258','valeria.ramirez@email.com','1998-03-05 16:10:00'),(9,4,3,'Diego','González Mora','44-7890-1234','Victoria 369','diego.gonzalez@email.com','2005-03-10 09:00:00'),(10,5,4,'Fernanda','Castro Díaz','61-8901-2345','Aldama 741','fernanda.castro@email.com','1974-03-15 10:45:00'),(11,4,2,'Kevin','Balderas','42-2341-0689','La Real Joya','kevin.martinez@email.com','1998-12-19 11:00:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_validar_cliente_telefono` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
    SET @msg = "DEBE TENER 10 DIGITOS TOTALES, TODOS NUMEROS";
    IF NOT NEW.telefono REGEXP '^[0-9]{2}-[0-9]{4}-[0-9]{4}$' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg ;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_agregar_nuevo_cliente` AFTER INSERT ON `clientes` FOR EACH ROW INSERT INTO kebacommerce.nuevos_clientes (nombre, apellido, telefono) 
VALUES(NEW.nombre, NEW.apellido, NEW.telefono) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes_no_legales`
--

DROP TABLE IF EXISTS `clientes_no_legales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_no_legales` (
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `Legal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_no_legales`
--

LOCK TABLES `clientes_no_legales` WRITE;
/*!40000 ALTER TABLE `clientes_no_legales` DISABLE KEYS */;
INSERT INTO `clientes_no_legales` VALUES ('Pedro','Sánchez Ruiz',0);
/*!40000 ALTER TABLE `clientes_no_legales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_ubicacion_centros_recepcion`
--

DROP TABLE IF EXISTS `datos_ubicacion_centros_recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_ubicacion_centros_recepcion` (
  `id_datos_ubicacion_centros_recepcion` int NOT NULL AUTO_INCREMENT,
  `codigo_postal` int DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  `municipio` varchar(40) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_datos_ubicacion_centros_recepcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_ubicacion_centros_recepcion`
--

LOCK TABLES `datos_ubicacion_centros_recepcion` WRITE;
/*!40000 ALTER TABLE `datos_ubicacion_centros_recepcion` DISABLE KEYS */;
INSERT INTO `datos_ubicacion_centros_recepcion` VALUES (1,64000,'Nuevo León','México','Monterrey','Av. Constitución #123, Col. Centro'),(2,6500,'Ciudad de México','México','Cuauhtémoc','Paseo de la Reforma #456, Col. Juárez'),(3,44100,'Jalisco','México','Guadalajara','Av. Vallarta #789, Col. Americana'),(4,20000,'Aguascalientes','México','Aguascalientes','Av. López Mateos #321, Col. Centro'),(5,31000,'Chihuahua','México','Chihuahua','Av. Universidad #654, Col. Centro');
/*!40000 ALTER TABLE `datos_ubicacion_centros_recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_ubicacion_clientes`
--

DROP TABLE IF EXISTS `datos_ubicacion_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_ubicacion_clientes` (
  `id_datos_ubicacion_clientes` int NOT NULL AUTO_INCREMENT,
  `codigo_postal` int DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  `municipio` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_datos_ubicacion_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_ubicacion_clientes`
--

LOCK TABLES `datos_ubicacion_clientes` WRITE;
/*!40000 ALTER TABLE `datos_ubicacion_clientes` DISABLE KEYS */;
INSERT INTO `datos_ubicacion_clientes` VALUES (1,64000,'Nuevo León','México','Monterrey'),(2,6500,'Ciudad de México','México','Cuauhtémoc'),(3,44100,'Jalisco','México','Guadalajara'),(4,20000,'Aguascalientes','México','Aguascalientes'),(5,31000,'Chihuahua','México','Chihuahua');
/*!40000 ALTER TABLE `datos_ubicacion_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_ubicacion_ventas`
--

DROP TABLE IF EXISTS `datos_ubicacion_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_ubicacion_ventas` (
  `id_datos_ubicacion_ventas` int NOT NULL AUTO_INCREMENT,
  `codigo_postal` int DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  `municipio` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_datos_ubicacion_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_ubicacion_ventas`
--

LOCK TABLES `datos_ubicacion_ventas` WRITE;
/*!40000 ALTER TABLE `datos_ubicacion_ventas` DISABLE KEYS */;
INSERT INTO `datos_ubicacion_ventas` VALUES (1,64100,'Nuevo León','México','San Nicolás'),(2,6600,'Ciudad de México','México','Benito Juárez'),(3,45010,'Jalisco','México','Zapopan'),(4,20130,'Aguascalientes','México','Aguascalientes'),(5,31200,'Chihuahua','México','Chihuahua');
/*!40000 ALTER TABLE `datos_ubicacion_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_centro_recepcion`
--

DROP TABLE IF EXISTS `envio_centro_recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_centro_recepcion` (
  `id_envio_centro_recepcion` int NOT NULL AUTO_INCREMENT,
  `id_centros_recepcion` int DEFAULT NULL,
  `id_envios` int DEFAULT NULL,
  `fecha_recibo` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  PRIMARY KEY (`id_envio_centro_recepcion`),
  KEY `fk_constraint_id_centros_recepcion_envio` (`id_centros_recepcion`),
  KEY `fk_constraint_id_envios_centro` (`id_envios`),
  CONSTRAINT `fk_constraint_id_centros_recepcion_envio` FOREIGN KEY (`id_centros_recepcion`) REFERENCES `centros_recepcion` (`id_centros_recepcion`),
  CONSTRAINT `fk_constraint_id_envios_centro` FOREIGN KEY (`id_envios`) REFERENCES `envios` (`id_envios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_centro_recepcion`
--

LOCK TABLES `envio_centro_recepcion` WRITE;
/*!40000 ALTER TABLE `envio_centro_recepcion` DISABLE KEYS */;
INSERT INTO `envio_centro_recepcion` VALUES (1,1,3,'2024-03-15 08:00:00','2024-03-15 14:30:00'),(2,2,1,'2024-03-15 09:30:00','2024-03-15 16:00:00'),(3,3,4,'2024-03-16 10:15:00','2024-03-16 15:45:00'),(4,4,2,'2024-03-16 11:00:00','2024-03-16 17:30:00'),(5,5,5,'2024-03-17 09:30:00','2024-03-17 14:00:00'),(6,1,2,'2024-03-17 13:45:00','2024-03-17 18:30:00'),(7,2,4,'2024-03-18 08:30:00','2024-03-18 15:15:00'),(8,3,1,'2024-03-18 10:30:00','2024-03-18 17:00:00'),(9,4,3,'2024-03-19 09:15:00','2024-03-19 14:45:00'),(10,5,5,'2024-03-19 11:30:00','2024-03-19 16:15:00');
/*!40000 ALTER TABLE `envio_centro_recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_pedido`
--

DROP TABLE IF EXISTS `envio_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_pedido` (
  `id_envio_pedido` int NOT NULL AUTO_INCREMENT,
  `id_envios` int DEFAULT NULL,
  `id_pedidos` int DEFAULT NULL,
  PRIMARY KEY (`id_envio_pedido`),
  KEY `fk_constraint_id_envios_pedido` (`id_envios`),
  KEY `fk_constraint_id_pedidos_envio` (`id_pedidos`),
  CONSTRAINT `fk_constraint_id_envios_pedido` FOREIGN KEY (`id_envios`) REFERENCES `envios` (`id_envios`),
  CONSTRAINT `fk_constraint_id_pedidos_envio` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id_pedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_pedido`
--

LOCK TABLES `envio_pedido` WRITE;
/*!40000 ALTER TABLE `envio_pedido` DISABLE KEYS */;
INSERT INTO `envio_pedido` VALUES (1,1,3),(2,2,1),(3,3,4),(4,4,2),(5,5,5),(6,1,2),(7,2,4),(8,3,1),(9,4,5),(10,5,3);
/*!40000 ALTER TABLE `envio_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id_envios` int NOT NULL AUTO_INCREMENT,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`id_envios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,'2024-03-15 10:00:00','2024-03-17 14:30:00'),(2,'2024-03-15 11:30:00','2024-03-17 16:00:00'),(3,'2024-03-16 12:15:00','2024-03-18 15:45:00'),(4,'2024-03-16 14:00:00','2024-03-18 17:30:00'),(5,'2024-03-17 10:30:00','2024-03-19 14:00:00'),(6,'2024-03-17 15:45:00','2024-03-19 16:30:00'),(7,'2024-03-18 11:00:00','2024-03-20 15:15:00'),(8,'2024-03-18 12:30:00','2024-03-20 17:00:00'),(9,'2024-03-19 10:15:00','2024-03-21 14:45:00'),(10,'2024-03-19 14:30:00','2024-03-21 16:15:00');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios_details`
--

DROP TABLE IF EXISTS `envios_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios_details` (
  `id_envios` int NOT NULL DEFAULT '0',
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `diff_dias` bigint DEFAULT NULL,
  `diff_horas` bigint DEFAULT NULL,
  `diff_minutos` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios_details`
--

LOCK TABLES `envios_details` WRITE;
/*!40000 ALTER TABLE `envios_details` DISABLE KEYS */;
INSERT INTO `envios_details` VALUES (1,'2024-03-15 10:00:00','2024-03-17 14:30:00',2,52,3150),(2,'2024-03-15 11:30:00','2024-03-17 16:00:00',2,52,3150),(3,'2024-03-16 12:15:00','2024-03-18 15:45:00',2,51,3090),(4,'2024-03-16 14:00:00','2024-03-18 17:30:00',2,51,3090),(5,'2024-03-17 10:30:00','2024-03-19 14:00:00',2,51,3090),(6,'2024-03-17 15:45:00','2024-03-19 16:30:00',2,48,2925),(7,'2024-03-18 11:00:00','2024-03-20 15:15:00',2,52,3135),(8,'2024-03-18 12:30:00','2024-03-20 17:00:00',2,52,3150),(9,'2024-03-19 10:15:00','2024-03-21 14:45:00',2,52,3150),(10,'2024-03-19 14:30:00','2024-03-21 16:15:00',2,49,2985);
/*!40000 ALTER TABLE `envios_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id_metodos_pago` int NOT NULL AUTO_INCREMENT,
  `tipo_pago_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_metodos_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'Tarjeta de Crédito'),(2,'PayPal'),(3,'Transferencia Bancaria'),(4,'Efectivo'),(5,'Tarjeta de Débito');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuevos_clientes`
--

DROP TABLE IF EXISTS `nuevos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuevos_clientes` (
  `id_nuevo_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nuevo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuevos_clientes`
--

LOCK TABLES `nuevos_clientes` WRITE;
/*!40000 ALTER TABLE `nuevos_clientes` DISABLE KEYS */;
INSERT INTO `nuevos_clientes` VALUES (1,'Remi','Rodríguez Méndez','81-1234-5678'),(2,'Tortuga','López García','33-9876-5432'),(3,'Jake','García Torres','55-8765-4321'),(4,'Kevin','Martínez Silva','44-2345-6789'),(5,'Juan Ma','Sánchez Ruiz','61-3456-7890'),(6,'Jose','Rodríguez Méndez','81-1234-5675'),(7,'Pepe','López García','33-9876-5430'),(8,'Santiago','García Torres','55-8765-3851'),(9,'Juan','Balderas','42-2341-0689'),(10,'Jake','Sánchez Ruiz','61-3450-7890');
/*!40000 ALTER TABLE `nuevos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadores_logistica`
--

DROP TABLE IF EXISTS `operadores_logistica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operadores_logistica` (
  `id_operadores_logistica` int NOT NULL AUTO_INCREMENT,
  `id_centros_recepcion` int DEFAULT NULL,
  `id_categoria_operadores` int DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_operadores_logistica`),
  KEY `fk_constraint_id_centros_recepcion_logistica` (`id_centros_recepcion`),
  KEY `fk_constraint_id_categoria_operadores` (`id_categoria_operadores`),
  CONSTRAINT `fk_constraint_id_categoria_operadores` FOREIGN KEY (`id_categoria_operadores`) REFERENCES `categoria_operadores` (`id_categoria_operadores`),
  CONSTRAINT `fk_constraint_id_centros_recepcion_logistica` FOREIGN KEY (`id_centros_recepcion`) REFERENCES `centros_recepcion` (`id_centros_recepcion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadores_logistica`
--

LOCK TABLES `operadores_logistica` WRITE;
/*!40000 ALTER TABLE `operadores_logistica` DISABLE KEYS */;
INSERT INTO `operadores_logistica` VALUES (1,1,2,'Juan','Pérez Rodríguez','81-1234-5678'),(2,3,1,'María','González López','33-9876-5432'),(3,2,3,'Carlos','Martínez Silva','55-8765-4321'),(4,4,2,'Ana','Sánchez Torres','44-2345-6789'),(5,5,4,'Roberto','López García','61-3456-7890'),(6,1,3,'Laura','Ramírez Flores','81-2345-6789'),(7,2,2,'Miguel','Torres Ruiz','55-3456-7890'),(8,3,4,'Patricia','García Morales','33-4567-8901'),(9,4,1,'Fernando','Hernández Cruz','44-5678-9012'),(10,5,2,'Diana','Morales Vega','61-6789-0123');
/*!40000 ALTER TABLE `operadores_logistica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedidos` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_productos` int DEFAULT NULL,
  `id_centros_recepcion` int DEFAULT NULL,
  `id_metodos_pago` int DEFAULT NULL,
  `id_envios` int DEFAULT NULL,
  `detalles_entrega` varchar(200) DEFAULT NULL,
  `monto` decimal(15,2) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT (curdate()),
  PRIMARY KEY (`id_pedidos`),
  KEY `fk_constraint_id_cliente` (`id_cliente`),
  KEY `fk_constraint_id_productos` (`id_productos`),
  KEY `fk_constraint_id_centros_recepcion` (`id_centros_recepcion`),
  KEY `fk_constraint_id_metodos_pago_pedidos` (`id_metodos_pago`),
  KEY `fk_constraint_id_envios` (`id_envios`),
  CONSTRAINT `fk_constraint_id_centros_recepcion` FOREIGN KEY (`id_centros_recepcion`) REFERENCES `centros_recepcion` (`id_centros_recepcion`),
  CONSTRAINT `fk_constraint_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_constraint_id_envios` FOREIGN KEY (`id_envios`) REFERENCES `envios` (`id_envios`),
  CONSTRAINT `fk_constraint_id_metodos_pago_pedidos` FOREIGN KEY (`id_metodos_pago`) REFERENCES `metodos_pago` (`id_metodos_pago`),
  CONSTRAINT `fk_constraint_id_productos` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,3,2,2,1,'Entregar en horario matutino',15999.99,'2024-03-15 09:00:00'),(2,2,1,3,1,2,'Dejar con el portero',12499.50,'2024-03-15 10:30:00'),(3,3,4,1,3,3,'Llamar antes de entregar',8999.99,'2024-03-16 11:15:00'),(4,4,2,4,2,4,'Entregar en oficina',20999.99,'2024-03-16 13:00:00'),(5,5,5,5,4,5,'Timbre en segundo piso',5999.99,'2024-03-17 09:30:00'),(6,6,2,1,5,1,'Entregar en recepción',13499.99,'2024-03-17 14:45:00'),(7,7,3,2,1,2,'Confirmar por teléfono',18999.99,'2024-03-18 10:00:00'),(8,8,1,3,2,3,'Dejar en paquetería',9999.99,'2024-03-18 11:30:00'),(9,9,5,4,3,4,'Entregar solo en días hábiles',6499.99,'2024-03-19 09:15:00'),(10,10,4,5,4,5,'Tocar el timbre tres veces',11999.99,'2024-03-19 13:30:00');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_productos` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `tipo_producto` varchar(40) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,50,'Laptop','Laptop HP 15 pulgadas 8GB RAM 256GB SSD'),(2,30,'Smartphone','iPhone 13 128GB Negro'),(3,100,'Audífonos','Audífonos inalámbricos Bluetooth con cancelación de ruido'),(4,25,'Tablet','iPad Air 64GB WiFi Gris Espacial'),(5,75,'Monitor','Monitor Gaming 27 pulgadas 144Hz 2K');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_centros_recepcion`
--

DROP TABLE IF EXISTS `vendedor_centros_recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_centros_recepcion` (
  `id_vendedor_centros_recepcion` int NOT NULL AUTO_INCREMENT,
  `id_vendedor` int DEFAULT NULL,
  `id_centros_recepcion` int DEFAULT NULL,
  `fecha_recibo` datetime DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`id_vendedor_centros_recepcion`),
  KEY `fk_constraint_id_vendedor` (`id_vendedor`),
  KEY `fk_constraint_id_centros_recepcion_vendedor` (`id_centros_recepcion`),
  CONSTRAINT `fk_constraint_id_centros_recepcion_vendedor` FOREIGN KEY (`id_centros_recepcion`) REFERENCES `centros_recepcion` (`id_centros_recepcion`),
  CONSTRAINT `fk_constraint_id_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_centros_recepcion`
--

LOCK TABLES `vendedor_centros_recepcion` WRITE;
/*!40000 ALTER TABLE `vendedor_centros_recepcion` DISABLE KEYS */;
INSERT INTO `vendedor_centros_recepcion` VALUES (1,1,3,'2024-03-15 09:00:00','2024-03-16 14:30:00'),(2,2,1,'2024-03-15 10:30:00','2024-03-16 16:00:00'),(3,3,2,'2024-03-16 11:15:00','2024-03-17 15:45:00'),(4,4,5,'2024-03-16 13:00:00','2024-03-17 17:30:00'),(5,5,4,'2024-03-17 09:30:00','2024-03-18 14:00:00'),(6,1,2,'2024-03-17 14:45:00','2024-03-18 16:30:00'),(7,2,3,'2024-03-18 10:00:00','2024-03-19 15:15:00'),(8,3,1,'2024-03-18 11:30:00','2024-03-19 17:00:00'),(9,4,4,'2024-03-19 09:15:00','2024-03-20 14:45:00'),(10,5,5,'2024-03-19 13:30:00','2024-03-20 16:15:00');
/*!40000 ALTER TABLE `vendedor_centros_recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `id_categoria_vendedor` int DEFAULT NULL,
  `id_datos_ubicacion_ventas` int DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT (curdate()),
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_constraint_id_categoria_vendedor` (`id_categoria_vendedor`),
  KEY `fk_constraint_id_datos_ubicacion_ventas` (`id_datos_ubicacion_ventas`),
  CONSTRAINT `fk_constraint_id_categoria_vendedor` FOREIGN KEY (`id_categoria_vendedor`) REFERENCES `categoria_vendedor` (`id_categoria_vendedor`),
  CONSTRAINT `fk_constraint_id_datos_ubicacion_ventas` FOREIGN KEY (`id_datos_ubicacion_ventas`) REFERENCES `datos_ubicacion_ventas` (`id_datos_ubicacion_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,1,3,'Ricardo','Martínez López','33-1234-5678','ricardo.martinez@empresa.com','2024-01-15 08:00:00'),(2,2,1,'Sofía','García Pérez','81-9876-5432','sofia.garcia@empresa.com','2024-01-20 09:30:00'),(3,3,2,'Eduardo','Sánchez Ruiz','55-8765-4321','eduardo.sanchez@empresa.com','2024-02-01 10:15:00'),(4,1,4,'Carmen','López Torres','44-2345-6789','carmen.lopez@empresa.com','2024-02-10 11:00:00'),(5,2,5,'Daniel','Torres Morales','61-3456-7890','daniel.torres@empresa.com','2024-02-15 13:45:00'),(6,4,1,'Isabel','Ramírez Silva','81-4567-8901','isabel.ramirez@empresa.com','2024-02-20 14:30:00'),(7,3,2,'Javier','González Flores','55-5678-9012','javier.gonzalez@empresa.com','2024-03-01 15:20:00'),(8,5,3,'Martha','Hernández Cruz','33-6789-0123','martha.hernandez@empresa.com','2024-03-05 16:10:00'),(9,4,4,'Luis','Morales Vega','44-7890-1234','luis.morales@empresa.com','2024-03-10 09:00:00'),(10,5,5,'Ana','Flores Díaz','61-8901-2345','ana.flores@empresa.com','2024-03-15 10:45:00');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_top3_categorias_prod`
--

DROP TABLE IF EXISTS `vw_top3_categorias_prod`;
/*!50001 DROP VIEW IF EXISTS `vw_top3_categorias_prod`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top3_categorias_prod` AS SELECT 
 1 AS `tipo_producto`,
 1 AS `numero_cat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_por_periodo`
--

DROP TABLE IF EXISTS `vw_ventas_por_periodo`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_periodo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_por_periodo` AS SELECT 
 1 AS `periodo`,
 1 AS `total_ventas`,
 1 AS `monto_total`,
 1 AS `venta_promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'kebacommerce'
--

--
-- Dumping routines for database 'kebacommerce'
--
/*!50003 DROP FUNCTION IF EXISTS `fx_mayor_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fx_mayor_edad`(dob DATE) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    RETURN (DATEDIFF(current_date(), dob) / 365) > 18;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fx_obtener_lada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fx_obtener_lada`(telefono VARCHAR(20)) RETURNS char(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN (SUBSTRING_INDEX(telefono, '-',1));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_clientes_no_mayores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_no_mayores`()
BEGIN
    DROP TABLE IF EXISTS kebacommerce.clientes_no_legales;
    CREATE TABLE kebacommerce.clientes_no_legales 
    AS
    SELECT c.nombre, c.apellido , kebacommerce.fx_mayor_edad(c.fecha_nacimiento) as Legal
    FROM kebacommerce.clientes AS c
    WHERE kebacommerce.fx_mayor_edad(c.fecha_nacimiento) = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_envio_diff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_envio_diff`()
BEGIN
	DROP TABLE IF EXISTS kebacommerce.envios_details;
	CREATE TABLE kebacommerce.envios_details
    SELECT env.*, TIMESTAMPDIFF(DAY, fecha_envio, fecha_entrega) AS diff_dias, TIMESTAMPDIFF(HOUR, fecha_envio, fecha_entrega) AS diff_horas , TIMESTAMPDIFF(MINUTE, fecha_envio, fecha_entrega) AS diff_minutos
    FROM kebacommerce.envios AS env;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_top3_categorias_prod`
--

/*!50001 DROP VIEW IF EXISTS `vw_top3_categorias_prod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top3_categorias_prod` AS select `prod`.`tipo_producto` AS `tipo_producto`,count(0) AS `numero_cat` from (`pedidos` `ped` join `productos` `prod` on((`ped`.`id_productos` = `prod`.`id_productos`))) group by `prod`.`tipo_producto` order by count(0) desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_por_periodo`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_periodo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_por_periodo` AS select date_format(`pedidos`.`fecha_pedido`,'%Y-%m') AS `periodo`,count(0) AS `total_ventas`,sum(`pedidos`.`monto`) AS `monto_total`,avg(`pedidos`.`monto`) AS `venta_promedio` from `pedidos` group by date_format(`pedidos`.`fecha_pedido`,'%Y-%m') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-26 15:39:57
