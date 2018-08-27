-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: customizablesys
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123'),(2,'ww','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classinfo`
--

DROP TABLE IF EXISTS `classinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classno` varchar(45) DEFAULT NULL,
  `classname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classinfo`
--

LOCK TABLES `classinfo` WRITE;
/*!40000 ALTER TABLE `classinfo` DISABLE KEYS */;
INSERT INTO `classinfo` VALUES (2,'151401','15计科1'),(3,'151402','15计科2'),(4,'151501','15网络1'),(5,'151502','15网络2');
/*!40000 ALTER TABLE `classinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` varchar(45) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'1','Android'),(2,'2','概率论'),(3,'3','模电'),(10,'11','计算机网络'),(11,'12','C语言'),(12,'13','C++');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseplan`
--

DROP TABLE IF EXISTS `courseplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_id` int(11) DEFAULT NULL,
  `classinfo_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `adminTermsId_idx` (`terms_id`),
  KEY `adminClassinfoId_idx` (`classinfo_id`),
  KEY `adminCourseId_idx` (`course_id`),
  KEY `adminTId_idx` (`teacher_id`),
  CONSTRAINT `adminClassinfoId` FOREIGN KEY (`classinfo_id`) REFERENCES `classinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminCourseId` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminTId` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminTermsId` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseplan`
--

