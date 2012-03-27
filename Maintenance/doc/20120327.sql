-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: sharepointdemo
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Current Database: `sharepointdemo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sharepointdemo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sharepointdemo`;

--
-- Table structure for table `tb_incoming_tasks`
--

DROP TABLE IF EXISTS `tb_incoming_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_incoming_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `planned_date` datetime DEFAULT NULL,
  `assigned_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_report` varchar(500) DEFAULT NULL,
  `completion_approval` varchar(45) DEFAULT NULL,
  `reasons_suspicion` varchar(2000) DEFAULT NULL,
  `completionApproval` varchar(45) DEFAULT NULL,
  `reasonsSuspicion` varchar(200) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `instructions` varchar(2000) DEFAULT NULL,
  `report` varchar(2000) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `signature` varchar(200) DEFAULT NULL,
  `remark2` varchar(2000) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `approved` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `sign_to` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `remark3` varchar(2000) DEFAULT NULL,
  `remark4` varchar(2000) DEFAULT NULL,
  `process_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_incoming_tasks`
--

LOCK TABLES `tb_incoming_tasks` WRITE;
/*!40000 ALTER TABLE `tb_incoming_tasks` DISABLE KEYS */;
INSERT INTO `tb_incoming_tasks` VALUES (1,'Test','2012-02-20 00:00:00','2012-02-29 00:00:00',1,'test','test','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Test2','2012-02-28 00:00:00','2012-02-29 00:00:00',2,'Test2','Test2','Test2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Test3','2012-02-07 00:00:00','2012-02-23 00:00:00',1,'Test3','Test3','Test3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_incoming_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_knowledge_based`
--

DROP TABLE IF EXISTS `tb_knowledge_based`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_knowledge_based` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `solutions` varchar(2000) DEFAULT NULL,
  `solutions_doc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_knowledge_based`
--

LOCK TABLES `tb_knowledge_based` WRITE;
/*!40000 ALTER TABLE `tb_knowledge_based` DISABLE KEYS */;
INSERT INTO `tb_knowledge_based` VALUES (2,1,'test','','test','test','test');
/*!40000 ALTER TABLE `tb_knowledge_based` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info`
--

DROP TABLE IF EXISTS `tb_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info`
--

LOCK TABLES `tb_user_info` WRITE;
/*!40000 ALTER TABLE `tb_user_info` DISABLE KEYS */;
INSERT INTO `tb_user_info` VALUES (1,'admin','admin','admin',1),(2,'supervisor','supervisor','supervisor',2),(3,'technician','technician','technician',3),(4,'boss','boss','boss',4),(5,'test','test','test',1);
/*!40000 ALTER TABLE `tb_user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-27 23:49:35
