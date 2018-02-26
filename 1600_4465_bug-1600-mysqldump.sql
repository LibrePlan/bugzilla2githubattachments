-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: libreplandev
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.3

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('add scheduling mode','ogonzalez','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',323,'EXECUTED','3:8a4ed0c0131906744a85a38278180e13','Add Column, Update Data','column for org.libreplan.business.orders.entities.Order.schedulingMode',NULL,'2.0.5'),('add-application-language','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',358,'EXECUTED','3:f451e552cb7903c699c88ecde02e85c6','Add Column','Add new column to store the language of application for this user',NULL,'2.0.5'),('add-budget-column-to-order_line','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',400,'EXECUTED','3:68630e28c83f5f0b24ffd8378526d2a7','Add Column, Add Not-Null Constraint, Add Default Value','add budget column to order_line',NULL,'2.0.5'),('add-budget-column-to-order_line_template','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',401,'EXECUTED','3:0b8337c5f55c7c2d0159facda7ca80ef','Add Column, Add Not-Null Constraint, Add Default Value','add budget column to order_line_template',NULL,'2.0.5'),('add-column-progress_all_by_num_hours-in-planning_data','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',362,'EXECUTED','3:9410a670cf6cccd21638c8eddb6b8b36','Add Column','Add column progress_all_by_num_hours in planning_data',NULL,'2.0.5'),('add-columns-first-and-last-timesheet_date-to-sum_charged_effort','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',430,'EXECUTED','3:44643d4a95daa8bfb8eb87350ca09b9c','Add Column (x2)','Add columns first_timesheet_date and last_timesheet_date to\n            sum_charged_effort table',NULL,'2.0.5'),('add-company-logo-url-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',322,'EXECUTED','3:009cd5341d49b5415bf7ec539de24c79','Add Column, Update Data','Add new column with configuration setting',NULL,'2.0.5'),('add-delivering-date-column-to-order-entity','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',388,'EXECUTED','3:5ea1e3d168533ccd24099c6ac95136c0','Add Column','Add new delivering date column to order',NULL,'2.0.5'),('add-effort-duration-to-task-and-milestone','mrego','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',340,'EXECUTED','3:818f79da6b908a1a7c579e60deb53e26','Add Column (x2), Add Default Value (x2)','constraintDate attribute in class TaskPositionConstraint has been changed to IntraDayDate.\n            It is needed to add some columns to store EffortDuration in Task and TaskMilestone.',NULL,'2.0.5'),('add-foreign-key-sum_charged_effort_id-in-order_element','dmel','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',371,'EXECUTED','3:a8fa898f9cfaa1afa3afbab4c1c9f82b','Add Foreign Key Constraint','',NULL,'2.0.5'),('add-intended_non_consolidated_effort','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',339,'EXECUTED','3:e7ac605310143d646b9c8fd0de19c51a','Add Column, Add Default Value, Custom SQL','',NULL,'2.0.5'),('add-intended_resources_per_day-column-to-resource-allocation','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',337,'EXECUTED','3:0f818026f55b70d7907ff07b6d6c7f1d','Add Column, Custom SQL','add intended_resources_per_day column to resource-allocation',NULL,'2.0.5'),('add-max_users-and-max_resources-columns-to-configuration','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',429,'EXECUTED','3:e098fa833f01deb6447f715e6c3dd5ff','Add Column (x2), Update Data (x2)','Add max_users and max_resources columns to configuration',NULL,'2.0.5'),('add-monthly_timesheets_type_of_work_hours-to-configuration','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',413,'EXECUTED','3:1fba4f4fa3f9838dcecc9f4c3f03adde','Add Column, Add Foreign Key Constraint','Add new column monthly_timesheets_type_of_work_hours to\n            configuration table.',NULL,'2.0.5'),('add-new-column-allow_to_gather_usage_stats_enabled','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',395,'EXECUTED','3:93c54c45c29d479faa98e6db1af06591','Add Column, Add Default Value, Add Not-Null Constraint','Add new column allow_to_gather_usage_stats_enabled with default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_admin_password','smontes','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',333,'EXECUTED','3:f1a662e7435430892ac7d6cf903c4ce8','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_admin_password with default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_hresources_password','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:13',422,'EXECUTED','3:0d70382a0e68da8f6c7835212988162b','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_hresources_password with\n            default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_manager_password','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:13',421,'EXECUTED','3:6f3d2474a8785e6a221a0e2b3f098a73','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_manager_password with\n            default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_outsourcing_password','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:13',423,'EXECUTED','3:f72b604280d98a102dc357ad9ef71b26','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_outsourcing_password with\n            default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_reports_password','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:13',424,'EXECUTED','3:f4fdaac87e8d1d2246ac482544268dc8','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_reports_password with\n            default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_user_password','smontes','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',334,'EXECUTED','3:cf1274e98ff8796a0f4e3527004c8cd0','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_user_password with default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_wsreader_password','smontes','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',335,'EXECUTED','3:90bb4041ae144714e7bc703ee73d70c1','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_wsreader_password with default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_wssubcontracting_password','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',415,'EXECUTED','3:013b7f1448a1110847cf286f1413f035','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_wssubcontracting_password with\n            default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-changed_default_wswriter_password','smontes','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',336,'EXECUTED','3:124f7fbb425a88220c72c315639a546e','Add Column, Add Default Value, Add Not-Null Constraint','Add new column changed_default_wswriter_password with default value FALSE to configuration table',NULL,'2.0.5'),('add-new-column-check_new_version_enabled','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',394,'EXECUTED','3:8e46dd07efca106657d62ade635bbf03','Add Column, Add Default Value, Add Not-Null Constraint','Add new column check_new_version_enabled with default value TRUE to configuration table',NULL,'2.0.5'),('add-new-column-enabled-autocomplete-login','smontes','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',357,'EXECUTED','3:0542da97fbff41b95f9cf5ef10ffa322','Add Column, Add Default Value, Add Not-Null Constraint','Add new column enabled_autocomplete_login with default value TRUE to configuration table',NULL,'2.0.5'),('add-new-column-finished-to-work_report_line','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',432,'EXECUTED','3:4179c949aced25d73e640b35729f5dc3','Add Column, Add Default Value, Add Not-Null Constraint','Add new column finished with default value FALSE to\n            work_report_line table.',NULL,'2.0.5'),('add-new-column-finished_timesheets-to-sum_charged_effort','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:14',433,'EXECUTED','3:2e0afbe29878247b314daf44d13e7953','Add Column, Add Default Value, Add Not-Null Constraint','Add new column finished_timesheets with default value FALSE to\n            sum_charged_effort table.',NULL,'2.0.5'),('add-new-column-generate-code-for-expense-sheets','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',406,'EXECUTED','3:cad60515a7450740e2582ae1ce815885','Add Column, Add Default Value, Add Not-Null Constraint','Add new column to generate the code for expense sheet in configuration table',NULL,'2.0.5'),('add-new-column-ldap-auth-enabled','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',348,'EXECUTED','3:979a11f6d147433ec84e6165927683fa','Add Column','Add new column to store ldap authentication enabled',NULL,'2.0.5'),('add-new-column-ldap-base','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:07',343,'EXECUTED','3:be1cce8488649e3d266a5df219713071','Add Column','Add new column to store ldap base',NULL,'2.0.5'),('add-new-column-ldap-host','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:07',341,'EXECUTED','3:7984328274b0af25bf454a71f709a0dc','Add Column','Add new column to store ldap host',NULL,'2.0.5'),('add-new-column-ldap-password','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:07',345,'EXECUTED','3:22761f7b110aec44930935cb79f179d5','Add Column','Add new column to store ldap password',NULL,'2.0.5'),('add-new-column-ldap-port','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:07',342,'EXECUTED','3:a698fd66dc9b58c8e7df0ffafc6f7d1c','Add Column','Add new column to store ldap port',NULL,'2.0.5'),('add-new-column-ldap-role-strategy','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',375,'EXECUTED','3:3145034f8fd26477ae1fac7da835a43e','Add Column, Add Default Value, Add Not-Null Constraint','Add new column to store ldap role strategy',NULL,'2.0.5'),('add-new-column-ldap-save-password-db','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',347,'EXECUTED','3:b4447892b37ee903664f9b5bd54e7a2e','Add Column','Add new column to store ldap passwords in database',NULL,'2.0.5'),('add-new-column-ldap-save-roles-db','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',354,'EXECUTED','3:e7fc821091b4d96786edf2aa98308f3b','Add Column, Add Default Value, Add Not-Null Constraint','Add new column to store ldap roles in database',NULL,'2.0.5'),('add-new-column-ldap-search-query','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',356,'EXECUTED','3:8e994641ada47323406f65d515ff00a0','Add Column','Add new column to store ldap role search query',NULL,'2.0.5'),('add-new-column-ldap-userdn','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:07',344,'EXECUTED','3:c4c93711bd374e215a65f6f45b6a5f44','Add Column','Add new column to store ldap userdn',NULL,'2.0.5'),('add-new-column-ldap-userid','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',346,'EXECUTED','3:b628b315f6a3d2266cb6d280f9525f5f','Add Column','Add new column to store ldap userid',NULL,'2.0.5'),('add-new-column-navalplan-user','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',349,'EXECUTED','3:76c2b18d10554416d9ca9055d3c2e768','Add Column','Add new column to store if it is a navalplan user',NULL,'2.0.5'),('add-new-column-personal-to-expense_sheet-table','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',414,'EXECUTED','3:10bc5bda8b237a316785be725d7be1e3','Add Column, Add Default Value, Add Not-Null Constraint','Add new column personal with default value FALSE to expense_sheet\n            table',NULL,'2.0.5'),('add-new-column-read_only-to-advance_type','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',431,'EXECUTED','3:f188be8e7cb36ffc378ee1bbb1efe4c3','Add Column, Add Default Value, Add Not-Null Constraint','Add new column read_only with default value FALSE to advance_type\n            table.',NULL,'2.0.5'),('add-new-column-updated_from_timesheets-to-task_element','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:14',434,'EXECUTED','3:8e277ed572a72c08c2d637c171f75faa','Add Column, Add Default Value, Add Not-Null Constraint','Add new column updated_from_timesheets with default value FALSE to\n            task_element table.',NULL,'2.0.5'),('add-new-columns-for-currency-in-configuration','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',410,'EXECUTED','3:c0e2f3cc0bd28a4cfb77c91e32b8f72e','Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint','Add new columns for currency in configuration table',NULL,'2.0.5'),('add-new-fields','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',360,'EXECUTED','3:6950443e7dca6f2af1e7d095abde62bc','Add Column (x2)','Add new column to store the first and last name for this user',NULL,'2.0.5'),('add-personal_timesheets_periodicity-column-to-configuration','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',427,'EXECUTED','3:bcb66fc0ee64a06c7aeee7df6a8c64d1','Add Column, Update Data','Add personal_timesheets_periodicity column to configuration',NULL,'2.0.5'),('add-relationship-between-worker-and-user','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',412,'EXECUTED','3:c1327b421dab02ba46646e25ce3033f0','Add Column, Add Unique Constraint, Add Foreign Key Constraint','Add column and constraints needed for relationship between worker and user',NULL,'2.0.5'),('add-scenarios-enabled-configuration-setting','ltilve','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',325,'EXECUTED','3:53d99bb420a0c55c8eaa9389e3fc0ed5','Add Column, Update Data','Add new column with scenarios visibility flag',NULL,'2.0.5'),('add-seconds_planning_warning-column-to-configuration','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:14',437,'EXECUTED','3:812805ebd72a401ecab1d002ae7eff36','Add Column, Update Data, Add Not-Null Constraint','Add seconds_planning_warning column to configuration',NULL,'2.0.5'),('add-subcontracted-task-data','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',390,'EXECUTED','3:1a4b3b7369aea7ffff6b1cc763ee07dd','Add Column','Add the column subcontracted_task_id to maintain the relation',NULL,'2.0.5'),('add-task_end_date_effort_duration-to-consolidated_value','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',391,'EXECUTED','3:4ffcc289b81bfbfa1d43466ad34d9705','Add Column, Add Default Value','taskEndDate attribute in class ConsolidatedValue has been changed to IntraDayDate.\n            It is needed to add some columns to store EffortDuration in ConsolidatedValue.',NULL,'2.0.5'),('add-version-to-planning-data','ogonzalez','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',373,'EXECUTED','3:ae9dca1ca9cb3556cf5efdca689b8fc1','Add Column','',NULL,'2.0.5'),('by_default_weekends_are_not_overassignable','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',331,'EXECUTED','3:8ddf0ca2b0fc243475ee2f4c21172565','Custom SQL','By default weekends are not over assignable',NULL,'2.0.5'),('change-column-description-in-expense_sheet_to-text-in-mysql','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',404,'EXECUTED','3:e967aca317adba1c390447b45ac080e8','Custom SQL','Change column description in expense_sheet to TEXT in MySQL.\n            Because of using modifyDataType convert the column in LONGTEXT and\n            this is causing some problems with Hibernate mapping.',NULL,'2.0.5'),('change-column-description-in-to-text-in-mysql','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',399,'EXECUTED','3:a93e21ce6c8fdb8e671095ec5462c952','Custom SQL (x2)','Change column description in order_element and\n            order_element_template to TEXT in MySQL.\n            Because of using modifyDataType convert the column in LONGTEXT and\n            this is causing some problems with Hibernate mapping.',NULL,'2.0.5'),('change-column-notes-in-task_element-to-text-in-mysql','jaragunde','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',425,'EXECUTED','3:004388b31a54d5b8f0f97f21724c3a5b','Custom SQL','Change column notes in task_element to TEXT in MySQL.',NULL,'2.0.5'),('change-mapping-order-element-and-sum-charged-effort-mysql','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',402,'EXECUTED','3:a07c3ef3a94bf9762d77dedb024ce7c7','Add Column, Custom SQL (x3), Add Foreign Key Constraint, Drop Foreign Key Constraint, Drop Column','Change mapping between OrderElement and SumChargedEffort in PostgreSQL',NULL,'2.0.5'),('change-navalplan_user-to-libreplan_user-in-user_table','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',374,'EXECUTED','3:82c71f38665f14d5d8ef9391a5c2487d','Rename Column','Changing navalplan_user to libreplan_user in user_table',NULL,'2.0.5'),('change-numhours-to-effort-in-work-report-lines','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',365,'EXECUTED','3:824cfe1ec43c490e63bf2d8316f1255e','Rename Column','Changing work_report_line numHours to effort',NULL,'2.0.5'),('change-original-total-assignment-to-use-effort-duration','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:07',338,'EXECUTED','3:e29e39577cdd5015b9be6999d8310544','Add Column, Add Default Value, Custom SQL, Drop Column','rename original_total_assignment to intended_total_assignment and now it\'s interpreted as an EffortDuration',NULL,'2.0.5'),('change-sum_charged_hours-to-sum_charged_effort','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',367,'EXECUTED','3:202833e32d386f5a3edf903b2d5a21b4','Rename Table, Rename Column (x2)','Changing sum_charged_hours to sum_charged_effort',NULL,'2.0.5'),('change-sum_of_hours_allocated-to-sum_of_assigned_effort','jaragunde','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',392,'EXECUTED','3:075a1a017c4cac0b0480a84f3a539655','Rename Column','Changing sum_of_hours_allocated to sum_of_assigned_effort',NULL,'2.0.5'),('change-types-start-finish-date-criterion-satisfaction','ogonzalez','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',326,'EXECUTED','3:93527c263e394c3960738fc2e9734c4c','Modify data type (x2)','Change types of start and finish date to date for criterion satisfaction table',NULL,'2.0.5'),('create-new-table-matching-roles','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',355,'EXECUTED','3:5afc1ada9ec4ae6bfd66368c2512e145','Create Table, Add Foreign Key Constraint, Add Column (x2)','Add new column to store ldap role property',NULL,'2.0.5'),('create-table-manual_function','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',364,'EXECUTED','3:aac963ac8a7a63814472c50edf8b367a','Create Table, Add Foreign Key Constraint','',NULL,'2.0.5'),('create3-table-sum-expenses','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',409,'EXECUTED','3:5d50ee6bcc8395686dc88683de0c94f7','Create Table, Add Foreign Key Constraint','creation table sum_expenses',NULL,'2.0.5'),('creation-deadline-communication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',387,'EXECUTED','3:07ef049e78ecd250d56a88850bdd5250','Create Table','',NULL,'2.0.5'),('creation-subcontractor-deliver-date','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',389,'EXECUTED','3:8d41b20b896bae55febcc7ab03daff51','Create Table','',NULL,'2.0.5'),('creation-table-expense-sheet','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',403,'EXECUTED','3:58560df3b8bda44b8057b7538e66c15d','Create Table','',NULL,'2.0.5'),('creation-table-expense-sheet-line','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',405,'EXECUTED','3:c07a2ad8a9e8c277e13bd92806e1414e','Create Table, Add Foreign Key Constraint (x3)','',NULL,'2.0.5'),('database-creation-table-end-date-communication-to-customer','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',396,'EXECUTED','3:1a860a9a519552f494435a180819a216','Create Table','',NULL,'2.0.5'),('delete-constraint-not-null-user-password','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',350,'EXECUTED','3:0470d6d460842219443027cdb633232c','Drop Not-Null Constraint','Delete constraint not null for user password',NULL,'2.0.5'),('drop-column-changed_default_user_password-in-configuration','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',420,'EXECUTED','3:2468aba8b41e0534a2b163e860dea252','Drop Column','Drop column code in configuration table',NULL,'2.0.5'),('drop-column-date-in-stretches-table','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',372,'EXECUTED','3:e0ed365c168583ff5c4c81c9ac79d644','Drop Column','',NULL,'2.0.5'),('drop-foreign-key-sum_charged_hours_id-in-order_element','dmel','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',369,'EXECUTED','3:288d757a697e34248fbb5dab4177c4a0','Drop Foreign Key Constraint','',NULL,'2.0.5'),('drop-unique-constraint-code-in-order_element','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:14',436,'EXECUTED','3:a4fafb8fe670f6e03b1fe0aab68eeefe','Drop Unique Constraint','Drop unique constraint for code in order_element table',NULL,'2.0.5'),('initial-database-creation-1','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',1,'EXECUTED','3:0819191bfc79c85258e53388e6c3a269','Create Table','',NULL,'2.0.5'),('initial-database-creation-10','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',10,'EXECUTED','3:0c72c8c2330c2408a6b079239c401a91','Create Table','',NULL,'2.0.5'),('initial-database-creation-100','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',100,'EXECUTED','3:bbbcbaf05cf76c8236d9137a4a7a25ec','Create Table','',NULL,'2.0.5'),('initial-database-creation-101','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',101,'EXECUTED','3:15f1e5f6e1f7c3308b084e536e88b9b8','Create Table','',NULL,'2.0.5'),('initial-database-creation-102','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',102,'EXECUTED','3:69b1aeed86840d511ac06119ad1f3c2a','Create Table','',NULL,'2.0.5'),('initial-database-creation-103','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',103,'EXECUTED','3:57d3f2fd8967dfd691fd95d30fb1c134','Create Table','',NULL,'2.0.5'),('initial-database-creation-104','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',104,'EXECUTED','3:0e57f86b004bedba6c607c8d2c566164','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-105','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',105,'EXECUTED','3:55a89da076a5b87ce5e49e1db3ed3fb9','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-106','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',106,'EXECUTED','3:4db964219e3dde449c0a54d58d204a7b','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-107','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',107,'EXECUTED','3:0d50d294d4db44aed32f8c909114645d','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-108','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',108,'EXECUTED','3:9c39ac8c3d6ebc758e69da66cfc20283','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-109','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',109,'EXECUTED','3:254739c105dc46829b4019e6cd4daa8e','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-11','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',11,'EXECUTED','3:30ecc1c237e1c3c3db800537ffa8883d','Create Table','',NULL,'2.0.5'),('initial-database-creation-110','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',110,'EXECUTED','3:330cbde32db56aa70e52784794b743ff','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-111','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',111,'EXECUTED','3:39d0f5be8bc00a3752b5f49dd92866de','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-112','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',112,'EXECUTED','3:005cd1ac6366225c7124eb995c790329','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-113','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',113,'EXECUTED','3:aa9ef6bec758b8fef0d7f58d652f23ed','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-114','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',114,'EXECUTED','3:57037ae27d15fb149b2b18b70e3ac640','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-115','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',115,'EXECUTED','3:9a325bc706e5f056e25b5029c144c5d8','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-116','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',116,'EXECUTED','3:f5bef61b4276a1bf815b80abfbbdd0dd','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-117','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',117,'EXECUTED','3:7eff22e0b4befe8f4c445f1c5a58a15e','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-118','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',118,'EXECUTED','3:dadfa8f8caf1ae02cfc16ecbed0c8b90','Add Primary Key','',NULL,'2.0.5'),('initial-database-creation-119','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',119,'EXECUTED','3:138d0588ac80f0a920e484db36f4e97d','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-12','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',12,'EXECUTED','3:f3c4e20ee90e3380f608f73bd0bbb630','Create Table','',NULL,'2.0.5'),('initial-database-creation-120','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',120,'EXECUTED','3:2a81f473aa411fe1bf94ff891f950f05','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-121','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',121,'EXECUTED','3:465b67c4800169a5ad1a1fa4cf9937ce','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-122','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',122,'EXECUTED','3:d9da052c7f29fb3f76a2a4056af176bd','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-123','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',123,'EXECUTED','3:7ebb4272b707b682e405cb30ebb3fccb','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-124','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',124,'EXECUTED','3:360b5d5226fa5eb0d62b8531c2812a05','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-125','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',125,'EXECUTED','3:963fdb094cb961a23659f3e19a1ddde3','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-126','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:55',126,'EXECUTED','3:b20bb3c187e6488863f9d5481665fdac','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-127','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',127,'EXECUTED','3:f3035f410a920573b57eb459d1bcd6b1','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-128','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',128,'EXECUTED','3:ca1cdff9e1a997ff2c7b285e84221ab3','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-129','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',129,'EXECUTED','3:b475e7347003735620c2366fe038ee40','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-13','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',13,'EXECUTED','3:aaaa113557606faf71ee9f5ee1df07ce','Create Table','',NULL,'2.0.5'),('initial-database-creation-130','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',130,'EXECUTED','3:5523e28282da63951996a88d29635632','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-131','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',131,'EXECUTED','3:484e71ddda004fcbb6f56b3a1df07c12','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-132','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',132,'EXECUTED','3:750f465a29368e3c472c7717368e5315','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-133','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',133,'EXECUTED','3:ed11a2642a9063cae1be4ee314990279','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-134','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',134,'EXECUTED','3:632199e3f5e02d7b644fef85e7c7a148','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-135','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',135,'EXECUTED','3:f6136a87270d6999c38c78c5a4507ba0','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-136','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',136,'EXECUTED','3:3b8cdb7c8a87aded69e76f1127d93338','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-137','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',137,'EXECUTED','3:f21de5aaf5812d3b53ff6ba37c500419','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-138','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',138,'EXECUTED','3:212ee29342faa1bb2b4a50cfdfdf9a78','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-139','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',139,'EXECUTED','3:c1cd1a61a496daaf1bc3e941f84aa781','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-14','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',14,'EXECUTED','3:54c846355565319d7d50bd78f4f569bb','Create Table','',NULL,'2.0.5'),('initial-database-creation-140','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',140,'EXECUTED','3:d5266cebc05f66e670752fd599970deb','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-141','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:56',141,'EXECUTED','3:1846e834301cbacca345ad1d30c97783','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-142','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',142,'EXECUTED','3:02dd707d2304800fa3353b76b4b14a79','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-143','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',143,'EXECUTED','3:c7d786a54bd2744456d86331287eaf88','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-144','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',144,'EXECUTED','3:d83e1d31be4d2a88a30cef280323dc14','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-145','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',145,'EXECUTED','3:2c8d1d5abd94c1f1b77b812e5a218703','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-146','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',146,'EXECUTED','3:98959c39111d467dbaef246b4e77c7d4','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-147','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',147,'EXECUTED','3:2f5b3db90f5fe8d7166b8698732d89ee','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-148','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',148,'EXECUTED','3:b6ab8ac7897d485ec2c01795fdbacba6','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-149','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',149,'EXECUTED','3:4621bf17b5d622b52e70ee84a2720ce4','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-15','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',15,'EXECUTED','3:206376e864171d400ce1602f7ef53d49','Create Table','',NULL,'2.0.5'),('initial-database-creation-150','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',150,'EXECUTED','3:d706f00de9bf475742860188e15d7b41','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-151','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',151,'EXECUTED','3:003b820bd40132476357aae25ba7d50b','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-152','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',152,'EXECUTED','3:cbe9e0b14bac88a7b895d8bc4c4777d7','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-153','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',153,'EXECUTED','3:38dc59e34869bc2425c7c820ba45cb9b','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-154','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',154,'EXECUTED','3:1822fb3caf8d43038c67a53fdb75e432','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-155','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',155,'EXECUTED','3:8416952db331ffa2dd27dc4f5734036c','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-156','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:57',156,'EXECUTED','3:4c2b2e5a5a4ee0175cab19c8b6ee084c','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-157','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',157,'EXECUTED','3:c5bf072f2de5890c8b3e22c07577f5ad','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-158','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',158,'EXECUTED','3:61b84144638971ed2b9f8a2a0fb1484f','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-159','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',159,'EXECUTED','3:edef41963c0d8e8d51ad15aa7a757420','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-16','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',16,'EXECUTED','3:cf757d69a753e856b6342f679cff9fac','Create Table','',NULL,'2.0.5'),('initial-database-creation-160','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',160,'EXECUTED','3:6d94d16cf714dd8872660b484e632513','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-161','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',161,'EXECUTED','3:c47020da3e40d9b6239153776affab17','Add Unique Constraint','',NULL,'2.0.5'),('initial-database-creation-162','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',162,'EXECUTED','3:8c1de34a4070d7a104ef5595ff365355','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-163','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',163,'EXECUTED','3:00c8bf9c83805a10ad1abbfe6cabdba8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-164','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',164,'EXECUTED','3:3fa310189e738082742a06c3751f2f3e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-165','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',165,'EXECUTED','3:0ed5111ef301a24755a17b99ba609336','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-166','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',166,'EXECUTED','3:f781f197771175ae97a798ae4c732613','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-167','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',167,'EXECUTED','3:f82641b8c47ac3372c38bd410315f1d7','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-168','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',168,'EXECUTED','3:e819b9f5b305d94a874ffff77f1b0b00','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-169','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',169,'EXECUTED','3:e638fd6a15647613720dfab7af6c67af','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-17','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',17,'EXECUTED','3:ce6dfb988cb41f0adbe43e1855caa76e','Create Table','',NULL,'2.0.5'),('initial-database-creation-170','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',170,'EXECUTED','3:5f2cae397111f9c4c4112a513b9e811f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-171','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',171,'EXECUTED','3:0cd6d510389a9b5c7e7707baabf175d1','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-172','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',172,'EXECUTED','3:1e0dbe21557bd995cc4e10c17b06ad77','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-173','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',173,'EXECUTED','3:3c00120a79d285e58d49014dc3b3def2','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-174','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',174,'EXECUTED','3:a5d223789fb73e1b821bdd45c72478c8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-175','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',175,'EXECUTED','3:b7e560667260a76220664084e75a699b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-176','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:58',176,'EXECUTED','3:a04c06f20662d01674c2481258088719','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-177','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',177,'EXECUTED','3:eda6446777e754a9b28667808386fc07','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-178','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',178,'EXECUTED','3:cc43a952d1f4e90ae8ca08a86400b5b8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-179','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',179,'EXECUTED','3:3b7feac7849308d546f9e32306a0337b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-18','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',18,'EXECUTED','3:967c04d80a2d485f868b3c984579c4e8','Create Table','',NULL,'2.0.5'),('initial-database-creation-180','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',180,'EXECUTED','3:626dfbab1f6c43cbf5eda15af6c2d0b4','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-181','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',181,'EXECUTED','3:5d35e584fe5144871639463ab48448d9','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-182','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',182,'EXECUTED','3:54f532733816ed1173eb0a0978bc5d80','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-183','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',183,'EXECUTED','3:edf8db4cfb961a06787936314df7b94e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-184','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',184,'EXECUTED','3:1e122af08a912e15ee5c66f91b6c5bfa','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-185','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',185,'EXECUTED','3:49c144bddd204a4b53a3fa24016b0be2','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-186','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',186,'EXECUTED','3:7f27b6d4f3c5e0b00fb64f7131248b36','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-187','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',187,'EXECUTED','3:9c92c633ec12d7a6df8b65c97ad0fa35','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-188','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',188,'EXECUTED','3:94a94a8ce91fc86d16d4fa653a0d1453','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-189','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',189,'EXECUTED','3:b338072cafac27857c87f450a2ad6c46','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-19','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',19,'EXECUTED','3:4e9058f3e2f5b8173503167ec5c538a3','Create Table','',NULL,'2.0.5'),('initial-database-creation-190','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',190,'EXECUTED','3:9d5bd211cfd49f3b9fc91441f5eb908f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-191','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',191,'EXECUTED','3:bc7668fdd82c710bf043fa2f8a95dbeb','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-192','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',192,'EXECUTED','3:9a377a1c95da43a4a33381c22ed4e951','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-193','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',193,'EXECUTED','3:73a6387f780aa23e047099f18b15b50f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-194','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',194,'EXECUTED','3:8b99d9b4b1544d9b15595cfcc5e5ec4f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-195','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',195,'EXECUTED','3:c267aaa5cd192977a88171f504e04f29','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-196','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',196,'EXECUTED','3:8667c573c47e4d0fbcc32caa84df333a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-197','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',197,'EXECUTED','3:f11c3d339e18a174df76d41cd195f9de','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-198','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:59',198,'EXECUTED','3:05a89763fa1de7b97f16102791cfefed','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-199','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',199,'EXECUTED','3:c14c67e4fab2a4378ba63d3da1fb628a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-2','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',2,'EXECUTED','3:492e699609703ebfdc7f14d0b9d3fa10','Create Table','',NULL,'2.0.5'),('initial-database-creation-20','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',20,'EXECUTED','3:60a882fa6c0f1d848bf4c69f9bfff35c','Create Table','',NULL,'2.0.5'),('initial-database-creation-200','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',200,'EXECUTED','3:382f1905a4228bd3e9f0c040c970cde3','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-201','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',201,'EXECUTED','3:1bac4b4ae207d8838f091c32cb2df31e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-202','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',202,'EXECUTED','3:40a79714aa74711e54e351fd7ae769a8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-203','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',203,'EXECUTED','3:a1500cdb8370f8da80715f3150d2da41','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-204','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',204,'EXECUTED','3:7ed433c571a7829ad2eb6e5389433468','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-205','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',205,'EXECUTED','3:684a3d66bf7275618fdaf47f577dca5f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-206','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',206,'EXECUTED','3:f90e8c7e57222696be65ba1a75afe0e1','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-207','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',207,'EXECUTED','3:d903424e7e44b1c1fb8c9d00bbaa5ff9','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-208','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',208,'EXECUTED','3:6f03b7841548675d0c674dfc8a58a76a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-209','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',209,'EXECUTED','3:69684a0db21bbdbec2ffba0b151a73bd','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-21','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',21,'EXECUTED','3:19b23f729aa196a1abed154f225db676','Create Table','',NULL,'2.0.5'),('initial-database-creation-210','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',210,'EXECUTED','3:70d4db37a0127109f4e99eede4265e9e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-211','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',211,'EXECUTED','3:0dc5817e042530305a63787cd51c3d44','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-212','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',212,'EXECUTED','3:1b87cb4d62001fa3a6cd5df2bfee271f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-213','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',213,'EXECUTED','3:43bb14279d4807f3bb02f8c800ac6ec6','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-214','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:00',214,'EXECUTED','3:2250070459940c11e7ff31a4192c9355','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-215','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',215,'EXECUTED','3:1abe6242372fb6a1b8b7d5ed11c40cf6','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-216','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',216,'EXECUTED','3:365ccb2007a7db5a42a8558640d149e9','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-217','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',217,'EXECUTED','3:ec8d6d84ea00f6c7ece30c6d1ada877d','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-218','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',218,'EXECUTED','3:00a5c1aff60bf17c4f63c781d3d8868f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-219','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',219,'EXECUTED','3:80d78dda5a5d7a6e5b490c9b28841b16','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-22','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',22,'EXECUTED','3:947b787c1bbe91a331dd46cb1640f5e5','Create Table','',NULL,'2.0.5'),('initial-database-creation-220','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',220,'EXECUTED','3:3a8fd566182b2a101e0e843990cfa8df','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-221','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',221,'EXECUTED','3:229616a00b74e7128b9eeb41293cd91e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-222','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',222,'EXECUTED','3:ed9f60b9f8d7881c11360f2a020bdf4b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-223','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',223,'EXECUTED','3:fee2321152589ea84c5743175d4c180a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-224','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',224,'EXECUTED','3:f6ef1f3ee7da7a147539b46f9c1cf60b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-225','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',225,'EXECUTED','3:21557deb9ad7b4c25504862864502b1c','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-226','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',226,'EXECUTED','3:24adfcd3a41ae5648ffc2002dae0e4ef','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-227','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',227,'EXECUTED','3:bdd3cffbe9466ccbf6a1a791d61230fd','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-228','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',228,'EXECUTED','3:2182868d8f52e97c110e8901f8e2fc34','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-229','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',229,'EXECUTED','3:43b57b5e0d38ae69053bfcaf10d4ba8d','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-23','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',23,'EXECUTED','3:48f908ec702ae89b5da9f0eac7479005','Create Table','',NULL,'2.0.5'),('initial-database-creation-230','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',230,'EXECUTED','3:96d1199f9a6a19da0e6bac41293cf0ab','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-231','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',231,'EXECUTED','3:d493ad51ca6712c994efb741c1cd5cee','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-232','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',232,'EXECUTED','3:611e912194a15238fe4fd70e46ecd271','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-233','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',233,'EXECUTED','3:4823fd19347ba5a9c14b862fac025901','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-234','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:01',234,'EXECUTED','3:7aa2f827cf3710d979cd5c62770417bb','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-235','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',235,'EXECUTED','3:1d77a4d184e0f24891d62762883540af','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-236','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',236,'EXECUTED','3:354ab31aec28364faae025882682084a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-237','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',237,'EXECUTED','3:fb6d4b2090d92c3a4d685cb13176ee98','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-238','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',238,'EXECUTED','3:e91f5bf74998ca513288ed138c0da97d','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-239','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',239,'EXECUTED','3:f07664fc56241ad077820f8da9bad209','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-24','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',24,'EXECUTED','3:84355bc36e649a2786237afa2239406b','Create Table','',NULL,'2.0.5'),('initial-database-creation-240','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',240,'EXECUTED','3:3cf705e46d55107e249d5a69dbfbe650','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-241','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',241,'EXECUTED','3:3de02419d8b4096899d78e2cd84d7e0b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-242','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',242,'EXECUTED','3:4b074cd6de5562d41ae3506d8d4b35f3','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-243','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',243,'EXECUTED','3:b577e13ab196e4c075b8be09841abb4a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-244','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',244,'EXECUTED','3:9ad3d17bbbac8f995a1313d24c37c816','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-245','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',245,'EXECUTED','3:6ed5e004af84bf9f2cfe8858fd2a5693','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-246','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',246,'EXECUTED','3:72287bc729bb6699bb3bc2210d12dfd4','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-247','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',247,'EXECUTED','3:cb0dc7b3886d0b94d5052539bd683a16','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-248','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',248,'EXECUTED','3:359b88a585529cbf0d688ded52661d0d','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-249','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',249,'EXECUTED','3:bc3e3f311891541c94bafaa8250b3837','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-25','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',25,'EXECUTED','3:b8724c07bf0377b89a789f4068225748','Create Table','',NULL,'2.0.5'),('initial-database-creation-250','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',250,'EXECUTED','3:873b0ba69634f01ec622ca9b24d9e70a','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-251','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',251,'EXECUTED','3:c137a192ad74895a6049234b596fecb5','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-252','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',252,'EXECUTED','3:793cd0492af23c4c209def47673ca914','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-253','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',253,'EXECUTED','3:d76b0b4675c504576f872e68c5e9bda7','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-254','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',254,'EXECUTED','3:eee13cf5dc3e864e56c6a9b03079578e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-255','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',255,'EXECUTED','3:f9088ee9f92067cab4b207d3aae3a37b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-256','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:02',256,'EXECUTED','3:e2326617f1c9b860249a0c0777ec20f6','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-257','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',257,'EXECUTED','3:adf9400fc812eb6c8f7d32aa787742e6','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-258','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',258,'EXECUTED','3:60fc7ab467e364cd6a3d72d2f4f1d736','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-259','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',259,'EXECUTED','3:a6cacd22103e0447094d9a161d7b7445','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-26','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',26,'EXECUTED','3:f9826236b01812c13b8773d5ab43eba3','Create Table','',NULL,'2.0.5'),('initial-database-creation-260','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',260,'EXECUTED','3:76bf1eb3a6880473927e7a101d037bd8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-261','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',261,'EXECUTED','3:5e2d94e8e56a7c57936a8bce78066b96','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-262','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',262,'EXECUTED','3:b6e995091bd0a2aed951e2fbf3f215a3','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-263','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',263,'EXECUTED','3:5a57fa35a8c7ca09756afcad21d8e86f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-264','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',264,'EXECUTED','3:a7fc2f018277eaaa7649fb46b6b27ab6','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-265','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',265,'EXECUTED','3:528d191ec33204cee277f7312c49cc2c','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-266','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',266,'EXECUTED','3:deb083face872d4d49b666a9b8bdfaba','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-267','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',267,'EXECUTED','3:a7b87e7b2788c237ebeef3591092532e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-268','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',268,'EXECUTED','3:8e9f116ff4830eb847589e5b4e62852e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-269','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',269,'EXECUTED','3:595c174489187fc62b19670995c5cbff','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-27','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',27,'EXECUTED','3:c793cee4a905e7c283e5670c7a78ce75','Create Table','',NULL,'2.0.5'),('initial-database-creation-270','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',270,'EXECUTED','3:d7a769415b86b93205327adc4b037e45','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-271','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',271,'EXECUTED','3:06906c810ec8b347c75867ab21f7dc4c','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-272','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',272,'EXECUTED','3:a28d48ed75ff265b6472e9749f95d1a5','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-273','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',273,'EXECUTED','3:5990b5955a764200dd54eb4dd3b0a7cf','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-274','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',274,'EXECUTED','3:5d4cc1738a27175979f1c973b1bd5ea9','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-275','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',275,'EXECUTED','3:d9130cc23b8afa27fd84f7c72d818efd','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-276','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:03',276,'EXECUTED','3:18feaa2b4b9cbce46ea7b7a0c710de9f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-277','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',277,'EXECUTED','3:506fb6a53c157ce68105f451ad5958ff','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-278','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',278,'EXECUTED','3:b02c658ae947d20ac0ee1d207ebd210e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-279','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',279,'EXECUTED','3:c346d8903750d250fabc343064880e6f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-28','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',28,'EXECUTED','3:10e53ad074ddb8a722b7327c489af2a4','Create Table','',NULL,'2.0.5'),('initial-database-creation-280','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',280,'EXECUTED','3:37fcf9ad58b891a096b9c95f4ea57b58','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-281','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',281,'EXECUTED','3:611486b58c51ad97deab489a17b23e2e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-282','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',282,'EXECUTED','3:0efe8669ed086af6da655a53d4ced916','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-283','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',283,'EXECUTED','3:730ece3259ea1ee3ffa53563790465d8','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-284','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',284,'EXECUTED','3:5eb111d4b478c0c9a66a3a4a112c1c6b','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-285','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',285,'EXECUTED','3:b7d27d03ee27cc13c76c5262d518b876','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-286','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',286,'EXECUTED','3:3663d9ecd66964bffcc07bcfce7bdcdc','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-287','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',287,'EXECUTED','3:35e0a6356d11ed9dfe53c300b9e2ffee','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-288','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',288,'EXECUTED','3:4ae0336d6b9d807036d03ad041b67052','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-289','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',289,'EXECUTED','3:2da61d1b760209a704e29bfa4a22455e','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-29','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',29,'EXECUTED','3:ffd33e338772b05e1ec66bc5f536b857','Create Table','',NULL,'2.0.5'),('initial-database-creation-290','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',290,'EXECUTED','3:2604fb5ddeccc31b1dccd4cd0bad4342','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-291','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',291,'EXECUTED','3:da9d240fdde86539e1580b84687e0189','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-292','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',292,'EXECUTED','3:0dc9aa5380e9a48fe9aaf306235988a4','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-293','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',293,'EXECUTED','3:58c6315352f7cefbddeb9b3a38d1e140','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-294','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',294,'EXECUTED','3:91398a7f542f90a13d1f857ca3937de1','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-295','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',295,'EXECUTED','3:5395eb857489412499e37c691ea36b8f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-296','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',296,'EXECUTED','3:494a1128a80caad8d24c5f3574ef6edd','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-297','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:04',297,'EXECUTED','3:fa3b4dd73dd82e3a26c6563c9828fba3','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-298','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',298,'EXECUTED','3:e83453938c668f856d1df1537ec25d37','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-299','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',299,'EXECUTED','3:c5655c084990797f73bf295660881932','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-3','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',3,'EXECUTED','3:ce0671ca8c9c310243bcc2ffb2d35523','Create Table','',NULL,'2.0.5'),('initial-database-creation-30','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',30,'EXECUTED','3:de8601efc174c9011c267a989abc558d','Create Table','',NULL,'2.0.5'),('initial-database-creation-300','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',300,'EXECUTED','3:4747b6b28b49b810444aa6af7c133fab','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-301','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',301,'EXECUTED','3:f73d714400c8712c0715e2da673e9509','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-302','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',302,'EXECUTED','3:4d50b8c05ded66b150571543bcd91a37','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-303','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',303,'EXECUTED','3:7a5e18b1ed8e9813ca4920bd0856ecd0','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-304','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',304,'EXECUTED','3:e52f19afd5f5966cff359311b4c3acac','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-305','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',305,'EXECUTED','3:8548d763866edc7944ec1b0facb1560f','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-306','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',306,'EXECUTED','3:fc14a87fde20c7151888cea5c48c6f39','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-307','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',307,'EXECUTED','3:23a513bb939d6d2751a1550188c32222','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-308','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',308,'EXECUTED','3:4144c0d934e5fd823f19ef91da210ffa','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-309','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',309,'EXECUTED','3:c0d764328d333e644989448a4cd480bb','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-31','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',31,'EXECUTED','3:fc5ec26502de974f7ab46118f4f53196','Create Table','',NULL,'2.0.5'),('initial-database-creation-310','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',310,'EXECUTED','3:461ea2548e20f99478f3203dbf33bc16','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-311','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',311,'EXECUTED','3:3eeefe2f703d57218dde9b05fcdbc5cf','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-312','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',312,'EXECUTED','3:564cd8aac65a0319c9c3c75a486ace41','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-313','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',313,'EXECUTED','3:48d80e1c9868d51d687680b42fe47f3d','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-314','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',314,'EXECUTED','3:6c6213c38e211d11aa77f0766a18e1fe','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-315','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',315,'EXECUTED','3:f522ccbad33e6a463b265e241c4ae0db','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-316','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',316,'EXECUTED','3:e5777dd44529b270c7514bc322d72105','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-317','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:05',317,'EXECUTED','3:5a1c1fb8b9f6cce7fbaa03b255b5a033','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-318','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:06',318,'EXECUTED','3:ad070f00871b05e431528e34c3f09cde','Add Foreign Key Constraint','',NULL,'2.0.5'),('initial-database-creation-319','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:06',319,'EXECUTED','3:1dde4f2407d314306ae29ad174d98de3','Create Table','',NULL,'2.0.5'),('initial-database-creation-32','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',32,'EXECUTED','3:b3be37758841b13194d3710d6defef04','Create Table','',NULL,'2.0.5'),('initial-database-creation-320','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:40:06',320,'EXECUTED','3:5a5608b194d0ec72e2b8f53675ff8de0','Insert Row','',NULL,'2.0.5'),('initial-database-creation-33','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',33,'EXECUTED','3:a951462763f5d55a3f7e10f12f81335f','Create Table','',NULL,'2.0.5'),('initial-database-creation-34','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',34,'EXECUTED','3:a51224ce4bb0ca6d2b3f7bd992c65f0a','Create Table','',NULL,'2.0.5'),('initial-database-creation-35','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',35,'EXECUTED','3:8afd863ae4753040b121f5858594660b','Create Table','',NULL,'2.0.5'),('initial-database-creation-36','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',36,'EXECUTED','3:0754fc448f05289e922e36fe342d121d','Create Table','',NULL,'2.0.5'),('initial-database-creation-37','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',37,'EXECUTED','3:5cfa72b6d860176124f25ff3a9d331fc','Create Table','',NULL,'2.0.5'),('initial-database-creation-38','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',38,'EXECUTED','3:f831e87d1de1fc1338d42b8e833dc9c9','Create Table','',NULL,'2.0.5'),('initial-database-creation-39','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',39,'EXECUTED','3:6bd033fff9beeafa67d07445dbaee07f','Create Table','',NULL,'2.0.5'),('initial-database-creation-4','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',4,'EXECUTED','3:5a28bfc5ca316e6f6cd3a0b3ef5f67b9','Create Table','',NULL,'2.0.5'),('initial-database-creation-40','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',40,'EXECUTED','3:bdd3c4d65620a2a8f7b1a964a353f58f','Create Table','',NULL,'2.0.5'),('initial-database-creation-41','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',41,'EXECUTED','3:096d3c30326f7805f4b0039355445d54','Create Table','',NULL,'2.0.5'),('initial-database-creation-42','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',42,'EXECUTED','3:ded3fb067f8bc57e6638e6920fd44604','Create Table','',NULL,'2.0.5'),('initial-database-creation-43','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',43,'EXECUTED','3:55f995d5648794d3432adc45e49630ac','Create Table','',NULL,'2.0.5'),('initial-database-creation-44','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',44,'EXECUTED','3:36bec1cf129dbbe7479b6fd37ec4cfc8','Create Table','',NULL,'2.0.5'),('initial-database-creation-45','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',45,'EXECUTED','3:14bba3e0f5ceb3f2fd6f8957e1838de4','Create Table','',NULL,'2.0.5'),('initial-database-creation-46','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',46,'EXECUTED','3:20a4b538a58ecad5fefff00c68060415','Create Table','',NULL,'2.0.5'),('initial-database-creation-47','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',47,'EXECUTED','3:20d9ca0a2dac404d34031a303d36332f','Create Table','',NULL,'2.0.5'),('initial-database-creation-48','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',48,'EXECUTED','3:9422bfd2634488255bcbb32d73d4d9a6','Create Table','',NULL,'2.0.5'),('initial-database-creation-49','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',49,'EXECUTED','3:bb378576fc9548e6e0bf30c553be56c2','Create Table','',NULL,'2.0.5'),('initial-database-creation-5','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',5,'EXECUTED','3:dd32a9e5c58bd33f528f3a4176736205','Create Table','',NULL,'2.0.5'),('initial-database-creation-50','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',50,'EXECUTED','3:86be514721a43f3a69e0fc5575f68bcf','Create Table','',NULL,'2.0.5'),('initial-database-creation-51','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',51,'EXECUTED','3:6a7ac8677daeb7b232876fef8bc2eb13','Create Table','',NULL,'2.0.5'),('initial-database-creation-52','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',52,'EXECUTED','3:132f159f7460a378fe40004d8844911c','Create Table','',NULL,'2.0.5'),('initial-database-creation-53','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:52',53,'EXECUTED','3:e86194e70e6973332ef4538bdc5d7a1a','Create Table','',NULL,'2.0.5'),('initial-database-creation-54','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',54,'EXECUTED','3:2524421c32a9b419da3fe430869fdb1d','Create Table','',NULL,'2.0.5'),('initial-database-creation-55','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',55,'EXECUTED','3:f07c8df4ae4b20f431ed20c225b80172','Create Table','',NULL,'2.0.5'),('initial-database-creation-56','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',56,'EXECUTED','3:d180f6978451999d3c71c31e22a05f12','Create Table','',NULL,'2.0.5'),('initial-database-creation-57','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',57,'EXECUTED','3:96dee6dd4c6fe24bdf27aec7375f97a2','Create Table','',NULL,'2.0.5'),('initial-database-creation-58','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',58,'EXECUTED','3:57a5a9423e13e7d46ab17b29ef36e3ac','Create Table','',NULL,'2.0.5'),('initial-database-creation-59','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',59,'EXECUTED','3:481dae68046dee1729404fcb4b8f6724','Create Table','',NULL,'2.0.5'),('initial-database-creation-6','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',6,'EXECUTED','3:de107aebd954ab5c29c39bd6260b1c69','Create Table','',NULL,'2.0.5'),('initial-database-creation-60','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',60,'EXECUTED','3:3c79c9a14789f861812e28b85f42ba1a','Create Table','',NULL,'2.0.5'),('initial-database-creation-61','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',61,'EXECUTED','3:b0647147970dcc6926527bcc26e08d0d','Create Table','',NULL,'2.0.5'),('initial-database-creation-62','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',62,'EXECUTED','3:7a0cee9dc0952cca4c3e2a32508a4433','Create Table','',NULL,'2.0.5'),('initial-database-creation-63','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',63,'EXECUTED','3:2b9225897f01e983677b51310e4fe0c6','Create Table','',NULL,'2.0.5'),('initial-database-creation-64','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',64,'EXECUTED','3:8c6b353a40e4bbfe9ddec68b6e2ed109','Create Table','',NULL,'2.0.5'),('initial-database-creation-65','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',65,'EXECUTED','3:181a3cfd4d56baa702ea56857d70c6a5','Create Table','',NULL,'2.0.5'),('initial-database-creation-66','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',66,'EXECUTED','3:1ce12362bbe5c9289c1b1417b4534017','Create Table','',NULL,'2.0.5'),('initial-database-creation-67','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',67,'EXECUTED','3:3db8192b7fc2c73f2d6f0b811b86193a','Create Table','',NULL,'2.0.5'),('initial-database-creation-68','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',68,'EXECUTED','3:49669d8f9f006e24a66e6baef277ebaf','Create Table','',NULL,'2.0.5'),('initial-database-creation-69','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',69,'EXECUTED','3:ec29eb383f779659440de1992b1b6bba','Create Table','',NULL,'2.0.5'),('initial-database-creation-7','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',7,'EXECUTED','3:588d5677bcc5dff757c327873f896443','Create Table','',NULL,'2.0.5'),('initial-database-creation-70','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',70,'EXECUTED','3:668c637d3c53b7592d3dc67fc4703cff','Create Table','',NULL,'2.0.5'),('initial-database-creation-71','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',71,'EXECUTED','3:4f9d5316304450ab582b0858ce87c849','Create Table','',NULL,'2.0.5'),('initial-database-creation-72','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',72,'EXECUTED','3:7a3e44f865f5a910f79c5f06e0b64f14','Create Table','',NULL,'2.0.5'),('initial-database-creation-73','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',73,'EXECUTED','3:a635c19cae307c38b2763e3b9d58d224','Create Table','',NULL,'2.0.5'),('initial-database-creation-74','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',74,'EXECUTED','3:95ac63bf89b9b48c007e8460e7e48cdb','Create Table','',NULL,'2.0.5'),('initial-database-creation-75','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',75,'EXECUTED','3:28e6cc28eded2e909048c08ffacc1748','Create Table','',NULL,'2.0.5'),('initial-database-creation-76','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',76,'EXECUTED','3:f32e144cefab5640c93a41de30b01609','Create Table','',NULL,'2.0.5'),('initial-database-creation-77','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',77,'EXECUTED','3:5504fcfe56f3f27aedab1932b345ef67','Create Table','',NULL,'2.0.5'),('initial-database-creation-78','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',78,'EXECUTED','3:bfb3ce3ba16ec8f8206c296f743868e5','Create Table','',NULL,'2.0.5'),('initial-database-creation-79','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',79,'EXECUTED','3:7b7e2576df7e2b013c4609c905a1e89f','Create Table','',NULL,'2.0.5'),('initial-database-creation-8','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',8,'EXECUTED','3:7fa824a67c2de27b2b2a3f66e5118412','Create Table','',NULL,'2.0.5'),('initial-database-creation-80','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',80,'EXECUTED','3:f095dee1e812c9f76e21c526566bd348','Create Table','',NULL,'2.0.5'),('initial-database-creation-81','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',81,'EXECUTED','3:0e6f358e54f708c3e05debfeae8027f8','Create Table','',NULL,'2.0.5'),('initial-database-creation-82','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',82,'EXECUTED','3:660f1dd76f869c29fde7efc6f7e1255e','Create Table','',NULL,'2.0.5'),('initial-database-creation-83','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',83,'EXECUTED','3:43f98ac2e8ef569c2ace92091588dfc5','Create Table','',NULL,'2.0.5'),('initial-database-creation-84','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',84,'EXECUTED','3:72aa9950802d4e8da713013ae72ea212','Create Table','',NULL,'2.0.5'),('initial-database-creation-85','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:53',85,'EXECUTED','3:5f58cf1966364d46c430e933f520332c','Create Table','',NULL,'2.0.5'),('initial-database-creation-86','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',86,'EXECUTED','3:930edd522020ea950b89ea3fcc60293f','Create Table','',NULL,'2.0.5'),('initial-database-creation-87','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',87,'EXECUTED','3:eef1806c4faaa543eabf7aa919ee1871','Create Table','',NULL,'2.0.5'),('initial-database-creation-88','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',88,'EXECUTED','3:ba5ed5b46b50e4e696f26943e4846b38','Create Table','',NULL,'2.0.5'),('initial-database-creation-89','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',89,'EXECUTED','3:25d42a7f59acd170516f566f91db477b','Create Table','',NULL,'2.0.5'),('initial-database-creation-9','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:51',9,'EXECUTED','3:93bc8fa1188ddda3969df439f29c8f31','Create Table','',NULL,'2.0.5'),('initial-database-creation-90','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',90,'EXECUTED','3:0220e67c3c6e052be5b2683f3aff6cd9','Create Table','',NULL,'2.0.5'),('initial-database-creation-91','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',91,'EXECUTED','3:dbeb7f14726427f4332caba3c3882781','Create Table','',NULL,'2.0.5'),('initial-database-creation-92','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',92,'EXECUTED','3:a4f2631814df0304d6e1a9142e0174a1','Create Table','',NULL,'2.0.5'),('initial-database-creation-93','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',93,'EXECUTED','3:665d61220b4af809bb0048a73af9529d','Create Table','',NULL,'2.0.5'),('initial-database-creation-94','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',94,'EXECUTED','3:77fb476c14c92eda11701adb0a6d406f','Create Table','',NULL,'2.0.5'),('initial-database-creation-95','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',95,'EXECUTED','3:2e07882701f4d10d2c5249aefdae87ee','Create Table','',NULL,'2.0.5'),('initial-database-creation-96','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',96,'EXECUTED','3:12e1f91eae40df9eda60c20d6f9c8874','Create Table','',NULL,'2.0.5'),('initial-database-creation-97','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',97,'EXECUTED','3:72db70644086a38aa90367c038a89350','Create Table','',NULL,'2.0.5'),('initial-database-creation-98','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',98,'EXECUTED','3:1d6bac1b7849a0442a162078696893e3','Create Table','',NULL,'2.0.5'),('initial-database-creation-99','mrego','src/main/resources/db.changelog-database.xml','2012-12-19 11:39:54',99,'EXECUTED','3:7f6646bbd481090fa616c199b956b014','Create Table','',NULL,'2.0.5'),('initial-database-creation-customer-comunication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',376,'EXECUTED','3:59a56c15bcd845deb7f160c2ed1ff817','Create Table','',NULL,'2.0.5'),('initial-database-creation-subcontractor-comunication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',377,'EXECUTED','3:ecd951d180545b3e53241e7a862215ac','Create Table','',NULL,'2.0.5'),('initial-database-creation-subcontractor-comunication-value','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',378,'EXECUTED','3:0193a0cb269f0fca18d96d1be7628b2e','Create Table','',NULL,'2.0.5'),('modify-columns-type-in-expense-sheet-line-to-date','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',408,'EXECUTED','3:80e8ab1008f78dd80d4d0427b8cab872','Modify data type','modify columns type in expense sheet line to date',NULL,'2.0.5'),('modify-columns-type-in-expense-sheet-to-date','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',407,'EXECUTED','3:30af5261fc7d1cc196b254962a6bc9cd','Modify data type (x2)','modify columns type in expense sheet to date',NULL,'2.0.5'),('move-columns-from-configuration-table','calvarinop','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',359,'EXECUTED','3:7243259227df39ef2f0683d4b425d369','Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint, Drop Column (x3)','Move columns from configuration table to user table',NULL,'2.0.5'),('remove-code-from-order_element_template','jaragunde','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',411,'EXECUTED','3:88f6c4f5d7bece8e045f1cae70e5cfae','Drop Column','Remove column code in order_element_template table',NULL,'2.0.5'),('remove-configuration_roles_ldap','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',361,'EXECUTED','3:88dacdfabdf225e6ed8b25e4807afeb8','Drop Column','Remove column configuration_roles_ldap in role_matching_id',NULL,'2.0.5'),('remove-stretches-with-amountWorkPercentage-equal-100','dpino','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',327,'EXECUTED','3:a0f7f55dd790eefb369fbf139642a868','Custom SQL','Removes all stretches which amountWorkPercentage value is 100 as now these stretches will be created automatically and never stored into DB',NULL,'2.0.5'),('rename start_constraint_type in task and task milestone','ogonzalez','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',324,'EXECUTED','3:0ba5792ffc0bff2a1ce571047b008796','Rename Column (x2)','Caused by renaming org.libreplan.business.planner.entities.TaskPositionConstraint.startConstraintType',NULL,'2.0.5'),('rename-column-comunication_date-on-subcontractor-communication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',384,'EXECUTED','3:44d8a7bf4bbd4327cdfce81458b30554','Rename Column','Rename column comunication_date to communication_date',NULL,'2.0.5'),('rename-column-comunication_date-to-communication_date','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',381,'EXECUTED','3:2cd6e17fc795e3658f464709fba77874','Rename Column','Rename column comunication_date to communication_date',NULL,'2.0.5'),('rename-column-comunication_type-on-subcontractor-communication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',383,'EXECUTED','3:66fa4dd7f1e8cfc5c2a0a569eb1b7e76','Rename Column','Rename column comunication_type to communication_type',NULL,'2.0.5'),('rename-column-comunication_type-to-communication_type','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',380,'EXECUTED','3:3a22719f63e2217b3263184f5edfcba7','Rename Column','Rename column comunication_type to communication_type',NULL,'2.0.5'),('rename-column-elt-in-profile_roles-to-role','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',418,'EXECUTED','3:8696c001929a49d0958e563ec6070ee8','Rename Column','Rename column elt in profile_roles to role',NULL,'2.0.5'),('rename-column-elt-in-roles_table-to-role','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',416,'EXECUTED','3:776a769c3f1a794f6bc4435676322d25','Rename Column','Rename column elt in roles_table to role',NULL,'2.0.5'),('rename-column-from-monthly-to-personal-in-configuration','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',428,'EXECUTED','3:21f778d292e09ef087005888af1f7f15','Drop Foreign Key Constraint, Rename Column, Add Foreign Key Constraint','Rename column monthly_timesheets_type_of_work_hours to\n            personal_timesheets_type_of_work_hours in configuration table',NULL,'2.0.5'),('rename-column-subcontractor_comunication_id','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',386,'EXECUTED','3:26f643ba3829536f31f78def5300d9f4','Rename Column','Rename column subcontractor_comunication_id',NULL,'2.0.5'),('rename-roles-in-profile_roles','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',419,'EXECUTED','3:9c1e100911e9b284330a5aa3589984e5','Update Data (x4)','Rename roles in profile_roles',NULL,'2.0.5'),('rename-roles-in-roles_table','mrego','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:12',417,'EXECUTED','3:096ffd842b1b2b6ada758528f1315a4f','Update Data (x4)','Rename roles in roles_table',NULL,'2.0.5'),('rename-sum_charged_hours_id-to-sum_charged_effort_id','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:10',370,'EXECUTED','3:f8140dac93702c25f7fe75d9217ef9c5','Rename Column','Rename sum_charged_hours_id to sum_charged_effort_id in order_element',NULL,'2.0.5'),('rename-table-customer_comunication-to-customer_communication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',379,'EXECUTED','3:1ae733e6ccc918ffebd42a6f81d64d0b','Rename Table','Rename table customer_comunication to customer_communication',NULL,'2.0.5'),('rename-table-end_date_comunication-to-customer','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',398,'EXECUTED','3:7994a86f100e2fb01458dd96c62a4b28','Rename Table','Rename table to end_date_communication',NULL,'2.0.5'),('rename-table-subcontractor_comunication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',382,'EXECUTED','3:e9e6a2bcb8dfe3fed721f32999bf51f1','Rename Table','Rename table subcontractor_comunication to subcontractor_communication',NULL,'2.0.5'),('rename-table-subcontractor_comunication_values','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',385,'EXECUTED','3:2a590f887ff2eff855dec6ebb6ab03fd','Rename Table','Rename table subcontractor_comunication_values to subcontractor_communication_values',NULL,'2.0.5'),('replace-column-limited_resource-with-resource_type','jaragunde','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',332,'EXECUTED','3:b6640208fbf11943fa46d8953516bad7','Add Column, Update Data (x2), Add Not-Null Constraint, Drop Column','Replace column limited_resource with resource_type in resource table',NULL,'2.0.5'),('resize-precision-in-planning_data','dpino','src/main/resources/db.changelog-initial.xml','2012-12-19 11:40:06',321,'EXECUTED','3:3ee94e7e64b7ed2592dfb71db6923a1c','Modify data type (x2)','Resize precision for \'progress_by_duration\' and \'progress_by_num_hours\' fields',NULL,'2.0.5'),('set-default-value-ldap-auth-enabled','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',353,'EXECUTED','3:987742cd9637874021c47ad9388655d2','Add Default Value, Add Not-Null Constraint','',NULL,'2.0.5'),('set-default-value-ldap-save-password-db','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',352,'EXECUTED','3:6bcb9c9c00f066bc7ef5e568abf2da6f','Add Default Value, Add Not-Null Constraint','',NULL,'2.0.5'),('set-default-value-navalplan-user','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:08',351,'EXECUTED','3:8935d0ba839c252967d398f0db3ed01d','Add Default Value, Add Not-Null Constraint','',NULL,'2.0.5'),('subcontracted-date-id-column-to-end-date-communication','smontes','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:11',397,'EXECUTED','3:6bf0c71648f12e59f928f6c505e596ae','Add Column','Add subcontracted date id column to end date communication to customer',NULL,'2.0.5'),('update-color-in-calendar_exception_type-to-default','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',363,'EXECUTED','3:2f5f94374b2021dca7bc4d8245807ae4','Update Data','Update color in calendar_exception_type to DEFAULT',NULL,'2.0.5'),('update-effort-values-in-sum_charged_effort','jaragunde','src/main/resources/db.changelog-1.2.xml','2012-12-19 11:40:10',393,'EXECUTED','3:f408e919dea5d8b75042efb84879380d','Custom SQL','Updating effort values (hours to seconds) in task_element table',NULL,'2.0.5'),('update-effort-values-in-sum_charged_effort','mrego','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',368,'EXECUTED','3:6d7d2103e92b3ac55b9658931fc3ed65','Custom SQL (x2)','Updating effort values (hours to seconds) in sum_charged_effort table',NULL,'2.0.5'),('update-numhours-values-to-effort-values','idiazt','src/main/resources/db.changelog-1.1.xml','2012-12-19 11:40:09',366,'EXECUTED','3:79a9659b3a77004c5fe13bbec8aad88c','Custom SQL','Updating numHours to effort (hours to seconds)',NULL,'2.0.5'),('update-status-values-in-order_table','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:14',435,'EXECUTED','3:3a3f781e8ff867ecb6f049b95d2d36f6','Update Data (x7)','Updating status values in order_table',NULL,'2.0.5'),('update-work_report_type-name-to-personal-timehseets','mrego','src/main/resources/db.changelog-1.3.xml','2012-12-19 11:40:13',426,'EXECUTED','3:b6bca02ba95171a212ead3704760b41d','Update Data','Update work_report_type name from \"Monthly timesheets\" to \"Personal\n            timehsheets\"',NULL,'2.0.5'),('use-capacity-for-capacity-per-day-for-calendar-data','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',330,'EXECUTED','3:a643cf37da0098f0cad242d306bb5d05','Rename Table, Add Column, Rename Column','Convert from duration to capacity in effort per day for CalendarData',NULL,'2.0.5'),('use-capacity-for-exceptions','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',329,'EXECUTED','3:83576dfaa5871f36aa3f7d4119814f8f','Add Column, Rename Column, Custom SQL','Convert from duration to capacity property for calendar exceptions',NULL,'2.0.5'),('use-capacity-instead-of-effort_duration-and-not_over_assignable','ogonzalez','src/main/resources/db.changelog-1.0.xml','2012-12-19 11:40:06',328,'EXECUTED','3:71ae3b8d8998329d68e95d8ad2135745','Add Column, Rename Column, Update Data, Drop Column','Convert from duration + notAssignable (not over assignable) to capacity property',NULL,'2.0.5');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkd4192eaab216ed4c` (`advance_type_id`),
  CONSTRAINT `fkd4192eaab216ed4c` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_assignment`
