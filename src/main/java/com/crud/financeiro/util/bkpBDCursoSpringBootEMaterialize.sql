-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: curso-spring-materialize
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `entidade`
--

DROP TABLE IF EXISTS `entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidade` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(60) NOT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `cpf_ou_cnpj` varchar(20) NOT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `endereco` varchar(80) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidade`
--

LOCK TABLES `entidade` WRITE;
/*!40000 ALTER TABLE `entidade` DISABLE KEYS */;
INSERT INTO `entidade` VALUES (1,'Bairro teste','Petrolina','000000000000','daniel.teste@email.com','Rua teste','PE','Daniel ','000000'),(2,'rr','Petrolina','88888','email@email.com','rrr','PE','João','999');
/*!40000 ALTER TABLE `entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pagamento`
--

DROP TABLE IF EXISTS `tipo_de_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_pagamento` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pagamento`
--

LOCK TABLES `tipo_de_pagamento` WRITE;
/*!40000 ALTER TABLE `tipo_de_pagamento` DISABLE KEYS */;
INSERT INTO `tipo_de_pagamento` VALUES (1,'Boleto'),(2,'Cheque'),(3,'Cartão de Débito'),(4,'Desconto em Folha'),(5,'Cartão de Crédito'),(6,'teste');
/*!40000 ALTER TABLE `tipo_de_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipode_de_pagamento`
--

DROP TABLE IF EXISTS `tipode_de_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipode_de_pagamento` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipode_de_pagamento`
--

LOCK TABLES `tipode_de_pagamento` WRITE;
/*!40000 ALTER TABLE `tipode_de_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipode_de_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_de_emissao` datetime DEFAULT NULL,
  `data_de_validade` datetime NOT NULL,
  `data_do_pagamento` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) NOT NULL,
  `valor_original` decimal(19,2) DEFAULT NULL,
  `valor_pago` decimal(19,2) DEFAULT NULL,
  `entidade_id` bigint(20) DEFAULT NULL,
  `tipo_de_pagamento_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK4sji7l2ssx53wv8kkg3n9c7n8` (`entidade_id`),
  KEY `FKior59uxfmshiwv3n2xtpk05ii` (`tipo_de_pagamento_id`),
  CONSTRAINT `FK4sji7l2ssx53wv8kkg3n9c7n8` FOREIGN KEY (`entidade_id`) REFERENCES `entidade` (`codigo`),
  CONSTRAINT `FKior59uxfmshiwv3n2xtpk05ii` FOREIGN KEY (`tipo_de_pagamento_id`) REFERENCES `tipo_de_pagamento` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
INSERT INTO `titulo` VALUES (2,'2017-10-19 21:36:08','2017-10-19 00:00:00','2017-10-19 00:00:00','teste','COMPENSADO','SAIDA',99.00,99.00,99.00,1,2),(5,'2017-10-23 20:36:52','2017-10-23 00:00:00','2017-10-23 00:00:00','dddd','COMPENSADO','ENTRADA',100.00,100.00,100.00,1,1);
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-17  9:43:02
