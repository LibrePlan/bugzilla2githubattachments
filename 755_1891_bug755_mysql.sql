-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: navaldev
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('initial-database-creation-1','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',1,'EXECUTED','3:0819191bfc79c85258e53388e6c3a269','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-2','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',2,'EXECUTED','3:492e699609703ebfdc7f14d0b9d3fa10','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-3','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',3,'EXECUTED','3:ce0671ca8c9c310243bcc2ffb2d35523','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-4','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',4,'EXECUTED','3:5a28bfc5ca316e6f6cd3a0b3ef5f67b9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-5','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',5,'EXECUTED','3:dd32a9e5c58bd33f528f3a4176736205','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-6','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',6,'EXECUTED','3:de107aebd954ab5c29c39bd6260b1c69','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-7','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',7,'EXECUTED','3:588d5677bcc5dff757c327873f896443','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-8','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',8,'EXECUTED','3:7fa824a67c2de27b2b2a3f66e5118412','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-9','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',9,'EXECUTED','3:93bc8fa1188ddda3969df439f29c8f31','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-10','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',10,'EXECUTED','3:0c72c8c2330c2408a6b079239c401a91','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-11','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',11,'EXECUTED','3:30ecc1c237e1c3c3db800537ffa8883d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-12','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',12,'EXECUTED','3:f3c4e20ee90e3380f608f73bd0bbb630','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-13','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',13,'EXECUTED','3:aaaa113557606faf71ee9f5ee1df07ce','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-14','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:49',14,'EXECUTED','3:54c846355565319d7d50bd78f4f569bb','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-15','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',15,'EXECUTED','3:206376e864171d400ce1602f7ef53d49','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-16','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',16,'EXECUTED','3:cf757d69a753e856b6342f679cff9fac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-17','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',17,'EXECUTED','3:ce6dfb988cb41f0adbe43e1855caa76e','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-18','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',18,'EXECUTED','3:967c04d80a2d485f868b3c984579c4e8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-19','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',19,'EXECUTED','3:4e9058f3e2f5b8173503167ec5c538a3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-20','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',20,'EXECUTED','3:60a882fa6c0f1d848bf4c69f9bfff35c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-21','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',21,'EXECUTED','3:19b23f729aa196a1abed154f225db676','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-22','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',22,'EXECUTED','3:947b787c1bbe91a331dd46cb1640f5e5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-23','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',23,'EXECUTED','3:48f908ec702ae89b5da9f0eac7479005','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-24','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',24,'EXECUTED','3:84355bc36e649a2786237afa2239406b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-25','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',25,'EXECUTED','3:b8724c07bf0377b89a789f4068225748','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-26','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',26,'EXECUTED','3:f9826236b01812c13b8773d5ab43eba3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-27','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',27,'EXECUTED','3:c793cee4a905e7c283e5670c7a78ce75','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-28','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',28,'EXECUTED','3:10e53ad074ddb8a722b7327c489af2a4','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-29','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',29,'EXECUTED','3:ffd33e338772b05e1ec66bc5f536b857','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-30','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',30,'EXECUTED','3:de8601efc174c9011c267a989abc558d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-31','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',31,'EXECUTED','3:fc5ec26502de974f7ab46118f4f53196','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-32','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',32,'EXECUTED','3:b3be37758841b13194d3710d6defef04','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-33','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',33,'EXECUTED','3:a951462763f5d55a3f7e10f12f81335f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-34','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',34,'EXECUTED','3:a51224ce4bb0ca6d2b3f7bd992c65f0a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-35','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:50',35,'EXECUTED','3:8afd863ae4753040b121f5858594660b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-36','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',36,'EXECUTED','3:0754fc448f05289e922e36fe342d121d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-37','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',37,'EXECUTED','3:5cfa72b6d860176124f25ff3a9d331fc','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-38','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',38,'EXECUTED','3:f831e87d1de1fc1338d42b8e833dc9c9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-39','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',39,'EXECUTED','3:6bd033fff9beeafa67d07445dbaee07f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-40','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',40,'EXECUTED','3:bdd3c4d65620a2a8f7b1a964a353f58f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-41','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',41,'EXECUTED','3:096d3c30326f7805f4b0039355445d54','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-42','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',42,'EXECUTED','3:ded3fb067f8bc57e6638e6920fd44604','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-43','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',43,'EXECUTED','3:55f995d5648794d3432adc45e49630ac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-44','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:51',44,'EXECUTED','3:36bec1cf129dbbe7479b6fd37ec4cfc8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-45','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',45,'EXECUTED','3:14bba3e0f5ceb3f2fd6f8957e1838de4','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-46','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',46,'EXECUTED','3:20a4b538a58ecad5fefff00c68060415','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-47','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',47,'EXECUTED','3:20d9ca0a2dac404d34031a303d36332f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-48','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',48,'EXECUTED','3:9422bfd2634488255bcbb32d73d4d9a6','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-49','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',49,'EXECUTED','3:bb378576fc9548e6e0bf30c553be56c2','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-50','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',50,'EXECUTED','3:86be514721a43f3a69e0fc5575f68bcf','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-51','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',51,'EXECUTED','3:6a7ac8677daeb7b232876fef8bc2eb13','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-52','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',52,'EXECUTED','3:132f159f7460a378fe40004d8844911c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-53','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:52',53,'EXECUTED','3:e86194e70e6973332ef4538bdc5d7a1a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-54','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',54,'EXECUTED','3:2524421c32a9b419da3fe430869fdb1d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-55','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',55,'EXECUTED','3:f07c8df4ae4b20f431ed20c225b80172','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-56','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',56,'EXECUTED','3:d180f6978451999d3c71c31e22a05f12','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-57','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',57,'EXECUTED','3:96dee6dd4c6fe24bdf27aec7375f97a2','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-58','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',58,'EXECUTED','3:57a5a9423e13e7d46ab17b29ef36e3ac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-59','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',59,'EXECUTED','3:481dae68046dee1729404fcb4b8f6724','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-60','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',60,'EXECUTED','3:3c79c9a14789f861812e28b85f42ba1a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-61','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',61,'EXECUTED','3:b0647147970dcc6926527bcc26e08d0d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-62','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',62,'EXECUTED','3:7a0cee9dc0952cca4c3e2a32508a4433','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-63','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',63,'EXECUTED','3:2b9225897f01e983677b51310e4fe0c6','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-64','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',64,'EXECUTED','3:8c6b353a40e4bbfe9ddec68b6e2ed109','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-65','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',65,'EXECUTED','3:181a3cfd4d56baa702ea56857d70c6a5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-66','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',66,'EXECUTED','3:1ce12362bbe5c9289c1b1417b4534017','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-67','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',67,'EXECUTED','3:3db8192b7fc2c73f2d6f0b811b86193a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-68','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',68,'EXECUTED','3:49669d8f9f006e24a66e6baef277ebaf','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-69','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',69,'EXECUTED','3:ec29eb383f779659440de1992b1b6bba','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-70','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',70,'EXECUTED','3:668c637d3c53b7592d3dc67fc4703cff','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-71','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',71,'EXECUTED','3:4f9d5316304450ab582b0858ce87c849','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-72','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',72,'EXECUTED','3:7a3e44f865f5a910f79c5f06e0b64f14','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-73','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',73,'EXECUTED','3:a635c19cae307c38b2763e3b9d58d224','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-74','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',74,'EXECUTED','3:95ac63bf89b9b48c007e8460e7e48cdb','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-75','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',75,'EXECUTED','3:28e6cc28eded2e909048c08ffacc1748','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-76','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',76,'EXECUTED','3:f32e144cefab5640c93a41de30b01609','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-77','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',77,'EXECUTED','3:5504fcfe56f3f27aedab1932b345ef67','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-78','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',78,'EXECUTED','3:bfb3ce3ba16ec8f8206c296f743868e5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-79','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',79,'EXECUTED','3:7b7e2576df7e2b013c4609c905a1e89f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-80','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',80,'EXECUTED','3:f095dee1e812c9f76e21c526566bd348','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-81','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',81,'EXECUTED','3:0e6f358e54f708c3e05debfeae8027f8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-82','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',82,'EXECUTED','3:660f1dd76f869c29fde7efc6f7e1255e','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-83','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',83,'EXECUTED','3:43f98ac2e8ef569c2ace92091588dfc5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-84','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',84,'EXECUTED','3:72aa9950802d4e8da713013ae72ea212','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-85','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',85,'EXECUTED','3:5f58cf1966364d46c430e933f520332c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-86','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',86,'EXECUTED','3:930edd522020ea950b89ea3fcc60293f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-87','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',87,'EXECUTED','3:eef1806c4faaa543eabf7aa919ee1871','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-88','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',88,'EXECUTED','3:ba5ed5b46b50e4e696f26943e4846b38','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-89','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',89,'EXECUTED','3:25d42a7f59acd170516f566f91db477b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-90','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:53',90,'EXECUTED','3:0220e67c3c6e052be5b2683f3aff6cd9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-91','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',91,'EXECUTED','3:dbeb7f14726427f4332caba3c3882781','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-92','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',92,'EXECUTED','3:a4f2631814df0304d6e1a9142e0174a1','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-93','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',93,'EXECUTED','3:665d61220b4af809bb0048a73af9529d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-94','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',94,'EXECUTED','3:77fb476c14c92eda11701adb0a6d406f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-95','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',95,'EXECUTED','3:2e07882701f4d10d2c5249aefdae87ee','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-96','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',96,'EXECUTED','3:12e1f91eae40df9eda60c20d6f9c8874','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-97','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',97,'EXECUTED','3:72db70644086a38aa90367c038a89350','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-98','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',98,'EXECUTED','3:1d6bac1b7849a0442a162078696893e3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-99','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',99,'EXECUTED','3:7f6646bbd481090fa616c199b956b014','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-100','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',100,'EXECUTED','3:bbbcbaf05cf76c8236d9137a4a7a25ec','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-101','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',101,'EXECUTED','3:15f1e5f6e1f7c3308b084e536e88b9b8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-102','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',102,'EXECUTED','3:69b1aeed86840d511ac06119ad1f3c2a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-103','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',103,'EXECUTED','3:57d3f2fd8967dfd691fd95d30fb1c134','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-104','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:54',104,'EXECUTED','3:0e57f86b004bedba6c607c8d2c566164','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-105','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',105,'EXECUTED','3:55a89da076a5b87ce5e49e1db3ed3fb9','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-106','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',106,'EXECUTED','3:4db964219e3dde449c0a54d58d204a7b','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-107','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',107,'EXECUTED','3:0d50d294d4db44aed32f8c909114645d','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-108','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',108,'EXECUTED','3:9c39ac8c3d6ebc758e69da66cfc20283','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-109','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',109,'EXECUTED','3:254739c105dc46829b4019e6cd4daa8e','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-110','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',110,'EXECUTED','3:330cbde32db56aa70e52784794b743ff','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-111','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',111,'EXECUTED','3:39d0f5be8bc00a3752b5f49dd92866de','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-112','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',112,'EXECUTED','3:005cd1ac6366225c7124eb995c790329','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-113','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',113,'EXECUTED','3:aa9ef6bec758b8fef0d7f58d652f23ed','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-114','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',114,'EXECUTED','3:57037ae27d15fb149b2b18b70e3ac640','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-115','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',115,'EXECUTED','3:9a325bc706e5f056e25b5029c144c5d8','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-116','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',116,'EXECUTED','3:f5bef61b4276a1bf815b80abfbbdd0dd','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-117','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',117,'EXECUTED','3:7eff22e0b4befe8f4c445f1c5a58a15e','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-118','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',118,'EXECUTED','3:dadfa8f8caf1ae02cfc16ecbed0c8b90','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-119','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',119,'EXECUTED','3:138d0588ac80f0a920e484db36f4e97d','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-120','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',120,'EXECUTED','3:2a81f473aa411fe1bf94ff891f950f05','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-121','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',121,'EXECUTED','3:465b67c4800169a5ad1a1fa4cf9937ce','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-122','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',122,'EXECUTED','3:d9da052c7f29fb3f76a2a4056af176bd','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-123','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',123,'EXECUTED','3:7ebb4272b707b682e405cb30ebb3fccb','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-124','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',124,'EXECUTED','3:360b5d5226fa5eb0d62b8531c2812a05','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-125','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',125,'EXECUTED','3:963fdb094cb961a23659f3e19a1ddde3','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-126','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',126,'EXECUTED','3:b20bb3c187e6488863f9d5481665fdac','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-127','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',127,'EXECUTED','3:f3035f410a920573b57eb459d1bcd6b1','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-128','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',128,'EXECUTED','3:ca1cdff9e1a997ff2c7b285e84221ab3','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-129','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',129,'EXECUTED','3:b475e7347003735620c2366fe038ee40','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-130','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',130,'EXECUTED','3:5523e28282da63951996a88d29635632','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-131','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',131,'EXECUTED','3:484e71ddda004fcbb6f56b3a1df07c12','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-132','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',132,'EXECUTED','3:750f465a29368e3c472c7717368e5315','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-133','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',133,'EXECUTED','3:ed11a2642a9063cae1be4ee314990279','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-134','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',134,'EXECUTED','3:632199e3f5e02d7b644fef85e7c7a148','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-135','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',135,'EXECUTED','3:f6136a87270d6999c38c78c5a4507ba0','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-136','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',136,'EXECUTED','3:3b8cdb7c8a87aded69e76f1127d93338','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-137','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',137,'EXECUTED','3:f21de5aaf5812d3b53ff6ba37c500419','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-138','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:55',138,'EXECUTED','3:212ee29342faa1bb2b4a50cfdfdf9a78','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-139','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',139,'EXECUTED','3:c1cd1a61a496daaf1bc3e941f84aa781','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-140','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',140,'EXECUTED','3:d5266cebc05f66e670752fd599970deb','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-141','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',141,'EXECUTED','3:1846e834301cbacca345ad1d30c97783','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-142','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',142,'EXECUTED','3:02dd707d2304800fa3353b76b4b14a79','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-143','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',143,'EXECUTED','3:c7d786a54bd2744456d86331287eaf88','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-144','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',144,'EXECUTED','3:d83e1d31be4d2a88a30cef280323dc14','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-145','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',145,'EXECUTED','3:2c8d1d5abd94c1f1b77b812e5a218703','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-146','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',146,'EXECUTED','3:98959c39111d467dbaef246b4e77c7d4','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-147','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',147,'EXECUTED','3:2f5b3db90f5fe8d7166b8698732d89ee','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-148','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',148,'EXECUTED','3:b6ab8ac7897d485ec2c01795fdbacba6','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-149','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',149,'EXECUTED','3:4621bf17b5d622b52e70ee84a2720ce4','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-150','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',150,'EXECUTED','3:d706f00de9bf475742860188e15d7b41','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-151','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',151,'EXECUTED','3:003b820bd40132476357aae25ba7d50b','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-152','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',152,'EXECUTED','3:cbe9e0b14bac88a7b895d8bc4c4777d7','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-153','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',153,'EXECUTED','3:38dc59e34869bc2425c7c820ba45cb9b','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-154','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',154,'EXECUTED','3:1822fb3caf8d43038c67a53fdb75e432','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-155','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',155,'EXECUTED','3:8416952db331ffa2dd27dc4f5734036c','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-156','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',156,'EXECUTED','3:4c2b2e5a5a4ee0175cab19c8b6ee084c','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-157','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',157,'EXECUTED','3:c5bf072f2de5890c8b3e22c07577f5ad','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-158','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',158,'EXECUTED','3:61b84144638971ed2b9f8a2a0fb1484f','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-159','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',159,'EXECUTED','3:edef41963c0d8e8d51ad15aa7a757420','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-160','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',160,'EXECUTED','3:6d94d16cf714dd8872660b484e632513','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-161','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',161,'EXECUTED','3:c47020da3e40d9b6239153776affab17','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-162','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',162,'EXECUTED','3:8c1de34a4070d7a104ef5595ff365355','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-163','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',163,'EXECUTED','3:00c8bf9c83805a10ad1abbfe6cabdba8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-164','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',164,'EXECUTED','3:3fa310189e738082742a06c3751f2f3e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-165','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:56',165,'EXECUTED','3:0ed5111ef301a24755a17b99ba609336','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-166','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',166,'EXECUTED','3:f781f197771175ae97a798ae4c732613','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-167','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',167,'EXECUTED','3:f82641b8c47ac3372c38bd410315f1d7','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-168','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',168,'EXECUTED','3:e819b9f5b305d94a874ffff77f1b0b00','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-169','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',169,'EXECUTED','3:e638fd6a15647613720dfab7af6c67af','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-170','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',170,'EXECUTED','3:5f2cae397111f9c4c4112a513b9e811f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-171','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',171,'EXECUTED','3:0cd6d510389a9b5c7e7707baabf175d1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-172','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',172,'EXECUTED','3:1e0dbe21557bd995cc4e10c17b06ad77','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-173','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',173,'EXECUTED','3:3c00120a79d285e58d49014dc3b3def2','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-174','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',174,'EXECUTED','3:a5d223789fb73e1b821bdd45c72478c8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-175','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',175,'EXECUTED','3:b7e560667260a76220664084e75a699b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-176','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',176,'EXECUTED','3:a04c06f20662d01674c2481258088719','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-177','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',177,'EXECUTED','3:eda6446777e754a9b28667808386fc07','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-178','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',178,'EXECUTED','3:cc43a952d1f4e90ae8ca08a86400b5b8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-179','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',179,'EXECUTED','3:3b7feac7849308d546f9e32306a0337b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-180','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',180,'EXECUTED','3:626dfbab1f6c43cbf5eda15af6c2d0b4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-181','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',181,'EXECUTED','3:5d35e584fe5144871639463ab48448d9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-182','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',182,'EXECUTED','3:54f532733816ed1173eb0a0978bc5d80','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-183','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',183,'EXECUTED','3:edf8db4cfb961a06787936314df7b94e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-184','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',184,'EXECUTED','3:1e122af08a912e15ee5c66f91b6c5bfa','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-185','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',185,'EXECUTED','3:49c144bddd204a4b53a3fa24016b0be2','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-186','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',186,'EXECUTED','3:7f27b6d4f3c5e0b00fb64f7131248b36','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-187','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:57',187,'EXECUTED','3:9c92c633ec12d7a6df8b65c97ad0fa35','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-188','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',188,'EXECUTED','3:94a94a8ce91fc86d16d4fa653a0d1453','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-189','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',189,'EXECUTED','3:b338072cafac27857c87f450a2ad6c46','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-190','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',190,'EXECUTED','3:9d5bd211cfd49f3b9fc91441f5eb908f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-191','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',191,'EXECUTED','3:bc7668fdd82c710bf043fa2f8a95dbeb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-192','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',192,'EXECUTED','3:9a377a1c95da43a4a33381c22ed4e951','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-193','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',193,'EXECUTED','3:73a6387f780aa23e047099f18b15b50f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-194','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',194,'EXECUTED','3:8b99d9b4b1544d9b15595cfcc5e5ec4f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-195','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',195,'EXECUTED','3:c267aaa5cd192977a88171f504e04f29','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-196','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',196,'EXECUTED','3:8667c573c47e4d0fbcc32caa84df333a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-197','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',197,'EXECUTED','3:f11c3d339e18a174df76d41cd195f9de','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-198','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',198,'EXECUTED','3:05a89763fa1de7b97f16102791cfefed','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-199','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',199,'EXECUTED','3:c14c67e4fab2a4378ba63d3da1fb628a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-200','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',200,'EXECUTED','3:382f1905a4228bd3e9f0c040c970cde3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-201','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',201,'EXECUTED','3:1bac4b4ae207d8838f091c32cb2df31e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-202','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',202,'EXECUTED','3:40a79714aa74711e54e351fd7ae769a8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-203','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',203,'EXECUTED','3:a1500cdb8370f8da80715f3150d2da41','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-204','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',204,'EXECUTED','3:7ed433c571a7829ad2eb6e5389433468','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-205','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',205,'EXECUTED','3:684a3d66bf7275618fdaf47f577dca5f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-206','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:58',206,'EXECUTED','3:f90e8c7e57222696be65ba1a75afe0e1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-207','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',207,'EXECUTED','3:d903424e7e44b1c1fb8c9d00bbaa5ff9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-208','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',208,'EXECUTED','3:6f03b7841548675d0c674dfc8a58a76a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-209','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',209,'EXECUTED','3:69684a0db21bbdbec2ffba0b151a73bd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-210','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',210,'EXECUTED','3:70d4db37a0127109f4e99eede4265e9e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-211','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',211,'EXECUTED','3:0dc5817e042530305a63787cd51c3d44','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-212','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',212,'EXECUTED','3:1b87cb4d62001fa3a6cd5df2bfee271f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-213','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',213,'EXECUTED','3:43bb14279d4807f3bb02f8c800ac6ec6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-214','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',214,'EXECUTED','3:2250070459940c11e7ff31a4192c9355','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-215','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',215,'EXECUTED','3:1abe6242372fb6a1b8b7d5ed11c40cf6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-216','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',216,'EXECUTED','3:365ccb2007a7db5a42a8558640d149e9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-217','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',217,'EXECUTED','3:ec8d6d84ea00f6c7ece30c6d1ada877d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-218','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',218,'EXECUTED','3:00a5c1aff60bf17c4f63c781d3d8868f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-219','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',219,'EXECUTED','3:80d78dda5a5d7a6e5b490c9b28841b16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-220','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',220,'EXECUTED','3:3a8fd566182b2a101e0e843990cfa8df','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-221','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',221,'EXECUTED','3:229616a00b74e7128b9eeb41293cd91e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-222','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',222,'EXECUTED','3:ed9f60b9f8d7881c11360f2a020bdf4b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-223','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',223,'EXECUTED','3:fee2321152589ea84c5743175d4c180a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-224','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',224,'EXECUTED','3:f6ef1f3ee7da7a147539b46f9c1cf60b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-225','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',225,'EXECUTED','3:21557deb9ad7b4c25504862864502b1c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-226','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',226,'EXECUTED','3:24adfcd3a41ae5648ffc2002dae0e4ef','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-227','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:52:59',227,'EXECUTED','3:bdd3cffbe9466ccbf6a1a791d61230fd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-228','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',228,'EXECUTED','3:2182868d8f52e97c110e8901f8e2fc34','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-229','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',229,'EXECUTED','3:43b57b5e0d38ae69053bfcaf10d4ba8d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-230','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',230,'EXECUTED','3:96d1199f9a6a19da0e6bac41293cf0ab','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-231','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',231,'EXECUTED','3:d493ad51ca6712c994efb741c1cd5cee','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-232','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',232,'EXECUTED','3:611e912194a15238fe4fd70e46ecd271','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-233','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',233,'EXECUTED','3:4823fd19347ba5a9c14b862fac025901','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-234','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:00',234,'EXECUTED','3:7aa2f827cf3710d979cd5c62770417bb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-235','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',235,'EXECUTED','3:1d77a4d184e0f24891d62762883540af','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-236','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',236,'EXECUTED','3:354ab31aec28364faae025882682084a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-237','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',237,'EXECUTED','3:fb6d4b2090d92c3a4d685cb13176ee98','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-238','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',238,'EXECUTED','3:e91f5bf74998ca513288ed138c0da97d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-239','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',239,'EXECUTED','3:f07664fc56241ad077820f8da9bad209','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-240','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',240,'EXECUTED','3:3cf705e46d55107e249d5a69dbfbe650','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-241','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',241,'EXECUTED','3:3de02419d8b4096899d78e2cd84d7e0b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-242','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',242,'EXECUTED','3:4b074cd6de5562d41ae3506d8d4b35f3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-243','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',243,'EXECUTED','3:b577e13ab196e4c075b8be09841abb4a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-244','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',244,'EXECUTED','3:9ad3d17bbbac8f995a1313d24c37c816','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-245','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',245,'EXECUTED','3:6ed5e004af84bf9f2cfe8858fd2a5693','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-246','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',246,'EXECUTED','3:72287bc729bb6699bb3bc2210d12dfd4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-247','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',247,'EXECUTED','3:cb0dc7b3886d0b94d5052539bd683a16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-248','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',248,'EXECUTED','3:359b88a585529cbf0d688ded52661d0d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-249','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:01',249,'EXECUTED','3:bc3e3f311891541c94bafaa8250b3837','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-250','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',250,'EXECUTED','3:873b0ba69634f01ec622ca9b24d9e70a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-251','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',251,'EXECUTED','3:c137a192ad74895a6049234b596fecb5','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-252','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',252,'EXECUTED','3:793cd0492af23c4c209def47673ca914','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-253','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',253,'EXECUTED','3:d76b0b4675c504576f872e68c5e9bda7','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-254','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',254,'EXECUTED','3:eee13cf5dc3e864e56c6a9b03079578e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-255','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',255,'EXECUTED','3:f9088ee9f92067cab4b207d3aae3a37b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-256','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',256,'EXECUTED','3:e2326617f1c9b860249a0c0777ec20f6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-257','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',257,'EXECUTED','3:adf9400fc812eb6c8f7d32aa787742e6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-258','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',258,'EXECUTED','3:60fc7ab467e364cd6a3d72d2f4f1d736','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-259','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',259,'EXECUTED','3:a6cacd22103e0447094d9a161d7b7445','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-260','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',260,'EXECUTED','3:76bf1eb3a6880473927e7a101d037bd8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-261','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',261,'EXECUTED','3:5e2d94e8e56a7c57936a8bce78066b96','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-262','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',262,'EXECUTED','3:b6e995091bd0a2aed951e2fbf3f215a3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-263','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',263,'EXECUTED','3:5a57fa35a8c7ca09756afcad21d8e86f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-264','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',264,'EXECUTED','3:a7fc2f018277eaaa7649fb46b6b27ab6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-265','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',265,'EXECUTED','3:528d191ec33204cee277f7312c49cc2c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-266','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:02',266,'EXECUTED','3:deb083face872d4d49b666a9b8bdfaba','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-267','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',267,'EXECUTED','3:a7b87e7b2788c237ebeef3591092532e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-268','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',268,'EXECUTED','3:8e9f116ff4830eb847589e5b4e62852e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-269','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',269,'EXECUTED','3:595c174489187fc62b19670995c5cbff','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-270','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',270,'EXECUTED','3:d7a769415b86b93205327adc4b037e45','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-271','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',271,'EXECUTED','3:06906c810ec8b347c75867ab21f7dc4c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-272','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',272,'EXECUTED','3:a28d48ed75ff265b6472e9749f95d1a5','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-273','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',273,'EXECUTED','3:5990b5955a764200dd54eb4dd3b0a7cf','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-274','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:03',274,'EXECUTED','3:5d4cc1738a27175979f1c973b1bd5ea9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-275','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',275,'EXECUTED','3:d9130cc23b8afa27fd84f7c72d818efd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-276','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',276,'EXECUTED','3:18feaa2b4b9cbce46ea7b7a0c710de9f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-277','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',277,'EXECUTED','3:506fb6a53c157ce68105f451ad5958ff','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-278','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',278,'EXECUTED','3:b02c658ae947d20ac0ee1d207ebd210e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-279','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',279,'EXECUTED','3:c346d8903750d250fabc343064880e6f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-280','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',280,'EXECUTED','3:37fcf9ad58b891a096b9c95f4ea57b58','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-281','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',281,'EXECUTED','3:611486b58c51ad97deab489a17b23e2e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-282','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',282,'EXECUTED','3:0efe8669ed086af6da655a53d4ced916','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-283','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',283,'EXECUTED','3:730ece3259ea1ee3ffa53563790465d8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-284','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',284,'EXECUTED','3:5eb111d4b478c0c9a66a3a4a112c1c6b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-285','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:04',285,'EXECUTED','3:b7d27d03ee27cc13c76c5262d518b876','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-286','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',286,'EXECUTED','3:3663d9ecd66964bffcc07bcfce7bdcdc','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-287','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',287,'EXECUTED','3:35e0a6356d11ed9dfe53c300b9e2ffee','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-288','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',288,'EXECUTED','3:4ae0336d6b9d807036d03ad041b67052','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-289','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',289,'EXECUTED','3:2da61d1b760209a704e29bfa4a22455e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-290','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',290,'EXECUTED','3:2604fb5ddeccc31b1dccd4cd0bad4342','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-291','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',291,'EXECUTED','3:da9d240fdde86539e1580b84687e0189','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-292','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',292,'EXECUTED','3:0dc9aa5380e9a48fe9aaf306235988a4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-293','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',293,'EXECUTED','3:58c6315352f7cefbddeb9b3a38d1e140','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-294','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',294,'EXECUTED','3:91398a7f542f90a13d1f857ca3937de1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-295','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',295,'EXECUTED','3:5395eb857489412499e37c691ea36b8f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-296','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',296,'EXECUTED','3:494a1128a80caad8d24c5f3574ef6edd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-297','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',297,'EXECUTED','3:fa3b4dd73dd82e3a26c6563c9828fba3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-298','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',298,'EXECUTED','3:e83453938c668f856d1df1537ec25d37','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-299','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',299,'EXECUTED','3:c5655c084990797f73bf295660881932','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-300','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',300,'EXECUTED','3:4747b6b28b49b810444aa6af7c133fab','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-301','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',301,'EXECUTED','3:f73d714400c8712c0715e2da673e9509','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-302','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',302,'EXECUTED','3:4d50b8c05ded66b150571543bcd91a37','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-303','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',303,'EXECUTED','3:7a5e18b1ed8e9813ca4920bd0856ecd0','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-304','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',304,'EXECUTED','3:e52f19afd5f5966cff359311b4c3acac','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-305','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',305,'EXECUTED','3:8548d763866edc7944ec1b0facb1560f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-306','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',306,'EXECUTED','3:fc14a87fde20c7151888cea5c48c6f39','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-307','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',307,'EXECUTED','3:23a513bb939d6d2751a1550188c32222','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-308','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:05',308,'EXECUTED','3:4144c0d934e5fd823f19ef91da210ffa','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-309','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',309,'EXECUTED','3:c0d764328d333e644989448a4cd480bb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-310','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',310,'EXECUTED','3:461ea2548e20f99478f3203dbf33bc16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-311','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',311,'EXECUTED','3:3eeefe2f703d57218dde9b05fcdbc5cf','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-312','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',312,'EXECUTED','3:564cd8aac65a0319c9c3c75a486ace41','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-313','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',313,'EXECUTED','3:48d80e1c9868d51d687680b42fe47f3d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-314','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',314,'EXECUTED','3:6c6213c38e211d11aa77f0766a18e1fe','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-315','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',315,'EXECUTED','3:f522ccbad33e6a463b265e241c4ae0db','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-316','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',316,'EXECUTED','3:e5777dd44529b270c7514bc322d72105','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-317','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',317,'EXECUTED','3:5a1c1fb8b9f6cce7fbaa03b255b5a033','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-318','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',318,'EXECUTED','3:ad070f00871b05e431528e34c3f09cde','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-319','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',319,'EXECUTED','3:1dde4f2407d314306ae29ad174d98de3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-320','mrego','src/main/resources/db.changelog-database.xml','2010-12-14 09:53:06',320,'EXECUTED','3:5a5608b194d0ec72e2b8f53675ff8de0','Insert Row','',NULL,'2.0-rc7'),('resize-precision-in-planning_data','dpino','src/main/resources/db.changelog-initial.xml','2010-12-14 09:53:06',321,'EXECUTED','3:3ee94e7e64b7ed2592dfb71db6923a1c','Modify data type (x2)','Resize precision for \'progress_by_duration\' and \'progress_by_num_hours\' fields',NULL,'2.0-rc7'),('add-company-logo-url-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2010-12-14 09:53:06',322,'EXECUTED','3:4aaf4686820ae6093eb2f20afd60bf65','Add Column, Add Default Value','Add new column with configuration setting',NULL,'2.0-rc7'),('add-scenarios-enabled-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2010-12-14 09:53:06',323,'EXECUTED','3:03fca59fe0844f8c537a527e31670021','Add Column, Add Default Value','Add new column with scenarios visibility flag',NULL,'2.0-rc7');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_assignment`
--

DROP TABLE IF EXISTS `advance_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_assignment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `report_global_advance` tinyint(1) DEFAULT NULL,
  `advance_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkd4192eaab216ed4c` (`advance_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_assignment`
--

LOCK TABLES `advance_assignment` WRITE;
/*!40000 ALTER TABLE `advance_assignment` DISABLE KEYS */;
INSERT INTO `advance_assignment` VALUES (2424,35,1,809),(2425,33,0,809),(2426,33,1,808),(2433,33,0,809),(2434,33,1,808),(2441,33,0,809),(2442,33,1,808);
/*!40000 ALTER TABLE `advance_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_assignment_template`
--

DROP TABLE IF EXISTS `advance_assignment_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_assignment_template` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `advance_type_id` bigint(20) DEFAULT NULL,
  `order_element_template_id` bigint(20) DEFAULT NULL,
  `report_global_advance` tinyint(1) DEFAULT NULL,
  `max_value` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkd9bfae6fb216ed4c` (`advance_type_id`),
  KEY `fkd9bfae6f19b9dfde` (`order_element_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_assignment_template`
--

LOCK TABLES `advance_assignment_template` WRITE;
/*!40000 ALTER TABLE `advance_assignment_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_assignment_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_measurement`
--

DROP TABLE IF EXISTS `advance_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_measurement` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `advance_assignment_id` bigint(20) DEFAULT NULL,
  `communication_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkdaba2f7fa9e53843` (`advance_assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_measurement`
--

LOCK TABLES `advance_measurement` WRITE;
/*!40000 ALTER TABLE `advance_measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_type`
--

DROP TABLE IF EXISTS `advance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `default_max_value` decimal(19,4) DEFAULT NULL,
  `updatable` tinyint(1) DEFAULT NULL,
  `unit_precision` decimal(19,4) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `percentage` tinyint(1) DEFAULT NULL,
  `quality_form` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advance_type_unit_name_key` (`unit_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_type`
--

LOCK TABLES `advance_type` WRITE;
/*!40000 ALTER TABLE `advance_type` DISABLE KEYS */;
INSERT INTO `advance_type` VALUES (808,4,'children','100.0000',0,'0.0100',1,1,0),(809,3,'percentage','100.0000',0,'0.0100',1,1,0),(810,2,'units','2147483647.0000',0,'1.0000',1,0,0),(811,1,'subcontractor','100.0000',0,'0.0100',1,1,0);
/*!40000 ALTER TABLE `advance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_criterions`
--

DROP TABLE IF EXISTS `all_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_criterions` (
  `generic_resource_allocation_id` bigint(20) NOT NULL,
  `criterion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`generic_resource_allocation_id`,`criterion_id`),
  KEY `fk7980035061f02c44` (`criterion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_criterions`
--

LOCK TABLES `all_criterions` WRITE;
/*!40000 ALTER TABLE `all_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `all_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_function`
--

DROP TABLE IF EXISTS `assignment_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_function` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_function`
--

LOCK TABLES `assignment_function` WRITE;
/*!40000 ALTER TABLE `assignment_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_calendar`
--

DROP TABLE IF EXISTS `base_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_calendar` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code_autogenerated` tinyint(1) DEFAULT NULL,
  `last_sequence_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_calendar_code_key` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_calendar`
--

LOCK TABLES `base_calendar` WRITE;
/*!40000 ALTER TABLE `base_calendar` DISABLE KEYS */;
INSERT INTO `base_calendar` VALUES (202,1,'CALENDAR00001','Default',1,0);
/*!40000 ALTER TABLE `base_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_availability`
--

DROP TABLE IF EXISTS `calendar_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_availability` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `position_in_calendar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_availability_code_key` (`code`),
  KEY `fk557738bca44abee3` (`base_calendar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_availability`
--

LOCK TABLES `calendar_availability` WRITE;
/*!40000 ALTER TABLE `calendar_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_data`
--

DROP TABLE IF EXISTS `calendar_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_data` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `expiring_date` date DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `position_in_calendar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_data_code_key` (`code`),
  KEY `fk74fc040ba44abee3` (`base_calendar_id`),
  KEY `fk74fc040b7fa34e3f` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_data`
--

LOCK TABLES `calendar_data` WRITE;
/*!40000 ALTER TABLE `calendar_data` DISABLE KEYS */;
INSERT INTO `calendar_data` VALUES (303,1,'67100484-1bee-40e4-b633-676476475c3f',NULL,NULL,202,0);
/*!40000 ALTER TABLE `calendar_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_exception`
--

DROP TABLE IF EXISTS `calendar_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_exception` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `calendar_exception_id` bigint(20) DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_exception_code_key` (`code`),
  KEY `fka215508ea44abee3` (`base_calendar_id`),
  KEY `fka215508eadad7e51` (`calendar_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_exception`
--

LOCK TABLES `calendar_exception` WRITE;
/*!40000 ALTER TABLE `calendar_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_exception_type`
--

DROP TABLE IF EXISTS `calendar_exception_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_exception_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `not_assignable` tinyint(1) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_exception_type_code_key` (`code`),
  UNIQUE KEY `calendar_exception_type_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_exception_type`
--

LOCK TABLES `calendar_exception_type` WRITE;
/*!40000 ALTER TABLE `calendar_exception_type` DISABLE KEYS */;
INSERT INTO `calendar_exception_type` VALUES (505,11,'CALENDAR_EXCEPTION_TYPE00001',1,'HOLIDAY','red',1,0),(506,9,'CALENDAR_EXCEPTION_TYPE00002',1,'SICK_LEAVE','red',1,0),(507,7,'CALENDAR_EXCEPTION_TYPE00003',1,'LEAVE','red',1,0),(508,5,'CALENDAR_EXCEPTION_TYPE00004',1,'STRIKE','red',1,0),(509,3,'CALENDAR_EXCEPTION_TYPE00005',1,'BANK_HOLIDAY','red',1,0),(510,1,'CALENDAR_EXCEPTION_TYPE00006',1,'WORKABLE_BANK_HOLIDAY','orange',0,0);
/*!40000 ALTER TABLE `calendar_exception_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `configuration_id` bigint(20) DEFAULT NULL,
  `company_code` varchar(255) DEFAULT NULL,
  `generate_code_for_cost_category` tinyint(1) NOT NULL,
  `generate_code_for_calendar_exception_type` tinyint(1) NOT NULL,
  `generate_code_for_work_report_type` tinyint(1) NOT NULL,
  `generate_code_for_criterion` tinyint(1) NOT NULL,
  `generate_code_for_label` tinyint(1) NOT NULL,
  `generate_code_for_work_report` tinyint(1) NOT NULL,
  `generate_code_for_resources` tinyint(1) NOT NULL,
  `generate_code_for_types_of_work_hours` tinyint(1) NOT NULL,
  `generate_code_for_material_categories` tinyint(1) NOT NULL,
  `generate_code_for_unit_types` tinyint(1) NOT NULL,
  `generate_code_for_base_calendars` tinyint(1) NOT NULL,
  `expand_company_planning_view_charts` tinyint(1) NOT NULL,
  `expand_order_planning_view_charts` tinyint(1) NOT NULL,
  `expand_resource_load_view_charts` tinyint(1) NOT NULL,
  `monte_carlo_method_tab_visible` tinyint(1) NOT NULL,
  `progress_type` int(11) DEFAULT NULL,
  `company_logo_url` varchar(255) DEFAULT '',
  `scenarios_visible` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk733374f6cc119699` (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (404,14,202,'COMPANY_CODE',1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,'',1);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consolidated_value`
--

DROP TABLE IF EXISTS `consolidated_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidated_value` (
  `id` bigint(20) NOT NULL,
  `consolidated_value_type` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `task_end_date` date DEFAULT NULL,
  `consolidation_id` bigint(20) DEFAULT NULL,
  `advance_measurement_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk35588e2db96bba28` (`advance_measurement_id`),
  KEY `fk35588e2d3ae24ff8` (`consolidation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consolidated_value`
--

LOCK TABLES `consolidated_value` WRITE;
/*!40000 ALTER TABLE `consolidated_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `consolidated_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consolidation`
--

DROP TABLE IF EXISTS `consolidation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidation` (
  `id` bigint(20) NOT NULL,
  `consolidation_type` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `dir_advance_assignment_id` bigint(20) DEFAULT NULL,
  `ind_advance_assignment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkc9400e2c9f1d6611` (`dir_advance_assignment_id`),
  KEY `fkc9400e2c430ea1de` (`ind_advance_assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consolidation`
--

LOCK TABLES `consolidation` WRITE;
/*!40000 ALTER TABLE `consolidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `consolidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_category`
--

DROP TABLE IF EXISTS `cost_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_category` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `last_hour_cost_sequence_code` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cost_category_code_key` (`code`),
  UNIQUE KEY `cost_category_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_category`
--

LOCK TABLES `cost_category` WRITE;
/*!40000 ALTER TABLE `cost_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterion`
--

DROP TABLE IF EXISTS `criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterion` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `predefined_criterion_internal_name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `id_criterion_type` bigint(20) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterion_code_key` (`code`),
  UNIQUE KEY `criterion_name_key` (`id_criterion_type`,`name`),
  KEY `fk16e20ea13a156175` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion`
--

LOCK TABLES `criterion` WRITE;
/*!40000 ALTER TABLE `criterion` DISABLE KEYS */;
INSERT INTO `criterion` VALUES (707,25,'CRITERION00001-00001','medicalLeave','medicalLeave',1,196608,NULL),(708,23,'CRITERION00001-00002','paternityLeave','paternityLeave',1,196608,NULL),(709,6,'CRITERION00006-00001','hiredResourceWorkingRelationship','hiredResourceWorkingRelationship',1,196613,NULL),(710,4,'CRITERION00006-00002','firedResourceWorkingRelationship','firedResourceWorkingRelationship',1,196613,NULL);
/*!40000 ALTER TABLE `criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterion_requirement`
--

DROP TABLE IF EXISTS `criterion_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterion_requirement` (
  `id` bigint(20) NOT NULL,
  `criterion_requirement_type` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `hours_group_id` bigint(20) DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  `order_element_template_id` bigint(20) DEFAULT NULL,
  `criterion_id` bigint(20) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkef395fa561f02c44` (`criterion_id`),
  KEY `fkef395fa5e036cfed` (`hours_group_id`),
  KEY `fkef395fa5efda874f` (`order_element_id`),
  KEY `fkef395fa519b9dfde` (`order_element_template_id`),
  KEY `fkef395fa5f41d57f2` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion_requirement`
--

LOCK TABLES `criterion_requirement` WRITE;
/*!40000 ALTER TABLE `criterion_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `criterion_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterion_satisfaction`
--

DROP TABLE IF EXISTS `criterion_satisfaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterion_satisfaction` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `criterion` bigint(20) NOT NULL,
  `resource` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterion_satisfaction_code_key` (`code`),
  KEY `fk225ff96a8c4c676c` (`criterion`),
  KEY `fk225ff96aeae850b2` (`resource`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion_satisfaction`
--

LOCK TABLES `criterion_satisfaction` WRITE;
/*!40000 ALTER TABLE `criterion_satisfaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `criterion_satisfaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterion_type`
--

DROP TABLE IF EXISTS `criterion_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterion_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `predefined_type_internal_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `allow_simultaneous_criterions_per_resource` tinyint(1) DEFAULT NULL,
  `allow_hierarchy` tinyint(1) DEFAULT NULL,
  `last_criterion_sequence_code` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `resource` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterion_type_code_key` (`code`),
  UNIQUE KEY `criterion_type_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion_type`
--

LOCK TABLES `criterion_type` WRITE;
/*!40000 ALTER TABLE `criterion_type` DISABLE KEYS */;
INSERT INTO `criterion_type` VALUES (196608,26,'CRITERION00001','LEAVE','LEAVE','Leave',0,0,2,1,1,0),(196609,20,'CRITERION00002','MACHINE_LOCATION_GROUP','MACHINE_LOCATION_GROUP','Location where there are machines',1,0,0,1,1,1),(196610,17,'CRITERION00003','CATEGORY','CATEGORY','Professional category',1,1,0,1,1,0),(196611,14,'CRITERION00004','TRAINING','TRAINING','Training courses and labor training',1,1,0,1,1,0),(196612,11,'CRITERION00005','JOB','JOB','Job',1,1,0,1,1,0),(196613,8,'CRITERION00006','WORK_RELATIONSHIP','WORK_RELATIONSHIP','Relationship of the resource with the enterprise ',0,0,2,1,1,0),(196614,1,'CRITERION00007','LOCATION_GROUP','LOCATION_GROUP','Location where the workers work',1,0,0,1,1,0);
/*!40000 ALTER TABLE `criterion_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_assignment`
--

DROP TABLE IF EXISTS `day_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_assignment` (
  `id` bigint(20) NOT NULL,
  `day_assignment_type` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `consolidated` tinyint(1) DEFAULT NULL,
  `day` date NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `specific_container_id` bigint(20) DEFAULT NULL,
  `generic_container_id` bigint(20) DEFAULT NULL,
  `derived_container_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkbb493f50510e7a78` (`derived_container_id`),
  KEY `fkbb493f5019256004` (`generic_container_id`),
  KEY `fkbb493f5048d21790` (`resource_id`),
  KEY `fkbb493f50756348a8` (`specific_container_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_assignment`
--

LOCK TABLES `day_assignment` WRITE;
/*!40000 ALTER TABLE `day_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `day_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependency`
--

DROP TABLE IF EXISTS `dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependency` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `origin` bigint(20) DEFAULT NULL,
  `destination` bigint(20) DEFAULT NULL,
  `queue_dependency` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkfe6ed34be838f362` (`destination`),
  KEY `fkfe6ed34b1545e7a` (`origin`),
  KEY `fkfe6ed34b9e788f90` (`queue_dependency`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency`
--

LOCK TABLES `dependency` WRITE;
/*!40000 ALTER TABLE `dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `derived_allocation`
--

DROP TABLE IF EXISTS `derived_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `derived_allocation` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resource_allocation_id` bigint(20) DEFAULT NULL,
  `configurationunit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkf0260c4287b470f0` (`configurationunit`),
  KEY `fkf0260c4275ed79ba` (`resource_allocation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derived_allocation`
--

LOCK TABLES `derived_allocation` WRITE;
/*!40000 ALTER TABLE `derived_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `derived_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `derived_day_assignments_container`
--

DROP TABLE IF EXISTS `derived_day_assignments_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `derived_day_assignments_container` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `derived_allocation_id` bigint(20) DEFAULT NULL,
  `scenario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkb83176c31b8e7cf2` (`derived_allocation_id`),
  KEY `fkb83176c3421c7cf4` (`scenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derived_day_assignments_container`
--

LOCK TABLES `derived_day_assignments_container` WRITE;
/*!40000 ALTER TABLE `derived_day_assignments_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `derived_day_assignments_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_values`
--

DROP TABLE IF EXISTS `description_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description_values` (
  `description_value_id` bigint(20) NOT NULL,
  `fieldname` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `fk7d1ee2c5fec79eb0` (`description_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_values`
--

LOCK TABLES `description_values` WRITE;
/*!40000 ALTER TABLE `description_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_values_in_line`
--

DROP TABLE IF EXISTS `description_values_in_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description_values_in_line` (
  `description_value_id` bigint(20) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `fk1e6bf5475c390c4` (`description_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_values_in_line`
--

LOCK TABLES `description_values_in_line` WRITE;
/*!40000 ALTER TABLE `description_values_in_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_values_in_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direct_advance_assignment`
--

DROP TABLE IF EXISTS `direct_advance_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_advance_assignment` (
  `advance_assignment_id` bigint(20) NOT NULL,
  `direct_order_element_id` bigint(20) DEFAULT NULL,
  `max_value` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`advance_assignment_id`),
  KEY `fk172a16c0a1127ce5` (`direct_order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_advance_assignment`
--

LOCK TABLES `direct_advance_assignment` WRITE;
/*!40000 ALTER TABLE `direct_advance_assignment` DISABLE KEYS */;
INSERT INTO `direct_advance_assignment` VALUES (2424,1824,'100.00');
/*!40000 ALTER TABLE `direct_advance_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `effort_per_day`
--

DROP TABLE IF EXISTS `effort_per_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `effort_per_day` (
  `base_calendar_id` bigint(20) NOT NULL,
  `effort` int(11) DEFAULT NULL,
  `day_id` int(11) NOT NULL,
  PRIMARY KEY (`base_calendar_id`,`day_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `effort_per_day`
--

LOCK TABLES `effort_per_day` WRITE;
/*!40000 ALTER TABLE `effort_per_day` DISABLE KEYS */;
INSERT INTO `effort_per_day` VALUES (303,28800,0),(303,28800,1),(303,28800,2),(303,28800,3),(303,28800,4),(303,0,5),(303,0,6);
/*!40000 ALTER TABLE `effort_per_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_sequence`
--

DROP TABLE IF EXISTS `entity_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_sequence` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `entity_name` int(11) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `last_value` int(11) DEFAULT NULL,
  `number_of_digits` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_sequence`
--

LOCK TABLES `entity_sequence` WRITE;
/*!40000 ALTER TABLE `entity_sequence` DISABLE KEYS */;
INSERT INTO `entity_sequence` VALUES (101,42,0,'ORDER',10,5,1),(102,38,1,'CRITERION',7,5,1),(103,30,2,'LABEL',0,5,1),(104,29,3,'MACHINE',0,5,1),(105,30,4,'WORKER',2,5,1),(106,35,5,'UNIT_TYPE',8,5,1),(107,26,6,'CALENDAR',1,5,1),(108,25,7,'WORK_HOURS_TYPE',0,5,1),(109,25,8,'MATERIAL_CATEGORY',1,5,1),(110,23,9,'WORK_REPORT',0,5,1),(111,22,10,'WORKREPORTTYPE',0,5,1),(112,27,11,'CALENDAR_EXCEPTION_TYPE',6,5,1),(113,20,12,'COST_CATEGORY',0,5,1),(114,19,13,'RESOURCE_CALENDAR',0,5,1),(115,18,14,'CRITERION_SATISFACTION',0,5,1),(116,17,15,'RESOURCE_COST_CATEGORY_ASSIGNMENT',0,5,1);
/*!40000 ALTER TABLE `entity_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_company`
--

DROP TABLE IF EXISTS `external_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_company` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `client` tinyint(1) DEFAULT NULL,
  `subcontractor` tinyint(1) DEFAULT NULL,
  `interacts_with_applications` tinyint(1) DEFAULT NULL,
  `app_uri` varchar(255) DEFAULT NULL,
  `our_company_login` varchar(255) DEFAULT NULL,
  `our_company_password` varchar(255) DEFAULT NULL,
  `company_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_company_name_key` (`name`),
  UNIQUE KEY `external_company_nif_key` (`nif`),
  KEY `fkd8e14c09b36a6d51` (`company_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_company`
--

LOCK TABLES `external_company` WRITE;
/*!40000 ALTER TABLE `external_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_day_assignments_container`
--

DROP TABLE IF EXISTS `generic_day_assignments_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_day_assignments_container` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resource_allocation_id` bigint(20) DEFAULT NULL,
  `scenario` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `duration_start_in_first_day` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration_in_last_day` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkc01655fdee970b` (`resource_allocation_id`),
  KEY `fkc01655fd421c7cf4` (`scenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_day_assignments_container`
--

LOCK TABLES `generic_day_assignments_container` WRITE;
/*!40000 ALTER TABLE `generic_day_assignments_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_day_assignments_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_resource_allocation`
--

DROP TABLE IF EXISTS `generic_resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_resource_allocation` (
  `resource_allocation_id` bigint(20) NOT NULL,
  `resource_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_allocation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_resource_allocation`
--

LOCK TABLES `generic_resource_allocation` WRITE;
/*!40000 ALTER TABLE `generic_resource_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heading_field`
--

DROP TABLE IF EXISTS `heading_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heading_field` (
  `heading_id` bigint(20) NOT NULL,
  `fieldname` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `positionnumber` int(11) DEFAULT NULL,
  KEY `fk2908787d415884f6` (`heading_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heading_field`
--

LOCK TABLES `heading_field` WRITE;
/*!40000 ALTER TABLE `heading_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `heading_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_unique_key`
--

DROP TABLE IF EXISTS `hibernate_unique_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_unique_key` (
  `next_hi` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_unique_key`
--

LOCK TABLES `hibernate_unique_key` WRITE;
/*!40000 ALTER TABLE `hibernate_unique_key` DISABLE KEYS */;
INSERT INTO `hibernate_unique_key` VALUES (32);
/*!40000 ALTER TABLE `hibernate_unique_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hour_cost`
--

DROP TABLE IF EXISTS `hour_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hour_cost` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `price_cost` decimal(19,2) DEFAULT NULL,
  `init_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `type_of_work_hours_id` bigint(20) DEFAULT NULL,
  `cost_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hour_cost_code_key` (`code`),
  KEY `fk3b9a8148c29ad8eb` (`cost_category_id`),
  KEY `fk3b9a8148d5b6184d` (`type_of_work_hours_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hour_cost`
--

LOCK TABLES `hour_cost` WRITE;
/*!40000 ALTER TABLE `hour_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `hour_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hours_group`
--

DROP TABLE IF EXISTS `hours_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hours_group` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `working_hours` int(11) NOT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `fixed_percentage` tinyint(1) DEFAULT NULL,
  `parent_order_line` bigint(20) DEFAULT NULL,
  `order_line_template` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hours_group_code_key` (`code`),
  KEY `fkd9b7594f8bdc6ac6` (`order_line_template`),
  KEY `fkd9b7594f1ed629ea` (`parent_order_line`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours_group`
--

LOCK TABLES `hours_group` WRITE;
/*!40000 ALTER TABLE `hours_group` DISABLE KEYS */;
INSERT INTO `hours_group` VALUES (2325,35,'ORDER00004-00001-00001','WORKER',123,'1.00',0,1824,NULL);
/*!40000 ALTER TABLE `hours_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirect_advance_assignment`
--

DROP TABLE IF EXISTS `indirect_advance_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indirect_advance_assignment` (
  `advance_assignment_id` bigint(20) NOT NULL,
  `indirect_order_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`advance_assignment_id`),
  KEY `fk64cbad3b8202350f` (`indirect_order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirect_advance_assignment`
--

LOCK TABLES `indirect_advance_assignment` WRITE;
/*!40000 ALTER TABLE `indirect_advance_assignment` DISABLE KEYS */;
INSERT INTO `indirect_advance_assignment` VALUES (2425,1821),(2426,1821),(2433,1821),(2434,1821),(2441,1821),(2442,1821);
/*!40000 ALTER TABLE `indirect_advance_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_code_key` (`code`),
  UNIQUE KEY `label_name_key` (`label_type_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_type`
--

DROP TABLE IF EXISTS `label_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `last_label_sequence_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_type_code_key` (`code`),
  UNIQUE KEY `label_type_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_type`
--

LOCK TABLES `label_type` WRITE;
/*!40000 ALTER TABLE `label_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limiting_resource_queue`
--

DROP TABLE IF EXISTS `limiting_resource_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limiting_resource_queue` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `limiting_resource_queue_resource_id_key` (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue`
--

LOCK TABLES `limiting_resource_queue` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `limiting_resource_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limiting_resource_queue_dependency`
--

DROP TABLE IF EXISTS `limiting_resource_queue_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limiting_resource_queue_dependency` (
  `id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `origin_queue_element_id` bigint(20) DEFAULT NULL,
  `destiny_queue_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk59485352e42f8d29` (`destiny_queue_element_id`),
  KEY `fk5948535228f2695` (`origin_queue_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue_dependency`
--

LOCK TABLES `limiting_resource_queue_dependency` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `limiting_resource_queue_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limiting_resource_queue_element`
--

DROP TABLE IF EXISTS `limiting_resource_queue_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limiting_resource_queue_element` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resource_allocation_id` bigint(20) DEFAULT NULL,
  `limiting_resource_queue_id` bigint(20) DEFAULT NULL,
  `earlier_start_date_because_of_gantt` datetime DEFAULT NULL,
  `earliest_end_date_because_of_gantt` datetime DEFAULT NULL,
  `creation_timestamp` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_hour` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_hour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `limiting_resource_queue_element_resource_allocation_id_key` (`resource_allocation_id`),
  KEY `fk1fc5f455bd2209e8` (`limiting_resource_queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue_element`
--

LOCK TABLES `limiting_resource_queue_element` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `limiting_resource_queue_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_field`
--

DROP TABLE IF EXISTS `line_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_field` (
  `heading_id` bigint(20) NOT NULL,
  `fieldname` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `positionnumber` int(11) DEFAULT NULL,
  KEY `fk88eecef415884f6` (`heading_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_field`
--

LOCK TABLES `line_field` WRITE;
/*!40000 ALTER TABLE `line_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `machine_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`machine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_configuration_unit_required_criterions`
--

DROP TABLE IF EXISTS `machine_configuration_unit_required_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_configuration_unit_required_criterions` (
  `id` bigint(20) NOT NULL,
  `criterion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`criterion_id`),
  KEY `fk95548d7861f02c44` (`criterion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_configuration_unit_required_criterions`
--

LOCK TABLES `machine_configuration_unit_required_criterions` WRITE;
/*!40000 ALTER TABLE `machine_configuration_unit_required_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_configuration_unit_required_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_worker_assignment`
--

DROP TABLE IF EXISTS `machine_worker_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_worker_assignment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `configuration_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fka2c1583686b2de7a` (`configuration_id`),
  KEY `fka2c158369bebcf10` (`worker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_worker_assignment`
--

LOCK TABLES `machine_worker_assignment` WRITE;
/*!40000 ALTER TABLE `machine_worker_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_worker_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_workers_configuration_unit`
--

DROP TABLE IF EXISTS `machine_workers_configuration_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_workers_configuration_unit` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alpha` decimal(19,2) NOT NULL,
  `machine` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkd47281efffeb5538` (`machine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_workers_configuration_unit`
--

LOCK TABLES `machine_workers_configuration_unit` WRITE;
/*!40000 ALTER TABLE `machine_workers_configuration_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_workers_configuration_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default_unit_price` decimal(19,2) DEFAULT NULL,
  `unit_type` bigint(20) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_code_key` (`code`),
  KEY `fk11d365279578651e` (`category_id`),
  KEY `fk11d36527f11b2d0` (`unit_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_assigment`
--

DROP TABLE IF EXISTS `material_assigment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_assigment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `units` decimal(19,2) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `estimated_availability` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkb3e9425b5c68337` (`material_id`),
  KEY `fkb3e9425efda874f` (`order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_assigment`
--

LOCK TABLES `material_assigment` WRITE;
/*!40000 ALTER TABLE `material_assigment` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_assigment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_assigment_template`
--

DROP TABLE IF EXISTS `material_assigment_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_assigment_template` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `units` decimal(19,2) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `order_element_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk35254354b5c68337` (`material_id`),
  KEY `fk3525435419b9dfde` (`order_element_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_assigment_template`
--

LOCK TABLES `material_assigment_template` WRITE;
/*!40000 ALTER TABLE `material_assigment_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_assigment_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_category`
--

DROP TABLE IF EXISTS `material_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_category` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `last_material_sequence_code` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_category_code_key` (`code`),
  KEY `fk84c66516b53669f2` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_category`
--

LOCK TABLES `material_category` WRITE;
/*!40000 ALTER TABLE `material_category` DISABLE KEYS */;
INSERT INTO `material_category` VALUES (1111,1,'MATERIAL_CATEGORY00001','Imported materials without category',1,0,NULL);
/*!40000 ALTER TABLE `material_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_authorization`
--

DROP TABLE IF EXISTS `order_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_authorization` (
  `id` bigint(20) NOT NULL,
  `order_authorization_subclass` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `authorization_type` varchar(255) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkb92b594887287288` (`order_id`),
  KEY `fkb92b5948edc4db41` (`profile_id`),
  KEY `fkb92b59485567ad13` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_authorization`
--

LOCK TABLES `order_authorization` WRITE;
/*!40000 ALTER TABLE `order_authorization` DISABLE KEYS */;
INSERT INTO `order_authorization` VALUES (1717,'user',1,'WRITE_AUTHORIZATION',1316,1213,NULL),(2222,'user',35,'WRITE_AUTHORIZATION',1821,1213,NULL),(2223,'user',1,'WRITE_AUTHORIZATION',1832,1213,NULL),(2224,'user',1,'WRITE_AUTHORIZATION',1836,1213,NULL),(2225,'user',1,'WRITE_AUTHORIZATION',1840,1213,NULL),(2226,'user',4,'WRITE_AUTHORIZATION',1844,1213,NULL),(2227,'user',4,'WRITE_AUTHORIZATION',1848,1213,NULL);
/*!40000 ALTER TABLE `order_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element`
--

DROP TABLE IF EXISTS `order_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `init_date` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `last_advance_meausurement_for_spreading` decimal(19,2) DEFAULT NULL,
  `dirty_last_advance_measurement_for_spreading` tinyint(1) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `template` bigint(20) DEFAULT NULL,
  `external_code` varchar(255) DEFAULT NULL,
  `sum_charged_hours_id` bigint(20) DEFAULT NULL,
  `position_in_container` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_element_code_key` (`code`),
  UNIQUE KEY `order_element_sum_charged_hours_id_key` (`sum_charged_hours_id`),
  KEY `fk92271f0b1e635c19` (`parent`),
  KEY `fk92271f0bd97bcc8c` (`template`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element`
--

LOCK TABLES `order_element` WRITE;
/*!40000 ALTER TABLE `order_element` DISABLE KEYS */;
INSERT INTO `order_element` VALUES (1316,4,'sdfsdf',NULL,'ORDER00003','2010-12-14 10:38:12',NULL,'0.00',0,NULL,NULL,NULL,1417,NULL),(1821,39,'elemedsfdsf',NULL,'ORDER00004','2010-12-14 10:53:41',NULL,'0.00',0,NULL,NULL,NULL,1922,NULL),(1824,35,'sdf.sdmf.ds',NULL,'ORDER00004-00001',NULL,NULL,'0.00',0,1821,NULL,NULL,1933,0),(1832,4,'sfdsfsdf',NULL,'ORDER00005','2010-12-14 11:08:07',NULL,'0.00',0,NULL,NULL,NULL,1941,NULL),(1836,4,'dsfdsf',NULL,'ORDER00006','2010-12-14 11:13:31',NULL,'0.00',0,NULL,NULL,NULL,1945,NULL),(1840,4,'elem',NULL,'ORDER00007','2010-12-14 11:18:28',NULL,'0.00',0,NULL,NULL,NULL,1949,NULL),(1844,7,'sdfsdf',NULL,'ORDER00008','2010-12-14 11:19:30',NULL,'0.00',0,NULL,NULL,NULL,1953,NULL),(1848,7,'sdfsdf',NULL,'ORDER00009','2010-12-14 11:21:29',NULL,'0.00',0,NULL,NULL,NULL,1957,NULL);
/*!40000 ALTER TABLE `order_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element_label`
--

DROP TABLE IF EXISTS `order_element_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element_label` (
  `order_element_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_element_id`,`label_id`),
  KEY `fke8344cc0c1c2746e` (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element_label`
--

LOCK TABLES `order_element_label` WRITE;
/*!40000 ALTER TABLE `order_element_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_element_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element_template`
--

DROP TABLE IF EXISTS `order_element_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element_template` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `start_as_days_from_beginning` int(11) DEFAULT NULL,
  `deadline_as_days_from_beginning` int(11) DEFAULT NULL,
  `scheduling_state_type` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `position_in_container` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4339b2e41638aab` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element_template`
--

LOCK TABLES `order_element_template` WRITE;
/*!40000 ALTER TABLE `order_element_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_element_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element_template_label`
--

DROP TABLE IF EXISTS `order_element_template_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element_template_label` (
  `order_element_template_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_element_template_id`,`label_id`),
  KEY `fk616de2a3c1c2746e` (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element_template_label`
--

LOCK TABLES `order_element_template_label` WRITE;
/*!40000 ALTER TABLE `order_element_template_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_element_template_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element_template_quality_form`
--

DROP TABLE IF EXISTS `order_element_template_quality_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element_template_quality_form` (
  `order_element_template_id` bigint(20) NOT NULL,
  `quality_form_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_element_template_id`,`quality_form_id`),
  KEY `fkfe6fb5758b37665c` (`quality_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element_template_quality_form`
--

LOCK TABLES `order_element_template_quality_form` WRITE;
/*!40000 ALTER TABLE `order_element_template_quality_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_element_template_quality_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `order_element_id` bigint(20) NOT NULL,
  `last_hours_group_sequence_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1824,1);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_group`
--

DROP TABLE IF EXISTS `order_line_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_group` (
  `order_element_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_group`
--

LOCK TABLES `order_line_group` WRITE;
/*!40000 ALTER TABLE `order_line_group` DISABLE KEYS */;
INSERT INTO `order_line_group` VALUES (1316),(1821),(1832),(1836),(1840),(1844),(1848);
/*!40000 ALTER TABLE `order_line_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_group_template`
--

DROP TABLE IF EXISTS `order_line_group_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_group_template` (
  `group_template_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_group_template`
--

LOCK TABLES `order_line_group_template` WRITE;
/*!40000 ALTER TABLE `order_line_group_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_group_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_template`
--

DROP TABLE IF EXISTS `order_line_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_template` (
  `order_line_template_id` bigint(20) NOT NULL,
  `last_hours_group_sequence_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_line_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_template`
--

LOCK TABLES `order_line_template` WRITE;
/*!40000 ALTER TABLE `order_line_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `order_element_id` bigint(20) NOT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `dependencies_constraints_have_priority` tinyint(1) DEFAULT NULL,
  `code_autogenerated` tinyint(1) DEFAULT NULL,
  `last_order_element_sequence_code` int(11) DEFAULT NULL,
  `work_budget` decimal(19,2) DEFAULT NULL,
  `materials_budget` decimal(19,2) DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `customer_reference` varchar(255) DEFAULT NULL,
  `external_code` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `customer` bigint(20) DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_element_id`),
  KEY `fk75a2f39da44abee3` (`base_calendar_id`),
  KEY `fk75a2f39d4ec080cf` (`customer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1316,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202),(1821,NULL,NULL,1,1,'0.00','0.00',123,NULL,NULL,0,NULL,202),(1832,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202),(1836,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202),(1840,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202),(1844,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202),(1848,NULL,NULL,1,0,'0.00','0.00',0,NULL,NULL,0,NULL,202);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_template`
--

DROP TABLE IF EXISTS `order_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_template` (
  `order_template_id` bigint(20) NOT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_template_id`),
  KEY `fk6476ce4ba44abee3` (`base_calendar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_template`
--

LOCK TABLES `order_template` WRITE;
/*!40000 ALTER TABLE `order_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_version`
--

DROP TABLE IF EXISTS `order_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_version` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `modification_by_owner_timestamp` datetime DEFAULT NULL,
  `ownerscenario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fka391ce7a2380ca7` (`ownerscenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_version`
--

LOCK TABLES `order_version` WRITE;
/*!40000 ALTER TABLE `order_version` DISABLE KEYS */;
INSERT INTO `order_version` VALUES (1619,5,'2010-12-14 10:38:30',909),(2124,73,'2010-12-14 11:02:42',909),(2132,5,'2010-12-14 11:08:17',909),(2136,5,'2010-12-14 11:13:38',909),(2140,5,'2010-12-14 11:18:34',909),(2144,11,'2010-12-14 11:19:46',909),(2148,11,'2010-12-14 11:24:25',909);
/*!40000 ALTER TABLE `order_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning_data`
--

DROP TABLE IF EXISTS `planning_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planning_data` (
  `planning_data_id` bigint(20) NOT NULL,
  `progress_by_duration` decimal(19,6) DEFAULT NULL,
  `progress_by_num_hours` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`planning_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning_data`
--

LOCK TABLES `planning_data` WRITE;
/*!40000 ALTER TABLE `planning_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_roles`
--

DROP TABLE IF EXISTS `profile_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_roles` (
  `profile_id` bigint(20) NOT NULL,
  `elt` varchar(255) DEFAULT NULL,
  KEY `fkd557d8a7edc4db41` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_roles`
--

LOCK TABLES `profile_roles` WRITE;
/*!40000 ALTER TABLE `profile_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_table`
--

DROP TABLE IF EXISTS `profile_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_table` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_table_profile_name_key` (`profile_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_table`
--

LOCK TABLES `profile_table` WRITE;
/*!40000 ALTER TABLE `profile_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_form`
--

DROP TABLE IF EXISTS `quality_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_form` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quality_form_type` int(11) DEFAULT NULL,
  `report_advance` tinyint(1) DEFAULT NULL,
  `advance_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quality_form_name_key` (`name`),
  KEY `fkf635cc04b216ed4c` (`advance_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_form`
--

LOCK TABLES `quality_form` WRITE;
/*!40000 ALTER TABLE `quality_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_form_items`
--

DROP TABLE IF EXISTS `quality_form_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_form_items` (
  `quality_form_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`quality_form_id`,`idx`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_form_items`
--

LOCK TABLES `quality_form_items` WRITE;
/*!40000 ALTER TABLE `quality_form_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_form_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `limited_resource` tinyint(1) NOT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_code_key` (`code`),
  UNIQUE KEY `resource_base_calendar_id_key` (`base_calendar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_allocation`
--

DROP TABLE IF EXISTS `resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_allocation` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resources_per_day` decimal(19,2) DEFAULT NULL,
  `intended_total_hours` int(11) DEFAULT NULL,
  `original_total_assignment` int(11) DEFAULT NULL,
  `task` bigint(20) DEFAULT NULL,
  `assignment_function` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fke8a96db115671e92` (`assignment_function`),
  KEY `fke8a96db1ff61540d` (`task`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_allocation`
--

LOCK TABLES `resource_allocation` WRITE;
/*!40000 ALTER TABLE `resource_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_calendar`
--

DROP TABLE IF EXISTS `resource_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_calendar` (
  `base_calendar_id` bigint(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`base_calendar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_calendar`
--

LOCK TABLES `resource_calendar` WRITE;
/*!40000 ALTER TABLE `resource_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_cost_category_assignment`
--

DROP TABLE IF EXISTS `resources_cost_category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_cost_category_assignment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `init_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost_category_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resources_cost_category_assignment_code_key` (`code`),
  KEY `fk27c2a216c29ad8eb` (`cost_category_id`),
  KEY `fk27c2a21648d21790` (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_cost_category_assignment`
--

LOCK TABLES `resources_cost_category_assignment` WRITE;
/*!40000 ALTER TABLE `resources_cost_category_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources_cost_category_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_table`
--

DROP TABLE IF EXISTS `roles_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_table` (
  `user_id` bigint(20) NOT NULL,
  `elt` varchar(255) DEFAULT NULL,
  KEY `fk2e7e6bcc5567ad13` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_table`
--

LOCK TABLES `roles_table` WRITE;
/*!40000 ALTER TABLE `roles_table` DISABLE KEYS */;
INSERT INTO `roles_table` VALUES (1213,'ROLE_CREATE_ORDER'),(1213,'ROLE_EDIT_ALL_ORDERS'),(1213,'ROLE_READ_ALL_ORDERS'),(1213,'ROLE_ADMINISTRATION'),(1214,'ROLE_WS_READER'),(1215,'ROLE_WS_WRITER'),(1215,'ROLE_WS_READER');
/*!40000 ALTER TABLE `roles_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_not_owned_reassignations_time_stamp` datetime DEFAULT NULL,
  `predecessor` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkd1c57390fd99606d` (`predecessor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
INSERT INTO `scenario` VALUES (909,0,'master',NULL,NULL,NULL),(3132,0,'Derived from master','adasdasd',NULL,909);
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_orders`
--

DROP TABLE IF EXISTS `scenario_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario_orders` (
  `order_id` bigint(20) NOT NULL,
  `order_version_id` bigint(20) NOT NULL,
  `scenario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`scenario_id`,`order_id`),
  KEY `fk91bbca7487287288` (`order_id`),
  KEY `fk91bbca7423b85cf1` (`order_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_orders`
--

LOCK TABLES `scenario_orders` WRITE;
/*!40000 ALTER TABLE `scenario_orders` DISABLE KEYS */;
INSERT INTO `scenario_orders` VALUES (1316,1619,909),(1821,2124,909),(1832,2132,909),(1836,2136,909),(1840,2140,909),(1844,2144,909),(1848,2148,909),(1832,2132,3132),(1316,1619,3132),(1848,2148,3132),(1844,2144,3132),(1840,2140,3132),(1836,2136,3132),(1821,2124,3132);
/*!40000 ALTER TABLE `scenario_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduling_data_for_version`
--

DROP TABLE IF EXISTS `scheduling_data_for_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduling_data_for_version` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `scheduling_state_type` int(11) DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk672eed98efda874f` (`order_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling_data_for_version`
--

LOCK TABLES `scheduling_data_for_version` WRITE;
/*!40000 ALTER TABLE `scheduling_data_for_version` DISABLE KEYS */;
INSERT INTO `scheduling_data_for_version` VALUES (1518,2,4,1316),(2023,37,3,1821),(2026,35,0,1824),(2034,2,4,1832),(2038,2,4,1836),(2042,2,4,1840),(2046,5,4,1844),(2050,5,4,1848);
/*!40000 ALTER TABLE `scheduling_data_for_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduling_states_by_order_version`
--

DROP TABLE IF EXISTS `scheduling_states_by_order_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduling_states_by_order_version` (
  `order_element_id` bigint(20) NOT NULL,
  `scheduling_state_for_version_id` bigint(20) NOT NULL,
  `order_version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_element_id`,`order_version_id`),
  KEY `fk84f61df123b85cf1` (`order_version_id`),
  KEY `fk84f61df19bfe55d0` (`scheduling_state_for_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling_states_by_order_version`
--

LOCK TABLES `scheduling_states_by_order_version` WRITE;
/*!40000 ALTER TABLE `scheduling_states_by_order_version` DISABLE KEYS */;
INSERT INTO `scheduling_states_by_order_version` VALUES (1316,1518,1619),(1821,2023,2124),(1824,2026,2124),(1832,2034,2132),(1836,2038,2136),(1840,2042,2140),(1844,2046,2144),(1848,2050,2148);
/*!40000 ALTER TABLE `scheduling_states_by_order_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigmoid_function`
--

DROP TABLE IF EXISTS `sigmoid_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigmoid_function` (
  `assignment_function_id` bigint(20) NOT NULL,
  PRIMARY KEY (`assignment_function_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigmoid_function`
--

LOCK TABLES `sigmoid_function` WRITE;
/*!40000 ALTER TABLE `sigmoid_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigmoid_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_day_assignments_container`
--

DROP TABLE IF EXISTS `specific_day_assignments_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_day_assignments_container` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resource_allocation_id` bigint(20) DEFAULT NULL,
  `scenario` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `duration_start_in_first_day` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration_in_last_day` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcee469987518838c` (`resource_allocation_id`),
  KEY `fkcee46998421c7cf4` (`scenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_day_assignments_container`
--

LOCK TABLES `specific_day_assignments_container` WRITE;
/*!40000 ALTER TABLE `specific_day_assignments_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_day_assignments_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_resource_allocation`
--

DROP TABLE IF EXISTS `specific_resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_resource_allocation` (
  `resource_allocation_id` bigint(20) NOT NULL,
  `resource` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resource_allocation_id`),
  KEY `fkf0e85724eae850b2` (`resource`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_resource_allocation`
--

LOCK TABLES `specific_resource_allocation` WRITE;
/*!40000 ALTER TABLE `specific_resource_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretches`
--

DROP TABLE IF EXISTS `stretches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretches` (
  `assignment_function_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `length_percentage` decimal(19,2) NOT NULL,
  `amount_work_percentage` decimal(19,2) NOT NULL,
  `stretch_position` int(11) NOT NULL,
  PRIMARY KEY (`assignment_function_id`,`stretch_position`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretches`
--

LOCK TABLES `stretches` WRITE;
/*!40000 ALTER TABLE `stretches` DISABLE KEYS */;
/*!40000 ALTER TABLE `stretches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretches_function`
--

DROP TABLE IF EXISTS `stretches_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretches_function` (
  `assignment_function_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignment_function_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretches_function`
--

LOCK TABLES `stretches_function` WRITE;
/*!40000 ALTER TABLE `stretches_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `stretches_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcontracted_task_data`
--

DROP TABLE IF EXISTS `subcontracted_task_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcontracted_task_data` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `external_company` bigint(20) DEFAULT NULL,
  `subcontratation_date` datetime DEFAULT NULL,
  `subcontract_communication_date` datetime DEFAULT NULL,
  `work_description` varchar(255) DEFAULT NULL,
  `subcontract_price` decimal(19,2) DEFAULT NULL,
  `subcontracted_code` varchar(255) DEFAULT NULL,
  `node_without_children_exported` tinyint(1) DEFAULT NULL,
  `labels_exported` tinyint(1) DEFAULT NULL,
  `material_assignments_exported` tinyint(1) DEFAULT NULL,
  `hours_groups_exported` tinyint(1) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk35bc4ed63804cfa` (`external_company`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontracted_task_data`
--

LOCK TABLES `subcontracted_task_data` WRITE;
/*!40000 ALTER TABLE `subcontracted_task_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcontracted_task_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sum_charged_hours`
--

DROP TABLE IF EXISTS `sum_charged_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sum_charged_hours` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `direct_charged_hours` int(11) DEFAULT NULL,
  `indirect_charged_hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sum_charged_hours`
--

LOCK TABLES `sum_charged_hours` WRITE;
/*!40000 ALTER TABLE `sum_charged_hours` DISABLE KEYS */;
INSERT INTO `sum_charged_hours` VALUES (1417,3,0,0),(1922,37,0,0),(1925,2,0,0),(1929,2,0,0),(1933,33,0,0),(1941,3,0,0),(1945,3,0,0),(1949,3,0,0),(1953,6,0,0),(1957,6,0,0);
/*!40000 ALTER TABLE `sum_charged_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_element_id` bigint(20) NOT NULL,
  `calculated_value` int(11) DEFAULT NULL,
  `start_constraint_type` int(11) DEFAULT NULL,
  `constraint_date` date DEFAULT NULL,
  `workable_days` int(11) DEFAULT NULL,
  `allocation_direction` int(11) DEFAULT NULL,
  `subcontrated_task_data_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_element_id`),
  UNIQUE KEY `task_subcontrated_task_data_id_key` (`subcontrated_task_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (2525,1,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_element`
--

DROP TABLE IF EXISTS `task_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_element` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `start_day_duration` int(11) DEFAULT NULL,
  `end_date` date NOT NULL,
  `end_day_duration` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `advance_percentage` decimal(19,4) DEFAULT NULL,
  `sum_of_hours_allocated` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `position_in_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkc631a642a44abee3` (`base_calendar_id`),
  KEY `fkc631a642a5f3c581` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_element`
--

LOCK TABLES `task_element` WRITE;
/*!40000 ALTER TABLE `task_element` DISABLE KEYS */;
INSERT INTO `task_element` VALUES (2525,34,'sdf.sdmf.ds',NULL,'2010-12-14',0,'2010-12-29',10800,NULL,'0.0000',0,2526,NULL,0),(2526,67,'elemedsfdsf',NULL,'2010-12-14',0,'2010-12-29',0,NULL,'0.0000',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `task_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_group`
--

DROP TABLE IF EXISTS `task_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_group` (
  `task_element_id` bigint(20) NOT NULL,
  PRIMARY KEY (`task_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_group`
--

LOCK TABLES `task_group` WRITE;
/*!40000 ALTER TABLE `task_group` DISABLE KEYS */;
INSERT INTO `task_group` VALUES (2526);
/*!40000 ALTER TABLE `task_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_milestone`
--

DROP TABLE IF EXISTS `task_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_milestone` (
  `task_element_id` bigint(20) NOT NULL,
  `start_constraint_type` int(11) DEFAULT NULL,
  `constraint_date` date DEFAULT NULL,
  PRIMARY KEY (`task_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_milestone`
--

LOCK TABLES `task_milestone` WRITE;
/*!40000 ALTER TABLE `task_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_quality_form`
--

DROP TABLE IF EXISTS `task_quality_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_quality_form` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `quality_form_id` bigint(20) DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  `report_advance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4356e07eefda874f` (`order_element_id`),
  KEY `fk4356e07e8b37665c` (`quality_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_quality_form`
--

LOCK TABLES `task_quality_form` WRITE;
/*!40000 ALTER TABLE `task_quality_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_quality_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_quality_form_items`
--

DROP TABLE IF EXISTS `task_quality_form_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_quality_form_items` (
  `task_quality_form_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`task_quality_form_id`,`idx`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_quality_form_items`
--

LOCK TABLES `task_quality_form_items` WRITE;
/*!40000 ALTER TABLE `task_quality_form_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_quality_form_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_source`
--

DROP TABLE IF EXISTS `task_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_source` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `schedulingdata` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_source_schedulingdata_key` (`schedulingdata`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_source`
--

LOCK TABLES `task_source` WRITE;
/*!40000 ALTER TABLE `task_source` DISABLE KEYS */;
INSERT INTO `task_source` VALUES (2525,67,2026),(2526,34,2023);
/*!40000 ALTER TABLE `task_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_source_hours_groups`
--

DROP TABLE IF EXISTS `task_source_hours_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_source_hours_groups` (
  `task_source_id` bigint(20) NOT NULL,
  `hours_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`task_source_id`,`hours_group_id`),
  KEY `fka01fe4eee036cfed` (`hours_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_source_hours_groups`
--

LOCK TABLES `task_source_hours_groups` WRITE;
/*!40000 ALTER TABLE `task_source_hours_groups` DISABLE KEYS */;
INSERT INTO `task_source_hours_groups` VALUES (2525,2325);
/*!40000 ALTER TABLE `task_source_hours_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_work_hours`
--

DROP TABLE IF EXISTS `type_of_work_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_work_hours` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `default_price` decimal(19,2) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_of_work_hours_code_key` (`code`),
  UNIQUE KEY `type_of_work_hours_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_work_hours`
--

LOCK TABLES `type_of_work_hours` WRITE;
/*!40000 ALTER TABLE `type_of_work_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_of_work_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `measure` varchar(255) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_type_code_key` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (1010,8,'UNIT_TYPE00001','units',1),(1011,7,'UNIT_TYPE00002','kg',1),(1012,6,'UNIT_TYPE00003','km',1),(1013,5,'UNIT_TYPE00004','l',1),(1014,4,'UNIT_TYPE00005','m',1),(1015,3,'UNIT_TYPE00006','m2',1),(1016,2,'UNIT_TYPE00007','m3',1),(1017,1,'UNIT_TYPE00008','tn',1);
/*!40000 ALTER TABLE `unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `user_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`profile_id`),
  KEY `fkc74605deedc4db41` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `lastconnectedscenario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_table_login_name_key` (`login_name`),
  KEY `fk7358465a4cd98327` (`lastconnectedscenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1212,4,'user','c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e',NULL,0,NULL),(1213,6,'admin','e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a',NULL,0,3132),(1214,2,'wsreader','9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc',NULL,0,NULL),(1215,1,'wswriter','a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8',NULL,0,NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_worker`
--

DROP TABLE IF EXISTS `virtual_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_worker` (
  `virtual_worker_id` bigint(20) NOT NULL,
  `observations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`virtual_worker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_worker`
--

LOCK TABLES `virtual_worker` WRITE;
/*!40000 ALTER TABLE `virtual_worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_report`
--

DROP TABLE IF EXISTS `work_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_report` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `last_work_report_line_sequence_code` int(11) DEFAULT NULL,
  `ork_report_type_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_report_code_key` (`code`),
  KEY `fkfd7aa622efda874f` (`order_element_id`),
  KEY `fkfd7aa62278e4e2ea` (`ork_report_type_id`),
  KEY `fkfd7aa62248d21790` (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_report`
--

LOCK TABLES `work_report` WRITE;
/*!40000 ALTER TABLE `work_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_report_label_type_assigment`
--

DROP TABLE IF EXISTS `work_report_label_type_assigment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_report_label_type_assigment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `labels_shared_by_lines` tinyint(1) DEFAULT NULL,
  `position_number` int(11) DEFAULT NULL,
  `label_type_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `work_report_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkbb262920c1c2746e` (`label_id`),
  KEY `fkbb262920707cd777` (`label_type_id`),
  KEY `fkbb262920131853a1` (`work_report_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_report_label_type_assigment`
--

LOCK TABLES `work_report_label_type_assigment` WRITE;
/*!40000 ALTER TABLE `work_report_label_type_assigment` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_report_label_type_assigment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_report_line`
--

DROP TABLE IF EXISTS `work_report_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_report_line` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `num_hours` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `clock_start` int(11) DEFAULT NULL,
  `clock_finish` int(11) DEFAULT NULL,
  `work_report_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `order_element_id` bigint(20) NOT NULL,
  `type_work_hours_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_report_line_code_key` (`code`),
  KEY `fke2af47f1efda874f` (`order_element_id`),
  KEY `fke2af47f148d21790` (`resource_id`),
  KEY `fke2af47f1e7e1020b` (`type_work_hours_id`),
  KEY `fke2af47f1f1a3177c` (`work_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_report_line`
--

LOCK TABLES `work_report_line` WRITE;
/*!40000 ALTER TABLE `work_report_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_report_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_report_type`
--

DROP TABLE IF EXISTS `work_report_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_report_type` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_is_shared_by_lines` tinyint(1) DEFAULT NULL,
  `resource_is_shared_in_lines` tinyint(1) DEFAULT NULL,
  `order_element_is_shared_in_lines` tinyint(1) DEFAULT NULL,
  `code_autogenerated` tinyint(1) NOT NULL,
  `hours_management` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_report_type_code_key` (`code`),
  UNIQUE KEY `work_report_type_name_key` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_report_type`
--

LOCK TABLES `work_report_type` WRITE;
/*!40000 ALTER TABLE `work_report_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_report_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `worker_id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workreports_labels`
--

DROP TABLE IF EXISTS `workreports_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workreports_labels` (
  `work_report_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  PRIMARY KEY (`work_report_id`,`label_id`),
  KEY `fkf796fbd0c1c2746e` (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workreports_labels`
--

LOCK TABLES `workreports_labels` WRITE;
/*!40000 ALTER TABLE `workreports_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `workreports_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workreportslines_labels`
--

DROP TABLE IF EXISTS `workreportslines_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workreportslines_labels` (
  `work_report_line_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  PRIMARY KEY (`work_report_line_id`,`label_id`),
  KEY `fkcb8fc1cdc1c2746e` (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workreportslines_labels`
--

LOCK TABLES `workreportslines_labels` WRITE;
/*!40000 ALTER TABLE `workreportslines_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `workreportslines_labels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-15 16:20:18
