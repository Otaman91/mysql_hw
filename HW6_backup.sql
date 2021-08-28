-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_network
-- ------------------------------------------------------
-- Server version	8.0.26

drop database if exists social_network;
create database social_network;
use social_network;

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'2021-07-29 15:44:53',1),(2,'2021-07-29 15:44:53',1),(3,'2021-07-29 15:44:53',2),(4,'2021-07-29 15:44:53',2),(5,'2021-07-29 15:44:53',2),(6,'2021-07-29 15:44:53',3),(7,'2021-07-29 15:44:53',4),(8,'2021-07-29 15:44:53',4),(9,'2021-07-29 15:44:53',5),(10,'2021-07-29 15:44:53',6),(11,'2021-07-29 15:44:53',7),(12,'2021-07-29 15:44:53',8),(13,'2021-07-29 15:44:53',8),(14,'2021-07-29 15:44:53',9),(15,'2021-07-29 15:44:53',9),(16,'2021-07-29 15:44:53',10),(17,'2021-07-29 15:44:53',11),(18,'2021-07-29 15:44:53',11),(19,'2021-07-29 15:44:53',12),(20,'2021-07-29 15:44:53',12);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_text` text NOT NULL,
  `sender_id` int NOT NULL,
  `reciever_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sender_id`,`reciever_id`),
  KEY `idx_sender` (`sender_id`),
  KEY `idx_reciever` (`reciever_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`reciever_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES ('Hello!',1,2,'2021-07-29 15:44:53'),('How ya doing?',1,3,'2021-07-29 15:44:53'),('Sup man!',1,4,'2021-07-29 15:44:53'),('Hello!',2,1,'2021-07-29 15:44:53'),('How ya doing?',2,3,'2021-07-29 15:44:53'),('Sup man!',2,4,'2021-07-29 15:44:53'),('Hello',3,1,'2021-07-29 15:44:53'),('Hello',3,2,'2021-07-29 15:44:53'),('Hello',3,4,'2021-07-29 15:44:53'),('Hello',4,1,'2021-07-29 15:44:53'),('Hello',4,2,'2021-07-29 15:44:53'),('Hello',4,3,'2021-07-29 15:44:53'),('Hello',5,1,'2021-07-29 15:44:53'),('Hello',5,2,'2021-07-29 15:44:53'),('Hello',5,3,'2021-07-29 15:44:53');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'http://elijah.biz',1),(2,'https://shanon.org',1),(3,'http://vicky.biz',2),(4,'http://oleta.net',2),(5,'https://jennings.biz',3),(6,'https://quinn.biz',3),(7,'https://selina.name',4),(8,'http://malvina.org',4),(9,'https://branson.biz',5),(10,'https://lina.biz',5),(11,'https://darwin.net',6),(12,'https://aliyah.biz',6),(13,'http://euna.info',7),(14,'https://maymie.net',7),(15,'http://joanie.name',8),(16,'http://whitney.net',8),(17,'http://garrison.name',9),(18,'http://moses.biz',9),(19,'http://shannon.org',10),(20,'http://kendrick.net',10),(21,'https://carey.com',11),(22,'http://lia.biz',11),(23,'http://buddy.com',12),(24,'http://americo.biz',12);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kskkahh','2021-07-29 15:44:53'),(2,'danc1ng_rain','2021-07-29 15:44:53'),(3,'mirakroh','2021-07-29 15:44:53'),(4,'oliem','2021-07-29 15:44:53'),(5,'john__vanetti','2021-07-29 15:44:53'),(6,'ze_nixto777','2021-07-29 15:44:53'),(7,'voitik_tkd','2021-07-29 15:44:53'),(8,'soliadka','2021-07-29 15:44:53'),(9,'v_liskevich','2021-07-29 15:44:53'),(10,'hach_vl','2021-07-29 15:44:53'),(11,'andrii588','2021-07-29 15:44:53'),(12,'zak_91_32','2021-07-29 15:44:53');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 18:48:05
