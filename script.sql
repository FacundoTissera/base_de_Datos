-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: notas_texto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'musica'),(4,'bancario'),(5,'jefes'),(6,'almacenero'),(7,'empleados'),(8,'comedores'),(9,'opticos'),(10,'developers');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_categoria`
--

DROP TABLE IF EXISTS `nota_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2118cb11-6503-4324-b67f-5d543ade18c6` (`nota_id`),
  KEY `FK_92e2cf63-c9e9-4656-ac24-e734f1d72a1e` (`categoria_id`),
  CONSTRAINT `FK_92e2cf63-c9e9-4656-ac24-e734f1d72a1e` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `nota_categoria_FK` FOREIGN KEY (`id`) REFERENCES `notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_categoria`
--

LOCK TABLES `nota_categoria` WRITE;
/*!40000 ALTER TABLE `nota_categoria` DISABLE KEYS */;
INSERT INTO `nota_categoria` VALUES (2,1,10),(3,2,9),(4,3,5),(5,4,7),(6,5,6),(7,6,8),(8,7,3),(9,8,4);
/*!40000 ALTER TABLE `nota_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `contenido` varchar(255) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `eliminar` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dda4cf06-be0b-410c-b671-a82a1a0c8fc7` (`id_usuario`),
  CONSTRAINT `FK_dda4cf06-be0b-410c-b671-a82a1a0c8fc7` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'programador',1,'Javascript','2021-09-08',NULL,NULL),(2,'optica',2,'vilalmera','2021-08-09',NULL,NULL),(3,'jefe produccion',3,'planta lactea villa maria','2021-08-09',NULL,NULL),(4,'empleado',4,'planta alimenticia ','2021-09-04',NULL,NULL),(5,'almacenero',5,'maxi-kiosco en chañar ladeado','2021-09-04',NULL,NULL),(6,'roberto',6,'jubilado','2021-09-04',NULL,NULL),(7,'cantante',7,'cantante de rock','2021-09-04',NULL,NULL),(8,'banquero',8,'gerente banco nacion','2021-09-04',NULL,NULL),(9,'vicepresidente',9,'NN','2021-09-04',NULL,NULL),(10,'jefe deposito',10,'planta lactea','2021-09-04',NULL,NULL);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'facundo','facundo@hotmail.com'),(2,'daniela','dani@hotmail.com'),(3,'fernando','fernando@gmail.com'),(4,'jose','jo0se@gmail.com'),(5,'francisco','francisco@hotmail.com'),(6,'roberto','robert@hotmail.com'),(7,'anastacio','anastacio@gmail.com'),(8,'alberto','albert@gmil.com'),(9,'cristina','cris@hotmail.com'),(10,'pedrito','pedri@hotmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'notas_texto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 12:16:33
