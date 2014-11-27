CREATE DATABASE  IF NOT EXISTS `farmacia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `farmacia`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacia
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ajustes`
--

DROP TABLE IF EXISTS `ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajustes` (
  `id_ajuste` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `cant_producto` int(11) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_tipotran` int(11) NOT NULL,
  PRIMARY KEY (`id_ajuste`),
  KEY `fk_AJUSTES_TIPO_TRANSACCIONES1_idx` (`id_tipotran`),
  CONSTRAINT `fk_AJUSTES_TIPO_TRANSACCIONES1` FOREIGN KEY (`id_tipotran`) REFERENCES `tipo_transacciones` (`id_tipotran`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustes`
--

LOCK TABLES `ajustes` WRITE;
/*!40000 ALTER TABLE `ajustes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`ajustes_AFTER_UPDATE` AFTER UPDATE ON `ajustes` FOR EACH ROW
	UPDATE AJUSTES
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`ajustes_AFTER_DELETE` AFTER DELETE ON `ajustes` FOR EACH ROW
    delete from detalle_ajustes
           WHERE id_ajuste = old.id_ajuste */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria_productos`
--

DROP TABLE IF EXISTS `categoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_productos` (
  `cod_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_productos`
--

LOCK TABLES `categoria_productos` WRITE;
/*!40000 ALTER TABLE `categoria_productos` DISABLE KEYS */;
INSERT INTO `categoria_productos` VALUES (1,'CATE1','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY','JIMMY'),(2,'CATE2','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY','JIMMY');
/*!40000 ALTER TABLE `categoria_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`categoria_productos_AFTER_UPDATE` AFTER UPDATE ON `categoria_productos` FOR EACH ROW
    UPDATE categoria_productos
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_tipocliente` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_CLIENTES_TIPO_CLIENTE1_idx` (`id_tipocliente`),
  CONSTRAINT `fk_CLIENTES_TIPO_CLIENTE1` FOREIGN KEY (`id_tipocliente`) REFERENCES `tipo_cliente` (`id_tipocliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'JUAN VILLATORO','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`clientes_AFTER_UPDATE` AFTER UPDATE ON `clientes` FOR EACH ROW
      UPDATE clientes
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_COMPRAS_PROVEEDORES1_idx` (`id_proveedor`),
  CONSTRAINT `fk_COMPRAS_PROVEEDORES1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (2,'2014-11-14',320,'2014-11-19 00:00:00','2014-11-19 00:00:00','JIMMY','JIMMY',1);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`compras_AFTER_DELETE` AFTER DELETE ON `compras` FOR EACH ROW
    DELETE FROM detalle_compras
		WHERE id_compra = old.id_compra */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contactos_clientes`
--

DROP TABLE IF EXISTS `contactos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactos_clientes` (
  `id_contactocliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_contactocliente`,`id_cliente`),
  KEY `fk_CONTACTOS_CLIENTES_CLIENTES1_idx` (`id_cliente`),
  CONSTRAINT `fk_CONTACTOS_CLIENTES_CLIENTES1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos_clientes`
--

LOCK TABLES `contactos_clientes` WRITE;
/*!40000 ALTER TABLE `contactos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactos_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`contactos_clientes_AFTER_UPDATE` AFTER UPDATE ON `contactos_clientes` FOR EACH ROW
      UPDATE contactos_clientes
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `costo_prod_proveedor`
--

DROP TABLE IF EXISTS `costo_prod_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costo_prod_proveedor` (
  `costo` double NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`cod_prod`,`id_proveedor`),
  KEY `fk_COSTO_PROD_PROVEEDOR_PRODUCTOS1_idx` (`cod_prod`),
  KEY `fk_COSTO_PROD_PROVEEDOR_PROVEEDORES1_idx` (`id_proveedor`),
  CONSTRAINT `fk_COSTO_PROD_PROVEEDOR_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COSTO_PROD_PROVEEDOR_PROVEEDORES1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_prod_proveedor`
--

LOCK TABLES `costo_prod_proveedor` WRITE;
/*!40000 ALTER TABLE `costo_prod_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_prod_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_cotizacion`),
  KEY `fk_COTIZACIONES_PROVEEDORES1_idx` (`id_proveedor`),
  CONSTRAINT `fk_COTIZACIONES_PROVEEDORES1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`cotizaciones_AFTER_DELETE` AFTER DELETE ON `cotizaciones` FOR EACH ROW
    delete from detalle_cotizaciones 
    where id_cotizacion = old.id_cotizacion */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_ajustes`
--

DROP TABLE IF EXISTS `detalle_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ajustes` (
  `num_detalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_ajuste` int(11) NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`num_detalle`,`id_ajuste`),
  KEY `fk_DETALLE_AJUSTES_AJUSTES1_idx` (`id_ajuste`),
  KEY `fk_DETALLE_AJUSTES_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_DETALLE_AJUSTES_AJUSTES1` FOREIGN KEY (`id_ajuste`) REFERENCES `ajustes` (`id_ajuste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_AJUSTES_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ajustes`
--

LOCK TABLES `detalle_ajustes` WRITE;
/*!40000 ALTER TABLE `detalle_ajustes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ajustes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`detalle_ajustes_AFTER_INSERT` AFTER INSERT ON `detalle_ajustes` FOR EACH ROW
begin
	DECLARE e_o_s varchar(1);
	SELECT entrada_o_salida INTO e_o_s FROM vw_ajustes_tipotran WHERE id_ajuste = new.id_ajuste;
  
     if(e_o_s = 'E') then
    UPDATE productos
           SET existencia = existencia+NEW.cantidad
           WHERE cod_prod = NEW.cod_prod;
    else
		UPDATE productos
           SET existencia = existencia-EW.cantidad
           WHERE cod_prod = NEW.cod_prod;
    end if;      
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`detalle_ajustes_AFTER_DELETE` AFTER DELETE ON `detalle_ajustes` FOR EACH ROW
     UPDATE productos
           SET existencia = existencia-old.cantidad
           WHERE cod_prod = old.cod_prod */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compras` (
  `num_detalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_compra` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `id_compra` int(11) NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`num_detalle`,`id_compra`),
  KEY `fk_DETALLE_COMPRAS_COMPRAS1_idx` (`id_compra`),
  KEY `fk_DETALLE_COMPRAS_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_DETALLE_COMPRAS_COMPRAS1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_COMPRAS_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,5,320,325,2,'001'),(2,5,320,325,2,'005-A'),(3,10,360,365,2,'002');
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`detalle_compras_AFTER_INSERT` AFTER INSERT ON `detalle_compras` FOR EACH ROW
   UPDATE productos
           SET existencia = existencia+NEW.cantidad
           WHERE cod_prod = NEW.cod_prod */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`detalle_compras_AFTER_DELETE` AFTER DELETE ON `detalle_compras` FOR EACH ROW
    UPDATE productos
           SET existencia = existencia-old.cantidad
           WHERE cod_prod = old.cod_prod */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_cotizaciones`
--

DROP TABLE IF EXISTS `detalle_cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_cotizaciones` (
  `num_detalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unit` double DEFAULT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`num_detalle`,`id_cotizacion`),
  KEY `fk_DETALLE_COTIZACIONES_COTIZACIONES1_idx` (`id_cotizacion`),
  KEY `fk_DETALLE_COTIZACIONES_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_DETALLE_COTIZACIONES_COTIZACIONES1` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizaciones` (`id_cotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_COTIZACIONES_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cotizaciones`
--

LOCK TABLES `detalle_cotizaciones` WRITE;
/*!40000 ALTER TABLE `detalle_cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`detalle_cotizaciones_AFTER_INSERT` AFTER INSERT ON `detalle_cotizaciones` FOR EACH ROW
    begin
	SELECT id_cotizacion, id_proveedor INTO @var1, @var2 FROM vw_cotizacion_provee WHERE id_cotizacion = new.id_cotizacion;
    IF EXISTS(SELECT * FROM costo_prod_proveedor WHERE cod_prod = new.cod_prod AND id_proveedor = @var2) 
	THEN
	UPDATE costo_prod_proveedor SET costo = new.precio_unit WHERE cod_prod = new.cod_prod AND id_proveedor = @var2;
	ELSE 
	INSERT INTO costo_prod_proveedor (costo,cod_prod,id_proveedor) VALUES(new.precio_unit,new.cod_prod,@var2);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_facturas`
--

DROP TABLE IF EXISTS `detalle_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_facturas` (
  `num_detalle` int(11) NOT NULL,
  `precio_venta` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `num_factura` int(11) NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`num_detalle`,`num_factura`),
  KEY `fk_DETALLLE_FACTURAS_FACTURAS1_idx` (`num_factura`),
  KEY `fk_DETALLLE_FACTURAS_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_DETALLLE_FACTURAS_FACTURAS1` FOREIGN KEY (`num_factura`) REFERENCES `facturas` (`num_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLLE_FACTURAS_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_facturas`
--

LOCK TABLES `detalle_facturas` WRITE;
/*!40000 ALTER TABLE `detalle_facturas` DISABLE KEYS */;
INSERT INTO `detalle_facturas` VALUES (1,30,5,32,1,'001'),(2,30,26,32,1,'005-A'),(3,20,3,35,1,'002'),(4,25,2,50,1,'001'),(5,32,8,20,1,'002'),(6,22,3,12,1,'001');
/*!40000 ALTER TABLE `detalle_facturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER detalle_facturas_AFTER_INSERT 
    AFTER INSERT ON detalle_facturas
    FOR EACH ROW  
    UPDATE productos
           SET existencia = existencia-NEW.cantidad
           WHERE cod_prod = NEW.cod_prod */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_oc`
--

DROP TABLE IF EXISTS `detalle_oc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_oc` (
  `num_detalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `precio_unit` double DEFAULT NULL,
  `id_ordencompra` int(11) NOT NULL,
  `cod_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`num_detalle`,`id_ordencompra`),
  KEY `fk_DETALLE_OC_ORDENES_DE_COMPRA1_idx` (`id_ordencompra`),
  KEY `fk_DETALLE_OC_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_DETALLE_OC_ORDENES_DE_COMPRA1` FOREIGN KEY (`id_ordencompra`) REFERENCES `ordenes_de_compra` (`id_ordencompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_OC_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_oc`
--

LOCK TABLES `detalle_oc` WRITE;
/*!40000 ALTER TABLE `detalle_oc` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_oc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_clientes`
--

DROP TABLE IF EXISTS `direcciones_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones_clientes` (
  `id_direccioncliente` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_direccioncliente`,`id_cliente`),
  KEY `fk_DIRECCIONES_CLIENTES_CLIENTES1_idx` (`id_cliente`),
  CONSTRAINT `fk_DIRECCIONES_CLIENTES_CLIENTES1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_clientes`
--

LOCK TABLES `direcciones_clientes` WRITE;
/*!40000 ALTER TABLE `direcciones_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`direcciones_clientes_AFTER_UPDATE` AFTER UPDATE ON `direcciones_clientes` FOR EACH ROW
      UPDATE direcciones_clientes
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `num_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `isv` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`num_factura`),
  KEY `fk_FACTURAS_CLIENTES1_idx` (`id_cliente`),
  CONSTRAINT `fk_FACTURAS_CLIENTES1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2014-11-18',500,20,0,520,'2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS',2);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`VisualStudio`@`%`*/ /*!50003 TRIGGER facturas_after_insert
  BEFORE INSERT
  ON facturas
  FOR EACH ROW
BEGIN
  /* Trigger text */
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupos_roles`
--

DROP TABLE IF EXISTS `grupos_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_roles`
--

LOCK TABLES `grupos_roles` WRITE;
/*!40000 ALTER TABLE `grupos_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`grupos_roles_AFTER_UPDATE` AFTER UPDATE ON `grupos_roles` FOR EACH ROW
      UPDATE grupos_roles
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupos_roles_has_privilegios`
--

DROP TABLE IF EXISTS `grupos_roles_has_privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_roles_has_privilegios` (
  `id_rol` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol`,`id_privilegio`),
  KEY `fk_GRUPOS_ROLES_has_PRIVILEGIOS_PRIVILEGIOS1_idx` (`id_privilegio`),
  KEY `fk_GRUPOS_ROLES_has_PRIVILEGIOS_GRUPOS_ROLES1_idx` (`id_rol`),
  CONSTRAINT `fk_GRUPOS_ROLES_has_PRIVILEGIOS_GRUPOS_ROLES1` FOREIGN KEY (`id_rol`) REFERENCES `grupos_roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_GRUPOS_ROLES_has_PRIVILEGIOS_PRIVILEGIOS1` FOREIGN KEY (`id_privilegio`) REFERENCES `privilegios` (`id_privilegio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_roles_has_privilegios`
--

LOCK TABLES `grupos_roles_has_privilegios` WRITE;
/*!40000 ALTER TABLE `grupos_roles_has_privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos_roles_has_privilegios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`grupos_roles_has_privilegios_AFTER_UPDATE` AFTER UPDATE ON `grupos_roles_has_privilegios` FOR EACH ROW
      UPDATE grupos_roles_has_privilegios
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `id_operacion` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `inv_antes` int(11) DEFAULT NULL,
  `inv_despues` int(11) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cod_prod` varchar(20) NOT NULL,
  `entrada_o_salida` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_operacion`),
  KEY `fk_KARDEX_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_KARDEX_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (1,-3,20,20,17,'2014-11-19 13:11:09','Jimmy',25,'002','S'),(2,-2,20,15,13,'2014-11-19 13:11:09','Jimmy',25,'001','S'),(3,19,32,13,32,'2014-11-19 13:45:01','Jimmy',25,'001','E'),(4,5,32,32,37,'2014-11-19 13:56:38','Jimmy',55,'001','E'),(5,5,20,-6,-1,'2014-11-19 14:00:26','Jimmy',25,'005-A','E'),(6,10,20,17,27,'2014-11-19 14:25:54','JIMMY',25,'002','E'),(7,8,20,27,19,'2014-11-19 14:27:32','JIMMY',25,'002','S'),(8,3,32,37,34,'2014-11-19 14:30:15','JIMMY',55,'001','S');
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_de_compra`
--

DROP TABLE IF EXISTS `ordenes_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenes_de_compra` (
  `id_ordencompra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `ejecutada` tinyint(1) DEFAULT NULL,
  `cancelada` tinyint(1) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ordencompra`),
  KEY `fk_ORDENES_DE_COMPRA_PROVEEDORES1_idx` (`id_proveedor`),
  CONSTRAINT `fk_ORDENES_DE_COMPRA_PROVEEDORES1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_de_compra`
--

LOCK TABLES `ordenes_de_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_de_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes_de_compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`ordenes_de_compra_AFTER_DELETE` AFTER DELETE ON `ordenes_de_compra` FOR EACH ROW
    delete from detalle_oc
    where id_ordencompra=old.id_ordencompra */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `presentacion_productos`
--

DROP TABLE IF EXISTS `presentacion_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentacion_productos` (
  `cod_presentacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_presentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion_productos`
--

LOCK TABLES `presentacion_productos` WRITE;
/*!40000 ALTER TABLE `presentacion_productos` DISABLE KEYS */;
INSERT INTO `presentacion_productos` VALUES (1,'PRESE1','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY','JIMMY'),(2,'PRESE2','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY','JIMMY');
/*!40000 ALTER TABLE `presentacion_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`presentacion_productos_AFTER_UPDATE` AFTER UPDATE ON `presentacion_productos` FOR EACH ROW
     UPDATE presentacion_productos
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `id_privilegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_privilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`privilegios_AFTER_UPDATE` AFTER UPDATE ON `privilegios` FOR EACH ROW
    UPDATE privilegios
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `cod_prod` varchar(20) NOT NULL,
  `existencia` int(11) DEFAULT NULL,
  `fecha_venc` date DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `precio_consumi` double DEFAULT NULL,
  `precio_mayor` double DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cod_presentacion` int(11) DEFAULT NULL,
  `existencia_min` int(11) DEFAULT NULL,
  `existencia_max` int(11) DEFAULT NULL,
  `porcentaje_m` int(11) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_prod`),
  KEY `fk_PRODUCTO_PRESENTACION_PRODUCTO_idx` (`cod_presentacion`),
  CONSTRAINT `fk_PRODUCTO_PRESENTACION_PRODUCTO` FOREIGN KEY (`cod_presentacion`) REFERENCES `presentacion_productos` (`cod_presentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('001',34,'2014-11-19',32,55,20,'ACTUAL',1,5,20,12,'2014-11-19 00:00:00','2014-11-19 00:00:00','JUAN_VILLA','JUAN_VILLA'),('002',19,'2014-11-18',20,25,30,'PRUEBA 2',1,2,50,20,'2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS'),('005-A',-1,'2014-11-18',20,25,30,'PRUEBA 2',1,2,50,20,'2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`productos_BEFORE_UPDATE` BEFORE UPDATE ON `productos` FOR EACH ROW
begin
DECLARE costo_min double;
DECLARE cant_pedir int;
    if(old.existencia <= old.existencia_min) then
		set cant_pedir = old.existencia_max-old.existencia;
		select min(costo) INTO costo_min from vw_productos_oc where cod_prod = new.cod_prod;
        call sp_ins_orden_compra(now(),cant,pedir,(cant_pedir*costo_min),false,false,true,now(),now(),'JIMMY','JIMMY',@id_orden);
		call sp_ins_detalle_oc(1,cant_pedir,(cant_pedir*costo_min),costo_min,@id_orden,old.cod_prod);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW
    BEGIN
      DECLARE e_o_s varchar(1);
      
      if(new.existencia < old.existencia) then
		set e_o_s = 'S';
      else
		set e_o_s = 'E';
      END IF;
      
      IF(NEW.EXISTENCIA <> OLD.EXISTENCIA) 
      then
		CALL sp_ins_kardex(abs(new.existencia-old.existencia),new.costo,old.existencia,
          new.existencia,now(),'JIMMY',OLD.precio_consumi,new.cod_prod,e_o_s);
      END IF;
      
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos_has_categoria_productos`
--

DROP TABLE IF EXISTS `productos_has_categoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_has_categoria_productos` (
  `cod_prod` varchar(20) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_prod`,`cod_categoria`),
  KEY `fk_PRODUCTOS_has_CATEGORIA_PRODUCTOS_CATEGORIA_PRODUCTOS1_idx` (`cod_categoria`),
  KEY `fk_PRODUCTOS_has_CATEGORIA_PRODUCTOS_PRODUCTOS1_idx` (`cod_prod`),
  CONSTRAINT `fk_PRODUCTOS_has_CATEGORIA_PRODUCTOS_CATEGORIA_PRODUCTOS1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria_productos` (`cod_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_has_CATEGORIA_PRODUCTOS_PRODUCTOS1` FOREIGN KEY (`cod_prod`) REFERENCES `productos` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_has_categoria_productos`
--

LOCK TABLES `productos_has_categoria_productos` WRITE;
/*!40000 ALTER TABLE `productos_has_categoria_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_has_categoria_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'ANTUNEZ','99201220','PRVEE1','JUAN','2014-11-19 00:00:00','2014-11-19 00:00:00','JUAN','JUAN');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`proveedores_AFTER_UPDATE` AFTER UPDATE ON `proveedores` FOR EACH ROW
    UPDATE proveedores
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `telefonos_clientes`
--

DROP TABLE IF EXISTS `telefonos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos_clientes` (
  `id_telefonosclientes` int(11) NOT NULL AUTO_INCREMENT,
  `numero_tel` varchar(15) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_telefonosclientes`,`id_cliente`),
  KEY `fk_TELEFONOS_CLIENTES_CLIENTES1_idx` (`id_cliente`),
  CONSTRAINT `fk_TELEFONOS_CLIENTES_CLIENTES1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos_clientes`
--

LOCK TABLES `telefonos_clientes` WRITE;
/*!40000 ALTER TABLE `telefonos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`telefonos_clientes_AFTER_UPDATE` AFTER UPDATE ON `telefonos_clientes` FOR EACH ROW
    UPDATE telefonos_clientes
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cliente` (
  `id_tipocliente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipocliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` VALUES (1,'MINORISTA','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS'),(2,'MAYORISTA','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`tipo_cliente_AFTER_UPDATE` AFTER UPDATE ON `tipo_cliente` FOR EACH ROW
     UPDATE tipo_cliente
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_transacciones`
--

DROP TABLE IF EXISTS `tipo_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_transacciones` (
  `id_tipotran` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(15) DEFAULT NULL,
  `usuario_actu` varchar(15) DEFAULT NULL,
  `entrada_o_salida` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipotran`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transacciones`
--

LOCK TABLES `tipo_transacciones` WRITE;
/*!40000 ALTER TABLE `tipo_transacciones` DISABLE KEYS */;
INSERT INTO `tipo_transacciones` VALUES (1,'ENTRADA POR COMPRA','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS','E'),(2,'SALIDA POR VENTA','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS','S'),(3,'SALIDA POR PRODUCTO VENCIDO','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS','S'),(4,'CARGA POR SOBRANTE FISICO','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS','E'),(5,'DESCARGA POR FALTANTE FISICO','2014-11-18 00:00:00','2014-11-18 00:00:00','JIMMY_RAMOS','JIMMY_RAMOS','E');
/*!40000 ALTER TABLE `tipo_transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`tipo_transacciones_AFTER_UPDATE` AFTER UPDATE ON `tipo_transacciones` FOR EACH ROW
      UPDATE tipo_transacciones
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `clave` binary(1) DEFAULT NULL,
  `key` binary(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`usuarios_AFTER_UPDATE` AFTER UPDATE ON `usuarios` FOR EACH ROW
      UPDATE usuarios
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_has_grupos_roles`
--

DROP TABLE IF EXISTS `usuarios_has_grupos_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_has_grupos_roles` (
  `usuario` varchar(45) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_actu` datetime DEFAULT NULL,
  `usuario_crea` varchar(45) DEFAULT NULL,
  `usuario_actu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`,`id_rol`),
  KEY `fk_USUARIOS_has_GRUPOS_ROLES_GRUPOS_ROLES1_idx` (`id_rol`),
  KEY `fk_USUARIOS_has_GRUPOS_ROLES_USUARIOS1_idx` (`usuario`),
  CONSTRAINT `fk_USUARIOS_has_GRUPOS_ROLES_GRUPOS_ROLES1` FOREIGN KEY (`id_rol`) REFERENCES `grupos_roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIOS_has_GRUPOS_ROLES_USUARIOS1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_grupos_roles`
--

LOCK TABLES `usuarios_has_grupos_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_has_grupos_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_has_grupos_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `farmacia`.`usuarios_has_grupos_roles_AFTER_UPDATE` AFTER UPDATE ON `usuarios_has_grupos_roles` FOR EACH ROW
      UPDATE usuarios_has_grupos_roles
		SET fecha_actu = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `vw_ajustes_tipotran`
--

DROP TABLE IF EXISTS `vw_ajustes_tipotran`;
/*!50001 DROP VIEW IF EXISTS `vw_ajustes_tipotran`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ajustes_tipotran` (
  `id_ajuste` tinyint NOT NULL,
  `id_tipotran` tinyint NOT NULL,
  `entrada_o_salida` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cotizacion_provee`
--

DROP TABLE IF EXISTS `vw_cotizacion_provee`;
/*!50001 DROP VIEW IF EXISTS `vw_cotizacion_provee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cotizacion_provee` (
  `id_cotizacion` tinyint NOT NULL,
  `id_proveedor` tinyint NOT NULL,
  `nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ordenes_activas`
--

DROP TABLE IF EXISTS `vw_ordenes_activas`;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes_activas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ordenes_activas` (
  `id_ordencompra` tinyint NOT NULL,
  `fecha` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `cod_prod` tinyint NOT NULL,
  `nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_productos_oc`
--

DROP TABLE IF EXISTS `vw_productos_oc`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_oc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_productos_oc` (
  `cod_prod` tinyint NOT NULL,
  `id_proveedor` tinyint NOT NULL,
  `costo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'farmacia'
--

--
-- Dumping routines for database 'farmacia'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_precio_consumidor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precio_consumidor`(p_costo DOUBLE) RETURNS double
BEGIN
	DECLARE precio_consumidor DOUBLE;

	IF p_costo >= 0 AND p_costo <= 200 THEN
      SET precio_consumidor = p_costo+(p_costo*1);

	ELSEIF p_costo >= 201 AND p_costo <= 1000 THEN
      SET precio_consumidor = p_costo+(p_costo*0.8);
      
	ELSEIF p_costo >= 1001 AND p_costo <= 10000 THEN
      SET precio_consumidor = p_costo+(p_costo*0.5);

	ELSE
      SET precio_consumidor = p_costo+(p_costo*0.4);

   END IF;

   RETURN precio_consumidor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_precio_mayorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precio_mayorista`(p_costo DOUBLE, p_porcentaje integer) RETURNS double
BEGIN
	DECLARE precio_mayorista DOUBLE;
    
    SET precio_mayorista = (((p_costo*p_porcentaje)/100)+p_costo);
    
	RETURN precio_mayorista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_subtotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_subtotal`(p_cantidad integer, p_precio double) RETURNS double
BEGIN
	declare subtotal double;
    set subtotal = p_cantidad * p_precio;
	RETURN subtotal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getProducto`() RETURNS varchar(20) CHARSET utf8
    NO SQL
    DETERMINISTIC
return @p1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_ajustes`(
   IN 
  `p_id_ajuste`
   int
)
BEGIN
  DELETE FROM `ajustes`
  WHERE     
    (`id_ajuste` = `p_id_ajuste`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_categoria_productos`(
   IN 
  `p_cod_categoria`
   int
)
BEGIN
  DELETE FROM `categoria_productos`
  WHERE     
    (`cod_categoria` = `p_cod_categoria`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_clientes`(
   IN 
  `p_id_cliente`
   int
)
BEGIN
  DELETE FROM `clientes`
  WHERE     
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_compras`(
   IN 
  `p_id_compra`
   int
)
BEGIN
  DELETE FROM `compras`
  WHERE     
    (`id_compra` = `p_id_compra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_contactos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_contactos_clientes`(
   IN 
  `p_id_contactocliente`
   int,
   IN 
  `p_id_cliente`
   int
)
BEGIN
  DELETE FROM `contactos_clientes`
  WHERE     
    (`id_contactocliente` = `p_id_contactocliente`) AND    
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_costo_prod_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_costo_prod_proveedor`(
   IN 
  `p_cod_prod`
   varchar(20),
   IN 
  `p_id_proveedor`
   int
)
BEGIN
  DELETE FROM `costo_prod_proveedor`
  WHERE     
    (`cod_prod` = `p_cod_prod`) AND    
    (`id_proveedor` = `p_id_proveedor`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_cotizaciones`(
   IN 
  `p_id_cotizacion`
   int
)
BEGIN
  DELETE FROM `cotizaciones`
  WHERE     
    (`id_cotizacion` = `p_id_cotizacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_detalle_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_detalle_ajustes`(
   IN 
  `p_num_detalle`
   int,
   IN 
  `p_id_ajuste`
   int
)
BEGIN
  DELETE FROM `detalle_ajustes`
  WHERE     
    (`num_detalle` = `p_num_detalle`) AND    
    (`id_ajuste` = `p_id_ajuste`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_detalle_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_detalle_compras`(
   IN 
  `p_num_detalle`
   int,
   IN 
  `p_id_compra`
   int
)
BEGIN
  DELETE FROM `detalle_compras`
  WHERE     
    (`num_detalle` = `p_num_detalle`) AND    
    (`id_compra` = `p_id_compra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_detalle_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_detalle_cotizaciones`(
   IN 
  `p_num_detalle`
   int,
   IN 
  `p_id_cotizacion`
   int
)
BEGIN
  DELETE FROM `detalle_cotizaciones`
  WHERE     
    (`num_detalle` = `p_num_detalle`) AND    
    (`id_cotizacion` = `p_id_cotizacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_detalle_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_detalle_facturas`(
   IN 
  `p_num_detalle`
   int,
   IN 
  `p_num_factura`
   int
)
BEGIN
  DELETE FROM `detalle_facturas`
  WHERE     
    (`num_detalle` = `p_num_detalle`) AND    
    (`num_factura` = `p_num_factura`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_detalle_oc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_detalle_oc`(
   IN 
  `p_num_detalle`
   int,
   IN 
  `p_id_ordencompra`
   int
)
BEGIN
  DELETE FROM `detalle_oc`
  WHERE     
    (`num_detalle` = `p_num_detalle`) AND    
    (`id_ordencompra` = `p_id_ordencompra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_direcciones_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_direcciones_clientes`(
   IN 
  `p_id_direccioncliente`
   int,
   IN 
  `p_id_cliente`
   int
)
BEGIN
  DELETE FROM `direcciones_clientes`
  WHERE     
    (`id_direccioncliente` = `p_id_direccioncliente`) AND    
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_facturas`(
   IN 
  `p_num_factura`
   int
)
BEGIN
  DELETE FROM `facturas`
  WHERE     
    (`num_factura` = `p_num_factura`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_grupos_roles`(
   IN 
  `p_id_rol`
   int
)
BEGIN
  DELETE FROM `grupos_roles`
  WHERE     
    (`id_rol` = `p_id_rol`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_grupos_roles_has_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_grupos_roles_has_privilegios`(
   IN 
  `p_id_rol`
   int,
   IN 
  `p_id_privilegio`
   int
)
BEGIN
  DELETE FROM `grupos_roles_has_privilegios`
  WHERE     
    (`id_rol` = `p_id_rol`) AND    
    (`id_privilegio` = `p_id_privilegio`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_kardex`(
   IN 
  `p_id_operacion`
   int
)
BEGIN
  DELETE FROM `kardex`
  WHERE     
    (`id_operacion` = `p_id_operacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_ordenes_de_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_ordenes_de_compra`(
   IN 
  `p_id_ordencompra`
   int
)
BEGIN
  DELETE FROM `ordenes_de_compra`
  WHERE     
    (`id_ordencompra` = `p_id_ordencompra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_presentacion_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_presentacion_productos`(
   IN 
  `p_cod_presentacion`
   int
)
BEGIN
  DELETE FROM `presentacion_productos`
  WHERE     
    (`cod_presentacion` = `p_cod_presentacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_privilegios`(
   IN 
  `p_id_privilegio`
   int
)
BEGIN
  DELETE FROM `privilegios`
  WHERE     
    (`id_privilegio` = `p_id_privilegio`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_productos`(
   IN 
  `p_cod_prod`
   varchar(20)
)
BEGIN
  DELETE FROM `productos`
  WHERE     
    (`cod_prod` = `p_cod_prod`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_productos_has_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_productos_has_categoria_productos`(
   IN 
  `p_cod_prod`
   varchar(20),
   IN 
  `p_cod_categoria`
   int
)
BEGIN
  DELETE FROM `productos_has_categoria_productos`
  WHERE     
    (`cod_prod` = `p_cod_prod`) AND    
    (`cod_categoria` = `p_cod_categoria`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_proveedores`(
   IN 
  `p_id_proveedor`
   int
)
BEGIN
  DELETE FROM `proveedores`
  WHERE     
    (`id_proveedor` = `p_id_proveedor`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_telefonos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_telefonos_clientes`(
   IN 
  `p_id_telefonosclientes`
   int,
   IN 
  `p_id_cliente`
   int
)
BEGIN
  DELETE FROM `telefonos_clientes`
  WHERE     
    (`id_telefonosclientes` = `p_id_telefonosclientes`) AND    
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_tipo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_tipo_cliente`(
   IN 
  `p_id_tipocliente`
   int
)
BEGIN
  DELETE FROM `tipo_cliente`
  WHERE     
    (`id_tipocliente` = `p_id_tipocliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_tipo_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_tipo_transacciones`(
   IN 
  `p_id_tipotran`
   int
)
BEGIN
  DELETE FROM `tipo_transacciones`
  WHERE     
    (`id_tipotran` = `p_id_tipotran`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_usuarios`(
   IN 
  `p_usuario`
   varchar(45)
)
BEGIN
  DELETE FROM `usuarios`
  WHERE     
    (`usuario` = `p_usuario`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_usuarios_has_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_del_usuarios_has_grupos_roles`(
   IN 
  `p_usuario`
   varchar(45),
   IN 
  `p_id_rol`
   int
)
BEGIN
  DELETE FROM `usuarios_has_grupos_roles`
  WHERE     
    (`usuario` = `p_usuario`) AND    
    (`id_rol` = `p_id_rol`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_ajustes`(
  IN `p_fecha` date,
  IN `p_cant_producto` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_tipotran` int
)
BEGIN
  INSERT INTO `ajustes`
  (
    `fecha`,
    `cant_producto`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_tipotran`
  )
  VALUES 
  (
    `p_fecha`,
    `p_cant_producto`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_tipotran`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_categoria_productos`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `categoria_productos`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_clientes`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_tipocliente` int
)
BEGIN
  INSERT INTO `clientes`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_tipocliente`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_tipocliente`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_compras`(
  IN `p_fecha` date,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_proveedor` int
)
BEGIN
  INSERT INTO `compras`
  (
    `fecha`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_proveedor`
  )
  VALUES 
  (
    `p_fecha`,
    `p_total`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_proveedor`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_contactos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_contactos_clientes`(
  IN `p_nombre` varchar(50),
  IN `p_correo` varchar(20),
  IN `p_telefono` varchar(15),
  IN `p_id_cliente` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `contactos_clientes`
  (
    `nombre`,
    `correo`,
    `telefono`,
    `id_cliente`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_nombre`,
    `p_correo`,
    `p_telefono`,
    `p_id_cliente`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_costo_prod_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_costo_prod_proveedor`(
  IN `p_costo` double,
  IN `p_cod_prod` varchar(20),
  IN `p_id_proveedor` int
)
BEGIN
  INSERT INTO `costo_prod_proveedor`
  (
    `costo`,
    `cod_prod`,
    `id_proveedor`
  )
  VALUES 
  (
    `p_costo`,
    `p_cod_prod`,
    `p_id_proveedor`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_cotizaciones`(
  IN `p_fecha` date,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_proveedor` int
)
BEGIN
  INSERT INTO `cotizaciones`
  (
    `fecha`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_proveedor`
  )
  VALUES 
  (
    `p_fecha`,
    `p_total`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_proveedor`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_detalle_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_detalle_ajustes`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_id_ajuste` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  INSERT INTO `detalle_ajustes`
  (
    `num_detalle`,
    `cantidad`,
    `id_ajuste`,
    `cod_prod`
  )
  VALUES 
  (
    `p_num_detalle`,
    `p_cantidad`,
    `p_id_ajuste`,
    `p_cod_prod`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_detalle_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_detalle_compras`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_precio_compra` double,
  IN `p_subtotal` double,
  IN `p_id_compra` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  INSERT INTO `detalle_compras`
  (
    `num_detalle`,
    `cantidad`,
    `precio_compra`,
    `subtotal`,
    `id_compra`,
    `cod_prod`
  )
  VALUES 
  (
    `p_num_detalle`,
    `p_cantidad`,
    `p_precio_compra`,
    `p_subtotal`,
    `p_id_compra`,
    `p_cod_prod`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_detalle_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_detalle_cotizaciones`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_precio_unit` double,
  IN `p_id_cotizacion` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  INSERT INTO `detalle_cotizaciones`
  (
    `num_detalle`,
    `cantidad`,
    `precio_unit`,
    `id_cotizacion`,
    `cod_prod`
  )
  VALUES 
  (
    `p_num_detalle`,
    `p_cantidad`,
    `p_precio_unit`,
    `p_id_cotizacion`,
    `p_cod_prod`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_detalle_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_detalle_facturas`(
  IN `p_num_detalle` int,
  IN `p_precio_venta` double,
  IN `p_cantidad` int,
  IN `p_subtotal` double,
  IN `p_num_factura` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  INSERT INTO `detalle_facturas`
  (
    `num_detalle`,
    `precio_venta`,
    `cantidad`,
    `subtotal`,
    `num_factura`,
    `cod_prod`
  )
  VALUES 
  (
    `p_num_detalle`,
    `p_precio_venta`,
    `p_cantidad`,
    `p_subtotal`,
    `p_num_factura`,
    `p_cod_prod`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_detalle_oc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_detalle_oc`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_subtotal` double,
  IN `p_precio_unit` double,
  IN `p_id_ordencompra` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  INSERT INTO `detalle_oc`
  (
    `num_detalle`,
    `cantidad`,
    `subtotal`,
    `precio_unit`,
    `id_ordencompra`,
    `cod_prod`
  )
  VALUES 
  (
    `p_num_detalle`,
    `p_cantidad`,
    `p_subtotal`,
    `p_precio_unit`,
    `p_id_ordencompra`,
    `p_cod_prod`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_direcciones_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_direcciones_clientes`(
  IN `p_direccion` varchar(50),
  IN `p_id_cliente` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `direcciones_clientes`
  (
    `direccion`,
    `id_cliente`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_direccion`,
    `p_id_cliente`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_facturas`(
  IN `p_fecha` date,
  IN `p_subtotal` double,
  IN `p_isv` double,
  IN `p_descuento` double,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_cliente` int
)
BEGIN
  INSERT INTO `facturas`
  (
    `fecha`,
    `subtotal`,
    `isv`,
    `descuento`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_cliente`
  )
  VALUES 
  (
    `p_fecha`,
    `p_subtotal`,
    `p_isv`,
    `p_descuento`,
    `p_total`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_cliente`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_grupos_roles`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `grupos_roles`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_grupos_roles_has_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_grupos_roles_has_privilegios`(
  IN `p_id_rol` int,
  IN `p_id_privilegio` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `grupos_roles_has_privilegios`
  (
    `id_rol`,
    `id_privilegio`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_id_rol`,
    `p_id_privilegio`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_kardex`(
  IN `p_cantidad` int,
  IN `p_costo` double,
  IN `p_inv_antes` int,
  IN `p_inv_despues` int,
  IN `p_fecha_crea` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_precio` double,
  IN `p_cod_prod` varchar(20),
  IN `p_entrada_o_salida` varchar(1)
)
BEGIN
  INSERT INTO `kardex`
  (
    `cantidad`,
    `costo`,
    `inv_antes`,
    `inv_despues`,
    `fecha_crea`,
    `usuario_crea`,
    `precio`,
    `cod_prod`,
    `entrada_o_salida`
  )
  VALUES 
  (
    `p_cantidad`,
    `p_costo`,
    `p_inv_antes`,
    `p_inv_despues`,
    `p_fecha_crea`,
    `p_usuario_crea`,
    `p_precio`,
    `p_cod_prod`,
    `p_entrada_o_salida`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_presentacion_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_presentacion_productos`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `presentacion_productos`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_privilegios`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `privilegios`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_productos`(
  IN `p_cod_prod` varchar(20),
  IN `p_existencia` int,
  IN `p_fecha_venc` date,
  IN `p_costo` double,
  IN `p_precio_consumi` double,
  IN `p_precio_mayor` double,
  IN `p_nombre` varchar(45),
  IN `p_cod_presentacion` int,
  IN `p_existencia_min` int,
  IN `p_existencia_max` int,
  IN `p_porcentaje_m` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `productos`
  (
    `cod_prod`,
    `existencia`,
    `fecha_venc`,
    `costo`,
    `precio_consumi`,
    `precio_mayor`,
    `nombre`,
    `cod_presentacion`,
    `existencia_min`,
    `existencia_max`,
    `porcentaje_m`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_cod_prod`,
    `p_existencia`,
    `p_fecha_venc`,
    `p_costo`,
    `p_precio_consumi`,
    `p_precio_mayor`,
    `p_nombre`,
    `p_cod_presentacion`,
    `p_existencia_min`,
    `p_existencia_max`,
    `p_porcentaje_m`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_productos_has_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_productos_has_categoria_productos`(
  IN `p_cod_prod` varchar(20),
  IN `p_cod_categoria` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `productos_has_categoria_productos`
  (
    `cod_prod`,
    `cod_categoria`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_cod_prod`,
    `p_cod_categoria`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_proveedores`(
  IN `p_direccion` varchar(45),
  IN `p_telefono` varchar(15),
  IN `p_nombre` varchar(45),
  IN `p_contacto` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `proveedores`
  (
    `direccion`,
    `telefono`,
    `nombre`,
    `contacto`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_direccion`,
    `p_telefono`,
    `p_nombre`,
    `p_contacto`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_telefonos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_telefonos_clientes`(
  IN `p_numero_tel` varchar(15),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_cliente` int
)
BEGIN
  INSERT INTO `telefonos_clientes`
  (
    `numero_tel`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_cliente`
  )
  VALUES 
  (
    `p_numero_tel`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_id_cliente`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_tipo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_tipo_cliente`(
  IN `p_descripcion` varchar(15),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `tipo_cliente`
  (
    `descripcion`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_descripcion`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_tipo_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_tipo_transacciones`(
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(15),
  IN `p_usuario_actu` varchar(15),
  IN `p_entrada_o_salida` varchar(1)
)
BEGIN
  INSERT INTO `tipo_transacciones`
  (
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `entrada_o_salida`
  )
  VALUES 
  (
    `p_nombre`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`,
    `p_entrada_o_salida`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_usuarios`(
  IN `p_usuario` varchar(45),
  IN `p_correo` varchar(45),
  IN `p_nombre` varchar(45),
  IN `p_clave` binary,
  IN `p_key` binary,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `usuarios`
  (
    `usuario`,
    `correo`,
    `nombre`,
    `clave`,
    `key`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_usuario`,
    `p_correo`,
    `p_nombre`,
    `p_clave`,
    `p_key`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_usuarios_has_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_ins_usuarios_has_grupos_roles`(
  IN `p_usuario` varchar(45),
  IN `p_id_rol` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  INSERT INTO `usuarios_has_grupos_roles`
  (
    `usuario`,
    `id_rol`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  )
  VALUES 
  (
    `p_usuario`,
    `p_id_rol`,
    `p_fecha_crea`,
    `p_fecha_actu`,
    `p_usuario_crea`,
    `p_usuario_actu`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_ajustes`()
BEGIN
  SELECT
    `id_ajuste`,
    `fecha`,
    `cant_producto`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_tipotran`
  FROM `ajustes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_categoria_productos`()
BEGIN
  SELECT
    `cod_categoria`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `categoria_productos`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_clientes`()
BEGIN
  SELECT
    `id_cliente`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_tipocliente`
  FROM `clientes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_compras`()
BEGIN
  SELECT
    `id_compra`,
    `fecha`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_proveedor`
  FROM `compras`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_contactos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_contactos_clientes`()
BEGIN
  SELECT
    `id_contactocliente`,
    `nombre`,
    `correo`,
    `telefono`,
    `id_cliente`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `contactos_clientes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_costo_prod_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_costo_prod_proveedor`()
BEGIN
  SELECT
    `costo`,
    `cod_prod`,
    `id_proveedor`
  FROM `costo_prod_proveedor`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_cotizaciones`()
BEGIN
  SELECT
    `id_cotizacion`,
    `fecha`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_proveedor`
  FROM `cotizaciones`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_detalle_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_detalle_ajustes`()
BEGIN
  SELECT
    `num_detalle`,
    `cantidad`,
    `id_ajuste`,
    `cod_prod`
  FROM `detalle_ajustes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_detalle_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_detalle_compras`()
BEGIN
  SELECT
    `num_detalle`,
    `cantidad`,
    `precio_compra`,
    `subtotal`,
    `id_compra`,
    `cod_prod`
  FROM `detalle_compras`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_detalle_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_detalle_cotizaciones`()
BEGIN
  SELECT
    `num_detalle`,
    `cantidad`,
    `precio_unit`,
    `id_cotizacion`,
    `cod_prod`
  FROM `detalle_cotizaciones`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_detalle_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_detalle_facturas`()
BEGIN
  SELECT
    `num_detalle`,
    `precio_venta`,
    `cantidad`,
    `subtotal`,
    `num_factura`,
    `cod_prod`
  FROM `detalle_facturas`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_detalle_oc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_detalle_oc`()
BEGIN
  SELECT
    `num_detalle`,
    `cantidad`,
    `subtotal`,
    `precio_unit`,
    `id_ordencompra`,
    `cod_prod`
  FROM `detalle_oc`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_direcciones_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_direcciones_clientes`()
BEGIN
  SELECT
    `id_direccioncliente`,
    `direccion`,
    `id_cliente`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `direcciones_clientes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_facturas`()
BEGIN
  SELECT
    `num_factura`,
    `fecha`,
    `subtotal`,
    `isv`,
    `descuento`,
    `total`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_cliente`
  FROM `facturas`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_grupos_roles`()
BEGIN
  SELECT
    `id_rol`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `grupos_roles`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_grupos_roles_has_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_grupos_roles_has_privilegios`()
BEGIN
  SELECT
    `id_rol`,
    `id_privilegio`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `grupos_roles_has_privilegios`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_kardex`()
BEGIN
  SELECT
    `id_operacion`,
    `cantidad`,
    `costo`,
    `inv_antes`,
    `inv_despues`,
    `fecha_crea`,
    `usuario_crea`,
    `precio`,
    `cod_prod`,
    `entrada_o_salida`
  FROM `kardex`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_ordenes_de_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_ordenes_de_compra`()
BEGIN
  SELECT
    `id_ordencompra`,
    `fecha`,
    `total`,
    `id_proveedor`,
    `ejecutada`,
    `cancelada`,
    `activa`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `ordenes_de_compra`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_presentacion_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_presentacion_productos`()
BEGIN
  SELECT
    `cod_presentacion`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `presentacion_productos`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_privilegios`()
BEGIN
  SELECT
    `id_privilegio`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `privilegios`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_productos`()
BEGIN
  SELECT
    `cod_prod`,
    `existencia`,
    `fecha_venc`,
    `costo`,
    `precio_consumi`,
    `precio_mayor`,
    `nombre`,
    `cod_presentacion`,
    `existencia_min`,
    `existencia_max`,
    `porcentaje_m`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `productos`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_productos_has_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_productos_has_categoria_productos`()
BEGIN
  SELECT
    `cod_prod`,
    `cod_categoria`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `productos_has_categoria_productos`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_proveedores`()
BEGIN
  SELECT
    `id_proveedor`,
    `direccion`,
    `telefono`,
    `nombre`,
    `contacto`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `proveedores`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_telefonos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_telefonos_clientes`()
BEGIN
  SELECT
    `id_telefonosclientes`,
    `numero_tel`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `id_cliente`
  FROM `telefonos_clientes`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_tipo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_tipo_cliente`()
BEGIN
  SELECT
    `id_tipocliente`,
    `descripcion`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `tipo_cliente`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_tipo_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_tipo_transacciones`()
BEGIN
  SELECT
    `id_tipotran`,
    `nombre`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`,
    `entrada_o_salida`
  FROM `tipo_transacciones`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_usuarios`()
BEGIN
  SELECT
    `usuario`,
    `correo`,
    `nombre`,
    `clave`,
    `key`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `usuarios`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_usuarios_has_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_sel_usuarios_has_grupos_roles`()
BEGIN
  SELECT
    `usuario`,
    `id_rol`,
    `fecha_crea`,
    `fecha_actu`,
    `usuario_crea`,
    `usuario_actu`
  FROM `usuarios_has_grupos_roles`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_ajustes`(
  IN `p_id_ajuste` int,
  IN `p_fecha` date,
  IN `p_cant_producto` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_tipotran` int
)
BEGIN
  UPDATE `ajustes` SET
    `fecha` = `p_fecha`,
    `cant_producto` = `p_cant_producto`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `id_tipotran` = `p_id_tipotran`
  WHERE 
    (`id_ajuste` = `p_id_ajuste`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_categoria_productos`(
  IN `p_cod_categoria` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `categoria_productos` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`cod_categoria` = `p_cod_categoria`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_clientes`(
  IN `p_id_cliente` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_tipocliente` int
)
BEGIN
  UPDATE `clientes` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `id_tipocliente` = `p_id_tipocliente`
  WHERE 
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_compras`(
  IN `p_id_compra` int,
  IN `p_fecha` date,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_proveedor` int
)
BEGIN
  UPDATE `compras` SET
    `fecha` = `p_fecha`,
    `total` = `p_total`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `id_proveedor` = `p_id_proveedor`
  WHERE 
    (`id_compra` = `p_id_compra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_contactos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_contactos_clientes`(
  IN `p_id_contactocliente` int,
  IN `p_nombre` varchar(50),
  IN `p_correo` varchar(20),
  IN `p_telefono` varchar(15),
  IN `p_id_cliente` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `contactos_clientes` SET
    `nombre` = `p_nombre`,
    `correo` = `p_correo`,
    `telefono` = `p_telefono`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_contactocliente` = `p_id_contactocliente`) AND
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_costo_prod_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_costo_prod_proveedor`(
  IN `p_costo` double,
  IN `p_cod_prod` varchar(20),
  IN `p_id_proveedor` int
)
BEGIN
  UPDATE `costo_prod_proveedor` SET
    `costo` = `p_costo`
  WHERE 
    (`cod_prod` = `p_cod_prod`) AND
    (`id_proveedor` = `p_id_proveedor`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_cotizaciones`(
  IN `p_id_cotizacion` int,
  IN `p_fecha` date,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_proveedor` int
)
BEGIN
  UPDATE `cotizaciones` SET
    `fecha` = `p_fecha`,
    `total` = `p_total`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `id_proveedor` = `p_id_proveedor`
  WHERE 
    (`id_cotizacion` = `p_id_cotizacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_detalle_ajustes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_detalle_ajustes`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_id_ajuste` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  UPDATE `detalle_ajustes` SET
    `cantidad` = `p_cantidad`,
    `cod_prod` = `p_cod_prod`
  WHERE 
    (`num_detalle` = `p_num_detalle`) AND
    (`id_ajuste` = `p_id_ajuste`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_detalle_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_detalle_compras`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_precio_compra` double,
  IN `p_subtotal` double,
  IN `p_id_compra` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  UPDATE `detalle_compras` SET
    `cantidad` = `p_cantidad`,
    `precio_compra` = `p_precio_compra`,
    `subtotal` = `p_subtotal`,
    `cod_prod` = `p_cod_prod`
  WHERE 
    (`num_detalle` = `p_num_detalle`) AND
    (`id_compra` = `p_id_compra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_detalle_cotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_detalle_cotizaciones`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_precio_unit` double,
  IN `p_id_cotizacion` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  UPDATE `detalle_cotizaciones` SET
    `cantidad` = `p_cantidad`,
    `precio_unit` = `p_precio_unit`,
    `cod_prod` = `p_cod_prod`
  WHERE 
    (`num_detalle` = `p_num_detalle`) AND
    (`id_cotizacion` = `p_id_cotizacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_detalle_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_detalle_facturas`(
  IN `p_num_detalle` int,
  IN `p_precio_venta` double,
  IN `p_cantidad` int,
  IN `p_subtotal` double,
  IN `p_num_factura` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  UPDATE `detalle_facturas` SET
    `precio_venta` = `p_precio_venta`,
    `cantidad` = `p_cantidad`,
    `subtotal` = `p_subtotal`,
    `cod_prod` = `p_cod_prod`
  WHERE 
    (`num_detalle` = `p_num_detalle`) AND
    (`num_factura` = `p_num_factura`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_detalle_oc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_detalle_oc`(
  IN `p_num_detalle` int,
  IN `p_cantidad` int,
  IN `p_subtotal` double,
  IN `p_precio_unit` double,
  IN `p_id_ordencompra` int,
  IN `p_cod_prod` varchar(20)
)
BEGIN
  UPDATE `detalle_oc` SET
    `cantidad` = `p_cantidad`,
    `subtotal` = `p_subtotal`,
    `precio_unit` = `p_precio_unit`,
    `cod_prod` = `p_cod_prod`
  WHERE 
    (`num_detalle` = `p_num_detalle`) AND
    (`id_ordencompra` = `p_id_ordencompra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_direcciones_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_direcciones_clientes`(
  IN `p_id_direccioncliente` int,
  IN `p_direccion` varchar(50),
  IN `p_id_cliente` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `direcciones_clientes` SET
    `direccion` = `p_direccion`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_direccioncliente` = `p_id_direccioncliente`) AND
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_facturas`(
  IN `p_num_factura` int,
  IN `p_fecha` date,
  IN `p_subtotal` double,
  IN `p_isv` double,
  IN `p_descuento` double,
  IN `p_total` double,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_cliente` int
)
BEGIN
  UPDATE `facturas` SET
    `fecha` = `p_fecha`,
    `subtotal` = `p_subtotal`,
    `isv` = `p_isv`,
    `descuento` = `p_descuento`,
    `total` = `p_total`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `id_cliente` = `p_id_cliente`
  WHERE 
    (`num_factura` = `p_num_factura`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_grupos_roles`(
  IN `p_id_rol` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `grupos_roles` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_rol` = `p_id_rol`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_grupos_roles_has_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_grupos_roles_has_privilegios`(
  IN `p_id_rol` int,
  IN `p_id_privilegio` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `grupos_roles_has_privilegios` SET
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_rol` = `p_id_rol`) AND
    (`id_privilegio` = `p_id_privilegio`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_kardex`(
  IN `p_id_operacion` int,
  IN `p_cantidad` int,
  IN `p_costo` double,
  IN `p_inv_antes` int,
  IN `p_inv_despues` int,
  IN `p_fecha_crea` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_precio` double,
  IN `p_cod_prod` varchar(20),
  IN `p_entrada_o_salida` varchar(1)
)
BEGIN
  UPDATE `kardex` SET
    `cantidad` = `p_cantidad`,
    `costo` = `p_costo`,
    `inv_antes` = `p_inv_antes`,
    `inv_despues` = `p_inv_despues`,
    `fecha_crea` = `p_fecha_crea`,
    `usuario_crea` = `p_usuario_crea`,
    `precio` = `p_precio`,
    `cod_prod` = `p_cod_prod`,
    `entrada_o_salida` = `p_entrada_o_salida`
  WHERE 
    (`id_operacion` = `p_id_operacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_ordenes_de_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_ordenes_de_compra`(
  IN `p_id_ordencompra` int,
  IN `p_fecha` date,
  IN `p_total` double,
  IN `p_id_proveedor` int,
  IN `p_ejecutada` tinyint(1),
  IN `p_cancelada` tinyint(1),
  IN `p_activa` tinyint(1),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `ordenes_de_compra` SET
    `fecha` = `p_fecha`,
    `total` = `p_total`,
    `id_proveedor` = `p_id_proveedor`,
    `ejecutada` = `p_ejecutada`,
    `cancelada` = `p_cancelada`,
    `activa` = `p_activa`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_ordencompra` = `p_id_ordencompra`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_presentacion_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_presentacion_productos`(
  IN `p_cod_presentacion` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `presentacion_productos` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`cod_presentacion` = `p_cod_presentacion`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_privilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_privilegios`(
  IN `p_id_privilegio` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `privilegios` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_privilegio` = `p_id_privilegio`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_productos`(
  IN `p_cod_prod` varchar(20),
  IN `p_existencia` int,
  IN `p_fecha_venc` date,
  IN `p_costo` double,
  IN `p_precio_consumi` double,
  IN `p_precio_mayor` double,
  IN `p_nombre` varchar(45),
  IN `p_cod_presentacion` int,
  IN `p_existencia_min` int,
  IN `p_existencia_max` int,
  IN `p_porcentaje_m` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `productos` SET
    `existencia` = `p_existencia`,
    `fecha_venc` = `p_fecha_venc`,
    `costo` = `p_costo`,
    `precio_consumi` = `p_precio_consumi`,
    `precio_mayor` = `p_precio_mayor`,
    `nombre` = `p_nombre`,
    `cod_presentacion` = `p_cod_presentacion`,
    `existencia_min` = `p_existencia_min`,
    `existencia_max` = `p_existencia_max`,
    `porcentaje_m` = `p_porcentaje_m`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`cod_prod` = `p_cod_prod`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_productos_has_categoria_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_productos_has_categoria_productos`(
  IN `p_cod_prod` varchar(20),
  IN `p_cod_categoria` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `productos_has_categoria_productos` SET
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`cod_prod` = `p_cod_prod`) AND
    (`cod_categoria` = `p_cod_categoria`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_proveedores`(
  IN `p_id_proveedor` int,
  IN `p_direccion` varchar(45),
  IN `p_telefono` varchar(15),
  IN `p_nombre` varchar(45),
  IN `p_contacto` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `proveedores` SET
    `direccion` = `p_direccion`,
    `telefono` = `p_telefono`,
    `nombre` = `p_nombre`,
    `contacto` = `p_contacto`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_proveedor` = `p_id_proveedor`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_telefonos_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_telefonos_clientes`(
  IN `p_id_telefonosclientes` int,
  IN `p_numero_tel` varchar(15),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45),
  IN `p_id_cliente` int
)
BEGIN
  UPDATE `telefonos_clientes` SET
    `numero_tel` = `p_numero_tel`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_telefonosclientes` = `p_id_telefonosclientes`) AND
    (`id_cliente` = `p_id_cliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_tipo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_tipo_cliente`(
  IN `p_id_tipocliente` int,
  IN `p_descripcion` varchar(15),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `tipo_cliente` SET
    `descripcion` = `p_descripcion`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`id_tipocliente` = `p_id_tipocliente`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_tipo_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_tipo_transacciones`(
  IN `p_id_tipotran` int,
  IN `p_nombre` varchar(45),
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(15),
  IN `p_usuario_actu` varchar(15),
  IN `p_entrada_o_salida` varchar(1)
)
BEGIN
  UPDATE `tipo_transacciones` SET
    `nombre` = `p_nombre`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`,
    `entrada_o_salida` = `p_entrada_o_salida`
  WHERE 
    (`id_tipotran` = `p_id_tipotran`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_usuarios`(
  IN `p_usuario` varchar(45),
  IN `p_correo` varchar(45),
  IN `p_nombre` varchar(45),
  IN `p_clave` binary,
  IN `p_key` binary,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `usuarios` SET
    `correo` = `p_correo`,
    `nombre` = `p_nombre`,
    `clave` = `p_clave`,
    `key` = `p_key`,
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`usuario` = `p_usuario`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_usuarios_has_grupos_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`VisualStudio`@`%` PROCEDURE `sp_upd_usuarios_has_grupos_roles`(
  IN `p_usuario` varchar(45),
  IN `p_id_rol` int,
  IN `p_fecha_crea` datetime,
  IN `p_fecha_actu` datetime,
  IN `p_usuario_crea` varchar(45),
  IN `p_usuario_actu` varchar(45)
)
BEGIN
  UPDATE `usuarios_has_grupos_roles` SET
    `fecha_crea` = `p_fecha_crea`,
    `fecha_actu` = `p_fecha_actu`,
    `usuario_crea` = `p_usuario_crea`,
    `usuario_actu` = `p_usuario_actu`
  WHERE 
    (`usuario` = `p_usuario`) AND
    (`id_rol` = `p_id_rol`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_ajustes_tipotran`
--

/*!50001 DROP TABLE IF EXISTS `vw_ajustes_tipotran`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ajustes_tipotran`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`VisualStudio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ajustes_tipotran` AS select `ajustes`.`id_ajuste` AS `id_ajuste`,`ajustes`.`id_tipotran` AS `id_tipotran`,`tipo_transacciones`.`entrada_o_salida` AS `entrada_o_salida` from (`ajustes` left join `tipo_transacciones` on((`ajustes`.`id_tipotran` = `tipo_transacciones`.`id_tipotran`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cotizacion_provee`
--

/*!50001 DROP TABLE IF EXISTS `vw_cotizacion_provee`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cotizacion_provee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`VisualStudio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cotizacion_provee` AS select `cotizaciones`.`id_cotizacion` AS `id_cotizacion`,`cotizaciones`.`id_proveedor` AS `id_proveedor`,`proveedores`.`nombre` AS `nombre` from (`cotizaciones` left join `proveedores` on((`cotizaciones`.`id_proveedor` = `proveedores`.`id_proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordenes_activas`
--

/*!50001 DROP TABLE IF EXISTS `vw_ordenes_activas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`VisualStudio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordenes_activas` AS select `ordenes_de_compra`.`id_ordencompra` AS `id_ordencompra`,`ordenes_de_compra`.`fecha` AS `fecha`,`ordenes_de_compra`.`total` AS `total`,`detalle_oc`.`cod_prod` AS `cod_prod`,`productos`.`nombre` AS `nombre` from ((`detalle_oc` left join `ordenes_de_compra` on((`detalle_oc`.`id_ordencompra` = `ordenes_de_compra`.`id_ordencompra`))) left join `productos` on((`detalle_oc`.`cod_prod` = `productos`.`cod_prod`))) where (`ordenes_de_compra`.`activa` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_oc`
--

/*!50001 DROP TABLE IF EXISTS `vw_productos_oc`*/;
/*!50001 DROP VIEW IF EXISTS `vw_productos_oc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`VisualStudio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_oc` AS select `productos`.`cod_prod` AS `cod_prod`,`costo_prod_proveedor`.`id_proveedor` AS `id_proveedor`,`costo_prod_proveedor`.`costo` AS `costo` from ((`costo_prod_proveedor` join `productos` on((`costo_prod_proveedor`.`cod_prod` = `productos`.`cod_prod`))) join `vw_ordenes_activas`) where ((`productos`.`existencia` <= `productos`.`existencia_min`) and (not(`productos`.`cod_prod` in (select `vw_ordenes_activas`.`cod_prod` from `vw_ordenes_activas`)))) order by `costo_prod_proveedor`.`id_proveedor`,`costo_prod_proveedor`.`costo` */;
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

-- Dump completed on 2014-11-26 21:32:31
