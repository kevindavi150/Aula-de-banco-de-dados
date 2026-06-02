CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `nome` varchar(45) NOT NULL,
  `nacionalidade` varchar(45) NOT NULL,
  `livros_idlivros` int NOT NULL,
  PRIMARY KEY (`livros_idlivros`),
  CONSTRAINT `fk_autores_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES ('Machado de Assis','Brasileiro',20),('Antoine de Saint-Exupéry','Francês',21),('J.K. Rowling','Britânica',22);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codigo_categoria` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Romance'),(2,'Fantasia'),(3,'Ficção Científica'),(4,'Drama'),(5,'Aventura');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id_emprestimo` int NOT NULL,
  `usuario_cpf` decimal(11,0) NOT NULL,
  `livro_id` int NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date NOT NULL,
  PRIMARY KEY (`id_emprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (1,39169512388,20,'2025-05-01','2025-05-15'),(2,27348568408,21,'2025-05-03','2025-05-20'),(3,66044285839,22,'2025-05-10','2025-05-25');
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `idlivros` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) DEFAULT NULL,
  `titulo` varchar(45) NOT NULL,
  `ano` int DEFAULT NULL,
  `editora` varchar(45) NOT NULL,
  `data_registro` timestamp(6) NOT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`idlivros`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (17,'9788535914849','Dom Casmurro',1899,'Editora Globo','2026-05-28 22:46:50.000000',0),(18,'9788535932713','O Pequeno Príncipe',1943,'Agir','2026-05-28 22:46:50.000000',0),(19,'9788594318609','Harry Potter e a Pedra Filosofal',1997,'Rocco','2026-05-28 22:46:50.000000',0),(20,'9788535914849','Dom Casmurro',1899,'Editora Globo','2026-05-28 22:47:34.000000',1),(21,'9788535932713','O Pequeno Príncipe',1943,'Agir','2026-05-28 22:47:34.000000',2),(22,'9788594318609','Harry Potter e a Pedra Filosofal',1997,'Rocco','2026-05-28 22:47:34.000000',3),(23,'9788535914849','Dom Casmurro',1899,'Editora Globo','2026-05-28 22:47:45.000000',1),(24,'9788535932713','O Pequeno Príncipe',1943,'Agir','2026-05-28 22:47:45.000000',2),(25,'9788594318609','Harry Potter e a Pedra Filosofal',1997,'Rocco','2026-05-28 22:47:45.000000',3);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros_has_categoria`
--

DROP TABLE IF EXISTS `livros_has_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros_has_categoria` (
  `livros_idlivros` int NOT NULL,
  `categoria_codigo_categoria` int NOT NULL,
  PRIMARY KEY (`livros_idlivros`,`categoria_codigo_categoria`),
  KEY `fk_livros_has_categoria_categoria1_idx` (`categoria_codigo_categoria`),
  KEY `fk_livros_has_categoria_livros1_idx` (`livros_idlivros`),
  CONSTRAINT `fk_livros_has_categoria_categoria1` FOREIGN KEY (`categoria_codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`),
  CONSTRAINT `fk_livros_has_categoria_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros_has_categoria`
--

LOCK TABLES `livros_has_categoria` WRITE;
/*!40000 ALTER TABLE `livros_has_categoria` DISABLE KEYS */;
INSERT INTO `livros_has_categoria` VALUES (20,1),(21,2),(22,2);
/*!40000 ALTER TABLE `livros_has_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(55) NOT NULL,
  `senha` varchar(11) NOT NULL,
  `nascimento` date NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'39169512388','Theo Fernando Pi','theo_fernando_pires@zootecnista.com.br','W8ZWjJOQIG','1986-04-07','2026-05-28 22:35:32'),(2,'27348568408','Antônia Josefa C','antoniajosefacardoso@unink.com.br','cnUS610YXi','1988-05-03','2026-05-28 22:35:32'),(3,'66044285839','Pedro Vitor Rena','pedro_vitor_costa@riguetti.com.br','26GT1aUo9D','1963-04-22','2026-05-28 22:35:32'),(4,'77135781619','Iago Henrique Te','iago.henrique.teixeira@mastria.com.br','sCGTHcg1rw','1985-03-21','2026-05-28 22:35:32'),(5,'59194891389','Gael Levi Viana','gaelleviviana@demetriushairstudio.com.br','iN7Tx5gtyG','1960-05-20','2026-05-28 22:35:32');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-02 19:13:27
