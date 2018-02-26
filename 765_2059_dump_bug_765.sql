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
INSERT INTO `DATABASECHANGELOG` VALUES ('initial-database-creation-1','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',1,'EXECUTED','3:0819191bfc79c85258e53388e6c3a269','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-2','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',2,'EXECUTED','3:492e699609703ebfdc7f14d0b9d3fa10','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-3','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',3,'EXECUTED','3:ce0671ca8c9c310243bcc2ffb2d35523','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-4','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',4,'EXECUTED','3:5a28bfc5ca316e6f6cd3a0b3ef5f67b9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-5','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',5,'EXECUTED','3:dd32a9e5c58bd33f528f3a4176736205','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-6','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',6,'EXECUTED','3:de107aebd954ab5c29c39bd6260b1c69','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-7','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',7,'EXECUTED','3:588d5677bcc5dff757c327873f896443','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-8','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',8,'EXECUTED','3:7fa824a67c2de27b2b2a3f66e5118412','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-9','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',9,'EXECUTED','3:93bc8fa1188ddda3969df439f29c8f31','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-10','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',10,'EXECUTED','3:0c72c8c2330c2408a6b079239c401a91','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-11','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',11,'EXECUTED','3:30ecc1c237e1c3c3db800537ffa8883d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-12','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:13',12,'EXECUTED','3:f3c4e20ee90e3380f608f73bd0bbb630','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-13','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',13,'EXECUTED','3:aaaa113557606faf71ee9f5ee1df07ce','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-14','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',14,'EXECUTED','3:54c846355565319d7d50bd78f4f569bb','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-15','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',15,'EXECUTED','3:206376e864171d400ce1602f7ef53d49','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-16','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',16,'EXECUTED','3:cf757d69a753e856b6342f679cff9fac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-17','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',17,'EXECUTED','3:ce6dfb988cb41f0adbe43e1855caa76e','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-18','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',18,'EXECUTED','3:967c04d80a2d485f868b3c984579c4e8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-19','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',19,'EXECUTED','3:4e9058f3e2f5b8173503167ec5c538a3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-20','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',20,'EXECUTED','3:60a882fa6c0f1d848bf4c69f9bfff35c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-21','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',21,'EXECUTED','3:19b23f729aa196a1abed154f225db676','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-22','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',22,'EXECUTED','3:947b787c1bbe91a331dd46cb1640f5e5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-23','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',23,'EXECUTED','3:48f908ec702ae89b5da9f0eac7479005','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-24','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',24,'EXECUTED','3:84355bc36e649a2786237afa2239406b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-25','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',25,'EXECUTED','3:b8724c07bf0377b89a789f4068225748','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-26','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',26,'EXECUTED','3:f9826236b01812c13b8773d5ab43eba3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-27','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',27,'EXECUTED','3:c793cee4a905e7c283e5670c7a78ce75','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-28','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',28,'EXECUTED','3:10e53ad074ddb8a722b7327c489af2a4','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-29','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',29,'EXECUTED','3:ffd33e338772b05e1ec66bc5f536b857','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-30','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',30,'EXECUTED','3:de8601efc174c9011c267a989abc558d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-31','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',31,'EXECUTED','3:fc5ec26502de974f7ab46118f4f53196','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-32','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',32,'EXECUTED','3:b3be37758841b13194d3710d6defef04','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-33','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',33,'EXECUTED','3:a951462763f5d55a3f7e10f12f81335f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-34','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',34,'EXECUTED','3:a51224ce4bb0ca6d2b3f7bd992c65f0a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-35','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',35,'EXECUTED','3:8afd863ae4753040b121f5858594660b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-36','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',36,'EXECUTED','3:0754fc448f05289e922e36fe342d121d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-37','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',37,'EXECUTED','3:5cfa72b6d860176124f25ff3a9d331fc','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-38','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',38,'EXECUTED','3:f831e87d1de1fc1338d42b8e833dc9c9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-39','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',39,'EXECUTED','3:6bd033fff9beeafa67d07445dbaee07f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-40','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',40,'EXECUTED','3:bdd3c4d65620a2a8f7b1a964a353f58f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-41','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',41,'EXECUTED','3:096d3c30326f7805f4b0039355445d54','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-42','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',42,'EXECUTED','3:ded3fb067f8bc57e6638e6920fd44604','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-43','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',43,'EXECUTED','3:55f995d5648794d3432adc45e49630ac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-44','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',44,'EXECUTED','3:36bec1cf129dbbe7479b6fd37ec4cfc8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-45','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',45,'EXECUTED','3:14bba3e0f5ceb3f2fd6f8957e1838de4','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-46','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',46,'EXECUTED','3:20a4b538a58ecad5fefff00c68060415','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-47','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',47,'EXECUTED','3:20d9ca0a2dac404d34031a303d36332f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-48','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',48,'EXECUTED','3:9422bfd2634488255bcbb32d73d4d9a6','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-49','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',49,'EXECUTED','3:bb378576fc9548e6e0bf30c553be56c2','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-50','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',50,'EXECUTED','3:86be514721a43f3a69e0fc5575f68bcf','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-51','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',51,'EXECUTED','3:6a7ac8677daeb7b232876fef8bc2eb13','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-52','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',52,'EXECUTED','3:132f159f7460a378fe40004d8844911c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-53','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',53,'EXECUTED','3:e86194e70e6973332ef4538bdc5d7a1a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-54','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',54,'EXECUTED','3:2524421c32a9b419da3fe430869fdb1d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-55','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',55,'EXECUTED','3:f07c8df4ae4b20f431ed20c225b80172','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-56','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',56,'EXECUTED','3:d180f6978451999d3c71c31e22a05f12','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-57','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',57,'EXECUTED','3:96dee6dd4c6fe24bdf27aec7375f97a2','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-58','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',58,'EXECUTED','3:57a5a9423e13e7d46ab17b29ef36e3ac','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-59','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',59,'EXECUTED','3:481dae68046dee1729404fcb4b8f6724','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-60','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',60,'EXECUTED','3:3c79c9a14789f861812e28b85f42ba1a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-61','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',61,'EXECUTED','3:b0647147970dcc6926527bcc26e08d0d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-62','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',62,'EXECUTED','3:7a0cee9dc0952cca4c3e2a32508a4433','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-63','mrego','src/main/resources/db.changelog-database.xml','2010-12-17 17:28:14',63,'EXECUTED','3:2b9225897f01e983677b51310e4fe0c6','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-64','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',64,'EXECUTED','3:8c6b353a40e4bbfe9ddec68b6e2ed109','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-65','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',65,'EXECUTED','3:181a3cfd4d56baa702ea56857d70c6a5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-66','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',66,'EXECUTED','3:1ce12362bbe5c9289c1b1417b4534017','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-67','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',67,'EXECUTED','3:3db8192b7fc2c73f2d6f0b811b86193a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-68','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',68,'EXECUTED','3:49669d8f9f006e24a66e6baef277ebaf','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-69','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',69,'EXECUTED','3:ec29eb383f779659440de1992b1b6bba','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-70','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',70,'EXECUTED','3:668c637d3c53b7592d3dc67fc4703cff','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-71','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',71,'EXECUTED','3:4f9d5316304450ab582b0858ce87c849','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-72','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',72,'EXECUTED','3:7a3e44f865f5a910f79c5f06e0b64f14','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-73','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',73,'EXECUTED','3:a635c19cae307c38b2763e3b9d58d224','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-74','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',74,'EXECUTED','3:95ac63bf89b9b48c007e8460e7e48cdb','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-75','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',75,'EXECUTED','3:28e6cc28eded2e909048c08ffacc1748','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-76','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',76,'EXECUTED','3:f32e144cefab5640c93a41de30b01609','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-77','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:23',77,'EXECUTED','3:5504fcfe56f3f27aedab1932b345ef67','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-78','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',78,'EXECUTED','3:bfb3ce3ba16ec8f8206c296f743868e5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-79','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',79,'EXECUTED','3:7b7e2576df7e2b013c4609c905a1e89f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-80','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',80,'EXECUTED','3:f095dee1e812c9f76e21c526566bd348','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-81','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',81,'EXECUTED','3:0e6f358e54f708c3e05debfeae8027f8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-82','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',82,'EXECUTED','3:660f1dd76f869c29fde7efc6f7e1255e','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-83','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',83,'EXECUTED','3:43f98ac2e8ef569c2ace92091588dfc5','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-84','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',84,'EXECUTED','3:72aa9950802d4e8da713013ae72ea212','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-85','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',85,'EXECUTED','3:5f58cf1966364d46c430e933f520332c','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-86','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',86,'EXECUTED','3:930edd522020ea950b89ea3fcc60293f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-87','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',87,'EXECUTED','3:eef1806c4faaa543eabf7aa919ee1871','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-88','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',88,'EXECUTED','3:ba5ed5b46b50e4e696f26943e4846b38','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-89','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',89,'EXECUTED','3:25d42a7f59acd170516f566f91db477b','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-90','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',90,'EXECUTED','3:0220e67c3c6e052be5b2683f3aff6cd9','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-91','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',91,'EXECUTED','3:dbeb7f14726427f4332caba3c3882781','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-92','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',92,'EXECUTED','3:a4f2631814df0304d6e1a9142e0174a1','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-93','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',93,'EXECUTED','3:665d61220b4af809bb0048a73af9529d','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-94','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',94,'EXECUTED','3:77fb476c14c92eda11701adb0a6d406f','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-95','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',95,'EXECUTED','3:2e07882701f4d10d2c5249aefdae87ee','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-96','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',96,'EXECUTED','3:12e1f91eae40df9eda60c20d6f9c8874','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-97','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',97,'EXECUTED','3:72db70644086a38aa90367c038a89350','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-98','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',98,'EXECUTED','3:1d6bac1b7849a0442a162078696893e3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-99','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',99,'EXECUTED','3:7f6646bbd481090fa616c199b956b014','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-100','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',100,'EXECUTED','3:bbbcbaf05cf76c8236d9137a4a7a25ec','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-101','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',101,'EXECUTED','3:15f1e5f6e1f7c3308b084e536e88b9b8','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-102','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',102,'EXECUTED','3:69b1aeed86840d511ac06119ad1f3c2a','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-103','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',103,'EXECUTED','3:57d3f2fd8967dfd691fd95d30fb1c134','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-104','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',104,'EXECUTED','3:0e57f86b004bedba6c607c8d2c566164','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-105','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',105,'EXECUTED','3:55a89da076a5b87ce5e49e1db3ed3fb9','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-106','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',106,'EXECUTED','3:4db964219e3dde449c0a54d58d204a7b','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-107','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',107,'EXECUTED','3:0d50d294d4db44aed32f8c909114645d','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-108','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',108,'EXECUTED','3:9c39ac8c3d6ebc758e69da66cfc20283','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-109','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',109,'EXECUTED','3:254739c105dc46829b4019e6cd4daa8e','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-110','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',110,'EXECUTED','3:330cbde32db56aa70e52784794b743ff','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-111','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',111,'EXECUTED','3:39d0f5be8bc00a3752b5f49dd92866de','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-112','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',112,'EXECUTED','3:005cd1ac6366225c7124eb995c790329','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-113','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',113,'EXECUTED','3:aa9ef6bec758b8fef0d7f58d652f23ed','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-114','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',114,'EXECUTED','3:57037ae27d15fb149b2b18b70e3ac640','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-115','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',115,'EXECUTED','3:9a325bc706e5f056e25b5029c144c5d8','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-116','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',116,'EXECUTED','3:f5bef61b4276a1bf815b80abfbbdd0dd','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-117','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',117,'EXECUTED','3:7eff22e0b4befe8f4c445f1c5a58a15e','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-118','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',118,'EXECUTED','3:dadfa8f8caf1ae02cfc16ecbed0c8b90','Add Primary Key','',NULL,'2.0-rc7'),('initial-database-creation-119','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',119,'EXECUTED','3:138d0588ac80f0a920e484db36f4e97d','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-120','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',120,'EXECUTED','3:2a81f473aa411fe1bf94ff891f950f05','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-121','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',121,'EXECUTED','3:465b67c4800169a5ad1a1fa4cf9937ce','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-122','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',122,'EXECUTED','3:d9da052c7f29fb3f76a2a4056af176bd','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-123','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',123,'EXECUTED','3:7ebb4272b707b682e405cb30ebb3fccb','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-124','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',124,'EXECUTED','3:360b5d5226fa5eb0d62b8531c2812a05','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-125','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',125,'EXECUTED','3:963fdb094cb961a23659f3e19a1ddde3','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-126','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',126,'EXECUTED','3:b20bb3c187e6488863f9d5481665fdac','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-127','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',127,'EXECUTED','3:f3035f410a920573b57eb459d1bcd6b1','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-128','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',128,'EXECUTED','3:ca1cdff9e1a997ff2c7b285e84221ab3','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-129','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',129,'EXECUTED','3:b475e7347003735620c2366fe038ee40','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-130','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',130,'EXECUTED','3:5523e28282da63951996a88d29635632','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-131','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',131,'EXECUTED','3:484e71ddda004fcbb6f56b3a1df07c12','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-132','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',132,'EXECUTED','3:750f465a29368e3c472c7717368e5315','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-133','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',133,'EXECUTED','3:ed11a2642a9063cae1be4ee314990279','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-134','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',134,'EXECUTED','3:632199e3f5e02d7b644fef85e7c7a148','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-135','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',135,'EXECUTED','3:f6136a87270d6999c38c78c5a4507ba0','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-136','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',136,'EXECUTED','3:3b8cdb7c8a87aded69e76f1127d93338','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-137','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',137,'EXECUTED','3:f21de5aaf5812d3b53ff6ba37c500419','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-138','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:24',138,'EXECUTED','3:212ee29342faa1bb2b4a50cfdfdf9a78','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-139','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',139,'EXECUTED','3:c1cd1a61a496daaf1bc3e941f84aa781','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-140','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',140,'EXECUTED','3:d5266cebc05f66e670752fd599970deb','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-141','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',141,'EXECUTED','3:1846e834301cbacca345ad1d30c97783','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-142','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',142,'EXECUTED','3:02dd707d2304800fa3353b76b4b14a79','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-143','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',143,'EXECUTED','3:c7d786a54bd2744456d86331287eaf88','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-144','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',144,'EXECUTED','3:d83e1d31be4d2a88a30cef280323dc14','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-145','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',145,'EXECUTED','3:2c8d1d5abd94c1f1b77b812e5a218703','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-146','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',146,'EXECUTED','3:98959c39111d467dbaef246b4e77c7d4','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-147','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',147,'EXECUTED','3:2f5b3db90f5fe8d7166b8698732d89ee','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-148','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',148,'EXECUTED','3:b6ab8ac7897d485ec2c01795fdbacba6','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-149','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',149,'EXECUTED','3:4621bf17b5d622b52e70ee84a2720ce4','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-150','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',150,'EXECUTED','3:d706f00de9bf475742860188e15d7b41','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-151','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',151,'EXECUTED','3:003b820bd40132476357aae25ba7d50b','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-152','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',152,'EXECUTED','3:cbe9e0b14bac88a7b895d8bc4c4777d7','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-153','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',153,'EXECUTED','3:38dc59e34869bc2425c7c820ba45cb9b','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-154','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',154,'EXECUTED','3:1822fb3caf8d43038c67a53fdb75e432','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-155','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',155,'EXECUTED','3:8416952db331ffa2dd27dc4f5734036c','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-156','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',156,'EXECUTED','3:4c2b2e5a5a4ee0175cab19c8b6ee084c','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-157','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',157,'EXECUTED','3:c5bf072f2de5890c8b3e22c07577f5ad','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-158','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',158,'EXECUTED','3:61b84144638971ed2b9f8a2a0fb1484f','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-159','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',159,'EXECUTED','3:edef41963c0d8e8d51ad15aa7a757420','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-160','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',160,'EXECUTED','3:6d94d16cf714dd8872660b484e632513','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-161','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',161,'EXECUTED','3:c47020da3e40d9b6239153776affab17','Add Unique Constraint','',NULL,'2.0-rc7'),('initial-database-creation-162','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',162,'EXECUTED','3:8c1de34a4070d7a104ef5595ff365355','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-163','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',163,'EXECUTED','3:00c8bf9c83805a10ad1abbfe6cabdba8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-164','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',164,'EXECUTED','3:3fa310189e738082742a06c3751f2f3e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-165','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',165,'EXECUTED','3:0ed5111ef301a24755a17b99ba609336','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-166','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',166,'EXECUTED','3:f781f197771175ae97a798ae4c732613','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-167','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',167,'EXECUTED','3:f82641b8c47ac3372c38bd410315f1d7','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-168','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',168,'EXECUTED','3:e819b9f5b305d94a874ffff77f1b0b00','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-169','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',169,'EXECUTED','3:e638fd6a15647613720dfab7af6c67af','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-170','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',170,'EXECUTED','3:5f2cae397111f9c4c4112a513b9e811f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-171','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',171,'EXECUTED','3:0cd6d510389a9b5c7e7707baabf175d1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-172','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',172,'EXECUTED','3:1e0dbe21557bd995cc4e10c17b06ad77','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-173','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',173,'EXECUTED','3:3c00120a79d285e58d49014dc3b3def2','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-174','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',174,'EXECUTED','3:a5d223789fb73e1b821bdd45c72478c8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-175','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',175,'EXECUTED','3:b7e560667260a76220664084e75a699b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-176','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',176,'EXECUTED','3:a04c06f20662d01674c2481258088719','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-177','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',177,'EXECUTED','3:eda6446777e754a9b28667808386fc07','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-178','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',178,'EXECUTED','3:cc43a952d1f4e90ae8ca08a86400b5b8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-179','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',179,'EXECUTED','3:3b7feac7849308d546f9e32306a0337b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-180','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',180,'EXECUTED','3:626dfbab1f6c43cbf5eda15af6c2d0b4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-181','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',181,'EXECUTED','3:5d35e584fe5144871639463ab48448d9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-182','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',182,'EXECUTED','3:54f532733816ed1173eb0a0978bc5d80','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-183','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',183,'EXECUTED','3:edf8db4cfb961a06787936314df7b94e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-184','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',184,'EXECUTED','3:1e122af08a912e15ee5c66f91b6c5bfa','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-185','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',185,'EXECUTED','3:49c144bddd204a4b53a3fa24016b0be2','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-186','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',186,'EXECUTED','3:7f27b6d4f3c5e0b00fb64f7131248b36','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-187','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',187,'EXECUTED','3:9c92c633ec12d7a6df8b65c97ad0fa35','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-188','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',188,'EXECUTED','3:94a94a8ce91fc86d16d4fa653a0d1453','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-189','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',189,'EXECUTED','3:b338072cafac27857c87f450a2ad6c46','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-190','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',190,'EXECUTED','3:9d5bd211cfd49f3b9fc91441f5eb908f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-191','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',191,'EXECUTED','3:bc7668fdd82c710bf043fa2f8a95dbeb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-192','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',192,'EXECUTED','3:9a377a1c95da43a4a33381c22ed4e951','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-193','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',193,'EXECUTED','3:73a6387f780aa23e047099f18b15b50f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-194','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',194,'EXECUTED','3:8b99d9b4b1544d9b15595cfcc5e5ec4f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-195','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',195,'EXECUTED','3:c267aaa5cd192977a88171f504e04f29','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-196','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',196,'EXECUTED','3:8667c573c47e4d0fbcc32caa84df333a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-197','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',197,'EXECUTED','3:f11c3d339e18a174df76d41cd195f9de','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-198','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',198,'EXECUTED','3:05a89763fa1de7b97f16102791cfefed','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-199','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',199,'EXECUTED','3:c14c67e4fab2a4378ba63d3da1fb628a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-200','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',200,'EXECUTED','3:382f1905a4228bd3e9f0c040c970cde3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-201','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',201,'EXECUTED','3:1bac4b4ae207d8838f091c32cb2df31e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-202','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',202,'EXECUTED','3:40a79714aa74711e54e351fd7ae769a8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-203','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:25',203,'EXECUTED','3:a1500cdb8370f8da80715f3150d2da41','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-204','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',204,'EXECUTED','3:7ed433c571a7829ad2eb6e5389433468','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-205','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',205,'EXECUTED','3:684a3d66bf7275618fdaf47f577dca5f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-206','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',206,'EXECUTED','3:f90e8c7e57222696be65ba1a75afe0e1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-207','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',207,'EXECUTED','3:d903424e7e44b1c1fb8c9d00bbaa5ff9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-208','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',208,'EXECUTED','3:6f03b7841548675d0c674dfc8a58a76a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-209','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',209,'EXECUTED','3:69684a0db21bbdbec2ffba0b151a73bd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-210','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',210,'EXECUTED','3:70d4db37a0127109f4e99eede4265e9e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-211','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',211,'EXECUTED','3:0dc5817e042530305a63787cd51c3d44','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-212','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',212,'EXECUTED','3:1b87cb4d62001fa3a6cd5df2bfee271f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-213','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',213,'EXECUTED','3:43bb14279d4807f3bb02f8c800ac6ec6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-214','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',214,'EXECUTED','3:2250070459940c11e7ff31a4192c9355','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-215','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',215,'EXECUTED','3:1abe6242372fb6a1b8b7d5ed11c40cf6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-216','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',216,'EXECUTED','3:365ccb2007a7db5a42a8558640d149e9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-217','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',217,'EXECUTED','3:ec8d6d84ea00f6c7ece30c6d1ada877d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-218','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',218,'EXECUTED','3:00a5c1aff60bf17c4f63c781d3d8868f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-219','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',219,'EXECUTED','3:80d78dda5a5d7a6e5b490c9b28841b16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-220','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',220,'EXECUTED','3:3a8fd566182b2a101e0e843990cfa8df','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-221','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',221,'EXECUTED','3:229616a00b74e7128b9eeb41293cd91e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-222','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',222,'EXECUTED','3:ed9f60b9f8d7881c11360f2a020bdf4b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-223','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',223,'EXECUTED','3:fee2321152589ea84c5743175d4c180a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-224','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',224,'EXECUTED','3:f6ef1f3ee7da7a147539b46f9c1cf60b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-225','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',225,'EXECUTED','3:21557deb9ad7b4c25504862864502b1c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-226','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',226,'EXECUTED','3:24adfcd3a41ae5648ffc2002dae0e4ef','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-227','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',227,'EXECUTED','3:bdd3cffbe9466ccbf6a1a791d61230fd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-228','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',228,'EXECUTED','3:2182868d8f52e97c110e8901f8e2fc34','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-229','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',229,'EXECUTED','3:43b57b5e0d38ae69053bfcaf10d4ba8d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-230','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',230,'EXECUTED','3:96d1199f9a6a19da0e6bac41293cf0ab','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-231','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',231,'EXECUTED','3:d493ad51ca6712c994efb741c1cd5cee','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-232','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',232,'EXECUTED','3:611e912194a15238fe4fd70e46ecd271','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-233','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',233,'EXECUTED','3:4823fd19347ba5a9c14b862fac025901','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-234','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',234,'EXECUTED','3:7aa2f827cf3710d979cd5c62770417bb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-235','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',235,'EXECUTED','3:1d77a4d184e0f24891d62762883540af','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-236','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',236,'EXECUTED','3:354ab31aec28364faae025882682084a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-237','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',237,'EXECUTED','3:fb6d4b2090d92c3a4d685cb13176ee98','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-238','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',238,'EXECUTED','3:e91f5bf74998ca513288ed138c0da97d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-239','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',239,'EXECUTED','3:f07664fc56241ad077820f8da9bad209','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-240','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',240,'EXECUTED','3:3cf705e46d55107e249d5a69dbfbe650','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-241','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',241,'EXECUTED','3:3de02419d8b4096899d78e2cd84d7e0b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-242','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',242,'EXECUTED','3:4b074cd6de5562d41ae3506d8d4b35f3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-243','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',243,'EXECUTED','3:b577e13ab196e4c075b8be09841abb4a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-244','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',244,'EXECUTED','3:9ad3d17bbbac8f995a1313d24c37c816','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-245','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',245,'EXECUTED','3:6ed5e004af84bf9f2cfe8858fd2a5693','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-246','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',246,'EXECUTED','3:72287bc729bb6699bb3bc2210d12dfd4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-247','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',247,'EXECUTED','3:cb0dc7b3886d0b94d5052539bd683a16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-248','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',248,'EXECUTED','3:359b88a585529cbf0d688ded52661d0d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-249','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',249,'EXECUTED','3:bc3e3f311891541c94bafaa8250b3837','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-250','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',250,'EXECUTED','3:873b0ba69634f01ec622ca9b24d9e70a','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-251','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',251,'EXECUTED','3:c137a192ad74895a6049234b596fecb5','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-252','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',252,'EXECUTED','3:793cd0492af23c4c209def47673ca914','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-253','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',253,'EXECUTED','3:d76b0b4675c504576f872e68c5e9bda7','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-254','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',254,'EXECUTED','3:eee13cf5dc3e864e56c6a9b03079578e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-255','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',255,'EXECUTED','3:f9088ee9f92067cab4b207d3aae3a37b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-256','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',256,'EXECUTED','3:e2326617f1c9b860249a0c0777ec20f6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-257','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',257,'EXECUTED','3:adf9400fc812eb6c8f7d32aa787742e6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-258','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',258,'EXECUTED','3:60fc7ab467e364cd6a3d72d2f4f1d736','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-259','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',259,'EXECUTED','3:a6cacd22103e0447094d9a161d7b7445','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-260','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',260,'EXECUTED','3:76bf1eb3a6880473927e7a101d037bd8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-261','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',261,'EXECUTED','3:5e2d94e8e56a7c57936a8bce78066b96','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-262','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',262,'EXECUTED','3:b6e995091bd0a2aed951e2fbf3f215a3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-263','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',263,'EXECUTED','3:5a57fa35a8c7ca09756afcad21d8e86f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-264','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',264,'EXECUTED','3:a7fc2f018277eaaa7649fb46b6b27ab6','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-265','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',265,'EXECUTED','3:528d191ec33204cee277f7312c49cc2c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-266','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',266,'EXECUTED','3:deb083face872d4d49b666a9b8bdfaba','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-267','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',267,'EXECUTED','3:a7b87e7b2788c237ebeef3591092532e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-268','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',268,'EXECUTED','3:8e9f116ff4830eb847589e5b4e62852e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-269','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',269,'EXECUTED','3:595c174489187fc62b19670995c5cbff','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-270','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',270,'EXECUTED','3:d7a769415b86b93205327adc4b037e45','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-271','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:26',271,'EXECUTED','3:06906c810ec8b347c75867ab21f7dc4c','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-272','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',272,'EXECUTED','3:a28d48ed75ff265b6472e9749f95d1a5','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-273','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',273,'EXECUTED','3:5990b5955a764200dd54eb4dd3b0a7cf','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-274','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',274,'EXECUTED','3:5d4cc1738a27175979f1c973b1bd5ea9','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-275','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',275,'EXECUTED','3:d9130cc23b8afa27fd84f7c72d818efd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-276','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',276,'EXECUTED','3:18feaa2b4b9cbce46ea7b7a0c710de9f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-277','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',277,'EXECUTED','3:506fb6a53c157ce68105f451ad5958ff','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-278','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',278,'EXECUTED','3:b02c658ae947d20ac0ee1d207ebd210e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-279','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',279,'EXECUTED','3:c346d8903750d250fabc343064880e6f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-280','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',280,'EXECUTED','3:37fcf9ad58b891a096b9c95f4ea57b58','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-281','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',281,'EXECUTED','3:611486b58c51ad97deab489a17b23e2e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-282','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',282,'EXECUTED','3:0efe8669ed086af6da655a53d4ced916','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-283','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',283,'EXECUTED','3:730ece3259ea1ee3ffa53563790465d8','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-284','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',284,'EXECUTED','3:5eb111d4b478c0c9a66a3a4a112c1c6b','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-285','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',285,'EXECUTED','3:b7d27d03ee27cc13c76c5262d518b876','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-286','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',286,'EXECUTED','3:3663d9ecd66964bffcc07bcfce7bdcdc','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-287','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',287,'EXECUTED','3:35e0a6356d11ed9dfe53c300b9e2ffee','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-288','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',288,'EXECUTED','3:4ae0336d6b9d807036d03ad041b67052','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-289','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',289,'EXECUTED','3:2da61d1b760209a704e29bfa4a22455e','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-290','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',290,'EXECUTED','3:2604fb5ddeccc31b1dccd4cd0bad4342','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-291','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',291,'EXECUTED','3:da9d240fdde86539e1580b84687e0189','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-292','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',292,'EXECUTED','3:0dc9aa5380e9a48fe9aaf306235988a4','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-293','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',293,'EXECUTED','3:58c6315352f7cefbddeb9b3a38d1e140','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-294','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',294,'EXECUTED','3:91398a7f542f90a13d1f857ca3937de1','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-295','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',295,'EXECUTED','3:5395eb857489412499e37c691ea36b8f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-296','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',296,'EXECUTED','3:494a1128a80caad8d24c5f3574ef6edd','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-297','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',297,'EXECUTED','3:fa3b4dd73dd82e3a26c6563c9828fba3','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-298','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',298,'EXECUTED','3:e83453938c668f856d1df1537ec25d37','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-299','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',299,'EXECUTED','3:c5655c084990797f73bf295660881932','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-300','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',300,'EXECUTED','3:4747b6b28b49b810444aa6af7c133fab','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-301','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',301,'EXECUTED','3:f73d714400c8712c0715e2da673e9509','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-302','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',302,'EXECUTED','3:4d50b8c05ded66b150571543bcd91a37','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-303','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',303,'EXECUTED','3:7a5e18b1ed8e9813ca4920bd0856ecd0','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-304','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',304,'EXECUTED','3:e52f19afd5f5966cff359311b4c3acac','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-305','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',305,'EXECUTED','3:8548d763866edc7944ec1b0facb1560f','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-306','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',306,'EXECUTED','3:fc14a87fde20c7151888cea5c48c6f39','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-307','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',307,'EXECUTED','3:23a513bb939d6d2751a1550188c32222','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-308','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',308,'EXECUTED','3:4144c0d934e5fd823f19ef91da210ffa','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-309','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',309,'EXECUTED','3:c0d764328d333e644989448a4cd480bb','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-310','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',310,'EXECUTED','3:461ea2548e20f99478f3203dbf33bc16','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-311','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',311,'EXECUTED','3:3eeefe2f703d57218dde9b05fcdbc5cf','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-312','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',312,'EXECUTED','3:564cd8aac65a0319c9c3c75a486ace41','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-313','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',313,'EXECUTED','3:48d80e1c9868d51d687680b42fe47f3d','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-314','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',314,'EXECUTED','3:6c6213c38e211d11aa77f0766a18e1fe','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-315','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',315,'EXECUTED','3:f522ccbad33e6a463b265e241c4ae0db','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-316','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',316,'EXECUTED','3:e5777dd44529b270c7514bc322d72105','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-317','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',317,'EXECUTED','3:5a1c1fb8b9f6cce7fbaa03b255b5a033','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-318','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',318,'EXECUTED','3:ad070f00871b05e431528e34c3f09cde','Add Foreign Key Constraint','',NULL,'2.0-rc7'),('initial-database-creation-319','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',319,'EXECUTED','3:1dde4f2407d314306ae29ad174d98de3','Create Table','',NULL,'2.0-rc7'),('initial-database-creation-320','mrego','src/main/resources/db.changelog-database.xml','2011-01-03 13:42:27',320,'EXECUTED','3:5a5608b194d0ec72e2b8f53675ff8de0','Insert Row','',NULL,'2.0-rc7'),('resize-precision-in-planning_data','dpino','src/main/resources/db.changelog-initial.xml','2011-01-03 13:42:27',321,'EXECUTED','3:3ee94e7e64b7ed2592dfb71db6923a1c','Modify data type (x2)','Resize precision for \'progress_by_duration\' and \'progress_by_num_hours\' fields',NULL,'2.0-rc7'),('add-company-logo-url-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2011-01-03 13:42:27',322,'EXECUTED','3:009cd5341d49b5415bf7ec539de24c79','Add Column, Update Data','Add new column with configuration setting',NULL,'2.0-rc7'),('add scheduling mode','ogonzalez','src/main/resources/db.changelog-initial.xml','2011-01-03 13:42:27',323,'EXECUTED','3:8a4ed0c0131906744a85a38278180e13','Add Column, Update Data','column for org.navalplanner.business.orders.entities.Order.schedulingMode',NULL,'2.0-rc7'),('rename start_constraint_type in task and task milestone','ogonzalez','src/main/resources/db.changelog-initial.xml','2011-01-03 13:42:27',324,'EXECUTED','3:0ba5792ffc0bff2a1ce571047b008796','Rename Column (x2)','Caused by renaming org.navalplanner.business.planner.entities.TaskPositionConstraint.startConstraintType',NULL,'2.0-rc7'),('add-scenarios-enabled-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2011-01-03 13:42:27',325,'EXECUTED','3:53d99bb420a0c55c8eaa9389e3fc0ed5','Add Column, Update Data','Add new column with scenarios visibility flag',NULL,'2.0-rc7'),('change-types-start-finish-date-criterion-satisfaction','ogonzalez','src/main/resources/db.changelog-initial.xml','2011-01-07 10:47:23',326,'EXECUTED','3:93527c263e394c3960738fc2e9734c4c','Modify data type (x2)','Change types of start and finish date to date for criterion satisfaction table',NULL,'2.0-rc7'),('add-new-column-enable_critical_chain_support','jaragunde','src/main/resources/db.changelog-1.0.xml','2011-01-12 20:16:27',329,'EXECUTED','3:2e945615b34f87a232f914a37cbab56a','Add Column, Add Default Value','Add new column enable_critical_chain_support with default value FALSE to configuration table',NULL,'2.0-rc7'),('use-capacity-instead-of-effort_duration-and-not_over_assignable','ogonzalez','src/main/resources/db.changelog-1.0.xml','2011-01-12 19:48:29',328,'EXECUTED','3:71ae3b8d8998329d68e95d8ad2135745','Add Column, Rename Column, Update Data, Drop Column','Convert from duration + notAssignable (not over assignable) to capacity property',NULL,'2.0-rc7'),('use-capacity-for-exceptions','ogonzalez','src/main/resources/db.changelog-1.0.xml','2011-01-18 13:29:25',330,'EXECUTED','3:83576dfaa5871f36aa3f7d4119814f8f','Add Column, Rename Column, Custom SQL','Convert from duration to capacity property for calendar exceptions',NULL,'2.0-rc7'),('use-capacity-for-capacity-per-day-for-calendar-data','ogonzalez','src/main/resources/db.changelog-1.0.xml','2011-01-18 13:29:26',331,'EXECUTED','3:a643cf37da0098f0cad242d306bb5d05','Rename Table, Add Column, Rename Column','Convert from duration to capacity in effort per day for CalendarData',NULL,'2.0-rc7'),('by_default_weekends_are_not_overassignable','ogonzalez','src/main/resources/db.changelog-1.0.xml','2011-01-20 16:09:36',332,'EXECUTED','3:8ddf0ca2b0fc243475ee2f4c21172565','Custom SQL','By default weekends are not over assignable',NULL,'2.0-rc7'),('replace-column-limited_resource-with-resource_type','jaragunde','src/main/resources/db.changelog-1.0.xml','2011-01-20 16:09:36',333,'EXECUTED','3:b6640208fbf11943fa46d8953516bad7','Add Column, Update Data (x2), Add Not-Null Constraint, Drop Column','Replace column limited_resource with resource_type in resource table',NULL,'2.0-rc7');
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
INSERT INTO `advance_assignment` VALUES (5455,2,0,809),(5454,3,1,809),(3537,3,1,808),(3536,3,0,809),(3535,5,1,809),(5456,2,1,808),(6504,11,1,809),(6505,11,1,809),(6506,11,1,809),(6507,5,0,809),(6508,5,1,808),(6509,7,1,809),(6510,7,1,809),(6511,7,1,809),(6512,7,1,809),(6513,7,1,809),(6514,4,0,809),(6515,4,1,808),(6516,7,1,809),(6517,7,1,809),(6518,4,0,809),(6519,4,1,808),(8888,4,1,809),(8889,4,1,809),(8890,4,1,808),(8891,4,0,809),(10201,5,1,809),(12019,3,1,809),(12928,3,1,809),(12929,3,1,809),(12930,3,1,809),(12931,3,1,809),(12932,3,1,809),(12933,3,1,809),(12934,3,1,809),(12935,3,1,809),(12936,3,1,809),(12937,2,1,808),(12938,2,0,809),(12939,2,0,809),(12940,2,1,808),(14078,2,1,809),(14079,2,1,809),(14080,2,1,809),(14081,2,1,809),(14082,2,1,809),(14083,2,1,809),(14084,2,1,809),(14085,2,1,809),(14086,2,1,809),(14087,2,0,809),(14088,2,1,808),(14089,2,0,809),(14090,2,1,808),(16388,7,1,809),(16389,7,1,809),(16390,7,1,809),(16391,7,1,809),(16392,7,1,809),(16393,7,1,809),(16394,7,1,809),(16395,7,1,809),(16396,7,1,809),(16397,4,1,808),(16398,4,0,809),(16399,7,1,809),(16400,7,1,809),(16401,7,1,809),(16402,7,1,809),(16403,7,1,809),(16404,7,1,809),(16405,7,1,809),(16406,7,1,809),(16407,7,1,809),(16408,4,1,808),(16409,4,0,809),(16410,7,1,809),(16411,7,1,809),(16412,7,1,809),(16413,7,1,809),(16414,7,1,809),(16415,7,1,809),(16416,7,1,809),(16417,7,1,809),(16418,7,1,809),(16419,4,1,808),(16420,4,0,809),(16421,7,1,809),(16422,7,1,809),(16423,7,1,809),(16424,7,1,809),(16425,7,1,809),(16426,7,1,809),(16427,7,1,809),(16428,7,1,809),(16429,7,1,809),(16430,4,1,808),(16431,4,0,809),(16432,7,1,809),(16433,7,1,809),(16434,7,1,809),(16435,7,1,809),(16436,7,1,809),(16437,7,1,809),(16438,7,1,809),(16439,7,1,809),(16440,7,1,809),(16441,4,1,808),(16442,4,0,809),(16443,7,1,809),(16444,7,1,809),(16445,7,1,809),(16446,7,1,809),(16447,7,1,809),(16448,7,1,809),(16449,7,1,809),(16450,7,1,809),(16451,7,1,809),(16452,4,1,808),(16453,4,0,809),(16454,7,1,809),(16455,7,1,809),(16456,7,1,809),(16457,7,1,809),(16458,7,1,809),(16459,7,1,809),(16460,7,1,809),(16461,7,1,809),(16462,7,1,809),(16867,4,1,808),(16868,4,0,809),(16869,7,1,809),(16870,7,1,809),(16871,7,1,809),(16872,7,1,809),(16873,7,1,809),(16874,7,1,809),(16875,7,1,809),(16876,7,1,809),(16877,7,1,809),(16878,4,0,809),(16879,4,1,808),(16880,7,1,809),(16881,7,1,809),(16882,7,1,809),(16883,7,1,809),(16884,7,1,809),(16885,7,1,809),(16886,7,1,809),(16887,7,1,809),(16888,7,1,809),(16889,4,0,809),(16890,4,1,808),(16891,7,1,809),(16892,7,1,809),(16893,7,1,809),(16894,7,1,809),(16895,7,1,809),(16896,7,1,809),(16897,7,1,809),(16898,7,1,809),(16899,7,1,809),(16900,4,0,809),(16901,4,1,808),(16902,7,1,809),(16903,7,1,809),(16904,7,1,809),(16905,7,1,809),(16906,7,1,809),(16907,7,1,809),(16908,7,1,809),(16909,7,1,809),(16910,7,1,809),(16911,4,1,808),(16912,4,0,809),(16913,7,1,809),(16914,7,1,809),(16915,7,1,809),(16916,7,1,809),(16917,7,1,809),(16918,7,1,809),(16919,7,1,809),(16920,7,1,809),(16921,7,1,809),(16922,4,1,808),(16923,4,0,809),(16924,7,1,809),(16925,7,1,809),(16926,7,1,809),(16927,7,1,809),(16928,7,1,809),(16929,7,1,809),(16930,7,1,809),(16931,7,1,809),(16932,7,1,809),(16933,4,0,809),(16934,4,1,808),(16935,7,1,809),(16936,7,1,809),(16937,7,1,809),(16938,7,1,809),(16939,7,1,809),(16940,7,1,809),(16941,7,1,809),(16942,7,1,809),(16943,7,1,809),(16944,4,1,808),(16945,4,0,809),(16946,7,1,809),(16947,7,1,809),(16948,7,1,809),(16949,7,1,809),(16950,7,1,809),(16951,7,1,809),(16952,7,1,809),(16953,7,1,809),(16954,7,1,809),(16955,4,0,809),(16956,4,1,808),(16957,7,1,809),(16958,7,1,809),(16959,7,1,809),(16960,7,1,809),(16961,7,1,809),(16962,7,1,809),(16963,7,1,809),(16964,7,1,809),(16965,7,1,809),(16966,4,0,809),(16967,4,1,808),(17372,7,1,809),(17373,7,1,809),(17374,7,1,809),(17375,7,1,809),(17376,7,1,809),(17377,7,1,809),(17378,7,1,809),(17379,7,1,809),(17380,7,1,809),(17381,4,0,809),(17382,4,1,808),(17383,7,1,809),(17384,7,1,809),(17385,7,1,809),(17386,7,1,809),(17387,7,1,809),(17388,7,1,809),(17389,7,1,809),(17390,7,1,809),(17391,7,1,809),(17392,4,1,808),(17393,4,0,809),(17394,7,1,809),(17395,7,1,809),(17396,7,1,809),(17397,7,1,809),(17398,7,1,809),(17399,7,1,809),(17400,7,1,809),(17401,7,1,809),(17402,7,1,809),(17403,4,0,809),(17404,4,1,808),(17405,7,1,809),(17406,7,1,809),(17407,7,1,809),(17408,7,1,809),(17409,7,1,809),(17410,7,1,809),(17411,7,1,809),(17412,7,1,809),(17413,7,1,809),(17414,4,0,809),(17415,4,1,808),(17416,7,1,809),(17417,7,1,809),(17418,7,1,809),(17419,7,1,809),(17420,7,1,809),(17421,7,1,809),(17422,7,1,809),(17423,7,1,809),(17424,7,1,809),(17425,4,0,809),(17426,4,1,808),(17427,4,0,809),(17428,4,1,808),(17429,2,1,809),(17430,2,1,808),(17431,2,0,809),(17447,2,1,809),(17448,2,1,809),(17449,2,1,809),(17450,2,0,809),(17451,2,1,808),(17467,2,1,809),(17468,2,1,809),(17469,2,1,809),(17470,2,0,809),(17471,2,1,808);
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
INSERT INTO `advance_assignment_template` VALUES (2433,1,809,2336,1,'100.00'),(2434,1,809,2337,1,'100.00'),(2435,1,809,2338,1,'100.00'),(13460,1,809,13366,1,'100.00'),(13461,1,809,13367,1,'100.00'),(13462,1,809,13368,1,'100.00'),(13463,1,809,13369,1,'100.00'),(13464,1,809,13371,1,'100.00'),(13465,1,809,13372,1,'100.00'),(13466,1,809,13373,1,'100.00'),(13467,1,809,13374,1,'100.00'),(13468,1,809,13375,1,'100.00'),(13496,1,809,13407,1,'100.00'),(13497,1,809,13408,1,'100.00'),(13498,1,809,13409,1,'100.00'),(13499,1,809,13410,1,'100.00'),(13500,1,809,13411,1,'100.00'),(13501,1,809,13412,1,'100.00'),(13502,1,809,13413,1,'100.00'),(13503,1,809,13414,1,'100.00'),(13504,1,809,13415,1,'100.00');
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
INSERT INTO `base_calendar` VALUES (202,3,'CALENDAR00001','Default',1,3),(3939,1,'RESOURCE_CALENDAR00001',NULL,1,4),(7171,1,'RESOURCE_CALENDAR00002',NULL,1,4),(7172,1,'RESOURCE_CALENDAR00003',NULL,1,4),(17776,2,'RESOURCE_CALENDAR00004',NULL,1,4);
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
INSERT INTO `calendar_availability` VALUES (4141,1,'RESOURCE_CALENDAR00001-00004','2011-01-07',NULL,3939,0),(7373,1,'RESOURCE_CALENDAR00002-00004','2011-01-12',NULL,7171,0),(7374,1,'RESOURCE_CALENDAR00003-00004','2011-01-12',NULL,7172,0),(17978,2,'RESOURCE_CALENDAR00004-00004','2011-01-21',NULL,17776,0);
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
INSERT INTO `calendar_data` VALUES (303,3,'CALENDAR00001-00002',NULL,NULL,202,0),(4040,1,'RESOURCE_CALENDAR00001-00003',202,NULL,3939,0),(7272,1,'RESOURCE_CALENDAR00002-00003',202,NULL,7171,0),(7273,1,'RESOURCE_CALENDAR00003-00003',202,NULL,7172,0),(17877,2,'RESOURCE_CALENDAR00004-00003',202,NULL,17776,0);
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
  `standard_effort` int(11) DEFAULT NULL,
  `calendar_exception_id` bigint(20) DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `allowed_extra_effort` int(11) DEFAULT NULL,
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
INSERT INTO `calendar_exception` VALUES (2121,2,'CALENDAR00001-00001','2011-01-05',0,505,202,0),(2122,1,'CALENDAR00001-00003','2011-01-19',0,505,202,0);
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
  `standard_effort` int(11) DEFAULT NULL,
  `allowed_extra_effort` int(11) DEFAULT NULL,
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
INSERT INTO `calendar_exception_type` VALUES (505,11,'CALENDAR_EXCEPTION_TYPE00001',1,'HOLIDAY','red',0,0),(506,9,'CALENDAR_EXCEPTION_TYPE00002',1,'SICK_LEAVE','red',0,0),(507,7,'CALENDAR_EXCEPTION_TYPE00003',1,'LEAVE','red',0,0),(508,5,'CALENDAR_EXCEPTION_TYPE00004',1,'STRIKE','red',0,0),(509,3,'CALENDAR_EXCEPTION_TYPE00005',1,'BANK_HOLIDAY','red',0,0),(510,1,'CALENDAR_EXCEPTION_TYPE00006',1,'WORKABLE_BANK_HOLIDAY','orange',0,NULL);
/*!40000 ALTER TABLE `calendar_exception_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacity_per_day`
--

DROP TABLE IF EXISTS `capacity_per_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacity_per_day` (
  `base_calendar_id` bigint(20) NOT NULL,
  `standard_effort` int(11) DEFAULT NULL,
  `day_id` int(11) NOT NULL,
  `allowed_extra_effort` int(11) DEFAULT NULL,
  PRIMARY KEY (`base_calendar_id`,`day_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacity_per_day`
--

LOCK TABLES `capacity_per_day` WRITE;
/*!40000 ALTER TABLE `capacity_per_day` DISABLE KEYS */;
INSERT INTO `capacity_per_day` VALUES (303,28800,0,NULL),(303,28800,1,NULL),(303,28800,2,NULL),(303,28800,3,NULL),(303,28800,4,NULL),(303,0,5,0),(303,0,6,0);
/*!40000 ALTER TABLE `capacity_per_day` ENABLE KEYS */;
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
  `company_logo_url` varchar(255) DEFAULT NULL,
  `scenarios_visible` tinyint(1) DEFAULT '0',
  `enable_critical_chain_support` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk733374f6cc119699` (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (404,2,202,'COMPANY_CODE',1,1,1,1,1,1,1,1,1,1,1,0,0,1,0,0,'',0,NULL),(100,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL),(9,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,0,0);
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
INSERT INTO `criterion_requirement` VALUES (11939,'direct',3,NULL,11519,NULL,708,NULL,NULL),(11940,'direct',3,NULL,11519,NULL,709,NULL,NULL),(11941,'indirect',3,11825,NULL,NULL,709,11940,1),(11942,'indirect',3,11825,NULL,NULL,708,11939,1),(11943,'indirect',3,11826,NULL,NULL,709,11940,1),(11944,'indirect',3,11826,NULL,NULL,708,11939,1),(11945,'direct',3,11826,NULL,NULL,707,NULL,NULL);
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
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
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
INSERT INTO `day_assignment` VALUES (4646,'specific_day',1,0,0,'2011-04-30',3839,4547,NULL,NULL),(4647,'specific_day',1,28800,0,'2011-03-23',3839,4547,NULL,NULL),(4648,'specific_day',1,28800,0,'2011-04-26',3839,4547,NULL,NULL),(4649,'specific_day',1,28800,0,'2011-03-25',3839,4547,NULL,NULL),(4650,'specific_day',1,28800,0,'2011-04-15',3839,4547,NULL,NULL),(4651,'specific_day',1,28800,0,'2011-06-01',3839,4547,NULL,NULL),(4652,'specific_day',1,0,0,'2011-06-19',3839,4547,NULL,NULL),(4653,'specific_day',1,28800,0,'2011-05-02',3839,4547,NULL,NULL),(4654,'specific_day',1,28800,0,'2011-07-26',3839,4547,NULL,NULL),(4655,'specific_day',1,28800,0,'2011-08-03',3839,4547,NULL,NULL),(4656,'specific_day',1,28800,0,'2011-02-10',3839,4547,NULL,NULL),(4657,'specific_day',1,28800,0,'2011-04-07',3839,4547,NULL,NULL),(4658,'specific_day',1,28800,0,'2011-06-17',3839,4547,NULL,NULL),(4659,'specific_day',1,28800,0,'2011-06-24',3839,4547,NULL,NULL),(4660,'specific_day',1,28800,0,'2011-01-24',3839,4547,NULL,NULL),(4661,'specific_day',1,28800,0,'2011-05-05',3839,4547,NULL,NULL),(4662,'specific_day',1,28800,0,'2011-04-01',3839,4547,NULL,NULL),(4663,'specific_day',1,28800,0,'2011-07-05',3839,4547,NULL,NULL),(4664,'specific_day',1,28800,0,'2011-07-19',3839,4547,NULL,NULL),(4665,'specific_day',1,28800,0,'2011-07-25',3839,4547,NULL,NULL),(4666,'specific_day',1,28800,0,'2011-01-12',3839,4547,NULL,NULL),(4667,'specific_day',1,28800,0,'2011-01-20',3839,4547,NULL,NULL),(4668,'specific_day',1,0,0,'2011-07-23',3839,4547,NULL,NULL),(4669,'specific_day',1,28800,0,'2011-07-21',3839,4547,NULL,NULL),(4670,'specific_day',1,0,0,'2011-02-12',3839,4547,NULL,NULL),(4671,'specific_day',1,0,0,'2011-02-06',3839,4547,NULL,NULL),(4672,'specific_day',1,28800,0,'2011-01-17',3839,4547,NULL,NULL),(4673,'specific_day',1,28800,0,'2011-02-07',3839,4547,NULL,NULL),(4674,'specific_day',1,28800,0,'2011-04-25',3839,4547,NULL,NULL),(4675,'specific_day',1,28800,0,'2011-04-06',3839,4547,NULL,NULL),(4676,'specific_day',1,0,0,'2011-01-16',3839,4547,NULL,NULL),(4677,'specific_day',1,28800,0,'2011-03-07',3839,4547,NULL,NULL),(4678,'specific_day',1,0,0,'2011-06-11',3839,4547,NULL,NULL),(4679,'specific_day',1,28800,0,'2011-01-14',3839,4547,NULL,NULL),(4680,'specific_day',1,28800,0,'2011-05-10',3839,4547,NULL,NULL),(4681,'specific_day',1,0,0,'2011-05-29',3839,4547,NULL,NULL),(4682,'specific_day',1,0,0,'2011-03-27',3839,4547,NULL,NULL),(4683,'specific_day',1,28800,0,'2011-07-28',3839,4547,NULL,NULL),(4684,'specific_day',1,28800,0,'2011-06-14',3839,4547,NULL,NULL),(4685,'specific_day',1,28800,0,'2011-04-20',3839,4547,NULL,NULL),(4686,'specific_day',1,28800,0,'2011-08-02',3839,4547,NULL,NULL),(4687,'specific_day',1,28800,0,'2011-07-18',3839,4547,NULL,NULL),(4688,'specific_day',1,28800,0,'2011-03-17',3839,4547,NULL,NULL),(4689,'specific_day',1,28800,0,'2011-04-13',3839,4547,NULL,NULL),(4690,'specific_day',1,28800,0,'2011-04-21',3839,4547,NULL,NULL),(4691,'specific_day',1,28800,0,'2011-04-14',3839,4547,NULL,NULL),(4692,'specific_day',1,0,0,'2011-05-07',3839,4547,NULL,NULL),(4693,'specific_day',1,0,0,'2011-06-25',3839,4547,NULL,NULL),(4694,'specific_day',1,28800,0,'2011-06-15',3839,4547,NULL,NULL),(4695,'specific_day',1,0,0,'2011-06-04',3839,4547,NULL,NULL),(4696,'specific_day',1,0,0,'2011-07-09',3839,4547,NULL,NULL),(4697,'specific_day',1,28800,0,'2011-02-28',3839,4547,NULL,NULL),(4698,'specific_day',1,28800,0,'2011-01-28',3839,4547,NULL,NULL),(4699,'specific_day',1,28800,0,'2011-07-15',3839,4547,NULL,NULL),(4700,'specific_day',1,28800,0,'2011-04-29',3839,4547,NULL,NULL),(4701,'specific_day',1,0,0,'2011-03-12',3839,4547,NULL,NULL),(4702,'specific_day',1,28800,0,'2011-03-02',3839,4547,NULL,NULL),(4703,'specific_day',1,28800,0,'2011-06-22',3839,4547,NULL,NULL),(4704,'specific_day',1,28800,0,'2011-01-13',3839,4547,NULL,NULL),(4705,'specific_day',1,0,0,'2011-07-31',3839,4547,NULL,NULL),(4706,'specific_day',1,0,0,'2011-04-17',3839,4547,NULL,NULL),(4707,'specific_day',1,28800,0,'2011-04-05',3839,4547,NULL,NULL),(4708,'specific_day',1,28800,0,'2011-02-22',3839,4547,NULL,NULL),(4709,'specific_day',1,0,0,'2011-01-29',3839,4547,NULL,NULL),(4710,'specific_day',1,28800,0,'2011-05-04',3839,4547,NULL,NULL),(4711,'specific_day',1,28800,0,'2011-06-20',3839,4547,NULL,NULL),(4712,'specific_day',1,28800,0,'2011-05-23',3839,4547,NULL,NULL),(4713,'specific_day',1,0,0,'2011-04-23',3839,4547,NULL,NULL),(4714,'specific_day',1,28800,0,'2011-01-07',3839,4547,NULL,NULL),(4715,'specific_day',1,28800,0,'2011-03-14',3839,4547,NULL,NULL),(4716,'specific_day',1,28800,0,'2011-01-10',3839,4547,NULL,NULL),(4717,'specific_day',1,0,0,'2011-05-15',3839,4547,NULL,NULL),(4718,'specific_day',1,28800,0,'2011-03-21',3839,4547,NULL,NULL),(4719,'specific_day',1,28800,0,'2011-07-13',3839,4547,NULL,NULL),(4720,'specific_day',1,28800,0,'2011-07-12',3839,4547,NULL,NULL),(4721,'specific_day',1,28800,0,'2011-03-03',3839,4547,NULL,NULL),(4722,'specific_day',1,28800,0,'2011-05-09',3839,4547,NULL,NULL),(4723,'specific_day',1,28800,0,'2011-06-07',3839,4547,NULL,NULL),(4724,'specific_day',1,0,0,'2011-07-03',3839,4547,NULL,NULL),(4725,'specific_day',1,28800,0,'2011-03-24',3839,4547,NULL,NULL),(4726,'specific_day',1,28800,0,'2011-01-26',3839,4547,NULL,NULL),(4727,'specific_day',1,28800,0,'2011-07-08',3839,4547,NULL,NULL),(4728,'specific_day',1,28800,0,'2011-04-27',3839,4547,NULL,NULL),(4729,'specific_day',1,28800,0,'2011-07-01',3839,4547,NULL,NULL),(4730,'specific_day',1,0,0,'2011-06-18',3839,4547,NULL,NULL),(4731,'specific_day',1,0,0,'2011-07-16',3839,4547,NULL,NULL),(4732,'specific_day',1,0,0,'2011-05-14',3839,4547,NULL,NULL),(4733,'specific_day',1,0,0,'2011-05-08',3839,4547,NULL,NULL),(4734,'specific_day',1,28800,0,'2011-06-16',3839,4547,NULL,NULL),(4735,'specific_day',1,0,0,'2011-07-10',3839,4547,NULL,NULL),(4736,'specific_day',1,0,0,'2011-01-08',3839,4547,NULL,NULL),(4737,'specific_day',1,0,0,'2011-02-13',3839,4547,NULL,NULL),(4738,'specific_day',1,0,0,'2011-02-26',3839,4547,NULL,NULL),(4739,'specific_day',1,28800,0,'2011-05-20',3839,4547,NULL,NULL),(4740,'specific_day',1,28800,0,'2011-06-02',3839,4547,NULL,NULL),(4741,'specific_day',1,28800,0,'2011-02-02',3839,4547,NULL,NULL),(4742,'specific_day',1,28800,0,'2011-02-17',3839,4547,NULL,NULL),(4743,'specific_day',1,28800,0,'2011-06-10',3839,4547,NULL,NULL),(4744,'specific_day',1,28800,0,'2011-05-19',3839,4547,NULL,NULL),(4745,'specific_day',1,28800,0,'2011-06-06',3839,4547,NULL,NULL),(4746,'specific_day',1,28800,0,'2011-03-30',3839,4547,NULL,NULL),(4747,'specific_day',1,28800,0,'2011-06-08',3839,4547,NULL,NULL),(4748,'specific_day',1,0,0,'2011-03-26',3839,4547,NULL,NULL),(4749,'specific_day',1,28800,0,'2011-06-29',3839,4547,NULL,NULL),(4750,'specific_day',1,28800,0,'2011-05-03',3839,4547,NULL,NULL),(4751,'specific_day',1,0,0,'2011-07-02',3839,4547,NULL,NULL),(4752,'specific_day',1,28800,0,'2011-07-27',3839,4547,NULL,NULL),(4753,'specific_day',1,0,0,'2011-04-02',3839,4547,NULL,NULL),(4754,'specific_day',1,28800,0,'2011-06-09',3839,4547,NULL,NULL),(4755,'specific_day',1,28800,0,'2011-02-01',3839,4547,NULL,NULL),(4756,'specific_day',1,28800,0,'2011-04-12',3839,4547,NULL,NULL),(4757,'specific_day',1,28800,0,'2011-01-11',3839,4547,NULL,NULL),(4758,'specific_day',1,28800,0,'2011-05-31',3839,4547,NULL,NULL),(4759,'specific_day',1,0,0,'2011-03-20',3839,4547,NULL,NULL),(4760,'specific_day',1,28800,0,'2011-02-25',3839,4547,NULL,NULL),(4761,'specific_day',1,0,0,'2011-01-05',3839,4547,NULL,NULL),(4762,'specific_day',1,0,0,'2011-07-24',3839,4547,NULL,NULL),(4763,'specific_day',1,0,0,'2011-04-09',3839,4547,NULL,NULL),(4764,'specific_day',1,28800,0,'2011-07-07',3839,4547,NULL,NULL),(4765,'specific_day',1,0,0,'2011-01-19',3839,4547,NULL,NULL),(4766,'specific_day',1,28800,0,'2011-08-04',3839,4547,NULL,NULL),(4767,'specific_day',1,0,0,'2011-01-22',3839,4547,NULL,NULL),(4768,'specific_day',1,28800,0,'2011-06-13',3839,4547,NULL,NULL),(4769,'specific_day',1,0,0,'2011-07-30',3839,4547,NULL,NULL),(4770,'specific_day',1,28800,0,'2011-05-17',3839,4547,NULL,NULL),(4771,'specific_day',1,28800,0,'2011-03-29',3839,4547,NULL,NULL),(4772,'specific_day',1,28800,0,'2011-03-09',3839,4547,NULL,NULL),(4773,'specific_day',1,0,0,'2011-05-28',3839,4547,NULL,NULL),(4774,'specific_day',1,28800,0,'2011-07-29',3839,4547,NULL,NULL),(4775,'specific_day',1,0,0,'2011-03-13',3839,4547,NULL,NULL),(4776,'specific_day',1,28800,0,'2011-05-16',3839,4547,NULL,NULL),(4777,'specific_day',1,28800,0,'2011-01-31',3839,4547,NULL,NULL),(4778,'specific_day',1,0,0,'2011-01-15',3839,4547,NULL,NULL),(4779,'specific_day',1,28800,0,'2011-08-05',3839,4547,NULL,NULL),(4780,'specific_day',1,28800,0,'2011-01-25',3839,4547,NULL,NULL),(4781,'specific_day',1,0,0,'2011-05-21',3839,4547,NULL,NULL),(4782,'specific_day',1,28800,0,'2011-06-27',3839,4547,NULL,NULL),(4783,'specific_day',1,28800,0,'2011-07-20',3839,4547,NULL,NULL),(4784,'specific_day',1,28800,0,'2011-02-15',3839,4547,NULL,NULL),(4785,'specific_day',1,28800,0,'2011-07-14',3839,4547,NULL,NULL),(4786,'specific_day',1,28800,0,'2011-03-15',3839,4547,NULL,NULL),(4787,'specific_day',1,0,0,'2011-01-23',3839,4547,NULL,NULL),(4788,'specific_day',1,0,0,'2011-02-05',3839,4547,NULL,NULL),(4789,'specific_day',1,28800,0,'2011-04-04',3839,4547,NULL,NULL),(4790,'specific_day',1,28800,0,'2011-05-11',3839,4547,NULL,NULL),(4791,'specific_day',1,28800,0,'2011-03-16',3839,4547,NULL,NULL),(4792,'specific_day',1,28800,0,'2011-07-04',3839,4547,NULL,NULL),(4793,'specific_day',1,28800,0,'2011-02-14',3839,4547,NULL,NULL),(4794,'specific_day',1,28800,0,'2011-04-28',3839,4547,NULL,NULL),(4795,'specific_day',1,28800,0,'2011-06-23',3839,4547,NULL,NULL),(4796,'specific_day',1,28800,0,'2011-05-26',3839,4547,NULL,NULL),(4797,'specific_day',1,28800,0,'2011-05-12',3839,4547,NULL,NULL),(4798,'specific_day',1,28800,0,'2011-03-10',3839,4547,NULL,NULL),(4799,'specific_day',1,0,0,'2011-03-19',3839,4547,NULL,NULL),(4800,'specific_day',1,0,0,'2011-07-17',3839,4547,NULL,NULL),(4801,'specific_day',1,28800,0,'2011-03-08',3839,4547,NULL,NULL),(4802,'specific_day',1,0,0,'2011-04-24',3839,4547,NULL,NULL),(4803,'specific_day',1,0,0,'2011-05-01',3839,4547,NULL,NULL),(4804,'specific_day',1,0,0,'2011-03-05',3839,4547,NULL,NULL),(4805,'specific_day',1,28800,0,'2011-03-11',3839,4547,NULL,NULL),(4806,'specific_day',1,0,0,'2011-02-20',3839,4547,NULL,NULL),(4807,'specific_day',1,28800,0,'2011-05-18',3839,4547,NULL,NULL),(4808,'specific_day',1,0,0,'2011-02-27',3839,4547,NULL,NULL),(4809,'specific_day',1,28800,0,'2011-03-01',3839,4547,NULL,NULL),(4810,'specific_day',1,28800,0,'2011-05-24',3839,4547,NULL,NULL),(4811,'specific_day',1,28800,0,'2011-02-09',3839,4547,NULL,NULL),(4812,'specific_day',1,28800,0,'2011-02-08',3839,4547,NULL,NULL),(4813,'specific_day',1,0,0,'2011-03-06',3839,4547,NULL,NULL),(4814,'specific_day',1,28800,0,'2011-02-21',3839,4547,NULL,NULL),(4815,'specific_day',1,28800,0,'2011-02-18',3839,4547,NULL,NULL),(4816,'specific_day',1,28800,0,'2011-05-27',3839,4547,NULL,NULL),(4817,'specific_day',1,28800,0,'2011-07-06',3839,4547,NULL,NULL),(4818,'specific_day',1,28800,0,'2011-02-24',3839,4547,NULL,NULL),(4819,'specific_day',1,28800,0,'2011-03-04',3839,4547,NULL,NULL),(4820,'specific_day',1,28800,0,'2011-02-11',3839,4547,NULL,NULL),(4821,'specific_day',1,0,0,'2011-02-19',3839,4547,NULL,NULL),(4822,'specific_day',1,28800,0,'2011-01-27',3839,4547,NULL,NULL),(4823,'specific_day',1,0,0,'2011-01-06',3839,4547,NULL,NULL),(4824,'specific_day',1,28800,0,'2011-05-13',3839,4547,NULL,NULL),(4825,'specific_day',1,28800,0,'2011-05-06',3839,4547,NULL,NULL),(4826,'specific_day',1,28800,0,'2011-06-30',3839,4547,NULL,NULL),(4827,'specific_day',1,0,0,'2011-01-09',3839,4547,NULL,NULL),(4828,'specific_day',1,28800,0,'2011-02-04',3839,4547,NULL,NULL),(4829,'specific_day',1,28800,0,'2011-06-03',3839,4547,NULL,NULL),(4830,'specific_day',1,28800,0,'2011-02-16',3839,4547,NULL,NULL),(4831,'specific_day',1,28800,0,'2011-03-18',3839,4547,NULL,NULL),(4832,'specific_day',1,28800,0,'2011-06-28',3839,4547,NULL,NULL),(4833,'specific_day',1,28800,0,'2011-06-21',3839,4547,NULL,NULL),(4834,'specific_day',1,28800,0,'2011-04-11',3839,4547,NULL,NULL),(4835,'specific_day',1,28800,0,'2011-05-25',3839,4547,NULL,NULL),(4836,'specific_day',1,0,0,'2011-06-26',3839,4547,NULL,NULL),(4837,'specific_day',1,28800,0,'2011-05-30',3839,4547,NULL,NULL),(4838,'specific_day',1,28800,0,'2011-04-22',3839,4547,NULL,NULL),(4839,'specific_day',1,0,0,'2011-05-22',3839,4547,NULL,NULL),(4840,'specific_day',1,28800,0,'2011-04-19',3839,4547,NULL,NULL),(4841,'specific_day',1,28800,0,'2011-04-18',3839,4547,NULL,NULL),(4842,'specific_day',1,28800,0,'2011-01-18',3839,4547,NULL,NULL),(4843,'specific_day',1,0,0,'2011-06-12',3839,4547,NULL,NULL),(4844,'specific_day',1,28800,0,'2011-03-22',3839,4547,NULL,NULL),(4845,'specific_day',1,28800,0,'2011-04-08',3839,4547,NULL,NULL),(4846,'specific_day',1,28800,0,'2011-01-21',3839,4547,NULL,NULL),(4847,'specific_day',1,28800,0,'2011-07-22',3839,4547,NULL,NULL),(4848,'specific_day',1,0,0,'2011-04-03',3839,4547,NULL,NULL),(4849,'specific_day',1,0,0,'2011-06-05',3839,4547,NULL,NULL),(4850,'specific_day',1,28800,0,'2011-08-01',3839,4547,NULL,NULL),(4851,'specific_day',1,0,0,'2011-04-16',3839,4547,NULL,NULL),(4852,'specific_day',1,0,0,'2011-04-10',3839,4547,NULL,NULL),(4853,'specific_day',1,28800,0,'2011-03-31',3839,4547,NULL,NULL),(4854,'specific_day',1,28800,0,'2011-02-23',3839,4547,NULL,NULL),(4855,'specific_day',1,28800,0,'2011-02-03',3839,4547,NULL,NULL),(4856,'specific_day',1,28800,0,'2011-03-28',3839,4547,NULL,NULL),(4857,'specific_day',1,0,0,'2011-01-30',3839,4547,NULL,NULL),(4858,'specific_day',1,28800,0,'2011-07-11',3839,4547,NULL,NULL),(12303,'specific_day',1,28800,0,'2011-10-20',3839,7880,NULL,NULL),(12304,'specific_day',1,28800,0,'2011-08-19',3839,7880,NULL,NULL),(12305,'specific_day',1,28800,0,'2011-10-03',3839,7880,NULL,NULL),(12292,'specific_day',1,0,0,'2011-08-27',3839,7880,NULL,NULL),(12293,'specific_day',1,28800,0,'2011-08-17',3839,7880,NULL,NULL),(12294,'specific_day',1,28800,0,'2011-09-01',3839,7880,NULL,NULL),(12295,'specific_day',1,28800,0,'2011-08-18',3839,7880,NULL,NULL),(12296,'specific_day',1,0,0,'2011-10-02',3839,7880,NULL,NULL),(12297,'specific_day',1,28800,0,'2011-08-09',3839,7880,NULL,NULL),(12298,'specific_day',1,28800,0,'2011-10-28',3839,7880,NULL,NULL),(12299,'specific_day',1,0,0,'2011-08-21',3839,7880,NULL,NULL),(12300,'specific_day',1,28800,0,'2011-09-15',3839,7880,NULL,NULL),(12301,'specific_day',1,28800,0,'2011-10-14',3839,7880,NULL,NULL),(12302,'specific_day',1,28800,0,'2011-08-22',3839,7880,NULL,NULL),(12289,'specific_day',1,28800,0,'2011-08-29',3839,7880,NULL,NULL),(12290,'specific_day',1,0,0,'2011-10-29',3839,7880,NULL,NULL),(12291,'specific_day',1,28800,0,'2011-08-11',3839,7880,NULL,NULL),(12328,'specific_day',2,0,0,'2011-10-15',7073,7882,NULL,NULL),(12327,'specific_day',2,28800,0,'2011-10-31',7073,7882,NULL,NULL),(12326,'specific_day',2,28800,0,'2011-10-27',7073,7882,NULL,NULL),(12325,'specific_day',2,0,0,'2011-10-16',7073,7882,NULL,NULL),(12306,'specific_day',1,0,0,'2011-10-09',3839,7880,NULL,NULL),(12307,'specific_day',1,28800,0,'2011-11-01',3839,7880,NULL,NULL),(12308,'specific_day',1,28800,0,'2011-09-09',3839,7880,NULL,NULL),(12309,'specific_day',1,28800,0,'2011-10-27',3839,7880,NULL,NULL),(12310,'specific_day',1,28800,0,'2011-09-20',3839,7880,NULL,NULL),(12311,'specific_day',2,0,0,'2011-10-30',7073,7882,NULL,NULL),(12312,'specific_day',2,28800,0,'2011-10-18',7073,7882,NULL,NULL),(12313,'specific_day',2,28800,0,'2011-10-21',7073,7882,NULL,NULL),(12314,'specific_day',2,28800,0,'2011-10-14',7073,7882,NULL,NULL),(12315,'specific_day',2,28800,0,'2011-10-17',7073,7882,NULL,NULL),(12316,'specific_day',2,28800,0,'2011-10-24',7073,7882,NULL,NULL),(12317,'specific_day',2,28800,0,'2011-11-01',7073,7882,NULL,NULL),(12318,'specific_day',2,28800,0,'2011-10-28',7073,7882,NULL,NULL),(12319,'specific_day',2,28800,0,'2011-10-26',7073,7882,NULL,NULL),(12320,'specific_day',2,28800,0,'2011-10-13',7073,7882,NULL,NULL),(12321,'specific_day',2,28800,0,'2011-10-12',7073,7882,NULL,NULL),(12322,'specific_day',2,0,0,'2011-10-23',7073,7882,NULL,NULL),(12323,'specific_day',2,28800,0,'2011-10-19',7073,7882,NULL,NULL),(12324,'specific_day',2,0,0,'2011-10-22',7073,7882,NULL,NULL),(12272,'specific_day',1,28800,0,'2011-08-23',3839,7880,NULL,NULL),(12273,'specific_day',1,28800,0,'2011-10-31',3839,7880,NULL,NULL),(12270,'specific_day',1,28800,0,'2011-10-07',3839,7880,NULL,NULL),(12271,'specific_day',1,0,0,'2011-10-23',3839,7880,NULL,NULL),(12269,'specific_day',1,0,0,'2011-08-05',3839,7880,NULL,NULL),(12262,'specific_day',1,0,0,'2011-09-25',3839,7880,NULL,NULL),(12263,'specific_day',1,28800,0,'2011-09-06',3839,7880,NULL,NULL),(12264,'specific_day',1,28800,0,'2011-10-19',3839,7880,NULL,NULL),(12265,'specific_day',1,28800,0,'2011-08-12',3839,7880,NULL,NULL),(12266,'specific_day',1,0,0,'2011-08-06',3839,7880,NULL,NULL),(12267,'specific_day',1,0,0,'2011-08-20',3839,7880,NULL,NULL),(12268,'specific_day',1,28800,0,'2011-09-21',3839,7880,NULL,NULL),(12259,'specific_day',1,28800,0,'2011-09-16',3839,7880,NULL,NULL),(12260,'specific_day',1,28800,0,'2011-10-26',3839,7880,NULL,NULL),(12258,'specific_day',1,0,0,'2011-10-08',3839,7880,NULL,NULL),(12221,'specific_day',1,28800,0,'2011-09-14',3839,7880,NULL,NULL),(12222,'specific_day',1,28800,0,'2011-10-21',3839,7880,NULL,NULL),(12223,'specific_day',1,28800,0,'2011-10-13',3839,7880,NULL,NULL),(12224,'specific_day',1,0,0,'2011-09-18',3839,7880,NULL,NULL),(12225,'specific_day',1,28800,0,'2011-08-25',3839,7880,NULL,NULL),(12226,'specific_day',1,28800,0,'2011-09-12',3839,7880,NULL,NULL),(12227,'specific_day',1,28800,0,'2011-10-17',3839,7880,NULL,NULL),(12228,'specific_day',1,28800,0,'2011-09-22',3839,7880,NULL,NULL),(12229,'specific_day',1,28800,0,'2011-09-13',3839,7880,NULL,NULL),(12230,'specific_day',1,0,0,'2011-10-01',3839,7880,NULL,NULL),(12231,'specific_day',1,28800,0,'2011-09-05',3839,7880,NULL,NULL),(12232,'specific_day',1,0,0,'2011-08-07',3839,7880,NULL,NULL),(12233,'specific_day',1,28800,0,'2011-09-07',3839,7880,NULL,NULL),(12234,'specific_day',1,28800,0,'2011-08-08',3839,7880,NULL,NULL),(12235,'specific_day',1,0,0,'2011-10-15',3839,7880,NULL,NULL),(12236,'specific_day',1,28800,0,'2011-09-02',3839,7880,NULL,NULL),(12237,'specific_day',1,0,0,'2011-08-14',3839,7880,NULL,NULL),(12238,'specific_day',1,28800,0,'2011-08-30',3839,7880,NULL,NULL),(12239,'specific_day',1,28800,0,'2011-08-26',3839,7880,NULL,NULL),(12240,'specific_day',1,28800,0,'2011-09-08',3839,7880,NULL,NULL),(12241,'specific_day',1,28800,0,'2011-08-31',3839,7880,NULL,NULL),(12242,'specific_day',1,28800,0,'2011-09-27',3839,7880,NULL,NULL),(12243,'specific_day',1,28800,0,'2011-10-04',3839,7880,NULL,NULL),(12244,'specific_day',1,28800,0,'2011-08-15',3839,7880,NULL,NULL),(12245,'specific_day',1,0,0,'2011-09-24',3839,7880,NULL,NULL),(12246,'specific_day',1,28800,0,'2011-08-24',3839,7880,NULL,NULL),(12247,'specific_day',1,28800,0,'2011-09-28',3839,7880,NULL,NULL),(10628,'specific_day',0,28800,0,'2011-04-14',7071,9393,NULL,NULL),(10629,'specific_day',0,28800,0,'2011-05-03',7071,9393,NULL,NULL),(12261,'specific_day',1,0,0,'2011-10-30',3839,7880,NULL,NULL),(10625,'specific_day',0,28800,0,'2011-05-02',7071,9393,NULL,NULL),(10626,'specific_day',0,0,0,'2011-04-24',7071,9393,NULL,NULL),(10618,'specific_day',0,28800,0,'2011-04-18',7071,9393,NULL,NULL),(10619,'specific_day',0,28800,0,'2011-04-12',7071,9393,NULL,NULL),(10620,'specific_day',0,28800,0,'2011-05-04',7071,9393,NULL,NULL),(10621,'specific_day',0,0,0,'2011-04-17',7071,9393,NULL,NULL),(10622,'specific_day',0,28800,0,'2011-04-26',7071,9393,NULL,NULL),(10623,'specific_day',0,28800,0,'2011-04-13',7071,9393,NULL,NULL),(10624,'specific_day',0,0,0,'2011-05-01',7071,9393,NULL,NULL),(12248,'specific_day',1,28800,0,'2011-08-10',3839,7880,NULL,NULL),(12249,'specific_day',1,0,0,'2011-08-13',3839,7880,NULL,NULL),(12250,'specific_day',1,0,0,'2011-09-11',3839,7880,NULL,NULL),(12251,'specific_day',1,28800,0,'2011-09-29',3839,7880,NULL,NULL),(12252,'specific_day',1,0,0,'2011-08-28',3839,7880,NULL,NULL),(12253,'specific_day',1,28800,0,'2011-10-10',3839,7880,NULL,NULL),(12254,'specific_day',1,28800,0,'2011-09-26',3839,7880,NULL,NULL),(12255,'specific_day',1,0,0,'2011-10-16',3839,7880,NULL,NULL),(12256,'specific_day',1,28800,0,'2011-10-12',3839,7880,NULL,NULL),(12257,'specific_day',1,0,0,'2011-09-04',3839,7880,NULL,NULL),(10627,'specific_day',0,28800,0,'2011-04-11',7071,9393,NULL,NULL),(10605,'specific_day',0,28800,0,'2011-04-29',7071,9393,NULL,NULL),(10606,'specific_day',0,21600,0,'2011-05-05',7071,9393,NULL,NULL),(10607,'specific_day',0,28800,0,'2011-04-28',7071,9393,NULL,NULL),(10608,'specific_day',0,28800,0,'2011-04-19',7071,9393,NULL,NULL),(10609,'specific_day',0,28800,0,'2011-04-27',7071,9393,NULL,NULL),(10610,'specific_day',0,0,0,'2011-04-30',7071,9393,NULL,NULL),(10611,'specific_day',0,28800,0,'2011-04-22',7071,9393,NULL,NULL),(10612,'specific_day',0,28800,0,'2011-04-15',7071,9393,NULL,NULL),(10613,'specific_day',0,0,0,'2011-04-23',7071,9393,NULL,NULL),(10614,'specific_day',0,28800,0,'2011-04-21',7071,9393,NULL,NULL),(10615,'specific_day',0,0,0,'2011-04-16',7071,9393,NULL,NULL),(10616,'specific_day',0,28800,0,'2011-04-25',7071,9393,NULL,NULL),(10617,'specific_day',0,28800,0,'2011-04-20',7071,9393,NULL,NULL),(12288,'specific_day',1,14400,0,'2011-11-02',3839,7880,NULL,NULL),(12287,'specific_day',1,28800,0,'2011-09-19',3839,7880,NULL,NULL),(12286,'specific_day',1,28800,0,'2011-10-24',3839,7880,NULL,NULL),(12285,'specific_day',1,28800,0,'2011-08-16',3839,7880,NULL,NULL),(12284,'specific_day',1,0,0,'2011-09-10',3839,7880,NULL,NULL),(12283,'specific_day',1,28800,0,'2011-10-25',3839,7880,NULL,NULL),(12282,'specific_day',1,28800,0,'2011-10-05',3839,7880,NULL,NULL),(12281,'specific_day',1,0,0,'2011-09-03',3839,7880,NULL,NULL),(12280,'specific_day',1,28800,0,'2011-10-11',3839,7880,NULL,NULL),(12279,'specific_day',1,28800,0,'2011-10-18',3839,7880,NULL,NULL),(12278,'specific_day',1,28800,0,'2011-09-30',3839,7880,NULL,NULL),(12277,'specific_day',1,0,0,'2011-09-17',3839,7880,NULL,NULL),(12276,'specific_day',1,0,0,'2011-10-22',3839,7880,NULL,NULL),(12275,'specific_day',1,28800,0,'2011-10-06',3839,7880,NULL,NULL),(12274,'specific_day',1,28800,0,'2011-09-23',3839,7880,NULL,NULL),(18336,'specific_day',4,28800,0,'2011-02-15',17676,18183,NULL,NULL),(18333,'specific_day',4,0,0,'2011-02-12',17676,18183,NULL,NULL),(18334,'specific_day',4,28800,0,'2011-01-27',17676,18183,NULL,NULL),(18335,'specific_day',4,28800,0,'2011-02-04',17676,18183,NULL,NULL),(18332,'specific_day',4,0,0,'2011-02-13',17676,18183,NULL,NULL),(18330,'specific_day',4,21600,0,'2011-02-16',17676,18183,NULL,NULL),(18331,'specific_day',4,28800,0,'2011-02-09',17676,18183,NULL,NULL),(18394,'specific_day',2,28800,0,'2011-03-08',17676,18184,NULL,NULL),(18341,'specific_day',4,0,0,'2011-01-30',17676,18183,NULL,NULL),(18340,'specific_day',4,28800,0,'2011-01-31',17676,18183,NULL,NULL),(18339,'specific_day',4,28800,0,'2011-01-24',17676,18183,NULL,NULL),(18338,'specific_day',4,0,0,'2011-01-29',17676,18183,NULL,NULL),(18337,'specific_day',4,0,0,'2011-02-06',17676,18183,NULL,NULL),(18407,'specific_day',2,28800,0,'2011-04-07',17676,18184,NULL,NULL),(18408,'specific_day',2,28800,0,'2011-03-14',17676,18184,NULL,NULL),(18372,'specific_day',4,0,0,'2011-01-29',17676,18181,NULL,NULL),(18373,'specific_day',4,28800,0,'2011-02-01',17676,18181,NULL,NULL),(18374,'specific_day',4,28800,0,'2011-01-24',17676,18181,NULL,NULL),(18375,'specific_day',4,28800,0,'2011-01-26',17676,18181,NULL,NULL),(18397,'specific_day',2,0,0,'2011-03-20',17676,18184,NULL,NULL),(18398,'specific_day',2,28800,0,'2011-03-11',17676,18184,NULL,NULL),(18399,'specific_day',2,0,0,'2011-03-19',17676,18184,NULL,NULL),(18400,'specific_day',2,28800,0,'2011-03-31',17676,18184,NULL,NULL),(18401,'specific_day',2,28800,0,'2011-03-30',17676,18184,NULL,NULL),(18402,'specific_day',2,0,0,'2011-04-10',17676,18184,NULL,NULL),(18403,'specific_day',2,28800,0,'2011-03-21',17676,18184,NULL,NULL),(18404,'specific_day',2,0,0,'2011-03-13',17676,18184,NULL,NULL),(18405,'specific_day',2,28800,0,'2011-03-23',17676,18184,NULL,NULL),(18406,'specific_day',2,21600,0,'2011-03-07',17676,18184,NULL,NULL),(19306,'specific_day',0,7488,0,'2011-01-27',7071,19190,NULL,NULL),(18409,'specific_day',2,28800,0,'2011-03-18',17676,18184,NULL,NULL),(18410,'specific_day',2,28800,0,'2011-04-05',17676,18184,NULL,NULL),(18411,'specific_day',2,28800,0,'2011-03-28',17676,18184,NULL,NULL),(19291,'specific_day',0,7488,0,'2011-02-02',7071,19190,NULL,NULL),(19292,'specific_day',0,7488,0,'2011-02-01',7071,19190,NULL,NULL),(19293,'specific_day',0,0,0,'2011-01-30',7071,19190,NULL,NULL),(19294,'specific_day',0,0,0,'2011-01-29',7071,19190,NULL,NULL),(19295,'specific_day',0,7488,0,'2011-01-24',7071,19190,NULL,NULL),(19296,'specific_day',0,0,0,'2011-02-05',7071,19190,NULL,NULL),(19297,'specific_day',0,7488,0,'2011-02-07',7071,19190,NULL,NULL),(19298,'specific_day',0,7488,0,'2011-01-25',7071,19190,NULL,NULL),(19299,'specific_day',0,0,0,'2011-01-23',7071,19190,NULL,NULL),(19300,'specific_day',0,7488,0,'2011-02-03',7071,19190,NULL,NULL),(19301,'specific_day',0,0,0,'2011-02-06',7071,19190,NULL,NULL),(19302,'specific_day',0,0,0,'2011-01-22',7071,19190,NULL,NULL),(19303,'specific_day',0,7488,0,'2011-01-28',7071,19190,NULL,NULL),(19304,'specific_day',0,144,0,'2011-02-08',7071,19190,NULL,NULL),(19305,'specific_day',0,7488,0,'2011-01-31',7071,19190,NULL,NULL),(19308,'specific_day',0,7488,0,'2011-02-04',7071,19190,NULL,NULL),(19307,'specific_day',0,7488,0,'2011-01-26',7071,19190,NULL,NULL),(18366,'specific_day',4,0,0,'2011-01-30',17676,18181,NULL,NULL),(18367,'specific_day',4,28800,0,'2011-02-03',17676,18181,NULL,NULL),(18365,'specific_day',4,0,0,'2011-02-05',17676,18181,NULL,NULL),(18355,'specific_day',4,28800,0,'2011-01-21',17676,18183,NULL,NULL),(18356,'specific_day',4,0,0,'2011-01-23',17676,18183,NULL,NULL),(18396,'specific_day',2,28800,0,'2011-03-16',17676,18184,NULL,NULL),(18357,'specific_day',4,28800,0,'2011-02-07',17676,18181,NULL,NULL),(18358,'specific_day',4,28800,0,'2011-01-25',17676,18181,NULL,NULL),(18359,'specific_day',4,28800,0,'2011-02-02',17676,18181,NULL,NULL),(18360,'specific_day',4,28800,0,'2011-01-21',17676,18181,NULL,NULL),(18361,'specific_day',4,0,0,'2011-02-06',17676,18181,NULL,NULL),(18362,'specific_day',4,14400,0,'2011-02-08',17676,18181,NULL,NULL),(18363,'specific_day',4,28800,0,'2011-01-28',17676,18181,NULL,NULL),(18364,'specific_day',4,28800,0,'2011-01-31',17676,18181,NULL,NULL),(18342,'specific_day',4,0,0,'2011-01-22',17676,18183,NULL,NULL),(18343,'specific_day',4,28800,0,'2011-02-01',17676,18183,NULL,NULL),(18344,'specific_day',4,28800,0,'2011-01-25',17676,18183,NULL,NULL),(18345,'specific_day',4,28800,0,'2011-02-10',17676,18183,NULL,NULL),(18346,'specific_day',4,28800,0,'2011-02-03',17676,18183,NULL,NULL),(18347,'specific_day',4,28800,0,'2011-01-26',17676,18183,NULL,NULL),(18348,'specific_day',4,0,0,'2011-02-05',17676,18183,NULL,NULL),(18349,'specific_day',4,28800,0,'2011-02-14',17676,18183,NULL,NULL),(18350,'specific_day',4,28800,0,'2011-02-08',17676,18183,NULL,NULL),(18351,'specific_day',4,28800,0,'2011-02-07',17676,18183,NULL,NULL),(18352,'specific_day',4,28800,0,'2011-01-28',17676,18183,NULL,NULL),(18353,'specific_day',4,28800,0,'2011-02-11',17676,18183,NULL,NULL),(18354,'specific_day',4,28800,0,'2011-02-02',17676,18183,NULL,NULL),(18371,'specific_day',4,0,0,'2011-01-22',17676,18181,NULL,NULL),(18370,'specific_day',4,28800,0,'2011-01-27',17676,18181,NULL,NULL),(18369,'specific_day',4,0,0,'2011-01-23',17676,18181,NULL,NULL),(18368,'specific_day',4,28800,0,'2011-02-04',17676,18181,NULL,NULL),(18395,'specific_day',2,28800,0,'2011-03-24',17676,18184,NULL,NULL),(12329,'specific_day',2,28800,0,'2011-10-25',7073,7882,NULL,NULL),(12330,'specific_day',2,0,0,'2011-10-29',7073,7882,NULL,NULL),(12331,'specific_day',2,28800,0,'2011-10-20',7073,7882,NULL,NULL),(18390,'specific_day',2,28800,0,'2011-03-10',17676,18184,NULL,NULL),(18391,'specific_day',2,0,0,'2011-03-12',17676,18184,NULL,NULL),(18392,'specific_day',2,28800,0,'2011-03-29',17676,18184,NULL,NULL),(18393,'specific_day',2,0,0,'2011-04-09',17676,18184,NULL,NULL),(18376,'specific_day',2,28800,0,'2011-03-15',17676,18184,NULL,NULL),(18377,'specific_day',2,28800,0,'2011-04-04',17676,18184,NULL,NULL),(18378,'specific_day',2,28800,0,'2011-04-06',17676,18184,NULL,NULL),(18379,'specific_day',2,28800,0,'2011-03-25',17676,18184,NULL,NULL),(18380,'specific_day',2,28800,0,'2011-03-22',17676,18184,NULL,NULL),(18381,'specific_day',2,0,0,'2011-04-03',17676,18184,NULL,NULL),(18382,'specific_day',2,28800,0,'2011-03-17',17676,18184,NULL,NULL),(18383,'specific_day',2,28800,0,'2011-03-09',17676,18184,NULL,NULL),(18384,'specific_day',2,0,0,'2011-03-26',17676,18184,NULL,NULL),(18385,'specific_day',2,7200,0,'2011-04-11',17676,18184,NULL,NULL),(18386,'specific_day',2,28800,0,'2011-04-08',17676,18184,NULL,NULL),(18387,'specific_day',2,0,0,'2011-04-02',17676,18184,NULL,NULL),(18388,'specific_day',2,0,0,'2011-03-27',17676,18184,NULL,NULL),(18389,'specific_day',2,28800,0,'2011-04-01',17676,18184,NULL,NULL),(19309,'specific_day',0,7488,0,'2011-01-21',7071,19190,NULL,NULL),(19310,'specific_day',0,7488,0,'2011-02-01',17676,18182,NULL,NULL),(19311,'specific_day',0,7488,0,'2011-01-24',17676,18182,NULL,NULL),(19312,'specific_day',0,7488,0,'2011-01-27',17676,18182,NULL,NULL),(19313,'specific_day',0,7488,0,'2011-01-26',17676,18182,NULL,NULL),(19314,'specific_day',0,7488,0,'2011-02-03',17676,18182,NULL,NULL),(19315,'specific_day',0,7488,0,'2011-02-07',17676,18182,NULL,NULL),(19316,'specific_day',0,0,0,'2011-02-06',17676,18182,NULL,NULL),(19317,'specific_day',0,0,0,'2011-01-22',17676,18182,NULL,NULL),(19318,'specific_day',0,7488,0,'2011-01-28',17676,18182,NULL,NULL),(19319,'specific_day',0,7488,0,'2011-01-31',17676,18182,NULL,NULL),(19320,'specific_day',0,7488,0,'2011-02-04',17676,18182,NULL,NULL),(19321,'specific_day',0,0,0,'2011-01-29',17676,18182,NULL,NULL),(19322,'specific_day',0,7488,0,'2011-01-25',17676,18182,NULL,NULL),(19323,'specific_day',0,0,0,'2011-01-30',17676,18182,NULL,NULL),(19324,'specific_day',0,0,0,'2011-02-05',17676,18182,NULL,NULL),(19325,'specific_day',0,0,0,'2011-01-23',17676,18182,NULL,NULL),(19326,'specific_day',0,7488,0,'2011-02-02',17676,18182,NULL,NULL),(19327,'specific_day',0,144,0,'2011-02-08',17676,18182,NULL,NULL),(19328,'specific_day',0,7488,0,'2011-01-21',17676,18182,NULL,NULL);
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
INSERT INTO `dependency` VALUES (2195457,8,6566,6567,NULL,0),(2195456,8,6565,6567,NULL,2),(2195458,8,6565,6566,NULL,0),(2195459,6,6569,6570,7782,0),(2261008,6,6575,6570,7777,2),(2261009,7,6571,6575,7778,0),(2261010,7,6571,6569,7779,1),(2261011,6,6572,6573,7780,0),(2261012,6,6572,6570,7781,0),(2261026,6,6571,6576,7784,0),(2261027,5,6575,6576,7783,2),(2261028,5,6572,6575,7785,0),(3113030,2,6565,10302,NULL,1),(4292611,0,13029,13030,NULL,0),(3407876,1,6567,10302,NULL,1),(4292612,0,13029,13037,NULL,0),(4292613,0,13030,13031,NULL,2),(4292614,0,13033,13034,NULL,0),(4292615,0,13034,13035,NULL,0),(4292616,0,13035,13036,NULL,0),(4292617,2,14168,14190,NULL,0),(4292618,2,14169,14210,NULL,0),(4292619,2,14160,14170,NULL,0),(4292620,2,14170,14180,NULL,0),(6160384,1,6571,18889,NULL,0);
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
INSERT INTO `direct_advance_assignment` VALUES (6504,6001,'100.00'),(5454,4956,'100.00'),(3535,3036,'100.00'),(6505,6002,'100.00'),(6506,6003,'100.00'),(6509,6024,'100.00'),(6510,6025,'100.00'),(6511,6026,'100.00'),(6512,6028,'100.00'),(6513,6029,'100.00'),(6516,6030,'100.00'),(6517,6031,'100.00'),(8888,8391,'100.00'),(8889,8392,'100.00'),(10201,9800,'100.00'),(12019,11519,'100.00'),(12928,12447,'100.00'),(12929,12448,'100.00'),(12930,12449,'100.00'),(12931,12450,'100.00'),(12932,12452,'100.00'),(12933,12453,'100.00'),(12934,12454,'100.00'),(12935,12455,'100.00'),(12936,12456,'100.00'),(14078,13671,'100.00'),(14079,13672,'100.00'),(14080,13673,'100.00'),(14081,13674,'100.00'),(14082,13675,'100.00'),(14083,13676,'100.00'),(14084,13677,'100.00'),(14085,13678,'100.00'),(14086,13679,'100.00'),(16388,16134,'100.00'),(16389,16135,'100.00'),(16390,16136,'100.00'),(16391,16137,'100.00'),(16392,16139,'100.00'),(16393,16140,'100.00'),(16394,16141,'100.00'),(16395,16142,'100.00'),(16396,16143,'100.00'),(16399,16145,'100.00'),(16400,16146,'100.00'),(16401,16147,'100.00'),(16402,16148,'100.00'),(16403,16149,'100.00'),(16404,16150,'100.00'),(16405,16151,'100.00'),(16406,16152,'100.00'),(16407,16153,'100.00'),(16410,16155,'100.00'),(16411,16156,'100.00'),(16412,16157,'100.00'),(16413,16158,'100.00'),(16414,16159,'100.00'),(16415,16564,'100.00'),(16416,16565,'100.00'),(16417,16566,'100.00'),(16418,16567,'100.00'),(16421,16569,'100.00'),(16422,16570,'100.00'),(16423,16571,'100.00'),(16424,16572,'100.00'),(16425,16573,'100.00'),(16426,16574,'100.00'),(16427,16575,'100.00'),(16428,16576,'100.00'),(16429,16577,'100.00'),(16432,16579,'100.00'),(16433,16580,'100.00'),(16434,16581,'100.00'),(16435,16582,'100.00'),(16436,16583,'100.00'),(16437,16584,'100.00'),(16438,16585,'100.00'),(16439,16586,'100.00'),(16440,16587,'100.00'),(16443,16589,'100.00'),(16444,16590,'100.00'),(16445,16591,'100.00'),(16446,16592,'100.00'),(16447,16593,'100.00'),(16448,16594,'100.00'),(16449,16595,'100.00'),(16450,16596,'100.00'),(16451,16597,'100.00'),(16454,16599,'100.00'),(16455,16600,'100.00'),(16456,16601,'100.00'),(16457,16602,'100.00'),(16458,16603,'100.00'),(16459,16604,'100.00'),(16460,16605,'100.00'),(16461,16606,'100.00'),(16462,16607,'100.00'),(16869,16609,'100.00'),(16870,16610,'100.00'),(16871,16611,'100.00'),(16872,16612,'100.00'),(16873,16613,'100.00'),(16874,16614,'100.00'),(16875,16615,'100.00'),(16876,16616,'100.00'),(16877,16617,'100.00'),(16880,16619,'100.00'),(16881,16620,'100.00'),(16882,16621,'100.00'),(16883,16622,'100.00'),(16884,16623,'100.00'),(16885,16624,'100.00'),(16886,16625,'100.00'),(16887,16626,'100.00'),(16888,16627,'100.00'),(16891,16629,'100.00'),(16892,16630,'100.00'),(16893,16631,'100.00'),(16894,16632,'100.00'),(16895,16633,'100.00'),(16896,16634,'100.00'),(16897,16635,'100.00'),(16898,16636,'100.00'),(16899,16637,'100.00'),(16902,16639,'100.00'),(16903,16640,'100.00'),(16904,16641,'100.00'),(16905,16642,'100.00'),(16906,16643,'100.00'),(16907,16644,'100.00'),(16908,16645,'100.00'),(16909,16646,'100.00'),(16910,16647,'100.00'),(16913,16649,'100.00'),(16914,16650,'100.00'),(16915,16651,'100.00'),(16916,16652,'100.00'),(16917,16653,'100.00'),(16918,16654,'100.00'),(16919,16655,'100.00'),(16920,16656,'100.00'),(16921,16657,'100.00'),(16924,16659,'100.00'),(16925,16660,'100.00'),(16926,16661,'100.00'),(16927,16662,'100.00'),(16928,16663,'100.00'),(16929,16664,'100.00'),(16930,17069,'100.00'),(16931,17070,'100.00'),(16932,17071,'100.00'),(16935,17073,'100.00'),(16936,17074,'100.00'),(16937,17075,'100.00'),(16938,17076,'100.00'),(16939,17077,'100.00'),(16940,17078,'100.00'),(16941,17079,'100.00'),(16942,17080,'100.00'),(16943,17081,'100.00'),(16946,17083,'100.00'),(16947,17084,'100.00'),(16948,17085,'100.00'),(16949,17086,'100.00'),(16950,17087,'100.00'),(16951,17088,'100.00'),(16952,17089,'100.00'),(16953,17090,'100.00'),(16954,17091,'100.00'),(16957,17093,'100.00'),(16958,17094,'100.00'),(16959,17095,'100.00'),(16960,17096,'100.00'),(16961,17097,'100.00'),(16962,17098,'100.00'),(16963,17099,'100.00'),(16964,17100,'100.00'),(16965,17101,'100.00'),(17372,17103,'100.00'),(17373,17104,'100.00'),(17374,17105,'100.00'),(17375,17106,'100.00'),(17376,17107,'100.00'),(17377,17108,'100.00'),(17378,17109,'100.00'),(17379,17110,'100.00'),(17380,17111,'100.00'),(17383,17113,'100.00'),(17384,17114,'100.00'),(17385,17115,'100.00'),(17386,17116,'100.00'),(17387,17117,'100.00'),(17388,17118,'100.00'),(17389,17119,'100.00'),(17390,17120,'100.00'),(17391,17121,'100.00'),(17394,17123,'100.00'),(17395,17124,'100.00'),(17396,17125,'100.00'),(17397,17126,'100.00'),(17398,17127,'100.00'),(17399,17128,'100.00'),(17400,17129,'100.00'),(17401,17130,'100.00'),(17402,17131,'100.00'),(17405,17133,'100.00'),(17406,17134,'100.00'),(17407,17135,'100.00'),(17408,17136,'100.00'),(17409,17137,'100.00'),(17410,17138,'100.00'),(17411,17139,'100.00'),(17412,17140,'100.00'),(17413,17141,'100.00'),(17416,17143,'100.00'),(17417,17144,'100.00'),(17418,17145,'100.00'),(17419,17146,'100.00'),(17420,17147,'100.00'),(17421,17148,'100.00'),(17422,17149,'100.00'),(17423,17150,'100.00'),(17424,17151,'100.00'),(17429,17158,'100.00'),(17447,18485,'100.00'),(17448,18486,'100.00'),(17449,18487,'100.00'),(17467,18501,'100.00'),(17468,18502,'100.00'),(17469,18503,'100.00');
/*!40000 ALTER TABLE `direct_advance_assignment` ENABLE KEYS */;
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
INSERT INTO `entity_sequence` VALUES (101,51,0,'ORDER',31,5,1),(102,26,1,'CRITERION',7,5,1),(103,18,2,'LABEL',0,5,1),(104,18,3,'MACHINE',1,5,1),(105,19,4,'WORKER',3,5,1),(106,23,5,'UNIT_TYPE',8,5,1),(107,14,6,'CALENDAR',1,5,1),(108,13,7,'WORK_HOURS_TYPE',0,5,1),(109,13,8,'MATERIAL_CATEGORY',1,5,1),(110,11,9,'WORK_REPORT',0,5,1),(111,10,10,'WORKREPORTTYPE',0,5,1),(112,15,11,'CALENDAR_EXCEPTION_TYPE',6,5,1),(113,8,12,'COST_CATEGORY',0,5,1),(114,11,13,'RESOURCE_CALENDAR',4,5,1),(115,6,14,'CRITERION_SATISFACTION',0,5,1),(116,5,15,'RESOURCE_COST_CATEGORY_ASSIGNMENT',0,5,1);
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
INSERT INTO `hibernate_unique_key` VALUES (192);
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
INSERT INTO `hours_group` VALUES (6393,11,'ORDER00016-00001-00001','WORKER',150,'1.00',0,6001,NULL),(5355,3,'ORDER00015-00001-00001','WORKER',500,'1.00',0,4956,NULL),(3436,5,'ORDER00013-00001-00001','WORKER',120,'1.00',0,3036,NULL),(2534,1,'febcb4b4-feba-4814-a2af-e373d490e846','WORKER',120,'1.00',0,NULL,2336),(2535,1,'6c469658-611b-441b-91cd-da1fe64c256f','WORKER',200,'1.00',0,NULL,2337),(2536,1,'5513f62b-e599-41b9-8a7b-67279f0d8f0d','WORKER',300,'1.00',0,NULL,2338),(6394,11,'ORDER00016-00002-00001','WORKER',100,'1.00',0,6002,NULL),(6395,11,'ORDER00016-00003-00001','WORKER',120,'1.00',0,6003,NULL),(6410,7,'ORDER00017-00001-00001','WORKER',120,'1.00',0,6024,NULL),(6411,7,'ORDER00017-00002-00001','WORKER',120,'1.00',0,6025,NULL),(6412,7,'ORDER00017-00003-00001','WORKER',120,'1.00',0,6026,NULL),(6413,7,'ORDER00017-00007-00001','WORKER',180,'1.00',0,6028,NULL),(6414,7,'ORDER00017-00008-00001','WORKER',120,'1.00',0,6029,NULL),(6415,7,'ORDER00017-00005-00001','WORKER',120,'1.00',0,6030,NULL),(6416,7,'ORDER00017-00006-00001','WORKER',90,'1.00',0,6031,NULL),(8791,4,'ORDER00018-00001-00001','WORKER',150,'1.00',0,8391,NULL),(8792,4,'ORDER00018-00002-00001','WORKER',150,'1.00',0,8392,NULL),(10103,5,'ORDER00016-00004-00001','WORKER',120,'1.00',0,9800,NULL),(11825,3,'ORDER00018-00003-00001','WORKER',14,'0.09',0,11519,NULL),(11826,3,'ORDER00018-00003-00002','WORKER',140,'0.90',0,11519,NULL),(12845,3,'ORDER00024-00001-00001','WORKER',100,'1.00',0,12447,NULL),(12846,3,'ORDER00024-00002-00001','WORKER',150,'1.00',0,12448,NULL),(12847,3,'ORDER00024-00003-00001','WORKER',200,'1.00',0,12449,NULL),(12848,3,'ORDER00024-00004-00001','WORKER',300,'1.00',0,12450,NULL),(12849,3,'ORDER00024-00006-00001','WORKER',50,'1.00',0,12452,NULL),(12850,3,'ORDER00024-00007-00001','WORKER',100,'1.00',0,12453,NULL),(12851,3,'ORDER00024-00008-00001','WORKER',150,'1.00',0,12454,NULL),(12852,3,'ORDER00024-00009-00001','WORKER',200,'1.00',0,12455,NULL),(12853,3,'ORDER00024-00010-00001','WORKER',250,'1.00',0,12456,NULL),(13561,1,'77e60ac5-6138-4ce4-bd31-b768c9b2305c','WORKER',100,'1.00',0,NULL,13366),(13562,1,'7010c8fe-d855-466a-89e1-fe41aa86ccc3','WORKER',150,'1.00',0,NULL,13367),(13563,1,'72f43c66-93f7-4ca8-958b-9b9058cb96bc','WORKER',200,'1.00',0,NULL,13368),(13564,1,'de842e2c-4766-4e3e-b4bc-fc11fea49e45','WORKER',300,'1.00',0,NULL,13369),(13565,1,'6ec03e9e-f767-4b79-ba9b-0b60589e3e56','WORKER',50,'1.00',0,NULL,13371),(13566,1,'2bb1019d-59a4-4dff-ae0a-8593db99286e','WORKER',100,'1.00',0,NULL,13372),(13567,1,'67c86232-9f17-433a-ae7e-7a8a9fe35931','WORKER',150,'1.00',0,NULL,13373),(13568,1,'3656adda-a1e8-49b3-a42b-e3be5c643f5c','WORKER',200,'1.00',0,NULL,13374),(13569,1,'2b77393c-ff3e-4f7c-80ed-57cb3173d87e','WORKER',250,'1.00',0,NULL,13375),(13597,2,'ORDER00026-00002-00001','WORKER',50,'1.00',0,13671,NULL),(13598,2,'ORDER00026-00003-00001','WORKER',100,'1.00',0,13672,NULL),(13599,2,'ORDER00026-00004-00001','WORKER',150,'1.00',0,13673,NULL),(13600,2,'ORDER00026-00005-00001','WORKER',200,'1.00',0,13674,NULL),(13601,2,'ORDER00026-00006-00001','WORKER',250,'1.00',0,13675,NULL),(13602,2,'ORDER00026-00007-00001','WORKER',100,'1.00',0,13676,NULL),(13603,2,'ORDER00026-00008-00001','WORKER',150,'1.00',0,13677,NULL),(13604,2,'ORDER00026-00009-00001','WORKER',200,'1.00',0,13678,NULL),(13605,2,'ORDER00026-00010-00001','WORKER',300,'1.00',0,13679,NULL),(13633,1,'dea1f121-f826-43ba-a257-3b19a416df38','WORKER',50,'1.00',0,NULL,13407),(13634,1,'85d2da60-3fbb-4392-837e-e93480da16c3','WORKER',100,'1.00',0,NULL,13408),(14342,1,'07b5f867-6453-4161-bc24-01aa8cb8216d','WORKER',150,'1.00',0,NULL,13409),(14343,1,'5b9996b4-878c-4f79-8505-182473790343','WORKER',200,'1.00',0,NULL,13410),(14344,1,'1f228ca3-ee66-4d22-bfe4-1ae91ac21002','WORKER',250,'1.00',0,NULL,13411),(14345,1,'860273f4-38bd-42f9-ad0c-df6815c3deae','WORKER',100,'1.00',0,NULL,13412),(14346,1,'3bc68878-64e5-4c7b-b5b7-ea9212e154db','WORKER',150,'1.00',0,NULL,13413),(14347,1,'eb7fecce-3a2c-4b7a-807a-b0f885ce4120','WORKER',200,'1.00',0,NULL,13414),(14348,1,'5ce4d2f0-8741-44da-8e82-244d58f6c7f2','WORKER',300,'1.00',0,NULL,13415),(16049,7,'ORDER00027-00001-00001','WORKER',100,'1.00',0,16134,NULL),(16050,7,'ORDER00027-00002-00001','WORKER',150,'1.00',0,16135,NULL),(16051,7,'ORDER00027-00003-00001','WORKER',200,'1.00',0,16136,NULL),(16052,7,'ORDER00027-00004-00001','WORKER',300,'1.00',0,16137,NULL),(16053,7,'ORDER00027-00026-00001','WORKER',50,'1.00',0,16139,NULL),(16054,7,'ORDER00027-00027-00001','WORKER',100,'1.00',0,16140,NULL),(16055,7,'ORDER00027-00028-00001','WORKER',150,'1.00',0,16141,NULL),(16056,7,'ORDER00027-00029-00001','WORKER',200,'1.00',0,16142,NULL),(16057,7,'ORDER00027-00030-00001','WORKER',250,'1.00',0,16143,NULL),(16058,7,'ORDER00027-00031-00001','WORKER',50,'1.00',0,16145,NULL),(16463,7,'ORDER00027-00032-00001','WORKER',100,'1.00',0,16146,NULL),(16464,7,'ORDER00027-00033-00001','WORKER',150,'1.00',0,16147,NULL),(16465,7,'ORDER00027-00034-00001','WORKER',200,'1.00',0,16148,NULL),(16466,7,'ORDER00027-00035-00001','WORKER',250,'1.00',0,16149,NULL),(16467,7,'ORDER00027-00036-00001','WORKER',100,'1.00',0,16150,NULL),(16468,7,'ORDER00027-00037-00001','WORKER',150,'1.00',0,16151,NULL),(16469,7,'ORDER00027-00038-00001','WORKER',200,'1.00',0,16152,NULL),(16470,7,'ORDER00027-00039-00001','WORKER',300,'1.00',0,16153,NULL),(16471,7,'ORDER00027-00040-00001','WORKER',50,'1.00',0,16155,NULL),(16472,7,'ORDER00027-00041-00001','WORKER',100,'1.00',0,16156,NULL),(16473,7,'ORDER00027-00042-00001','WORKER',150,'1.00',0,16157,NULL),(16474,7,'ORDER00027-00043-00001','WORKER',200,'1.00',0,16158,NULL),(16475,7,'ORDER00027-00044-00001','WORKER',250,'1.00',0,16159,NULL),(16476,7,'ORDER00027-00045-00001','WORKER',100,'1.00',0,16564,NULL),(16477,7,'ORDER00027-00046-00001','WORKER',150,'1.00',0,16565,NULL),(16478,7,'ORDER00027-00047-00001','WORKER',200,'1.00',0,16566,NULL),(16479,7,'ORDER00027-00048-00001','WORKER',300,'1.00',0,16567,NULL),(16480,7,'ORDER00027-00049-00001','WORKER',50,'1.00',0,16569,NULL),(16481,7,'ORDER00027-00050-00001','WORKER',100,'1.00',0,16570,NULL),(16482,7,'ORDER00027-00051-00001','WORKER',150,'1.00',0,16571,NULL),(16483,7,'ORDER00027-00052-00001','WORKER',200,'1.00',0,16572,NULL),(16484,7,'ORDER00027-00053-00001','WORKER',250,'1.00',0,16573,NULL),(16485,7,'ORDER00027-00054-00001','WORKER',100,'1.00',0,16574,NULL),(16486,7,'ORDER00027-00055-00001','WORKER',150,'1.00',0,16575,NULL),(16487,7,'ORDER00027-00056-00001','WORKER',200,'1.00',0,16576,NULL),(16488,7,'ORDER00027-00057-00001','WORKER',300,'1.00',0,16577,NULL),(16489,7,'ORDER00027-00058-00001','WORKER',50,'1.00',0,16579,NULL),(16490,7,'ORDER00027-00059-00001','WORKER',100,'1.00',0,16580,NULL),(16491,7,'ORDER00027-00060-00001','WORKER',150,'1.00',0,16581,NULL),(16492,7,'ORDER00027-00061-00001','WORKER',200,'1.00',0,16582,NULL),(16493,7,'ORDER00027-00062-00001','WORKER',250,'1.00',0,16583,NULL),(16494,7,'ORDER00027-00063-00001','WORKER',100,'1.00',0,16584,NULL),(16495,7,'ORDER00027-00064-00001','WORKER',150,'1.00',0,16585,NULL),(16496,7,'ORDER00027-00065-00001','WORKER',200,'1.00',0,16586,NULL),(16497,7,'ORDER00027-00066-00001','WORKER',300,'1.00',0,16587,NULL),(16498,7,'ORDER00027-00067-00001','WORKER',50,'1.00',0,16589,NULL),(16499,7,'ORDER00027-00068-00001','WORKER',100,'1.00',0,16590,NULL),(16500,7,'ORDER00027-00069-00001','WORKER',150,'1.00',0,16591,NULL),(16501,7,'ORDER00027-00070-00001','WORKER',200,'1.00',0,16592,NULL),(16502,7,'ORDER00027-00071-00001','WORKER',250,'1.00',0,16593,NULL),(16503,7,'ORDER00027-00072-00001','WORKER',100,'1.00',0,16594,NULL),(16504,7,'ORDER00027-00073-00001','WORKER',150,'1.00',0,16595,NULL),(16505,7,'ORDER00027-00074-00001','WORKER',200,'1.00',0,16596,NULL),(16506,7,'ORDER00027-00075-00001','WORKER',300,'1.00',0,16597,NULL),(16507,7,'ORDER00027-00076-00001','WORKER',50,'1.00',0,16599,NULL),(16508,7,'ORDER00027-00077-00001','WORKER',100,'1.00',0,16600,NULL),(16509,7,'ORDER00027-00078-00001','WORKER',150,'1.00',0,16601,NULL),(16510,7,'ORDER00027-00079-00001','WORKER',200,'1.00',0,16602,NULL),(16511,7,'ORDER00027-00080-00001','WORKER',250,'1.00',0,16603,NULL),(16512,7,'ORDER00027-00081-00001','WORKER',100,'1.00',0,16604,NULL),(16513,7,'ORDER00027-00082-00001','WORKER',150,'1.00',0,16605,NULL),(16514,7,'ORDER00027-00083-00001','WORKER',200,'1.00',0,16606,NULL),(16515,7,'ORDER00027-00084-00001','WORKER',300,'1.00',0,16607,NULL),(16516,7,'ORDER00027-00085-00001','WORKER',50,'1.00',0,16609,NULL),(16517,7,'ORDER00027-00086-00001','WORKER',100,'1.00',0,16610,NULL),(16518,7,'ORDER00027-00087-00001','WORKER',150,'1.00',0,16611,NULL),(16519,7,'ORDER00027-00088-00001','WORKER',200,'1.00',0,16612,NULL),(16520,7,'ORDER00027-00089-00001','WORKER',250,'1.00',0,16613,NULL),(16521,7,'ORDER00027-00090-00001','WORKER',100,'1.00',0,16614,NULL),(16522,7,'ORDER00027-00091-00001','WORKER',150,'1.00',0,16615,NULL),(16523,7,'ORDER00027-00092-00001','WORKER',200,'1.00',0,16616,NULL),(16524,7,'ORDER00027-00093-00001','WORKER',300,'1.00',0,16617,NULL),(16525,7,'ORDER00027-00094-00001','WORKER',50,'1.00',0,16619,NULL),(16526,7,'ORDER00027-00095-00001','WORKER',100,'1.00',0,16620,NULL),(16527,7,'ORDER00027-00096-00001','WORKER',150,'1.00',0,16621,NULL),(16528,7,'ORDER00027-00097-00001','WORKER',200,'1.00',0,16622,NULL),(16529,7,'ORDER00027-00098-00001','WORKER',250,'1.00',0,16623,NULL),(16530,7,'ORDER00027-00099-00001','WORKER',100,'1.00',0,16624,NULL),(16531,7,'ORDER00027-00100-00001','WORKER',150,'1.00',0,16625,NULL),(16532,7,'ORDER00027-00101-00001','WORKER',200,'1.00',0,16626,NULL),(16533,7,'ORDER00027-00102-00001','WORKER',300,'1.00',0,16627,NULL),(16534,7,'ORDER00027-00103-00001','WORKER',50,'1.00',0,16629,NULL),(16535,7,'ORDER00027-00104-00001','WORKER',100,'1.00',0,16630,NULL),(16536,7,'ORDER00027-00105-00001','WORKER',150,'1.00',0,16631,NULL),(16537,7,'ORDER00027-00106-00001','WORKER',200,'1.00',0,16632,NULL),(16538,7,'ORDER00027-00107-00001','WORKER',250,'1.00',0,16633,NULL),(16539,7,'ORDER00027-00108-00001','WORKER',100,'1.00',0,16634,NULL),(16540,7,'ORDER00027-00109-00001','WORKER',150,'1.00',0,16635,NULL),(16541,7,'ORDER00027-00110-00001','WORKER',200,'1.00',0,16636,NULL),(16542,7,'ORDER00027-00111-00001','WORKER',300,'1.00',0,16637,NULL),(16543,7,'ORDER00027-00112-00001','WORKER',50,'1.00',0,16639,NULL),(16544,7,'ORDER00027-00113-00001','WORKER',100,'1.00',0,16640,NULL),(16545,7,'ORDER00027-00114-00001','WORKER',150,'1.00',0,16641,NULL),(16546,7,'ORDER00027-00115-00001','WORKER',200,'1.00',0,16642,NULL),(16547,7,'ORDER00027-00116-00001','WORKER',250,'1.00',0,16643,NULL),(16548,7,'ORDER00027-00117-00001','WORKER',100,'1.00',0,16644,NULL),(16549,7,'ORDER00027-00118-00001','WORKER',150,'1.00',0,16645,NULL),(16550,7,'ORDER00027-00119-00001','WORKER',200,'1.00',0,16646,NULL),(16551,7,'ORDER00027-00120-00001','WORKER',300,'1.00',0,16647,NULL),(16552,7,'ORDER00027-00121-00001','WORKER',50,'1.00',0,16649,NULL),(16553,7,'ORDER00027-00122-00001','WORKER',100,'1.00',0,16650,NULL),(16554,7,'ORDER00027-00123-00001','WORKER',150,'1.00',0,16651,NULL),(16555,7,'ORDER00027-00124-00001','WORKER',200,'1.00',0,16652,NULL),(16556,7,'ORDER00027-00125-00001','WORKER',250,'1.00',0,16653,NULL),(16557,7,'ORDER00027-00126-00001','WORKER',100,'1.00',0,16654,NULL),(16558,7,'ORDER00027-00127-00001','WORKER',150,'1.00',0,16655,NULL),(16559,7,'ORDER00027-00128-00001','WORKER',200,'1.00',0,16656,NULL),(16560,7,'ORDER00027-00129-00001','WORKER',300,'1.00',0,16657,NULL),(16561,7,'ORDER00027-00130-00001','WORKER',50,'1.00',0,16659,NULL),(16562,7,'ORDER00027-00131-00001','WORKER',100,'1.00',0,16660,NULL),(16563,7,'ORDER00027-00132-00001','WORKER',150,'1.00',0,16661,NULL),(16968,7,'ORDER00027-00133-00001','WORKER',200,'1.00',0,16662,NULL),(16969,7,'ORDER00027-00134-00001','WORKER',250,'1.00',0,16663,NULL),(16970,7,'ORDER00027-00135-00001','WORKER',100,'1.00',0,16664,NULL),(16971,7,'ORDER00027-00136-00001','WORKER',150,'1.00',0,17069,NULL),(16972,7,'ORDER00027-00137-00001','WORKER',200,'1.00',0,17070,NULL),(16973,7,'ORDER00027-00138-00001','WORKER',300,'1.00',0,17071,NULL),(16974,7,'ORDER00027-00139-00001','WORKER',50,'1.00',0,17073,NULL),(16975,7,'ORDER00027-00140-00001','WORKER',100,'1.00',0,17074,NULL),(16976,7,'ORDER00027-00141-00001','WORKER',150,'1.00',0,17075,NULL),(16977,7,'ORDER00027-00142-00001','WORKER',200,'1.00',0,17076,NULL),(16978,7,'ORDER00027-00143-00001','WORKER',250,'1.00',0,17077,NULL),(16979,7,'ORDER00027-00144-00001','WORKER',100,'1.00',0,17078,NULL),(16980,7,'ORDER00027-00145-00001','WORKER',150,'1.00',0,17079,NULL),(16981,7,'ORDER00027-00146-00001','WORKER',200,'1.00',0,17080,NULL),(16982,7,'ORDER00027-00147-00001','WORKER',300,'1.00',0,17081,NULL),(16983,7,'ORDER00027-00148-00001','WORKER',50,'1.00',0,17083,NULL),(16984,7,'ORDER00027-00149-00001','WORKER',100,'1.00',0,17084,NULL),(16985,7,'ORDER00027-00150-00001','WORKER',150,'1.00',0,17085,NULL),(16986,7,'ORDER00027-00151-00001','WORKER',200,'1.00',0,17086,NULL),(16987,7,'ORDER00027-00152-00001','WORKER',250,'1.00',0,17087,NULL),(16988,7,'ORDER00027-00153-00001','WORKER',100,'1.00',0,17088,NULL),(16989,7,'ORDER00027-00154-00001','WORKER',150,'1.00',0,17089,NULL),(16990,7,'ORDER00027-00155-00001','WORKER',200,'1.00',0,17090,NULL),(16991,7,'ORDER00027-00156-00001','WORKER',300,'1.00',0,17091,NULL),(16992,7,'ORDER00027-00157-00001','WORKER',50,'1.00',0,17093,NULL),(16993,7,'ORDER00027-00158-00001','WORKER',100,'1.00',0,17094,NULL),(16994,7,'ORDER00027-00159-00001','WORKER',150,'1.00',0,17095,NULL),(16995,7,'ORDER00027-00160-00001','WORKER',200,'1.00',0,17096,NULL),(16996,7,'ORDER00027-00161-00001','WORKER',250,'1.00',0,17097,NULL),(16997,7,'ORDER00027-00162-00001','WORKER',100,'1.00',0,17098,NULL),(16998,7,'ORDER00027-00163-00001','WORKER',150,'1.00',0,17099,NULL),(16999,7,'ORDER00027-00164-00001','WORKER',200,'1.00',0,17100,NULL),(17000,7,'ORDER00027-00165-00001','WORKER',300,'1.00',0,17101,NULL),(17001,7,'ORDER00027-00166-00001','WORKER',50,'1.00',0,17103,NULL),(17002,7,'ORDER00027-00167-00001','WORKER',100,'1.00',0,17104,NULL),(17003,7,'ORDER00027-00168-00001','WORKER',150,'1.00',0,17105,NULL),(17004,7,'ORDER00027-00169-00001','WORKER',200,'1.00',0,17106,NULL),(17005,7,'ORDER00027-00170-00001','WORKER',250,'1.00',0,17107,NULL),(17006,7,'ORDER00027-00171-00001','WORKER',100,'1.00',0,17108,NULL),(17007,7,'ORDER00027-00172-00001','WORKER',150,'1.00',0,17109,NULL),(17008,7,'ORDER00027-00173-00001','WORKER',200,'1.00',0,17110,NULL),(17009,7,'ORDER00027-00174-00001','WORKER',300,'1.00',0,17111,NULL),(17010,7,'ORDER00027-00175-00001','WORKER',50,'1.00',0,17113,NULL),(17011,7,'ORDER00027-00176-00001','WORKER',100,'1.00',0,17114,NULL),(17012,7,'ORDER00027-00177-00001','WORKER',150,'1.00',0,17115,NULL),(17013,7,'ORDER00027-00178-00001','WORKER',200,'1.00',0,17116,NULL),(17014,7,'ORDER00027-00179-00001','WORKER',250,'1.00',0,17117,NULL),(17015,7,'ORDER00027-00180-00001','WORKER',100,'1.00',0,17118,NULL),(17016,7,'ORDER00027-00181-00001','WORKER',150,'1.00',0,17119,NULL),(17017,7,'ORDER00027-00182-00001','WORKER',200,'1.00',0,17120,NULL),(17018,7,'ORDER00027-00183-00001','WORKER',300,'1.00',0,17121,NULL),(17019,7,'ORDER00027-00184-00001','WORKER',50,'1.00',0,17123,NULL),(17020,7,'ORDER00027-00185-00001','WORKER',100,'1.00',0,17124,NULL),(17021,7,'ORDER00027-00186-00001','WORKER',150,'1.00',0,17125,NULL),(17022,7,'ORDER00027-00187-00001','WORKER',200,'1.00',0,17126,NULL),(17023,7,'ORDER00027-00188-00001','WORKER',250,'1.00',0,17127,NULL),(17024,7,'ORDER00027-00189-00001','WORKER',100,'1.00',0,17128,NULL),(17025,7,'ORDER00027-00190-00001','WORKER',150,'1.00',0,17129,NULL),(17026,7,'ORDER00027-00191-00001','WORKER',200,'1.00',0,17130,NULL),(17027,7,'ORDER00027-00192-00001','WORKER',300,'1.00',0,17131,NULL),(17028,7,'ORDER00027-00193-00001','WORKER',50,'1.00',0,17133,NULL),(17029,7,'ORDER00027-00194-00001','WORKER',100,'1.00',0,17134,NULL),(17030,7,'ORDER00027-00195-00001','WORKER',150,'1.00',0,17135,NULL),(17031,7,'ORDER00027-00196-00001','WORKER',200,'1.00',0,17136,NULL),(17032,7,'ORDER00027-00197-00001','WORKER',250,'1.00',0,17137,NULL),(17033,7,'ORDER00027-00198-00001','WORKER',100,'1.00',0,17138,NULL),(17034,7,'ORDER00027-00199-00001','WORKER',150,'1.00',0,17139,NULL),(17035,7,'ORDER00027-00200-00001','WORKER',200,'1.00',0,17140,NULL),(17036,7,'ORDER00027-00201-00001','WORKER',300,'1.00',0,17141,NULL),(17037,7,'ORDER00027-00202-00001','WORKER',50,'1.00',0,17143,NULL),(17038,7,'ORDER00027-00203-00001','WORKER',100,'1.00',0,17144,NULL),(17039,7,'ORDER00027-00204-00001','WORKER',150,'1.00',0,17145,NULL),(17040,7,'ORDER00027-00205-00001','WORKER',200,'1.00',0,17146,NULL),(17041,7,'ORDER00027-00206-00001','WORKER',250,'1.00',0,17147,NULL),(17042,7,'ORDER00027-00207-00001','WORKER',100,'1.00',0,17148,NULL),(17043,7,'ORDER00027-00208-00001','WORKER',150,'1.00',0,17149,NULL),(17044,7,'ORDER00027-00209-00001','WORKER',200,'1.00',0,17150,NULL),(17045,7,'ORDER00027-00210-00001','WORKER',300,'1.00',0,17151,NULL),(17048,2,'ORDER00028-00001-00001','WORKER',100,'1.00',0,17158,NULL),(17058,2,'ORDER00029-00001-00001','WORKER',120,'1.00',0,18485,NULL),(17059,2,'ORDER00029-00002-00001','WORKER',200,'1.00',0,18486,NULL),(17060,2,'ORDER00029-00003-00001','WORKER',300,'1.00',0,18487,NULL),(18787,2,'ORDER00030-00001-00001','WORKER',120,'1.00',0,18501,NULL),(18788,2,'ORDER00030-00002-00001','WORKER',200,'1.00',0,18502,NULL),(18789,2,'ORDER00030-00003-00001','WORKER',300,'1.00',0,18503,NULL);
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
INSERT INTO `indirect_advance_assignment` VALUES (3537,3035),(3536,3035),(5455,4955),(5456,4955),(6507,6000),(6508,6000),(6514,6027),(6515,6027),(6518,6023),(6519,6023),(8890,8390),(8891,8390),(12937,12451),(12938,12451),(12939,12446),(12940,12446),(14087,13670),(14088,13670),(14089,13669),(14090,13669),(16397,16138),(16398,16138),(16408,16144),(16409,16144),(16419,16154),(16420,16154),(16430,16568),(16431,16568),(16441,16578),(16442,16578),(16452,16588),(16453,16588),(16867,16598),(16868,16598),(16878,16608),(16879,16608),(16889,16618),(16890,16618),(16900,16628),(16901,16628),(16911,16638),(16912,16638),(16922,16648),(16923,16648),(16933,16658),(16934,16658),(16944,17072),(16945,17072),(16955,17082),(16956,17082),(16966,17092),(16967,17092),(17381,17102),(17382,17102),(17392,17112),(17393,17112),(17403,17122),(17404,17122),(17414,17132),(17415,17132),(17425,17142),(17426,17142),(17427,16133),(17428,16133),(17430,17157),(17431,17157),(17450,18484),(17451,18484),(17470,18500),(17471,18500);
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
INSERT INTO `limiting_resource_queue` VALUES (4242,1,3839),(7474,1,7073);
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
INSERT INTO `limiting_resource_queue_dependency` VALUES (7777,2,7687,7692),(7778,1,7688,7687),(7779,0,7688,7691),(7780,1,7689,7690),(7781,1,7689,7692),(7782,1,7691,7692),(7783,2,7687,7693),(7784,1,7688,7693),(7785,1,7689,7687);
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
INSERT INTO `limiting_resource_queue_element` VALUES (4446,2,4345,4242,'2011-01-05 14:12:04','2011-01-05 14:12:04',1294400224072,'2011-01-05',0,'2011-08-05',8),(5858,3,5757,4242,'2011-01-07 13:04:41','2011-01-07 13:04:41',1294401945480,'2011-08-05',8,'2011-11-02',4),(7687,5,7586,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294831032569,NULL,0,NULL,0),(7688,6,7587,7474,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294830949915,'2011-10-12',0,'2011-11-01',8),(7689,5,7588,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294830990762,NULL,0,NULL,0),(7690,5,7589,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294831011752,NULL,0,NULL,0),(7691,5,7590,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294830966863,NULL,0,NULL,0),(7692,5,7591,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294830976695,NULL,0,NULL,0),(7693,4,7592,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00',1294831083695,NULL,0,NULL,0);
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
INSERT INTO `machine` VALUES (7073,'Impresora3','123123');
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
INSERT INTO `order_authorization` VALUES (3737,'user',2,'WRITE_AUTHORIZATION',3035,1213,NULL),(5656,'user',1,'WRITE_AUTHORIZATION',4955,1213,NULL),(6666,'user',4,'WRITE_AUTHORIZATION',6000,1213,NULL),(6667,'user',1,'WRITE_AUTHORIZATION',6023,1213,NULL),(9090,'user',3,'WRITE_AUTHORIZATION',8390,1213,NULL),(13130,'user',1,'WRITE_AUTHORIZATION',12446,1213,NULL),(14241,'user',1,'WRITE_AUTHORIZATION',13669,1213,NULL),(14242,'user',1,'WRITE_AUTHORIZATION',16133,1213,NULL),(14243,'user',1,'WRITE_AUTHORIZATION',17157,1213,NULL),(14244,'user',1,'WRITE_AUTHORIZATION',18484,1213,NULL),(14245,'user',1,'WRITE_AUTHORIZATION',18500,1213,NULL);
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
INSERT INTO `order_element` VALUES (4955,3,'other',NULL,'ORDER00015','2011-01-07 13:04:41',NULL,'0.00',0,NULL,NULL,NULL,5056,NULL),(3036,5,'Elem',NULL,'ORDER00013-00001',NULL,NULL,'0.00',0,3035,NULL,NULL,3137,0),(4956,3,'other',NULL,'ORDER00015-00001',NULL,NULL,'0.00',0,4955,NULL,NULL,5057,0),(6000,12,'Dependencies',NULL,'ORDER00016','2011-01-01 00:00:00','2011-01-22 00:00:00','0.00',0,NULL,NULL,NULL,6101,NULL),(3035,5,'elem',NULL,'ORDER00013','2011-01-05 14:12:04','2011-01-20 00:00:00','0.00',0,NULL,NULL,NULL,3136,NULL),(6001,11,'Task1',NULL,'ORDER00016-00001',NULL,NULL,'0.00',0,6000,NULL,NULL,6102,0),(6002,11,'Task2',NULL,'ORDER00016-00002',NULL,NULL,'0.00',0,6000,NULL,NULL,6103,1),(6003,11,'Task3',NULL,'ORDER00016-00003',NULL,NULL,'0.00',0,6000,NULL,NULL,6104,2),(6023,7,'Limiting',NULL,'ORDER00017','2011-10-12 00:00:00','2011-11-10 00:00:00','0.00',0,NULL,NULL,NULL,6124,NULL),(6024,7,'Elem1',NULL,'ORDER00017-00001',NULL,NULL,'0.00',0,6023,NULL,NULL,6125,0),(6025,7,'Elem2',NULL,'ORDER00017-00002',NULL,NULL,'0.00',0,6023,NULL,NULL,6126,1),(6026,7,'Elem3',NULL,'ORDER00017-00003',NULL,NULL,'0.00',0,6023,NULL,NULL,6127,2),(6027,7,'Elem4',NULL,'ORDER00017-00004',NULL,NULL,'0.00',0,6023,NULL,NULL,6128,3),(6028,7,'Elem5',NULL,'ORDER00017-00007',NULL,NULL,'0.00',0,6027,NULL,NULL,6129,0),(6029,7,'Elem6',NULL,'ORDER00017-00008',NULL,NULL,'0.00',0,6027,NULL,NULL,6130,1),(6030,7,'Elem7',NULL,'ORDER00017-00005',NULL,NULL,'0.00',0,6023,NULL,NULL,6131,4),(6031,7,'Elem8',NULL,'ORDER00017-00006',NULL,NULL,'0.00',0,6023,NULL,NULL,6132,5),(8390,5,'Simple project',NULL,'ORDER00018','2011-01-12 17:25:55','2011-01-21 00:00:00','0.00',0,NULL,NULL,NULL,8491,NULL),(8391,4,'Previous',NULL,'ORDER00018-00001',NULL,NULL,'0.00',0,8390,NULL,NULL,8492,0),(8392,4,'Next',NULL,'ORDER00018-00002',NULL,NULL,'0.00',0,8390,NULL,NULL,8493,1),(9800,5,'Elemento',NULL,'ORDER00016-00004',NULL,NULL,'0.00',0,6000,NULL,NULL,9901,3),(11519,3,'Requirements',NULL,'ORDER00018-00003',NULL,NULL,'0.00',0,8390,NULL,NULL,11620,2),(12446,3,'Long project',NULL,'ORDER00024','2010-09-15 00:00:00','2012-01-01 00:00:00','0.00',0,NULL,NULL,NULL,12547,NULL),(12447,3,'Task 1',NULL,'ORDER00024-00001',NULL,NULL,'0.00',0,12446,NULL,NULL,12548,0),(12448,3,'Task 2',NULL,'ORDER00024-00002',NULL,NULL,'0.00',0,12446,NULL,NULL,12549,1),(12449,3,'Task 3',NULL,'ORDER00024-00003',NULL,NULL,'0.00',0,12446,NULL,NULL,12550,2),(12450,3,'Task 4',NULL,'ORDER00024-00004',NULL,NULL,'0.00',0,12446,NULL,NULL,12551,3),(12451,3,'Task 5',NULL,'ORDER00024-00005',NULL,NULL,'0.00',0,12446,NULL,NULL,12552,4),(12452,3,'Task 5.1',NULL,'ORDER00024-00006',NULL,NULL,'0.00',0,12451,NULL,NULL,12553,0),(12453,3,'Task 5.2',NULL,'ORDER00024-00007',NULL,NULL,'0.00',0,12451,NULL,NULL,12554,1),(12454,3,'Task 5.3',NULL,'ORDER00024-00008',NULL,NULL,'0.00',0,12451,NULL,NULL,12555,2),(12455,3,'Task 5.4',NULL,'ORDER00024-00009',NULL,NULL,'0.00',0,12451,NULL,NULL,12556,3),(12456,3,'Task 5.5',NULL,'ORDER00024-00010',NULL,NULL,'0.00',0,12451,NULL,NULL,12557,4),(13669,2,'Long project',NULL,'ORDER00026','2011-01-21 16:30:32','2012-05-08 00:00:00','0.00',0,NULL,13365,NULL,13770,NULL),(13670,2,'Task 5',NULL,'ORDER00026-00001',NULL,NULL,'0.00',0,13669,13370,NULL,13771,0),(13671,2,'Task 5.1',NULL,'ORDER00026-00002',NULL,NULL,'0.00',0,13670,13371,NULL,13772,0),(13672,2,'Task 5.2',NULL,'ORDER00026-00003',NULL,NULL,'0.00',0,13670,13372,NULL,13773,1),(13673,2,'Task 5.3',NULL,'ORDER00026-00004',NULL,NULL,'0.00',0,13670,13373,NULL,13774,2),(13674,2,'Task 5.4',NULL,'ORDER00026-00005',NULL,NULL,'0.00',0,13670,13374,NULL,13775,3),(13675,2,'Task 5.5',NULL,'ORDER00026-00006',NULL,NULL,'0.00',0,13670,13375,NULL,13776,4),(13676,2,'Task 5.6',NULL,'ORDER00026-00007',NULL,NULL,'0.00',0,13670,13366,NULL,13777,5),(13677,2,'Task 5.7',NULL,'ORDER00026-00008',NULL,NULL,'0.00',0,13670,13367,NULL,13778,6),(13678,2,'Task 5.8',NULL,'ORDER00026-00009',NULL,NULL,'0.00',0,13670,13368,NULL,13779,7),(13679,2,'Task 5.9',NULL,'ORDER00026-00010',NULL,NULL,'0.00',0,13670,13369,NULL,13780,8),(16133,7,'Long project',NULL,'ORDER00027','2011-01-21 16:32:26','2012-05-08 00:00:00','0.00',0,NULL,13365,NULL,16234,NULL),(16134,7,'Task 1',NULL,'ORDER00027-00001',NULL,NULL,'0.00',0,16133,13366,NULL,16235,0),(16135,7,'Task 2',NULL,'ORDER00027-00002',NULL,NULL,'0.00',0,16133,13367,NULL,16236,1),(16136,7,'Task 3',NULL,'ORDER00027-00003',NULL,NULL,'0.00',0,16133,13368,NULL,16237,2),(16137,7,'Task 4',NULL,'ORDER00027-00004',NULL,NULL,'0.00',0,16133,13369,NULL,16238,3),(16138,7,'Task 5',NULL,'ORDER00027-00005',NULL,NULL,'0.00',0,16133,13370,NULL,16239,4),(16139,7,'Task 5.1',NULL,'ORDER00027-00026',NULL,NULL,'0.00',0,16138,13371,NULL,16240,0),(16140,7,'Task 5.2',NULL,'ORDER00027-00027',NULL,NULL,'0.00',0,16138,13372,NULL,16241,1),(16141,7,'Task 5.3',NULL,'ORDER00027-00028',NULL,NULL,'0.00',0,16138,13373,NULL,16242,2),(16142,7,'Task 5.4',NULL,'ORDER00027-00029',NULL,NULL,'0.00',0,16138,13374,NULL,16243,3),(16143,7,'Task 5.5',NULL,'ORDER00027-00030',NULL,NULL,'0.00',0,16138,13375,NULL,16244,4),(16144,7,'Task 5',NULL,'ORDER00027-00006',NULL,NULL,'0.00',0,16133,13406,NULL,16245,5),(16145,7,'Task 5.1',NULL,'ORDER00027-00031',NULL,NULL,'0.00',0,16144,13407,NULL,16246,0),(16146,7,'Task 5.2',NULL,'ORDER00027-00032',NULL,NULL,'0.00',0,16144,13408,NULL,16247,1),(16147,7,'Task 5.3',NULL,'ORDER00027-00033',NULL,NULL,'0.00',0,16144,13409,NULL,16248,2),(16148,7,'Task 5.4',NULL,'ORDER00027-00034',NULL,NULL,'0.00',0,16144,13410,NULL,16249,3),(16149,7,'Task 5.5',NULL,'ORDER00027-00035',NULL,NULL,'0.00',0,16144,13411,NULL,16250,4),(16150,7,'Task 5.6',NULL,'ORDER00027-00036',NULL,NULL,'0.00',0,16144,13412,NULL,16251,5),(16151,7,'Task 5.7',NULL,'ORDER00027-00037',NULL,NULL,'0.00',0,16144,13413,NULL,16252,6),(16152,7,'Task 5.8',NULL,'ORDER00027-00038',NULL,NULL,'0.00',0,16144,13414,NULL,16253,7),(16153,7,'Task 5.9',NULL,'ORDER00027-00039',NULL,NULL,'0.00',0,16144,13415,NULL,16254,8),(16154,7,'Task 5',NULL,'ORDER00027-00007',NULL,NULL,'0.00',0,16133,13406,NULL,16255,6),(16155,7,'Task 5.1',NULL,'ORDER00027-00040',NULL,NULL,'0.00',0,16154,13407,NULL,16256,0),(16156,7,'Task 5.2',NULL,'ORDER00027-00041',NULL,NULL,'0.00',0,16154,13408,NULL,16257,1),(16157,7,'Task 5.3',NULL,'ORDER00027-00042',NULL,NULL,'0.00',0,16154,13409,NULL,16258,2),(16158,7,'Task 5.4',NULL,'ORDER00027-00043',NULL,NULL,'0.00',0,16154,13410,NULL,16259,3),(16159,7,'Task 5.5',NULL,'ORDER00027-00044',NULL,NULL,'0.00',0,16154,13411,NULL,16260,4),(16564,7,'Task 5.6',NULL,'ORDER00027-00045',NULL,NULL,'0.00',0,16154,13412,NULL,16665,5),(16565,7,'Task 5.7',NULL,'ORDER00027-00046',NULL,NULL,'0.00',0,16154,13413,NULL,16666,6),(16566,7,'Task 5.8',NULL,'ORDER00027-00047',NULL,NULL,'0.00',0,16154,13414,NULL,16667,7),(16567,7,'Task 5.9',NULL,'ORDER00027-00048',NULL,NULL,'0.00',0,16154,13415,NULL,16668,8),(16568,7,'Task 5',NULL,'ORDER00027-00008',NULL,NULL,'0.00',0,16133,13406,NULL,16669,7),(16569,7,'Task 5.1',NULL,'ORDER00027-00049',NULL,NULL,'0.00',0,16568,13407,NULL,16670,0),(16570,7,'Task 5.2',NULL,'ORDER00027-00050',NULL,NULL,'0.00',0,16568,13408,NULL,16671,1),(16571,7,'Task 5.3',NULL,'ORDER00027-00051',NULL,NULL,'0.00',0,16568,13409,NULL,16672,2),(16572,7,'Task 5.4',NULL,'ORDER00027-00052',NULL,NULL,'0.00',0,16568,13410,NULL,16673,3),(16573,7,'Task 5.5',NULL,'ORDER00027-00053',NULL,NULL,'0.00',0,16568,13411,NULL,16674,4),(16574,7,'Task 5.6',NULL,'ORDER00027-00054',NULL,NULL,'0.00',0,16568,13412,NULL,16675,5),(16575,7,'Task 5.7',NULL,'ORDER00027-00055',NULL,NULL,'0.00',0,16568,13413,NULL,16676,6),(16576,7,'Task 5.8',NULL,'ORDER00027-00056',NULL,NULL,'0.00',0,16568,13414,NULL,16677,7),(16577,7,'Task 5.9',NULL,'ORDER00027-00057',NULL,NULL,'0.00',0,16568,13415,NULL,16678,8),(16578,7,'Task 5',NULL,'ORDER00027-00009',NULL,NULL,'0.00',0,16133,13406,NULL,16679,8),(16579,7,'Task 5.1',NULL,'ORDER00027-00058',NULL,NULL,'0.00',0,16578,13407,NULL,16680,0),(16580,7,'Task 5.2',NULL,'ORDER00027-00059',NULL,NULL,'0.00',0,16578,13408,NULL,16681,1),(16581,7,'Task 5.3',NULL,'ORDER00027-00060',NULL,NULL,'0.00',0,16578,13409,NULL,16682,2),(16582,7,'Task 5.4',NULL,'ORDER00027-00061',NULL,NULL,'0.00',0,16578,13410,NULL,16683,3),(16583,7,'Task 5.5',NULL,'ORDER00027-00062',NULL,NULL,'0.00',0,16578,13411,NULL,16684,4),(16584,7,'Task 5.6',NULL,'ORDER00027-00063',NULL,NULL,'0.00',0,16578,13412,NULL,16685,5),(16585,7,'Task 5.7',NULL,'ORDER00027-00064',NULL,NULL,'0.00',0,16578,13413,NULL,16686,6),(16586,7,'Task 5.8',NULL,'ORDER00027-00065',NULL,NULL,'0.00',0,16578,13414,NULL,16687,7),(16587,7,'Task 5.9',NULL,'ORDER00027-00066',NULL,NULL,'0.00',0,16578,13415,NULL,16688,8),(16588,7,'Task 5',NULL,'ORDER00027-00010',NULL,NULL,'0.00',0,16133,13406,NULL,16689,9),(16589,7,'Task 5.1',NULL,'ORDER00027-00067',NULL,NULL,'0.00',0,16588,13407,NULL,16690,0),(16590,7,'Task 5.2',NULL,'ORDER00027-00068',NULL,NULL,'0.00',0,16588,13408,NULL,16691,1),(16591,7,'Task 5.3',NULL,'ORDER00027-00069',NULL,NULL,'0.00',0,16588,13409,NULL,16692,2),(16592,7,'Task 5.4',NULL,'ORDER00027-00070',NULL,NULL,'0.00',0,16588,13410,NULL,16693,3),(16593,7,'Task 5.5',NULL,'ORDER00027-00071',NULL,NULL,'0.00',0,16588,13411,NULL,16694,4),(16594,7,'Task 5.6',NULL,'ORDER00027-00072',NULL,NULL,'0.00',0,16588,13412,NULL,16695,5),(16595,7,'Task 5.7',NULL,'ORDER00027-00073',NULL,NULL,'0.00',0,16588,13413,NULL,16696,6),(16596,7,'Task 5.8',NULL,'ORDER00027-00074',NULL,NULL,'0.00',0,16588,13414,NULL,16697,7),(16597,7,'Task 5.9',NULL,'ORDER00027-00075',NULL,NULL,'0.00',0,16588,13415,NULL,16698,8),(16598,7,'Task 5',NULL,'ORDER00027-00011',NULL,NULL,'0.00',0,16133,13406,NULL,16699,10),(16599,7,'Task 5.1',NULL,'ORDER00027-00076',NULL,NULL,'0.00',0,16598,13407,NULL,16700,0),(16600,7,'Task 5.2',NULL,'ORDER00027-00077',NULL,NULL,'0.00',0,16598,13408,NULL,16701,1),(16601,7,'Task 5.3',NULL,'ORDER00027-00078',NULL,NULL,'0.00',0,16598,13409,NULL,16702,2),(16602,7,'Task 5.4',NULL,'ORDER00027-00079',NULL,NULL,'0.00',0,16598,13410,NULL,16703,3),(16603,7,'Task 5.5',NULL,'ORDER00027-00080',NULL,NULL,'0.00',0,16598,13411,NULL,16704,4),(16604,7,'Task 5.6',NULL,'ORDER00027-00081',NULL,NULL,'0.00',0,16598,13412,NULL,16705,5),(16605,7,'Task 5.7',NULL,'ORDER00027-00082',NULL,NULL,'0.00',0,16598,13413,NULL,16706,6),(16606,7,'Task 5.8',NULL,'ORDER00027-00083',NULL,NULL,'0.00',0,16598,13414,NULL,16707,7),(16607,7,'Task 5.9',NULL,'ORDER00027-00084',NULL,NULL,'0.00',0,16598,13415,NULL,16708,8),(16608,7,'Task 5',NULL,'ORDER00027-00012',NULL,NULL,'0.00',0,16133,13406,NULL,16709,11),(16609,7,'Task 5.1',NULL,'ORDER00027-00085',NULL,NULL,'0.00',0,16608,13407,NULL,16710,0),(16610,7,'Task 5.2',NULL,'ORDER00027-00086',NULL,NULL,'0.00',0,16608,13408,NULL,16711,1),(16611,7,'Task 5.3',NULL,'ORDER00027-00087',NULL,NULL,'0.00',0,16608,13409,NULL,16712,2),(16612,7,'Task 5.4',NULL,'ORDER00027-00088',NULL,NULL,'0.00',0,16608,13410,NULL,16713,3),(16613,7,'Task 5.5',NULL,'ORDER00027-00089',NULL,NULL,'0.00',0,16608,13411,NULL,16714,4),(16614,7,'Task 5.6',NULL,'ORDER00027-00090',NULL,NULL,'0.00',0,16608,13412,NULL,16715,5),(16615,7,'Task 5.7',NULL,'ORDER00027-00091',NULL,NULL,'0.00',0,16608,13413,NULL,16716,6),(16616,7,'Task 5.8',NULL,'ORDER00027-00092',NULL,NULL,'0.00',0,16608,13414,NULL,16717,7),(16617,7,'Task 5.9',NULL,'ORDER00027-00093',NULL,NULL,'0.00',0,16608,13415,NULL,16718,8),(16618,7,'Task 5',NULL,'ORDER00027-00013',NULL,NULL,'0.00',0,16133,13406,NULL,16719,12),(16619,7,'Task 5.1',NULL,'ORDER00027-00094',NULL,NULL,'0.00',0,16618,13407,NULL,16720,0),(16620,7,'Task 5.2',NULL,'ORDER00027-00095',NULL,NULL,'0.00',0,16618,13408,NULL,16721,1),(16621,7,'Task 5.3',NULL,'ORDER00027-00096',NULL,NULL,'0.00',0,16618,13409,NULL,16722,2),(16622,7,'Task 5.4',NULL,'ORDER00027-00097',NULL,NULL,'0.00',0,16618,13410,NULL,16723,3),(16623,7,'Task 5.5',NULL,'ORDER00027-00098',NULL,NULL,'0.00',0,16618,13411,NULL,16724,4),(16624,7,'Task 5.6',NULL,'ORDER00027-00099',NULL,NULL,'0.00',0,16618,13412,NULL,16725,5),(16625,7,'Task 5.7',NULL,'ORDER00027-00100',NULL,NULL,'0.00',0,16618,13413,NULL,16726,6),(16626,7,'Task 5.8',NULL,'ORDER00027-00101',NULL,NULL,'0.00',0,16618,13414,NULL,16727,7),(16627,7,'Task 5.9',NULL,'ORDER00027-00102',NULL,NULL,'0.00',0,16618,13415,NULL,16728,8),(16628,7,'Task 5',NULL,'ORDER00027-00014',NULL,NULL,'0.00',0,16133,13406,NULL,16729,13),(16629,7,'Task 5.1',NULL,'ORDER00027-00103',NULL,NULL,'0.00',0,16628,13407,NULL,16730,0),(16630,7,'Task 5.2',NULL,'ORDER00027-00104',NULL,NULL,'0.00',0,16628,13408,NULL,16731,1),(16631,7,'Task 5.3',NULL,'ORDER00027-00105',NULL,NULL,'0.00',0,16628,13409,NULL,16732,2),(16632,7,'Task 5.4',NULL,'ORDER00027-00106',NULL,NULL,'0.00',0,16628,13410,NULL,16733,3),(16633,7,'Task 5.5',NULL,'ORDER00027-00107',NULL,NULL,'0.00',0,16628,13411,NULL,16734,4),(16634,7,'Task 5.6',NULL,'ORDER00027-00108',NULL,NULL,'0.00',0,16628,13412,NULL,16735,5),(16635,7,'Task 5.7',NULL,'ORDER00027-00109',NULL,NULL,'0.00',0,16628,13413,NULL,16736,6),(16636,7,'Task 5.8',NULL,'ORDER00027-00110',NULL,NULL,'0.00',0,16628,13414,NULL,16737,7),(16637,7,'Task 5.9',NULL,'ORDER00027-00111',NULL,NULL,'0.00',0,16628,13415,NULL,16738,8),(16638,7,'Task 5',NULL,'ORDER00027-00015',NULL,NULL,'0.00',0,16133,13406,NULL,16739,14),(16639,7,'Task 5.1',NULL,'ORDER00027-00112',NULL,NULL,'0.00',0,16638,13407,NULL,16740,0),(16640,7,'Task 5.2',NULL,'ORDER00027-00113',NULL,NULL,'0.00',0,16638,13408,NULL,16741,1),(16641,7,'Task 5.3',NULL,'ORDER00027-00114',NULL,NULL,'0.00',0,16638,13409,NULL,16742,2),(16642,7,'Task 5.4',NULL,'ORDER00027-00115',NULL,NULL,'0.00',0,16638,13410,NULL,16743,3),(16643,7,'Task 5.5',NULL,'ORDER00027-00116',NULL,NULL,'0.00',0,16638,13411,NULL,16744,4),(16644,7,'Task 5.6',NULL,'ORDER00027-00117',NULL,NULL,'0.00',0,16638,13412,NULL,16745,5),(16645,7,'Task 5.7',NULL,'ORDER00027-00118',NULL,NULL,'0.00',0,16638,13413,NULL,16746,6),(16646,7,'Task 5.8',NULL,'ORDER00027-00119',NULL,NULL,'0.00',0,16638,13414,NULL,16747,7),(16647,7,'Task 5.9',NULL,'ORDER00027-00120',NULL,NULL,'0.00',0,16638,13415,NULL,16748,8),(16648,7,'Task 5',NULL,'ORDER00027-00016',NULL,NULL,'0.00',0,16133,13406,NULL,16749,15),(16649,7,'Task 5.1',NULL,'ORDER00027-00121',NULL,NULL,'0.00',0,16648,13407,NULL,16750,0),(16650,7,'Task 5.2',NULL,'ORDER00027-00122',NULL,NULL,'0.00',0,16648,13408,NULL,16751,1),(16651,7,'Task 5.3',NULL,'ORDER00027-00123',NULL,NULL,'0.00',0,16648,13409,NULL,16752,2),(16652,7,'Task 5.4',NULL,'ORDER00027-00124',NULL,NULL,'0.00',0,16648,13410,NULL,16753,3),(16653,7,'Task 5.5',NULL,'ORDER00027-00125',NULL,NULL,'0.00',0,16648,13411,NULL,16754,4),(16654,7,'Task 5.6',NULL,'ORDER00027-00126',NULL,NULL,'0.00',0,16648,13412,NULL,16755,5),(16655,7,'Task 5.7',NULL,'ORDER00027-00127',NULL,NULL,'0.00',0,16648,13413,NULL,16756,6),(16656,7,'Task 5.8',NULL,'ORDER00027-00128',NULL,NULL,'0.00',0,16648,13414,NULL,16757,7),(16657,7,'Task 5.9',NULL,'ORDER00027-00129',NULL,NULL,'0.00',0,16648,13415,NULL,16758,8),(16658,7,'Task 5',NULL,'ORDER00027-00017',NULL,NULL,'0.00',0,16133,13406,NULL,16759,16),(16659,7,'Task 5.1',NULL,'ORDER00027-00130',NULL,NULL,'0.00',0,16658,13407,NULL,16760,0),(16660,7,'Task 5.2',NULL,'ORDER00027-00131',NULL,NULL,'0.00',0,16658,13408,NULL,16761,1),(16661,7,'Task 5.3',NULL,'ORDER00027-00132',NULL,NULL,'0.00',0,16658,13409,NULL,16762,2),(16662,7,'Task 5.4',NULL,'ORDER00027-00133',NULL,NULL,'0.00',0,16658,13410,NULL,16763,3),(16663,7,'Task 5.5',NULL,'ORDER00027-00134',NULL,NULL,'0.00',0,16658,13411,NULL,16764,4),(16664,7,'Task 5.6',NULL,'ORDER00027-00135',NULL,NULL,'0.00',0,16658,13412,NULL,16765,5),(17069,7,'Task 5.7',NULL,'ORDER00027-00136',NULL,NULL,'0.00',0,16658,13413,NULL,17170,6),(17070,7,'Task 5.8',NULL,'ORDER00027-00137',NULL,NULL,'0.00',0,16658,13414,NULL,17171,7),(17071,7,'Task 5.9',NULL,'ORDER00027-00138',NULL,NULL,'0.00',0,16658,13415,NULL,17172,8),(17072,7,'Task 5',NULL,'ORDER00027-00018',NULL,NULL,'0.00',0,16133,13406,NULL,17173,17),(17073,7,'Task 5.1',NULL,'ORDER00027-00139',NULL,NULL,'0.00',0,17072,13407,NULL,17174,0),(17074,7,'Task 5.2',NULL,'ORDER00027-00140',NULL,NULL,'0.00',0,17072,13408,NULL,17175,1),(17075,7,'Task 5.3',NULL,'ORDER00027-00141',NULL,NULL,'0.00',0,17072,13409,NULL,17176,2),(17076,7,'Task 5.4',NULL,'ORDER00027-00142',NULL,NULL,'0.00',0,17072,13410,NULL,17177,3),(17077,7,'Task 5.5',NULL,'ORDER00027-00143',NULL,NULL,'0.00',0,17072,13411,NULL,17178,4),(17078,7,'Task 5.6',NULL,'ORDER00027-00144',NULL,NULL,'0.00',0,17072,13412,NULL,17179,5),(17079,7,'Task 5.7',NULL,'ORDER00027-00145',NULL,NULL,'0.00',0,17072,13413,NULL,17180,6),(17080,7,'Task 5.8',NULL,'ORDER00027-00146',NULL,NULL,'0.00',0,17072,13414,NULL,17181,7),(17081,7,'Task 5.9',NULL,'ORDER00027-00147',NULL,NULL,'0.00',0,17072,13415,NULL,17182,8),(17082,7,'Task 5',NULL,'ORDER00027-00019',NULL,NULL,'0.00',0,16133,13406,NULL,17183,18),(17083,7,'Task 5.1',NULL,'ORDER00027-00148',NULL,NULL,'0.00',0,17082,13407,NULL,17184,0),(17084,7,'Task 5.2',NULL,'ORDER00027-00149',NULL,NULL,'0.00',0,17082,13408,NULL,17185,1),(17085,7,'Task 5.3',NULL,'ORDER00027-00150',NULL,NULL,'0.00',0,17082,13409,NULL,17186,2),(17086,7,'Task 5.4',NULL,'ORDER00027-00151',NULL,NULL,'0.00',0,17082,13410,NULL,17187,3),(17087,7,'Task 5.5',NULL,'ORDER00027-00152',NULL,NULL,'0.00',0,17082,13411,NULL,17188,4),(17088,7,'Task 5.6',NULL,'ORDER00027-00153',NULL,NULL,'0.00',0,17082,13412,NULL,17189,5),(17089,7,'Task 5.7',NULL,'ORDER00027-00154',NULL,NULL,'0.00',0,17082,13413,NULL,17190,6),(17090,7,'Task 5.8',NULL,'ORDER00027-00155',NULL,NULL,'0.00',0,17082,13414,NULL,17191,7),(17091,7,'Task 5.9',NULL,'ORDER00027-00156',NULL,NULL,'0.00',0,17082,13415,NULL,17192,8),(17092,7,'Task 5',NULL,'ORDER00027-00020',NULL,NULL,'0.00',0,16133,13406,NULL,17193,19),(17093,7,'Task 5.1',NULL,'ORDER00027-00157',NULL,NULL,'0.00',0,17092,13407,NULL,17194,0),(17094,7,'Task 5.2',NULL,'ORDER00027-00158',NULL,NULL,'0.00',0,17092,13408,NULL,17195,1),(17095,7,'Task 5.3',NULL,'ORDER00027-00159',NULL,NULL,'0.00',0,17092,13409,NULL,17196,2),(17096,7,'Task 5.4',NULL,'ORDER00027-00160',NULL,NULL,'0.00',0,17092,13410,NULL,17197,3),(17097,7,'Task 5.5',NULL,'ORDER00027-00161',NULL,NULL,'0.00',0,17092,13411,NULL,17198,4),(17098,7,'Task 5.6',NULL,'ORDER00027-00162',NULL,NULL,'0.00',0,17092,13412,NULL,17199,5),(17099,7,'Task 5.7',NULL,'ORDER00027-00163',NULL,NULL,'0.00',0,17092,13413,NULL,17200,6),(17100,7,'Task 5.8',NULL,'ORDER00027-00164',NULL,NULL,'0.00',0,17092,13414,NULL,17201,7),(17101,7,'Task 5.9',NULL,'ORDER00027-00165',NULL,NULL,'0.00',0,17092,13415,NULL,17202,8),(17102,7,'Task 5',NULL,'ORDER00027-00021',NULL,NULL,'0.00',0,16133,13406,NULL,17203,20),(17103,7,'Task 5.1',NULL,'ORDER00027-00166',NULL,NULL,'0.00',0,17102,13407,NULL,17204,0),(17104,7,'Task 5.2',NULL,'ORDER00027-00167',NULL,NULL,'0.00',0,17102,13408,NULL,17205,1),(17105,7,'Task 5.3',NULL,'ORDER00027-00168',NULL,NULL,'0.00',0,17102,13409,NULL,17206,2),(17106,7,'Task 5.4',NULL,'ORDER00027-00169',NULL,NULL,'0.00',0,17102,13410,NULL,17207,3),(17107,7,'Task 5.5',NULL,'ORDER00027-00170',NULL,NULL,'0.00',0,17102,13411,NULL,17208,4),(17108,7,'Task 5.6',NULL,'ORDER00027-00171',NULL,NULL,'0.00',0,17102,13412,NULL,17209,5),(17109,7,'Task 5.7',NULL,'ORDER00027-00172',NULL,NULL,'0.00',0,17102,13413,NULL,17210,6),(17110,7,'Task 5.8',NULL,'ORDER00027-00173',NULL,NULL,'0.00',0,17102,13414,NULL,17211,7),(17111,7,'Task 5.9',NULL,'ORDER00027-00174',NULL,NULL,'0.00',0,17102,13415,NULL,17212,8),(17112,7,'Task 5',NULL,'ORDER00027-00022',NULL,NULL,'0.00',0,16133,13406,NULL,17213,21),(17113,7,'Task 5.1',NULL,'ORDER00027-00175',NULL,NULL,'0.00',0,17112,13407,NULL,17214,0),(17114,7,'Task 5.2',NULL,'ORDER00027-00176',NULL,NULL,'0.00',0,17112,13408,NULL,17215,1),(17115,7,'Task 5.3',NULL,'ORDER00027-00177',NULL,NULL,'0.00',0,17112,13409,NULL,17216,2),(17116,7,'Task 5.4',NULL,'ORDER00027-00178',NULL,NULL,'0.00',0,17112,13410,NULL,17217,3),(17117,7,'Task 5.5',NULL,'ORDER00027-00179',NULL,NULL,'0.00',0,17112,13411,NULL,17218,4),(17118,7,'Task 5.6',NULL,'ORDER00027-00180',NULL,NULL,'0.00',0,17112,13412,NULL,17219,5),(17119,7,'Task 5.7',NULL,'ORDER00027-00181',NULL,NULL,'0.00',0,17112,13413,NULL,17220,6),(17120,7,'Task 5.8',NULL,'ORDER00027-00182',NULL,NULL,'0.00',0,17112,13414,NULL,17221,7),(17121,7,'Task 5.9',NULL,'ORDER00027-00183',NULL,NULL,'0.00',0,17112,13415,NULL,17222,8),(17122,7,'Task 5',NULL,'ORDER00027-00023',NULL,NULL,'0.00',0,16133,13406,NULL,17223,22),(17123,7,'Task 5.1',NULL,'ORDER00027-00184',NULL,NULL,'0.00',0,17122,13407,NULL,17224,0),(17124,7,'Task 5.2',NULL,'ORDER00027-00185',NULL,NULL,'0.00',0,17122,13408,NULL,17225,1),(17125,7,'Task 5.3',NULL,'ORDER00027-00186',NULL,NULL,'0.00',0,17122,13409,NULL,17226,2),(17126,7,'Task 5.4',NULL,'ORDER00027-00187',NULL,NULL,'0.00',0,17122,13410,NULL,17227,3),(17127,7,'Task 5.5',NULL,'ORDER00027-00188',NULL,NULL,'0.00',0,17122,13411,NULL,17228,4),(17128,7,'Task 5.6',NULL,'ORDER00027-00189',NULL,NULL,'0.00',0,17122,13412,NULL,17229,5),(17129,7,'Task 5.7',NULL,'ORDER00027-00190',NULL,NULL,'0.00',0,17122,13413,NULL,17230,6),(17130,7,'Task 5.8',NULL,'ORDER00027-00191',NULL,NULL,'0.00',0,17122,13414,NULL,17231,7),(17131,7,'Task 5.9',NULL,'ORDER00027-00192',NULL,NULL,'0.00',0,17122,13415,NULL,17232,8),(17132,7,'Task 5',NULL,'ORDER00027-00024',NULL,NULL,'0.00',0,16133,13406,NULL,17233,23),(17133,7,'Task 5.1',NULL,'ORDER00027-00193',NULL,NULL,'0.00',0,17132,13407,NULL,17234,0),(17134,7,'Task 5.2',NULL,'ORDER00027-00194',NULL,NULL,'0.00',0,17132,13408,NULL,17235,1),(17135,7,'Task 5.3',NULL,'ORDER00027-00195',NULL,NULL,'0.00',0,17132,13409,NULL,17236,2),(17136,7,'Task 5.4',NULL,'ORDER00027-00196',NULL,NULL,'0.00',0,17132,13410,NULL,17237,3),(17137,7,'Task 5.5',NULL,'ORDER00027-00197',NULL,NULL,'0.00',0,17132,13411,NULL,17238,4),(17138,7,'Task 5.6',NULL,'ORDER00027-00198',NULL,NULL,'0.00',0,17132,13412,NULL,17239,5),(17139,7,'Task 5.7',NULL,'ORDER00027-00199',NULL,NULL,'0.00',0,17132,13413,NULL,17240,6),(17140,7,'Task 5.8',NULL,'ORDER00027-00200',NULL,NULL,'0.00',0,17132,13414,NULL,17241,7),(17141,7,'Task 5.9',NULL,'ORDER00027-00201',NULL,NULL,'0.00',0,17132,13415,NULL,17242,8),(17142,7,'Task 5',NULL,'ORDER00027-00025',NULL,NULL,'0.00',0,16133,13406,NULL,17243,24),(17143,7,'Task 5.1',NULL,'ORDER00027-00202',NULL,NULL,'0.00',0,17142,13407,NULL,17244,0),(17144,7,'Task 5.2',NULL,'ORDER00027-00203',NULL,NULL,'0.00',0,17142,13408,NULL,17245,1),(17145,7,'Task 5.3',NULL,'ORDER00027-00204',NULL,NULL,'0.00',0,17142,13409,NULL,17246,2),(17146,7,'Task 5.4',NULL,'ORDER00027-00205',NULL,NULL,'0.00',0,17142,13410,NULL,17247,3),(17147,7,'Task 5.5',NULL,'ORDER00027-00206',NULL,NULL,'0.00',0,17142,13411,NULL,17248,4),(17148,7,'Task 5.6',NULL,'ORDER00027-00207',NULL,NULL,'0.00',0,17142,13412,NULL,17249,5),(17149,7,'Task 5.7',NULL,'ORDER00027-00208',NULL,NULL,'0.00',0,17142,13413,NULL,17250,6),(17150,7,'Task 5.8',NULL,'ORDER00027-00209',NULL,NULL,'0.00',0,17142,13414,NULL,17251,7),(17151,7,'Task 5.9',NULL,'ORDER00027-00210',NULL,NULL,'0.00',0,17142,13415,NULL,17252,8),(17157,2,'Another',NULL,'ORDER00028','2011-01-21 16:57:54',NULL,'0.00',0,NULL,NULL,NULL,17258,NULL),(17158,2,'temp',NULL,'ORDER00028-00001',NULL,NULL,'0.00',0,17157,NULL,NULL,17259,0),(18484,2,'Kalandraka',NULL,'ORDER00029','2011-01-21 17:08:44','2011-06-21 00:00:00','0.00',0,NULL,2335,NULL,18585,NULL),(18485,2,'Coordinacion',NULL,'ORDER00029-00001',NULL,NULL,'0.00',0,18484,2336,NULL,18586,0),(18486,2,'Desarrollo',NULL,'ORDER00029-00002',NULL,NULL,'0.00',0,18484,2337,NULL,18587,1),(18487,2,'Integración plantillas',NULL,'ORDER00029-00003',NULL,NULL,'0.00',0,18484,2338,NULL,18588,2),(18500,2,'Kalandraka',NULL,'ORDER00030','2011-01-21 17:09:09','2011-06-21 00:00:00','0.00',0,NULL,2335,NULL,18601,NULL),(18501,2,'Coordinacion',NULL,'ORDER00030-00001',NULL,NULL,'0.00',0,18500,2336,NULL,18602,0),(18502,2,'Desarrollo',NULL,'ORDER00030-00002',NULL,NULL,'0.00',0,18500,2337,NULL,18603,1),(18503,2,'Integración plantillas',NULL,'ORDER00030-00003',NULL,NULL,'0.00',0,18500,2338,NULL,18604,2);
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
INSERT INTO `order_element_template` VALUES (2335,1,'Kalandraka',NULL,'ORDER00011',0,151,3,NULL,NULL),(2336,1,'Coordinacion',NULL,'ORDER00011-00001',NULL,NULL,0,2335,0),(2337,1,'Desarrollo',NULL,'ORDER00011-00002',NULL,NULL,0,2335,1),(2338,1,'Integración plantillas',NULL,'ORDER00011-00003',NULL,NULL,0,2335,2),(13365,1,'Long project',NULL,'ORDER00024',0,473,3,NULL,NULL),(13366,1,'Task 1',NULL,'ORDER00024-00001',NULL,NULL,0,13365,0),(13367,1,'Task 2',NULL,'ORDER00024-00002',NULL,NULL,0,13365,1),(13368,1,'Task 3',NULL,'ORDER00024-00003',NULL,NULL,0,13365,2),(13369,1,'Task 4',NULL,'ORDER00024-00004',NULL,NULL,0,13365,3),(13370,1,'Task 5',NULL,'ORDER00024-00005',NULL,NULL,3,13365,4),(13371,1,'Task 5.1',NULL,'ORDER00024-00006',NULL,NULL,0,13370,0),(13372,1,'Task 5.2',NULL,'ORDER00024-00007',NULL,NULL,0,13370,1),(13373,1,'Task 5.3',NULL,'ORDER00024-00008',NULL,NULL,0,13370,2),(13374,1,'Task 5.4',NULL,'ORDER00024-00009',NULL,NULL,0,13370,3),(13375,1,'Task 5.5',NULL,'ORDER00024-00010',NULL,NULL,0,13370,4),(13406,1,'Task 5',NULL,'ORDER00026-00001',NULL,NULL,3,NULL,NULL),(13407,1,'Task 5.1',NULL,'ORDER00026-00002',NULL,NULL,0,13406,0),(13408,1,'Task 5.2',NULL,'ORDER00026-00003',NULL,NULL,0,13406,1),(13409,1,'Task 5.3',NULL,'ORDER00026-00004',NULL,NULL,0,13406,2),(13410,1,'Task 5.4',NULL,'ORDER00026-00005',NULL,NULL,0,13406,3),(13411,1,'Task 5.5',NULL,'ORDER00026-00006',NULL,NULL,0,13406,4),(13412,1,'Task 5.6',NULL,'ORDER00026-00007',NULL,NULL,0,13406,5),(13413,1,'Task 5.7',NULL,'ORDER00026-00008',NULL,NULL,0,13406,6),(13414,1,'Task 5.8',NULL,'ORDER00026-00009',NULL,NULL,0,13406,7),(13415,1,'Task 5.9',NULL,'ORDER00026-00010',NULL,NULL,0,13406,8);
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
INSERT INTO `order_line` VALUES (6001,1),(4956,1),(3036,1),(6002,1),(6003,1),(6024,1),(6025,1),(6026,1),(6028,1),(6029,1),(6030,1),(6031,1),(8391,1),(8392,1),(9800,1),(11519,2),(12447,1),(12448,1),(12449,1),(12450,1),(12452,1),(12453,1),(12454,1),(12455,1),(12456,1),(13671,1),(13672,1),(13673,1),(13674,1),(13675,1),(13676,1),(13677,1),(13678,1),(13679,1),(16134,1),(16135,1),(16136,1),(16137,1),(16139,1),(16140,1),(16141,1),(16142,1),(16143,1),(16145,1),(16146,1),(16147,1),(16148,1),(16149,1),(16150,1),(16151,1),(16152,1),(16153,1),(16155,1),(16156,1),(16157,1),(16158,1),(16159,1),(16564,1),(16565,1),(16566,1),(16567,1),(16569,1),(16570,1),(16571,1),(16572,1),(16573,1),(16574,1),(16575,1),(16576,1),(16577,1),(16579,1),(16580,1),(16581,1),(16582,1),(16583,1),(16584,1),(16585,1),(16586,1),(16587,1),(16589,1),(16590,1),(16591,1),(16592,1),(16593,1),(16594,1),(16595,1),(16596,1),(16597,1),(16599,1),(16600,1),(16601,1),(16602,1),(16603,1),(16604,1),(16605,1),(16606,1),(16607,1),(16609,1),(16610,1),(16611,1),(16612,1),(16613,1),(16614,1),(16615,1),(16616,1),(16617,1),(16619,1),(16620,1),(16621,1),(16622,1),(16623,1),(16624,1),(16625,1),(16626,1),(16627,1),(16629,1),(16630,1),(16631,1),(16632,1),(16633,1),(16634,1),(16635,1),(16636,1),(16637,1),(16639,1),(16640,1),(16641,1),(16642,1),(16643,1),(16644,1),(16645,1),(16646,1),(16647,1),(16649,1),(16650,1),(16651,1),(16652,1),(16653,1),(16654,1),(16655,1),(16656,1),(16657,1),(16659,1),(16660,1),(16661,1),(16662,1),(16663,1),(16664,1),(17069,1),(17070,1),(17071,1),(17073,1),(17074,1),(17075,1),(17076,1),(17077,1),(17078,1),(17079,1),(17080,1),(17081,1),(17083,1),(17084,1),(17085,1),(17086,1),(17087,1),(17088,1),(17089,1),(17090,1),(17091,1),(17093,1),(17094,1),(17095,1),(17096,1),(17097,1),(17098,1),(17099,1),(17100,1),(17101,1),(17103,1),(17104,1),(17105,1),(17106,1),(17107,1),(17108,1),(17109,1),(17110,1),(17111,1),(17113,1),(17114,1),(17115,1),(17116,1),(17117,1),(17118,1),(17119,1),(17120,1),(17121,1),(17123,1),(17124,1),(17125,1),(17126,1),(17127,1),(17128,1),(17129,1),(17130,1),(17131,1),(17133,1),(17134,1),(17135,1),(17136,1),(17137,1),(17138,1),(17139,1),(17140,1),(17141,1),(17143,1),(17144,1),(17145,1),(17146,1),(17147,1),(17148,1),(17149,1),(17150,1),(17151,1),(17158,1),(18485,1),(18486,1),(18487,1),(18501,1),(18502,1),(18503,1);
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
INSERT INTO `order_line_group` VALUES (3035),(4955),(6000),(6023),(6027),(8390),(12446),(12451),(13669),(13670),(16133),(16138),(16144),(16154),(16568),(16578),(16588),(16598),(16608),(16618),(16628),(16638),(16648),(16658),(17072),(17082),(17092),(17102),(17112),(17122),(17132),(17142),(17157),(18484),(18500);
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
INSERT INTO `order_line_group_template` VALUES (2335),(13365),(13370),(13406);
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
INSERT INTO `order_line_template` VALUES (2336,0),(2337,0),(2338,0),(13366,0),(13367,0),(13368,0),(13369,0),(13371,0),(13372,0),(13373,0),(13374,0),(13375,0),(13407,0),(13408,0),(13409,0),(13410,0),(13411,0),(13412,0),(13413,0),(13414,0),(13415,0);
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
  `scheduling_mode` int(11) DEFAULT NULL,
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
INSERT INTO `order_table` VALUES (3035,NULL,NULL,1,1,'0.00','0.00',120,NULL,NULL,0,NULL,202,0),(4955,NULL,NULL,1,1,'0.00','0.00',500,NULL,NULL,0,NULL,202,0),(6000,NULL,NULL,1,4,'0.00','0.00',490,NULL,NULL,0,NULL,202,0),(6023,NULL,NULL,1,8,'0.00','0.00',870,NULL,NULL,0,NULL,202,0),(8390,NULL,NULL,1,3,'0.00','0.00',454,NULL,NULL,0,NULL,202,0),(12446,NULL,NULL,1,10,'0.00','0.00',1500,NULL,NULL,0,NULL,202,0),(13669,NULL,NULL,1,10,'0.00','0.00',1500,NULL,NULL,0,NULL,202,0),(16133,NULL,NULL,1,210,'0.00','0.00',31500,NULL,NULL,0,NULL,202,0),(17157,NULL,NULL,1,1,'0.00','0.00',100,NULL,NULL,0,NULL,202,0),(18484,NULL,NULL,1,3,'0.00','0.00',620,NULL,NULL,0,NULL,202,0),(18500,NULL,NULL,1,3,'0.00','0.00',620,NULL,NULL,0,NULL,202,0);
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
INSERT INTO `order_template` VALUES (2335,202),(13365,202);
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
INSERT INTO `order_version` VALUES (3336,6,'2011-01-21 12:14:32',909),(5256,3,'2011-01-07 13:05:49',909),(6273,14,'2011-01-21 12:16:49',909),(6277,7,'2011-01-21 18:45:51',909),(8689,6,'2011-01-21 12:15:07',909),(12729,3,'2011-01-21 16:28:04',909),(13942,2,'2011-01-21 16:31:54',909),(13946,7,'2011-01-24 11:17:51',909),(13950,2,'2011-01-21 16:59:15',909),(13954,2,'2011-01-21 17:08:50',909),(13958,2,'2011-01-21 17:09:15',909);
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
INSERT INTO `planning_data` VALUES (3637,'0.000000','0.000000'),(5556,'0.000000','0.000000'),(6568,'0.000000','0.000000'),(6577,'0.000000','0.000000'),(13039,'0.000000','0.000000'),(17593,'0.000000','0.000000');
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
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `resource_type` varchar(64) NOT NULL,
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
INSERT INTO `resource` VALUES (3839,1,'WORKER00001',1,3939,'LIMITING_RESOURCE'),(7071,1,'WORKER00002',1,7171,'NON_LIMITING_RESOURCE'),(7073,1,'MACHINE00001',1,7172,'LIMITING_RESOURCE'),(17676,2,'WORKER00003',1,17776,'NON_LIMITING_RESOURCE');
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
INSERT INTO `resource_allocation` VALUES (4345,2,'1.00',1200,1200,3636,NULL),(5757,3,'1.00',500,500,5555,NULL),(7586,5,'1.00',120,120,6575,NULL),(7587,6,'1.00',120,120,6571,NULL),(7588,5,'1.00',180,180,6572,NULL),(7589,5,'1.00',120,120,6573,NULL),(7590,5,'1.00',120,120,6569,NULL),(7591,5,'1.00',120,120,6570,NULL),(7592,4,'1.00',90,90,6576,NULL),(9292,4,'1.00',NULL,150,6565,NULL),(18080,5,'1.00',NULL,100,14151,NULL),(18081,4,'0.26',NULL,25,14155,NULL),(18082,4,'1.00',NULL,150,14152,NULL),(18083,2,'1.00',NULL,200,14168,NULL),(19089,0,'0.26',NULL,25,14155,NULL);
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
INSERT INTO `resource_calendar` VALUES (3939,1),(7171,1),(7172,1),(17776,1);
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
INSERT INTO `roles_table` VALUES (1213,'ROLE_ADMINISTRATION'),(1213,'ROLE_EDIT_ALL_ORDERS'),(1213,'ROLE_READ_ALL_ORDERS'),(1213,'ROLE_CREATE_ORDER'),(1214,'ROLE_WS_READER'),(1215,'ROLE_WS_WRITER'),(1215,'ROLE_WS_READER');
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
INSERT INTO `scenario` VALUES (909,1,'master',NULL,NULL,NULL);
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
INSERT INTO `scenario_orders` VALUES (3035,3336,909),(4955,5256,909),(6000,6273,909),(6023,6277,909),(8390,8689,909),(12446,12729,909),(13669,13942,909),(16133,13946,909),(17157,13950,909),(18484,13954,909),(18500,13958,909);
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
INSERT INTO `scheduling_data_for_version` VALUES (5158,3,0,4956),(5157,3,3,4955),(3238,5,0,3036),(3237,5,3,3035),(6202,11,3,6000),(6203,11,0,6001),(6204,11,0,6002),(6205,11,0,6003),(6225,7,3,6023),(6226,7,0,6024),(6227,7,0,6025),(6228,7,0,6026),(6229,7,3,6027),(6230,7,0,6028),(6231,7,0,6029),(6232,7,0,6030),(6233,7,0,6031),(8592,4,3,8390),(8593,4,0,8391),(8594,4,0,8392),(10002,5,0,9800),(11721,3,0,11519),(12648,3,3,12446),(12649,3,0,12447),(12650,3,0,12448),(12651,3,0,12449),(12652,3,0,12450),(12653,3,3,12451),(12654,3,0,12452),(12655,3,0,12453),(12656,3,0,12454),(12657,3,0,12455),(12658,3,0,12456),(13871,2,3,13669),(13872,2,3,13670),(13873,2,0,13671),(13874,2,0,13672),(13875,2,0,13673),(13876,2,0,13674),(13877,2,0,13675),(13878,2,0,13676),(13879,2,0,13677),(13880,2,0,13678),(13881,2,0,13679),(16335,7,3,16133),(16336,7,0,16134),(16337,7,0,16135),(16338,7,0,16136),(16339,7,0,16137),(16340,7,3,16138),(16341,7,0,16139),(16342,7,0,16140),(16343,7,0,16141),(16344,7,0,16142),(16345,7,0,16143),(16346,7,3,16144),(16347,7,0,16145),(16348,7,0,16146),(16349,7,0,16147),(16350,7,0,16148),(16351,7,0,16149),(16352,7,0,16150),(16353,7,0,16151),(16354,7,0,16152),(16355,7,0,16153),(16356,7,3,16154),(16357,7,0,16155),(16358,7,0,16156),(16359,7,0,16157),(16360,7,0,16158),(16361,7,0,16159),(16766,7,0,16564),(16767,7,0,16565),(16768,7,0,16566),(16769,7,0,16567),(16770,7,3,16568),(16771,7,0,16569),(16772,7,0,16570),(16773,7,0,16571),(16774,7,0,16572),(16775,7,0,16573),(16776,7,0,16574),(16777,7,0,16575),(16778,7,0,16576),(16779,7,0,16577),(16780,7,3,16578),(16781,7,0,16579),(16782,7,0,16580),(16783,7,0,16581),(16784,7,0,16582),(16785,7,0,16583),(16786,7,0,16584),(16787,7,0,16585),(16788,7,0,16586),(16789,7,0,16587),(16790,7,3,16588),(16791,7,0,16589),(16792,7,0,16590),(16793,7,0,16591),(16794,7,0,16592),(16795,7,0,16593),(16796,7,0,16594),(16797,7,0,16595),(16798,7,0,16596),(16799,7,0,16597),(16800,7,3,16598),(16801,7,0,16599),(16802,7,0,16600),(16803,7,0,16601),(16804,7,0,16602),(16805,7,0,16603),(16806,7,0,16604),(16807,7,0,16605),(16808,7,0,16606),(16809,7,0,16607),(16810,7,3,16608),(16811,7,0,16609),(16812,7,0,16610),(16813,7,0,16611),(16814,7,0,16612),(16815,7,0,16613),(16816,7,0,16614),(16817,7,0,16615),(16818,7,0,16616),(16819,7,0,16617),(16820,7,3,16618),(16821,7,0,16619),(16822,7,0,16620),(16823,7,0,16621),(16824,7,0,16622),(16825,7,0,16623),(16826,7,0,16624),(16827,7,0,16625),(16828,7,0,16626),(16829,7,0,16627),(16830,7,3,16628),(16831,7,0,16629),(16832,7,0,16630),(16833,7,0,16631),(16834,7,0,16632),(16835,7,0,16633),(16836,7,0,16634),(16837,7,0,16635),(16838,7,0,16636),(16839,7,0,16637),(16840,7,3,16638),(16841,7,0,16639),(16842,7,0,16640),(16843,7,0,16641),(16844,7,0,16642),(16845,7,0,16643),(16846,7,0,16644),(16847,7,0,16645),(16848,7,0,16646),(16849,7,0,16647),(16850,7,3,16648),(16851,7,0,16649),(16852,7,0,16650),(16853,7,0,16651),(16854,7,0,16652),(16855,7,0,16653),(16856,7,0,16654),(16857,7,0,16655),(16858,7,0,16656),(16859,7,0,16657),(16860,7,3,16658),(16861,7,0,16659),(16862,7,0,16660),(16863,7,0,16661),(16864,7,0,16662),(16865,7,0,16663),(16866,7,0,16664),(17271,7,0,17069),(17272,7,0,17070),(17273,7,0,17071),(17274,7,3,17072),(17275,7,0,17073),(17276,7,0,17074),(17277,7,0,17075),(17278,7,0,17076),(17279,7,0,17077),(17280,7,0,17078),(17281,7,0,17079),(17282,7,0,17080),(17283,7,0,17081),(17284,7,3,17082),(17285,7,0,17083),(17286,7,0,17084),(17287,7,0,17085),(17288,7,0,17086),(17289,7,0,17087),(17290,7,0,17088),(17291,7,0,17089),(17292,7,0,17090),(17293,7,0,17091),(17294,7,3,17092),(17295,7,0,17093),(17296,7,0,17094),(17297,7,0,17095),(17298,7,0,17096),(17299,7,0,17097),(17300,7,0,17098),(17301,7,0,17099),(17302,7,0,17100),(17303,7,0,17101),(17304,7,3,17102),(17305,7,0,17103),(17306,7,0,17104),(17307,7,0,17105),(17308,7,0,17106),(17309,7,0,17107),(17310,7,0,17108),(17311,7,0,17109),(17312,7,0,17110),(17313,7,0,17111),(17314,7,3,17112),(17315,7,0,17113),(17316,7,0,17114),(17317,7,0,17115),(17318,7,0,17116),(17319,7,0,17117),(17320,7,0,17118),(17321,7,0,17119),(17322,7,0,17120),(17323,7,0,17121),(17324,7,3,17122),(17325,7,0,17123),(17326,7,0,17124),(17327,7,0,17125),(17328,7,0,17126),(17329,7,0,17127),(17330,7,0,17128),(17331,7,0,17129),(17332,7,0,17130),(17333,7,0,17131),(17334,7,3,17132),(17335,7,0,17133),(17336,7,0,17134),(17337,7,0,17135),(17338,7,0,17136),(17339,7,0,17137),(17340,7,0,17138),(17341,7,0,17139),(17342,7,0,17140),(17343,7,0,17141),(17344,7,3,17142),(17345,7,0,17143),(17346,7,0,17144),(17347,7,0,17145),(17348,7,0,17146),(17349,7,0,17147),(17350,7,0,17148),(17351,7,0,17149),(17352,7,0,17150),(17353,7,0,17151),(17359,2,3,17157),(17360,2,0,17158),(18686,2,3,18484),(18687,2,0,18485),(18688,2,0,18486),(18689,2,0,18487),(18702,2,3,18500),(18703,2,0,18501),(18704,2,0,18502),(18705,2,0,18503);
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
INSERT INTO `scheduling_states_by_order_version` VALUES (4956,5158,5256),(4955,5157,5256),(3036,3238,3336),(3035,3237,3336),(6000,6202,6273),(6001,6203,6273),(6002,6204,6273),(6003,6205,6273),(6023,6225,6277),(6024,6226,6277),(6025,6227,6277),(6026,6228,6277),(6027,6229,6277),(6028,6230,6277),(6029,6231,6277),(6030,6232,6277),(6031,6233,6277),(8390,8592,8689),(8391,8593,8689),(8392,8594,8689),(9800,10002,6273),(11519,11721,8689),(12446,12648,12729),(12447,12649,12729),(12448,12650,12729),(12449,12651,12729),(12450,12652,12729),(12451,12653,12729),(12452,12654,12729),(12453,12655,12729),(12454,12656,12729),(12455,12657,12729),(12456,12658,12729),(13669,13871,13942),(13670,13872,13942),(13671,13873,13942),(13672,13874,13942),(13673,13875,13942),(13674,13876,13942),(13675,13877,13942),(13676,13878,13942),(13677,13879,13942),(13678,13880,13942),(13679,13881,13942),(16133,16335,13946),(16134,16336,13946),(16135,16337,13946),(16136,16338,13946),(16137,16339,13946),(16138,16340,13946),(16139,16341,13946),(16140,16342,13946),(16141,16343,13946),(16142,16344,13946),(16143,16345,13946),(16144,16346,13946),(16145,16347,13946),(16146,16348,13946),(16147,16349,13946),(16148,16350,13946),(16149,16351,13946),(16150,16352,13946),(16151,16353,13946),(16152,16354,13946),(16153,16355,13946),(16154,16356,13946),(16155,16357,13946),(16156,16358,13946),(16157,16359,13946),(16158,16360,13946),(16159,16361,13946),(16564,16766,13946),(16565,16767,13946),(16566,16768,13946),(16567,16769,13946),(16568,16770,13946),(16569,16771,13946),(16570,16772,13946),(16571,16773,13946),(16572,16774,13946),(16573,16775,13946),(16574,16776,13946),(16575,16777,13946),(16576,16778,13946),(16577,16779,13946),(16578,16780,13946),(16579,16781,13946),(16580,16782,13946),(16581,16783,13946),(16582,16784,13946),(16583,16785,13946),(16584,16786,13946),(16585,16787,13946),(16586,16788,13946),(16587,16789,13946),(16588,16790,13946),(16589,16791,13946),(16590,16792,13946),(16591,16793,13946),(16592,16794,13946),(16593,16795,13946),(16594,16796,13946),(16595,16797,13946),(16596,16798,13946),(16597,16799,13946),(16598,16800,13946),(16599,16801,13946),(16600,16802,13946),(16601,16803,13946),(16602,16804,13946),(16603,16805,13946),(16604,16806,13946),(16605,16807,13946),(16606,16808,13946),(16607,16809,13946),(16608,16810,13946),(16609,16811,13946),(16610,16812,13946),(16611,16813,13946),(16612,16814,13946),(16613,16815,13946),(16614,16816,13946),(16615,16817,13946),(16616,16818,13946),(16617,16819,13946),(16618,16820,13946),(16619,16821,13946),(16620,16822,13946),(16621,16823,13946),(16622,16824,13946),(16623,16825,13946),(16624,16826,13946),(16625,16827,13946),(16626,16828,13946),(16627,16829,13946),(16628,16830,13946),(16629,16831,13946),(16630,16832,13946),(16631,16833,13946),(16632,16834,13946),(16633,16835,13946),(16634,16836,13946),(16635,16837,13946),(16636,16838,13946),(16637,16839,13946),(16638,16840,13946),(16639,16841,13946),(16640,16842,13946),(16641,16843,13946),(16642,16844,13946),(16643,16845,13946),(16644,16846,13946),(16645,16847,13946),(16646,16848,13946),(16647,16849,13946),(16648,16850,13946),(16649,16851,13946),(16650,16852,13946),(16651,16853,13946),(16652,16854,13946),(16653,16855,13946),(16654,16856,13946),(16655,16857,13946),(16656,16858,13946),(16657,16859,13946),(16658,16860,13946),(16659,16861,13946),(16660,16862,13946),(16661,16863,13946),(16662,16864,13946),(16663,16865,13946),(16664,16866,13946),(17069,17271,13946),(17070,17272,13946),(17071,17273,13946),(17072,17274,13946),(17073,17275,13946),(17074,17276,13946),(17075,17277,13946),(17076,17278,13946),(17077,17279,13946),(17078,17280,13946),(17079,17281,13946),(17080,17282,13946),(17081,17283,13946),(17082,17284,13946),(17083,17285,13946),(17084,17286,13946),(17085,17287,13946),(17086,17288,13946),(17087,17289,13946),(17088,17290,13946),(17089,17291,13946),(17090,17292,13946),(17091,17293,13946),(17092,17294,13946),(17093,17295,13946),(17094,17296,13946),(17095,17297,13946),(17096,17298,13946),(17097,17299,13946),(17098,17300,13946),(17099,17301,13946),(17100,17302,13946),(17101,17303,13946),(17102,17304,13946),(17103,17305,13946),(17104,17306,13946),(17105,17307,13946),(17106,17308,13946),(17107,17309,13946),(17108,17310,13946),(17109,17311,13946),(17110,17312,13946),(17111,17313,13946),(17112,17314,13946),(17113,17315,13946),(17114,17316,13946),(17115,17317,13946),(17116,17318,13946),(17117,17319,13946),(17118,17320,13946),(17119,17321,13946),(17120,17322,13946),(17121,17323,13946),(17122,17324,13946),(17123,17325,13946),(17124,17326,13946),(17125,17327,13946),(17126,17328,13946),(17127,17329,13946),(17128,17330,13946),(17129,17331,13946),(17130,17332,13946),(17131,17333,13946),(17132,17334,13946),(17133,17335,13946),(17134,17336,13946),(17135,17337,13946),(17136,17338,13946),(17137,17339,13946),(17138,17340,13946),(17139,17341,13946),(17140,17342,13946),(17141,17343,13946),(17142,17344,13946),(17143,17345,13946),(17144,17346,13946),(17145,17347,13946),(17146,17348,13946),(17147,17349,13946),(17148,17350,13946),(17149,17351,13946),(17150,17352,13946),(17151,17353,13946),(17157,17359,13950),(17158,17360,13950),(18484,18686,13954),(18485,18687,13954),(18486,18688,13954),(18487,18689,13954),(18500,18702,13958),(18501,18703,13958),(18502,18704,13958),(18503,18705,13958);
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
INSERT INTO `specific_day_assignments_container` VALUES (4547,1,4345,909,'2011-01-05',0,'2011-01-27',28800),(7878,10,7591,909,'2012-01-13',0,'2012-02-03',0),(7879,9,7590,909,'2011-11-02',0,'2011-11-23',0),(7880,8,5757,909,'2011-08-05',0,'2011-11-02',0),(7881,7,7589,909,'2012-01-13',0,'2012-02-03',0),(7882,7,7587,909,'2011-10-12',0,'2011-11-01',0),(7883,5,7592,909,'2012-02-24',0,'2012-03-13',0),(7884,4,7588,909,'2011-12-14',0,'2012-01-13',0),(7885,3,7586,909,'2012-02-03',0,'2012-02-24',0),(9393,3,9292,909,'2011-04-11',0,'2011-05-05',21600),(18181,5,18080,909,'2011-01-21',0,'2011-02-08',14400),(18182,4,18081,909,'2011-01-21',0,'2011-02-08',144),(18183,4,18082,909,'2011-01-21',0,'2011-02-16',21600),(18184,2,18083,909,'2011-03-07',7200,'2011-04-11',7200),(19190,0,19089,909,'2011-01-21',0,'2011-02-08',144);
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
INSERT INTO `specific_resource_allocation` VALUES (4345,3839),(5757,3839),(7586,7073),(7587,7073),(7588,3839),(7589,7073),(7590,3839),(7591,3839),(7592,7073),(9292,7071),(18080,17676),(18081,17676),(18082,17676),(18083,17676),(19089,7071);
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
INSERT INTO `sum_charged_hours` VALUES (3136,5,0,0),(5057,3,0,0),(5056,3,0,0),(3137,5,0,0),(6101,11,0,0),(6102,11,0,0),(6103,11,0,0),(6104,11,0,0),(6124,7,0,0),(6125,7,0,0),(6126,7,0,0),(6127,7,0,0),(6128,7,0,0),(6129,7,0,0),(6130,7,0,0),(6131,7,0,0),(6132,7,0,0),(8491,4,0,0),(8492,4,0,0),(8493,4,0,0),(9901,5,0,0),(11620,3,0,0),(12547,3,0,0),(12548,3,0,0),(12549,3,0,0),(12550,3,0,0),(12551,3,0,0),(12552,3,0,0),(12553,3,0,0),(12554,3,0,0),(12555,3,0,0),(12556,3,0,0),(12557,3,0,0),(13770,2,0,0),(13771,2,0,0),(13772,2,0,0),(13773,2,0,0),(13774,2,0,0),(13775,2,0,0),(13776,2,0,0),(13777,2,0,0),(13778,2,0,0),(13779,2,0,0),(13780,2,0,0),(16234,7,0,0),(16235,7,0,0),(16236,7,0,0),(16237,7,0,0),(16238,7,0,0),(16239,7,0,0),(16240,7,0,0),(16241,7,0,0),(16242,7,0,0),(16243,7,0,0),(16244,7,0,0),(16245,7,0,0),(16246,7,0,0),(16247,7,0,0),(16248,7,0,0),(16249,7,0,0),(16250,7,0,0),(16251,7,0,0),(16252,7,0,0),(16253,7,0,0),(16254,7,0,0),(16255,7,0,0),(16256,7,0,0),(16257,7,0,0),(16258,7,0,0),(16259,7,0,0),(16260,7,0,0),(16665,7,0,0),(16666,7,0,0),(16667,7,0,0),(16668,7,0,0),(16669,7,0,0),(16670,7,0,0),(16671,7,0,0),(16672,7,0,0),(16673,7,0,0),(16674,7,0,0),(16675,7,0,0),(16676,7,0,0),(16677,7,0,0),(16678,7,0,0),(16679,7,0,0),(16680,7,0,0),(16681,7,0,0),(16682,7,0,0),(16683,7,0,0),(16684,7,0,0),(16685,7,0,0),(16686,7,0,0),(16687,7,0,0),(16688,7,0,0),(16689,7,0,0),(16690,7,0,0),(16691,7,0,0),(16692,7,0,0),(16693,7,0,0),(16694,7,0,0),(16695,7,0,0),(16696,7,0,0),(16697,7,0,0),(16698,7,0,0),(16699,7,0,0),(16700,7,0,0),(16701,7,0,0),(16702,7,0,0),(16703,7,0,0),(16704,7,0,0),(16705,7,0,0),(16706,7,0,0),(16707,7,0,0),(16708,7,0,0),(16709,7,0,0),(16710,7,0,0),(16711,7,0,0),(16712,7,0,0),(16713,7,0,0),(16714,7,0,0),(16715,7,0,0),(16716,7,0,0),(16717,7,0,0),(16718,7,0,0),(16719,7,0,0),(16720,7,0,0),(16721,7,0,0),(16722,7,0,0),(16723,7,0,0),(16724,7,0,0),(16725,7,0,0),(16726,7,0,0),(16727,7,0,0),(16728,7,0,0),(16729,7,0,0),(16730,7,0,0),(16731,7,0,0),(16732,7,0,0),(16733,7,0,0),(16734,7,0,0),(16735,7,0,0),(16736,7,0,0),(16737,7,0,0),(16738,7,0,0),(16739,7,0,0),(16740,7,0,0),(16741,7,0,0),(16742,7,0,0),(16743,7,0,0),(16744,7,0,0),(16745,7,0,0),(16746,7,0,0),(16747,7,0,0),(16748,7,0,0),(16749,7,0,0),(16750,7,0,0),(16751,7,0,0),(16752,7,0,0),(16753,7,0,0),(16754,7,0,0),(16755,7,0,0),(16756,7,0,0),(16757,7,0,0),(16758,7,0,0),(16759,7,0,0),(16760,7,0,0),(16761,7,0,0),(16762,7,0,0),(16763,7,0,0),(16764,7,0,0),(16765,7,0,0),(17170,7,0,0),(17171,7,0,0),(17172,7,0,0),(17173,7,0,0),(17174,7,0,0),(17175,7,0,0),(17176,7,0,0),(17177,7,0,0),(17178,7,0,0),(17179,7,0,0),(17180,7,0,0),(17181,7,0,0),(17182,7,0,0),(17183,7,0,0),(17184,7,0,0),(17185,7,0,0),(17186,7,0,0),(17187,7,0,0),(17188,7,0,0),(17189,7,0,0),(17190,7,0,0),(17191,7,0,0),(17192,7,0,0),(17193,7,0,0),(17194,7,0,0),(17195,7,0,0),(17196,7,0,0),(17197,7,0,0),(17198,7,0,0),(17199,7,0,0),(17200,7,0,0),(17201,7,0,0),(17202,7,0,0),(17203,7,0,0),(17204,7,0,0),(17205,7,0,0),(17206,7,0,0),(17207,7,0,0),(17208,7,0,0),(17209,7,0,0),(17210,7,0,0),(17211,7,0,0),(17212,7,0,0),(17213,7,0,0),(17214,7,0,0),(17215,7,0,0),(17216,7,0,0),(17217,7,0,0),(17218,7,0,0),(17219,7,0,0),(17220,7,0,0),(17221,7,0,0),(17222,7,0,0),(17223,7,0,0),(17224,7,0,0),(17225,7,0,0),(17226,7,0,0),(17227,7,0,0),(17228,7,0,0),(17229,7,0,0),(17230,7,0,0),(17231,7,0,0),(17232,7,0,0),(17233,7,0,0),(17234,7,0,0),(17235,7,0,0),(17236,7,0,0),(17237,7,0,0),(17238,7,0,0),(17239,7,0,0),(17240,7,0,0),(17241,7,0,0),(17242,7,0,0),(17243,7,0,0),(17244,7,0,0),(17245,7,0,0),(17246,7,0,0),(17247,7,0,0),(17248,7,0,0),(17249,7,0,0),(17250,7,0,0),(17251,7,0,0),(17252,7,0,0),(17258,2,0,0),(17259,2,0,0),(18585,2,0,0),(18586,2,0,0),(18587,2,0,0),(18588,2,0,0),(18601,2,0,0),(18602,2,0,0),(18603,2,0,0),(18604,2,0,0);
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
  `constraint_type` int(11) DEFAULT NULL,
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
INSERT INTO `task` VALUES (6565,1,1,'2011-04-11',NULL,0,NULL,NULL),(5555,1,1,'2011-08-05',NULL,0,NULL,5),(3636,1,1,'2011-01-05',NULL,0,NULL,5),(6566,1,2,'2011-03-28',NULL,0,NULL,NULL),(6567,1,1,'2011-04-19',NULL,0,NULL,NULL),(6569,1,1,'2011-11-02',NULL,0,NULL,5),(6570,1,1,'2012-01-13',NULL,1,NULL,5),(6571,1,1,'2011-10-12',NULL,0,NULL,5),(6572,1,1,'2011-12-14',NULL,0,NULL,5),(6573,1,1,'2012-01-13',NULL,0,NULL,5),(6575,1,1,'2012-02-03',NULL,0,NULL,5),(6576,1,1,'2012-02-24',NULL,0,NULL,5),(8989,1,0,NULL,NULL,0,NULL,NULL),(8990,1,0,NULL,NULL,0,NULL,NULL),(10302,1,0,NULL,NULL,0,NULL,NULL),(12120,1,0,NULL,NULL,0,NULL,NULL),(13029,1,0,NULL,NULL,0,NULL,NULL),(13030,1,0,NULL,NULL,0,NULL,NULL),(13031,1,0,NULL,NULL,1,NULL,NULL),(13032,1,0,NULL,NULL,0,NULL,NULL),(13033,1,0,NULL,NULL,0,NULL,NULL),(13034,1,0,NULL,NULL,0,NULL,NULL),(13035,1,0,NULL,NULL,0,NULL,NULL),(13036,1,0,NULL,NULL,0,NULL,NULL),(13037,1,0,NULL,NULL,0,NULL,NULL),(14140,1,0,NULL,NULL,0,NULL,NULL),(14141,1,0,NULL,NULL,0,NULL,NULL),(14142,1,0,NULL,NULL,0,NULL,NULL),(14143,1,0,NULL,NULL,0,NULL,NULL),(14144,1,0,NULL,NULL,0,NULL,NULL),(14145,1,0,NULL,NULL,0,NULL,NULL),(14146,1,0,NULL,NULL,0,NULL,NULL),(14147,1,0,NULL,NULL,0,NULL,NULL),(14148,1,0,NULL,NULL,0,NULL,NULL),(14151,1,0,NULL,NULL,0,NULL,NULL),(14152,1,0,NULL,NULL,0,NULL,NULL),(14153,1,0,NULL,NULL,0,NULL,NULL),(14154,1,0,NULL,NULL,0,NULL,NULL),(14155,1,0,NULL,NULL,0,NULL,NULL),(14156,1,0,NULL,NULL,0,NULL,NULL),(14157,1,0,NULL,NULL,0,NULL,NULL),(14158,1,0,NULL,NULL,0,NULL,NULL),(14159,1,0,NULL,NULL,0,NULL,NULL),(14161,1,0,NULL,NULL,0,NULL,NULL),(14162,1,0,NULL,NULL,0,NULL,NULL),(14163,1,0,NULL,NULL,0,NULL,NULL),(14164,1,0,NULL,NULL,0,NULL,NULL),(14165,1,0,NULL,NULL,0,NULL,NULL),(14166,1,0,NULL,NULL,0,NULL,NULL),(14167,1,0,NULL,NULL,0,NULL,NULL),(14168,1,0,NULL,NULL,0,NULL,NULL),(14169,1,0,NULL,NULL,0,NULL,NULL),(14171,1,0,NULL,NULL,0,NULL,NULL),(14172,1,0,NULL,NULL,0,NULL,NULL),(14173,1,0,NULL,NULL,0,NULL,NULL),(14174,1,0,NULL,NULL,0,NULL,NULL),(14175,1,0,NULL,NULL,0,NULL,NULL),(14176,1,0,NULL,NULL,0,NULL,NULL),(14177,1,0,NULL,NULL,0,NULL,NULL),(14178,1,0,NULL,NULL,0,NULL,NULL),(14179,1,0,NULL,NULL,0,NULL,NULL),(14181,1,0,NULL,NULL,0,NULL,NULL),(14182,1,0,NULL,NULL,0,NULL,NULL),(14183,1,0,NULL,NULL,0,NULL,NULL),(14184,1,0,NULL,NULL,0,NULL,NULL),(14185,1,0,NULL,NULL,0,NULL,NULL),(14186,1,0,NULL,NULL,0,NULL,NULL),(14187,1,0,NULL,NULL,0,NULL,NULL),(14188,1,0,NULL,NULL,0,NULL,NULL),(14189,1,0,NULL,NULL,0,NULL,NULL),(14191,1,0,NULL,NULL,0,NULL,NULL),(14192,1,0,NULL,NULL,0,NULL,NULL),(14193,1,0,NULL,NULL,0,NULL,NULL),(14194,1,0,NULL,NULL,0,NULL,NULL),(14195,1,0,NULL,NULL,0,NULL,NULL),(14196,1,0,NULL,NULL,0,NULL,NULL),(14197,1,0,NULL,NULL,0,NULL,NULL),(14198,1,0,NULL,NULL,0,NULL,NULL),(14199,1,0,NULL,NULL,0,NULL,NULL),(14201,1,0,NULL,NULL,0,NULL,NULL),(14202,1,0,NULL,NULL,0,NULL,NULL),(14203,1,0,NULL,NULL,0,NULL,NULL),(14204,1,0,NULL,NULL,0,NULL,NULL),(14205,1,0,NULL,NULL,0,NULL,NULL),(14206,1,0,NULL,NULL,0,NULL,NULL),(14207,1,0,NULL,NULL,0,NULL,NULL),(14208,1,0,NULL,NULL,0,NULL,NULL),(14209,1,0,NULL,NULL,0,NULL,NULL),(14211,1,0,NULL,NULL,0,NULL,NULL),(14212,1,0,NULL,NULL,0,NULL,NULL),(14213,1,0,NULL,NULL,0,NULL,NULL),(14214,1,0,NULL,NULL,0,NULL,NULL),(14215,1,0,NULL,NULL,0,NULL,NULL),(14216,1,0,NULL,NULL,0,NULL,NULL),(14217,1,0,NULL,NULL,0,NULL,NULL),(14218,1,0,NULL,NULL,0,NULL,NULL),(14219,1,0,NULL,NULL,0,NULL,NULL),(14221,1,0,NULL,NULL,0,NULL,NULL),(14222,1,0,NULL,NULL,0,NULL,NULL),(14223,1,0,NULL,NULL,0,NULL,NULL),(14224,1,0,NULL,NULL,0,NULL,NULL),(14225,1,0,NULL,NULL,0,NULL,NULL),(14226,1,0,NULL,NULL,0,NULL,NULL),(14227,1,0,NULL,NULL,0,NULL,NULL),(14228,1,0,NULL,NULL,0,NULL,NULL),(14229,1,0,NULL,NULL,0,NULL,NULL),(14231,1,0,NULL,NULL,0,NULL,NULL),(14232,1,0,NULL,NULL,0,NULL,NULL),(14233,1,0,NULL,NULL,0,NULL,NULL),(14234,1,0,NULL,NULL,0,NULL,NULL),(14235,1,0,NULL,NULL,0,NULL,NULL),(14236,1,0,NULL,NULL,0,NULL,NULL),(14237,1,0,NULL,NULL,0,NULL,NULL),(14238,1,0,NULL,NULL,0,NULL,NULL),(14239,1,0,NULL,NULL,0,NULL,NULL),(17473,1,0,NULL,NULL,0,NULL,NULL),(17474,1,0,NULL,NULL,0,NULL,NULL),(17475,1,0,NULL,NULL,0,NULL,NULL),(17476,1,0,NULL,NULL,0,NULL,NULL),(17477,1,0,NULL,NULL,0,NULL,NULL),(17478,1,0,NULL,NULL,0,NULL,NULL),(17479,1,0,NULL,NULL,0,NULL,NULL),(17480,1,0,NULL,NULL,0,NULL,NULL),(17481,1,0,NULL,NULL,0,NULL,NULL),(17483,1,0,NULL,NULL,0,NULL,NULL),(17484,1,0,NULL,NULL,0,NULL,NULL),(17485,1,0,NULL,NULL,0,NULL,NULL),(17486,1,0,NULL,NULL,0,NULL,NULL),(17487,1,0,NULL,NULL,0,NULL,NULL),(17488,1,0,NULL,NULL,0,NULL,NULL),(17489,1,0,NULL,NULL,0,NULL,NULL),(17490,1,0,NULL,NULL,0,NULL,NULL),(17491,1,0,NULL,NULL,0,NULL,NULL),(17493,1,0,NULL,NULL,0,NULL,NULL),(17494,1,0,NULL,NULL,0,NULL,NULL),(17495,1,0,NULL,NULL,0,NULL,NULL),(17496,1,0,NULL,NULL,0,NULL,NULL),(17497,1,0,NULL,NULL,0,NULL,NULL),(17498,1,0,NULL,NULL,0,NULL,NULL),(17499,1,0,NULL,NULL,0,NULL,NULL),(17500,1,0,NULL,NULL,0,NULL,NULL),(17501,1,0,NULL,NULL,0,NULL,NULL),(17503,1,0,NULL,NULL,0,NULL,NULL),(17504,1,0,NULL,NULL,0,NULL,NULL),(17505,1,0,NULL,NULL,0,NULL,NULL),(17506,1,0,NULL,NULL,0,NULL,NULL),(17507,1,0,NULL,NULL,0,NULL,NULL),(17508,1,0,NULL,NULL,0,NULL,NULL),(17509,1,0,NULL,NULL,0,NULL,NULL),(17510,1,0,NULL,NULL,0,NULL,NULL),(17511,1,0,NULL,NULL,0,NULL,NULL),(17513,1,0,NULL,NULL,0,NULL,NULL),(17514,1,0,NULL,NULL,0,NULL,NULL),(17515,1,0,NULL,NULL,0,NULL,NULL),(17516,1,0,NULL,NULL,0,NULL,NULL),(17517,1,0,NULL,NULL,0,NULL,NULL),(17518,1,0,NULL,NULL,0,NULL,NULL),(17519,1,0,NULL,NULL,0,NULL,NULL),(17520,1,0,NULL,NULL,0,NULL,NULL),(17521,1,0,NULL,NULL,0,NULL,NULL),(17523,1,0,NULL,NULL,0,NULL,NULL),(17524,1,0,NULL,NULL,0,NULL,NULL),(17525,1,0,NULL,NULL,0,NULL,NULL),(17526,1,0,NULL,NULL,0,NULL,NULL),(17527,1,0,NULL,NULL,0,NULL,NULL),(17528,1,0,NULL,NULL,0,NULL,NULL),(17529,1,0,NULL,NULL,0,NULL,NULL),(17530,1,0,NULL,NULL,0,NULL,NULL),(17531,1,0,NULL,NULL,0,NULL,NULL),(17533,1,0,NULL,NULL,0,NULL,NULL),(17534,1,0,NULL,NULL,0,NULL,NULL),(17535,1,0,NULL,NULL,0,NULL,NULL),(17536,1,0,NULL,NULL,0,NULL,NULL),(17537,1,0,NULL,NULL,0,NULL,NULL),(17538,1,0,NULL,NULL,0,NULL,NULL),(17539,1,0,NULL,NULL,0,NULL,NULL),(17540,1,0,NULL,NULL,0,NULL,NULL),(17541,1,0,NULL,NULL,0,NULL,NULL),(17543,1,0,NULL,NULL,0,NULL,NULL),(17544,1,0,NULL,NULL,0,NULL,NULL),(17545,1,0,NULL,NULL,0,NULL,NULL),(17546,1,0,NULL,NULL,0,NULL,NULL),(17547,1,0,NULL,NULL,0,NULL,NULL),(17548,1,0,NULL,NULL,0,NULL,NULL),(17549,1,0,NULL,NULL,0,NULL,NULL),(17550,1,0,NULL,NULL,0,NULL,NULL),(17551,1,0,NULL,NULL,0,NULL,NULL),(17553,1,0,NULL,NULL,0,NULL,NULL),(17554,1,0,NULL,NULL,0,NULL,NULL),(17555,1,0,NULL,NULL,0,NULL,NULL),(17556,1,0,NULL,NULL,0,NULL,NULL),(17557,1,0,NULL,NULL,0,NULL,NULL),(17558,1,0,NULL,NULL,0,NULL,NULL),(17559,1,0,NULL,NULL,0,NULL,NULL),(17560,1,0,NULL,NULL,0,NULL,NULL),(17561,1,0,NULL,NULL,0,NULL,NULL),(17563,1,0,NULL,NULL,0,NULL,NULL),(17564,1,0,NULL,NULL,0,NULL,NULL),(17565,1,0,NULL,NULL,0,NULL,NULL),(17566,1,0,NULL,NULL,0,NULL,NULL),(17567,1,0,NULL,NULL,0,NULL,NULL),(17568,1,0,NULL,NULL,0,NULL,NULL),(17569,1,0,NULL,NULL,0,NULL,NULL),(17570,1,0,NULL,NULL,0,NULL,NULL),(17571,1,0,NULL,NULL,0,NULL,NULL),(17573,1,0,NULL,NULL,0,NULL,NULL),(17574,1,0,NULL,NULL,0,NULL,NULL),(17575,1,0,NULL,NULL,0,NULL,NULL),(17576,1,0,NULL,NULL,0,NULL,NULL),(17577,1,0,NULL,NULL,0,NULL,NULL),(17578,1,0,NULL,NULL,0,NULL,NULL),(17579,1,0,NULL,NULL,0,NULL,NULL),(17580,1,0,NULL,NULL,0,NULL,NULL),(17581,1,0,NULL,NULL,0,NULL,NULL),(17583,1,0,NULL,NULL,0,NULL,NULL),(17584,1,0,NULL,NULL,0,NULL,NULL),(17585,1,0,NULL,NULL,0,NULL,NULL),(17586,1,0,NULL,NULL,0,NULL,NULL),(17587,1,0,NULL,NULL,0,NULL,NULL),(17588,1,0,NULL,NULL,0,NULL,NULL),(17589,1,0,NULL,NULL,0,NULL,NULL),(17590,1,0,NULL,NULL,0,NULL,NULL),(17591,1,0,NULL,NULL,0,NULL,NULL),(17594,1,0,NULL,NULL,0,NULL,NULL),(17596,1,0,NULL,NULL,0,NULL,NULL),(17597,1,0,NULL,NULL,0,NULL,NULL),(17598,1,0,NULL,NULL,0,NULL,NULL),(17600,1,0,NULL,NULL,0,NULL,NULL),(17601,1,0,NULL,NULL,0,NULL,NULL),(17602,1,0,NULL,NULL,0,NULL,NULL);
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
INSERT INTO `task_element` VALUES (6565,10,'Task1',NULL,'2011-04-11',0,'2011-05-05',21600,NULL,'0.0000',150,6568,NULL,0),(3637,6,'elem',NULL,'2011-01-05',0,'2011-01-27',0,'2011-01-20','0.0000',1200,NULL,NULL,NULL),(5556,5,'other',NULL,'2011-05-01',0,'2011-07-27',0,NULL,'0.0000',500,NULL,NULL,NULL),(5555,5,'other',NULL,'2011-08-05',0,'2011-11-02',0,NULL,'0.0000',500,5556,NULL,0),(3636,5,'Elem',NULL,'2011-01-05',0,'2011-08-05',0,NULL,'0.0000',1200,3637,NULL,0),(6566,10,'Task2',NULL,'2011-03-28',0,'2011-04-13',14400,NULL,'0.0000',0,6568,NULL,1),(6567,11,'Task3',NULL,'2011-04-19',0,'2011-05-09',28800,NULL,'0.0000',0,6568,NULL,2),(6568,13,'Dependencies',NULL,'2011-03-28',0,'2011-05-09',0,'2011-01-22','0.0000',150,NULL,NULL,NULL),(6569,8,'Elem1',NULL,'2011-11-02',0,'2011-11-23',0,NULL,'0.0000',0,6577,NULL,0),(6570,8,'Elem2',NULL,'2012-02-03',0,'2012-02-24',0,NULL,'0.0000',0,6577,NULL,1),(6571,9,'Elem3',NULL,'2011-10-12',0,'2011-11-01',0,NULL,'0.0000',120,6577,NULL,2),(6572,8,'Elem5',NULL,'2011-12-14',0,'2012-01-13',0,NULL,'0.0000',0,6574,NULL,0),(6573,8,'Elem6',NULL,'2012-01-13',0,'2012-02-03',0,NULL,'0.0000',0,6574,NULL,1),(6574,10,'Elem4',NULL,'2011-12-14',0,'2012-02-03',0,NULL,'0.0000',0,6577,NULL,4),(6575,8,'Elem7',NULL,'2012-02-03',0,'2012-02-24',0,NULL,'0.0000',0,6577,NULL,5),(6576,8,'Elem8',NULL,'2012-02-24',0,'2012-03-13',0,NULL,'0.0000',0,6577,NULL,6),(6577,21,'Limiting',NULL,'2011-10-12',0,'2012-03-13',0,'2011-11-10','0.0000',120,NULL,NULL,NULL),(8990,3,'Next',NULL,'2011-01-12',0,'2011-02-08',21600,NULL,'0.0000',0,8991,NULL,1),(8989,3,'Previous',NULL,'2011-01-12',0,'2011-02-08',21600,NULL,'0.0000',0,8991,NULL,0),(8991,5,'Simple project',NULL,'2011-01-12',0,'2011-02-09',7200,'2011-01-21','0.0000',0,NULL,NULL,NULL),(10302,4,'Elemento',NULL,'2011-04-19',0,'2011-05-09',28800,NULL,'0.0000',0,6568,NULL,3),(12120,2,'Requirements',NULL,'2011-01-12',0,'2011-02-09',7200,NULL,'0.0000',0,8991,NULL,2),(13029,2,'Task 1',NULL,'2010-09-15',0,'2010-10-01',14400,NULL,'0.0000',0,13039,NULL,0),(13030,2,'Task 2',NULL,'2010-10-01',14400,'2010-10-28',7200,NULL,'0.0000',0,13039,NULL,1),(13031,2,'Task 3',NULL,'2010-09-23',7200,'2010-10-28',7200,NULL,'0.0000',0,13039,NULL,2),(13032,2,'Task 4',NULL,'2010-09-15',0,'2010-11-05',14400,NULL,'0.0000',0,13039,NULL,3),(13033,2,'Task 5.1',NULL,'2010-09-15',0,'2010-09-23',7200,NULL,'0.0000',0,13038,NULL,0),(13034,2,'Task 5.2',NULL,'2010-09-23',7200,'2010-10-11',21600,NULL,'0.0000',0,13038,NULL,1),(13035,2,'Task 5.3',NULL,'2010-10-11',21600,'2010-11-05',14400,NULL,'0.0000',0,13038,NULL,2),(13036,2,'Task 5.4',NULL,'2010-11-05',14400,'2010-12-10',14400,NULL,'0.0000',0,13038,NULL,3),(13037,2,'Task 5.5',NULL,'2010-10-01',14400,'2010-11-15',21600,NULL,'0.0000',0,13038,NULL,4),(13038,2,'Task 5',NULL,'2010-09-15',0,'2010-12-10',14400,NULL,'0.0000',0,13039,NULL,4),(13039,2,'Long project',NULL,'2010-09-15',0,'2010-12-10',0,'2012-01-01','0.0000',0,NULL,NULL,NULL),(14140,1,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,14149,NULL,0),(14141,1,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14149,NULL,1),(14142,1,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14149,NULL,2),(14143,1,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14149,NULL,3),(14144,1,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14149,NULL,4),(14145,1,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14149,NULL,5),(14146,1,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14149,NULL,6),(14147,1,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14149,NULL,7),(14148,1,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14149,NULL,8),(14149,1,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14150,NULL,0),(14150,1,'Long project',NULL,'2011-01-21',0,'2011-03-15',14400,'2012-05-08','0.0000',0,NULL,NULL,NULL),(14151,7,'Task 1',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',100,17593,NULL,0),(14152,7,'Task 2',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',150,17593,NULL,1),(14153,7,'Task 3',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17593,NULL,2),(14154,7,'Task 4',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,3),(14155,7,'Task 5.1',NULL,'2011-01-21',0,'2011-02-08',144,NULL,'0.0000',50,14160,NULL,0),(14156,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14160,NULL,1),(14157,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14160,NULL,2),(14158,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14160,NULL,3),(14159,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14160,NULL,4),(14160,7,'Task 5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',50,17593,NULL,4),(14161,7,'Task 5.1',NULL,'2011-03-07',7200,'2011-03-15',14400,NULL,'0.0000',0,14170,NULL,0),(14162,7,'Task 5.2',NULL,'2011-03-07',7200,'2011-03-23',21600,NULL,'0.0000',0,14170,NULL,1),(14163,7,'Task 5.3',NULL,'2011-03-07',7200,'2011-03-31',28800,NULL,'0.0000',0,14170,NULL,2),(14164,7,'Task 5.4',NULL,'2011-03-07',7200,'2011-04-11',7200,NULL,'0.0000',0,14170,NULL,3),(14165,7,'Task 5.5',NULL,'2011-03-07',7200,'2011-04-19',14400,NULL,'0.0000',0,14170,NULL,4),(14166,7,'Task 5.6',NULL,'2011-03-07',7200,'2011-03-23',21600,NULL,'0.0000',0,14170,NULL,5),(14167,7,'Task 5.7',NULL,'2011-03-07',7200,'2011-03-31',28800,NULL,'0.0000',0,14170,NULL,6),(14168,7,'Task 5.8',NULL,'2011-03-07',7200,'2011-04-11',7200,NULL,'0.0000',200,14170,NULL,7),(14169,7,'Task 5.9',NULL,'2011-03-07',7200,'2011-04-27',21600,NULL,'0.0000',0,14170,NULL,8),(14170,7,'Task 5',NULL,'2011-03-07',7200,'2011-04-27',21600,NULL,'0.0000',200,17593,NULL,5),(14171,7,'Task 5.1',NULL,'2011-04-27',21600,'2011-05-05',28800,NULL,'0.0000',0,14180,NULL,0),(14172,7,'Task 5.2',NULL,'2011-04-27',21600,'2011-05-16',7200,NULL,'0.0000',0,14180,NULL,1),(14173,7,'Task 5.3',NULL,'2011-04-27',21600,'2011-05-24',14400,NULL,'0.0000',0,14180,NULL,2),(14174,7,'Task 5.4',NULL,'2011-04-27',21600,'2011-06-01',21600,NULL,'0.0000',0,14180,NULL,3),(14175,7,'Task 5.5',NULL,'2011-04-27',21600,'2011-06-09',28800,NULL,'0.0000',0,14180,NULL,4),(14176,7,'Task 5.6',NULL,'2011-04-27',21600,'2011-05-16',7200,NULL,'0.0000',0,14180,NULL,5),(14177,7,'Task 5.7',NULL,'2011-04-27',21600,'2011-05-24',14400,NULL,'0.0000',0,14180,NULL,6),(14178,7,'Task 5.8',NULL,'2011-04-27',21600,'2011-06-01',21600,NULL,'0.0000',0,14180,NULL,7),(14179,7,'Task 5.9',NULL,'2011-04-27',21600,'2011-06-20',7200,NULL,'0.0000',0,14180,NULL,8),(14180,7,'Task 5',NULL,'2011-04-27',21600,'2011-06-20',7200,NULL,'0.0000',0,17593,NULL,6),(14181,7,'Task 5.1',NULL,'2011-04-11',7200,'2011-04-19',14400,NULL,'0.0000',0,14190,NULL,0),(14182,7,'Task 5.2',NULL,'2011-04-11',7200,'2011-04-27',21600,NULL,'0.0000',0,14190,NULL,1),(14183,7,'Task 5.3',NULL,'2011-04-11',7200,'2011-05-05',28800,NULL,'0.0000',0,14190,NULL,2),(14184,7,'Task 5.4',NULL,'2011-04-11',7200,'2011-05-16',7200,NULL,'0.0000',0,14190,NULL,3),(14185,7,'Task 5.5',NULL,'2011-04-11',7200,'2011-05-24',14400,NULL,'0.0000',0,14190,NULL,4),(14186,7,'Task 5.6',NULL,'2011-04-11',7200,'2011-04-27',21600,NULL,'0.0000',0,14190,NULL,5),(14187,7,'Task 5.7',NULL,'2011-04-11',7200,'2011-05-05',28800,NULL,'0.0000',0,14190,NULL,6),(14188,7,'Task 5.8',NULL,'2011-04-11',7200,'2011-05-16',7200,NULL,'0.0000',0,14190,NULL,7),(14189,7,'Task 5.9',NULL,'2011-04-11',7200,'2011-06-01',21600,NULL,'0.0000',0,14190,NULL,8),(14190,7,'Task 5',NULL,'2011-04-11',7200,'2011-06-01',21600,NULL,'0.0000',0,17593,NULL,7),(14191,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,14200,NULL,0),(14192,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14200,NULL,1),(14193,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14200,NULL,2),(14194,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14200,NULL,3),(14195,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14200,NULL,4),(14196,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14200,NULL,5),(14197,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14200,NULL,6),(14198,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14200,NULL,7),(14199,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14200,NULL,8),(14200,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,8),(14201,7,'Task 5.1',NULL,'2011-04-27',21600,'2011-05-05',28800,NULL,'0.0000',0,14210,NULL,0),(14202,7,'Task 5.2',NULL,'2011-04-27',21600,'2011-05-16',7200,NULL,'0.0000',0,14210,NULL,1),(14203,7,'Task 5.3',NULL,'2011-04-27',21600,'2011-05-24',14400,NULL,'0.0000',0,14210,NULL,2),(14204,7,'Task 5.4',NULL,'2011-04-27',21600,'2011-06-01',21600,NULL,'0.0000',0,14210,NULL,3),(14205,7,'Task 5.5',NULL,'2011-04-27',21600,'2011-06-09',28800,NULL,'0.0000',0,14210,NULL,4),(14206,7,'Task 5.6',NULL,'2011-04-27',21600,'2011-05-16',7200,NULL,'0.0000',0,14210,NULL,5),(14207,7,'Task 5.7',NULL,'2011-04-27',21600,'2011-05-24',14400,NULL,'0.0000',0,14210,NULL,6),(14208,7,'Task 5.8',NULL,'2011-04-27',21600,'2011-06-01',21600,NULL,'0.0000',0,14210,NULL,7),(14209,7,'Task 5.9',NULL,'2011-04-27',21600,'2011-06-20',7200,NULL,'0.0000',0,14210,NULL,8),(14210,7,'Task 5',NULL,'2011-04-27',21600,'2011-06-20',7200,NULL,'0.0000',0,17593,NULL,9),(14211,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,14220,NULL,0),(14212,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14220,NULL,1),(14213,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14220,NULL,2),(14214,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14220,NULL,3),(14215,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14220,NULL,4),(14216,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14220,NULL,5),(14217,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14220,NULL,6),(14218,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14220,NULL,7),(14219,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14220,NULL,8),(14220,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,10),(14221,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,14230,NULL,0),(14222,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14230,NULL,1),(14223,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14230,NULL,2),(14224,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14230,NULL,3),(14225,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14230,NULL,4),(14226,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14230,NULL,5),(14227,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14230,NULL,6),(14228,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14230,NULL,7),(14229,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14230,NULL,8),(14230,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,11),(14231,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,14240,NULL,0),(14232,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14240,NULL,1),(14233,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14240,NULL,2),(14234,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14240,NULL,3),(14235,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,14240,NULL,4),(14236,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,14240,NULL,5),(14237,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,14240,NULL,6),(14238,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,14240,NULL,7),(14239,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,14240,NULL,8),(14240,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,12),(17473,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17482,NULL,0),(17474,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17482,NULL,1),(17475,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17482,NULL,2),(17476,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17482,NULL,3),(17477,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17482,NULL,4),(17478,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17482,NULL,5),(17479,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17482,NULL,6),(17480,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17482,NULL,7),(17481,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17482,NULL,8),(17482,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,13),(17483,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17492,NULL,0),(17484,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17492,NULL,1),(17485,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17492,NULL,2),(17486,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17492,NULL,3),(17487,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17492,NULL,4),(17488,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17492,NULL,5),(17489,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17492,NULL,6),(17490,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17492,NULL,7),(17491,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17492,NULL,8),(17492,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,14),(17493,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17502,NULL,0),(17494,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17502,NULL,1),(17495,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17502,NULL,2),(17496,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17502,NULL,3),(17497,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17502,NULL,4),(17498,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17502,NULL,5),(17499,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17502,NULL,6),(17500,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17502,NULL,7),(17501,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17502,NULL,8),(17502,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,15),(17503,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17512,NULL,0),(17504,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17512,NULL,1),(17505,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17512,NULL,2),(17506,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17512,NULL,3),(17507,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17512,NULL,4),(17508,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17512,NULL,5),(17509,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17512,NULL,6),(17510,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17512,NULL,7),(17511,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17512,NULL,8),(17512,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,16),(17513,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17522,NULL,0),(17514,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17522,NULL,1),(17515,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17522,NULL,2),(17516,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17522,NULL,3),(17517,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17522,NULL,4),(17518,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17522,NULL,5),(17519,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17522,NULL,6),(17520,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17522,NULL,7),(17521,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17522,NULL,8),(17522,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,17),(17523,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17532,NULL,0),(17524,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17532,NULL,1),(17525,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17532,NULL,2),(17526,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17532,NULL,3),(17527,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17532,NULL,4),(17528,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17532,NULL,5),(17529,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17532,NULL,6),(17530,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17532,NULL,7),(17531,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17532,NULL,8),(17532,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,18),(17533,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17542,NULL,0),(17534,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17542,NULL,1),(17535,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17542,NULL,2),(17536,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17542,NULL,3),(17537,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17542,NULL,4),(17538,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17542,NULL,5),(17539,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17542,NULL,6),(17540,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17542,NULL,7),(17541,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17542,NULL,8),(17542,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,19),(17543,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17552,NULL,0),(17544,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17552,NULL,1),(17545,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17552,NULL,2),(17546,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17552,NULL,3),(17547,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17552,NULL,4),(17548,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17552,NULL,5),(17549,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17552,NULL,6),(17550,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17552,NULL,7),(17551,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17552,NULL,8),(17552,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,20),(17553,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17562,NULL,0),(17554,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17562,NULL,1),(17555,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17562,NULL,2),(17556,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17562,NULL,3),(17557,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17562,NULL,4),(17558,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17562,NULL,5),(17559,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17562,NULL,6),(17560,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17562,NULL,7),(17561,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17562,NULL,8),(17562,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,21),(17563,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17572,NULL,0),(17564,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17572,NULL,1),(17565,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17572,NULL,2),(17566,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17572,NULL,3),(17567,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17572,NULL,4),(17568,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17572,NULL,5),(17569,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17572,NULL,6),(17570,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17572,NULL,7),(17571,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17572,NULL,8),(17572,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,22),(17573,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17582,NULL,0),(17574,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17582,NULL,1),(17575,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17582,NULL,2),(17576,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17582,NULL,3),(17577,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17582,NULL,4),(17578,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17582,NULL,5),(17579,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17582,NULL,6),(17580,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17582,NULL,7),(17581,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17582,NULL,8),(17582,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,23),(17583,7,'Task 5.1',NULL,'2011-01-21',0,'2011-01-31',7200,NULL,'0.0000',0,17592,NULL,0),(17584,7,'Task 5.2',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17592,NULL,1),(17585,7,'Task 5.3',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17592,NULL,2),(17586,7,'Task 5.4',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17592,NULL,3),(17587,7,'Task 5.5',NULL,'2011-01-21',0,'2011-03-07',7200,NULL,'0.0000',0,17592,NULL,4),(17588,7,'Task 5.6',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17592,NULL,5),(17589,7,'Task 5.7',NULL,'2011-01-21',0,'2011-02-16',21600,NULL,'0.0000',0,17592,NULL,6),(17590,7,'Task 5.8',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17592,NULL,7),(17591,7,'Task 5.9',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17592,NULL,8),(17592,7,'Task 5',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17593,NULL,24),(17593,7,'Long project',NULL,'2011-01-21',0,'2011-06-20',0,'2012-05-08','0.0000',500,NULL,NULL,NULL),(17594,1,'temp',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,17595,NULL,0),(17595,1,'Another',NULL,'2011-01-21',0,'2011-02-08',14400,NULL,'0.0000',0,NULL,NULL,NULL),(17596,1,'Coordinacion',NULL,'2011-01-21',0,'2011-02-10',28800,NULL,'0.0000',0,17599,NULL,0),(17597,1,'Desarrollo',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17599,NULL,1),(17598,1,'Integración plantillas',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17599,NULL,2),(17599,1,'Kalandraka',NULL,'2011-01-21',0,'2011-03-15',14400,'2011-06-21','0.0000',0,NULL,NULL,NULL),(17600,1,'Coordinacion',NULL,'2011-01-21',0,'2011-02-10',28800,NULL,'0.0000',0,17603,NULL,0),(17601,1,'Desarrollo',NULL,'2011-01-21',0,'2011-02-24',28800,NULL,'0.0000',0,17603,NULL,1),(17602,1,'Integración plantillas',NULL,'2011-01-21',0,'2011-03-15',14400,NULL,'0.0000',0,17603,NULL,2),(17603,1,'Kalandraka',NULL,'2011-01-21',0,'2011-03-15',14400,'2011-06-21','0.0000',0,NULL,NULL,NULL),(18889,0,'new milestone',NULL,'2011-11-01',0,'2011-11-01',0,NULL,'0.0000',0,6577,NULL,3);
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
INSERT INTO `task_group` VALUES (3637),(5556),(6568),(6574),(6577),(8991),(13038),(13039),(14149),(14150),(14160),(14170),(14180),(14190),(14200),(14210),(14220),(14230),(14240),(17482),(17492),(17502),(17512),(17522),(17532),(17542),(17552),(17562),(17572),(17582),(17592),(17593),(17595),(17599),(17603);
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
  `constraint_type` int(11) DEFAULT NULL,
  `constraint_date` date DEFAULT NULL,
  PRIMARY KEY (`task_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_milestone`
--

LOCK TABLES `task_milestone` WRITE;
/*!40000 ALTER TABLE `task_milestone` DISABLE KEYS */;
INSERT INTO `task_milestone` VALUES (18889,0,NULL);
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
INSERT INTO `task_source` VALUES (5555,1,5158),(3637,2,3237),(3636,3,3238),(5556,1,5157),(6565,7,6203),(6566,7,6204),(6567,7,6205),(6568,4,6202),(6569,1,6226),(6570,1,6227),(6571,1,6228),(6572,1,6230),(6573,1,6231),(6574,1,6229),(6575,1,6232),(6576,1,6233),(6577,1,6225),(8989,5,8593),(8990,5,8594),(8991,3,8592),(10302,3,10002),(12120,3,11721),(13029,1,12649),(13030,1,12650),(13031,1,12651),(13032,1,12652),(13033,1,12654),(13034,1,12655),(13035,1,12656),(13036,1,12657),(13037,1,12658),(13038,1,12653),(13039,1,12648),(14140,1,13873),(14141,1,13874),(14142,1,13875),(14143,1,13876),(14144,1,13877),(14145,1,13878),(14146,1,13879),(14147,1,13880),(14148,1,13881),(14149,1,13872),(14150,1,13871),(14151,1,16336),(14152,1,16337),(14153,1,16338),(14154,1,16339),(14155,1,16341),(14156,1,16342),(14157,1,16343),(14158,1,16344),(14159,1,16345),(14160,1,16340),(14161,1,16347),(14162,1,16348),(14163,1,16349),(14164,1,16350),(14165,1,16351),(14166,1,16352),(14167,1,16353),(14168,1,16354),(14169,1,16355),(14170,1,16346),(14171,1,16357),(14172,1,16358),(14173,1,16359),(14174,1,16360),(14175,1,16361),(14176,1,16766),(14177,1,16767),(14178,1,16768),(14179,1,16769),(14180,1,16356),(14181,1,16771),(14182,1,16772),(14183,1,16773),(14184,1,16774),(14185,1,16775),(14186,1,16776),(14187,1,16777),(14188,1,16778),(14189,1,16779),(14190,1,16770),(14191,1,16781),(14192,1,16782),(14193,1,16783),(14194,1,16784),(14195,1,16785),(14196,1,16786),(14197,1,16787),(14198,1,16788),(14199,1,16789),(14200,1,16780),(14201,1,16791),(14202,1,16792),(14203,1,16793),(14204,1,16794),(14205,1,16795),(14206,1,16796),(14207,1,16797),(14208,1,16798),(14209,1,16799),(14210,1,16790),(14211,1,16801),(14212,1,16802),(14213,1,16803),(14214,1,16804),(14215,1,16805),(14216,1,16806),(14217,1,16807),(14218,1,16808),(14219,1,16809),(14220,1,16800),(14221,1,16811),(14222,1,16812),(14223,1,16813),(14224,1,16814),(14225,1,16815),(14226,1,16816),(14227,1,16817),(14228,1,16818),(14229,1,16819),(14230,1,16810),(14231,1,16821),(14232,1,16822),(14233,1,16823),(14234,1,16824),(14235,1,16825),(14236,1,16826),(14237,1,16827),(14238,1,16828),(14239,1,16829),(14240,1,16820),(17473,1,16831),(17474,1,16832),(17475,1,16833),(17476,1,16834),(17477,1,16835),(17478,1,16836),(17479,1,16837),(17480,1,16838),(17481,1,16839),(17482,1,16830),(17483,1,16841),(17484,1,16842),(17485,1,16843),(17486,1,16844),(17487,1,16845),(17488,1,16846),(17489,1,16847),(17490,1,16848),(17491,1,16849),(17492,1,16840),(17493,1,16851),(17494,1,16852),(17495,1,16853),(17496,1,16854),(17497,1,16855),(17498,1,16856),(17499,1,16857),(17500,1,16858),(17501,1,16859),(17502,1,16850),(17503,1,16861),(17504,1,16862),(17505,1,16863),(17506,1,16864),(17507,1,16865),(17508,1,16866),(17509,1,17271),(17510,1,17272),(17511,1,17273),(17512,1,16860),(17513,1,17275),(17514,1,17276),(17515,1,17277),(17516,1,17278),(17517,1,17279),(17518,1,17280),(17519,1,17281),(17520,1,17282),(17521,1,17283),(17522,1,17274),(17523,1,17285),(17524,1,17286),(17525,1,17287),(17526,1,17288),(17527,1,17289),(17528,1,17290),(17529,1,17291),(17530,1,17292),(17531,1,17293),(17532,1,17284),(17533,1,17295),(17534,1,17296),(17535,1,17297),(17536,1,17298),(17537,1,17299),(17538,1,17300),(17539,1,17301),(17540,1,17302),(17541,1,17303),(17542,1,17294),(17543,1,17305),(17544,1,17306),(17545,1,17307),(17546,1,17308),(17547,1,17309),(17548,1,17310),(17549,1,17311),(17550,1,17312),(17551,1,17313),(17552,1,17304),(17553,1,17315),(17554,1,17316),(17555,1,17317),(17556,1,17318),(17557,1,17319),(17558,1,17320),(17559,1,17321),(17560,1,17322),(17561,1,17323),(17562,1,17314),(17563,1,17325),(17564,1,17326),(17565,1,17327),(17566,1,17328),(17567,1,17329),(17568,1,17330),(17569,1,17331),(17570,1,17332),(17571,1,17333),(17572,1,17324),(17573,1,17335),(17574,1,17336),(17575,1,17337),(17576,1,17338),(17577,1,17339),(17578,1,17340),(17579,1,17341),(17580,1,17342),(17581,1,17343),(17582,1,17334),(17583,1,17345),(17584,1,17346),(17585,1,17347),(17586,1,17348),(17587,1,17349),(17588,1,17350),(17589,1,17351),(17590,1,17352),(17591,1,17353),(17592,1,17344),(17593,1,16335),(17594,1,17360),(17595,1,17359),(17596,1,18687),(17597,1,18688),(17598,1,18689),(17599,1,18686),(17600,1,18703),(17601,1,18704),(17602,1,18705),(17603,1,18702);
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
INSERT INTO `task_source_hours_groups` VALUES (3636,3436),(5555,5355),(6565,6393),(6566,6394),(6567,6395),(6569,6410),(6570,6411),(6571,6412),(6572,6413),(6573,6414),(6575,6415),(6576,6416),(8989,8791),(8990,8792),(10302,10103),(12120,11825),(12120,11826),(13029,12845),(13030,12846),(13031,12847),(13032,12848),(13033,12849),(13034,12850),(13035,12851),(13036,12852),(13037,12853),(14140,13597),(14141,13598),(14142,13599),(14143,13600),(14144,13601),(14145,13602),(14146,13603),(14147,13604),(14148,13605),(14151,16049),(14152,16050),(14153,16051),(14154,16052),(14155,16053),(14156,16054),(14157,16055),(14158,16056),(14159,16057),(14161,16058),(14162,16463),(14163,16464),(14164,16465),(14165,16466),(14166,16467),(14167,16468),(14168,16469),(14169,16470),(14171,16471),(14172,16472),(14173,16473),(14174,16474),(14175,16475),(14176,16476),(14177,16477),(14178,16478),(14179,16479),(14181,16480),(14182,16481),(14183,16482),(14184,16483),(14185,16484),(14186,16485),(14187,16486),(14188,16487),(14189,16488),(14191,16489),(14192,16490),(14193,16491),(14194,16492),(14195,16493),(14196,16494),(14197,16495),(14198,16496),(14199,16497),(14201,16498),(14202,16499),(14203,16500),(14204,16501),(14205,16502),(14206,16503),(14207,16504),(14208,16505),(14209,16506),(14211,16507),(14212,16508),(14213,16509),(14214,16510),(14215,16511),(14216,16512),(14217,16513),(14218,16514),(14219,16515),(14221,16516),(14222,16517),(14223,16518),(14224,16519),(14225,16520),(14226,16521),(14227,16522),(14228,16523),(14229,16524),(14231,16525),(14232,16526),(14233,16527),(14234,16528),(14235,16529),(14236,16530),(14237,16531),(14238,16532),(14239,16533),(17473,16534),(17474,16535),(17475,16536),(17476,16537),(17477,16538),(17478,16539),(17479,16540),(17480,16541),(17481,16542),(17483,16543),(17484,16544),(17485,16545),(17486,16546),(17487,16547),(17488,16548),(17489,16549),(17490,16550),(17491,16551),(17493,16552),(17494,16553),(17495,16554),(17496,16555),(17497,16556),(17498,16557),(17499,16558),(17500,16559),(17501,16560),(17503,16561),(17504,16562),(17505,16563),(17506,16968),(17507,16969),(17508,16970),(17509,16971),(17510,16972),(17511,16973),(17513,16974),(17514,16975),(17515,16976),(17516,16977),(17517,16978),(17518,16979),(17519,16980),(17520,16981),(17521,16982),(17523,16983),(17524,16984),(17525,16985),(17526,16986),(17527,16987),(17528,16988),(17529,16989),(17530,16990),(17531,16991),(17533,16992),(17534,16993),(17535,16994),(17536,16995),(17537,16996),(17538,16997),(17539,16998),(17540,16999),(17541,17000),(17543,17001),(17544,17002),(17545,17003),(17546,17004),(17547,17005),(17548,17006),(17549,17007),(17550,17008),(17551,17009),(17553,17010),(17554,17011),(17555,17012),(17556,17013),(17557,17014),(17558,17015),(17559,17016),(17560,17017),(17561,17018),(17563,17019),(17564,17020),(17565,17021),(17566,17022),(17567,17023),(17568,17024),(17569,17025),(17570,17026),(17571,17027),(17573,17028),(17574,17029),(17575,17030),(17576,17031),(17577,17032),(17578,17033),(17579,17034),(17580,17035),(17581,17036),(17583,17037),(17584,17038),(17585,17039),(17586,17040),(17587,17041),(17588,17042),(17589,17043),(17590,17044),(17591,17045),(17594,17048),(17596,17058),(17597,17059),(17598,17060),(17600,18787),(17601,18788),(17602,18789);
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
INSERT INTO `user_table` VALUES (1212,4,'user','c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e',NULL,0,NULL),(1213,3,'admin','e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a',NULL,0,NULL),(1214,2,'wsreader','9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc',NULL,0,NULL),(1215,1,'wswriter','a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8',NULL,0,NULL);
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
INSERT INTO `worker` VALUES (3839,'Impresora','23423423','234234'),(7071,'Impresora 2','Impresora','123'),(17676,'Lorenzo','Tilve','12123123R');
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

-- Dump completed on 2011-01-24 12:46:28