--

LOCK TABLES `advance_assignment` WRITE;
/*!40000 ALTER TABLE `advance_assignment` DISABLE KEYS */;
INSERT INTO `advance_assignment` VALUES (3333,3,1,1516),(3334,3,1,1516),(3335,3,0,1516),(3336,3,1,1515),(3337,4,1,1516),(3338,4,1,1516),(3339,4,0,1516),(3340,4,1,1515),(3341,4,1,1516),(3342,4,1,1516),(5454,4,1,1516),(5455,4,0,1516),(5456,4,1,1515),(5457,3,1,1516),(5458,3,1,1516);
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
  KEY `fkd9bfae6f19b9dfde` (`order_element_template_id`),
  CONSTRAINT `fkd9bfae6f19b9dfde` FOREIGN KEY (`order_element_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkd9bfae6fb216ed4c` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_assignment_template`
--

LOCK TABLES `advance_assignment_template` WRITE;
/*!40000 ALTER TABLE `advance_assignment_template` DISABLE KEYS */;
INSERT INTO `advance_assignment_template` VALUES (3642,1,1516,3545,1,100.00),(3643,1,1516,3546,1,100.00);
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
  KEY `fkdaba2f7fa9e53843` (`advance_assignment_id`),
  CONSTRAINT `fkdaba2f7fa9e53843` FOREIGN KEY (`advance_assignment_id`) REFERENCES `direct_advance_assignment` (`advance_assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkdaba2f7f2f2d3aec` FOREIGN KEY (`advance_assignment_id`) REFERENCES `advance_assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `read_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advance_type_unit_name_key` (`unit_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_type`
--

LOCK TABLES `advance_type` WRITE;
/*!40000 ALTER TABLE `advance_type` DISABLE KEYS */;
INSERT INTO `advance_type` VALUES (1515,5,'children',100.0000,0,0.0100,1,1,0,0),(1516,4,'percentage',100.0000,0,0.0100,1,1,0,0),(1517,3,'units',2147483647.0000,0,1.0000,1,0,0,0),(1518,2,'subcontractor',100.0000,0,0.0100,1,1,0,0),(1519,1,'timesheets',100.0000,0,0.0100,1,1,0,1);
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
  KEY `fk7980035061f02c44` (`criterion_id`),
  CONSTRAINT `fk79800350b1524a73` FOREIGN KEY (`generic_resource_allocation_id`) REFERENCES `generic_resource_allocation` (`resource_allocation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk7980035061f02c44` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_criterions`
--

LOCK TABLES `all_criterions` WRITE;
/*!40000 ALTER TABLE `all_criterions` DISABLE KEYS */;
INSERT INTO `all_criterions` VALUES (3744,2021);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_calendar`
--

LOCK TABLES `base_calendar` WRITE;
/*!40000 ALTER TABLE `base_calendar` DISABLE KEYS */;
INSERT INTO `base_calendar` VALUES (202,1,'CALENDAR0001','Default',1,0),(203,2,'RESOURCE_CALENDAR0001',NULL,1,2),(2929,1,'RESOURCE_CALENDAR0002',NULL,1,2),(2930,1,'RESOURCE_CALENDAR0003',NULL,1,2);
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
  KEY `fk557738bca44abee3` (`base_calendar_id`),
  CONSTRAINT `fk557738bca44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_availability`
--

LOCK TABLES `calendar_availability` WRITE;
/*!40000 ALTER TABLE `calendar_availability` DISABLE KEYS */;
INSERT INTO `calendar_availability` VALUES (1919,2,'RESOURCE_CALENDAR0001-0002','2012-12-19',NULL,203,0),(3131,1,'RESOURCE_CALENDAR0002-0002','2012-12-19',NULL,2929,0),(3132,1,'RESOURCE_CALENDAR0003-0002','2012-12-19',NULL,2930,0);
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
  KEY `fk74fc040b7fa34e3f` (`parent`),
  CONSTRAINT `fk74fc040b7fa34e3f` FOREIGN KEY (`parent`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk74fc040ba44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_data`
--

LOCK TABLES `calendar_data` WRITE;
/*!40000 ALTER TABLE `calendar_data` DISABLE KEYS */;
INSERT INTO `calendar_data` VALUES (303,1,'b311f216-3191-47fe-85a8-0c8910f0b7fe',NULL,NULL,202,0),(304,2,'RESOURCE_CALENDAR0001-0001',202,NULL,203,0),(3030,1,'RESOURCE_CALENDAR0002-0001',202,NULL,2929,0),(3031,1,'RESOURCE_CALENDAR0003-0001',202,NULL,2930,0);
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
  KEY `fka215508eadad7e51` (`calendar_exception_id`),
  CONSTRAINT `fka215508ea44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fka215508eadad7e51` FOREIGN KEY (`calendar_exception_id`) REFERENCES `calendar_exception_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `standard_effort` int(11) DEFAULT NULL,
  `allowed_extra_effort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_exception_type_code_key` (`code`),
  UNIQUE KEY `calendar_exception_type_name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_exception_type`
--

LOCK TABLES `calendar_exception_type` WRITE;
/*!40000 ALTER TABLE `calendar_exception_type` DISABLE KEYS */;
INSERT INTO `calendar_exception_type` VALUES (1212,5,'CALENDAR_EXCEPTION_TYPE0001',1,'RESOURCE_HOLIDAY','YELLOW',0,0),(1213,4,'CALENDAR_EXCEPTION_TYPE0002',1,'LEAVE','MAGENTA',0,0),(1214,3,'CALENDAR_EXCEPTION_TYPE0003',1,'STRIKE','PURPLE',0,0),(1215,2,'CALENDAR_EXCEPTION_TYPE0004',1,'BANK_HOLIDAY','DEFAULT',0,0),(1216,1,'CALENDAR_EXCEPTION_TYPE0005',1,'HALF_DAY_HOLIDAY','ORANGE',14400,NULL);
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
  PRIMARY KEY (`base_calendar_id`,`day_id`),
  CONSTRAINT `fkc405554bfd5e49bc` FOREIGN KEY (`base_calendar_id`) REFERENCES `calendar_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `monte_carlo_method_tab_visible` tinyint(1) NOT NULL,
  `progress_type` int(11) DEFAULT NULL,
  `company_logo_url` varchar(255) DEFAULT NULL,
  `scenarios_visible` tinyint(1) DEFAULT NULL,
  `changed_default_admin_password` tinyint(1) NOT NULL,
  `changed_default_wsreader_password` tinyint(1) NOT NULL,
  `changed_default_wswriter_password` tinyint(1) NOT NULL,
  `ldap_host` varchar(255) DEFAULT NULL,
  `ldap_port` varchar(5) DEFAULT NULL,
  `ldap_base` varchar(255) DEFAULT NULL,
  `ldap_userdn` varchar(255) DEFAULT NULL,
  `ldap_password` varchar(255) DEFAULT NULL,
  `ldap_userid` varchar(255) DEFAULT NULL,
  `ldap_save_password_db` tinyint(1) NOT NULL,
  `ldap_auth_enabled` tinyint(1) NOT NULL,
  `ldap_save_roles_db` tinyint(1) NOT NULL,
  `ldap_group_path` varchar(255) DEFAULT NULL,
  `ldap_role_property` varchar(255) DEFAULT NULL,
  `ldap_search_query` varchar(255) DEFAULT NULL,
  `enabled_autocomplete_login` tinyint(1) NOT NULL,
  `ldap_group_strategy` tinyint(1) NOT NULL,
  `check_new_version_enabled` tinyint(1) NOT NULL,
  `allow_to_gather_usage_stats_enabled` tinyint(1) NOT NULL,
  `generate_code_for_expense_sheets` tinyint(1) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `personal_timesheets_type_of_work_hours` bigint(20) DEFAULT NULL,
  `changed_default_wssubcontracting_password` tinyint(1) NOT NULL,
  `changed_default_manager_password` tinyint(1) NOT NULL,
  `changed_default_hresources_password` tinyint(1) NOT NULL,
  `changed_default_outsourcing_password` tinyint(1) NOT NULL,
  `changed_default_reports_password` tinyint(1) NOT NULL,
  `personal_timesheets_periodicity` int(11) DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  `max_resources` int(11) DEFAULT NULL,
  `seconds_planning_warning` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk733374f6cc119699` (`configuration_id`),
  KEY `configuration_type_of_work_hours_fkey` (`personal_timesheets_type_of_work_hours`),
  CONSTRAINT `configuration_type_of_work_hours_fkey` FOREIGN KEY (`personal_timesheets_type_of_work_hours`) REFERENCES `type_of_work_hours` (`id`),
  CONSTRAINT `fk733374f6cc119699` FOREIGN KEY (`configuration_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (404,2,202,'COMPANY_CODE',1,1,1,1,1,1,1,1,1,1,1,0,0,'',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,1,1,1,0,1,'EUR','€',1010,0,0,0,0,0,0,0,0,30);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_roles_ldap`
--

DROP TABLE IF EXISTS `configuration_roles_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_roles_ldap` (
  `role_libreplan` varchar(255) NOT NULL,
  `role_ldap` varchar(255) NOT NULL,
  `id_configuration` bigint(20) NOT NULL,
  PRIMARY KEY (`role_libreplan`,`role_ldap`),
  KEY `id_configuration_fkey` (`id_configuration`),
  CONSTRAINT `id_configuration_fkey` FOREIGN KEY (`id_configuration`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_roles_ldap`
--

LOCK TABLES `configuration_roles_ldap` WRITE;
/*!40000 ALTER TABLE `configuration_roles_ldap` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuration_roles_ldap` ENABLE KEYS */;
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
  `task_end_date_effort_duration` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk35588e2db96bba28` (`advance_measurement_id`),
  KEY `fk35588e2d3ae24ff8` (`consolidation_id`),
  CONSTRAINT `fk35588e2d3ae24ff8` FOREIGN KEY (`consolidation_id`) REFERENCES `consolidation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk35588e2db96bba28` FOREIGN KEY (`advance_measurement_id`) REFERENCES `advance_measurement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkc9400e2c430ea1de` (`ind_advance_assignment_id`),
  CONSTRAINT `fkc9400e2c430ea1de` FOREIGN KEY (`ind_advance_assignment_id`) REFERENCES `indirect_advance_assignment` (`advance_assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkc9400e2c9f1d6611` FOREIGN KEY (`dir_advance_assignment_id`) REFERENCES `direct_advance_assignment` (`advance_assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkc9400e2cff2b2ba3` FOREIGN KEY (`id`) REFERENCES `task` (`task_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk16e20ea13a156175` (`parent`),
  CONSTRAINT `fk16e20ea13a156175` FOREIGN KEY (`parent`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk16e20ea114a5c61` FOREIGN KEY (`id_criterion_type`) REFERENCES `criterion_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion`
--

LOCK TABLES `criterion` WRITE;
/*!40000 ALTER TABLE `criterion` DISABLE KEYS */;
INSERT INTO `criterion` VALUES (1414,21,'CRITERION0001-0001','Africa','Africa',1,425984,NULL),(1415,19,'CRITERION0001-0002','America','America',1,425984,NULL),(1416,17,'CRITERION0001-0003','Asia','Asia',1,425984,NULL),(1417,15,'CRITERION0001-0004','Australia','Australia',1,425984,NULL),(1418,13,'CRITERION0001-0005','Europe','Europe',1,425984,NULL),(1419,8,'CRITERION0002-0001','Manager','Manager',1,425985,NULL),(1420,6,'CRITERION0002-0002','Senior worker','Senior worker',1,425985,NULL),(1421,4,'CRITERION0002-0003','Junior worker','Junior worker',1,425985,NULL),(2020,1,'CRITERION0003-0004','Civil engineer',NULL,1,425986,NULL),(2021,1,'CRITERION0003-0003','Arquitect',NULL,1,425986,NULL),(2022,1,'CRITERION0003-0002','Tecnhician',NULL,1,425986,NULL),(2023,1,'CRITERION0003-0001','Operator',NULL,1,425986,NULL),(2024,2,'CRITERION0005-0002','This is a name',NULL,1,688128,NULL),(2025,2,'CRITERION0005-0001','This is another name',NULL,1,688128,NULL),(2058,1,'CRITERION0005-0024','2',NULL,1,688128,NULL),(2059,1,'CRITERION0005-0013','rrt',NULL,1,688128,NULL),(2060,1,'CRITERION0005-0006','21',NULL,1,688128,NULL),(2061,1,'CRITERION0005-0016','qw',NULL,1,688128,NULL),(2062,1,'CRITERION0005-0018','0',NULL,1,688128,NULL),(2063,1,'CRITERION0005-0020','78',NULL,1,688128,NULL),(2064,1,'CRITERION0005-0022','44',NULL,1,688128,NULL),(2065,1,'CRITERION0005-0007','yuio5fd',NULL,1,688128,NULL),(2066,1,'CRITERION0005-0015','r',NULL,1,688128,NULL),(2067,1,'CRITERION0005-0008','yuio5',NULL,1,688128,NULL),(2068,1,'CRITERION0005-0025','A',NULL,1,688128,NULL),(2069,1,'CRITERION0005-0005','213',NULL,1,688128,NULL),(2070,1,'CRITERION0005-0023','4',NULL,1,688128,NULL),(2071,1,'CRITERION0005-0012','y',NULL,1,688128,NULL),(2072,1,'CRITERION0005-0010','yui',NULL,1,688128,NULL),(2073,1,'CRITERION0005-0019','9',NULL,1,688128,NULL),(2074,1,'CRITERION0005-0021','5',NULL,1,688128,NULL),(2075,1,'CRITERION0005-0009','yuio',NULL,1,688128,NULL),(2076,1,'CRITERION0005-0003','21345',NULL,1,688128,NULL),(2077,1,'CRITERION0005-0004','2134',NULL,1,688128,NULL),(2078,1,'CRITERION0005-0017','q',NULL,1,688128,NULL),(2079,1,'CRITERION0005-0011','yu',NULL,1,688128,NULL),(2080,1,'CRITERION0005-0014','rr',NULL,1,688128,NULL);
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
  KEY `fkef395fa5f41d57f2` (`parent`),
  CONSTRAINT `fkef395fa5f41d57f2` FOREIGN KEY (`parent`) REFERENCES `criterion_requirement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkef395fa519b9dfde` FOREIGN KEY (`order_element_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkef395fa561f02c44` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkef395fa5e036cfed` FOREIGN KEY (`hours_group_id`) REFERENCES `hours_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkef395fa5efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `criterion` bigint(20) NOT NULL,
  `resource` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterion_satisfaction_code_key` (`code`),
  KEY `fk225ff96a8c4c676c` (`criterion`),
  KEY `fk225ff96aeae850b2` (`resource`),
  CONSTRAINT `fk225ff96a8c4c676c` FOREIGN KEY (`criterion`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk225ff96aeae850b2` FOREIGN KEY (`resource`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion_satisfaction`
--

LOCK TABLES `criterion_satisfaction` WRITE;
/*!40000 ALTER TABLE `criterion_satisfaction` DISABLE KEYS */;
INSERT INTO `criterion_satisfaction` VALUES (2727,1,'CRITERION_SATISFACTION0001','2012-12-19',NULL,0,2021,1819),(2728,1,'CRITERION_SATISFACTION0002','2012-12-19',NULL,0,2020,2829),(2729,1,'CRITERION_SATISFACTION0003','2012-12-19',NULL,0,2022,2831);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterion_type`
--

LOCK TABLES `criterion_type` WRITE;
/*!40000 ALTER TABLE `criterion_type` DISABLE KEYS */;
INSERT INTO `criterion_type` VALUES (425984,22,'CRITERION0001','LOCATION','LOCATION','Worker location',1,0,5,1,1,0),(425985,10,'CRITERION0002','CATEGORY','CATEGORY','Professional category',1,1,3,1,1,0),(425986,2,'CRITERION0003','SKILL','SKILL','Worker skill',1,1,4,1,1,0),(688128,2,'CRITERION0005','Some other criteria',NULL,'Criteria for someghing else',1,1,25,1,1,0);
/*!40000 ALTER TABLE `criterion_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_communication`
--

DROP TABLE IF EXISTS `customer_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_communication` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `communication_type` int(11) DEFAULT NULL,
  `communication_date` datetime DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_communication`
--

LOCK TABLES `customer_communication` WRITE;
/*!40000 ALTER TABLE `customer_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_communication` ENABLE KEYS */;
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
  KEY `fkbb493f50756348a8` (`specific_container_id`),
  CONSTRAINT `fkbb493f50756348a8` FOREIGN KEY (`specific_container_id`) REFERENCES `specific_day_assignments_container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkbb493f5019256004` FOREIGN KEY (`generic_container_id`) REFERENCES `generic_day_assignments_container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkbb493f5048d21790` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkbb493f50510e7a78` FOREIGN KEY (`derived_container_id`) REFERENCES `derived_day_assignments_container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_assignment`
--

LOCK TABLES `day_assignment` WRITE;
/*!40000 ALTER TABLE `day_assignment` DISABLE KEYS */;
INSERT INTO `day_assignment` VALUES (4465,'specific_day',4,0,0,'2012-11-20',2831,4143,NULL,NULL),(4466,'specific_day',4,0,0,'2012-12-03',2831,4143,NULL,NULL),(4467,'specific_day',4,0,0,'2012-11-25',2831,4143,NULL,NULL),(4468,'specific_day',4,0,0,'2012-10-31',2831,4143,NULL,NULL),(4469,'specific_day',4,0,0,'2012-10-14',2831,4143,NULL,NULL),(4470,'specific_day',4,28800,0,'2012-12-27',2831,4143,NULL,NULL),(4471,'specific_day',4,0,0,'2012-12-09',2831,4143,NULL,NULL),(4472,'specific_day',4,14400,0,'2013-01-04',2831,4143,NULL,NULL),(4473,'specific_day',4,0,0,'2012-10-24',2831,4143,NULL,NULL),(4474,'specific_day',4,28800,0,'2012-12-24',2831,4143,NULL,NULL),(4475,'specific_day',4,0,0,'2012-12-11',2831,4143,NULL,NULL),(4476,'specific_day',4,0,0,'2012-10-11',2831,4143,NULL,NULL),(4477,'specific_day',4,28800,0,'2012-12-28',2831,4143,NULL,NULL),(4478,'specific_day',4,0,0,'2012-11-04',2831,4143,NULL,NULL),(4479,'specific_day',4,0,0,'2012-10-25',2831,4143,NULL,NULL),(4480,'specific_day',4,0,0,'2012-12-12',2831,4143,NULL,NULL),(4481,'specific_day',4,0,0,'2012-11-09',2831,4143,NULL,NULL),(4482,'specific_day',4,0,0,'2012-10-23',2831,4143,NULL,NULL),(4483,'specific_day',4,28800,0,'2012-12-26',2831,4143,NULL,NULL),(4484,'specific_day',4,0,0,'2012-11-03',2831,4143,NULL,NULL),(4485,'specific_day',4,0,0,'2012-10-26',2831,4143,NULL,NULL),(4486,'specific_day',4,0,0,'2012-12-18',2831,4143,NULL,NULL),(4487,'specific_day',4,0,0,'2012-11-27',2831,4143,NULL,NULL),(4488,'specific_day',4,0,0,'2012-12-04',2831,4143,NULL,NULL),(4489,'specific_day',4,0,0,'2012-11-19',2831,4143,NULL,NULL),(4490,'specific_day',4,0,0,'2012-11-05',2831,4143,NULL,NULL),(4491,'specific_day',4,0,0,'2012-12-22',2831,4143,NULL,NULL),(4492,'specific_day',4,28800,0,'2012-12-31',2831,4143,NULL,NULL),(4493,'specific_day',4,0,0,'2012-11-28',2831,4143,NULL,NULL),(4494,'specific_day',4,0,0,'2012-10-18',2831,4143,NULL,NULL),(4495,'specific_day',4,0,0,'2012-12-13',2831,4143,NULL,NULL),(4496,'specific_day',4,0,0,'2012-12-23',2831,4143,NULL,NULL),(4497,'specific_day',4,0,0,'2012-12-29',2831,4143,NULL,NULL),(4498,'specific_day',4,0,0,'2012-10-20',2831,4143,NULL,NULL),(4499,'specific_day',4,28800,0,'2012-12-25',2831,4143,NULL,NULL),(4500,'specific_day',4,0,0,'2012-10-28',2831,4143,NULL,NULL),(4501,'specific_day',4,0,0,'2012-12-02',2831,4143,NULL,NULL),(4502,'specific_day',4,0,0,'2012-12-14',2831,4143,NULL,NULL),(4503,'specific_day',4,0,0,'2012-11-17',2831,4143,NULL,NULL),(4504,'specific_day',4,0,0,'2012-12-15',2831,4143,NULL,NULL),(4505,'specific_day',4,0,0,'2012-10-19',2831,4143,NULL,NULL),(4506,'specific_day',4,0,0,'2012-11-11',2831,4143,NULL,NULL),(4507,'specific_day',4,0,0,'2012-11-26',2831,4143,NULL,NULL),(4508,'specific_day',4,28800,0,'2013-01-02',2831,4143,NULL,NULL),(4509,'specific_day',4,0,0,'2012-11-16',2831,4143,NULL,NULL),(4510,'specific_day',4,0,0,'2012-12-01',2831,4143,NULL,NULL),(4511,'specific_day',4,0,0,'2012-11-08',2831,4143,NULL,NULL),(4512,'specific_day',4,0,0,'2012-12-06',2831,4143,NULL,NULL),(4513,'specific_day',4,0,0,'2012-12-08',2831,4143,NULL,NULL),(4514,'specific_day',4,0,0,'2012-11-01',2831,4143,NULL,NULL),(4515,'specific_day',4,0,0,'2012-11-30',2831,4143,NULL,NULL),(4516,'specific_day',4,0,0,'2012-10-16',2831,4143,NULL,NULL),(4517,'specific_day',4,0,0,'2012-11-24',2831,4143,NULL,NULL),(4518,'specific_day',4,0,0,'2012-10-12',2831,4143,NULL,NULL),(4519,'specific_day',4,0,0,'2012-10-21',2831,4143,NULL,NULL),(4520,'specific_day',4,28800,0,'2012-12-21',2831,4143,NULL,NULL),(4521,'specific_day',4,0,0,'2012-11-06',2831,4143,NULL,NULL),(4522,'specific_day',4,28800,0,'2012-12-20',2831,4143,NULL,NULL),(4523,'specific_day',4,0,0,'2012-10-22',2831,4143,NULL,NULL),(4524,'specific_day',4,28800,0,'2013-01-01',2831,4143,NULL,NULL),(4525,'specific_day',4,0,0,'2012-11-15',2831,4143,NULL,NULL),(4526,'specific_day',4,0,0,'2012-11-10',2831,4143,NULL,NULL),(4527,'specific_day',4,0,0,'2012-11-29',2831,4143,NULL,NULL),(4528,'specific_day',4,0,0,'2012-10-13',2831,4143,NULL,NULL),(4529,'specific_day',4,0,0,'2012-11-23',2831,4143,NULL,NULL),(4530,'specific_day',4,0,0,'2012-12-05',2831,4143,NULL,NULL),(4531,'specific_day',4,0,0,'2012-11-14',2831,4143,NULL,NULL),(4532,'specific_day',4,0,0,'2012-10-30',2831,4143,NULL,NULL),(4533,'specific_day',4,0,0,'2012-11-02',2831,4143,NULL,NULL),(4534,'specific_day',4,0,0,'2012-12-10',2831,4143,NULL,NULL),(4535,'specific_day',4,0,0,'2012-12-16',2831,4143,NULL,NULL),(4536,'specific_day',4,0,0,'2012-12-07',2831,4143,NULL,NULL),(4537,'specific_day',4,0,0,'2012-11-21',2831,4143,NULL,NULL),(4538,'specific_day',4,0,0,'2012-11-12',2831,4143,NULL,NULL),(4539,'specific_day',4,0,0,'2012-10-17',2831,4143,NULL,NULL),(4540,'specific_day',4,0,0,'2012-10-27',2831,4143,NULL,NULL),(4541,'specific_day',4,28800,0,'2012-12-19',2831,4143,NULL,NULL),(4542,'specific_day',4,0,0,'2012-12-30',2831,4143,NULL,NULL),(4543,'specific_day',4,0,0,'2012-10-29',2831,4143,NULL,NULL),(4544,'specific_day',4,0,0,'2012-10-15',2831,4143,NULL,NULL),(4545,'specific_day',4,0,0,'2012-11-13',2831,4143,NULL,NULL),(4546,'specific_day',4,0,0,'2012-11-18',2831,4143,NULL,NULL),(4547,'specific_day',4,0,0,'2012-11-07',2831,4143,NULL,NULL),(4548,'specific_day',4,28800,0,'2013-01-03',2831,4143,NULL,NULL),(4549,'specific_day',4,0,0,'2012-12-17',2831,4143,NULL,NULL),(4550,'specific_day',4,0,0,'2012-11-22',2831,4143,NULL,NULL),(4551,'generic_day',4,28800,0,'2013-01-31',1819,NULL,3842,NULL),(4552,'generic_day',4,28800,0,'2013-01-07',1819,NULL,3842,NULL),(4553,'generic_day',4,28800,0,'2013-02-21',1819,NULL,3842,NULL),(4554,'generic_day',4,28800,0,'2013-02-25',1819,NULL,3842,NULL),(4555,'generic_day',4,28800,0,'2013-01-17',1819,NULL,3842,NULL),(4556,'generic_day',4,28800,0,'2013-01-18',1819,NULL,3842,NULL),(4557,'generic_day',4,28800,0,'2013-02-20',1819,NULL,3842,NULL),(4558,'generic_day',4,14400,0,'2013-01-04',1819,NULL,3842,NULL),(4559,'generic_day',4,28800,0,'2013-02-14',1819,NULL,3842,NULL),(4560,'generic_day',4,28800,0,'2013-02-06',1819,NULL,3842,NULL),(4561,'generic_day',4,28800,0,'2013-02-19',1819,NULL,3842,NULL),(4562,'generic_day',4,28800,0,'2013-01-09',1819,NULL,3842,NULL),(4563,'generic_day',4,28800,0,'2013-01-11',1819,NULL,3842,NULL),(4564,'generic_day',4,28800,0,'2013-02-13',1819,NULL,3842,NULL),(4565,'generic_day',4,28800,0,'2013-01-28',1819,NULL,3842,NULL),(4566,'generic_day',4,28800,0,'2013-02-04',1819,NULL,3842,NULL),(4567,'generic_day',4,28800,0,'2013-01-14',1819,NULL,3842,NULL),(4568,'generic_day',4,28800,0,'2013-01-10',1819,NULL,3842,NULL),(4569,'generic_day',4,28800,0,'2013-02-11',1819,NULL,3842,NULL),(4570,'generic_day',4,28800,0,'2013-01-15',1819,NULL,3842,NULL),(4571,'generic_day',4,28800,0,'2013-02-15',1819,NULL,3842,NULL),(4572,'generic_day',4,28800,0,'2013-02-18',1819,NULL,3842,NULL),(4573,'generic_day',4,28800,0,'2013-02-08',1819,NULL,3842,NULL),(4574,'generic_day',4,28800,0,'2013-02-22',1819,NULL,3842,NULL),(4575,'generic_day',4,28800,0,'2013-02-01',1819,NULL,3842,NULL),(4576,'generic_day',4,28800,0,'2013-01-29',1819,NULL,3842,NULL),(4577,'generic_day',4,28800,0,'2013-02-12',1819,NULL,3842,NULL),(4578,'generic_day',4,28800,0,'2013-01-22',1819,NULL,3842,NULL),(4579,'generic_day',4,28800,0,'2013-01-30',1819,NULL,3842,NULL),(4580,'generic_day',4,28800,0,'2013-01-24',1819,NULL,3842,NULL),(4581,'generic_day',4,28800,0,'2013-02-26',1819,NULL,3842,NULL),(4582,'generic_day',4,28800,0,'2013-01-23',1819,NULL,3842,NULL),(4583,'generic_day',4,28800,0,'2013-01-16',1819,NULL,3842,NULL),(4584,'generic_day',4,28800,0,'2013-02-07',1819,NULL,3842,NULL),(4585,'generic_day',4,28800,0,'2013-02-05',1819,NULL,3842,NULL),(4586,'generic_day',4,28800,0,'2013-01-08',1819,NULL,3842,NULL),(4587,'generic_day',4,28800,0,'2013-01-25',1819,NULL,3842,NULL),(4588,'generic_day',4,28800,0,'2013-01-21',1819,NULL,3842,NULL),(5369,'generic_day',2,28800,0,'2012-12-26',1819,NULL,5252,NULL),(5370,'generic_day',2,28800,0,'2012-12-19',1819,NULL,5252,NULL),(5371,'generic_day',2,28800,0,'2012-12-28',1819,NULL,5252,NULL),(5372,'generic_day',2,28800,0,'2013-01-07',2829,NULL,5252,NULL),(5373,'generic_day',2,28800,0,'2012-12-31',1819,NULL,5252,NULL),(5374,'generic_day',2,28800,0,'2012-12-21',1819,NULL,5252,NULL),(5375,'generic_day',2,28800,0,'2013-01-03',1819,NULL,5252,NULL),(5376,'generic_day',2,28800,0,'2013-01-01',1819,NULL,5252,NULL),(5377,'generic_day',2,28800,0,'2012-12-24',1819,NULL,5252,NULL),(5378,'generic_day',2,28800,0,'2012-12-25',1819,NULL,5252,NULL),(5379,'generic_day',2,28800,0,'2013-01-08',2829,NULL,5252,NULL),(5380,'generic_day',2,14400,0,'2013-01-04',2829,NULL,5252,NULL),(5381,'generic_day',2,28800,0,'2013-01-02',1819,NULL,5252,NULL),(5382,'generic_day',2,28800,0,'2012-12-27',1819,NULL,5252,NULL),(5383,'generic_day',2,28800,0,'2012-12-20',1819,NULL,5252,NULL),(5384,'generic_day',2,14400,0,'2013-01-04',1819,NULL,5252,NULL);
/*!40000 ALTER TABLE `day_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadline_communication`
--

DROP TABLE IF EXISTS `deadline_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deadline_communication` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `save_date` datetime DEFAULT NULL,
  `deliver_date` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadline_communication`
--

LOCK TABLES `deadline_communication` WRITE;
/*!40000 ALTER TABLE `deadline_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `deadline_communication` ENABLE KEYS */;
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
  KEY `fkfe6ed34b9e788f90` (`queue_dependency`),
  CONSTRAINT `fkfe6ed34b9e788f90` FOREIGN KEY (`queue_dependency`) REFERENCES `limiting_resource_queue_dependency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkfe6ed34b1545e7a` FOREIGN KEY (`origin`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkfe6ed34be838f362` FOREIGN KEY (`destination`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependency`
--

LOCK TABLES `dependency` WRITE;
/*!40000 ALTER TABLE `dependency` DISABLE KEYS */;
INSERT INTO `dependency` VALUES (1310722,4,3243,3244,NULL,2),(1310723,4,3235,3236,NULL,0);
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
  KEY `fkf0260c4275ed79ba` (`resource_allocation_id`),
  CONSTRAINT `fkf0260c4275ed79ba` FOREIGN KEY (`resource_allocation_id`) REFERENCES `resource_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkf0260c4287b470f0` FOREIGN KEY (`configurationunit`) REFERENCES `machine_workers_configuration_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkb83176c3421c7cf4` (`scenario`),
  CONSTRAINT `fkb83176c3421c7cf4` FOREIGN KEY (`scenario`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkb83176c31b8e7cf2` FOREIGN KEY (`derived_allocation_id`) REFERENCES `derived_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk7d1ee2c5fec79eb0` (`description_value_id`),
  CONSTRAINT `fk7d1ee2c5fec79eb0` FOREIGN KEY (`description_value_id`) REFERENCES `work_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk1e6bf5475c390c4` (`description_value_id`),
  CONSTRAINT `fk1e6bf5475c390c4` FOREIGN KEY (`description_value_id`) REFERENCES `work_report_line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk172a16c0a1127ce5` (`direct_order_element_id`),
  CONSTRAINT `fk172a16c0a1127ce5` FOREIGN KEY (`direct_order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk172a16c02f2d3aec` FOREIGN KEY (`advance_assignment_id`) REFERENCES `advance_assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_advance_assignment`
--

LOCK TABLES `direct_advance_assignment` WRITE;
/*!40000 ALTER TABLE `direct_advance_assignment` DISABLE KEYS */;
INSERT INTO `direct_advance_assignment` VALUES (3333,2330,100.00),(3334,2331,100.00),(3337,2334,100.00),(3338,2335,100.00),(3341,2362,100.00),(3342,2363,100.00),(5454,4673,100.00),(5457,4704,100.00),(5458,4705,100.00);
/*!40000 ALTER TABLE `direct_advance_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_date_communication`
--

DROP TABLE IF EXISTS `end_date_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `end_date_communication` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `save_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `communication_date` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `subcontracted_task_data_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_date_communication`
--

LOCK TABLES `end_date_communication` WRITE;
/*!40000 ALTER TABLE `end_date_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `end_date_communication` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_sequence`
--

LOCK TABLES `entity_sequence` WRITE;
/*!40000 ALTER TABLE `entity_sequence` DISABLE KEYS */;
INSERT INTO `entity_sequence` VALUES (101,25,0,'ORDER',5,4,1),(102,25,1,'CRITERION',6,4,1),(103,19,2,'LABEL',1,4,1),(104,17,3,'MACHINE',0,4,1),(105,19,4,'WORKER',3,4,1),(106,23,5,'UNIT_TYPE',8,4,1),(107,14,6,'CALENDAR',1,4,1),(108,15,7,'WORK_HOURS_TYPE',2,4,1),(109,87,8,'MATERIAL_CATEGORY',75,4,1),(110,11,9,'WORK_REPORT',0,4,1),(111,12,10,'WORKREPORTTYPE',2,4,1),(112,14,11,'CALENDAR_EXCEPTION_TYPE',5,4,1),(113,8,12,'COST_CATEGORY',0,4,1),(114,10,13,'RESOURCE_CALENDAR',3,4,1),(115,9,14,'CRITERION_SATISFACTION',3,4,1),(116,5,15,'RESOURCE_COST_CATEGORY_ASSIGNMENT',0,4,1),(117,4,16,'EXPENSE_SHEET',0,4,1);
/*!40000 ALTER TABLE `entity_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_sheet`
--

DROP TABLE IF EXISTS `expense_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_sheet` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_autogenerated` tinyint(1) DEFAULT NULL,
  `first_expense` date DEFAULT NULL,
  `last_expense` date DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `description` text,
  `last_expense_sheet_line_sequence_code` int(11) DEFAULT NULL,
  `personal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_sheet`
--

LOCK TABLES `expense_sheet` WRITE;
/*!40000 ALTER TABLE `expense_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_sheet_line`
--

DROP TABLE IF EXISTS `expense_sheet_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_sheet_line` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `concept` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `expense_sheet_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_sheet_line_order_element_fkey` (`order_element_id`),
  KEY `expense_sheet_line_resource_fkey` (`resource_id`),
  KEY `expense_sheet_line_expense_sheet_fkey` (`expense_sheet_id`),
  CONSTRAINT `expense_sheet_line_expense_sheet_fkey` FOREIGN KEY (`expense_sheet_id`) REFERENCES `expense_sheet` (`id`),
  CONSTRAINT `expense_sheet_line_order_element_fkey` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`),
  CONSTRAINT `expense_sheet_line_resource_fkey` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_sheet_line`
--

LOCK TABLES `expense_sheet_line` WRITE;
/*!40000 ALTER TABLE `expense_sheet_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_sheet_line` ENABLE KEYS */;
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
  KEY `fkd8e14c09b36a6d51` (`company_user`),
  CONSTRAINT `fkd8e14c09b36a6d51` FOREIGN KEY (`company_user`) REFERENCES `user_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkc01655fd421c7cf4` (`scenario`),
  CONSTRAINT `fkc01655fd421c7cf4` FOREIGN KEY (`scenario`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkc01655fdee970b` FOREIGN KEY (`resource_allocation_id`) REFERENCES `generic_resource_allocation` (`resource_allocation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_day_assignments_container`
--

LOCK TABLES `generic_day_assignments_container` WRITE;
/*!40000 ALTER TABLE `generic_day_assignments_container` DISABLE KEYS */;
INSERT INTO `generic_day_assignments_container` VALUES (3842,4,3744,909,'2013-01-04',14400,'2013-02-27',0),(5252,5,5151,909,'2012-10-09',0,'2013-01-09',0);
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
  PRIMARY KEY (`resource_allocation_id`),
  CONSTRAINT `fkf788b34975ed79ba` FOREIGN KEY (`resource_allocation_id`) REFERENCES `resource_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_resource_allocation`
--

LOCK TABLES `generic_resource_allocation` WRITE;
/*!40000 ALTER TABLE `generic_resource_allocation` DISABLE KEYS */;
INSERT INTO `generic_resource_allocation` VALUES (3744,0),(5151,0);
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
  KEY `fk2908787d415884f6` (`heading_id`),
  CONSTRAINT `fk2908787d415884f6` FOREIGN KEY (`heading_id`) REFERENCES `work_report_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_unique_key`
--

LOCK TABLES `hibernate_unique_key` WRITE;
/*!40000 ALTER TABLE `hibernate_unique_key` DISABLE KEYS */;
INSERT INTO `hibernate_unique_key` VALUES (57);
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
  KEY `fk3b9a8148d5b6184d` (`type_of_work_hours_id`),
  CONSTRAINT `fk3b9a8148d5b6184d` FOREIGN KEY (`type_of_work_hours_id`) REFERENCES `type_of_work_hours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3b9a8148c29ad8eb` FOREIGN KEY (`cost_category_id`) REFERENCES `cost_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkd9b7594f1ed629ea` (`parent_order_line`),
  CONSTRAINT `fkd9b7594f1ed629ea` FOREIGN KEY (`parent_order_line`) REFERENCES `order_line` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkd9b7594f8bdc6ac6` FOREIGN KEY (`order_line_template`) REFERENCES `order_line_template` (`order_line_template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours_group`
--

LOCK TABLES `hours_group` WRITE;
/*!40000 ALTER TABLE `hours_group` DISABLE KEYS */;
INSERT INTO `hours_group` VALUES (3434,3,'ORDER0003-0001-0001','WORKER',100,1.00,0,2330,NULL),(3435,3,'ORDER0003-0002-0001','WORKER',300,1.00,0,2331,NULL),(3442,1,'2a5039e9-f0ef-402a-bbcb-7c010f4ad349','WORKER',100,0.25,0,NULL,3545),(3443,1,'37cdd6f0-cb94-4ac2-82ac-f99d9b3e905f','WORKER',300,0.75,0,NULL,3546),(3444,4,'ORDER0004-0001-0001','WORKER',100,0.25,0,2334,NULL),(3445,4,'ORDER0004-0002-0001','WORKER',300,0.75,0,2335,NULL),(3472,4,'ORDER0004-0003-0001','WORKER',90,1.00,0,2362,NULL),(3473,4,'ORDER0004-0004-0001','WORKER',50,1.00,0,2363,NULL),(4872,4,'ORDER0005-0001-0001','WORKER',120,1.00,0,4673,NULL),(4903,3,'ORDER0005-0002-0001','WORKER',120,1.00,0,4704,NULL),(4904,3,'ORDER0005-0003-0001','WORKER',10,1.00,0,4705,NULL);
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
  KEY `fk64cbad3b8202350f` (`indirect_order_element_id`),
  CONSTRAINT `fk64cbad3b8202350f` FOREIGN KEY (`indirect_order_element_id`) REFERENCES `order_line_group` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk64cbad3b218d7620` FOREIGN KEY (`indirect_order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk64cbad3b2f2d3aec` FOREIGN KEY (`advance_assignment_id`) REFERENCES `advance_assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirect_advance_assignment`
--

LOCK TABLES `indirect_advance_assignment` WRITE;
/*!40000 ALTER TABLE `indirect_advance_assignment` DISABLE KEYS */;
INSERT INTO `indirect_advance_assignment` VALUES (3335,2329),(3336,2329),(3339,2333),(3340,2333),(5455,4664),(5456,4664);
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
  UNIQUE KEY `label_name_key` (`label_type_id`,`name`),
  CONSTRAINT `fk61f7ef4707cd777` FOREIGN KEY (`label_type_id`) REFERENCES `label_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES (606,1,'LABEL0001-0001','Medium urgency',505),(607,1,'LABEL0001-0002','High urgency',505),(608,1,'LABEL0001-0003','Low urgency',505);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_type`
--

LOCK TABLES `label_type` WRITE;
/*!40000 ALTER TABLE `label_type` DISABLE KEYS */;
INSERT INTO `label_type` VALUES (505,1,'LABEL0001','Priority',1,3);
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
  UNIQUE KEY `limiting_resource_queue_resource_id_key` (`resource_id`),
  CONSTRAINT `fk7e57469848d21790` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk5948535228f2695` (`origin_queue_element_id`),
  CONSTRAINT `fk5948535228f2695` FOREIGN KEY (`origin_queue_element_id`) REFERENCES `limiting_resource_queue_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk59485352e42f8d29` FOREIGN KEY (`destiny_queue_element_id`) REFERENCES `limiting_resource_queue_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk1fc5f455bd2209e8` (`limiting_resource_queue_id`),
  CONSTRAINT `fk1fc5f45575ed79ba` FOREIGN KEY (`resource_allocation_id`) REFERENCES `resource_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk1fc5f455bd2209e8` FOREIGN KEY (`limiting_resource_queue_id`) REFERENCES `limiting_resource_queue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk88eecef415884f6` (`heading_id`),
  CONSTRAINT `fk88eecef415884f6` FOREIGN KEY (`heading_id`) REFERENCES `work_report_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`machine_id`),
  CONSTRAINT `fk31314447937680b7` FOREIGN KEY (`machine_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk95548d7861f02c44` (`criterion_id`),
  CONSTRAINT `fk95548d7875999a91` FOREIGN KEY (`id`) REFERENCES `machine_workers_configuration_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk95548d7861f02c44` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `fka2c158369bebcf10` (`worker_id`),
  CONSTRAINT `fka2c158369bebcf10` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fka2c1583686b2de7a` FOREIGN KEY (`configuration_id`) REFERENCES `machine_workers_configuration_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkd47281efffeb5538` (`machine`),
  CONSTRAINT `fkd47281efffeb5538` FOREIGN KEY (`machine`) REFERENCES `machine` (`machine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_workers_configuration_unit`
--

LOCK TABLES `machine_workers_configuration_unit` WRITE;
/*!40000 ALTER TABLE `machine_workers_configuration_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_workers_configuration_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_function`
--

DROP TABLE IF EXISTS `manual_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_function` (
  `assignment_function_id` bigint(20) NOT NULL,
  PRIMARY KEY (`assignment_function_id`),
  CONSTRAINT `mnual_function_assignment_function_fkey` FOREIGN KEY (`assignment_function_id`) REFERENCES `assignment_function` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_function`
--

LOCK TABLES `manual_function` WRITE;
/*!40000 ALTER TABLE `manual_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_function` ENABLE KEYS */;
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
  KEY `fk11d36527f11b2d0` (`unit_type`),
  CONSTRAINT `fk11d36527f11b2d0` FOREIGN KEY (`unit_type`) REFERENCES `unit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk11d365279578651e` FOREIGN KEY (`category_id`) REFERENCES `material_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkb3e9425efda874f` (`order_element_id`),
  CONSTRAINT `fkb3e9425efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkb3e9425b5c68337` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk3525435419b9dfde` (`order_element_template_id`),
  CONSTRAINT `fk3525435419b9dfde` FOREIGN KEY (`order_element_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk35254354b5c68337` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk84c66516b53669f2` (`parent_id`),
  CONSTRAINT `fk84c66516b53669f2` FOREIGN KEY (`parent_id`) REFERENCES `material_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_category`
--

LOCK TABLES `material_category` WRITE;
/*!40000 ALTER TABLE `material_category` DISABLE KEYS */;
INSERT INTO `material_category` VALUES (808,5,'MATERIAL_CATEGORY0001','Imported materials without category',1,0,NULL),(2223,2,'MATERIAL_CATEGORY0035','A',1,0,NULL),(2224,2,'MATERIAL_CATEGORY0036','B',1,0,NULL),(2225,2,'MATERIAL_CATEGORY0037','C',1,0,NULL),(2226,2,'MATERIAL_CATEGORY0038','D',1,0,NULL),(2227,2,'MATERIAL_CATEGORY0039','E',1,0,NULL),(2228,2,'MATERIAL_CATEGORY0041','Fe',1,0,NULL),(2229,2,'MATERIAL_CATEGORY0043','G',1,0,NULL),(2230,2,'MATERIAL_CATEGORY0044','H',1,0,NULL),(2231,2,'MATERIAL_CATEGORY0045','I',1,0,NULL),(2232,2,'MATERIAL_CATEGORY0046','K',1,0,NULL),(2233,2,'MATERIAL_CATEGORY0047','L',1,0,NULL),(2234,2,'MATERIAL_CATEGORY0048','M',1,0,NULL),(2235,2,'MATERIAL_CATEGORY0049','N',1,0,NULL),(2236,2,'MATERIAL_CATEGORY0051','RR',1,0,NULL),(2237,2,'MATERIAL_CATEGORY0052','EE',1,0,NULL),(2238,2,'MATERIAL_CATEGORY0054','GG',1,0,NULL),(2239,2,'MATERIAL_CATEGORY0055','HH',1,0,NULL),(2240,2,'MATERIAL_CATEGORY0056','II',1,0,NULL),(2241,2,'MATERIAL_CATEGORY0057','OO',1,0,NULL),(2242,2,'MATERIAL_CATEGORY0058','QQ',1,0,NULL),(2243,2,'MATERIAL_CATEGORY0059','WW',1,0,NULL),(2244,2,'MATERIAL_CATEGORY0061','GGG',1,0,NULL);
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
  KEY `fkb92b59485567ad13` (`user_id`),
  CONSTRAINT `fkb92b59485567ad13` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkb92b594887287288` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkb92b5948edc4db41` FOREIGN KEY (`profile_id`) REFERENCES `profile_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_authorization`
--

LOCK TABLES `order_authorization` WRITE;
/*!40000 ALTER TABLE `order_authorization` DISABLE KEYS */;
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
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  `init_date` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `last_advance_meausurement_for_spreading` decimal(19,2) DEFAULT NULL,
  `dirty_last_advance_measurement_for_spreading` tinyint(1) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `template` bigint(20) DEFAULT NULL,
  `external_code` varchar(255) DEFAULT NULL,
  `position_in_container` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk92271f0b1e635c19` (`parent`),
  KEY `fk92271f0bd97bcc8c` (`template`),
  CONSTRAINT `fk92271f0b1e635c19` FOREIGN KEY (`parent`) REFERENCES `order_line_group` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk92271f0bd97bcc8c` FOREIGN KEY (`template`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element`
--

LOCK TABLES `order_element` WRITE;
/*!40000 ALTER TABLE `order_element` DISABLE KEYS */;
INSERT INTO `order_element` VALUES (2325,2,'This is a test project',NULL,'ORDER0001','2012-12-19 19:54:29',NULL,0.00,1,NULL,NULL,NULL,NULL),(2329,3,'Origen plantilla',NULL,'ORDER0003','2012-12-19 22:55:01','2012-12-31 00:00:00',0.00,0,NULL,NULL,NULL,NULL),(2330,3,'Tarea 1',NULL,'ORDER0003-0001',NULL,NULL,0.00,0,2329,NULL,NULL,0),(2331,3,'Tarea 2',NULL,'ORDER0003-0002',NULL,NULL,0.00,0,2329,NULL,NULL,1),(2333,4,'Viaducto',NULL,'ORDER0004','2012-10-11 00:00:00','2013-02-03 00:00:00',0.00,1,NULL,3544,NULL,NULL),(2334,4,'Tarea 1',NULL,'ORDER0004-0001',NULL,NULL,0.00,0,2333,3545,NULL,0),(2335,4,'Tarea 2',NULL,'ORDER0004-0002',NULL,NULL,0.00,0,2333,3546,NULL,1),(2362,4,'Tarea 3',NULL,'ORDER0004-0003',NULL,NULL,0.00,0,2333,NULL,NULL,2),(2363,4,'Tarea 4',NULL,'ORDER0004-0004',NULL,NULL,0.00,0,2333,NULL,NULL,3),(4664,4,'Proyecto B',NULL,'ORDER0005','2012-10-09 23:50:55',NULL,0.00,1,NULL,NULL,NULL,NULL),(4673,4,'Tarea 1',NULL,'ORDER0005-0001',NULL,NULL,0.00,0,4664,NULL,NULL,0),(4704,3,'Tarea 2',NULL,'ORDER0005-0002',NULL,NULL,0.00,0,4664,NULL,NULL,1),(4705,3,'Tarea 3',NULL,'ORDER0005-0003',NULL,NULL,0.00,0,4664,NULL,NULL,2);
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
  KEY `fke8344cc0c1c2746e` (`label_id`),
  CONSTRAINT `fke8344cc0efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fke8344cc0c1c2746e` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `description` text,
  `start_as_days_from_beginning` int(11) DEFAULT NULL,
  `deadline_as_days_from_beginning` int(11) DEFAULT NULL,
  `scheduling_state_type` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `position_in_container` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4339b2e41638aab` (`parent`),
  CONSTRAINT `fk4339b2e41638aab` FOREIGN KEY (`parent`) REFERENCES `order_line_group_template` (`group_template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element_template`
--

LOCK TABLES `order_element_template` WRITE;
/*!40000 ALTER TABLE `order_element_template` DISABLE KEYS */;
INSERT INTO `order_element_template` VALUES (3544,1,'Modelo de viaducto',NULL,10,20,3,NULL,NULL),(3545,1,'Tarea 1',NULL,NULL,NULL,0,3544,0),(3546,1,'Tarea 2',NULL,NULL,NULL,0,3544,1);
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
  KEY `fk616de2a3c1c2746e` (`label_id`),
  CONSTRAINT `fk616de2a319b9dfde` FOREIGN KEY (`order_element_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk616de2a3c1c2746e` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkfe6fb5758b37665c` (`quality_form_id`),
  CONSTRAINT `fkfe6fb5758b37665c` FOREIGN KEY (`quality_form_id`) REFERENCES `quality_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkfe6fb57519b9dfde` FOREIGN KEY (`order_element_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `budget` decimal(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_element_id`),
  CONSTRAINT `fk2d124245efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (2330,1,0.00),(2331,1,0.00),(2334,1,3000.00),(2335,1,1000.00),(2362,1,33.00),(2363,1,120.00),(4673,1,0.00),(4704,1,0.00),(4705,1,0.00);
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
  PRIMARY KEY (`order_element_id`),
  CONSTRAINT `fkdce41405efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_group`
--

LOCK TABLES `order_line_group` WRITE;
/*!40000 ALTER TABLE `order_line_group` DISABLE KEYS */;
INSERT INTO `order_line_group` VALUES (2325),(2329),(2333),(4664);
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
  PRIMARY KEY (`group_template_id`),
  CONSTRAINT `fk9c819f74ddc82952` FOREIGN KEY (`group_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_group_template`
--

LOCK TABLES `order_line_group_template` WRITE;
/*!40000 ALTER TABLE `order_line_group_template` DISABLE KEYS */;
INSERT INTO `order_line_group_template` VALUES (3544);
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
  `budget` decimal(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_line_template_id`),
  CONSTRAINT `fke4c379349fb7fc18` FOREIGN KEY (`order_line_template_id`) REFERENCES `order_element_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_template`
--

LOCK TABLES `order_line_template` WRITE;
/*!40000 ALTER TABLE `order_line_template` DISABLE KEYS */;
INSERT INTO `order_line_template` VALUES (3545,0,0.00),(3546,0,0.00);
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
  KEY `fk75a2f39d4ec080cf` (`customer`),
  CONSTRAINT `fk75a2f39d4ec080cf` FOREIGN KEY (`customer`) REFERENCES `external_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk75a2f39d504f463e` FOREIGN KEY (`order_element_id`) REFERENCES `order_line_group` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk75a2f39da44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (2325,NULL,NULL,1,0,0.00,0.00,0,NULL,NULL,0,NULL,202,0),(2329,NULL,NULL,1,2,0.00,0.00,400,NULL,NULL,0,NULL,202,0),(2333,NULL,NULL,1,4,0.00,0.00,540,NULL,NULL,0,NULL,202,0),(4664,NULL,NULL,1,3,0.00,0.00,250,NULL,NULL,0,NULL,202,0);
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
  KEY `fk6476ce4ba44abee3` (`base_calendar_id`),
  CONSTRAINT `fk6476ce4b9a4a7d90` FOREIGN KEY (`order_template_id`) REFERENCES `order_line_group_template` (`group_template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6476ce4ba44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_template`
--

LOCK TABLES `order_template` WRITE;
/*!40000 ALTER TABLE `order_template` DISABLE KEYS */;
INSERT INTO `order_template` VALUES (3544,202);
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
  KEY `fka391ce7a2380ca7` (`ownerscenario`),
  CONSTRAINT `fka391ce7a2380ca7` FOREIGN KEY (`ownerscenario`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_version`
--

LOCK TABLES `order_version` WRITE;
/*!40000 ALTER TABLE `order_version` DISABLE KEYS */;
INSERT INTO `order_version` VALUES (2527,2,'2012-12-19 19:54:34',909),(2531,3,'2012-12-19 22:55:32',909),(2533,4,'2012-12-19 23:01:46',909),(5052,4,'2012-12-19 23:52:22',909);
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
  `progress_all_by_num_hours` decimal(19,6) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`planning_data_id`),
  CONSTRAINT `fkbb58534c6ccf87c5` FOREIGN KEY (`planning_data_id`) REFERENCES `task_group` (`task_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning_data`
--

LOCK TABLES `planning_data` WRITE;
/*!40000 ALTER TABLE `planning_data` DISABLE KEYS */;
INSERT INTO `planning_data` VALUES (3234,0.000000,0.000000,0.000000,3),(3237,0.000000,0.000000,0.000000,4),(4955,0.000000,0.000000,0.000000,4);
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
  `role` varchar(255) DEFAULT NULL,
  KEY `fkd557d8a7edc4db41` (`profile_id`),
  CONSTRAINT `fkd557d8a7edc4db41` FOREIGN KEY (`profile_id`) REFERENCES `profile_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_roles`
--

LOCK TABLES `profile_roles` WRITE;
/*!40000 ALTER TABLE `profile_roles` DISABLE KEYS */;
INSERT INTO `profile_roles` VALUES (1616,'ROLE_USER_ACCOUNTS'),(1616,'ROLE_MAIN_SETTINGS'),(1616,'ROLE_PROFILES'),(1617,'ROLE_MATERIALS'),(1617,'ROLE_PROGRESS_TYPES'),(1617,'ROLE_WORK_AND_PROGRESS_PER_PROJECT_REPORT'),(1617,'ROLE_PLANNING'),(1617,'ROLE_LABELS'),(1617,'ROLE_QUALITY_FORMS'),(1617,'ROLE_MATERIALS_NEED_AT_DATE_REPORT'),(1617,'ROLE_TASK_SCHEDULING_STATUS_IN_PROJECT_REPORT'),(1617,'ROLE_ESTIMATED_PLANNED_HOURS_PER_TASK_REPORT'),(1617,'ROLE_MACHINES'),(1617,'ROLE_RECEIVED_FROM_CUSTOMERS'),(1617,'ROLE_CRITERIA'),(1617,'ROLE_WORKERS'),(1617,'ROLE_READ_ALL_PROJECTS'),(1617,'ROLE_RECEIVED_FROM_SUBCONTRACTORS'),(1617,'ROLE_WORK_AND_PROGRESS_PER_TASK_REPORT'),(1617,'ROLE_CALENDARS'),(1617,'ROLE_MATERIAL_UNITS'),(1617,'ROLE_VIRTUAL_WORKERS'),(1617,'ROLE_TEMPLATES'),(1617,'ROLE_EDIT_ALL_PROJECTS'),(1617,'ROLE_CALENDAR_EXCEPTION_DAYS'),(1617,'ROLE_CREATE_PROJECTS'),(1618,'ROLE_MACHINES'),(1618,'ROLE_WORKERS'),(1618,'ROLE_HOURS_TYPES'),(1618,'ROLE_CALENDARS'),(1618,'ROLE_PROJECT_COSTS_REPORT'),(1618,'ROLE_COST_CATEGORIES'),(1618,'ROLE_VIRTUAL_WORKERS'),(1618,'ROLE_CALENDAR_EXCEPTION_DAYS'),(1619,'ROLE_HOURS_TYPES'),(1619,'ROLE_TOTAL_WORKED_HOURS_BY_RESOURCE_IN_A_MONTH_REPORT'),(1619,'ROLE_TIMESHEET_LINES_LIST'),(1619,'ROLE_TIMESHEETS'),(1619,'ROLE_TIMESHEETS_TEMPLATES'),(1619,'ROLE_EXPENSES'),(1619,'ROLE_HOURS_WORKED_PER_RESOURCE_REPORT'),(1620,'ROLE_RECEIVED_FROM_CUSTOMERS'),(1620,'ROLE_RECEIVED_FROM_SUBCONTRACTORS'),(1620,'ROLE_COMPANIES'),(1620,'ROLE_SEND_TO_CUSTOMERS'),(1620,'ROLE_SEND_TO_SUBCONTRACTORS'),(1621,'ROLE_TASK_SCHEDULING_STATUS_IN_PROJECT_REPORT'),(1621,'ROLE_ESTIMATED_PLANNED_HOURS_PER_TASK_REPORT'),(1621,'ROLE_READ_ALL_PROJECTS'),(1621,'ROLE_TOTAL_WORKED_HOURS_BY_RESOURCE_IN_A_MONTH_REPORT'),(1621,'ROLE_WORK_AND_PROGRESS_PER_PROJECT_REPORT'),(1621,'ROLE_WORK_AND_PROGRESS_PER_TASK_REPORT'),(1621,'ROLE_PROJECT_COSTS_REPORT'),(1621,'ROLE_HOURS_WORKED_PER_RESOURCE_REPORT'),(1621,'ROLE_MATERIALS_NEED_AT_DATE_REPORT'),(1621,'ROLE_PROJECT_STATUS_REPORT');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_table`
--

LOCK TABLES `profile_table` WRITE;
/*!40000 ALTER TABLE `profile_table` DISABLE KEYS */;
INSERT INTO `profile_table` VALUES (1616,0,'Systems Administrator'),(1617,0,'Project Manager'),(1618,0,'Human Resources & Costs Manager'),(1619,0,'Time Tracking & Expenses Responsible'),(1620,0,'Outsourcing Manager'),(1621,0,'Reports Responsible');
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
  KEY `fkf635cc04b216ed4c` (`advance_type_id`),
  CONSTRAINT `fkf635cc04b216ed4c` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`quality_form_id`,`idx`),
  CONSTRAINT `fkad6003c58b37665c` FOREIGN KEY (`quality_form_id`) REFERENCES `quality_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `resource_base_calendar_id_key` (`base_calendar_id`),
  CONSTRAINT `fkebabc40edc874c20` FOREIGN KEY (`base_calendar_id`) REFERENCES `resource_calendar` (`base_calendar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1819,3,'WORKER0001',1,203,'NON_LIMITING_RESOURCE'),(2829,2,'WORKER0002',1,2929,'NON_LIMITING_RESOURCE'),(2831,1,'WORKER0003',1,2930,'NON_LIMITING_RESOURCE');
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
  `task` bigint(20) DEFAULT NULL,
  `assignment_function` bigint(20) DEFAULT NULL,
  `intended_resources_per_day` decimal(19,2) DEFAULT NULL,
  `intended_total_assignment` int(11) DEFAULT '0',
  `intended_non_consolidated_effort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fke8a96db115671e92` (`assignment_function`),
  KEY `fke8a96db1ff61540d` (`task`),
  CONSTRAINT `fke8a96db115671e92` FOREIGN KEY (`assignment_function`) REFERENCES `assignment_function` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fke8a96db1ff61540d` FOREIGN KEY (`task`) REFERENCES `task` (`task_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_allocation`
--

LOCK TABLES `resource_allocation` WRITE;
/*!40000 ALTER TABLE `resource_allocation` DISABLE KEYS */;
INSERT INTO `resource_allocation` VALUES (3743,4,1.00,NULL,3235,NULL,1.00,360000,360000),(3744,4,1.00,NULL,3236,NULL,1.00,1080000,1080000),(5151,4,1.00,NULL,4954,NULL,1.00,432000,432000);
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
  PRIMARY KEY (`base_calendar_id`),
  CONSTRAINT `fk9619184fa44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_calendar`
--

LOCK TABLES `resource_calendar` WRITE;
/*!40000 ALTER TABLE `resource_calendar` DISABLE KEYS */;
INSERT INTO `resource_calendar` VALUES (203,1),(2929,1),(2930,1);
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
  KEY `fk27c2a21648d21790` (`resource_id`),
  CONSTRAINT `fk27c2a21648d21790` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk27c2a216c29ad8eb` FOREIGN KEY (`cost_category_id`) REFERENCES `cost_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `role` varchar(255) DEFAULT NULL,
  KEY `fk2e7e6bcc5567ad13` (`user_id`),
  CONSTRAINT `fk2e7e6bcc5567ad13` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_table`
--

LOCK TABLES `roles_table` WRITE;
/*!40000 ALTER TABLE `roles_table` DISABLE KEYS */;
INSERT INTO `roles_table` VALUES (1717,'ROLE_READ_ALL_PROJECTS'),(1717,'ROLE_SUPERUSER'),(1717,'ROLE_EDIT_ALL_PROJECTS'),(1717,'ROLE_CREATE_PROJECTS'),(1718,'ROLE_WS_READER'),(1719,'ROLE_WS_WRITER'),(1719,'ROLE_WS_READER'),(1720,'ROLE_WS_SUBCONTRACTING');
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
  KEY `fkd1c57390fd99606d` (`predecessor`),
  CONSTRAINT `fkd1c57390fd99606d` FOREIGN KEY (`predecessor`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
INSERT INTO `scenario` VALUES (909,0,'master',NULL,NULL,NULL);
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
  KEY `fk91bbca7423b85cf1` (`order_version_id`),
  CONSTRAINT `fk91bbca74c0fb9d8e` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk91bbca7423b85cf1` FOREIGN KEY (`order_version_id`) REFERENCES `order_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk91bbca7487287288` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_orders`
--

LOCK TABLES `scenario_orders` WRITE;
/*!40000 ALTER TABLE `scenario_orders` DISABLE KEYS */;
INSERT INTO `scenario_orders` VALUES (2325,2527,909),(2329,2531,909),(2333,2533,909),(4664,5052,909);
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
  KEY `fk672eed98efda874f` (`order_element_id`),
  CONSTRAINT `fk672eed98efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling_data_for_version`
--

LOCK TABLES `scheduling_data_for_version` WRITE;
/*!40000 ALTER TABLE `scheduling_data_for_version` DISABLE KEYS */;
INSERT INTO `scheduling_data_for_version` VALUES (2426,2,4,2325),(2430,3,3,2329),(2431,3,0,2330),(2432,3,0,2331),(2434,4,3,2333),(2435,4,0,2334),(2436,4,0,2335),(2463,4,0,2362),(2464,4,0,2363),(4765,4,3,4664),(4774,4,0,4673),(4805,3,0,4704),(4806,3,0,4705);
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
  KEY `fk84f61df19bfe55d0` (`scheduling_state_for_version_id`),
  CONSTRAINT `fk84f61df19bfe55d0` FOREIGN KEY (`scheduling_state_for_version_id`) REFERENCES `scheduling_data_for_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk84f61df123b85cf1` FOREIGN KEY (`order_version_id`) REFERENCES `order_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk84f61df1efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling_states_by_order_version`
--

LOCK TABLES `scheduling_states_by_order_version` WRITE;
/*!40000 ALTER TABLE `scheduling_states_by_order_version` DISABLE KEYS */;
INSERT INTO `scheduling_states_by_order_version` VALUES (2325,2426,2527),(2329,2430,2531),(2330,2431,2531),(2331,2432,2531),(2333,2434,2533),(2334,2435,2533),(2335,2436,2533),(2362,2463,2533),(2363,2464,2533),(4664,4765,5052),(4673,4774,5052),(4704,4805,5052),(4705,4806,5052);
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
  PRIMARY KEY (`assignment_function_id`),
  CONSTRAINT `fkc9c3fe691a5e11f8` FOREIGN KEY (`assignment_function_id`) REFERENCES `assignment_function` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkcee46998421c7cf4` (`scenario`),
  CONSTRAINT `fkcee46998421c7cf4` FOREIGN KEY (`scenario`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkcee469987518838c` FOREIGN KEY (`resource_allocation_id`) REFERENCES `specific_resource_allocation` (`resource_allocation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_day_assignments_container`
--

LOCK TABLES `specific_day_assignments_container` WRITE;
/*!40000 ALTER TABLE `specific_day_assignments_container` DISABLE KEYS */;
INSERT INTO `specific_day_assignments_container` VALUES (4143,4,3743,909,'2012-10-11',0,'2013-01-04',14400);
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
  KEY `fkf0e85724eae850b2` (`resource`),
  CONSTRAINT `fkf0e8572475ed79ba` FOREIGN KEY (`resource_allocation_id`) REFERENCES `resource_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkf0e85724eae850b2` FOREIGN KEY (`resource`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_resource_allocation`
--

LOCK TABLES `specific_resource_allocation` WRITE;
/*!40000 ALTER TABLE `specific_resource_allocation` DISABLE KEYS */;
INSERT INTO `specific_resource_allocation` VALUES (3743,2831);
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
  `length_percentage` decimal(19,2) NOT NULL,
  `amount_work_percentage` decimal(19,2) NOT NULL,
  `stretch_position` int(11) NOT NULL,
  PRIMARY KEY (`assignment_function_id`,`stretch_position`),
  CONSTRAINT `fkee374673ae0677b8` FOREIGN KEY (`assignment_function_id`) REFERENCES `stretches_function` (`assignment_function_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `stretches_function`
--

DROP TABLE IF EXISTS `stretches_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretches_function` (
  `assignment_function_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignment_function_id`),
  CONSTRAINT `fk4949f0241a5e11f8` FOREIGN KEY (`assignment_function_id`) REFERENCES `assignment_function` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk35bc4ed63804cfa` (`external_company`),
  CONSTRAINT `fk35bc4ed63804cfa` FOREIGN KEY (`external_company`) REFERENCES `external_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontracted_task_data`
--

LOCK TABLES `subcontracted_task_data` WRITE;
/*!40000 ALTER TABLE `subcontracted_task_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcontracted_task_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcontractor_communication`
--

DROP TABLE IF EXISTS `subcontractor_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcontractor_communication` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `communication_type` int(11) DEFAULT NULL,
  `communication_date` datetime DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `subcontracted_task_data` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontractor_communication`
--

LOCK TABLES `subcontractor_communication` WRITE;
/*!40000 ALTER TABLE `subcontractor_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcontractor_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcontractor_communication_values`
--

DROP TABLE IF EXISTS `subcontractor_communication_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcontractor_communication_values` (
  `subcontractor_communication_id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `progress` decimal(19,2) DEFAULT NULL,
  `idx` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontractor_communication_values`
--

LOCK TABLES `subcontractor_communication_values` WRITE;
/*!40000 ALTER TABLE `subcontractor_communication_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcontractor_communication_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcontractor_deliver_date`
--

DROP TABLE IF EXISTS `subcontractor_deliver_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcontractor_deliver_date` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `save_date` datetime DEFAULT NULL,
  `subcontractor_deliver_date` datetime DEFAULT NULL,
  `communication_date` datetime DEFAULT NULL,
  `subcontracted_task_data_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontractor_deliver_date`
--

LOCK TABLES `subcontractor_deliver_date` WRITE;
/*!40000 ALTER TABLE `subcontractor_deliver_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcontractor_deliver_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sum_charged_effort`
--

DROP TABLE IF EXISTS `sum_charged_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sum_charged_effort` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `direct_charged_effort` int(11) DEFAULT NULL,
  `indirect_charged_effort` int(11) DEFAULT NULL,
  `order_element` bigint(20) DEFAULT NULL,
  `first_timesheet_date` datetime DEFAULT NULL,
  `last_timesheet_date` datetime DEFAULT NULL,
  `finished_timesheets` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sum_charged_effort_order_element_fkey` (`order_element`),
  CONSTRAINT `sum_charged_effort_order_element_fkey` FOREIGN KEY (`order_element`) REFERENCES `order_element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sum_charged_effort`
--

LOCK TABLES `sum_charged_effort` WRITE;
/*!40000 ALTER TABLE `sum_charged_effort` DISABLE KEYS */;
/*!40000 ALTER TABLE `sum_charged_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sum_expenses`
--

DROP TABLE IF EXISTS `sum_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sum_expenses` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `order_element_id` bigint(20) DEFAULT NULL,
  `total_direct_expenses` decimal(19,2) DEFAULT NULL,
  `total_indirect_expenses` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sum_expenses_order_element_fkey` (`order_element_id`),
  CONSTRAINT `sum_expenses_order_element_fkey` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sum_expenses`
--

LOCK TABLES `sum_expenses` WRITE;
/*!40000 ALTER TABLE `sum_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sum_expenses` ENABLE KEYS */;
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
  `constraint_date_effort_duration` int(11) DEFAULT '0',
  PRIMARY KEY (`task_element_id`),
  UNIQUE KEY `task_subcontrated_task_data_id_key` (`subcontrated_task_data_id`),
  CONSTRAINT `fk3635854936bb8c` FOREIGN KEY (`task_element_id`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3635855b595a0` FOREIGN KEY (`subcontrated_task_data_id`) REFERENCES `subcontracted_task_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (3232,1,0,NULL,NULL,0,NULL,NULL,NULL),(3233,1,0,NULL,NULL,0,NULL,NULL,NULL),(3235,1,0,NULL,NULL,0,NULL,NULL,NULL),(3236,1,0,NULL,NULL,0,NULL,NULL,NULL),(3243,1,0,NULL,NULL,0,NULL,NULL,NULL),(3244,1,0,NULL,NULL,1,NULL,NULL,NULL),(4954,1,0,NULL,NULL,0,NULL,NULL,NULL),(4964,1,0,NULL,NULL,0,NULL,NULL,NULL),(4965,1,0,NULL,NULL,0,NULL,NULL,NULL);
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
  `notes` text,
  `start_date` date NOT NULL,
  `start_day_duration` int(11) DEFAULT NULL,
  `end_date` date NOT NULL,
  `end_day_duration` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `advance_percentage` decimal(19,4) DEFAULT NULL,
  `sum_of_assigned_effort` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `base_calendar_id` bigint(20) DEFAULT NULL,
  `position_in_parent` int(11) DEFAULT NULL,
  `updated_from_timesheets` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkc631a642a44abee3` (`base_calendar_id`),
  KEY `fkc631a642a5f3c581` (`parent`),
  CONSTRAINT `fkc631a642a44abee3` FOREIGN KEY (`base_calendar_id`) REFERENCES `base_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkc631a642a5f3c581` FOREIGN KEY (`parent`) REFERENCES `task_group` (`task_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_element`
--

LOCK TABLES `task_element` WRITE;
/*!40000 ALTER TABLE `task_element` DISABLE KEYS */;
INSERT INTO `task_element` VALUES (3232,3,'Tarea 1',NULL,'2012-12-19',0,'2013-01-04',14400,NULL,0.0000,0,3234,NULL,0,0),(3233,3,'Tarea 2',NULL,'2012-12-19',0,'2013-02-08',14400,NULL,0.0000,0,3234,NULL,1,0),(3234,3,'Origen plantilla',NULL,'2012-12-19',0,'2013-02-08',14400,'2012-12-31',0.0000,0,NULL,NULL,NULL,0),(3235,4,'Tarea 1',NULL,'2012-10-11',0,'2013-01-04',14400,NULL,0.0000,0,3237,NULL,0,0),(3236,4,'Tarea 2',NULL,'2013-01-04',14400,'2013-02-27',0,NULL,0.0000,0,3237,NULL,1,0),(3237,5,'Viaducto',NULL,'2012-10-11',0,'2013-02-27',0,'2013-02-03',0.0000,1440000,NULL,NULL,NULL,0),(3243,4,'Tarea 3',NULL,'2012-10-11',0,'2012-10-26',7200,NULL,0.0000,0,3237,NULL,2,0),(3244,4,'Tarea 4',NULL,'2012-10-18',0,'2012-10-26',7200,NULL,0.0000,0,3237,NULL,3,0),(4954,5,'Tarea 1',NULL,'2012-10-09',0,'2013-01-09',0,NULL,0.0000,0,4955,NULL,0,0),(4955,5,'Proyecto B',NULL,'2012-10-09',0,'2013-01-09',0,NULL,0.0000,432000,NULL,NULL,NULL,0),(4964,3,'Tarea 2',NULL,'2012-10-09',0,'2012-10-29',28800,NULL,0.0000,0,4955,NULL,1,0),(4965,3,'Tarea 3',NULL,'2012-10-09',0,'2012-10-10',7200,NULL,0.0000,0,4955,NULL,2,0);
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
  PRIMARY KEY (`task_element_id`),
  CONSTRAINT `fk4d9497454936bb8c` FOREIGN KEY (`task_element_id`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_group`
--

LOCK TABLES `task_group` WRITE;
/*!40000 ALTER TABLE `task_group` DISABLE KEYS */;
INSERT INTO `task_group` VALUES (3234),(3237),(4955);
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
  `constraint_date_effort_duration` int(11) DEFAULT '0',
  PRIMARY KEY (`task_element_id`),
  CONSTRAINT `fkd04de7364936bb8c` FOREIGN KEY (`task_element_id`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fk4356e07e8b37665c` (`quality_form_id`),
  CONSTRAINT `fk4356e07e8b37665c` FOREIGN KEY (`quality_form_id`) REFERENCES `quality_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk4356e07eefda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`task_quality_form_id`,`idx`),
  CONSTRAINT `fk101a54bf87fa6b5d` FOREIGN KEY (`task_quality_form_id`) REFERENCES `task_quality_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `task_source_schedulingdata_key` (`schedulingdata`),
  CONSTRAINT `fk7950e0159a2c0abd` FOREIGN KEY (`schedulingdata`) REFERENCES `scheduling_data_for_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk7950e0153d72bc6f` FOREIGN KEY (`id`) REFERENCES `task_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_source`
--

LOCK TABLES `task_source` WRITE;
/*!40000 ALTER TABLE `task_source` DISABLE KEYS */;
INSERT INTO `task_source` VALUES (3232,3,2431),(3233,3,2432),(3234,3,2430),(3235,4,2435),(3236,4,2436),(3237,4,2434),(3243,4,2463),(3244,4,2464),(4954,4,4774),(4955,4,4765),(4964,3,4805),(4965,3,4806);
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
  KEY `fka01fe4eee036cfed` (`hours_group_id`),
  CONSTRAINT `fka01fe4ee8c80ccb7` FOREIGN KEY (`task_source_id`) REFERENCES `task_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fka01fe4eee036cfed` FOREIGN KEY (`hours_group_id`) REFERENCES `hours_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_source_hours_groups`
--

LOCK TABLES `task_source_hours_groups` WRITE;
/*!40000 ALTER TABLE `task_source_hours_groups` DISABLE KEYS */;
INSERT INTO `task_source_hours_groups` VALUES (3232,3434),(3233,3435),(3235,3444),(3236,3445),(3243,3472),(3244,3473),(4954,4872),(4964,4903),(4965,4904);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_work_hours`
--

LOCK TABLES `type_of_work_hours` WRITE;
/*!40000 ALTER TABLE `type_of_work_hours` DISABLE KEYS */;
INSERT INTO `type_of_work_hours` VALUES (1010,2,'Default','WORK_HOURS_TYPE0001',30.00,1,1),(1011,1,'Overtime','WORK_HOURS_TYPE0002',50.00,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (707,8,'UNIT_TYPE0001','units',1),(708,7,'UNIT_TYPE0002','kg',1),(709,6,'UNIT_TYPE0003','km',1),(710,5,'UNIT_TYPE0004','l',1),(711,4,'UNIT_TYPE0005','m',1),(712,3,'UNIT_TYPE0006','m2',1),(713,2,'UNIT_TYPE0007','m3',1),(714,1,'UNIT_TYPE0008','tn',1);
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
  KEY `fkc74605deedc4db41` (`profile_id`),
  CONSTRAINT `fkc74605de5567ad13` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkc74605deedc4db41` FOREIGN KEY (`profile_id`) REFERENCES `profile_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1721,1617),(1722,1618),(1723,1620),(1724,1621);
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
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `lastconnectedscenario` bigint(20) DEFAULT NULL,
  `libreplan_user` tinyint(1) DEFAULT NULL,
  `application_language` int(11) DEFAULT '0',
  `expand_company_planning_view_charts` tinyint(1) NOT NULL,
  `expand_order_planning_view_charts` tinyint(1) NOT NULL,
  `expand_resource_load_view_charts` tinyint(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_table_login_name_key` (`login_name`),
  KEY `fk7358465a4cd98327` (`lastconnectedscenario`),
  CONSTRAINT `fk7358465a4cd98327` FOREIGN KEY (`lastconnectedscenario`) REFERENCES `scenario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1717,1,'admin','e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a',NULL,0,NULL,1,0,0,1,1,'',''),(1718,1,'wsreader','9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc',NULL,0,NULL,1,0,0,1,1,'',''),(1719,1,'wswriter','a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8',NULL,0,NULL,1,0,0,1,1,'',''),(1720,1,'wssubcontracting','ce46d7f9a6d17b8ed0eceb71944154b5e42884eef2a111f2a3609b827d9cc2c5c007b9f04343eeb9c8db28696d1426c3c29c2fee2e95332790a9c208b1602224',NULL,0,NULL,1,0,0,1,1,'',''),(1721,1,'manager','4a9c5fecbaa3c8fe4facd803e0f85aded921757addc9072758fac7811dda1bc7d1ae0c2c91f48e604d0b61b21d3c3f7b19f8d176f28c4e3aa3eacb0cd263c016',NULL,0,NULL,1,0,0,1,1,'',''),(1722,1,'hresources','9cef1471412b2d225ca48841f390402ac14127682efdaafc0463114df6e77c7f46aeac5f7e828369eae3d32d6b1e002c0f333bb13723d765be9477be841b82de',NULL,0,NULL,1,0,0,1,1,'',''),(1723,1,'outsourcing','4e7e9a5e908c11370a48a90214134647f9429865172f76dd2c80df01d39b6c503b57268d1f02cb04ee590a0c357d8b2dcf91ceb21ffb622b5a77ff707fa4fc3a',NULL,0,NULL,1,0,0,1,1,'',''),(1724,1,'reports','f61ce5c70ced64bdc89bb9ded8dd2076baefb51a45997b5aca911e0d2df7997605c7fc3b6c793fa886591b531e3c2430e31e8cce3a495b59c8e5b11c889f3e85',NULL,0,NULL,1,0,0,1,1,'','');
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
  PRIMARY KEY (`virtual_worker_id`),
  CONSTRAINT `fkee053f32f2ed6dc` FOREIGN KEY (`virtual_worker_id`) REFERENCES `worker` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkfd7aa62248d21790` (`resource_id`),
  CONSTRAINT `fkfd7aa62248d21790` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkfd7aa62278e4e2ea` FOREIGN KEY (`ork_report_type_id`) REFERENCES `work_report_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkfd7aa622efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkbb262920131853a1` (`work_report_type_id`),
  CONSTRAINT `fkbb262920131853a1` FOREIGN KEY (`work_report_type_id`) REFERENCES `work_report_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkbb262920707cd777` FOREIGN KEY (`label_type_id`) REFERENCES `label_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkbb262920c1c2746e` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `effort` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `clock_start` int(11) DEFAULT NULL,
  `clock_finish` int(11) DEFAULT NULL,
  `work_report_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `order_element_id` bigint(20) NOT NULL,
  `type_work_hours_id` bigint(20) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_report_line_code_key` (`code`),
  KEY `fke2af47f1efda874f` (`order_element_id`),
  KEY `fke2af47f148d21790` (`resource_id`),
  KEY `fke2af47f1e7e1020b` (`type_work_hours_id`),
  KEY `fke2af47f1f1a3177c` (`work_report_id`),
  CONSTRAINT `fke2af47f148d21790` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fke2af47f1e7e1020b` FOREIGN KEY (`type_work_hours_id`) REFERENCES `type_of_work_hours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fke2af47f1efda874f` FOREIGN KEY (`order_element_id`) REFERENCES `order_element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fke2af47f1f1a3177c` FOREIGN KEY (`work_report_id`) REFERENCES `work_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_report_type`
--

LOCK TABLES `work_report_type` WRITE;
/*!40000 ALTER TABLE `work_report_type` DISABLE KEYS */;
INSERT INTO `work_report_type` VALUES (1111,2,'Default','WORKREPORTTYPE0001',0,0,0,1,0),(1112,1,'Personal timesheets','WORKREPORTTYPE0002',0,1,0,1,0);
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
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`worker_id`),
  UNIQUE KEY `worker_user_id_key` (`user_id`),
  CONSTRAINT `worker_user_fkey` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `fkd162537e40901220` FOREIGN KEY (`worker_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1819,'Lorenzo','Tilve','1234A',NULL),(2829,'Manuel','Rego','12311A',NULL),(2831,'Javier','Morán','444',NULL);
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
  KEY `fkf796fbd0c1c2746e` (`label_id`),
  CONSTRAINT `fkf796fbd0f1a3177c` FOREIGN KEY (`work_report_id`) REFERENCES `work_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkf796fbd0c1c2746e` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `fkcb8fc1cdc1c2746e` (`label_id`),
  CONSTRAINT `fkcb8fc1cd5078e161` FOREIGN KEY (`work_report_line_id`) REFERENCES `work_report_line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkcb8fc1cdc1c2746e` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

-- Dump completed on 2012-12-20  0:02:31
