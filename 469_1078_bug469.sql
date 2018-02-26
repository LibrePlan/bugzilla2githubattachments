-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: navaldev
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1

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
-- Table structure for table `ASSIGNMENT_FUNCTION`
--

DROP TABLE IF EXISTS `ASSIGNMENT_FUNCTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSIGNMENT_FUNCTION` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNMENT_FUNCTION`
--

LOCK TABLES `ASSIGNMENT_FUNCTION` WRITE;
/*!40000 ALTER TABLE `ASSIGNMENT_FUNCTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSIGNMENT_FUNCTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvanceAssignment`
--

DROP TABLE IF EXISTS `AdvanceAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvanceAssignment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `reportGlobalAdvance` bit(1) DEFAULT NULL,
  `ADVANCE_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK808010CFB216ED4C` (`ADVANCE_TYPE_ID`),
  CONSTRAINT `FK808010CFB216ED4C` FOREIGN KEY (`ADVANCE_TYPE_ID`) REFERENCES `AdvanceType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvanceAssignment`
--

LOCK TABLES `AdvanceAssignment` WRITE;
/*!40000 ALTER TABLE `AdvanceAssignment` DISABLE KEYS */;
INSERT INTO `AdvanceAssignment` VALUES (1516,7,'',707),(1517,6,'',707),(2425,4,'',707),(6566,7,'',707),(6568,6,'',707),(12222,2,'',707),(15457,4,'',707),(15458,4,'',707),(15459,4,'',707),(20707,3,'',707),(20708,3,'',707),(20710,3,'',707),(20726,2,'',707),(20730,2,'',707),(35859,5,'',707);
/*!40000 ALTER TABLE `AdvanceAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvanceAssignmentTemplate`
--

DROP TABLE IF EXISTS `AdvanceAssignmentTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvanceAssignmentTemplate` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `ADVANCE_TYPE_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  `reportGlobalAdvance` bit(1) DEFAULT NULL,
  `maxValue` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDFDB0269B216ED4C` (`ADVANCE_TYPE_ID`),
  KEY `FKDFDB026919B9DFDE` (`ORDER_ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `FKDFDB026919B9DFDE` FOREIGN KEY (`ORDER_ELEMENT_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`),
  CONSTRAINT `FKDFDB0269B216ED4C` FOREIGN KEY (`ADVANCE_TYPE_ID`) REFERENCES `AdvanceType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvanceAssignmentTemplate`
--

LOCK TABLES `AdvanceAssignmentTemplate` WRITE;
/*!40000 ALTER TABLE `AdvanceAssignmentTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvanceAssignmentTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvanceMeasurement`
--

DROP TABLE IF EXISTS `AdvanceMeasurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvanceMeasurement` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `ADVANCE_ASSIGNMENT_ID` bigint(20) DEFAULT NULL,
  `communicationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB2F91FAA9E53843` (`ADVANCE_ASSIGNMENT_ID`),
  KEY `FKBB2F91FA2F2D3AEC` (`ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FKBB2F91FA2F2D3AEC` FOREIGN KEY (`ADVANCE_ASSIGNMENT_ID`) REFERENCES `AdvanceAssignment` (`id`),
  CONSTRAINT `FKBB2F91FAA9E53843` FOREIGN KEY (`ADVANCE_ASSIGNMENT_ID`) REFERENCES `DirectAdvanceAssignment` (`ADVANCE_ASSIGNMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvanceMeasurement`
--

LOCK TABLES `AdvanceMeasurement` WRITE;
/*!40000 ALTER TABLE `AdvanceMeasurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvanceMeasurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvanceType`
--

DROP TABLE IF EXISTS `AdvanceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvanceType` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `unitName` varchar(255) DEFAULT NULL,
  `defaultMaxValue` decimal(19,4) DEFAULT NULL,
  `updatable` bit(1) DEFAULT NULL,
  `unitPrecision` decimal(19,4) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `percentage` bit(1) DEFAULT NULL,
  `qualityForm` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unitName` (`unitName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvanceType`
--

LOCK TABLES `AdvanceType` WRITE;
/*!40000 ALTER TABLE `AdvanceType` DISABLE KEYS */;
INSERT INTO `AdvanceType` VALUES (707,4,'children','100.0000','\0','0.0100','','','\0'),(708,3,'percentage','100.0000','\0','0.0100','','','\0'),(709,2,'units','2147483647.0000','\0','1.0000','','\0','\0'),(710,1,'subcontractor','100.0000','\0','0.0100','','','\0');
/*!40000 ALTER TABLE `AdvanceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BaseCalendar`
--

DROP TABLE IF EXISTS `BaseCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BaseCalendar` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BaseCalendar`
--

LOCK TABLES `BaseCalendar` WRITE;
/*!40000 ALTER TABLE `BaseCalendar` DISABLE KEYS */;
INSERT INTO `BaseCalendar` VALUES (1,1,'2e7574bb-cac9-4661-97c0-41b3b200d9a9','Default'),(2,1,'dcfe9bc5-5685-4224-a41d-ec7a5259b293',NULL),(3,1,'34638e08-9612-41e0-bb8b-7f265c93ca00',NULL),(2929,1,'f45de5ff-afc1-40b3-82fd-66e1359eca5a',NULL),(7070,2,'641493cc-a4c6-453c-8005-3413ce11b159',NULL),(16160,3,'f41e9ea2-677e-4068-bb93-2561b9ce3c3b',NULL),(16161,3,'d957aefc-ebf4-453c-a542-3f7bdbdc7e21',NULL),(20099,2,'5d4f502f-d33a-47ca-badd-e81f325c6c9a',NULL),(20100,2,'58353685-0fc0-475d-825d-dedd4c206417',NULL),(37976,2,'6982274f-12cb-497a-9b43-f08765cb766f',NULL),(37977,1,'5a99cb74-eb7e-4819-ae39-87b1ebeed94c',NULL),(37978,1,'27ed257f-0ee8-46c8-aece-3b3bced54e70',NULL),(37979,1,'fffd7c22-0c36-4b8d-83e2-c7e187b754e2',NULL);
/*!40000 ALTER TABLE `BaseCalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COST_CATEGORY`
--

DROP TABLE IF EXISTS `COST_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COST_CATEGORY` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COST_CATEGORY`
--

LOCK TABLES `COST_CATEGORY` WRITE;
/*!40000 ALTER TABLE `COST_CATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `COST_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarAvailability`
--

DROP TABLE IF EXISTS `CalendarAvailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarAvailability` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  `POSITION_IN_CALENDAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA01AABD9A44ABEE3` (`BASE_CALENDAR_ID`),
  CONSTRAINT `FKA01AABD9A44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarAvailability`
--

LOCK TABLES `CalendarAvailability` WRITE;
/*!40000 ALTER TABLE `CalendarAvailability` DISABLE KEYS */;
INSERT INTO `CalendarAvailability` VALUES (1212,1,'2010-05-12',NULL,2,0),(1213,1,'2010-05-12',NULL,3,0),(3131,1,'2010-05-12',NULL,2929,0),(7272,2,'2010-12-13','2010-12-13',7070,0),(16362,3,'2010-05-15',NULL,16160,0),(16363,3,'2011-04-29','2011-04-29',16161,0),(20301,2,'2010-05-17',NULL,20099,0),(20302,2,'2010-05-17',NULL,20100,0),(20303,2,'2011-04-30',NULL,16161,1),(20304,1,'2010-12-14',NULL,7070,1),(38178,2,'2010-05-20',NULL,37976,0),(38179,1,'2010-05-20',NULL,37977,0),(38180,1,'2010-05-20',NULL,37978,0),(38181,1,'2010-05-20',NULL,37979,0);
/*!40000 ALTER TABLE `CalendarAvailability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarData`
--

DROP TABLE IF EXISTS `CalendarData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarData` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `expiringDate` date DEFAULT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  `POSITION_IN_CALENDAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKF4BEE428A44ABEE3` (`BASE_CALENDAR_ID`),
  KEY `FKF4BEE4287FA34E3F` (`parent`),
  CONSTRAINT `FKF4BEE4287FA34E3F` FOREIGN KEY (`parent`) REFERENCES `BaseCalendar` (`id`),
  CONSTRAINT `FKF4BEE428A44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarData`
--

LOCK TABLES `CalendarData` WRITE;
/*!40000 ALTER TABLE `CalendarData` DISABLE KEYS */;
INSERT INTO `CalendarData` VALUES (101,1,'af12e2eb-64e5-4551-88a0-81b358441d78',NULL,NULL,1,0),(102,1,'9865cdc7-6751-4355-b1ac-78e7f54bd0e8',1,NULL,2,0),(103,1,'a068a2f6-abe6-4037-9f6c-2b55cb0303c5',1,NULL,3,0),(3030,1,'a8a35327-cade-4e5f-8d74-80117aa437dc',1,NULL,2929,0),(7171,2,'b8ac9cb3-0be6-47a7-84bd-30b48f457250',1,NULL,7070,0),(16261,3,'b1d1535a-ab34-48cf-b4f9-84f687385a60',1,NULL,16160,0),(16262,3,'413a42c4-769c-44ac-ae2c-d63baac9c5ca',1,NULL,16161,0),(20200,2,'34f8056d-3900-4195-847c-c25b2342a86b',1,NULL,20099,0),(20201,2,'1a9d38b9-ac55-4357-9dc2-6b8c93280080',1,NULL,20100,0),(38077,2,'983dd2b8-6341-4ea7-b704-b92f0ff2fa0b',1,NULL,37976,0),(38078,1,'c16e906f-cf79-4ea6-8c5a-db48a590bac7',1,NULL,37977,0),(38079,1,'974127d9-9471-4e60-8e4e-da5f4e2c4221',1,NULL,37978,0),(38080,1,'43b33838-c4e0-490c-86a4-41a5125b95c4',1,NULL,37979,0);
/*!40000 ALTER TABLE `CalendarData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarException`
--

DROP TABLE IF EXISTS `CalendarException`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarException` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `CALENDAR_EXCEPTION_ID` bigint(20) DEFAULT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK1A9AFA91A44ABEE3` (`BASE_CALENDAR_ID`),
  KEY `FK1A9AFA91ADAD7E51` (`CALENDAR_EXCEPTION_ID`),
  CONSTRAINT `FK1A9AFA91ADAD7E51` FOREIGN KEY (`CALENDAR_EXCEPTION_ID`) REFERENCES `CalendarExceptionType` (`id`),
  CONSTRAINT `FK1A9AFA91A44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarException`
--

LOCK TABLES `CalendarException` WRITE;
/*!40000 ALTER TABLE `CalendarException` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarException` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarExceptionType`
--

DROP TABLE IF EXISTS `CalendarExceptionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarExceptionType` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `notAssignable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarExceptionType`
--

LOCK TABLES `CalendarExceptionType` WRITE;
/*!40000 ALTER TABLE `CalendarExceptionType` DISABLE KEYS */;
INSERT INTO `CalendarExceptionType` VALUES (404,6,'HOLIDAY','HOLIDAY','red',''),(405,5,'SICK_LEAVE','SICK_LEAVE','red',''),(406,4,'LEAVE','LEAVE','red',''),(407,3,'STRIKE','STRIKE','red',''),(408,2,'BANK_HOLIDAY','BANK_HOLIDAY','red',''),(409,1,'WORKABLE_BANK_HOLIDAY','WORKABLE_BANK_HOLIDAY','orange','\0');
/*!40000 ALTER TABLE `CalendarExceptionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Configuration`
--

DROP TABLE IF EXISTS `Configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Configuration` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `CONFIGURATION_ID` bigint(20) DEFAULT NULL,
  `companyCode` varchar(255) DEFAULT NULL,
  `generateCodeForCriterion` bit(1) NOT NULL,
  `generateCodeForLabel` bit(1) NOT NULL,
  `generateCodeForWorkReport` bit(1) NOT NULL,
  `generateCodeForResources` bit(1) NOT NULL,
  `generateCodeForTypesOfWorkHours` bit(1) NOT NULL,
  `generateCodeForMaterialCategories` bit(1) NOT NULL,
  `generateCodeForUnitTypes` bit(1) NOT NULL,
  `expandCompanyPlanningViewCharts` bit(1) NOT NULL,
  `expandOrderPlanningViewCharts` bit(1) NOT NULL,
  `expandResourceLoadViewCharts` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA2D2A4D6CC119699` (`CONFIGURATION_ID`),
  CONSTRAINT `FKA2D2A4D6CC119699` FOREIGN KEY (`CONFIGURATION_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Configuration`
--

LOCK TABLES `Configuration` WRITE;
/*!40000 ALTER TABLE `Configuration` DISABLE KEYS */;
INSERT INTO `Configuration` VALUES (202,1,1,'COMPANY_CODE','\0','\0','\0','\0','\0','\0','\0','','','');
/*!40000 ALTER TABLE `Configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsolidatedValue`
--

DROP TABLE IF EXISTS `ConsolidatedValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsolidatedValue` (
  `id` bigint(20) NOT NULL,
  `CONSOLIDATED_VALUE_TYPE` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `CONSOLIDATION_ID` bigint(20) DEFAULT NULL,
  `ADVANCE_MEASUREMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF436A4163AE24FF8` (`CONSOLIDATION_ID`),
  KEY `FKF436A416CEC54333` (`CONSOLIDATION_ID`),
  KEY `FKF436A416B96BBA28` (`ADVANCE_MEASUREMENT_ID`),
  CONSTRAINT `FKF436A416B96BBA28` FOREIGN KEY (`ADVANCE_MEASUREMENT_ID`) REFERENCES `AdvanceMeasurement` (`id`),
  CONSTRAINT `FKF436A4163AE24FF8` FOREIGN KEY (`CONSOLIDATION_ID`) REFERENCES `Consolidation` (`id`),
  CONSTRAINT `FKF436A416CEC54333` FOREIGN KEY (`CONSOLIDATION_ID`) REFERENCES `Consolidation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsolidatedValue`
--

LOCK TABLES `ConsolidatedValue` WRITE;
/*!40000 ALTER TABLE `ConsolidatedValue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsolidatedValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consolidation`
--

DROP TABLE IF EXISTS `Consolidation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consolidation` (
  `id` bigint(20) NOT NULL,
  `CONSOLIDATION_TYPE` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `DIR_ADVANCE_ASSIGNMENT_ID` bigint(20) DEFAULT NULL,
  `IND_ADVANCE_ASSIGNMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF8DF3E0C9F1D6611` (`DIR_ADVANCE_ASSIGNMENT_ID`),
  KEY `FKF8DF3E0CFF2B2BA3` (`id`),
  KEY `FKF8DF3E0C430EA1DE` (`IND_ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FKF8DF3E0C430EA1DE` FOREIGN KEY (`IND_ADVANCE_ASSIGNMENT_ID`) REFERENCES `IndirectAdvanceAssignment` (`ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FKF8DF3E0C9F1D6611` FOREIGN KEY (`DIR_ADVANCE_ASSIGNMENT_ID`) REFERENCES `DirectAdvanceAssignment` (`ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FKF8DF3E0CFF2B2BA3` FOREIGN KEY (`id`) REFERENCES `Task` (`TASK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consolidation`
--

LOCK TABLES `Consolidation` WRITE;
/*!40000 ALTER TABLE `Consolidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consolidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Criterion`
--

DROP TABLE IF EXISTS `Criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Criterion` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `id_criterion_type` bigint(20) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`,`id_criterion_type`),
  KEY `FK8E542E8114A5C61` (`id_criterion_type`),
  KEY `FK8E542E813A156175` (`parent`),
  CONSTRAINT `FK8E542E813A156175` FOREIGN KEY (`parent`) REFERENCES `Criterion` (`id`),
  CONSTRAINT `FK8E542E8114A5C61` FOREIGN KEY (`id_criterion_type`) REFERENCES `CriterionType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Criterion`
--

LOCK TABLES `Criterion` WRITE;
/*!40000 ALTER TABLE `Criterion` DISABLE KEYS */;
INSERT INTO `Criterion` VALUES (606,14,'70bf9455-9dc8-44dc-b166-24cbed336b67','medicalLeave','',163840,NULL),(607,13,'b85356c3-de35-4169-b761-23a9575e15b6','paternityLeave','',163840,NULL),(608,4,'bfb05b82-1bb6-4b37-a4fc-49f7c79f2999','hiredResourceWorkingRelationship','',163844,NULL),(609,3,'7b56415a-69ab-4780-abcb-73d3b6d338f6','firedResourceWorkingRelationship','',163844,NULL),(36360,2,'0539626f-7d73-46ac-99f6-75e6fb26410e','Soldador 1ª','',163842,NULL),(36361,2,'7a4d1c18-5854-4346-9ee7-c31820a1b27c','Soldador 2ª','',163842,NULL);
/*!40000 ALTER TABLE `Criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CriterionRequirement`
--

DROP TABLE IF EXISTS `CriterionRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CriterionRequirement` (
  `id` bigint(20) NOT NULL,
  `CRITERION_REQUIREMENT_TYPE` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `HOURS_GROUP_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  `CRITERION_ID` bigint(20) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `valid` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3A79EB02E036CFED` (`HOURS_GROUP_ID`),
  KEY `FK3A79EB0261F02C44` (`CRITERION_ID`),
  KEY `FK3A79EB02EFDA874F` (`ORDER_ELEMENT_ID`),
  KEY `FK3A79EB02F41D57F2` (`parent`),
  KEY `FK3A79EB0219B9DFDE` (`ORDER_ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `FK3A79EB0219B9DFDE` FOREIGN KEY (`ORDER_ELEMENT_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`),
  CONSTRAINT `FK3A79EB0261F02C44` FOREIGN KEY (`CRITERION_ID`) REFERENCES `Criterion` (`id`),
  CONSTRAINT `FK3A79EB02E036CFED` FOREIGN KEY (`HOURS_GROUP_ID`) REFERENCES `HoursGroup` (`id`),
  CONSTRAINT `FK3A79EB02EFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FK3A79EB02F41D57F2` FOREIGN KEY (`parent`) REFERENCES `CriterionRequirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CriterionRequirement`
--

LOCK TABLES `CriterionRequirement` WRITE;
/*!40000 ALTER TABLE `CriterionRequirement` DISABLE KEYS */;
INSERT INTO `CriterionRequirement` VALUES (36468,'DIRECT',3,NULL,35765,NULL,36360,NULL,NULL),(36469,'INDIRECT',3,NULL,35764,NULL,36360,36468,''),(36470,'INDIRECT',3,35962,NULL,NULL,36360,36468,''),(36471,'INDIRECT',3,NULL,35766,NULL,36360,36468,''),(36472,'INDIRECT',3,35963,NULL,NULL,36360,36468,''),(36473,'INDIRECT',3,NULL,35767,NULL,36360,36468,''),(36474,'INDIRECT',3,35964,NULL,NULL,36360,36468,''),(36477,'DIRECT',2,NULL,35759,NULL,36361,NULL,NULL),(36478,'INDIRECT',2,35958,NULL,NULL,36361,36477,'');
/*!40000 ALTER TABLE `CriterionRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CriterionSatisfaction`
--

DROP TABLE IF EXISTS `CriterionSatisfaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CriterionSatisfaction` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `finishDate` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `criterion` bigint(20) NOT NULL,
  `resource` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK3F30D9AD8C4C676C` (`criterion`),
  KEY `FK3F30D9ADEAE850B2` (`resource`),
  CONSTRAINT `FK3F30D9ADEAE850B2` FOREIGN KEY (`resource`) REFERENCES `Resource` (`id`),
  CONSTRAINT `FK3F30D9AD8C4C676C` FOREIGN KEY (`criterion`) REFERENCES `Criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CriterionSatisfaction`
--

LOCK TABLES `CriterionSatisfaction` WRITE;
/*!40000 ALTER TABLE `CriterionSatisfaction` DISABLE KEYS */;
INSERT INTO `CriterionSatisfaction` VALUES (36562,1,'abce9576-424e-4f0f-8f0a-9ba9a5819f57','2010-05-17 18:36:45',NULL,'\0',36361,16062);
/*!40000 ALTER TABLE `CriterionSatisfaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CriterionType`
--

DROP TABLE IF EXISTS `CriterionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CriterionType` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `allowSimultaneousCriterionsPerResource` bit(1) DEFAULT NULL,
  `allowHierarchy` bit(1) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  `resource` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CriterionType`
--

LOCK TABLES `CriterionType` WRITE;
/*!40000 ALTER TABLE `CriterionType` DISABLE KEYS */;
INSERT INTO `CriterionType` VALUES (163840,15,'68d94b08-f023-4eb2-ac47-7ce157ff9028','LEAVE','Leave','\0','\0','','\0',1),(163841,11,'98394c0d-bc2e-4b5b-b144-5785742cce58','CATEGORY','Professional category','','','','\0',1),(163842,11,'7c174068-f321-425f-816e-88f2f48ade31','TRAINING','Training courses and labor training','','','','\0',1),(163843,7,'1e702d81-2ecd-4acc-be58-561b2c46da57','JOB','Job','','','','\0',1),(163844,5,'d5412f98-9241-47dd-a41a-c264ba9902e6','WORK_RELATIONSHIP','Relationship of the resource with the enterprise ','\0','\0','','\0',1),(163845,1,'89b285c3-c593-4867-b517-1f3ec72093a7','LOCATION_GROUP','Location where the resource work','','\0','','\0',0);
/*!40000 ALTER TABLE `CriterionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESCRIPTION_VALUES`
--

DROP TABLE IF EXISTS `DESCRIPTION_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESCRIPTION_VALUES` (
  `DESCRIPTION_VALUE_ID` bigint(20) NOT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `FK82CA26E5FEC79EB0` (`DESCRIPTION_VALUE_ID`),
  CONSTRAINT `FK82CA26E5FEC79EB0` FOREIGN KEY (`DESCRIPTION_VALUE_ID`) REFERENCES `WORK_REPORT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESCRIPTION_VALUES`
--

LOCK TABLES `DESCRIPTION_VALUES` WRITE;
/*!40000 ALTER TABLE `DESCRIPTION_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DESCRIPTION_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESCRIPTION_VALUES_IN_LINE`
--

DROP TABLE IF EXISTS `DESCRIPTION_VALUES_IN_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESCRIPTION_VALUES_IN_LINE` (
  `DESCRIPTION_VALUE_ID` bigint(20) NOT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `FKF2A5F7475C390C4` (`DESCRIPTION_VALUE_ID`),
  CONSTRAINT `FKF2A5F7475C390C4` FOREIGN KEY (`DESCRIPTION_VALUE_ID`) REFERENCES `WORK_REPORT_LINE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESCRIPTION_VALUES_IN_LINE`
--

LOCK TABLES `DESCRIPTION_VALUES_IN_LINE` WRITE;
/*!40000 ALTER TABLE `DESCRIPTION_VALUES_IN_LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DESCRIPTION_VALUES_IN_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependency`
--

DROP TABLE IF EXISTS `Dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependency` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `ORIGIN` bigint(20) DEFAULT NULL,
  `DESTINATION` bigint(20) DEFAULT NULL,
  `queue_dependency` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7540AF6BE6EE3F5D` (`queue_dependency`),
  KEY `FK7540AF6BE838F362` (`DESTINATION`),
  KEY `FK7540AF6B1545E7A` (`ORIGIN`),
  CONSTRAINT `FK7540AF6B1545E7A` FOREIGN KEY (`ORIGIN`) REFERENCES `TaskElement` (`id`),
  CONSTRAINT `FK7540AF6BE6EE3F5D` FOREIGN KEY (`queue_dependency`) REFERENCES `limiting_resource_queue_dependency` (`id`),
  CONSTRAINT `FK7540AF6BE838F362` FOREIGN KEY (`DESTINATION`) REFERENCES `TaskElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependency`
--

LOCK TABLES `Dependency` WRITE;
/*!40000 ALTER TABLE `Dependency` DISABLE KEYS */;
INSERT INTO `Dependency` VALUES (1507328,16,1721,1722,4747,0),(2719744,8,6776,6773,8484,0),(5668864,3,15671,15678,NULL,0),(5668865,3,15679,15680,NULL,0),(6389760,7,6774,6773,19796,0),(6389761,8,6774,6775,19797,0),(6389762,3,15662,15663,19798,0),(6389763,0,20908,20911,NULL,0),(6389764,2,5959,5960,NULL,0),(6389765,2,20915,20916,NULL,0),(6389766,1,20919,20920,NULL,0),(11763718,3,36065,36072,NULL,0),(11763719,3,36067,36065,NULL,0),(11960320,3,1717,1721,36966,0),(12091392,3,36066,36067,37370,0);
/*!40000 ALTER TABLE `Dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DerivedAllocation`
--

DROP TABLE IF EXISTS `DerivedAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DerivedAllocation` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `RESOURCE_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  `configurationUnit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3AFDC2BD75ED79BA` (`RESOURCE_ALLOCATION_ID`),
  KEY `FK3AFDC2BD87B470F0` (`configurationUnit`),
  CONSTRAINT `FK3AFDC2BD87B470F0` FOREIGN KEY (`configurationUnit`) REFERENCES `machineworkersconfigurationunit` (`id`),
  CONSTRAINT `FK3AFDC2BD75ED79BA` FOREIGN KEY (`RESOURCE_ALLOCATION_ID`) REFERENCES `ResourceAllocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DerivedAllocation`
--

LOCK TABLES `DerivedAllocation` WRITE;
/*!40000 ALTER TABLE `DerivedAllocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `DerivedAllocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DirectAdvanceAssignment`
--

DROP TABLE IF EXISTS `DirectAdvanceAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DirectAdvanceAssignment` (
  `ADVANCE_ASSIGNMENT_ID` bigint(20) NOT NULL,
  `DIRECT_ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  `maxValue` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`ADVANCE_ASSIGNMENT_ID`),
  KEY `FKFC7B7BE6A1127CE5` (`DIRECT_ORDER_ELEMENT_ID`),
  KEY `FKFC7B7BE62F2D3AEC` (`ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FKFC7B7BE62F2D3AEC` FOREIGN KEY (`ADVANCE_ASSIGNMENT_ID`) REFERENCES `AdvanceAssignment` (`id`),
  CONSTRAINT `FKFC7B7BE6A1127CE5` FOREIGN KEY (`DIRECT_ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectAdvanceAssignment`
--

LOCK TABLES `DirectAdvanceAssignment` WRITE;
/*!40000 ALTER TABLE `DirectAdvanceAssignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `DirectAdvanceAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXTERNAL_COMPANY`
--

DROP TABLE IF EXISTS `EXTERNAL_COMPANY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXTERNAL_COMPANY` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `client` bit(1) DEFAULT NULL,
  `subcontractor` bit(1) DEFAULT NULL,
  `interactsWithApplications` bit(1) DEFAULT NULL,
  `appURI` varchar(255) DEFAULT NULL,
  `ourCompanyLogin` varchar(255) DEFAULT NULL,
  `ourCompanyPassword` varchar(255) DEFAULT NULL,
  `companyUser` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nif` (`nif`),
  KEY `FKE562C7E93FEE60CC` (`companyUser`),
  CONSTRAINT `FKE562C7E93FEE60CC` FOREIGN KEY (`companyUser`) REFERENCES `NAVAL_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXTERNAL_COMPANY`
--

LOCK TABLES `EXTERNAL_COMPANY` WRITE;
/*!40000 ALTER TABLE `EXTERNAL_COMPANY` DISABLE KEYS */;
INSERT INTO `EXTERNAL_COMPANY` VALUES (7878,1,'External Company 1','13R','','','','http://localhost:8080/navalplanner-webapp/','user','pass',1010);
/*!40000 ALTER TABLE `EXTERNAL_COMPANY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HEADING_FIELD`
--

DROP TABLE IF EXISTS `HEADING_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HEADING_FIELD` (
  `HEADING_ID` bigint(20) NOT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `positionNumber` int(11) DEFAULT NULL,
  KEY `FK1961A43D415884F6` (`HEADING_ID`),
  CONSTRAINT `FK1961A43D415884F6` FOREIGN KEY (`HEADING_ID`) REFERENCES `WORK_REPORT_TYPE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HEADING_FIELD`
--

LOCK TABLES `HEADING_FIELD` WRITE;
/*!40000 ALTER TABLE `HEADING_FIELD` DISABLE KEYS */;
/*!40000 ALTER TABLE `HEADING_FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOUR_COST`
--

DROP TABLE IF EXISTS `HOUR_COST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HOUR_COST` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `priceCost` decimal(19,2) DEFAULT NULL,
  `initDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `TYPE_OF_WORK_HOURS_ID` bigint(20) DEFAULT NULL,
  `COST_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKE3758148C29AD8EB` (`COST_CATEGORY_ID`),
  KEY `FKE3758148D5B6184D` (`TYPE_OF_WORK_HOURS_ID`),
  CONSTRAINT `FKE3758148D5B6184D` FOREIGN KEY (`TYPE_OF_WORK_HOURS_ID`) REFERENCES `TYPE_OF_WORK_HOURS` (`id`),
  CONSTRAINT `FKE3758148C29AD8EB` FOREIGN KEY (`COST_CATEGORY_ID`) REFERENCES `COST_CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOUR_COST`
--

LOCK TABLES `HOUR_COST` WRITE;
/*!40000 ALTER TABLE `HOUR_COST` DISABLE KEYS */;
/*!40000 ALTER TABLE `HOUR_COST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HoursGroup`
--

DROP TABLE IF EXISTS `HoursGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HoursGroup` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `resourceType` varchar(255) DEFAULT NULL,
  `workingHours` int(11) NOT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `fixedPercentage` bit(1) DEFAULT NULL,
  `PARENT_ORDER_LINE` bigint(20) DEFAULT NULL,
  `ORDER_LINE_TEMPLATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCF1F2CD08BDC6AC6` (`ORDER_LINE_TEMPLATE`),
  KEY `FKCF1F2CD01ED629EA` (`PARENT_ORDER_LINE`),
  CONSTRAINT `FKCF1F2CD01ED629EA` FOREIGN KEY (`PARENT_ORDER_LINE`) REFERENCES `OrderLine` (`ORDERELEMENTID`),
  CONSTRAINT `FKCF1F2CD08BDC6AC6` FOREIGN KEY (`ORDER_LINE_TEMPLATE`) REFERENCES `OrderLineTemplate` (`ORDER_LINE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HoursGroup`
--

LOCK TABLES `HoursGroup` WRITE;
/*!40000 ALTER TABLE `HoursGroup` DISABLE KEYS */;
INSERT INTO `HoursGroup` VALUES (1616,7,'PREFIX-00001-00001-00001','WORKER',100,'1.00','\0',1416,NULL),(1617,7,'PREFIX-00001-00002-00001','WORKER',100,'1.00','\0',1417,NULL),(1618,6,'PREFIX-00001-00004-00001','WORKER',4,'1.00','\0',1419,NULL),(1619,6,'PREFIX-00001-00005-00001','WORKER',4,'1.00','\0',1420,NULL),(2525,4,'PREFIX-00002-00001-00001','WORKER',100,'1.00','\0',2325,NULL),(5252,3,'PREFIX-00002-00002-00001','WORKER',500,'1.00','\0',5151,NULL),(5253,3,'PREFIX-00002-00003-00001','WORKER',600,'1.00','\0',5152,NULL),(5858,5,'PREFIX-00001-00006-00001','WORKER',100,'1.00','\0',5757,NULL),(5859,5,'PREFIX-00001-00007-00001','WORKER',400,'1.00','\0',5758,NULL),(6666,7,'PREFIX-00003-00002-00001','WORKER',100,'1.00','\0',6467,NULL),(6667,7,'PREFIX-00003-00003-00001','WORKER',200,'1.00','\0',6468,NULL),(6668,7,'PREFIX-00003-00004-00001','WORKER',150,'1.00','\0',6469,NULL),(6669,6,'PREFIX-00003-00005-00001','WORKER',50,'1.00','\0',6470,NULL),(6670,6,'PREFIX-00003-00006-00001','WORKER',150,'1.00','\0',6471,NULL),(6671,6,'PREFIX-00003-00007-00001','WORKER',100,'1.00','\0',6472,NULL),(6672,6,'PREFIX-00003-00008-00001','WORKER',200,'1.00','\0',6473,NULL),(6673,6,'PREFIX-00003-00010-00001','WORKER',100,'1.00','\0',6475,NULL),(6674,6,'PREFIX-00003-00011-00001','WORKER',50,'1.00','\0',6476,NULL),(12322,2,'PREFIX-00004-00001-00001','WORKER',1200,'1.00','\0',12122,NULL),(12323,2,'PREFIX-00004-00002-00001','WORKER',200,'1.00','\0',12123,NULL),(15555,3,'PREFIX-00006-00001-00001','WORKER',200,'1.00','\0',15357,NULL),(15556,3,'PREFIX-00006-00002-00001','WORKER',5000,'1.00','\0',15358,NULL),(15557,3,'PREFIX-00006-00003-00001','WORKER',1000,'1.00','\0',15359,NULL),(15558,3,'PREFIX-00006-00004-00001','WORKER',500,'1.00','\0',15360,NULL),(15559,3,'PREFIX-00006-00005-00001','WORKER',2000,'1.00','\0',15361,NULL),(15560,4,'PREFIX-00007-00006-00001','WORKER',100,'1.00','\0',15365,NULL),(15561,4,'PREFIX-00007-00007-00001','WORKER',100,'1.00','\0',15366,NULL),(15562,4,'PREFIX-00007-00008-00001','WORKER',100,'1.00','\0',15367,NULL),(15563,4,'PREFIX-00007-00009-00001','WORKER',100,'1.00','\0',15368,NULL),(15564,4,'PREFIX-00007-00010-00001','WORKER',100,'1.00','\0',15369,NULL),(15565,4,'PREFIX-00007-00011-00001','WORKER',100,'1.00','\0',15371,NULL),(15566,4,'PREFIX-00007-00012-00001','WORKER',100,'1.00','\0',15372,NULL),(15567,4,'PREFIX-00007-00013-00001','WORKER',100,'1.00','\0',15373,NULL),(15568,4,'PREFIX-00007-00014-00001','WORKER',100,'1.00','\0',15374,NULL),(15569,4,'PREFIX-00007-00015-00001','WORKER',100,'1.00','\0',15375,NULL),(15570,4,'PREFIX-00007-00016-00001','WORKER',100,'1.00','\0',15376,NULL),(15571,4,'PREFIX-00007-00003-00001','WORKER',100,'1.00','\0',15377,NULL),(15572,4,'PREFIX-00007-00004-00001','WORKER',100,'1.00','\0',15378,NULL),(15573,4,'PREFIX-00007-00005-00001','WORKER',100,'1.00','\0',15379,NULL),(19898,3,'PREFIX-00009-00001-00001','WORKER',50,'1.00','\0',20607,NULL),(19899,3,'PREFIX-00009-00002-00001','WORKER',120,'1.00','\0',20608,NULL),(19900,3,'PREFIX-00009-00004-00001','WORKER',50,'1.00','\0',20610,NULL),(19901,3,'PREFIX-00009-00005-00001','WORKER',20,'1.00','\0',20611,NULL),(19902,3,'PREFIX-00010-00001-00001','WORKER',200,'1.00','\0',20614,NULL),(19903,3,'PREFIX-00010-00002-00001','WORKER',150,'1.00','\0',20615,NULL),(19904,3,'PREFIX-00010-00003-00001','WORKER',50,'1.00','\0',20616,NULL),(19905,3,'PREFIX-00010-00004-00001','WORKER',150,'1.00','\0',20617,NULL),(19906,2,'PREFIX-00010-00006-00001','WORKER',30,'1.00','\0',20634,NULL),(19907,2,'PREFIX-00010-00007-00001','WORKER',70,'1.00','\0',20635,NULL),(19908,2,'PREFIX-00010-00008-00001','WORKER',100,'1.00','\0',20636,NULL),(19909,2,'PREFIX-00013-00001-00001','WORKER',120,'1.00','\0',20641,NULL),(19910,2,'PREFIX-00013-00002-00001','WORKER',150,'1.00','\0',20642,NULL),(19911,2,'PREFIX-00013-00003-00001','WORKER',200,'1.00','\0',20643,NULL),(19912,2,'PREFIX-00013-00004-00001','WORKER',200,'1.00','\0',20644,NULL),(35956,8,'PREFIX-00015-00001-00001','WORKER',100,'1.00','\0',35757,NULL),(35957,8,'PREFIX-00015-00002-00001','WORKER',200,'1.00','\0',35758,NULL),(35958,8,'PREFIX-00015-00003-00001','WORKER',50,'1.00','\0',35759,NULL),(35962,6,'PREFIX-00015-00008-00001','WORKER',150,'1.00','\0',35764,NULL),(35963,5,'PREFIX-00015-00010-00001','WORKER',150,'1.00','\0',35766,NULL),(35964,5,'PREFIX-00015-00011-00001','WORKER',50,'1.00','\0',35767,NULL);
/*!40000 ALTER TABLE `HoursGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndirectAdvanceAssignment`
--

DROP TABLE IF EXISTS `IndirectAdvanceAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IndirectAdvanceAssignment` (
  `ADVANCE_ASSIGNMENT_ID` bigint(20) NOT NULL,
  `INDIRECT_ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADVANCE_ASSIGNMENT_ID`),
  KEY `FK3D1FFD218202350F` (`INDIRECT_ORDER_ELEMENT_ID`),
  KEY `FK3D1FFD21218D7620` (`INDIRECT_ORDER_ELEMENT_ID`),
  KEY `FK3D1FFD212F2D3AEC` (`ADVANCE_ASSIGNMENT_ID`),
  CONSTRAINT `FK3D1FFD212F2D3AEC` FOREIGN KEY (`ADVANCE_ASSIGNMENT_ID`) REFERENCES `AdvanceAssignment` (`id`),
  CONSTRAINT `FK3D1FFD21218D7620` FOREIGN KEY (`INDIRECT_ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FK3D1FFD218202350F` FOREIGN KEY (`INDIRECT_ORDER_ELEMENT_ID`) REFERENCES `OrderLineGroup` (`ORDERELEMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IndirectAdvanceAssignment`
--

LOCK TABLES `IndirectAdvanceAssignment` WRITE;
/*!40000 ALTER TABLE `IndirectAdvanceAssignment` DISABLE KEYS */;
INSERT INTO `IndirectAdvanceAssignment` VALUES (1516,1415),(1517,1418),(2425,2324),(6566,6466),(6568,6474),(12222,12121),(15459,15363),(15457,15364),(15458,15370),(20708,20606),(20707,20609),(20710,20613),(20726,20633),(20730,20640),(35859,35765);
/*!40000 ALTER TABLE `IndirectAdvanceAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LABEL`
--

DROP TABLE IF EXISTS `LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LABEL` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `LABEL_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`,`LABEL_TYPE_ID`),
  KEY `FK44D86D4707CD777` (`LABEL_TYPE_ID`),
  CONSTRAINT `FK44D86D4707CD777` FOREIGN KEY (`LABEL_TYPE_ID`) REFERENCES `LABEL_TYPE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LABEL`
--

LOCK TABLES `LABEL` WRITE;
/*!40000 ALTER TABLE `LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LABEL_TYPE`
--

DROP TABLE IF EXISTS `LABEL_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LABEL_TYPE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LABEL_TYPE`
--

LOCK TABLES `LABEL_TYPE` WRITE;
/*!40000 ALTER TABLE `LABEL_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LABEL_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE_FIELD`
--

DROP TABLE IF EXISTS `LINE_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINE_FIELD` (
  `HEADING_ID` bigint(20) NOT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `positionNumber` int(11) DEFAULT NULL,
  KEY `FK5C13ECCF415884F6` (`HEADING_ID`),
  CONSTRAINT `FK5C13ECCF415884F6` FOREIGN KEY (`HEADING_ID`) REFERENCES `WORK_REPORT_TYPE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE_FIELD`
--

LOCK TABLES `LINE_FIELD` WRITE;
/*!40000 ALTER TABLE `LINE_FIELD` DISABLE KEYS */;
/*!40000 ALTER TABLE `LINE_FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAL`
--

DROP TABLE IF EXISTS `MATERIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAL` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default_unit_price` decimal(19,2) DEFAULT NULL,
  `unit_type` bigint(20) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK407955279578651E` (`CATEGORY_ID`),
  KEY `FK40795527F11B2D0` (`unit_type`),
  CONSTRAINT `FK40795527F11B2D0` FOREIGN KEY (`unit_type`) REFERENCES `UNIT_TYPE` (`id`),
  CONSTRAINT `FK407955279578651E` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `MATERIAL_CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAL`
--

LOCK TABLES `MATERIAL` WRITE;
/*!40000 ALTER TABLE `MATERIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATERIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAL_ASSIGMENT`
--

DROP TABLE IF EXISTS `MATERIAL_ASSIGMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAL_ASSIGMENT` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `units` double DEFAULT NULL,
  `UNIT_PRICE` decimal(19,2) DEFAULT NULL,
  `MATERIAL_ID` bigint(20) DEFAULT NULL,
  `ESTIMATED_AVAILABILITY` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFD509405B5C68337` (`MATERIAL_ID`),
  KEY `FKFD509405EFDA874F` (`ORDER_ELEMENT_ID`),
  CONSTRAINT `FKFD509405EFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FKFD509405B5C68337` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `MATERIAL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAL_ASSIGMENT`
--

LOCK TABLES `MATERIAL_ASSIGMENT` WRITE;
/*!40000 ALTER TABLE `MATERIAL_ASSIGMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATERIAL_ASSIGMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAL_ASSIGMENT_TEMPLATE`
--

DROP TABLE IF EXISTS `MATERIAL_ASSIGMENT_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAL_ASSIGMENT_TEMPLATE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `units` double DEFAULT NULL,
  `UNIT_PRICE` decimal(19,2) DEFAULT NULL,
  `MATERIAL_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1CCB0F74B5C68337` (`MATERIAL_ID`),
  KEY `FK1CCB0F7419B9DFDE` (`ORDER_ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `FK1CCB0F7419B9DFDE` FOREIGN KEY (`ORDER_ELEMENT_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`),
  CONSTRAINT `FK1CCB0F74B5C68337` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `MATERIAL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAL_ASSIGMENT_TEMPLATE`
--

LOCK TABLES `MATERIAL_ASSIGMENT_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `MATERIAL_ASSIGMENT_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATERIAL_ASSIGMENT_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAL_CATEGORY`
--

DROP TABLE IF EXISTS `MATERIAL_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAL_CATEGORY` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK8746516B53669F2` (`PARENT_ID`),
  CONSTRAINT `FK8746516B53669F2` FOREIGN KEY (`PARENT_ID`) REFERENCES `MATERIAL_CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAL_CATEGORY`
--

LOCK TABLES `MATERIAL_CATEGORY` WRITE;
/*!40000 ALTER TABLE `MATERIAL_CATEGORY` DISABLE KEYS */;
INSERT INTO `MATERIAL_CATEGORY` VALUES (909,1,'e294e6e3-104e-47bf-8656-d82985c142f1','Imported materials without category','\0',NULL);
/*!40000 ALTER TABLE `MATERIAL_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Machine`
--

DROP TABLE IF EXISTS `Machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Machine` (
  `MACHINE_ID` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MACHINE_ID`),
  KEY `FK9469DC27937680B7` (`MACHINE_ID`),
  CONSTRAINT `FK9469DC27937680B7` FOREIGN KEY (`MACHINE_ID`) REFERENCES `Resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Machine`
--

LOCK TABLES `Machine` WRITE;
/*!40000 ALTER TABLE `Machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `Machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAVAL_PROFILE`
--

DROP TABLE IF EXISTS `NAVAL_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NAVAL_PROFILE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `profileName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profileName` (`profileName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAVAL_PROFILE`
--

LOCK TABLES `NAVAL_PROFILE` WRITE;
/*!40000 ALTER TABLE `NAVAL_PROFILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAVAL_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAVAL_USER`
--

DROP TABLE IF EXISTS `NAVAL_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NAVAL_USER` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `loginName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAVAL_USER`
--

LOCK TABLES `NAVAL_USER` WRITE;
/*!40000 ALTER TABLE `NAVAL_USER` DISABLE KEYS */;
INSERT INTO `NAVAL_USER` VALUES (1010,4,'user','c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e',NULL,'\0'),(1011,3,'admin','e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a',NULL,'\0'),(1012,2,'wsreader','9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc',NULL,'\0'),(1013,1,'wswriter','a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8',NULL,'\0');
/*!40000 ALTER TABLE `NAVAL_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_AUTHORIZATION`
--

DROP TABLE IF EXISTS `ORDER_AUTHORIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_AUTHORIZATION` (
  `id` bigint(20) NOT NULL,
  `ORDER_AUTHORIZATION_SUBCLASS` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `authorizationType` varchar(255) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `PROFILE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA87C31085567AD13` (`USER_ID`),
  KEY `FKA87C310887287288` (`ORDER_ID`),
  KEY `FKA87C3108EDC4DB41` (`PROFILE_ID`),
  CONSTRAINT `FKA87C3108EDC4DB41` FOREIGN KEY (`PROFILE_ID`) REFERENCES `NAVAL_PROFILE` (`id`),
  CONSTRAINT `FKA87C31085567AD13` FOREIGN KEY (`USER_ID`) REFERENCES `NAVAL_USER` (`id`),
  CONSTRAINT `FKA87C310887287288` FOREIGN KEY (`ORDER_ID`) REFERENCES `order_table` (`ORDERELEMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_AUTHORIZATION`
--

LOCK TABLES `ORDER_AUTHORIZATION` WRITE;
/*!40000 ALTER TABLE `ORDER_AUTHORIZATION` DISABLE KEYS */;
INSERT INTO `ORDER_AUTHORIZATION` VALUES (1818,'USER',6,'WRITE_AUTHORIZATION',1415,1011,NULL),(2727,'USER',3,'WRITE_AUTHORIZATION',2324,1011,NULL),(6868,'USER',6,'WRITE_AUTHORIZATION',6465,1011,NULL),(12524,'USER',1,'WRITE_AUTHORIZATION',12121,1011,NULL),(15757,'USER',2,'WRITE_AUTHORIZATION',15356,1011,NULL),(15758,'USER',3,'WRITE_AUTHORIZATION',15363,1011,NULL),(20806,'USER',2,'WRITE_AUTHORIZATION',20606,1011,NULL),(20807,'USER',2,'WRITE_AUTHORIZATION',20613,1011,NULL),(20808,'USER',1,'WRITE_AUTHORIZATION',20640,1011,NULL),(36158,'USER',7,'WRITE_AUTHORIZATION',35756,1011,NULL);
/*!40000 ALTER TABLE `ORDER_AUTHORIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ELEMENT_LABEL`
--

DROP TABLE IF EXISTS `ORDER_ELEMENT_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ELEMENT_LABEL` (
  `ORDER_ELEMENT_ID` bigint(20) NOT NULL,
  `LABEL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ELEMENT_ID`,`LABEL_ID`),
  KEY `FKE203860C1C2746E` (`LABEL_ID`),
  KEY `FKE203860EFDA874F` (`ORDER_ELEMENT_ID`),
  CONSTRAINT `FKE203860EFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FKE203860C1C2746E` FOREIGN KEY (`LABEL_ID`) REFERENCES `LABEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ELEMENT_LABEL`
--

LOCK TABLES `ORDER_ELEMENT_LABEL` WRITE;
/*!40000 ALTER TABLE `ORDER_ELEMENT_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ELEMENT_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ELEMENT_TEMPLATE_LABEL`
--

DROP TABLE IF EXISTS `ORDER_ELEMENT_TEMPLATE_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ELEMENT_TEMPLATE_LABEL` (
  `ORDER_ELEMENT_TEMPLATE_ID` bigint(20) NOT NULL,
  `LABEL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ELEMENT_TEMPLATE_ID`,`LABEL_ID`),
  KEY `FKA9542EC3C1C2746E` (`LABEL_ID`),
  KEY `FKA9542EC319B9DFDE` (`ORDER_ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `FKA9542EC319B9DFDE` FOREIGN KEY (`ORDER_ELEMENT_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`),
  CONSTRAINT `FKA9542EC3C1C2746E` FOREIGN KEY (`LABEL_ID`) REFERENCES `LABEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ELEMENT_TEMPLATE_LABEL`
--

LOCK TABLES `ORDER_ELEMENT_TEMPLATE_LABEL` WRITE;
/*!40000 ALTER TABLE `ORDER_ELEMENT_TEMPLATE_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ELEMENT_TEMPLATE_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM`
--

DROP TABLE IF EXISTS `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM` (
  `ORDER_ELEMENT_TEMPLATE_ID` bigint(20) NOT NULL,
  `QUALITY_FORM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ELEMENT_TEMPLATE_ID`,`QUALITY_FORM_ID`),
  KEY `FK29D001558B37665C` (`QUALITY_FORM_ID`),
  KEY `FK29D0015519B9DFDE` (`ORDER_ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `FK29D0015519B9DFDE` FOREIGN KEY (`ORDER_ELEMENT_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`),
  CONSTRAINT `FK29D001558B37665C` FOREIGN KEY (`QUALITY_FORM_ID`) REFERENCES `QUALITY_FORM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM`
--

LOCK TABLES `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM` WRITE;
/*!40000 ALTER TABLE `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ELEMENT_TEMPLATE_QUALITY_FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderElement`
--

DROP TABLE IF EXISTS `OrderElement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderElement` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `initDate` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `schedulingStateType` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `template` bigint(20) DEFAULT NULL,
  `externalCode` varchar(255) DEFAULT NULL,
  `positionInContainer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKDBBB4FEED97BCC8C` (`template`),
  KEY `FKDBBB4FEE1E635C19` (`parent`),
  CONSTRAINT `FKDBBB4FEE1E635C19` FOREIGN KEY (`parent`) REFERENCES `OrderLineGroup` (`ORDERELEMENTID`),
  CONSTRAINT `FKDBBB4FEED97BCC8C` FOREIGN KEY (`template`) REFERENCES `OrderElementTemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderElement`
--

LOCK TABLES `OrderElement` WRITE;
/*!40000 ALTER TABLE `OrderElement` DISABLE KEYS */;
INSERT INTO `OrderElement` VALUES (1415,7,'Casco de embarcación de recreo',NULL,'PREFIX-00001','2010-05-12 10:09:03','2010-06-17 00:00:00',3,NULL,NULL,NULL,NULL),(1416,7,'Task 1.1 (copy)',NULL,'PREFIX-00001-00001',NULL,NULL,0,1418,NULL,NULL,0),(1417,7,'Task 1.2',NULL,'PREFIX-00001-00002',NULL,'2010-05-28 00:00:00',0,1415,NULL,NULL,1),(1418,6,'Task 1.1',NULL,'PREFIX-00001-00003',NULL,NULL,3,1415,NULL,NULL,0),(1419,6,'Task 1.3',NULL,'PREFIX-00001-00004',NULL,NULL,0,1415,NULL,NULL,2),(1420,6,'Task 1.4',NULL,'PREFIX-00001-00005',NULL,NULL,0,1415,NULL,NULL,3),(2324,4,'Laminado moldeado Julio 2010',NULL,'PREFIX-00002','2010-05-12 10:43:45',NULL,3,NULL,NULL,NULL,NULL),(2325,4,'Task2.1',NULL,'PREFIX-00002-00001',NULL,NULL,0,2324,NULL,NULL,0),(5151,3,'Limiting1',NULL,'PREFIX-00002-00002',NULL,NULL,0,2324,NULL,NULL,1),(5152,3,'Limiting2',NULL,'PREFIX-00002-00003',NULL,NULL,0,2324,NULL,NULL,2),(5757,5,'Non limiting',NULL,'PREFIX-00001-00006',NULL,'2010-07-01 00:00:00',0,1415,NULL,NULL,4),(5758,5,'Non Limiting2',NULL,'PREFIX-00001-00007',NULL,NULL,0,1415,NULL,NULL,5),(6465,7,'Lote 5 Optimist',NULL,'PREFIX-00003','2010-06-19 00:00:00',NULL,3,NULL,NULL,NULL,NULL),(6466,7,'Tarea A',NULL,'PREFIX-00003-00001',NULL,NULL,3,6465,NULL,NULL,0),(6467,7,'Tarea A.1',NULL,'PREFIX-00003-00002',NULL,NULL,0,6466,NULL,NULL,0),(6468,7,'Tarea A.2',NULL,'PREFIX-00003-00003',NULL,NULL,0,6466,NULL,NULL,1),(6469,7,'Tarea A.3',NULL,'PREFIX-00003-00004',NULL,NULL,0,6466,NULL,NULL,2),(6470,6,'Tarea B',NULL,'PREFIX-00003-00005',NULL,NULL,0,6465,NULL,NULL,1),(6471,6,'Tarea C',NULL,'PREFIX-00003-00006',NULL,NULL,0,6465,NULL,NULL,2),(6472,6,'Tarea X',NULL,'PREFIX-00003-00007',NULL,NULL,0,6465,NULL,NULL,3),(6473,6,'Tarea Y',NULL,'PREFIX-00003-00008',NULL,NULL,0,6465,NULL,NULL,4),(6474,6,'Tarea Z',NULL,'PREFIX-00003-00009',NULL,NULL,3,6465,NULL,NULL,5),(6475,6,'Tarea Z.1',NULL,'PREFIX-00003-00010',NULL,NULL,0,6474,NULL,NULL,0),(6476,6,'Tarea Z.2',NULL,'PREFIX-00003-00011',NULL,NULL,0,6474,NULL,NULL,1),(12121,2,'Project with no allocations at all',NULL,'PREFIX-00004','2010-05-14 11:12:46',NULL,3,NULL,NULL,NULL,NULL),(12122,2,'Unnasigned1',NULL,'PREFIX-00004-00001',NULL,NULL,0,12121,NULL,NULL,0),(12123,2,'Unassigned 2',NULL,'PREFIX-00004-00002',NULL,NULL,0,12121,NULL,NULL,1),(15356,3,'Construcción barco de competición en acero',NULL,'PREFIX-00006','2010-05-15 10:10:50',NULL,3,NULL,NULL,NULL,NULL),(15357,3,'Montaje de andamios',NULL,'PREFIX-00006-00001',NULL,NULL,0,15356,NULL,NULL,0),(15358,3,'Construcción de cubierta',NULL,'PREFIX-00006-00002',NULL,NULL,0,15356,NULL,NULL,1),(15359,3,'Construcción del casco',NULL,'PREFIX-00006-00003',NULL,NULL,0,15356,NULL,NULL,2),(15360,3,'Hélices',NULL,'PREFIX-00006-00004',NULL,NULL,0,15356,NULL,NULL,3),(15361,3,'Elaboración velamen',NULL,'PREFIX-00006-00005',NULL,NULL,0,15356,NULL,NULL,4),(15363,5,'Laminado Moldeado Abril Navantia',NULL,'PREFIX-00007','2010-09-15 00:00:00',NULL,3,NULL,NULL,NULL,NULL),(15364,4,'Colocar estructura in interior 1',NULL,'PREFIX-00007-00001',NULL,NULL,3,15363,NULL,NULL,0),(15365,4,'Colocar estructura in interior 1.a1',NULL,'PREFIX-00007-00006',NULL,NULL,0,15364,NULL,NULL,0),(15366,4,'Colocar estructura in interior 1.a',NULL,'PREFIX-00007-00007',NULL,NULL,0,15364,NULL,NULL,1),(15367,4,'Colocar estructura in interior 1.b',NULL,'PREFIX-00007-00008',NULL,NULL,0,15364,NULL,NULL,2),(15368,4,'Colocar estructura in interior 1.c',NULL,'PREFIX-00007-00009',NULL,NULL,0,15364,NULL,NULL,3),(15369,4,'Colocar estructura in interior 1.d',NULL,'PREFIX-00007-00010',NULL,NULL,0,15364,NULL,NULL,4),(15370,4,'Colocar estructura in interior 2',NULL,'PREFIX-00007-00002',NULL,NULL,3,15363,NULL,NULL,1),(15371,4,'Colocar estructura in interior 2.a1',NULL,'PREFIX-00007-00011',NULL,NULL,0,15370,NULL,NULL,0),(15372,4,'Estructura interior 2.a',NULL,'PREFIX-00007-00012',NULL,NULL,0,15370,NULL,NULL,1),(15373,4,'Estructura interior 2.b',NULL,'PREFIX-00007-00013',NULL,NULL,0,15370,NULL,NULL,2),(15374,4,'Estructura interior 2.c',NULL,'PREFIX-00007-00014',NULL,NULL,0,15370,NULL,NULL,3),(15375,4,'Estructura interior 2.d',NULL,'PREFIX-00007-00015',NULL,NULL,0,15370,NULL,NULL,4),(15376,4,'Estructura interior 2.e',NULL,'PREFIX-00007-00016',NULL,NULL,0,15370,NULL,NULL,5),(15377,4,'Colocar estructura in interior 3',NULL,'PREFIX-00007-00003',NULL,NULL,0,15363,NULL,NULL,2),(15378,4,'Colocar estructura in interior 4',NULL,'PREFIX-00007-00004',NULL,NULL,0,15363,NULL,NULL,3),(15379,4,'Colocar estructura in interior 5',NULL,'PREFIX-00007-00005',NULL,NULL,0,15363,NULL,NULL,4),(20606,4,'Proxecto de soldado da cuberta',NULL,'PREFIX-00009','2010-05-17 12:40:45','2010-06-24 00:00:00',3,NULL,NULL,NULL,NULL),(20607,3,'Preparación do producto',NULL,'PREFIX-00009-00001',NULL,NULL,0,20606,NULL,NULL,0),(20608,3,'Elaboración da mezcla',NULL,'PREFIX-00009-00002',NULL,NULL,0,20606,NULL,NULL,1),(20609,3,'Aplicación na cuberta',NULL,'PREFIX-00009-00003',NULL,NULL,3,20606,NULL,NULL,2),(20610,3,'Aplicación na cuberta (copy)',NULL,'PREFIX-00009-00004',NULL,NULL,0,20609,NULL,NULL,0),(20611,3,'Aplicación nos peches',NULL,'PREFIX-00009-00005',NULL,NULL,0,20609,NULL,NULL,1),(20613,3,'Laminado moldeado',NULL,'PREFIX-00010','2010-05-17 13:35:59','2010-11-18 00:00:00',3,NULL,NULL,NULL,NULL),(20614,3,'Pegar tablillas',NULL,'PREFIX-00010-00001',NULL,NULL,0,20613,NULL,NULL,0),(20615,3,'Saturar interna y externa',NULL,'PREFIX-00010-00002',NULL,NULL,0,20613,NULL,NULL,1),(20616,3,'Colocar estructura en el interior (copy)',NULL,'PREFIX-00010-00003',NULL,NULL,0,20633,NULL,NULL,0),(20617,3,'Aplicar malla',NULL,'PREFIX-00010-00004',NULL,NULL,0,20613,NULL,NULL,3),(20633,2,'Colocar estructura en el interior',NULL,'PREFIX-00010-00005',NULL,NULL,3,20613,NULL,NULL,2),(20634,2,'Paso 1 aplicación',NULL,'PREFIX-00010-00006',NULL,NULL,0,20633,NULL,NULL,1),(20635,2,'Paso 2 aplicación',NULL,'PREFIX-00010-00007',NULL,NULL,0,20633,NULL,NULL,2),(20636,2,'Paso 3',NULL,'PREFIX-00010-00008',NULL,NULL,0,20633,NULL,NULL,3),(20640,2,'Laminado moldeado',NULL,'PREFIX-00013','2010-05-17 18:12:15','2010-11-17 00:00:00',3,NULL,NULL,NULL,NULL),(20641,2,'Pegar tablillas',NULL,'PREFIX-00013-00001',NULL,NULL,0,20640,NULL,NULL,0),(20642,2,'Saturar estructura interna',NULL,'PREFIX-00013-00002',NULL,NULL,0,20640,NULL,NULL,1),(20643,2,'Colocar estructura',NULL,'PREFIX-00013-00003',NULL,NULL,0,20640,NULL,NULL,2),(20644,2,'Aplicar malla',NULL,'PREFIX-00013-00004',NULL,NULL,0,20640,NULL,NULL,3),(35756,9,'Laminado moldeado',NULL,'PREFIX-00015','2010-05-17 18:20:27','2010-09-16 00:00:00',2,NULL,NULL,NULL,NULL),(35757,8,'Pegar tablillas',NULL,'PREFIX-00015-00001',NULL,NULL,0,35756,NULL,NULL,0),(35758,8,'Saturar interna',NULL,'PREFIX-00015-00002',NULL,NULL,4,35756,NULL,NULL,1),(35759,8,'Colocar estructura',NULL,'PREFIX-00015-00003',NULL,NULL,0,35756,NULL,NULL,2),(35764,6,'Aplicar malla (copy)',NULL,'PREFIX-00015-00008',NULL,NULL,0,35765,NULL,NULL,0),(35765,5,'Aplicar malla',NULL,'PREFIX-00015-00009',NULL,NULL,3,35756,NULL,NULL,3),(35766,5,'Tarea 1.1',NULL,'PREFIX-00015-00010',NULL,NULL,0,35765,NULL,NULL,1),(35767,5,'Tarea 1.2',NULL,'PREFIX-00015-00011',NULL,NULL,0,35765,NULL,NULL,2);
/*!40000 ALTER TABLE `OrderElement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderElementTemplate`
--

DROP TABLE IF EXISTS `OrderElementTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderElementTemplate` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `startAsDaysFromBeginning` int(11) DEFAULT NULL,
  `deadlineAsDaysFromBeginning` int(11) DEFAULT NULL,
  `schedulingStateType` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `positionInContainer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BB0B28841638AAB` (`parent`),
  CONSTRAINT `FK9BB0B28841638AAB` FOREIGN KEY (`parent`) REFERENCES `OrderLineGroupTemplate` (`GROUP_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderElementTemplate`
--

LOCK TABLES `OrderElementTemplate` WRITE;
/*!40000 ALTER TABLE `OrderElementTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderElementTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLine`
--

DROP TABLE IF EXISTS `OrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLine` (
  `ORDERELEMENTID` bigint(20) NOT NULL,
  `lastHoursGroupSequenceCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDERELEMENTID`),
  KEY `FK6017744297B1C209` (`ORDERELEMENTID`),
  CONSTRAINT `FK6017744297B1C209` FOREIGN KEY (`ORDERELEMENTID`) REFERENCES `OrderElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLine`
--

LOCK TABLES `OrderLine` WRITE;
/*!40000 ALTER TABLE `OrderLine` DISABLE KEYS */;
INSERT INTO `OrderLine` VALUES (1416,1),(1417,1),(1419,1),(1420,1),(2325,1),(5151,1),(5152,1),(5757,1),(5758,1),(6467,1),(6468,1),(6469,1),(6470,1),(6471,1),(6472,1),(6473,1),(6475,1),(6476,1),(12122,1),(12123,1),(15357,1),(15358,1),(15359,1),(15360,1),(15361,1),(15365,1),(15366,1),(15367,1),(15368,1),(15369,1),(15371,1),(15372,1),(15373,1),(15374,1),(15375,1),(15376,1),(15377,1),(15378,1),(15379,1),(20607,1),(20608,1),(20610,1),(20611,1),(20614,1),(20615,1),(20616,1),(20617,1),(20634,1),(20635,1),(20636,1),(20641,1),(20642,1),(20643,1),(20644,1),(35757,1),(35758,1),(35759,1),(35764,1),(35766,1),(35767,1);
/*!40000 ALTER TABLE `OrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLineGroup`
--

DROP TABLE IF EXISTS `OrderLineGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLineGroup` (
  `ORDERELEMENTID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDERELEMENTID`),
  KEY `FK7D2EEB5D97B1C209` (`ORDERELEMENTID`),
  CONSTRAINT `FK7D2EEB5D97B1C209` FOREIGN KEY (`ORDERELEMENTID`) REFERENCES `OrderElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLineGroup`
--

LOCK TABLES `OrderLineGroup` WRITE;
/*!40000 ALTER TABLE `OrderLineGroup` DISABLE KEYS */;
INSERT INTO `OrderLineGroup` VALUES (1415),(1418),(2324),(6465),(6466),(6474),(12121),(15356),(15363),(15364),(15370),(20606),(20609),(20613),(20633),(20640),(35756),(35765);
/*!40000 ALTER TABLE `OrderLineGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLineGroupTemplate`
--

DROP TABLE IF EXISTS `OrderLineGroupTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLineGroupTemplate` (
  `GROUP_TEMPLATE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GROUP_TEMPLATE_ID`),
  KEY `FKD3056EF7DDC82952` (`GROUP_TEMPLATE_ID`),
  CONSTRAINT `FKD3056EF7DDC82952` FOREIGN KEY (`GROUP_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLineGroupTemplate`
--

LOCK TABLES `OrderLineGroupTemplate` WRITE;
/*!40000 ALTER TABLE `OrderLineGroupTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderLineGroupTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLineTemplate`
--

DROP TABLE IF EXISTS `OrderLineTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLineTemplate` (
  `ORDER_LINE_TEMPLATE_ID` bigint(20) NOT NULL,
  `lastHoursGroupSequenceCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_LINE_TEMPLATE_ID`),
  KEY `FK4A1D42DC9FB7FC18` (`ORDER_LINE_TEMPLATE_ID`),
  CONSTRAINT `FK4A1D42DC9FB7FC18` FOREIGN KEY (`ORDER_LINE_TEMPLATE_ID`) REFERENCES `OrderElementTemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLineTemplate`
--

LOCK TABLES `OrderLineTemplate` WRITE;
/*!40000 ALTER TABLE `OrderLineTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderLineTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderSequence`
--

DROP TABLE IF EXISTS `OrderSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderSequence` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `lastValue` int(11) DEFAULT NULL,
  `numberOfDigits` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderSequence`
--

LOCK TABLES `OrderSequence` WRITE;
/*!40000 ALTER TABLE `OrderSequence` DISABLE KEYS */;
INSERT INTO `OrderSequence` VALUES (303,16,'PREFIX',15,5,'');
/*!40000 ALTER TABLE `OrderSequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderTemplate`
--

DROP TABLE IF EXISTS `OrderTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderTemplate` (
  `ORDER_TEMPLATE_ID` bigint(20) NOT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_TEMPLATE_ID`),
  KEY `FK4D68B9C8A44ABEE3` (`BASE_CALENDAR_ID`),
  KEY `FK4D68B9C89A4A7D90` (`ORDER_TEMPLATE_ID`),
  CONSTRAINT `FK4D68B9C89A4A7D90` FOREIGN KEY (`ORDER_TEMPLATE_ID`) REFERENCES `OrderLineGroupTemplate` (`GROUP_TEMPLATE_ID`),
  CONSTRAINT `FK4D68B9C8A44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderTemplate`
--

LOCK TABLES `OrderTemplate` WRITE;
/*!40000 ALTER TABLE `OrderTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PENDING_CONSOLIDATED_HOURS`
--

DROP TABLE IF EXISTS `PENDING_CONSOLIDATED_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PENDING_CONSOLIDATED_HOURS` (
  `PENDING_HOURS_ID` bigint(20) NOT NULL,
  `pendingConsolidatedHours` int(11) DEFAULT NULL,
  `RESOURCE_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  KEY `FK49876B7375ED79BA` (`RESOURCE_ALLOCATION_ID`),
  KEY `FK49876B734287EA05` (`PENDING_HOURS_ID`),
  CONSTRAINT `FK49876B734287EA05` FOREIGN KEY (`PENDING_HOURS_ID`) REFERENCES `ConsolidatedValue` (`id`),
  CONSTRAINT `FK49876B7375ED79BA` FOREIGN KEY (`RESOURCE_ALLOCATION_ID`) REFERENCES `ResourceAllocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PENDING_CONSOLIDATED_HOURS`
--

LOCK TABLES `PENDING_CONSOLIDATED_HOURS` WRITE;
/*!40000 ALTER TABLE `PENDING_CONSOLIDATED_HOURS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PENDING_CONSOLIDATED_HOURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_ROLES`
--

DROP TABLE IF EXISTS `PROFILE_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_ROLES` (
  `profileId` bigint(20) NOT NULL,
  `elt` varchar(255) DEFAULT NULL,
  KEY `FKC5B10467F3909054` (`profileId`),
  CONSTRAINT `FKC5B10467F3909054` FOREIGN KEY (`profileId`) REFERENCES `NAVAL_PROFILE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_ROLES`
--

LOCK TABLES `PROFILE_ROLES` WRITE;
/*!40000 ALTER TABLE `PROFILE_ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFILE_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUALITY_FORM`
--

DROP TABLE IF EXISTS `QUALITY_FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUALITY_FORM` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `qualityFormType` int(11) DEFAULT NULL,
  `reportAdvance` bit(1) DEFAULT NULL,
  `ADVANCE_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK8217A424B216ED4C` (`ADVANCE_TYPE_ID`),
  CONSTRAINT `FK8217A424B216ED4C` FOREIGN KEY (`ADVANCE_TYPE_ID`) REFERENCES `AdvanceType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUALITY_FORM`
--

LOCK TABLES `QUALITY_FORM` WRITE;
/*!40000 ALTER TABLE `QUALITY_FORM` DISABLE KEYS */;
/*!40000 ALTER TABLE `QUALITY_FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUALITY_FORM_ITEMS`
--

DROP TABLE IF EXISTS `QUALITY_FORM_ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUALITY_FORM_ITEMS` (
  `QUALITY_FORM_ID` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`QUALITY_FORM_ID`,`idx`),
  KEY `FKE9754BC58B37665C` (`QUALITY_FORM_ID`),
  CONSTRAINT `FKE9754BC58B37665C` FOREIGN KEY (`QUALITY_FORM_ID`) REFERENCES `QUALITY_FORM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUALITY_FORM_ITEMS`
--

LOCK TABLES `QUALITY_FORM_ITEMS` WRITE;
/*!40000 ALTER TABLE `QUALITY_FORM_ITEMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QUALITY_FORM_ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCES_COST_CATEGORY_ASSIGNMENT`
--

DROP TABLE IF EXISTS `RESOURCES_COST_CATEGORY_ASSIGNMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCES_COST_CATEGORY_ASSIGNMENT` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `initDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `COST_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK8CA52236C29AD8EB` (`COST_CATEGORY_ID`),
  KEY `FK8CA5223648D21790` (`RESOURCE_ID`),
  CONSTRAINT `FK8CA5223648D21790` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `Resource` (`id`),
  CONSTRAINT `FK8CA52236C29AD8EB` FOREIGN KEY (`COST_CATEGORY_ID`) REFERENCES `COST_CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCES_COST_CATEGORY_ASSIGNMENT`
--

LOCK TABLES `RESOURCES_COST_CATEGORY_ASSIGNMENT` WRITE;
/*!40000 ALTER TABLE `RESOURCES_COST_CATEGORY_ASSIGNMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCES_COST_CATEGORY_ASSIGNMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource`
--

DROP TABLE IF EXISTS `Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resource` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `generateCode` bit(1) NOT NULL,
  `LIMITED_RESOURCE` bit(1) NOT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `BASE_CALENDAR_ID` (`BASE_CALENDAR_ID`),
  KEY `FKEF86282EDC874C20` (`BASE_CALENDAR_ID`),
  CONSTRAINT `FKEF86282EDC874C20` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `ResourceCalendar` (`BASE_CALENDAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource`
--

LOCK TABLES `Resource` WRITE;
/*!40000 ALTER TABLE `Resource` DISABLE KEYS */;
INSERT INTO `Resource` VALUES (1112,1,'col123','\0','',2),(1114,1,'Coladora 2','\0','',3),(2829,1,'ltilve','\0','\0',2929),(6970,2,'xcastanho','\0','\0',7070),(16060,3,'3f4081db-250a-4ada-8a80-279fc0e1cc29','','\0',16160),(16062,3,'89369bc0-54f8-4850-8d5e-bcaeaddac866','','\0',16161),(19999,2,'78977b4d-2e75-4c2d-b0c5-d9e994812b16','','',20099),(20001,2,'c7b1e8b5-c210-402a-af6c-96b3cbb46342','','',20100),(37878,2,'jmcasanova','\0','\0',37976),(37881,1,'jmoran','\0','\0',37977),(37883,1,'svillar','\0','\0',37978),(37885,1,'itoral','\0','\0',37979);
/*!40000 ALTER TABLE `Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceAllocation`
--

DROP TABLE IF EXISTS `ResourceAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceAllocation` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `resourcesPerDay` decimal(19,2) DEFAULT NULL,
  `intended_total_hours` int(11) DEFAULT NULL,
  `originalTotalAssignment` int(11) DEFAULT NULL,
  `TASK` bigint(20) DEFAULT NULL,
  `ASSIGNMENT_FUNCTION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK41E073AEFF61540D` (`TASK`),
  KEY `FK41E073AE15671E92` (`ASSIGNMENT_FUNCTION`),
  CONSTRAINT `FK41E073AE15671E92` FOREIGN KEY (`ASSIGNMENT_FUNCTION`) REFERENCES `ASSIGNMENT_FUNCTION` (`id`),
  CONSTRAINT `FK41E073AEFF61540D` FOREIGN KEY (`TASK`) REFERENCES `Task` (`TASK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceAllocation`
--

LOCK TABLES `ResourceAllocation` WRITE;
/*!40000 ALTER TABLE `ResourceAllocation` DISABLE KEYS */;
INSERT INTO `ResourceAllocation` VALUES (3233,1,'1.00',0,100,2626,NULL),(4350,16,NULL,4,0,1722,NULL),(4857,12,NULL,100,0,1717,NULL),(5454,1,'1.00',500,500,5353,NULL),(6061,9,'0.88',NULL,77,5959,NULL),(6262,8,NULL,100,100,1718,NULL),(7383,12,'1.00',100,100,6776,NULL),(7384,10,'1.00',50,50,6777,NULL),(7385,9,'1.00',NULL,50,6767,NULL),(7386,9,'1.00',NULL,50,6767,NULL),(7387,9,'0.74',NULL,380,6768,NULL),(8082,11,'1.00',150,150,6773,NULL),(12633,6,'0.25',NULL,22,5959,NULL),(12639,5,'1.00',400,400,5960,NULL),(16970,3,'1.00',NULL,100,15679,NULL),(16971,3,'2.00',NULL,2000,15681,NULL),(19493,3,'1.00',4,0,1721,NULL),(19494,4,'1.00',200,200,6775,NULL),(19495,3,'1.00',100,0,6774,NULL),(19497,1,'1.00',500,500,15663,NULL),(19498,2,'1.00',1000,0,15662,NULL),(19507,1,'3.00',NULL,1620,6768,NULL),(36664,1,'1.00',NULL,50,36065,NULL),(37068,2,'1.00',150,150,36066,NULL),(37069,1,'1.00',150,0,36067,NULL),(38280,0,'1.00',NULL,200,20913,NULL);
/*!40000 ALTER TABLE `ResourceAllocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceCalendar`
--

DROP TABLE IF EXISTS `ResourceCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceCalendar` (
  `BASE_CALENDAR_ID` bigint(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`BASE_CALENDAR_ID`),
  KEY `FK5863798CA44ABEE3` (`BASE_CALENDAR_ID`),
  CONSTRAINT `FK5863798CA44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceCalendar`
--

LOCK TABLES `ResourceCalendar` WRITE;
/*!40000 ALTER TABLE `ResourceCalendar` DISABLE KEYS */;
INSERT INTO `ResourceCalendar` VALUES (2,1),(3,1),(2929,1),(7070,1),(16160,1),(16161,1),(20099,1),(20100,1),(37976,1),(37977,1),(37978,1),(37979,1);
/*!40000 ALTER TABLE `ResourceCalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StretchesFunction`
--

DROP TABLE IF EXISTS `StretchesFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StretchesFunction` (
  `ASSIGNMENT_FUNCTION_ID` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ASSIGNMENT_FUNCTION_ID`),
  KEY `FK593D3B4B1A5E11F8` (`ASSIGNMENT_FUNCTION_ID`),
  CONSTRAINT `FK593D3B4B1A5E11F8` FOREIGN KEY (`ASSIGNMENT_FUNCTION_ID`) REFERENCES `ASSIGNMENT_FUNCTION` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StretchesFunction`
--

LOCK TABLES `StretchesFunction` WRITE;
/*!40000 ALTER TABLE `StretchesFunction` DISABLE KEYS */;
/*!40000 ALTER TABLE `StretchesFunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubcontractedTaskData`
--

DROP TABLE IF EXISTS `SubcontractedTaskData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubcontractedTaskData` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `externalCompany` bigint(20) DEFAULT NULL,
  `subcontratationDate` datetime DEFAULT NULL,
  `subcontractCommunicationDate` datetime DEFAULT NULL,
  `workDescription` varchar(255) DEFAULT NULL,
  `subcontractPrice` decimal(19,2) DEFAULT NULL,
  `subcontractedCode` varchar(255) DEFAULT NULL,
  `nodeWithoutChildrenExported` bit(1) DEFAULT NULL,
  `labelsExported` bit(1) DEFAULT NULL,
  `materialAssignmentsExported` bit(1) DEFAULT NULL,
  `hoursGroupsExported` bit(1) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKECC6114019960F43` (`externalCompany`),
  CONSTRAINT `FKECC6114019960F43` FOREIGN KEY (`externalCompany`) REFERENCES `EXTERNAL_COMPANY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubcontractedTaskData`
--

LOCK TABLES `SubcontractedTaskData` WRITE;
/*!40000 ALTER TABLE `SubcontractedTaskData` DISABLE KEYS */;
INSERT INTO `SubcontractedTaskData` VALUES (2588674,14,7878,'2010-05-14 09:48:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `SubcontractedTaskData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_QUALITY_FORM`
--

DROP TABLE IF EXISTS `TASK_QUALITY_FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_QUALITY_FORM` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `QUALITY_FORM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  `reportAdvance` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK109AC09E8B37665C` (`QUALITY_FORM_ID`),
  KEY `FK109AC09EEFDA874F` (`ORDER_ELEMENT_ID`),
  CONSTRAINT `FK109AC09EEFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FK109AC09E8B37665C` FOREIGN KEY (`QUALITY_FORM_ID`) REFERENCES `QUALITY_FORM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_QUALITY_FORM`
--

LOCK TABLES `TASK_QUALITY_FORM` WRITE;
/*!40000 ALTER TABLE `TASK_QUALITY_FORM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK_QUALITY_FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_QUALITY_FORM_ITEMS`
--

DROP TABLE IF EXISTS `TASK_QUALITY_FORM_ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_QUALITY_FORM_ITEMS` (
  `TASK_QUALITY_FORM_ID` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` decimal(19,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `passed` bit(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`TASK_QUALITY_FORM_ID`,`idx`),
  KEY `FKADEBA4BF87FA6B5D` (`TASK_QUALITY_FORM_ID`),
  CONSTRAINT `FKADEBA4BF87FA6B5D` FOREIGN KEY (`TASK_QUALITY_FORM_ID`) REFERENCES `TASK_QUALITY_FORM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_QUALITY_FORM_ITEMS`
--

LOCK TABLES `TASK_QUALITY_FORM_ITEMS` WRITE;
/*!40000 ALTER TABLE `TASK_QUALITY_FORM_ITEMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK_QUALITY_FORM_ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_OF_WORK_HOURS`
--

DROP TABLE IF EXISTS `TYPE_OF_WORK_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_OF_WORK_HOURS` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `defaultPrice` decimal(19,2) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_OF_WORK_HOURS`
--

LOCK TABLES `TYPE_OF_WORK_HOURS` WRITE;
/*!40000 ALTER TABLE `TYPE_OF_WORK_HOURS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_OF_WORK_HOURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `TASK_ELEMENT_ID` bigint(20) NOT NULL,
  `calculatedValue` int(11) DEFAULT NULL,
  `startConstraintType` int(11) DEFAULT NULL,
  `constraintDate` datetime DEFAULT NULL,
  `SUBCONTRATED_TASK_DATA_ID` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`TASK_ELEMENT_ID`),
  UNIQUE KEY `SUBCONTRATED_TASK_DATA_ID` (`SUBCONTRATED_TASK_DATA_ID`),
  KEY `FK27A9A55B595A0` (`SUBCONTRATED_TASK_DATA_ID`),
  KEY `FK27A9A54936BB8C` (`TASK_ELEMENT_ID`),
  CONSTRAINT `FK27A9A54936BB8C` FOREIGN KEY (`TASK_ELEMENT_ID`) REFERENCES `TaskElement` (`id`),
  CONSTRAINT `FK27A9A55B595A0` FOREIGN KEY (`SUBCONTRATED_TASK_DATA_ID`) REFERENCES `SubcontractedTaskData` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES (1717,1,1,'2010-05-14 00:00:00',NULL,5),(1718,1,1,'2010-05-18 00:00:00',NULL,5),(1721,1,1,'2010-06-02 00:00:00',NULL,5),(1722,1,1,'2010-06-03 00:00:00',NULL,5),(2626,1,0,NULL,NULL,NULL),(5353,1,1,'2010-06-02 00:00:00',NULL,5),(5354,1,0,NULL,NULL,NULL),(5959,0,1,'2010-05-14 00:00:00',NULL,NULL),(5960,1,1,'2010-07-07 00:00:00',NULL,5),(6767,1,1,'2010-09-01 09:08:21',NULL,NULL),(6768,1,1,'2010-08-28 00:00:00',NULL,NULL),(6769,1,1,'2010-08-31 13:05:48',NULL,NULL),(6772,1,2,'2010-05-13 18:37:11',2588674,NULL),(6773,1,1,'2010-09-15 00:00:00',NULL,5),(6774,1,1,'2010-08-30 00:00:00',NULL,5),(6775,1,1,'2010-09-15 00:00:00',NULL,5),(6776,1,1,'2010-06-21 00:00:00',NULL,5),(6777,1,1,'2010-10-20 00:00:00',NULL,5),(12423,1,0,NULL,NULL,NULL),(12424,1,0,NULL,NULL,NULL),(15660,1,0,NULL,NULL,NULL),(15661,1,0,NULL,NULL,NULL),(15662,1,1,'2010-06-03 00:00:00',NULL,5),(15663,1,1,'2010-05-17 00:00:00',NULL,5),(15664,1,0,NULL,NULL,NULL),(15666,1,1,'2011-03-23 06:02:19',NULL,NULL),(15667,1,1,'2011-03-31 19:19:02',NULL,NULL),(15668,1,1,'2011-03-12 07:23:40',NULL,NULL),(15669,1,1,'2011-02-28 03:34:04',NULL,NULL),(15670,1,1,'2011-03-08 15:50:48',NULL,NULL),(15672,1,0,NULL,NULL,NULL),(15673,1,0,NULL,NULL,NULL),(15674,1,0,NULL,NULL,NULL),(15675,1,0,NULL,NULL,NULL),(15676,1,0,NULL,NULL,NULL),(15677,1,0,NULL,NULL,NULL),(15679,1,1,'2011-03-12 07:23:40',NULL,NULL),(15680,1,0,NULL,NULL,NULL),(15681,1,1,'2011-04-08 00:00:00',NULL,NULL),(20907,1,0,NULL,NULL,NULL),(20908,1,0,NULL,NULL,NULL),(20909,1,1,'2010-05-23 20:00:00',NULL,NULL),(20910,1,0,NULL,NULL,NULL),(20913,1,0,NULL,NULL,NULL),(20914,1,0,NULL,NULL,NULL),(20915,1,1,'2010-05-22 02:24:00',NULL,NULL),(20916,1,0,NULL,NULL,NULL),(20919,1,0,NULL,NULL,NULL),(20920,1,0,NULL,NULL,NULL),(20921,1,0,NULL,NULL,NULL),(20923,1,0,NULL,NULL,NULL),(20924,1,0,NULL,NULL,NULL),(20925,1,0,NULL,NULL,NULL),(20926,1,0,NULL,NULL,NULL),(36057,1,1,'2010-07-09 17:29:45',NULL,NULL),(36065,1,0,NULL,NULL,NULL),(36066,1,1,'2010-09-23 00:00:00',NULL,5),(36067,1,1,'2010-08-30 00:00:00',NULL,5),(36068,1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskElement`
--

DROP TABLE IF EXISTS `TaskElement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskElement` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `deadline` date DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  `positionInParent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK70D5D997A44ABEE3` (`BASE_CALENDAR_ID`),
  KEY `FK70D5D997A5F3C581` (`parent`),
  CONSTRAINT `FK70D5D997A5F3C581` FOREIGN KEY (`parent`) REFERENCES `TaskGroup` (`TASK_ELEMENT_ID`),
  CONSTRAINT `FK70D5D997A44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskElement`
--

LOCK TABLES `TaskElement` WRITE;
/*!40000 ALTER TABLE `TaskElement` DISABLE KEYS */;
INSERT INTO `TaskElement` VALUES (1717,32,'Task 1.1 (copy)',NULL,'2010-05-14 00:00:00','2010-06-02 00:00:00',NULL,1720,NULL,0),(1718,30,'Task 1.2',NULL,'2010-05-18 00:00:00','2010-06-03 00:00:00','2010-05-28',1719,NULL,1),(1719,32,'Casco de embarcación de recreo',NULL,'2010-05-14 00:00:00','2010-07-17 05:36:00','2010-06-17',NULL,NULL,NULL),(1720,29,'Task 1.1',NULL,'2010-05-14 00:00:00','2010-06-02 00:00:00',NULL,1719,NULL,0),(1721,30,'Task 1.3',NULL,'2010-06-02 00:00:00','2010-06-02 00:00:00',NULL,1719,NULL,2),(1722,31,'Task 1.4',NULL,'2010-06-03 00:00:00','2010-06-03 00:00:00',NULL,1719,NULL,3),(2626,5,'Task2.1',NULL,'2010-05-12 10:43:45','2010-05-29 10:43:45',NULL,2627,NULL,0),(2627,7,'Laminado moldeado Julio 2010',NULL,'2010-05-12 10:43:45','2010-07-26 10:43:45',NULL,NULL,NULL,NULL),(5353,4,'Limiting1',NULL,'2010-06-02 00:00:00','2010-08-28 00:00:00',NULL,2627,NULL,1),(5354,3,'Limiting2',NULL,'2010-05-12 10:43:45','2010-07-26 10:43:45',NULL,2627,NULL,2),(5959,16,'Non limiting',NULL,'2010-05-14 00:00:00','2010-05-29 00:00:00','2010-07-01',1719,NULL,4),(5960,16,'Non Limiting2',NULL,'2010-07-07 00:00:00','2010-09-15 00:00:00',NULL,1719,NULL,5),(6767,16,'Tarea A.1',NULL,'2010-09-01 09:08:21','2010-09-10 09:08:21',NULL,6770,NULL,0),(6768,16,'Tarea A.2',NULL,'2010-08-28 00:00:00','2010-12-02 00:00:00',NULL,6770,NULL,1),(6769,16,'Tarea A.3',NULL,'2010-08-31 13:05:48','2010-09-19 07:05:48',NULL,6770,NULL,2),(6770,21,'Tarea A',NULL,'2010-08-28 00:00:00','2010-12-02 00:00:00',NULL,6771,NULL,0),(6771,21,'Lote 5 Optimist',NULL,'2010-06-19 00:00:00','2010-12-02 00:00:00',NULL,NULL,NULL,NULL),(6772,15,'Tarea B',NULL,'2010-06-19 00:00:00','2010-06-25 06:00:00',NULL,6771,NULL,1),(6773,18,'Tarea C',NULL,'2010-09-15 00:00:00','2010-10-11 00:00:00',NULL,6771,NULL,2),(6774,16,'Tarea X',NULL,'2010-08-30 00:00:00','2010-09-15 00:00:00',NULL,6771,NULL,3),(6775,18,'Tarea Y',NULL,'2010-09-15 00:00:00','2010-10-19 00:00:00',NULL,6771,NULL,4),(6776,18,'Tarea Z.1',NULL,'2010-06-21 00:00:00','2010-07-07 00:00:00',NULL,6778,NULL,0),(6777,16,'Tarea Z.2',NULL,'2010-10-20 00:00:00','2010-10-28 00:00:00',NULL,6778,NULL,1),(6778,19,'Tarea Z',NULL,'2010-06-19 00:00:00','2010-07-08 00:00:00',NULL,6771,NULL,5),(12423,1,'Unnasigned1',NULL,'2010-05-14 11:12:46','2010-10-11 11:12:46',NULL,12425,NULL,0),(12424,1,'Unassigned 2',NULL,'2010-05-14 11:12:46','2010-06-08 11:12:46',NULL,12425,NULL,1),(12425,1,'Project with no allocations at all',NULL,'2010-05-14 11:12:46','2010-10-11 11:12:46',NULL,NULL,NULL,NULL),(15660,3,'Montaje de andamios',NULL,'2010-05-15 10:10:50','2010-06-09 10:10:50',NULL,15665,NULL,0),(15661,3,'Construcción de cubierta',NULL,'2010-05-15 10:10:50','2012-01-30 09:10:50',NULL,15665,NULL,1),(15662,5,'Construcción del casco',NULL,'2010-06-03 00:00:00','2010-11-25 00:00:00',NULL,15665,NULL,2),(15663,4,'Hélices',NULL,'2010-05-17 00:00:00','2010-08-11 00:00:00',NULL,15665,NULL,3),(15664,3,'Elaboración velamen',NULL,'2010-05-15 10:10:50','2011-01-20 09:10:50',NULL,15665,NULL,4),(15665,4,'Construcción barco de competición en acero',NULL,'2010-05-15 10:10:50','2012-01-30 09:10:50',NULL,NULL,NULL,NULL),(15666,6,'Colocar estructura in interior 1.a1',NULL,'2011-03-23 06:02:19','2011-04-04 19:02:19',NULL,15671,NULL,0),(15667,6,'Colocar estructura in interior 1.a',NULL,'2011-03-31 19:19:02','2011-04-13 07:19:02',NULL,15671,NULL,1),(15668,6,'Colocar estructura in interior 1.b',NULL,'2011-03-12 07:23:40','2011-03-24 19:23:40',NULL,15671,NULL,2),(15669,6,'Colocar estructura in interior 1.c',NULL,'2011-02-28 03:34:04','2011-03-12 15:34:04',NULL,15671,NULL,3),(15670,6,'Colocar estructura in interior 1.d',NULL,'2011-03-08 15:50:48','2011-03-21 03:50:48',NULL,15671,NULL,4),(15671,7,'Colocar estructura in interior 1',NULL,'2011-02-28 03:34:04','2011-04-13 07:19:02',NULL,15682,NULL,0),(15672,6,'Colocar estructura in interior 2.a1',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,0),(15673,6,'Estructura interior 2.a',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,1),(15674,6,'Estructura interior 2.b',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,2),(15675,6,'Estructura interior 2.c',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,3),(15676,6,'Estructura interior 2.d',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,4),(15677,6,'Estructura interior 2.e',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15678,NULL,5),(15678,7,'Colocar estructura in interior 2',NULL,'2011-04-13 07:19:02','2011-04-25 19:19:02',NULL,15682,NULL,1),(15679,6,'Colocar estructura in interior 3',NULL,'2011-03-12 07:23:40','2011-03-31 07:23:40',NULL,15682,NULL,2),(15680,6,'Colocar estructura in interior 4',NULL,'2011-03-31 07:23:40','2011-04-12 19:23:40',NULL,15682,NULL,3),(15681,6,'Colocar estructura in interior 5',NULL,'2011-04-08 00:00:00','2011-09-30 00:00:00',NULL,15682,NULL,4),(15682,7,'Laminado Moldeado Abril Navantia',NULL,'2011-02-28 03:34:04','2011-09-30 00:00:00',NULL,NULL,NULL,NULL),(20907,2,'Preparación do producto',NULL,'2010-05-17 12:40:45','2010-05-23 18:40:45',NULL,20912,NULL,0),(20908,2,'Elaboración da mezcla',NULL,'2010-05-17 12:40:45','2010-06-01 12:40:45',NULL,20912,NULL,1),(20909,2,'Aplicación na cuberta (copy)',NULL,'2010-06-01 12:40:45','2010-06-07 18:40:45',NULL,20911,NULL,0),(20910,2,'Aplicación nos peches',NULL,'2010-06-01 12:40:45','2010-06-04 00:40:45',NULL,20911,NULL,1),(20911,2,'Aplicación na cuberta',NULL,'2010-06-01 12:40:45','2010-06-07 18:40:45',NULL,20912,NULL,2),(20912,2,'Proxecto de soldado da cuberta',NULL,'2010-05-17 12:40:45','2010-06-07 18:40:45','2010-06-24',NULL,NULL,NULL),(20913,5,'Pegar tablillas',NULL,'2010-05-17 13:35:59','2010-06-19 13:35:59',NULL,20917,NULL,0),(20914,5,'Saturar interna y externa',NULL,'2010-05-17 13:35:59','2010-06-05 07:35:59',NULL,20917,NULL,1),(20915,6,'Colocar estructura en el interior (copy)',NULL,'2010-05-22 02:24:00','2010-05-28 08:24:00',NULL,20922,NULL,0),(20916,5,'Aplicar malla',NULL,'2010-05-28 08:24:00','2010-06-16 02:24:00',NULL,20917,NULL,4),(20917,6,'Laminado moldeado',NULL,'2010-05-17 13:35:59','2010-06-19 13:35:59','2010-11-18',NULL,NULL,NULL),(20918,2,'new milestone',NULL,'2010-06-05 07:35:59','2010-06-05 07:35:59',NULL,20917,NULL,2),(20919,3,'Paso 1 aplicación',NULL,'2010-05-17 13:35:59','2010-05-21 07:35:59',NULL,20922,NULL,1),(20920,3,'Paso 2 aplicación',NULL,'2010-05-21 07:35:59','2010-05-30 01:35:59',NULL,20922,NULL,2),(20921,3,'Paso 3',NULL,'2010-05-17 13:35:59','2010-05-30 01:35:59',NULL,20922,NULL,3),(20922,3,'Colocar estructura en el interior',NULL,'2010-05-17 13:35:59','2010-05-30 01:35:59',NULL,20917,NULL,3),(20923,1,'Pegar tablillas',NULL,'2010-05-17 18:12:15','2010-06-01 18:12:15',NULL,20927,NULL,0),(20924,1,'Saturar estructura interna',NULL,'2010-05-17 18:12:15','2010-06-05 12:12:15',NULL,20927,NULL,1),(20925,1,'Colocar estructura',NULL,'2010-05-17 18:12:15','2010-06-11 18:12:15',NULL,20927,NULL,2),(20926,1,'Aplicar malla',NULL,'2010-05-17 18:12:15','2010-06-11 18:12:15',NULL,20927,NULL,3),(20927,1,'Laminado moldeado',NULL,'2010-05-17 18:12:15','2010-06-11 18:12:15','2010-11-17',NULL,NULL,NULL),(36057,11,'Pegar tablillas',NULL,'2010-07-09 17:29:45','2010-07-22 05:29:45',NULL,36061,NULL,0),(36061,17,'Laminado moldeado',NULL,'2010-05-17 18:20:27','2011-05-10 22:49:04','2010-09-16',NULL,NULL,NULL),(36065,7,'Colocar estructura',NULL,'2010-08-02 18:00:00','2011-05-10 18:00:00',NULL,36061,NULL,1),(36066,10,'Aplicar malla (copy)',NULL,'2010-09-23 00:00:00','2010-10-20 00:00:00',NULL,36069,NULL,0),(36067,7,'Tarea 1.1',NULL,'2010-08-30 00:00:00','2010-09-23 00:00:00',NULL,36069,NULL,1),(36068,6,'Tarea 1.2',NULL,'2010-05-17 18:20:27','2010-05-24 00:20:27',NULL,36069,NULL,2),(36069,8,'Aplicar malla',NULL,'2010-05-17 18:20:27','2010-08-02 18:00:00',NULL,36061,NULL,2),(36072,2,'new milestone',NULL,'2011-05-10 22:49:04','2011-05-10 22:49:04',NULL,36061,NULL,3);
/*!40000 ALTER TABLE `TaskElement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskGroup`
--

DROP TABLE IF EXISTS `TaskGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskGroup` (
  `TASK_ELEMENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TASK_ELEMENT_ID`),
  KEY `FK80E79BDA4936BB8C` (`TASK_ELEMENT_ID`),
  CONSTRAINT `FK80E79BDA4936BB8C` FOREIGN KEY (`TASK_ELEMENT_ID`) REFERENCES `TaskElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskGroup`
--

LOCK TABLES `TaskGroup` WRITE;
/*!40000 ALTER TABLE `TaskGroup` DISABLE KEYS */;
INSERT INTO `TaskGroup` VALUES (1719),(1720),(2627),(6770),(6771),(6778),(12425),(15665),(15671),(15678),(15682),(20911),(20912),(20917),(20922),(20927),(36061),(36069);
/*!40000 ALTER TABLE `TaskGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskMilestone`
--

DROP TABLE IF EXISTS `TaskMilestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskMilestone` (
  `TASK_ELEMENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TASK_ELEMENT_ID`),
  KEY `FK62B2994B4936BB8C` (`TASK_ELEMENT_ID`),
  CONSTRAINT `FK62B2994B4936BB8C` FOREIGN KEY (`TASK_ELEMENT_ID`) REFERENCES `TaskElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskMilestone`
--

LOCK TABLES `TaskMilestone` WRITE;
/*!40000 ALTER TABLE `TaskMilestone` DISABLE KEYS */;
INSERT INTO `TaskMilestone` VALUES (20918),(36072);
/*!40000 ALTER TABLE `TaskMilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskSource`
--

DROP TABLE IF EXISTS `TaskSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskSource` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `orderElement` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderElement` (`orderElement`),
  KEY `FKB05E6E203D72BC6F` (`id`),
  KEY `FKB05E6E2067FAF86E` (`orderElement`),
  CONSTRAINT `FKB05E6E2067FAF86E` FOREIGN KEY (`orderElement`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FKB05E6E203D72BC6F` FOREIGN KEY (`id`) REFERENCES `TaskElement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskSource`
--

LOCK TABLES `TaskSource` WRITE;
/*!40000 ALTER TABLE `TaskSource` DISABLE KEYS */;
INSERT INTO `TaskSource` VALUES (1717,11,1416),(1718,11,1417),(1719,6,1415),(1720,5,1418),(1721,9,1419),(1722,9,1420),(2626,5,2325),(2627,3,2324),(5353,3,5151),(5354,3,5152),(5959,7,5757),(5960,7,5758),(6767,11,6467),(6768,11,6468),(6769,11,6469),(6770,6,6466),(6771,6,6465),(6772,9,6470),(6773,9,6471),(6774,9,6472),(6775,9,6473),(6776,9,6475),(6777,9,6476),(6778,5,6474),(12423,1,12122),(12424,1,12123),(12425,1,12121),(15660,3,15357),(15661,3,15358),(15662,3,15359),(15663,3,15360),(15664,3,15361),(15665,2,15356),(15666,3,15365),(15667,3,15366),(15668,3,15367),(15669,3,15368),(15670,3,15369),(15671,2,15364),(15672,3,15371),(15673,3,15372),(15674,3,15373),(15675,3,15374),(15676,3,15375),(15677,3,15376),(15678,2,15370),(15679,3,15377),(15680,3,15378),(15681,3,15379),(15682,2,15363),(20907,1,20607),(20908,1,20608),(20909,1,20610),(20910,1,20611),(20911,1,20609),(20912,1,20606),(20913,3,20614),(20914,3,20615),(20915,3,20616),(20916,3,20617),(20917,2,20613),(20919,1,20634),(20920,1,20635),(20921,1,20636),(20922,1,20633),(20923,1,20641),(20924,1,20642),(20925,1,20643),(20926,1,20644),(20927,1,20640),(36057,13,35757),(36061,7,35756),(36065,7,35759),(36066,7,35764),(36067,5,35766),(36068,5,35767),(36069,3,35765);
/*!40000 ALTER TABLE `TaskSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIT_TYPE`
--

DROP TABLE IF EXISTS `UNIT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNIT_TYPE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `measure` varchar(255) DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIT_TYPE`
--

LOCK TABLES `UNIT_TYPE` WRITE;
/*!40000 ALTER TABLE `UNIT_TYPE` DISABLE KEYS */;
INSERT INTO `UNIT_TYPE` VALUES (808,1,'a3453296-f778-4bb7-b56d-d5de9b297fba','units','\0'),(809,1,'c018030b-ff2c-48d3-8bbd-5d3cfdea89ca','kg','\0'),(810,1,'e9123ba7-e066-4ad1-bd23-d55d1a38fc4d','km','\0'),(811,1,'81c4864b-a1dd-427c-8f2f-62d32df20887','l','\0'),(812,1,'1ea725a4-b8e8-41b0-9dd9-910fd2c85bc7','m','\0'),(813,1,'f252e9bc-7057-409d-a150-20787c32b16d','m2','\0'),(814,1,'4c28b6b7-d6ec-4246-a97e-2f9b925dfa03','m3','\0'),(815,1,'75897114-19dd-41e5-9238-d31e0f8c0c9f','tn','\0');
/*!40000 ALTER TABLE `UNIT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PROFILES`
--

DROP TABLE IF EXISTS `USER_PROFILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PROFILES` (
  `USER_ID` bigint(20) NOT NULL,
  `PROFILE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`,`PROFILE_ID`),
  KEY `FK991FDDE5567AD13` (`USER_ID`),
  KEY `FK991FDDEEDC4DB41` (`PROFILE_ID`),
  CONSTRAINT `FK991FDDEEDC4DB41` FOREIGN KEY (`PROFILE_ID`) REFERENCES `NAVAL_PROFILE` (`id`),
  CONSTRAINT `FK991FDDE5567AD13` FOREIGN KEY (`USER_ID`) REFERENCES `NAVAL_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PROFILES`
--

LOCK TABLES `USER_PROFILES` WRITE;
/*!40000 ALTER TABLE `USER_PROFILES` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_PROFILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLES`
--

DROP TABLE IF EXISTS `USER_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLES` (
  `userId` bigint(20) NOT NULL,
  `elt` varchar(255) DEFAULT NULL,
  KEY `FKC6C799292C57F12A` (`userId`),
  CONSTRAINT `FKC6C799292C57F12A` FOREIGN KEY (`userId`) REFERENCES `NAVAL_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLES`
--

LOCK TABLES `USER_ROLES` WRITE;
/*!40000 ALTER TABLE `USER_ROLES` DISABLE KEYS */;
INSERT INTO `USER_ROLES` VALUES (1011,'ROLE_EDIT_ALL_ORDERS'),(1011,'ROLE_CREATE_ORDER'),(1011,'ROLE_READ_ALL_ORDERS'),(1011,'ROLE_ADMINISTRATION'),(1012,'ROLE_WS_READER'),(1013,'ROLE_WS_READER'),(1013,'ROLE_WS_WRITER');
/*!40000 ALTER TABLE `USER_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualWorker`
--

DROP TABLE IF EXISTS `VirtualWorker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualWorker` (
  `VIRTUALWORKER_ID` bigint(20) NOT NULL,
  `observations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VIRTUALWORKER_ID`),
  KEY `FK5280DA49161D6C65` (`VIRTUALWORKER_ID`),
  CONSTRAINT `FK5280DA49161D6C65` FOREIGN KEY (`VIRTUALWORKER_ID`) REFERENCES `Worker` (`WORKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualWorker`
--

LOCK TABLES `VirtualWorker` WRITE;
/*!40000 ALTER TABLE `VirtualWorker` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualWorker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKREPORTSLINES_LABELS`
--

DROP TABLE IF EXISTS `WORKREPORTSLINES_LABELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKREPORTSLINES_LABELS` (
  `WORK_REPORT_LINE_ID` bigint(20) NOT NULL,
  `LABEL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`WORK_REPORT_LINE_ID`,`LABEL_ID`),
  KEY `FK7DAAD5CD5078E161` (`WORK_REPORT_LINE_ID`),
  KEY `FK7DAAD5CDC1C2746E` (`LABEL_ID`),
  CONSTRAINT `FK7DAAD5CDC1C2746E` FOREIGN KEY (`LABEL_ID`) REFERENCES `LABEL` (`id`),
  CONSTRAINT `FK7DAAD5CD5078E161` FOREIGN KEY (`WORK_REPORT_LINE_ID`) REFERENCES `WORK_REPORT_LINE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKREPORTSLINES_LABELS`
--

LOCK TABLES `WORKREPORTSLINES_LABELS` WRITE;
/*!40000 ALTER TABLE `WORKREPORTSLINES_LABELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKREPORTSLINES_LABELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKREPORTS_LABELS`
--

DROP TABLE IF EXISTS `WORKREPORTS_LABELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKREPORTS_LABELS` (
  `WORK_REPORT_ID` bigint(20) NOT NULL,
  `LABEL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`WORK_REPORT_ID`,`LABEL_ID`),
  KEY `FKFD423FF0F1A3177C` (`WORK_REPORT_ID`),
  KEY `FKFD423FF0C1C2746E` (`LABEL_ID`),
  CONSTRAINT `FKFD423FF0C1C2746E` FOREIGN KEY (`LABEL_ID`) REFERENCES `LABEL` (`id`),
  CONSTRAINT `FKFD423FF0F1A3177C` FOREIGN KEY (`WORK_REPORT_ID`) REFERENCES `WORK_REPORT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKREPORTS_LABELS`
--

LOCK TABLES `WORKREPORTS_LABELS` WRITE;
/*!40000 ALTER TABLE `WORKREPORTS_LABELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKREPORTS_LABELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_REPORT`
--

DROP TABLE IF EXISTS `WORK_REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK_REPORT` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `generateCode` bit(1) NOT NULL,
  `WORK_REPORT_TYPE_ID` bigint(20) NOT NULL,
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `ORDER_ELEMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK1A95A222131853A1` (`WORK_REPORT_TYPE_ID`),
  KEY `FK1A95A22248D21790` (`RESOURCE_ID`),
  KEY `FK1A95A222EFDA874F` (`ORDER_ELEMENT_ID`),
  CONSTRAINT `FK1A95A222EFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FK1A95A222131853A1` FOREIGN KEY (`WORK_REPORT_TYPE_ID`) REFERENCES `WORK_REPORT_TYPE` (`id`),
  CONSTRAINT `FK1A95A22248D21790` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `Resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_REPORT`
--

LOCK TABLES `WORK_REPORT` WRITE;
/*!40000 ALTER TABLE `WORK_REPORT` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_REPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_REPORT_LABEL_TYPE_ASSIGMENT`
--

DROP TABLE IF EXISTS `WORK_REPORT_LABEL_TYPE_ASSIGMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK_REPORT_LABEL_TYPE_ASSIGMENT` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `labelsSharedByLines` bit(1) DEFAULT NULL,
  `positionNumber` int(11) DEFAULT NULL,
  `LABEL_TYPE_ID` bigint(20) DEFAULT NULL,
  `LABEL_ID` bigint(20) DEFAULT NULL,
  `WORK_REPORT_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD9F8F120131853A1` (`WORK_REPORT_TYPE_ID`),
  KEY `FKD9F8F120C1C2746E` (`LABEL_ID`),
  KEY `FKD9F8F120707CD777` (`LABEL_TYPE_ID`),
  CONSTRAINT `FKD9F8F120707CD777` FOREIGN KEY (`LABEL_TYPE_ID`) REFERENCES `LABEL_TYPE` (`id`),
  CONSTRAINT `FKD9F8F120131853A1` FOREIGN KEY (`WORK_REPORT_TYPE_ID`) REFERENCES `WORK_REPORT_TYPE` (`id`),
  CONSTRAINT `FKD9F8F120C1C2746E` FOREIGN KEY (`LABEL_ID`) REFERENCES `LABEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_REPORT_LABEL_TYPE_ASSIGMENT`
--

LOCK TABLES `WORK_REPORT_LABEL_TYPE_ASSIGMENT` WRITE;
/*!40000 ALTER TABLE `WORK_REPORT_LABEL_TYPE_ASSIGMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_REPORT_LABEL_TYPE_ASSIGMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_REPORT_LINE`
--

DROP TABLE IF EXISTS `WORK_REPORT_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK_REPORT_LINE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `numHours` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `clockStart` int(11) DEFAULT NULL,
  `clockFinish` int(11) DEFAULT NULL,
  `WORK_REPORT_ID` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  `ORDER_ELEMENT_ID` bigint(20) NOT NULL,
  `TYPE_WORK_HOURS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKEB02C3F1E7E1020B` (`TYPE_WORK_HOURS_ID`),
  KEY `FKEB02C3F1F1A3177C` (`WORK_REPORT_ID`),
  KEY `FKEB02C3F148D21790` (`RESOURCE_ID`),
  KEY `FKEB02C3F1EFDA874F` (`ORDER_ELEMENT_ID`),
  CONSTRAINT `FKEB02C3F1EFDA874F` FOREIGN KEY (`ORDER_ELEMENT_ID`) REFERENCES `OrderElement` (`id`),
  CONSTRAINT `FKEB02C3F148D21790` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `Resource` (`id`),
  CONSTRAINT `FKEB02C3F1E7E1020B` FOREIGN KEY (`TYPE_WORK_HOURS_ID`) REFERENCES `TYPE_OF_WORK_HOURS` (`id`),
  CONSTRAINT `FKEB02C3F1F1A3177C` FOREIGN KEY (`WORK_REPORT_ID`) REFERENCES `WORK_REPORT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_REPORT_LINE`
--

LOCK TABLES `WORK_REPORT_LINE` WRITE;
/*!40000 ALTER TABLE `WORK_REPORT_LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_REPORT_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_REPORT_TYPE`
--

DROP TABLE IF EXISTS `WORK_REPORT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK_REPORT_TYPE` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `dateIsSharedByLines` bit(1) DEFAULT NULL,
  `resourceIsSharedInLines` bit(1) DEFAULT NULL,
  `orderElementIsSharedInLines` bit(1) DEFAULT NULL,
  `hoursManagement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_REPORT_TYPE`
--

LOCK TABLES `WORK_REPORT_TYPE` WRITE;
/*!40000 ALTER TABLE `WORK_REPORT_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_REPORT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Worker`
--

DROP TABLE IF EXISTS `Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Worker` (
  `WORKER_ID` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WORKER_ID`),
  KEY `FK9AC73F9E40901220` (`WORKER_ID`),
  CONSTRAINT `FK9AC73F9E40901220` FOREIGN KEY (`WORKER_ID`) REFERENCES `Resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Worker`
--

LOCK TABLES `Worker` WRITE;
/*!40000 ALTER TABLE `Worker` DISABLE KEYS */;
INSERT INTO `Worker` VALUES (1112,'Coladora 1','Coladora 1','Coladora 1'),(1114,'Coladora 2','Coladora 2','Coladora 2'),(2829,'Lorenzo','Tilve','1234'),(6970,'Xavier','Castaño','123G'),(16060,'José','Dapena Paz','1876420P'),(16062,'Óscar','González Fernández','5687K'),(19999,'Diego','Pino García','876209L'),(20001,'Manuel','Rego Casasnovas','11875364R'),(37878,'José María','Casanova','54678965E'),(37881,'Francisco Javier','Morán Rúa','54698731Q'),(37883,'Sergio','Villar','12345678A'),(37885,'Iago','Toral','11447782C');
/*!40000 ALTER TABLE `Worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_criterions`
--

DROP TABLE IF EXISTS `all_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_criterions` (
  `GENERIC_RESOURCE_ALLOCATION_ID` bigint(20) NOT NULL,
  `criterion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`GENERIC_RESOURCE_ALLOCATION_ID`,`criterion_id`),
  KEY `FK7980035061F02C44` (`criterion_id`),
  KEY `FK79800350B1524A73` (`GENERIC_RESOURCE_ALLOCATION_ID`),
  CONSTRAINT `FK79800350B1524A73` FOREIGN KEY (`GENERIC_RESOURCE_ALLOCATION_ID`) REFERENCES `generic_resource_allocation` (`RESOURCE_ALLOCATION_ID`),
  CONSTRAINT `FK7980035061F02C44` FOREIGN KEY (`criterion_id`) REFERENCES `Criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_criterions`
--

LOCK TABLES `all_criterions` WRITE;
/*!40000 ALTER TABLE `all_criterions` DISABLE KEYS */;
INSERT INTO `all_criterions` VALUES (36664,36361);
/*!40000 ALTER TABLE `all_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_assignment`
--

DROP TABLE IF EXISTS `day_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_assignment` (
  `id` bigint(20) NOT NULL,
  `DAY_ASSIGNMENT_TYPE` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `hours` int(11) NOT NULL,
  `consolidated` bit(1) DEFAULT NULL,
  `day` date NOT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  `SPECIFIC_RESOURCE_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  `GENERIC_RESOURCE_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  `DERIVED_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB493F506394139` (`SPECIFIC_RESOURCE_ALLOCATION_ID`),
  KEY `FKBB493F50B1524A73` (`GENERIC_RESOURCE_ALLOCATION_ID`),
  KEY `FKBB493F5048D21790` (`RESOURCE_ID`),
  KEY `FKBB493F501B8E7CF2` (`DERIVED_ALLOCATION_ID`),
  CONSTRAINT `FKBB493F501B8E7CF2` FOREIGN KEY (`DERIVED_ALLOCATION_ID`) REFERENCES `DerivedAllocation` (`id`),
  CONSTRAINT `FKBB493F5048D21790` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `Resource` (`id`),
  CONSTRAINT `FKBB493F506394139` FOREIGN KEY (`SPECIFIC_RESOURCE_ALLOCATION_ID`) REFERENCES `specific_resource_allocation` (`RESOURCE_ALLOCATION_ID`),
  CONSTRAINT `FKBB493F50B1524A73` FOREIGN KEY (`GENERIC_RESOURCE_ALLOCATION_ID`) REFERENCES `generic_resource_allocation` (`RESOURCE_ALLOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_assignment`
--

LOCK TABLES `day_assignment` WRITE;
/*!40000 ALTER TABLE `day_assignment` DISABLE KEYS */;
INSERT INTO `day_assignment` VALUES (3350,'SPECIFIC_DAY',1,8,NULL,'2010-05-21',2829,3233,NULL,NULL),(3351,'SPECIFIC_DAY',1,8,NULL,'2010-05-26',2829,3233,NULL,NULL),(3352,'SPECIFIC_DAY',1,8,NULL,'2010-05-19',2829,3233,NULL,NULL),(3353,'SPECIFIC_DAY',1,0,NULL,'2010-05-23',2829,3233,NULL,NULL),(3354,'SPECIFIC_DAY',1,8,NULL,'2010-05-14',2829,3233,NULL,NULL),(3355,'SPECIFIC_DAY',1,8,NULL,'2010-05-24',2829,3233,NULL,NULL),(3356,'SPECIFIC_DAY',1,0,NULL,'2010-05-16',2829,3233,NULL,NULL),(3357,'SPECIFIC_DAY',1,0,NULL,'2010-05-22',2829,3233,NULL,NULL),(3358,'SPECIFIC_DAY',1,8,NULL,'2010-05-13',2829,3233,NULL,NULL),(3359,'SPECIFIC_DAY',1,8,NULL,'2010-05-12',2829,3233,NULL,NULL),(3360,'SPECIFIC_DAY',1,4,NULL,'2010-05-28',2829,3233,NULL,NULL),(3361,'SPECIFIC_DAY',1,8,NULL,'2010-05-18',2829,3233,NULL,NULL),(3362,'SPECIFIC_DAY',1,8,NULL,'2010-05-20',2829,3233,NULL,NULL),(3363,'SPECIFIC_DAY',1,8,NULL,'2010-05-25',2829,3233,NULL,NULL),(3364,'SPECIFIC_DAY',1,8,NULL,'2010-05-17',2829,3233,NULL,NULL),(3365,'SPECIFIC_DAY',1,8,NULL,'2010-05-27',2829,3233,NULL,NULL),(3366,'SPECIFIC_DAY',1,0,NULL,'2010-05-15',2829,3233,NULL,NULL),(5050,'SPECIFIC_DAY',11,8,NULL,'2010-05-31',1114,NULL,NULL,NULL),(5051,'SPECIFIC_DAY',11,8,NULL,'2010-05-21',1114,NULL,NULL,NULL),(5052,'SPECIFIC_DAY',11,8,NULL,'2010-05-19',1114,NULL,NULL,NULL),(5053,'SPECIFIC_DAY',11,8,NULL,'2010-05-17',1114,NULL,NULL,NULL),(5054,'SPECIFIC_DAY',11,8,NULL,'2010-05-25',1114,NULL,NULL,NULL),(5055,'SPECIFIC_DAY',11,8,NULL,'2010-05-26',1114,NULL,NULL,NULL),(5056,'SPECIFIC_DAY',11,4,NULL,'2010-06-01',1114,NULL,NULL,NULL),(5057,'SPECIFIC_DAY',11,8,NULL,'2010-05-20',1114,NULL,NULL,NULL),(5058,'SPECIFIC_DAY',11,8,NULL,'2010-05-14',1114,NULL,NULL,NULL),(5059,'SPECIFIC_DAY',11,8,NULL,'2010-05-27',1114,NULL,NULL,NULL),(5060,'SPECIFIC_DAY',11,8,NULL,'2010-05-18',1114,NULL,NULL,NULL),(5061,'SPECIFIC_DAY',11,8,NULL,'2010-05-28',1114,NULL,NULL,NULL),(5062,'SPECIFIC_DAY',11,8,NULL,'2010-05-24',1114,NULL,NULL,NULL),(5656,'SPECIFIC_DAY',1,8,NULL,'2010-08-18',1114,5454,NULL,NULL),(5657,'SPECIFIC_DAY',1,8,NULL,'2010-07-02',1114,5454,NULL,NULL),(5658,'SPECIFIC_DAY',1,8,NULL,'2010-06-25',1114,5454,NULL,NULL),(5659,'SPECIFIC_DAY',1,8,NULL,'2010-08-03',1114,5454,NULL,NULL),(5660,'SPECIFIC_DAY',1,8,NULL,'2010-08-23',1114,5454,NULL,NULL),(5661,'SPECIFIC_DAY',1,8,NULL,'2010-08-13',1114,5454,NULL,NULL),(5662,'SPECIFIC_DAY',1,4,NULL,'2010-06-02',1114,5454,NULL,NULL),(5663,'SPECIFIC_DAY',1,8,NULL,'2010-07-21',1114,5454,NULL,NULL),(5664,'SPECIFIC_DAY',1,8,NULL,'2010-08-12',1114,5454,NULL,NULL),(5665,'SPECIFIC_DAY',1,8,NULL,'2010-07-20',1114,5454,NULL,NULL),(5666,'SPECIFIC_DAY',1,8,NULL,'2010-07-05',1114,5454,NULL,NULL),(5667,'SPECIFIC_DAY',1,8,NULL,'2010-07-26',1114,5454,NULL,NULL),(5668,'SPECIFIC_DAY',1,8,NULL,'2010-08-09',1114,5454,NULL,NULL),(5669,'SPECIFIC_DAY',1,8,NULL,'2010-07-22',1114,5454,NULL,NULL),(5670,'SPECIFIC_DAY',1,8,NULL,'2010-08-05',1114,5454,NULL,NULL),(5671,'SPECIFIC_DAY',1,8,NULL,'2010-07-12',1114,5454,NULL,NULL),(5672,'SPECIFIC_DAY',1,8,NULL,'2010-07-27',1114,5454,NULL,NULL),(5673,'SPECIFIC_DAY',1,8,NULL,'2010-08-26',1114,5454,NULL,NULL),(5674,'SPECIFIC_DAY',1,8,NULL,'2010-08-16',1114,5454,NULL,NULL),(5675,'SPECIFIC_DAY',1,8,NULL,'2010-08-10',1114,5454,NULL,NULL),(5676,'SPECIFIC_DAY',1,8,NULL,'2010-07-19',1114,5454,NULL,NULL),(5677,'SPECIFIC_DAY',1,8,NULL,'2010-06-29',1114,5454,NULL,NULL),(5678,'SPECIFIC_DAY',1,8,NULL,'2010-06-16',1114,5454,NULL,NULL),(5679,'SPECIFIC_DAY',1,8,NULL,'2010-07-23',1114,5454,NULL,NULL),(5680,'SPECIFIC_DAY',1,8,NULL,'2010-06-08',1114,5454,NULL,NULL),(5681,'SPECIFIC_DAY',1,8,NULL,'2010-07-28',1114,5454,NULL,NULL),(5682,'SPECIFIC_DAY',1,8,NULL,'2010-06-10',1114,5454,NULL,NULL),(5683,'SPECIFIC_DAY',1,8,NULL,'2010-06-09',1114,5454,NULL,NULL),(5684,'SPECIFIC_DAY',1,8,NULL,'2010-06-24',1114,5454,NULL,NULL),(5685,'SPECIFIC_DAY',1,8,NULL,'2010-08-17',1114,5454,NULL,NULL),(5686,'SPECIFIC_DAY',1,8,NULL,'2010-08-06',1114,5454,NULL,NULL),(5687,'SPECIFIC_DAY',1,8,NULL,'2010-08-24',1114,5454,NULL,NULL),(5688,'SPECIFIC_DAY',1,8,NULL,'2010-06-21',1114,5454,NULL,NULL),(5689,'SPECIFIC_DAY',1,8,NULL,'2010-06-23',1114,5454,NULL,NULL),(5690,'SPECIFIC_DAY',1,8,NULL,'2010-07-16',1114,5454,NULL,NULL),(5691,'SPECIFIC_DAY',1,8,NULL,'2010-06-22',1114,5454,NULL,NULL),(5692,'SPECIFIC_DAY',1,8,NULL,'2010-06-30',1114,5454,NULL,NULL),(5693,'SPECIFIC_DAY',1,8,NULL,'2010-06-11',1114,5454,NULL,NULL),(5694,'SPECIFIC_DAY',1,8,NULL,'2010-07-13',1114,5454,NULL,NULL),(5695,'SPECIFIC_DAY',1,8,NULL,'2010-07-29',1114,5454,NULL,NULL),(5696,'SPECIFIC_DAY',1,8,NULL,'2010-08-20',1114,5454,NULL,NULL),(5697,'SPECIFIC_DAY',1,8,NULL,'2010-06-14',1114,5454,NULL,NULL),(5698,'SPECIFIC_DAY',1,8,NULL,'2010-06-15',1114,5454,NULL,NULL),(5699,'SPECIFIC_DAY',1,8,NULL,'2010-07-15',1114,5454,NULL,NULL),(5700,'SPECIFIC_DAY',1,8,NULL,'2010-07-06',1114,5454,NULL,NULL),(5701,'SPECIFIC_DAY',1,8,NULL,'2010-06-03',1114,5454,NULL,NULL),(5702,'SPECIFIC_DAY',1,8,NULL,'2010-06-07',1114,5454,NULL,NULL),(5703,'SPECIFIC_DAY',1,8,NULL,'2010-08-25',1114,5454,NULL,NULL),(5704,'SPECIFIC_DAY',1,8,NULL,'2010-06-18',1114,5454,NULL,NULL),(5705,'SPECIFIC_DAY',1,8,NULL,'2010-07-14',1114,5454,NULL,NULL),(5706,'SPECIFIC_DAY',1,8,NULL,'2010-08-02',1114,5454,NULL,NULL),(5707,'SPECIFIC_DAY',1,8,NULL,'2010-06-04',1114,5454,NULL,NULL),(5708,'SPECIFIC_DAY',1,8,NULL,'2010-07-30',1114,5454,NULL,NULL),(5709,'SPECIFIC_DAY',1,8,NULL,'2010-08-04',1114,5454,NULL,NULL),(5710,'SPECIFIC_DAY',1,8,NULL,'2010-08-11',1114,5454,NULL,NULL),(5711,'SPECIFIC_DAY',1,8,NULL,'2010-08-19',1114,5454,NULL,NULL),(5712,'SPECIFIC_DAY',1,8,NULL,'2010-07-08',1114,5454,NULL,NULL),(5713,'SPECIFIC_DAY',1,8,NULL,'2010-06-28',1114,5454,NULL,NULL),(5714,'SPECIFIC_DAY',1,8,NULL,'2010-08-27',1114,5454,NULL,NULL),(5715,'SPECIFIC_DAY',1,8,NULL,'2010-07-01',1114,5454,NULL,NULL),(5716,'SPECIFIC_DAY',1,8,NULL,'2010-07-09',1114,5454,NULL,NULL),(5717,'SPECIFIC_DAY',1,8,NULL,'2010-06-17',1114,5454,NULL,NULL),(5718,'SPECIFIC_DAY',1,8,NULL,'2010-07-07',1114,5454,NULL,NULL),(13210,'SPECIFIC_DAY',3,0,NULL,'2010-05-23',2829,6061,NULL,NULL),(13211,'SPECIFIC_DAY',3,7,NULL,'2010-05-26',2829,6061,NULL,NULL),(13212,'SPECIFIC_DAY',3,0,NULL,'2010-05-16',2829,6061,NULL,NULL),(13213,'SPECIFIC_DAY',3,7,NULL,'2010-05-17',2829,6061,NULL,NULL),(13214,'SPECIFIC_DAY',3,0,NULL,'2010-05-22',2829,6061,NULL,NULL),(13215,'SPECIFIC_DAY',3,7,NULL,'2010-05-21',2829,6061,NULL,NULL),(13216,'SPECIFIC_DAY',3,7,NULL,'2010-05-20',2829,6061,NULL,NULL),(13217,'SPECIFIC_DAY',3,7,NULL,'2010-05-24',2829,6061,NULL,NULL),(13218,'SPECIFIC_DAY',3,7,NULL,'2010-05-18',2829,6061,NULL,NULL),(13219,'SPECIFIC_DAY',3,7,NULL,'2010-05-28',2829,6061,NULL,NULL),(13220,'SPECIFIC_DAY',3,7,NULL,'2010-05-14',2829,6061,NULL,NULL),(13221,'SPECIFIC_DAY',3,7,NULL,'2010-05-25',2829,6061,NULL,NULL),(13222,'SPECIFIC_DAY',3,0,NULL,'2010-05-15',2829,6061,NULL,NULL),(13223,'SPECIFIC_DAY',3,7,NULL,'2010-05-27',2829,6061,NULL,NULL),(13224,'SPECIFIC_DAY',3,7,NULL,'2010-05-19',2829,6061,NULL,NULL),(13225,'GENERIC_DAY',3,0,NULL,'2010-05-21',1114,NULL,12633,NULL),(13226,'GENERIC_DAY',3,0,NULL,'2010-05-26',1112,NULL,12633,NULL),(13227,'GENERIC_DAY',3,0,NULL,'2010-05-15',2829,NULL,12633,NULL),(13228,'GENERIC_DAY',3,0,NULL,'2010-05-14',6970,NULL,12633,NULL),(13229,'GENERIC_DAY',3,0,NULL,'2010-05-26',2829,NULL,12633,NULL),(13230,'GENERIC_DAY',3,0,NULL,'2010-05-26',1114,NULL,12633,NULL),(13231,'GENERIC_DAY',3,0,NULL,'2010-05-16',1114,NULL,12633,NULL),(13232,'GENERIC_DAY',3,0,NULL,'2010-05-22',1112,NULL,12633,NULL),(13233,'GENERIC_DAY',3,0,NULL,'2010-05-27',1112,NULL,12633,NULL),(13234,'GENERIC_DAY',3,0,NULL,'2010-05-19',6970,NULL,12633,NULL),(13235,'GENERIC_DAY',3,0,NULL,'2010-05-21',1112,NULL,12633,NULL),(13236,'GENERIC_DAY',3,1,NULL,'2010-05-19',1114,NULL,12633,NULL),(13237,'GENERIC_DAY',3,0,NULL,'2010-05-24',1112,NULL,12633,NULL),(13238,'GENERIC_DAY',3,0,NULL,'2010-05-23',6970,NULL,12633,NULL),(13239,'GENERIC_DAY',3,0,NULL,'2010-05-17',6970,NULL,12633,NULL),(13240,'GENERIC_DAY',3,0,NULL,'2010-05-25',2829,NULL,12633,NULL),(13241,'GENERIC_DAY',3,0,NULL,'2010-05-19',2829,NULL,12633,NULL),(13242,'GENERIC_DAY',3,2,NULL,'2010-05-27',6970,NULL,12633,NULL),(13243,'GENERIC_DAY',3,0,NULL,'2010-05-20',6970,NULL,12633,NULL),(13244,'GENERIC_DAY',3,0,NULL,'2010-05-22',2829,NULL,12633,NULL),(13245,'GENERIC_DAY',3,1,NULL,'2010-05-18',1114,NULL,12633,NULL),(13246,'GENERIC_DAY',3,2,NULL,'2010-05-24',6970,NULL,12633,NULL),(13247,'GENERIC_DAY',3,0,NULL,'2010-05-24',2829,NULL,12633,NULL),(13248,'GENERIC_DAY',3,0,NULL,'2010-05-22',1114,NULL,12633,NULL),(13249,'GENERIC_DAY',3,0,NULL,'2010-05-21',2829,NULL,12633,NULL),(13250,'GENERIC_DAY',3,0,NULL,'2010-05-23',1114,NULL,12633,NULL),(13251,'GENERIC_DAY',3,0,NULL,'2010-05-15',6970,NULL,12633,NULL),(13252,'GENERIC_DAY',3,0,NULL,'2010-05-27',2829,NULL,12633,NULL),(13253,'GENERIC_DAY',3,0,NULL,'2010-05-28',1112,NULL,12633,NULL),(13254,'GENERIC_DAY',3,0,NULL,'2010-05-20',2829,NULL,12633,NULL),(13255,'GENERIC_DAY',3,2,NULL,'2010-05-28',6970,NULL,12633,NULL),(13256,'GENERIC_DAY',3,1,NULL,'2010-05-18',1112,NULL,12633,NULL),(13257,'GENERIC_DAY',3,0,NULL,'2010-05-16',1112,NULL,12633,NULL),(13258,'GENERIC_DAY',3,1,NULL,'2010-05-20',1114,NULL,12633,NULL),(13259,'GENERIC_DAY',3,2,NULL,'2010-05-14',1112,NULL,12633,NULL),(13260,'GENERIC_DAY',3,0,NULL,'2010-05-27',1114,NULL,12633,NULL),(13261,'GENERIC_DAY',3,0,NULL,'2010-05-16',6970,NULL,12633,NULL),(13262,'GENERIC_DAY',3,1,NULL,'2010-05-19',1112,NULL,12633,NULL),(13263,'GENERIC_DAY',3,2,NULL,'2010-05-26',6970,NULL,12633,NULL),(13264,'GENERIC_DAY',3,0,NULL,'2010-05-15',1114,NULL,12633,NULL),(13265,'GENERIC_DAY',3,0,NULL,'2010-05-23',2829,NULL,12633,NULL),(13266,'GENERIC_DAY',3,0,NULL,'2010-05-15',1112,NULL,12633,NULL),(13267,'GENERIC_DAY',3,2,NULL,'2010-05-21',6970,NULL,12633,NULL),(13268,'GENERIC_DAY',3,2,NULL,'2010-05-25',6970,NULL,12633,NULL),(13269,'GENERIC_DAY',3,0,NULL,'2010-05-22',6970,NULL,12633,NULL),(13270,'GENERIC_DAY',3,0,NULL,'2010-05-28',1114,NULL,12633,NULL),(13271,'GENERIC_DAY',3,0,NULL,'2010-05-17',2829,NULL,12633,NULL),(13272,'GENERIC_DAY',3,0,NULL,'2010-05-18',6970,NULL,12633,NULL),(13273,'GENERIC_DAY',3,1,NULL,'2010-05-17',1112,NULL,12633,NULL),(13274,'GENERIC_DAY',3,0,NULL,'2010-05-18',2829,NULL,12633,NULL),(13275,'GENERIC_DAY',3,0,NULL,'2010-05-14',1114,NULL,12633,NULL),(13276,'GENERIC_DAY',3,0,NULL,'2010-05-28',2829,NULL,12633,NULL),(13277,'GENERIC_DAY',3,1,NULL,'2010-05-20',1112,NULL,12633,NULL),(13278,'GENERIC_DAY',3,0,NULL,'2010-05-24',1114,NULL,12633,NULL),(13279,'GENERIC_DAY',3,1,NULL,'2010-05-17',1114,NULL,12633,NULL),(13280,'GENERIC_DAY',3,0,NULL,'2010-05-14',2829,NULL,12633,NULL),(13281,'GENERIC_DAY',3,0,NULL,'2010-05-25',1112,NULL,12633,NULL),(13282,'GENERIC_DAY',3,0,NULL,'2010-05-25',1114,NULL,12633,NULL),(13283,'GENERIC_DAY',3,0,NULL,'2010-05-16',2829,NULL,12633,NULL),(13284,'GENERIC_DAY',3,0,NULL,'2010-05-23',1112,NULL,12633,NULL),(21568,'SPECIFIC_DAY',2,8,NULL,'2010-09-03',6970,7386,NULL,NULL),(21569,'SPECIFIC_DAY',2,8,NULL,'2010-09-08',6970,7386,NULL,NULL),(21570,'SPECIFIC_DAY',2,8,NULL,'2010-09-01',6970,7386,NULL,NULL),(21571,'SPECIFIC_DAY',2,8,NULL,'2010-09-07',6970,7386,NULL,NULL),(21572,'SPECIFIC_DAY',2,2,NULL,'2010-09-09',6970,7386,NULL,NULL),(21573,'SPECIFIC_DAY',2,8,NULL,'2010-09-06',6970,7386,NULL,NULL),(21574,'SPECIFIC_DAY',2,8,NULL,'2010-09-02',6970,7386,NULL,NULL),(21575,'SPECIFIC_DAY',2,0,NULL,'2010-09-04',6970,7386,NULL,NULL),(21576,'SPECIFIC_DAY',2,0,NULL,'2010-09-05',6970,7386,NULL,NULL),(21577,'SPECIFIC_DAY',2,8,NULL,'2010-09-01',2829,7385,NULL,NULL),(21578,'SPECIFIC_DAY',2,8,NULL,'2010-09-06',2829,7385,NULL,NULL),(21579,'SPECIFIC_DAY',2,8,NULL,'2010-09-03',2829,7385,NULL,NULL),(21580,'SPECIFIC_DAY',2,8,NULL,'2010-09-08',2829,7385,NULL,NULL),(21581,'SPECIFIC_DAY',2,2,NULL,'2010-09-09',2829,7385,NULL,NULL),(21582,'SPECIFIC_DAY',2,0,NULL,'2010-09-04',2829,7385,NULL,NULL),(21583,'SPECIFIC_DAY',2,8,NULL,'2010-09-07',2829,7385,NULL,NULL),(21584,'SPECIFIC_DAY',2,8,NULL,'2010-09-02',2829,7385,NULL,NULL),(21585,'SPECIFIC_DAY',2,0,NULL,'2010-09-05',2829,7385,NULL,NULL),(22346,'GENERIC_DAY',1,0,NULL,'2011-03-26',6970,NULL,16970,NULL),(22347,'GENERIC_DAY',1,3,NULL,'2011-03-25',16062,NULL,16970,NULL),(22348,'GENERIC_DAY',1,0,NULL,'2011-03-19',16062,NULL,16970,NULL),(22349,'GENERIC_DAY',1,3,NULL,'2011-03-21',16062,NULL,16970,NULL),(22350,'GENERIC_DAY',1,3,NULL,'2011-03-28',6970,NULL,16970,NULL),(22351,'GENERIC_DAY',1,3,NULL,'2011-03-23',6970,NULL,16970,NULL),(22352,'GENERIC_DAY',1,3,NULL,'2011-03-16',6970,NULL,16970,NULL),(22353,'GENERIC_DAY',1,3,NULL,'2011-03-15',16062,NULL,16970,NULL),(22354,'GENERIC_DAY',1,2,NULL,'2011-03-15',2829,NULL,16970,NULL),(22355,'GENERIC_DAY',1,2,NULL,'2011-03-17',16060,NULL,16970,NULL),(22356,'GENERIC_DAY',1,3,NULL,'2011-03-16',16062,NULL,16970,NULL),(22357,'GENERIC_DAY',1,2,NULL,'2011-03-18',2829,NULL,16970,NULL),(22358,'GENERIC_DAY',1,0,NULL,'2011-03-20',16062,NULL,16970,NULL),(22359,'GENERIC_DAY',1,2,NULL,'2011-03-16',2829,NULL,16970,NULL),(22360,'GENERIC_DAY',1,0,NULL,'2011-03-15',16060,NULL,16970,NULL),(22361,'GENERIC_DAY',1,0,NULL,'2011-03-26',16060,NULL,16970,NULL),(22362,'GENERIC_DAY',1,3,NULL,'2011-03-29',6970,NULL,16970,NULL),(22363,'GENERIC_DAY',1,2,NULL,'2011-03-14',2829,NULL,16970,NULL),(22364,'GENERIC_DAY',1,2,NULL,'2011-03-30',16062,NULL,16970,NULL),(22365,'GENERIC_DAY',1,2,NULL,'2011-03-17',6970,NULL,16970,NULL),(22366,'GENERIC_DAY',1,0,NULL,'2011-03-12',16062,NULL,16970,NULL),(22367,'GENERIC_DAY',1,0,NULL,'2011-03-29',16060,NULL,16970,NULL),(22368,'GENERIC_DAY',1,3,NULL,'2011-03-22',16062,NULL,16970,NULL),(22369,'GENERIC_DAY',1,3,NULL,'2011-03-14',6970,NULL,16970,NULL),(22370,'GENERIC_DAY',1,3,NULL,'2011-03-15',6970,NULL,16970,NULL),(22371,'GENERIC_DAY',1,0,NULL,'2011-03-27',16060,NULL,16970,NULL),(22372,'GENERIC_DAY',1,0,NULL,'2011-03-13',16062,NULL,16970,NULL),(22373,'GENERIC_DAY',1,3,NULL,'2011-03-18',16062,NULL,16970,NULL),(22374,'GENERIC_DAY',1,2,NULL,'2011-03-28',2829,NULL,16970,NULL),(22375,'GENERIC_DAY',1,3,NULL,'2011-03-21',6970,NULL,16970,NULL),(22376,'GENERIC_DAY',1,3,NULL,'2011-03-14',16062,NULL,16970,NULL),(22377,'GENERIC_DAY',1,0,NULL,'2011-03-19',2829,NULL,16970,NULL),(22378,'GENERIC_DAY',1,0,NULL,'2011-03-21',16060,NULL,16970,NULL),(22379,'GENERIC_DAY',1,2,NULL,'2011-03-24',16062,NULL,16970,NULL),(22380,'GENERIC_DAY',1,0,NULL,'2011-03-13',2829,NULL,16970,NULL),(22381,'GENERIC_DAY',1,0,NULL,'2011-03-26',16062,NULL,16970,NULL),(22382,'GENERIC_DAY',1,1,NULL,'2011-03-30',2829,NULL,16970,NULL),(22383,'GENERIC_DAY',1,0,NULL,'2011-03-12',16060,NULL,16970,NULL),(22384,'GENERIC_DAY',1,0,NULL,'2011-03-12',6970,NULL,16970,NULL),(22385,'GENERIC_DAY',1,3,NULL,'2011-03-25',6970,NULL,16970,NULL),(22386,'GENERIC_DAY',1,0,NULL,'2011-03-30',16060,NULL,16970,NULL),(22387,'GENERIC_DAY',1,0,NULL,'2011-03-27',16062,NULL,16970,NULL),(22388,'GENERIC_DAY',1,0,NULL,'2011-03-18',16060,NULL,16970,NULL),(22389,'GENERIC_DAY',1,2,NULL,'2011-03-23',2829,NULL,16970,NULL),(22390,'GENERIC_DAY',1,0,NULL,'2011-03-27',2829,NULL,16970,NULL),(22391,'GENERIC_DAY',1,0,NULL,'2011-03-20',16060,NULL,16970,NULL),(22392,'GENERIC_DAY',1,2,NULL,'2011-03-17',2829,NULL,16970,NULL),(22393,'GENERIC_DAY',1,0,NULL,'2011-03-25',16060,NULL,16970,NULL),(22394,'GENERIC_DAY',1,2,NULL,'2011-03-24',6970,NULL,16970,NULL),(22395,'GENERIC_DAY',1,0,NULL,'2011-03-23',16060,NULL,16970,NULL),(22396,'GENERIC_DAY',1,0,NULL,'2011-03-19',6970,NULL,16970,NULL),(22397,'GENERIC_DAY',1,3,NULL,'2011-03-18',6970,NULL,16970,NULL),(22398,'GENERIC_DAY',1,2,NULL,'2011-03-21',2829,NULL,16970,NULL),(22399,'GENERIC_DAY',1,0,NULL,'2011-03-12',2829,NULL,16970,NULL),(22400,'GENERIC_DAY',1,2,NULL,'2011-03-24',16060,NULL,16970,NULL),(22401,'GENERIC_DAY',1,2,NULL,'2011-03-22',2829,NULL,16970,NULL),(22402,'GENERIC_DAY',1,0,NULL,'2011-03-19',16060,NULL,16970,NULL),(22403,'GENERIC_DAY',1,0,NULL,'2011-03-20',6970,NULL,16970,NULL),(22404,'GENERIC_DAY',1,3,NULL,'2011-03-22',6970,NULL,16970,NULL),(22405,'GENERIC_DAY',1,2,NULL,'2011-03-25',2829,NULL,16970,NULL),(22406,'GENERIC_DAY',1,3,NULL,'2011-03-28',16062,NULL,16970,NULL),(22407,'GENERIC_DAY',1,0,NULL,'2011-03-13',6970,NULL,16970,NULL),(22408,'GENERIC_DAY',1,0,NULL,'2011-03-22',16060,NULL,16970,NULL),(22409,'GENERIC_DAY',1,3,NULL,'2011-03-23',16062,NULL,16970,NULL),(22410,'GENERIC_DAY',1,0,NULL,'2011-03-26',2829,NULL,16970,NULL),(22411,'GENERIC_DAY',1,2,NULL,'2011-03-17',16062,NULL,16970,NULL),(22412,'GENERIC_DAY',1,1,NULL,'2011-03-30',6970,NULL,16970,NULL),(22413,'GENERIC_DAY',1,0,NULL,'2011-03-20',2829,NULL,16970,NULL),(22414,'GENERIC_DAY',1,3,NULL,'2011-03-29',16062,NULL,16970,NULL),(22415,'GENERIC_DAY',1,0,NULL,'2011-03-14',16060,NULL,16970,NULL),(22416,'GENERIC_DAY',1,0,NULL,'2011-03-28',16060,NULL,16970,NULL),(22417,'GENERIC_DAY',1,2,NULL,'2011-03-24',2829,NULL,16970,NULL),(22418,'GENERIC_DAY',1,0,NULL,'2011-03-13',16060,NULL,16970,NULL),(22419,'GENERIC_DAY',1,0,NULL,'2011-03-27',6970,NULL,16970,NULL),(22420,'GENERIC_DAY',1,2,NULL,'2011-03-29',2829,NULL,16970,NULL),(22421,'GENERIC_DAY',1,0,NULL,'2011-03-16',16060,NULL,16970,NULL),(27134,'GENERIC_DAY',0,3,NULL,'2011-06-17',1114,NULL,16971,NULL),(27135,'GENERIC_DAY',0,0,NULL,'2011-08-20',2829,NULL,16971,NULL),(27136,'GENERIC_DAY',0,3,NULL,'2011-04-22',6970,NULL,16971,NULL),(27137,'GENERIC_DAY',0,2,NULL,'2011-07-22',6970,NULL,16971,NULL),(27138,'GENERIC_DAY',0,0,NULL,'2011-04-30',20001,NULL,16971,NULL),(27139,'GENERIC_DAY',0,0,NULL,'2011-04-17',16060,NULL,16971,NULL),(27140,'GENERIC_DAY',0,0,NULL,'2011-08-01',16060,NULL,16971,NULL),(27141,'GENERIC_DAY',0,0,NULL,'2011-06-26',20001,NULL,16971,NULL),(27142,'GENERIC_DAY',0,2,NULL,'2011-04-14',2829,NULL,16971,NULL),(27143,'GENERIC_DAY',0,2,NULL,'2011-08-26',6970,NULL,16971,NULL),(27144,'GENERIC_DAY',0,2,NULL,'2011-06-28',2829,NULL,16971,NULL),(27145,'GENERIC_DAY',0,0,NULL,'2011-08-13',6970,NULL,16971,NULL),(27146,'GENERIC_DAY',0,2,NULL,'2011-09-21',2829,NULL,16971,NULL),(27147,'GENERIC_DAY',0,3,NULL,'2011-07-12',1114,NULL,16971,NULL),(27148,'GENERIC_DAY',0,2,NULL,'2011-06-30',20001,NULL,16971,NULL),(27149,'GENERIC_DAY',0,0,NULL,'2011-06-27',16060,NULL,16971,NULL),(27150,'GENERIC_DAY',0,2,NULL,'2011-05-13',2829,NULL,16971,NULL),(27151,'GENERIC_DAY',0,2,NULL,'2011-09-29',16060,NULL,16971,NULL),(27152,'GENERIC_DAY',0,2,NULL,'2011-07-07',2829,NULL,16971,NULL),(27153,'GENERIC_DAY',0,2,NULL,'2011-04-18',19999,NULL,16971,NULL),(27154,'GENERIC_DAY',0,2,NULL,'2011-08-22',19999,NULL,16971,NULL),(27155,'GENERIC_DAY',0,2,NULL,'2011-07-27',19999,NULL,16971,NULL),(27156,'GENERIC_DAY',0,2,NULL,'2011-09-05',19999,NULL,16971,NULL),(27157,'GENERIC_DAY',0,2,NULL,'2011-04-08',20001,NULL,16971,NULL),(27158,'GENERIC_DAY',0,0,NULL,'2011-07-17',20001,NULL,16971,NULL),(27159,'GENERIC_DAY',0,0,NULL,'2011-05-06',16060,NULL,16971,NULL),(27160,'GENERIC_DAY',0,3,NULL,'2011-05-03',1112,NULL,16971,NULL),(27161,'GENERIC_DAY',0,3,NULL,'2011-09-13',1114,NULL,16971,NULL),(27162,'GENERIC_DAY',0,0,NULL,'2011-08-27',16062,NULL,16971,NULL),(27163,'GENERIC_DAY',0,2,NULL,'2011-05-31',20001,NULL,16971,NULL),(27164,'GENERIC_DAY',0,0,NULL,'2011-05-25',16060,NULL,16971,NULL),(27165,'GENERIC_DAY',0,0,NULL,'2011-06-18',16062,NULL,16971,NULL),(27166,'GENERIC_DAY',0,0,NULL,'2011-06-12',1112,NULL,16971,NULL),(27167,'GENERIC_DAY',0,3,NULL,'2011-05-20',1112,NULL,16971,NULL),(27168,'GENERIC_DAY',0,2,NULL,'2011-05-09',6970,NULL,16971,NULL),(27169,'GENERIC_DAY',0,2,NULL,'2011-05-30',20001,NULL,16971,NULL),(27170,'GENERIC_DAY',0,3,NULL,'2011-06-29',1114,NULL,16971,NULL),(27171,'GENERIC_DAY',0,0,NULL,'2011-08-03',16060,NULL,16971,NULL),(27172,'GENERIC_DAY',0,2,NULL,'2011-07-21',20001,NULL,16971,NULL),(27173,'GENERIC_DAY',0,2,NULL,'2011-08-31',20001,NULL,16971,NULL),(27174,'GENERIC_DAY',0,2,NULL,'2011-09-20',2829,NULL,16971,NULL),(27175,'GENERIC_DAY',0,2,NULL,'2011-09-15',1112,NULL,16971,NULL),(27176,'GENERIC_DAY',0,0,NULL,'2011-05-22',2829,NULL,16971,NULL),(27177,'GENERIC_DAY',0,2,NULL,'2011-05-26',20001,NULL,16971,NULL),(27178,'GENERIC_DAY',0,0,NULL,'2011-06-05',16062,NULL,16971,NULL),(27179,'GENERIC_DAY',0,2,NULL,'2011-08-19',20001,NULL,16971,NULL),(27180,'GENERIC_DAY',0,3,NULL,'2011-05-02',1112,NULL,16971,NULL),(27181,'GENERIC_DAY',0,3,NULL,'2011-04-12',1112,NULL,16971,NULL),(27182,'GENERIC_DAY',0,3,NULL,'2011-06-21',1114,NULL,16971,NULL),(27183,'GENERIC_DAY',0,2,NULL,'2011-05-09',16062,NULL,16971,NULL),(27184,'GENERIC_DAY',0,2,NULL,'2011-06-30',2829,NULL,16971,NULL),(27185,'GENERIC_DAY',0,2,NULL,'2011-05-19',2829,NULL,16971,NULL),(27186,'GENERIC_DAY',0,2,NULL,'2011-09-09',20001,NULL,16971,NULL),(27187,'GENERIC_DAY',0,2,NULL,'2011-04-22',20001,NULL,16971,NULL),(27188,'GENERIC_DAY',0,2,NULL,'2011-05-26',1114,NULL,16971,NULL),(27189,'GENERIC_DAY',0,0,NULL,'2011-09-20',16060,NULL,16971,NULL),(27190,'GENERIC_DAY',0,0,NULL,'2011-06-12',20001,NULL,16971,NULL),(27191,'GENERIC_DAY',0,3,NULL,'2011-07-22',1112,NULL,16971,NULL),(27192,'GENERIC_DAY',0,2,NULL,'2011-08-15',20001,NULL,16971,NULL),(27193,'GENERIC_DAY',0,0,NULL,'2011-06-13',16060,NULL,16971,NULL),(27194,'GENERIC_DAY',0,0,NULL,'2011-05-15',2829,NULL,16971,NULL),(27195,'GENERIC_DAY',0,0,NULL,'2011-07-09',20001,NULL,16971,NULL),(27196,'GENERIC_DAY',0,2,NULL,'2011-09-19',2829,NULL,16971,NULL),(27197,'GENERIC_DAY',0,3,NULL,'2011-06-07',1114,NULL,16971,NULL),(27198,'GENERIC_DAY',0,2,NULL,'2011-06-02',20001,NULL,16971,NULL),(27199,'GENERIC_DAY',0,2,NULL,'2011-06-13',19999,NULL,16971,NULL),(27200,'GENERIC_DAY',0,3,NULL,'2011-07-26',1112,NULL,16971,NULL),(27201,'GENERIC_DAY',0,2,NULL,'2011-08-18',1114,NULL,16971,NULL),(27202,'GENERIC_DAY',0,2,NULL,'2011-07-29',2829,NULL,16971,NULL),(27203,'GENERIC_DAY',0,3,NULL,'2011-05-03',1114,NULL,16971,NULL),(27204,'GENERIC_DAY',0,0,NULL,'2011-05-04',16060,NULL,16971,NULL),(27205,'GENERIC_DAY',0,2,NULL,'2011-08-11',16060,NULL,16971,NULL),(27206,'GENERIC_DAY',0,2,NULL,'2011-09-07',2829,NULL,16971,NULL),(27207,'GENERIC_DAY',0,0,NULL,'2011-07-02',1112,NULL,16971,NULL),(27208,'GENERIC_DAY',0,3,NULL,'2011-04-18',1114,NULL,16971,NULL),(27209,'GENERIC_DAY',0,2,NULL,'2011-08-19',2829,NULL,16971,NULL),(27210,'GENERIC_DAY',0,2,NULL,'2011-08-12',2829,NULL,16971,NULL),(27211,'GENERIC_DAY',0,2,NULL,'2011-07-25',19999,NULL,16971,NULL),(27212,'GENERIC_DAY',0,2,NULL,'2011-07-14',6970,NULL,16971,NULL),(27213,'GENERIC_DAY',0,2,NULL,'2011-07-27',16062,NULL,16971,NULL),(27214,'GENERIC_DAY',0,0,NULL,'2011-08-06',16060,NULL,16971,NULL),(27215,'GENERIC_DAY',0,0,NULL,'2011-05-01',1114,NULL,16971,NULL),(27216,'GENERIC_DAY',0,0,NULL,'2011-05-28',20001,NULL,16971,NULL),(27217,'GENERIC_DAY',0,3,NULL,'2011-05-16',1112,NULL,16971,NULL),(27218,'GENERIC_DAY',0,0,NULL,'2011-05-14',16062,NULL,16971,NULL),(27219,'GENERIC_DAY',0,0,NULL,'2011-06-05',2829,NULL,16971,NULL),(27220,'GENERIC_DAY',0,0,NULL,'2011-04-24',1114,NULL,16971,NULL),(27221,'GENERIC_DAY',0,2,NULL,'2011-06-27',19999,NULL,16971,NULL),(27222,'GENERIC_DAY',0,0,NULL,'2011-04-12',16060,NULL,16971,NULL),(27223,'GENERIC_DAY',0,0,NULL,'2011-05-03',16060,NULL,16971,NULL),(27224,'GENERIC_DAY',0,0,NULL,'2011-04-16',2829,NULL,16971,NULL),(27225,'GENERIC_DAY',0,3,NULL,'2011-08-05',1112,NULL,16971,NULL),(27226,'GENERIC_DAY',0,2,NULL,'2011-09-26',6970,NULL,16971,NULL),(27227,'GENERIC_DAY',0,2,NULL,'2011-06-22',6970,NULL,16971,NULL),(27228,'GENERIC_DAY',0,2,NULL,'2011-06-13',16062,NULL,16971,NULL),(27229,'GENERIC_DAY',0,2,NULL,'2011-07-26',19999,NULL,16971,NULL),(27230,'GENERIC_DAY',0,2,NULL,'2011-07-28',19999,NULL,16971,NULL),(27231,'GENERIC_DAY',0,0,NULL,'2011-05-31',16060,NULL,16971,NULL),(27232,'GENERIC_DAY',0,3,NULL,'2011-05-10',1112,NULL,16971,NULL),(27233,'GENERIC_DAY',0,0,NULL,'2011-04-17',2829,NULL,16971,NULL),(27234,'GENERIC_DAY',0,0,NULL,'2011-05-29',6970,NULL,16971,NULL),(27235,'GENERIC_DAY',0,2,NULL,'2011-09-20',20001,NULL,16971,NULL),(27236,'GENERIC_DAY',0,2,NULL,'2011-07-19',2829,NULL,16971,NULL),(27237,'GENERIC_DAY',0,2,NULL,'2011-05-06',2829,NULL,16971,NULL),(27238,'GENERIC_DAY',0,2,NULL,'2011-06-15',2829,NULL,16971,NULL),(27239,'GENERIC_DAY',0,2,NULL,'2011-09-08',20001,NULL,16971,NULL),(27240,'GENERIC_DAY',0,3,NULL,'2011-06-13',1112,NULL,16971,NULL),(27241,'GENERIC_DAY',0,2,NULL,'2011-06-07',16062,NULL,16971,NULL),(27242,'GENERIC_DAY',0,2,NULL,'2011-09-05',20001,NULL,16971,NULL),(27243,'GENERIC_DAY',0,3,NULL,'2011-06-06',1114,NULL,16971,NULL),(27244,'GENERIC_DAY',0,3,NULL,'2011-05-06',1114,NULL,16971,NULL),(27245,'GENERIC_DAY',0,3,NULL,'2011-08-29',1112,NULL,16971,NULL),(27246,'GENERIC_DAY',0,2,NULL,'2011-06-08',20001,NULL,16971,NULL),(27247,'GENERIC_DAY',0,2,NULL,'2011-09-07',16062,NULL,16971,NULL),(27248,'GENERIC_DAY',0,0,NULL,'2011-07-10',6970,NULL,16971,NULL),(27249,'GENERIC_DAY',0,2,NULL,'2011-05-19',16062,NULL,16971,NULL),(27250,'GENERIC_DAY',0,2,NULL,'2011-07-04',20001,NULL,16971,NULL),(27251,'GENERIC_DAY',0,0,NULL,'2011-05-20',16060,NULL,16971,NULL),(27252,'GENERIC_DAY',0,3,NULL,'2011-04-08',6970,NULL,16971,NULL),(27253,'GENERIC_DAY',0,2,NULL,'2011-06-15',16062,NULL,16971,NULL),(27254,'GENERIC_DAY',0,0,NULL,'2011-06-18',2829,NULL,16971,NULL),(27255,'GENERIC_DAY',0,0,NULL,'2011-04-30',19999,NULL,16971,NULL),(27256,'GENERIC_DAY',0,0,NULL,'2011-04-10',6970,NULL,16971,NULL),(27257,'GENERIC_DAY',0,0,NULL,'2011-08-07',16060,NULL,16971,NULL),(27258,'GENERIC_DAY',0,2,NULL,'2011-05-24',19999,NULL,16971,NULL),(27259,'GENERIC_DAY',0,0,NULL,'2011-04-10',16060,NULL,16971,NULL),(27260,'GENERIC_DAY',0,2,NULL,'2011-05-23',19999,NULL,16971,NULL),(27261,'GENERIC_DAY',0,2,NULL,'2011-04-11',19999,NULL,16971,NULL),(27262,'GENERIC_DAY',0,0,NULL,'2011-07-29',16060,NULL,16971,NULL),(27263,'GENERIC_DAY',0,2,NULL,'2011-06-03',6970,NULL,16971,NULL),(27264,'GENERIC_DAY',0,3,NULL,'2011-09-14',1114,NULL,16971,NULL),(27265,'GENERIC_DAY',0,2,NULL,'2011-08-03',2829,NULL,16971,NULL),(27266,'GENERIC_DAY',0,0,NULL,'2011-09-07',16060,NULL,16971,NULL),(27267,'GENERIC_DAY',0,0,NULL,'2011-04-16',19999,NULL,16971,NULL),(27268,'GENERIC_DAY',0,0,NULL,'2011-09-17',19999,NULL,16971,NULL),(27269,'GENERIC_DAY',0,2,NULL,'2011-07-04',2829,NULL,16971,NULL),(27270,'GENERIC_DAY',0,2,NULL,'2011-09-22',2829,NULL,16971,NULL),(27271,'GENERIC_DAY',0,3,NULL,'2011-09-23',1114,NULL,16971,NULL),(27272,'GENERIC_DAY',0,0,NULL,'2011-04-09',2829,NULL,16971,NULL),(27273,'GENERIC_DAY',0,3,NULL,'2011-09-26',1112,NULL,16971,NULL),(27274,'GENERIC_DAY',0,0,NULL,'2011-08-13',20001,NULL,16971,NULL),(27275,'GENERIC_DAY',0,3,NULL,'2011-08-10',1112,NULL,16971,NULL),(27276,'GENERIC_DAY',0,2,NULL,'2011-08-08',19999,NULL,16971,NULL),(27277,'GENERIC_DAY',0,2,NULL,'2011-08-30',2829,NULL,16971,NULL),(27278,'GENERIC_DAY',0,2,NULL,'2011-07-08',2829,NULL,16971,NULL),(27279,'GENERIC_DAY',0,0,NULL,'2011-08-02',16060,NULL,16971,NULL),(27280,'GENERIC_DAY',0,0,NULL,'2011-06-19',2829,NULL,16971,NULL),(27281,'GENERIC_DAY',0,2,NULL,'2011-06-27',2829,NULL,16971,NULL),(27282,'GENERIC_DAY',0,2,NULL,'2011-06-23',19999,NULL,16971,NULL),(27283,'GENERIC_DAY',0,2,NULL,'2011-06-21',2829,NULL,16971,NULL),(27284,'GENERIC_DAY',0,0,NULL,'2011-05-14',1114,NULL,16971,NULL),(27285,'GENERIC_DAY',0,2,NULL,'2011-06-30',1112,NULL,16971,NULL),(27286,'GENERIC_DAY',0,3,NULL,'2011-06-17',1112,NULL,16971,NULL),(27287,'GENERIC_DAY',0,3,NULL,'2011-04-29',1112,NULL,16971,NULL),(27288,'GENERIC_DAY',0,2,NULL,'2011-06-07',2829,NULL,16971,NULL),(27289,'GENERIC_DAY',0,2,NULL,'2011-06-21',19999,NULL,16971,NULL),(27290,'GENERIC_DAY',0,2,NULL,'2011-05-05',6970,NULL,16971,NULL),(27291,'GENERIC_DAY',0,0,NULL,'2011-04-23',2829,NULL,16971,NULL),(27292,'GENERIC_DAY',0,3,NULL,'2011-04-11',1114,NULL,16971,NULL),(27293,'GENERIC_DAY',0,2,NULL,'2011-05-12',19999,NULL,16971,NULL),(27294,'GENERIC_DAY',0,2,NULL,'2011-08-05',19999,NULL,16971,NULL),(27295,'GENERIC_DAY',0,2,NULL,'2011-06-02',16062,NULL,16971,NULL),(27296,'GENERIC_DAY',0,3,NULL,'2011-09-02',1114,NULL,16971,NULL),(27297,'GENERIC_DAY',0,2,NULL,'2011-05-20',16062,NULL,16971,NULL),(27298,'GENERIC_DAY',0,2,NULL,'2011-05-11',6970,NULL,16971,NULL),(27299,'GENERIC_DAY',0,2,NULL,'2011-08-11',19999,NULL,16971,NULL),(27300,'GENERIC_DAY',0,0,NULL,'2011-07-16',16062,NULL,16971,NULL),(27301,'GENERIC_DAY',0,2,NULL,'2011-09-26',19999,NULL,16971,NULL),(27302,'GENERIC_DAY',0,3,NULL,'2011-09-19',1114,NULL,16971,NULL),(27303,'GENERIC_DAY',0,0,NULL,'2011-07-02',6970,NULL,16971,NULL),(27304,'GENERIC_DAY',0,2,NULL,'2011-09-22',1112,NULL,16971,NULL),(27305,'GENERIC_DAY',0,0,NULL,'2011-09-04',19999,NULL,16971,NULL),(27306,'GENERIC_DAY',0,2,NULL,'2011-07-11',20001,NULL,16971,NULL),(27307,'GENERIC_DAY',0,3,NULL,'2011-09-09',1112,NULL,16971,NULL),(27308,'GENERIC_DAY',0,0,NULL,'2011-04-30',16060,NULL,16971,NULL),(27309,'GENERIC_DAY',0,2,NULL,'2011-05-03',20001,NULL,16971,NULL),(27310,'GENERIC_DAY',0,0,NULL,'2011-04-11',16060,NULL,16971,NULL),(27311,'GENERIC_DAY',0,2,NULL,'2011-05-04',19999,NULL,16971,NULL),(27312,'GENERIC_DAY',0,2,NULL,'2011-04-11',20001,NULL,16971,NULL),(27313,'GENERIC_DAY',0,0,NULL,'2011-05-21',20001,NULL,16971,NULL),(27314,'GENERIC_DAY',0,0,NULL,'2011-06-04',2829,NULL,16971,NULL),(27315,'GENERIC_DAY',0,3,NULL,'2011-08-30',1112,NULL,16971,NULL),(27316,'GENERIC_DAY',0,2,NULL,'2011-06-07',19999,NULL,16971,NULL),(27317,'GENERIC_DAY',0,2,NULL,'2011-09-09',2829,NULL,16971,NULL),(27318,'GENERIC_DAY',0,3,NULL,'2011-05-11',1114,NULL,16971,NULL),(27319,'GENERIC_DAY',0,2,NULL,'2011-05-19',1114,NULL,16971,NULL),(27320,'GENERIC_DAY',0,2,NULL,'2011-07-19',16062,NULL,16971,NULL),(27321,'GENERIC_DAY',0,3,NULL,'2011-04-22',1112,NULL,16971,NULL),(27322,'GENERIC_DAY',0,2,NULL,'2011-04-15',19999,NULL,16971,NULL),(27323,'GENERIC_DAY',0,0,NULL,'2011-06-25',19999,NULL,16971,NULL),(27324,'GENERIC_DAY',0,2,NULL,'2011-09-05',6970,NULL,16971,NULL),(27325,'GENERIC_DAY',0,0,NULL,'2011-07-10',2829,NULL,16971,NULL),(27326,'GENERIC_DAY',0,2,NULL,'2011-06-24',20001,NULL,16971,NULL),(27327,'GENERIC_DAY',0,3,NULL,'2011-08-08',1112,NULL,16971,NULL),(27328,'GENERIC_DAY',0,2,NULL,'2011-07-01',20001,NULL,16971,NULL),(27329,'GENERIC_DAY',0,2,NULL,'2011-06-14',16062,NULL,16971,NULL),(27330,'GENERIC_DAY',0,2,NULL,'2011-08-11',1114,NULL,16971,NULL),(27331,'GENERIC_DAY',0,0,NULL,'2011-05-28',1112,NULL,16971,NULL),(27332,'GENERIC_DAY',0,3,NULL,'2011-04-14',1112,NULL,16971,NULL),(27333,'GENERIC_DAY',0,2,NULL,'2011-06-24',19999,NULL,16971,NULL),(27334,'GENERIC_DAY',0,2,NULL,'2011-08-18',2829,NULL,16971,NULL),(27335,'GENERIC_DAY',0,2,NULL,'2011-05-26',1112,NULL,16971,NULL),(27336,'GENERIC_DAY',0,0,NULL,'2011-08-06',16062,NULL,16971,NULL),(27337,'GENERIC_DAY',0,3,NULL,'2011-05-18',1114,NULL,16971,NULL),(27338,'GENERIC_DAY',0,2,NULL,'2011-08-17',19999,NULL,16971,NULL),(27339,'GENERIC_DAY',0,2,NULL,'2011-09-15',6970,NULL,16971,NULL),(27340,'GENERIC_DAY',0,0,NULL,'2011-05-08',20001,NULL,16971,NULL),(27341,'GENERIC_DAY',0,0,NULL,'2011-06-12',16060,NULL,16971,NULL),(27342,'GENERIC_DAY',0,0,NULL,'2011-06-14',16060,NULL,16971,NULL),(27343,'GENERIC_DAY',0,2,NULL,'2011-05-09',20001,NULL,16971,NULL),(27344,'GENERIC_DAY',0,0,NULL,'2011-08-14',20001,NULL,16971,NULL),(27345,'GENERIC_DAY',0,0,NULL,'2011-08-19',16060,NULL,16971,NULL),(27346,'GENERIC_DAY',0,0,NULL,'2011-05-08',1114,NULL,16971,NULL),(27347,'GENERIC_DAY',0,3,NULL,'2011-08-31',1114,NULL,16971,NULL),(27348,'GENERIC_DAY',0,2,NULL,'2011-04-29',16062,NULL,16971,NULL),(27349,'GENERIC_DAY',0,0,NULL,'2011-06-19',16060,NULL,16971,NULL),(27350,'GENERIC_DAY',0,2,NULL,'2011-07-21',19999,NULL,16971,NULL),(27351,'GENERIC_DAY',0,2,NULL,'2011-05-23',20001,NULL,16971,NULL),(27352,'GENERIC_DAY',0,2,NULL,'2011-07-20',2829,NULL,16971,NULL),(27353,'GENERIC_DAY',0,0,NULL,'2011-09-10',2829,NULL,16971,NULL),(27354,'GENERIC_DAY',0,3,NULL,'2011-05-31',1114,NULL,16971,NULL),(27355,'GENERIC_DAY',0,2,NULL,'2011-08-11',2829,NULL,16971,NULL),(27356,'GENERIC_DAY',0,3,NULL,'2011-07-25',1114,NULL,16971,NULL),(27357,'GENERIC_DAY',0,0,NULL,'2011-06-12',2829,NULL,16971,NULL),(27358,'GENERIC_DAY',0,0,NULL,'2011-09-03',20001,NULL,16971,NULL),(27359,'GENERIC_DAY',0,2,NULL,'2011-05-12',16062,NULL,16971,NULL),(27360,'GENERIC_DAY',0,2,NULL,'2011-09-02',6970,NULL,16971,NULL),(27361,'GENERIC_DAY',0,0,NULL,'2011-05-15',19999,NULL,16971,NULL),(27362,'GENERIC_DAY',0,3,NULL,'2011-06-15',1114,NULL,16971,NULL),(27363,'GENERIC_DAY',0,3,NULL,'2011-04-11',2829,NULL,16971,NULL),(27364,'GENERIC_DAY',0,2,NULL,'2011-08-04',16062,NULL,16971,NULL),(27365,'GENERIC_DAY',0,0,NULL,'2011-06-25',16062,NULL,16971,NULL),(27366,'GENERIC_DAY',0,3,NULL,'2011-07-04',1114,NULL,16971,NULL),(27367,'GENERIC_DAY',0,3,NULL,'2011-09-19',1112,NULL,16971,NULL),(27368,'GENERIC_DAY',0,0,NULL,'2011-07-02',19999,NULL,16971,NULL),(27369,'GENERIC_DAY',0,2,NULL,'2011-06-10',2829,NULL,16971,NULL),(27370,'GENERIC_DAY',0,2,NULL,'2011-08-05',6970,NULL,16971,NULL),(27371,'GENERIC_DAY',0,0,NULL,'2011-08-07',20001,NULL,16971,NULL),(27372,'GENERIC_DAY',0,2,NULL,'2011-09-13',6970,NULL,16971,NULL),(27373,'GENERIC_DAY',0,0,NULL,'2011-07-02',1114,NULL,16971,NULL),(27374,'GENERIC_DAY',0,0,NULL,'2011-08-06',2829,NULL,16971,NULL),(27375,'GENERIC_DAY',0,3,NULL,'2011-04-11',1112,NULL,16971,NULL),(27376,'GENERIC_DAY',0,2,NULL,'2011-08-10',2829,NULL,16971,NULL),(27377,'GENERIC_DAY',0,2,NULL,'2011-05-31',19999,NULL,16971,NULL),(27378,'GENERIC_DAY',0,2,NULL,'2011-09-06',20001,NULL,16971,NULL),(27379,'GENERIC_DAY',0,2,NULL,'2011-07-11',2829,NULL,16971,NULL),(27380,'GENERIC_DAY',0,2,NULL,'2011-06-28',16062,NULL,16971,NULL),(27381,'GENERIC_DAY',0,2,NULL,'2011-05-12',6970,NULL,16971,NULL),(27382,'GENERIC_DAY',0,0,NULL,'2011-05-21',1112,NULL,16971,NULL),(27383,'GENERIC_DAY',0,2,NULL,'2011-07-25',20001,NULL,16971,NULL),(27384,'GENERIC_DAY',0,0,NULL,'2011-08-21',20001,NULL,16971,NULL),(27385,'GENERIC_DAY',0,0,NULL,'2011-07-09',16060,NULL,16971,NULL),(27386,'GENERIC_DAY',0,2,NULL,'2011-09-21',20001,NULL,16971,NULL),(27387,'GENERIC_DAY',0,2,NULL,'2011-04-21',2829,NULL,16971,NULL),(27388,'GENERIC_DAY',0,0,NULL,'2011-09-04',16062,NULL,16971,NULL),(27389,'GENERIC_DAY',0,0,NULL,'2011-08-20',1114,NULL,16971,NULL),(27390,'GENERIC_DAY',0,3,NULL,'2011-06-15',1112,NULL,16971,NULL),(27391,'GENERIC_DAY',0,2,NULL,'2011-08-22',20001,NULL,16971,NULL),(27392,'GENERIC_DAY',0,0,NULL,'2011-07-16',1114,NULL,16971,NULL),(27393,'GENERIC_DAY',0,3,NULL,'2011-07-11',1112,NULL,16971,NULL),(27394,'GENERIC_DAY',0,2,NULL,'2011-06-24',16062,NULL,16971,NULL),(27395,'GENERIC_DAY',0,2,NULL,'2011-06-29',2829,NULL,16971,NULL),(27396,'GENERIC_DAY',0,0,NULL,'2011-09-16',16060,NULL,16971,NULL),(27397,'GENERIC_DAY',0,0,NULL,'2011-05-17',16060,NULL,16971,NULL),(27398,'GENERIC_DAY',0,2,NULL,'2011-07-01',19999,NULL,16971,NULL),(27399,'GENERIC_DAY',0,0,NULL,'2011-04-30',6970,NULL,16971,NULL),(27400,'GENERIC_DAY',0,0,NULL,'2011-05-22',19999,NULL,16971,NULL),(27401,'GENERIC_DAY',0,3,NULL,'2011-04-12',6970,NULL,16971,NULL),(27402,'GENERIC_DAY',0,3,NULL,'2011-09-07',1112,NULL,16971,NULL),(27403,'GENERIC_DAY',0,3,NULL,'2011-05-16',1114,NULL,16971,NULL),(27404,'GENERIC_DAY',0,2,NULL,'2011-07-22',19999,NULL,16971,NULL),(27405,'GENERIC_DAY',0,2,NULL,'2011-06-29',20001,NULL,16971,NULL),(27406,'GENERIC_DAY',0,3,NULL,'2011-05-25',1114,NULL,16971,NULL),(27407,'GENERIC_DAY',0,3,NULL,'2011-08-03',1112,NULL,16971,NULL),(27408,'GENERIC_DAY',0,2,NULL,'2011-05-24',6970,NULL,16971,NULL),(27409,'GENERIC_DAY',0,0,NULL,'2011-08-13',19999,NULL,16971,NULL),(27410,'GENERIC_DAY',0,3,NULL,'2011-04-08',1112,NULL,16971,NULL),(27411,'GENERIC_DAY',0,2,NULL,'2011-08-25',16062,NULL,16971,NULL),(27412,'GENERIC_DAY',0,0,NULL,'2011-08-28',16060,NULL,16971,NULL),(27413,'GENERIC_DAY',0,2,NULL,'2011-07-28',16062,NULL,16971,NULL),(27414,'GENERIC_DAY',0,2,NULL,'2011-06-17',19999,NULL,16971,NULL),(27415,'GENERIC_DAY',0,0,NULL,'2011-07-17',6970,NULL,16971,NULL),(27416,'GENERIC_DAY',0,2,NULL,'2011-08-17',16062,NULL,16971,NULL),(27417,'GENERIC_DAY',0,0,NULL,'2011-04-19',16060,NULL,16971,NULL),(27418,'GENERIC_DAY',0,3,NULL,'2011-04-20',6970,NULL,16971,NULL),(27419,'GENERIC_DAY',0,0,NULL,'2011-07-30',20001,NULL,16971,NULL),(27420,'GENERIC_DAY',0,2,NULL,'2011-06-02',1112,NULL,16971,NULL),(27421,'GENERIC_DAY',0,2,NULL,'2011-08-04',16060,NULL,16971,NULL),(27422,'GENERIC_DAY',0,0,NULL,'2011-07-09',1114,NULL,16971,NULL),(27423,'GENERIC_DAY',0,2,NULL,'2011-09-22',6970,NULL,16971,NULL),(27424,'GENERIC_DAY',0,2,NULL,'2011-08-09',19999,NULL,16971,NULL),(27425,'GENERIC_DAY',0,0,NULL,'2011-06-05',1112,NULL,16971,NULL),(27426,'GENERIC_DAY',0,2,NULL,'2011-08-16',16062,NULL,16971,NULL),(27427,'GENERIC_DAY',0,0,NULL,'2011-09-09',16060,NULL,16971,NULL),(27428,'GENERIC_DAY',0,0,NULL,'2011-08-12',16060,NULL,16971,NULL),(27429,'GENERIC_DAY',0,3,NULL,'2011-05-06',1112,NULL,16971,NULL),(27430,'GENERIC_DAY',0,3,NULL,'2011-05-31',1112,NULL,16971,NULL),(27431,'GENERIC_DAY',0,0,NULL,'2011-06-25',2829,NULL,16971,NULL),(27432,'GENERIC_DAY',0,2,NULL,'2011-08-04',1114,NULL,16971,NULL),(27433,'GENERIC_DAY',0,0,NULL,'2011-06-26',16060,NULL,16971,NULL),(27434,'GENERIC_DAY',0,2,NULL,'2011-06-23',16060,NULL,16971,NULL),(27435,'GENERIC_DAY',0,0,NULL,'2011-06-20',16060,NULL,16971,NULL),(27436,'GENERIC_DAY',0,0,NULL,'2011-04-16',6970,NULL,16971,NULL),(27437,'GENERIC_DAY',0,2,NULL,'2011-04-20',20001,NULL,16971,NULL),(27438,'GENERIC_DAY',0,2,NULL,'2011-05-12',2829,NULL,16971,NULL),(27439,'GENERIC_DAY',0,3,NULL,'2011-07-06',1112,NULL,16971,NULL),(27440,'GENERIC_DAY',0,3,NULL,'2011-04-27',1112,NULL,16971,NULL),(27441,'GENERIC_DAY',0,0,NULL,'2011-08-14',2829,NULL,16971,NULL),(27442,'GENERIC_DAY',0,2,NULL,'2011-09-08',1112,NULL,16971,NULL),(27443,'GENERIC_DAY',0,0,NULL,'2011-09-23',16060,NULL,16971,NULL),(27444,'GENERIC_DAY',0,0,NULL,'2011-05-07',20001,NULL,16971,NULL),(27445,'GENERIC_DAY',0,0,NULL,'2011-08-31',16060,NULL,16971,NULL),(27446,'GENERIC_DAY',0,2,NULL,'2011-07-07',1114,NULL,16971,NULL),(27447,'GENERIC_DAY',0,0,NULL,'2011-09-24',19999,NULL,16971,NULL),(27448,'GENERIC_DAY',0,0,NULL,'2011-08-26',16060,NULL,16971,NULL),(27449,'GENERIC_DAY',0,0,NULL,'2011-05-22',1114,NULL,16971,NULL),(27450,'GENERIC_DAY',0,0,NULL,'2011-06-04',1114,NULL,16971,NULL),(27451,'GENERIC_DAY',0,2,NULL,'2011-07-22',2829,NULL,16971,NULL),(27452,'GENERIC_DAY',0,0,NULL,'2011-07-27',16060,NULL,16971,NULL),(27453,'GENERIC_DAY',0,0,NULL,'2011-04-09',20001,NULL,16971,NULL),(27454,'GENERIC_DAY',0,2,NULL,'2011-07-04',16062,NULL,16971,NULL),(27455,'GENERIC_DAY',0,0,NULL,'2011-09-25',1114,NULL,16971,NULL),(27456,'GENERIC_DAY',0,2,NULL,'2011-05-05',2829,NULL,16971,NULL),(27457,'GENERIC_DAY',0,0,NULL,'2011-06-19',1112,NULL,16971,NULL),(27458,'GENERIC_DAY',0,2,NULL,'2011-04-25',19999,NULL,16971,NULL),(27459,'GENERIC_DAY',0,0,NULL,'2011-08-20',20001,NULL,16971,NULL),(27460,'GENERIC_DAY',0,2,NULL,'2011-08-17',6970,NULL,16971,NULL),(27461,'GENERIC_DAY',0,0,NULL,'2011-04-20',16060,NULL,16971,NULL),(27462,'GENERIC_DAY',0,2,NULL,'2011-04-14',6970,NULL,16971,NULL),(27463,'GENERIC_DAY',0,2,NULL,'2011-08-23',20001,NULL,16971,NULL),(27464,'GENERIC_DAY',0,3,NULL,'2011-07-12',1112,NULL,16971,NULL),(27465,'GENERIC_DAY',0,0,NULL,'2011-07-19',16060,NULL,16971,NULL),(27466,'GENERIC_DAY',0,2,NULL,'2011-06-15',6970,NULL,16971,NULL),(27467,'GENERIC_DAY',0,2,NULL,'2011-08-19',19999,NULL,16971,NULL),(27468,'GENERIC_DAY',0,0,NULL,'2011-08-14',1112,NULL,16971,NULL),(27469,'GENERIC_DAY',0,2,NULL,'2011-05-16',16062,NULL,16971,NULL),(27470,'GENERIC_DAY',0,0,NULL,'2011-09-17',1114,NULL,16971,NULL),(27471,'GENERIC_DAY',0,0,NULL,'2011-06-17',16060,NULL,16971,NULL),(27472,'GENERIC_DAY',0,0,NULL,'2011-09-03',1114,NULL,16971,NULL),(27473,'GENERIC_DAY',0,3,NULL,'2011-08-23',1112,NULL,16971,NULL),(27474,'GENERIC_DAY',0,3,NULL,'2011-06-14',1114,NULL,16971,NULL),(27475,'GENERIC_DAY',0,2,NULL,'2011-07-21',16062,NULL,16971,NULL),(27476,'GENERIC_DAY',0,0,NULL,'2011-09-19',16060,NULL,16971,NULL),(27477,'GENERIC_DAY',0,2,NULL,'2011-05-30',16062,NULL,16971,NULL),(27478,'GENERIC_DAY',0,0,NULL,'2011-07-17',16060,NULL,16971,NULL),(27479,'GENERIC_DAY',0,0,NULL,'2011-07-31',2829,NULL,16971,NULL),(27480,'GENERIC_DAY',0,2,NULL,'2011-08-15',6970,NULL,16971,NULL),(27481,'GENERIC_DAY',0,0,NULL,'2011-07-12',16060,NULL,16971,NULL),(27482,'GENERIC_DAY',0,0,NULL,'2011-07-05',16060,NULL,16971,NULL),(27483,'GENERIC_DAY',0,2,NULL,'2011-08-12',16062,NULL,16971,NULL),(27484,'GENERIC_DAY',0,2,NULL,'2011-08-24',20001,NULL,16971,NULL),(27485,'GENERIC_DAY',0,0,NULL,'2011-05-07',1114,NULL,16971,NULL),(27486,'GENERIC_DAY',0,2,NULL,'2011-06-06',20001,NULL,16971,NULL),(27487,'GENERIC_DAY',0,3,NULL,'2011-04-25',1112,NULL,16971,NULL),(27488,'GENERIC_DAY',0,0,NULL,'2011-07-03',6970,NULL,16971,NULL),(27489,'GENERIC_DAY',0,2,NULL,'2011-09-28',6970,NULL,16971,NULL),(27490,'GENERIC_DAY',0,2,NULL,'2011-06-28',20001,NULL,16971,NULL),(27491,'GENERIC_DAY',0,2,NULL,'2011-04-29',19999,NULL,16971,NULL),(27492,'GENERIC_DAY',0,2,NULL,'2011-06-22',2829,NULL,16971,NULL),(27493,'GENERIC_DAY',0,0,NULL,'2011-06-11',16060,NULL,16971,NULL),(27494,'GENERIC_DAY',0,2,NULL,'2011-04-21',6970,NULL,16971,NULL),(27495,'GENERIC_DAY',0,2,NULL,'2011-08-17',2829,NULL,16971,NULL),(27496,'GENERIC_DAY',0,2,NULL,'2011-06-08',19999,NULL,16971,NULL),(27497,'GENERIC_DAY',0,3,NULL,'2011-07-29',1112,NULL,16971,NULL),(27498,'GENERIC_DAY',0,0,NULL,'2011-08-14',16062,NULL,16971,NULL),(27499,'GENERIC_DAY',0,2,NULL,'2011-07-28',20001,NULL,16971,NULL),(27500,'GENERIC_DAY',0,3,NULL,'2011-09-21',1114,NULL,16971,NULL),(27501,'GENERIC_DAY',0,0,NULL,'2011-06-19',20001,NULL,16971,NULL),(27502,'GENERIC_DAY',0,2,NULL,'2011-07-14',2829,NULL,16971,NULL),(27503,'GENERIC_DAY',0,2,NULL,'2011-09-01',20001,NULL,16971,NULL),(27504,'GENERIC_DAY',0,3,NULL,'2011-07-06',1114,NULL,16971,NULL),(27505,'GENERIC_DAY',0,2,NULL,'2011-05-18',2829,NULL,16971,NULL),(27506,'GENERIC_DAY',0,3,NULL,'2011-08-12',1114,NULL,16971,NULL),(27507,'GENERIC_DAY',0,0,NULL,'2011-06-26',2829,NULL,16971,NULL),(27508,'GENERIC_DAY',0,2,NULL,'2011-07-21',16060,NULL,16971,NULL),(27509,'GENERIC_DAY',0,0,NULL,'2011-08-13',1112,NULL,16971,NULL),(27510,'GENERIC_DAY',0,0,NULL,'2011-06-04',16060,NULL,16971,NULL),(27511,'GENERIC_DAY',0,0,NULL,'2011-07-23',16062,NULL,16971,NULL),(27512,'GENERIC_DAY',0,0,NULL,'2011-05-15',16062,NULL,16971,NULL),(27513,'GENERIC_DAY',0,0,NULL,'2011-09-04',20001,NULL,16971,NULL),(27514,'GENERIC_DAY',0,2,NULL,'2011-04-14',16060,NULL,16971,NULL),(27515,'GENERIC_DAY',0,2,NULL,'2011-09-21',19999,NULL,16971,NULL),(27516,'GENERIC_DAY',0,3,NULL,'2011-06-22',1114,NULL,16971,NULL),(27517,'GENERIC_DAY',0,0,NULL,'2011-06-18',6970,NULL,16971,NULL),(27518,'GENERIC_DAY',0,2,NULL,'2011-07-29',16062,NULL,16971,NULL),(27519,'GENERIC_DAY',0,2,NULL,'2011-09-06',16062,NULL,16971,NULL),(27520,'GENERIC_DAY',0,2,NULL,'2011-08-16',2829,NULL,16971,NULL),(27521,'GENERIC_DAY',0,3,NULL,'2011-05-11',1112,NULL,16971,NULL),(27522,'GENERIC_DAY',0,3,NULL,'2011-08-22',1112,NULL,16971,NULL),(27523,'GENERIC_DAY',0,2,NULL,'2011-09-27',19999,NULL,16971,NULL),(27524,'GENERIC_DAY',0,2,NULL,'2011-05-23',2829,NULL,16971,NULL),(27525,'GENERIC_DAY',0,2,NULL,'2011-05-19',20001,NULL,16971,NULL),(27526,'GENERIC_DAY',0,0,NULL,'2011-08-13',2829,NULL,16971,NULL),(27527,'GENERIC_DAY',0,2,NULL,'2011-06-03',19999,NULL,16971,NULL),(27528,'GENERIC_DAY',0,2,NULL,'2011-09-28',19999,NULL,16971,NULL),(27529,'GENERIC_DAY',0,3,NULL,'2011-07-27',1112,NULL,16971,NULL),(27530,'GENERIC_DAY',0,2,NULL,'2011-05-25',19999,NULL,16971,NULL),(27531,'GENERIC_DAY',0,0,NULL,'2011-09-11',2829,NULL,16971,NULL),(27532,'GENERIC_DAY',0,2,NULL,'2011-09-12',20001,NULL,16971,NULL),(27533,'GENERIC_DAY',0,3,NULL,'2011-06-28',1112,NULL,16971,NULL),(27534,'GENERIC_DAY',0,2,NULL,'2011-07-12',19999,NULL,16971,NULL),(27535,'GENERIC_DAY',0,3,NULL,'2011-08-26',1112,NULL,16971,NULL),(27536,'GENERIC_DAY',0,2,NULL,'2011-04-26',19999,NULL,16971,NULL),(27537,'GENERIC_DAY',0,2,NULL,'2011-06-09',16060,NULL,16971,NULL),(27538,'GENERIC_DAY',0,3,NULL,'2011-04-13',2829,NULL,16971,NULL),(27539,'GENERIC_DAY',0,0,NULL,'2011-06-29',16060,NULL,16971,NULL),(27540,'GENERIC_DAY',0,3,NULL,'2011-08-01',1114,NULL,16971,NULL),(27541,'GENERIC_DAY',0,2,NULL,'2011-09-20',19999,NULL,16971,NULL),(27542,'GENERIC_DAY',0,2,NULL,'2011-05-12',20001,NULL,16971,NULL),(27543,'GENERIC_DAY',0,3,NULL,'2011-05-04',1114,NULL,16971,NULL),(27544,'GENERIC_DAY',0,3,NULL,'2011-08-19',1112,NULL,16971,NULL),(27545,'GENERIC_DAY',0,0,NULL,'2011-04-24',2829,NULL,16971,NULL),(27546,'GENERIC_DAY',0,3,NULL,'2011-06-10',1112,NULL,16971,NULL),(27547,'GENERIC_DAY',0,0,NULL,'2011-05-15',1114,NULL,16971,NULL),(27548,'GENERIC_DAY',0,2,NULL,'2011-04-29',2829,NULL,16971,NULL),(27549,'GENERIC_DAY',0,3,NULL,'2011-08-29',1114,NULL,16971,NULL),(27550,'GENERIC_DAY',0,0,NULL,'2011-07-04',16060,NULL,16971,NULL),(27551,'GENERIC_DAY',0,0,NULL,'2011-05-29',1112,NULL,16971,NULL),(27552,'GENERIC_DAY',0,3,NULL,'2011-08-16',1112,NULL,16971,NULL),(27553,'GENERIC_DAY',0,2,NULL,'2011-09-29',1112,NULL,16971,NULL),(27554,'GENERIC_DAY',0,0,NULL,'2011-06-05',1114,NULL,16971,NULL),(27555,'GENERIC_DAY',0,2,NULL,'2011-04-20',19999,NULL,16971,NULL),(27556,'GENERIC_DAY',0,3,NULL,'2011-04-28',1114,NULL,16971,NULL),(27557,'GENERIC_DAY',0,2,NULL,'2011-07-07',19999,NULL,16971,NULL),(27558,'GENERIC_DAY',0,2,NULL,'2011-07-12',16062,NULL,16971,NULL),(27559,'GENERIC_DAY',0,2,NULL,'2011-07-13',6970,NULL,16971,NULL),(27560,'GENERIC_DAY',0,2,NULL,'2011-06-09',1112,NULL,16971,NULL),(27561,'GENERIC_DAY',0,2,NULL,'2011-08-10',20001,NULL,16971,NULL),(27562,'GENERIC_DAY',0,0,NULL,'2011-06-04',6970,NULL,16971,NULL),(27563,'GENERIC_DAY',0,0,NULL,'2011-05-28',2829,NULL,16971,NULL),(27564,'GENERIC_DAY',0,0,NULL,'2011-07-09',1112,NULL,16971,NULL),(27565,'GENERIC_DAY',0,0,NULL,'2011-09-02',16060,NULL,16971,NULL),(27566,'GENERIC_DAY',0,3,NULL,'2011-06-08',1114,NULL,16971,NULL),(27567,'GENERIC_DAY',0,2,NULL,'2011-06-30',19999,NULL,16971,NULL),(27568,'GENERIC_DAY',0,2,NULL,'2011-05-12',16060,NULL,16971,NULL),(27569,'GENERIC_DAY',0,3,NULL,'2011-06-20',1112,NULL,16971,NULL),(27570,'GENERIC_DAY',0,2,NULL,'2011-07-27',20001,NULL,16971,NULL),(27571,'GENERIC_DAY',0,2,NULL,'2011-08-24',2829,NULL,16971,NULL),(27572,'GENERIC_DAY',0,2,NULL,'2011-09-29',20001,NULL,16971,NULL),(27573,'GENERIC_DAY',0,2,NULL,'2011-07-14',16062,NULL,16971,NULL),(27574,'GENERIC_DAY',0,3,NULL,'2011-05-23',1112,NULL,16971,NULL),(27575,'GENERIC_DAY',0,0,NULL,'2011-05-29',2829,NULL,16971,NULL),(27576,'GENERIC_DAY',0,3,NULL,'2011-09-27',1112,NULL,16971,NULL),(27577,'GENERIC_DAY',0,3,NULL,'2011-04-19',1112,NULL,16971,NULL),(27578,'GENERIC_DAY',0,2,NULL,'2011-08-25',1114,NULL,16971,NULL),(27579,'GENERIC_DAY',0,3,NULL,'2011-09-28',1114,NULL,16971,NULL),(27580,'GENERIC_DAY',0,2,NULL,'2011-07-04',19999,NULL,16971,NULL),(27581,'GENERIC_DAY',0,2,NULL,'2011-05-06',6970,NULL,16971,NULL),(27582,'GENERIC_DAY',0,3,NULL,'2011-07-04',1112,NULL,16971,NULL),(27583,'GENERIC_DAY',0,0,NULL,'2011-04-09',1114,NULL,16971,NULL),(27584,'GENERIC_DAY',0,2,NULL,'2011-05-02',2829,NULL,16971,NULL),(27585,'GENERIC_DAY',0,2,NULL,'2011-09-29',19999,NULL,16971,NULL),(27586,'GENERIC_DAY',0,2,NULL,'2011-08-25',6970,NULL,16971,NULL),(27587,'GENERIC_DAY',0,3,NULL,'2011-08-16',1114,NULL,16971,NULL),(27588,'GENERIC_DAY',0,0,NULL,'2011-08-14',6970,NULL,16971,NULL),(27589,'GENERIC_DAY',0,0,NULL,'2011-07-02',20001,NULL,16971,NULL),(27590,'GENERIC_DAY',0,2,NULL,'2011-06-01',6970,NULL,16971,NULL),(27591,'GENERIC_DAY',0,2,NULL,'2011-06-01',16062,NULL,16971,NULL),(27592,'GENERIC_DAY',0,0,NULL,'2011-07-24',2829,NULL,16971,NULL),(27593,'GENERIC_DAY',0,3,NULL,'2011-04-18',2829,NULL,16971,NULL),(27594,'GENERIC_DAY',0,2,NULL,'2011-07-06',2829,NULL,16971,NULL),(27595,'GENERIC_DAY',0,0,NULL,'2011-04-24',19999,NULL,16971,NULL),(27596,'GENERIC_DAY',0,0,NULL,'2011-06-19',6970,NULL,16971,NULL),(27597,'GENERIC_DAY',0,3,NULL,'2011-09-27',1114,NULL,16971,NULL),(27598,'GENERIC_DAY',0,0,NULL,'2011-08-13',16062,NULL,16971,NULL),(27599,'GENERIC_DAY',0,0,NULL,'2011-06-11',1112,NULL,16971,NULL),(27600,'GENERIC_DAY',0,2,NULL,'2011-09-07',19999,NULL,16971,NULL),(27601,'GENERIC_DAY',0,0,NULL,'2011-08-17',16060,NULL,16971,NULL),(27602,'GENERIC_DAY',0,2,NULL,'2011-05-20',2829,NULL,16971,NULL),(27603,'GENERIC_DAY',0,0,NULL,'2011-08-21',6970,NULL,16971,NULL),(27604,'GENERIC_DAY',0,3,NULL,'2011-07-05',1112,NULL,16971,NULL),(27605,'GENERIC_DAY',0,2,NULL,'2011-09-22',1114,NULL,16971,NULL),(27606,'GENERIC_DAY',0,0,NULL,'2011-06-25',16060,NULL,16971,NULL),(27607,'GENERIC_DAY',0,0,NULL,'2011-06-26',19999,NULL,16971,NULL),(27608,'GENERIC_DAY',0,0,NULL,'2011-05-09',16060,NULL,16971,NULL),(27609,'GENERIC_DAY',0,2,NULL,'2011-08-02',19999,NULL,16971,NULL),(27610,'GENERIC_DAY',0,3,NULL,'2011-06-21',1112,NULL,16971,NULL),(27611,'GENERIC_DAY',0,0,NULL,'2011-08-20',1112,NULL,16971,NULL),(27612,'GENERIC_DAY',0,2,NULL,'2011-06-03',20001,NULL,16971,NULL),(27613,'GENERIC_DAY',0,0,NULL,'2011-06-12',16062,NULL,16971,NULL),(27614,'GENERIC_DAY',0,2,NULL,'2011-07-13',16062,NULL,16971,NULL),(27615,'GENERIC_DAY',0,2,NULL,'2011-04-29',6970,NULL,16971,NULL),(27616,'GENERIC_DAY',0,3,NULL,'2011-07-25',1112,NULL,16971,NULL),(27617,'GENERIC_DAY',0,2,NULL,'2011-05-04',20001,NULL,16971,NULL),(27618,'GENERIC_DAY',0,3,NULL,'2011-08-02',1112,NULL,16971,NULL),(27619,'GENERIC_DAY',0,3,NULL,'2011-07-27',1114,NULL,16971,NULL),(27620,'GENERIC_DAY',0,0,NULL,'2011-05-15',20001,NULL,16971,NULL),(27621,'GENERIC_DAY',0,0,NULL,'2011-08-28',19999,NULL,16971,NULL),(27622,'GENERIC_DAY',0,2,NULL,'2011-08-11',20001,NULL,16971,NULL),(27623,'GENERIC_DAY',0,0,NULL,'2011-05-22',16060,NULL,16971,NULL),(27624,'GENERIC_DAY',0,2,NULL,'2011-08-23',6970,NULL,16971,NULL),(27625,'GENERIC_DAY',0,0,NULL,'2011-07-31',1114,NULL,16971,NULL),(27626,'GENERIC_DAY',0,0,NULL,'2011-07-31',1112,NULL,16971,NULL),(27627,'GENERIC_DAY',0,2,NULL,'2011-07-18',16062,NULL,16971,NULL),(27628,'GENERIC_DAY',0,2,NULL,'2011-09-14',19999,NULL,16971,NULL),(27629,'GENERIC_DAY',0,2,NULL,'2011-07-25',16062,NULL,16971,NULL),(27630,'GENERIC_DAY',0,0,NULL,'2011-05-07',19999,NULL,16971,NULL),(27631,'GENERIC_DAY',0,2,NULL,'2011-08-05',2829,NULL,16971,NULL),(27632,'GENERIC_DAY',0,2,NULL,'2011-05-19',19999,NULL,16971,NULL),(27633,'GENERIC_DAY',0,2,NULL,'2011-05-30',2829,NULL,16971,NULL),(27634,'GENERIC_DAY',0,2,NULL,'2011-08-18',16060,NULL,16971,NULL),(27635,'GENERIC_DAY',0,2,NULL,'2011-05-06',16062,NULL,16971,NULL),(27636,'GENERIC_DAY',0,2,NULL,'2011-09-14',2829,NULL,16971,NULL),(27637,'GENERIC_DAY',0,2,NULL,'2011-08-09',2829,NULL,16971,NULL),(27638,'GENERIC_DAY',0,0,NULL,'2011-09-24',2829,NULL,16971,NULL),(27639,'GENERIC_DAY',0,2,NULL,'2011-09-29',6970,NULL,16971,NULL),(27640,'GENERIC_DAY',0,2,NULL,'2011-08-15',19999,NULL,16971,NULL),(27641,'GENERIC_DAY',0,2,NULL,'2011-08-10',6970,NULL,16971,NULL),(27642,'GENERIC_DAY',0,2,NULL,'2011-07-28',1114,NULL,16971,NULL),(27643,'GENERIC_DAY',0,2,NULL,'2011-06-10',6970,NULL,16971,NULL),(27644,'GENERIC_DAY',0,0,NULL,'2011-09-12',16060,NULL,16971,NULL),(27645,'GENERIC_DAY',0,0,NULL,'2011-07-31',6970,NULL,16971,NULL),(27646,'GENERIC_DAY',0,3,NULL,'2011-04-22',2829,NULL,16971,NULL),(27647,'GENERIC_DAY',0,2,NULL,'2011-09-12',2829,NULL,16971,NULL),(27648,'GENERIC_DAY',0,0,NULL,'2011-05-28',16062,NULL,16971,NULL),(27649,'GENERIC_DAY',0,2,NULL,'2011-07-18',6970,NULL,16971,NULL),(27650,'GENERIC_DAY',0,2,NULL,'2011-06-23',1114,NULL,16971,NULL),(27651,'GENERIC_DAY',0,2,NULL,'2011-04-19',20001,NULL,16971,NULL),(27652,'GENERIC_DAY',0,0,NULL,'2011-09-10',1112,NULL,16971,NULL),(27653,'GENERIC_DAY',0,2,NULL,'2011-06-22',20001,NULL,16971,NULL),(27654,'GENERIC_DAY',0,0,NULL,'2011-06-06',16060,NULL,16971,NULL),(27655,'GENERIC_DAY',0,2,NULL,'2011-09-23',2829,NULL,16971,NULL),(27656,'GENERIC_DAY',0,0,NULL,'2011-04-30',16062,NULL,16971,NULL),(27657,'GENERIC_DAY',0,2,NULL,'2011-09-20',6970,NULL,16971,NULL),(27658,'GENERIC_DAY',0,2,NULL,'2011-09-05',2829,NULL,16971,NULL),(27659,'GENERIC_DAY',0,3,NULL,'2011-09-14',1112,NULL,16971,NULL),(27660,'GENERIC_DAY',0,0,NULL,'2011-09-25',6970,NULL,16971,NULL),(27661,'GENERIC_DAY',0,0,NULL,'2011-05-15',1112,NULL,16971,NULL),(27662,'GENERIC_DAY',0,2,NULL,'2011-06-16',20001,NULL,16971,NULL),(27663,'GENERIC_DAY',0,2,NULL,'2011-06-03',16062,NULL,16971,NULL),(27664,'GENERIC_DAY',0,2,NULL,'2011-09-02',20001,NULL,16971,NULL),(27665,'GENERIC_DAY',0,0,NULL,'2011-06-26',1114,NULL,16971,NULL),(27666,'GENERIC_DAY',0,3,NULL,'2011-07-08',1114,NULL,16971,NULL),(27667,'GENERIC_DAY',0,2,NULL,'2011-07-01',16062,NULL,16971,NULL),(27668,'GENERIC_DAY',0,0,NULL,'2011-05-28',16060,NULL,16971,NULL),(27669,'GENERIC_DAY',0,3,NULL,'2011-08-12',1112,NULL,16971,NULL),(27670,'GENERIC_DAY',0,3,NULL,'2011-08-31',1112,NULL,16971,NULL),(27671,'GENERIC_DAY',0,2,NULL,'2011-08-16',6970,NULL,16971,NULL),(27672,'GENERIC_DAY',0,0,NULL,'2011-09-04',1114,NULL,16971,NULL),(27673,'GENERIC_DAY',0,0,NULL,'2011-05-14',6970,NULL,16971,NULL),(27674,'GENERIC_DAY',0,0,NULL,'2011-05-07',1112,NULL,16971,NULL),(27675,'GENERIC_DAY',0,3,NULL,'2011-04-19',1114,NULL,16971,NULL),(27676,'GENERIC_DAY',0,2,NULL,'2011-07-28',1112,NULL,16971,NULL),(27677,'GENERIC_DAY',0,3,NULL,'2011-04-08',2829,NULL,16971,NULL),(27678,'GENERIC_DAY',0,2,NULL,'2011-04-27',20001,NULL,16971,NULL),(27679,'GENERIC_DAY',0,2,NULL,'2011-06-09',20001,NULL,16971,NULL),(27680,'GENERIC_DAY',0,2,NULL,'2011-09-19',16062,NULL,16971,NULL),(27681,'GENERIC_DAY',0,2,NULL,'2011-09-13',20001,NULL,16971,NULL),(27682,'GENERIC_DAY',0,2,NULL,'2011-08-18',19999,NULL,16971,NULL),(27683,'GENERIC_DAY',0,3,NULL,'2011-08-08',1114,NULL,16971,NULL),(27684,'GENERIC_DAY',0,0,NULL,'2011-08-14',16060,NULL,16971,NULL),(27685,'GENERIC_DAY',0,3,NULL,'2011-05-23',1114,NULL,16971,NULL),(27686,'GENERIC_DAY',0,2,NULL,'2011-09-05',16062,NULL,16971,NULL),(27687,'GENERIC_DAY',0,0,NULL,'2011-07-03',1114,NULL,16971,NULL),(27688,'GENERIC_DAY',0,2,NULL,'2011-07-14',16060,NULL,16971,NULL),(27689,'GENERIC_DAY',0,2,NULL,'2011-04-29',20001,NULL,16971,NULL),(27690,'GENERIC_DAY',0,0,NULL,'2011-06-25',20001,NULL,16971,NULL),(27691,'GENERIC_DAY',0,2,NULL,'2011-08-22',16062,NULL,16971,NULL),(27692,'GENERIC_DAY',0,0,NULL,'2011-04-10',2829,NULL,16971,NULL),(27693,'GENERIC_DAY',0,0,NULL,'2011-09-03',1112,NULL,16971,NULL),(27694,'GENERIC_DAY',0,2,NULL,'2011-06-27',20001,NULL,16971,NULL),(27695,'GENERIC_DAY',0,0,NULL,'2011-05-29',16062,NULL,16971,NULL),(27696,'GENERIC_DAY',0,0,NULL,'2011-06-11',20001,NULL,16971,NULL),(27697,'GENERIC_DAY',0,2,NULL,'2011-06-20',19999,NULL,16971,NULL),(27698,'GENERIC_DAY',0,0,NULL,'2011-08-27',16060,NULL,16971,NULL),(27699,'GENERIC_DAY',0,2,NULL,'2011-07-06',20001,NULL,16971,NULL),(27700,'GENERIC_DAY',0,0,NULL,'2011-07-17',1112,NULL,16971,NULL),(27701,'GENERIC_DAY',0,0,NULL,'2011-08-06',6970,NULL,16971,NULL),(27702,'GENERIC_DAY',0,2,NULL,'2011-08-02',2829,NULL,16971,NULL),(27703,'GENERIC_DAY',0,2,NULL,'2011-09-22',16060,NULL,16971,NULL),(27704,'GENERIC_DAY',0,0,NULL,'2011-04-16',1112,NULL,16971,NULL),(27705,'GENERIC_DAY',0,0,NULL,'2011-07-30',1112,NULL,16971,NULL),(27706,'GENERIC_DAY',0,2,NULL,'2011-07-14',1112,NULL,16971,NULL),(27707,'GENERIC_DAY',0,2,NULL,'2011-05-16',6970,NULL,16971,NULL),(27708,'GENERIC_DAY',0,0,NULL,'2011-07-10',20001,NULL,16971,NULL),(27709,'GENERIC_DAY',0,3,NULL,'2011-06-24',1114,NULL,16971,NULL),(27710,'GENERIC_DAY',0,2,NULL,'2011-08-04',1112,NULL,16971,NULL),(27711,'GENERIC_DAY',0,2,NULL,'2011-08-25',1112,NULL,16971,NULL),(27712,'GENERIC_DAY',0,2,NULL,'2011-09-06',19999,NULL,16971,NULL),(27713,'GENERIC_DAY',0,2,NULL,'2011-08-31',2829,NULL,16971,NULL),(27714,'GENERIC_DAY',0,0,NULL,'2011-08-21',1112,NULL,16971,NULL),(27715,'GENERIC_DAY',0,0,NULL,'2011-05-01',19999,NULL,16971,NULL),(27716,'GENERIC_DAY',0,2,NULL,'2011-05-02',19999,NULL,16971,NULL),(27717,'GENERIC_DAY',0,0,NULL,'2011-09-03',6970,NULL,16971,NULL),(27718,'GENERIC_DAY',0,3,NULL,'2011-06-06',1112,NULL,16971,NULL),(27719,'GENERIC_DAY',0,0,NULL,'2011-07-15',16060,NULL,16971,NULL),(27720,'GENERIC_DAY',0,3,NULL,'2011-05-10',1114,NULL,16971,NULL),(27721,'GENERIC_DAY',0,0,NULL,'2011-06-19',1114,NULL,16971,NULL),(27722,'GENERIC_DAY',0,3,NULL,'2011-05-20',1114,NULL,16971,NULL),(27723,'GENERIC_DAY',0,2,NULL,'2011-05-16',19999,NULL,16971,NULL),(27724,'GENERIC_DAY',0,0,NULL,'2011-05-22',6970,NULL,16971,NULL),(27725,'GENERIC_DAY',0,3,NULL,'2011-04-27',6970,NULL,16971,NULL),(27726,'GENERIC_DAY',0,0,NULL,'2011-06-15',16060,NULL,16971,NULL),(27727,'GENERIC_DAY',0,0,NULL,'2011-08-08',16060,NULL,16971,NULL),(27728,'GENERIC_DAY',0,0,NULL,'2011-06-18',19999,NULL,16971,NULL),(27729,'GENERIC_DAY',0,3,NULL,'2011-06-24',1112,NULL,16971,NULL),(27730,'GENERIC_DAY',0,2,NULL,'2011-07-07',20001,NULL,16971,NULL),(27731,'GENERIC_DAY',0,2,NULL,'2011-08-04',19999,NULL,16971,NULL),(27732,'GENERIC_DAY',0,0,NULL,'2011-07-23',19999,NULL,16971,NULL),(27733,'GENERIC_DAY',0,3,NULL,'2011-04-15',1114,NULL,16971,NULL),(27734,'GENERIC_DAY',0,0,NULL,'2011-04-09',16060,NULL,16971,NULL),(27735,'GENERIC_DAY',0,2,NULL,'2011-06-14',19999,NULL,16971,NULL),(27736,'GENERIC_DAY',0,0,NULL,'2011-07-03',2829,NULL,16971,NULL),(27737,'GENERIC_DAY',0,2,NULL,'2011-04-13',19999,NULL,16971,NULL),(27738,'GENERIC_DAY',0,0,NULL,'2011-05-08',2829,NULL,16971,NULL),(27739,'GENERIC_DAY',0,3,NULL,'2011-05-02',1114,NULL,16971,NULL),(27740,'GENERIC_DAY',0,3,NULL,'2011-08-09',1112,NULL,16971,NULL),(27741,'GENERIC_DAY',0,2,NULL,'2011-07-12',20001,NULL,16971,NULL),(27742,'GENERIC_DAY',0,3,NULL,'2011-04-11',6970,NULL,16971,NULL),(27743,'GENERIC_DAY',0,0,NULL,'2011-05-08',19999,NULL,16971,NULL),(27744,'GENERIC_DAY',0,0,NULL,'2011-09-24',16062,NULL,16971,NULL),(27745,'GENERIC_DAY',0,0,NULL,'2011-09-11',1112,NULL,16971,NULL),(27746,'GENERIC_DAY',0,0,NULL,'2011-06-11',1114,NULL,16971,NULL),(27747,'GENERIC_DAY',0,0,NULL,'2011-05-14',2829,NULL,16971,NULL),(27748,'GENERIC_DAY',0,0,NULL,'2011-06-12',19999,NULL,16971,NULL),(27749,'GENERIC_DAY',0,2,NULL,'2011-08-24',19999,NULL,16971,NULL),(27750,'GENERIC_DAY',0,0,NULL,'2011-07-24',16062,NULL,16971,NULL),(27751,'GENERIC_DAY',0,0,NULL,'2011-04-27',16060,NULL,16971,NULL),(27752,'GENERIC_DAY',0,3,NULL,'2011-06-01',1112,NULL,16971,NULL),(27753,'GENERIC_DAY',0,2,NULL,'2011-08-12',20001,NULL,16971,NULL),(27754,'GENERIC_DAY',0,0,NULL,'2011-08-07',19999,NULL,16971,NULL),(27755,'GENERIC_DAY',0,2,NULL,'2011-09-19',20001,NULL,16971,NULL),(27756,'GENERIC_DAY',0,2,NULL,'2011-09-01',19999,NULL,16971,NULL),(27757,'GENERIC_DAY',0,2,NULL,'2011-09-09',6970,NULL,16971,NULL),(27758,'GENERIC_DAY',0,0,NULL,'2011-05-28',6970,NULL,16971,NULL),(27759,'GENERIC_DAY',0,2,NULL,'2011-09-27',6970,NULL,16971,NULL),(27760,'GENERIC_DAY',0,2,NULL,'2011-07-20',19999,NULL,16971,NULL),(27761,'GENERIC_DAY',0,0,NULL,'2011-08-20',16062,NULL,16971,NULL),(27762,'GENERIC_DAY',0,2,NULL,'2011-09-16',2829,NULL,16971,NULL),(27763,'GENERIC_DAY',0,2,NULL,'2011-08-08',16062,NULL,16971,NULL),(27764,'GENERIC_DAY',0,2,NULL,'2011-06-06',2829,NULL,16971,NULL),(27765,'GENERIC_DAY',0,0,NULL,'2011-09-05',16060,NULL,16971,NULL),(27766,'GENERIC_DAY',0,2,NULL,'2011-08-11',16062,NULL,16971,NULL),(27767,'GENERIC_DAY',0,3,NULL,'2011-08-19',1114,NULL,16971,NULL),(27768,'GENERIC_DAY',0,0,NULL,'2011-08-14',19999,NULL,16971,NULL),(27769,'GENERIC_DAY',0,0,NULL,'2011-07-16',2829,NULL,16971,NULL),(27770,'GENERIC_DAY',0,0,NULL,'2011-09-25',16062,NULL,16971,NULL),(27771,'GENERIC_DAY',0,2,NULL,'2011-08-30',20001,NULL,16971,NULL),(27772,'GENERIC_DAY',0,2,NULL,'2011-08-01',20001,NULL,16971,NULL),(27773,'GENERIC_DAY',0,3,NULL,'2011-09-20',1114,NULL,16971,NULL),(27774,'GENERIC_DAY',0,2,NULL,'2011-06-22',16062,NULL,16971,NULL),(27775,'GENERIC_DAY',0,2,NULL,'2011-09-28',2829,NULL,16971,NULL),(27776,'GENERIC_DAY',0,2,NULL,'2011-09-06',2829,NULL,16971,NULL),(27777,'GENERIC_DAY',0,2,NULL,'2011-04-08',19999,NULL,16971,NULL),(27778,'GENERIC_DAY',0,0,NULL,'2011-05-08',16062,NULL,16971,NULL),(27779,'GENERIC_DAY',0,2,NULL,'2011-08-31',6970,NULL,16971,NULL),(27780,'GENERIC_DAY',0,2,NULL,'2011-06-06',6970,NULL,16971,NULL),(27781,'GENERIC_DAY',0,0,NULL,'2011-05-07',2829,NULL,16971,NULL),(27782,'GENERIC_DAY',0,2,NULL,'2011-05-25',2829,NULL,16971,NULL),(27783,'GENERIC_DAY',0,3,NULL,'2011-07-29',1114,NULL,16971,NULL),(27784,'GENERIC_DAY',0,2,NULL,'2011-05-05',16060,NULL,16971,NULL),(27785,'GENERIC_DAY',0,2,NULL,'2011-09-01',16062,NULL,16971,NULL),(27786,'GENERIC_DAY',0,0,NULL,'2011-04-18',16060,NULL,16971,NULL),(27787,'GENERIC_DAY',0,2,NULL,'2011-06-14',20001,NULL,16971,NULL),(27788,'GENERIC_DAY',0,0,NULL,'2011-09-10',16060,NULL,16971,NULL),(27789,'GENERIC_DAY',0,2,NULL,'2011-09-02',19999,NULL,16971,NULL),(27790,'GENERIC_DAY',0,0,NULL,'2011-08-27',2829,NULL,16971,NULL),(27791,'GENERIC_DAY',0,2,NULL,'2011-09-19',6970,NULL,16971,NULL),(27792,'GENERIC_DAY',0,2,NULL,'2011-07-18',19999,NULL,16971,NULL),(27793,'GENERIC_DAY',0,2,NULL,'2011-08-01',6970,NULL,16971,NULL),(27794,'GENERIC_DAY',0,0,NULL,'2011-06-19',16062,NULL,16971,NULL),(27795,'GENERIC_DAY',0,3,NULL,'2011-05-09',1114,NULL,16971,NULL),(27796,'GENERIC_DAY',0,2,NULL,'2011-08-15',16062,NULL,16971,NULL),(27797,'GENERIC_DAY',0,2,NULL,'2011-05-18',20001,NULL,16971,NULL),(27798,'GENERIC_DAY',0,0,NULL,'2011-04-09',1112,NULL,16971,NULL),(27799,'GENERIC_DAY',0,0,NULL,'2011-07-24',16060,NULL,16971,NULL),(27800,'GENERIC_DAY',0,2,NULL,'2011-08-11',6970,NULL,16971,NULL),(27801,'GENERIC_DAY',0,2,NULL,'2011-07-07',16060,NULL,16971,NULL),(27802,'GENERIC_DAY',0,2,NULL,'2011-08-01',16062,NULL,16971,NULL),(27803,'GENERIC_DAY',0,0,NULL,'2011-08-06',1114,NULL,16971,NULL),(27804,'GENERIC_DAY',0,0,NULL,'2011-05-24',16060,NULL,16971,NULL),(27805,'GENERIC_DAY',0,3,NULL,'2011-05-13',1114,NULL,16971,NULL),(27806,'GENERIC_DAY',0,2,NULL,'2011-07-11',6970,NULL,16971,NULL),(27807,'GENERIC_DAY',0,2,NULL,'2011-08-05',20001,NULL,16971,NULL),(27808,'GENERIC_DAY',0,2,NULL,'2011-05-20',20001,NULL,16971,NULL),(27809,'GENERIC_DAY',0,2,NULL,'2011-05-04',2829,NULL,16971,NULL),(27810,'GENERIC_DAY',0,3,NULL,'2011-04-29',1114,NULL,16971,NULL),(27811,'GENERIC_DAY',0,3,NULL,'2011-08-02',1114,NULL,16971,NULL),(27812,'GENERIC_DAY',0,2,NULL,'2011-09-29',1114,NULL,16971,NULL),(27813,'GENERIC_DAY',0,0,NULL,'2011-06-25',6970,NULL,16971,NULL),(27814,'GENERIC_DAY',0,2,NULL,'2011-05-05',19999,NULL,16971,NULL),(27815,'GENERIC_DAY',0,2,NULL,'2011-06-01',19999,NULL,16971,NULL),(27816,'GENERIC_DAY',0,2,NULL,'2011-08-02',20001,NULL,16971,NULL),(27817,'GENERIC_DAY',0,2,NULL,'2011-07-26',16062,NULL,16971,NULL),(27818,'GENERIC_DAY',0,2,NULL,'2011-07-21',1112,NULL,16971,NULL),(27819,'GENERIC_DAY',0,0,NULL,'2011-08-13',16060,NULL,16971,NULL),(27820,'GENERIC_DAY',0,2,NULL,'2011-04-19',19999,NULL,16971,NULL),(27821,'GENERIC_DAY',0,0,NULL,'2011-04-29',16060,NULL,16971,NULL),(27822,'GENERIC_DAY',0,0,NULL,'2011-07-06',16060,NULL,16971,NULL),(27823,'GENERIC_DAY',0,2,NULL,'2011-09-26',2829,NULL,16971,NULL),(27824,'GENERIC_DAY',0,2,NULL,'2011-05-30',19999,NULL,16971,NULL),(27825,'GENERIC_DAY',0,2,NULL,'2011-09-08',16062,NULL,16971,NULL),(27826,'GENERIC_DAY',0,2,NULL,'2011-05-23',16062,NULL,16971,NULL),(27827,'GENERIC_DAY',0,2,NULL,'2011-09-01',1114,NULL,16971,NULL),(27828,'GENERIC_DAY',0,0,NULL,'2011-05-08',1112,NULL,16971,NULL),(27829,'GENERIC_DAY',0,2,NULL,'2011-06-23',2829,NULL,16971,NULL),(27830,'GENERIC_DAY',0,0,NULL,'2011-05-01',1112,NULL,16971,NULL),(27831,'GENERIC_DAY',0,2,NULL,'2011-07-08',19999,NULL,16971,NULL),(27832,'GENERIC_DAY',0,0,NULL,'2011-07-23',1112,NULL,16971,NULL),(27833,'GENERIC_DAY',0,3,NULL,'2011-07-18',1112,NULL,16971,NULL),(27834,'GENERIC_DAY',0,3,NULL,'2011-04-26',2829,NULL,16971,NULL),(27835,'GENERIC_DAY',0,2,NULL,'2011-04-18',20001,NULL,16971,NULL),(27836,'GENERIC_DAY',0,2,NULL,'2011-05-25',6970,NULL,16971,NULL),(27837,'GENERIC_DAY',0,2,NULL,'2011-09-01',1112,NULL,16971,NULL),(27838,'GENERIC_DAY',0,2,NULL,'2011-06-02',1114,NULL,16971,NULL),(27839,'GENERIC_DAY',0,2,NULL,'2011-05-20',19999,NULL,16971,NULL),(27840,'GENERIC_DAY',0,0,NULL,'2011-07-23',1114,NULL,16971,NULL),(27841,'GENERIC_DAY',0,2,NULL,'2011-05-26',16062,NULL,16971,NULL),(27842,'GENERIC_DAY',0,2,NULL,'2011-06-08',6970,NULL,16971,NULL),(27843,'GENERIC_DAY',0,2,NULL,'2011-08-30',6970,NULL,16971,NULL),(27844,'GENERIC_DAY',0,2,NULL,'2011-07-15',16062,NULL,16971,NULL),(27845,'GENERIC_DAY',0,2,NULL,'2011-09-09',19999,NULL,16971,NULL),(27846,'GENERIC_DAY',0,2,NULL,'2011-05-04',6970,NULL,16971,NULL),(27847,'GENERIC_DAY',0,0,NULL,'2011-06-18',1112,NULL,16971,NULL),(27848,'GENERIC_DAY',0,0,NULL,'2011-09-24',16060,NULL,16971,NULL),(27849,'GENERIC_DAY',0,2,NULL,'2011-07-19',19999,NULL,16971,NULL),(27850,'GENERIC_DAY',0,3,NULL,'2011-08-17',1112,NULL,16971,NULL),(27851,'GENERIC_DAY',0,2,NULL,'2011-06-13',2829,NULL,16971,NULL),(27852,'GENERIC_DAY',0,2,NULL,'2011-05-02',16062,NULL,16971,NULL),(27853,'GENERIC_DAY',0,2,NULL,'2011-08-25',19999,NULL,16971,NULL),(27854,'GENERIC_DAY',0,2,NULL,'2011-07-28',6970,NULL,16971,NULL),(27855,'GENERIC_DAY',0,2,NULL,'2011-05-06',19999,NULL,16971,NULL),(27856,'GENERIC_DAY',0,3,NULL,'2011-06-13',1114,NULL,16971,NULL),(27857,'GENERIC_DAY',0,2,NULL,'2011-06-23',6970,NULL,16971,NULL),(27858,'GENERIC_DAY',0,2,NULL,'2011-05-20',6970,NULL,16971,NULL),(27859,'GENERIC_DAY',0,2,NULL,'2011-06-17',2829,NULL,16971,NULL),(27860,'GENERIC_DAY',0,3,NULL,'2011-08-22',1114,NULL,16971,NULL),(27861,'GENERIC_DAY',0,0,NULL,'2011-07-16',1112,NULL,16971,NULL),(27862,'GENERIC_DAY',0,2,NULL,'2011-04-21',19999,NULL,16971,NULL),(27863,'GENERIC_DAY',0,0,NULL,'2011-07-18',16060,NULL,16971,NULL),(27864,'GENERIC_DAY',0,3,NULL,'2011-04-12',1114,NULL,16971,NULL),(27865,'GENERIC_DAY',0,0,NULL,'2011-07-22',16060,NULL,16971,NULL),(27866,'GENERIC_DAY',0,0,NULL,'2011-09-17',1112,NULL,16971,NULL),(27867,'GENERIC_DAY',0,2,NULL,'2011-06-09',1114,NULL,16971,NULL),(27868,'GENERIC_DAY',0,3,NULL,'2011-05-30',1112,NULL,16971,NULL),(27869,'GENERIC_DAY',0,2,NULL,'2011-05-17',2829,NULL,16971,NULL),(27870,'GENERIC_DAY',0,2,NULL,'2011-06-14',6970,NULL,16971,NULL),(27871,'GENERIC_DAY',0,0,NULL,'2011-07-17',2829,NULL,16971,NULL),(27872,'GENERIC_DAY',0,2,NULL,'2011-09-12',16062,NULL,16971,NULL),(27873,'GENERIC_DAY',0,2,NULL,'2011-04-12',19999,NULL,16971,NULL),(27874,'GENERIC_DAY',0,3,NULL,'2011-09-12',1114,NULL,16971,NULL),(27875,'GENERIC_DAY',0,2,NULL,'2011-07-29',20001,NULL,16971,NULL),(27876,'GENERIC_DAY',0,0,NULL,'2011-06-04',16062,NULL,16971,NULL),(27877,'GENERIC_DAY',0,2,NULL,'2011-04-21',20001,NULL,16971,NULL),(27878,'GENERIC_DAY',0,3,NULL,'2011-04-25',1114,NULL,16971,NULL),(27879,'GENERIC_DAY',0,2,NULL,'2011-09-15',16060,NULL,16971,NULL),(27880,'GENERIC_DAY',0,2,NULL,'2011-06-02',16060,NULL,16971,NULL),(27881,'GENERIC_DAY',0,3,NULL,'2011-09-06',1112,NULL,16971,NULL),(27882,'GENERIC_DAY',0,0,NULL,'2011-07-17',16062,NULL,16971,NULL),(27883,'GENERIC_DAY',0,2,NULL,'2011-06-27',6970,NULL,16971,NULL),(27884,'GENERIC_DAY',0,2,NULL,'2011-06-17',16062,NULL,16971,NULL),(27885,'GENERIC_DAY',0,2,NULL,'2011-05-24',2829,NULL,16971,NULL),(27886,'GENERIC_DAY',0,0,NULL,'2011-06-05',19999,NULL,16971,NULL),(27887,'GENERIC_DAY',0,2,NULL,'2011-06-21',6970,NULL,16971,NULL),(27888,'GENERIC_DAY',0,2,NULL,'2011-06-29',6970,NULL,16971,NULL),(27889,'GENERIC_DAY',0,2,NULL,'2011-04-13',20001,NULL,16971,NULL),(27890,'GENERIC_DAY',0,0,NULL,'2011-08-20',16060,NULL,16971,NULL),(27891,'GENERIC_DAY',0,0,NULL,'2011-08-28',20001,NULL,16971,NULL),(27892,'GENERIC_DAY',0,0,NULL,'2011-08-15',16060,NULL,16971,NULL),(27893,'GENERIC_DAY',0,2,NULL,'2011-04-28',6970,NULL,16971,NULL),(27894,'GENERIC_DAY',0,2,NULL,'2011-06-09',19999,NULL,16971,NULL),(27895,'GENERIC_DAY',0,3,NULL,'2011-06-03',1112,NULL,16971,NULL),(27896,'GENERIC_DAY',0,2,NULL,'2011-05-31',6970,NULL,16971,NULL),(27897,'GENERIC_DAY',0,0,NULL,'2011-08-28',6970,NULL,16971,NULL),(27898,'GENERIC_DAY',0,2,NULL,'2011-08-04',2829,NULL,16971,NULL),(27899,'GENERIC_DAY',0,0,NULL,'2011-04-23',20001,NULL,16971,NULL),(27900,'GENERIC_DAY',0,0,NULL,'2011-09-18',20001,NULL,16971,NULL),(27901,'GENERIC_DAY',0,3,NULL,'2011-06-29',1112,NULL,16971,NULL),(27902,'GENERIC_DAY',0,0,NULL,'2011-09-03',16062,NULL,16971,NULL),(27903,'GENERIC_DAY',0,2,NULL,'2011-09-15',19999,NULL,16971,NULL),(27904,'GENERIC_DAY',0,2,NULL,'2011-08-08',6970,NULL,16971,NULL),(27905,'GENERIC_DAY',0,0,NULL,'2011-08-07',1112,NULL,16971,NULL),(27906,'GENERIC_DAY',0,3,NULL,'2011-04-18',1112,NULL,16971,NULL),(27907,'GENERIC_DAY',0,3,NULL,'2011-05-18',1112,NULL,16971,NULL),(27908,'GENERIC_DAY',0,3,NULL,'2011-04-13',1114,NULL,16971,NULL),(27909,'GENERIC_DAY',0,2,NULL,'2011-09-15',1114,NULL,16971,NULL),(27910,'GENERIC_DAY',0,3,NULL,'2011-09-20',1112,NULL,16971,NULL),(27911,'GENERIC_DAY',0,0,NULL,'2011-07-09',6970,NULL,16971,NULL),(27912,'GENERIC_DAY',0,0,NULL,'2011-04-10',19999,NULL,16971,NULL),(27913,'GENERIC_DAY',0,3,NULL,'2011-04-19',6970,NULL,16971,NULL),(27914,'GENERIC_DAY',0,2,NULL,'2011-08-26',20001,NULL,16971,NULL),(27915,'GENERIC_DAY',0,0,NULL,'2011-04-30',2829,NULL,16971,NULL),(27916,'GENERIC_DAY',0,2,NULL,'2011-04-22',19999,NULL,16971,NULL),(27917,'GENERIC_DAY',0,2,NULL,'2011-06-22',19999,NULL,16971,NULL),(27918,'GENERIC_DAY',0,3,NULL,'2011-07-20',1114,NULL,16971,NULL),(27919,'GENERIC_DAY',0,2,NULL,'2011-07-08',16062,NULL,16971,NULL),(27920,'GENERIC_DAY',0,0,NULL,'2011-06-26',16062,NULL,16971,NULL),(27921,'GENERIC_DAY',0,0,NULL,'2011-04-16',20001,NULL,16971,NULL),(27922,'GENERIC_DAY',0,0,NULL,'2011-07-16',20001,NULL,16971,NULL),(27923,'GENERIC_DAY',0,0,NULL,'2011-04-24',16060,NULL,16971,NULL),(27924,'GENERIC_DAY',0,0,NULL,'2011-07-26',16060,NULL,16971,NULL),(27925,'GENERIC_DAY',0,2,NULL,'2011-09-26',16062,NULL,16971,NULL),(27926,'GENERIC_DAY',0,0,NULL,'2011-06-12',1114,NULL,16971,NULL),(27927,'GENERIC_DAY',0,2,NULL,'2011-05-13',19999,NULL,16971,NULL),(27928,'GENERIC_DAY',0,3,NULL,'2011-09-23',1112,NULL,16971,NULL),(27929,'GENERIC_DAY',0,0,NULL,'2011-04-17',6970,NULL,16971,NULL),(27930,'GENERIC_DAY',0,0,NULL,'2011-04-09',19999,NULL,16971,NULL),(27931,'GENERIC_DAY',0,2,NULL,'2011-09-23',19999,NULL,16971,NULL),(27932,'GENERIC_DAY',0,0,NULL,'2011-08-07',2829,NULL,16971,NULL),(27933,'GENERIC_DAY',0,2,NULL,'2011-07-27',6970,NULL,16971,NULL),(27934,'GENERIC_DAY',0,2,NULL,'2011-08-02',16062,NULL,16971,NULL),(27935,'GENERIC_DAY',0,2,NULL,'2011-08-03',19999,NULL,16971,NULL),(27936,'GENERIC_DAY',0,3,NULL,'2011-04-12',2829,NULL,16971,NULL),(27937,'GENERIC_DAY',0,2,NULL,'2011-06-07',20001,NULL,16971,NULL),(27938,'GENERIC_DAY',0,0,NULL,'2011-04-17',1114,NULL,16971,NULL),(27939,'GENERIC_DAY',0,0,NULL,'2011-09-24',1114,NULL,16971,NULL),(27940,'GENERIC_DAY',0,3,NULL,'2011-08-03',1114,NULL,16971,NULL),(27941,'GENERIC_DAY',0,2,NULL,'2011-08-31',19999,NULL,16971,NULL),(27942,'GENERIC_DAY',0,3,NULL,'2011-07-26',1114,NULL,16971,NULL),(27943,'GENERIC_DAY',0,2,NULL,'2011-08-08',20001,NULL,16971,NULL),(27944,'GENERIC_DAY',0,0,NULL,'2011-05-27',16060,NULL,16971,NULL),(27945,'GENERIC_DAY',0,2,NULL,'2011-07-15',19999,NULL,16971,NULL),(27946,'GENERIC_DAY',0,0,NULL,'2011-06-04',1112,NULL,16971,NULL),(27947,'GENERIC_DAY',0,2,NULL,'2011-07-07',6970,NULL,16971,NULL),(27948,'GENERIC_DAY',0,0,NULL,'2011-07-25',16060,NULL,16971,NULL),(27949,'GENERIC_DAY',0,2,NULL,'2011-09-29',16062,NULL,16971,NULL),(27950,'GENERIC_DAY',0,2,NULL,'2011-08-09',6970,NULL,16971,NULL),(27951,'GENERIC_DAY',0,2,NULL,'2011-07-25',2829,NULL,16971,NULL),(27952,'GENERIC_DAY',0,0,NULL,'2011-08-24',16060,NULL,16971,NULL),(27953,'GENERIC_DAY',0,0,NULL,'2011-05-01',6970,NULL,16971,NULL),(27954,'GENERIC_DAY',0,0,NULL,'2011-08-23',16060,NULL,16971,NULL),(27955,'GENERIC_DAY',0,2,NULL,'2011-05-13',20001,NULL,16971,NULL),(27956,'GENERIC_DAY',0,0,NULL,'2011-05-07',16062,NULL,16971,NULL),(27957,'GENERIC_DAY',0,0,NULL,'2011-09-10',1114,NULL,16971,NULL),(27958,'GENERIC_DAY',0,0,NULL,'2011-05-14',16060,NULL,16971,NULL),(27959,'GENERIC_DAY',0,2,NULL,'2011-09-23',6970,NULL,16971,NULL),(27960,'GENERIC_DAY',0,3,NULL,'2011-08-24',1114,NULL,16971,NULL),(27961,'GENERIC_DAY',0,0,NULL,'2011-06-04',19999,NULL,16971,NULL),(27962,'GENERIC_DAY',0,2,NULL,'2011-09-20',16062,NULL,16971,NULL),(27963,'GENERIC_DAY',0,0,NULL,'2011-05-29',20001,NULL,16971,NULL),(27964,'GENERIC_DAY',0,3,NULL,'2011-07-18',1114,NULL,16971,NULL),(27965,'GENERIC_DAY',0,2,NULL,'2011-05-27',20001,NULL,16971,NULL),(27966,'GENERIC_DAY',0,2,NULL,'2011-08-29',16062,NULL,16971,NULL),(27967,'GENERIC_DAY',0,0,NULL,'2011-06-19',19999,NULL,16971,NULL),(27968,'GENERIC_DAY',0,2,NULL,'2011-08-18',16062,NULL,16971,NULL),(27969,'GENERIC_DAY',0,0,NULL,'2011-09-17',16060,NULL,16971,NULL),(27970,'GENERIC_DAY',0,3,NULL,'2011-07-15',1114,NULL,16971,NULL),(27971,'GENERIC_DAY',0,0,NULL,'2011-05-01',2829,NULL,16971,NULL),(27972,'GENERIC_DAY',0,0,NULL,'2011-06-18',16060,NULL,16971,NULL),(27973,'GENERIC_DAY',0,2,NULL,'2011-08-23',19999,NULL,16971,NULL),(27974,'GENERIC_DAY',0,0,NULL,'2011-09-17',6970,NULL,16971,NULL),(27975,'GENERIC_DAY',0,2,NULL,'2011-07-06',6970,NULL,16971,NULL),(27976,'GENERIC_DAY',0,0,NULL,'2011-08-29',16060,NULL,16971,NULL),(27977,'GENERIC_DAY',0,3,NULL,'2011-06-22',1112,NULL,16971,NULL),(27978,'GENERIC_DAY',0,0,NULL,'2011-05-22',1112,NULL,16971,NULL),(27979,'GENERIC_DAY',0,3,NULL,'2011-05-13',1112,NULL,16971,NULL),(27980,'GENERIC_DAY',0,3,NULL,'2011-04-13',1112,NULL,16971,NULL),(27981,'GENERIC_DAY',0,0,NULL,'2011-09-10',16062,NULL,16971,NULL),(27982,'GENERIC_DAY',0,0,NULL,'2011-09-04',2829,NULL,16971,NULL),(27983,'GENERIC_DAY',0,2,NULL,'2011-08-16',19999,NULL,16971,NULL),(27984,'GENERIC_DAY',0,0,NULL,'2011-07-24',19999,NULL,16971,NULL),(27985,'GENERIC_DAY',0,2,NULL,'2011-08-03',6970,NULL,16971,NULL),(27986,'GENERIC_DAY',0,2,NULL,'2011-09-27',20001,NULL,16971,NULL),(27987,'GENERIC_DAY',0,2,NULL,'2011-06-16',6970,NULL,16971,NULL),(27988,'GENERIC_DAY',0,2,NULL,'2011-08-03',16062,NULL,16971,NULL),(27989,'GENERIC_DAY',0,3,NULL,'2011-06-03',1114,NULL,16971,NULL),(27990,'GENERIC_DAY',0,2,NULL,'2011-05-19',6970,NULL,16971,NULL),(27991,'GENERIC_DAY',0,0,NULL,'2011-05-29',19999,NULL,16971,NULL),(27992,'GENERIC_DAY',0,0,NULL,'2011-07-03',20001,NULL,16971,NULL),(27993,'GENERIC_DAY',0,2,NULL,'2011-05-11',16062,NULL,16971,NULL),(27994,'GENERIC_DAY',0,2,NULL,'2011-08-22',6970,NULL,16971,NULL),(27995,'GENERIC_DAY',0,0,NULL,'2011-05-16',16060,NULL,16971,NULL),(27996,'GENERIC_DAY',0,2,NULL,'2011-09-08',6970,NULL,16971,NULL),(27997,'GENERIC_DAY',0,0,NULL,'2011-05-15',6970,NULL,16971,NULL),(27998,'GENERIC_DAY',0,0,NULL,'2011-08-28',1114,NULL,16971,NULL),(27999,'GENERIC_DAY',0,2,NULL,'2011-08-08',2829,NULL,16971,NULL),(28000,'GENERIC_DAY',0,0,NULL,'2011-07-09',19999,NULL,16971,NULL),(28001,'GENERIC_DAY',0,0,NULL,'2011-08-28',16062,NULL,16971,NULL),(28002,'GENERIC_DAY',0,3,NULL,'2011-05-27',1112,NULL,16971,NULL),(28003,'GENERIC_DAY',0,2,NULL,'2011-04-25',20001,NULL,16971,NULL),(28004,'GENERIC_DAY',0,0,NULL,'2011-07-24',20001,NULL,16971,NULL),(28005,'GENERIC_DAY',0,2,NULL,'2011-09-02',16062,NULL,16971,NULL),(28006,'GENERIC_DAY',0,2,NULL,'2011-06-16',1112,NULL,16971,NULL),(28007,'GENERIC_DAY',0,0,NULL,'2011-07-30',16062,NULL,16971,NULL),(28008,'GENERIC_DAY',0,2,NULL,'2011-08-26',19999,NULL,16971,NULL),(28009,'GENERIC_DAY',0,0,NULL,'2011-06-01',16060,NULL,16971,NULL),(28010,'GENERIC_DAY',0,2,NULL,'2011-05-19',1112,NULL,16971,NULL),(28011,'GENERIC_DAY',0,2,NULL,'2011-04-26',20001,NULL,16971,NULL),(28012,'GENERIC_DAY',0,3,NULL,'2011-09-26',1114,NULL,16971,NULL),(28013,'GENERIC_DAY',0,2,NULL,'2011-09-12',6970,NULL,16971,NULL),(28014,'GENERIC_DAY',0,2,NULL,'2011-04-15',20001,NULL,16971,NULL),(28015,'GENERIC_DAY',0,3,NULL,'2011-06-27',1114,NULL,16971,NULL),(28016,'GENERIC_DAY',0,2,NULL,'2011-05-13',16062,NULL,16971,NULL),(28017,'GENERIC_DAY',0,0,NULL,'2011-07-09',16062,NULL,16971,NULL),(28018,'GENERIC_DAY',0,2,NULL,'2011-05-09',19999,NULL,16971,NULL),(28019,'GENERIC_DAY',0,2,NULL,'2011-07-15',2829,NULL,16971,NULL),(28020,'GENERIC_DAY',0,2,NULL,'2011-04-28',20001,NULL,16971,NULL),(28021,'GENERIC_DAY',0,0,NULL,'2011-09-18',19999,NULL,16971,NULL),(28022,'GENERIC_DAY',0,3,NULL,'2011-04-08',1114,NULL,16971,NULL),(28023,'GENERIC_DAY',0,3,NULL,'2011-04-27',2829,NULL,16971,NULL),(28024,'GENERIC_DAY',0,0,NULL,'2011-07-24',6970,NULL,16971,NULL),(28025,'GENERIC_DAY',0,2,NULL,'2011-06-20',16062,NULL,16971,NULL),(28026,'GENERIC_DAY',0,2,NULL,'2011-06-29',19999,NULL,16971,NULL),(28027,'GENERIC_DAY',0,2,NULL,'2011-05-16',2829,NULL,16971,NULL),(28028,'GENERIC_DAY',0,3,NULL,'2011-04-15',1112,NULL,16971,NULL),(28029,'GENERIC_DAY',0,3,NULL,'2011-04-20',1114,NULL,16971,NULL),(28030,'GENERIC_DAY',0,2,NULL,'2011-04-28',2829,NULL,16971,NULL),(28031,'GENERIC_DAY',0,2,NULL,'2011-05-10',2829,NULL,16971,NULL),(28032,'GENERIC_DAY',0,2,NULL,'2011-07-05',20001,NULL,16971,NULL),(28033,'GENERIC_DAY',0,0,NULL,'2011-07-31',19999,NULL,16971,NULL),(28034,'GENERIC_DAY',0,2,NULL,'2011-07-11',16062,NULL,16971,NULL),(28035,'GENERIC_DAY',0,2,NULL,'2011-09-15',16062,NULL,16971,NULL),(28036,'GENERIC_DAY',0,2,NULL,'2011-08-25',20001,NULL,16971,NULL),(28037,'GENERIC_DAY',0,2,NULL,'2011-05-05',1114,NULL,16971,NULL),(28038,'GENERIC_DAY',0,3,NULL,'2011-04-15',6970,NULL,16971,NULL),(28039,'GENERIC_DAY',0,2,NULL,'2011-09-21',6970,NULL,16971,NULL),(28040,'GENERIC_DAY',0,2,NULL,'2011-06-09',16062,NULL,16971,NULL),(28041,'GENERIC_DAY',0,0,NULL,'2011-08-09',16060,NULL,16971,NULL),(28042,'GENERIC_DAY',0,2,NULL,'2011-05-12',1112,NULL,16971,NULL),(28043,'GENERIC_DAY',0,3,NULL,'2011-06-07',1112,NULL,16971,NULL),(28044,'GENERIC_DAY',0,2,NULL,'2011-05-05',1112,NULL,16971,NULL),(28045,'GENERIC_DAY',0,3,NULL,'2011-08-30',1114,NULL,16971,NULL),(28046,'GENERIC_DAY',0,3,NULL,'2011-05-17',1112,NULL,16971,NULL),(28047,'GENERIC_DAY',0,0,NULL,'2011-07-23',6970,NULL,16971,NULL),(28048,'GENERIC_DAY',0,3,NULL,'2011-07-13',1112,NULL,16971,NULL),(28049,'GENERIC_DAY',0,2,NULL,'2011-07-01',2829,NULL,16971,NULL),(28050,'GENERIC_DAY',0,0,NULL,'2011-09-04',6970,NULL,16971,NULL),(28051,'GENERIC_DAY',0,0,NULL,'2011-05-30',16060,NULL,16971,NULL),(28052,'GENERIC_DAY',0,0,NULL,'2011-04-23',1114,NULL,16971,NULL),(28053,'GENERIC_DAY',0,2,NULL,'2011-07-15',20001,NULL,16971,NULL),(28054,'GENERIC_DAY',0,2,NULL,'2011-09-08',1114,NULL,16971,NULL),(28055,'GENERIC_DAY',0,2,NULL,'2011-08-29',2829,NULL,16971,NULL),(28056,'GENERIC_DAY',0,0,NULL,'2011-09-24',1112,NULL,16971,NULL),(28057,'GENERIC_DAY',0,2,NULL,'2011-08-23',16062,NULL,16971,NULL),(28058,'GENERIC_DAY',0,2,NULL,'2011-08-29',19999,NULL,16971,NULL),(28059,'GENERIC_DAY',0,0,NULL,'2011-06-10',16060,NULL,16971,NULL),(28060,'GENERIC_DAY',0,0,NULL,'2011-07-13',16060,NULL,16971,NULL),(28061,'GENERIC_DAY',0,2,NULL,'2011-08-04',6970,NULL,16971,NULL),(28062,'GENERIC_DAY',0,0,NULL,'2011-04-08',16060,NULL,16971,NULL),(28063,'GENERIC_DAY',0,2,NULL,'2011-05-09',2829,NULL,16971,NULL),(28064,'GENERIC_DAY',0,2,NULL,'2011-08-18',1112,NULL,16971,NULL),(28065,'GENERIC_DAY',0,0,NULL,'2011-08-20',6970,NULL,16971,NULL),(28066,'GENERIC_DAY',0,2,NULL,'2011-06-13',20001,NULL,16971,NULL),(28067,'GENERIC_DAY',0,2,NULL,'2011-05-25',16062,NULL,16971,NULL),(28068,'GENERIC_DAY',0,3,NULL,'2011-09-28',1112,NULL,16971,NULL),(28069,'GENERIC_DAY',0,0,NULL,'2011-06-26',6970,NULL,16971,NULL),(28070,'GENERIC_DAY',0,2,NULL,'2011-05-17',19999,NULL,16971,NULL),(28071,'GENERIC_DAY',0,0,NULL,'2011-06-24',16060,NULL,16971,NULL),(28072,'GENERIC_DAY',0,2,NULL,'2011-08-18',6970,NULL,16971,NULL),(28073,'GENERIC_DAY',0,0,NULL,'2011-07-03',19999,NULL,16971,NULL),(28074,'GENERIC_DAY',0,2,NULL,'2011-07-08',6970,NULL,16971,NULL),(28075,'GENERIC_DAY',0,3,NULL,'2011-04-26',1112,NULL,16971,NULL),(28076,'GENERIC_DAY',0,2,NULL,'2011-07-20',20001,NULL,16971,NULL),(28077,'GENERIC_DAY',0,2,NULL,'2011-08-25',16060,NULL,16971,NULL),(28078,'GENERIC_DAY',0,0,NULL,'2011-06-08',16060,NULL,16971,NULL),(28079,'GENERIC_DAY',0,2,NULL,'2011-07-05',16062,NULL,16971,NULL),(28080,'GENERIC_DAY',0,2,NULL,'2011-06-30',6970,NULL,16971,NULL),(28081,'GENERIC_DAY',0,2,NULL,'2011-06-29',16062,NULL,16971,NULL),(28082,'GENERIC_DAY',0,3,NULL,'2011-06-28',1114,NULL,16971,NULL),(28083,'GENERIC_DAY',0,2,NULL,'2011-07-05',6970,NULL,16971,NULL),(28084,'GENERIC_DAY',0,2,NULL,'2011-05-17',20001,NULL,16971,NULL),(28085,'GENERIC_DAY',0,2,NULL,'2011-07-29',19999,NULL,16971,NULL),(28086,'GENERIC_DAY',0,0,NULL,'2011-09-17',20001,NULL,16971,NULL),(28087,'GENERIC_DAY',0,2,NULL,'2011-07-07',1112,NULL,16971,NULL),(28088,'GENERIC_DAY',0,2,NULL,'2011-05-19',16060,NULL,16971,NULL),(28089,'GENERIC_DAY',0,3,NULL,'2011-09-05',1112,NULL,16971,NULL),(28090,'GENERIC_DAY',0,3,NULL,'2011-04-28',1112,NULL,16971,NULL),(28091,'GENERIC_DAY',0,0,NULL,'2011-07-23',16060,NULL,16971,NULL),(28092,'GENERIC_DAY',0,0,NULL,'2011-08-06',19999,NULL,16971,NULL),(28093,'GENERIC_DAY',0,0,NULL,'2011-09-11',16060,NULL,16971,NULL),(28094,'GENERIC_DAY',0,2,NULL,'2011-05-10',19999,NULL,16971,NULL),(28095,'GENERIC_DAY',0,0,NULL,'2011-07-03',16062,NULL,16971,NULL),(28096,'GENERIC_DAY',0,0,NULL,'2011-09-03',16060,NULL,16971,NULL),(28097,'GENERIC_DAY',0,0,NULL,'2011-09-10',6970,NULL,16971,NULL),(28098,'GENERIC_DAY',0,0,NULL,'2011-05-14',1112,NULL,16971,NULL),(28099,'GENERIC_DAY',0,0,NULL,'2011-04-22',16060,NULL,16971,NULL),(28100,'GENERIC_DAY',0,2,NULL,'2011-09-28',20001,NULL,16971,NULL),(28101,'GENERIC_DAY',0,0,NULL,'2011-05-29',1114,NULL,16971,NULL),(28102,'GENERIC_DAY',0,2,NULL,'2011-09-29',2829,NULL,16971,NULL),(28103,'GENERIC_DAY',0,0,NULL,'2011-09-11',16062,NULL,16971,NULL),(28104,'GENERIC_DAY',0,2,NULL,'2011-06-21',16062,NULL,16971,NULL),(28105,'GENERIC_DAY',0,2,NULL,'2011-09-01',6970,NULL,16971,NULL),(28106,'GENERIC_DAY',0,2,NULL,'2011-07-20',6970,NULL,16971,NULL),(28107,'GENERIC_DAY',0,0,NULL,'2011-09-11',19999,NULL,16971,NULL),(28108,'GENERIC_DAY',0,0,NULL,'2011-08-07',1114,NULL,16971,NULL),(28109,'GENERIC_DAY',0,0,NULL,'2011-05-11',16060,NULL,16971,NULL),(28110,'GENERIC_DAY',0,2,NULL,'2011-05-17',16062,NULL,16971,NULL),(28111,'GENERIC_DAY',0,2,NULL,'2011-08-05',16062,NULL,16971,NULL),(28112,'GENERIC_DAY',0,2,NULL,'2011-07-18',20001,NULL,16971,NULL),(28113,'GENERIC_DAY',0,2,NULL,'2011-07-22',16062,NULL,16971,NULL),(28114,'GENERIC_DAY',0,2,NULL,'2011-07-26',20001,NULL,16971,NULL),(28115,'GENERIC_DAY',0,2,NULL,'2011-05-26',16060,NULL,16971,NULL),(28116,'GENERIC_DAY',0,0,NULL,'2011-07-24',1114,NULL,16971,NULL),(28117,'GENERIC_DAY',0,0,NULL,'2011-06-05',20001,NULL,16971,NULL),(28118,'GENERIC_DAY',0,2,NULL,'2011-07-19',20001,NULL,16971,NULL),(28119,'GENERIC_DAY',0,2,NULL,'2011-09-22',16062,NULL,16971,NULL),(28120,'GENERIC_DAY',0,2,NULL,'2011-08-04',20001,NULL,16971,NULL),(28121,'GENERIC_DAY',0,3,NULL,'2011-08-09',1114,NULL,16971,NULL),(28122,'GENERIC_DAY',0,0,NULL,'2011-09-18',16062,NULL,16971,NULL),(28123,'GENERIC_DAY',0,0,NULL,'2011-06-12',6970,NULL,16971,NULL),(28124,'GENERIC_DAY',0,2,NULL,'2011-07-14',20001,NULL,16971,NULL),(28125,'GENERIC_DAY',0,0,NULL,'2011-08-21',19999,NULL,16971,NULL),(28126,'GENERIC_DAY',0,0,NULL,'2011-07-30',2829,NULL,16971,NULL),(28127,'GENERIC_DAY',0,2,NULL,'2011-09-16',16062,NULL,16971,NULL),(28128,'GENERIC_DAY',0,2,NULL,'2011-06-01',2829,NULL,16971,NULL),(28129,'GENERIC_DAY',0,2,NULL,'2011-05-24',16062,NULL,16971,NULL),(28130,'GENERIC_DAY',0,2,NULL,'2011-06-21',20001,NULL,16971,NULL),(28131,'GENERIC_DAY',0,0,NULL,'2011-04-24',6970,NULL,16971,NULL),(28132,'GENERIC_DAY',0,2,NULL,'2011-06-10',16062,NULL,16971,NULL),(28133,'GENERIC_DAY',0,3,NULL,'2011-06-10',1114,NULL,16971,NULL),(28134,'GENERIC_DAY',0,2,NULL,'2011-08-26',2829,NULL,16971,NULL),(28135,'GENERIC_DAY',0,2,NULL,'2011-07-08',20001,NULL,16971,NULL),(28136,'GENERIC_DAY',0,2,NULL,'2011-05-24',20001,NULL,16971,NULL),(28137,'GENERIC_DAY',0,0,NULL,'2011-05-21',16060,NULL,16971,NULL),(28138,'GENERIC_DAY',0,2,NULL,'2011-05-31',16062,NULL,16971,NULL),(28139,'GENERIC_DAY',0,0,NULL,'2011-07-02',2829,NULL,16971,NULL),(28140,'GENERIC_DAY',0,2,NULL,'2011-05-30',6970,NULL,16971,NULL),(28141,'GENERIC_DAY',0,2,NULL,'2011-09-14',20001,NULL,16971,NULL),(28142,'GENERIC_DAY',0,2,NULL,'2011-05-12',1114,NULL,16971,NULL),(28143,'GENERIC_DAY',0,2,NULL,'2011-08-30',19999,NULL,16971,NULL),(28144,'GENERIC_DAY',0,2,NULL,'2011-09-15',20001,NULL,16971,NULL),(28145,'GENERIC_DAY',0,2,NULL,'2011-04-28',16060,NULL,16971,NULL),(28146,'GENERIC_DAY',0,0,NULL,'2011-06-05',6970,NULL,16971,NULL),(28147,'GENERIC_DAY',0,0,NULL,'2011-05-10',16060,NULL,16971,NULL),(28148,'GENERIC_DAY',0,2,NULL,'2011-09-16',6970,NULL,16971,NULL),(28149,'GENERIC_DAY',0,2,NULL,'2011-05-03',6970,NULL,16971,NULL),(28150,'GENERIC_DAY',0,3,NULL,'2011-09-05',1114,NULL,16971,NULL),(28151,'GENERIC_DAY',0,2,NULL,'2011-05-27',19999,NULL,16971,NULL),(28152,'GENERIC_DAY',0,0,NULL,'2011-09-18',1114,NULL,16971,NULL),(28153,'GENERIC_DAY',0,2,NULL,'2011-07-15',6970,NULL,16971,NULL),(28154,'GENERIC_DAY',0,2,NULL,'2011-06-28',19999,NULL,16971,NULL),(28155,'GENERIC_DAY',0,2,NULL,'2011-05-10',20001,NULL,16971,NULL),(28156,'GENERIC_DAY',0,2,NULL,'2011-06-01',20001,NULL,16971,NULL),(28157,'GENERIC_DAY',0,2,NULL,'2011-08-09',20001,NULL,16971,NULL),(28158,'GENERIC_DAY',0,2,NULL,'2011-06-13',6970,NULL,16971,NULL),(28159,'GENERIC_DAY',0,0,NULL,'2011-05-02',16060,NULL,16971,NULL),(28160,'GENERIC_DAY',0,2,NULL,'2011-06-06',16062,NULL,16971,NULL),(28161,'GENERIC_DAY',0,0,NULL,'2011-04-17',19999,NULL,16971,NULL),(28162,'GENERIC_DAY',0,2,NULL,'2011-04-14',19999,NULL,16971,NULL),(28163,'GENERIC_DAY',0,2,NULL,'2011-09-28',16062,NULL,16971,NULL),(28164,'GENERIC_DAY',0,2,NULL,'2011-09-14',16062,NULL,16971,NULL),(28165,'GENERIC_DAY',0,2,NULL,'2011-08-29',20001,NULL,16971,NULL),(28166,'GENERIC_DAY',0,2,NULL,'2011-07-14',19999,NULL,16971,NULL),(28167,'GENERIC_DAY',0,0,NULL,'2011-05-08',16060,NULL,16971,NULL),(28168,'GENERIC_DAY',0,2,NULL,'2011-08-10',19999,NULL,16971,NULL),(28169,'GENERIC_DAY',0,2,NULL,'2011-09-01',2829,NULL,16971,NULL),(28170,'GENERIC_DAY',0,2,NULL,'2011-07-22',20001,NULL,16971,NULL),(28171,'GENERIC_DAY',0,0,NULL,'2011-05-07',6970,NULL,16971,NULL),(28172,'GENERIC_DAY',0,0,NULL,'2011-05-01',16060,NULL,16971,NULL),(28173,'GENERIC_DAY',0,0,NULL,'2011-07-30',1114,NULL,16971,NULL),(28174,'GENERIC_DAY',0,3,NULL,'2011-06-27',1112,NULL,16971,NULL),(28175,'GENERIC_DAY',0,3,NULL,'2011-07-08',1112,NULL,16971,NULL),(28176,'GENERIC_DAY',0,0,NULL,'2011-06-11',6970,NULL,16971,NULL),(28177,'GENERIC_DAY',0,0,NULL,'2011-07-23',20001,NULL,16971,NULL),(28178,'GENERIC_DAY',0,0,NULL,'2011-05-28',19999,NULL,16971,NULL),(28179,'GENERIC_DAY',0,2,NULL,'2011-06-10',20001,NULL,16971,NULL),(28180,'GENERIC_DAY',0,2,NULL,'2011-06-02',2829,NULL,16971,NULL),(28181,'GENERIC_DAY',0,3,NULL,'2011-08-24',1112,NULL,16971,NULL),(28182,'GENERIC_DAY',0,0,NULL,'2011-05-28',1114,NULL,16971,NULL),(28183,'GENERIC_DAY',0,0,NULL,'2011-07-31',16060,NULL,16971,NULL),(28184,'GENERIC_DAY',0,2,NULL,'2011-05-18',6970,NULL,16971,NULL),(28185,'GENERIC_DAY',0,0,NULL,'2011-04-23',6970,NULL,16971,NULL),(28186,'GENERIC_DAY',0,0,NULL,'2011-04-17',1112,NULL,16971,NULL),(28187,'GENERIC_DAY',0,0,NULL,'2011-07-10',19999,NULL,16971,NULL),(28188,'GENERIC_DAY',0,0,NULL,'2011-05-07',16060,NULL,16971,NULL),(28189,'GENERIC_DAY',0,2,NULL,'2011-06-09',6970,NULL,16971,NULL),(28190,'GENERIC_DAY',0,0,NULL,'2011-07-17',19999,NULL,16971,NULL),(28191,'GENERIC_DAY',0,3,NULL,'2011-07-11',1114,NULL,16971,NULL),(28192,'GENERIC_DAY',0,0,NULL,'2011-06-25',1114,NULL,16971,NULL),(28193,'GENERIC_DAY',0,0,NULL,'2011-08-20',19999,NULL,16971,NULL),(28194,'GENERIC_DAY',0,2,NULL,'2011-09-21',16062,NULL,16971,NULL),(28195,'GENERIC_DAY',0,2,NULL,'2011-05-16',20001,NULL,16971,NULL),(28196,'GENERIC_DAY',0,3,NULL,'2011-09-13',1112,NULL,16971,NULL),(28197,'GENERIC_DAY',0,3,NULL,'2011-05-25',1112,NULL,16971,NULL),(28198,'GENERIC_DAY',0,2,NULL,'2011-08-03',20001,NULL,16971,NULL),(28199,'GENERIC_DAY',0,2,NULL,'2011-07-14',1114,NULL,16971,NULL),(28200,'GENERIC_DAY',0,2,NULL,'2011-08-22',2829,NULL,16971,NULL),(28201,'GENERIC_DAY',0,2,NULL,'2011-06-16',16062,NULL,16971,NULL),(28202,'GENERIC_DAY',0,3,NULL,'2011-09-16',1114,NULL,16971,NULL),(28203,'GENERIC_DAY',0,0,NULL,'2011-04-30',1112,NULL,16971,NULL),(28204,'GENERIC_DAY',0,3,NULL,'2011-09-12',1112,NULL,16971,NULL),(28205,'GENERIC_DAY',0,0,NULL,'2011-06-04',20001,NULL,16971,NULL),(28206,'GENERIC_DAY',0,2,NULL,'2011-06-08',16062,NULL,16971,NULL),(28207,'GENERIC_DAY',0,0,NULL,'2011-09-24',20001,NULL,16971,NULL),(28208,'GENERIC_DAY',0,3,NULL,'2011-05-24',1112,NULL,16971,NULL),(28209,'GENERIC_DAY',0,2,NULL,'2011-07-13',19999,NULL,16971,NULL),(28210,'GENERIC_DAY',0,0,NULL,'2011-08-13',1114,NULL,16971,NULL),(28211,'GENERIC_DAY',0,2,NULL,'2011-06-16',1114,NULL,16971,NULL),(28212,'GENERIC_DAY',0,2,NULL,'2011-05-02',20001,NULL,16971,NULL),(28213,'GENERIC_DAY',0,3,NULL,'2011-05-09',1112,NULL,16971,NULL),(28214,'GENERIC_DAY',0,2,NULL,'2011-08-18',20001,NULL,16971,NULL),(28215,'GENERIC_DAY',0,3,NULL,'2011-08-15',1112,NULL,16971,NULL),(28216,'GENERIC_DAY',0,0,NULL,'2011-04-23',1112,NULL,16971,NULL),(28217,'GENERIC_DAY',0,2,NULL,'2011-08-12',6970,NULL,16971,NULL),(28218,'GENERIC_DAY',0,2,NULL,'2011-05-31',2829,NULL,16971,NULL),(28219,'GENERIC_DAY',0,2,NULL,'2011-05-26',6970,NULL,16971,NULL),(28220,'GENERIC_DAY',0,0,NULL,'2011-08-27',1114,NULL,16971,NULL),(28221,'GENERIC_DAY',0,3,NULL,'2011-04-20',2829,NULL,16971,NULL),(28222,'GENERIC_DAY',0,3,NULL,'2011-08-10',1114,NULL,16971,NULL),(28223,'GENERIC_DAY',0,2,NULL,'2011-08-30',16062,NULL,16971,NULL),(28224,'GENERIC_DAY',0,0,NULL,'2011-07-30',19999,NULL,16971,NULL),(28225,'GENERIC_DAY',0,2,NULL,'2011-06-02',19999,NULL,16971,NULL),(28226,'GENERIC_DAY',0,0,NULL,'2011-04-23',16060,NULL,16971,NULL),(28227,'GENERIC_DAY',0,2,NULL,'2011-09-16',19999,NULL,16971,NULL),(28228,'GENERIC_DAY',0,2,NULL,'2011-07-12',2829,NULL,16971,NULL),(28229,'GENERIC_DAY',0,2,NULL,'2011-06-09',2829,NULL,16971,NULL),(28230,'GENERIC_DAY',0,2,NULL,'2011-07-28',16060,NULL,16971,NULL),(28231,'GENERIC_DAY',0,2,NULL,'2011-07-28',2829,NULL,16971,NULL),(28232,'GENERIC_DAY',0,0,NULL,'2011-06-18',20001,NULL,16971,NULL),(28233,'GENERIC_DAY',0,3,NULL,'2011-04-27',1114,NULL,16971,NULL),(28234,'GENERIC_DAY',0,0,NULL,'2011-07-10',16060,NULL,16971,NULL),(28235,'GENERIC_DAY',0,3,NULL,'2011-04-19',2829,NULL,16971,NULL),(28236,'GENERIC_DAY',0,2,NULL,'2011-08-09',16062,NULL,16971,NULL),(28237,'GENERIC_DAY',0,2,NULL,'2011-06-23',20001,NULL,16971,NULL),(28238,'GENERIC_DAY',0,0,NULL,'2011-07-10',1112,NULL,16971,NULL),(28239,'GENERIC_DAY',0,2,NULL,'2011-05-10',6970,NULL,16971,NULL),(28240,'GENERIC_DAY',0,3,NULL,'2011-04-25',6970,NULL,16971,NULL),(28241,'GENERIC_DAY',0,3,NULL,'2011-08-23',1114,NULL,16971,NULL),(28242,'GENERIC_DAY',0,2,NULL,'2011-07-26',6970,NULL,16971,NULL),(28243,'GENERIC_DAY',0,0,NULL,'2011-07-09',2829,NULL,16971,NULL),(28244,'GENERIC_DAY',0,2,NULL,'2011-06-15',19999,NULL,16971,NULL),(28245,'GENERIC_DAY',0,2,NULL,'2011-07-13',20001,NULL,16971,NULL),(28246,'GENERIC_DAY',0,0,NULL,'2011-08-28',1112,NULL,16971,NULL),(28247,'GENERIC_DAY',0,0,NULL,'2011-05-01',16062,NULL,16971,NULL),(28248,'GENERIC_DAY',0,2,NULL,'2011-06-10',19999,NULL,16971,NULL),(28249,'GENERIC_DAY',0,2,NULL,'2011-05-25',20001,NULL,16971,NULL),(28250,'GENERIC_DAY',0,0,NULL,'2011-09-26',16060,NULL,16971,NULL),(28251,'GENERIC_DAY',0,2,NULL,'2011-08-29',6970,NULL,16971,NULL),(28252,'GENERIC_DAY',0,2,NULL,'2011-05-17',6970,NULL,16971,NULL),(28253,'GENERIC_DAY',0,0,NULL,'2011-06-03',16060,NULL,16971,NULL),(28254,'GENERIC_DAY',0,2,NULL,'2011-05-10',16062,NULL,16971,NULL),(28255,'GENERIC_DAY',0,2,NULL,'2011-07-27',2829,NULL,16971,NULL),(28256,'GENERIC_DAY',0,2,NULL,'2011-08-01',2829,NULL,16971,NULL),(28257,'GENERIC_DAY',0,3,NULL,'2011-09-09',1114,NULL,16971,NULL),(28258,'GENERIC_DAY',0,0,NULL,'2011-09-21',16060,NULL,16971,NULL),(28259,'GENERIC_DAY',0,0,NULL,'2011-09-17',16062,NULL,16971,NULL),(28260,'GENERIC_DAY',0,0,NULL,'2011-09-18',2829,NULL,16971,NULL),(28261,'GENERIC_DAY',0,3,NULL,'2011-06-08',1112,NULL,16971,NULL),(28262,'GENERIC_DAY',0,2,NULL,'2011-05-11',2829,NULL,16971,NULL),(28263,'GENERIC_DAY',0,2,NULL,'2011-06-14',2829,NULL,16971,NULL),(28264,'GENERIC_DAY',0,2,NULL,'2011-09-12',19999,NULL,16971,NULL),(28265,'GENERIC_DAY',0,3,NULL,'2011-06-14',1112,NULL,16971,NULL),(28266,'GENERIC_DAY',0,2,NULL,'2011-09-27',16062,NULL,16971,NULL),(28267,'GENERIC_DAY',0,2,NULL,'2011-06-17',20001,NULL,16971,NULL),(28268,'GENERIC_DAY',0,2,NULL,'2011-05-03',19999,NULL,16971,NULL),(28269,'GENERIC_DAY',0,0,NULL,'2011-07-10',16062,NULL,16971,NULL),(28270,'GENERIC_DAY',0,2,NULL,'2011-07-21',6970,NULL,16971,NULL),(28271,'GENERIC_DAY',0,0,NULL,'2011-09-11',6970,NULL,16971,NULL),(28272,'GENERIC_DAY',0,2,NULL,'2011-05-26',2829,NULL,16971,NULL),(28273,'GENERIC_DAY',0,0,NULL,'2011-09-25',20001,NULL,16971,NULL),(28274,'GENERIC_DAY',0,0,NULL,'2011-05-14',20001,NULL,16971,NULL),(28275,'GENERIC_DAY',0,3,NULL,'2011-04-22',1114,NULL,16971,NULL),(28276,'GENERIC_DAY',0,0,NULL,'2011-07-24',1112,NULL,16971,NULL),(28277,'GENERIC_DAY',0,2,NULL,'2011-08-01',19999,NULL,16971,NULL),(28278,'GENERIC_DAY',0,0,NULL,'2011-04-16',1114,NULL,16971,NULL),(28279,'GENERIC_DAY',0,0,NULL,'2011-07-02',16060,NULL,16971,NULL),(28280,'GENERIC_DAY',0,2,NULL,'2011-08-17',20001,NULL,16971,NULL),(28281,'GENERIC_DAY',0,2,NULL,'2011-06-03',2829,NULL,16971,NULL),(28282,'GENERIC_DAY',0,0,NULL,'2011-09-10',20001,NULL,16971,NULL),(28283,'GENERIC_DAY',0,2,NULL,'2011-06-16',19999,NULL,16971,NULL),(28284,'GENERIC_DAY',0,0,NULL,'2011-05-21',6970,NULL,16971,NULL),(28285,'GENERIC_DAY',0,2,NULL,'2011-05-27',2829,NULL,16971,NULL),(28286,'GENERIC_DAY',0,0,NULL,'2011-09-25',2829,NULL,16971,NULL),(28287,'GENERIC_DAY',0,2,NULL,'2011-06-15',20001,NULL,16971,NULL),(28288,'GENERIC_DAY',0,0,NULL,'2011-08-14',1114,NULL,16971,NULL),(28289,'GENERIC_DAY',0,0,NULL,'2011-04-24',1112,NULL,16971,NULL),(28290,'GENERIC_DAY',0,3,NULL,'2011-07-20',1112,NULL,16971,NULL),(28291,'GENERIC_DAY',0,0,NULL,'2011-09-18',6970,NULL,16971,NULL),(28292,'GENERIC_DAY',0,2,NULL,'2011-09-02',2829,NULL,16971,NULL),(28293,'GENERIC_DAY',0,3,NULL,'2011-09-16',1112,NULL,16971,NULL),(28294,'GENERIC_DAY',0,2,NULL,'2011-07-18',2829,NULL,16971,NULL),(28295,'GENERIC_DAY',0,3,NULL,'2011-07-22',1114,NULL,16971,NULL),(28296,'GENERIC_DAY',0,0,NULL,'2011-09-04',16060,NULL,16971,NULL),(28297,'GENERIC_DAY',0,2,NULL,'2011-05-05',16062,NULL,16971,NULL),(28298,'GENERIC_DAY',0,2,NULL,'2011-05-03',2829,NULL,16971,NULL),(28299,'GENERIC_DAY',0,2,NULL,'2011-04-27',19999,NULL,16971,NULL),(28300,'GENERIC_DAY',0,2,NULL,'2011-07-25',6970,NULL,16971,NULL),(28301,'GENERIC_DAY',0,2,NULL,'2011-09-08',19999,NULL,16971,NULL),(28302,'GENERIC_DAY',0,3,NULL,'2011-04-21',1114,NULL,16971,NULL),(28303,'GENERIC_DAY',0,2,NULL,'2011-09-08',2829,NULL,16971,NULL),(28304,'GENERIC_DAY',0,3,NULL,'2011-07-01',1114,NULL,16971,NULL),(28305,'GENERIC_DAY',0,0,NULL,'2011-06-11',19999,NULL,16971,NULL),(28306,'GENERIC_DAY',0,0,NULL,'2011-09-11',1114,NULL,16971,NULL),(28307,'GENERIC_DAY',0,2,NULL,'2011-09-23',20001,NULL,16971,NULL),(28308,'GENERIC_DAY',0,2,NULL,'2011-07-01',6970,NULL,16971,NULL),(28309,'GENERIC_DAY',0,2,NULL,'2011-06-30',16060,NULL,16971,NULL),(28310,'GENERIC_DAY',0,0,NULL,'2011-05-14',19999,NULL,16971,NULL),(28311,'GENERIC_DAY',0,2,NULL,'2011-07-06',19999,NULL,16971,NULL),(28312,'GENERIC_DAY',0,2,NULL,'2011-07-21',2829,NULL,16971,NULL),(28313,'GENERIC_DAY',0,0,NULL,'2011-05-21',19999,NULL,16971,NULL),(28314,'GENERIC_DAY',0,3,NULL,'2011-05-27',1114,NULL,16971,NULL),(28315,'GENERIC_DAY',0,2,NULL,'2011-09-06',6970,NULL,16971,NULL),(28316,'GENERIC_DAY',0,0,NULL,'2011-05-21',16062,NULL,16971,NULL),(28317,'GENERIC_DAY',0,3,NULL,'2011-04-15',2829,NULL,16971,NULL),(28318,'GENERIC_DAY',0,2,NULL,'2011-08-23',2829,NULL,16971,NULL),(28319,'GENERIC_DAY',0,2,NULL,'2011-08-31',16062,NULL,16971,NULL),(28320,'GENERIC_DAY',0,2,NULL,'2011-05-18',16062,NULL,16971,NULL),(28321,'GENERIC_DAY',0,0,NULL,'2011-06-26',1112,NULL,16971,NULL),(28322,'GENERIC_DAY',0,0,NULL,'2011-08-07',16062,NULL,16971,NULL),(28323,'GENERIC_DAY',0,3,NULL,'2011-09-21',1112,NULL,16971,NULL),(28324,'GENERIC_DAY',0,2,NULL,'2011-07-13',2829,NULL,16971,NULL),(28325,'GENERIC_DAY',0,2,NULL,'2011-05-11',20001,NULL,16971,NULL),(28326,'GENERIC_DAY',0,3,NULL,'2011-07-13',1114,NULL,16971,NULL),(28327,'GENERIC_DAY',0,0,NULL,'2011-07-31',20001,NULL,16971,NULL),(28328,'GENERIC_DAY',0,0,NULL,'2011-09-24',6970,NULL,16971,NULL),(28329,'GENERIC_DAY',0,0,NULL,'2011-05-22',16062,NULL,16971,NULL),(28330,'GENERIC_DAY',0,2,NULL,'2011-09-13',16062,NULL,16971,NULL),(28331,'GENERIC_DAY',0,0,NULL,'2011-07-23',2829,NULL,16971,NULL),(28332,'GENERIC_DAY',0,2,NULL,'2011-09-26',20001,NULL,16971,NULL),(28333,'GENERIC_DAY',0,2,NULL,'2011-06-06',19999,NULL,16971,NULL),(28334,'GENERIC_DAY',0,3,NULL,'2011-08-05',1114,NULL,16971,NULL),(28335,'GENERIC_DAY',0,2,NULL,'2011-07-12',6970,NULL,16971,NULL),(28336,'GENERIC_DAY',0,3,NULL,'2011-04-18',6970,NULL,16971,NULL),(28337,'GENERIC_DAY',0,3,NULL,'2011-07-15',1112,NULL,16971,NULL),(28338,'GENERIC_DAY',0,0,NULL,'2011-07-10',1114,NULL,16971,NULL),(28339,'GENERIC_DAY',0,2,NULL,'2011-09-22',20001,NULL,16971,NULL),(28340,'GENERIC_DAY',0,2,NULL,'2011-08-19',6970,NULL,16971,NULL),(28341,'GENERIC_DAY',0,0,NULL,'2011-08-22',16060,NULL,16971,NULL),(28342,'GENERIC_DAY',0,0,NULL,'2011-05-21',1114,NULL,16971,NULL),(28343,'GENERIC_DAY',0,2,NULL,'2011-09-13',19999,NULL,16971,NULL),(28344,'GENERIC_DAY',0,3,NULL,'2011-04-26',6970,NULL,16971,NULL),(28345,'GENERIC_DAY',0,3,NULL,'2011-07-01',1112,NULL,16971,NULL),(28346,'GENERIC_DAY',0,2,NULL,'2011-09-19',19999,NULL,16971,NULL),(28347,'GENERIC_DAY',0,3,NULL,'2011-06-01',1114,NULL,16971,NULL),(28348,'GENERIC_DAY',0,0,NULL,'2011-08-27',1112,NULL,16971,NULL),(28349,'GENERIC_DAY',0,3,NULL,'2011-04-21',1112,NULL,16971,NULL),(28350,'GENERIC_DAY',0,2,NULL,'2011-06-24',6970,NULL,16971,NULL),(28351,'GENERIC_DAY',0,0,NULL,'2011-08-27',19999,NULL,16971,NULL),(28352,'GENERIC_DAY',0,0,NULL,'2011-09-03',19999,NULL,16971,NULL),(28353,'GENERIC_DAY',0,3,NULL,'2011-04-20',1112,NULL,16971,NULL),(28354,'GENERIC_DAY',0,0,NULL,'2011-06-07',16060,NULL,16971,NULL),(28355,'GENERIC_DAY',0,2,NULL,'2011-07-04',6970,NULL,16971,NULL),(28356,'GENERIC_DAY',0,2,NULL,'2011-08-15',2829,NULL,16971,NULL),(28357,'GENERIC_DAY',0,0,NULL,'2011-06-28',16060,NULL,16971,NULL),(28358,'GENERIC_DAY',0,3,NULL,'2011-07-05',1114,NULL,16971,NULL),(28359,'GENERIC_DAY',0,0,NULL,'2011-06-18',1114,NULL,16971,NULL),(28360,'GENERIC_DAY',0,2,NULL,'2011-05-18',19999,NULL,16971,NULL),(28361,'GENERIC_DAY',0,0,NULL,'2011-04-25',16060,NULL,16971,NULL),(28362,'GENERIC_DAY',0,0,NULL,'2011-08-10',16060,NULL,16971,NULL),(28363,'GENERIC_DAY',0,0,NULL,'2011-09-10',19999,NULL,16971,NULL),(28364,'GENERIC_DAY',0,3,NULL,'2011-06-20',1114,NULL,16971,NULL),(28365,'GENERIC_DAY',0,0,NULL,'2011-08-21',16060,NULL,16971,NULL),(28366,'GENERIC_DAY',0,2,NULL,'2011-08-10',16062,NULL,16971,NULL),(28367,'GENERIC_DAY',0,3,NULL,'2011-05-04',1112,NULL,16971,NULL),(28368,'GENERIC_DAY',0,2,NULL,'2011-09-01',16060,NULL,16971,NULL),(28369,'GENERIC_DAY',0,0,NULL,'2011-04-15',16060,NULL,16971,NULL),(28370,'GENERIC_DAY',0,0,NULL,'2011-09-27',16060,NULL,16971,NULL),(28371,'GENERIC_DAY',0,2,NULL,'2011-07-06',16062,NULL,16971,NULL),(28372,'GENERIC_DAY',0,0,NULL,'2011-09-25',16060,NULL,16971,NULL),(28373,'GENERIC_DAY',0,0,NULL,'2011-08-27',20001,NULL,16971,NULL),(28374,'GENERIC_DAY',0,2,NULL,'2011-09-13',2829,NULL,16971,NULL),(28375,'GENERIC_DAY',0,0,NULL,'2011-09-03',2829,NULL,16971,NULL),(28376,'GENERIC_DAY',0,2,NULL,'2011-06-20',6970,NULL,16971,NULL),(28377,'GENERIC_DAY',0,0,NULL,'2011-05-29',16060,NULL,16971,NULL),(28378,'GENERIC_DAY',0,0,NULL,'2011-04-24',20001,NULL,16971,NULL),(28379,'GENERIC_DAY',0,0,NULL,'2011-07-03',16060,NULL,16971,NULL),(28380,'GENERIC_DAY',0,3,NULL,'2011-07-19',1114,NULL,16971,NULL),(28381,'GENERIC_DAY',0,0,NULL,'2011-04-30',1114,NULL,16971,NULL),(28382,'GENERIC_DAY',0,2,NULL,'2011-04-21',16060,NULL,16971,NULL),(28383,'GENERIC_DAY',0,0,NULL,'2011-08-21',2829,NULL,16971,NULL),(28384,'GENERIC_DAY',0,2,NULL,'2011-08-16',20001,NULL,16971,NULL),(28385,'GENERIC_DAY',0,2,NULL,'2011-06-30',1114,NULL,16971,NULL),(28386,'GENERIC_DAY',0,2,NULL,'2011-06-28',6970,NULL,16971,NULL),(28387,'GENERIC_DAY',0,2,NULL,'2011-04-14',20001,NULL,16971,NULL),(28388,'GENERIC_DAY',0,0,NULL,'2011-07-11',16060,NULL,16971,NULL),(28389,'GENERIC_DAY',0,0,NULL,'2011-07-31',16062,NULL,16971,NULL),(28390,'GENERIC_DAY',0,2,NULL,'2011-06-16',16060,NULL,16971,NULL),(28391,'GENERIC_DAY',0,0,NULL,'2011-09-13',16060,NULL,16971,NULL),(28392,'GENERIC_DAY',0,2,NULL,'2011-08-25',2829,NULL,16971,NULL),(28393,'GENERIC_DAY',0,2,NULL,'2011-08-26',16062,NULL,16971,NULL),(28394,'GENERIC_DAY',0,0,NULL,'2011-07-30',16060,NULL,16971,NULL),(28395,'GENERIC_DAY',0,2,NULL,'2011-05-05',20001,NULL,16971,NULL),(28396,'GENERIC_DAY',0,0,NULL,'2011-04-23',19999,NULL,16971,NULL),(28397,'GENERIC_DAY',0,0,NULL,'2011-04-13',16060,NULL,16971,NULL),(28398,'GENERIC_DAY',0,2,NULL,'2011-07-21',1114,NULL,16971,NULL),(28399,'GENERIC_DAY',0,2,NULL,'2011-05-26',19999,NULL,16971,NULL),(28400,'GENERIC_DAY',0,2,NULL,'2011-09-27',2829,NULL,16971,NULL),(28401,'GENERIC_DAY',0,2,NULL,'2011-08-24',6970,NULL,16971,NULL),(28402,'GENERIC_DAY',0,3,NULL,'2011-04-26',1114,NULL,16971,NULL),(28403,'GENERIC_DAY',0,2,NULL,'2011-05-27',16062,NULL,16971,NULL),(28404,'GENERIC_DAY',0,0,NULL,'2011-07-30',6970,NULL,16971,NULL),(28405,'GENERIC_DAY',0,3,NULL,'2011-05-17',1114,NULL,16971,NULL),(28406,'GENERIC_DAY',0,2,NULL,'2011-06-16',2829,NULL,16971,NULL),(28407,'GENERIC_DAY',0,2,NULL,'2011-06-23',1112,NULL,16971,NULL),(28408,'GENERIC_DAY',0,2,NULL,'2011-08-24',16062,NULL,16971,NULL),(28409,'GENERIC_DAY',0,0,NULL,'2011-05-22',20001,NULL,16971,NULL),(28410,'GENERIC_DAY',0,0,NULL,'2011-05-23',16060,NULL,16971,NULL),(28411,'GENERIC_DAY',0,2,NULL,'2011-07-07',16062,NULL,16971,NULL),(28412,'GENERIC_DAY',0,2,NULL,'2011-09-22',19999,NULL,16971,NULL),(28413,'GENERIC_DAY',0,0,NULL,'2011-06-11',16062,NULL,16971,NULL),(28414,'GENERIC_DAY',0,3,NULL,'2011-08-15',1114,NULL,16971,NULL),(28415,'GENERIC_DAY',0,0,NULL,'2011-08-07',6970,NULL,16971,NULL),(28416,'GENERIC_DAY',0,2,NULL,'2011-06-23',16062,NULL,16971,NULL),(28417,'GENERIC_DAY',0,0,NULL,'2011-08-21',16062,NULL,16971,NULL),(28418,'GENERIC_DAY',0,2,NULL,'2011-06-07',6970,NULL,16971,NULL),(28419,'GENERIC_DAY',0,2,NULL,'2011-09-15',2829,NULL,16971,NULL),(28420,'GENERIC_DAY',0,0,NULL,'2011-07-02',16062,NULL,16971,NULL),(28421,'GENERIC_DAY',0,2,NULL,'2011-08-12',19999,NULL,16971,NULL),(28422,'GENERIC_DAY',0,3,NULL,'2011-04-13',6970,NULL,16971,NULL),(28423,'GENERIC_DAY',0,2,NULL,'2011-05-27',6970,NULL,16971,NULL),(28424,'GENERIC_DAY',0,2,NULL,'2011-05-11',19999,NULL,16971,NULL),(28425,'GENERIC_DAY',0,0,NULL,'2011-05-08',6970,NULL,16971,NULL),(28426,'GENERIC_DAY',0,0,NULL,'2011-08-05',16060,NULL,16971,NULL),(28427,'GENERIC_DAY',0,2,NULL,'2011-09-09',16062,NULL,16971,NULL),(28428,'GENERIC_DAY',0,3,NULL,'2011-09-06',1114,NULL,16971,NULL),(28429,'GENERIC_DAY',0,3,NULL,'2011-05-24',1114,NULL,16971,NULL),(28430,'GENERIC_DAY',0,2,NULL,'2011-07-20',16062,NULL,16971,NULL),(28431,'GENERIC_DAY',0,0,NULL,'2011-08-30',16060,NULL,16971,NULL),(28432,'GENERIC_DAY',0,0,NULL,'2011-07-17',1114,NULL,16971,NULL),(28433,'GENERIC_DAY',0,0,NULL,'2011-05-18',16060,NULL,16971,NULL),(28434,'GENERIC_DAY',0,2,NULL,'2011-09-07',6970,NULL,16971,NULL),(28435,'GENERIC_DAY',0,3,NULL,'2011-09-02',1112,NULL,16971,NULL),(28436,'GENERIC_DAY',0,2,NULL,'2011-09-08',16060,NULL,16971,NULL),(28437,'GENERIC_DAY',0,2,NULL,'2011-07-11',19999,NULL,16971,NULL),(28438,'GENERIC_DAY',0,2,NULL,'2011-06-02',6970,NULL,16971,NULL),(28439,'GENERIC_DAY',0,3,NULL,'2011-04-25',2829,NULL,16971,NULL),(28440,'GENERIC_DAY',0,0,NULL,'2011-04-17',20001,NULL,16971,NULL),(28441,'GENERIC_DAY',0,0,NULL,'2011-06-25',1112,NULL,16971,NULL),(28442,'GENERIC_DAY',0,0,NULL,'2011-09-06',16060,NULL,16971,NULL),(28443,'GENERIC_DAY',0,0,NULL,'2011-04-09',6970,NULL,16971,NULL),(28444,'GENERIC_DAY',0,0,NULL,'2011-07-16',6970,NULL,16971,NULL),(28445,'GENERIC_DAY',0,2,NULL,'2011-05-23',6970,NULL,16971,NULL),(28446,'GENERIC_DAY',0,0,NULL,'2011-08-16',16060,NULL,16971,NULL),(28447,'GENERIC_DAY',0,0,NULL,'2011-07-03',1112,NULL,16971,NULL),(28448,'GENERIC_DAY',0,2,NULL,'2011-09-16',20001,NULL,16971,NULL),(28449,'GENERIC_DAY',0,0,NULL,'2011-06-11',2829,NULL,16971,NULL),(28450,'GENERIC_DAY',0,2,NULL,'2011-09-14',6970,NULL,16971,NULL),(28451,'GENERIC_DAY',0,2,NULL,'2011-06-20',20001,NULL,16971,NULL),(28452,'GENERIC_DAY',0,0,NULL,'2011-04-10',1114,NULL,16971,NULL),(28453,'GENERIC_DAY',0,0,NULL,'2011-06-21',16060,NULL,16971,NULL),(28454,'GENERIC_DAY',0,2,NULL,'2011-06-17',6970,NULL,16971,NULL),(28455,'GENERIC_DAY',0,0,NULL,'2011-07-16',16060,NULL,16971,NULL),(28456,'GENERIC_DAY',0,0,NULL,'2011-08-27',6970,NULL,16971,NULL),(28457,'GENERIC_DAY',0,0,NULL,'2011-09-18',16060,NULL,16971,NULL),(28458,'GENERIC_DAY',0,0,NULL,'2011-05-01',20001,NULL,16971,NULL),(28459,'GENERIC_DAY',0,2,NULL,'2011-06-30',16062,NULL,16971,NULL),(28460,'GENERIC_DAY',0,2,NULL,'2011-08-19',16062,NULL,16971,NULL),(28461,'GENERIC_DAY',0,3,NULL,'2011-09-07',1114,NULL,16971,NULL),(28462,'GENERIC_DAY',0,0,NULL,'2011-05-15',16060,NULL,16971,NULL),(28463,'GENERIC_DAY',0,3,NULL,'2011-04-14',1114,NULL,16971,NULL),(28464,'GENERIC_DAY',0,2,NULL,'2011-09-23',16062,NULL,16971,NULL),(28465,'GENERIC_DAY',0,0,NULL,'2011-08-06',1112,NULL,16971,NULL),(28466,'GENERIC_DAY',0,0,NULL,'2011-09-25',19999,NULL,16971,NULL),(28467,'GENERIC_DAY',0,0,NULL,'2011-08-06',20001,NULL,16971,NULL),(28468,'GENERIC_DAY',0,2,NULL,'2011-06-27',16062,NULL,16971,NULL),(28469,'GENERIC_DAY',0,2,NULL,'2011-06-08',2829,NULL,16971,NULL),(28470,'GENERIC_DAY',0,0,NULL,'2011-09-04',1112,NULL,16971,NULL),(28471,'GENERIC_DAY',0,2,NULL,'2011-04-12',20001,NULL,16971,NULL),(28472,'GENERIC_DAY',0,3,NULL,'2011-08-01',1112,NULL,16971,NULL),(28473,'GENERIC_DAY',0,0,NULL,'2011-05-21',2829,NULL,16971,NULL),(28474,'GENERIC_DAY',0,2,NULL,'2011-06-20',2829,NULL,16971,NULL),(28475,'GENERIC_DAY',0,0,NULL,'2011-08-28',2829,NULL,16971,NULL),(28476,'GENERIC_DAY',0,0,NULL,'2011-07-16',19999,NULL,16971,NULL),(28477,'GENERIC_DAY',0,0,NULL,'2011-09-14',16060,NULL,16971,NULL),(28478,'GENERIC_DAY',0,2,NULL,'2011-08-02',6970,NULL,16971,NULL),(28479,'GENERIC_DAY',0,0,NULL,'2011-04-26',16060,NULL,16971,NULL),(28480,'GENERIC_DAY',0,0,NULL,'2011-04-16',16060,NULL,16971,NULL),(28481,'GENERIC_DAY',0,3,NULL,'2011-05-30',1114,NULL,16971,NULL),(28482,'GENERIC_DAY',0,2,NULL,'2011-07-29',6970,NULL,16971,NULL),(28483,'GENERIC_DAY',0,0,NULL,'2011-09-11',20001,NULL,16971,NULL),(28484,'GENERIC_DAY',0,3,NULL,'2011-07-19',1112,NULL,16971,NULL),(28485,'GENERIC_DAY',0,2,NULL,'2011-07-05',2829,NULL,16971,NULL),(28486,'GENERIC_DAY',0,3,NULL,'2011-08-17',1114,NULL,16971,NULL),(28487,'GENERIC_DAY',0,0,NULL,'2011-07-08',16060,NULL,16971,NULL),(28488,'GENERIC_DAY',0,0,NULL,'2011-06-05',16060,NULL,16971,NULL),(28489,'GENERIC_DAY',0,0,NULL,'2011-09-18',1112,NULL,16971,NULL),(28490,'GENERIC_DAY',0,0,NULL,'2011-09-25',1112,NULL,16971,NULL),(28491,'GENERIC_DAY',0,2,NULL,'2011-07-05',19999,NULL,16971,NULL),(28492,'GENERIC_DAY',0,0,NULL,'2011-07-01',16060,NULL,16971,NULL),(28493,'GENERIC_DAY',0,2,NULL,'2011-07-26',2829,NULL,16971,NULL),(28494,'GENERIC_DAY',0,0,NULL,'2011-05-13',16060,NULL,16971,NULL),(28495,'GENERIC_DAY',0,2,NULL,'2011-05-02',6970,NULL,16971,NULL),(28496,'GENERIC_DAY',0,2,NULL,'2011-05-13',6970,NULL,16971,NULL),(28497,'GENERIC_DAY',0,0,NULL,'2011-07-20',16060,NULL,16971,NULL),(28498,'GENERIC_DAY',0,2,NULL,'2011-05-04',16062,NULL,16971,NULL),(28499,'GENERIC_DAY',0,2,NULL,'2011-06-24',2829,NULL,16971,NULL),(28500,'GENERIC_DAY',0,2,NULL,'2011-08-11',1112,NULL,16971,NULL),(28501,'GENERIC_DAY',0,0,NULL,'2011-09-17',2829,NULL,16971,NULL),(28502,'GENERIC_DAY',0,2,NULL,'2011-04-28',19999,NULL,16971,NULL),(28503,'GENERIC_DAY',0,2,NULL,'2011-05-06',20001,NULL,16971,NULL),(28504,'GENERIC_DAY',0,2,NULL,'2011-07-19',6970,NULL,16971,NULL),(28505,'GENERIC_DAY',0,0,NULL,'2011-06-22',16060,NULL,16971,NULL),(28506,'GENERIC_DAY',0,0,NULL,'2011-08-21',1114,NULL,16971,NULL),(28507,'GENERIC_DAY',0,2,NULL,'2011-05-03',16062,NULL,16971,NULL),(28508,'GENERIC_DAY',0,0,NULL,'2011-04-10',20001,NULL,16971,NULL),(28509,'GENERIC_DAY',0,3,NULL,'2011-08-26',1114,NULL,16971,NULL),(28510,'GENERIC_DAY',0,0,NULL,'2011-04-10',1112,NULL,16971,NULL),(28511,'GENERIC_DAY',0,0,NULL,'2011-09-28',16060,NULL,16971,NULL),(28512,'GENERIC_DAY',0,2,NULL,'2011-09-07',20001,NULL,16971,NULL),(34993,'GENERIC_DAY',0,5,NULL,'2010-11-24',19999,NULL,19507,NULL),(34994,'GENERIC_DAY',0,0,NULL,'2010-11-07',16060,NULL,19507,NULL),(34995,'GENERIC_DAY',0,0,NULL,'2010-10-21',2829,NULL,19507,NULL),(34996,'GENERIC_DAY',0,4,NULL,'2010-11-08',20001,NULL,19507,NULL),(34997,'GENERIC_DAY',0,6,NULL,'2010-09-10',20001,NULL,19507,NULL),(34998,'GENERIC_DAY',0,6,NULL,'2010-09-24',1114,NULL,19507,NULL),(34999,'GENERIC_DAY',0,4,NULL,'2010-11-25',19999,NULL,19507,NULL),(35000,'GENERIC_DAY',0,5,NULL,'2010-11-03',1114,NULL,19507,NULL),(35001,'GENERIC_DAY',0,5,NULL,'2010-09-09',16060,NULL,19507,NULL),(35002,'GENERIC_DAY',0,0,NULL,'2010-10-10',1112,NULL,19507,NULL),(35003,'GENERIC_DAY',0,4,NULL,'2010-11-25',20001,NULL,19507,NULL),(35004,'GENERIC_DAY',0,6,NULL,'2010-10-04',1112,NULL,19507,NULL),(35005,'GENERIC_DAY',0,6,NULL,'2010-10-26',1112,NULL,19507,NULL),(35006,'GENERIC_DAY',0,6,NULL,'2010-09-08',1112,NULL,19507,NULL),(35007,'GENERIC_DAY',0,0,NULL,'2010-11-14',1112,NULL,19507,NULL),(35008,'GENERIC_DAY',0,0,NULL,'2010-09-01',16060,NULL,19507,NULL),(35009,'GENERIC_DAY',0,6,NULL,'2010-10-15',1114,NULL,19507,NULL),(35010,'GENERIC_DAY',0,6,NULL,'2010-09-07',1114,NULL,19507,NULL),(35011,'GENERIC_DAY',0,5,NULL,'2010-10-29',1112,NULL,19507,NULL),(35012,'GENERIC_DAY',0,0,NULL,'2010-10-02',1112,NULL,19507,NULL),(35013,'GENERIC_DAY',0,0,NULL,'2010-10-07',2829,NULL,19507,NULL),(35014,'GENERIC_DAY',0,0,NULL,'2010-10-09',16060,NULL,19507,NULL),(35015,'GENERIC_DAY',0,0,NULL,'2010-10-27',2829,NULL,19507,NULL),(35016,'GENERIC_DAY',0,0,NULL,'2010-11-29',16060,NULL,19507,NULL),(35017,'GENERIC_DAY',0,0,NULL,'2010-11-28',20001,NULL,19507,NULL),(35018,'GENERIC_DAY',0,6,NULL,'2010-10-06',19999,NULL,19507,NULL),(35019,'GENERIC_DAY',0,6,NULL,'2010-09-21',20001,NULL,19507,NULL),(35020,'GENERIC_DAY',0,0,NULL,'2010-09-19',16060,NULL,19507,NULL),(35021,'GENERIC_DAY',0,6,NULL,'2010-09-06',20001,NULL,19507,NULL),(35022,'GENERIC_DAY',0,0,NULL,'2010-10-10',20001,NULL,19507,NULL),(35023,'GENERIC_DAY',0,0,NULL,'2010-09-04',2829,NULL,19507,NULL),(35024,'GENERIC_DAY',0,0,NULL,'2010-10-23',16060,NULL,19507,NULL),(35025,'GENERIC_DAY',0,0,NULL,'2010-10-24',19999,NULL,19507,NULL),(35026,'GENERIC_DAY',0,0,NULL,'2010-10-10',2829,NULL,19507,NULL),(35027,'GENERIC_DAY',0,0,NULL,'2010-11-16',16060,NULL,19507,NULL),(35028,'GENERIC_DAY',0,0,NULL,'2010-10-14',2829,NULL,19507,NULL),(35029,'GENERIC_DAY',0,6,NULL,'2010-10-22',20001,NULL,19507,NULL),(35030,'GENERIC_DAY',0,4,NULL,'2010-11-17',20001,NULL,19507,NULL),(35031,'GENERIC_DAY',0,0,NULL,'2010-11-14',1114,NULL,19507,NULL),(35032,'GENERIC_DAY',0,5,NULL,'2010-09-09',1112,NULL,19507,NULL),(35033,'GENERIC_DAY',0,4,NULL,'2010-10-07',20001,NULL,19507,NULL),(35034,'GENERIC_DAY',0,0,NULL,'2010-11-27',20001,NULL,19507,NULL),(35035,'GENERIC_DAY',0,5,NULL,'2010-09-23',19999,NULL,19507,NULL),(35036,'GENERIC_DAY',0,0,NULL,'2010-09-04',1112,NULL,19507,NULL),(35037,'GENERIC_DAY',0,0,NULL,'2010-10-23',2829,NULL,19507,NULL),(35038,'GENERIC_DAY',0,6,NULL,'2010-09-24',20001,NULL,19507,NULL),(35039,'GENERIC_DAY',0,0,NULL,'2010-09-19',2829,NULL,19507,NULL),(35040,'GENERIC_DAY',0,0,NULL,'2010-09-04',1114,NULL,19507,NULL),(35041,'GENERIC_DAY',0,0,NULL,'2010-09-04',19999,NULL,19507,NULL),(35042,'GENERIC_DAY',0,0,NULL,'2010-09-26',20001,NULL,19507,NULL),(35043,'GENERIC_DAY',0,5,NULL,'2010-10-29',1114,NULL,19507,NULL),(35044,'GENERIC_DAY',0,0,NULL,'2010-10-24',20001,NULL,19507,NULL),(35045,'GENERIC_DAY',0,0,NULL,'2010-10-30',1112,NULL,19507,NULL),(35046,'GENERIC_DAY',0,0,NULL,'2010-09-11',1114,NULL,19507,NULL),(35047,'GENERIC_DAY',0,6,NULL,'2010-09-20',1114,NULL,19507,NULL),(35048,'GENERIC_DAY',0,5,NULL,'2010-10-07',1112,NULL,19507,NULL),(35049,'GENERIC_DAY',0,6,NULL,'2010-09-29',20001,NULL,19507,NULL),(35050,'GENERIC_DAY',0,0,NULL,'2010-11-06',1112,NULL,19507,NULL),(35051,'GENERIC_DAY',0,6,NULL,'2010-10-18',1114,NULL,19507,NULL),(35052,'GENERIC_DAY',0,0,NULL,'2010-11-06',16060,NULL,19507,NULL),(35053,'GENERIC_DAY',0,4,NULL,'2010-11-04',1112,NULL,19507,NULL),(35054,'GENERIC_DAY',0,6,NULL,'2010-08-31',20001,NULL,19507,NULL),(35055,'GENERIC_DAY',0,0,NULL,'2010-11-24',16060,NULL,19507,NULL),(35056,'GENERIC_DAY',0,0,NULL,'2010-11-27',19999,NULL,19507,NULL),(35057,'GENERIC_DAY',0,0,NULL,'2010-10-16',16060,NULL,19507,NULL),(35058,'GENERIC_DAY',0,6,NULL,'2010-10-11',19999,NULL,19507,NULL),(35059,'GENERIC_DAY',0,6,NULL,'2010-09-15',1114,NULL,19507,NULL),(35060,'GENERIC_DAY',0,5,NULL,'2010-09-16',16060,NULL,19507,NULL),(35061,'GENERIC_DAY',0,6,NULL,'2010-10-20',20001,NULL,19507,NULL),(35062,'GENERIC_DAY',0,6,NULL,'2010-09-28',1114,NULL,19507,NULL),(35063,'GENERIC_DAY',0,0,NULL,'2010-09-04',20001,NULL,19507,NULL),(35064,'GENERIC_DAY',0,5,NULL,'2010-11-02',2829,NULL,19507,NULL),(35065,'GENERIC_DAY',0,6,NULL,'2010-09-27',1112,NULL,19507,NULL),(35066,'GENERIC_DAY',0,0,NULL,'2010-09-17',16060,NULL,19507,NULL),(35067,'GENERIC_DAY',0,6,NULL,'2010-09-08',1114,NULL,19507,NULL),(35068,'GENERIC_DAY',0,0,NULL,'2010-09-29',16060,NULL,19507,NULL),(35069,'GENERIC_DAY',0,0,NULL,'2010-10-18',2829,NULL,19507,NULL),(35070,'GENERIC_DAY',0,0,NULL,'2010-11-06',2829,NULL,19507,NULL),(35071,'GENERIC_DAY',0,6,NULL,'2010-09-08',19999,NULL,19507,NULL),(35072,'GENERIC_DAY',0,0,NULL,'2010-11-26',16060,NULL,19507,NULL),(35073,'GENERIC_DAY',0,0,NULL,'2010-11-02',16060,NULL,19507,NULL),(35074,'GENERIC_DAY',0,0,NULL,'2010-10-19',2829,NULL,19507,NULL),(35075,'GENERIC_DAY',0,0,NULL,'2010-09-19',20001,NULL,19507,NULL),(35076,'GENERIC_DAY',0,0,NULL,'2010-09-25',19999,NULL,19507,NULL),(35077,'GENERIC_DAY',0,0,NULL,'2010-10-23',20001,NULL,19507,NULL),(35078,'GENERIC_DAY',0,0,NULL,'2010-10-20',16060,NULL,19507,NULL),(35079,'GENERIC_DAY',0,5,NULL,'2010-11-19',1114,NULL,19507,NULL),(35080,'GENERIC_DAY',0,4,NULL,'2010-10-29',20001,NULL,19507,NULL),(35081,'GENERIC_DAY',0,6,NULL,'2010-09-27',20001,NULL,19507,NULL),(35082,'GENERIC_DAY',0,6,NULL,'2010-09-29',1112,NULL,19507,NULL),(35083,'GENERIC_DAY',0,6,NULL,'2010-10-19',1112,NULL,19507,NULL),(35084,'GENERIC_DAY',0,0,NULL,'2010-10-29',16060,NULL,19507,NULL),(35085,'GENERIC_DAY',0,0,NULL,'2010-09-10',16060,NULL,19507,NULL),(35086,'GENERIC_DAY',0,6,NULL,'2010-09-03',1114,NULL,19507,NULL),(35087,'GENERIC_DAY',0,4,NULL,'2010-10-28',20001,NULL,19507,NULL),(35088,'GENERIC_DAY',0,2,NULL,'2010-12-01',19999,NULL,19507,NULL),(35089,'GENERIC_DAY',0,5,NULL,'2010-11-29',1112,NULL,19507,NULL),(35090,'GENERIC_DAY',0,6,NULL,'2010-10-22',1112,NULL,19507,NULL),(35091,'GENERIC_DAY',0,4,NULL,'2010-11-11',1112,NULL,19507,NULL),(35092,'GENERIC_DAY',0,6,NULL,'2010-09-14',1114,NULL,19507,NULL),(35093,'GENERIC_DAY',0,0,NULL,'2010-11-28',1114,NULL,19507,NULL),(35094,'GENERIC_DAY',0,0,NULL,'2010-10-03',19999,NULL,19507,NULL),(35095,'GENERIC_DAY',0,5,NULL,'2010-11-24',1114,NULL,19507,NULL),(35096,'GENERIC_DAY',0,6,NULL,'2010-09-15',19999,NULL,19507,NULL),(35097,'GENERIC_DAY',0,0,NULL,'2010-09-12',20001,NULL,19507,NULL),(35098,'GENERIC_DAY',0,0,NULL,'2010-09-25',20001,NULL,19507,NULL),(35099,'GENERIC_DAY',0,5,NULL,'2010-11-09',2829,NULL,19507,NULL),(35100,'GENERIC_DAY',0,5,NULL,'2010-11-29',1114,NULL,19507,NULL),(35101,'GENERIC_DAY',0,0,NULL,'2010-08-29',2829,NULL,19507,NULL),(35102,'GENERIC_DAY',0,6,NULL,'2010-10-19',1114,NULL,19507,NULL),(35103,'GENERIC_DAY',0,0,NULL,'2010-11-21',1114,NULL,19507,NULL),(35104,'GENERIC_DAY',0,0,NULL,'2010-10-22',2829,NULL,19507,NULL),(35105,'GENERIC_DAY',0,0,NULL,'2010-10-31',1114,NULL,19507,NULL),(35106,'GENERIC_DAY',0,0,NULL,'2010-09-29',2829,NULL,19507,NULL),(35107,'GENERIC_DAY',0,4,NULL,'2010-11-25',16060,NULL,19507,NULL),(35108,'GENERIC_DAY',0,0,NULL,'2010-09-08',16060,NULL,19507,NULL),(35109,'GENERIC_DAY',0,0,NULL,'2010-10-25',16060,NULL,19507,NULL),(35110,'GENERIC_DAY',0,4,NULL,'2010-10-21',20001,NULL,19507,NULL),(35111,'GENERIC_DAY',0,6,NULL,'2010-09-06',1112,NULL,19507,NULL),(35112,'GENERIC_DAY',0,0,NULL,'2010-09-05',19999,NULL,19507,NULL),(35113,'GENERIC_DAY',0,5,NULL,'2010-09-02',1112,NULL,19507,NULL),(35114,'GENERIC_DAY',0,6,NULL,'2010-09-14',1112,NULL,19507,NULL),(35115,'GENERIC_DAY',0,0,NULL,'2010-09-26',1114,NULL,19507,NULL),(35116,'GENERIC_DAY',0,6,NULL,'2010-09-14',20001,NULL,19507,NULL),(35117,'GENERIC_DAY',0,5,NULL,'2010-10-29',2829,NULL,19507,NULL),(35118,'GENERIC_DAY',0,0,NULL,'2010-10-15',2829,NULL,19507,NULL),(35119,'GENERIC_DAY',0,4,NULL,'2010-09-16',20001,NULL,19507,NULL),(35120,'GENERIC_DAY',0,6,NULL,'2010-10-27',19999,NULL,19507,NULL),(35121,'GENERIC_DAY',0,0,NULL,'2010-10-30',1114,NULL,19507,NULL),(35122,'GENERIC_DAY',0,0,NULL,'2010-10-15',16060,NULL,19507,NULL),(35123,'GENERIC_DAY',0,0,NULL,'2010-09-23',2829,NULL,19507,NULL),(35124,'GENERIC_DAY',0,6,NULL,'2010-10-12',19999,NULL,19507,NULL),(35125,'GENERIC_DAY',0,0,NULL,'2010-10-19',16060,NULL,19507,NULL),(35126,'GENERIC_DAY',0,6,NULL,'2010-10-25',19999,NULL,19507,NULL),(35127,'GENERIC_DAY',0,5,NULL,'2010-11-17',1112,NULL,19507,NULL),(35128,'GENERIC_DAY',0,4,NULL,'2010-09-23',20001,NULL,19507,NULL),(35129,'GENERIC_DAY',0,5,NULL,'2010-11-05',1112,NULL,19507,NULL),(35130,'GENERIC_DAY',0,0,NULL,'2010-09-24',2829,NULL,19507,NULL),(35131,'GENERIC_DAY',0,0,NULL,'2010-11-22',16060,NULL,19507,NULL),(35132,'GENERIC_DAY',0,0,NULL,'2010-09-21',16060,NULL,19507,NULL),(35133,'GENERIC_DAY',0,4,NULL,'2010-11-25',1112,NULL,19507,NULL),(35134,'GENERIC_DAY',0,0,NULL,'2010-11-20',2829,NULL,19507,NULL),(35135,'GENERIC_DAY',0,5,NULL,'2010-11-12',1114,NULL,19507,NULL),(35136,'GENERIC_DAY',0,0,NULL,'2010-08-31',2829,NULL,19507,NULL),(35137,'GENERIC_DAY',0,6,NULL,'2010-10-08',1114,NULL,19507,NULL),(35138,'GENERIC_DAY',0,5,NULL,'2010-11-30',2829,NULL,19507,NULL),(35139,'GENERIC_DAY',0,6,NULL,'2010-09-01',20001,NULL,19507,NULL),(35140,'GENERIC_DAY',0,5,NULL,'2010-11-30',19999,NULL,19507,NULL),(35141,'GENERIC_DAY',0,0,NULL,'2010-08-28',20001,NULL,19507,NULL),(35142,'GENERIC_DAY',0,0,NULL,'2010-10-10',16060,NULL,19507,NULL),(35143,'GENERIC_DAY',0,5,NULL,'2010-11-02',1114,NULL,19507,NULL),(35144,'GENERIC_DAY',0,0,NULL,'2010-11-23',16060,NULL,19507,NULL),(35145,'GENERIC_DAY',0,0,NULL,'2010-08-29',1112,NULL,19507,NULL),(35146,'GENERIC_DAY',0,0,NULL,'2010-10-01',16060,NULL,19507,NULL),(35147,'GENERIC_DAY',0,0,NULL,'2010-11-13',1112,NULL,19507,NULL),(35148,'GENERIC_DAY',0,5,NULL,'2010-11-17',19999,NULL,19507,NULL),(35149,'GENERIC_DAY',0,6,NULL,'2010-10-26',1114,NULL,19507,NULL),(35150,'GENERIC_DAY',0,0,NULL,'2010-11-06',1114,NULL,19507,NULL),(35151,'GENERIC_DAY',0,6,NULL,'2010-10-26',19999,NULL,19507,NULL),(35152,'GENERIC_DAY',0,6,NULL,'2010-09-29',1114,NULL,19507,NULL),(35153,'GENERIC_DAY',0,5,NULL,'2010-10-14',16060,NULL,19507,NULL),(35154,'GENERIC_DAY',0,5,NULL,'2010-11-19',2829,NULL,19507,NULL),(35155,'GENERIC_DAY',0,5,NULL,'2010-11-01',1114,NULL,19507,NULL),(35156,'GENERIC_DAY',0,0,NULL,'2010-11-09',16060,NULL,19507,NULL),(35157,'GENERIC_DAY',0,6,NULL,'2010-10-19',19999,NULL,19507,NULL),(35158,'GENERIC_DAY',0,0,NULL,'2010-09-20',16060,NULL,19507,NULL),(35159,'GENERIC_DAY',0,0,NULL,'2010-10-10',19999,NULL,19507,NULL),(35160,'GENERIC_DAY',0,0,NULL,'2010-09-11',1112,NULL,19507,NULL),(35161,'GENERIC_DAY',0,0,NULL,'2010-09-11',20001,NULL,19507,NULL),(35162,'GENERIC_DAY',0,4,NULL,'2010-11-18',19999,NULL,19507,NULL),(35163,'GENERIC_DAY',0,5,NULL,'2010-10-14',19999,NULL,19507,NULL),(35164,'GENERIC_DAY',0,0,NULL,'2010-10-08',16060,NULL,19507,NULL),(35165,'GENERIC_DAY',0,6,NULL,'2010-10-13',1112,NULL,19507,NULL),(35166,'GENERIC_DAY',0,4,NULL,'2010-11-04',20001,NULL,19507,NULL),(35167,'GENERIC_DAY',0,4,NULL,'2010-11-19',20001,NULL,19507,NULL),(35168,'GENERIC_DAY',0,5,NULL,'2010-11-10',19999,NULL,19507,NULL),(35169,'GENERIC_DAY',0,5,NULL,'2010-11-17',1114,NULL,19507,NULL),(35170,'GENERIC_DAY',0,0,NULL,'2010-10-02',2829,NULL,19507,NULL),(35171,'GENERIC_DAY',0,0,NULL,'2010-11-07',20001,NULL,19507,NULL),(35172,'GENERIC_DAY',0,4,NULL,'2010-11-11',16060,NULL,19507,NULL),(35173,'GENERIC_DAY',0,6,NULL,'2010-10-20',1112,NULL,19507,NULL),(35174,'GENERIC_DAY',0,6,NULL,'2010-10-13',19999,NULL,19507,NULL),(35175,'GENERIC_DAY',0,6,NULL,'2010-10-06',1114,NULL,19507,NULL),(35176,'GENERIC_DAY',0,6,NULL,'2010-09-28',1112,NULL,19507,NULL),(35177,'GENERIC_DAY',0,6,NULL,'2010-09-17',1114,NULL,19507,NULL),(35178,'GENERIC_DAY',0,0,NULL,'2010-09-01',2829,NULL,19507,NULL),(35179,'GENERIC_DAY',0,6,NULL,'2010-09-21',1112,NULL,19507,NULL),(35180,'GENERIC_DAY',0,0,NULL,'2010-10-30',16060,NULL,19507,NULL),(35181,'GENERIC_DAY',0,6,NULL,'2010-10-04',19999,NULL,19507,NULL),(35182,'GENERIC_DAY',0,0,NULL,'2010-08-29',1114,NULL,19507,NULL),(35183,'GENERIC_DAY',0,5,NULL,'2010-10-07',16060,NULL,19507,NULL),(35184,'GENERIC_DAY',0,6,NULL,'2010-08-30',1114,NULL,19507,NULL),(35185,'GENERIC_DAY',0,5,NULL,'2010-09-16',1114,NULL,19507,NULL),(35186,'GENERIC_DAY',0,0,NULL,'2010-09-11',19999,NULL,19507,NULL),(35187,'GENERIC_DAY',0,0,NULL,'2010-11-27',1112,NULL,19507,NULL),(35188,'GENERIC_DAY',0,6,NULL,'2010-09-06',1114,NULL,19507,NULL),(35189,'GENERIC_DAY',0,0,NULL,'2010-08-28',1112,NULL,19507,NULL),(35190,'GENERIC_DAY',0,0,NULL,'2010-08-29',16060,NULL,19507,NULL),(35191,'GENERIC_DAY',0,0,NULL,'2010-10-30',19999,NULL,19507,NULL),(35192,'GENERIC_DAY',0,0,NULL,'2010-11-06',20001,NULL,19507,NULL),(35193,'GENERIC_DAY',0,0,NULL,'2010-09-11',16060,NULL,19507,NULL),(35194,'GENERIC_DAY',0,0,NULL,'2010-09-13',16060,NULL,19507,NULL),(35195,'GENERIC_DAY',0,6,NULL,'2010-09-13',20001,NULL,19507,NULL),(35196,'GENERIC_DAY',0,5,NULL,'2010-11-01',19999,NULL,19507,NULL),(35197,'GENERIC_DAY',0,4,NULL,'2010-11-10',20001,NULL,19507,NULL),(35198,'GENERIC_DAY',0,0,NULL,'2010-10-11',16060,NULL,19507,NULL),(35199,'GENERIC_DAY',0,0,NULL,'2010-08-31',16060,NULL,19507,NULL),(35200,'GENERIC_DAY',0,0,NULL,'2010-10-04',16060,NULL,19507,NULL),(35201,'GENERIC_DAY',0,5,NULL,'2010-11-10',1114,NULL,19507,NULL),(35202,'GENERIC_DAY',0,6,NULL,'2010-09-13',1114,NULL,19507,NULL),(35203,'GENERIC_DAY',0,0,NULL,'2010-09-12',19999,NULL,19507,NULL),(35204,'GENERIC_DAY',0,0,NULL,'2010-10-03',2829,NULL,19507,NULL),(35205,'GENERIC_DAY',0,6,NULL,'2010-10-13',20001,NULL,19507,NULL),(35206,'GENERIC_DAY',0,4,NULL,'2010-11-25',1114,NULL,19507,NULL),(35207,'GENERIC_DAY',0,4,NULL,'2010-11-25',2829,NULL,19507,NULL),(35208,'GENERIC_DAY',0,0,NULL,'2010-08-30',2829,NULL,19507,NULL),(35209,'GENERIC_DAY',0,5,NULL,'2010-11-29',19999,NULL,19507,NULL),(35210,'GENERIC_DAY',0,5,NULL,'2010-10-29',19999,NULL,19507,NULL),(35211,'GENERIC_DAY',0,3,NULL,'2010-12-01',1114,NULL,19507,NULL),(35212,'GENERIC_DAY',0,5,NULL,'2010-11-05',2829,NULL,19507,NULL),(35213,'GENERIC_DAY',0,6,NULL,'2010-10-20',1114,NULL,19507,NULL),(35214,'GENERIC_DAY',0,6,NULL,'2010-10-27',20001,NULL,19507,NULL),(35215,'GENERIC_DAY',0,0,NULL,'2010-10-09',1114,NULL,19507,NULL),(35216,'GENERIC_DAY',0,5,NULL,'2010-11-01',1112,NULL,19507,NULL),(35217,'GENERIC_DAY',0,0,NULL,'2010-10-20',2829,NULL,19507,NULL),(35218,'GENERIC_DAY',0,6,NULL,'2010-08-31',19999,NULL,19507,NULL),(35219,'GENERIC_DAY',0,5,NULL,'2010-11-17',2829,NULL,19507,NULL),(35220,'GENERIC_DAY',0,5,NULL,'2010-11-16',2829,NULL,19507,NULL),(35221,'GENERIC_DAY',0,6,NULL,'2010-10-18',19999,NULL,19507,NULL),(35222,'GENERIC_DAY',0,5,NULL,'2010-11-16',1114,NULL,19507,NULL),(35223,'GENERIC_DAY',0,5,NULL,'2010-11-02',1112,NULL,19507,NULL),(35224,'GENERIC_DAY',0,0,NULL,'2010-11-19',16060,NULL,19507,NULL),(35225,'GENERIC_DAY',0,0,NULL,'2010-09-18',19999,NULL,19507,NULL),(35226,'GENERIC_DAY',0,4,NULL,'2010-11-30',20001,NULL,19507,NULL),(35227,'GENERIC_DAY',0,6,NULL,'2010-10-08',19999,NULL,19507,NULL),(35228,'GENERIC_DAY',0,4,NULL,'2010-11-04',2829,NULL,19507,NULL),(35229,'GENERIC_DAY',0,0,NULL,'2010-10-09',20001,NULL,19507,NULL),(35230,'GENERIC_DAY',0,5,NULL,'2010-11-23',2829,NULL,19507,NULL),(35231,'GENERIC_DAY',0,0,NULL,'2010-09-18',1114,NULL,19507,NULL),(35232,'GENERIC_DAY',0,5,NULL,'2010-09-16',1112,NULL,19507,NULL),(35233,'GENERIC_DAY',0,0,NULL,'2010-09-26',19999,NULL,19507,NULL),(35234,'GENERIC_DAY',0,0,NULL,'2010-09-05',2829,NULL,19507,NULL),(35235,'GENERIC_DAY',0,5,NULL,'2010-09-09',1114,NULL,19507,NULL),(35236,'GENERIC_DAY',0,5,NULL,'2010-09-30',19999,NULL,19507,NULL),(35237,'GENERIC_DAY',0,0,NULL,'2010-09-26',1112,NULL,19507,NULL),(35238,'GENERIC_DAY',0,0,NULL,'2010-11-14',20001,NULL,19507,NULL),(35239,'GENERIC_DAY',0,5,NULL,'2010-09-02',16060,NULL,19507,NULL),(35240,'GENERIC_DAY',0,0,NULL,'2010-08-30',16060,NULL,19507,NULL),(35241,'GENERIC_DAY',0,5,NULL,'2010-10-21',1112,NULL,19507,NULL),(35242,'GENERIC_DAY',0,0,NULL,'2010-11-13',1114,NULL,19507,NULL),(35243,'GENERIC_DAY',0,5,NULL,'2010-11-10',1112,NULL,19507,NULL),(35244,'GENERIC_DAY',0,0,NULL,'2010-11-21',19999,NULL,19507,NULL),(35245,'GENERIC_DAY',0,0,NULL,'2010-11-01',16060,NULL,19507,NULL),(35246,'GENERIC_DAY',0,4,NULL,'2010-11-11',19999,NULL,19507,NULL),(35247,'GENERIC_DAY',0,6,NULL,'2010-10-13',1114,NULL,19507,NULL),(35248,'GENERIC_DAY',0,4,NULL,'2010-11-23',20001,NULL,19507,NULL),(35249,'GENERIC_DAY',0,0,NULL,'2010-10-05',16060,NULL,19507,NULL),(35250,'GENERIC_DAY',0,0,NULL,'2010-09-15',2829,NULL,19507,NULL),(35251,'GENERIC_DAY',0,6,NULL,'2010-09-28',20001,NULL,19507,NULL),(35252,'GENERIC_DAY',0,0,NULL,'2010-11-21',2829,NULL,19507,NULL),(35253,'GENERIC_DAY',0,4,NULL,'2010-11-15',20001,NULL,19507,NULL),(35254,'GENERIC_DAY',0,6,NULL,'2010-08-30',1112,NULL,19507,NULL),(35255,'GENERIC_DAY',0,0,NULL,'2010-10-16',1112,NULL,19507,NULL),(35256,'GENERIC_DAY',0,6,NULL,'2010-10-22',1114,NULL,19507,NULL),(35257,'GENERIC_DAY',0,0,NULL,'2010-09-14',2829,NULL,19507,NULL),(35258,'GENERIC_DAY',0,6,NULL,'2010-09-22',1112,NULL,19507,NULL),(35259,'GENERIC_DAY',0,6,NULL,'2010-10-18',20001,NULL,19507,NULL),(35260,'GENERIC_DAY',0,4,NULL,'2010-11-09',20001,NULL,19507,NULL),(35261,'GENERIC_DAY',0,0,NULL,'2010-09-25',1112,NULL,19507,NULL),(35262,'GENERIC_DAY',0,0,NULL,'2010-11-27',2829,NULL,19507,NULL),(35263,'GENERIC_DAY',0,6,NULL,'2010-09-22',1114,NULL,19507,NULL),(35264,'GENERIC_DAY',0,6,NULL,'2010-09-28',19999,NULL,19507,NULL),(35265,'GENERIC_DAY',0,0,NULL,'2010-10-04',2829,NULL,19507,NULL),(35266,'GENERIC_DAY',0,0,NULL,'2010-10-23',1114,NULL,19507,NULL),(35267,'GENERIC_DAY',0,4,NULL,'2010-11-04',19999,NULL,19507,NULL),(35268,'GENERIC_DAY',0,0,NULL,'2010-09-25',16060,NULL,19507,NULL),(35269,'GENERIC_DAY',0,0,NULL,'2010-09-30',2829,NULL,19507,NULL),(35270,'GENERIC_DAY',0,5,NULL,'2010-10-07',1114,NULL,19507,NULL),(35271,'GENERIC_DAY',0,0,NULL,'2010-09-13',2829,NULL,19507,NULL),(35272,'GENERIC_DAY',0,6,NULL,'2010-08-31',1112,NULL,19507,NULL),(35273,'GENERIC_DAY',0,6,NULL,'2010-10-11',1114,NULL,19507,NULL),(35274,'GENERIC_DAY',0,0,NULL,'2010-12-01',16060,NULL,19507,NULL),(35275,'GENERIC_DAY',0,6,NULL,'2010-09-07',19999,NULL,19507,NULL),(35276,'GENERIC_DAY',0,5,NULL,'2010-11-12',2829,NULL,19507,NULL),(35277,'GENERIC_DAY',0,0,NULL,'2010-10-06',2829,NULL,19507,NULL),(35278,'GENERIC_DAY',0,6,NULL,'2010-10-05',19999,NULL,19507,NULL),(35279,'GENERIC_DAY',0,5,NULL,'2010-11-19',1112,NULL,19507,NULL),(35280,'GENERIC_DAY',0,0,NULL,'2010-10-31',1112,NULL,19507,NULL),(35281,'GENERIC_DAY',0,0,NULL,'2010-09-19',19999,NULL,19507,NULL),(35282,'GENERIC_DAY',0,5,NULL,'2010-11-30',1112,NULL,19507,NULL),(35283,'GENERIC_DAY',0,0,NULL,'2010-09-05',20001,NULL,19507,NULL),(35284,'GENERIC_DAY',0,6,NULL,'2010-09-27',19999,NULL,19507,NULL),(35285,'GENERIC_DAY',0,6,NULL,'2010-09-01',1112,NULL,19507,NULL),(35286,'GENERIC_DAY',0,0,NULL,'2010-11-20',1112,NULL,19507,NULL),(35287,'GENERIC_DAY',0,0,NULL,'2010-10-02',16060,NULL,19507,NULL),(35288,'GENERIC_DAY',0,0,NULL,'2010-11-20',20001,NULL,19507,NULL),(35289,'GENERIC_DAY',0,0,NULL,'2010-10-16',2829,NULL,19507,NULL),(35290,'GENERIC_DAY',0,0,NULL,'2010-10-17',1114,NULL,19507,NULL),(35291,'GENERIC_DAY',0,6,NULL,'2010-09-24',19999,NULL,19507,NULL),(35292,'GENERIC_DAY',0,0,NULL,'2010-10-03',16060,NULL,19507,NULL),(35293,'GENERIC_DAY',0,4,NULL,'2010-10-28',19999,NULL,19507,NULL),(35294,'GENERIC_DAY',0,5,NULL,'2010-11-09',1112,NULL,19507,NULL),(35295,'GENERIC_DAY',0,0,NULL,'2010-10-22',16060,NULL,19507,NULL),(35296,'GENERIC_DAY',0,5,NULL,'2010-09-30',1112,NULL,19507,NULL),(35297,'GENERIC_DAY',0,4,NULL,'2010-11-03',20001,NULL,19507,NULL),(35298,'GENERIC_DAY',0,0,NULL,'2010-09-12',16060,NULL,19507,NULL),(35299,'GENERIC_DAY',0,0,NULL,'2010-09-27',16060,NULL,19507,NULL),(35300,'GENERIC_DAY',0,0,NULL,'2010-09-28',2829,NULL,19507,NULL),(35301,'GENERIC_DAY',0,6,NULL,'2010-09-10',1114,NULL,19507,NULL),(35302,'GENERIC_DAY',0,5,NULL,'2010-09-09',19999,NULL,19507,NULL),(35303,'GENERIC_DAY',0,6,NULL,'2010-10-06',20001,NULL,19507,NULL),(35304,'GENERIC_DAY',0,0,NULL,'2010-09-05',1114,NULL,19507,NULL),(35305,'GENERIC_DAY',0,6,NULL,'2010-08-30',20001,NULL,19507,NULL),(35306,'GENERIC_DAY',0,6,NULL,'2010-10-19',20001,NULL,19507,NULL),(35307,'GENERIC_DAY',0,6,NULL,'2010-10-05',1114,NULL,19507,NULL),(35308,'GENERIC_DAY',0,5,NULL,'2010-09-23',1112,NULL,19507,NULL),(35309,'GENERIC_DAY',0,6,NULL,'2010-10-05',20001,NULL,19507,NULL),(35310,'GENERIC_DAY',0,6,NULL,'2010-09-29',19999,NULL,19507,NULL),(35311,'GENERIC_DAY',0,5,NULL,'2010-09-23',1114,NULL,19507,NULL),(35312,'GENERIC_DAY',0,4,NULL,'2010-11-18',2829,NULL,19507,NULL),(35313,'GENERIC_DAY',0,6,NULL,'2010-09-10',19999,NULL,19507,NULL),(35314,'GENERIC_DAY',0,0,NULL,'2010-10-08',2829,NULL,19507,NULL),(35315,'GENERIC_DAY',0,4,NULL,'2010-11-04',16060,NULL,19507,NULL),(35316,'GENERIC_DAY',0,6,NULL,'2010-09-03',19999,NULL,19507,NULL),(35317,'GENERIC_DAY',0,6,NULL,'2010-10-12',1112,NULL,19507,NULL),(35318,'GENERIC_DAY',0,6,NULL,'2010-09-07',20001,NULL,19507,NULL),(35319,'GENERIC_DAY',0,5,NULL,'2010-09-02',1114,NULL,19507,NULL),(35320,'GENERIC_DAY',0,5,NULL,'2010-11-08',1114,NULL,19507,NULL),(35321,'GENERIC_DAY',0,5,NULL,'2010-10-21',16060,NULL,19507,NULL),(35322,'GENERIC_DAY',0,0,NULL,'2010-10-17',2829,NULL,19507,NULL),(35323,'GENERIC_DAY',0,0,NULL,'2010-08-28',19999,NULL,19507,NULL),(35324,'GENERIC_DAY',0,0,NULL,'2010-11-28',1112,NULL,19507,NULL),(35325,'GENERIC_DAY',0,5,NULL,'2010-11-16',19999,NULL,19507,NULL),(35326,'GENERIC_DAY',0,0,NULL,'2010-09-25',2829,NULL,19507,NULL),(35327,'GENERIC_DAY',0,0,NULL,'2010-11-12',16060,NULL,19507,NULL),(35328,'GENERIC_DAY',0,5,NULL,'2010-11-05',19999,NULL,19507,NULL),(35329,'GENERIC_DAY',0,4,NULL,'2010-11-01',20001,NULL,19507,NULL),(35330,'GENERIC_DAY',0,0,NULL,'2010-11-14',16060,NULL,19507,NULL),(35331,'GENERIC_DAY',0,0,NULL,'2010-10-05',2829,NULL,19507,NULL),(35332,'GENERIC_DAY',0,5,NULL,'2010-11-19',19999,NULL,19507,NULL),(35333,'GENERIC_DAY',0,2,NULL,'2010-10-28',2829,NULL,19507,NULL),(35334,'GENERIC_DAY',0,0,NULL,'2010-09-25',1114,NULL,19507,NULL),(35335,'GENERIC_DAY',0,0,NULL,'2010-09-18',20001,NULL,19507,NULL),(35336,'GENERIC_DAY',0,4,NULL,'2010-09-09',20001,NULL,19507,NULL),(35337,'GENERIC_DAY',0,0,NULL,'2010-10-10',1114,NULL,19507,NULL),(35338,'GENERIC_DAY',0,0,NULL,'2010-10-03',20001,NULL,19507,NULL),(35339,'GENERIC_DAY',0,5,NULL,'2010-10-07',19999,NULL,19507,NULL),(35340,'GENERIC_DAY',0,6,NULL,'2010-10-11',20001,NULL,19507,NULL),(35341,'GENERIC_DAY',0,6,NULL,'2010-09-13',19999,NULL,19507,NULL),(35342,'GENERIC_DAY',0,0,NULL,'2010-11-27',16060,NULL,19507,NULL),(35343,'GENERIC_DAY',0,5,NULL,'2010-11-26',2829,NULL,19507,NULL),(35344,'GENERIC_DAY',0,0,NULL,'2010-09-27',2829,NULL,19507,NULL),(35345,'GENERIC_DAY',0,0,NULL,'2010-11-20',19999,NULL,19507,NULL),(35346,'GENERIC_DAY',0,0,NULL,'2010-09-11',2829,NULL,19507,NULL),(35347,'GENERIC_DAY',0,0,NULL,'2010-11-14',2829,NULL,19507,NULL),(35348,'GENERIC_DAY',0,0,NULL,'2010-09-12',2829,NULL,19507,NULL),(35349,'GENERIC_DAY',0,0,NULL,'2010-09-16',2829,NULL,19507,NULL),(35350,'GENERIC_DAY',0,6,NULL,'2010-09-01',19999,NULL,19507,NULL),(35351,'GENERIC_DAY',0,4,NULL,'2010-11-16',20001,NULL,19507,NULL),(35352,'GENERIC_DAY',0,0,NULL,'2010-10-01',2829,NULL,19507,NULL),(35353,'GENERIC_DAY',0,0,NULL,'2010-11-14',19999,NULL,19507,NULL),(35354,'GENERIC_DAY',0,4,NULL,'2010-11-18',1112,NULL,19507,NULL),(35355,'GENERIC_DAY',0,6,NULL,'2010-09-01',1114,NULL,19507,NULL),(35356,'GENERIC_DAY',0,0,NULL,'2010-11-30',16060,NULL,19507,NULL),(35357,'GENERIC_DAY',0,0,NULL,'2010-09-22',2829,NULL,19507,NULL),(35358,'GENERIC_DAY',0,5,NULL,'2010-11-26',1112,NULL,19507,NULL),(35359,'GENERIC_DAY',0,6,NULL,'2010-09-15',20001,NULL,19507,NULL),(35360,'GENERIC_DAY',0,5,NULL,'2010-11-12',1112,NULL,19507,NULL),(35361,'GENERIC_DAY',0,0,NULL,'2010-09-20',2829,NULL,19507,NULL),(35362,'GENERIC_DAY',0,2,NULL,'2010-12-01',20001,NULL,19507,NULL),(35363,'GENERIC_DAY',0,0,NULL,'2010-11-10',16060,NULL,19507,NULL),(35364,'GENERIC_DAY',0,5,NULL,'2010-11-08',2829,NULL,19507,NULL),(35365,'GENERIC_DAY',0,5,NULL,'2010-09-16',19999,NULL,19507,NULL),(35366,'GENERIC_DAY',0,0,NULL,'2010-10-31',2829,NULL,19507,NULL),(35367,'GENERIC_DAY',0,0,NULL,'2010-11-05',16060,NULL,19507,NULL),(35368,'GENERIC_DAY',0,4,NULL,'2010-11-11',2829,NULL,19507,NULL),(35369,'GENERIC_DAY',0,0,NULL,'2010-09-26',2829,NULL,19507,NULL),(35370,'GENERIC_DAY',0,0,NULL,'2010-11-21',20001,NULL,19507,NULL),(35371,'GENERIC_DAY',0,0,NULL,'2010-10-13',16060,NULL,19507,NULL),(35372,'GENERIC_DAY',0,5,NULL,'2010-11-23',19999,NULL,19507,NULL),(35373,'GENERIC_DAY',0,0,NULL,'2010-10-17',16060,NULL,19507,NULL),(35374,'GENERIC_DAY',0,0,NULL,'2010-09-19',1112,NULL,19507,NULL),(35375,'GENERIC_DAY',0,4,NULL,'2010-11-24',20001,NULL,19507,NULL),(35376,'GENERIC_DAY',0,0,NULL,'2010-10-13',2829,NULL,19507,NULL),(35377,'GENERIC_DAY',0,0,NULL,'2010-11-07',1114,NULL,19507,NULL),(35378,'GENERIC_DAY',0,0,NULL,'2010-11-07',1112,NULL,19507,NULL),(35379,'GENERIC_DAY',0,5,NULL,'2010-11-08',1112,NULL,19507,NULL),(35380,'GENERIC_DAY',0,0,NULL,'2010-09-04',16060,NULL,19507,NULL),(35381,'GENERIC_DAY',0,6,NULL,'2010-10-25',20001,NULL,19507,NULL),(35382,'GENERIC_DAY',0,0,NULL,'2010-10-09',1112,NULL,19507,NULL),(35383,'GENERIC_DAY',0,0,NULL,'2010-09-10',2829,NULL,19507,NULL),(35384,'GENERIC_DAY',0,0,NULL,'2010-10-16',1114,NULL,19507,NULL),(35385,'GENERIC_DAY',0,0,NULL,'2010-10-24',2829,NULL,19507,NULL),(35386,'GENERIC_DAY',0,0,NULL,'2010-10-16',20001,NULL,19507,NULL),(35387,'GENERIC_DAY',0,5,NULL,'2010-11-24',2829,NULL,19507,NULL),(35388,'GENERIC_DAY',0,0,NULL,'2010-09-19',1114,NULL,19507,NULL),(35389,'GENERIC_DAY',0,6,NULL,'2010-10-15',20001,NULL,19507,NULL),(35390,'GENERIC_DAY',0,6,NULL,'2010-10-22',19999,NULL,19507,NULL),(35391,'GENERIC_DAY',0,0,NULL,'2010-09-07',2829,NULL,19507,NULL),(35392,'GENERIC_DAY',0,0,NULL,'2010-11-20',16060,NULL,19507,NULL),(35393,'GENERIC_DAY',0,6,NULL,'2010-09-22',20001,NULL,19507,NULL),(35394,'GENERIC_DAY',0,6,NULL,'2010-10-12',20001,NULL,19507,NULL),(35395,'GENERIC_DAY',0,6,NULL,'2010-09-22',19999,NULL,19507,NULL),(35396,'GENERIC_DAY',0,0,NULL,'2010-08-29',20001,NULL,19507,NULL),(35397,'GENERIC_DAY',0,6,NULL,'2010-10-27',1114,NULL,19507,NULL),(35398,'GENERIC_DAY',0,5,NULL,'2010-11-22',1114,NULL,19507,NULL),(35399,'GENERIC_DAY',0,0,NULL,'2010-09-18',1112,NULL,19507,NULL),(35400,'GENERIC_DAY',0,0,NULL,'2010-09-12',1112,NULL,19507,NULL),(35401,'GENERIC_DAY',0,5,NULL,'2010-11-01',2829,NULL,19507,NULL),(35402,'GENERIC_DAY',0,4,NULL,'2010-11-11',20001,NULL,19507,NULL),(35403,'GENERIC_DAY',0,6,NULL,'2010-10-01',1114,NULL,19507,NULL),(35404,'GENERIC_DAY',0,6,NULL,'2010-10-01',19999,NULL,19507,NULL),(35405,'GENERIC_DAY',0,0,NULL,'2010-10-24',1114,NULL,19507,NULL),(35406,'GENERIC_DAY',0,0,NULL,'2010-09-07',16060,NULL,19507,NULL),(35407,'GENERIC_DAY',0,6,NULL,'2010-09-24',1112,NULL,19507,NULL),(35408,'GENERIC_DAY',0,0,NULL,'2010-09-02',2829,NULL,19507,NULL),(35409,'GENERIC_DAY',0,4,NULL,'2010-09-02',20001,NULL,19507,NULL),(35410,'GENERIC_DAY',0,4,NULL,'2010-11-02',20001,NULL,19507,NULL),(35411,'GENERIC_DAY',0,5,NULL,'2010-10-21',1114,NULL,19507,NULL),(35412,'GENERIC_DAY',0,0,NULL,'2010-10-03',1112,NULL,19507,NULL),(35413,'GENERIC_DAY',0,0,NULL,'2010-09-14',16060,NULL,19507,NULL),(35414,'GENERIC_DAY',0,5,NULL,'2010-11-15',1114,NULL,19507,NULL),(35415,'GENERIC_DAY',0,5,NULL,'2010-09-23',16060,NULL,19507,NULL),(35416,'GENERIC_DAY',0,5,NULL,'2010-11-03',2829,NULL,19507,NULL),(35417,'GENERIC_DAY',0,5,NULL,'2010-11-23',1114,NULL,19507,NULL),(35418,'GENERIC_DAY',0,0,NULL,'2010-09-05',1112,NULL,19507,NULL),(35419,'GENERIC_DAY',0,0,NULL,'2010-09-03',2829,NULL,19507,NULL),(35420,'GENERIC_DAY',0,4,NULL,'2010-10-14',20001,NULL,19507,NULL),(35421,'GENERIC_DAY',0,5,NULL,'2010-09-30',16060,NULL,19507,NULL),(35422,'GENERIC_DAY',0,4,NULL,'2010-11-18',20001,NULL,19507,NULL),(35423,'GENERIC_DAY',0,4,NULL,'2010-11-05',20001,NULL,19507,NULL),(35424,'GENERIC_DAY',0,5,NULL,'2010-10-14',1114,NULL,19507,NULL),(35425,'GENERIC_DAY',0,6,NULL,'2010-09-14',19999,NULL,19507,NULL),(35426,'GENERIC_DAY',0,4,NULL,'2010-11-12',20001,NULL,19507,NULL),(35427,'GENERIC_DAY',0,6,NULL,'2010-08-30',19999,NULL,19507,NULL),(35428,'GENERIC_DAY',0,6,NULL,'2010-09-20',19999,NULL,19507,NULL),(35429,'GENERIC_DAY',0,6,NULL,'2010-08-31',1114,NULL,19507,NULL),(35430,'GENERIC_DAY',0,4,NULL,'2010-11-29',20001,NULL,19507,NULL),(35431,'GENERIC_DAY',0,0,NULL,'2010-09-06',16060,NULL,19507,NULL),(35432,'GENERIC_DAY',0,6,NULL,'2010-10-08',20001,NULL,19507,NULL),(35433,'GENERIC_DAY',0,6,NULL,'2010-10-15',1112,NULL,19507,NULL),(35434,'GENERIC_DAY',0,3,NULL,'2010-12-01',1112,NULL,19507,NULL),(35435,'GENERIC_DAY',0,6,NULL,'2010-09-20',1112,NULL,19507,NULL),(35436,'GENERIC_DAY',0,0,NULL,'2010-10-02',20001,NULL,19507,NULL),(35437,'GENERIC_DAY',0,0,NULL,'2010-09-26',16060,NULL,19507,NULL),(35438,'GENERIC_DAY',0,4,NULL,'2010-11-22',20001,NULL,19507,NULL),(35439,'GENERIC_DAY',0,6,NULL,'2010-09-21',19999,NULL,19507,NULL),(35440,'GENERIC_DAY',0,0,NULL,'2010-10-26',16060,NULL,19507,NULL),(35441,'GENERIC_DAY',0,5,NULL,'2010-11-15',19999,NULL,19507,NULL),(35442,'GENERIC_DAY',0,0,NULL,'2010-10-06',16060,NULL,19507,NULL),(35443,'GENERIC_DAY',0,6,NULL,'2010-10-05',1112,NULL,19507,NULL),(35444,'GENERIC_DAY',0,5,NULL,'2010-11-09',19999,NULL,19507,NULL),(35445,'GENERIC_DAY',0,5,NULL,'2010-11-30',1114,NULL,19507,NULL),(35446,'GENERIC_DAY',0,5,NULL,'2010-11-15',2829,NULL,19507,NULL),(35447,'GENERIC_DAY',0,0,NULL,'2010-10-30',2829,NULL,19507,NULL),(35448,'GENERIC_DAY',0,0,NULL,'2010-10-31',16060,NULL,19507,NULL),(35449,'GENERIC_DAY',0,5,NULL,'2010-11-22',19999,NULL,19507,NULL),(35450,'GENERIC_DAY',0,6,NULL,'2010-10-01',20001,NULL,19507,NULL),(35451,'GENERIC_DAY',0,0,NULL,'2010-11-15',16060,NULL,19507,NULL),(35452,'GENERIC_DAY',0,0,NULL,'2010-10-03',1114,NULL,19507,NULL),(35453,'GENERIC_DAY',0,0,NULL,'2010-09-05',16060,NULL,19507,NULL),(35454,'GENERIC_DAY',0,5,NULL,'2010-11-12',19999,NULL,19507,NULL),(35455,'GENERIC_DAY',0,0,NULL,'2010-11-20',1114,NULL,19507,NULL),(35456,'GENERIC_DAY',0,0,NULL,'2010-10-24',1112,NULL,19507,NULL),(35457,'GENERIC_DAY',0,0,NULL,'2010-11-03',16060,NULL,19507,NULL),(35458,'GENERIC_DAY',0,0,NULL,'2010-11-08',16060,NULL,19507,NULL),(35459,'GENERIC_DAY',0,5,NULL,'2010-11-02',19999,NULL,19507,NULL),(35460,'GENERIC_DAY',0,5,NULL,'2010-11-05',1114,NULL,19507,NULL),(35461,'GENERIC_DAY',0,5,NULL,'2010-11-03',1112,NULL,19507,NULL),(35462,'GENERIC_DAY',0,6,NULL,'2010-10-15',19999,NULL,19507,NULL),(35463,'GENERIC_DAY',0,6,NULL,'2010-09-17',19999,NULL,19507,NULL),(35464,'GENERIC_DAY',0,6,NULL,'2010-10-04',1114,NULL,19507,NULL),(35465,'GENERIC_DAY',0,0,NULL,'2010-09-12',1114,NULL,19507,NULL),(35466,'GENERIC_DAY',0,0,NULL,'2010-09-15',16060,NULL,19507,NULL),(35467,'GENERIC_DAY',0,5,NULL,'2010-10-28',1114,NULL,19507,NULL),(35468,'GENERIC_DAY',0,0,NULL,'2010-10-23',19999,NULL,19507,NULL),(35469,'GENERIC_DAY',0,0,NULL,'2010-10-16',19999,NULL,19507,NULL),(35470,'GENERIC_DAY',0,0,NULL,'2010-10-02',19999,NULL,19507,NULL),(35471,'GENERIC_DAY',0,6,NULL,'2010-10-25',1112,NULL,19507,NULL),(35472,'GENERIC_DAY',0,6,NULL,'2010-09-13',1112,NULL,19507,NULL),(35473,'GENERIC_DAY',0,6,NULL,'2010-10-20',19999,NULL,19507,NULL),(35474,'GENERIC_DAY',0,0,NULL,'2010-11-27',1114,NULL,19507,NULL),(35475,'GENERIC_DAY',0,0,NULL,'2010-10-31',19999,NULL,19507,NULL),(35476,'GENERIC_DAY',0,0,NULL,'2010-08-29',19999,NULL,19507,NULL),(35477,'GENERIC_DAY',0,6,NULL,'2010-10-06',1112,NULL,19507,NULL),(35478,'GENERIC_DAY',0,6,NULL,'2010-10-04',20001,NULL,19507,NULL),(35479,'GENERIC_DAY',0,6,NULL,'2010-10-11',1112,NULL,19507,NULL),(35480,'GENERIC_DAY',0,0,NULL,'2010-10-26',2829,NULL,19507,NULL),(35481,'GENERIC_DAY',0,6,NULL,'2010-10-27',1112,NULL,19507,NULL),(35482,'GENERIC_DAY',0,0,NULL,'2010-10-09',19999,NULL,19507,NULL),(35483,'GENERIC_DAY',0,0,NULL,'2010-10-24',16060,NULL,19507,NULL),(35484,'GENERIC_DAY',0,4,NULL,'2010-11-18',1114,NULL,19507,NULL),(35485,'GENERIC_DAY',0,5,NULL,'2010-10-28',1112,NULL,19507,NULL),(35486,'GENERIC_DAY',0,5,NULL,'2010-11-08',19999,NULL,19507,NULL),(35487,'GENERIC_DAY',0,0,NULL,'2010-10-02',1114,NULL,19507,NULL),(35488,'GENERIC_DAY',0,0,NULL,'2010-08-28',1114,NULL,19507,NULL),(35489,'GENERIC_DAY',0,6,NULL,'2010-09-06',19999,NULL,19507,NULL),(35490,'GENERIC_DAY',0,5,NULL,'2010-11-26',1114,NULL,19507,NULL),(35491,'GENERIC_DAY',0,6,NULL,'2010-09-20',20001,NULL,19507,NULL),(35492,'GENERIC_DAY',0,0,NULL,'2010-11-06',19999,NULL,19507,NULL),(35493,'GENERIC_DAY',0,0,NULL,'2010-09-06',2829,NULL,19507,NULL),(35494,'GENERIC_DAY',0,0,NULL,'2010-10-12',16060,NULL,19507,NULL),(35495,'GENERIC_DAY',0,0,NULL,'2010-09-03',16060,NULL,19507,NULL),(35496,'GENERIC_DAY',0,0,NULL,'2010-10-30',20001,NULL,19507,NULL),(35497,'GENERIC_DAY',0,0,NULL,'2010-09-28',16060,NULL,19507,NULL),(35498,'GENERIC_DAY',0,6,NULL,'2010-09-03',1112,NULL,19507,NULL),(35499,'GENERIC_DAY',0,5,NULL,'2010-11-26',19999,NULL,19507,NULL),(35500,'GENERIC_DAY',0,0,NULL,'2010-09-22',16060,NULL,19507,NULL),(35501,'GENERIC_DAY',0,5,NULL,'2010-10-14',1112,NULL,19507,NULL),(35502,'GENERIC_DAY',0,6,NULL,'2010-09-03',20001,NULL,19507,NULL),(35503,'GENERIC_DAY',0,0,NULL,'2010-10-17',20001,NULL,19507,NULL),(35504,'GENERIC_DAY',0,6,NULL,'2010-09-21',1114,NULL,19507,NULL),(35505,'GENERIC_DAY',0,0,NULL,'2010-09-18',16060,NULL,19507,NULL),(35506,'GENERIC_DAY',0,6,NULL,'2010-10-08',1112,NULL,19507,NULL),(35507,'GENERIC_DAY',0,0,NULL,'2010-11-07',19999,NULL,19507,NULL),(35508,'GENERIC_DAY',0,0,NULL,'2010-10-23',1112,NULL,19507,NULL),(35509,'GENERIC_DAY',0,5,NULL,'2010-11-15',1112,NULL,19507,NULL),(35510,'GENERIC_DAY',0,0,NULL,'2010-09-08',2829,NULL,19507,NULL),(35511,'GENERIC_DAY',0,5,NULL,'2010-09-02',19999,NULL,19507,NULL),(35512,'GENERIC_DAY',0,0,NULL,'2010-10-31',20001,NULL,19507,NULL),(35513,'GENERIC_DAY',0,6,NULL,'2010-09-27',1114,NULL,19507,NULL),(35514,'GENERIC_DAY',0,4,NULL,'2010-11-26',20001,NULL,19507,NULL),(35515,'GENERIC_DAY',0,0,NULL,'2010-09-17',2829,NULL,19507,NULL),(35516,'GENERIC_DAY',0,0,NULL,'2010-10-09',2829,NULL,19507,NULL),(35517,'GENERIC_DAY',0,2,NULL,'2010-12-01',2829,NULL,19507,NULL),(35518,'GENERIC_DAY',0,0,NULL,'2010-10-11',2829,NULL,19507,NULL),(35519,'GENERIC_DAY',0,4,NULL,'2010-11-11',1114,NULL,19507,NULL),(35520,'GENERIC_DAY',0,0,NULL,'2010-11-13',20001,NULL,19507,NULL),(35521,'GENERIC_DAY',0,5,NULL,'2010-10-21',19999,NULL,19507,NULL),(35522,'GENERIC_DAY',0,5,NULL,'2010-11-22',2829,NULL,19507,NULL),(35523,'GENERIC_DAY',0,5,NULL,'2010-11-03',19999,NULL,19507,NULL),(35524,'GENERIC_DAY',0,0,NULL,'2010-10-17',1112,NULL,19507,NULL),(35525,'GENERIC_DAY',0,0,NULL,'2010-10-27',16060,NULL,19507,NULL),(35526,'GENERIC_DAY',0,5,NULL,'2010-11-24',1112,NULL,19507,NULL),(35527,'GENERIC_DAY',0,0,NULL,'2010-11-17',16060,NULL,19507,NULL),(35528,'GENERIC_DAY',0,4,NULL,'2010-11-04',1114,NULL,19507,NULL),(35529,'GENERIC_DAY',0,4,NULL,'2010-10-28',16060,NULL,19507,NULL),(35530,'GENERIC_DAY',0,5,NULL,'2010-11-16',1112,NULL,19507,NULL),(35531,'GENERIC_DAY',0,0,NULL,'2010-09-21',2829,NULL,19507,NULL),(35532,'GENERIC_DAY',0,0,NULL,'2010-09-18',2829,NULL,19507,NULL),(35533,'GENERIC_DAY',0,6,NULL,'2010-09-15',1112,NULL,19507,NULL),(35534,'GENERIC_DAY',0,5,NULL,'2010-11-09',1114,NULL,19507,NULL),(35535,'GENERIC_DAY',0,0,NULL,'2010-10-12',2829,NULL,19507,NULL),(35536,'GENERIC_DAY',0,0,NULL,'2010-11-13',19999,NULL,19507,NULL),(35537,'GENERIC_DAY',0,5,NULL,'2010-09-30',1114,NULL,19507,NULL),(35538,'GENERIC_DAY',0,0,NULL,'2010-10-18',16060,NULL,19507,NULL),(35539,'GENERIC_DAY',0,0,NULL,'2010-11-21',1112,NULL,19507,NULL),(35540,'GENERIC_DAY',0,5,NULL,'2010-11-22',1112,NULL,19507,NULL),(35541,'GENERIC_DAY',0,0,NULL,'2010-10-25',2829,NULL,19507,NULL),(35542,'GENERIC_DAY',0,6,NULL,'2010-09-17',1112,NULL,19507,NULL),(35543,'GENERIC_DAY',0,0,NULL,'2010-09-09',2829,NULL,19507,NULL),(35544,'GENERIC_DAY',0,0,NULL,'2010-09-24',16060,NULL,19507,NULL),(35545,'GENERIC_DAY',0,6,NULL,'2010-09-17',20001,NULL,19507,NULL),(35546,'GENERIC_DAY',0,6,NULL,'2010-10-25',1114,NULL,19507,NULL),(35547,'GENERIC_DAY',0,6,NULL,'2010-09-08',20001,NULL,19507,NULL),(35548,'GENERIC_DAY',0,5,NULL,'2010-11-10',2829,NULL,19507,NULL),(35549,'GENERIC_DAY',0,5,NULL,'2010-11-29',2829,NULL,19507,NULL),(35550,'GENERIC_DAY',0,6,NULL,'2010-10-12',1114,NULL,19507,NULL),(35551,'GENERIC_DAY',0,0,NULL,'2010-11-13',2829,NULL,19507,NULL),(35552,'GENERIC_DAY',0,0,NULL,'2010-11-28',2829,NULL,19507,NULL),(35553,'GENERIC_DAY',0,0,NULL,'2010-11-07',2829,NULL,19507,NULL),(35554,'GENERIC_DAY',0,6,NULL,'2010-10-26',20001,NULL,19507,NULL),(35555,'GENERIC_DAY',0,0,NULL,'2010-11-28',19999,NULL,19507,NULL),(35556,'GENERIC_DAY',0,0,NULL,'2010-08-28',2829,NULL,19507,NULL),(35557,'GENERIC_DAY',0,4,NULL,'2010-09-30',20001,NULL,19507,NULL),(35558,'GENERIC_DAY',0,6,NULL,'2010-10-18',1112,NULL,19507,NULL),(35559,'GENERIC_DAY',0,6,NULL,'2010-09-07',1112,NULL,19507,NULL),(35560,'GENERIC_DAY',0,4,NULL,'2010-11-18',16060,NULL,19507,NULL),(35561,'GENERIC_DAY',0,6,NULL,'2010-09-10',1112,NULL,19507,NULL),(35562,'GENERIC_DAY',0,5,NULL,'2010-11-23',1112,NULL,19507,NULL),(35563,'GENERIC_DAY',0,0,NULL,'2010-11-28',16060,NULL,19507,NULL),(35564,'GENERIC_DAY',0,0,NULL,'2010-08-28',16060,NULL,19507,NULL),(35565,'GENERIC_DAY',0,0,NULL,'2010-10-17',19999,NULL,19507,NULL),(35566,'GENERIC_DAY',0,6,NULL,'2010-10-01',1112,NULL,19507,NULL),(35567,'GENERIC_DAY',0,0,NULL,'2010-11-21',16060,NULL,19507,NULL),(35568,'GENERIC_DAY',0,0,NULL,'2010-11-13',16060,NULL,19507,NULL),(35569,'SPECIFIC_DAY',0,0,NULL,'2010-11-07',2829,7387,NULL,NULL),(35570,'SPECIFIC_DAY',0,6,NULL,'2010-10-13',2829,7387,NULL,NULL),(35571,'SPECIFIC_DAY',0,6,NULL,'2010-10-15',2829,7387,NULL,NULL),(35572,'SPECIFIC_DAY',0,0,NULL,'2010-09-11',2829,7387,NULL,NULL),(35573,'SPECIFIC_DAY',0,0,NULL,'2010-10-16',2829,7387,NULL,NULL),(35574,'SPECIFIC_DAY',0,6,NULL,'2010-09-09',2829,7387,NULL,NULL),(35575,'SPECIFIC_DAY',0,6,NULL,'2010-09-10',2829,7387,NULL,NULL),(35576,'SPECIFIC_DAY',0,6,NULL,'2010-11-16',2829,7387,NULL,NULL),(35577,'SPECIFIC_DAY',0,6,NULL,'2010-09-14',2829,7387,NULL,NULL),(35578,'SPECIFIC_DAY',0,6,NULL,'2010-09-13',2829,7387,NULL,NULL),(35579,'SPECIFIC_DAY',0,6,NULL,'2010-10-18',2829,7387,NULL,NULL),(35580,'SPECIFIC_DAY',0,6,NULL,'2010-09-23',2829,7387,NULL,NULL),(35581,'SPECIFIC_DAY',0,0,NULL,'2010-09-19',2829,7387,NULL,NULL),(35582,'SPECIFIC_DAY',0,0,NULL,'2010-10-23',2829,7387,NULL,NULL),(35583,'SPECIFIC_DAY',0,6,NULL,'2010-09-06',2829,7387,NULL,NULL),(35584,'SPECIFIC_DAY',0,6,NULL,'2010-10-08',2829,7387,NULL,NULL),(35585,'SPECIFIC_DAY',0,6,NULL,'2010-10-27',2829,7387,NULL,NULL),(35586,'SPECIFIC_DAY',0,6,NULL,'2010-10-01',2829,7387,NULL,NULL),(35587,'SPECIFIC_DAY',0,0,NULL,'2010-10-31',2829,7387,NULL,NULL),(35588,'SPECIFIC_DAY',0,6,NULL,'2010-09-30',2829,7387,NULL,NULL),(35589,'SPECIFIC_DAY',0,2,NULL,'2010-11-25',2829,7387,NULL,NULL),(35590,'SPECIFIC_DAY',0,0,NULL,'2010-09-05',2829,7387,NULL,NULL),(35591,'SPECIFIC_DAY',0,6,NULL,'2010-10-11',2829,7387,NULL,NULL),(35592,'SPECIFIC_DAY',0,6,NULL,'2010-10-25',2829,7387,NULL,NULL),(35593,'SPECIFIC_DAY',0,0,NULL,'2010-11-13',2829,7387,NULL,NULL),(35594,'SPECIFIC_DAY',0,0,NULL,'2010-10-17',2829,7387,NULL,NULL),(35595,'SPECIFIC_DAY',0,0,NULL,'2010-11-21',2829,7387,NULL,NULL),(35596,'SPECIFIC_DAY',0,6,NULL,'2010-11-19',2829,7387,NULL,NULL),(35597,'SPECIFIC_DAY',0,0,NULL,'2010-08-28',2829,7387,NULL,NULL),(35598,'SPECIFIC_DAY',0,6,NULL,'2010-10-04',2829,7387,NULL,NULL),(35599,'SPECIFIC_DAY',0,6,NULL,'2010-09-01',2829,7387,NULL,NULL),(35600,'SPECIFIC_DAY',0,6,NULL,'2010-10-26',2829,7387,NULL,NULL),(35601,'SPECIFIC_DAY',0,6,NULL,'2010-10-07',2829,7387,NULL,NULL),(35602,'SPECIFIC_DAY',0,6,NULL,'2010-10-12',2829,7387,NULL,NULL),(35603,'SPECIFIC_DAY',0,6,NULL,'2010-10-19',2829,7387,NULL,NULL),(35604,'SPECIFIC_DAY',0,6,NULL,'2010-10-14',2829,7387,NULL,NULL),(35605,'SPECIFIC_DAY',0,0,NULL,'2010-10-24',2829,7387,NULL,NULL),(35606,'SPECIFIC_DAY',0,6,NULL,'2010-11-18',2829,7387,NULL,NULL),(35607,'SPECIFIC_DAY',0,0,NULL,'2010-10-09',2829,7387,NULL,NULL),(35608,'SPECIFIC_DAY',0,6,NULL,'2010-08-31',2829,7387,NULL,NULL),(35609,'SPECIFIC_DAY',0,0,NULL,'2010-11-20',2829,7387,NULL,NULL),(35610,'SPECIFIC_DAY',0,6,NULL,'2010-09-27',2829,7387,NULL,NULL),(35611,'SPECIFIC_DAY',0,6,NULL,'2010-09-17',2829,7387,NULL,NULL),(35612,'SPECIFIC_DAY',0,6,NULL,'2010-11-24',2829,7387,NULL,NULL),(35613,'SPECIFIC_DAY',0,6,NULL,'2010-11-12',2829,7387,NULL,NULL),(35614,'SPECIFIC_DAY',0,0,NULL,'2010-08-29',2829,7387,NULL,NULL),(35615,'SPECIFIC_DAY',0,6,NULL,'2010-11-11',2829,7387,NULL,NULL),(35616,'SPECIFIC_DAY',0,6,NULL,'2010-11-09',2829,7387,NULL,NULL),(35617,'SPECIFIC_DAY',0,0,NULL,'2010-09-25',2829,7387,NULL,NULL),(35618,'SPECIFIC_DAY',0,6,NULL,'2010-10-05',2829,7387,NULL,NULL),(35619,'SPECIFIC_DAY',0,0,NULL,'2010-10-10',2829,7387,NULL,NULL),(35620,'SPECIFIC_DAY',0,6,NULL,'2010-10-21',2829,7387,NULL,NULL),(35621,'SPECIFIC_DAY',0,6,NULL,'2010-11-05',2829,7387,NULL,NULL),(35622,'SPECIFIC_DAY',0,6,NULL,'2010-11-17',2829,7387,NULL,NULL),(35623,'SPECIFIC_DAY',0,0,NULL,'2010-09-26',2829,7387,NULL,NULL),(35624,'SPECIFIC_DAY',0,6,NULL,'2010-09-29',2829,7387,NULL,NULL),(35625,'SPECIFIC_DAY',0,0,NULL,'2010-10-03',2829,7387,NULL,NULL),(35626,'SPECIFIC_DAY',0,6,NULL,'2010-10-28',2829,7387,NULL,NULL),(35627,'SPECIFIC_DAY',0,6,NULL,'2010-09-28',2829,7387,NULL,NULL),(35628,'SPECIFIC_DAY',0,6,NULL,'2010-11-04',2829,7387,NULL,NULL),(35629,'SPECIFIC_DAY',0,0,NULL,'2010-11-14',2829,7387,NULL,NULL),(35630,'SPECIFIC_DAY',0,6,NULL,'2010-09-20',2829,7387,NULL,NULL),(35631,'SPECIFIC_DAY',0,6,NULL,'2010-09-03',2829,7387,NULL,NULL),(35632,'SPECIFIC_DAY',0,6,NULL,'2010-11-15',2829,7387,NULL,NULL),(35633,'SPECIFIC_DAY',0,6,NULL,'2010-11-03',2829,7387,NULL,NULL),(35634,'SPECIFIC_DAY',0,6,NULL,'2010-10-22',2829,7387,NULL,NULL),(35635,'SPECIFIC_DAY',0,6,NULL,'2010-09-15',2829,7387,NULL,NULL),(35636,'SPECIFIC_DAY',0,6,NULL,'2010-10-20',2829,7387,NULL,NULL),(35637,'SPECIFIC_DAY',0,0,NULL,'2010-10-02',2829,7387,NULL,NULL),(35638,'SPECIFIC_DAY',0,6,NULL,'2010-11-10',2829,7387,NULL,NULL),(35639,'SPECIFIC_DAY',0,6,NULL,'2010-08-30',2829,7387,NULL,NULL),(35640,'SPECIFIC_DAY',0,6,NULL,'2010-11-08',2829,7387,NULL,NULL),(35641,'SPECIFIC_DAY',0,0,NULL,'2010-09-04',2829,7387,NULL,NULL),(35642,'SPECIFIC_DAY',0,6,NULL,'2010-09-02',2829,7387,NULL,NULL),(35643,'SPECIFIC_DAY',0,6,NULL,'2010-09-21',2829,7387,NULL,NULL),(35644,'SPECIFIC_DAY',0,6,NULL,'2010-10-29',2829,7387,NULL,NULL),(35645,'SPECIFIC_DAY',0,6,NULL,'2010-09-07',2829,7387,NULL,NULL),(35646,'SPECIFIC_DAY',0,6,NULL,'2010-11-22',2829,7387,NULL,NULL),(35647,'SPECIFIC_DAY',0,0,NULL,'2010-10-30',2829,7387,NULL,NULL),(35648,'SPECIFIC_DAY',0,6,NULL,'2010-11-02',2829,7387,NULL,NULL),(35649,'SPECIFIC_DAY',0,6,NULL,'2010-09-22',2829,7387,NULL,NULL),(35650,'SPECIFIC_DAY',0,6,NULL,'2010-09-08',2829,7387,NULL,NULL),(35651,'SPECIFIC_DAY',0,0,NULL,'2010-11-06',2829,7387,NULL,NULL),(35652,'SPECIFIC_DAY',0,6,NULL,'2010-10-06',2829,7387,NULL,NULL),(35653,'SPECIFIC_DAY',0,0,NULL,'2010-09-12',2829,7387,NULL,NULL),(35654,'SPECIFIC_DAY',0,6,NULL,'2010-09-24',2829,7387,NULL,NULL),(35655,'SPECIFIC_DAY',0,0,NULL,'2010-09-18',2829,7387,NULL,NULL),(35656,'SPECIFIC_DAY',0,6,NULL,'2010-11-23',2829,7387,NULL,NULL),(35657,'SPECIFIC_DAY',0,6,NULL,'2010-11-01',2829,7387,NULL,NULL),(35658,'SPECIFIC_DAY',0,6,NULL,'2010-09-16',2829,7387,NULL,NULL),(36775,'GENERIC_DAY',1,8,NULL,'2011-05-02',16062,NULL,36664,NULL),(36776,'GENERIC_DAY',1,2,NULL,'2011-05-09',16062,NULL,36664,NULL),(36777,'GENERIC_DAY',1,8,NULL,'2011-05-06',16062,NULL,36664,NULL),(36778,'GENERIC_DAY',1,8,NULL,'2011-05-03',16062,NULL,36664,NULL),(36779,'GENERIC_DAY',1,8,NULL,'2011-05-04',16062,NULL,36664,NULL),(36780,'GENERIC_DAY',1,0,NULL,'2011-04-30',16062,NULL,36664,NULL),(36781,'GENERIC_DAY',1,8,NULL,'2011-04-29',16062,NULL,36664,NULL),(36782,'GENERIC_DAY',1,0,NULL,'2011-05-08',16062,NULL,36664,NULL),(36783,'GENERIC_DAY',1,0,NULL,'2011-05-07',16062,NULL,36664,NULL),(36784,'GENERIC_DAY',1,8,NULL,'2011-05-05',16062,NULL,36664,NULL),(36785,'GENERIC_DAY',1,0,NULL,'2011-05-01',16062,NULL,36664,NULL),(37471,'SPECIFIC_DAY',1,8,NULL,'2010-10-06',1112,8082,NULL,NULL),(37472,'SPECIFIC_DAY',1,8,NULL,'2010-10-07',1112,8082,NULL,NULL),(37473,'SPECIFIC_DAY',1,8,NULL,'2010-09-16',1112,8082,NULL,NULL),(37474,'SPECIFIC_DAY',1,8,NULL,'2010-09-27',1112,8082,NULL,NULL),(37475,'SPECIFIC_DAY',1,8,NULL,'2010-09-22',1112,8082,NULL,NULL),(37476,'SPECIFIC_DAY',1,6,NULL,'2010-10-11',1112,8082,NULL,NULL),(37477,'SPECIFIC_DAY',1,8,NULL,'2010-09-17',1112,8082,NULL,NULL),(37478,'SPECIFIC_DAY',1,8,NULL,'2010-10-01',1112,8082,NULL,NULL),(37479,'SPECIFIC_DAY',1,8,NULL,'2010-09-23',1112,8082,NULL,NULL),(37480,'SPECIFIC_DAY',1,8,NULL,'2010-10-04',1112,8082,NULL,NULL),(37481,'SPECIFIC_DAY',1,8,NULL,'2010-09-24',1112,8082,NULL,NULL),(37482,'SPECIFIC_DAY',1,8,NULL,'2010-09-15',1112,8082,NULL,NULL),(37483,'SPECIFIC_DAY',1,8,NULL,'2010-10-05',1112,8082,NULL,NULL),(37484,'SPECIFIC_DAY',1,8,NULL,'2010-10-08',1112,8082,NULL,NULL),(37485,'SPECIFIC_DAY',1,8,NULL,'2010-09-20',1112,8082,NULL,NULL),(37486,'SPECIFIC_DAY',1,8,NULL,'2010-09-28',1112,8082,NULL,NULL),(37487,'SPECIFIC_DAY',1,8,NULL,'2010-09-21',1112,8082,NULL,NULL),(37488,'SPECIFIC_DAY',1,8,NULL,'2010-09-30',1112,8082,NULL,NULL),(37489,'SPECIFIC_DAY',1,8,NULL,'2010-09-29',1112,8082,NULL,NULL),(37490,'SPECIFIC_DAY',1,8,NULL,'2010-10-21',1114,7384,NULL,NULL),(37491,'SPECIFIC_DAY',1,4,NULL,'2010-10-20',1114,7384,NULL,NULL),(37492,'SPECIFIC_DAY',1,6,NULL,'2010-10-28',1114,7384,NULL,NULL),(37493,'SPECIFIC_DAY',1,8,NULL,'2010-10-26',1114,7384,NULL,NULL),(37494,'SPECIFIC_DAY',1,8,NULL,'2010-10-27',1114,7384,NULL,NULL),(37495,'SPECIFIC_DAY',1,8,NULL,'2010-10-25',1114,7384,NULL,NULL),(37496,'SPECIFIC_DAY',1,8,NULL,'2010-10-22',1114,7384,NULL,NULL),(37497,'SPECIFIC_DAY',1,8,NULL,'2010-06-22',1112,7383,NULL,NULL),(37498,'SPECIFIC_DAY',1,8,NULL,'2010-06-24',1112,7383,NULL,NULL),(37499,'SPECIFIC_DAY',1,8,NULL,'2010-07-01',1112,7383,NULL,NULL),(37500,'SPECIFIC_DAY',1,8,NULL,'2010-06-29',1112,7383,NULL,NULL),(37501,'SPECIFIC_DAY',1,8,NULL,'2010-06-25',1112,7383,NULL,NULL),(37502,'SPECIFIC_DAY',1,8,NULL,'2010-07-02',1112,7383,NULL,NULL),(37503,'SPECIFIC_DAY',1,8,NULL,'2010-06-21',1112,7383,NULL,NULL),(37504,'SPECIFIC_DAY',1,4,NULL,'2010-07-07',1112,7383,NULL,NULL),(37505,'SPECIFIC_DAY',1,8,NULL,'2010-06-30',1112,7383,NULL,NULL),(37506,'SPECIFIC_DAY',1,8,NULL,'2010-07-05',1112,7383,NULL,NULL),(37507,'SPECIFIC_DAY',1,8,NULL,'2010-06-23',1112,7383,NULL,NULL),(37508,'SPECIFIC_DAY',1,8,NULL,'2010-06-28',1112,7383,NULL,NULL),(37509,'SPECIFIC_DAY',1,8,NULL,'2010-07-06',1112,7383,NULL,NULL),(37510,'GENERIC_DAY',1,8,NULL,'2010-05-27',19999,NULL,6262,NULL),(37511,'GENERIC_DAY',1,8,NULL,'2010-05-26',19999,NULL,6262,NULL),(37512,'GENERIC_DAY',1,8,NULL,'2010-06-01',19999,NULL,6262,NULL),(37513,'GENERIC_DAY',1,8,NULL,'2010-05-19',19999,NULL,6262,NULL),(37514,'GENERIC_DAY',1,8,NULL,'2010-05-25',19999,NULL,6262,NULL),(37515,'GENERIC_DAY',1,8,NULL,'2010-05-28',19999,NULL,6262,NULL),(37516,'GENERIC_DAY',1,8,NULL,'2010-05-20',19999,NULL,6262,NULL),(37517,'GENERIC_DAY',1,8,NULL,'2010-05-21',19999,NULL,6262,NULL),(37518,'GENERIC_DAY',1,8,NULL,'2010-05-31',19999,NULL,6262,NULL),(37519,'GENERIC_DAY',1,8,NULL,'2010-05-18',19999,NULL,6262,NULL),(37520,'GENERIC_DAY',1,8,NULL,'2010-05-24',19999,NULL,6262,NULL),(37521,'GENERIC_DAY',1,8,NULL,'2010-06-02',19999,NULL,6262,NULL),(37522,'GENERIC_DAY',1,4,NULL,'2010-06-03',19999,NULL,6262,NULL),(37572,'SPECIFIC_DAY',1,8,NULL,'2010-06-24',19999,NULL,NULL,NULL),(37573,'SPECIFIC_DAY',1,8,NULL,'2010-09-29',19999,NULL,NULL,NULL),(37574,'SPECIFIC_DAY',1,8,NULL,'2010-07-27',19999,NULL,NULL,NULL),(37575,'SPECIFIC_DAY',1,8,NULL,'2010-11-24',19999,NULL,NULL,NULL),(37576,'SPECIFIC_DAY',1,8,NULL,'2010-11-09',19999,NULL,NULL,NULL),(37577,'SPECIFIC_DAY',1,8,NULL,'2010-09-02',19999,NULL,NULL,NULL),(37578,'SPECIFIC_DAY',1,8,NULL,'2010-09-28',19999,NULL,NULL,NULL),(37579,'SPECIFIC_DAY',1,8,NULL,'2010-10-12',19999,NULL,NULL,NULL),(37580,'SPECIFIC_DAY',1,8,NULL,'2010-07-13',19999,NULL,NULL,NULL),(37581,'SPECIFIC_DAY',1,8,NULL,'2010-10-21',19999,NULL,NULL,NULL),(37582,'SPECIFIC_DAY',1,8,NULL,'2010-08-05',19999,NULL,NULL,NULL),(37583,'SPECIFIC_DAY',1,8,NULL,'2010-10-15',19999,NULL,NULL,NULL),(37584,'SPECIFIC_DAY',1,8,NULL,'2010-06-04',19999,NULL,NULL,NULL),(37585,'SPECIFIC_DAY',1,8,NULL,'2010-07-12',19999,NULL,NULL,NULL),(37586,'SPECIFIC_DAY',1,8,NULL,'2010-09-01',19999,NULL,NULL,NULL),(37587,'SPECIFIC_DAY',1,8,NULL,'2010-09-17',19999,NULL,NULL,NULL),(37588,'SPECIFIC_DAY',1,8,NULL,'2010-10-06',19999,NULL,NULL,NULL),(37589,'SPECIFIC_DAY',1,8,NULL,'2010-11-08',19999,NULL,NULL,NULL),(37590,'SPECIFIC_DAY',1,8,NULL,'2010-08-10',19999,NULL,NULL,NULL),(37591,'SPECIFIC_DAY',1,8,NULL,'2010-10-27',19999,NULL,NULL,NULL),(37592,'SPECIFIC_DAY',1,8,NULL,'2010-08-26',19999,NULL,NULL,NULL),(37593,'SPECIFIC_DAY',1,8,NULL,'2010-10-20',19999,NULL,NULL,NULL),(37594,'SPECIFIC_DAY',1,8,NULL,'2010-06-15',19999,NULL,NULL,NULL),(37595,'SPECIFIC_DAY',1,8,NULL,'2010-07-09',19999,NULL,NULL,NULL),(37596,'SPECIFIC_DAY',1,8,NULL,'2010-06-25',19999,NULL,NULL,NULL),(37597,'SPECIFIC_DAY',1,8,NULL,'2010-11-19',19999,NULL,NULL,NULL),(37598,'SPECIFIC_DAY',1,8,NULL,'2010-08-20',19999,NULL,NULL,NULL),(37599,'SPECIFIC_DAY',1,8,NULL,'2010-07-23',19999,NULL,NULL,NULL),(37600,'SPECIFIC_DAY',1,8,NULL,'2010-08-27',19999,NULL,NULL,NULL),(37601,'SPECIFIC_DAY',1,8,NULL,'2010-07-21',19999,NULL,NULL,NULL),(37602,'SPECIFIC_DAY',1,8,NULL,'2010-06-29',19999,NULL,NULL,NULL),(37603,'SPECIFIC_DAY',1,8,NULL,'2010-07-28',19999,NULL,NULL,NULL),(37604,'SPECIFIC_DAY',1,8,NULL,'2010-08-24',19999,NULL,NULL,NULL),(37605,'SPECIFIC_DAY',1,8,NULL,'2010-09-30',19999,NULL,NULL,NULL),(37606,'SPECIFIC_DAY',1,8,NULL,'2010-08-02',19999,NULL,NULL,NULL),(37607,'SPECIFIC_DAY',1,8,NULL,'2010-08-09',19999,NULL,NULL,NULL),(37608,'SPECIFIC_DAY',1,8,NULL,'2010-08-04',19999,NULL,NULL,NULL),(37609,'SPECIFIC_DAY',1,8,NULL,'2010-11-04',19999,NULL,NULL,NULL),(37610,'SPECIFIC_DAY',1,8,NULL,'2010-10-29',19999,NULL,NULL,NULL),(37611,'SPECIFIC_DAY',1,8,NULL,'2010-09-10',19999,NULL,NULL,NULL),(37612,'SPECIFIC_DAY',1,8,NULL,'2010-09-13',19999,NULL,NULL,NULL),(37613,'SPECIFIC_DAY',1,8,NULL,'2010-10-14',19999,NULL,NULL,NULL),(37614,'SPECIFIC_DAY',1,4,NULL,'2010-11-25',19999,NULL,NULL,NULL),(37615,'SPECIFIC_DAY',1,8,NULL,'2010-11-05',19999,NULL,NULL,NULL),(37616,'SPECIFIC_DAY',1,8,NULL,'2010-07-29',19999,NULL,NULL,NULL),(37617,'SPECIFIC_DAY',1,8,NULL,'2010-07-26',19999,NULL,NULL,NULL),(37618,'SPECIFIC_DAY',1,8,NULL,'2010-06-08',19999,NULL,NULL,NULL),(37619,'SPECIFIC_DAY',1,8,NULL,'2010-11-17',19999,NULL,NULL,NULL),(37620,'SPECIFIC_DAY',1,8,NULL,'2010-07-30',19999,NULL,NULL,NULL),(37621,'SPECIFIC_DAY',1,8,NULL,'2010-10-08',19999,NULL,NULL,NULL),(37622,'SPECIFIC_DAY',1,8,NULL,'2010-09-06',19999,NULL,NULL,NULL),(37623,'SPECIFIC_DAY',1,8,NULL,'2010-11-18',19999,NULL,NULL,NULL),(37624,'SPECIFIC_DAY',1,8,NULL,'2010-08-16',19999,NULL,NULL,NULL),(37625,'SPECIFIC_DAY',1,8,NULL,'2010-10-07',19999,NULL,NULL,NULL),(37626,'SPECIFIC_DAY',1,8,NULL,'2010-11-11',19999,NULL,NULL,NULL),(37627,'SPECIFIC_DAY',1,8,NULL,'2010-11-22',19999,NULL,NULL,NULL),(37628,'SPECIFIC_DAY',1,8,NULL,'2010-11-02',19999,NULL,NULL,NULL),(37629,'SPECIFIC_DAY',1,8,NULL,'2010-06-17',19999,NULL,NULL,NULL),(37630,'SPECIFIC_DAY',1,8,NULL,'2010-09-03',19999,NULL,NULL,NULL),(37631,'SPECIFIC_DAY',1,8,NULL,'2010-09-08',19999,NULL,NULL,NULL),(37632,'SPECIFIC_DAY',1,8,NULL,'2010-11-15',19999,NULL,NULL,NULL),(37633,'SPECIFIC_DAY',1,8,NULL,'2010-10-26',19999,NULL,NULL,NULL),(37634,'SPECIFIC_DAY',1,8,NULL,'2010-09-14',19999,NULL,NULL,NULL),(37635,'SPECIFIC_DAY',1,8,NULL,'2010-07-20',19999,NULL,NULL,NULL),(37636,'SPECIFIC_DAY',1,8,NULL,'2010-08-17',19999,NULL,NULL,NULL),(37637,'SPECIFIC_DAY',1,8,NULL,'2010-07-05',19999,NULL,NULL,NULL),(37638,'SPECIFIC_DAY',1,8,NULL,'2010-06-14',19999,NULL,NULL,NULL),(37639,'SPECIFIC_DAY',1,8,NULL,'2010-06-11',19999,NULL,NULL,NULL),(37640,'SPECIFIC_DAY',1,8,NULL,'2010-09-23',19999,NULL,NULL,NULL),(37641,'SPECIFIC_DAY',1,8,NULL,'2010-10-01',19999,NULL,NULL,NULL),(37642,'SPECIFIC_DAY',1,8,NULL,'2010-08-06',19999,NULL,NULL,NULL),(37643,'SPECIFIC_DAY',1,8,NULL,'2010-08-31',19999,NULL,NULL,NULL),(37644,'SPECIFIC_DAY',1,8,NULL,'2010-09-15',19999,NULL,NULL,NULL),(37645,'SPECIFIC_DAY',1,8,NULL,'2010-09-07',19999,NULL,NULL,NULL),(37646,'SPECIFIC_DAY',1,8,NULL,'2010-08-30',19999,NULL,NULL,NULL),(37647,'SPECIFIC_DAY',1,8,NULL,'2010-08-12',19999,NULL,NULL,NULL),(37648,'SPECIFIC_DAY',1,8,NULL,'2010-08-19',19999,NULL,NULL,NULL),(37649,'SPECIFIC_DAY',1,8,NULL,'2010-10-28',19999,NULL,NULL,NULL),(37650,'SPECIFIC_DAY',1,8,NULL,'2010-07-22',19999,NULL,NULL,NULL),(37651,'SPECIFIC_DAY',1,8,NULL,'2010-09-09',19999,NULL,NULL,NULL),(37652,'SPECIFIC_DAY',1,8,NULL,'2010-09-16',19999,NULL,NULL,NULL),(37653,'SPECIFIC_DAY',1,8,NULL,'2010-11-16',19999,NULL,NULL,NULL),(37654,'SPECIFIC_DAY',1,8,NULL,'2010-09-27',19999,NULL,NULL,NULL),(37655,'SPECIFIC_DAY',1,8,NULL,'2010-10-25',19999,NULL,NULL,NULL),(37656,'SPECIFIC_DAY',1,8,NULL,'2010-06-28',19999,NULL,NULL,NULL),(37657,'SPECIFIC_DAY',1,8,NULL,'2010-10-05',19999,NULL,NULL,NULL),(37658,'SPECIFIC_DAY',1,8,NULL,'2010-10-11',19999,NULL,NULL,NULL),(37659,'SPECIFIC_DAY',1,8,NULL,'2010-09-21',19999,NULL,NULL,NULL),(37660,'SPECIFIC_DAY',1,8,NULL,'2010-07-01',19999,NULL,NULL,NULL),(37661,'SPECIFIC_DAY',1,8,NULL,'2010-06-23',19999,NULL,NULL,NULL),(37662,'SPECIFIC_DAY',1,8,NULL,'2010-07-02',19999,NULL,NULL,NULL),(37663,'SPECIFIC_DAY',1,8,NULL,'2010-10-19',19999,NULL,NULL,NULL),(37664,'SPECIFIC_DAY',1,8,NULL,'2010-07-19',19999,NULL,NULL,NULL),(37665,'SPECIFIC_DAY',1,8,NULL,'2010-09-22',19999,NULL,NULL,NULL),(37666,'SPECIFIC_DAY',1,8,NULL,'2010-09-24',19999,NULL,NULL,NULL),(37667,'SPECIFIC_DAY',1,8,NULL,'2010-07-06',19999,NULL,NULL,NULL),(37668,'SPECIFIC_DAY',1,8,NULL,'2010-06-10',19999,NULL,NULL,NULL),(37669,'SPECIFIC_DAY',1,4,NULL,'2010-06-03',19999,NULL,NULL,NULL),(37670,'SPECIFIC_DAY',1,8,NULL,'2010-08-25',19999,NULL,NULL,NULL),(37671,'SPECIFIC_DAY',1,8,NULL,'2010-07-14',19999,NULL,NULL,NULL),(37672,'SPECIFIC_DAY',1,8,NULL,'2010-07-07',19999,NULL,NULL,NULL),(37673,'SPECIFIC_DAY',1,8,NULL,'2010-06-07',19999,NULL,NULL,NULL),(37674,'SPECIFIC_DAY',1,8,NULL,'2010-07-16',19999,NULL,NULL,NULL),(37675,'SPECIFIC_DAY',1,8,NULL,'2010-06-18',19999,NULL,NULL,NULL),(37676,'SPECIFIC_DAY',1,8,NULL,'2010-10-04',19999,NULL,NULL,NULL),(37677,'SPECIFIC_DAY',1,8,NULL,'2010-11-03',19999,NULL,NULL,NULL),(37678,'SPECIFIC_DAY',1,8,NULL,'2010-11-12',19999,NULL,NULL,NULL),(37679,'SPECIFIC_DAY',1,8,NULL,'2010-08-11',19999,NULL,NULL,NULL),(37680,'SPECIFIC_DAY',1,8,NULL,'2010-07-15',19999,NULL,NULL,NULL),(37681,'SPECIFIC_DAY',1,8,NULL,'2010-06-22',19999,NULL,NULL,NULL),(37682,'SPECIFIC_DAY',1,8,NULL,'2010-06-21',19999,NULL,NULL,NULL),(37683,'SPECIFIC_DAY',1,8,NULL,'2010-08-13',19999,NULL,NULL,NULL),(37684,'SPECIFIC_DAY',1,8,NULL,'2010-08-18',19999,NULL,NULL,NULL),(37685,'SPECIFIC_DAY',1,8,NULL,'2010-08-03',19999,NULL,NULL,NULL),(37686,'SPECIFIC_DAY',1,8,NULL,'2010-10-13',19999,NULL,NULL,NULL),(37687,'SPECIFIC_DAY',1,8,NULL,'2010-07-08',19999,NULL,NULL,NULL),(37688,'SPECIFIC_DAY',1,8,NULL,'2010-11-01',19999,NULL,NULL,NULL),(37689,'SPECIFIC_DAY',1,8,NULL,'2010-11-23',19999,NULL,NULL,NULL),(37690,'SPECIFIC_DAY',1,8,NULL,'2010-06-30',19999,NULL,NULL,NULL),(37691,'SPECIFIC_DAY',1,8,NULL,'2010-09-20',19999,NULL,NULL,NULL),(37692,'SPECIFIC_DAY',1,8,NULL,'2010-06-09',19999,NULL,NULL,NULL),(37693,'SPECIFIC_DAY',1,8,NULL,'2010-11-10',19999,NULL,NULL,NULL),(37694,'SPECIFIC_DAY',1,8,NULL,'2010-08-23',19999,NULL,NULL,NULL),(37695,'SPECIFIC_DAY',1,8,NULL,'2010-06-16',19999,NULL,NULL,NULL),(37696,'SPECIFIC_DAY',1,8,NULL,'2010-10-18',19999,NULL,NULL,NULL),(37697,'SPECIFIC_DAY',1,8,NULL,'2010-10-22',19999,NULL,NULL,NULL),(37698,'SPECIFIC_DAY',1,8,NULL,'2010-10-06',1114,37068,NULL,NULL),(37699,'SPECIFIC_DAY',1,8,NULL,'2010-10-18',1114,37068,NULL,NULL),(37700,'SPECIFIC_DAY',1,8,NULL,'2010-09-27',1114,37068,NULL,NULL),(37701,'SPECIFIC_DAY',1,2,NULL,'2010-09-23',1114,37068,NULL,NULL),(37702,'SPECIFIC_DAY',1,8,NULL,'2010-10-07',1114,37068,NULL,NULL),(37703,'SPECIFIC_DAY',1,8,NULL,'2010-10-04',1114,37068,NULL,NULL),(37704,'SPECIFIC_DAY',1,4,NULL,'2010-10-20',1114,37068,NULL,NULL),(37705,'SPECIFIC_DAY',1,8,NULL,'2010-10-08',1114,37068,NULL,NULL),(37706,'SPECIFIC_DAY',1,8,NULL,'2010-09-24',1114,37068,NULL,NULL),(37707,'SPECIFIC_DAY',1,8,NULL,'2010-10-11',1114,37068,NULL,NULL),(37708,'SPECIFIC_DAY',1,8,NULL,'2010-10-19',1114,37068,NULL,NULL),(37709,'SPECIFIC_DAY',1,8,NULL,'2010-09-28',1114,37068,NULL,NULL),(37710,'SPECIFIC_DAY',1,8,NULL,'2010-09-29',1114,37068,NULL,NULL),(37711,'SPECIFIC_DAY',1,8,NULL,'2010-10-01',1114,37068,NULL,NULL),(37712,'SPECIFIC_DAY',1,8,NULL,'2010-10-15',1114,37068,NULL,NULL),(37713,'SPECIFIC_DAY',1,8,NULL,'2010-10-12',1114,37068,NULL,NULL),(37714,'SPECIFIC_DAY',1,8,NULL,'2010-10-14',1114,37068,NULL,NULL),(37715,'SPECIFIC_DAY',1,8,NULL,'2010-10-13',1114,37068,NULL,NULL),(37716,'SPECIFIC_DAY',1,8,NULL,'2010-10-05',1114,37068,NULL,NULL),(37717,'SPECIFIC_DAY',1,8,NULL,'2010-09-30',1114,37068,NULL,NULL),(37718,'SPECIFIC_DAY',1,8,NULL,'2010-06-04',20001,19497,NULL,NULL),(37719,'SPECIFIC_DAY',1,8,NULL,'2010-05-27',20001,19497,NULL,NULL),(37720,'SPECIFIC_DAY',1,8,NULL,'2010-07-05',20001,19497,NULL,NULL),(37721,'SPECIFIC_DAY',1,8,NULL,'2010-06-10',20001,19497,NULL,NULL),(37722,'SPECIFIC_DAY',1,8,NULL,'2010-07-14',20001,19497,NULL,NULL),(37723,'SPECIFIC_DAY',1,8,NULL,'2010-05-24',20001,19497,NULL,NULL),(37724,'SPECIFIC_DAY',1,8,NULL,'2010-07-15',20001,19497,NULL,NULL),(37725,'SPECIFIC_DAY',1,8,NULL,'2010-07-09',20001,19497,NULL,NULL),(37726,'SPECIFIC_DAY',1,8,NULL,'2010-06-08',20001,19497,NULL,NULL),(37727,'SPECIFIC_DAY',1,8,NULL,'2010-07-13',20001,19497,NULL,NULL),(37728,'SPECIFIC_DAY',1,4,NULL,'2010-08-11',20001,19497,NULL,NULL),(37729,'SPECIFIC_DAY',1,8,NULL,'2010-06-15',20001,19497,NULL,NULL),(37730,'SPECIFIC_DAY',1,8,NULL,'2010-05-18',20001,19497,NULL,NULL),(37731,'SPECIFIC_DAY',1,8,NULL,'2010-06-23',20001,19497,NULL,NULL),(37732,'SPECIFIC_DAY',1,8,NULL,'2010-07-12',20001,19497,NULL,NULL),(37733,'SPECIFIC_DAY',1,8,NULL,'2010-07-08',20001,19497,NULL,NULL),(37734,'SPECIFIC_DAY',1,8,NULL,'2010-05-28',20001,19497,NULL,NULL),(37735,'SPECIFIC_DAY',1,8,NULL,'2010-06-14',20001,19497,NULL,NULL),(37736,'SPECIFIC_DAY',1,8,NULL,'2010-08-05',20001,19497,NULL,NULL),(37737,'SPECIFIC_DAY',1,8,NULL,'2010-05-19',20001,19497,NULL,NULL),(37738,'SPECIFIC_DAY',1,8,NULL,'2010-05-26',20001,19497,NULL,NULL),(37739,'SPECIFIC_DAY',1,8,NULL,'2010-06-28',20001,19497,NULL,NULL),(37740,'SPECIFIC_DAY',1,8,NULL,'2010-07-23',20001,19497,NULL,NULL),(37741,'SPECIFIC_DAY',1,8,NULL,'2010-07-01',20001,19497,NULL,NULL),(37742,'SPECIFIC_DAY',1,8,NULL,'2010-08-09',20001,19497,NULL,NULL),(37743,'SPECIFIC_DAY',1,8,NULL,'2010-08-04',20001,19497,NULL,NULL),(37744,'SPECIFIC_DAY',1,8,NULL,'2010-07-06',20001,19497,NULL,NULL),(37745,'SPECIFIC_DAY',1,8,NULL,'2010-06-21',20001,19497,NULL,NULL),(37746,'SPECIFIC_DAY',1,8,NULL,'2010-05-25',20001,19497,NULL,NULL),(37747,'SPECIFIC_DAY',1,8,NULL,'2010-06-17',20001,19497,NULL,NULL),(37748,'SPECIFIC_DAY',1,8,NULL,'2010-06-22',20001,19497,NULL,NULL),(37749,'SPECIFIC_DAY',1,8,NULL,'2010-06-24',20001,19497,NULL,NULL),(37750,'SPECIFIC_DAY',1,8,NULL,'2010-06-03',20001,19497,NULL,NULL),(37751,'SPECIFIC_DAY',1,8,NULL,'2010-06-01',20001,19497,NULL,NULL),(37752,'SPECIFIC_DAY',1,8,NULL,'2010-07-20',20001,19497,NULL,NULL),(37753,'SPECIFIC_DAY',1,8,NULL,'2010-08-02',20001,19497,NULL,NULL),(37754,'SPECIFIC_DAY',1,8,NULL,'2010-06-18',20001,19497,NULL,NULL),(37755,'SPECIFIC_DAY',1,8,NULL,'2010-06-30',20001,19497,NULL,NULL),(37756,'SPECIFIC_DAY',1,8,NULL,'2010-05-21',20001,19497,NULL,NULL),(37757,'SPECIFIC_DAY',1,8,NULL,'2010-06-25',20001,19497,NULL,NULL),(37758,'SPECIFIC_DAY',1,8,NULL,'2010-06-02',20001,19497,NULL,NULL),(37759,'SPECIFIC_DAY',1,8,NULL,'2010-07-29',20001,19497,NULL,NULL),(37760,'SPECIFIC_DAY',1,8,NULL,'2010-07-30',20001,19497,NULL,NULL),(37761,'SPECIFIC_DAY',1,8,NULL,'2010-07-27',20001,19497,NULL,NULL),(37762,'SPECIFIC_DAY',1,8,NULL,'2010-06-16',20001,19497,NULL,NULL),(37763,'SPECIFIC_DAY',1,8,NULL,'2010-06-11',20001,19497,NULL,NULL),(37764,'SPECIFIC_DAY',1,8,NULL,'2010-07-02',20001,19497,NULL,NULL),(37765,'SPECIFIC_DAY',1,8,NULL,'2010-07-21',20001,19497,NULL,NULL),(37766,'SPECIFIC_DAY',1,8,NULL,'2010-08-03',20001,19497,NULL,NULL),(37767,'SPECIFIC_DAY',1,8,NULL,'2010-05-17',20001,19497,NULL,NULL),(37768,'SPECIFIC_DAY',1,8,NULL,'2010-07-28',20001,19497,NULL,NULL),(37769,'SPECIFIC_DAY',1,8,NULL,'2010-06-09',20001,19497,NULL,NULL),(37770,'SPECIFIC_DAY',1,8,NULL,'2010-06-07',20001,19497,NULL,NULL),(37771,'SPECIFIC_DAY',1,8,NULL,'2010-08-10',20001,19497,NULL,NULL),(37772,'SPECIFIC_DAY',1,8,NULL,'2010-05-20',20001,19497,NULL,NULL),(37773,'SPECIFIC_DAY',1,8,NULL,'2010-05-31',20001,19497,NULL,NULL),(37774,'SPECIFIC_DAY',1,8,NULL,'2010-07-22',20001,19497,NULL,NULL),(37775,'SPECIFIC_DAY',1,8,NULL,'2010-07-26',20001,19497,NULL,NULL),(37776,'SPECIFIC_DAY',1,8,NULL,'2010-06-29',20001,19497,NULL,NULL),(37777,'SPECIFIC_DAY',1,8,NULL,'2010-07-19',20001,19497,NULL,NULL),(37778,'SPECIFIC_DAY',1,8,NULL,'2010-07-07',20001,19497,NULL,NULL),(37779,'SPECIFIC_DAY',1,8,NULL,'2010-07-16',20001,19497,NULL,NULL),(37780,'SPECIFIC_DAY',1,8,NULL,'2010-08-06',20001,19497,NULL,NULL),(37781,'SPECIFIC_DAY',1,8,NULL,'2010-07-29',1112,12639,NULL,NULL),(37782,'SPECIFIC_DAY',1,8,NULL,'2010-08-31',1112,12639,NULL,NULL),(37783,'SPECIFIC_DAY',1,8,NULL,'2010-08-19',1112,12639,NULL,NULL),(37784,'SPECIFIC_DAY',1,8,NULL,'2010-08-13',1112,12639,NULL,NULL),(37785,'SPECIFIC_DAY',1,8,NULL,'2010-07-14',1112,12639,NULL,NULL),(37786,'SPECIFIC_DAY',1,8,NULL,'2010-07-13',1112,12639,NULL,NULL),(37787,'SPECIFIC_DAY',1,8,NULL,'2010-09-06',1112,12639,NULL,NULL),(37788,'SPECIFIC_DAY',1,8,NULL,'2010-07-27',1112,12639,NULL,NULL),(37789,'SPECIFIC_DAY',1,8,NULL,'2010-08-23',1112,12639,NULL,NULL),(37790,'SPECIFIC_DAY',1,8,NULL,'2010-07-08',1112,12639,NULL,NULL),(37791,'SPECIFIC_DAY',1,8,NULL,'2010-09-01',1112,12639,NULL,NULL),(37792,'SPECIFIC_DAY',1,8,NULL,'2010-09-02',1112,12639,NULL,NULL),(37793,'SPECIFIC_DAY',1,8,NULL,'2010-08-02',1112,12639,NULL,NULL),(37794,'SPECIFIC_DAY',1,8,NULL,'2010-07-28',1112,12639,NULL,NULL),(37795,'SPECIFIC_DAY',1,8,NULL,'2010-08-24',1112,12639,NULL,NULL),(37796,'SPECIFIC_DAY',1,8,NULL,'2010-08-12',1112,12639,NULL,NULL),(37797,'SPECIFIC_DAY',1,8,NULL,'2010-09-07',1112,12639,NULL,NULL),(37798,'SPECIFIC_DAY',1,8,NULL,'2010-08-11',1112,12639,NULL,NULL),(37799,'SPECIFIC_DAY',1,8,NULL,'2010-08-16',1112,12639,NULL,NULL),(37800,'SPECIFIC_DAY',1,8,NULL,'2010-08-05',1112,12639,NULL,NULL),(37801,'SPECIFIC_DAY',1,8,NULL,'2010-09-09',1112,12639,NULL,NULL),(37802,'SPECIFIC_DAY',1,8,NULL,'2010-07-15',1112,12639,NULL,NULL),(37803,'SPECIFIC_DAY',1,8,NULL,'2010-09-08',1112,12639,NULL,NULL),(37804,'SPECIFIC_DAY',1,4,NULL,'2010-07-07',1112,12639,NULL,NULL),(37805,'SPECIFIC_DAY',1,8,NULL,'2010-07-16',1112,12639,NULL,NULL),(37806,'SPECIFIC_DAY',1,8,NULL,'2010-07-12',1112,12639,NULL,NULL),(37807,'SPECIFIC_DAY',1,8,NULL,'2010-08-10',1112,12639,NULL,NULL),(37808,'SPECIFIC_DAY',1,8,NULL,'2010-07-09',1112,12639,NULL,NULL),(37809,'SPECIFIC_DAY',1,8,NULL,'2010-07-20',1112,12639,NULL,NULL),(37810,'SPECIFIC_DAY',1,8,NULL,'2010-07-19',1112,12639,NULL,NULL),(37811,'SPECIFIC_DAY',1,8,NULL,'2010-07-22',1112,12639,NULL,NULL),(37812,'SPECIFIC_DAY',1,8,NULL,'2010-07-26',1112,12639,NULL,NULL),(37813,'SPECIFIC_DAY',1,8,NULL,'2010-09-14',1112,12639,NULL,NULL),(37814,'SPECIFIC_DAY',1,8,NULL,'2010-08-27',1112,12639,NULL,NULL),(37815,'SPECIFIC_DAY',1,4,NULL,'2010-09-15',1112,12639,NULL,NULL),(37816,'SPECIFIC_DAY',1,8,NULL,'2010-08-26',1112,12639,NULL,NULL),(37817,'SPECIFIC_DAY',1,8,NULL,'2010-08-06',1112,12639,NULL,NULL),(37818,'SPECIFIC_DAY',1,8,NULL,'2010-08-20',1112,12639,NULL,NULL),(37819,'SPECIFIC_DAY',1,8,NULL,'2010-07-21',1112,12639,NULL,NULL),(37820,'SPECIFIC_DAY',1,8,NULL,'2010-08-03',1112,12639,NULL,NULL),(37821,'SPECIFIC_DAY',1,8,NULL,'2010-08-09',1112,12639,NULL,NULL),(37822,'SPECIFIC_DAY',1,8,NULL,'2010-08-30',1112,12639,NULL,NULL),(37823,'SPECIFIC_DAY',1,8,NULL,'2010-08-25',1112,12639,NULL,NULL),(37824,'SPECIFIC_DAY',1,8,NULL,'2010-09-03',1112,12639,NULL,NULL),(37825,'SPECIFIC_DAY',1,8,NULL,'2010-08-17',1112,12639,NULL,NULL),(37826,'SPECIFIC_DAY',1,8,NULL,'2010-09-10',1112,12639,NULL,NULL),(37827,'SPECIFIC_DAY',1,8,NULL,'2010-07-30',1112,12639,NULL,NULL),(37828,'SPECIFIC_DAY',1,8,NULL,'2010-07-23',1112,12639,NULL,NULL),(37829,'SPECIFIC_DAY',1,8,NULL,'2010-08-04',1112,12639,NULL,NULL),(37830,'SPECIFIC_DAY',1,8,NULL,'2010-08-18',1112,12639,NULL,NULL),(37831,'SPECIFIC_DAY',1,8,NULL,'2010-09-13',1112,12639,NULL,NULL),(37832,'SPECIFIC_DAY',1,8,NULL,'2010-09-15',20001,19494,NULL,NULL),(37833,'SPECIFIC_DAY',1,8,NULL,'2010-09-17',20001,19494,NULL,NULL),(37834,'SPECIFIC_DAY',1,8,NULL,'2010-10-13',20001,19494,NULL,NULL),(37835,'SPECIFIC_DAY',1,8,NULL,'2010-10-18',20001,19494,NULL,NULL),(37836,'SPECIFIC_DAY',1,8,NULL,'2010-10-05',20001,19494,NULL,NULL),(37837,'SPECIFIC_DAY',1,8,NULL,'2010-10-12',20001,19494,NULL,NULL),(37838,'SPECIFIC_DAY',1,8,NULL,'2010-09-21',20001,19494,NULL,NULL),(37839,'SPECIFIC_DAY',1,8,NULL,'2010-10-15',20001,19494,NULL,NULL),(37840,'SPECIFIC_DAY',1,8,NULL,'2010-10-04',20001,19494,NULL,NULL),(37841,'SPECIFIC_DAY',1,8,NULL,'2010-09-24',20001,19494,NULL,NULL),(37842,'SPECIFIC_DAY',1,8,NULL,'2010-10-14',20001,19494,NULL,NULL),(37843,'SPECIFIC_DAY',1,8,NULL,'2010-10-19',20001,19494,NULL,NULL),(37844,'SPECIFIC_DAY',1,8,NULL,'2010-10-08',20001,19494,NULL,NULL),(37845,'SPECIFIC_DAY',1,8,NULL,'2010-09-29',20001,19494,NULL,NULL),(37846,'SPECIFIC_DAY',1,8,NULL,'2010-09-20',20001,19494,NULL,NULL),(37847,'SPECIFIC_DAY',1,8,NULL,'2010-09-30',20001,19494,NULL,NULL),(37848,'SPECIFIC_DAY',1,8,NULL,'2010-09-28',20001,19494,NULL,NULL),(37849,'SPECIFIC_DAY',1,8,NULL,'2010-09-27',20001,19494,NULL,NULL),(37850,'SPECIFIC_DAY',1,8,NULL,'2010-10-11',20001,19494,NULL,NULL),(37851,'SPECIFIC_DAY',1,8,NULL,'2010-10-06',20001,19494,NULL,NULL),(37852,'SPECIFIC_DAY',1,8,NULL,'2010-09-22',20001,19494,NULL,NULL),(37853,'SPECIFIC_DAY',1,8,NULL,'2010-10-01',20001,19494,NULL,NULL),(37854,'SPECIFIC_DAY',1,8,NULL,'2010-09-23',20001,19494,NULL,NULL),(37855,'SPECIFIC_DAY',1,8,NULL,'2010-10-07',20001,19494,NULL,NULL),(37856,'SPECIFIC_DAY',1,8,NULL,'2010-09-16',20001,19494,NULL,NULL),(38566,'GENERIC_DAY',0,2,NULL,'2010-06-14',2829,NULL,38280,NULL),(38567,'GENERIC_DAY',0,2,NULL,'2010-06-04',37881,NULL,38280,NULL),(38568,'GENERIC_DAY',0,0,NULL,'2010-06-11',16060,NULL,38280,NULL),(38569,'GENERIC_DAY',0,0,NULL,'2010-05-23',37885,NULL,38280,NULL),(38570,'GENERIC_DAY',0,2,NULL,'2010-06-03',2829,NULL,38280,NULL),(38571,'GENERIC_DAY',0,0,NULL,'2010-05-30',37878,NULL,38280,NULL),(38572,'GENERIC_DAY',0,1,NULL,'2010-06-14',37885,NULL,38280,NULL),(38573,'GENERIC_DAY',0,0,NULL,'2010-05-28',16060,NULL,38280,NULL),(38574,'GENERIC_DAY',0,0,NULL,'2010-06-12',37881,NULL,38280,NULL),(38575,'GENERIC_DAY',0,2,NULL,'2010-06-07',2829,NULL,38280,NULL),(38576,'GENERIC_DAY',0,7,NULL,'2010-05-17',16060,NULL,38280,NULL),(38577,'GENERIC_DAY',0,0,NULL,'2010-06-16',16060,NULL,38280,NULL),(38578,'GENERIC_DAY',0,2,NULL,'2010-06-15',37881,NULL,38280,NULL),(38579,'GENERIC_DAY',0,1,NULL,'2010-06-18',37885,NULL,38280,NULL),(38580,'GENERIC_DAY',0,1,NULL,'2010-06-18',37883,NULL,38280,NULL),(38581,'GENERIC_DAY',0,0,NULL,'2010-05-30',37883,NULL,38280,NULL),(38582,'GENERIC_DAY',0,0,NULL,'2010-06-13',37883,NULL,38280,NULL),(38583,'GENERIC_DAY',0,2,NULL,'2010-05-25',37881,NULL,38280,NULL),(38584,'GENERIC_DAY',0,2,NULL,'2010-06-01',2829,NULL,38280,NULL),(38585,'GENERIC_DAY',0,1,NULL,'2010-06-11',37883,NULL,38280,NULL),(38586,'GENERIC_DAY',0,2,NULL,'2010-06-01',37881,NULL,38280,NULL),(38587,'GENERIC_DAY',0,0,NULL,'2010-06-12',37883,NULL,38280,NULL),(38588,'GENERIC_DAY',0,0,NULL,'2010-05-23',37881,NULL,38280,NULL),(38589,'GENERIC_DAY',0,0,NULL,'2010-05-22',2829,NULL,38280,NULL),(38590,'GENERIC_DAY',0,2,NULL,'2010-05-24',37878,NULL,38280,NULL),(38591,'GENERIC_DAY',0,1,NULL,'2010-06-17',37881,NULL,38280,NULL),(38592,'GENERIC_DAY',0,2,NULL,'2010-06-02',37878,NULL,38280,NULL),(38593,'GENERIC_DAY',0,0,NULL,'2010-06-05',37881,NULL,38280,NULL),(38594,'GENERIC_DAY',0,2,NULL,'2010-06-04',37878,NULL,38280,NULL),(38595,'GENERIC_DAY',0,0,NULL,'2010-05-22',37878,NULL,38280,NULL),(38596,'GENERIC_DAY',0,0,NULL,'2010-06-05',37883,NULL,38280,NULL),(38597,'GENERIC_DAY',0,2,NULL,'2010-05-26',37878,NULL,38280,NULL),(38598,'GENERIC_DAY',0,0,NULL,'2010-05-29',2829,NULL,38280,NULL),(38599,'GENERIC_DAY',0,0,NULL,'2010-06-06',16060,NULL,38280,NULL),(38600,'GENERIC_DAY',0,1,NULL,'2010-06-04',37883,NULL,38280,NULL),(38601,'GENERIC_DAY',0,0,NULL,'2010-05-23',2829,NULL,38280,NULL),(38602,'GENERIC_DAY',0,0,NULL,'2010-06-12',2829,NULL,38280,NULL),(38603,'GENERIC_DAY',0,2,NULL,'2010-06-07',37881,NULL,38280,NULL),(38604,'GENERIC_DAY',0,1,NULL,'2010-05-17',2829,NULL,38280,NULL),(38605,'GENERIC_DAY',0,0,NULL,'2010-05-25',16060,NULL,38280,NULL),(38606,'GENERIC_DAY',0,2,NULL,'2010-05-20',16060,NULL,38280,NULL),(38607,'GENERIC_DAY',0,2,NULL,'2010-06-01',37878,NULL,38280,NULL),(38608,'GENERIC_DAY',0,1,NULL,'2010-06-03',37883,NULL,38280,NULL),(38609,'GENERIC_DAY',0,2,NULL,'2010-06-17',2829,NULL,38280,NULL),(38610,'GENERIC_DAY',0,0,NULL,'2010-06-12',37878,NULL,38280,NULL),(38611,'GENERIC_DAY',0,0,NULL,'2010-05-22',16060,NULL,38280,NULL),(38612,'GENERIC_DAY',0,0,NULL,'2010-06-02',16060,NULL,38280,NULL),(38613,'GENERIC_DAY',0,1,NULL,'2010-06-10',37885,NULL,38280,NULL),(38614,'GENERIC_DAY',0,2,NULL,'2010-06-15',2829,NULL,38280,NULL),(38615,'GENERIC_DAY',0,2,NULL,'2010-05-20',37881,NULL,38280,NULL),(38616,'GENERIC_DAY',0,1,NULL,'2010-05-27',37883,NULL,38280,NULL),(38617,'GENERIC_DAY',0,2,NULL,'2010-06-02',37881,NULL,38280,NULL),(38618,'GENERIC_DAY',0,1,NULL,'2010-06-02',37885,NULL,38280,NULL),(38619,'GENERIC_DAY',0,2,NULL,'2010-06-03',16060,NULL,38280,NULL),(38620,'GENERIC_DAY',0,2,NULL,'2010-05-28',37878,NULL,38280,NULL),(38621,'GENERIC_DAY',0,2,NULL,'2010-06-11',2829,NULL,38280,NULL),(38622,'GENERIC_DAY',0,0,NULL,'2010-05-29',37885,NULL,38280,NULL),(38623,'GENERIC_DAY',0,0,NULL,'2010-05-22',37881,NULL,38280,NULL),(38624,'GENERIC_DAY',0,2,NULL,'2010-05-31',37878,NULL,38280,NULL),(38625,'GENERIC_DAY',0,1,NULL,'2010-06-08',37883,NULL,38280,NULL),(38626,'GENERIC_DAY',0,2,NULL,'2010-05-25',37878,NULL,38280,NULL),(38627,'GENERIC_DAY',0,1,NULL,'2010-06-17',37878,NULL,38280,NULL),(38628,'GENERIC_DAY',0,1,NULL,'2010-06-01',37883,NULL,38280,NULL),(38629,'GENERIC_DAY',0,0,NULL,'2010-06-06',37878,NULL,38280,NULL),(38630,'GENERIC_DAY',0,0,NULL,'2010-06-13',37878,NULL,38280,NULL),(38631,'GENERIC_DAY',0,2,NULL,'2010-06-16',2829,NULL,38280,NULL),(38632,'GENERIC_DAY',0,2,NULL,'2010-05-28',37881,NULL,38280,NULL),(38633,'GENERIC_DAY',0,2,NULL,'2010-05-26',37881,NULL,38280,NULL),(38634,'GENERIC_DAY',0,1,NULL,'2010-06-10',37878,NULL,38280,NULL),(38635,'GENERIC_DAY',0,0,NULL,'2010-06-06',37883,NULL,38280,NULL),(38636,'GENERIC_DAY',0,2,NULL,'2010-05-26',37885,NULL,38280,NULL),(38637,'GENERIC_DAY',0,0,NULL,'2010-05-22',37885,NULL,38280,NULL),(38638,'GENERIC_DAY',0,1,NULL,'2010-06-03',37878,NULL,38280,NULL),(38639,'GENERIC_DAY',0,2,NULL,'2010-06-11',37878,NULL,38280,NULL),(38640,'GENERIC_DAY',0,2,NULL,'2010-05-20',37878,NULL,38280,NULL),(38641,'GENERIC_DAY',0,1,NULL,'2010-06-14',37883,NULL,38280,NULL),(38642,'GENERIC_DAY',0,2,NULL,'2010-05-27',16060,NULL,38280,NULL),(38643,'GENERIC_DAY',0,2,NULL,'2010-05-27',37881,NULL,38280,NULL),(38644,'GENERIC_DAY',0,2,NULL,'2010-05-28',37885,NULL,38280,NULL),(38645,'GENERIC_DAY',0,0,NULL,'2010-06-09',16060,NULL,38280,NULL),(38646,'GENERIC_DAY',0,0,NULL,'2010-05-29',16060,NULL,38280,NULL),(38647,'GENERIC_DAY',0,0,NULL,'2010-05-23',37878,NULL,38280,NULL),(38648,'GENERIC_DAY',0,0,NULL,'2010-05-20',2829,NULL,38280,NULL),(38649,'GENERIC_DAY',0,2,NULL,'2010-06-14',37881,NULL,38280,NULL),(38650,'GENERIC_DAY',0,0,NULL,'2010-06-08',16060,NULL,38280,NULL),(38651,'GENERIC_DAY',0,2,NULL,'2010-05-24',37881,NULL,38280,NULL),(38652,'GENERIC_DAY',0,1,NULL,'2010-06-15',37883,NULL,38280,NULL),(38653,'GENERIC_DAY',0,2,NULL,'2010-05-28',37883,NULL,38280,NULL),(38654,'GENERIC_DAY',0,1,NULL,'2010-06-03',37881,NULL,38280,NULL),(38655,'GENERIC_DAY',0,1,NULL,'2010-06-07',37885,NULL,38280,NULL),(38656,'GENERIC_DAY',0,1,NULL,'2010-05-27',37885,NULL,38280,NULL),(38657,'GENERIC_DAY',0,0,NULL,'2010-05-21',2829,NULL,38280,NULL),(38658,'GENERIC_DAY',0,0,NULL,'2010-05-25',2829,NULL,38280,NULL),(38659,'GENERIC_DAY',0,2,NULL,'2010-06-08',37881,NULL,38280,NULL),(38660,'GENERIC_DAY',0,0,NULL,'2010-06-06',2829,NULL,38280,NULL),(38661,'GENERIC_DAY',0,1,NULL,'2010-05-20',37885,NULL,38280,NULL),(38662,'GENERIC_DAY',0,0,NULL,'2010-06-18',16060,NULL,38280,NULL),(38663,'GENERIC_DAY',0,1,NULL,'2010-06-11',37885,NULL,38280,NULL),(38664,'GENERIC_DAY',0,2,NULL,'2010-06-09',37881,NULL,38280,NULL),(38665,'GENERIC_DAY',0,0,NULL,'2010-06-04',16060,NULL,38280,NULL),(38666,'GENERIC_DAY',0,2,NULL,'2010-05-21',37881,NULL,38280,NULL),(38667,'GENERIC_DAY',0,0,NULL,'2010-06-05',2829,NULL,38280,NULL),(38668,'GENERIC_DAY',0,2,NULL,'2010-06-08',37878,NULL,38280,NULL),(38669,'GENERIC_DAY',0,0,NULL,'2010-05-23',37883,NULL,38280,NULL),(38670,'GENERIC_DAY',0,2,NULL,'2010-05-24',37883,NULL,38280,NULL),(38671,'GENERIC_DAY',0,1,NULL,'2010-05-18',2829,NULL,38280,NULL),(38672,'GENERIC_DAY',0,2,NULL,'2010-06-16',37881,NULL,38280,NULL),(38673,'GENERIC_DAY',0,1,NULL,'2010-06-15',37885,NULL,38280,NULL),(38674,'GENERIC_DAY',0,1,NULL,'2010-06-17',37885,NULL,38280,NULL),(38675,'GENERIC_DAY',0,2,NULL,'2010-05-24',37885,NULL,38280,NULL),(38676,'GENERIC_DAY',0,1,NULL,'2010-06-16',37883,NULL,38280,NULL),(38677,'GENERIC_DAY',0,1,NULL,'2010-06-09',37885,NULL,38280,NULL),(38678,'GENERIC_DAY',0,1,NULL,'2010-06-08',37885,NULL,38280,NULL),(38679,'GENERIC_DAY',0,2,NULL,'2010-06-08',2829,NULL,38280,NULL),(38680,'GENERIC_DAY',0,2,NULL,'2010-06-10',16060,NULL,38280,NULL),(38681,'GENERIC_DAY',0,2,NULL,'2010-06-17',16060,NULL,38280,NULL),(38682,'GENERIC_DAY',0,0,NULL,'2010-05-30',37885,NULL,38280,NULL),(38683,'GENERIC_DAY',0,2,NULL,'2010-05-21',37878,NULL,38280,NULL),(38684,'GENERIC_DAY',0,0,NULL,'2010-05-26',16060,NULL,38280,NULL),(38685,'GENERIC_DAY',0,2,NULL,'2010-05-27',37878,NULL,38280,NULL),(38686,'GENERIC_DAY',0,0,NULL,'2010-05-22',37883,NULL,38280,NULL),(38687,'GENERIC_DAY',0,0,NULL,'2010-06-06',37885,NULL,38280,NULL),(38688,'GENERIC_DAY',0,1,NULL,'2010-06-03',37885,NULL,38280,NULL),(38689,'GENERIC_DAY',0,1,NULL,'2010-06-10',37881,NULL,38280,NULL),(38690,'GENERIC_DAY',0,0,NULL,'2010-05-30',2829,NULL,38280,NULL),(38691,'GENERIC_DAY',0,2,NULL,'2010-05-31',2829,NULL,38280,NULL),(38692,'GENERIC_DAY',0,2,NULL,'2010-06-09',37878,NULL,38280,NULL),(38693,'GENERIC_DAY',0,0,NULL,'2010-06-15',16060,NULL,38280,NULL),(38694,'GENERIC_DAY',0,0,NULL,'2010-05-24',2829,NULL,38280,NULL),(38695,'GENERIC_DAY',0,0,NULL,'2010-06-12',37885,NULL,38280,NULL),(38696,'GENERIC_DAY',0,2,NULL,'2010-06-16',37878,NULL,38280,NULL),(38697,'GENERIC_DAY',0,2,NULL,'2010-05-26',37883,NULL,38280,NULL),(38698,'GENERIC_DAY',0,0,NULL,'2010-05-24',16060,NULL,38280,NULL),(38699,'GENERIC_DAY',0,0,NULL,'2010-05-31',16060,NULL,38280,NULL),(38700,'GENERIC_DAY',0,1,NULL,'2010-06-17',37883,NULL,38280,NULL),(38701,'GENERIC_DAY',0,0,NULL,'2010-06-01',16060,NULL,38280,NULL),(38702,'GENERIC_DAY',0,1,NULL,'2010-05-20',37883,NULL,38280,NULL),(38703,'GENERIC_DAY',0,1,NULL,'2010-06-09',37883,NULL,38280,NULL),(38704,'GENERIC_DAY',0,2,NULL,'2010-06-11',37881,NULL,38280,NULL),(38705,'GENERIC_DAY',0,0,NULL,'2010-06-13',2829,NULL,38280,NULL),(38706,'GENERIC_DAY',0,1,NULL,'2010-06-04',37885,NULL,38280,NULL),(38707,'GENERIC_DAY',0,2,NULL,'2010-06-18',2829,NULL,38280,NULL),(38708,'GENERIC_DAY',0,1,NULL,'2010-05-19',2829,NULL,38280,NULL),(38709,'GENERIC_DAY',0,0,NULL,'2010-05-28',2829,NULL,38280,NULL),(38710,'GENERIC_DAY',0,0,NULL,'2010-05-23',16060,NULL,38280,NULL),(38711,'GENERIC_DAY',0,0,NULL,'2010-05-30',37881,NULL,38280,NULL),(38712,'GENERIC_DAY',0,1,NULL,'2010-06-02',37883,NULL,38280,NULL),(38713,'GENERIC_DAY',0,0,NULL,'2010-06-12',16060,NULL,38280,NULL),(38714,'GENERIC_DAY',0,2,NULL,'2010-06-14',37878,NULL,38280,NULL),(38715,'GENERIC_DAY',0,2,NULL,'2010-06-07',37878,NULL,38280,NULL),(38716,'GENERIC_DAY',0,0,NULL,'2010-06-05',16060,NULL,38280,NULL),(38717,'GENERIC_DAY',0,2,NULL,'2010-05-25',37883,NULL,38280,NULL),(38718,'GENERIC_DAY',0,0,NULL,'2010-05-26',2829,NULL,38280,NULL),(38719,'GENERIC_DAY',0,0,NULL,'2010-06-13',37885,NULL,38280,NULL),(38720,'GENERIC_DAY',0,2,NULL,'2010-06-04',2829,NULL,38280,NULL),(38721,'GENERIC_DAY',0,0,NULL,'2010-05-27',2829,NULL,38280,NULL),(38722,'GENERIC_DAY',0,1,NULL,'2010-06-01',37885,NULL,38280,NULL),(38723,'GENERIC_DAY',0,2,NULL,'2010-06-02',2829,NULL,38280,NULL),(38724,'GENERIC_DAY',0,2,NULL,'2010-06-18',37881,NULL,38280,NULL),(38725,'GENERIC_DAY',0,2,NULL,'2010-05-25',37885,NULL,38280,NULL),(38726,'GENERIC_DAY',0,0,NULL,'2010-06-05',37878,NULL,38280,NULL),(38727,'GENERIC_DAY',0,2,NULL,'2010-06-10',2829,NULL,38280,NULL),(38728,'GENERIC_DAY',0,0,NULL,'2010-05-21',16060,NULL,38280,NULL),(38729,'GENERIC_DAY',0,2,NULL,'2010-05-21',37883,NULL,38280,NULL),(38730,'GENERIC_DAY',0,0,NULL,'2010-05-29',37878,NULL,38280,NULL),(38731,'GENERIC_DAY',0,1,NULL,'2010-06-16',37885,NULL,38280,NULL),(38732,'GENERIC_DAY',0,0,NULL,'2010-05-29',37883,NULL,38280,NULL),(38733,'GENERIC_DAY',0,2,NULL,'2010-06-09',2829,NULL,38280,NULL),(38734,'GENERIC_DAY',0,7,NULL,'2010-05-19',16060,NULL,38280,NULL),(38735,'GENERIC_DAY',0,0,NULL,'2010-06-13',37881,NULL,38280,NULL),(38736,'GENERIC_DAY',0,1,NULL,'2010-05-31',37883,NULL,38280,NULL),(38737,'GENERIC_DAY',0,0,NULL,'2010-06-07',16060,NULL,38280,NULL),(38738,'GENERIC_DAY',0,7,NULL,'2010-05-18',16060,NULL,38280,NULL),(38739,'GENERIC_DAY',0,0,NULL,'2010-06-14',16060,NULL,38280,NULL),(38740,'GENERIC_DAY',0,0,NULL,'2010-05-30',16060,NULL,38280,NULL),(38741,'GENERIC_DAY',0,2,NULL,'2010-06-15',37878,NULL,38280,NULL),(38742,'GENERIC_DAY',0,2,NULL,'2010-05-21',37885,NULL,38280,NULL),(38743,'GENERIC_DAY',0,1,NULL,'2010-06-07',37883,NULL,38280,NULL),(38744,'GENERIC_DAY',0,2,NULL,'2010-05-31',37881,NULL,38280,NULL),(38745,'GENERIC_DAY',0,1,NULL,'2010-05-31',37885,NULL,38280,NULL),(38746,'GENERIC_DAY',0,2,NULL,'2010-06-18',37878,NULL,38280,NULL),(38747,'GENERIC_DAY',0,0,NULL,'2010-06-06',37881,NULL,38280,NULL),(38748,'GENERIC_DAY',0,1,NULL,'2010-06-10',37883,NULL,38280,NULL),(38749,'GENERIC_DAY',0,0,NULL,'2010-06-05',37885,NULL,38280,NULL),(38750,'GENERIC_DAY',0,0,NULL,'2010-06-13',16060,NULL,38280,NULL),(38751,'GENERIC_DAY',0,0,NULL,'2010-05-29',37881,NULL,38280,NULL);
/*!40000 ALTER TABLE `day_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_resource_allocation`
--

DROP TABLE IF EXISTS `generic_resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_resource_allocation` (
  `RESOURCE_ALLOCATION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RESOURCE_ALLOCATION_ID`),
  KEY `FKF788B34975ED79BA` (`RESOURCE_ALLOCATION_ID`),
  CONSTRAINT `FKF788B34975ED79BA` FOREIGN KEY (`RESOURCE_ALLOCATION_ID`) REFERENCES `ResourceAllocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_resource_allocation`
--

LOCK TABLES `generic_resource_allocation` WRITE;
/*!40000 ALTER TABLE `generic_resource_allocation` DISABLE KEYS */;
INSERT INTO `generic_resource_allocation` VALUES (6262),(12633),(16970),(16971),(19507),(36664),(38280);
/*!40000 ALTER TABLE `generic_resource_allocation` ENABLE KEYS */;
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
INSERT INTO `hibernate_unique_key` VALUES (410);
/*!40000 ALTER TABLE `hibernate_unique_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoursPerDay`
--

DROP TABLE IF EXISTS `hoursPerDay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoursPerDay` (
  `BASE_CALENDAR_ID` bigint(20) NOT NULL,
  `HOURS` int(11) DEFAULT NULL,
  `DAY_ID` int(11) NOT NULL,
  PRIMARY KEY (`BASE_CALENDAR_ID`,`DAY_ID`),
  KEY `FKC001D52EFD5E49BC` (`BASE_CALENDAR_ID`),
  CONSTRAINT `FKC001D52EFD5E49BC` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `CalendarData` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoursPerDay`
--

LOCK TABLES `hoursPerDay` WRITE;
/*!40000 ALTER TABLE `hoursPerDay` DISABLE KEYS */;
INSERT INTO `hoursPerDay` VALUES (101,8,0),(101,8,1),(101,8,2),(101,8,3),(101,8,4),(101,0,5),(101,0,6),(16261,0,0),(16261,0,1),(16261,0,2),(16261,0,4);
/*!40000 ALTER TABLE `hoursPerDay` ENABLE KEYS */;
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
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RESOURCE_ID` (`RESOURCE_ID`),
  KEY `FK7E57469848D21790` (`RESOURCE_ID`),
  CONSTRAINT `FK7E57469848D21790` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `Resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue`
--

LOCK TABLES `limiting_resource_queue` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue` DISABLE KEYS */;
INSERT INTO `limiting_resource_queue` VALUES (1313,1,1112),(1314,1,1114),(20402,2,19999),(20403,2,20001);
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
  KEY `FK5948535285EBB87C` (`destiny_queue_element_id`),
  KEY `FK59485352A44B51E8` (`origin_queue_element_id`),
  CONSTRAINT `FK59485352A44B51E8` FOREIGN KEY (`origin_queue_element_id`) REFERENCES `limiting_resource_queue_element` (`id`),
  CONSTRAINT `FK5948535285EBB87C` FOREIGN KEY (`destiny_queue_element_id`) REFERENCES `limiting_resource_queue_element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue_dependency`
--

LOCK TABLES `limiting_resource_queue_dependency` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue_dependency` DISABLE KEYS */;
INSERT INTO `limiting_resource_queue_dependency` VALUES (4747,1,NULL,4451),(8484,1,7677,8183),(19796,1,NULL,8183),(19797,1,NULL,NULL),(19798,1,19599,19598),(36966,1,4958,19594),(37370,1,37169,37170);
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
  `RESOURCE_ALLOCATION_ID` bigint(20) DEFAULT NULL,
  `LIMITING_RESOURCE_QUEUE_ID` bigint(20) DEFAULT NULL,
  `EARLIER_START_DATE_BECAUSE_OF_GANTT` datetime DEFAULT NULL,
  `CREATION_TIMESTAMP` bigint(20) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `START_HOUR` int(11) DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `END_HOUR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RESOURCE_ALLOCATION_ID` (`RESOURCE_ALLOCATION_ID`),
  KEY `FK1FC5F45575ED79BA` (`RESOURCE_ALLOCATION_ID`),
  KEY `FK1FC5F455BD2209E8` (`LIMITING_RESOURCE_QUEUE_ID`),
  CONSTRAINT `FK1FC5F455BD2209E8` FOREIGN KEY (`LIMITING_RESOURCE_QUEUE_ID`) REFERENCES `limiting_resource_queue` (`id`),
  CONSTRAINT `FK1FC5F45575ED79BA` FOREIGN KEY (`RESOURCE_ALLOCATION_ID`) REFERENCES `ResourceAllocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limiting_resource_queue_element`
--

LOCK TABLES `limiting_resource_queue_element` WRITE;
/*!40000 ALTER TABLE `limiting_resource_queue_element` DISABLE KEYS */;
INSERT INTO `limiting_resource_queue_element` VALUES (4451,16,4350,NULL,'2010-06-03 00:00:00',1273739524048,NULL,0,NULL,0),(4958,12,4857,NULL,'2010-05-14 00:00:00',1273745621257,NULL,0,NULL,0),(5555,1,5454,1314,'2010-05-12 10:43:45',1273749756784,'2010-06-02',4,'2010-08-28',8),(6363,8,6262,20402,'2010-05-18 00:00:00',1273766793165,'2010-05-18',8,'2010-06-03',4),(7677,12,7383,1313,'2010-06-19 00:00:00',1273769118483,'2010-06-21',8,'2010-07-07',4),(7678,10,7384,1314,'2010-06-19 00:00:00',1273769139867,'2010-10-20',4,'2010-10-28',6),(8183,11,8082,1313,'2010-09-15 00:00:00',1273823352882,'2010-09-15',8,'2010-10-11',6),(12938,5,12639,1313,'2010-05-29 00:00:00',1273836769262,'2010-07-07',4,'2010-09-15',4),(19594,3,19493,1314,'2010-06-02 00:00:00',1274088503014,'2010-06-02',4,'2010-06-02',4),(19595,4,19494,20403,'2010-09-15 00:00:00',1274091331360,'2010-09-15',8,'2010-10-19',8),(19596,3,19495,NULL,'2010-08-30 00:00:00',1274091314525,NULL,0,NULL,0),(19598,1,19497,20403,'2010-05-15 10:10:50',1274091488340,'2010-05-17',8,'2010-08-11',4),(19599,2,19498,NULL,'2010-05-15 10:10:50',1274091471633,NULL,0,NULL,0),(37169,2,37068,1314,'2010-05-17 18:20:27',1274181920148,'2010-09-23',2,'2010-10-20',4),(37170,1,37069,1314,'2010-07-15 00:00:00',1274181885875,'2010-08-30',8,'2010-09-23',6);
/*!40000 ALTER TABLE `limiting_resource_queue_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_configuration_unit_required_criterions`
--

DROP TABLE IF EXISTS `machine_configuration_unit_required_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_configuration_unit_required_criterions` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `CRITERION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`CRITERION_ID`),
  KEY `FK95548D7875999A91` (`id`),
  KEY `FK95548D7861F02C44` (`CRITERION_ID`),
  CONSTRAINT `FK95548D7861F02C44` FOREIGN KEY (`CRITERION_ID`) REFERENCES `Criterion` (`id`),
  CONSTRAINT `FK95548D7875999A91` FOREIGN KEY (`id`) REFERENCES `machineworkersconfigurationunit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_configuration_unit_required_criterions`
--

LOCK TABLES `machine_configuration_unit_required_criterions` WRITE;
/*!40000 ALTER TABLE `machine_configuration_unit_required_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_configuration_unit_required_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machineworkerassignment`
--

DROP TABLE IF EXISTS `machineworkerassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machineworkerassignment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `finishDate` datetime DEFAULT NULL,
  `configuration_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD7D7EB129BEBCF10` (`worker_id`),
  KEY `FKD7D7EB1286B2DE7A` (`configuration_id`),
  CONSTRAINT `FKD7D7EB1286B2DE7A` FOREIGN KEY (`configuration_id`) REFERENCES `machineworkersconfigurationunit` (`id`),
  CONSTRAINT `FKD7D7EB129BEBCF10` FOREIGN KEY (`worker_id`) REFERENCES `Worker` (`WORKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machineworkerassignment`
--

LOCK TABLES `machineworkerassignment` WRITE;
/*!40000 ALTER TABLE `machineworkerassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `machineworkerassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machineworkersconfigurationunit`
--

DROP TABLE IF EXISTS `machineworkersconfigurationunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machineworkersconfigurationunit` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alpha` decimal(19,2) NOT NULL,
  `machine` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK401DC6ACFFEB5538` (`machine`),
  CONSTRAINT `FK401DC6ACFFEB5538` FOREIGN KEY (`machine`) REFERENCES `Machine` (`MACHINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machineworkersconfigurationunit`
--

LOCK TABLES `machineworkersconfigurationunit` WRITE;
/*!40000 ALTER TABLE `machineworkersconfigurationunit` DISABLE KEYS */;
/*!40000 ALTER TABLE `machineworkersconfigurationunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `ORDERELEMENTID` bigint(20) NOT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `dependenciesConstraintsHavePriority` bit(1) DEFAULT NULL,
  `codeAutogenerated` bit(1) DEFAULT NULL,
  `lastOrderElementSequenceCode` int(11) DEFAULT NULL,
  `workBudget` decimal(19,2) DEFAULT NULL,
  `materialsBudget` decimal(19,2) DEFAULT NULL,
  `totalHours` int(11) DEFAULT NULL,
  `customerReference` varchar(255) DEFAULT NULL,
  `externalCode` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `customer` bigint(20) DEFAULT NULL,
  `BASE_CALENDAR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDERELEMENTID`),
  KEY `FK75A2F39DF82680F8` (`ORDERELEMENTID`),
  KEY `FK75A2F39DA44ABEE3` (`BASE_CALENDAR_ID`),
  KEY `FK75A2F39D4EC080CF` (`customer`),
  CONSTRAINT `FK75A2F39D4EC080CF` FOREIGN KEY (`customer`) REFERENCES `EXTERNAL_COMPANY` (`id`),
  CONSTRAINT `FK75A2F39DA44ABEE3` FOREIGN KEY (`BASE_CALENDAR_ID`) REFERENCES `BaseCalendar` (`id`),
  CONSTRAINT `FK75A2F39DF82680F8` FOREIGN KEY (`ORDERELEMENTID`) REFERENCES `OrderLineGroup` (`ORDERELEMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1415,NULL,NULL,'',7,'0.00','0.00',708,NULL,NULL,0,NULL,1),(2324,NULL,NULL,'',3,'0.00','0.00',1200,NULL,NULL,0,NULL,1),(6465,NULL,NULL,'',32,'0.00','0.00',1100,NULL,NULL,0,NULL,1),(12121,NULL,NULL,'',2,'0.00','0.00',1400,NULL,NULL,0,NULL,1),(15356,NULL,NULL,'',5,'0.00','0.00',8700,NULL,NULL,0,NULL,1),(15363,NULL,NULL,'',16,'0.00','0.00',1400,NULL,NULL,0,NULL,1),(20606,NULL,NULL,'',5,'0.00','0.00',240,NULL,NULL,0,NULL,1),(20613,NULL,NULL,'',8,'0.00','0.00',750,NULL,NULL,0,NULL,1),(20640,NULL,NULL,'',4,'0.00','0.00',670,NULL,NULL,0,NULL,1),(35756,NULL,NULL,'',11,'0.00','0.00',700,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_resource_allocation`
--

DROP TABLE IF EXISTS `specific_resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_resource_allocation` (
  `RESOURCE_ALLOCATION_ID` bigint(20) NOT NULL,
  `resource` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ALLOCATION_ID`),
  KEY `FKF0E8572475ED79BA` (`RESOURCE_ALLOCATION_ID`),
  KEY `FKF0E85724EAE850B2` (`resource`),
  CONSTRAINT `FKF0E85724EAE850B2` FOREIGN KEY (`resource`) REFERENCES `Resource` (`id`),
  CONSTRAINT `FKF0E8572475ED79BA` FOREIGN KEY (`RESOURCE_ALLOCATION_ID`) REFERENCES `ResourceAllocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_resource_allocation`
--

LOCK TABLES `specific_resource_allocation` WRITE;
/*!40000 ALTER TABLE `specific_resource_allocation` DISABLE KEYS */;
INSERT INTO `specific_resource_allocation` VALUES (4350,1112),(7383,1112),(8082,1112),(12639,1112),(4857,1114),(5454,1114),(7384,1114),(19493,1114),(37068,1114),(37069,1114),(3233,2829),(6061,2829),(7385,2829),(7387,2829),(7386,6970),(19495,19999),(19498,19999),(19494,20001),(19497,20001);
/*!40000 ALTER TABLE `specific_resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretches`
--

DROP TABLE IF EXISTS `stretches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretches` (
  `ASSIGNMENT_FUNCTION_ID` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `lengthPercentage` decimal(19,2) NOT NULL,
  `amountWorkPercentage` decimal(19,2) NOT NULL,
  `STRETCH_POSITION` int(11) NOT NULL,
  PRIMARY KEY (`ASSIGNMENT_FUNCTION_ID`,`STRETCH_POSITION`),
  KEY `FKEE374673AE0677B8` (`ASSIGNMENT_FUNCTION_ID`),
  CONSTRAINT `FKEE374673AE0677B8` FOREIGN KEY (`ASSIGNMENT_FUNCTION_ID`) REFERENCES `StretchesFunction` (`ASSIGNMENT_FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretches`
--

LOCK TABLES `stretches` WRITE;
/*!40000 ALTER TABLE `stretches` DISABLE KEYS */;
/*!40000 ALTER TABLE `stretches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_source_hours_groups`
--

DROP TABLE IF EXISTS `task_source_hours_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_source_hours_groups` (
  `TASK_SOURCE_ID` bigint(20) NOT NULL,
  `HOURS_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TASK_SOURCE_ID`,`HOURS_GROUP_ID`),
  KEY `FKA01FE4EEE036CFED` (`HOURS_GROUP_ID`),
  KEY `FKA01FE4EE8C80CCB7` (`TASK_SOURCE_ID`),
  CONSTRAINT `FKA01FE4EE8C80CCB7` FOREIGN KEY (`TASK_SOURCE_ID`) REFERENCES `TaskSource` (`id`),
  CONSTRAINT `FKA01FE4EEE036CFED` FOREIGN KEY (`HOURS_GROUP_ID`) REFERENCES `HoursGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_source_hours_groups`
--

LOCK TABLES `task_source_hours_groups` WRITE;
/*!40000 ALTER TABLE `task_source_hours_groups` DISABLE KEYS */;
INSERT INTO `task_source_hours_groups` VALUES (1717,1616),(1718,1617),(1721,1618),(1722,1619),(2626,2525),(5353,5252),(5354,5253),(5959,5858),(5960,5859),(6767,6666),(6768,6667),(6769,6668),(6772,6669),(6773,6670),(6774,6671),(6775,6672),(6776,6673),(6777,6674),(12423,12322),(12424,12323),(15660,15555),(15661,15556),(15662,15557),(15663,15558),(15664,15559),(15666,15560),(15667,15561),(15668,15562),(15669,15563),(15670,15564),(15672,15565),(15673,15566),(15674,15567),(15675,15568),(15676,15569),(15677,15570),(15679,15571),(15680,15572),(15681,15573),(20907,19898),(20908,19899),(20909,19900),(20910,19901),(20913,19902),(20914,19903),(20915,19904),(20916,19905),(20919,19906),(20920,19907),(20921,19908),(20923,19909),(20924,19910),(20925,19911),(20926,19912),(36057,35956),(36065,35958),(36066,35962),(36067,35963),(36068,35964);
/*!40000 ALTER TABLE `task_source_hours_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-26  9:03:40
