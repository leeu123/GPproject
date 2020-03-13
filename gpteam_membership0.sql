-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: gpteam
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `membership` (
  `id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `nick` varchar(30) CHARACTER SET utf8 NOT NULL,
  `pw` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `pwhint` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `pwa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `age` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `postnum` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `home` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `dethome` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `cell` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`,`nick`),
  UNIQUE KEY `nick_UNIQUE` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES ('dlwlrma0516','dlwlrma','smrmaka1!','본인의 보물1호','돈','이세호','남자','940908','cherish_0908@naver.com','17367','경기 이천시 영창로124번길 8','2층','01030049753'),('leeu123','몽몽','ckdgus123!@#','본인의 보물1호','가족','이창현','남자','19910907','leeu7916@naver.com','14625','경기 부천시 상동 323-13','501호','01033947217'),('leeu7916','파티파티','ckdgus1234!','본인의 보물1호','가족','이창현','남자','19910907','leeu7916@naver.com','14625','경기 부천시 상동 323-13','정화홈타운 501호','01033947217'),('nicu0309','킴상민','aaaaaa123!','본인의 보물1호','나','김상민','남자','920630','goodtkdals@naver.com','18486','경기 화성시 동탄대로12길 17','1805동 204호','01046088714');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-13 17:29:08
