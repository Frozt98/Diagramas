-- MySQL dump 10.13  Distrib 9.7.0, for Linux (x86_64)
--
-- Host: localhost    Database: sistemapanaderia
-- ------------------------------------------------------
-- Server version	9.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a986bb22-40ed-11f1-8921-c2bf4e2e6c70:1-140';

--
-- Table structure for table `Detalle_pedido`
--

DROP TABLE IF EXISTS `Detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_pedido` (
  `cantidad` int NOT NULL,
  `total` double NOT NULL,
  `id_pedido` int NOT NULL,
  KEY `idpedido` (`id_pedido`),
  CONSTRAINT `Detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_pedido`
--

LOCK TABLES `Detalle_pedido` WRITE;
/*!40000 ALTER TABLE `Detalle_pedido` DISABLE KEYS */;
INSERT INTO `Detalle_pedido` VALUES (6,13.5,1),(17,4.25,2),(2,10,3),(3,3.75,4),(5,25,5),(12,3,6),(4,1,7),(20,5,8);
/*!40000 ALTER TABLE `Detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Keyes`
--

DROP TABLE IF EXISTS `Keyes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Keyes` (
  `identi_producto` int NOT NULL,
  `tamanio` enum('grande','mediano','pequeño') NOT NULL,
  PRIMARY KEY (`identi_producto`),
  CONSTRAINT `Keyes_ibfk_1` FOREIGN KEY (`identi_producto`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Keyes`
--

LOCK TABLES `Keyes` WRITE;
/*!40000 ALTER TABLE `Keyes` DISABLE KEYS */;
INSERT INTO `Keyes` VALUES (1,'mediano'),(3,'grande'),(4,'pequeño');
/*!40000 ALTER TABLE `Keyes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Muffin`
--

DROP TABLE IF EXISTS `Muffin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Muffin` (
  `identificador_producto` int NOT NULL,
  PRIMARY KEY (`identificador_producto`),
  CONSTRAINT `Muffin_ibfk_1` FOREIGN KEY (`identificador_producto`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Muffin`
--

LOCK TABLES `Muffin` WRITE;
/*!40000 ALTER TABLE `Muffin` DISABLE KEYS */;
INSERT INTO `Muffin` VALUES (2);
/*!40000 ALTER TABLE `Muffin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `identificador` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `tipo_entrega` enum('local','domicilio') NOT NULL,
  `cedula_cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`identificador`),
  KEY `cedula_cliente` (`cedula_cliente`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`cedula_cliente`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (1,'2026-05-18','2026-05-20','local','1160789054'),(2,'2026-05-19','2026-05-24','domicilio','1314567892'),(3,'2026-05-19','2026-05-23','domicilio','1356894110'),(4,'2026-05-25','2026-05-29','local','1147896325'),(5,'2026-05-23','2026-05-30','domicilio','1185462301'),(6,'2026-05-21','2026-05-25','domicilio','1125987410'),(7,'2026-05-21','2026-05-24','domicilio','1150478963'),(8,'2026-05-24','2026-05-28','domicilio','1904561278');
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido_Producto`
--

DROP TABLE IF EXISTS `Pedido_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido_Producto` (
  `identificador_pedido` int NOT NULL,
  `identificador_producto` int NOT NULL,
  PRIMARY KEY (`identificador_producto`,`identificador_pedido`),
  KEY `identificador_pedido` (`identificador_pedido`),
  CONSTRAINT `Pedido_Producto_ibfk_1` FOREIGN KEY (`identificador_pedido`) REFERENCES `Pedido` (`identificador`),
  CONSTRAINT `Pedido_Producto_ibfk_2` FOREIGN KEY (`identificador_producto`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido_Producto`
--

LOCK TABLES `Pedido_Producto` WRITE;
/*!40000 ALTER TABLE `Pedido_Producto` DISABLE KEYS */;
INSERT INTO `Pedido_Producto` VALUES (1,1),(2,2),(3,3),(4,4),(5,3),(6,2),(7,2),(8,2);
/*!40000 ALTER TABLE `Pedido_Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(20) NOT NULL,
  `sabor` enum('naranja','vainilla','chocolate','mixto') DEFAULT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,'Keyes artesanal','naranja',2.25),(2,'Muffin','vainilla',0.25),(3,'Keyes artesanal','chocolate',5),(4,'Keyes artesanal','mixto',1.25);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `numero_celular` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1125987410','Maria Fernanda','Torres Benitez','0996325874'),('1147896325','David Alexander','Salazar Pardo','0946328874'),('1150478963','Luis Emilio','Valdivieso Jaramillo','0939854120'),('1160789054','Juan Andres','Castillo Lima','0992546789'),('1185462301','Jose Angel','Salazar Pardo','0933557403'),('1314567892','Sara Elizabeth','Gonzales Cueva','0968745213'),('1356894110','Nicole Antonella','Quizhpe Cueva','0987562314'),('1904561278','Kevin Alexander','Ramon Ochoa','0959632147');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_entrega`
--

DROP TABLE IF EXISTS `direccion_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_entrega` (
  `id_direccion_pedido` varchar(50) NOT NULL,
  `calle_principal` varchar(60) NOT NULL,
  `calle_secundaria` varchar(60) NOT NULL,
  `id_pedido` int NOT NULL,
  PRIMARY KEY (`id_direccion_pedido`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `direccion_entrega_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_entrega`
--

LOCK TABLES `direccion_entrega` WRITE;
/*!40000 ALTER TABLE `direccion_entrega` DISABLE KEYS */;
INSERT INTO `direccion_entrega` VALUES ('1','Av.Los Paltas','Onas',2),('2','18 de Noviembre','10 de Agosto',5),('3','Av. Salvador Bustamante Celi','Azuay',6),('4','Av. Manuel Agustín Aguirre','Chile',7),('5','Sucre','Miguel Riofrío',8);
/*!40000 ALTER TABLE `direccion_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `Numero_factura` int NOT NULL AUTO_INCREMENT,
  `Fecha_emision` date NOT NULL,
  `subtotal` double NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `Total` double NOT NULL,
  `id_factura_pedido` int NOT NULL,
  PRIMARY KEY (`Numero_factura`),
  KEY `id_factura_pedido` (`id_factura_pedido`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_factura_pedido`) REFERENCES `Pedido` (`identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2026-05-18',13.5,10.20,15.53,1),(2,'2026-05-19',4.25,0.15,4.9,2),(3,'2026-05-19',10,0.15,11.5,3),(4,'2026-05-25',3.75,0.15,4.3,4),(5,'2026-05-25',25,0.15,28.75,5),(6,'2026-05-21',3,0.15,3.45,6),(7,'2026-05-21',1,0.15,1.15,7),(8,'2026-05-24',5,0.15,5.75,8);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-22  2:24:50
