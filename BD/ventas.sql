-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ventas
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `usuario_id` int NOT NULL,
  `videojuego_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`videojuego_id`),
  KEY `videojuego_id` (`videojuego_id`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`videojuego_id`) REFERENCES `videojuegos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (5,1),(5,2),(2,3);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_ventas`
--

DROP TABLE IF EXISTS `historial_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `videojuego_id` int DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `videojuego_id` (`videojuego_id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `historial_ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `historial_ventas_ibfk_2` FOREIGN KEY (`videojuego_id`) REFERENCES `videojuegos` (`id`),
  CONSTRAINT `historial_ventas_ibfk_3` FOREIGN KEY (`vendedor_id`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_ventas`
--

LOCK TABLES `historial_ventas` WRITE;
/*!40000 ALTER TABLE `historial_ventas` DISABLE KEYS */;
INSERT INTO `historial_ventas` VALUES (1,2,1,'2024-11-19',1,3),(2,2,1,'2024-11-19',3,3),(3,5,2,'2024-11-19',1,3),(4,2,3,'2024-11-20',3,4),(5,2,1,'2024-11-20',1,3),(6,2,1,'2024-11-20',1,3),(7,2,2,'2024-11-20',2,3);
/*!40000 ALTER TABLE `historial_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Admin'),(2,'Vendedor'),(3,'Usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(250) DEFAULT NULL,
  `idRol` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Botina','jbotina@gmail.com','e10adc3949ba59abbe56e057f20f883e',1),(2,'Janier','Acosta','janier@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',3),(3,'Cristian','Landazuri','cdlandazuri222@umariana.edu','81dc9bdb52d04dc20036dbd8313ed055',2),(4,'Juan','Charris','jc@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',2),(5,'Juan','Muñoz','munoz@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuegos`
--

DROP TABLE IF EXISTS `videojuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuegos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `genero` varchar(50) DEFAULT NULL,
  `plataforma` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `unidades_disponibles` int DEFAULT NULL,
  `idVendedor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuegos`
--

LOCK TABLES `videojuegos` WRITE;
/*!40000 ALTER TABLE `videojuegos` DISABLE KEYS */;
INSERT INTO `videojuegos` VALUES (1,'Gta V','Tres personajes cometen crimenes en los Angeles','Mundo Abierto','Play 4',100000.00,'2013-06-18',4,3),(2,'Battlefield 3','Videojuego de disparos en primera persona que lleva a los jugadores a la Primera Guerra Mundial','Shooter','Play 4',75000.00,'2011-07-30',4,3),(3,'COD Black Ops 1','Videojuego de disparos en primera persona ambientado en la Guerra Fría','Shooter','Xbox 360',70000.00,'2013-07-16',13,4);
/*!40000 ALTER TABLE `videojuegos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20  8:33:27