LOCK TABLES `courseplan` WRITE;
/*!40000 ALTER TABLE `courseplan` DISABLE KEYS */;
INSERT INTO `courseplan` VALUES (1,1,2,1,1),(2,2,2,2,2),(3,1,3,1,1),(4,1,4,1,1),(5,1,5,1,1),(6,2,3,2,2),(7,2,4,2,2),(8,2,5,2,2),(9,3,2,3,3),(10,3,3,3,3),(11,3,4,3,3),(13,3,2,1,2),(14,3,3,1,2),(15,3,4,1,2),(16,3,5,1,2),(17,1,3,1,12);
/*!40000 ALTER TABLE `courseplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnav`
--

DROP TABLE IF EXISTS `fnav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnav`
--

LOCK TABLES `fnav` WRITE;
/*!40000 ALTER TABLE `fnav` DISABLE KEYS */;
INSERT INTO `fnav` VALUES (1,'中心概括'),(2,'教学资源'),(3,'成果转化'),(4,'校企合作'),(5,'师资队伍'),(6,'管理体系'),(7,'资源共享'),(8,'环境设备'),(9,'申报材料');
/*!40000 ALTER TABLE `fnav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `githubshiyandate`
--

DROP TABLE IF EXISTS `githubshiyandate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `githubshiyandate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) DEFAULT NULL,
  `Number` varchar(45) DEFAULT NULL,
  `IssueNumber` int(11) DEFAULT NULL,
  `IssueCount` int(11) DEFAULT NULL,
  `IssueLabels` varchar(45) DEFAULT NULL,
  `Events` int(11) DEFAULT NULL,
  `FirstTime` varchar(45) DEFAULT NULL,
  `Pulls` int(11) DEFAULT NULL,
  `Commits` int(11) DEFAULT NULL,
  `Additions` int(11) DEFAULT NULL,
  `Deletions` int(11) DEFAULT NULL,
  `ChangedFiles` int(11) DEFAULT NULL,
  `Comments` int(11) DEFAULT NULL,
  `ReviewComments` int(11) DEFAULT NULL,
  `reposname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `githubshiyandate`
--

LOCK TABLES `githubshiyandate` WRITE;
/*!40000 ALTER TABLE `githubshiyandate` DISABLE KEYS */;
INSERT INTO `githubshiyandate` VALUES (1,'invalid-email-address','1514080901207',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(2,'KuhnHuge','1514080901236',47,1,'有点意思',12,'2017-10-28T14:09:06Z',6,8,1138,330,64,0,0,NULL),(3,'adcGG','1514080901204',128,1,'',11,'2017-10-29T03:16:56Z',10,11,964,78,45,0,0,NULL),(4,'cs2JeX','1514080901203',92,1,'',12,'2017-10-26T01:48:24Z',6,8,847,464,65,1,0,NULL),(5,'panweil','1514080901123',23,1,'',15,'2017-10-26T01:04:11Z',8,12,2138,121,367,5,0,NULL),(6,'zhanquan','README.md',68,1,'',13,'2017-10-26T04:42:17Z',9,13,541,32,48,0,0,NULL),(7,'Gracesa','1514080901238',18,1,'',13,'2017-10-27T03:14:07Z',8,8,1582,222,67,1,0,NULL),(8,'Yangjiawei864','1514080901237',115,1,'',9,'2017-11-08T16:12:41Z',6,11,1563,712,81,2,0,NULL),(9,'DanielLif','1514080901112',149,1,'',2,'2017-10-29T15:50:52Z',1,1,227,0,12,0,0,NULL),(10,'zclsm','1512070501138',175,1,'有点意思',8,'2017-11-01T10:49:46Z',5,4,647,110,27,2,0,NULL),(11,'a13669586274','1514080901216',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(12,'ZHIHAOC','1514080901105',29,1,'',8,'2017-10-26T01:25:18Z',9,2,25,0,1,2,0,NULL),(13,'zhanghuihong','1514080901239',64,1,'有点意思',2,'2017-11-01T15:05:57Z',1,1,227,0,12,0,0,NULL),(14,'huangmaoliu','1514080901232',72,1,'有点意思',7,'2017-11-01T10:46:25Z',10,3,53,8,10,0,0,NULL),(15,'lzhxh','1514080901218',101,1,'有点意思',13,'2017-10-26T05:05:57Z',6,10,2361,360,148,2,0,NULL),(16,'tanyuhao','1514080901125',28,1,'有点意思',10,'2017-10-27T00:21:59Z',10,5,192,63,13,1,0,NULL),(17,'CCGyyn','1514080901201',79,1,'有点意思',14,'2017-10-26T09:22:02Z',7,9,1242,133,48,1,0,NULL),(18,'hhhhjq','1514080901211',102,1,'有点意思',13,'2017-10-26T05:39:56Z',6,11,876,223,45,2,0,NULL),(19,'CchenWX','1514080901207',57,1,'有点意思',18,'2017-10-27T02:16:50Z',5,18,1350,691,84,0,0,NULL),(20,'a505407658','1507070201123',40,1,'',17,'2017-10-29T10:51:17Z',9,16,984,610,66,0,0,NULL),(21,'susuk','null',122,1,'',0,'',0,0,0,0,0,0,0,NULL),(22,'haloha355','1513071001110',22,1,'',10,'2017-10-27T00:22:58Z',12,1,1500,871,69,3,0,NULL),(23,'AllenMinD','1514080901122',9,1,'有点意思',23,'2017-10-26T00:45:24Z',10,20,3826,458,100,1,0,NULL),(24,'DragonTeng','1514080901120',25,1,'',12,'2017-10-26T01:14:41Z',7,10,1868,617,99,0,0,NULL),(25,'zhengsongmiao','1514080901137',37,1,'有点意思',8,'2017-10-29T03:18:36Z',9,4,331,124,31,0,0,NULL),(26,'yuezhudxw','1514080901108',59,1,'',10,'2017-10-29T13:10:18Z',5,6,590,92,40,0,0,NULL),(27,'[ldy12347]','1514080901118',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(28,'Buruiwen','1509081602501',54,2,'',6,'2017-10-29T03:18:23Z',10,0,0,0,0,0,0,NULL),(29,'Emiya-Kiritsugu','1514080901202',45,1,'',10,'2017-10-29T11:53:01Z',6,11,800,99,50,0,0,NULL),(30,'cuteboyjun','1514080901231',154,1,'',13,'2017-10-29T04:10:06Z',8,8,528,105,26,2,0,NULL),(31,'laijunqiang','1514080901216',65,1,'',8,'2017-10-29T03:15:48Z',8,5,139,2,11,0,0,NULL),(32,'Reubon','1514080901225',93,1,'有点意思',14,'2017-10-29T12:31:05Z',8,15,902,262,62,1,0,NULL),(33,'Your Name','1514080901238',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(34,'hzucyc','1514080901103',34,1,'',26,'2017-10-26T05:12:08Z',12,24,744,97,72,4,0,NULL),(35,'unknown','1514080901135',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(36,'Sephlroth','1514080901121',70,1,'',12,'2017-10-26T04:07:08Z',7,8,1343,191,74,3,0,NULL),(37,'shawXXQ','1514080901234',46,1,'有点意思',12,'2017-10-26T01:12:57Z',6,13,670,100,48,1,0,NULL),(38,'ShadowWarLock','1514080901117',26,1,'',19,'2017-10-26T00:54:25Z',8,27,710,279,71,0,0,NULL),(39,'fengdejiyi712','1514080901222',36,1,'',17,'2017-10-26T04:51:29Z',8,13,600,107,32,0,0,NULL),(40,'hytwork2017','1513071001110',188,1,'有点意思',14,'2017-10-30T12:44:57Z',6,8,709,275,52,0,0,NULL),(41,'YJJJack','1514080901132',90,1,'',15,'2017-10-26T01:43:24Z',12,12,2674,1042,99,1,0,NULL),(42,'Girlsmile','1514080901208',194,1,'',10,'2017-11-01T13:54:27Z',6,9,1127,0,40,0,0,NULL),(43,'Hfenru','1514080901109',14,1,'',12,'2017-10-26T04:08:03Z',6,6,521,186,24,0,0,NULL),(44,'czxuyixin','1514080901129',24,1,'',15,'2017-10-26T01:26:09Z',8,8,1666,1342,309,0,0,NULL),(45,'teajoy','1514080901210',48,1,'',9,'2017-10-27T00:21:01Z',8,3,416,0,15,4,0,NULL),(46,'ZjChenyk','1514080901104',63,1,'有点意思',16,'2017-10-26T08:45:42Z',6,18,6935,0,199,0,0,NULL),(47,'bigbigban','1514080901224',184,1,'',10,'2017-11-08T14:06:31Z',6,7,670,173,27,0,0,NULL),(48,'Dlezai','1514080901107',21,1,'有点意思',12,'2017-10-26T09:34:39Z',8,9,895,274,28,0,0,NULL),(49,'yug116','1514080901233',49,1,'',9,'2017-10-26T04:00:24Z',4,5,698,96,53,1,0,NULL),(50,'[Leezxy]','1514080901110',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(51,'wazhuroujuan','1514080901134',174,1,'',11,'2017-10-29T14:38:38Z',11,5,538,303,20,5,0,NULL),(52,'Moxiuzhu','README.md',11,1,'',15,'2017-10-26T01:24:33Z',9,11,720,41,45,0,0,NULL),(53,'879579620','1514080901229',10,1,'',14,'2017-10-26T05:07:44Z',6,14,1630,443,74,1,0,NULL),(54,'MercyMo','1514080901106',61,1,'',13,'2017-10-26T01:00:01Z',9,9,843,96,42,3,0,NULL),(55,'lautnerk','1514080901206',150,1,'',11,'2017-10-29T03:18:56Z',9,6,390,40,24,0,0,NULL),(56,'FFFfire666','1514080901128',82,1,'有点意思',19,'2017-10-26T05:01:10Z',8,14,1094,216,51,5,0,NULL),(57,'yangzhenye','1514080901130',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(58,'hongxiangliu','1514080901119',27,2,'',7,'2017-10-26T23:58:32Z',11,1,21,2,2,1,0,NULL),(59,'hzuzkt','1514080901135',88,1,'有点意思',21,'2017-10-26T01:37:44Z',9,20,5104,4076,247,3,0,NULL),(60,'lizhoupeng','1514080901113',33,1,'',16,'2017-10-26T01:30:19Z',8,11,936,271,76,0,0,NULL),(61,'zengsn','null',6,6,'实验',28,'2017-12-05T11:52:28Z',4,4,4647,1525,150,0,0,NULL),(62,'huangrenzhong','1514080901212',99,1,'',4,'2017-10-29T16:30:11Z',1,1,228,0,13,0,0,NULL),(63,'zhouzech','1506081301243',78,1,'',10,'2017-10-30T13:27:28Z',5,5,904,535,82,0,0,NULL),(64,'EricNKC','1514080901226',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(65,'xwh19970511','1513071002132',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(66,'wonderful12345','1514080901132',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(67,'TBAatrox','1514080901133',161,1,'有点意思',12,'2017-10-29T12:18:12Z',7,24,780,95,43,1,0,NULL),(68,'pig-w','README.md1',89,1,'',9,'2017-10-29T03:16:18Z',11,6,241,0,8,1,0,NULL),(69,'xukaitian','1506081301236',177,1,'',13,'2017-10-30T05:54:13Z',7,10,1730,80,83,0,0,NULL),(70,'Leon-star','1514080901240',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(71,'miamiluo96','1512120901132',329,1,'',2,'2017-11-15T13:14:18Z',1,1,228,0,12,0,0,NULL),(72,'sk-2017','1514080901228',62,1,'有点意思',13,'2017-10-26T14:13:54Z',7,13,875,75,41,0,0,NULL),(73,'351655914','1514080901116',38,1,'',10,'2017-10-26T04:07:48Z',6,5,481,139,14,0,0,NULL),(74,'xwh511','1513071002132',16,1,'有点意思',13,'2017-10-26T01:37:30Z',8,13,1174,38,54,2,0,NULL),(75,'ZhiHu-ZheYe','1514080901138',30,2,'有点意思',4,'2017-10-30T04:27:40Z',2,2,401,74,14,0,0,NULL),(76,'1369949044','1514080901130',32,1,'有点意思',14,'2017-10-28T15:58:41Z',8,9,437,141,34,0,0,NULL),(77,'chasel34','list.md',15,1,'',9,'2017-10-26T00:53:20Z',7,8,688,146,28,0,0,NULL),(78,'MuZiL1','1514080901217',53,1,'',7,'2017-11-01T10:45:40Z',9,5,152,0,4,0,0,NULL),(79,'252492046','1514080901213',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(80,'NumenJamila','1514080901101',35,1,'',10,'2017-10-29T03:16:40Z',11,6,1013,233,18,2,0,NULL),(81,'JIZHILING','1514080901214',55,1,'',6,'2017-11-01T10:47:12Z',10,1,267,232,15,2,0,NULL),(82,'leon0723','1514080901240',58,1,'',10,'2017-10-30T04:21:25Z',4,6,1280,61,25,2,0,NULL),(83,'linhaohong','1514080901115',95,1,'',10,'2017-10-26T01:48:48Z',6,7,847,15,31,0,0,NULL),(84,'YanRuan','1514080901114',20,1,'',12,'2017-10-26T01:20:14Z',6,14,1423,479,81,0,0,NULL),(85,'guorunlin','1514080901209',130,1,'有点意思',13,'2017-10-27T02:01:25Z',8,13,832,33,32,0,0,NULL),(86,'lwYU','1514080901111',157,1,'有点意思',10,'2017-10-29T10:36:16Z',7,8,785,40,36,1,0,NULL),(87,'mmpmvpvip','1514080901226',50,1,'',13,'2017-10-29T11:48:16Z',6,7,826,24,36,0,0,NULL),(88,'BrightLee121','1513071001116',42,1,'',10,'2017-10-26T07:28:45Z',5,6,930,98,38,1,0,NULL),(89,'panxiaomian','1514080901223',19,1,'',13,'2017-10-26T01:43:33Z',8,8,1385,185,28,0,0,NULL),(90,'Leezxy','1514080901110',166,1,'有点意思',13,'2017-10-29T13:06:57Z',5,7,387,34,27,0,0,NULL),(91,'wmingl','1513071001131',75,1,'有点意思',15,'2017-10-30T12:53:09Z',8,12,719,135,47,0,0,NULL),(92,'Zein-36','1514080901136',39,1,'',11,'2017-10-26T04:40:40Z',6,6,876,169,53,0,0,NULL),(93,'ldy12347','1513071001110',73,1,'',11,'2017-10-26T13:29:08Z',8,14,1653,84,74,0,0,NULL),(94,'wagez','1514080901140',13,1,'有点意思',11,'2017-10-26T04:07:23Z',6,11,340,186,7,0,0,NULL),(95,'sunlightcold','1514080901205',41,1,'',8,'2017-10-27T00:19:28Z',11,1,889,271,28,6,0,NULL),(96,'zhongting','1514080901139',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(97,'jia-forest','1514080901220',52,1,'',4,'2017-10-29T12:46:11Z',2,2,505,2,23,0,0,NULL),(98,'lanehunter','1514080901215',56,1,'',10,'2017-11-04T23:59:19Z',20,6,1302,79,14,1,0,NULL),(99,'JMLUO','1514080901127',12,1,'',14,'2017-10-26T01:05:34Z',8,11,1096,95,66,1,0,NULL),(100,'莫秀珠','1514080901221',0,0,'',0,'',0,0,0,0,0,0,0,NULL),(101,'hongdi178','1507070201226',17,1,'有点意思',8,'2017-10-26T23:57:23Z',7,5,97,15,8,1,0,NULL);
/*!40000 ALTER TABLE `githubshiyandate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hzu131001`
--

DROP TABLE IF EXISTS `hzu131001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hzu131001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) DEFAULT NULL,
  `Num` varchar(45) DEFAULT NULL,
  `IssueNumber` int(11) DEFAULT NULL,
  `IssueCount` int(11) DEFAULT NULL,
  `IssueLabels` varchar(45) DEFAULT NULL,
  `Events` int(11) DEFAULT NULL,
  `FirstTime` varchar(45) DEFAULT NULL,
  `Pulls` int(11) DEFAULT NULL,
  `Commits` int(11) DEFAULT NULL,
  `Additions` int(11) DEFAULT NULL,
  `Deletions` int(11) DEFAULT NULL,
  `ChangedFiles` int(11) DEFAULT NULL,
  `Comments` int(11) DEFAULT NULL,
  `ReviewComments` int(11) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `proj` varchar(100) DEFAULT NULL,
  `terms_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hzu131001`
--

LOCK TABLES `hzu131001` WRITE;
/*!40000 ALTER TABLE `hzu131001` DISABLE KEYS */;
/*!40000 ALTER TABLE `hzu131001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexshow`
--

DROP TABLE IF EXISTS `indexshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `footer_name` varchar(45) DEFAULT NULL,
  `footer_Addr` varchar(255) DEFAULT NULL,
  `bgColor` varchar(45) DEFAULT NULL,
  `wordColor` varchar(45) DEFAULT NULL,
  `logoPath` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexshow`
--

LOCK TABLES `indexshow` WRITE;
/*!40000 ALTER TABLE `indexshow` DISABLE KEYS */;
INSERT INTO `indexshow` VALUES (1,'url(/allProjUpload/customizableSys/LogoImage/banner.jpg)','惠州学院虚拟仿真教学实验室','惠州学院','惠州市惠城区演达大道46号','darkred','#ffffff',NULL);
/*!40000 ALTER TABLE `indexshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reposdate`
--

DROP TABLE IF EXISTS `reposdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reposdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) DEFAULT NULL,
  `Num` varchar(45) DEFAULT NULL,
  `IssueNumber` int(11) DEFAULT NULL,
  `IssueCount` int(11) DEFAULT NULL,
  `IssueLabels` varchar(45) DEFAULT NULL,
  `Events` int(11) DEFAULT NULL,
  `FirstTime` varchar(45) DEFAULT NULL,
  `Pulls` int(11) DEFAULT NULL,
  `Commits` int(11) DEFAULT NULL,
  `Additions` int(11) DEFAULT NULL,
  `Deletions` int(11) DEFAULT NULL,
  `ChangedFiles` int(11) DEFAULT NULL,
  `Comments` int(11) DEFAULT NULL,
  `ReviewComments` int(11) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `proj` varchar(100) DEFAULT NULL,
  `terms_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reposdate`
--

LOCK TABLES `reposdate` WRITE;
/*!40000 ALTER TABLE `reposdate` DISABLE KEYS */;
INSERT INTO `reposdate` VALUES (1,'CchenWX','1514080901207',57,1,'有点意思',18,'2017-10-27T02:16:50Z',5,18,1350,691,84,0,0,'hzuapps','web-wechat-2017',1,1,83),(2,'KuhnHuge','1514080901236',47,1,'有点意思',12,'2017-10-28T14:09:06Z',6,8,1138,330,64,0,0,'hzuapps','web-wechat-2017',1,1,90),(3,'adcGG','1514080901204',128,1,'',11,'2017-10-29T03:16:56Z',10,11,964,78,45,0,0,'hzuapps','web-wechat-2017',1,1,90),(4,'cs2JeX','1514080901203',92,1,'',12,'2017-10-26T01:48:24Z',6,8,847,464,65,1,0,'hzuapps','web-wechat-2017',1,1,100),(5,'panweil','1514080901123',23,1,'',15,'2017-10-26T01:04:11Z',8,12,2138,121,367,5,0,'hzuapps','web-wechat-2017',1,1,100),(6,'Moxiuzhu','README.md',11,1,'',15,'2017-10-26T01:24:33Z',9,11,720,41,45,0,0,'hzuapps','web-wechat-2017',1,1,90),(7,'Your Name','1514080901238',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(8,'Yangjiawei864','1514080901237',115,1,'',9,'2017-11-08T16:12:41Z',6,11,1563,712,81,2,0,'hzuapps','web-wechat-2017',1,1,100),(9,'DanielLif','1514080901112',149,1,'',2,'2017-10-29T15:50:52Z',1,1,227,0,12,0,0,'hzuapps','web-wechat-2017',1,1,23),(10,'zclsm','1512070501138',175,1,'有点意思',8,'2017-11-01T10:49:46Z',5,4,647,110,27,2,0,'hzuapps','web-wechat-2017',1,1,80),(11,'laijunqiang','1514080901216',65,1,'',8,'2017-10-29T03:15:48Z',8,5,139,2,11,0,0,'hzuapps','web-wechat-2017',1,1,83),(12,'ZHIHAOC','1514080901105',29,1,'',8,'2017-10-26T01:25:18Z',9,2,25,0,1,2,0,'hzuapps','web-wechat-2017',1,1,65),(13,'zhanghuihong','1514080901239',64,1,'有点意思',2,'2017-11-01T15:05:57Z',1,1,227,0,12,0,0,'hzuapps','web-wechat-2017',1,1,23),(14,'huangmaoliu','1514080901232',72,1,'有点意思',7,'2017-11-01T10:46:25Z',10,3,53,8,10,0,0,'hzuapps','web-wechat-2017',1,1,70),(15,'lzhxh','1514080901218',101,1,'有点意思',13,'2017-10-26T05:05:57Z',6,10,2361,360,148,2,0,'hzuapps','web-wechat-2017',1,1,100),(16,'tanyuhao','1514080901125',28,1,'有点意思',10,'2017-10-27T00:21:59Z',10,5,192,63,13,1,0,'hzuapps','web-wechat-2017',1,1,93),(17,'CCGyyn','1514080901201',79,1,'有点意思',14,'2017-10-26T09:22:02Z',7,9,1242,133,48,1,0,'hzuapps','web-wechat-2017',1,1,100),(18,'hhhhjq','1514080901211',102,1,'有点意思',13,'2017-10-26T05:39:56Z',6,11,876,223,45,2,0,'hzuapps','web-wechat-2017',1,1,100),(19,'a505407658','1507070201123',40,1,'',17,'2017-10-29T10:51:17Z',9,16,984,610,66,0,0,'hzuapps','web-wechat-2017',1,1,90),(20,'zengsn','null',6,6,'实验',28,'2017-12-05T11:52:28Z',4,4,4647,1525,150,0,0,'hzuapps','web-wechat-2017',1,1,63),(21,'ldy12347','1513071001110',73,1,'',11,'2017-10-26T13:29:08Z',8,14,1653,84,74,0,0,'hzuapps','web-wechat-2017',1,1,90),(22,'AllenMinD','1514080901122',9,1,'有点意思',23,'2017-10-26T00:45:24Z',10,20,3826,458,100,1,0,'hzuapps','web-wechat-2017',1,1,100),(23,'DragonTeng','1514080901120',25,1,'',12,'2017-10-26T01:14:41Z',7,10,1868,617,99,0,0,'hzuapps','web-wechat-2017',1,1,90),(24,'zhengsongmiao','1514080901137',37,1,'有点意思',8,'2017-10-29T03:18:36Z',9,4,331,124,31,0,0,'hzuapps','web-wechat-2017',1,1,76),(25,'yuezhudxw','1514080901108',59,1,'',10,'2017-10-29T13:10:18Z',5,6,590,92,40,0,0,'hzuapps','web-wechat-2017',1,1,83),(26,'[ldy12347]','1514080901118',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(27,'Buruiwen','1509081602501',54,2,'',6,'2017-10-29T03:18:23Z',10,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,40),(28,'Emiya-Kiritsugu','1514080901202',45,1,'',10,'2017-10-29T11:53:01Z',6,11,800,99,50,0,0,'hzuapps','web-wechat-2017',1,1,90),(29,'cuteboyjun','1514080901231',154,1,'',13,'2017-10-29T04:10:06Z',8,8,528,105,26,2,0,'hzuapps','web-wechat-2017',1,1,100),(30,'Reubon','1514080901225',93,1,'有点意思',14,'2017-10-29T12:31:05Z',8,15,902,262,62,1,0,'hzuapps','web-wechat-2017',1,1,100),(31,'hzucyc','1514080901103',34,1,'',26,'2017-10-26T05:12:08Z',12,24,744,97,72,4,0,'hzuapps','web-wechat-2017',1,1,100),(32,'hzuzkt','1514080901135',88,1,'有点意思',21,'2017-10-26T01:37:44Z',9,20,5104,4076,247,3,0,'hzuapps','web-wechat-2017',1,1,100),(33,'Sephlroth','1514080901121',70,1,'',12,'2017-10-26T04:07:08Z',7,8,1343,191,74,3,0,'hzuapps','web-wechat-2017',1,1,100),(34,'shawXXQ','1514080901234',46,1,'有点意思',12,'2017-10-26T01:12:57Z',6,13,670,100,48,1,0,'hzuapps','web-wechat-2017',1,1,100),(35,'ShadowWarLock','1514080901117',26,1,'',19,'2017-10-26T00:54:25Z',8,27,710,279,71,0,0,'hzuapps','web-wechat-2017',1,1,90),(36,'fengdejiyi712','1514080901222',36,1,'',17,'2017-10-26T04:51:29Z',8,13,600,107,32,0,0,'hzuapps','web-wechat-2017',1,1,90),(37,'wonderful12345','1514080901132',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(38,'Girlsmile','1514080901208',194,1,'',10,'2017-11-01T13:54:27Z',6,9,1127,0,40,0,0,'hzuapps','web-wechat-2017',1,1,90),(39,'Hfenru','1514080901109',14,1,'',12,'2017-10-26T04:08:03Z',6,6,521,186,24,0,0,'hzuapps','web-wechat-2017',1,1,90),(40,'czxuyixin','1514080901129',24,1,'',15,'2017-10-26T01:26:09Z',8,8,1666,1342,309,0,0,'hzuapps','web-wechat-2017',1,1,90),(41,'teajoy','1514080901210',48,1,'',9,'2017-10-27T00:21:01Z',8,3,416,0,15,4,0,'hzuapps','web-wechat-2017',1,1,80),(42,'ZjChenyk','1514080901104',63,1,'有点意思',16,'2017-10-26T08:45:42Z',6,18,6935,0,199,0,0,'hzuapps','web-wechat-2017',1,1,90),(43,'bigbigban','1514080901224',184,1,'',10,'2017-11-08T14:06:31Z',6,7,670,173,27,0,0,'hzuapps','web-wechat-2017',1,1,90),(44,'Dlezai','1514080901107',21,1,'有点意思',12,'2017-10-26T09:34:39Z',8,9,895,274,28,0,0,'hzuapps','web-wechat-2017',1,1,90),(45,'yug116','1514080901233',49,1,'',9,'2017-10-26T04:00:24Z',4,5,698,96,53,1,0,'hzuapps','web-wechat-2017',1,1,80),(46,'Leezxy','1514080901110',166,1,'有点意思',13,'2017-10-29T13:06:57Z',5,7,387,34,27,0,0,'hzuapps','web-wechat-2017',1,1,83),(47,'wazhuroujuan','1514080901134',174,1,'',11,'2017-10-29T14:38:38Z',11,5,538,303,20,5,0,'hzuapps','web-wechat-2017',1,1,93),(48,'879579620','1514080901229',10,1,'',14,'2017-10-26T05:07:44Z',6,14,1630,443,74,1,0,'hzuapps','web-wechat-2017',1,1,100),(49,'MercyMo','1514080901106',61,1,'',13,'2017-10-26T01:00:01Z',9,9,843,96,42,3,0,'hzuapps','web-wechat-2017',1,1,100),(50,'lautnerk','1514080901206',150,1,'',11,'2017-10-29T03:18:56Z',9,6,390,40,24,0,0,'hzuapps','web-wechat-2017',1,1,90),(51,'FFFfire666','1514080901128',82,1,'有点意思',19,'2017-10-26T05:01:10Z',8,14,1094,216,51,5,0,'hzuapps','web-wechat-2017',1,1,100),(52,'1369949044','1514080901130',32,1,'有点意思',14,'2017-10-28T15:58:41Z',8,9,437,141,34,0,0,'hzuapps','web-wechat-2017',1,1,90),(53,'hongxiangliu','1514080901119',27,2,'',7,'2017-10-26T23:58:32Z',11,1,21,2,2,1,0,'hzuapps','web-wechat-2017',1,1,60),(54,'lizhoupeng','1514080901113',33,1,'',16,'2017-10-26T01:30:19Z',8,11,936,271,76,0,0,'hzuapps','web-wechat-2017',1,1,90),(55,'huangrenzhong','1514080901212',99,1,'',4,'2017-10-29T16:30:11Z',1,1,228,0,13,0,0,'hzuapps','web-wechat-2017',1,1,23),(56,'zhouzech','1506081301243',78,1,'',10,'2017-10-30T13:27:28Z',5,5,904,535,82,0,0,'hzuapps','web-wechat-2017',1,1,76),(57,'mmpmvpvip','1514080901226',50,1,'',13,'2017-10-29T11:48:16Z',6,7,826,24,36,0,0,'hzuapps','web-wechat-2017',1,1,90),(58,'xwh511','1513071002132',16,1,'有点意思',13,'2017-10-26T01:37:30Z',8,13,1174,38,54,2,0,'hzuapps','web-wechat-2017',1,1,100),(59,'TBAatrox','1514080901133',161,1,'有点意思',12,'2017-10-29T12:18:12Z',7,24,780,95,43,1,0,'hzuapps','web-wechat-2017',1,1,100),(60,'pig-w','README.md1',89,1,'',9,'2017-10-29T03:16:18Z',11,6,241,0,8,1,0,'hzuapps','web-wechat-2017',1,1,100),(61,'xukaitian','1506081301236',177,1,'',13,'2017-10-30T05:54:13Z',7,10,1730,80,83,0,0,'hzuapps','web-wechat-2017',1,1,90),(62,'leon0723','1514080901240',58,1,'',10,'2017-10-30T04:21:25Z',4,6,1280,61,25,2,0,'hzuapps','web-wechat-2017',1,1,86),(63,'miamiluo96','1512120901132',329,1,'',2,'2017-11-15T13:14:18Z',1,1,228,0,12,0,0,'hzuapps','web-wechat-2017',1,1,23),(64,'sk-2017','1514080901228',62,1,'有点意思',13,'2017-10-26T14:13:54Z',7,13,875,75,41,0,0,'hzuapps','web-wechat-2017',1,1,90),(65,'351655914','1514080901116',38,1,'',10,'2017-10-26T04:07:48Z',6,5,481,139,14,0,0,'hzuapps','web-wechat-2017',1,1,83),(66,'ZhiHu-ZheYe','1514080901138',30,2,'有点意思',4,'2017-10-30T04:27:40Z',2,2,401,74,14,0,0,'hzuapps','web-wechat-2017',1,1,36),(67,'chasel34','list.md',15,1,'',9,'2017-10-26T00:53:20Z',7,8,688,146,28,0,0,'hzuapps','web-wechat-2017',1,1,90),(68,'MuZiL1','1514080901217',53,1,'',7,'2017-11-01T10:45:40Z',9,5,152,0,4,0,0,'hzuapps','web-wechat-2017',1,1,80),(69,'252492046','1514080901213',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(70,'NumenJamila','1514080901101',35,1,'',10,'2017-10-29T03:16:40Z',11,6,1013,233,18,2,0,'hzuapps','web-wechat-2017',1,1,100),(71,'JIZHILING','1514080901214',55,1,'',6,'2017-11-01T10:47:12Z',10,1,267,232,15,2,0,'hzuapps','web-wechat-2017',1,1,66),(72,'linhaohong','1514080901115',95,1,'',10,'2017-10-26T01:48:48Z',6,7,847,15,31,0,0,'hzuapps','web-wechat-2017',1,1,90),(73,'YanRuan','1514080901114',20,1,'',12,'2017-10-26T01:20:14Z',6,14,1423,479,81,0,0,'hzuapps','web-wechat-2017',1,1,90),(74,'guorunlin','1514080901209',130,1,'有点意思',13,'2017-10-27T02:01:25Z',8,13,832,33,32,0,0,'hzuapps','web-wechat-2017',1,1,90),(75,'lwYU','1514080901111',157,1,'有点意思',10,'2017-10-29T10:36:16Z',7,8,785,40,36,1,0,'hzuapps','web-wechat-2017',1,1,100),(76,'BrightLee121','1513071001116',42,1,'',10,'2017-10-26T07:28:45Z',5,6,930,98,38,1,0,'hzuapps','web-wechat-2017',1,1,93),(77,'panxiaomian','1514080901223',19,1,'',13,'2017-10-26T01:43:33Z',8,8,1385,185,28,0,0,'hzuapps','web-wechat-2017',1,1,90),(78,'wmingl','1513071001131',75,1,'有点意思',15,'2017-10-30T12:53:09Z',8,12,719,135,47,0,0,'hzuapps','web-wechat-2017',1,1,90),(79,'Zein-36','1514080901136',39,1,'',11,'2017-10-26T04:40:40Z',6,6,876,169,53,0,0,'hzuapps','web-wechat-2017',1,1,90),(80,'wagez','1514080901140',13,1,'有点意思',11,'2017-10-26T04:07:23Z',6,11,340,186,7,0,0,'hzuapps','web-wechat-2017',1,1,90),(81,'sunlightcold','1514080901205',41,1,'',8,'2017-10-27T00:19:28Z',11,1,889,271,28,6,0,'hzuapps','web-wechat-2017',1,1,66),(82,'zhongting','1514080901139',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(83,'jia-forest','1514080901220',52,1,'',4,'2017-10-29T12:46:11Z',2,2,505,2,23,0,0,'hzuapps','web-wechat-2017',1,1,36),(84,'lanehunter','1514080901215',56,1,'',10,'2017-11-04T23:59:19Z',20,6,1302,79,14,1,0,'hzuapps','web-wechat-2017',1,1,100),(85,'JMLUO','1514080901127',12,1,'',14,'2017-10-26T01:05:34Z',8,11,1096,95,66,1,0,'hzuapps','web-wechat-2017',1,1,100),(86,'莫秀珠','1514080901221',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',1,1,0),(87,'hongdi178','1507070201226',17,1,'有点意思',8,'2017-10-26T23:57:23Z',7,5,97,15,8,1,0,'hzuapps','web-wechat-2017',1,1,93),(1219,'CchenWX','1514080901207',57,1,'有点意思',18,'2017-10-27T02:16:50Z',5,18,1350,691,84,0,0,'hzuapps','web-wechat-2017',8,12,90),(1220,'KuhnHuge','1514080901236',47,1,'有点意思',12,'2017-10-28T14:09:06Z',6,8,1138,330,64,0,0,'hzuapps','web-wechat-2017',8,12,90),(1221,'adcGG','1514080901204',128,1,'',11,'2017-10-29T03:16:56Z',10,11,964,78,45,0,0,'hzuapps','web-wechat-2017',8,12,90),(1222,'cs2JeX','1514080901203',92,1,'',12,'2017-10-26T01:48:24Z',6,8,847,464,65,1,0,'hzuapps','web-wechat-2017',8,12,92),(1223,'panweil','1514080901123',23,1,'',15,'2017-10-26T01:04:11Z',8,12,2138,121,367,5,0,'hzuapps','web-wechat-2017',8,12,100),(1224,'Moxiuzhu','README.md',11,1,'',15,'2017-10-26T01:24:33Z',9,11,720,41,45,0,0,'hzuapps','web-wechat-2017',8,12,90),(1225,'Your Name','1514080901238',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1226,'Yangjiawei864','1514080901237',115,1,'',9,'2017-11-08T16:12:41Z',6,11,1563,712,81,2,0,'hzuapps','web-wechat-2017',8,12,95),(1227,'DanielLif','1514080901112',149,1,'',2,'2017-10-29T15:50:52Z',1,1,227,0,12,0,0,'hzuapps','web-wechat-2017',8,12,30),(1228,'zclsm','1512070501138',175,1,'有点意思',8,'2017-11-01T10:49:46Z',5,4,647,110,27,2,0,'hzuapps','web-wechat-2017',8,12,95),(1229,'laijunqiang','1514080901216',65,1,'',8,'2017-10-29T03:15:48Z',8,5,139,2,11,0,0,'hzuapps','web-wechat-2017',8,12,90),(1230,'ZHIHAOC','1514080901105',29,1,'',8,'2017-10-26T01:25:18Z',9,2,25,0,1,2,0,'hzuapps','web-wechat-2017',8,12,67),(1231,'zhanghuihong','1514080901239',64,1,'有点意思',2,'2017-11-01T15:05:57Z',1,1,227,0,12,0,0,'hzuapps','web-wechat-2017',8,12,30),(1232,'huangmaoliu','1514080901232',72,1,'有点意思',7,'2017-11-01T10:46:25Z',10,3,53,8,10,0,0,'hzuapps','web-wechat-2017',8,12,80),(1233,'lzhxh','1514080901218',101,1,'有点意思',13,'2017-10-26T05:05:57Z',6,10,2361,360,148,2,0,'hzuapps','web-wechat-2017',8,12,95),(1234,'tanyuhao','1514080901125',28,1,'有点意思',10,'2017-10-27T00:21:59Z',10,5,192,63,13,1,0,'hzuapps','web-wechat-2017',8,12,92),(1235,'CCGyyn','1514080901201',79,1,'有点意思',14,'2017-10-26T09:22:02Z',7,9,1242,133,48,1,0,'hzuapps','web-wechat-2017',8,12,92),(1236,'hhhhjq','1514080901211',102,1,'有点意思',13,'2017-10-26T05:39:56Z',6,11,876,223,45,2,0,'hzuapps','web-wechat-2017',8,12,95),(1237,'a505407658','1507070201123',40,1,'',17,'2017-10-29T10:51:17Z',9,16,984,610,66,0,0,'hzuapps','web-wechat-2017',8,12,90),(1238,'zengsn','null',6,6,'实验',28,'2017-12-05T11:52:28Z',4,4,4647,1525,150,0,0,'hzuapps','web-wechat-2017',8,12,90),(1239,'ldy12347','1513071001110',73,1,'',11,'2017-10-26T13:29:08Z',8,14,1653,84,74,0,0,'hzuapps','web-wechat-2017',8,12,90),(1240,'AllenMinD','1514080901122',9,1,'有点意思',23,'2017-10-26T00:45:24Z',10,20,3826,458,100,1,0,'hzuapps','web-wechat-2017',8,12,92),(1241,'DragonTeng','1514080901120',25,1,'',12,'2017-10-26T01:14:41Z',7,10,1868,617,99,0,0,'hzuapps','web-wechat-2017',8,12,90),(1242,'zhengsongmiao','1514080901137',37,1,'有点意思',8,'2017-10-29T03:18:36Z',9,4,331,124,31,0,0,'hzuapps','web-wechat-2017',8,12,90),(1243,'yuezhudxw','1514080901108',59,1,'',10,'2017-10-29T13:10:18Z',5,6,590,92,40,0,0,'hzuapps','web-wechat-2017',8,12,90),(1244,'[ldy12347]','1514080901118',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1245,'Buruiwen','1509081602501',54,2,'',6,'2017-10-29T03:18:23Z',10,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,40),(1246,'Emiya-Kiritsugu','1514080901202',45,1,'',10,'2017-10-29T11:53:01Z',6,11,800,99,50,0,0,'hzuapps','web-wechat-2017',8,12,90),(1247,'cuteboyjun','1514080901231',154,1,'',13,'2017-10-29T04:10:06Z',8,8,528,105,26,2,0,'hzuapps','web-wechat-2017',8,12,95),(1248,'Reubon','1514080901225',93,1,'有点意思',14,'2017-10-29T12:31:05Z',8,15,902,262,62,1,0,'hzuapps','web-wechat-2017',8,12,92),(1249,'hzucyc','1514080901103',34,1,'',26,'2017-10-26T05:12:08Z',12,24,744,97,72,4,0,'hzuapps','web-wechat-2017',8,12,100),(1250,'hzuzkt','1514080901135',88,1,'有点意思',21,'2017-10-26T01:37:44Z',9,20,5104,4076,247,3,0,'hzuapps','web-wechat-2017',8,12,97),(1251,'Sephlroth','1514080901121',70,1,'',12,'2017-10-26T04:07:08Z',7,8,1343,191,74,3,0,'hzuapps','web-wechat-2017',8,12,97),(1252,'shawXXQ','1514080901234',46,1,'有点意思',12,'2017-10-26T01:12:57Z',6,13,670,100,48,1,0,'hzuapps','web-wechat-2017',8,12,92),(1253,'ShadowWarLock','1514080901117',26,1,'',19,'2017-10-26T00:54:25Z',8,27,710,279,71,0,0,'hzuapps','web-wechat-2017',8,12,90),(1254,'fengdejiyi712','1514080901222',36,1,'',17,'2017-10-26T04:51:29Z',8,13,600,107,32,0,0,'hzuapps','web-wechat-2017',8,12,90),(1255,'wonderful12345','1514080901132',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1256,'Girlsmile','1514080901208',194,1,'',10,'2017-11-01T13:54:27Z',6,9,1127,0,40,0,0,'hzuapps','web-wechat-2017',8,12,90),(1257,'Hfenru','1514080901109',14,1,'',12,'2017-10-26T04:08:03Z',6,6,521,186,24,0,0,'hzuapps','web-wechat-2017',8,12,90),(1258,'czxuyixin','1514080901129',24,1,'',15,'2017-10-26T01:26:09Z',8,8,1666,1342,309,0,0,'hzuapps','web-wechat-2017',8,12,90),(1259,'teajoy','1514080901210',48,1,'',9,'2017-10-27T00:21:01Z',8,3,416,0,15,4,0,'hzuapps','web-wechat-2017',8,12,90),(1260,'ZjChenyk','1514080901104',63,1,'有点意思',16,'2017-10-26T08:45:42Z',6,18,6935,0,199,0,0,'hzuapps','web-wechat-2017',8,12,90),(1261,'bigbigban','1514080901224',184,1,'',10,'2017-11-08T14:06:31Z',6,7,670,173,27,0,0,'hzuapps','web-wechat-2017',8,12,90),(1262,'Dlezai','1514080901107',21,1,'有点意思',12,'2017-10-26T09:34:39Z',8,9,895,274,28,0,0,'hzuapps','web-wechat-2017',8,12,90),(1263,'yug116','1514080901233',49,1,'',9,'2017-10-26T04:00:24Z',4,5,698,96,53,1,0,'hzuapps','web-wechat-2017',8,12,92),(1264,'Leezxy','1514080901110',166,1,'有点意思',13,'2017-10-29T13:06:57Z',5,7,387,34,27,0,0,'hzuapps','web-wechat-2017',8,12,90),(1265,'wazhuroujuan','1514080901134',174,1,'',11,'2017-10-29T14:38:38Z',11,5,538,303,20,5,0,'hzuapps','web-wechat-2017',8,12,100),(1266,'879579620','1514080901229',10,1,'',14,'2017-10-26T05:07:44Z',6,14,1630,443,74,1,0,'hzuapps','web-wechat-2017',8,12,92),(1267,'MercyMo','1514080901106',61,1,'',13,'2017-10-26T01:00:01Z',9,9,843,96,42,3,0,'hzuapps','web-wechat-2017',8,12,97),(1268,'lautnerk','1514080901206',150,1,'',11,'2017-10-29T03:18:56Z',9,6,390,40,24,0,0,'hzuapps','web-wechat-2017',8,12,90),(1269,'FFFfire666','1514080901128',82,1,'有点意思',19,'2017-10-26T05:01:10Z',8,14,1094,216,51,5,0,'hzuapps','web-wechat-2017',8,12,100),(1270,'1369949044','1514080901130',32,1,'有点意思',14,'2017-10-28T15:58:41Z',8,9,437,141,34,0,0,'hzuapps','web-wechat-2017',8,12,90),(1271,'hongxiangliu','1514080901119',27,2,'',7,'2017-10-26T23:58:32Z',11,1,21,2,2,1,0,'hzuapps','web-wechat-2017',8,12,57),(1272,'lizhoupeng','1514080901113',33,1,'',16,'2017-10-26T01:30:19Z',8,11,936,271,76,0,0,'hzuapps','web-wechat-2017',8,12,90),(1273,'huangrenzhong','1514080901212',99,1,'',4,'2017-10-29T16:30:11Z',1,1,228,0,13,0,0,'hzuapps','web-wechat-2017',8,12,30),(1274,'zhouzech','1506081301243',78,1,'',10,'2017-10-30T13:27:28Z',5,5,904,535,82,0,0,'hzuapps','web-wechat-2017',8,12,90),(1275,'mmpmvpvip','1514080901226',50,1,'',13,'2017-10-29T11:48:16Z',6,7,826,24,36,0,0,'hzuapps','web-wechat-2017',8,12,90),(1276,'xwh511','1513071002132',16,1,'有点意思',13,'2017-10-26T01:37:30Z',8,13,1174,38,54,2,0,'hzuapps','web-wechat-2017',8,12,95),(1277,'TBAatrox','1514080901133',161,1,'有点意思',12,'2017-10-29T12:18:12Z',7,24,780,95,43,1,0,'hzuapps','web-wechat-2017',8,12,92),(1278,'pig-w','README.md1',89,1,'',9,'2017-10-29T03:16:18Z',11,6,241,0,8,1,0,'hzuapps','web-wechat-2017',8,12,92),(1279,'xukaitian','1506081301236',177,1,'',13,'2017-10-30T05:54:13Z',7,10,1730,80,83,0,0,'hzuapps','web-wechat-2017',8,12,90),(1280,'leon0723','1514080901240',58,1,'',10,'2017-10-30T04:21:25Z',4,6,1280,61,25,2,0,'hzuapps','web-wechat-2017',8,12,95),(1281,'miamiluo96','1512120901132',329,1,'',2,'2017-11-15T13:14:18Z',1,1,228,0,12,0,0,'hzuapps','web-wechat-2017',8,12,30),(1282,'sk-2017','1514080901228',62,1,'有点意思',13,'2017-10-26T14:13:54Z',7,13,875,75,41,0,0,'hzuapps','web-wechat-2017',8,12,90),(1283,'351655914','1514080901116',38,1,'',10,'2017-10-26T04:07:48Z',6,5,481,139,14,0,0,'hzuapps','web-wechat-2017',8,12,90),(1284,'ZhiHu-ZheYe','1514080901138',30,2,'有点意思',4,'2017-10-30T04:27:40Z',2,2,401,74,14,0,0,'hzuapps','web-wechat-2017',8,12,50),(1285,'chasel34','list.md',15,1,'',9,'2017-10-26T00:53:20Z',7,8,688,146,28,0,0,'hzuapps','web-wechat-2017',8,12,90),(1286,'MuZiL1','1514080901217',53,1,'',7,'2017-11-01T10:45:40Z',9,5,152,0,4,0,0,'hzuapps','web-wechat-2017',8,12,90),(1287,'252492046','1514080901213',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1288,'NumenJamila','1514080901101',35,1,'',10,'2017-10-29T03:16:40Z',11,6,1013,233,18,2,0,'hzuapps','web-wechat-2017',8,12,95),(1289,'JIZHILING','1514080901214',55,1,'',6,'2017-11-01T10:47:12Z',10,1,267,232,15,2,0,'hzuapps','web-wechat-2017',8,12,65),(1290,'linhaohong','1514080901115',95,1,'',10,'2017-10-26T01:48:48Z',6,7,847,15,31,0,0,'hzuapps','web-wechat-2017',8,12,90),(1291,'YanRuan','1514080901114',20,1,'',12,'2017-10-26T01:20:14Z',6,14,1423,479,81,0,0,'hzuapps','web-wechat-2017',8,12,90),(1292,'guorunlin','1514080901209',130,1,'有点意思',13,'2017-10-27T02:01:25Z',8,13,832,33,32,0,0,'hzuapps','web-wechat-2017',8,12,90),(1293,'lwYU','1514080901111',157,1,'有点意思',10,'2017-10-29T10:36:16Z',7,8,785,40,36,1,0,'hzuapps','web-wechat-2017',8,12,92),(1294,'BrightLee121','1513071001116',42,1,'',10,'2017-10-26T07:28:45Z',5,6,930,98,38,1,0,'hzuapps','web-wechat-2017',8,12,92),(1295,'panxiaomian','1514080901223',19,1,'',13,'2017-10-26T01:43:33Z',8,8,1385,185,28,0,0,'hzuapps','web-wechat-2017',8,12,90),(1296,'wmingl','1513071001131',75,1,'有点意思',15,'2017-10-30T12:53:09Z',8,12,719,135,47,0,0,'hzuapps','web-wechat-2017',8,12,90),(1297,'Zein-36','1514080901136',39,1,'',11,'2017-10-26T04:40:40Z',6,6,876,169,53,0,0,'hzuapps','web-wechat-2017',8,12,90),(1298,'wagez','1514080901140',13,1,'有点意思',11,'2017-10-26T04:07:23Z',6,11,340,186,7,0,0,'hzuapps','web-wechat-2017',8,12,90),(1299,'sunlightcold','1514080901205',41,1,'',8,'2017-10-27T00:19:28Z',11,1,889,271,28,6,0,'hzuapps','web-wechat-2017',8,12,70),(1300,'zhongting','1514080901139',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1301,'jia-forest','1514080901220',52,1,'',4,'2017-10-29T12:46:11Z',2,2,505,2,23,0,0,'hzuapps','web-wechat-2017',8,12,50),(1302,'lanehunter','1514080901215',56,1,'',10,'2017-11-04T23:59:19Z',20,6,1302,79,14,1,0,'hzuapps','web-wechat-2017',8,12,92),(1303,'JMLUO','1514080901127',12,1,'',14,'2017-10-26T01:05:34Z',8,11,1096,95,66,1,0,'hzuapps','web-wechat-2017',8,12,92),(1304,'莫秀珠','1514080901221',0,0,'',0,'',0,0,0,0,0,0,0,'hzuapps','web-wechat-2017',8,12,0),(1305,'hongdi178','1507070201226',17,1,'有点意思',8,'2017-10-26T23:57:23Z',7,5,97,15,8,1,0,'hzuapps','web-wechat-2017',8,12,92);
/*!40000 ALTER TABLE `reposdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snav`
--

DROP TABLE IF EXISTS `snav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snav_name` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `fnav_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FnavId_idx` (`fnav_id`),
  CONSTRAINT `FnavId` FOREIGN KEY (`fnav_id`) REFERENCES `fnav` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snav`
--

LOCK TABLES `snav` WRITE;
/*!40000 ALTER TABLE `snav` DISABLE KEYS */;
INSERT INTO `snav` VALUES (17,'中心概括','<p>信息科学技术学院移动互联网虚拟仿真实验教学中心隶属于惠州学院计算机实验教学示范中心（省级，2012年），由二级学院直接管理，实行中心主任负责制。</p><p>信息科学技术学院移动互联网虚拟仿真实验教学中心依托信息科学技术学院现有3个专业计算机科学与技术、软件工程、网络工程，同时在建设计划中纳入对新申报的网络空间安全专业的支持，目标是建设及虚拟化5个与移动互联网相关的实验室（移动应用开发实验室、计算机网络技术实验室、计算机网络集成实验室、物联网实验室和网络信息安全虚拟仿真实验室）。</p><p>本着“虚实实验结合、实验教学与科研成果转化结合、模拟实验与与企业应用结合”的“三结合”建设理念，中心致力于建设开放式移动互联网虚拟仿真实验教学管理与共享平台，其中包含虚拟仿真实验教学系统（资源）7个：移动应用开发实验教学系统（实验项目8个）、HTML5高级网页实验教学系统（实验项目6个）、计算机网络实验教学系统（实验项目8项）、网络规划综合实验教学系统（综合实验项目1项）、路由与交换技术实验教学系统（实验项目8项）。目前已建成虚拟仿真实验课程5门，虚拟仿真实验项目30项。从2018年起，针对采用2016版培养方案的专业（大三），将建设和开设物联网应用与技术、网络安全、信息安全等实验课程。另外，实验中心也将支持和承担新申报专业“网络空间安全”的部分实验教学课程。最终形成的移动互联网虚拟仿真实验中心架构如图1所示。</p><figure class=\"image\"><img src=\"/allProjUpload/customizableSys/editorUploadImage/7096820180812figure1.png\"><figcaption>图1：实验中心组织架构图</figcaption></figure>',1),(18,'发展历程','<p>信息科学技术学院移动互联网虚拟仿真实验教学中心隶属于惠州学院计算机实验教学示范中心。惠州学院计算机实验教学示范中心成立于2004年，后于2012年被批准为广东省高等学校省级教学实验示范中心。</p><p>目前实验中心拥有计算机组成原理及微机接口、操作系统、网络工程、数字逻辑与数字系统、嵌入式系统、软件工程、多媒体技术、智能信息处理、移动应用开发、企业信息化等10个实验室；与企业联合建立了“公共安全协同创新中心”、“旭惠信息技术创新中心”、“公共信息安全技术研究联合实验室”、“新一代IT协同创新中心”、“惠州电商人才培训基地”，配置各类计算机设备1000余台，为教学和科学研究提供了良好的实验环境。</p>',1),(19,'队伍建设','<p>本虚拟仿真实验教学队伍以中青年教师为主，所有成员目前均从事一线实验教学工作，其中大部分成员为高级职称（68%），整个教学队伍具有较高的教学水平和优秀的教学成果，主要具体如下：</p><ol><li>教学队伍成员有优异的一线教学水平上。教学队伍成员均为计算机专业课程负责人和主讲教师，理论教学及实验教学工作量饱满，近年来平均教学评价结果均为优秀（90分）以上。其中，所有教授均参与计算机专业授课及虚拟实验教学，例如：彭刚（教授，院长）负责《软件项目管理》等课程的授课与实验，蔡昭权（教授）负责《计算机网络工程》的授课与实验。此外，其他教学队伍核心人员也直接担任主要课程的授课与实验工作，其中中心主任曾少宁（网络工程系主任）是《移动应用设计与开发》、《高级网页设计》等课程负责人，参与授课与虚拟实验教授，汪华斌（副教授）负责《计算机网络》课程的授课与实验。教学队伍基本覆盖中心的所有实验课程，并且具有较高的教学经验和水平。</li><li>教学队伍成员的教学成果显著。其中，中心主任曾少宁已主持过1项省级和2项校级教研教改课题，完成了1项双语示范课程，指导过2项省级大创项目和多项校级大创项目，曾经指导学生参加学科竞赛多次获得国家级和省级奖项，发表了多篇与虚拟实验教学技术相关的教学研究论文。核心成员彭刚教授2017年获得惠州学院校级教学成果一等奖。蔡昭权教授2017年入选广东省本科高校创新创业教育教学指导委员会。汪华斌、李慧老师各主持1项省级教研教改项目。此外，教学队伍其他成员也曾经主持或参与各级教学质量工程和教研教改项目。</li></ol>',1),(20,'虚拟仿真实验教学优势','<p>随着信息技术的发展，作为传统实验教学的一种有效的补充，虚拟仿真实验教学已经成为加强实践教学、提高教学质量的重要手段，它不仅可以在一定程度上代替传统的实验教学，而且可以克服传统实验的各种制约和弊端，从而有效地解决目前实验教学中存在的诸多问题。将虚拟实验教学融入现有教学体系，能够节约实验成本，提高学生素质。既解决了学校实验教学的实际问题，又顺应国家严抓教学质量、注重创新人才培养的精神。建立开放式基于网络与虚拟化技术的移动互联网虚拟仿真实验教学中心将成为信息科学技术学院实验室建设新的亮点和教学质量提升的助推器。</p><p><strong>一方面，所开设专业课程实验要求决定了需要有虚拟仿真实验教学中心的支持。</strong></p><p>（1）移动应用开发平台直接采购成本高，手机、平板电脑等移动实验设备难以管理。例如，在基于Android的移动应用开发课程实验中，需要为学生分配适合不同版本的移动平台实验环境，如果采用真机（Android手机）来实现，需要中心投入大量的资金购买手机设备，同时这些设备会给实验中心带来无法承担的管理风险。而采用虚拟化的技术，通过虚拟软件技术为学生分配实验机，则可以完全规避这些问题。</p><p>（2）软件定义网络（SDN）、虚拟网络设备等计算机网络新技术实验天生需要依托虚拟化软件实验平台，无法在单纯硬件的实验平台上进行。目前已经开设的路由、组网等实验课程，在传统IT架构中的网络中，其配置是一件非常繁琐的事情。采用虚拟化技术之后，无需对网络中每个节点的设备（路由器、交换机、防火墙）反复进行配置，网络中的设备本身就是自动化连通的。只需要在使用时定义好简单的网络规则即可。如果用户不喜欢网络设备（路由器、交换机、防火墙）自身内置的协议，还可以通过编程的方式对其进行修改，以实现更好的数据交换性能。除此之外，未来课程需要涉及的软件定义网络（SDN）等网络新代表了一种新趋势，是未来网络设备发展的主流之一。而开设这些新课程，都需要虚拟仿真实验环境的支持。</p><p>（3） 大型综合设计性网络实验成本高且实现难度困难。大型综合设计性网络实验，如大型校园网络需求分析、方案设计与系统集成，企业网搭建与应用，园区网互联及网站建设等大型综合设计性网络实验，是网络工程专业、物联网专业，以及相关的计算机专业网络工程实验的亮点和难点，如果能开展贴近现实的、大型校园网、企业网以及园区网的综合性实验，对学生综合利用网络工程的知识、提高学生实际网络集成的水平有极大的帮助。但由于大型综合设计性网络实验，需要的网络设备类型多、数量大、拓扑结构复杂多样，设置和调试复杂困难，实体实验室由于成本的原因，以及实验场地的限制，在实现上非常困难，难以实现。虚拟仿真实验环境中，增加新的实验设备容易，提供的拓扑结构可以非常复杂，可扩展性强，可根据教学需要灵活添加实验设备及典型实验，提供个性化定制服务；而且实验界面友好直观、所有的仿真网络实验设备操作贴近实际，真实感强；每个学生都可以在虚拟仿真环境中，独立或共同设计大型的综合型网络实验，受益的学生多，对提高学生实现网络集成的能力有极大的帮助，具有实体网络实验不可替代的作用。</p><p>（4） 网络安全类实验在实际网络中难以实现。采用防火墙、入侵检测、VPN等设备搭建网络安全实验平台，不但成本高，学生受益面窄，多个设备仅支持单个用户的配置操作，一个实验室需要配置多套相同的设备；而且仅支持对安全配置等偏工程应用类的实验，无法进行信息安全原理相关的教学和实验，更无法进行大型综合安全实验。在实体网络类实验室直接做网络安全类实验，由于实体网络类实验室线路与校园网络直连，因此可能造成病毒等不良数据外溢，严重影响校园网络安全，造成无法预料的严重后果，所以网络安全类实验在实际网络中难以实现，最好在虚拟仿真的环境下进行。中心根据真实网络及信息安全环境，基于真实的网络安全设备，采用硬件虚拟、软件仿真的方式，建立了一个技术先进、覆盖面广、扩展性强的网络信息安全虚拟仿真实验室，可以让学生通过独立操作或者分组合作，进行网络信息安全各个领域知识的学习和配套实验操作，通过虚拟仿真实验的操作，加快、加深理论知识的学习，同时通过仿真实验环境下理论知识的讲解加深对实际动手操作的理解，实现理论与实践教学的结合。特别是在虚拟仿真网络环境下，可以方便地进行网络攻防实验和大型综合安全实验，不会对实体的网络环境造成影响。</p><p>（5） 常规实验环境建设成本高。网络设备种类繁多，如果要购置较齐全的网络设备，初期投入成本高；而且网络技术变化快、设备生命周期有限、更新非常快，要建立非常完备且与时俱进的网络实验教学硬件环境是非常困难的，日常的实验室维护经费完全无法满足网络实验设备更新的要求。虚拟仿真实验教学平台，只需要少量的网络硬件，就可以硬件虚拟、软件仿真的方式实现网络实验设备的更新换代，更新周期短、成本低。而且利用软件扩展性好的特性，可以将少量的网络设备，虚拟成大量虚拟网络设备，更新硬件成本低。</p><p><strong>另一方面，现有实验室与实验课程的管理与实施决定了必须引入更为高效的虚拟仿真实验教学技术。</strong></p><p>虚拟仿真环境有利于提高实验考核的效率及可追溯性。常规实验环境中，所有考核环境均需要教师亲自检查，实验结果也无法以电子方式保存，或者必须通过录像等手段保存，而视频文件的保存、备份及查看均不够方便且耗费时间。在虚拟修真实验系统中，所有实验的环节和结果均以电子的方式保存，教师可以方便地检查和评测，其中有很大一部分工作，包括计分统计，都可以通过软件的方式自动完成，从而大大提高了实验考核的效果。</p><p>实体网络设备实验的优点是现场感好，与工程现实环境接近；但实体网络设备实验涉及到设备之间的连线问题，因此无法有效实现远程共享实验，特别是需要频繁更换设备连接方式的网络实验。网络虚拟仿真实验，可以在任何计算机上进行实验操作，可以在虚拟的环境中，更新设备以及设备之间的连线，可以实现最大程度的资源开放和共享。非常有利于有实验内容的网络类UOOC课程的实验教学，解决UOOC类课程只能局限于理论课，而无法向实验课推广的缺陷。</p>',1),(21,'移动平台与移动应用开发虚拟仿真实验教学平台','<p>移动互联网虚拟仿真实验教学中心首先要支持的是移动应用开发类课程，主要代表性课程为《移动应用开发》和《高级网页设计》两个课程。其中，《移动应用开发》为针对移动平台（Android）的应用开发课程，它需要实验室提供移动平台软件的支持；而《高级网页设计》则涉及移动平台上的高级网页开发技术，一样需要有移动平台的支持。</p>',2),(22,'计算机网络与工程虚拟仿真实验教学系统','<p>建设中...</p>',2),(23,'物联网应用与技术虚拟仿真实验教学系统','<p>建设中...</p>',2),(24,'网络信息安全虚拟仿真实验室及教学系统','<p>建设中...</p>',2),(25,'科研成果(近五年)转化而来的虚拟仿真实验教学内容','<p>暂无。</p>',3),(26,'移动互联网虚拟仿真实验室科研成果转化实验项目情况','<p>建设中...</p>',3),(28,'校企合作','<p>从2012年起，信息科学技术学院在原有实验室建设基础之上，创新地开始建设与企业直接对接的协同创新中心。截止到目前为止，与企业联合建立了“公共安全协同创新中心”、“旭惠信息技术创新中心”、“公共信息安全技术研究联合实验室”、“新一代IT协同创新中心”、“惠州电商人才培训基地”，配置各类计算机设备1000余台，为教学和科学研究提供了良好的实验环境，信息技术创新中心完全实现企业化管理，建立起了一个创新应用型人才培养机制，中心师生参与合作企业的信息技术产品的研发，完成的项目获得了企业的高度评价，并为企业创造了良好的经济效益，同时也促进了信息科学技术学院的学科建设。近年来，信息科学技术学院在全国及省级多个学科竞赛中取得了优异成绩，曾获得“全国大学生计算机设计大赛”总决赛一等奖以及全国软件外包设计大赛一等奖；2015年，全年参赛学生数超过200人次，有150多人次在全国、省、市学科竞赛中获奖，2016年有160多人才获得各类奖项。此外，学生创业热情高，部分学生在校期间或毕业后短期间内即走上了创业发展的道路。</p><p>2017年，以协同创新中心为主要亮点的“校企深度融合的创新应用型信息技术人才培养模式探索与实践”获得惠州学院校级教学成果一等奖（彭刚，院长）。</p>',4),(29,'公共安全协同创新中心','<p>建设中...</p>',4),(30,'旭惠信息技术创新中心','<p>建设中...</p>',4),(31,'公共信息安全技术研究联合实验室','<p>建设中...</p>',4),(32,'中心主任','<p>曾少宁（网络工程系主任）</p><p>科研成果：<a href=\"https://github.com/zengsn/research/\">https://github.com/zengsn/research/</a></p>',5),(33,'中心人员','<p>彭刚（院长，教授）、蒋辉（副院长，教授）、蔡昭权（教授）、 曾树洪（学院实验中心主任，高级实验师）、汪华斌（副教授）、 黄震（副教授）、徐涛（副教授）、肖东（高工）、李慧、陈朝华、袁秀莲</p>',5),(34,'队伍结构','<p>总人数13，平均年龄41岁，正高23%，副高38%，其他38%。</p>',5),(35,'教学水平','<p>本虚拟仿真实验教学队伍以中青年教师为主，所有成员目前均从事一线实验教学工作，其中大部分成员为高级职称（68%），整个教学队伍具有较高的教学水平和优秀的教学成果，主要具体如下：</p><ol><li>教学队伍成员有优异的一线教学水平上。教学队伍成员均为计算机专业课程负责人和主讲教师，理论教学及实验教学工作量饱满，近年来平均教学评价结果均为优秀（90分）以上。其中，所有教授均参与计算机专业授课及虚拟实验教学，例如：彭刚（教授，院长）负责《软件项目管理》等课程的授课与实验，蔡昭权（教授）负责《计算机网络工程》的授课与实验。此外，其他教学队伍核心人员也直接担任主要课程的授课与实验工作，其中中心主任曾少宁（网络工程系主任）是《移动应用设计与开发》、《高级网页设计》等课程负责人，参与授课与虚拟实验教授，汪华斌（副教授）负责《计算机网络》课程的授课与实验。教学队伍基本覆盖中心的所有实验课程，并且具有较高的教学经验和水平。</li><li>教学队伍成员的教学成果显著。其中，中心主任曾少宁已主持过1项省级和2项校级教研教改课题，完成了1项双语示范课程，指导过2项省级大创项目和多项校级大创项目，曾经指导学生参加学科竞赛多次获得国家级和省级奖项，发表了多篇与虚拟实验教学技术相关的教学研究论文。核心成员彭刚教授2017年获得惠州学院校级教学成果一等奖。蔡昭权教授2017年入选广东省本科高校创新创业教育教学指导委员会。汪华斌、李慧老师各主持1项省级教研教改项目。此外，教学队伍其他成员也曾经主持或参与各级教学质量工程和教研教改项目。</li></ol>',5),(36,'组织保障','<p>（1） 学院重视并支持中心的制度建设。学院特别重视实验教学工作，制定了一系列与计算机相关的实验室管理办法以及设备管理办法。学院非常重视实验教学规范化，规定每门实验课程均编印实验教学大纲，实验指导书，实验多媒体讲义等实验教学材料。</p><p>（2） 学院重视并支持中心的基础条件建设。学院实验指导思想明确，特别重视学生动手能力和创新能力的培养。以学生为本，将建设完成的各级实验中心和创新中心全方位向全校学生开放，学生可以根据自己的知识、能力和兴趣，到各实验教学中心做实验，或者参加创新中心的企业团队，从而进一步提高自己的动手能力和创新实验能力。</p><p>（3） 学院非常注重实验教学队伍的建设。将有经验的教师调整到实验教学第一线，其中学院的大部分教授都参与实验教学，进一步整合实验教学和实验队伍资源，调整实验室布局，更好地适应学科发展和学生培养的要求。</p>',6),(37,'制度保障','<p>（1） 建立虚拟仿真实验教学中心的管理体制。实验中心由二级学院管理，采中心主任负责制。在运行机制上，实验教学主任作为中心的第一责任人，在课程设置、教学改革、人员聘用、实验室管理和经费管理等方面具有较大的自主权，从而保证了教学资源的充分合理利用，形成了功能明确和管理有序的实验教学中心。实验教学中心实行按需设岗，按岗聘任实验教师。中心的本科实验教学实验室皆有专职实验技术人员负责管理，实验室主任由教学经验丰富，教学能力强的教师担任。实验教师不但具备扎实的理论知识、较全面的实验技能、严谨的科学态度与作风，而且是一个掌握多学科知识与技术的多面手，这样的实验教师才能适应开设多门实验课程的要求。实验中心仪器设备、实验人员、实验用房均由实验教学中心统一管理，实现了资源共享，转变了实验室专为某一课程或专业服务的观念，根据功能和学科特点进行重组和建设，减少重复投资，对实验室仪器设备进行实时动态管理，即从仪器设备的使用信息到仪器设备的使用状态有明确的“账目”；实验中心每年对实验仪器进行清查，做到帐物相符，提高了实验仪器设备的投资效益和使用效率。</p><p>（2） 建立虚拟仿真实验教学中心的教学质量保障制度。为了保证中心实验开出的质量，中心还经常组织理论课程主讲老师与实验指导老师的交流，在教学进度、实验项目安排、实验仪器采购与应用等方面进行协调，并对学生在实验过程中暴露出的问题进行沟通，对症下药，使理论课与实验课能更好地结合。每个学期末，中心还要收集每门实验课程的学生实验报告，分好、中、差三组，通过对这些实验报告进行分析、总结，找出该实验课程在项目设置、老师指导、学生完成等方面的成功与不足，对这些实验课程进行改革，不断完善，保证了实验课程质量的进一步提升。学校实验与设备部每学期至少到实验室听课1次，中心主任和实验室主任每学期至少到实验室听课2次，并对实验报告进行抽查，保证实验课的质量。对新开实验和开新实验的教师，组织有经验的实验教学老师进行听课，并帮助制定实验课程的教学计划和教学内容，提高实验课的教学质量。</p><p>（3） 制定了实验队伍建设政策措施。学校制定了一系列实验教学队伍建设的政策和措施，包括：教学实验中心管理办法、实验技术人员岗位职责与考核办法、实验室考核评比条例、实验技术成果评审奖励管理办法等规章制度。奖励教师完成的实验教学成果、论文、实验指导书等，奖励在各种竞赛中获得名次学生和在公开刊物上发表论文学生的指导教师。</p><p>（4） 制定了实验队伍培训制度措施。专门出台了实验队伍培训管理办法，对实验人员培训和继续深造提供经费支持，实验技术人员的培训，以在职、在岗的方式参加短期进修班、培训班为主；以通过在职进修、系统学习以及学历培养为辅，少部分人员可以考虑安排脱产进修，重点培养。</p>',6),(38,'管理规范','<p>首先，为了保证实验教学中心开放运行良好，除学校为实验中心制的各项相关管理制度外，中心还专业制定了适合计算机实验管理的相关制度，其中包括：</p><ol><li>《教学实验中心管理办法》；</li><li>《实验室管理办法》；</li><li>《实验室开放管理办法》；</li><li>《实验室设置与调整管理规定》；</li><li>《实验室基本信息收集及档案管理办法》；</li><li>《实验室实验室安全管理办法》。</li></ol><p>其次，建立良好的实验教学考评体系是提高实验教学质量的保证机制。除了根据学校制定的实验技术人员岗位职责与考核管理办法，每学年进行一次考核之外，中心还做了以下两个方面的工作：</p><ol><li>学生评教。每学期由二级学院组织期中教学检查和期末学生评教活动，由学生对每门实验课程按评估指标进行打分，作为对实验教师教学效果考评的一个重要依据，而且学院及时将评估结果反馈给实验教学老师，以便老师及时改进实验教学工作中的缺陷，进一步提高实验教学质量。</li><li>学院督导。聘请教学经验丰富、责任心强、学术水平高的老教授担任督导员，协助检查、监督实验教学工作的全过程，包括实验教学大纲和教学内容、教材的选用、考试以及成绩评定，帮助实验教学老师提高实验教学质量。</li></ol>',6),(39,'校内共享','<p>到目前为止，整个实验中心的资源共享仅限于二级学院范围之内，实验教学资源共享的范围及方式主要有3种：</p><ol><li><strong>专业内多课程共享</strong>：面向移动应用开发课程的网络实验平台，已经扩展到学院内部的其他编程类课程，如高级网页设计，并且也取得了一样好的教学效果。</li><li><strong>学院内多专业共享</strong>：除了网络工程专业之外，移动和网络两个方面的实验教学资源均同时支持计算机科学与技术和软件工程等学院内专业的同类课程实验。所有的实验课程及项目由3个专业的课程和学生共享使用。</li></ol>',7),(40,'校外共享','<p>建设中...</p>',7),(41,'进一步拓宽资源共享的渠道','<p>建设中...</p>',7),(42,'进一步优化和丰富共享资源','<p>建设中...</p>',7),(43,'仪器设备配置情况','<p>计算机实验中心自成立以来，经费来源主要包括学校和政府。近年来，广东省和惠州市已为中心投入经费约365余万元，这些经费全部用于实验教学设备的购置和维护，以及实验资源的开发。整个实验中心的设备利用率达99%，设备完好率达99%。</p><p>移动互联网虚拟仿真实验教学中心依托计算机实验教学示范中心，其中实验中心的经费来源具体见下表。</p>',8),(44,'环境与安全','<p>建设中...</p>',8),(45,'运行与维护','<p>建设中...</p>',8),(46,'网络管理与安全','<p>建设中...</p>',8),(47,'申报书','<p>近期发布。</p>',9),(48,'支撑材料','<p>建设中...</p>',9),(49,'政策措施和规章制度','<p>建设中...</p>',9);
/*!40000 ALTER TABLE `snav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(45) DEFAULT NULL,
  `sname` varchar(45) DEFAULT NULL,
  `sgender` varchar(45) DEFAULT NULL,
  `classinfo_id` varchar(45) DEFAULT NULL,
  `sphone` varchar(45) DEFAULT NULL,
  `spassword` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `git_id` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'1514080901114','学生一','男','3','23323323322','222',NULL,NULL,NULL),(99,'1514080901207','学生二','男','2','12345678910','222',NULL,NULL,NULL),(100,'1514080901236','学生三','男','2','12345678910','222',NULL,NULL,NULL),(101,'1514080901204','学生四','男','2','12345678910','222',NULL,NULL,NULL),(102,'1514080901203','学生伍','男','2','12345678910','222',NULL,NULL,NULL),(103,'1514080901123','学六','男','3','12345678910','222',NULL,NULL,NULL),(105,'1514080901238','学期','男','2','12345678910','222',NULL,NULL,NULL),(106,'1514080901237','学把','男','2','12345678910','222',NULL,NULL,NULL),(107,'1514080901112','雪韭','男','3','12345678910','222',NULL,NULL,NULL),(108,'1512070501138','张思思','男','3','12345678910','222',NULL,NULL,NULL),(109,'1514080901216','圣衣','男','2','12345678910','222',NULL,NULL,NULL),(110,'1514080901105','声儿','女','3','12345678910','222',NULL,NULL,NULL),(111,'1514080901239','省三','男','2','12345678910','222',NULL,NULL,NULL),(112,'1514080901232','嵊泗','男','2','12345678910','222',NULL,NULL,NULL),(113,'1514080901218','升维','男','2','12345678910','222',NULL,NULL,NULL),(114,'1514080901125','盛柳','男','3','12345678910','222',NULL,NULL,NULL),(115,'1514080901201','生其','女','2','12345678910','222',NULL,NULL,NULL),(116,'1514080901211','胜巴','男','2','12345678910','222',NULL,NULL,NULL),(117,'1507070201123','张珊珊','女','3','12345678910','222',NULL,NULL,NULL),(119,'1513071001110','张柳柳','男','3','12345678910','222',NULL,NULL,NULL),(120,'1514080901122','陈佳','男','3','12345678910','222',NULL,NULL,NULL),(121,'1514080901120','陈怡','男','3','12345678910','222',NULL,NULL,NULL),(122,'1514080901137','陈三','男','3','12345678910','222',NULL,NULL,NULL),(123,'1514080901108','陈思','男','3','12345678910','222',NULL,NULL,NULL),(124,'1514080901118','陈武','男','3','12345678910','222',NULL,NULL,NULL),(125,'1509081602501','李尔尔','男','2','12345678910','222',NULL,NULL,NULL),(126,'1514080901202','陈留','男','2','12345678910','222',NULL,NULL,NULL),(127,'1514080901231','陈琦','男','2','12345678910','222',NULL,NULL,NULL),(128,'1514080901225','陈波','男','2','12345678910','222',NULL,NULL,NULL),(129,'1514080901103','陈酒','男','3','12345678910','222',NULL,NULL,NULL),(130,'1514080901135','刘艺','男','3','12345678910','222',NULL,NULL,NULL),(131,'1514080901121','刘二','男','3','12345678910','222',NULL,NULL,NULL),(132,'1514080901234','刘三','男','2','12345678910','222',NULL,NULL,NULL),(133,'1514080901117','刘思','男','3','12345678910','222',NULL,NULL,NULL),(134,'1514080901222','刘武','男','2','12345678910','222',NULL,NULL,NULL),(135,'1514080901132','刘柳','男','3','12345678910','222',NULL,NULL,NULL),(136,'1514080901208','刘琦','男','2','12345678910','222',NULL,NULL,NULL),(137,'1514080901109','刘坝','男','3','12345678910','222',NULL,NULL,NULL),(138,'1514080901129','刘就','男','3','12345678910','222',NULL,NULL,NULL),(139,'1514080901210','戚时','男','2','12345678910','222',NULL,NULL,NULL),(140,'1514080901104','戚一','男','3','12345678910','222',NULL,NULL,NULL),(141,'1514080901224','戚而','男','2','12345678910','222',NULL,NULL,NULL),(142,'1514080901107','戚三','男','3','12345678910','222',NULL,NULL,NULL),(143,'1514080901233','戚斯','男','2','12345678910','222',NULL,NULL,NULL),(144,'1514080901110','戚无','男','3','12345678910','222',NULL,NULL,NULL),(145,'1514080901134','戚流','男','3','12345678910','222',NULL,NULL,NULL),(146,'1514080901229','戚其','男','2','12345678910','222',NULL,NULL,NULL),(147,'1514080901106','戚巴','男','3','12345678910','222',NULL,NULL,NULL),(148,'1514080901206','戚九','男','2','12345678910','222',NULL,NULL,NULL),(149,'1514080901128','倪一','男','3','12345678910','222',NULL,NULL,NULL),(150,'1514080901130','倪而','男','3','12345678910','222',NULL,NULL,NULL),(151,'1514080901119','倪三','男','3','12345678910','222',NULL,NULL,NULL),(152,'1514080901113','尼斯','男','3','12345678910','222',NULL,NULL,NULL),(153,'1514080901212','尼巫','男','1','12345678910','222',NULL,NULL,NULL),(154,'1506081301243','张尔尔','男','2','12345678910','222',NULL,NULL,NULL),(155,'1514080901226','逆流','男','2','12345678910','222',NULL,NULL,NULL),(156,'1513071002132','伍意义','男','3','12345678910','222',NULL,NULL,NULL),(157,'1514080901133','倪戚','男','3','12345678910','222',NULL,NULL,NULL),(159,'1506081301236','张一一','男','2','12345678910','222',NULL,NULL,NULL),(160,'1514080901240','倪拔','男','2','12345678910','222',NULL,NULL,NULL),(161,'1512120901132','张五五','男','3','12345678910','222',NULL,NULL,NULL),(162,'1514080901228','倪酒','男','2','12345678910','222',NULL,NULL,NULL),(163,'1514080901116','就一','男','3','12345678910','222',NULL,NULL,NULL),(164,'1514080901138','九二','男','3','12345678910','222',NULL,NULL,NULL),(166,'1514080901217','九三','男','2','12345678910','222',NULL,NULL,NULL),(167,'1514080901213','就是','男','2','12345678910','222',NULL,NULL,NULL),(168,'1514080901101','九五','男','3','12345678910','222',NULL,NULL,NULL),(169,'1514080901214','九六','男','2','12345678910','222',NULL,NULL,NULL),(170,'1514080901115','九千','男','3','12345678910','222',NULL,NULL,NULL),(172,'1514080901209','球吧','男','2','12345678910','222',NULL,NULL,NULL),(173,'1514080901111','球球','男','3','12345678910','222',NULL,NULL,NULL),(174,'1513071001116','李山三','男','3','12345678910','222',NULL,NULL,NULL),(175,'1514080901223','闪烁','男','2','12345678910','222',NULL,NULL,NULL),(176,'1513071001131','李斯斯','男','3','12345678910','222',NULL,NULL,NULL),(177,'1514080901136','司思睿','男','3','12345678910','222',NULL,NULL,NULL),(178,'1514080901140','李进','男','3','12345678910','222',NULL,NULL,NULL),(179,'1514080901205','张金','男','2','12345678910','222',NULL,NULL,NULL),(180,'1514080901139','刘茹','男','3','12345678910','222',NULL,NULL,NULL),(181,'1514080901220','孟子然','男','2','12345678910','222',NULL,NULL,NULL),(182,'1514080901215','孟欣','男','2','12345678910','222',NULL,NULL,NULL),(183,'1514080901127','孟获','男','3','12345678910','222',NULL,NULL,NULL),(184,'1514080901221','蒙医','男','2','12345678910','222',NULL,NULL,NULL),(185,'1507070201226','李依依','女','2','12345678910','222',NULL,NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stutask`
--

DROP TABLE IF EXISTS `stutask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stutask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teatask_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `stusy_remark` mediumtext,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `teatask_id_idx` (`teatask_id`),
  KEY `stu_id_idx` (`stu_id`),
  CONSTRAINT `stu_id` FOREIGN KEY (`stu_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teatask_id` FOREIGN KEY (`teatask_id`) REFERENCES `teatask` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stutask`
--

LOCK TABLES `stutask` WRITE;
/*!40000 ALTER TABLE `stutask` DISABLE KEYS */;
INSERT INTO `stutask` VALUES (11,20,1,'<p>已完成</p>',NULL);
/*!40000 ALTER TABLE `stutask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tName` varchar(45) DEFAULT NULL,
  `tNo` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `tPhone` varchar(45) DEFAULT NULL,
  `tAddr` varchar(45) DEFAULT NULL,
  `tPwd` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `git_id` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gitUsername` varchar(100) DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'张三三','131001','男','12345678911','广东省惠州市河南岸街道','222','YiwHuan',NULL,NULL,'zengsn','88602906f4b5b5676495cf41929723d9228b2e6a','b3149014960e48f42586','bfc1cb8b1e206c21ab5c9556aaaf7866ef305875'),(2,'李四','131002','男','12345678910','广东省惠州市河南岸','222',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'弦五','131003','女','12345678910','广东省惠州市河南岸','222',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teatask`
--

DROP TABLE IF EXISTS `teatask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teatask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_id` int(11) DEFAULT NULL,
  `classinfo_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `deadline` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teatask`
--

LOCK TABLES `teatask` WRITE;
/*!40000 ALTER TABLE `teatask` DISABLE KEYS */;
INSERT INTO `teatask` VALUES (19,3,2,1,2,'概率论作业1','<p>请查看实验内容并在GitHub上完成实验，https://github.com/hzuapps/web-wechat-2017/issues/1</p>','2018-08-23','2018-08-12 15:37:40'),(20,1,3,1,12,'C++作业1','<p><br>请查看实验内容并在GitHub上完成实验，https://github.com/hzuapps/web-wechat-2017/issues/1</p>','2018-08-29','2018-08-22 19:55:15'),(22,1,3,1,12,'作业2','<p>请到GitHub上完成作业</p>','2018-08-20','2018-08-22 23:11:24');
/*!40000 ALTER TABLE `teatask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `termno` varchar(45) DEFAULT NULL,
  `termname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'1','2018（上）'),(2,'2','2019（上）'),(3,'3','2020（上）'),(4,'4','2021（上）'),(5,'5','2022（上）'),(6,'6','2023（上）'),(8,'8','2025（上）');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-27 11:00:50
