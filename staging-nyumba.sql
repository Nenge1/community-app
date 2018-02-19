-- MySQL dump 10.13  Distrib 5.6.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mifostenant-default
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
-- Table structure for table `acc_accounting_rule`
--

DROP TABLE IF EXISTS `acc_accounting_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_accounting_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `allow_multiple_debits` tinyint(1) NOT NULL DEFAULT '0',
  `credit_account_id` bigint(20) DEFAULT NULL,
  `allow_multiple_credits` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `system_defined` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounting_rule_name_unique` (`name`),
  KEY `FK_acc_accounting_rule_acc_gl_account_debit` (`debit_account_id`),
  KEY `FK_acc_accounting_rule_acc_gl_account_credit` (`credit_account_id`),
  KEY `FK_acc_accounting_rule_m_office` (`office_id`),
  CONSTRAINT `FK_acc_accounting_rule_acc_gl_account_credit` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_acc_accounting_rule_acc_gl_account_debit` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_acc_accounting_rule_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_accounting_rule`
--

LOCK TABLES `acc_accounting_rule` WRITE;
/*!40000 ALTER TABLE `acc_accounting_rule` DISABLE KEYS */;
INSERT INTO `acc_accounting_rule` VALUES (1,'Payrol',1,NULL,1,9,0,'Salaries and wages for the month',0);
/*!40000 ALTER TABLE `acc_accounting_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_gl_account`
--

DROP TABLE IF EXISTS `acc_gl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_gl_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `hierarchy` varchar(50) DEFAULT NULL,
  `gl_code` varchar(45) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `manual_journal_entries_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `account_usage` tinyint(1) NOT NULL DEFAULT '2',
  `classification_enum` smallint(5) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_gl_code` (`gl_code`),
  KEY `FK_ACC_0000000001` (`parent_id`),
  KEY `FKGLACC000000002` (`tag_id`),
  CONSTRAINT `FKGLACC000000002` FOREIGN KEY (`tag_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_ACC_0000000001` FOREIGN KEY (`parent_id`) REFERENCES `acc_gl_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_gl_account`
--

LOCK TABLES `acc_gl_account` WRITE;
/*!40000 ALTER TABLE `acc_gl_account` DISABLE KEYS */;
INSERT INTO `acc_gl_account` VALUES (1,'ASSET',NULL,'.','1000',0,1,2,1,NULL,NULL),(2,'NON- CURRENT ASSETS',1,'.2.','1100',0,1,2,1,NULL,NULL),(3,'CURRENT ASSETS',1,'.3.','1200',0,1,2,1,NULL,NULL),(4,'PROPERT AND EQUIPMENT',2,'.2.4.','1101',0,1,1,1,NULL,NULL),(5,'OUTSTANDING LOANS',3,'.3.5.','1201',0,1,1,1,NULL,NULL),(6,'DEBTORS NHC',3,'.3.6.','1202',0,1,1,1,NULL,NULL),(7,'PRE PAYMENTS',3,'.3.7.','1203',0,1,1,1,NULL,NULL),(8,'CASH IN HAND',3,'.3.8.','1204',0,1,1,1,NULL,NULL),(9,'CASH AT BANK CRDB',3,'.3.9.','1205',0,1,1,1,NULL,NULL),(10,'DCB',3,'.3.10.','1206',0,1,1,1,NULL,NULL),(11,'T/SHIRTS',3,'.3.11.','1207',0,1,1,1,NULL,NULL),(12,'EQUITY LIABILITIES',NULL,'.','2000',0,1,2,3,NULL,NULL),(13,'EQUITY',12,'.13.','2010',0,1,1,3,NULL,NULL),(14,'STATUTORY RESERVES',12,'.14.','2020',0,1,1,3,NULL,NULL),(15,'BAD DEBTS',12,'.15.','2030',0,1,1,3,NULL,NULL),(16,'SHARE TRANSFER FUND',12,'.16.','2040',0,1,1,3,NULL,NULL),(17,'EDUCATION FUND',12,'.17.','2050',0,1,1,3,NULL,NULL),(18,'RETAINED SURPLUS',12,'.18.','2060',0,1,1,3,NULL,NULL),(19,'LIABILITES',NULL,'.','3000',0,1,2,2,NULL,NULL),(20,'MEMBERS SHARES',19,'.20.','3010',0,1,1,2,NULL,NULL),(21,'MEMBERS SAVINGS',19,'.21.','3020',0,1,1,2,NULL,NULL),(22,'TRA- PAYE',19,'.22.','3030',0,1,1,2,NULL,NULL),(23,'TRA-S.D.L',19,'.23.','3040',0,1,1,2,NULL,NULL),(24,'REGISTRAR',19,'.24.','3050',0,1,1,2,NULL,NULL),(25,'COASCO',19,'.25.','3060',0,1,1,2,NULL,NULL),(26,'INCOME',NULL,'.','4000',0,1,2,4,NULL,NULL),(27,'INTEREST ON LOANS',26,'.27.','4010',0,1,1,4,NULL,NULL),(28,'PROCESSING FEES',26,'.28.','4020',0,1,1,4,NULL,NULL),(29,'FDR INTEREST',26,'.29.','4030',0,1,1,4,NULL,NULL),(30,'ENTRANCE FEES',26,'.30.','4040',0,1,1,4,NULL,NULL),(31,'LESS: EXPENDITURE',NULL,'.','5000',0,1,2,5,NULL,NULL),(32,'SALARIES',31,'.32.','5010',0,1,1,5,14,NULL),(33,'LEAVE ALLOWANCE',31,'.33.','5020',0,1,1,5,NULL,NULL),(34,'PENSION FUND',31,'.34.','5030',0,1,1,5,14,NULL),(35,'COMMUNICATION',31,'.35.','5040',0,1,1,5,NULL,NULL),(36,'TRANSPORT',31,'.36.','5050',0,1,1,5,NULL,NULL),(37,'BOARD MEETING',31,'.37.','5060',0,1,1,5,NULL,NULL),(38,'SUPERVISORY COMMITTEE',31,'.38.','5070',0,1,1,5,NULL,NULL),(39,'INTEREST ON MEMBERS SAVINGS',31,'.39.','5080',0,1,1,5,NULL,NULL),(40,'LOAN COMMITTEE',31,'.40.','5090',0,1,1,5,NULL,NULL),(41,'MEDICAL EXPENSES',31,'.41.','5100',0,1,1,5,NULL,NULL),(42,'STATIONARY',31,'.42.','5110',0,1,1,5,NULL,NULL),(43,'ELECTRICITY',31,'.43.','5120',0,1,1,5,NULL,NULL),(44,'SEMINAR &EDUCATION',31,'.44.','5130',0,1,1,5,NULL,NULL),(45,'AGM',31,'.45.','5140',0,1,1,5,NULL,NULL),(46,'SUPERVISION',31,'.46.','5150',0,1,1,5,NULL,NULL),(47,'BYE CAN EXPENSES',31,'.47.','5160',0,1,1,5,NULL,NULL),(48,'REPAIR',31,'.48.','5170',0,1,1,5,NULL,NULL),(49,'PROMOTION EXPENSES',31,'.49.','5180',0,1,1,5,NULL,NULL),(50,'OFFICE TEA',31,'.50.','5190',0,1,1,5,NULL,NULL),(51,'CONSULTATION',31,'.51.','5200',0,1,1,5,NULL,NULL),(52,'OTHER EXPENSES',31,'.52.','5210',0,1,1,5,NULL,NULL),(53,'AUDIT FEES',31,'.53.','5220',0,1,1,5,NULL,NULL),(54,'BANK CHANGES',31,'.54.','5230',0,1,1,5,NULL,NULL),(55,'MEMBER SHARES',12,'.55.','2070',0,1,1,3,NULL,NULL),(56,'TRA-PAYE',31,'.56.','5240',0,1,1,5,14,NULL),(57,'TRA- S.D.L',31,'.57.','5250',0,1,1,5,NULL,NULL),(59,'BAD DOUBIFUL RESERVE FUND',31,'.59.','5260',0,1,1,5,NULL,NULL),(60,'SALARIES',31,'.60.','5270',0,1,1,5,NULL,NULL),(61,'EDUCATION AND SEMINARS',31,'.61.','5280',0,1,1,5,NULL,NULL),(62,'SUPERVISOR COMMITTEE',31,'.62.','5290',0,1,1,5,NULL,NULL),(63,'BY LAWS EXPENSES5',31,'.63.','5300',0,1,1,5,NULL,NULL),(64,'0FICE TEA',31,'.64.','5310',0,1,1,5,NULL,NULL),(65,'BANK CHARGES',31,'.65.','5320',0,1,1,5,NULL,NULL),(66,'OTHER RECEIVABLE NHC',3,'.3.66.','1208',0,1,1,1,NULL,NULL),(67,'PROPERTY EQUIPMENT',2,'.2.67.','1102',0,1,1,1,NULL,NULL),(68,'CASH AT BANK DCB',3,'.3.68.','1209',0,1,1,1,NULL,NULL),(69,'DIVIDENDS  n',19,'.69.','3070',0,1,1,2,NULL,NULL),(70,'INTEREST ON MEMBER SAVINGS (6.5%)',19,'.70.','3080',0,1,1,2,NULL,NULL),(71,'Fund source',1,'.71.','1210',0,1,1,1,NULL,NULL),(72,'Interest Receivable',1,'.72.','1211',0,1,1,1,NULL,NULL),(73,'Fee Receivable',1,'.73.','1212',0,1,1,1,NULL,NULL),(74,'Penalties Receivable',1,'.74.','1213',0,0,1,1,NULL,NULL),(75,'Transfer In Suspence',1,'.75.','1214',0,1,1,1,NULL,NULL),(76,'Income from Penalties',26,'.76.','4050',0,1,1,4,NULL,NULL),(77,'Income From recovery Repayment',26,'.77.','4060',0,1,1,4,NULL,NULL),(79,'Over payment Liability',19,'.79.','3090',0,1,1,2,NULL,NULL),(80,'Saving Reference',1,'.80.','1215',0,1,1,1,NULL,NULL),(81,'Saving Transfer in Suspence',19,'.81.','3100',0,1,1,2,NULL,NULL),(82,'Share Reference',1,'.82.','1216',0,1,1,1,NULL,NULL),(83,'Share suspense control',19,'.83.','3101',0,1,1,2,NULL,NULL),(84,'Share Equity',12,'.84.','2080',0,1,1,3,NULL,NULL),(85,'Provision For Bad debts',19,'.85.','3091',0,1,1,2,NULL,'hh'),(86,'Bad debts expenses',NULL,'.','5191',0,1,1,5,NULL,NULL);
/*!40000 ALTER TABLE `acc_gl_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_gl_closure`
--

DROP TABLE IF EXISTS `acc_gl_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_gl_closure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `office_id` bigint(20) NOT NULL,
  `closing_date` date NOT NULL,
  `is_deleted` int(20) NOT NULL DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `office_id_closing_date` (`office_id`,`closing_date`),
  KEY `FK_acc_gl_closure_m_office` (`office_id`),
  KEY `FK_acc_gl_closure_m_appuser` (`createdby_id`),
  KEY `FK_acc_gl_closure_m_appuser_2` (`lastmodifiedby_id`),
  CONSTRAINT `FK_acc_gl_closure_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_acc_gl_closure_m_appuser_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_acc_gl_closure_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_gl_closure`
--

LOCK TABLES `acc_gl_closure` WRITE;
/*!40000 ALTER TABLE `acc_gl_closure` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_gl_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_gl_financial_activity_account`
--

DROP TABLE IF EXISTS `acc_gl_financial_activity_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_gl_financial_activity_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gl_account_id` bigint(20) NOT NULL DEFAULT '0',
  `financial_activity_type` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `financial_activity_type` (`financial_activity_type`),
  KEY `FK_office_mapping_acc_gl_account` (`gl_account_id`),
  CONSTRAINT `FK_office_mapping_acc_gl_account` FOREIGN KEY (`gl_account_id`) REFERENCES `acc_gl_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_gl_financial_activity_account`
--

LOCK TABLES `acc_gl_financial_activity_account` WRITE;
/*!40000 ALTER TABLE `acc_gl_financial_activity_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_gl_financial_activity_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_gl_journal_entry`
--

DROP TABLE IF EXISTS `acc_gl_journal_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_gl_journal_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `reversal_id` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `savings_transaction_id` bigint(20) DEFAULT NULL,
  `client_transaction_id` bigint(20) DEFAULT NULL,
  `reversed` tinyint(1) NOT NULL DEFAULT '0',
  `ref_num` varchar(100) DEFAULT NULL,
  `manual_entry` tinyint(1) NOT NULL DEFAULT '0',
  `entry_date` date NOT NULL,
  `type_enum` smallint(5) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `entity_type_enum` smallint(5) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  `is_running_balance_calculated` tinyint(4) NOT NULL DEFAULT '0',
  `office_running_balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `organization_running_balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `payment_details_id` bigint(20) DEFAULT NULL,
  `share_transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acc_gl_journal_entry_m_office` (`office_id`),
  KEY `FK_acc_gl_journal_entry_m_appuser` (`createdby_id`),
  KEY `FK_acc_gl_journal_entry_m_appuser_2` (`lastmodifiedby_id`),
  KEY `FK_acc_gl_journal_entry_acc_gl_journal_entry` (`reversal_id`),
  KEY `FK_acc_gl_journal_entry_acc_gl_account` (`account_id`),
  KEY `FK_acc_gl_journal_entry_m_loan_transaction` (`loan_transaction_id`),
  KEY `FK_acc_gl_journal_entry_m_savings_account_transaction` (`savings_transaction_id`),
  KEY `FK_acc_gl_journal_entry_m_payment_detail` (`payment_details_id`),
  KEY `FK_acc_gl_journal_entry_m_client_transaction` (`client_transaction_id`),
  KEY `FK_acc_gl_journal_entry_m_share_account_transaction` (`share_transaction_id`),
  CONSTRAINT `FK_acc_gl_journal_entry_acc_gl_account` FOREIGN KEY (`account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_acc_gl_journal_entry` FOREIGN KEY (`reversal_id`) REFERENCES `acc_gl_journal_entry` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_appuser_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_client_transaction` FOREIGN KEY (`client_transaction_id`) REFERENCES `m_client_transaction` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_payment_detail` FOREIGN KEY (`payment_details_id`) REFERENCES `m_payment_detail` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_savings_account_transaction` FOREIGN KEY (`savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  CONSTRAINT `FK_acc_gl_journal_entry_m_share_account_transaction` FOREIGN KEY (`share_transaction_id`) REFERENCES `m_share_account_transactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_gl_journal_entry`
--

LOCK TABLES `acc_gl_journal_entry` WRITE;
/*!40000 ALTER TABLE `acc_gl_journal_entry` DISABLE KEYS */;
INSERT INTO `acc_gl_journal_entry` VALUES (1,5,1,NULL,'TZS','L1',1,NULL,NULL,0,NULL,0,'2018-02-13',2,1000000.000000,NULL,1,2,1,1,'2018-02-13 11:41:28','2018-02-13 11:41:28',0,0.000000,0.000000,NULL,NULL),(2,71,1,NULL,'TZS','L1',1,NULL,NULL,0,NULL,0,'2018-02-13',1,1000000.000000,NULL,1,2,1,1,'2018-02-13 11:41:28','2018-02-13 11:41:28',0,0.000000,0.000000,NULL,NULL),(3,5,1,NULL,'TZS','L2',2,NULL,NULL,0,NULL,0,'2018-02-13',1,71637.670000,NULL,1,2,1,1,'2018-02-13 13:59:23','2018-02-13 13:59:23',0,0.000000,0.000000,NULL,NULL),(4,72,1,NULL,'TZS','L2',2,NULL,NULL,0,NULL,0,'2018-02-13',1,27083.330000,NULL,1,2,1,1,'2018-02-13 13:59:23','2018-02-13 13:59:23',0,0.000000,0.000000,NULL,NULL),(5,71,1,NULL,'TZS','L2',2,NULL,NULL,0,NULL,0,'2018-02-13',2,98721.000000,NULL,1,2,1,1,'2018-02-13 13:59:23','2018-02-13 13:59:23',0,0.000000,0.000000,NULL,NULL),(6,72,1,NULL,'TZS','L3',3,NULL,NULL,0,NULL,0,'2018-02-13',1,25143.150000,NULL,1,2,1,1,'2018-02-13 13:59:33','2018-02-13 13:59:33',0,0.000000,0.000000,NULL,NULL),(7,5,1,NULL,'TZS','L3',3,NULL,NULL,0,NULL,0,'2018-02-13',1,73577.850000,NULL,1,2,1,1,'2018-02-13 13:59:33','2018-02-13 13:59:33',0,0.000000,0.000000,NULL,NULL),(8,71,1,NULL,'TZS','L3',3,NULL,NULL,0,NULL,0,'2018-02-13',2,98721.000000,NULL,1,2,1,1,'2018-02-13 13:59:33','2018-02-13 13:59:33',0,0.000000,0.000000,NULL,NULL),(9,5,1,NULL,'TZS','L4',4,NULL,NULL,0,NULL,0,'2018-02-13',1,398881.840000,NULL,1,2,1,1,'2018-02-13 14:02:51','2018-02-13 14:02:51',0,0.000000,0.000000,NULL,NULL),(10,72,1,NULL,'TZS','L4',4,NULL,NULL,0,NULL,0,'2018-02-13',1,101118.160000,NULL,1,2,1,1,'2018-02-13 14:02:51','2018-02-13 14:02:51',0,0.000000,0.000000,NULL,NULL),(11,71,1,NULL,'TZS','L4',4,NULL,NULL,0,NULL,0,'2018-02-13',2,500000.000000,NULL,1,2,1,1,'2018-02-13 14:02:51','2018-02-13 14:02:51',0,0.000000,0.000000,NULL,NULL),(12,71,1,NULL,'TZS','8a1d96c10b4b',NULL,NULL,NULL,0,'',1,'2018-02-14',2,10000000.000000,NULL,NULL,NULL,1,1,'2018-02-14 11:27:59','2018-02-14 11:27:59',0,0.000000,0.000000,NULL,NULL),(13,9,1,NULL,'TZS','8a1d96c10b4b',NULL,NULL,NULL,0,'',1,'2018-02-14',1,10000000.000000,NULL,NULL,NULL,1,1,'2018-02-14 11:27:59','2018-02-14 11:27:59',0,0.000000,0.000000,NULL,NULL),(14,9,1,NULL,'TZS','S1',NULL,1,NULL,0,NULL,0,'2018-02-14',2,400000.000000,NULL,2,1,1,1,'2018-02-14 11:30:54','2018-02-14 11:30:54',0,0.000000,0.000000,NULL,NULL),(15,21,1,NULL,'TZS','S1',NULL,1,NULL,0,NULL,0,'2018-02-14',1,400000.000000,NULL,2,1,1,1,'2018-02-14 11:30:54','2018-02-14 11:30:54',0,0.000000,0.000000,NULL,NULL),(16,5,1,NULL,'TZS','L6',6,NULL,NULL,0,NULL,0,'2018-02-14',2,1000000.000000,NULL,1,5,1,1,'2018-02-14 11:32:23','2018-02-14 11:32:23',0,0.000000,0.000000,NULL,NULL),(17,71,1,NULL,'TZS','L6',6,NULL,NULL,0,NULL,0,'2018-02-14',1,1000000.000000,NULL,1,5,1,1,'2018-02-14 11:32:23','2018-02-14 11:32:23',0,0.000000,0.000000,NULL,NULL),(18,71,1,NULL,'TZS','L6',6,NULL,NULL,0,NULL,0,'2018-02-14',2,1000000.000000,NULL,1,5,1,1,'2018-02-14 11:36:32','2018-02-14 11:36:32',0,0.000000,0.000000,NULL,NULL),(19,5,1,NULL,'TZS','L6',6,NULL,NULL,0,NULL,0,'2018-02-14',1,1000000.000000,NULL,1,5,1,1,'2018-02-14 11:36:33','2018-02-14 11:36:33',0,0.000000,0.000000,NULL,NULL),(20,9,1,NULL,'TZS','8a1d9ed445d7',NULL,NULL,NULL,0,'',1,'2018-02-14',1,100.000000,NULL,NULL,NULL,1,1,'2018-02-14 11:50:33','2018-02-14 11:50:33',0,0.000000,0.000000,NULL,NULL),(21,32,1,NULL,'TZS','8a1d9ed445d7',NULL,NULL,NULL,0,'',1,'2018-02-14',2,100.000000,NULL,NULL,NULL,1,1,'2018-02-14 11:50:33','2018-02-14 11:50:33',0,0.000000,0.000000,NULL,NULL),(22,9,1,NULL,'TZS','8a1da4577f47',NULL,NULL,NULL,0,'',1,'2018-02-14',1,2200000.000000,NULL,NULL,NULL,1,1,'2018-02-14 12:05:58','2018-02-14 12:05:58',0,0.000000,0.000000,NULL,NULL),(23,32,1,NULL,'TZS','8a1da4577f47',NULL,NULL,NULL,0,'',1,'2018-02-14',2,1000000.000000,NULL,NULL,NULL,1,1,'2018-02-14 12:05:58','2018-02-14 12:05:58',0,0.000000,0.000000,NULL,NULL),(24,34,1,NULL,'TZS','8a1da4577f47',NULL,NULL,NULL,0,'',1,'2018-02-14',2,700000.000000,NULL,NULL,NULL,1,1,'2018-02-14 12:05:58','2018-02-14 12:05:58',0,0.000000,0.000000,NULL,NULL),(25,56,1,NULL,'TZS','8a1da4577f47',NULL,NULL,NULL,0,'',1,'2018-02-14',2,500000.000000,NULL,NULL,NULL,1,1,'2018-02-14 12:05:58','2018-02-14 12:05:58',0,0.000000,0.000000,NULL,NULL),(26,85,1,NULL,'TZS','P1',NULL,NULL,NULL,0,NULL,0,'2018-02-14',1,48390.940000,NULL,3,1,1,1,'2018-02-14 12:29:06','2018-02-14 12:29:06',0,0.000000,0.000000,NULL,NULL),(27,86,1,NULL,'TZS','P1',NULL,NULL,NULL,0,NULL,0,'2018-02-14',2,48390.940000,NULL,3,1,1,1,'2018-02-14 12:29:06','2018-02-14 12:29:06',0,0.000000,0.000000,NULL,NULL),(28,5,1,NULL,'TZS','L10',10,NULL,NULL,0,NULL,0,'2018-02-14',2,1000000.000000,NULL,1,5,1,1,'2018-02-14 12:59:33','2018-02-14 12:59:33',0,0.000000,0.000000,NULL,NULL),(29,71,1,NULL,'TZS','L10',10,NULL,NULL,0,NULL,0,'2018-02-14',1,1000000.000000,NULL,1,5,1,1,'2018-02-14 12:59:33','2018-02-14 12:59:33',0,0.000000,0.000000,NULL,NULL),(30,9,1,NULL,'TZS','S2',NULL,2,NULL,0,NULL,0,'2018-02-15',2,700000.000000,NULL,2,3,4,4,'2018-02-15 12:18:56','2018-02-15 12:18:56',0,0.000000,0.000000,NULL,NULL),(31,21,1,NULL,'TZS','S2',NULL,2,NULL,0,NULL,0,'2018-02-15',1,700000.000000,NULL,2,3,4,4,'2018-02-15 12:18:56','2018-02-15 12:18:56',0,0.000000,0.000000,NULL,NULL),(32,9,1,NULL,'TZS','S3',NULL,3,NULL,0,NULL,0,'2018-02-15',2,700000.000000,NULL,2,5,5,5,'2018-02-15 12:39:22','2018-02-15 12:39:22',0,0.000000,0.000000,NULL,NULL),(33,21,1,NULL,'TZS','S3',NULL,3,NULL,0,NULL,0,'2018-02-15',1,700000.000000,NULL,2,5,5,5,'2018-02-15 12:39:22','2018-02-15 12:39:22',0,0.000000,0.000000,NULL,NULL),(34,82,1,NULL,'TZS','SH1',NULL,NULL,NULL,0,NULL,0,'2018-02-15',2,500000.000000,NULL,4,1,5,5,'2018-02-15 12:46:29','2018-02-15 12:46:29',0,0.000000,0.000000,NULL,1),(35,21,1,NULL,'TZS','SH1',NULL,NULL,NULL,0,NULL,0,'2018-02-15',1,500000.000000,NULL,4,1,5,5,'2018-02-15 12:46:29','2018-02-15 12:46:29',0,0.000000,0.000000,NULL,1),(36,21,1,NULL,'TZS','SH1',NULL,NULL,NULL,0,NULL,0,'2018-02-15',2,500000.000000,NULL,4,1,5,5,'2018-02-15 12:47:35','2018-02-15 12:47:35',0,0.000000,0.000000,NULL,1),(37,84,1,NULL,'TZS','SH1',NULL,NULL,NULL,0,NULL,0,'2018-02-15',1,500000.000000,NULL,4,1,5,5,'2018-02-15 12:47:35','2018-02-15 12:47:35',0,0.000000,0.000000,NULL,1),(38,82,1,NULL,'TZS','SH2',NULL,NULL,NULL,0,NULL,0,'2018-02-15',2,500000.000000,NULL,4,2,4,4,'2018-02-15 12:47:36','2018-02-15 12:47:36',0,0.000000,0.000000,NULL,2),(39,21,1,NULL,'TZS','SH2',NULL,NULL,NULL,0,NULL,0,'2018-02-15',1,500000.000000,NULL,4,2,4,4,'2018-02-15 12:47:36','2018-02-15 12:47:36',0,0.000000,0.000000,NULL,2),(40,21,1,NULL,'TZS','SH2',NULL,NULL,NULL,0,NULL,0,'2018-02-15',2,500000.000000,NULL,4,2,4,4,'2018-02-15 12:48:13','2018-02-15 12:48:13',0,0.000000,0.000000,NULL,2),(41,84,1,NULL,'TZS','SH2',NULL,NULL,NULL,0,NULL,0,'2018-02-15',1,500000.000000,NULL,4,2,4,4,'2018-02-15 12:48:13','2018-02-15 12:48:13',0,0.000000,0.000000,NULL,2),(42,9,1,NULL,'TZS','S4',NULL,4,NULL,0,NULL,0,'2018-02-15',2,700000.000000,NULL,2,4,3,3,'2018-02-15 13:26:21','2018-02-15 13:26:21',0,0.000000,0.000000,NULL,NULL),(43,21,1,NULL,'TZS','S4',NULL,4,NULL,0,NULL,0,'2018-02-15',1,700000.000000,NULL,2,4,3,3,'2018-02-15 13:26:21','2018-02-15 13:26:21',0,0.000000,0.000000,NULL,NULL),(44,9,1,NULL,'TZS','S5',NULL,5,NULL,0,NULL,0,'2018-02-15',2,150000.000000,NULL,2,4,3,3,'2018-02-15 13:34:44','2018-02-15 13:34:44',0,0.000000,0.000000,NULL,NULL),(45,21,1,NULL,'TZS','S5',NULL,5,NULL,0,NULL,0,'2018-02-15',1,150000.000000,NULL,2,4,3,3,'2018-02-15 13:34:44','2018-02-15 13:34:44',0,0.000000,0.000000,NULL,NULL),(46,5,1,NULL,'TZS','L11',11,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:49:08','2018-02-15 13:49:08',0,0.000000,0.000000,NULL,NULL),(47,71,1,NULL,'TZS','L11',11,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:49:08','2018-02-15 13:49:08',0,0.000000,0.000000,NULL,NULL),(48,71,1,NULL,'TZS','L11',11,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:53:00','2018-02-15 13:53:00',0,0.000000,0.000000,NULL,NULL),(49,5,1,NULL,'TZS','L11',11,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:53:00','2018-02-15 13:53:00',0,0.000000,0.000000,NULL,NULL),(50,5,1,NULL,'TZS','L12',12,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:54:35','2018-02-15 13:54:35',0,0.000000,0.000000,NULL,NULL),(51,71,1,NULL,'TZS','L12',12,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:54:35','2018-02-15 13:54:35',0,0.000000,0.000000,NULL,NULL),(52,71,1,NULL,'TZS','L12',12,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:58:24','2018-02-15 13:58:24',0,0.000000,0.000000,NULL,NULL),(53,5,1,NULL,'TZS','L12',12,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,7,4,4,'2018-02-15 13:58:24','2018-02-15 13:58:24',0,0.000000,0.000000,NULL,NULL),(54,5,1,NULL,'TZS','L13',13,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,8,3,3,'2018-02-15 14:05:49','2018-02-15 14:05:49',0,0.000000,0.000000,NULL,NULL),(55,71,1,NULL,'TZS','L13',13,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,8,3,3,'2018-02-15 14:05:49','2018-02-15 14:05:49',0,0.000000,0.000000,NULL,NULL),(56,71,1,NULL,'TZS','L13',13,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,8,4,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',0,0.000000,0.000000,NULL,NULL),(57,5,1,NULL,'TZS','L13',13,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,8,4,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',0,0.000000,0.000000,NULL,NULL),(58,5,1,NULL,'TZS','L15',15,NULL,NULL,0,NULL,0,'2018-02-15',2,1000000.000000,NULL,1,6,5,5,'2018-02-15 15:00:54','2018-02-15 15:00:54',0,0.000000,0.000000,NULL,NULL),(59,71,1,NULL,'TZS','L15',15,NULL,NULL,0,NULL,0,'2018-02-15',1,1000000.000000,NULL,1,6,5,5,'2018-02-15 15:00:54','2018-02-15 15:00:54',0,0.000000,0.000000,NULL,NULL),(60,73,1,NULL,'TZS','L16',16,NULL,NULL,0,NULL,0,'2018-02-15',1,7500.000000,NULL,1,6,5,5,'2018-02-15 15:11:15','2018-02-15 15:11:15',0,0.000000,0.000000,NULL,NULL),(61,5,1,NULL,'TZS','L16',16,NULL,NULL,0,NULL,0,'2018-02-15',1,78483.670000,NULL,1,6,5,5,'2018-02-15 15:11:15','2018-02-15 15:11:15',0,0.000000,0.000000,NULL,NULL),(62,72,1,NULL,'TZS','L16',16,NULL,NULL,0,NULL,0,'2018-02-15',1,10833.330000,NULL,1,6,5,5,'2018-02-15 15:11:15','2018-02-15 15:11:15',0,0.000000,0.000000,NULL,NULL),(63,71,1,NULL,'TZS','L16',16,NULL,NULL,0,NULL,0,'2018-02-15',2,96817.000000,NULL,1,6,5,5,'2018-02-15 15:11:15','2018-02-15 15:11:15',0,0.000000,0.000000,NULL,NULL),(64,71,1,NULL,'TZS','L10',10,NULL,NULL,0,NULL,0,'2018-02-14',2,1000000.000000,NULL,1,5,4,4,'2018-02-15 15:15:51','2018-02-15 15:15:51',0,0.000000,0.000000,NULL,NULL),(65,5,1,NULL,'TZS','L10',10,NULL,NULL,0,NULL,0,'2018-02-14',1,1000000.000000,NULL,1,5,4,4,'2018-02-15 15:15:51','2018-02-15 15:15:51',0,0.000000,0.000000,NULL,NULL),(66,52,1,NULL,'TZS','8a1fee7e5f7b',NULL,NULL,NULL,0,'',1,'2018-02-15',2,500000.000000,'being amount authorized for communication expenses',NULL,NULL,5,5,'2018-02-15 15:24:59','2018-02-15 15:24:59',0,0.000000,0.000000,NULL,NULL),(67,9,1,NULL,'TZS','8a1fee7e5f7b',NULL,NULL,NULL,0,'',1,'2018-02-15',1,500000.000000,'being amount authorized for communication expenses',NULL,NULL,5,5,'2018-02-15 15:24:59','2018-02-15 15:24:59',0,0.000000,0.000000,NULL,NULL),(68,9,1,NULL,'TZS','S6',NULL,6,NULL,0,NULL,0,'2018-02-15',2,560000.000000,NULL,2,1,4,4,'2018-02-15 16:05:07','2018-02-15 16:05:07',0,0.000000,0.000000,NULL,NULL),(69,21,1,NULL,'TZS','S6',NULL,6,NULL,0,NULL,0,'2018-02-15',1,560000.000000,NULL,2,1,4,4,'2018-02-15 16:05:07','2018-02-15 16:05:07',0,0.000000,0.000000,NULL,NULL);
/*!40000 ALTER TABLE `acc_gl_journal_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_product_mapping`
--

DROP TABLE IF EXISTS `acc_product_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_product_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gl_account_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` smallint(5) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  `financial_account_type` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acc_product_mapping_m_charge` (`charge_id`),
  KEY `FK_acc_product_mapping_m_payment_type` (`payment_type`),
  CONSTRAINT `FK_acc_product_mapping_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `FK_acc_product_mapping_m_payment_type` FOREIGN KEY (`payment_type`) REFERENCES `m_payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_product_mapping`
--

LOCK TABLES `acc_product_mapping` WRITE;
/*!40000 ALTER TABLE `acc_product_mapping` DISABLE KEYS */;
INSERT INTO `acc_product_mapping` VALUES (1,9,2,2,NULL,NULL,1),(2,68,2,2,NULL,NULL,11),(3,29,2,2,NULL,NULL,4),(4,76,2,2,NULL,NULL,5),(5,28,2,2,NULL,NULL,12),(6,39,2,2,NULL,NULL,3),(7,59,2,2,NULL,NULL,13),(8,21,2,2,NULL,NULL,2),(9,81,2,2,NULL,NULL,10),(10,21,2,2,NULL,NULL,14),(11,71,3,1,NULL,NULL,1),(12,5,3,1,NULL,NULL,2),(13,75,3,1,NULL,NULL,10),(14,72,3,1,NULL,NULL,7),(15,73,3,1,NULL,NULL,8),(16,74,3,1,NULL,NULL,9),(17,27,3,1,NULL,NULL,3),(18,28,3,1,NULL,NULL,4),(19,76,3,1,NULL,NULL,5),(20,77,3,1,NULL,NULL,12),(21,62,3,1,NULL,NULL,6),(22,79,3,1,NULL,NULL,11),(23,71,1,1,NULL,NULL,1),(24,5,1,1,NULL,NULL,2),(25,75,1,1,NULL,NULL,10),(26,72,1,1,NULL,NULL,7),(27,73,1,1,NULL,NULL,8),(28,74,1,1,NULL,NULL,9),(29,27,1,1,NULL,NULL,3),(30,28,1,1,NULL,NULL,4),(31,76,1,1,NULL,NULL,5),(32,77,1,1,NULL,NULL,12),(33,59,1,1,NULL,NULL,6),(34,79,1,1,NULL,NULL,11),(35,71,2,1,NULL,NULL,1),(36,5,2,1,NULL,NULL,2),(37,75,2,1,NULL,NULL,10),(38,72,2,1,NULL,NULL,7),(39,73,2,1,NULL,NULL,8),(40,74,2,1,NULL,NULL,9),(41,27,2,1,NULL,NULL,3),(42,28,2,1,NULL,NULL,4),(43,76,2,1,NULL,NULL,5),(44,77,2,1,NULL,NULL,12),(45,59,2,1,NULL,NULL,6),(46,79,2,1,NULL,NULL,11),(47,71,5,1,NULL,NULL,1),(48,5,5,1,NULL,NULL,2),(49,75,5,1,NULL,NULL,10),(50,72,5,1,NULL,NULL,7),(51,73,5,1,NULL,NULL,8),(52,74,5,1,NULL,NULL,9),(53,27,5,1,NULL,NULL,3),(54,28,5,1,NULL,NULL,4),(55,76,5,1,NULL,NULL,5),(56,77,5,1,NULL,NULL,12),(57,59,5,1,NULL,NULL,6),(58,79,5,1,NULL,NULL,11),(59,82,1,4,NULL,NULL,1),(60,28,1,4,NULL,NULL,3),(61,84,1,4,NULL,NULL,4),(62,21,1,4,NULL,NULL,2);
/*!40000 ALTER TABLE `acc_product_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_rule_tags`
--

DROP TABLE IF EXISTS `acc_rule_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_rule_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acc_rule_id` bigint(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `acc_type_enum` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_ACCOUNT_RULE_TAGS` (`acc_rule_id`,`tag_id`,`acc_type_enum`),
  KEY `FK_acc_accounting_rule_id` (`acc_rule_id`),
  KEY `FK_m_code_value_id` (`tag_id`),
  CONSTRAINT `FK_acc_accounting_rule_id` FOREIGN KEY (`acc_rule_id`) REFERENCES `acc_accounting_rule` (`id`),
  CONSTRAINT `FK_m_code_value_id` FOREIGN KEY (`tag_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_rule_tags`
--

LOCK TABLES `acc_rule_tags` WRITE;
/*!40000 ALTER TABLE `acc_rule_tags` DISABLE KEYS */;
INSERT INTO `acc_rule_tags` VALUES (1,1,14,2),(2,1,15,2),(3,1,16,2),(4,1,17,2);
/*!40000 ALTER TABLE `acc_rule_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiary`
--

DROP TABLE IF EXISTS `beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `Name` text NOT NULL,
  `Relationship with the client` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`client_id`),
  CONSTRAINT `fk_beneficiary_client_id` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiary`
--

LOCK TABLES `beneficiary` WRITE;
/*!40000 ALTER TABLE `beneficiary` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_account_number_format`
--

DROP TABLE IF EXISTS `c_account_number_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_account_number_format` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_type_enum` smallint(1) NOT NULL,
  `prefix_type_enum` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_type_enum` (`account_type_enum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_account_number_format`
--

LOCK TABLES `c_account_number_format` WRITE;
/*!40000 ALTER TABLE `c_account_number_format` DISABLE KEYS */;
INSERT INTO `c_account_number_format` VALUES (1,2,201);
/*!40000 ALTER TABLE `c_account_number_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_cache`
--

DROP TABLE IF EXISTS `c_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cache_type_enum` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_cache`
--

LOCK TABLES `c_cache` WRITE;
/*!40000 ALTER TABLE `c_cache` DISABLE KEYS */;
INSERT INTO `c_cache` VALUES (1,1);
/*!40000 ALTER TABLE `c_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_configuration`
--

DROP TABLE IF EXISTS `c_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_trap_door` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_configuration`
--

LOCK TABLES `c_configuration` WRITE;
/*!40000 ALTER TABLE `c_configuration` DISABLE KEYS */;
INSERT INTO `c_configuration` VALUES (1,'maker-checker',NULL,NULL,0,0,NULL),(4,'amazon-S3',NULL,NULL,0,0,NULL),(5,'reschedule-future-repayments',NULL,NULL,1,0,NULL),(6,'reschedule-repayments-on-holidays',NULL,NULL,0,0,NULL),(7,'allow-transactions-on-holiday',NULL,NULL,0,0,NULL),(8,'allow-transactions-on-non_workingday',NULL,NULL,0,0,NULL),(9,'constraint_approach_for_datatables',NULL,NULL,0,0,NULL),(10,'penalty-wait-period',2,NULL,1,0,NULL),(11,'force-password-reset-days',0,NULL,0,0,NULL),(12,'grace-on-penalty-posting',0,NULL,1,0,NULL),(15,'savings-interest-posting-current-period-end',NULL,NULL,0,0,'Recommended to be changed only once during start of production. When set as false(default), interest will be posted on the first date of next period. If set as true, interest will be posted on last date of current period. There is no difference in the interest amount posted.'),(16,'financial-year-beginning-month',1,NULL,1,0,'Recommended to be changed only once during start of production. Allowed values 1 - 12 (January - December). Interest posting periods are evaluated based on this configuration.'),(17,'min-clients-in-group',5,NULL,0,0,'Minimum number of Clients that a Group should have'),(18,'max-clients-in-group',5,NULL,0,0,'Maximum number of Clients that a Group can have'),(19,'meetings-mandatory-for-jlg-loans',NULL,NULL,0,0,'Enforces all JLG loans to follow a meeting schedule belonging to parent group or Center'),(20,'office-specific-products-enabled',0,NULL,0,0,'Whether products and fees should be office specific or not? This property should NOT be changed once Mifos is Live.'),(21,'restrict-products-to-user-office',0,NULL,0,0,'This should be enabled only if, products & fees are office specific (i.e. office-specific-products-enabled is enabled). This property specifies if the products should be auto-restricted to office of the user who created the proudct? Note: This property should NOT be changed once Mifos is Live.'),(22,'office-opening-balances-contra-account',0,NULL,1,0,NULL),(23,'rounding-mode',6,NULL,1,1,'0 - UP, 1 - DOWN, 2- CEILING, 3- FLOOR, 4- HALF_UP, 5- HALF_DOWN, 6 - HALF_EVEN'),(24,'backdate-penalties-enabled',0,NULL,1,0,'If this parameter is disabled penalties will only be added to instalments due moving forward, any old overdue instalments will not be affected.'),(25,'organisation-start-date',0,NULL,0,0,NULL),(26,'paymenttype-applicable-for-disbursement-charges',NULL,NULL,0,0,'Is the Disbursement Entry need to be considering the fund source of the paymnet type'),(27,'interest-charged-from-date-same-as-disbursal-date',0,NULL,0,0,NULL),(28,'skip-repayment-on-first-day-of-month',14,NULL,0,0,'skipping repayment on first day of month'),(29,'change-emi-if-repaymentdate-same-as-disbursementdate',0,NULL,1,0,'In tranche loans, if repayment date is same as tranche disbursement date then allow to change the emi amount'),(30,'daily-tpt-limit',0,NULL,0,0,'Daily limit for third party transfers'),(31,'Enable-Address',NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `c_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_external_service`
--

DROP TABLE IF EXISTS `c_external_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_external_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_external_service`
--

LOCK TABLES `c_external_service` WRITE;
/*!40000 ALTER TABLE `c_external_service` DISABLE KEYS */;
INSERT INTO `c_external_service` VALUES (3,'MESSAGE_GATEWAY'),(4,'NOTIFICATION'),(1,'S3'),(2,'SMTP_Email_Account');
/*!40000 ALTER TABLE `c_external_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_external_service_properties`
--

DROP TABLE IF EXISTS `c_external_service_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_external_service_properties` (
  `name` varchar(150) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `external_service_id` bigint(20) NOT NULL,
  KEY `FK_c_external_service_properties_c_external_service` (`external_service_id`),
  CONSTRAINT `FK_c_external_service_properties_c_external_service` FOREIGN KEY (`external_service_id`) REFERENCES `c_external_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_external_service_properties`
--

LOCK TABLES `c_external_service_properties` WRITE;
/*!40000 ALTER TABLE `c_external_service_properties` DISABLE KEYS */;
INSERT INTO `c_external_service_properties` VALUES ('s3_access_key',NULL,1),('s3_bucket_name',NULL,1),('s3_secret_key',NULL,1),('username','support@cloudmicrofinance.com',2),('password','support81',2),('host','smtp.gmail.com',2),('port','25',2),('useTLS','true',2),('host_name','localhost',3),('port_number','9191',3),('end_point','/',3),('tenant_app_key',NULL,3),('server_key','AAAAToBmqQQ:APA91bEodkE12CwFl8VHqanUbeJYg1E05TiheVz59CZZYrBnCq3uM40UYhHfdP-JfeTQ0L0zoLqS8orjvW_ze0_VF8DSuyyqkrDibflhtUainsI0lwgVz5u1YP3q3c3erqjlySEuRShS',4),('gcm_end_point','https://gcm-http.googleapis.com/gcm/send',4),('fcm_end_point','https://fcm.googleapis.com/fcm/send',4);
/*!40000 ALTER TABLE `c_external_service_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_device_registration`
--

DROP TABLE IF EXISTS `client_device_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_device_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `updatedon_date` datetime NOT NULL,
  `registration_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registration_key_client_device_registration` (`registration_id`),
  UNIQUE KEY `client_key_client_device_registration` (`client_id`),
  KEY `FK1_client_device_registration_m_client` (`client_id`),
  CONSTRAINT `FK1_client_device_registration_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_device_registration`
--

LOCK TABLES `client_device_registration` WRITE;
/*!40000 ALTER TABLE `client_device_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_device_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `cron_expression` varchar(20) CHARACTER SET latin1 NOT NULL,
  `create_time` datetime NOT NULL,
  `task_priority` smallint(6) NOT NULL DEFAULT '5',
  `group_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `previous_run_start_time` datetime DEFAULT NULL,
  `next_run_time` datetime DEFAULT NULL,
  `job_key` varchar(500) DEFAULT NULL,
  `initializing_errorlog` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `currently_running` tinyint(1) NOT NULL DEFAULT '0',
  `updates_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `scheduler_group` smallint(2) NOT NULL DEFAULT '0',
  `is_misfired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Update loan Summary','Update loan Summary','0 0 22 1/1 * ? *','2018-01-26 07:59:25',5,NULL,NULL,'2018-02-16 19:30:00','Update loan SummaryJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(2,'Update Loan Arrears Ageing','Update Loan Arrears Ageing','0 1 0 1/1 * ? *','2018-01-26 07:59:25',5,NULL,NULL,'2018-02-16 21:31:00','Update Loan Arrears AgeingJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(3,'Update Loan Paid In Advance','Update Loan Paid In Advance','0 5 0 1/1 * ? *','2018-01-26 07:59:25',5,NULL,NULL,'2018-02-16 21:35:00','Update Loan Paid In AdvanceJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(4,'Apply Annual Fee For Savings','Apply Annual Fee For Savings','0 20 22 1/1 * ? *','2018-01-26 07:59:25',5,NULL,NULL,'2018-02-16 19:50:00','Apply Annual Fee For SavingsJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(5,'Apply Holidays To Loans','Apply Holidays To Loans','0 0 12 * * ?','2018-01-26 07:59:25',5,NULL,'2018-02-16 09:30:00','2018-02-17 09:30:00','Apply Holidays To LoansJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(6,'Post Interest For Savings','Post Interest For Savings','0 0 0 1/1 * ? *','2018-01-26 07:59:26',5,NULL,NULL,'2018-02-16 21:30:00','Post Interest For SavingsJobDetail1 _ DEFAULT',NULL,1,0,1,1,0),(7,'Transfer Fee For Loans From Savings','Transfer Fee For Loans From Savings','0 1 0 1/1 * ? *','2018-01-26 07:59:28',5,NULL,NULL,'2018-02-16 21:31:00','Transfer Fee For Loans From SavingsJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(8,'Pay Due Savings Charges','Pay Due Savings Charges','0 0 12 * * ?','2013-09-23 00:00:00',5,NULL,'2018-02-16 09:30:00','2018-02-17 09:30:00','Pay Due Savings ChargesJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(9,'Update Accounting Running Balances','Update Accounting Running Balances','0 1 0 1/1 * ? *','2018-01-26 07:59:29',5,NULL,NULL,'2018-02-16 21:31:00','Update Accounting Running BalancesJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(10,'Execute Standing Instruction','Execute Standing Instruction','0 0 0 1/1 * ? *','2018-01-26 07:59:32',5,NULL,NULL,'2018-02-16 21:30:00','Execute Standing InstructionJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(11,'Add Accrual Transactions','Add Accrual Transactions','0 1 0 1/1 * ? *','2018-01-26 07:59:32',3,NULL,NULL,'2018-02-16 21:31:00','Add Accrual TransactionsJobDetail1 _ DEFAULT',NULL,1,0,1,3,0),(12,'Apply penalty to overdue loans','Apply penalty to overdue loans','0 0 0 1/1 * ? *','2018-01-26 07:59:32',5,NULL,NULL,'2018-02-16 21:30:00','Apply penalty to overdue loansJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(13,'Update Non Performing Assets','Update Non Performing Assets','0 0 0 1/1 * ? *','2018-01-26 07:59:33',6,NULL,NULL,'2018-02-16 21:30:00','Update Non Performing AssetsJobDetail1 _ DEFAULT',NULL,1,0,1,3,0),(14,'Transfer Interest To Savings','Transfer Interest To Savings','0 2 0 1/1 * ? *','2018-01-26 07:59:33',4,NULL,NULL,'2018-02-16 21:32:00','Transfer Interest To SavingsJobDetail1 _ DEFAULT',NULL,1,0,1,1,0),(15,'Update Deposit Accounts Maturity details','Update Deposit Accounts Maturity details','0 0 0 1/1 * ? *','2018-01-26 07:59:33',5,NULL,NULL,'2018-02-16 21:30:00','Update Deposit Accounts Maturity detailsJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(16,'Add Periodic Accrual Transactions','Add Periodic Accrual Transactions','0 2 0 1/1 * ? *','2018-01-26 07:59:35',2,NULL,NULL,'2018-02-16 21:32:00','Add Periodic Accrual TransactionsJobDetail1 _ DEFAULT',NULL,1,0,1,3,0),(17,'Recalculate Interest For Loans','Recalculate Interest For Loans','0 1 0 1/1 * ? *','2018-01-26 07:59:35',4,NULL,NULL,'2018-02-16 21:31:00','Recalculate Interest For LoansJobDetail1 _ DEFAULT',NULL,1,0,1,3,0),(18,'Generate Mandatory Savings Schedule','Generate Mandatory Savings Schedule','0 5 0 1/1 * ? *','2018-01-26 07:59:39',5,NULL,NULL,'2018-02-16 21:35:00','Generate Mandatory Savings ScheduleJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(19,'Generate Loan Loss Provisioning','Generate Loan Loss Provisioning','0 0 0 1/1 * ? *','2018-01-26 07:59:41',5,NULL,NULL,'2018-02-16 21:30:00','Generate Loan Loss ProvisioningJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(20,'Post Dividends For Shares','Post Dividends For Shares','0 0 0 1/1 * ? *','2018-01-26 07:59:44',5,NULL,NULL,'2018-02-16 21:30:00','Post Dividends For SharesJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(21,'Update Savings Dormant Accounts','Update Savings Dormant Accounts','0 0 0 1/1 * ? *','2018-01-26 07:59:44',3,NULL,NULL,'2018-02-16 21:30:00','Update Savings Dormant AccountsJobDetail1 _ DEFAULT',NULL,1,0,1,1,0),(22,'Add Accrual Transactions For Loans With Income Posted As Transactions','Add Accrual Transactions For Loans With Income Posted As Transactions','0 1 0 1/1 * ? *','2018-01-26 07:59:44',5,NULL,NULL,'2018-02-16 21:31:00','Add Accrual Transactions For Loans With Income Posted As TransactionsJobDetail1 _ DEFAULT',NULL,1,0,1,3,0),(23,'Execute Report Mailing Jobs','Execute Report Mailing Jobs','0 0/15 * * * ?','2018-01-26 07:59:45',5,NULL,'2018-02-16 10:45:00','2018-02-16 11:00:00','Execute Report Mailing JobsJobDetail1 _ DEFAULT',NULL,1,0,1,0,0),(24,'Update SMS Outbound with Campaign Message','Update SMS Outbound with Campaign Message','0 0 5 1/1 * ? *','2018-01-26 07:59:46',3,NULL,NULL,'2018-02-17 02:30:00','Update SMS Outbound with Campaign MessageJobDetail1 _ DEFAULT',NULL,1,0,1,4,0),(25,'Send Messages to SMS Gateway','Send Messages to SMS Gateway','0 0 5 1/1 * ? *','2018-01-26 07:59:46',2,NULL,NULL,'2018-02-17 02:30:00','Send Messages to SMS GatewayJobDetail1 _ DEFAULT',NULL,1,0,1,4,0),(26,'Get Delivery Reports from SMS Gateway','Get Delivery Reports from SMS Gateway','0 0 5 1/1 * ? *','2018-01-26 07:59:46',1,NULL,NULL,'2018-02-17 02:30:00','Get Delivery Reports from SMS GatewayJobDetail1 _ DEFAULT',NULL,1,0,1,4,0),(27,'Execute Email','Execute Email','0 0/10 * * * ?','2018-02-18 14:56:29',5,NULL,NULL,NULL,NULL,NULL,1,0,1,0,0),(28,'Update Email Outbound with campaign message','Update Email Outbound with campaign message','0 0/15 * * * ?','2018-02-18 14:56:29',5,NULL,NULL,NULL,NULL,NULL,1,0,1,0,0),(29,'Generate AdhocClient Schedule','Generate AdhocClient Schedule','0 0 12 1/1 * ? *','2018-02-18 14:56:31',5,NULL,NULL,NULL,NULL,NULL,1,0,1,0,0);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_run_history`
--

DROP TABLE IF EXISTS `job_run_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_run_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 NOT NULL,
  `error_message` text,
  `trigger_type` varchar(25) NOT NULL,
  `error_log` text,
  PRIMARY KEY (`id`),
  KEY `scheduledjobsFK` (`job_id`),
  CONSTRAINT `scheduledjobsFK` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_run_history`
--

LOCK TABLES `job_run_history` WRITE;
/*!40000 ALTER TABLE `job_run_history` DISABLE KEYS */;
INSERT INTO `job_run_history` VALUES (1,23,1,'2018-02-14 11:30:00','2018-02-14 11:30:00','success',NULL,'cron',NULL),(2,23,2,'2018-02-14 11:45:00','2018-02-14 11:45:00','success',NULL,'cron',NULL),(3,23,3,'2018-02-14 12:00:00','2018-02-14 12:00:00','success',NULL,'cron',NULL),(4,23,4,'2018-02-14 12:15:00','2018-02-14 12:15:00','success',NULL,'cron',NULL),(5,23,5,'2018-02-14 12:30:00','2018-02-14 12:30:00','success',NULL,'cron',NULL),(6,23,6,'2018-02-14 12:45:00','2018-02-14 12:45:00','success',NULL,'cron',NULL),(7,23,7,'2018-02-14 13:00:00','2018-02-14 13:00:00','success',NULL,'cron',NULL),(8,23,8,'2018-02-14 13:15:00','2018-02-14 13:15:00','success',NULL,'cron',NULL),(9,23,9,'2018-02-14 13:30:00','2018-02-14 13:30:00','success',NULL,'cron',NULL),(10,23,10,'2018-02-14 13:45:00','2018-02-14 13:45:00','success',NULL,'cron',NULL),(11,23,11,'2018-02-14 14:00:00','2018-02-14 14:00:00','success',NULL,'cron',NULL),(12,23,12,'2018-02-14 14:15:00','2018-02-14 14:15:00','success',NULL,'cron',NULL),(13,23,13,'2018-02-14 14:30:00','2018-02-14 14:30:00','success',NULL,'cron',NULL),(14,23,14,'2018-02-14 14:45:00','2018-02-14 14:45:00','success',NULL,'cron',NULL),(15,23,15,'2018-02-14 15:00:00','2018-02-14 15:00:00','success',NULL,'cron',NULL),(16,23,16,'2018-02-14 15:15:00','2018-02-14 15:15:00','success',NULL,'cron',NULL),(17,23,17,'2018-02-14 15:30:00','2018-02-14 15:30:00','success',NULL,'cron',NULL),(18,23,18,'2018-02-14 15:45:00','2018-02-14 15:45:00','success',NULL,'cron',NULL),(19,23,19,'2018-02-14 16:00:00','2018-02-14 16:00:00','success',NULL,'cron',NULL),(20,23,20,'2018-02-14 16:15:00','2018-02-14 16:15:00','success',NULL,'cron',NULL),(21,23,21,'2018-02-14 16:30:00','2018-02-14 16:30:00','success',NULL,'cron',NULL),(22,23,22,'2018-02-15 09:00:00','2018-02-15 09:00:02','success',NULL,'cron',NULL),(23,23,23,'2018-02-15 09:15:00','2018-02-15 09:15:00','success',NULL,'cron',NULL),(24,23,24,'2018-02-15 09:30:00','2018-02-15 09:30:00','success',NULL,'cron',NULL),(25,5,1,'2018-02-15 09:30:00','2018-02-15 09:30:01','success',NULL,'cron',NULL),(26,8,1,'2018-02-15 09:30:00','2018-02-15 09:30:01','success',NULL,'cron',NULL),(27,23,25,'2018-02-15 09:45:00','2018-02-15 09:45:00','success',NULL,'cron',NULL),(28,23,26,'2018-02-15 10:00:00','2018-02-15 10:00:00','success',NULL,'cron',NULL),(29,23,27,'2018-02-15 10:15:00','2018-02-15 10:15:00','success',NULL,'cron',NULL),(30,23,28,'2018-02-15 10:30:00','2018-02-15 10:30:00','success',NULL,'cron',NULL),(31,23,29,'2018-02-15 10:45:00','2018-02-15 10:45:01','success',NULL,'cron',NULL),(32,23,30,'2018-02-15 11:00:00','2018-02-15 11:00:00','success',NULL,'cron',NULL),(33,23,31,'2018-02-15 11:15:00','2018-02-15 11:15:00','success',NULL,'cron',NULL),(34,23,32,'2018-02-15 11:30:00','2018-02-15 11:30:00','success',NULL,'cron',NULL),(35,23,33,'2018-02-15 11:45:00','2018-02-15 11:45:00','success',NULL,'cron',NULL),(36,23,34,'2018-02-15 12:00:00','2018-02-15 12:00:00','success',NULL,'cron',NULL),(37,23,35,'2018-02-15 12:15:00','2018-02-15 12:15:00','success',NULL,'cron',NULL),(38,23,36,'2018-02-15 12:30:00','2018-02-15 12:30:00','success',NULL,'cron',NULL),(39,23,37,'2018-02-15 12:45:00','2018-02-15 12:45:00','success',NULL,'cron',NULL),(40,23,38,'2018-02-15 13:00:00','2018-02-15 13:00:01','success',NULL,'cron',NULL),(41,23,39,'2018-02-15 13:15:00','2018-02-15 13:15:00','success',NULL,'cron',NULL),(42,23,40,'2018-02-15 13:30:00','2018-02-15 13:30:00','success',NULL,'cron',NULL),(43,23,41,'2018-02-15 13:45:00','2018-02-15 13:45:00','success',NULL,'cron',NULL),(44,23,42,'2018-02-15 14:00:00','2018-02-15 14:00:00','success',NULL,'cron',NULL),(45,23,43,'2018-02-15 14:15:00','2018-02-15 14:15:00','success',NULL,'cron',NULL),(46,23,44,'2018-02-15 14:30:00','2018-02-15 14:30:00','success',NULL,'cron',NULL),(47,23,45,'2018-02-15 14:45:00','2018-02-15 14:45:00','success',NULL,'cron',NULL),(48,23,46,'2018-02-15 15:00:00','2018-02-15 15:00:00','success',NULL,'cron',NULL),(49,23,47,'2018-02-15 15:15:00','2018-02-15 15:15:00','success',NULL,'cron',NULL),(50,23,48,'2018-02-15 15:30:00','2018-02-15 15:30:00','success',NULL,'cron',NULL),(51,23,49,'2018-02-15 15:45:00','2018-02-15 15:45:00','success',NULL,'cron',NULL),(52,23,50,'2018-02-15 16:00:00','2018-02-15 16:00:00','success',NULL,'cron',NULL),(53,23,51,'2018-02-15 16:15:00','2018-02-15 16:15:00','success',NULL,'cron',NULL),(54,23,52,'2018-02-15 16:30:00','2018-02-15 16:30:00','success',NULL,'cron',NULL),(55,23,53,'2018-02-16 06:45:00','2018-02-16 06:45:02','success',NULL,'cron',NULL),(56,23,54,'2018-02-16 07:00:00','2018-02-16 07:00:00','success',NULL,'cron',NULL),(57,23,55,'2018-02-16 07:15:00','2018-02-16 07:15:00','success',NULL,'cron',NULL),(58,23,56,'2018-02-16 07:30:00','2018-02-16 07:30:00','success',NULL,'cron',NULL),(59,23,57,'2018-02-16 07:45:00','2018-02-16 07:45:00','success',NULL,'cron',NULL),(60,23,58,'2018-02-16 08:00:00','2018-02-16 08:00:00','success',NULL,'cron',NULL),(61,23,59,'2018-02-16 08:15:00','2018-02-16 08:15:00','success',NULL,'cron',NULL),(62,23,60,'2018-02-16 08:30:00','2018-02-16 08:30:00','success',NULL,'cron',NULL),(63,23,61,'2018-02-16 08:45:00','2018-02-16 08:45:00','success',NULL,'cron',NULL),(64,23,62,'2018-02-16 09:00:00','2018-02-16 09:00:00','success',NULL,'cron',NULL),(65,23,63,'2018-02-16 09:15:00','2018-02-16 09:15:00','success',NULL,'cron',NULL),(66,23,64,'2018-02-16 09:30:00','2018-02-16 09:30:01','success',NULL,'cron',NULL),(67,5,2,'2018-02-16 09:30:00','2018-02-16 09:30:01','success',NULL,'cron',NULL),(68,8,2,'2018-02-16 09:30:00','2018-02-16 09:30:01','success',NULL,'cron',NULL),(69,23,65,'2018-02-16 09:45:00','2018-02-16 09:45:00','success',NULL,'cron',NULL),(70,23,66,'2018-02-16 10:00:00','2018-02-16 10:00:00','success',NULL,'cron',NULL),(71,23,67,'2018-02-16 10:15:00','2018-02-16 10:15:00','success',NULL,'cron',NULL),(72,23,68,'2018-02-16 10:30:00','2018-02-16 10:30:00','success',NULL,'cron',NULL),(73,23,69,'2018-02-16 10:45:00','2018-02-16 10:45:01','success',NULL,'cron',NULL);
/*!40000 ALTER TABLE `job_run_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_account_transfer_details`
--

DROP TABLE IF EXISTS `m_account_transfer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_account_transfer_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_office_id` bigint(20) NOT NULL,
  `to_office_id` bigint(20) NOT NULL,
  `from_client_id` bigint(20) DEFAULT NULL,
  `to_client_id` bigint(20) DEFAULT NULL,
  `from_savings_account_id` bigint(20) DEFAULT NULL,
  `to_savings_account_id` bigint(20) DEFAULT NULL,
  `from_loan_account_id` bigint(20) DEFAULT NULL,
  `to_loan_account_id` bigint(20) DEFAULT NULL,
  `transfer_type` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_account_transfer_details_from_office` (`from_office_id`),
  KEY `FK_m_account_transfer_details_to_office` (`to_office_id`),
  KEY `FK_m_account_transfer_details_from_client` (`from_client_id`),
  KEY `FK_m_account_transfer_details_to_client` (`to_client_id`),
  KEY `FK_m_account_transfer_details_from_savings_account` (`from_savings_account_id`),
  KEY `FK_m_account_transfer_details_to_savings_account` (`to_savings_account_id`),
  KEY `FK_m_account_transfer_details_from_loan_account` (`from_loan_account_id`),
  KEY `FK_m_account_transfer_details_to_loan_account` (`to_loan_account_id`),
  CONSTRAINT `FK_m_account_transfer_details_from_client` FOREIGN KEY (`from_client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_from_loan_account` FOREIGN KEY (`from_loan_account_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_from_office` FOREIGN KEY (`from_office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_from_savings_account` FOREIGN KEY (`from_savings_account_id`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_to_client` FOREIGN KEY (`to_client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_to_loan_account` FOREIGN KEY (`to_loan_account_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_to_office` FOREIGN KEY (`to_office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_account_transfer_details_to_savings_account` FOREIGN KEY (`to_savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_account_transfer_details`
--

LOCK TABLES `m_account_transfer_details` WRITE;
/*!40000 ALTER TABLE `m_account_transfer_details` DISABLE KEYS */;
INSERT INTO `m_account_transfer_details` VALUES (1,1,1,6,6,1,NULL,NULL,5,2);
/*!40000 ALTER TABLE `m_account_transfer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_account_transfer_standing_instructions`
--

DROP TABLE IF EXISTS `m_account_transfer_standing_instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_account_transfer_standing_instructions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `account_transfer_details_id` bigint(20) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `instruction_type` tinyint(2) NOT NULL,
  `amount` decimal(19,6) DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date DEFAULT NULL,
  `recurrence_type` tinyint(1) NOT NULL,
  `recurrence_frequency` smallint(5) DEFAULT NULL,
  `recurrence_interval` smallint(5) DEFAULT NULL,
  `recurrence_on_day` smallint(2) DEFAULT NULL,
  `recurrence_on_month` smallint(2) DEFAULT NULL,
  `last_run_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_m_standing_instructions_account_transfer_details` (`account_transfer_details_id`),
  CONSTRAINT `FK_m_standing_instructions_account_transfer_details` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_account_transfer_standing_instructions`
--

LOCK TABLES `m_account_transfer_standing_instructions` WRITE;
/*!40000 ALTER TABLE `m_account_transfer_standing_instructions` DISABLE KEYS */;
INSERT INTO `m_account_transfer_standing_instructions` VALUES (1,'Loan Payment',1,1,1,2,2000.000000,'2018-02-14','2018-08-30',2,0,1,14,2,NULL);
/*!40000 ALTER TABLE `m_account_transfer_standing_instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_account_transfer_standing_instructions_history`
--

DROP TABLE IF EXISTS `m_account_transfer_standing_instructions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_account_transfer_standing_instructions_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `standing_instruction_id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `execution_time` datetime NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `error_log` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_account_transfer_standing_instructions_history` (`standing_instruction_id`),
  CONSTRAINT `FK_m_account_transfer_standing_instructions_m_history` FOREIGN KEY (`standing_instruction_id`) REFERENCES `m_account_transfer_standing_instructions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_account_transfer_standing_instructions_history`
--

LOCK TABLES `m_account_transfer_standing_instructions_history` WRITE;
/*!40000 ALTER TABLE `m_account_transfer_standing_instructions_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_account_transfer_standing_instructions_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_account_transfer_transaction`
--

DROP TABLE IF EXISTS `m_account_transfer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_account_transfer_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_transfer_details_id` bigint(20) NOT NULL,
  `from_savings_transaction_id` bigint(20) DEFAULT NULL,
  `from_loan_transaction_id` bigint(20) DEFAULT NULL,
  `to_savings_transaction_id` bigint(20) DEFAULT NULL,
  `to_loan_transaction_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(1) NOT NULL,
  `transaction_date` date NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_account_transfer_transaction_from_m_savings_transaction` (`from_savings_transaction_id`),
  KEY `FK_m_account_transfer_transaction_to_m_savings_transaction` (`to_savings_transaction_id`),
  KEY `FK_m_account_transfer_transaction_to_m_loan_transaction` (`to_loan_transaction_id`),
  KEY `FK_m_account_transfer_transaction_from_m_loan_transaction` (`from_loan_transaction_id`),
  KEY `FK_m_account_transfer_transaction_account_detail` (`account_transfer_details_id`),
  CONSTRAINT `FK_m_account_transfer_transaction_account_detail` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`),
  CONSTRAINT `FK_m_account_transfer_transaction_from_m_loan_transaction` FOREIGN KEY (`from_loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  CONSTRAINT `FK_m_account_transfer_transaction_from_m_savings_transaction` FOREIGN KEY (`from_savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  CONSTRAINT `FK_m_account_transfer_transaction_to_m_loan_transaction` FOREIGN KEY (`to_loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  CONSTRAINT `FK_m_account_transfer_transaction_to_m_savings_transaction` FOREIGN KEY (`to_savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_account_transfer_transaction`
--

LOCK TABLES `m_account_transfer_transaction` WRITE;
/*!40000 ALTER TABLE `m_account_transfer_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_account_transfer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_address`
--

DROP TABLE IF EXISTS `m_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street` varchar(100) DEFAULT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `address_line_3` varchar(100) DEFAULT NULL,
  `town_village` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `county_district` varchar(100) DEFAULT NULL,
  `state_province_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) unsigned DEFAULT '0.00000000',
  `longitude` decimal(10,8) unsigned DEFAULT '0.00000000',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_fields_codefk1` (`state_province_id`),
  KEY `address_fields_codefk2` (`country_id`),
  CONSTRAINT `address_fields_codefk1` FOREIGN KEY (`state_province_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `address_fields_codefk2` FOREIGN KEY (`country_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_address`
--

LOCK TABLES `m_address` WRITE;
/*!40000 ALTER TABLE `m_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_adhoc`
--

DROP TABLE IF EXISTS `m_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_adhoc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `query` varchar(2000) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `table_fields` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `report_run_frequency_code` int(11) DEFAULT NULL,
  `report_run_every` int(11) DEFAULT NULL,
  `last_run` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdby_id` (`createdby_id`),
  KEY `lastmodifiedby_id` (`lastmodifiedby_id`),
  CONSTRAINT `createdby_id` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `lastmodifiedby_id` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_adhoc`
--

LOCK TABLES `m_adhoc` WRITE;
/*!40000 ALTER TABLE `m_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_appuser`
--

DROP TABLE IF EXISTS `m_appuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_appuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `office_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firsttime_login_remaining` bit(1) NOT NULL,
  `nonexpired` bit(1) NOT NULL,
  `nonlocked` bit(1) NOT NULL,
  `nonexpired_credentials` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_time_password_updated` date NOT NULL,
  `password_never_expires` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'define if the password, should be check for validity period or not',
  `is_self_service_user` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_org` (`username`),
  KEY `FKB3D587CE0DD567A` (`office_id`),
  KEY `fk_m_appuser_002x` (`staff_id`),
  KEY `last_time_password_updated` (`last_time_password_updated`),
  CONSTRAINT `FKB3D587CE0DD567A` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `fk_m_appuser_002` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_appuser`
--

LOCK TABLES `m_appuser` WRITE;
/*!40000 ALTER TABLE `m_appuser` DISABLE KEYS */;
INSERT INTO `m_appuser` VALUES (1,0,1,NULL,'mifos','App','Administrator','5787039480429368bf94732aacc771cd0a3ea02bcf504ffe1185ab94213bc63a','demomfi@mifos.org','\0','','','','','2018-01-26',0,'\0'),(2,0,1,NULL,'system','system','system','5787039480429368bf94732aacc771cd0a3ea02bcf504ffe1185ab94213bc63a','demomfi@mifos.org','\0','','','','','2014-03-07',0,'\0'),(3,0,1,NULL,'rose','RoseMary','Masawe','dacd67c863da674733690acf73defa790f896ef0ec0dc82788056167a500b244','rose@gmail.com','\0','','','','','2018-02-15',0,'\0'),(4,0,1,NULL,'grace','Grace','Amin','c4343d1d3d60d9418456cbd81df6741824dbf9dda28e859c186284c71ab706b0','grace@gmail.com','\0','','','','','2018-02-15',0,'\0'),(5,0,1,NULL,'justine','Justine','Warioba','c8a7df1d4bbae1f80746e59aa7f8ffe813098322b7f671095e74525494e76de0','justine@gmail.com','\0','','','','','2018-02-15',0,'\0');
/*!40000 ALTER TABLE `m_appuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_appuser_previous_password`
--

DROP TABLE IF EXISTS `m_appuser_previous_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_appuser_previous_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `removal_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `m_appuser_previous_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_appuser_previous_password`
--

LOCK TABLES `m_appuser_previous_password` WRITE;
/*!40000 ALTER TABLE `m_appuser_previous_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_appuser_previous_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_appuser_role`
--

DROP TABLE IF EXISTS `m_appuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_appuser_role` (
  `appuser_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`appuser_id`,`role_id`),
  KEY `FK7662CE59B4100309` (`appuser_id`),
  KEY `FK7662CE5915CEC7AB` (`role_id`),
  CONSTRAINT `FK7662CE5915CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`id`),
  CONSTRAINT `FK7662CE59B4100309` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_appuser_role`
--

LOCK TABLES `m_appuser_role` WRITE;
/*!40000 ALTER TABLE `m_appuser_role` DISABLE KEYS */;
INSERT INTO `m_appuser_role` VALUES (1,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `m_appuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_calendar`
--

DROP TABLE IF EXISTS `m_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `calendar_type_enum` smallint(5) NOT NULL,
  `repeating` tinyint(1) NOT NULL DEFAULT '0',
  `recurrence` varchar(100) DEFAULT NULL,
  `remind_by_enum` smallint(5) DEFAULT NULL,
  `first_reminder` smallint(11) DEFAULT NULL,
  `second_reminder` smallint(11) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `meeting_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_calendar`
--

LOCK TABLES `m_calendar` WRITE;
/*!40000 ALTER TABLE `m_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_calendar_history`
--

DROP TABLE IF EXISTS `m_calendar_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_calendar_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `calendar_type_enum` smallint(5) NOT NULL,
  `repeating` tinyint(1) NOT NULL DEFAULT '0',
  `recurrence` varchar(100) DEFAULT NULL,
  `remind_by_enum` smallint(5) DEFAULT NULL,
  `first_reminder` smallint(11) DEFAULT NULL,
  `second_reminder` smallint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_calendar_m_calendar_history` (`calendar_id`),
  CONSTRAINT `FK_m_calendar_m_calendar_history` FOREIGN KEY (`calendar_id`) REFERENCES `m_calendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_calendar_history`
--

LOCK TABLES `m_calendar_history` WRITE;
/*!40000 ALTER TABLE `m_calendar_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_calendar_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_calendar_instance`
--

DROP TABLE IF EXISTS `m_calendar_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_calendar_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type_enum` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_calendar_m_calendar_instance` (`calendar_id`),
  CONSTRAINT `FK_m_calendar_m_calendar_instance` FOREIGN KEY (`calendar_id`) REFERENCES `m_calendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_calendar_instance`
--

LOCK TABLES `m_calendar_instance` WRITE;
/*!40000 ALTER TABLE `m_calendar_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_calendar_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_cashier_transactions`
--

DROP TABLE IF EXISTS `m_cashier_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_cashier_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashier_id` bigint(20) NOT NULL,
  `txn_type` smallint(5) NOT NULL,
  `txn_amount` decimal(19,6) NOT NULL,
  `txn_date` date NOT NULL,
  `created_date` datetime NOT NULL,
  `entity_type` varchar(50) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `txn_note` varchar(200) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_m_teller_transactions_m_cashier` (`cashier_id`),
  CONSTRAINT `FK_m_teller_transactions_m_cashiers` FOREIGN KEY (`cashier_id`) REFERENCES `m_cashiers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_cashier_transactions`
--

LOCK TABLES `m_cashier_transactions` WRITE;
/*!40000 ALTER TABLE `m_cashier_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_cashier_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_cashiers`
--

DROP TABLE IF EXISTS `m_cashiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_cashiers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) DEFAULT NULL,
  `teller_id` bigint(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `full_day` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_m_cashiers_m_staff` (`staff_id`),
  KEY `IK_m_cashiers_m_teller` (`teller_id`),
  CONSTRAINT `FK_m_cashiers_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  CONSTRAINT `FK_m_cashiers_m_teller` FOREIGN KEY (`teller_id`) REFERENCES `m_tellers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_cashiers`
--

LOCK TABLES `m_cashiers` WRITE;
/*!40000 ALTER TABLE `m_cashiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_cashiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_charge`
--

DROP TABLE IF EXISTS `m_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `charge_applies_to_enum` smallint(5) NOT NULL,
  `charge_time_enum` smallint(5) NOT NULL,
  `charge_calculation_enum` smallint(5) NOT NULL,
  `charge_payment_mode_enum` smallint(5) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `fee_on_day` smallint(5) DEFAULT NULL,
  `fee_interval` smallint(5) DEFAULT NULL,
  `fee_on_month` smallint(5) DEFAULT NULL,
  `is_penalty` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `fee_frequency` smallint(5) DEFAULT NULL,
  `income_or_liability_account_id` bigint(20) DEFAULT NULL,
  `tax_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_m_charge_acc_gl_account` (`income_or_liability_account_id`),
  KEY `FK_m_charge_m_tax_group` (`tax_group_id`),
  CONSTRAINT `FK_m_charge_acc_gl_account` FOREIGN KEY (`income_or_liability_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_m_charge_m_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_charge`
--

LOCK TABLES `m_charge` WRITE;
/*!40000 ALTER TABLE `m_charge` DISABLE KEYS */;
INSERT INTO `m_charge` VALUES (1,'Processing Fee','TZS',1,1,2,0,0.250000,NULL,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL),(2,'Social Fund Charge','TZS',1,1,2,0,0.500000,NULL,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL),(3,'Entry fee','TZS',3,2,1,0,15000.000000,NULL,NULL,NULL,0,1,0,NULL,NULL,NULL,30,NULL),(5,'Processing Fee 1','TZS',1,1,2,0,0.500000,NULL,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client`
--

DROP TABLE IF EXISTS `m_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` int(5) NOT NULL DEFAULT '300',
  `sub_status` int(11) DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `office_joining_date` date DEFAULT NULL,
  `office_id` bigint(20) NOT NULL,
  `transfer_to_office_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) NOT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `gender_cv_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `client_age` int(11) DEFAULT NULL,
  `age_at_office` int(11) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `closure_reason_cv_id` int(11) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `default_savings_product` bigint(20) DEFAULT NULL,
  `default_savings_account` bigint(20) DEFAULT NULL,
  `client_type_cv_id` int(11) DEFAULT NULL,
  `client_classification_cv_id` int(11) DEFAULT NULL,
  `reject_reason_cv_id` int(11) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `withdraw_reason_cv_id` int(11) DEFAULT NULL,
  `withdrawn_on_date` date DEFAULT NULL,
  `withdraw_on_userid` bigint(20) DEFAULT NULL,
  `reactivated_on_date` date DEFAULT NULL,
  `reactivated_on_userid` bigint(20) DEFAULT NULL,
  `legal_form_enum` int(5) DEFAULT NULL,
  `reopened_on_date` date DEFAULT NULL,
  `reopened_by_userid` bigint(20) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_no_UNIQUE` (`account_no`),
  UNIQUE KEY `external_id` (`external_id`),
  UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`),
  KEY `FKCE00CAB3E0DD567A` (`office_id`),
  KEY `FK_m_client_m_image` (`image_id`),
  KEY `client_staff_id` (`staff_id`),
  KEY `FK_m_client_m_code` (`closure_reason_cv_id`),
  KEY `FK_m_client_m_office` (`transfer_to_office_id`),
  KEY `FK_m_client_m_savings_product` (`default_savings_product`),
  KEY `FK_m_client_m_savings_account` (`default_savings_account`),
  KEY `FK_m_client_type_m_code_value` (`client_type_cv_id`),
  KEY `FK_m_client_classification_m_code_value` (`client_classification_cv_id`),
  KEY `FK1_m_client_gender_m_code_value` (`gender_cv_id`),
  KEY `FK_m_client_substatus_m_code_value` (`sub_status`),
  KEY `FK_m_client_type_mcode_value_reject` (`reject_reason_cv_id`),
  KEY `FK_m_client_type_m_code_value_withdraw` (`withdraw_reason_cv_id`),
  CONSTRAINT `FK1_m_client_gender_m_code_value` FOREIGN KEY (`gender_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FKCE00CAB3E0DD567A` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_client_classification_m_code_value` FOREIGN KEY (`client_classification_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_client_m_code` FOREIGN KEY (`closure_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_client_m_image` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK_m_client_m_office` FOREIGN KEY (`transfer_to_office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_client_m_savings_account` FOREIGN KEY (`default_savings_account`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `FK_m_client_m_savings_product` FOREIGN KEY (`default_savings_product`) REFERENCES `m_savings_product` (`id`),
  CONSTRAINT `FK_m_client_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  CONSTRAINT `FK_m_client_substatus_m_code_value` FOREIGN KEY (`sub_status`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_client_type_m_code_value` FOREIGN KEY (`client_type_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_client_type_m_code_value_withdraw` FOREIGN KEY (`withdraw_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_client_type_mcode_value_reject` FOREIGN KEY (`reject_reason_cv_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client`
--

LOCK TABLES `m_client` WRITE;
/*!40000 ALTER TABLE `m_client` DISABLE KEYS */;
INSERT INTO `m_client` VALUES (1,'000000001',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Rose',NULL,'Malaki',NULL,'Rose Malaki',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,'000000002',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Juma',NULL,'Mseko',NULL,'Juma Mseko',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'000000003',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Hadija',NULL,'Kiseko',NULL,'Hadija Kiseko',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'000000004',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Lulu',NULL,'Ibrahimu',NULL,'Lulu Ibrahimu',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'000000005',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Lucious',NULL,'Muna',NULL,'Lucious Muna',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(6,'000000006',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Anna',NULL,'Lusekelo',NULL,'Anna Lusekelo',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(7,'000000007',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Eliza',NULL,'Mushi',NULL,'Eliza Mushi',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(8,'000000008',NULL,300,NULL,'2018-02-13','2018-02-13',1,NULL,NULL,'Mulisi',NULL,'Mulisi',NULL,'Mulisi Mulisi',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-13',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(9,'000000009','PF 5000',300,NULL,'2018-02-15','2018-02-15',1,NULL,NULL,'mwakasungura','sinachangu','malikauli',NULL,'mwakasungura sinachangu malikauli','0744252525',0,18,'2017-08-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-15',4,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(10,'000000010','1819',300,NULL,'2018-02-15','2018-02-15',1,NULL,NULL,'Waryoba','A','Buritho',NULL,'Waryoba A Buritho','0713463030',0,18,'1991-01-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-15',5,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'000000011','7000',300,NULL,'2018-02-15','2018-02-15',1,NULL,NULL,'diana','didas','kavishe',NULL,'diana didas kavishe','0718922173',0,19,'1994-06-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-15',3,3,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_address`
--

DROP TABLE IF EXISTS `m_client_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL DEFAULT '0',
  `address_id` bigint(20) NOT NULL DEFAULT '0',
  `address_type_id` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `addressIdFk` (`address_id`),
  KEY `address_codefk` (`address_type_id`),
  KEY `clientaddressfk` (`client_id`),
  CONSTRAINT `address_codefk` FOREIGN KEY (`address_type_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `clientaddressfk` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_address`
--

LOCK TABLES `m_client_address` WRITE;
/*!40000 ALTER TABLE `m_client_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_attendance`
--

DROP TABLE IF EXISTS `m_client_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL DEFAULT '0',
  `meeting_id` bigint(20) NOT NULL,
  `attendance_type_enum` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_client_meeting_attendance` (`client_id`,`meeting_id`),
  KEY `FK_m_meeting_m_client_attendance` (`meeting_id`),
  CONSTRAINT `FK_m_client_m_client_attendance` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK_m_meeting_m_client_attendance` FOREIGN KEY (`meeting_id`) REFERENCES `m_meeting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_attendance`
--

LOCK TABLES `m_client_attendance` WRITE;
/*!40000 ALTER TABLE `m_client_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_charge`
--

DROP TABLE IF EXISTS `m_client_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(1) NOT NULL,
  `charge_time_enum` smallint(5) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `charge_calculation_enum` smallint(5) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL,
  `is_paid_derived` tinyint(1) DEFAULT NULL,
  `waived` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `inactivated_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_client_charge_m_client` (`client_id`),
  KEY `FK_m_client_charge_m_charge` (`charge_id`),
  CONSTRAINT `FK_m_client_charge_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `FK_m_client_charge_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_charge`
--

LOCK TABLES `m_client_charge` WRITE;
/*!40000 ALTER TABLE `m_client_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_charge_paid_by`
--

DROP TABLE IF EXISTS `m_client_charge_paid_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_charge_paid_by` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_transaction_id` bigint(20) NOT NULL,
  `client_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_client_charge_paid_by_m_client_transaction` (`client_transaction_id`),
  KEY `FK_m_client_charge_paid_by_m_client_charge` (`client_charge_id`),
  CONSTRAINT `FK_m_client_charge_paid_by_m_client_charge` FOREIGN KEY (`client_charge_id`) REFERENCES `m_client_charge` (`id`),
  CONSTRAINT `FK_m_client_charge_paid_by_m_client_transaction` FOREIGN KEY (`client_transaction_id`) REFERENCES `m_client_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_charge_paid_by`
--

LOCK TABLES `m_client_charge_paid_by` WRITE;
/*!40000 ALTER TABLE `m_client_charge_paid_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_charge_paid_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_identifier`
--

DROP TABLE IF EXISTS `m_client_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_identifier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `document_key` varchar(50) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '300',
  `active` int(5) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_identifier_key` (`document_type_id`,`document_key`),
  UNIQUE KEY `unique_active_client_identifier` (`client_id`,`document_type_id`,`active`),
  KEY `FK_m_client_document_m_client` (`client_id`),
  KEY `FK_m_client_document_m_code_value` (`document_type_id`),
  CONSTRAINT `FK_m_client_document_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK_m_client_document_m_code_value` FOREIGN KEY (`document_type_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_identifier`
--

LOCK TABLES `m_client_identifier` WRITE;
/*!40000 ALTER TABLE `m_client_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_non_person`
--

DROP TABLE IF EXISTS `m_client_non_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_non_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `constitution_cv_id` int(11) NOT NULL,
  `incorp_no` varchar(50) DEFAULT NULL,
  `incorp_validity_till` datetime DEFAULT NULL,
  `main_business_line_cv_id` int(11) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `FK_client_id` (`client_id`),
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_non_person`
--

LOCK TABLES `m_client_non_person` WRITE;
/*!40000 ALTER TABLE `m_client_non_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_non_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_client_transaction`
--

DROP TABLE IF EXISTS `m_client_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_client_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(1) NOT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type_enum` smallint(5) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `created_date` datetime NOT NULL,
  `appuser_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id` (`external_id`),
  KEY `FK_m_client_transaction_m_client` (`client_id`),
  KEY `FK_m_client_transaction_m_appuser` (`appuser_id`),
  CONSTRAINT `FK_m_client_transaction_m_appuser` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_client_transaction_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_client_transaction`
--

LOCK TABLES `m_client_transaction` WRITE;
/*!40000 ALTER TABLE `m_client_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_client_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_code`
--

DROP TABLE IF EXISTS `m_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(100) DEFAULT NULL,
  `is_system_defined` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name` (`code_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_code`
--

LOCK TABLES `m_code` WRITE;
/*!40000 ALTER TABLE `m_code` DISABLE KEYS */;
INSERT INTO `m_code` VALUES (1,'Customer Identifier',1),(2,'LoanCollateral',1),(3,'LoanPurpose',1),(4,'Gender',1),(5,'YesNo',1),(6,'GuarantorRelationship',1),(7,'AssetAccountTags',1),(8,'LiabilityAccountTags',1),(9,'EquityAccountTags',1),(10,'IncomeAccountTags',1),(11,'ExpenseAccountTags',1),(13,'GROUPROLE',1),(14,'ClientClosureReason',1),(15,'GroupClosureReason',1),(16,'ClientType',1),(17,'ClientClassification',1),(18,'ClientSubStatus',1),(19,'ClientRejectReason',1),(20,'ClientWithdrawReason',1),(21,'Entity to Entity Access Types',1),(22,'CenterClosureReason',1),(23,'LoanRescheduleReason',1),(24,'Constitution',1),(25,'Main Business Line',1),(26,'WriteOffReasons',1),(27,'STATE',1),(28,'COUNTRY',1),(29,'ADDRESS_TYPE',1),(30,'MARITAL STATUS',1),(31,'RELATIONSHIP',1),(32,'PROFESSION',1);
/*!40000 ALTER TABLE `m_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_code_value`
--

DROP TABLE IF EXISTS `m_code_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_code_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL,
  `code_value` varchar(100) DEFAULT NULL,
  `code_description` varchar(500) DEFAULT NULL,
  `order_position` int(11) NOT NULL DEFAULT '0',
  `code_score` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_value` (`code_id`,`code_value`),
  KEY `FKCFCEA42640BE071Z` (`code_id`),
  CONSTRAINT `FKCFCEA42640BE071Z` FOREIGN KEY (`code_id`) REFERENCES `m_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_code_value`
--

LOCK TABLES `m_code_value` WRITE;
/*!40000 ALTER TABLE `m_code_value` DISABLE KEYS */;
INSERT INTO `m_code_value` VALUES (1,1,'Passport',NULL,1,NULL,1,0),(2,1,'Id',NULL,2,NULL,1,0),(3,1,'Drivers License',NULL,3,NULL,1,0),(4,1,'Any Other Id Type',NULL,4,NULL,1,0),(5,6,'Spouse',NULL,0,NULL,1,0),(6,6,'Parent',NULL,0,NULL,1,0),(7,6,'Sibling',NULL,0,NULL,1,0),(8,6,'Business Associate',NULL,0,NULL,1,0),(9,6,'Other',NULL,0,NULL,1,0),(10,21,'Office Access to Loan Products',NULL,0,NULL,1,0),(11,21,'Office Access to Savings Products',NULL,0,NULL,1,0),(12,21,'Office Access to Fees/Charges',NULL,0,NULL,1,0),(13,13,'Leader','Group Leader Role',1,NULL,1,0),(14,11,'Payroll','',1,NULL,1,0),(15,11,'nssf','',2,NULL,1,0),(16,11,'Makato TRA','',3,NULL,1,0),(17,11,'WCF','',4,NULL,1,0),(18,4,'Male','',1,NULL,1,0),(19,4,'Female','',2,NULL,1,0);
/*!40000 ALTER TABLE `m_code_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_creditbureau`
--

DROP TABLE IF EXISTS `m_creditbureau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_creditbureau` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `implementationKey` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique impl` (`name`,`product`,`country`,`implementationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_creditbureau`
--

LOCK TABLES `m_creditbureau` WRITE;
/*!40000 ALTER TABLE `m_creditbureau` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_creditbureau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_creditbureau_configuration`
--

DROP TABLE IF EXISTS `m_creditbureau_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_creditbureau_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `configkey` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `organisation_creditbureau_id` bigint(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mcbconfig` (`configkey`,`organisation_creditbureau_id`),
  KEY `cbConfigfk1` (`organisation_creditbureau_id`),
  CONSTRAINT `cbConfigfk1` FOREIGN KEY (`organisation_creditbureau_id`) REFERENCES `m_organisation_creditbureau` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_creditbureau_configuration`
--

LOCK TABLES `m_creditbureau_configuration` WRITE;
/*!40000 ALTER TABLE `m_creditbureau_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_creditbureau_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_creditbureau_loanproduct_mapping`
--

DROP TABLE IF EXISTS `m_creditbureau_loanproduct_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_creditbureau_loanproduct_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organisation_creditbureau_id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `is_creditcheck_mandatory` tinyint(1) DEFAULT NULL,
  `skip_creditcheck_in_failure` tinyint(1) DEFAULT NULL,
  `stale_period` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cblpunique_key` (`organisation_creditbureau_id`,`loan_product_id`),
  KEY `fk_cb_lp2` (`loan_product_id`),
  CONSTRAINT `cblpfk2` FOREIGN KEY (`organisation_creditbureau_id`) REFERENCES `m_organisation_creditbureau` (`id`),
  CONSTRAINT `fk_cb_lp2` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_creditbureau_loanproduct_mapping`
--

LOCK TABLES `m_creditbureau_loanproduct_mapping` WRITE;
/*!40000 ALTER TABLE `m_creditbureau_loanproduct_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_creditbureau_loanproduct_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_currency`
--

DROP TABLE IF EXISTS `m_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `decimal_places` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `display_symbol` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `internationalized_name_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_currency`
--

LOCK TABLES `m_currency` WRITE;
/*!40000 ALTER TABLE `m_currency` DISABLE KEYS */;
INSERT INTO `m_currency` VALUES (1,'AED',2,NULL,NULL,'UAE Dirham','currency.AED'),(2,'AFN',2,NULL,NULL,'Afghanistan Afghani','currency.AFN'),(3,'ALL',2,NULL,NULL,'Albanian Lek','currency.ALL'),(4,'AMD',2,NULL,NULL,'Armenian Dram','currency.AMD'),(5,'ANG',2,NULL,NULL,'Netherlands Antillian Guilder','currency.ANG'),(6,'AOA',2,NULL,NULL,'Angolan Kwanza','currency.AOA'),(7,'ARS',2,NULL,'$','Argentine Peso','currency.ARS'),(8,'AUD',2,NULL,'A$','Australian Dollar','currency.AUD'),(9,'AWG',2,NULL,NULL,'Aruban Guilder','currency.AWG'),(10,'AZM',2,NULL,NULL,'Azerbaijanian Manat','currency.AZM'),(11,'BAM',2,NULL,NULL,'Bosnia and Herzegovina Convertible Marks','currency.BAM'),(12,'BBD',2,NULL,NULL,'Barbados Dollar','currency.BBD'),(13,'BDT',2,NULL,NULL,'Bangladesh Taka','currency.BDT'),(14,'BGN',2,NULL,NULL,'Bulgarian Lev','currency.BGN'),(15,'BHD',3,NULL,NULL,'Bahraini Dinar','currency.BHD'),(16,'BIF',0,NULL,NULL,'Burundi Franc','currency.BIF'),(17,'BMD',2,NULL,NULL,'Bermudian Dollar','currency.BMD'),(18,'BND',2,NULL,'B$','Brunei Dollar','currency.BND'),(19,'BOB',2,NULL,'Bs.','Bolivian Boliviano','currency.BOB'),(20,'BRL',2,NULL,'R$','Brazilian Real','currency.BRL'),(21,'BSD',2,NULL,NULL,'Bahamian Dollar','currency.BSD'),(22,'BTN',2,NULL,NULL,'Bhutan Ngultrum','currency.BTN'),(23,'BWP',2,NULL,NULL,'Botswana Pula','currency.BWP'),(24,'BYR',0,NULL,NULL,'Belarussian Ruble','currency.BYR'),(25,'BZD',2,NULL,'BZ$','Belize Dollar','currency.BZD'),(26,'CAD',2,NULL,NULL,'Canadian Dollar','currency.CAD'),(27,'CDF',2,NULL,NULL,'Franc Congolais','currency.CDF'),(28,'CHF',2,NULL,NULL,'Swiss Franc','currency.CHF'),(29,'CLP',0,NULL,'$','Chilean Peso','currency.CLP'),(30,'CNY',2,NULL,NULL,'Chinese Yuan Renminbi','currency.CNY'),(31,'COP',2,NULL,'$','Colombian Peso','currency.COP'),(32,'CRC',2,NULL,'?','Costa Rican Colon','currency.CRC'),(33,'CSD',2,NULL,NULL,'Serbian Dinar','currency.CSD'),(34,'CUP',2,NULL,'$MN','Cuban Peso','currency.CUP'),(35,'CVE',2,NULL,NULL,'Cape Verde Escudo','currency.CVE'),(36,'CYP',2,NULL,NULL,'Cyprus Pound','currency.CYP'),(37,'CZK',2,NULL,NULL,'Czech Koruna','currency.CZK'),(38,'DJF',0,NULL,NULL,'Djibouti Franc','currency.DJF'),(39,'DKK',2,NULL,NULL,'Danish Krone','currency.DKK'),(40,'DOP',2,NULL,'RD$','Dominican Peso','currency.DOP'),(41,'DZD',2,NULL,NULL,'Algerian Dinar','currency.DZD'),(42,'EEK',2,NULL,NULL,'Estonian Kroon','currency.EEK'),(43,'EGP',2,NULL,NULL,'Egyptian Pound','currency.EGP'),(44,'ERN',2,NULL,NULL,'Eritrea Nafka','currency.ERN'),(45,'ETB',2,NULL,NULL,'Ethiopian Birr','currency.ETB'),(46,'EUR',2,NULL,'€','Euro','currency.EUR'),(47,'FJD',2,NULL,NULL,'Fiji Dollar','currency.FJD'),(48,'FKP',2,NULL,NULL,'Falkland Islands Pound','currency.FKP'),(49,'GBP',2,NULL,NULL,'Pound Sterling','currency.GBP'),(50,'GEL',2,NULL,NULL,'Georgian Lari','currency.GEL'),(51,'GHC',2,NULL,'GHc','Ghana Cedi','currency.GHC'),(52,'GIP',2,NULL,NULL,'Gibraltar Pound','currency.GIP'),(53,'GMD',2,NULL,NULL,'Gambian Dalasi','currency.GMD'),(54,'GNF',0,NULL,NULL,'Guinea Franc','currency.GNF'),(55,'GTQ',2,NULL,'Q','Guatemala Quetzal','currency.GTQ'),(56,'GYD',2,NULL,NULL,'Guyana Dollar','currency.GYD'),(57,'HKD',2,NULL,NULL,'Hong Kong Dollar','currency.HKD'),(58,'HNL',2,NULL,'L','Honduras Lempira','currency.HNL'),(59,'HRK',2,NULL,NULL,'Croatian Kuna','currency.HRK'),(60,'HTG',2,NULL,'G','Haiti Gourde','currency.HTG'),(61,'HUF',2,NULL,NULL,'Hungarian Forint','currency.HUF'),(62,'IDR',2,NULL,NULL,'Indonesian Rupiah','currency.IDR'),(63,'ILS',2,NULL,NULL,'New Israeli Shekel','currency.ILS'),(64,'INR',2,NULL,'₹','Indian Rupee','currency.INR'),(65,'IQD',3,NULL,NULL,'Iraqi Dinar','currency.IQD'),(66,'IRR',2,NULL,NULL,'Iranian Rial','currency.IRR'),(67,'ISK',0,NULL,NULL,'Iceland Krona','currency.ISK'),(68,'JMD',2,NULL,NULL,'Jamaican Dollar','currency.JMD'),(69,'JOD',3,NULL,NULL,'Jordanian Dinar','currency.JOD'),(70,'JPY',0,NULL,NULL,'Japanese Yen','currency.JPY'),(71,'KES',2,NULL,'KSh','Kenyan Shilling','currency.KES'),(72,'KGS',2,NULL,NULL,'Kyrgyzstan Som','currency.KGS'),(73,'KHR',2,NULL,NULL,'Cambodia Riel','currency.KHR'),(74,'KMF',0,NULL,NULL,'Comoro Franc','currency.KMF'),(75,'KPW',2,NULL,NULL,'North Korean Won','currency.KPW'),(76,'KRW',0,NULL,NULL,'Korean Won','currency.KRW'),(77,'KWD',3,NULL,NULL,'Kuwaiti Dinar','currency.KWD'),(78,'KYD',2,NULL,NULL,'Cayman Islands Dollar','currency.KYD'),(79,'KZT',2,NULL,NULL,'Kazakhstan Tenge','currency.KZT'),(80,'LAK',2,NULL,NULL,'Lao Kip','currency.LAK'),(81,'LBP',2,NULL,'L£','Lebanese Pound','currency.LBP'),(82,'LKR',2,NULL,NULL,'Sri Lanka Rupee','currency.LKR'),(83,'LRD',2,NULL,NULL,'Liberian Dollar','currency.LRD'),(84,'LSL',2,NULL,NULL,'Lesotho Loti','currency.LSL'),(85,'LTL',2,NULL,NULL,'Lithuanian Litas','currency.LTL'),(86,'LVL',2,NULL,NULL,'Latvian Lats','currency.LVL'),(87,'LYD',3,NULL,NULL,'Libyan Dinar','currency.LYD'),(88,'MAD',2,NULL,NULL,'Moroccan Dirham','currency.MAD'),(89,'MDL',2,NULL,NULL,'Moldovan Leu','currency.MDL'),(90,'MGA',2,NULL,NULL,'Malagasy Ariary','currency.MGA'),(91,'MKD',2,NULL,NULL,'Macedonian Denar','currency.MKD'),(92,'MMK',2,NULL,'K','Myanmar Kyat','currency.MMK'),(93,'MNT',2,NULL,NULL,'Mongolian Tugrik','currency.MNT'),(94,'MOP',2,NULL,NULL,'Macau Pataca','currency.MOP'),(95,'MRO',2,NULL,NULL,'Mauritania Ouguiya','currency.MRO'),(96,'MTL',2,NULL,NULL,'Maltese Lira','currency.MTL'),(97,'MUR',2,NULL,NULL,'Mauritius Rupee','currency.MUR'),(98,'MVR',2,NULL,NULL,'Maldives Rufiyaa','currency.MVR'),(99,'MWK',2,NULL,NULL,'Malawi Kwacha','currency.MWK'),(100,'MXN',2,NULL,'$','Mexican Peso','currency.MXN'),(101,'MYR',2,NULL,NULL,'Malaysian Ringgit','currency.MYR'),(102,'MZM',2,NULL,NULL,'Mozambique Metical','currency.MZM'),(103,'NAD',2,NULL,NULL,'Namibia Dollar','currency.NAD'),(104,'NGN',2,NULL,NULL,'Nigerian Naira','currency.NGN'),(105,'NIO',2,NULL,'C$','Nicaragua Cordoba Oro','currency.NIO'),(106,'NOK',2,NULL,NULL,'Norwegian Krone','currency.NOK'),(107,'NPR',2,NULL,NULL,'Nepalese Rupee','currency.NPR'),(108,'NZD',2,NULL,NULL,'New Zealand Dollar','currency.NZD'),(109,'OMR',3,NULL,NULL,'Rial Omani','currency.OMR'),(110,'PAB',2,NULL,'B/.','Panama Balboa','currency.PAB'),(111,'PEN',2,NULL,'S/.','Peruvian Nuevo Sol','currency.PEN'),(112,'PGK',2,NULL,NULL,'Papua New Guinea Kina','currency.PGK'),(113,'PHP',2,NULL,NULL,'Philippine Peso','currency.PHP'),(114,'PKR',2,NULL,NULL,'Pakistan Rupee','currency.PKR'),(115,'PLN',2,NULL,NULL,'Polish Zloty','currency.PLN'),(116,'PYG',0,NULL,'?','Paraguayan Guarani','currency.PYG'),(117,'QAR',2,NULL,NULL,'Qatari Rial','currency.QAR'),(118,'RON',2,NULL,NULL,'Romanian Leu','currency.RON'),(119,'RUB',2,NULL,NULL,'Russian Ruble','currency.RUB'),(120,'RWF',0,NULL,NULL,'Rwanda Franc','currency.RWF'),(121,'SAR',2,NULL,NULL,'Saudi Riyal','currency.SAR'),(122,'SBD',2,NULL,NULL,'Solomon Islands Dollar','currency.SBD'),(123,'SCR',2,NULL,NULL,'Seychelles Rupee','currency.SCR'),(124,'SDD',2,NULL,NULL,'Sudanese Dinar','currency.SDD'),(125,'SEK',2,NULL,NULL,'Swedish Krona','currency.SEK'),(126,'SGD',2,NULL,NULL,'Singapore Dollar','currency.SGD'),(127,'SHP',2,NULL,NULL,'St Helena Pound','currency.SHP'),(128,'SIT',2,NULL,NULL,'Slovenian Tolar','currency.SIT'),(129,'SKK',2,NULL,NULL,'Slovak Koruna','currency.SKK'),(130,'SLL',2,NULL,NULL,'Sierra Leone Leone','currency.SLL'),(131,'SOS',2,NULL,NULL,'Somali Shilling','currency.SOS'),(132,'SRD',2,NULL,NULL,'Surinam Dollar','currency.SRD'),(133,'STD',2,NULL,NULL,'Sao Tome and Principe Dobra','currency.STD'),(134,'SVC',2,NULL,NULL,'El Salvador Colon','currency.SVC'),(135,'SYP',2,NULL,NULL,'Syrian Pound','currency.SYP'),(136,'SZL',2,NULL,NULL,'Swaziland Lilangeni','currency.SZL'),(137,'THB',2,NULL,NULL,'Thai Baht','currency.THB'),(138,'TJS',2,NULL,NULL,'Tajik Somoni','currency.TJS'),(139,'TMM',2,NULL,NULL,'Turkmenistan Manat','currency.TMM'),(140,'TND',3,NULL,'DT','Tunisian Dinar','currency.TND'),(141,'TOP',2,NULL,NULL,'Tonga Pa\'anga','currency.TOP'),(142,'TRY',2,NULL,NULL,'Turkish Lira','currency.TRY'),(143,'TTD',2,NULL,NULL,'Trinidad and Tobago Dollar','currency.TTD'),(144,'TWD',2,NULL,NULL,'New Taiwan Dollar','currency.TWD'),(145,'TZS',2,NULL,NULL,'Tanzanian Shilling','currency.TZS'),(146,'UAH',2,NULL,NULL,'Ukraine Hryvnia','currency.UAH'),(147,'UGX',2,NULL,'USh','Uganda Shilling','currency.UGX'),(148,'USD',2,NULL,'$','US Dollar','currency.USD'),(149,'UYU',2,NULL,'$U','Peso Uruguayo','currency.UYU'),(150,'UZS',2,NULL,NULL,'Uzbekistan Sum','currency.UZS'),(151,'VEB',2,NULL,'Bs.F.','Venezuelan Bolivar','currency.VEB'),(152,'VND',2,NULL,NULL,'Vietnamese Dong','currency.VND'),(153,'VUV',0,NULL,NULL,'Vanuatu Vatu','currency.VUV'),(154,'WST',2,NULL,NULL,'Samoa Tala','currency.WST'),(155,'XAF',0,NULL,NULL,'CFA Franc BEAC','currency.XAF'),(156,'XCD',2,NULL,NULL,'East Caribbean Dollar','currency.XCD'),(157,'XDR',5,NULL,NULL,'SDR (Special Drawing Rights)','currency.XDR'),(158,'XOF',0,NULL,'CFA','CFA Franc BCEAO','currency.XOF'),(159,'XPF',0,NULL,NULL,'CFP Franc','currency.XPF'),(160,'YER',2,NULL,NULL,'Yemeni Rial','currency.YER'),(161,'ZAR',2,NULL,'R','South African Rand','currency.ZAR'),(162,'ZMK',2,NULL,NULL,'Zambian Kwacha','currency.ZMK'),(163,'ZWD',2,NULL,NULL,'Zimbabwe Dollar','currency.ZWD');
/*!40000 ALTER TABLE `m_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_account_on_hold_transaction`
--

DROP TABLE IF EXISTS `m_deposit_account_on_hold_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_account_on_hold_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `transaction_type_enum` smallint(1) NOT NULL,
  `transaction_date` date NOT NULL,
  `is_reversed` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deposit_on_hold_transaction_m_savings_account` (`savings_account_id`),
  CONSTRAINT `FK_deposit_on_hold_transaction_m_savings_account` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_account_on_hold_transaction`
--

LOCK TABLES `m_deposit_account_on_hold_transaction` WRITE;
/*!40000 ALTER TABLE `m_deposit_account_on_hold_transaction` DISABLE KEYS */;
INSERT INTO `m_deposit_account_on_hold_transaction` VALUES (1,1,400000.000000,1,'2018-02-14',1,'2018-02-14 11:31:36'),(2,3,700000.000000,1,'2018-02-15',1,'2018-02-15 13:48:45'),(3,5,350000.000000,1,'2018-02-15',1,'2018-02-15 13:49:29'),(4,3,700000.000000,1,'2018-02-15',1,'2018-02-15 13:54:18'),(5,4,333333.330000,1,'2018-02-15',1,'2018-02-15 14:05:12'),(6,3,700000.000000,1,'2018-02-15',1,'2018-02-15 14:13:10'),(7,5,350000.000000,1,'2018-02-15',1,'2018-02-15 14:14:06'),(8,3,700000.000000,1,'2018-02-15',1,'2018-02-15 14:26:06'),(9,5,350000.000000,1,'2018-02-15',0,'2018-02-15 14:56:05'),(10,5,27469.284500,2,'2018-02-15',0,'2018-02-15 15:11:15');
/*!40000 ALTER TABLE `m_deposit_account_on_hold_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_account_recurring_detail`
--

DROP TABLE IF EXISTS `m_deposit_account_recurring_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_account_recurring_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL DEFAULT '0',
  `mandatory_recommended_deposit_amount` decimal(19,6) DEFAULT NULL,
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `allow_withdrawal` tinyint(4) NOT NULL DEFAULT '0',
  `adjust_advance_towards_future_payments` tinyint(4) NOT NULL DEFAULT '1',
  `is_calendar_inherited` tinyint(4) NOT NULL DEFAULT '0',
  `total_overdue_amount` decimal(19,6) DEFAULT NULL,
  `no_of_overdue_installments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDARD00000000000001` (`savings_account_id`),
  CONSTRAINT `FKDARD00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_account_recurring_detail`
--

LOCK TABLES `m_deposit_account_recurring_detail` WRITE;
/*!40000 ALTER TABLE `m_deposit_account_recurring_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_deposit_account_recurring_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_account_term_and_preclosure`
--

DROP TABLE IF EXISTS `m_deposit_account_term_and_preclosure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_account_term_and_preclosure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL DEFAULT '0',
  `min_deposit_term` int(11) DEFAULT NULL,
  `max_deposit_term` int(11) DEFAULT NULL,
  `min_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `max_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `in_multiples_of_deposit_term` int(11) DEFAULT NULL,
  `in_multiples_of_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `pre_closure_penal_applicable` smallint(5) DEFAULT NULL,
  `pre_closure_penal_interest` decimal(19,6) DEFAULT NULL,
  `pre_closure_penal_interest_on_enum` smallint(5) DEFAULT NULL,
  `deposit_period` int(11) DEFAULT NULL,
  `deposit_period_frequency_enum` smallint(5) DEFAULT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL,
  `maturity_amount` decimal(19,6) DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `on_account_closure_enum` smallint(5) DEFAULT NULL,
  `expected_firstdepositon_date` date DEFAULT NULL,
  `transfer_interest_to_linked_account` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKDATP00000000000001` (`savings_account_id`),
  CONSTRAINT `FKDATP00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_account_term_and_preclosure`
--

LOCK TABLES `m_deposit_account_term_and_preclosure` WRITE;
/*!40000 ALTER TABLE `m_deposit_account_term_and_preclosure` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_deposit_account_term_and_preclosure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_product_interest_rate_chart`
--

DROP TABLE IF EXISTS `m_deposit_product_interest_rate_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_product_interest_rate_chart` (
  `deposit_product_id` bigint(20) NOT NULL,
  `interest_rate_chart_id` bigint(20) NOT NULL,
  UNIQUE KEY `deposit_product_id_interest_rate_chart_id` (`deposit_product_id`,`interest_rate_chart_id`),
  KEY `FKDPIRC00000000000002` (`interest_rate_chart_id`),
  CONSTRAINT `FKDPIRC00000000000001` FOREIGN KEY (`deposit_product_id`) REFERENCES `m_savings_product` (`id`),
  CONSTRAINT `FKDPIRC00000000000002` FOREIGN KEY (`interest_rate_chart_id`) REFERENCES `m_interest_rate_chart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_product_interest_rate_chart`
--

LOCK TABLES `m_deposit_product_interest_rate_chart` WRITE;
/*!40000 ALTER TABLE `m_deposit_product_interest_rate_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_deposit_product_interest_rate_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_product_recurring_detail`
--

DROP TABLE IF EXISTS `m_deposit_product_recurring_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_product_recurring_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_product_id` bigint(20) NOT NULL DEFAULT '0',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '1',
  `allow_withdrawal` tinyint(1) NOT NULL DEFAULT '0',
  `adjust_advance_towards_future_payments` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FKDPRD00000000000001` (`savings_product_id`),
  CONSTRAINT `FKDPRD00000000000001` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_product_recurring_detail`
--

LOCK TABLES `m_deposit_product_recurring_detail` WRITE;
/*!40000 ALTER TABLE `m_deposit_product_recurring_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_deposit_product_recurring_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_deposit_product_term_and_preclosure`
--

DROP TABLE IF EXISTS `m_deposit_product_term_and_preclosure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_deposit_product_term_and_preclosure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_product_id` bigint(20) NOT NULL DEFAULT '0',
  `min_deposit_term` int(11) DEFAULT NULL,
  `max_deposit_term` int(11) DEFAULT NULL,
  `min_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `max_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `in_multiples_of_deposit_term` int(11) DEFAULT NULL,
  `in_multiples_of_deposit_term_type_enum` smallint(5) DEFAULT NULL,
  `pre_closure_penal_applicable` smallint(5) DEFAULT NULL,
  `pre_closure_penal_interest` decimal(19,6) DEFAULT NULL,
  `pre_closure_penal_interest_on_enum` smallint(5) DEFAULT NULL,
  `min_deposit_amount` decimal(19,6) DEFAULT NULL,
  `max_deposit_amount` decimal(19,6) DEFAULT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDPTP00000000000001` (`savings_product_id`),
  CONSTRAINT `FKDPTP00000000000001` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_deposit_product_term_and_preclosure`
--

LOCK TABLES `m_deposit_product_term_and_preclosure` WRITE;
/*!40000 ALTER TABLE `m_deposit_product_term_and_preclosure` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_deposit_product_term_and_preclosure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_document`
--

DROP TABLE IF EXISTS `m_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_document` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_entity_type` varchar(50) NOT NULL,
  `parent_entity_id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `size` int(20) DEFAULT '0',
  `type` varchar(500) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(500) NOT NULL DEFAULT '0',
  `storage_type_enum` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_document`
--

LOCK TABLES `m_document` WRITE;
/*!40000 ALTER TABLE `m_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_entity_datatable_check`
--

DROP TABLE IF EXISTS `m_entity_datatable_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_entity_datatable_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_table_name` varchar(200) NOT NULL,
  `x_registered_table_name` varchar(50) NOT NULL,
  `status_enum` int(11) NOT NULL,
  `system_defined` tinyint(4) NOT NULL DEFAULT '0',
  `product_id` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entity_check` (`application_table_name`,`x_registered_table_name`,`status_enum`,`product_id`),
  KEY `x_registered_table_name` (`x_registered_table_name`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `m_entity_datatable_check_ibfk_1` FOREIGN KEY (`x_registered_table_name`) REFERENCES `x_registered_table` (`registered_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_datatable_check`
--

LOCK TABLES `m_entity_datatable_check` WRITE;
/*!40000 ALTER TABLE `m_entity_datatable_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_entity_datatable_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_entity_relation`
--

DROP TABLE IF EXISTS `m_entity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_entity_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_entity_type` int(10) NOT NULL,
  `to_entity_type` int(10) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_entity_type_to_entity_type_code_name` (`from_entity_type`,`to_entity_type`,`code_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_relation`
--

LOCK TABLES `m_entity_relation` WRITE;
/*!40000 ALTER TABLE `m_entity_relation` DISABLE KEYS */;
INSERT INTO `m_entity_relation` VALUES (1,1,2,'office_access_to_loan_products'),(2,1,3,'office_access_to_savings_products'),(3,1,4,'office_access_to_fees/charges'),(4,5,2,'role_access_to_loan_products'),(5,5,3,'role_access_to_savings_products');
/*!40000 ALTER TABLE `m_entity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_entity_to_entity_access`
--

DROP TABLE IF EXISTS `m_entity_to_entity_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_entity_to_entity_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(50) NOT NULL,
  `entity_id` bigint(20) NOT NULL,
  `access_type_code_value_id` int(11) NOT NULL,
  `second_entity_type` varchar(50) NOT NULL,
  `second_entity_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_uniq_m_entity_to_entity_access` (`entity_type`,`entity_id`,`access_type_code_value_id`,`second_entity_type`,`second_entity_id`),
  KEY `IDX_OFFICE` (`entity_type`,`entity_id`),
  KEY `FK_access_type_code_m_code_value` (`access_type_code_value_id`),
  CONSTRAINT `FK_access_type_code_m_code_value` FOREIGN KEY (`access_type_code_value_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_to_entity_access`
--

LOCK TABLES `m_entity_to_entity_access` WRITE;
/*!40000 ALTER TABLE `m_entity_to_entity_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_entity_to_entity_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_entity_to_entity_mapping`
--

DROP TABLE IF EXISTS `m_entity_to_entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_entity_to_entity_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_id` bigint(20) NOT NULL DEFAULT '0',
  `from_id` bigint(20) NOT NULL DEFAULT '0',
  `to_id` bigint(20) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_id_from_id_to_id` (`rel_id`,`from_id`,`to_id`),
  CONSTRAINT `FK__rel_id_m_entity_relation_id` FOREIGN KEY (`rel_id`) REFERENCES `m_entity_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_to_entity_mapping`
--

LOCK TABLES `m_entity_to_entity_mapping` WRITE;
/*!40000 ALTER TABLE `m_entity_to_entity_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_entity_to_entity_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_family_members`
--

DROP TABLE IF EXISTS `m_family_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_family_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `relationship_cv_id` int(11) NOT NULL,
  `marital_status_cv_id` int(11) DEFAULT NULL,
  `gender_cv_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `profession_cv_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `is_dependent` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_family_members_client_id_m_client` (`client_id`),
  KEY `FK_m_family_members_relationship_m_code_value` (`relationship_cv_id`),
  KEY `FK_m_family_members_marital_status_m_code_value` (`marital_status_cv_id`),
  KEY `FK_m_family_members_gender_m_code_value` (`gender_cv_id`),
  KEY `FK_m_family_members_profession_m_code_value` (`profession_cv_id`),
  CONSTRAINT `FK_m_family_members_client_id_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK_m_family_members_gender_m_code_value` FOREIGN KEY (`gender_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_family_members_marital_status_m_code_value` FOREIGN KEY (`marital_status_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_family_members_profession_m_code_value` FOREIGN KEY (`profession_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_family_members_relationship_m_code_value` FOREIGN KEY (`relationship_cv_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_family_members`
--

LOCK TABLES `m_family_members` WRITE;
/*!40000 ALTER TABLE `m_family_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_family_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_field_configuration`
--

DROP TABLE IF EXISTS `m_field_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_field_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `subentity` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL,
  `is_mandatory` tinyint(4) NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_field_configuration`
--

LOCK TABLES `m_field_configuration` WRITE;
/*!40000 ALTER TABLE `m_field_configuration` DISABLE KEYS */;
INSERT INTO `m_field_configuration` VALUES (1,'ADDRESS','CLIENT','addressType',1,0,''),(2,'ADDRESS','CLIENT','street',1,1,''),(3,'ADDRESS','CLIENT','addressLine1',1,0,''),(4,'ADDRESS','CLIENT','addressLine2',1,0,''),(5,'ADDRESS','CLIENT','addressLine3',1,0,''),(6,'ADDRESS','CLIENT','townVillage',0,0,''),(7,'ADDRESS','CLIENT','city',1,0,''),(8,'ADDRESS','CLIENT','countyDistrict',0,0,''),(9,'ADDRESS','CLIENT','stateProvinceId',1,0,''),(10,'ADDRESS','CLIENT','countryId',1,0,''),(11,'ADDRESS','CLIENT','postalCode',1,0,''),(12,'ADDRESS','CLIENT','latitude',0,0,''),(13,'ADDRESS','CLIENT','longitude',0,0,''),(14,'ADDRESS','CLIENT','createdBy',1,0,''),(15,'ADDRESS','CLIENT','createdOn',1,0,''),(16,'ADDRESS','CLIENT','updatedBy',1,0,''),(17,'ADDRESS','CLIENT','updatedOn',1,0,''),(18,'ADDRESS','CLIENT','isActive',1,0,'');
/*!40000 ALTER TABLE `m_field_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_floating_rates`
--

DROP TABLE IF EXISTS `m_floating_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_floating_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `is_base_lending_rate` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_floating_rates`
--

LOCK TABLES `m_floating_rates` WRITE;
/*!40000 ALTER TABLE `m_floating_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_floating_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_floating_rates_periods`
--

DROP TABLE IF EXISTS `m_floating_rates_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_floating_rates_periods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `floating_rates_id` bigint(20) NOT NULL,
  `from_date` datetime NOT NULL,
  `interest_rate` decimal(19,6) NOT NULL,
  `is_differential_to_base_lending_rate` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mappings_m_floating_rates` (`floating_rates_id`),
  CONSTRAINT `FK_mappings_m_floating_rates` FOREIGN KEY (`floating_rates_id`) REFERENCES `m_floating_rates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_floating_rates_periods`
--

LOCK TABLES `m_floating_rates_periods` WRITE;
/*!40000 ALTER TABLE `m_floating_rates_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_floating_rates_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_fund`
--

DROP TABLE IF EXISTS `m_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_fund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fund_name_org` (`name`),
  UNIQUE KEY `fund_externalid_org` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_fund`
--

LOCK TABLES `m_fund` WRITE;
/*!40000 ALTER TABLE `m_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_group`
--

DROP TABLE IF EXISTS `m_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` int(5) NOT NULL DEFAULT '300',
  `activation_date` date DEFAULT NULL,
  `office_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `hierarchy` varchar(100) DEFAULT NULL,
  `closure_reason_cv_id` int(11) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `account_no` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`display_name`,`level_id`),
  UNIQUE KEY `external_id` (`external_id`,`level_id`),
  UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  KEY `office_id` (`office_id`),
  KEY `staff_id` (`staff_id`),
  KEY `Parent_Id_reference` (`parent_id`),
  KEY `FK_m_group_level` (`level_id`),
  KEY `FK_m_group_m_code` (`closure_reason_cv_id`),
  CONSTRAINT `FK_m_group_level` FOREIGN KEY (`level_id`) REFERENCES `m_group_level` (`id`),
  CONSTRAINT `FK_m_group_m_code` FOREIGN KEY (`closure_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_group_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  CONSTRAINT `Parent_Id_reference` FOREIGN KEY (`parent_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `m_group_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_group`
--

LOCK TABLES `m_group` WRITE;
/*!40000 ALTER TABLE `m_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_group_client`
--

DROP TABLE IF EXISTS `m_group_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_group_client` (
  `group_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`client_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `m_group_client_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `m_group_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_group_client`
--

LOCK TABLES `m_group_client` WRITE;
/*!40000 ALTER TABLE `m_group_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_group_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_group_level`
--

DROP TABLE IF EXISTS `m_group_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_group_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `super_parent` tinyint(1) NOT NULL,
  `level_name` varchar(100) NOT NULL,
  `recursable` tinyint(1) NOT NULL,
  `can_have_clients` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Parent_levelId_reference` (`parent_id`),
  CONSTRAINT `Parent_levelId_reference` FOREIGN KEY (`parent_id`) REFERENCES `m_group_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_group_level`
--

LOCK TABLES `m_group_level` WRITE;
/*!40000 ALTER TABLE `m_group_level` DISABLE KEYS */;
INSERT INTO `m_group_level` VALUES (1,NULL,1,'Center',1,0),(2,1,0,'Group',0,1);
/*!40000 ALTER TABLE `m_group_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_group_roles`
--

DROP TABLE IF EXISTS `m_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_group_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `role_cv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_GROUP_ROLES` (`client_id`,`group_id`,`role_cv_id`),
  KEY `FKGroupRoleClientId` (`client_id`),
  KEY `FKGroupRoleGroupId` (`group_id`),
  KEY `FK_grouprole_m_codevalue` (`role_cv_id`),
  CONSTRAINT `FKGroupRoleClientId` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FKGroupRoleGroupId` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `FK_grouprole_m_codevalue` FOREIGN KEY (`role_cv_id`) REFERENCES `m_code_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_group_roles`
--

LOCK TABLES `m_group_roles` WRITE;
/*!40000 ALTER TABLE `m_group_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_guarantor`
--

DROP TABLE IF EXISTS `m_guarantor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_guarantor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `client_reln_cv_id` int(11) DEFAULT NULL,
  `type_enum` smallint(5) NOT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address_line_1` varchar(500) DEFAULT NULL,
  `address_line_2` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_m_guarantor_m_loan` (`loan_id`),
  KEY `FK_m_guarantor_m_code_value` (`client_reln_cv_id`),
  CONSTRAINT `FK_m_guarantor_m_code_value` FOREIGN KEY (`client_reln_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_m_guarantor_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_guarantor`
--

LOCK TABLES `m_guarantor` WRITE;
/*!40000 ALTER TABLE `m_guarantor` DISABLE KEYS */;
INSERT INTO `m_guarantor` VALUES (1,5,NULL,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,7,NULL,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,6,NULL,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,8,NULL,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `m_guarantor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_guarantor_funding_details`
--

DROP TABLE IF EXISTS `m_guarantor_funding_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_guarantor_funding_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guarantor_id` bigint(20) NOT NULL,
  `account_associations_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_released_derived` decimal(19,6) DEFAULT NULL,
  `amount_remaining_derived` decimal(19,6) DEFAULT NULL,
  `amount_transfered_derived` decimal(19,6) DEFAULT NULL,
  `status_enum` smallint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_guarantor_fund_details_m_guarantor` (`guarantor_id`),
  KEY `FK_m_guarantor_fund_details_account_associations_id` (`account_associations_id`),
  CONSTRAINT `FK_m_guarantor_fund_details_account_associations_id` FOREIGN KEY (`account_associations_id`) REFERENCES `m_portfolio_account_associations` (`id`),
  CONSTRAINT `FK_m_guarantor_fund_details_m_guarantor` FOREIGN KEY (`guarantor_id`) REFERENCES `m_guarantor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_guarantor_funding_details`
--

LOCK TABLES `m_guarantor_funding_details` WRITE;
/*!40000 ALTER TABLE `m_guarantor_funding_details` DISABLE KEYS */;
INSERT INTO `m_guarantor_funding_details` VALUES (1,1,1,400000.000000,NULL,400000.000000,NULL,100),(2,2,5,700000.000000,NULL,700000.000000,NULL,100),(3,3,6,350000.000000,27469.284500,322530.715500,NULL,100),(4,4,7,333333.330000,NULL,333333.330000,NULL,100);
/*!40000 ALTER TABLE `m_guarantor_funding_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_guarantor_transaction`
--

DROP TABLE IF EXISTS `m_guarantor_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_guarantor_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guarantor_fund_detail_id` bigint(20) NOT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `deposit_on_hold_transaction_id` bigint(20) NOT NULL,
  `is_reversed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_guarantor_transaction_m_deposit_account_on_hold_transaction` (`deposit_on_hold_transaction_id`),
  KEY `FK_guarantor_transaction_guarantor_fund_detail` (`guarantor_fund_detail_id`),
  KEY `FK_guarantor_transaction_m_loan_transaction` (`loan_transaction_id`),
  CONSTRAINT `FK_guarantor_transaction_guarantor_fund_detail` FOREIGN KEY (`guarantor_fund_detail_id`) REFERENCES `m_guarantor_funding_details` (`id`),
  CONSTRAINT `FK_guarantor_transaction_m_deposit_account_on_hold_transaction` FOREIGN KEY (`deposit_on_hold_transaction_id`) REFERENCES `m_deposit_account_on_hold_transaction` (`id`),
  CONSTRAINT `FK_guarantor_transaction_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_guarantor_transaction`
--

LOCK TABLES `m_guarantor_transaction` WRITE;
/*!40000 ALTER TABLE `m_guarantor_transaction` DISABLE KEYS */;
INSERT INTO `m_guarantor_transaction` VALUES (1,1,NULL,1,1),(2,2,NULL,2,1),(3,3,NULL,3,1),(4,2,NULL,4,1),(5,4,NULL,5,1),(6,2,NULL,6,1),(7,3,NULL,7,1),(8,2,NULL,8,1),(9,3,NULL,9,0),(10,3,16,10,0);
/*!40000 ALTER TABLE `m_guarantor_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_holiday`
--

DROP TABLE IF EXISTS `m_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `repayments_rescheduled_to` datetime DEFAULT NULL,
  `status_enum` int(5) NOT NULL DEFAULT '100',
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(100) DEFAULT NULL,
  `rescheduling_type` int(5) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `holiday_name` (`name`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_holiday`
--

LOCK TABLES `m_holiday` WRITE;
/*!40000 ALTER TABLE `m_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_holiday_office`
--

DROP TABLE IF EXISTS `m_holiday_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_holiday_office` (
  `holiday_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  PRIMARY KEY (`holiday_id`,`office_id`),
  KEY `m_holiday_id_ibfk_1` (`holiday_id`),
  KEY `m_office_id_ibfk_2` (`office_id`),
  CONSTRAINT `m_holiday_id_ibfk_1` FOREIGN KEY (`holiday_id`) REFERENCES `m_holiday` (`id`),
  CONSTRAINT `m_office_id_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_holiday_office`
--

LOCK TABLES `m_holiday_office` WRITE;
/*!40000 ALTER TABLE `m_holiday_office` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_holiday_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook`
--

DROP TABLE IF EXISTS `m_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` smallint(6) NOT NULL,
  `is_active` smallint(3) NOT NULL DEFAULT '1',
  `name` varchar(45) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `ugd_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_id_idx` (`template_id`),
  KEY `fk_ugd_template_id` (`ugd_template_id`),
  CONSTRAINT `fk_template_id` FOREIGN KEY (`template_id`) REFERENCES `m_hook_templates` (`id`),
  CONSTRAINT `fk_ugd_template_id` FOREIGN KEY (`ugd_template_id`) REFERENCES `m_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook`
--

LOCK TABLES `m_hook` WRITE;
/*!40000 ALTER TABLE `m_hook` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_configuration`
--

DROP TABLE IF EXISTS `m_hook_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hook_id` bigint(20) DEFAULT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `field_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_hook_id_cfg` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_configuration`
--

LOCK TABLES `m_hook_configuration` WRITE;
/*!40000 ALTER TABLE `m_hook_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_registered_events`
--

DROP TABLE IF EXISTS `m_hook_registered_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_registered_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hook_id` bigint(20) NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `action_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_hook_idc` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_registered_events`
--

LOCK TABLES `m_hook_registered_events` WRITE;
/*!40000 ALTER TABLE `m_hook_registered_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook_registered_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_schema`
--

DROP TABLE IF EXISTS `m_hook_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_schema` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `hook_template_id` smallint(6) NOT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `placeholder` varchar(100) DEFAULT NULL,
  `optional` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hook_template_id_idx` (`hook_template_id`),
  CONSTRAINT `fk_hook_template_id` FOREIGN KEY (`hook_template_id`) REFERENCES `m_hook_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_schema`
--

LOCK TABLES `m_hook_schema` WRITE;
/*!40000 ALTER TABLE `m_hook_schema` DISABLE KEYS */;
INSERT INTO `m_hook_schema` VALUES (1,1,'string','Payload URL',NULL,0),(2,1,'string','Content Type','json / form',0),(3,2,'string','Payload URL',NULL,0),(4,2,'string','SMS Provider',NULL,0),(5,2,'string','Phone Number',NULL,0),(6,2,'string','SMS Provider Token',NULL,0),(7,2,'string','SMS Provider Account Id',NULL,0);
/*!40000 ALTER TABLE `m_hook_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_templates`
--

DROP TABLE IF EXISTS `m_hook_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_templates` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_templates`
--

LOCK TABLES `m_hook_templates` WRITE;
/*!40000 ALTER TABLE `m_hook_templates` DISABLE KEYS */;
INSERT INTO `m_hook_templates` VALUES (1,'Web'),(2,'SMS Bridge');
/*!40000 ALTER TABLE `m_hook_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_image`
--

DROP TABLE IF EXISTS `m_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(500) DEFAULT NULL,
  `storage_type_enum` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_image`
--

LOCK TABLES `m_image` WRITE;
/*!40000 ALTER TABLE `m_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_import_document`
--

DROP TABLE IF EXISTS `m_import_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_import_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` int(20) NOT NULL,
  `import_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `entity_type` tinyint(3) NOT NULL,
  `completed` tinyint(2) DEFAULT '0',
  `total_records` bigint(20) DEFAULT '0',
  `success_count` bigint(20) DEFAULT '0',
  `failure_count` bigint(20) DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_document_id` (`document_id`),
  KEY `FK_m_import_m_appuser` (`createdby_id`),
  CONSTRAINT `FK_m_import_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_import_m_document` FOREIGN KEY (`document_id`) REFERENCES `m_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_import_document`
--

LOCK TABLES `m_import_document` WRITE;
/*!40000 ALTER TABLE `m_import_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_import_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_interest_incentives`
--

DROP TABLE IF EXISTS `m_interest_incentives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_interest_incentives` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `interest_rate_slab_id` bigint(20) NOT NULL,
  `entiry_type` smallint(2) NOT NULL,
  `attribute_name` smallint(2) NOT NULL,
  `condition_type` smallint(2) NOT NULL,
  `attribute_value` varchar(50) NOT NULL,
  `incentive_type` smallint(2) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_interest_incentives_m_interest_rate_slab` (`interest_rate_slab_id`),
  CONSTRAINT `FK_m_interest_incentives_m_interest_rate_slab` FOREIGN KEY (`interest_rate_slab_id`) REFERENCES `m_interest_rate_slab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_interest_incentives`
--

LOCK TABLES `m_interest_incentives` WRITE;
/*!40000 ALTER TABLE `m_interest_incentives` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_interest_incentives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_interest_rate_chart`
--

DROP TABLE IF EXISTS `m_interest_rate_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_interest_rate_chart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `from_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_primary_grouping_by_amount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_interest_rate_chart`
--

LOCK TABLES `m_interest_rate_chart` WRITE;
/*!40000 ALTER TABLE `m_interest_rate_chart` DISABLE KEYS */;
INSERT INTO `m_interest_rate_chart` VALUES (1,NULL,NULL,'2018-01-26',NULL,0);
/*!40000 ALTER TABLE `m_interest_rate_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_interest_rate_slab`
--

DROP TABLE IF EXISTS `m_interest_rate_slab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_interest_rate_slab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `interest_rate_chart_id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `period_type_enum` smallint(5) DEFAULT NULL,
  `from_period` int(11) DEFAULT NULL,
  `to_period` int(11) DEFAULT NULL,
  `amount_range_from` decimal(19,6) DEFAULT NULL,
  `amount_range_to` decimal(19,6) DEFAULT NULL,
  `annual_interest_rate` decimal(19,6) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKIRS00000000000001` (`interest_rate_chart_id`),
  CONSTRAINT `FKIRS00000000000001` FOREIGN KEY (`interest_rate_chart_id`) REFERENCES `m_interest_rate_chart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_interest_rate_slab`
--

LOCK TABLES `m_interest_rate_slab` WRITE;
/*!40000 ALTER TABLE `m_interest_rate_slab` DISABLE KEYS */;
INSERT INTO `m_interest_rate_slab` VALUES (1,1,NULL,3,1,NULL,1.000000,NULL,7.000000,'TZS');
/*!40000 ALTER TABLE `m_interest_rate_slab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan`
--

DROP TABLE IF EXISTS `m_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `loan_officer_id` bigint(20) DEFAULT NULL,
  `loanpurpose_cv_id` int(11) DEFAULT NULL,
  `loan_status_id` smallint(5) NOT NULL,
  `loan_type_enum` smallint(5) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `principal_amount_proposed` decimal(19,6) NOT NULL,
  `principal_amount` decimal(19,6) NOT NULL,
  `approved_principal` decimal(19,6) NOT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `is_floating_interest_rate` bit(1) DEFAULT b'0',
  `interest_rate_differential` decimal(19,6) DEFAULT '0.000000',
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(5) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(5) NOT NULL,
  `interest_calculated_in_period_enum` smallint(5) NOT NULL DEFAULT '1',
  `allow_partial_period_interest_calcualtion` tinyint(1) NOT NULL DEFAULT '0',
  `term_frequency` smallint(5) NOT NULL DEFAULT '0',
  `term_period_frequency_enum` smallint(5) NOT NULL DEFAULT '2',
  `repay_every` smallint(5) NOT NULL,
  `repayment_period_frequency_enum` smallint(5) NOT NULL,
  `number_of_repayments` smallint(5) NOT NULL,
  `grace_on_principal_periods` smallint(5) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(5) DEFAULT NULL,
  `grace_on_interest_periods` smallint(5) DEFAULT NULL,
  `grace_interest_free_periods` smallint(5) DEFAULT NULL,
  `amortization_method_enum` smallint(5) NOT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `expected_disbursedon_date` date DEFAULT NULL,
  `expected_firstrepaymenton_date` date DEFAULT NULL,
  `interest_calculated_from_date` date DEFAULT NULL,
  `disbursedon_date` date DEFAULT NULL,
  `disbursedon_userid` bigint(20) DEFAULT NULL,
  `expected_maturedon_date` date DEFAULT NULL,
  `maturedon_date` date DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `total_charges_due_at_disbursement_derived` decimal(19,6) DEFAULT NULL,
  `principal_disbursed_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_expected_repayment_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_repayment_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_expected_costofloan_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_costofloan_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_overpaid_derived` decimal(19,6) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `rescheduledon_date` date DEFAULT NULL,
  `rescheduledon_userid` bigint(20) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` bigint(20) DEFAULT NULL,
  `writtenoffon_date` date DEFAULT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `sync_disbursement_with_meeting` tinyint(1) DEFAULT NULL,
  `loan_counter` smallint(6) DEFAULT NULL,
  `loan_product_counter` smallint(6) DEFAULT NULL,
  `fixed_emi_amount` decimal(19,6) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(5) DEFAULT NULL,
  `is_npa` tinyint(1) NOT NULL DEFAULT '0',
  `total_recovered_derived` decimal(19,6) DEFAULT NULL,
  `accrued_till` date DEFAULT NULL,
  `interest_recalcualated_on` date DEFAULT NULL,
  `days_in_month_enum` smallint(5) NOT NULL DEFAULT '1',
  `days_in_year_enum` smallint(5) NOT NULL DEFAULT '1',
  `interest_recalculation_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `guarantee_amount_derived` decimal(19,6) DEFAULT NULL,
  `create_standing_instruction_at_disbursement` tinyint(1) DEFAULT NULL,
  `version` int(15) NOT NULL DEFAULT '1',
  `writeoff_reason_cv_id` int(11) DEFAULT NULL,
  `loan_sub_status_id` smallint(5) DEFAULT NULL,
  `is_topup` tinyint(1) NOT NULL DEFAULT '0',
  `is_equal_amortization` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loan_account_no_UNIQUE` (`account_no`),
  UNIQUE KEY `loan_externalid_UNIQUE` (`external_id`),
  KEY `FKB6F935D87179A0CB` (`client_id`),
  KEY `FKB6F935D8C8D4B434` (`product_id`),
  KEY `FK7C885877240145` (`fund_id`),
  KEY `FK_loan_ltp_strategy` (`loan_transaction_strategy_id`),
  KEY `FK_m_loan_m_staff` (`loan_officer_id`),
  KEY `group_id` (`group_id`),
  KEY `FK_m_loanpurpose_codevalue` (`loanpurpose_cv_id`),
  KEY `FK_submittedon_userid` (`submittedon_userid`),
  KEY `FK_approvedon_userid` (`approvedon_userid`),
  KEY `FK_rejectedon_userid` (`rejectedon_userid`),
  KEY `FK_withdrawnon_userid` (`withdrawnon_userid`),
  KEY `FK_disbursedon_userid` (`disbursedon_userid`),
  KEY `FK_closedon_userid` (`closedon_userid`),
  KEY `fk_m_group_client_001_idx` (`group_id`,`client_id`),
  KEY `FK_writeoffreason_m_loan_m_code_value` (`writeoff_reason_cv_id`),
  CONSTRAINT `FK7C885877240145` FOREIGN KEY (`fund_id`) REFERENCES `m_fund` (`id`),
  CONSTRAINT `FKB6F935D87179A0CB` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FKB6F935D8C8D4B434` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  CONSTRAINT `FK_approvedon_userid` FOREIGN KEY (`approvedon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_closedon_userid` FOREIGN KEY (`closedon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_disbursedon_userid` FOREIGN KEY (`disbursedon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_loan_ltp_strategy` FOREIGN KEY (`loan_transaction_strategy_id`) REFERENCES `ref_loan_transaction_processing_strategy` (`id`),
  CONSTRAINT `FK_m_loan_m_staff` FOREIGN KEY (`loan_officer_id`) REFERENCES `m_staff` (`id`),
  CONSTRAINT `FK_m_loanpurpose_codevalue` FOREIGN KEY (`loanpurpose_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_rejectedon_userid` FOREIGN KEY (`rejectedon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_submittedon_userid` FOREIGN KEY (`submittedon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_withdrawnon_userid` FOREIGN KEY (`withdrawnon_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_writeoffreason_m_loan_m_code_value` FOREIGN KEY (`writeoff_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `m_loan_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan`
--

LOCK TABLES `m_loan` WRITE;
/*!40000 ALTER TABLE `m_loan` DISABLE KEYS */;
INSERT INTO `m_loan` VALUES (1,'000000001',NULL,1,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.080000,2,12.960000,1,1,0,6,2,1,2,6,NULL,NULL,NULL,NULL,1,'2018-02-13',1,NULL,NULL,'2018-02-13',NULL,NULL,NULL,NULL,'2018-08-13','2018-08-13',NULL,NULL,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,2,NULL,NULL,0,0),(2,'000000002',NULL,3,NULL,5,NULL,NULL,NULL,300,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,2.708333,2,32.500000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-13',1,'2018-02-13',1,'2018-02-13',NULL,NULL,'2018-02-13',1,'2019-02-13','2019-02-13',NULL,NULL,0.000000,1000000.000000,544097.360000,0.000000,455902.640000,184651.420000,153344.640000,3300.000000,0.000000,28006.780000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1184651.420000,697442.000000,184651.420000,153344.640000,3300.000000,0.000000,483909.420000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,18,NULL,NULL,0,0),(3,'000000003',NULL,3,NULL,3,NULL,NULL,NULL,100,1,'TZS',2,1,3000000.000000,3000000.000000,3000000.000000,NULL,NULL,NULL,2.708333,2,32.500000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-13',1,NULL,NULL,'2018-02-13',NULL,NULL,NULL,NULL,'2019-02-13','2019-02-13',NULL,NULL,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,2,NULL,NULL,0,0),(4,'000000004',NULL,5,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,50000000.000000,50000000.000000,50000000.000000,NULL,NULL,NULL,1.083334,2,13.000002,0,1,0,48,2,1,2,48,NULL,NULL,NULL,NULL,1,'2018-02-13',1,NULL,NULL,'2018-02-13',NULL,NULL,NULL,NULL,'2022-02-11','2022-02-11',NULL,NULL,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,6,NULL,NULL,0,0),(5,'000000005',NULL,6,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',1,NULL,NULL,'2018-02-15',NULL,NULL,NULL,NULL,'2019-02-15','2019-02-15',NULL,NULL,2500.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,14,NULL,NULL,0,0),(6,'DevL000000006',NULL,10,NULL,1,NULL,NULL,NULL,300,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',5,'2018-02-15',5,'2018-03-01','2018-03-31',NULL,'2018-02-15',5,'2019-02-28','2019-02-28',NULL,NULL,0.000000,1000000.000000,78483.670000,0.000000,921516.330000,71807.490000,10833.330000,0.000000,0.000000,60974.160000,7500.000000,7500.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1079307.490000,96817.000000,79307.490000,18333.330000,0.000000,0.000000,982490.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,1,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,350000.000000,NULL,18,NULL,NULL,0,0),(7,'DevL000000007','PF 5000',9,NULL,1,NULL,NULL,NULL,500,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,1,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',4,NULL,NULL,'2018-02-15','2018-03-30','2018-03-30',NULL,NULL,'2019-02-28','2019-02-28','2018-02-15',4,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,'2018-02-15',4,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,1,40,NULL,NULL,0,0),(8,'DevL000000008','7000',11,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,36,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',3,NULL,NULL,'2018-02-15','2018-03-30',NULL,NULL,NULL,'2019-02-28','2019-02-28',NULL,NULL,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,9,NULL,NULL,0,0),(9,'DevL000000009',NULL,6,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',4,NULL,NULL,'2018-02-15','2018-03-31','2018-03-31',NULL,NULL,'2019-02-28','2019-02-28',NULL,NULL,2500.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,2,NULL,NULL,0,0),(10,'DevL000000010',NULL,11,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',3,NULL,NULL,'2018-02-15','2018-03-31','2018-03-31',NULL,NULL,'2019-02-28','2019-02-28',NULL,NULL,2500.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,2,NULL,NULL,0,0),(14,'DevL000000014',NULL,6,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,2000000.000000,2000000.000000,2000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',4,NULL,NULL,'2018-02-15','2018-03-30','2018-03-30',NULL,NULL,'2019-02-28','2019-02-28',NULL,NULL,15000.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,3,NULL,NULL,0,0),(15,'DevL000000015',NULL,9,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,2000000.000000,2000000.000000,2000000.000000,NULL,NULL,NULL,1.083333,2,13.000000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',5,NULL,NULL,'2018-02-15','2018-03-30','2018-03-30',NULL,NULL,'2019-02-28','2019-02-28',NULL,NULL,15000.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,3,NULL,NULL,0,0),(16,'DevL000000016',NULL,9,NULL,1,NULL,NULL,NULL,100,1,'TZS',2,1,1000000.000000,1000000.000000,1000000.000000,NULL,NULL,NULL,1.100000,2,13.200000,0,1,0,12,2,1,2,12,NULL,NULL,NULL,NULL,1,'2018-02-15',4,NULL,NULL,'2018-02-15',NULL,NULL,NULL,NULL,'2019-02-15','2019-02-15',NULL,NULL,7500.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,0,NULL,NULL,NULL,1,1,0,NULL,NULL,3,NULL,NULL,0,0);
/*!40000 ALTER TABLE `m_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_arrears_aging`
--

DROP TABLE IF EXISTS `m_loan_arrears_aging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_arrears_aging` (
  `loan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `overdue_since_date_derived` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  CONSTRAINT `m_loan_arrears_aging_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_arrears_aging`
--

LOCK TABLES `m_loan_arrears_aging` WRITE;
/*!40000 ALTER TABLE `m_loan_arrears_aging` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_arrears_aging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_charge`
--

DROP TABLE IF EXISTS `m_loan_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(1) NOT NULL DEFAULT '0',
  `charge_time_enum` smallint(5) NOT NULL,
  `due_for_collection_as_of_date` date DEFAULT NULL,
  `charge_calculation_enum` smallint(5) NOT NULL,
  `charge_payment_mode_enum` smallint(5) NOT NULL DEFAULT '0',
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `charge_amount_or_percentage` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(1) NOT NULL DEFAULT '0',
  `waived` tinyint(1) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `charge_id` (`charge_id`),
  KEY `m_loan_charge_ibfk_2` (`loan_id`),
  CONSTRAINT `m_loan_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_loan_charge_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_charge`
--

LOCK TABLES `m_loan_charge` WRITE;
/*!40000 ALTER TABLE `m_loan_charge` DISABLE KEYS */;
INSERT INTO `m_loan_charge` VALUES (1,2,2,0,2,'2018-02-14',2,0,0.500000,1000000.000000,0.500000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,0),(2,2,1,0,2,'2018-02-14',2,0,0.250000,1000000.000000,0.250000,2500.000000,NULL,NULL,NULL,2500.000000,0,0,NULL,NULL,0),(3,6,2,0,2,'2018-03-02',2,0,0.500000,1000000.000000,0.500000,5000.000000,5000.000000,NULL,NULL,0.000000,1,0,NULL,NULL,1),(4,6,1,0,2,'2018-03-02',2,0,0.250000,1000000.000000,0.250000,2500.000000,2500.000000,NULL,NULL,0.000000,1,0,NULL,NULL,1),(5,7,2,0,2,'2018-02-16',2,0,0.500000,1000000.000000,0.500000,5000.000000,0.000000,0.000000,0.000000,5000.000000,0,0,NULL,NULL,1),(6,7,1,0,2,'2018-02-16',2,0,0.250000,1000000.000000,0.250000,2500.000000,0.000000,0.000000,0.000000,2500.000000,0,0,NULL,NULL,1),(7,8,1,0,2,'2018-02-16',2,0,0.250000,1000000.000000,0.250000,2500.000000,0.000000,0.000000,0.000000,2500.000000,0,0,NULL,NULL,1),(8,8,2,0,2,'2018-02-16',2,0,0.500000,1000000.000000,0.500000,5000.000000,0.000000,0.000000,0.000000,5000.000000,0,0,NULL,NULL,1),(9,9,2,0,2,'2018-02-16',2,0,0.500000,1000000.000000,0.500000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1),(10,9,1,0,1,NULL,2,0,0.250000,1000000.000000,0.250000,2500.000000,NULL,NULL,NULL,2500.000000,0,0,NULL,NULL,1),(11,10,1,0,1,NULL,2,0,0.250000,1000000.000000,0.250000,2500.000000,NULL,NULL,NULL,2500.000000,0,0,NULL,NULL,1),(12,10,2,0,2,'2018-02-16',2,0,0.500000,1000000.000000,0.500000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1),(13,5,1,0,1,'2018-02-16',2,0,0.250000,1000000.000000,0.250000,2500.000000,NULL,NULL,NULL,2500.000000,0,0,NULL,NULL,1),(14,5,2,0,2,'2018-02-16',2,0,0.500000,1000000.000000,0.500000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1),(15,14,1,0,1,NULL,2,0,0.250000,2000000.000000,0.250000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1),(16,14,2,0,1,NULL,2,0,0.500000,2000000.000000,0.500000,10000.000000,NULL,NULL,NULL,10000.000000,0,0,NULL,NULL,1),(17,15,2,0,1,'2018-02-15',2,0,0.500000,2000000.000000,0.500000,10000.000000,NULL,NULL,NULL,10000.000000,0,0,NULL,NULL,1),(18,15,1,0,1,'2018-02-15',2,0,0.250000,2000000.000000,0.250000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1),(19,16,1,0,1,NULL,2,0,0.250000,1000000.000000,0.250000,2500.000000,NULL,NULL,NULL,2500.000000,0,0,NULL,NULL,1),(20,16,2,0,1,NULL,2,0,0.500000,1000000.000000,0.500000,5000.000000,NULL,NULL,NULL,5000.000000,0,0,NULL,NULL,1);
/*!40000 ALTER TABLE `m_loan_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_charge_paid_by`
--

DROP TABLE IF EXISTS `m_loan_charge_paid_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_charge_paid_by` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_transaction_id` bigint(20) NOT NULL,
  `loan_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `installment_number` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__m_loan_transaction` (`loan_transaction_id`),
  KEY `FK__m_loan_charge` (`loan_charge_id`),
  CONSTRAINT `FK__m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  CONSTRAINT `FK__m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_charge_paid_by`
--

LOCK TABLES `m_loan_charge_paid_by` WRITE;
/*!40000 ALTER TABLE `m_loan_charge_paid_by` DISABLE KEYS */;
INSERT INTO `m_loan_charge_paid_by` VALUES (1,16,3,5000.000000,NULL),(2,16,4,2500.000000,NULL);
/*!40000 ALTER TABLE `m_loan_charge_paid_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_collateral`
--

DROP TABLE IF EXISTS `m_loan_collateral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_collateral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `type_cv_id` int(11) NOT NULL,
  `value` decimal(19,6) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_collateral_m_loan` (`loan_id`),
  KEY `FK_collateral_code_value` (`type_cv_id`),
  CONSTRAINT `FK_collateral_code_value` FOREIGN KEY (`type_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `FK_collateral_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_collateral`
--

LOCK TABLES `m_loan_collateral` WRITE;
/*!40000 ALTER TABLE `m_loan_collateral` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_collateral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_disbursement_detail`
--

DROP TABLE IF EXISTS `m_loan_disbursement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_disbursement_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `expected_disburse_date` datetime NOT NULL,
  `disbursedon_date` datetime DEFAULT NULL,
  `principal` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_loan_disbursement_detail_loan_id` (`loan_id`),
  CONSTRAINT `FK_loan_disbursement_detail_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_disbursement_detail`
--

LOCK TABLES `m_loan_disbursement_detail` WRITE;
/*!40000 ALTER TABLE `m_loan_disbursement_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_disbursement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_installment_charge`
--

DROP TABLE IF EXISTS `m_loan_installment_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_installment_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_charge_id` bigint(20) NOT NULL,
  `loan_schedule_id` bigint(20) NOT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(1) NOT NULL DEFAULT '0',
  `waived` tinyint(1) NOT NULL DEFAULT '0',
  `amount_through_charge_payment` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_loan_charge_id_charge_schedule` (`loan_charge_id`),
  KEY `FK_loan_schedule_id_charge_schedule` (`loan_schedule_id`),
  CONSTRAINT `FK_loan_charge_id_charge_schedule` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  CONSTRAINT `FK_loan_schedule_id_charge_schedule` FOREIGN KEY (`loan_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_installment_charge`
--

LOCK TABLES `m_loan_installment_charge` WRITE;
/*!40000 ALTER TABLE `m_loan_installment_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_installment_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_interest_recalculation_additional_details`
--

DROP TABLE IF EXISTS `m_loan_interest_recalculation_additional_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_interest_recalculation_additional_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_repayment_schedule_id` bigint(20) NOT NULL,
  `effective_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_additional_details_repayment_schedule_id` (`loan_repayment_schedule_id`),
  CONSTRAINT `FK_additional_details_repayment_schedule_id` FOREIGN KEY (`loan_repayment_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_interest_recalculation_additional_details`
--

LOCK TABLES `m_loan_interest_recalculation_additional_details` WRITE;
/*!40000 ALTER TABLE `m_loan_interest_recalculation_additional_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_interest_recalculation_additional_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_officer_assignment_history`
--

DROP TABLE IF EXISTS `m_loan_officer_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_officer_assignment_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `loan_officer_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_m_loan_officer_assignment_history_0001` (`loan_id`),
  KEY `fk_m_loan_officer_assignment_history_0002` (`loan_officer_id`),
  CONSTRAINT `fk_m_loan_officer_assignment_history_0001` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `fk_m_loan_officer_assignment_history_0002` FOREIGN KEY (`loan_officer_id`) REFERENCES `m_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_officer_assignment_history`
--

LOCK TABLES `m_loan_officer_assignment_history` WRITE;
/*!40000 ALTER TABLE `m_loan_officer_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_officer_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_overdue_installment_charge`
--

DROP TABLE IF EXISTS `m_loan_overdue_installment_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_overdue_installment_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_charge_id` bigint(20) NOT NULL,
  `loan_schedule_id` bigint(20) NOT NULL,
  `frequency_number` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_loan_overdue_installment_charge_m_loan_charge` (`loan_charge_id`),
  KEY `FK_m_loan_overdue_installment_charge_m_loan_repayment_schedule` (`loan_schedule_id`),
  CONSTRAINT `FK_m_loan_overdue_installment_charge_m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  CONSTRAINT `FK_m_loan_overdue_installment_charge_m_loan_repayment_schedule` FOREIGN KEY (`loan_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_overdue_installment_charge`
--

LOCK TABLES `m_loan_overdue_installment_charge` WRITE;
/*!40000 ALTER TABLE `m_loan_overdue_installment_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_overdue_installment_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_paid_in_advance`
--

DROP TABLE IF EXISTS `m_loan_paid_in_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_paid_in_advance` (
  `loan_id` bigint(20) NOT NULL,
  `principal_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`loan_id`),
  CONSTRAINT `m_loan_paid_in_advance_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_paid_in_advance`
--

LOCK TABLES `m_loan_paid_in_advance` WRITE;
/*!40000 ALTER TABLE `m_loan_paid_in_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_paid_in_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_recalculation_details`
--

DROP TABLE IF EXISTS `m_loan_recalculation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_recalculation_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `compound_type_enum` smallint(5) NOT NULL,
  `reschedule_strategy_enum` smallint(5) NOT NULL,
  `rest_frequency_type_enum` smallint(1) NOT NULL,
  `rest_frequency_interval` smallint(3) NOT NULL DEFAULT '0',
  `compounding_frequency_type_enum` smallint(1) DEFAULT NULL,
  `compounding_frequency_interval` smallint(3) DEFAULT NULL,
  `rest_frequency_nth_day_enum` int(5) DEFAULT NULL,
  `rest_frequency_on_day` int(5) DEFAULT NULL,
  `rest_frequency_weekday_enum` int(5) DEFAULT NULL,
  `compounding_frequency_nth_day_enum` int(5) DEFAULT NULL,
  `compounding_frequency_on_day` int(5) DEFAULT NULL,
  `is_compounding_to_be_posted_as_transaction` tinyint(1) NOT NULL DEFAULT '0',
  `compounding_frequency_weekday_enum` int(5) DEFAULT NULL,
  `allow_compounding_on_eod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_m_loan_m_loan_recalculation_details` (`loan_id`),
  CONSTRAINT `FK_m_loan_m_loan_recalculation_details` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_recalculation_details`
--

LOCK TABLES `m_loan_recalculation_details` WRITE;
/*!40000 ALTER TABLE `m_loan_recalculation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_recalculation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_repayment_schedule`
--

DROP TABLE IF EXISTS `m_loan_repayment_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_repayment_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(5) NOT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `principal_completed_derived` decimal(19,6) DEFAULT NULL,
  `principal_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_amount` decimal(19,6) DEFAULT NULL,
  `interest_completed_derived` decimal(19,6) DEFAULT NULL,
  `interest_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_interest_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_amount` decimal(19,6) DEFAULT NULL,
  `fee_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_fee_charges_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_amount` decimal(19,6) DEFAULT NULL,
  `penalty_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_penalty_charges_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_in_advance_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_late_derived` decimal(19,6) DEFAULT NULL,
  `completed_derived` bit(1) NOT NULL,
  `obligations_met_on_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `recalculated_interest_component` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK488B92AA40BE0710` (`loan_id`),
  CONSTRAINT `FK488B92AA40BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=981 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_repayment_schedule`
--

LOCK TABLES `m_loan_repayment_schedule` WRITE;
/*!40000 ALTER TABLE `m_loan_repayment_schedule` DISABLE KEYS */;
INSERT INTO `m_loan_repayment_schedule` VALUES (1,1,'2018-06-13','2018-07-13',5,166666.670000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(2,1,'2018-07-13','2018-08-13',6,166666.650000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(3,1,'2018-02-13','2018-03-13',1,166666.670000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(4,1,'2018-04-13','2018-05-11',3,166666.670000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(5,1,'2018-03-13','2018-04-13',2,166666.670000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(6,1,'2018-05-11','2018-06-13',4,166666.670000,NULL,NULL,10800.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 10:26:14','2018-02-13 10:26:14',1,0),(93,2,'2018-02-13','2018-03-13',1,71637.670000,71637.670000,NULL,27083.330000,27083.330000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(94,2,'2018-03-13','2018-04-13',2,73577.850000,73577.850000,NULL,25143.150000,25143.150000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(95,2,'2018-04-13','2018-05-11',3,75570.590000,75570.590000,NULL,23150.410000,23150.410000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(96,2,'2018-05-11','2018-06-13',4,77617.290000,77617.290000,NULL,21103.710000,21103.710000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(97,2,'2018-06-13','2018-07-13',5,79719.430000,79719.430000,NULL,19001.570000,19001.570000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(98,2,'2018-07-13','2018-08-13',6,81878.490000,81878.490000,NULL,16842.510000,16842.510000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(99,2,'2018-08-13','2018-09-13',7,84096.040000,84096.040000,NULL,14624.960000,14624.960000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98721.000000,NULL,'','2018-02-13',1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(100,2,'2018-09-13','2018-10-12',8,86373.640000,NULL,NULL,12347.360000,6395.000000,NULL,3300.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6395.000000,NULL,'\0',NULL,1,'2018-02-13 11:40:49','2018-02-13 14:09:13',1,0),(101,2,'2018-10-12','2018-11-13',9,88712.920000,NULL,NULL,10008.080000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:40:49','2018-02-13 11:40:49',1,0),(102,2,'2018-11-13','2018-12-13',10,91115.560000,NULL,NULL,7605.440000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:40:49','2018-02-13 11:40:49',1,0),(103,2,'2018-12-13','2019-01-11',11,93583.280000,NULL,NULL,5137.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:40:49','2018-02-13 11:40:49',1,0),(104,2,'2019-01-11','2019-02-13',12,96117.240000,NULL,NULL,2603.180000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:40:49','2018-02-13 11:40:49',1,0),(105,3,'2018-09-13','2018-10-12',8,259120.910000,NULL,NULL,37042.090000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(106,3,'2018-05-11','2018-06-13',4,232851.870000,NULL,NULL,63311.130000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(107,3,'2018-08-13','2018-09-13',7,252288.110000,NULL,NULL,43874.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(108,3,'2018-07-13','2018-08-13',6,245635.480000,NULL,NULL,50527.520000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(109,3,'2018-03-13','2018-04-13',2,220733.560000,NULL,NULL,75429.440000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(110,3,'2018-02-13','2018-03-13',1,214913.000000,NULL,NULL,81250.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(111,3,'2018-10-12','2018-11-13',9,266138.770000,NULL,NULL,30024.230000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(112,3,'2018-12-13','2019-01-11',11,280749.830000,NULL,NULL,15413.170000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(113,3,'2018-11-13','2018-12-13',10,273346.690000,NULL,NULL,22816.310000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(114,3,'2018-06-13','2018-07-13',5,239158.280000,NULL,NULL,57004.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(115,3,'2018-04-13','2018-05-11',3,226711.760000,NULL,NULL,69451.240000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(116,3,'2019-01-11','2019-02-13',12,288351.740000,NULL,NULL,7809.530000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 11:45:11','2018-02-13 11:45:11',1,0),(309,4,'2018-02-13','2018-03-13',1,799708.000000,NULL,NULL,541667.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(310,4,'2018-03-13','2018-04-13',2,808371.510000,NULL,NULL,533003.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(311,4,'2018-04-13','2018-05-11',3,817128.870000,NULL,NULL,524246.130000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(312,4,'2018-05-11','2018-06-13',4,825981.110000,NULL,NULL,515393.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(313,4,'2018-06-13','2018-07-13',5,834929.240000,NULL,NULL,506445.760000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(314,4,'2018-07-13','2018-08-13',6,843974.310000,NULL,NULL,497400.690000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(315,4,'2018-08-13','2018-09-13',7,853117.370000,NULL,NULL,488257.630000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(316,4,'2018-09-13','2018-10-12',8,862359.480000,NULL,NULL,479015.520000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(317,4,'2018-10-12','2018-11-13',9,871701.720000,NULL,NULL,469673.280000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(318,4,'2018-11-13','2018-12-13',10,881145.160000,NULL,NULL,460229.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(319,4,'2018-12-13','2019-01-11',11,890690.900000,NULL,NULL,450684.100000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(320,4,'2019-01-11','2019-02-13',12,900340.060000,NULL,NULL,441034.940000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(321,4,'2019-02-13','2019-03-13',13,910093.750000,NULL,NULL,431281.250000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(322,4,'2019-03-13','2019-04-12',14,919953.110000,NULL,NULL,421421.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(323,4,'2019-04-12','2019-05-13',15,929919.270000,NULL,NULL,411455.730000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(324,4,'2019-05-13','2019-06-13',16,939993.400000,NULL,NULL,401381.600000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(325,4,'2019-06-13','2019-07-12',17,950176.670000,NULL,NULL,391198.330000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(326,4,'2019-07-12','2019-08-13',18,960470.260000,NULL,NULL,380904.740000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(327,4,'2019-08-13','2019-09-13',19,970875.360000,NULL,NULL,370499.640000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(328,4,'2019-09-13','2019-10-11',20,981393.180000,NULL,NULL,359981.820000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(329,4,'2019-10-11','2019-11-13',21,992024.950000,NULL,NULL,349350.050000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(330,4,'2019-11-13','2019-12-13',22,1002771.890000,NULL,NULL,338603.110000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(331,4,'2019-12-13','2020-01-13',23,1013635.260000,NULL,NULL,327739.740000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(332,4,'2020-01-13','2020-02-13',24,1024616.320000,NULL,NULL,316758.680000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(333,4,'2020-02-13','2020-03-13',25,1035716.330000,NULL,NULL,305658.670000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(334,4,'2020-03-13','2020-04-13',26,1046936.600000,NULL,NULL,294438.400000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(335,4,'2020-04-13','2020-05-13',27,1058278.420000,NULL,NULL,283096.580000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(336,4,'2020-05-13','2020-06-12',28,1069743.110000,NULL,NULL,271631.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(337,4,'2020-06-12','2020-07-13',29,1081332.000000,NULL,NULL,260043.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(338,4,'2020-07-13','2020-08-13',30,1093046.440000,NULL,NULL,248328.560000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(339,4,'2020-08-13','2020-09-11',31,1104887.780000,NULL,NULL,236487.220000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(340,4,'2020-09-11','2020-10-13',32,1116857.410000,NULL,NULL,224517.590000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(341,4,'2020-10-13','2020-11-13',33,1128956.700000,NULL,NULL,212418.300000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(342,4,'2020-11-13','2020-12-11',34,1141187.070000,NULL,NULL,200187.930000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(343,4,'2020-12-11','2021-01-13',35,1153549.940000,NULL,NULL,187825.060000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(344,4,'2021-01-13','2021-02-12',36,1166046.740000,NULL,NULL,175328.260000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(345,4,'2021-02-12','2021-03-12',37,1178678.920000,NULL,NULL,162696.080000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(346,4,'2021-03-12','2021-04-13',38,1191447.950000,NULL,NULL,149927.050000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(347,4,'2021-04-13','2021-05-13',39,1204355.310000,NULL,NULL,137019.690000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(348,4,'2021-05-13','2021-06-11',40,1217402.500000,NULL,NULL,123972.500000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(349,4,'2021-06-11','2021-07-13',41,1230591.040000,NULL,NULL,110783.960000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(350,4,'2021-07-13','2021-08-13',42,1243922.450000,NULL,NULL,97452.550000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(351,4,'2021-08-13','2021-09-13',43,1257398.280000,NULL,NULL,83976.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(352,4,'2021-09-13','2021-10-13',44,1271020.110000,NULL,NULL,70354.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(353,4,'2021-10-13','2021-11-12',45,1284789.500000,NULL,NULL,56585.500000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(354,4,'2021-11-12','2021-12-13',46,1298708.060000,NULL,NULL,42666.940000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(355,4,'2021-12-13','2022-01-13',47,1312777.410000,NULL,NULL,28597.590000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(356,4,'2022-01-13','2022-02-11',48,1326998.780000,NULL,NULL,14375.830000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,1,'2018-02-13 12:00:45','2018-02-13 12:00:45',1,0),(675,8,'2018-02-15','2018-03-30',1,78483.670000,NULL,NULL,10833.330000,NULL,NULL,NULL,NULL,7500.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(676,8,'2018-03-30','2018-04-30',2,79333.910000,NULL,NULL,9983.090000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(677,8,'2018-04-30','2018-05-30',3,80193.360000,NULL,NULL,9123.640000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(678,8,'2018-05-30','2018-06-29',4,81062.120000,NULL,NULL,8254.880000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(679,8,'2018-06-29','2018-07-30',5,81940.290000,NULL,NULL,7376.710000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(680,8,'2018-07-30','2018-08-30',6,82827.980000,NULL,NULL,6489.020000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(681,8,'2018-08-30','2018-09-28',7,83725.280000,NULL,NULL,5591.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(682,8,'2018-09-28','2018-10-30',8,84632.310000,NULL,NULL,4684.690000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(683,8,'2018-10-30','2018-11-30',9,85549.160000,NULL,NULL,3767.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(684,8,'2018-11-30','2018-12-28',10,86475.940000,NULL,NULL,2841.060000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(685,8,'2018-12-28','2019-01-30',11,87412.760000,NULL,NULL,1904.240000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(686,8,'2019-01-30','2019-02-28',12,88363.220000,NULL,NULL,957.270000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:31:22','2018-02-15 14:31:22',4,0),(699,9,'2018-03-30','2018-04-30',2,79451.270000,NULL,NULL,9865.730000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(700,9,'2018-12-31','2019-01-31',11,87542.070000,NULL,NULL,1774.930000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(701,9,'2019-01-31','2019-02-28',12,76297.400000,NULL,NULL,826.560000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(702,9,'2018-02-15','2018-03-30',1,89317.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5000.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(703,9,'2018-04-30','2018-05-31',3,80311.990000,NULL,NULL,9005.010000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(704,9,'2018-09-28','2018-10-31',8,84757.500000,NULL,NULL,4559.500000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(705,9,'2018-06-29','2018-07-31',5,82061.510000,NULL,NULL,7255.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(706,9,'2018-07-31','2018-08-31',6,82950.510000,NULL,NULL,6366.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(707,9,'2018-10-31','2018-11-30',9,85675.710000,NULL,NULL,3641.290000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(708,9,'2018-11-30','2018-12-31',10,86603.860000,NULL,NULL,2713.140000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(709,9,'2018-08-31','2018-09-28',7,83849.140000,NULL,NULL,5467.860000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(710,9,'2018-05-31','2018-06-29',4,81182.040000,NULL,NULL,8134.960000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 14:46:22','2018-02-15 14:46:22',4,0),(711,10,'2018-08-31','2018-09-28',7,83849.140000,NULL,NULL,5467.860000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(712,10,'2018-09-28','2018-10-31',8,84757.500000,NULL,NULL,4559.500000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(713,10,'2018-03-30','2018-04-30',2,79451.270000,NULL,NULL,9865.730000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(714,10,'2018-06-29','2018-07-31',5,82061.510000,NULL,NULL,7255.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(715,10,'2018-07-31','2018-08-31',6,82950.510000,NULL,NULL,6366.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(716,10,'2018-10-31','2018-11-30',9,85675.710000,NULL,NULL,3641.290000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(717,10,'2018-02-15','2018-03-30',1,89317.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5000.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(718,10,'2018-05-31','2018-06-29',4,81182.040000,NULL,NULL,8134.960000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(719,10,'2019-01-31','2019-02-28',12,76297.400000,NULL,NULL,826.560000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(720,10,'2018-11-30','2018-12-31',10,86603.860000,NULL,NULL,2713.140000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(721,10,'2018-04-30','2018-05-31',3,80311.990000,NULL,NULL,9005.010000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(722,10,'2018-12-31','2019-01-31',11,87542.070000,NULL,NULL,1774.930000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,3,'2018-02-15 14:48:09','2018-02-15 14:48:09',3,0),(735,6,'2018-02-15','2018-03-30',1,78483.670000,78483.670000,NULL,10833.330000,10833.330000,NULL,NULL,NULL,7500.000000,7500.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,96817.000000,NULL,'','2018-02-15',5,'2018-02-15 15:00:53','2018-02-15 15:11:15',5,0),(736,6,'2018-03-30','2018-04-30',2,79333.910000,NULL,NULL,9983.090000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(737,6,'2018-04-30','2018-05-31',3,80193.360000,NULL,NULL,9123.640000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(738,6,'2018-05-31','2018-06-29',4,81062.120000,NULL,NULL,8254.880000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(739,6,'2018-06-29','2018-07-31',5,81940.290000,NULL,NULL,7376.710000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(740,6,'2018-07-31','2018-08-31',6,82827.980000,NULL,NULL,6489.020000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(741,6,'2018-08-31','2018-09-28',7,83725.280000,NULL,NULL,5591.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(742,6,'2018-09-28','2018-10-31',8,84632.310000,NULL,NULL,4684.690000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(743,6,'2018-10-31','2018-11-30',9,85549.160000,NULL,NULL,3767.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(744,6,'2018-11-30','2018-12-31',10,86475.940000,NULL,NULL,2841.060000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(745,6,'2018-12-31','2019-01-31',11,87412.760000,NULL,NULL,1904.240000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(746,6,'2019-01-31','2019-02-28',12,88363.220000,NULL,NULL,957.270000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 15:00:53','2018-02-15 15:00:53',5,0),(789,5,'2018-02-15','2018-03-15',1,78483.670000,NULL,NULL,10833.330000,NULL,NULL,NULL,NULL,5000.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(790,5,'2018-03-15','2018-04-13',2,79333.910000,NULL,NULL,9983.090000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(791,5,'2018-04-13','2018-05-15',3,80193.360000,NULL,NULL,9123.640000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(792,5,'2018-05-15','2018-06-15',4,81062.120000,NULL,NULL,8254.880000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(793,5,'2018-06-15','2018-07-13',5,81940.290000,NULL,NULL,7376.710000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(794,5,'2018-07-13','2018-08-15',6,82827.980000,NULL,NULL,6489.020000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(795,5,'2018-08-15','2018-09-14',7,83725.280000,NULL,NULL,5591.720000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(796,5,'2018-09-14','2018-10-15',8,84632.310000,NULL,NULL,4684.690000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(797,5,'2018-10-15','2018-11-15',9,85549.160000,NULL,NULL,3767.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(798,5,'2018-11-15','2018-12-14',10,86475.940000,NULL,NULL,2841.060000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(799,5,'2018-12-14','2019-01-15',11,87412.760000,NULL,NULL,1904.240000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(800,5,'2019-01-15','2019-02-15',12,88363.220000,NULL,NULL,957.270000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:31:56','2018-02-15 15:31:56',4,0),(897,7,'2018-02-15','2018-03-30',1,89317.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7500.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(898,7,'2018-03-30','2018-04-30',2,79451.270000,NULL,NULL,9865.730000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(899,7,'2018-04-30','2018-05-30',3,80311.990000,NULL,NULL,9005.010000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(900,7,'2018-05-30','2018-06-29',4,81444.460000,NULL,NULL,7872.540000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(901,7,'2018-06-29','2018-07-30',5,82064.350000,NULL,NULL,7252.650000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(902,7,'2018-07-30','2018-08-30',6,82953.380000,NULL,NULL,6363.620000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(903,7,'2018-08-30','2018-09-28',7,84204.620000,NULL,NULL,5112.380000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(904,7,'2018-09-28','2018-10-30',8,84764.260000,NULL,NULL,4552.740000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(905,7,'2018-10-30','2018-11-30',9,85682.540000,NULL,NULL,3634.460000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(906,7,'2018-11-30','2018-12-28',10,86791.180000,NULL,NULL,2525.820000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(907,7,'2018-12-28','2019-01-30',11,87551.010000,NULL,NULL,1765.990000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(908,7,'2019-01-30','2019-02-28',12,75463.940000,NULL,NULL,817.530000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 15:45:27','2018-02-15 15:45:27',4,0),(933,14,'2018-02-15','2018-03-30',1,178635.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(934,14,'2018-03-30','2018-04-30',2,158903.550000,NULL,NULL,19731.450000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(935,14,'2018-04-30','2018-05-30',3,160625.000000,NULL,NULL,18010.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(936,14,'2018-05-30','2018-06-29',4,162365.110000,NULL,NULL,16269.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(937,14,'2018-06-29','2018-07-30',5,164124.060000,NULL,NULL,14510.940000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(938,14,'2018-07-30','2018-08-30',6,165902.070000,NULL,NULL,12732.930000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(939,14,'2018-08-30','2018-09-28',7,167699.340000,NULL,NULL,10935.660000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(940,14,'2018-09-28','2018-10-30',8,169516.090000,NULL,NULL,9118.910000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(941,14,'2018-10-30','2018-11-30',9,171352.510000,NULL,NULL,7282.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(942,14,'2018-11-30','2018-12-28',10,173208.830000,NULL,NULL,5426.170000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(943,14,'2018-12-28','2019-01-30',11,175085.260000,NULL,NULL,3549.740000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(944,14,'2019-01-30','2019-02-28',12,152583.180000,NULL,NULL,1652.980000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:15:38','2018-02-15 16:15:38',4,0),(945,15,'2018-02-15','2018-03-30',1,178635.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(946,15,'2018-03-30','2018-04-30',2,158903.550000,NULL,NULL,19731.450000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(947,15,'2018-04-30','2018-05-30',3,160625.000000,NULL,NULL,18010.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(948,15,'2018-05-30','2018-06-29',4,162365.110000,NULL,NULL,16269.890000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(949,15,'2018-06-29','2018-07-30',5,164124.060000,NULL,NULL,14510.940000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(950,15,'2018-07-30','2018-08-30',6,165902.070000,NULL,NULL,12732.930000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(951,15,'2018-08-30','2018-09-28',7,167699.340000,NULL,NULL,10935.660000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(952,15,'2018-09-28','2018-10-30',8,169516.090000,NULL,NULL,9118.910000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(953,15,'2018-10-30','2018-11-30',9,171352.510000,NULL,NULL,7282.490000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(954,15,'2018-11-30','2018-12-28',10,173208.830000,NULL,NULL,5426.170000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(955,15,'2018-12-28','2019-01-30',11,175085.260000,NULL,NULL,3549.740000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(956,15,'2019-01-30','2019-02-28',12,152583.180000,NULL,NULL,1652.980000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,5,'2018-02-15 16:15:56','2018-02-15 16:15:56',5,0),(969,16,'2018-02-15','2018-03-15',1,78411.000000,NULL,NULL,11000.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(970,16,'2018-03-15','2018-04-13',2,79273.520000,NULL,NULL,10137.480000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(971,16,'2018-04-13','2018-05-15',3,80145.530000,NULL,NULL,9265.470000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(972,16,'2018-05-15','2018-06-15',4,81027.130000,NULL,NULL,8383.870000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(973,16,'2018-06-15','2018-07-13',5,81918.430000,NULL,NULL,7492.570000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(974,16,'2018-07-13','2018-08-15',6,82819.530000,NULL,NULL,6591.470000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(975,16,'2018-08-15','2018-09-14',7,83730.550000,NULL,NULL,5680.450000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(976,16,'2018-09-14','2018-10-15',8,84651.580000,NULL,NULL,4759.420000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(977,16,'2018-10-15','2018-11-15',9,85582.750000,NULL,NULL,3828.250000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(978,16,'2018-11-15','2018-12-14',10,86524.160000,NULL,NULL,2886.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(979,16,'2018-12-14','2019-01-15',11,87475.930000,NULL,NULL,1935.070000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0),(980,16,'2019-01-15','2019-02-15',12,88439.890000,NULL,NULL,972.840000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,4,'2018-02-15 16:26:11','2018-02-15 16:26:11',4,0);
/*!40000 ALTER TABLE `m_loan_repayment_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_repayment_schedule_history`
--

DROP TABLE IF EXISTS `m_loan_repayment_schedule_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_repayment_schedule_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `loan_reschedule_request_id` bigint(20) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(5) NOT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `interest_amount` decimal(19,6) DEFAULT NULL,
  `fee_charges_amount` decimal(19,6) DEFAULT NULL,
  `penalty_charges_amount` decimal(19,6) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `version` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`),
  KEY `loan_reschedule_request_id` (`loan_reschedule_request_id`),
  CONSTRAINT `m_loan_repayment_schedule_history_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `m_loan_repayment_schedule_history_ibfk_2` FOREIGN KEY (`loan_reschedule_request_id`) REFERENCES `m_loan_reschedule_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_repayment_schedule_history`
--

LOCK TABLES `m_loan_repayment_schedule_history` WRITE;
/*!40000 ALTER TABLE `m_loan_repayment_schedule_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_repayment_schedule_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_reschedule_request`
--

DROP TABLE IF EXISTS `m_loan_reschedule_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_reschedule_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `status_enum` smallint(5) NOT NULL,
  `reschedule_from_installment` smallint(5) NOT NULL COMMENT 'Rescheduling will start from this installment',
  `reschedule_from_date` date NOT NULL COMMENT 'Rescheduling will start from the installment with due date similar to this date.',
  `recalculate_interest` tinyint(1) DEFAULT NULL COMMENT 'If set to 1, interest will be recalculated starting from the reschedule period.',
  `reschedule_reason_cv_id` int(11) DEFAULT NULL COMMENT 'ID of code value of reason for rescheduling',
  `reschedule_reason_comment` varchar(500) DEFAULT NULL COMMENT 'Text provided in addition to the reason code value',
  `submitted_on_date` date NOT NULL,
  `submitted_by_user_id` bigint(20) NOT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint(20) DEFAULT NULL,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`),
  KEY `reschedule_reason_cv_id` (`reschedule_reason_cv_id`),
  KEY `submitted_by_user_id` (`submitted_by_user_id`),
  KEY `approved_by_user_id` (`approved_by_user_id`),
  KEY `rejected_by_user_id` (`rejected_by_user_id`),
  CONSTRAINT `m_loan_reschedule_request_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `m_loan_reschedule_request_ibfk_2` FOREIGN KEY (`reschedule_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  CONSTRAINT `m_loan_reschedule_request_ibfk_3` FOREIGN KEY (`submitted_by_user_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_loan_reschedule_request_ibfk_4` FOREIGN KEY (`approved_by_user_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_loan_reschedule_request_ibfk_5` FOREIGN KEY (`rejected_by_user_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_reschedule_request`
--

LOCK TABLES `m_loan_reschedule_request` WRITE;
/*!40000 ALTER TABLE `m_loan_reschedule_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_reschedule_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_reschedule_request_term_variations_mapping`
--

DROP TABLE IF EXISTS `m_loan_reschedule_request_term_variations_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_reschedule_request_term_variations_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_reschedule_request_id` bigint(20) NOT NULL,
  `loan_term_variations_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__m_loan_reschedule_request` (`loan_reschedule_request_id`),
  KEY `FK__m_loan_term_variations` (`loan_term_variations_id`),
  CONSTRAINT `FK__m_loan_reschedule_request` FOREIGN KEY (`loan_reschedule_request_id`) REFERENCES `m_loan_reschedule_request` (`id`),
  CONSTRAINT `FK__m_loan_term_variations` FOREIGN KEY (`loan_term_variations_id`) REFERENCES `m_loan_term_variations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_reschedule_request_term_variations_mapping`
--

LOCK TABLES `m_loan_reschedule_request_term_variations_mapping` WRITE;
/*!40000 ALTER TABLE `m_loan_reschedule_request_term_variations_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_reschedule_request_term_variations_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_term_variations`
--

DROP TABLE IF EXISTS `m_loan_term_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_term_variations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `term_type` smallint(2) NOT NULL,
  `applicable_date` date NOT NULL,
  `decimal_value` decimal(19,6) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `is_specific_to_installment` tinyint(4) NOT NULL DEFAULT '0',
  `applied_on_loan_status` smallint(5) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_loan_id_m_loan_id` (`loan_id`),
  CONSTRAINT `FK_loan_id_m_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_term_variations`
--

LOCK TABLES `m_loan_term_variations` WRITE;
/*!40000 ALTER TABLE `m_loan_term_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_term_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_topup`
--

DROP TABLE IF EXISTS `m_loan_topup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_topup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `closure_loan_id` bigint(20) NOT NULL,
  `account_transfer_details_id` bigint(20) DEFAULT NULL,
  `topup_amount` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_loan_topup_FK_loan_id` (`loan_id`),
  KEY `m_loan_topup_FK_closure_loan_id` (`closure_loan_id`),
  KEY `m_loan_topup_FK_account_transfer_details_id` (`account_transfer_details_id`),
  CONSTRAINT `m_loan_topup_FK_account_transfer_details_id` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`),
  CONSTRAINT `m_loan_topup_FK_closure_loan_id` FOREIGN KEY (`closure_loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `m_loan_topup_FK_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_topup`
--

LOCK TABLES `m_loan_topup` WRITE;
/*!40000 ALTER TABLE `m_loan_topup` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_topup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_tranche_charges`
--

DROP TABLE IF EXISTS `m_loan_tranche_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_tranche_charges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_loan_tranche_charges_m_loan` (`loan_id`),
  KEY `FK_m_loan_tranche_charges_m_charge` (`charge_id`),
  CONSTRAINT `FK_m_loan_tranche_charges_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `FK_m_loan_tranche_charges_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_tranche_charges`
--

LOCK TABLES `m_loan_tranche_charges` WRITE;
/*!40000 ALTER TABLE `m_loan_tranche_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_tranche_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_tranche_disbursement_charge`
--

DROP TABLE IF EXISTS `m_loan_tranche_disbursement_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_tranche_disbursement_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_charge_id` bigint(20) NOT NULL,
  `disbursement_detail_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_loan_tranche_disbursement_charge_m_loan_charge` (`loan_charge_id`),
  KEY `FK_m_loan_tranche_disbursement_charge_m_loan_disbursement_detail` (`disbursement_detail_id`),
  CONSTRAINT `FK_m_loan_tranche_disbursement_charge_m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  CONSTRAINT `FK_m_loan_tranche_disbursement_charge_m_loan_disbursement_detail` FOREIGN KEY (`disbursement_detail_id`) REFERENCES `m_loan_disbursement_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_tranche_disbursement_charge`
--

LOCK TABLES `m_loan_tranche_disbursement_charge` WRITE;
/*!40000 ALTER TABLE `m_loan_tranche_disbursement_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_loan_tranche_disbursement_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_transaction`
--

DROP TABLE IF EXISTS `m_loan_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(1) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `transaction_type_enum` smallint(5) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `principal_portion_derived` decimal(19,6) DEFAULT NULL,
  `interest_portion_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `overpayment_portion_derived` decimal(19,6) DEFAULT NULL,
  `unrecognized_income_portion` decimal(19,6) DEFAULT NULL,
  `outstanding_loan_balance_derived` decimal(19,6) DEFAULT NULL,
  `submitted_on_date` date NOT NULL,
  `manually_adjusted_or_reversed` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `appuser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  KEY `FKCFCEA42640BE0710` (`loan_id`),
  KEY `FK_m_loan_transaction_m_payment_detail` (`payment_detail_id`),
  KEY `FK_m_loan_transaction_m_office` (`office_id`),
  CONSTRAINT `FKCFCEA42640BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `FK_m_loan_transaction_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_loan_transaction_m_payment_detail` FOREIGN KEY (`payment_detail_id`) REFERENCES `m_payment_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_transaction`
--

LOCK TABLES `m_loan_transaction` WRITE;
/*!40000 ALTER TABLE `m_loan_transaction` DISABLE KEYS */;
INSERT INTO `m_loan_transaction` VALUES (1,2,1,NULL,0,NULL,1,'2018-02-13',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-13',0,'2018-02-13 16:11:28',1),(2,2,1,NULL,0,NULL,2,'2018-02-13',98721.000000,71637.670000,27083.330000,NULL,NULL,NULL,NULL,928362.330000,'2018-02-13',0,'2018-02-13 18:29:22',1),(3,2,1,NULL,0,NULL,2,'2018-02-13',98721.000000,73577.850000,25143.150000,NULL,NULL,NULL,NULL,854784.480000,'2018-02-13',0,'2018-02-13 18:29:33',1),(4,2,1,NULL,0,NULL,2,'2018-02-13',500000.000000,398881.840000,101118.160000,NULL,NULL,NULL,NULL,455902.640000,'2018-02-13',0,'2018-02-13 18:32:51',1),(5,2,1,NULL,0,NULL,4,'2018-02-13',3300.000000,NULL,NULL,NULL,NULL,NULL,3300.000000,455902.640000,'2018-02-13',0,'2018-02-13 18:39:13',1),(6,5,1,NULL,1,NULL,1,'2018-02-14',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-14',0,'2018-02-14 14:02:22',1),(10,5,1,2,1,NULL,1,'2018-02-14',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-14',0,'2018-02-14 15:29:33',1),(11,7,1,5,1,NULL,1,'2018-02-15',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-15',0,'2018-02-15 16:19:08',4),(12,7,1,6,1,NULL,1,'2018-02-15',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-15',0,'2018-02-15 16:24:35',4),(13,8,1,7,1,NULL,1,'2018-02-15',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-15',0,'2018-02-15 16:35:49',3),(15,6,1,8,0,NULL,1,'2018-02-15',1000000.000000,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,'2018-02-15',0,'2018-02-15 17:30:53',5),(16,6,1,9,0,NULL,2,'2018-02-15',96817.000000,78483.670000,10833.330000,7500.000000,NULL,NULL,NULL,921516.330000,'2018-02-15',0,'2018-02-15 17:41:15',5);
/*!40000 ALTER TABLE `m_loan_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loan_transaction_repayment_schedule_mapping`
--

DROP TABLE IF EXISTS `m_loan_transaction_repayment_schedule_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loan_transaction_repayment_schedule_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_transaction_id` bigint(20) NOT NULL,
  `loan_repayment_schedule_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `principal_portion_derived` decimal(19,6) DEFAULT NULL,
  `interest_portion_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mappings_m_loan_transaction` (`loan_transaction_id`),
  KEY `FK_mappings_m_loan_repayment_schedule` (`loan_repayment_schedule_id`),
  CONSTRAINT `FK_mappings_m_loan_repayment_schedule` FOREIGN KEY (`loan_repayment_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`),
  CONSTRAINT `FK_mappings_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loan_transaction_repayment_schedule_mapping`
--

LOCK TABLES `m_loan_transaction_repayment_schedule_mapping` WRITE;
/*!40000 ALTER TABLE `m_loan_transaction_repayment_schedule_mapping` DISABLE KEYS */;
INSERT INTO `m_loan_transaction_repayment_schedule_mapping` VALUES (1,2,93,98721.000000,71637.670000,27083.330000,NULL,NULL),(2,3,94,98721.000000,73577.850000,25143.150000,NULL,NULL),(3,4,98,98721.000000,81878.490000,16842.510000,NULL,NULL),(4,4,99,98721.000000,84096.040000,14624.960000,NULL,NULL),(5,4,100,6395.000000,NULL,6395.000000,NULL,NULL),(6,4,96,98721.000000,77617.290000,21103.710000,NULL,NULL),(7,4,97,98721.000000,79719.430000,19001.570000,NULL,NULL),(8,4,95,98721.000000,75570.590000,23150.410000,NULL,NULL),(9,5,100,3300.000000,NULL,3300.000000,NULL,NULL),(10,16,735,96817.000000,78483.670000,10833.330000,7500.000000,NULL);
/*!40000 ALTER TABLE `m_loan_transaction_repayment_schedule_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loanproduct_provisioning_entry`
--

DROP TABLE IF EXISTS `m_loanproduct_provisioning_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loanproduct_provisioning_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `history_id` bigint(20) NOT NULL,
  `criteria_id` bigint(20) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `overdue_in_days` bigint(20) DEFAULT '0',
  `reseve_amount` decimal(20,6) DEFAULT '0.000000',
  `liability_account` bigint(20) DEFAULT NULL,
  `expense_account` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_id` (`history_id`),
  KEY `criteria_id` (`criteria_id`),
  KEY `office_id` (`office_id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `liability_account` (`liability_account`),
  KEY `expense_account` (`expense_account`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `m_provisioning_history` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `m_provision_category` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_6` FOREIGN KEY (`liability_account`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_7` FOREIGN KEY (`expense_account`) REFERENCES `acc_gl_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loanproduct_provisioning_entry`
--

LOCK TABLES `m_loanproduct_provisioning_entry` WRITE;
/*!40000 ALTER TABLE `m_loanproduct_provisioning_entry` DISABLE KEYS */;
INSERT INTO `m_loanproduct_provisioning_entry` VALUES (1,1,1,'TZS',1,5,1,0,48390.940000,85,86);
/*!40000 ALTER TABLE `m_loanproduct_provisioning_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_loanproduct_provisioning_mapping`
--

DROP TABLE IF EXISTS `m_loanproduct_provisioning_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_loanproduct_provisioning_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `criteria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `criteria_id` (`criteria_id`),
  CONSTRAINT `m_loanproduct_provisioning_mapping_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  CONSTRAINT `m_loanproduct_provisioning_mapping_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_loanproduct_provisioning_mapping`
--

LOCK TABLES `m_loanproduct_provisioning_mapping` WRITE;
/*!40000 ALTER TABLE `m_loanproduct_provisioning_mapping` DISABLE KEYS */;
INSERT INTO `m_loanproduct_provisioning_mapping` VALUES (1,1,1),(2,5,1),(3,2,1),(4,3,1);
/*!40000 ALTER TABLE `m_loanproduct_provisioning_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_mandatory_savings_schedule`
--

DROP TABLE IF EXISTS `m_mandatory_savings_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mandatory_savings_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(5) NOT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL,
  `deposit_amount_completed_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_in_advance_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_late_derived` decimal(19,6) DEFAULT NULL,
  `completed_derived` bit(1) NOT NULL,
  `obligations_met_on_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMSS0000000001` (`savings_account_id`),
  CONSTRAINT `FKMSS0000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_mandatory_savings_schedule`
--

LOCK TABLES `m_mandatory_savings_schedule` WRITE;
/*!40000 ALTER TABLE `m_mandatory_savings_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_mandatory_savings_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_meeting`
--

DROP TABLE IF EXISTS `m_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_meeting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calendar_instance_id` bigint(20) NOT NULL,
  `meeting_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_calendar_instance_id_meeting_date` (`calendar_instance_id`,`meeting_date`),
  CONSTRAINT `FK_m_calendar_instance_m_meeting` FOREIGN KEY (`calendar_instance_id`) REFERENCES `m_calendar_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_meeting`
--

LOCK TABLES `m_meeting` WRITE;
/*!40000 ALTER TABLE `m_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_note`
--

DROP TABLE IF EXISTS `m_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `savings_account_transaction_id` bigint(20) DEFAULT NULL,
  `share_account_id` bigint(20) DEFAULT NULL,
  `note_type_enum` smallint(5) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7C9708924D26803` (`loan_transaction_id`),
  KEY `FK7C97089541F0A56` (`createdby_id`),
  KEY `FK7C970897179A0CB` (`client_id`),
  KEY `FK_m_note_m_group` (`group_id`),
  KEY `FK7C970898F889C3F` (`lastmodifiedby_id`),
  KEY `FK7C9708940BE0710` (`loan_id`),
  KEY `FK_savings_account_id` (`savings_account_id`),
  CONSTRAINT `FK7C9708924D26803` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  CONSTRAINT `FK7C9708940BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `FK7C97089541F0A56` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK7C970897179A0CB` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FK7C970898F889C3F` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_note_m_group` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `FK_savings_account_id` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_note`
--

LOCK TABLES `m_note` WRITE;
/*!40000 ALTER TABLE `m_note` DISABLE KEYS */;
INSERT INTO `m_note` VALUES (1,9,NULL,NULL,NULL,3,NULL,NULL,500,'SAVINGS','2018-02-15 12:18:26',4,'2018-02-15 12:18:26',4),(2,10,NULL,NULL,NULL,2,NULL,NULL,500,'being amount deposited as a contribution for the month.','2018-02-15 12:20:07',5,'2018-02-15 12:20:07',5),(3,10,NULL,NULL,NULL,2,NULL,NULL,500,'contribution for the month','2018-02-15 12:36:53',5,'2018-02-15 12:36:53',5),(4,10,NULL,NULL,NULL,2,NULL,NULL,500,'contribution','2018-02-15 12:37:27',5,'2018-02-15 12:37:27',5),(5,10,NULL,NULL,NULL,5,NULL,NULL,500,'contribution','2018-02-15 12:38:27',5,'2018-02-15 12:38:27',5),(6,10,NULL,NULL,NULL,NULL,NULL,1,700,'share applyed','2018-02-15 12:47:35',5,'2018-02-15 12:47:35',5),(7,9,NULL,NULL,NULL,NULL,NULL,2,700,'shares','2018-02-15 12:48:13',4,'2018-02-15 12:48:13',4),(8,11,NULL,NULL,NULL,6,NULL,NULL,500,'being bal of savings account','2018-02-15 13:10:29',3,'2018-02-15 13:10:29',3),(15,9,NULL,7,NULL,NULL,NULL,NULL,200,'DEV LOAN','2018-02-15 13:48:45',4,'2018-02-15 13:48:45',4),(16,9,NULL,7,NULL,NULL,NULL,NULL,200,'DEV LOAN','2018-02-15 13:49:08',4,'2018-02-15 13:49:08',4),(17,10,NULL,6,NULL,NULL,NULL,NULL,200,'Development loan','2018-02-15 13:49:29',5,'2018-02-15 13:49:29',5),(18,9,NULL,7,NULL,NULL,NULL,NULL,200,'DEV LOAN','2018-02-15 13:54:18',4,'2018-02-15 13:54:18',4),(19,9,NULL,7,NULL,NULL,NULL,NULL,200,'DEV LOAN','2018-02-15 13:54:35',4,'2018-02-15 13:54:35',4),(20,9,NULL,7,NULL,NULL,NULL,NULL,200,'DEV LOAN','2018-02-15 14:13:10',4,'2018-02-15 14:13:10',4),(21,10,NULL,6,NULL,NULL,NULL,NULL,200,'development loan','2018-02-15 14:14:06',5,'2018-02-15 14:14:06',5),(22,10,NULL,6,NULL,NULL,NULL,NULL,200,'Development loan','2018-02-15 14:56:05',5,'2018-02-15 14:56:05',5),(23,10,NULL,6,NULL,NULL,NULL,NULL,200,'development loan','2018-02-15 15:00:54',5,'2018-02-15 15:00:54',5),(24,10,NULL,6,16,NULL,NULL,NULL,300,'being payment for development loan','2018-02-15 15:11:15',5,'2018-02-15 15:11:15',5);
/*!40000 ALTER TABLE `m_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_office`
--

DROP TABLE IF EXISTS `m_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_office` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `hierarchy` varchar(100) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `opening_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_org` (`name`),
  UNIQUE KEY `externalid_org` (`external_id`),
  KEY `FK2291C477E2551DCC` (`parent_id`),
  CONSTRAINT `FK2291C477E2551DCC` FOREIGN KEY (`parent_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_office`
--

LOCK TABLES `m_office` WRITE;
/*!40000 ALTER TABLE `m_office` DISABLE KEYS */;
INSERT INTO `m_office` VALUES (1,NULL,'.','1','Nyumba Head Office','1964-01-01');
/*!40000 ALTER TABLE `m_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_office_transaction`
--

DROP TABLE IF EXISTS `m_office_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_office_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_office_id` bigint(20) DEFAULT NULL,
  `to_office_id` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` int(11) NOT NULL,
  `transaction_amount` decimal(19,6) NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1E37728B93C6C1B6` (`to_office_id`),
  KEY `FK1E37728B783C5C25` (`from_office_id`),
  CONSTRAINT `FK1E37728B783C5C25` FOREIGN KEY (`from_office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK1E37728B93C6C1B6` FOREIGN KEY (`to_office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_office_transaction`
--

LOCK TABLES `m_office_transaction` WRITE;
/*!40000 ALTER TABLE `m_office_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_office_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_organisation_creditbureau`
--

DROP TABLE IF EXISTS `m_organisation_creditbureau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_organisation_creditbureau` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `creditbureau_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `morgcb` (`alias`,`creditbureau_id`),
  KEY `orgcb_cbfk` (`creditbureau_id`),
  CONSTRAINT `orgcb_cbfk` FOREIGN KEY (`creditbureau_id`) REFERENCES `m_creditbureau` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_organisation_creditbureau`
--

LOCK TABLES `m_organisation_creditbureau` WRITE;
/*!40000 ALTER TABLE `m_organisation_creditbureau` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_organisation_creditbureau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_organisation_currency`
--

DROP TABLE IF EXISTS `m_organisation_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_organisation_currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `decimal_places` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `display_symbol` varchar(10) DEFAULT NULL,
  `internationalized_name_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_organisation_currency`
--

LOCK TABLES `m_organisation_currency` WRITE;
/*!40000 ALTER TABLE `m_organisation_currency` DISABLE KEYS */;
INSERT INTO `m_organisation_currency` VALUES (24,'TZS',2,NULL,'Tanzanian Shilling',NULL,'currency.TZS');
/*!40000 ALTER TABLE `m_organisation_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_password_validation_policy`
--

DROP TABLE IF EXISTS `m_password_validation_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_password_validation_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regex` text NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_password_validation_policy`
--

LOCK TABLES `m_password_validation_policy` WRITE;
/*!40000 ALTER TABLE `m_password_validation_policy` DISABLE KEYS */;
INSERT INTO `m_password_validation_policy` VALUES (1,'^.{1,50}$','Password most be at least 1 character and not more that 50 characters long',1,'simple'),(2,'^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).{6,50}$','Password must be at least 6 characters, no more than 50 characters long, must include at least one upper case letter, one lower case letter, one numeric digit and no space',0,'secure');
/*!40000 ALTER TABLE `m_password_validation_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_payment_detail`
--

DROP TABLE IF EXISTS `m_payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_payment_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_type_id` int(11) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `check_number` varchar(100) DEFAULT NULL,
  `receipt_number` varchar(100) DEFAULT NULL,
  `bank_number` varchar(100) DEFAULT NULL,
  `routing_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_payment_detail_m_payment_type` (`payment_type_id`),
  CONSTRAINT `FK_m_payment_detail_m_payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `m_payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_payment_detail`
--

LOCK TABLES `m_payment_detail` WRITE;
/*!40000 ALTER TABLE `m_payment_detail` DISABLE KEYS */;
INSERT INTO `m_payment_detail` VALUES (2,1,'','','','',''),(3,1,'','','','',''),(4,1,'','','','',''),(5,1,'','','','',''),(6,1,'','','','',''),(7,1,'','','','',''),(8,1,'','','','',''),(9,1,'','','','','');
/*!40000 ALTER TABLE `m_payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_payment_type`
--

DROP TABLE IF EXISTS `m_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_cash_payment` tinyint(1) DEFAULT '0',
  `order_position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_payment_type`
--

LOCK TABLES `m_payment_type` WRITE;
/*!40000 ALTER TABLE `m_payment_type` DISABLE KEYS */;
INSERT INTO `m_payment_type` VALUES (1,'Payrol','Waajiriwa NHC',1,1);
/*!40000 ALTER TABLE `m_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_permission`
--

DROP TABLE IF EXISTS `m_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grouping` varchar(45) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `entity_name` varchar(100) DEFAULT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `can_maker_checker` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_permission`
--

LOCK TABLES `m_permission` WRITE;
/*!40000 ALTER TABLE `m_permission` DISABLE KEYS */;
INSERT INTO `m_permission` VALUES (1,'special','ALL_FUNCTIONS',NULL,NULL,0),(2,'special','ALL_FUNCTIONS_READ',NULL,NULL,0),(3,'special','CHECKER_SUPER_USER',NULL,NULL,0),(4,'special','REPORTING_SUPER_USER',NULL,NULL,0),(5,'authorisation','READ_PERMISSION','PERMISSION','READ',0),(6,'authorisation','PERMISSIONS_ROLE','ROLE','PERMISSIONS',0),(7,'authorisation','CREATE_ROLE','ROLE','CREATE',0),(8,'authorisation','CREATE_ROLE_CHECKER','ROLE','CREATE_CHECKER',0),(9,'authorisation','READ_ROLE','ROLE','READ',0),(10,'authorisation','UPDATE_ROLE','ROLE','UPDATE',0),(11,'authorisation','UPDATE_ROLE_CHECKER','ROLE','UPDATE_CHECKER',0),(12,'authorisation','DELETE_ROLE','ROLE','DELETE',0),(13,'authorisation','DELETE_ROLE_CHECKER','ROLE','DELETE_CHECKER',0),(14,'authorisation','CREATE_USER','USER','CREATE',0),(15,'authorisation','CREATE_USER_CHECKER','USER','CREATE_CHECKER',0),(16,'authorisation','READ_USER','USER','READ',0),(17,'authorisation','UPDATE_USER','USER','UPDATE',0),(18,'authorisation','UPDATE_USER_CHECKER','USER','UPDATE_CHECKER',0),(19,'authorisation','DELETE_USER','USER','DELETE',0),(20,'authorisation','DELETE_USER_CHECKER','USER','DELETE_CHECKER',0),(21,'configuration','READ_CONFIGURATION','CONFIGURATION','READ',0),(22,'configuration','UPDATE_CONFIGURATION','CONFIGURATION','UPDATE',0),(23,'configuration','UPDATE_CONFIGURATION_CHECKER','CONFIGURATION','UPDATE_CHECKER',0),(24,'configuration','READ_CODE','CODE','READ',0),(25,'configuration','CREATE_CODE','CODE','CREATE',0),(26,'configuration','CREATE_CODE_CHECKER','CODE','CREATE_CHECKER',0),(27,'configuration','UPDATE_CODE','CODE','UPDATE',0),(28,'configuration','UPDATE_CODE_CHECKER','CODE','UPDATE_CHECKER',0),(29,'configuration','DELETE_CODE','CODE','DELETE',0),(30,'configuration','DELETE_CODE_CHECKER','CODE','DELETE_CHECKER',0),(31,'configuration','READ_CODEVALUE','CODEVALUE','READ',0),(32,'configuration','CREATE_CODEVALUE','CODEVALUE','CREATE',0),(33,'configuration','CREATE_CODEVALUE_CHECKER','CODEVALUE','CREATE_CHECKER',0),(34,'configuration','UPDATE_CODEVALUE','CODEVALUE','UPDATE',0),(35,'configuration','UPDATE_CODEVALUE_CHECKER','CODEVALUE','UPDATE_CHECKER',0),(36,'configuration','DELETE_CODEVALUE','CODEVALUE','DELETE',0),(37,'configuration','DELETE_CODEVALUE_CHECKER','CODEVALUE','DELETE_CHECKER',0),(38,'configuration','READ_CURRENCY','CURRENCY','READ',0),(39,'configuration','UPDATE_CURRENCY','CURRENCY','UPDATE',0),(40,'configuration','UPDATE_CURRENCY_CHECKER','CURRENCY','UPDATE_CHECKER',0),(41,'configuration','UPDATE_PERMISSION','PERMISSION','UPDATE',0),(42,'configuration','UPDATE_PERMISSION_CHECKER','PERMISSION','UPDATE_CHECKER',0),(43,'configuration','READ_DATATABLE','DATATABLE','READ',0),(44,'configuration','REGISTER_DATATABLE','DATATABLE','REGISTER',0),(45,'configuration','REGISTER_DATATABLE_CHECKER','DATATABLE','REGISTER_CHECKER',0),(46,'configuration','DEREGISTER_DATATABLE','DATATABLE','DEREGISTER',0),(47,'configuration','DEREGISTER_DATATABLE_CHECKER','DATATABLE','DEREGISTER_CHECKER',0),(48,'configuration','READ_AUDIT','AUDIT','READ',0),(49,'configuration','CREATE_CALENDAR','CALENDAR','CREATE',0),(50,'configuration','READ_CALENDAR','CALENDAR','READ',0),(51,'configuration','UPDATE_CALENDAR','CALENDAR','UPDATE',0),(52,'configuration','DELETE_CALENDAR','CALENDAR','DELETE',0),(53,'configuration','CREATE_CALENDAR_CHECKER','CALENDAR','CREATE_CHECKER',0),(54,'configuration','UPDATE_CALENDAR_CHECKER','CALENDAR','UPDATE_CHECKER',0),(55,'configuration','DELETE_CALENDAR_CHECKER','CALENDAR','DELETE_CHECKER',0),(57,'organisation','READ_CHARGE','CHARGE','READ',0),(58,'organisation','CREATE_CHARGE','CHARGE','CREATE',0),(59,'organisation','CREATE_CHARGE_CHECKER','CHARGE','CREATE_CHECKER',0),(60,'organisation','UPDATE_CHARGE','CHARGE','UPDATE',0),(61,'organisation','UPDATE_CHARGE_CHECKER','CHARGE','UPDATE_CHECKER',0),(62,'organisation','DELETE_CHARGE','CHARGE','DELETE',0),(63,'organisation','DELETE_CHARGE_CHECKER','CHARGE','DELETE_CHECKER',0),(64,'organisation','READ_FUND','FUND','READ',0),(65,'organisation','CREATE_FUND','FUND','CREATE',0),(66,'organisation','CREATE_FUND_CHECKER','FUND','CREATE_CHECKER',0),(67,'organisation','UPDATE_FUND','FUND','UPDATE',0),(68,'organisation','UPDATE_FUND_CHECKER','FUND','UPDATE_CHECKER',0),(69,'organisation','DELETE_FUND','FUND','DELETE',0),(70,'organisation','DELETE_FUND_CHECKER','FUND','DELETE_CHECKER',0),(71,'organisation','READ_LOANPRODUCT','LOANPRODUCT','READ',0),(72,'organisation','CREATE_LOANPRODUCT','LOANPRODUCT','CREATE',0),(73,'organisation','CREATE_LOANPRODUCT_CHECKER','LOANPRODUCT','CREATE_CHECKER',0),(74,'organisation','UPDATE_LOANPRODUCT','LOANPRODUCT','UPDATE',0),(75,'organisation','UPDATE_LOANPRODUCT_CHECKER','LOANPRODUCT','UPDATE_CHECKER',0),(76,'organisation','DELETE_LOANPRODUCT','LOANPRODUCT','DELETE',0),(77,'organisation','DELETE_LOANPRODUCT_CHECKER','LOANPRODUCT','DELETE_CHECKER',0),(78,'organisation','READ_OFFICE','OFFICE','READ',0),(79,'organisation','CREATE_OFFICE','OFFICE','CREATE',0),(80,'organisation','CREATE_OFFICE_CHECKER','OFFICE','CREATE_CHECKER',0),(81,'organisation','UPDATE_OFFICE','OFFICE','UPDATE',0),(82,'organisation','UPDATE_OFFICE_CHECKER','OFFICE','UPDATE_CHECKER',0),(83,'organisation','READ_OFFICETRANSACTION','OFFICETRANSACTION','READ',0),(84,'organisation','DELETE_OFFICE_CHECKER','OFFICE','DELETE_CHECKER',0),(85,'organisation','CREATE_OFFICETRANSACTION','OFFICETRANSACTION','CREATE',0),(86,'organisation','CREATE_OFFICETRANSACTION_CHECKER','OFFICETRANSACTION','CREATE_CHECKER',0),(87,'organisation','DELETE_OFFICETRANSACTION','OFFICETRANSACTION','DELETE',0),(88,'organisation','DELETE_OFFICETRANSACTION_CHECKER','OFFICETRANSACTION','DELETE_CHECKER',0),(89,'organisation','READ_STAFF','STAFF','READ',0),(90,'organisation','CREATE_STAFF','STAFF','CREATE',0),(91,'organisation','CREATE_STAFF_CHECKER','STAFF','CREATE_CHECKER',0),(92,'organisation','UPDATE_STAFF','STAFF','UPDATE',0),(93,'organisation','UPDATE_STAFF_CHECKER','STAFF','UPDATE_CHECKER',0),(94,'organisation','DELETE_STAFF','STAFF','DELETE',0),(95,'organisation','DELETE_STAFF_CHECKER','STAFF','DELETE_CHECKER',0),(96,'organisation','READ_SAVINGSPRODUCT','SAVINGSPRODUCT','READ',0),(97,'organisation','CREATE_SAVINGSPRODUCT','SAVINGSPRODUCT','CREATE',0),(98,'organisation','CREATE_SAVINGSPRODUCT_CHECKER','SAVINGSPRODUCT','CREATE_CHECKER',0),(99,'organisation','UPDATE_SAVINGSPRODUCT','SAVINGSPRODUCT','UPDATE',0),(100,'organisation','UPDATE_SAVINGSPRODUCT_CHECKER','SAVINGSPRODUCT','UPDATE_CHECKER',0),(101,'organisation','DELETE_SAVINGSPRODUCT','SAVINGSPRODUCT','DELETE',0),(102,'organisation','DELETE_SAVINGSPRODUCT_CHECKER','SAVINGSPRODUCT','DELETE_CHECKER',0),(103,'portfolio','READ_LOAN','LOAN','READ',0),(104,'portfolio','CREATE_LOAN','LOAN','CREATE',0),(105,'portfolio','CREATE_LOAN_CHECKER','LOAN','CREATE_CHECKER',0),(106,'portfolio','UPDATE_LOAN','LOAN','UPDATE',0),(107,'portfolio','UPDATE_LOAN_CHECKER','LOAN','UPDATE_CHECKER',0),(108,'portfolio','DELETE_LOAN','LOAN','DELETE',0),(109,'portfolio','DELETE_LOAN_CHECKER','LOAN','DELETE_CHECKER',0),(110,'portfolio','READ_CLIENT','CLIENT','READ',0),(111,'portfolio','CREATE_CLIENT','CLIENT','CREATE',0),(112,'portfolio','CREATE_CLIENT_CHECKER','CLIENT','CREATE_CHECKER',0),(113,'portfolio','UPDATE_CLIENT','CLIENT','UPDATE',0),(114,'portfolio','UPDATE_CLIENT_CHECKER','CLIENT','UPDATE_CHECKER',0),(115,'portfolio','DELETE_CLIENT','CLIENT','DELETE',0),(116,'portfolio','DELETE_CLIENT_CHECKER','CLIENT','DELETE_CHECKER',0),(117,'portfolio','READ_CLIENTIMAGE','CLIENTIMAGE','READ',0),(118,'portfolio','CREATE_CLIENTIMAGE','CLIENTIMAGE','CREATE',0),(119,'portfolio','CREATE_CLIENTIMAGE_CHECKER','CLIENTIMAGE','CREATE_CHECKER',0),(120,'portfolio','DELETE_CLIENTIMAGE','CLIENTIMAGE','DELETE',0),(121,'portfolio','DELETE_CLIENTIMAGE_CHECKER','CLIENTIMAGE','DELETE_CHECKER',0),(122,'portfolio','READ_CLIENTNOTE','CLIENTNOTE','READ',0),(123,'portfolio','CREATE_CLIENTNOTE','CLIENTNOTE','CREATE',0),(124,'portfolio','CREATE_CLIENTNOTE_CHECKER','CLIENTNOTE','CREATE_CHECKER',0),(125,'portfolio','UPDATE_CLIENTNOTE','CLIENTNOTE','UPDATE',0),(126,'portfolio','UPDATE_CLIENTNOTE_CHECKER','CLIENTNOTE','UPDATE_CHECKER',0),(127,'portfolio','DELETE_CLIENTNOTE','CLIENTNOTE','DELETE',0),(128,'portfolio','DELETE_CLIENTNOTE_CHECKER','CLIENTNOTE','DELETE_CHECKER',0),(129,'portfolio_group','READ_GROUPNOTE','GROUPNOTE','READ',0),(130,'portfolio_group','CREATE_GROUPNOTE','GROUPNOTE','CREATE',0),(131,'portfolio_group','UPDATE_GROUPNOTE','GROUPNOTE','UPDATE',0),(132,'portfolio_group','DELETE_GROUPNOTE','GROUPNOTE','DELETE',0),(133,'portfolio_group','CREATE_GROUPNOTE_CHECKER','GROUPNOTE','CREATE_CHECKER',0),(134,'portfolio_group','UPDATE_GROUPNOTE_CHECKER','GROUPNOTE','UPDATE_CHECKER',0),(135,'portfolio_group','DELETE_GROUPNOTE_CHECKER','GROUPNOTE','DELETE_CHECKER',0),(136,'portfolio','READ_LOANNOTE','LOANNOTE','READ',0),(137,'portfolio','CREATE_LOANNOTE','LOANNOTE','CREATE',0),(138,'portfolio','UPDATE_LOANNOTE','LOANNOTE','UPDATE',0),(139,'portfolio','DELETE_LOANNOTE','LOANNOTE','DELETE',0),(140,'portfolio','CREATE_LOANNOTE_CHECKER','LOANNOTE','CREATE_CHECKER',0),(141,'portfolio','UPDATE_LOANNOTE_CHECKER','LOANNOTE','UPDATE_CHECKER',0),(142,'portfolio','DELETE_LOANNOTE_CHECKER','LOANNOTE','DELETE_CHECKER',0),(143,'portfolio','READ_LOANTRANSACTIONNOTE','LOANTRANSACTIONNOTE','READ',0),(144,'portfolio','CREATE_LOANTRANSACTIONNOTE','LOANTRANSACTIONNOTE','CREATE',0),(145,'portfolio','UPDATE_LOANTRANSACTIONNOTE','LOANTRANSACTIONNOTE','UPDATE',0),(146,'portfolio','DELETE_LOANTRANSACTIONNOTE','LOANTRANSACTIONNOTE','DELETE',0),(147,'portfolio','CREATE_LOANTRANSACTIONNOTE_CHECKER','LOANTRANSACTIONNOTE','CREATE_CHECKER',0),(148,'portfolio','UPDATE_LOANTRANSACTIONNOTE_CHECKER','LOANTRANSACTIONNOTE','UPDATE_CHECKER',0),(149,'portfolio','DELETE_LOANTRANSACTIONNOTE_CHECKER','LOANTRANSACTIONNOTE','DELETE_CHECKER',0),(150,'portfolio','READ_SAVINGNOTE','SAVINGNOTE','READ',0),(151,'portfolio','CREATE_SAVINGNOTE','SAVINGNOTE','CREATE',0),(152,'portfolio','UPDATE_SAVINGNOTE','SAVINGNOTE','UPDATE',0),(153,'portfolio','DELETE_SAVINGNOTE','SAVINGNOTE','DELETE',0),(154,'portfolio','CREATE_SAVINGNOTE_CHECKER','SAVINGNOTE','CREATE_CHECKER',0),(155,'portfolio','UPDATE_SAVINGNOTE_CHECKER','SAVINGNOTE','UPDATE_CHECKER',0),(156,'portfolio','DELETE_SAVINGNOTE_CHECKER','SAVINGNOTE','DELETE_CHECKER',0),(157,'portfolio','READ_CLIENTIDENTIFIER','CLIENTIDENTIFIER','READ',0),(158,'portfolio','CREATE_CLIENTIDENTIFIER','CLIENTIDENTIFIER','CREATE',0),(159,'portfolio','CREATE_CLIENTIDENTIFIER_CHECKER','CLIENTIDENTIFIER','CREATE_CHECKER',0),(160,'portfolio','UPDATE_CLIENTIDENTIFIER','CLIENTIDENTIFIER','UPDATE',0),(161,'portfolio','UPDATE_CLIENTIDENTIFIER_CHECKER','CLIENTIDENTIFIER','UPDATE_CHECKER',0),(162,'portfolio','DELETE_CLIENTIDENTIFIER','CLIENTIDENTIFIER','DELETE',0),(163,'portfolio','DELETE_CLIENTIDENTIFIER_CHECKER','CLIENTIDENTIFIER','DELETE_CHECKER',0),(164,'portfolio','READ_DOCUMENT','DOCUMENT','READ',0),(165,'portfolio','CREATE_DOCUMENT','DOCUMENT','CREATE',0),(166,'portfolio','CREATE_DOCUMENT_CHECKER','DOCUMENT','CREATE_CHECKER',0),(167,'portfolio','UPDATE_DOCUMENT','DOCUMENT','UPDATE',0),(168,'portfolio','UPDATE_DOCUMENT_CHECKER','DOCUMENT','UPDATE_CHECKER',0),(169,'portfolio','DELETE_DOCUMENT','DOCUMENT','DELETE',0),(170,'portfolio','DELETE_DOCUMENT_CHECKER','DOCUMENT','DELETE_CHECKER',0),(171,'portfolio_group','READ_GROUP','GROUP','READ',0),(172,'portfolio_group','CREATE_GROUP','GROUP','CREATE',0),(173,'portfolio_group','CREATE_GROUP_CHECKER','GROUP','CREATE_CHECKER',0),(174,'portfolio_group','UPDATE_GROUP','GROUP','UPDATE',0),(175,'portfolio_group','UPDATE_GROUP_CHECKER','GROUP','UPDATE_CHECKER',0),(176,'portfolio_group','DELETE_GROUP','GROUP','DELETE',0),(177,'portfolio_group','DELETE_GROUP_CHECKER','GROUP','DELETE_CHECKER',0),(178,'portfolio_group','UNASSIGNSTAFF_GROUP','GROUP','UNASSIGNSTAFF',0),(179,'portfolio_group','UNASSIGNSTAFF_GROUP_CHECKER','GROUP','UNASSIGNSTAFF_CHECKER',0),(180,'portfolio','CREATE_LOANCHARGE','LOANCHARGE','CREATE',0),(181,'portfolio','CREATE_LOANCHARGE_CHECKER','LOANCHARGE','CREATE_CHECKER',0),(182,'portfolio','UPDATE_LOANCHARGE','LOANCHARGE','UPDATE',0),(183,'portfolio','UPDATE_LOANCHARGE_CHECKER','LOANCHARGE','UPDATE_CHECKER',0),(184,'portfolio','DELETE_LOANCHARGE','LOANCHARGE','DELETE',0),(185,'portfolio','DELETE_LOANCHARGE_CHECKER','LOANCHARGE','DELETE_CHECKER',0),(186,'portfolio','WAIVE_LOANCHARGE','LOANCHARGE','WAIVE',0),(187,'portfolio','WAIVE_LOANCHARGE_CHECKER','LOANCHARGE','WAIVE_CHECKER',0),(188,'portfolio','READ_SAVINGSACCOUNT','SAVINGSACCOUNT','READ',0),(189,'portfolio','CREATE_SAVINGSACCOUNT','SAVINGSACCOUNT','CREATE',0),(190,'portfolio','CREATE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','CREATE_CHECKER',0),(191,'portfolio','UPDATE_SAVINGSACCOUNT','SAVINGSACCOUNT','UPDATE',0),(192,'portfolio','UPDATE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UPDATE_CHECKER',0),(193,'portfolio','DELETE_SAVINGSACCOUNT','SAVINGSACCOUNT','DELETE',0),(194,'portfolio','DELETE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','DELETE_CHECKER',0),(195,'portfolio','READ_GUARANTOR','GUARANTOR','READ',0),(196,'portfolio','CREATE_GUARANTOR','GUARANTOR','CREATE',0),(197,'portfolio','CREATE_GUARANTOR_CHECKER','GUARANTOR','CREATE_CHECKER',0),(198,'portfolio','UPDATE_GUARANTOR','GUARANTOR','UPDATE',0),(199,'portfolio','UPDATE_GUARANTOR_CHECKER','GUARANTOR','UPDATE_CHECKER',0),(200,'portfolio','DELETE_GUARANTOR','GUARANTOR','DELETE',0),(201,'portfolio','DELETE_GUARANTOR_CHECKER','GUARANTOR','DELETE_CHECKER',0),(202,'portfolio','READ_COLLATERAL','COLLATERAL','READ',0),(203,'portfolio','CREATE_COLLATERAL','COLLATERAL','CREATE',0),(204,'portfolio','UPDATE_COLLATERAL','COLLATERAL','UPDATE',0),(205,'portfolio','DELETE_COLLATERAL','COLLATERAL','DELETE',0),(206,'portfolio','CREATE_COLLATERAL_CHECKER','COLLATERAL','CREATE_CHECKER',0),(207,'portfolio','UPDATE_COLLATERAL_CHECKER','COLLATERAL','UPDATE_CHECKER',0),(208,'portfolio','DELETE_COLLATERAL_CHECKER','COLLATERAL','DELETE_CHECKER',0),(209,'transaction_loan','APPROVE_LOAN','LOAN','APPROVE',0),(211,'transaction_loan','REJECT_LOAN','LOAN','REJECT',0),(213,'transaction_loan','WITHDRAW_LOAN','LOAN','WITHDRAW',0),(215,'transaction_loan','APPROVALUNDO_LOAN','LOAN','APPROVALUNDO',0),(216,'transaction_loan','DISBURSE_LOAN','LOAN','DISBURSE',0),(218,'transaction_loan','DISBURSALUNDO_LOAN','LOAN','DISBURSALUNDO',0),(219,'transaction_loan','REPAYMENT_LOAN','LOAN','REPAYMENT',0),(221,'transaction_loan','ADJUST_LOAN','LOAN','ADJUST',0),(222,'transaction_loan','WAIVEINTERESTPORTION_LOAN','LOAN','WAIVEINTERESTPORTION',0),(223,'transaction_loan','WRITEOFF_LOAN','LOAN','WRITEOFF',0),(224,'transaction_loan','CLOSE_LOAN','LOAN','CLOSE',0),(225,'transaction_loan','CLOSEASRESCHEDULED_LOAN','LOAN','CLOSEASRESCHEDULED',0),(226,'transaction_loan','UPDATELOANOFFICER_LOAN','LOAN','UPDATELOANOFFICER',0),(227,'transaction_loan','UPDATELOANOFFICER_LOAN_CHECKER','LOAN','UPDATELOANOFFICER_CHECKER',0),(228,'transaction_loan','REMOVELOANOFFICER_LOAN','LOAN','REMOVELOANOFFICER',0),(229,'transaction_loan','REMOVELOANOFFICER_LOAN_CHECKER','LOAN','REMOVELOANOFFICER_CHECKER',0),(230,'transaction_loan','BULKREASSIGN_LOAN','LOAN','BULKREASSIGN',0),(231,'transaction_loan','BULKREASSIGN_LOAN_CHECKER','LOAN','BULKREASSIGN_CHECKER',0),(232,'transaction_loan','APPROVE_LOAN_CHECKER','LOAN','APPROVE_CHECKER',0),(234,'transaction_loan','REJECT_LOAN_CHECKER','LOAN','REJECT_CHECKER',0),(236,'transaction_loan','WITHDRAW_LOAN_CHECKER','LOAN','WITHDRAW_CHECKER',0),(238,'transaction_loan','APPROVALUNDO_LOAN_CHECKER','LOAN','APPROVALUNDO_CHECKER',0),(239,'transaction_loan','DISBURSE_LOAN_CHECKER','LOAN','DISBURSE_CHECKER',0),(241,'transaction_loan','DISBURSALUNDO_LOAN_CHECKER','LOAN','DISBURSALUNDO_CHECKER',0),(242,'transaction_loan','REPAYMENT_LOAN_CHECKER','LOAN','REPAYMENT_CHECKER',0),(244,'transaction_loan','ADJUST_LOAN_CHECKER','LOAN','ADJUST_CHECKER',0),(245,'transaction_loan','WAIVEINTERESTPORTION_LOAN_CHECKER','LOAN','WAIVEINTERESTPORTION_CHECKER',0),(246,'transaction_loan','WRITEOFF_LOAN_CHECKER','LOAN','WRITEOFF_CHECKER',0),(247,'transaction_loan','CLOSE_LOAN_CHECKER','LOAN','CLOSE_CHECKER',0),(248,'transaction_loan','CLOSEASRESCHEDULED_LOAN_CHECKER','LOAN','CLOSEASRESCHEDULED_CHECKER',0),(249,'transaction_savings','DEPOSIT_SAVINGSACCOUNT','SAVINGSACCOUNT','DEPOSIT',0),(250,'transaction_savings','DEPOSIT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','DEPOSIT_CHECKER',0),(251,'transaction_savings','WITHDRAWAL_SAVINGSACCOUNT','SAVINGSACCOUNT','WITHDRAWAL',0),(252,'transaction_savings','WITHDRAWAL_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','WITHDRAWAL_CHECKER',0),(253,'transaction_savings','ACTIVATE_SAVINGSACCOUNT','SAVINGSACCOUNT','ACTIVATE',0),(254,'transaction_savings','ACTIVATE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','ACTIVATE_CHECKER',0),(255,'transaction_savings','CALCULATEINTEREST_SAVINGSACCOUNT','SAVINGSACCOUNT','CALCULATEINTEREST',0),(256,'transaction_savings','CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','CALCULATEINTEREST_CHECKER',0),(257,'accounting','CREATE_GLACCOUNT','GLACCOUNT','CREATE',0),(258,'accounting','UPDATE_GLACCOUNT','GLACCOUNT','UPDATE',0),(259,'accounting','DELETE_GLACCOUNT','GLACCOUNT','DELETE',0),(260,'accounting','CREATE_GLCLOSURE','GLCLOSURE','CREATE',0),(261,'accounting','UPDATE_GLCLOSURE','GLCLOSURE','UPDATE',0),(262,'accounting','DELETE_GLCLOSURE','GLCLOSURE','DELETE',0),(263,'accounting','CREATE_JOURNALENTRY','JOURNALENTRY','CREATE',0),(264,'accounting','REVERSE_JOURNALENTRY','JOURNALENTRY','REVERSE',0),(265,'report','READ_Active Loans - Details','Active Loans - Details','READ',0),(266,'report','READ_Active Loans - Summary','Active Loans - Summary','READ',0),(267,'report','READ_Active Loans by Disbursal Period','Active Loans by Disbursal Period','READ',0),(268,'report','READ_Active Loans in last installment','Active Loans in last installment','READ',0),(269,'report','READ_Active Loans in last installment Summary','Active Loans in last installment Summary','READ',0),(270,'report','READ_Active Loans Passed Final Maturity','Active Loans Passed Final Maturity','READ',0),(271,'report','READ_Active Loans Passed Final Maturity Summary','Active Loans Passed Final Maturity Summary','READ',0),(272,'report','READ_Aging Detail','Aging Detail','READ',0),(273,'report','READ_Aging Summary (Arrears in Months)','Aging Summary (Arrears in Months)','READ',0),(274,'report','READ_Aging Summary (Arrears in Weeks)','Aging Summary (Arrears in Weeks)','READ',0),(275,'report','READ_Balance Sheet','Balance Sheet','READ',0),(276,'report','READ_Branch Expected Cash Flow','Branch Expected Cash Flow','READ',0),(277,'report','READ_Client Listing','Client Listing','READ',0),(278,'report','READ_Client Loans Listing','Client Loans Listing','READ',0),(279,'report','READ_Expected Payments By Date - Basic','Expected Payments By Date - Basic','READ',0),(280,'report','READ_Expected Payments By Date - Formatted','Expected Payments By Date - Formatted','READ',0),(281,'report','READ_Funds Disbursed Between Dates Summary','Funds Disbursed Between Dates Summary','READ',0),(282,'report','READ_Funds Disbursed Between Dates Summary by Office','Funds Disbursed Between Dates Summary by Office','READ',0),(283,'report','READ_Income Statement','Income Statement','READ',0),(284,'report','READ_Loan Account Schedule','Loan Account Schedule','READ',0),(285,'report','READ_Loans Awaiting Disbursal','Loans Awaiting Disbursal','READ',0),(286,'report','READ_Loans Awaiting Disbursal Summary','Loans Awaiting Disbursal Summary','READ',0),(287,'report','READ_Loans Awaiting Disbursal Summary by Month','Loans Awaiting Disbursal Summary by Month','READ',0),(288,'report','READ_Loans Pending Approval','Loans Pending Approval','READ',0),(289,'report','READ_Obligation Met Loans Details','Obligation Met Loans Details','READ',0),(290,'report','READ_Obligation Met Loans Summary','Obligation Met Loans Summary','READ',0),(291,'report','READ_Portfolio at Risk','Portfolio at Risk','READ',0),(292,'report','READ_Portfolio at Risk by Branch','Portfolio at Risk by Branch','READ',0),(293,'report','READ_Rescheduled Loans','Rescheduled Loans','READ',0),(294,'report','READ_Trial Balance','Trial Balance','READ',0),(295,'report','READ_Written-Off Loans','Written-Off Loans','READ',0),(296,'transaction_savings','POSTINTEREST_SAVINGSACCOUNT','SAVINGSACCOUNT','POSTINTEREST',1),(297,'transaction_savings','POSTINTEREST_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','POSTINTEREST_CHECKER',0),(298,'portfolio_center','READ_CENTER','CENTER','READ',0),(299,'portfolio_center','CREATE_CENTER','CENTER','CREATE',0),(300,'portfolio_center','CREATE_CENTER_CHECKER','CENTER','CREATE_CHECKER',0),(301,'portfolio_center','UPDATE_CENTER','CENTER','UPDATE',0),(302,'portfolio_center','UPDATE_CENTER_CHECKER','CENTER','UPDATE_CHECKER',0),(303,'portfolio_center','DELETE_CENTER','CENTER','DELETE',0),(304,'portfolio_center','DELETE_CENTER_CHECKER','CENTER','DELETE_CHECKER',0),(305,'configuration','READ_REPORT','REPORT','READ',0),(306,'configuration','CREATE_REPORT','REPORT','CREATE',0),(307,'configuration','CREATE_REPORT_CHECKER','REPORT','CREATE_CHECKER',0),(308,'configuration','UPDATE_REPORT','REPORT','UPDATE',0),(309,'configuration','UPDATE_REPORT_CHECKER','REPORT','UPDATE_CHECKER',0),(310,'configuration','DELETE_REPORT','REPORT','DELETE',0),(311,'configuration','DELETE_REPORT_CHECKER','REPORT','DELETE_CHECKER',0),(312,'portfolio','ACTIVATE_CLIENT','CLIENT','ACTIVATE',1),(313,'portfolio','ACTIVATE_CLIENT_CHECKER','CLIENT','ACTIVATE_CHECKER',0),(314,'portfolio_center','ACTIVATE_CENTER','CENTER','ACTIVATE',1),(315,'portfolio_center','ACTIVATE_CENTER_CHECKER','CENTER','ACTIVATE_CHECKER',0),(316,'portfolio_group','ACTIVATE_GROUP','GROUP','ACTIVATE',1),(317,'portfolio_group','ACTIVATE_GROUP_CHECKER','GROUP','ACTIVATE_CHECKER',0),(318,'portfolio_group','ASSOCIATECLIENTS_GROUP','GROUP','ASSOCIATECLIENTS',0),(319,'portfolio_group','DISASSOCIATECLIENTS_GROUP','GROUP','DISASSOCIATECLIENTS',0),(320,'portfolio_group','SAVECOLLECTIONSHEET_GROUP','GROUP','SAVECOLLECTIONSHEET',0),(321,'portfolio_center','SAVECOLLECTIONSHEET_CENTER','CENTER','SAVECOLLECTIONSHEET',0),(323,'accounting','DELETE_ACCOUNTINGRULE','ACCOUNTINGRULE','DELETE',0),(324,'accounting','CREATE_ACCOUNTINGRULE','ACCOUNTINGRULE','CREATE',0),(325,'accounting','UPDATE_ACCOUNTINGRULE','ACCOUNTINGRULE','UPDATE',0),(326,'report','READ_GroupSummaryCounts','GroupSummaryCounts','READ',0),(327,'report','READ_GroupSummaryAmounts','GroupSummaryAmounts','READ',0),(328,'configuration','CREATE_DATATABLE','DATATABLE','CREATE',0),(329,'configuration','CREATE_DATATABLE_CHECKER','DATATABLE','CREATE_CHECKER',0),(330,'configuration','UPDATE_DATATABLE','DATATABLE','UPDATE',0),(331,'configuration','UPDATE_DATATABLE_CHECKER','DATATABLE','UPDATE_CHECKER',0),(332,'configuration','DELETE_DATATABLE','DATATABLE','DELETE',0),(333,'configuration','DELETE_DATATABLE_CHECKER','DATATABLE','DELETE_CHECKER',0),(334,'organisation','CREATE_HOLIDAY','HOLIDAY','CREATE',0),(335,'portfolio_group','ASSIGNROLE_GROUP','GROUP','ASSIGNROLE',0),(336,'portfolio_group','UNASSIGNROLE_GROUP','GROUP','UNASSIGNROLE',0),(337,'portfolio_group','UPDATEROLE_GROUP','GROUP','UPDATEROLE',0),(346,'report','READ_TxnRunningBalances','TxnRunningBalances','READ',0),(347,'portfolio','UNASSIGNSTAFF_CLIENT','CLIENT','UNASSIGNSTAFF',0),(348,'portfolio','ASSIGNSTAFF_CLIENT','CLIENT','ASSIGNSTAFF',0),(349,'portfolio','CLOSE_CLIENT','CLIENT','CLOSE',1),(350,'report','READ_FieldAgentStats','FieldAgentStats','READ',0),(351,'report','READ_FieldAgentPrograms','FieldAgentPrograms','READ',0),(352,'report','READ_ProgramDetails','ProgramDetails','READ',0),(353,'report','READ_ChildrenStaffList','ChildrenStaffList','READ',0),(354,'report','READ_CoordinatorStats','CoordinatorStats','READ',0),(355,'report','READ_BranchManagerStats','BranchManagerStats','READ',0),(356,'report','READ_ProgramDirectorStats','ProgramDirectorStats','READ',0),(357,'report','READ_ProgramStats','ProgramStats','READ',0),(358,'transaction_savings','APPROVE_SAVINGSACCOUNT','SAVINGSACCOUNT','APPROVE',1),(359,'transaction_savings','REJECT_SAVINGSACCOUNT','SAVINGSACCOUNT','REJECT',1),(360,'transaction_savings','WITHDRAW_SAVINGSACCOUNT','SAVINGSACCOUNT','WITHDRAW',1),(361,'transaction_savings','APPROVALUNDO_SAVINGSACCOUNT','SAVINGSACCOUNT','APPROVALUNDO',1),(362,'transaction_savings','CLOSE_SAVINGSACCOUNT','SAVINGSACCOUNT','CLOSE',1),(363,'transaction_savings','APPROVE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','APPROVE_CHECKER',0),(364,'transaction_savings','REJECT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','REJECT_CHECKER',0),(365,'transaction_savings','WITHDRAW_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','WITHDRAW_CHECKER',0),(366,'transaction_savings','APPROVALUNDO_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','APPROVALUNDO_CHECKER',0),(367,'transaction_savings','CLOSE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','CLOSE_CHECKER',0),(368,'transaction_savings','UNDOTRANSACTION_SAVINGSACCOUNT','SAVINGSACCOUNT','UNDOTRANSACTION',1),(369,'transaction_savings','UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UNDOTRANSACTION_CHECKER',0),(370,'portfolio','CREATE_PRODUCTMIX','PRODUCTMIX','CREATE',0),(371,'portfolio','UPDATE_PRODUCTMIX','PRODUCTMIX','UPDATE',0),(372,'portfolio','DELETE_PRODUCTMIX','PRODUCTMIX','DELETE',0),(373,'jobs','UPDATE_SCHEDULER','SCHEDULER','UPDATE',0),(374,'transaction_savings','APPLYANNUALFEE_SAVINGSACCOUNT','SAVINGSACCOUNT','APPLYANNUALFEE',1),(375,'transaction_savings','APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','APPLYANNUALFEE_CHECKER',0),(376,'portfolio_group','ASSIGNSTAFF_GROUP','GROUP','ASSIGNSTAFF',0),(377,'transaction_savings','READ_ACCOUNTTRANSFER','ACCOUNTTRANSFER','READ',0),(378,'transaction_savings','CREATE_ACCOUNTTRANSFER','ACCOUNTTRANSFER','CREATE',1),(379,'transaction_savings','CREATE_ACCOUNTTRANSFER_CHECKER','ACCOUNTTRANSFER','CREATE_CHECKER',0),(380,'transaction_savings','ADJUSTTRANSACTION_SAVINGSACCOUNT','SAVINGSACCOUNT','ADJUSTTRANSACTION',0),(381,'portfolio','CREATE_MEETING','MEETING','CREATE',0),(382,'portfolio','UPDATE_MEETING','MEETING','UPDATE',0),(383,'portfolio','DELETE_MEETING','MEETING','DELETE',0),(384,'portfolio','SAVEORUPDATEATTENDANCE_MEETING','MEETING','SAVEORUPDATEATTENDANCE',0),(385,'portfolio_group','TRANSFERCLIENTS_GROUP','GROUP','TRANSFERCLIENTS',0),(386,'portfolio_group','TRANSFERCLIENTS_GROUP_CHECKER','GROUP','TRANSFERCLIENTS_CHECKER',0),(389,'portfolio','PROPOSETRANSFER_CLIENT','CLIENT','PROPOSETRANSFER',0),(390,'portfolio','PROPOSETRANSFER_CLIENT_CHECKER','CLIENT','PROPOSETRANSFER_CHECKER',0),(391,'portfolio','ACCEPTTRANSFER_CLIENT','CLIENT','ACCEPTTRANSFER',0),(392,'portfolio','ACCEPTTRANSFER_CLIENT_CHECKER','CLIENT','ACCEPTTRANSFER_CHECKER',0),(393,'portfolio','REJECTTRANSFER_CLIENT','CLIENT','REJECTTRANSFER',0),(394,'portfolio','REJECTTRANSFER_CLIENT_CHECKER','CLIENT','REJECTTRANSFER_CHECKER',0),(395,'portfolio','WITHDRAWTRANSFER_CLIENT','CLIENT','WITHDRAWTRANSFER',0),(396,'portfolio','WITHDRAWTRANSFER_CLIENT_CHECKER','CLIENT','WITHDRAWTRANSFER_CHECKER',0),(397,'portfolio','CLOSE_GROUP','GROUP','CLOSE',1),(398,'portfolio','CLOSE_CENTER','CENTER','CLOSE',1),(399,'xbrlmapping','UPDATE_XBRLMAPPING','XBRLMAPPING','UPDATE',0),(400,'configuration','READ_CACHE','CACHE','READ',0),(401,'configuration','UPDATE_CACHE','CACHE','UPDATE',0),(402,'transaction_loan','PAY_LOANCHARGE','LOANCHARGE','PAY',0),(403,'portfolio','CREATE_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','CREATE',0),(404,'portfolio','CREATE_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','CREATE_CHECKER',0),(405,'portfolio','UPDATE_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','UPDATE',0),(406,'portfolio','UPDATE_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','UPDATE_CHECKER',0),(407,'portfolio','DELETE_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','DELETE',0),(408,'portfolio','DELETE_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','DELETE_CHECKER',0),(409,'portfolio','WAIVE_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','WAIVE',0),(410,'portfolio','WAIVE_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','WAIVE_CHECKER',0),(411,'portfolio','PAY_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','PAY',0),(412,'portfolio','PAY_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','PAY_CHECKER',0),(413,'portfolio','PROPOSEANDACCEPTTRANSFER_CLIENT','CLIENT','PROPOSEANDACCEPTTRANSFER',0),(414,'portfolio','PROPOSEANDACCEPTTRANSFER_CLIENT_CHECKER','CLIENT','PROPOSEANDACCEPTTRANSFER_CHECKER',0),(415,'organisation','DELETE_TEMPLATE','TEMPLATE','DELETE',0),(416,'organisation','CREATE_TEMPLATE','TEMPLATE','CREATE',0),(417,'organisation','UPDATE_TEMPLATE','TEMPLATE','UPDATE',0),(418,'organisation','READ_TEMPLATE','TEMPLATE','READ',0),(419,'accounting','UPDATERUNNINGBALANCE_JOURNALENTRY','JOURNALENTRY','UPDATERUNNINGBALANCE',0),(420,'organisation','READ_SMS','SMS','READ',0),(421,'organisation','CREATE_SMS','SMS','CREATE',0),(422,'organisation','CREATE_SMS_CHECKER','SMS','CREATE_CHECKER',0),(423,'organisation','UPDATE_SMS','SMS','UPDATE',0),(424,'organisation','UPDATE_SMS_CHECKER','SMS','UPDATE_CHECKER',0),(425,'organisation','DELETE_SMS','SMS','DELETE',0),(426,'organisation','DELETE_SMS_CHECKER','SMS','DELETE_CHECKER',0),(427,'organisation','CREATE_HOLIDAY_CHECKER','HOLIDAY','CREATE_CHECKER',0),(428,'organisation','ACTIVATE_HOLIDAY','HOLIDAY','ACTIVATE',0),(429,'organisation','ACTIVATE_HOLIDAY_CHECKER','HOLIDAY','ACTIVATE_CHECKER',0),(430,'organisation','UPDATE_HOLIDAY','HOLIDAY','UPDATE',0),(431,'organisation','UPDATE_HOLIDAY_CHECKER','HOLIDAY','UPDATE_CHECKER',0),(432,'organisation','DELETE_HOLIDAY','HOLIDAY','DELETE',0),(433,'organisation','DELETE_HOLIDAY_CHECKER','HOLIDAY','DELETE_CHECKER',0),(434,'transaction_loan','UNDOWRITEOFF_LOAN','LOAN','UNDOWRITEOFF',0),(435,'portfolio','READ_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','READ',0),(436,'accounting','CREATE_JOURNALENTRY_CHECKER','JOURNALENTRY','CREATE_CHECKER',0),(437,'portfolio','UPDATE_DISBURSEMENTDETAIL','DISBURSEMENTDETAIL','UPDATE',0),(438,'portfolio','UPDATESAVINGSACCOUNT_CLIENT','CLIENT','UPDATESAVINGSACCOUNT',0),(439,'accounting','READ_ACCOUNTINGRULE','ACCOUNTINGRULE','READ',0),(440,'accounting','READ_JOURNALENTRY','JOURNALENTRY','READ',0),(441,'accounting','READ_GLACCOUNT','GLACCOUNT','READ',0),(442,'accounting','READ_GLCLOSURE','GLCLOSURE','READ',0),(443,'organisation','READ_HOLIDAY','HOLIDAY','READ',0),(444,'jobs','READ_SCHEDULER','SCHEDULER','READ',0),(445,'portfolio','READ_PRODUCTMIX','PRODUCTMIX','READ',0),(446,'portfolio','READ_MEETING','MEETING','READ',0),(447,'jobs','EXECUTEJOB_SCHEDULER','SCHEDULER','EXECUTEJOB',0),(448,'account_transfer','READ_STANDINGINSTRUCTION ','STANDINGINSTRUCTION ','READ',0),(449,'account_transfer','CREATE_STANDINGINSTRUCTION ','STANDINGINSTRUCTION ','CREATE',0),(450,'account_transfer','UPDATE_STANDINGINSTRUCTION ','STANDINGINSTRUCTION ','UPDATE',0),(451,'account_transfer','DELETE_STANDINGINSTRUCTION ','STANDINGINSTRUCTION ','DELETE',0),(452,'portfolio','CREATE_INTERESTRATECHART','INTERESTRATECHART','CREATE',0),(453,'portfolio','CREATE_INTERESTRATECHART_CHECKER','INTERESTRATECHART','CREATE_CHECKER',0),(454,'portfolio','UPDATE_INTERESTRATECHART','INTERESTRATECHART','UPDATE',0),(455,'portfolio','DELETE_INTERESTRATECHART','INTERESTRATECHART','DELETE',0),(456,'portfolio','UPDATE_INTERESTRATECHART_CHECKER','INTERESTRATECHART','UPDATE_CHECKER',0),(457,'portfolio','DELETE_INTERESTRATECHART_CHECKER','INTERESTRATECHART','DELETE_CHECKER',0),(458,'portfolio','CREATE_CHARTSLAB','CHARTSLAB','CREATE',0),(459,'portfolio','CREATE_CHARTSLAB_CHECKER','CHARTSLAB','CREATE_CHECKER',0),(460,'portfolio','UPDATE_CHARTSLAB','CHARTSLAB','UPDATE',0),(461,'portfolio','DELETE_CHARTSLAB','CHARTSLAB','DELETE',0),(462,'portfolio','UPDATE_CHARTSLAB_CHECKER','CHARTSLAB','UPDATE_CHECKER',0),(463,'portfolio','DELETE_CHARTSLAB_CHECKER','CHARTSLAB','DELETE_CHECKER',0),(464,'portfolio','CREATE_FIXEDDEPOSITPRODUCT','FIXEDDEPOSITPRODUCT','CREATE',0),(465,'portfolio','CREATE_FIXEDDEPOSITPRODUCT_CHECKER','FIXEDDEPOSITPRODUCT','CREATE_CHECKER',0),(466,'portfolio','UPDATE_FIXEDDEPOSITPRODUCT','FIXEDDEPOSITPRODUCT','UPDATE',0),(467,'portfolio','DELETE_FIXEDDEPOSITPRODUCT','FIXEDDEPOSITPRODUCT','DELETE',0),(468,'portfolio','UPDATE_FIXEDDEPOSITPRODUCT_CHECKER','FIXEDDEPOSITPRODUCT','UPDATE_CHECKER',0),(469,'portfolio','DELETE_FIXEDDEPOSITPRODUCT_CHECKER','FIXEDDEPOSITPRODUCT','DELETE_CHECKER',0),(470,'portfolio','CREATE_RECURRINGDEPOSITPRODUCT','RECURRINGDEPOSITPRODUCT','CREATE',0),(471,'portfolio','CREATE_RECURRINGDEPOSITPRODUCT_CHECKER','RECURRINGDEPOSITPRODUCT','CREATE_CHECKER',0),(472,'portfolio','UPDATE_RECURRINGDEPOSITPRODUCT','RECURRINGDEPOSITPRODUCT','UPDATE',0),(473,'portfolio','DELETE_RECURRINGDEPOSITPRODUCT','RECURRINGDEPOSITPRODUCT','DELETE',0),(474,'portfolio','UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER','RECURRINGDEPOSITPRODUCT','UPDATE_CHECKER',0),(475,'portfolio','DELETE_RECURRINGDEPOSITPRODUCT_CHECKER','RECURRINGDEPOSITPRODUCT','DELETE_CHECKER',0),(476,'portfolio','READ_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','READ',0),(477,'portfolio','CREATE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','CREATE',0),(478,'portfolio','CREATE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','CREATE_CHECKER',0),(479,'portfolio','UPDATE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','UPDATE',0),(480,'portfolio','UPDATE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','UPDATE_CHECKER',0),(481,'portfolio','DELETE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','DELETE',0),(482,'portfolio','DELETE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','DELETE_CHECKER',0),(483,'transaction_savings','DEPOSIT_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','DEPOSIT',0),(484,'transaction_savings','DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','DEPOSIT_CHECKER',0),(485,'transaction_savings','WITHDRAWAL_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','WITHDRAWAL',0),(486,'transaction_savings','WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','WITHDRAWAL_CHECKER',0),(487,'transaction_savings','ACTIVATE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','ACTIVATE',0),(488,'transaction_savings','ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','ACTIVATE_CHECKER',0),(489,'transaction_savings','CALCULATEINTEREST_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','CALCULATEINTEREST',0),(490,'transaction_savings','CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','CALCULATEINTEREST_CHECKER',0),(491,'transaction_savings','POSTINTEREST_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','POSTINTEREST',1),(492,'transaction_savings','POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','POSTINTEREST_CHECKER',0),(493,'transaction_savings','APPROVE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','APPROVE',1),(494,'transaction_savings','REJECT_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','REJECT',1),(495,'transaction_savings','WITHDRAW_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','WITHDRAW',1),(496,'transaction_savings','APPROVALUNDO_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','APPROVALUNDO',1),(497,'transaction_savings','CLOSE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','CLOSE',1),(498,'transaction_savings','APPROVE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','APPROVE_CHECKER',0),(499,'transaction_savings','REJECT_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','REJECT_CHECKER',0),(500,'transaction_savings','WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','WITHDRAW_CHECKER',0),(501,'transaction_savings','APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','APPROVALUNDO_CHECKER',0),(502,'transaction_savings','CLOSE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','CLOSE_CHECKER',0),(503,'transaction_savings','UNDOTRANSACTION_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','UNDOTRANSACTION',1),(504,'transaction_savings','UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','UNDOTRANSACTION_CHECKER',0),(505,'transaction_savings','ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','ADJUSTTRANSACTION',0),(506,'portfolio','READ_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','READ',0),(507,'portfolio','CREATE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','CREATE',0),(508,'portfolio','CREATE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','CREATE_CHECKER',0),(509,'portfolio','UPDATE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','UPDATE',0),(510,'portfolio','UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','UPDATE_CHECKER',0),(511,'portfolio','DELETE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','DELETE',0),(512,'portfolio','DELETE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','DELETE_CHECKER',0),(513,'transaction_savings','DEPOSIT_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','DEPOSIT',0),(514,'transaction_savings','DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','DEPOSIT_CHECKER',0),(515,'transaction_savings','WITHDRAWAL_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','WITHDRAWAL',0),(516,'transaction_savings','WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','WITHDRAWAL_CHECKER',0),(517,'transaction_savings','ACTIVATE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','ACTIVATE',0),(518,'transaction_savings','ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','ACTIVATE_CHECKER',0),(519,'transaction_savings','CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','CALCULATEINTEREST',0),(520,'transaction_savings','CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','CALCULATEINTEREST_CHECKER',0),(521,'transaction_savings','POSTINTEREST_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','POSTINTEREST',1),(522,'transaction_savings','POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','POSTINTEREST_CHECKER',0),(523,'transaction_savings','APPROVE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','APPROVE',1),(524,'transaction_savings','REJECT_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','REJECT',1),(525,'transaction_savings','WITHDRAW_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','WITHDRAW',1),(526,'transaction_savings','APPROVALUNDO_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','APPROVALUNDO',1),(527,'transaction_savings','CLOSE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','CLOSE',1),(528,'transaction_savings','APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','APPROVE_CHECKER',0),(529,'transaction_savings','REJECT_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','REJECT_CHECKER',0),(530,'transaction_savings','WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','WITHDRAW_CHECKER',0),(531,'transaction_savings','APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','APPROVALUNDO_CHECKER',0),(532,'transaction_savings','CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','CLOSE_CHECKER',0),(533,'transaction_savings','UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','UNDOTRANSACTION',1),(534,'transaction_savings','UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','UNDOTRANSACTION_CHECKER',0),(535,'transaction_savings','ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','ADJUSTTRANSACTION',0),(536,'transaction_savings','PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER','FIXEDDEPOSITACCOUNT','PREMATURECLOSE_CHECKER',0),(537,'transaction_savings','PREMATURECLOSE_FIXEDDEPOSITACCOUNT','FIXEDDEPOSITACCOUNT','PREMATURECLOSE',1),(538,'transaction_savings','PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','PREMATURECLOSE_CHECKER',0),(539,'transaction_savings','PREMATURECLOSE_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','PREMATURECLOSE',1),(540,'transaction_loan','DISBURSETOSAVINGS_LOAN','LOAN','DISBURSETOSAVINGS',0),(541,'transaction_loan','RECOVERYPAYMENT_LOAN','LOAN','RECOVERYPAYMENT',0),(542,'organisation','READ_RECURRINGDEPOSITPRODUCT','RECURRINGDEPOSITPRODUCT','READ',0),(543,'organisation','READ_FIXEDDEPOSITPRODUCT','FIXEDDEPOSITPRODUCT','READ',0),(544,'accounting','READ_FINANCIALACTIVITYACCOUNT','FINANCIALACTIVITYACCOUNT','READ',0),(545,'accounting','CREATE_FINANCIALACTIVITYACCOUNT','FINANCIALACTIVITYACCOUNT','CREATE',0),(546,'accounting','DELETE_FINANCIALACTIVITYACCOUNT','FINANCIALACTIVITYACCOUNT','DELETE',0),(547,'accounting','UPDATE_FINANCIALACTIVITYACCOUNT','FINANCIALACTIVITYACCOUNT','UPDATE',0),(548,'datatable','UPDATE_LIKELIHOOD','likelihood','UPDATE',0),(549,'survey','REGISTER_SURVEY','survey','CREATE',0),(550,'accounting','EXECUTE_PERIODICACCRUALACCOUNTING','PERIODICACCRUALACCOUNTING','EXECUTE',0),(551,'portfolio','INACTIVATE_SAVINGSACCOUNTCHARGE','SAVINGSACCOUNTCHARGE','INACTIVATE',0),(552,'portfolio','INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER','SAVINGSACCOUNTCHARGE','INACTIVATE_CHECKER',0),(553,'portfolio_center','DISASSOCIATEGROUPS_CENTER','CENTER','DISASSOCIATEGROUPS',0),(554,'portfolio_center','ASSOCIATEGROUPS_CENTER','CENTER','ASSOCIATEGROUPS',0),(555,'portfolio_center','DISASSOCIATEGROUPS_CENTER_CHECKER','CENTER','DISASSOCIATEGROUPS_CHECKER',0),(556,'portfolio_center','ASSOCIATEGROUPS_CENTER_CHECKER','CENTER','ASSOCIATEGROUPS_CHECKER',0),(557,'loan_reschedule','READ_RESCHEDULELOAN','RESCHEDULELOAN','READ',0),(558,'loan_reschedule','CREATE_RESCHEDULELOAN','RESCHEDULELOAN','CREATE',0),(559,'loan_reschedule','REJECT_RESCHEDULELOAN','RESCHEDULELOAN','REJECT',0),(560,'loan_reschedule','APPROVE_RESCHEDULELOAN','RESCHEDULELOAN','APPROVE',0),(561,'configuration','CREATE_HOOK','HOOK','CREATE',0),(562,'configuration','READ_HOOK','HOOK','READ',0),(563,'configuration','UPDATE_HOOK','HOOK','UPDATE',0),(564,'configuration','DELETE_HOOK','HOOK','DELETE',0),(565,'portfolio','REMOVESAVINGSOFFICER_SAVINGSACCOUNT','SAVINGSACCOUNT','REMOVESAVINGSOFFICER',1),(566,'portfolio','UPDATESAVINGSOFFICER_SAVINGSACCOUNT','SAVINGSACCOUNT','UPDATESAVINGSOFFICER',1),(567,'report','READ_Active Loans - Summary(Pentaho)','Active Loans - Summary(Pentaho)','READ',0),(568,'report','READ_Active Loans by Disbursal Period(Pentaho)','Active Loans by Disbursal Period(Pentaho)','READ',0),(569,'report','READ_Active Loans in last installment Summary(Pentaho)','Active Loans in last installment Summary(Pentaho)','READ',0),(570,'report','READ_Active Loans in last installment(Pentaho)','Active Loans in last installment(Pentaho)','READ',0),(571,'report','READ_Active Loans Passed Final Maturity Summary(Pentaho)','Active Loans Passed Final Maturity Summary(Pentaho)','READ',0),(572,'report','READ_Active Loans Passed Final Maturity(Pentaho)','Active Loans Passed Final Maturity(Pentaho)','READ',0),(573,'report','READ_Aging Detail(Pentaho)','Aging Detail(Pentaho)','READ',0),(574,'report','READ_Aging Summary (Arrears in Months)(Pentaho)','Aging Summary (Arrears in Months)(Pentaho)','READ',0),(575,'report','READ_Aging Summary (Arrears in Weeks)(Pentaho)','Aging Summary (Arrears in Weeks)(Pentaho)','READ',0),(576,'report','READ_Client Listing(Pentaho)','Client Listing(Pentaho)','READ',0),(577,'report','READ_Client Loan Account Schedule','Client Loan Account Schedule','READ',0),(578,'report','READ_Client Loans Listing(Pentaho)','Client Loans Listing(Pentaho)','READ',0),(579,'report','READ_Client Saving Transactions','Client Saving Transactions','READ',0),(580,'report','READ_Client Savings Summary','Client Savings Summary','READ',0),(581,'report','READ_ClientSummary ','ClientSummary ','READ',0),(582,'report','READ_ClientTrendsByDay','ClientTrendsByDay','READ',0),(583,'report','READ_ClientTrendsByMonth','ClientTrendsByMonth','READ',0),(584,'report','READ_ClientTrendsByWeek','ClientTrendsByWeek','READ',0),(585,'report','READ_Demand_Vs_Collection','Demand_Vs_Collection','READ',0),(586,'report','READ_Disbursal_Vs_Awaitingdisbursal','Disbursal_Vs_Awaitingdisbursal','READ',0),(587,'report','READ_Expected Payments By Date - Basic(Pentaho)','Expected Payments By Date - Basic(Pentaho)','READ',0),(588,'report','READ_Funds Disbursed Between Dates Summary by Office(Pentaho)','Funds Disbursed Between Dates Summary by Office(Pentaho)','READ',0),(589,'report','READ_Funds Disbursed Between Dates Summary(Pentaho)','Funds Disbursed Between Dates Summary(Pentaho)','READ',0),(590,'report','READ_GroupNamesByStaff','GroupNamesByStaff','READ',0),(591,'report','READ_GroupSavingSummary','GroupSavingSummary','READ',0),(592,'report','READ_LoanCyclePerProduct','LoanCyclePerProduct','READ',0),(593,'report','READ_Loans Awaiting Disbursal Summary by Month(Pentaho)','Loans Awaiting Disbursal Summary by Month(Pentaho)','READ',0),(594,'report','READ_Loans Awaiting Disbursal Summary(Pentaho)','Loans Awaiting Disbursal Summary(Pentaho)','READ',0),(595,'report','READ_Loans Awaiting Disbursal(Pentaho)','Loans Awaiting Disbursal(Pentaho)','READ',0),(596,'report','READ_Loans Pending Approval(Pentaho)','Loans Pending Approval(Pentaho)','READ',0),(597,'report','READ_LoanTrendsByDay','LoanTrendsByDay','READ',0),(598,'report','READ_LoanTrendsByMonth','LoanTrendsByMonth','READ',0),(599,'report','READ_LoanTrendsByWeek','LoanTrendsByWeek','READ',0),(600,'report','READ_Obligation Met Loans Details(Pentaho)','Obligation Met Loans Details(Pentaho)','READ',0),(601,'report','READ_Obligation Met Loans Summary(Pentaho)','Obligation Met Loans Summary(Pentaho)','READ',0),(602,'report','READ_Portfolio at Risk by Branch(Pentaho)','Portfolio at Risk by Branch(Pentaho)','READ',0),(603,'report','READ_Portfolio at Risk(Pentaho)','Portfolio at Risk(Pentaho)','READ',0),(604,'report','READ_Rescheduled Loans(Pentaho)','Rescheduled Loans(Pentaho)','READ',0),(605,'report','READ_Savings Transactions','Savings Transactions','READ',0),(606,'report','READ_TxnRunningBalances(Pentaho)','TxnRunningBalances(Pentaho)','READ',0),(607,'report','READ_Written-Off Loans(Pentaho)','Written-Off Loans(Pentaho)','READ',0),(608,'configuration','CREATE_ACCOUNTNUMBERFORMAT','ACCOUNTNUMBERFORMAT','CREATE',0),(609,'configuration','READ_ACCOUNTNUMBERFORMAT','ACCOUNTNUMBERFORMAT','READ',0),(610,'configuration','UPDATE_ACCOUNTNUMBERFORMAT','ACCOUNTNUMBERFORMAT','UPDATE',0),(611,'configuration','DELETE_ACCOUNTNUMBERFORMAT','HOOK','DELETE',0),(612,'portfolio','RECOVERGUARANTEES_LOAN','LOAN','RECOVERGUARANTEES',0),(613,'portfolio','RECOVERGUARANTEES_LOAN_CHECKER','LOAN','RECOVERGUARANTEES_CHECKER',0),(614,'portfolio','REJECT_CLIENT','CLIENT','REJECT',1),(615,'portfolio','REJECT_CLIENT_CHECKER','CLIENT','REJECT_CHECKER',0),(616,'portfolio','WITHDRAW_CLIENT','CLIENT','WITHDRAW',1),(617,'portfolio','WITHDRAW_CLIENT_CHECKER','CLIENT','WITHDRAW_CHECKER',0),(618,'portfolio','REACTIVATE_CLIENT','CLIENT','REACTIVATE',1),(619,'portfolio','REACTIVATE_CLIENT_CHECKER','CLIENT','REACTIVATE_CHECKER',0),(620,'transaction_savings','UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT','RECURRINGDEPOSITACCOUNT','UPDATEDEPOSITAMOUNT',1),(621,'transaction_savings','UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER','RECURRINGDEPOSITACCOUNT','UPDATEDEPOSITAMOUNT',1),(622,'transaction_savings','REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER','ACCOUNTTRANSFER','REFUNDBYTRANSFER',0),(623,'transaction_savings','REFUNDBYTRANSFER_ACCOUNTTRANSFER','ACCOUNTTRANSFER','REFUNDBYTRANSFER',1),(624,'transaction_loan','REFUNDBYCASH_LOAN','LOAN','REFUNDBYCASH',1),(625,'transaction_loan','REFUNDBYCASH_LOAN_CHECKER','LOAN','REFUNDBYCASH',0),(626,'cash_mgmt','CREATE_TELLER','TELLER','CREATE',1),(627,'cash_mgmt','UPDATE_TELLER','TELLER','UPDATE',1),(628,'cash_mgmt','ALLOCATECASHIER_TELLER','TELLER','ALLOCATE',1),(629,'cash_mgmt','UPDATECASHIERALLOCATION_TELLER','TELLER','UPDATECASHIERALLOCATION',1),(630,'cash_mgmt','DELETECASHIERALLOCATION_TELLER','TELLER','DELETECASHIERALLOCATION',1),(631,'cash_mgmt','ALLOCATECASHTOCASHIER_TELLER','TELLER','ALLOCATECASHTOCASHIER',1),(632,'cash_mgmt','SETTLECASHFROMCASHIER_TELLER','TELLER','SETTLECASHFROMCASHIER',1),(633,'authorisation','DISABLE_ROLE','ROLE','DISABLE',0),(634,'authorisation','DISABLE_ROLE_CHECKER','ROLE','DISABLE_CHECKER',0),(635,'authorisation','ENABLE_ROLE','ROLE','ENABLE',0),(636,'authorisation','ENABLE_ROLE_CHECKER','ROLE','ENABLE_CHECKER',0),(637,'accounting','DEFINEOPENINGBALANCE_JOURNALENTRY','JOURNALENTRY','DEFINEOPENINGBALANCE',1),(638,'collection_sheet','READ_COLLECTIONSHEET','COLLECTIONSHEET','READ',0),(639,'collection_sheet','SAVE_COLLECTIONSHEET','COLLECTIONSHEET','SAVE',0),(640,'infrastructure','CREATE_ENTITYMAPPING','ENTITYMAPPING','CREATE',0),(641,'infrastructure','UPDATE_ENTITYMAPPING','ENTITYMAPPING','UPDATE',0),(642,'infrastructure','DELETE_ENTITYMAPPING','ENTITYMAPPING','DELETE',0),(643,'organisation','READ_WORKINGDAYS','WORKINGDAYS','READ',0),(644,'organisation','UPDATE_WORKINGDAYS','WORKINGDAYS','UPDATE',0),(645,'organisation','UPDATE_WORKINGDAYS_CHECKER','WORKINGDAYS','UPDATE_CHECKER',0),(646,'authorisation','READ_PASSWORD_PREFERENCES','PASSWORD_PREFERENCES','READ',0),(647,'authorisation','UPDATE_PASSWORD_PREFERENCES','PASSWORD_PREFERENCES','UPDATE',0),(648,'authorisation','UPDATE_PASSWORD_PREFERENCES_CHECKER','PASSWORD_PREFERENCES','UPDATE_CHECKER',0),(649,'portfolio','CREATE_PAYMENTTYPE','PAYMENTTYPE','CREATE',0),(650,'portfolio','UPDATE_PAYMENTTYPE','PAYMENTTYPE','UPDATE',0),(651,'portfolio','DELETE_PAYMENTTYPE','PAYMENTTYPE','DELETE',0),(652,'cash_mgmt','DELETE_TELLER','TELLER','DELETE',1),(653,'report','READ_General Ledger Report','General Ledger Report','READ',0),(654,'portfolio','READ_STAFFIMAGE','STAFFIMAGE','READ',0),(655,'portfolio','CREATE_STAFFIMAGE','STAFFIMAGE','CREATE',1),(656,'portfolio','CREATE_STAFFIMAGE_CHECKER','STAFFIMAGE','CREATE',0),(657,'portfolio','DELETE_STAFFIMAGE','STAFFIMAGE','DELETE',1),(658,'portfolio','DELETE_STAFFIMAGE_CHECKER','STAFFIMAGE','DELETE',0),(659,'report','READ_Active Loan Summary per Branch','Active Loan Summary per Branch','READ',0),(660,'report','READ_Disbursal Report','Disbursal Report','READ',0),(661,'report','READ_Balance Outstanding','Balance Outstanding','READ',0),(662,'report','READ_Collection Report','Collection Report','READ',0),(663,'portfolio','READ_PAYMENTTYPE','PAYMENTTYPE','READ',0),(664,'report','READ_Staff Assignment History','Staff Assignment History(Pentaho)','READ',0),(665,'externalservices','UPDATE_EXTERNALSERVICES','EXTERNALSERVICES','UPDATE',0),(666,'portfolio','READ_CLIENTCHARGE','CLIENTCHARGE','READ',0),(667,'portfolio','CREATE_CLIENTCHARGE','CLIENTCHARGE','CREATE',0),(668,'portfolio','DELETE_CLIENTCHARGE','CLIENTCHARGE','DELETE',0),(669,'portfolio','WAIVE_CLIENTCHARGE','CLIENTCHARGE','WAIVE',0),(670,'portfolio','PAY_CLIENTCHARGE','CLIENTCHARGE','PAY',0),(671,'portfolio','INACTIVATE_CLIENTCHARGE','CLIENTCHARGE','INACTIVATE',0),(672,'portfolio','UPDATE_CLIENTCHARGE','CLIENTCHARGE','UPDATE',0),(673,'portfolio','CREATE_CLIENTCHARGE_CHECKER','CLIENTCHARGE','CREATE_CHECKER',0),(674,'portfolio','DELETE_CLIENTCHARGE_CHECKER','CLIENTCHARGE','DELETE_CHECKER',0),(675,'portfolio','WAIVE_CLIENTCHARGE_CHECKER','CLIENTCHARGE','WAIVE_CHECKER',0),(676,'portfolio','PAY_CLIENTCHARGE_CHECKER','CLIENTCHARGE','PAY_CHECKER',0),(677,'portfolio','INACTIVATE_CLIENTCHARGE_CHECKER','CLIENTCHARGE','INACTIVATE_CHECKER',0),(678,'portfolio','UPDATE_CLIENTCHARGE_CHECKER','CLIENTCHARGE','UPDATE_CHECKER',0),(679,'transaction_client','READTRANSACTION_CLIENT','CLIENT','READTRANSACTION',0),(680,'transaction_client','UNDOTRANSACTION_CLIENT','CLIENT','UNDOTRANSACTION',0),(681,'transaction_client','UNDOTRANSACTION_CLIENT_CHECKER','CLIENT','UNDOTRANSACTION_CHECKER',0),(682,'LOAN_PROVISIONING','CREATE_PROVISIONCATEGORY','PROVISIONCATEGORY','CREATE',0),(683,'LOAN_PROVISIONING','DELETE_PROVISIONCATEGORY','PROVISIONCATEGORY','DELETE',0),(684,'LOAN_PROVISIONING','CREATE_PROVISIONCRITERIA','PROVISIONINGCRITERIA','CREATE',0),(685,'LOAN_PROVISIONING','UPDATE_PROVISIONCRITERIA','PROVISIONINGCRITERIA','UPDATE',0),(686,'LOAN_PROVISIONING','DELETE_PROVISIONCRITERIA','PROVISIONINGCRITERIA','DELETE',0),(687,'LOAN_PROVISIONING','CREATE_PROVISIONENTRIES','PROVISIONINGENTRIES','CREATE',0),(688,'LOAN_PROVISIONING','CREATE_PROVISIONJOURNALENTRIES','PROVISIONINGENTRIES','CREATE',0),(689,'LOAN_PROVISIONING','RECREATE_PROVISIONENTRIES','PROVISIONINGENTRIES','RECREATE',0),(690,'portfolio','READ_FLOATINGRATE','FLOATINGRATE','READ',0),(691,'portfolio','CREATE_FLOATINGRATE','FLOATINGRATE','CREATE',1),(692,'portfolio','CREATE_FLOATINGRATE_CHECKER','FLOATINGRATE','CREATE_CHECKER',0),(693,'portfolio','UPDATE_FLOATINGRATE','FLOATINGRATE','UPDATE',1),(694,'portfolio','UPDATE_FLOATINGRATE_CHECKER','FLOATINGRATE','UPDATE_CHECKER',0),(695,'portfolio','CREATESCHEDULEEXCEPTIONS_LOAN','LOAN','CREATESCHEDULEEXCEPTIONS',0),(696,'portfolio','CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER','LOAN','CREATESCHEDULEEXCEPTIONS_CHECKER',0),(697,'portfolio','DELETESCHEDULEEXCEPTIONS_LOAN','LOAN','DELETESCHEDULEEXCEPTIONS',0),(698,'portfolio','DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER','LOAN','DELETESCHEDULEEXCEPTIONS_CHECKER',0),(699,'transaction_loan','DISBURSALLASTUNDO_LOAN','LOAN','DISBURSALLASTUNDO',0),(700,'transaction_loan','DISBURSALLASTUNDO_LOAN_CHECKER','LOAN','DISBURSALLASTUNDO_CHECKER',0),(701,'SHAREPRODUCT','CREATE_SHAREPRODUCT','SHAREPRODUCT','CREATE',0),(702,'SHAREPRODUCT','UPDATE_SHAREPRODUCT','SHAREPRODUCT','CREATE',0),(703,'SHAREACCOUNT','CREATE_SHAREACCOUNT','SHAREACCOUNT','CREATE',0),(704,'SHAREACCOUNT','UPDATE_SHAREACCOUNT','SHAREACCOUNT','CREATE',0),(705,'organisation','READ_TAXCOMPONENT','TAXCOMPONENT','READ',0),(706,'organisation','CREATE_TAXCOMPONENT','TAXCOMPONENT','CREATE',0),(707,'organisation','CREATE_TAXCOMPONENT_CHECKER','TAXCOMPONENT','CREATE_CHECKER',0),(708,'organisation','UPDATE_TAXCOMPONENT','TAXCOMPONENT','UPDATE',0),(709,'organisation','UPDATE_TAXCOMPONENT_CHECKER','TAXCOMPONENT','UPDATE_CHECKER',0),(710,'organisation','READ_TAXGROUP','TAXGROUP','READ',0),(711,'organisation','CREATE_TAXGROUP','TAXGROUP','CREATE',0),(712,'organisation','CREATE_TAXGROUP_CHECKER','TAXGROUP','CREATE_CHECKER',0),(713,'organisation','UPDATE_TAXGROUP','TAXGROUP','UPDATE',0),(714,'organisation','UPDATE_TAXGROUP_CHECKER','TAXGROUP','UPDATE_CHECKER',0),(715,'portfolio','UPDATEWITHHOLDTAX_SAVINGSACCOUNT','SAVINGSACCOUNT','UPDATEWITHHOLDTAX',0),(716,'portfolio','UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UPDATEWITHHOLDTAX_CHECKER',0),(717,'SHAREPRODUCT','CREATE_DIVIDEND_SHAREPRODUCT','SHAREPRODUCT','CREATE_DIVIDEND',0),(718,'SHAREPRODUCT','CREATE_DIVIDEND_SHAREPRODUCT_CHECKER','SHAREPRODUCT','CREATE_DIVIDEND_CHECKER',0),(719,'SHAREPRODUCT','APPROVE_DIVIDEND_SHAREPRODUCT','SHAREPRODUCT','APPROVE_DIVIDEND',0),(720,'SHAREPRODUCT','APPROVE_DIVIDEND_SHAREPRODUCT_CHECKER','SHAREPRODUCT','APPROVE_DIVIDEND_CHECKER',0),(721,'SHAREPRODUCT','DELETE_DIVIDEND_SHAREPRODUCT','SHAREPRODUCT','DELETE_DIVIDEND',0),(722,'SHAREPRODUCT','DELETE_DIVIDEND_SHAREPRODUCT_CHECKER','SHAREPRODUCT','DELETE_DIVIDEND_CHECKER',0),(723,'SHAREPRODUCT','READ_DIVIDEND_SHAREPRODUCT','SHAREPRODUCT','READ_DIVIDEND',0),(724,'SHAREACCOUNT','APPROVE_SHAREACCOUNT','SHAREACCOUNT','APPROVE',0),(725,'SHAREACCOUNT','ACTIVATE_SHAREACCOUNT','SHAREACCOUNT','ACTIVATE',0),(726,'SHAREACCOUNT','UNDOAPPROVAL_SHAREACCOUNT','SHAREACCOUNT','UNDOAPPROVAL',0),(727,'SHAREACCOUNT','REJECT_SHAREACCOUNT','SHAREACCOUNT','REJECT',0),(728,'SHAREACCOUNT','APPLYADDITIONALSHARES_SHAREACCOUNT','SHAREACCOUNT','APPLYADDITIONALSHARES',0),(729,'SHAREACCOUNT','APPROVEADDITIONALSHARES_SHAREACCOUNT','SHAREACCOUNT','APPROVEADDITIONALSHARES',0),(730,'SHAREACCOUNT','REJECTADDITIONALSHARES_SHAREACCOUNT','SHAREACCOUNT','REJECTADDITIONALSHARES',0),(731,'SHAREACCOUNT','REDEEMSHARES_SHAREACCOUNT','SHAREACCOUNT','REDEEMSHARES',0),(732,'SHAREACCOUNT','CLOSE_SHAREACCOUNT','SHAREACCOUNT','CLOSE',0),(733,'SSBENEFICIARYTPT','READ_SSBENEFICIARYTPT','SSBENEFICIARYTPT','READ',0),(734,'SSBENEFICIARYTPT','CREATE_SSBENEFICIARYTPT','SSBENEFICIARYTPT','CREATE',0),(735,'SSBENEFICIARYTPT','UPDATE_SSBENEFICIARYTPT','SSBENEFICIARYTPT','UPDATE',0),(736,'SSBENEFICIARYTPT','DELETE_SSBENEFICIARYTPT','SSBENEFICIARYTPT','DELETE',0),(737,'portfolio','FORECLOSURE_LOAN','LOAN','FORECLOSURE',0),(738,'portfolio','FORECLOSURE_LOAN_CHECKER','LOAN','FORECLOSURE_CHECKER',0),(739,'portfolio','CREATE_ADDRESS','ADDRESS','CREATE',0),(740,'portfolio','CREATE_ADDRESS_CHECKER','ADDRESS','CREATE_CHECKER',1),(741,'portfolio','UPDATE_ADDRESS','ADDRESS','UPDATE',0),(742,'portfolio','UPDATE_ADDRESS_CHECKER','ADDRESS','UPDATE_CHECKER',1),(743,'portfolio','READ_ADDRESS','ADDRESS','READ',0),(744,'portfolio','DELETE_ADDRESS','ADDRESS','DELETE',0),(745,'portfolio','DELETE_ADDRESS_CHECKER','ADDRESS','DELETE_CHECKER',1),(746,'jobs','CREATE_REPORTMAILINGJOB','REPORTMAILINGJOB','CREATE',0),(747,'jobs','UPDATE_REPORTMAILINGJOB','REPORTMAILINGJOB','UPDATE',0),(748,'jobs','DELETE_REPORTMAILINGJOB','REPORTMAILINGJOB','DELETE',0),(749,'jobs','READ_REPORTMAILINGJOB','REPORTMAILINGJOB','READ',0),(750,'portfolio','UNDOREJECT_CLIENT','CLIENT','UNDOREJECT',1),(751,'portfolio','UNDOREJECT_CLIENT_CHECKER','CLIENT','UNDOREJECT_CHECKER',1),(752,'portfolio','UNDOWITHDRAWAL_CLIENT','CLIENT','UNDOWITHDRAWAL',1),(753,'portfolio','UNDOWITHDRAWAL_CLIENT_CHECKER','CLIENT','UNDOWITHDRAWAL_CHECKER',1),(754,'organisation','READ_SMSCAMPAIGN','SMSCAMPAIGN','READ',0),(755,'organisation','CREATE_SMSCAMPAIGN','SMSCAMPAIGN','CREATE',0),(756,'organisation','CREATE_SMSCAMPAIGN_CHECKER','SMSCAMPAIGN','CREATE',0),(757,'organisation','UPDATE_SMSCAMPAIGN','SMSCAMPAIGN','UPDATE',0),(758,'organisation','UPDATE_SMSCAMPAIGN_CHECKER','SMSCAMPAIGN','UPDATE',0),(759,'organisation','DELETE_SMSCAMPAIGN','SMSCAMPAIGN','DELETE',0),(760,'organisation','DELETE_SMSCAMPAIGN_CHECKER','SMSCAMPAIGN','DELETE',0),(761,'organisation','ACTIVATE_SMSCAMPAIGN','SMSCAMPAIGN','ACTIVATE',0),(762,'organisation','CLOSE_SMSCAMPAIGN','SMSCAMPAIGN','CLOSE',0),(763,'organisation','REACTIVATE_SMSCAMPAIGN','SMSCAMPAIGN','REACTIVATE',0),(764,'datatable','READ_ENTITY_DATATABLE_CHECK','ENTITY_DATATABLE_CHECK','READ',0),(765,'datatable','CREATE_ENTITY_DATATABLE_CHECK','ENTITY_DATATABLE_CHECK','CREATE',0),(766,'datatable','DELETE_ENTITY_DATATABLE_CHECK','ENTITY_DATATABLE_CHECK','DELETE',0),(767,'configuration','CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING','CREDITBUREAU_LOANPRODUCT_MAPPING','CREATE',0),(768,'configuration','CREATE_ORGANISATIONCREDITBUREAU','ORGANISATIONCREDITBUREAU','CREATE',0),(769,'configuration','UPDATE_ORGANISATIONCREDITBUREAU','ORGANISATIONCREDITBUREAU','UPDATE',0),(770,'configuration','UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING','CREDITBUREAU_LOANPRODUCT_MAPPING','UPDATE',0),(771,'transaction_savings','HOLDAMOUNT_SAVINGSACCOUNT','SAVINGSACCOUNT','HOLDAMOUNT',0),(772,'transaction_savings','HOLDAMOUNT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','HOLDAMOUNT_CHECKER',0),(773,'transaction_savings','BLOCKDEBIT_SAVINGSACCOUNT','SAVINGSACCOUNT','BLOCKDEBIT',0),(774,'transaction_savings','BLOCKDEBIT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','BLOCKDEBIT_CHECKER',0),(775,'transaction_savings','UNBLOCKDEBIT_SAVINGSACCOUNT','SAVINGSACCOUNT','UNBLOCKDEBIT',0),(776,'transaction_savings','UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UNBLOCKDEBIT_CHECKER',0),(777,'transaction_savings','BLOCKCREDIT_SAVINGSACCOUNT','SAVINGSACCOUNT','BLOCKCREDIT',0),(778,'transaction_savings','BLOCKCREDIT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','BLOCKCREDIT_CHECKER',0),(779,'transaction_savings','UNBLOCKCREDIT_SAVINGSACCOUNT','SAVINGSACCOUNT','UNBLOCKCREDIT',0),(780,'transaction_savings','UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UNBLOCKCREDIT_CHECKER',0),(781,'transaction_savings','BLOCK_SAVINGSACCOUNT','SAVINGSACCOUNT','BLOCK',0),(782,'transaction_savings','BLOCK_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','BLOCK_CHECKER',0),(783,'transaction_savings','UNBLOCK_SAVINGSACCOUNT','SAVINGSACCOUNT','UNBLOCK',0),(784,'transaction_savings','UNBLOCK_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','UNBLOCK_CHECKER',0),(785,'transaction_savings','RELEASEAMOUNT_SAVINGSACCOUNT','SAVINGSACCOUNT','RELEASEAMOUNT',0),(786,'transaction_savings','RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER','SAVINGSACCOUNT','RELEASEAMOUNT_CHECKER',0),(787,'report','READ_Daily Teller Cash Report (Pentaho)','Daily Teller Cash Report (Pentaho)','READ',0),(788,'datatable','CREATE_Beneficiary','Beneficiary','CREATE',1),(789,'datatable','CREATE_Beneficiary_CHECKER','Beneficiary','CREATE',0),(790,'datatable','READ_Beneficiary','Beneficiary','READ',0),(791,'datatable','UPDATE_Beneficiary','Beneficiary','UPDATE',1),(792,'datatable','UPDATE_Beneficiary_CHECKER','Beneficiary','UPDATE',0),(793,'datatable','DELETE_Beneficiary','Beneficiary','DELETE',1),(794,'datatable','DELETE_Beneficiary_CHECKER','Beneficiary','DELETE',0),(795,'organisation','READ_EMAIL','EMAIL','READ',0),(796,'organisation','CREATE_EMAIL','EMAIL','CREATE',0),(797,'organisation','CREATE_EMAIL_CHECKER','EMAIL','CREATE_CHECKER',0),(798,'organisation','UPDATE_EMAIL','EMAIL','UPDATE',0),(799,'organisation','UPDATE_EMAIL_CHECKER','EMAIL','UPDATE_CHECKER',0),(800,'organisation','DELETE_EMAIL','EMAIL','DELETE',0),(801,'organisation','DELETE_EMAIL_CHECKER','EMAIL','DELETE_CHECKER',0),(802,'organisation','READ_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','READ',0),(803,'organisation','CREATE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','CREATE',0),(804,'organisation','CREATE_EMAIL_CAMPAIGN_CHECKER','EMAIL_CAMPAIGN','CREATE_CHECKER',0),(805,'organisation','UPDATE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','UPDATE',0),(806,'organisation','UPDATE_EMAIL_CAMPAIGN_CHECKER','EMAIL_CAMPAIGN','UPDATE_CHECKER',0),(807,'organisation','DELETE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','DELETE',0),(808,'organisation','DELETE_EMAIL_CAMPAIGN_CHECKER','EMAIL_CAMPAIGN','DELETE_CHECKER',0),(809,'organisation','CLOSE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','CLOSE',0),(810,'organisation','ACTIVATE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','ACTIVATE',0),(811,'organisation','REACTIVATE_EMAIL_CAMPAIGN','EMAIL_CAMPAIGN','REACTIVATE',0),(812,'organisation','READ_EMAIL_CONFIGURATION','EMAIL_CONFIGURATION','READ',0),(813,'organisation','UPDATE_EMAIL_CONFIGURATION','EMAIL_CONFIGURATION','UPDATE',0),(814,'report','READ_Active Clients - Email','Active Clients - Email','READ',0),(815,'report','READ_Prospective Clients - Email','Prospective Clients - Email','READ',0),(816,'report','READ_Active Loan Clients - Email','Active Loan Clients - Email','READ',0),(817,'report','READ_Loans in arrears - Email','Loans in arrears - Email','READ',0),(818,'report','READ_Loans disbursed to clients - Email','Loans disbursed to clients - Email','READ',0),(819,'report','READ_Loan payments due - Email','Loan payments due - Email','READ',0),(820,'report','READ_Dormant Prospects - Email','Dormant Prospects - Email','READ',0),(821,'report','READ_Active Group Leaders - Email','Active Group Leaders - Email','READ',0),(822,'report','READ_Loan Payments Due (Overdue Loans) - Email','Loan Payments Due (Overdue Loans) - Email','READ',0),(823,'report','READ_Loan Payments Received (Active Loans) - Email','Loan Payments Received (Active Loans) - Email','READ',0),(824,'report','READ_Loan Payments Received (Overdue Loans) - Email','Loan Payments Received (Overdue Loans)  - Email','READ',0),(825,'report','READ_Loan Fully Repaid - Email','Loan Fully Repaid - Email','READ',0),(826,'report','READ_Loans Outstanding after final instalment date - Email','Loans Outstanding after final instalment date - Email','READ',0),(827,'report','READ_Happy Birthday - Email','Happy Birthday - Email','READ',0),(828,'report','READ_Loan Rejected - Email','Loan Rejected - Email','READ',0),(829,'report','READ_Loan Approved - Email','Loan Approved - Email','READ',0),(830,'report','READ_Loan Repayment - Email','Loan Repayment - Email','READ',0),(831,'portfolio','CREATE_FAMILYMEMBERS','FAMILYMEMBERS','CREATE',0),(832,'portfolio','UPDATE_FAMILYMEMBERS','FAMILYMEMBERS','UPDATE',0),(833,'portfolio','DELETE_FAMILYMEMBERS','FAMILYMEMBERS','DELETE',0),(834,'authorisation','UPDATE_ADHOC','ADHOC','UPDATE',1),(835,'authorisation','UPDATE_ADHOC_CHECKER','ADHOC','UPDATE',0),(836,'authorisation','DELETE_ADHOC','ADHOC','DELETE',1),(837,'authorisation','DELETE_ADHOC_CHECKER','ADHOC','DELETE',0),(838,'authorisation','CREATE_ADHOC','ADHOC','CREATE',1),(839,'authorisation','CREATE_ADHOC_CHECKER','ADHOC','CREATE',0),(840,'authorisation','INVALIDATE_TWOFACTOR_ACCESSTOKEN','TWOFACTOR_ACCESSTOKEN','INVALIDATE',0),(841,'configuration','READ_TWOFACTOR_CONFIGURATION','TWOFACTOR_CONFIGURATION','READ',0),(842,'configuration','UPDATE_TWOFACTOR_CONFIGURATION','TWOFACTOR_CONFIGURATION','UPDATE',0),(843,'special','BYPASS_TWOFACTOR',NULL,NULL,0),(844,'infrastructure','READ_IMPORT','IMPORT','READ',0);
/*!40000 ALTER TABLE `m_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_portfolio_account_associations`
--

DROP TABLE IF EXISTS `m_portfolio_account_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_portfolio_account_associations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_account_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `linked_loan_account_id` bigint(20) DEFAULT NULL,
  `linked_savings_account_id` bigint(20) DEFAULT NULL,
  `association_type_enum` smallint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `account_association_loan_fk` (`loan_account_id`),
  KEY `account_association_savings_fk` (`savings_account_id`),
  KEY `linked_loan_fk` (`linked_loan_account_id`),
  KEY `linked_savings_fk` (`linked_savings_account_id`),
  CONSTRAINT `account_association_loan_fk` FOREIGN KEY (`loan_account_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `account_association_savings_fk` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `linked_loan_fk` FOREIGN KEY (`linked_loan_account_id`) REFERENCES `m_loan` (`id`),
  CONSTRAINT `linked_savings_fk` FOREIGN KEY (`linked_savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_portfolio_account_associations`
--

LOCK TABLES `m_portfolio_account_associations` WRITE;
/*!40000 ALTER TABLE `m_portfolio_account_associations` DISABLE KEYS */;
INSERT INTO `m_portfolio_account_associations` VALUES (1,5,NULL,NULL,1,2,1),(2,6,NULL,NULL,5,1,1),(3,7,NULL,NULL,3,1,1),(4,8,NULL,NULL,4,1,1),(5,7,NULL,NULL,3,2,1),(6,6,NULL,NULL,5,2,1),(7,8,NULL,NULL,4,2,1),(8,14,NULL,NULL,1,1,1),(9,15,NULL,NULL,3,1,1);
/*!40000 ALTER TABLE `m_portfolio_account_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_portfolio_command_source`
--

DROP TABLE IF EXISTS `m_portfolio_command_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_portfolio_command_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(50) NOT NULL,
  `entity_name` varchar(50) NOT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `api_get_url` varchar(100) NOT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `subresource_id` bigint(20) DEFAULT NULL,
  `command_as_json` text NOT NULL,
  `maker_id` bigint(20) NOT NULL,
  `made_on_date` datetime NOT NULL,
  `checker_id` bigint(20) DEFAULT NULL,
  `checked_on_date` datetime DEFAULT NULL,
  `processing_result_enum` smallint(5) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `creditbureau_id` bigint(20) DEFAULT NULL,
  `organisation_creditbureau_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_maker_m_appuser` (`maker_id`),
  KEY `FK_m_checker_m_appuser` (`checker_id`),
  KEY `action_name` (`action_name`),
  KEY `entity_name` (`entity_name`,`resource_id`),
  KEY `made_on_date` (`made_on_date`),
  KEY `checked_on_date` (`checked_on_date`),
  KEY `processing_result_enum` (`processing_result_enum`),
  KEY `office_id` (`office_id`),
  KEY `group_id` (`office_id`),
  KEY `client_id` (`office_id`),
  KEY `loan_id` (`office_id`),
  CONSTRAINT `FK_m_checker_m_appuser` FOREIGN KEY (`checker_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_maker_m_appuser` FOREIGN KEY (`maker_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_portfolio_command_source`
--

LOCK TABLES `m_portfolio_command_source` WRITE;
/*!40000 ALTER TABLE `m_portfolio_command_source` DISABLE KEYS */;
INSERT INTO `m_portfolio_command_source` VALUES (1,'UPDATE','CURRENCY',NULL,NULL,NULL,NULL,NULL,'/currencies',NULL,NULL,'{\"currencies\":[\"USD\",\"TZS\"]}',1,'2018-01-26 08:57:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'CREATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/template',1,NULL,'{\"currencyCode\":\"TZS\",\"includeInBorrowerCycle\":\"false\",\"useBorrowerCycle\":false,\"digitsAfterDecimal\":\"2\",\"inMultiplesOf\":\"1\",\"repaymentFrequencyType\":2,\"interestRateFrequencyType\":2,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"transactionProcessingStrategyId\":1,\"principalVariationsForBorrowerCycle\":[],\"interestRateVariationsForBorrowerCycle\":[],\"numberOfRepaymentVariationsForBorrowerCycle\":[],\"multiDisburseLoan\":false,\"accountingRule\":\"1\",\"daysInYearType\":1,\"daysInMonthType\":1,\"isInterestRecalculationEnabled\":false,\"preClosureInterestCalculationStrategy\":1,\"isLinkedToFloatingInterestRates\":false,\"allowVariableInstallments\":false,\"name\":\"Development Loan\",\"shortName\":\"DL\",\"installmentAmountInMultiplesOf\":\"1\",\"interestRatePerPeriod\":\"1.08\",\"minInterestRatePerPeriod\":\"1\",\"maxInterestRatePerPeriod\":\"50\",\"minNumberOfRepayments\":\"6\",\"numberOfRepayments\":\"6\",\"maxNumberOfRepayments\":\"48\",\"minPrincipal\":\"1000000\",\"principal\":\"1000000\",\"maxPrincipal\":\"50000000\",\"repaymentEvery\":\"1\",\"holdGuaranteeFunds\":true,\"graceOnArrearsAgeing\":\"30\",\"mandatoryGuarantee\":\"33.33333\",\"minimumGuaranteeFromOwnFunds\":\"33.33333\",\"minimumGuaranteeFromGuarantor\":\"0\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[],\"allowAttributeOverrides\":{\"amortizationType\":true,\"interestType\":true,\"transactionProcessingStrategyId\":true,\"interestCalculationPeriodType\":true,\"inArrearsTolerance\":true,\"repaymentEvery\":true,\"graceOnPrincipalAndInterestPayment\":true,\"graceOnArrearsAgeing\":true},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',1,'2018-01-26 09:09:15',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'CREATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/template',1,NULL,'{\"chargeAppliesTo\":1,\"name\":\"Processing Fee\",\"currencyCode\":\"TZS\",\"chargeCalculationType\":2,\"chargeTimeType\":2,\"chargePaymentMode\":0,\"amount\":\"0.25\",\"active\":true,\"locale\":\"en\",\"monthDayFormat\":\"dd MMM\"}',1,'2018-01-26 09:20:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'CREATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/template',2,NULL,'{\"chargeAppliesTo\":1,\"name\":\"Social Fund Charge\",\"currencyCode\":\"TZS\",\"chargeTimeType\":2,\"chargeCalculationType\":2,\"chargePaymentMode\":0,\"amount\":\"0.5\",\"active\":true,\"locale\":\"en\",\"monthDayFormat\":\"dd MMM\"}',1,'2018-01-26 09:22:19',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'UPDATE','CURRENCY',NULL,NULL,NULL,NULL,NULL,'/currencies',NULL,NULL,'{\"currencies\":[\"TZS\"]}',1,'2018-01-26 09:22:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(6,'CREATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/template',2,NULL,'{\"currencyCode\":\"TZS\",\"includeInBorrowerCycle\":\"false\",\"useBorrowerCycle\":false,\"digitsAfterDecimal\":\"2\",\"inMultiplesOf\":\"1\",\"repaymentFrequencyType\":2,\"interestRateFrequencyType\":2,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"transactionProcessingStrategyId\":1,\"principalVariationsForBorrowerCycle\":[],\"interestRateVariationsForBorrowerCycle\":[],\"numberOfRepaymentVariationsForBorrowerCycle\":[],\"multiDisburseLoan\":false,\"accountingRule\":\"1\",\"daysInYearType\":1,\"daysInMonthType\":1,\"isInterestRecalculationEnabled\":false,\"preClosureInterestCalculationStrategy\":1,\"isLinkedToFloatingInterestRates\":false,\"allowVariableInstallments\":false,\"name\":\"Education Loan\",\"shortName\":\"EL\",\"installmentAmountInMultiplesOf\":\"1\",\"interestRatePerPeriod\":\"2.7\",\"minInterestRatePerPeriod\":\"2.7\",\"maxInterestRatePerPeriod\":\"50\",\"repaymentEvery\":\"1\",\"minNumberOfRepayments\":\"1\",\"numberOfRepayments\":\"1\",\"maxNumberOfRepayments\":\"12\",\"graceOnArrearsAgeing\":\"30\",\"minPrincipal\":\"100000\",\"principal\":\"100000\",\"maxPrincipal\":\"2000000\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[{\"id\":1},{\"id\":2}],\"allowAttributeOverrides\":{\"amortizationType\":true,\"interestType\":true,\"transactionProcessingStrategyId\":true,\"interestCalculationPeriodType\":true,\"inArrearsTolerance\":true,\"repaymentEvery\":true,\"graceOnPrincipalAndInterestPayment\":true,\"graceOnArrearsAgeing\":true},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',1,'2018-01-26 09:33:52',NULL,NULL,1,NULL,NULL,NULL,NULL),(7,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":\"[{\\\"id\\\":1},{\\\"id\\\":2}]\",\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-26 09:34:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(8,'CREATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/template',3,NULL,'{\"currencyCode\":\"TZS\",\"includeInBorrowerCycle\":\"false\",\"useBorrowerCycle\":false,\"digitsAfterDecimal\":\"2\",\"inMultiplesOf\":\"1\",\"repaymentFrequencyType\":2,\"interestRateFrequencyType\":2,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"transactionProcessingStrategyId\":1,\"principalVariationsForBorrowerCycle\":[],\"interestRateVariationsForBorrowerCycle\":[],\"numberOfRepaymentVariationsForBorrowerCycle\":[],\"multiDisburseLoan\":false,\"accountingRule\":\"1\",\"daysInYearType\":1,\"daysInMonthType\":1,\"isInterestRecalculationEnabled\":false,\"preClosureInterestCalculationStrategy\":1,\"isLinkedToFloatingInterestRates\":false,\"allowVariableInstallments\":false,\"name\":\"Computer Loan\",\"shortName\":\"CL\",\"installmentAmountInMultiplesOf\":\"1\",\"interestRatePerPeriod\":\"2.7\",\"minInterestRatePerPeriod\":\"2.7\",\"maxInterestRatePerPeriod\":\"2.7\",\"repaymentEvery\":\"1\",\"minNumberOfRepayments\":\"1\",\"numberOfRepayments\":\"1\",\"maxNumberOfRepayments\":\"12\",\"graceOnArrearsAgeing\":\"30\",\"minPrincipal\":\"100000\",\"principal\":\"100000\",\"maxPrincipal\":\"3000000\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[{\"id\":1},{\"id\":2}],\"allowAttributeOverrides\":{\"amortizationType\":true,\"interestType\":true,\"transactionProcessingStrategyId\":true,\"interestCalculationPeriodType\":true,\"inArrearsTolerance\":true,\"repaymentEvery\":true,\"graceOnPrincipalAndInterestPayment\":true,\"graceOnArrearsAgeing\":true},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',1,'2018-01-26 09:36:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(9,'CREATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/template',5,NULL,'{\"currencyCode\":\"TZS\",\"includeInBorrowerCycle\":\"false\",\"useBorrowerCycle\":false,\"digitsAfterDecimal\":\"2\",\"inMultiplesOf\":\"1\",\"repaymentFrequencyType\":2,\"interestRateFrequencyType\":2,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"transactionProcessingStrategyId\":1,\"principalVariationsForBorrowerCycle\":[],\"interestRateVariationsForBorrowerCycle\":[],\"numberOfRepaymentVariationsForBorrowerCycle\":[],\"multiDisburseLoan\":false,\"accountingRule\":\"1\",\"daysInYearType\":1,\"daysInMonthType\":1,\"isInterestRecalculationEnabled\":false,\"preClosureInterestCalculationStrategy\":1,\"isLinkedToFloatingInterestRates\":false,\"allowVariableInstallments\":false,\"name\":\"Emergency  Loan\",\"shortName\":\"EmL\",\"installmentAmountInMultiplesOf\":\"1\",\"minInterestRatePerPeriod\":\"2.7\",\"interestRatePerPeriod\":\"2.7\",\"maxInterestRatePerPeriod\":\"2.7\",\"minNumberOfRepayments\":\"1\",\"numberOfRepayments\":\"1\",\"maxNumberOfRepayments\":\"12\",\"repaymentEvery\":\"1\",\"graceOnArrearsAgeing\":\"30\",\"minPrincipal\":\"100000\",\"principal\":\"100000\",\"maxPrincipal\":\"1000000\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[{\"id\":1},{\"id\":2}],\"allowAttributeOverrides\":{\"amortizationType\":true,\"interestType\":true,\"transactionProcessingStrategyId\":true,\"interestCalculationPeriodType\":true,\"inArrearsTolerance\":true,\"repaymentEvery\":true,\"graceOnPrincipalAndInterestPayment\":true,\"graceOnArrearsAgeing\":true},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',1,'2018-01-26 09:44:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(10,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/2',2,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"shortName\":\"EdL\",\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-26 09:45:18',NULL,NULL,1,NULL,NULL,NULL,NULL),(11,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"shortName\":\"DevL\",\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-26 09:45:41',NULL,NULL,1,NULL,NULL,NULL,NULL),(12,'CREATE','SHAREPRODUCT',NULL,NULL,NULL,NULL,NULL,'/products/share',1,NULL,'{\"marketPricePeriods\":[],\"currencyCode\":\"TZS\",\"digitsAfterDecimal\":2,\"accountingRule\":\"1\",\"name\":\"Share Product\",\"shortName\":\"SP\",\"description\":\"SP\",\"unitPrice\":\"25000\",\"inMultiplesOf\":\"1\",\"minimumShares\":\"10\",\"nominalShares\":\"20\",\"maximumShares\":\"1000\",\"totalShares\":\"50000000000\",\"sharesIssued\":\"10000000\",\"chargesSelected\":[],\"locale\":\"en\"}',1,'2018-01-26 09:49:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(13,'UPDATE','OFFICE',1,NULL,NULL,NULL,NULL,'/offices/1',1,NULL,'{\"openingDate\":\"01 January 1964\",\"dateFormat\":\"dd MMMM yyyy\",\"locale\":\"en\",\"name\":\"Nyumba Head Office\"}',1,'2018-01-26 09:52:46',NULL,NULL,1,NULL,NULL,NULL,NULL),(14,'CREATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/template',3,NULL,'{\"chargeAppliesTo\":3,\"name\":\"Entry fee\",\"currencyCode\":\"TZS\",\"chargeTimeType\":2,\"chargeCalculationType\":1,\"chargePaymentMode\":0,\"amount\":\"15000\",\"active\":true,\"locale\":\"en\",\"monthDayFormat\":\"dd MMM\"}',1,'2018-01-26 09:53:44',NULL,NULL,1,NULL,NULL,NULL,NULL),(15,'CREATE','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/template',2,NULL,'{\"name\":\"Managers\",\"description\":\"Managers\"}',1,'2018-01-26 09:54:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(16,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/2/permissions',2,NULL,'{\"permissions\":{\"DISASSOCIATECLIENTS_GROUP\":true,\"CREATE_CALENDAR\":true,\"READ_ROLE\":true,\"DELETE_PAYMENTTYPE\":true,\"DELETE_HOOK\":true,\"CREATE_CODEVALUE_CHECKER\":true,\"DELETE_COLLATERAL\":true,\"READ_Active Loans - Summary(Pentaho)\":true,\"ACTIVATE_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_CODEVALUE\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_ADDRESS\":true,\"READ_LOANTRANSACTIONNOTE\":true,\"REJECT_SAVINGSACCOUNT\":true,\"READ_CALENDAR\":true,\"READ_GroupSummaryCounts\":true,\"PROPOSETRANSFER_CLIENT_CHECKER\":true,\"READ_SMS\":true,\"DELETE_PROVISIONCRITERIA\":true,\"UPDATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE\":true,\"CREATE_OFFICE_CHECKER\":true,\"CLOSE_CLIENT\":true,\"DELETE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Obligation Met Loans Details(Pentaho)\":true,\"DELETE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_SMS_CHECKER\":true,\"DELETE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATECASHIERALLOCATION_TELLER\":true,\"UPDATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Portfolio at Risk by Branch(Pentaho)\":true,\"READ_FIXEDDEPOSITPRODUCT\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN\":true,\"DELETE_CALENDAR_CHECKER\":true,\"DELETE_LOAN\":true,\"DELETE_HOLIDAY\":true,\"UPDATE_REPORTMAILINGJOB\":true,\"READ_Loans Awaiting Disbursal Summary by Month(Pentaho)\":true,\"READ_Aging Summary (Arrears in Months)\":true,\"CREATE_TAXGROUP\":true,\"CLOSE_GROUP\":true,\"UPDATE_OFFICE\":true,\"DELETE_CLIENTIMAGE\":true,\"CREATE_COLLATERAL_CHECKER\":true,\"UNDOWRITEOFF_LOAN\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT\":true,\"CREATE_ACCOUNTNUMBERFORMAT\":true,\"DELETE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_GLACCOUNT\":true,\"UPDATE_CODE\":true,\"CREATE_CLIENTCHARGE\":true,\"CREATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_STAFF_CHECKER\":true,\"UPDATE_DATATABLE_CHECKER\":true,\"READ_Expected Payments By Date - Formatted\":true,\"ADJUSTTRANSACTION_SAVINGSACCOUNT\":true,\"PAY_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_TAXCOMPONENT_CHECKER\":true,\"CLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOANCHARGE_CHECKER\":true,\"APPROVEADDITIONALSHARES_SHAREACCOUNT\":true,\"APPROVALUNDO_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_GLACCOUNT\":true,\"READ_Active Loans in last installment Summary(Pentaho)\":true,\"CLOSE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CACHE\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CURRENCY\":true,\"READ_TAXGROUP\":true,\"DELETE_CLIENTIMAGE_CHECKER\":true,\"APPROVE_SAVINGSACCOUNT\":true,\"CREATE_CHARTSLAB\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT\":true,\"READ_Active Loans - Details\":true,\"UPDATE_FLOATINGRATE_CHECKER\":true,\"UPDATE_SMSCAMPAIGN\":true,\"REJECT_LOAN_CHECKER\":true,\"INACTIVATE_CLIENTCHARGE\":true,\"CREATE_PAYMENTTYPE\":true,\"RECREATE_PROVISIONENTRIES\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_REPORT\":true,\"READ_DOCUMENT\":true,\"REMOVESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOAN_CHECKER\":true,\"READ_LOANNOTE\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT\":true,\"DELETE_TEMPLATE\":true,\"UPDATE_CHARTSLAB_CHECKER\":true,\"CLOSE_SAVINGSACCOUNT_CHECKER\":true,\"READ_RESCHEDULELOAN\":true,\"UPDATE_GUARANTOR_CHECKER\":true,\"READ_ProgramDetails\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_LOAN\":true,\"READ_TAXCOMPONENT\":true,\"CREATE_DIVIDEND_SHAREPRODUCT\":true,\"READ_SMSCAMPAIGN\":true,\"UPDATE_CHARGE\":true,\"DELETE_DOCUMENT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_ADDRESS_CHECKER\":true,\"CREATE_PROVISIONCATEGORY\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"ADJUST_LOAN_CHECKER\":true,\"POSTINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"READTRANSACTION_CLIENT\":true,\"ACTIVATE_CLIENT\":true,\"CREATE_STAFFIMAGE_CHECKER\":true,\"READ_Daily Teller Cash Report (Pentaho)\":true,\"CREATE_FUND\":true,\"DELETE_FINANCIALACTIVITYACCOUNT\":true,\"CREATE_CODE_CHECKER\":true,\"READ_PAYMENTTYPE\":true,\"UPDATE_TAXCOMPONENT\":true,\"APPLYADDITIONALSHARES_SHAREACCOUNT\":true,\"READ_GLCLOSURE\":true,\"DELETE_CODEVALUE\":true,\"DELETE_SMSCAMPAIGN_CHECKER\":true,\"DELETE_CHARGE\":true,\"CREATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT_CHECKER\":true,\"DISABLE_ROLE_CHECKER\":true,\"CREATE_LOANNOTE\":true,\"DELETE_CODEVALUE_CHECKER\":true,\"CREATE_PROVISIONCRITERIA\":true,\"ACTIVATE_SAVINGSACCOUNT\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT\":true,\"READ_PRODUCTMIX\":true,\"UPDATE_EXTERNALSERVICES\":true,\"UPDATE_SAVINGSPRODUCT\":true,\"WITHDRAW_CLIENT\":true,\"REDEEMSHARES_SHAREACCOUNT\":true,\"UPDATE_SHAREACCOUNT\":true,\"READ_STANDINGINSTRUCTION \":true,\"CREATE_CLIENTIMAGE\":true,\"READ_Active Loans by Disbursal Period\":true,\"DEPOSIT_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Pending Approval(Pentaho)\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_MEETING\":true,\"CREATE_SAVINGSPRODUCT\":true,\"SAVECOLLECTIONSHEET_GROUP\":true,\"READ_Branch Expected Cash Flow\":true,\"HOLDAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"ACTIVATE_CLIENT_CHECKER\":true,\"UPDATE_TAXGROUP\":true,\"READ_Active Loans - Summary\":true,\"READ_GroupNamesByStaff\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT\":true,\"CREATE_SMSCAMPAIGN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"REFUNDBYCASH_LOAN_CHECKER\":true,\"ACTIVATE_SHAREACCOUNT\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT\":true,\"READ_CLIENT\":true,\"CLOSEASRESCHEDULED_LOAN\":true,\"UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE\":true,\"DEPOSIT_SAVINGSACCOUNT\":true,\"READ_Expected Payments By Date - Basic(Pentaho)\":true,\"READ_Loans Awaiting Disbursal Summary by Month\":true,\"REACTIVATE_CLIENT\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT\":true,\"CREATE_CODEVALUE\":true,\"DELETE_LOANNOTE_CHECKER\":true,\"UNASSIGNSTAFF_GROUP_CHECKER\":true,\"UPDATERUNNINGBALANCE_JOURNALENTRY\":true,\"CREATE_STANDINGINSTRUCTION \":true,\"CREATE_ADDRESS_CHECKER\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT\":true,\"READ_RECURRINGDEPOSITPRODUCT\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_DOCUMENT_CHECKER\":true,\"READ_TxnRunningBalances\":true,\"UPDATE_COLLATERAL\":true,\"ASSOCIATEGROUPS_CENTER_CHECKER\":true,\"REJECT_LOAN\":true,\"WAIVE_CLIENTCHARGE\":true,\"PROPOSETRANSFER_CLIENT\":true,\"REJECTTRANSFER_CLIENT\":true,\"READ_REPORTMAILINGJOB\":true,\"DELETE_STAFF\":true,\"CREATE_CLIENTIMAGE_CHECKER\":true,\"READ_STAFF\":true,\"CREATE_PRODUCTMIX\":true,\"CREATE_FLOATINGRATE\":true,\"READ_Active Loans by Disbursal Period(Pentaho)\":true,\"UPDATE_ACCOUNTINGRULE\":true,\"CREATE_ENTITYMAPPING\":true,\"UPDATE_CLIENTCHARGE\":true,\"READ_ChildrenStaffList\":true,\"CREATE_DATATABLE\":true,\"READ_Client Loans Listing\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ACTIVATE_CENTER_CHECKER\":true,\"APPROVE_SHAREACCOUNT\":true,\"DELETE_HOLIDAY_CHECKER\":true,\"WAIVE_SAVINGSACCOUNTCHARGE\":true,\"READ_BranchManagerStats\":true,\"CREATE_HOLIDAY\":true,\"READ_Disbursal_Vs_Awaitingdisbursal\":true,\"SAVEORUPDATEATTENDANCE_MEETING\":true,\"UPDATE_SAVINGNOTE_CHECKER\":true,\"DELETE_SMSCAMPAIGN\":true,\"CREATE_STAFF\":true,\"UPDATEROLE_GROUP\":true,\"READ_Client Saving Transactions\":true,\"DELETE_TELLER\":true,\"READ_ProgramDirectorStats\":true,\"CREATE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_HOLIDAY\":true,\"READ_GUARANTOR\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"REMOVELOANOFFICER_LOAN_CHECKER\":true,\"READ_Balance Outstanding\":true,\"UPDATE_CENTER_CHECKER\":true,\"READ_Rescheduled Loans(Pentaho)\":true,\"UPDATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Obligation Met Loans Summary\":true,\"DELETE_USER_CHECKER\":true,\"UPDATE_TEMPLATE\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATE_CALENDAR_CHECKER\":true,\"CHECKER_SUPER_USER\":true,\"CREATE_GROUPNOTE\":true,\"UPDATE_PAYMENTTYPE\":true,\"CREATE_GLACCOUNT\":true,\"READ_SAVINGSPRODUCT\":true,\"CREATE_SAVINGNOTE_CHECKER\":true,\"READ_FieldAgentPrograms\":true,\"PAY_CLIENTCHARGE_CHECKER\":true,\"CREATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_FIXEDDEPOSITACCOUNT\":true,\"CREATE_PROVISIONJOURNALENTRIES\":true,\"UNDOREJECT_CLIENT\":true,\"DELETE_ACCOUNTNUMBERFORMAT\":true,\"CREATE_CLIENT_CHECKER\":true,\"CREATE_CHARTSLAB_CHECKER\":true,\"CREATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_HOOK\":true,\"UNDOAPPROVAL_SHAREACCOUNT\":true,\"UPDATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_SSBENEFICIARYTPT\":true,\"CLOSE_LOAN\":true,\"READ_Active Loans in last installment(Pentaho)\":true,\"DELETE_SAVINGSPRODUCT\":true,\"UPDATE_LOAN\":true,\"UNASSIGNSTAFF_CLIENT\":true,\"ASSIGNSTAFF_GROUP\":true,\"READ_Demand_Vs_Collection\":true,\"HOLDAMOUNT_SAVINGSACCOUNT\":true,\"DELETE_REPORTMAILINGJOB\":true,\"READ_CLIENTIMAGE\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARGE_CHECKER\":true,\"READ_Portfolio at Risk(Pentaho)\":true,\"CREATE_CHARGE_CHECKER\":true,\"ACTIVATE_GROUP\":true,\"ENABLE_ROLE\":true,\"DELETE_ADDRESS\":true,\"BLOCKCREDIT_SAVINGSACCOUNT\":true,\"REJECT_CLIENT_CHECKER\":true,\"CREATE_GROUP\":true,\"READ_Obligation Met Loans Summary(Pentaho)\":true,\"READ_ProgramStats\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_PRODUCTMIX\":true,\"UPDATE_CODEVALUE_CHECKER\":true,\"READ_Aging Summary (Arrears in Months)(Pentaho)\":true,\"BLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SMSCAMPAIGN_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ACCOUNTNUMBERFORMAT\":true,\"UPDATE_PERMISSION\":true,\"CREATE_CLIENTNOTE\":true,\"CREATE_HOLIDAY_CHECKER\":true,\"UPDATE_FIXEDDEPOSITACCOUNT\":true,\"CREATE_ROLE\":true,\"REMOVELOANOFFICER_LOAN\":true,\"WITHDRAWAL_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_FLOATINGRATE\":true,\"READ_Loan Account Schedule\":true,\"DELETE_CLIENT_CHECKER\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ENTITYMAPPING\":true,\"CREATE_REPORT_CHECKER\":true,\"DISASSOCIATEGROUPS_CENTER_CHECKER\":true,\"WITHDRAW_LOAN\":true,\"CREATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_Written-Off Loans\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_GLCLOSURE\":true,\"UPDATE_GUARANTOR\":true,\"REJECTADDITIONALSHARES_SHAREACCOUNT\":true,\"CLOSE_SHAREACCOUNT\":true,\"PERMISSIONS_ROLE\":true,\"CREATE_USER\":true,\"ACTIVATE_HOLIDAY_CHECKER\":true,\"DELETE_SAVINGNOTE_CHECKER\":true,\"REJECT_FIXEDDEPOSITACCOUNT\":true,\"WAIVEINTERESTPORTION_LOAN_CHECKER\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT\":true,\"ASSIGNSTAFF_CLIENT\":true,\"REGISTER_DATATABLE_CHECKER\":true,\"UPDATE_CLIENTNOTE\":true,\"WAIVE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Active Loans Passed Final Maturity(Pentaho)\":true,\"READ_Portfolio at Risk\":true,\"APPROVE_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary\":true,\"READ_Aging Detail(Pentaho)\":true,\"READ_Active Loans in last installment\":true,\"DELETE_CLIENTNOTE\":true,\"DELETE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"ASSIGNROLE_GROUP\":true,\"READ_Client Listing\":true,\"READ_Loans Pending Approval\":true,\"DELETE_FIXEDDEPOSITACCOUNT\":true,\"BULKREASSIGN_LOAN_CHECKER\":true,\"CREATE_DATATABLE_CHECKER\":true,\"APPROVE_LOAN\":true,\"DISBURSALUNDO_LOAN_CHECKER\":true,\"DEREGISTER_DATATABLE\":true,\"UPDATELOANOFFICER_LOAN\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT\":true,\"READ_STAFFIMAGE\":true,\"UPDATE_SAVINGSACCOUNTCHARGE\":true,\"READ_USER\":true,\"READ_SAVINGSACCOUNTCHARGE\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CENTER\":true,\"DELETE_ROLE\":true,\"UPDATE_GROUPNOTE_CHECKER\":true,\"DELETE_INTERESTRATECHART\":true,\"ASSOCIATEGROUPS_CENTER\":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_JOURNALENTRY_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_ORGANISATIONCREDITBUREAU\":true,\"ACTIVATE_HOLIDAY\":true,\"READ_FLOATINGRATE\":true,\"DELETE_ENTITY_DATATABLE_CHECK\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT\":true,\"APPROVE_LOAN_CHECKER\":true,\"REGISTER_DATATABLE\":true,\"ACCEPTTRANSFER_CLIENT\":true,\"READ_Balance Sheet\":true,\"UPDATE_ROLE\":true,\"UPDATE_LOANCHARGE_CHECKER\":true,\"CREATE_COLLATERAL\":true,\"READ_Client Loan Account Schedule\":true,\"READ_LoanTrendsByMonth\":true,\"DELETE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_CLIENTIDENTIFIER\":true,\"READ_Client Savings Summary\":true,\"CREATE_LOANCHARGE_CHECKER\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT\":true,\"CREATE_CLIENT\":true,\"UPDATELOANOFFICER_LOAN_CHECKER\":true,\"ADJUST_LOAN\":true,\"CREATE_SMSCAMPAIGN\":true,\"CREATE_REPORTMAILINGJOB\":true,\"CREATE_PROVISIONENTRIES\":true,\"CREATE_TAXCOMPONENT\":true,\"BLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_DOCUMENT\":true,\"READ_ACCOUNTTRANSFER\":true,\"DELETE_GROUP\":true,\"DELETE_ENTITYMAPPING\":true,\"CREATE_FINANCIALACTIVITYACCOUNT\":true,\"DEREGISTER_DATATABLE_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Active Loans in last installment Summary\":true,\"CREATE_SMS\":true,\"WRITEOFF_LOAN\":true,\"READ_ClientTrendsByWeek\":true,\"CREATE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"READ_Aging Detail\":true,\"READ_GroupSummaryAmounts\":true,\"ENABLE_ROLE_CHECKER\":true,\"WAIVE_CLIENTCHARGE_CHECKER\":true,\"READ_TxnRunningBalances(Pentaho)\":true,\"CREATE_ROLE_CHECKER\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_GROUPNOTE_CHECKER\":true,\"UPDATE_CURRENCY\":true,\"UPDATE_PRODUCTMIX\":true,\"POSTINTEREST_SAVINGSACCOUNT\":true,\"UPDATE_CONFIGURATION\":true,\"UPDATE_USER_CHECKER\":true,\"UPDATE_TAXGROUP_CHECKER\":true,\"CREATE_STAFF_CHECKER\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_GLCLOSURE\":true,\"DELETE_GUARANTOR\":true,\"DELETE_STAFF_CHECKER\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT\":true,\"READ_Obligation Met Loans Details\":true,\"CREATE_SAVINGNOTE\":true,\"READ_GroupSavingSummary\":true,\"CREATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_FINANCIALACTIVITYACCOUNT\":true,\"READ_ClientTrendsByMonth\":true,\"REPORTING_SUPER_USER\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_Income Statement\":true,\"UPDATE_XBRLMAPPING\":true,\"SAVE_COLLECTIONSHEET\":true,\"READ_CLIENTCHARGE\":true,\"DELETE_SSBENEFICIARYTPT\":true,\"READ_Funds Disbursed Between Dates Summary\":true,\"UPDATE_PROVISIONCRITERIA\":true,\"WAIVEINTERESTPORTION_LOAN\":true,\"READ_SAVINGSACCOUNT\":true,\"CREATE_HOOK\":true,\"READ_General Ledger Report\":true,\"WAIVE_LOANCHARGE\":true,\"ACTIVATE_GROUP_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER_CHECKER\":true,\"CREATE_CHARGE\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT\":true,\"UNDOWITHDRAWAL_CLIENT\":true,\"READ_SAVINGNOTE\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT\":true,\"ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_DATATABLE_CHECKER\":true,\"APPROVALUNDO_SAVINGSACCOUNT\":true,\"DELETE_DOCUMENT\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"CREATE_GUARANTOR_CHECKER\":true,\"BLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_JOURNALENTRY\":true,\"READ_LoanCyclePerProduct\":true,\"DELETE_CALENDAR\":true,\"UPDATE_MEETING\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"READ_WORKINGDAYS\":true,\"CREATE_FUND_CHECKER\":true,\"READ_CACHE\":true,\"UNASSIGNROLE_GROUP\":true,\"DELETE_CENTER\":true,\"READ_COLLECTIONSHEET\":true,\"UPDATE_PASSWORD_PREFERENCES_CHECKER\":true,\"CREATE_LOAN_CHECKER\":true,\"CREATE_FLOATINGRATE_CHECKER\":true,\"DELETE_CLIENTCHARGE\":true,\"WITHDRAW_LOAN_CHECKER\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Listing(Pentaho)\":true,\"REFUNDBYCASH_LOAN\":true,\"READ_RECURRINGDEPOSITACCOUNT\":true,\"UNDOTRANSACTION_CLIENT\":true,\"DELETE_OFFICETRANSACTION\":true,\"CREATE_CENTER_CHECKER\":true,\"PAY_LOANCHARGE\":true,\"UPDATE_USER\":true,\"UPDATE_CURRENCY_CHECKER\":true,\"DELETE_LOANTRANSACTIONNOTE_CHECKER\":true,\"READ_PERMISSION\":true,\"DELETE_INTERESTRATECHART_CHECKER\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_RECURRINGDEPOSITPRODUCT\":true,\"READ_LoanTrendsByWeek\":true,\"ALLOCATECASHIER_TELLER\":true,\"CREATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_DATATABLE\":true,\"UPDATE_ADDRESS_CHECKER\":true,\"READ_ADDRESS\":true,\"READ_Funds Disbursed Between Dates Summary by Office(Pentaho)\":true,\"READ_Funds Disbursed Between Dates Summary(Pentaho)\":true,\"READ_LOANPRODUCT\":true,\"UPDATE_COLLATERAL_CHECKER\":true,\"UPDATE_WORKINGDAYS\":true,\"DISASSOCIATEGROUPS_CENTER\":true,\"BLOCK_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_INTERESTRATECHART\":true,\"FORECLOSURE_LOAN\":true,\"UNBLOCK_SAVINGSACCOUNT\":true,\"CREATE_OFFICE\":true,\"READ_CODEVALUE\":true,\"CREATE_SHAREACCOUNT\":true,\"APPROVE_RESCHEDULELOAN\":true,\"WITHDRAW_CLIENT_CHECKER\":true,\"DELETE_SMS\":true,\"ACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_CHARGE_CHECKER\":true,\"ACCEPTTRANSFER_CLIENT_CHECKER\":true,\"DISABLE_ROLE\":true,\"BULKREASSIGN_LOAN\":true,\"RECOVERGUARANTEES_LOAN_CHECKER\":true,\"ASSOCIATECLIENTS_GROUP\":true,\"DELETE_STAFFIMAGE\":true,\"UPDATE_CLIENT_CHECKER\":true,\"CREATE_TELLER\":true,\"CREATE_LOANPRODUCT\":true,\"READ_ClientSummary \":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_REPORT\":true,\"ACTIVATE_CENTER\":true,\"READ_Active Loan Summary per Branch\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT\":true,\"READ_CoordinatorStats\":true,\"UPDATE_DATATABLE\":true,\"CREATE_TEMPLATE\":true,\"DELETE_SAVINGSACCOUNT_CHECKER\":true,\"ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENT\":true,\"DELETE_LOANNOTE\":true,\"READ_Rescheduled Loans\":true,\"DELETE_GUARANTOR_CHECKER\":true,\"DELETE_LOANPRODUCT\":true,\"UPDATE_TAXCOMPONENT_CHECKER\":true,\"READ_TEMPLATE\":true,\"UPDATE_REPORT\":true,\"CREATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE_CHECKER\":true,\"UPDATE_STANDINGINSTRUCTION \":true,\"UPDATE_PASSWORD_PREFERENCES\":true,\"READ_FUND\":true,\"UPDATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_SAVINGNOTE\":true,\"CREATE_DOCUMENT_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARTSLAB_CHECKER\":true,\"UNASSIGNSTAFF_GROUP\":true,\"DELETE_CHARTSLAB\":true,\"UPDATE_CHARTSLAB\":true,\"DELETE_SAVINGSACCOUNT\":true,\"DELETE_CENTER_CHECKER\":true,\"READ_ClientTrendsByDay\":true,\"READ_PASSWORD_PREFERENCES\":true,\"CREATE_ACCOUNTTRANSFER_CHECKER\":true,\"REJECT_CLIENT\":true,\"READ_LoanTrendsByDay\":true,\"PAY_CLIENTCHARGE\":true,\"UPDATE_CENTER\":true,\"UPDATE_STAFF\":true,\"UNDOREJECT_CLIENT_CHECKER\":true,\"RECOVERGUARANTEES_LOAN\":true,\"READ_Staff Assignment History\":true,\"UPDATE_SAVINGNOTE\":true,\"UPDATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_SHAREPRODUCT\":true,\"UPDATE_LOAN_CHECKER\":true,\"EXECUTEJOB_SCHEDULER\":true,\"READ_DATATABLE\":true,\"CLOSE_LOAN_CHECKER\":true,\"READ_Collection Report\":true,\"REJECT_SHAREACCOUNT\":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_ACCOUNTNUMBERFORMAT\":true,\"REJECT_RESCHEDULELOAN\":true,\"WITHDRAWTRANSFER_CLIENT_CHECKER\":true,\"CREATE_GLCLOSURE\":true,\"CREATE_ADDRESS\":true,\"UPDATE_GROUP_CHECKER\":true,\"DELETE_USER\":true,\"RECOVERYPAYMENT_LOAN\":true,\"DEFINEOPENINGBALANCE_JOURNALENTRY\":true,\"CREATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"WITHDRAWAL_SAVINGSACCOUNT\":true,\"DELETE_ROLE_CHECKER\":true,\"READ_CENTER\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT\":true,\"TRANSFERCLIENTS_GROUP_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT\":true,\"READ_GLACCOUNT\":true,\"READ_AUDIT\":true,\"REJECT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CONFIGURATION\":true,\"DELETE_LOANPRODUCT_CHECKER\":true,\"DELETE_SAVINGSACCOUNTCHARGE\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_OFFICETRANSACTION\":true,\"FORECLOSURE_LOAN_CHECKER\":true,\"CREATE_ACCOUNTTRANSFER\":true,\"DELETE_SMS_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT\":true,\"ALLOCATECASHTOCASHIER_TELLER\":true,\"DELETE_CODE_CHECKER\":true,\"READ_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary(Pentaho)\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_CALENDAR_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER\":true,\"UPDATE_TELLER\":true,\"PAY_SAVINGSACCOUNTCHARGE\":true,\"READ_ACCOUNTINGRULE\":true,\"READ_COLLATERAL\":true,\"DELETE_ACCOUNTINGRULE\":true,\"REACTIVATE_CLIENT_CHECKER\":true,\"READ_CLIENTIDENTIFIER\":true,\"UPDATE_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary\":true,\"UPDATE_LOANCHARGE\":true,\"DELETE_PROVISIONCATEGORY\":true,\"READ_OFFICETRANSACTION\":true,\"READ_Funds Disbursed Between Dates Summary by Office\":true,\"UNDOTRANSACTION_CLIENT_CHECKER\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT_CHECKER\":true,\"UPDATE_LIKELIHOOD\":true,\"CREATE_REPORT\":true,\"DELETE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_MEETING\":true,\"DELETE_CODE\":true,\"REACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_PERMISSION_CHECKER\":true,\"CREATE_ORGANISATIONCREDITBUREAU\":true,\"CLOSE_SMSCAMPAIGN\":true,\"CLOSE_CENTER\":true,\"DELETE_REPORT_CHECKER\":true,\"CREATE_INTERESTRATECHART\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_OFFICE_CHECKER\":true,\"READ_Portfolio at Risk by Branch\":true,\"CLOSEASRESCHEDULED_LOAN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT\":true,\"READ_HOLIDAY\":true,\"UPDATE_SCHEDULER\":true,\"UPDATE_WORKINGDAYS_CHECKER\":true,\"DELETE_CLIENT\":true,\"TRANSFERCLIENTS_GROUP\":true,\"REVERSE_JOURNALENTRY\":true,\"CLOSE_SAVINGSACCOUNT\":true,\"DELETE_GROUPNOTE_CHECKER\":true,\"READ_Trial Balance\":true,\"WRITEOFF_LOAN_CHECKER\":true,\"DELETE_FUND_CHECKER\":true,\"DELETE_STANDINGINSTRUCTION \":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_GROUP_CHECKER\":true,\"CREATE_LOANPRODUCT_CHECKER\":true,\"READ_Savings Transactions\":true,\"READ_HOOK\":true,\"READ_DIVIDEND_SHAREPRODUCT\":true,\"DELETE_GROUP_CHECKER\":true,\"READ_GROUPNOTE\":true,\"CREATE_ACCOUNTINGRULE\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_LOANTRANSACTIONNOTE\":true,\"REJECT_RECURRINGDEPOSITACCOUNT\":true,\"DELETECASHIERALLOCATION_TELLER\":true,\"REJECTTRANSFER_CLIENT_CHECKER\":true,\"CREATE_SMS_CHECKER\":true,\"CREATE_LOANNOTE_CHECKER\":true,\"CREATE_SSBENEFICIARYTPT\":true,\"READ_CHARGE\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER\":true,\"SAVECOLLECTIONSHEET_CENTER\":true,\"DELETE_CLIENTNOTE_CHECKER\":true,\"CREATE_USER_CHECKER\":true,\"SETTLECASHFROMCASHIER_TELLER\":true,\"DELETE_LOANCHARGE\":true,\"READ_ENTITY_DATATABLE_CHECK\":true,\"READ_Loans Awaiting Disbursal\":true,\"READ_SSBENEFICIARYTPT\":true,\"UPDATE_DOCUMENT\":true,\"READ_CODE\":true,\"READ_Expected Payments By Date - Basic\":true,\"CREATE_SHAREPRODUCT\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CONFIGURATION_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"CREATE_JOURNALENTRY\":true,\"UPDATE_ROLE_CHECKER\":true,\"UPDATE_LOANPRODUCT\":true,\"CREATE_TAXGROUP_CHECKER\":true,\"READ_CLIENTNOTE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary(Pentaho)\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT\":true,\"READ_Aging Summary (Arrears in Weeks)\":true,\"BLOCK_SAVINGSACCOUNT\":true,\"UPDATE_FUND\":true,\"UPDATE_SMS\":true,\"DELETE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_FIXEDDEPOSITPRODUCT\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT\":true,\"READ_Written-Off Loans(Pentaho)\":true,\"REJECT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_HOLIDAY_CHECKER\":true,\"CREATE_GUARANTOR\":true,\"CREATE_ENTITY_DATATABLE_CHECK\":true,\"UPDATE_CALENDAR\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT\":true,\"EXECUTE_PERIODICACCRUALACCOUNTING\":true,\"UPDATE_DISBURSEMENTDETAIL\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER\":true,\"UPDATESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_CODE_CHECKER\":true,\"UPDATE_FUND_CHECKER\":true,\"REGISTER_SURVEY\":true,\"UPDATE_LOANPRODUCT_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER\":true,\"UPDATE_CLIENTNOTE_CHECKER\":true,\"DELETE_COLLATERAL_CHECKER\":true,\"UNBLOCK_SAVINGSACCOUNT_CHECKER\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN\":true,\"READ_FieldAgentStats\":true,\"DELETE_GROUPNOTE\":true,\"READ_Loans Awaiting Disbursal(Pentaho)\":true,\"UPDATE_GROUPNOTE\":true,\"READ_SCHEDULER\":true,\"DELETE_CLIENTCHARGE_CHECKER\":true,\"DELETE_CLIENTIDENTIFIER\":true,\"READ_Active Loans Passed Final Maturity\":true,\"UPDATESAVINGSACCOUNT_CLIENT\":true,\"CREATE_LOANCHARGE\":true,\"DELETE_OFFICE_CHECKER\":true,\"READ_FINANCIALACTIVITYACCOUNT\":true,\"REJECT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Loans Listing(Pentaho)\":true,\"CREATE_MEETING\":true,\"UNDOWITHDRAWAL_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT\":true,\"UPDATE_REPORT_CHECKER\":true,\"DELETE_STAFFIMAGE_CHECKER\":true,\"DELETE_FUND\":true,\"INACTIVATE_CLIENTCHARGE_CHECKER\":true,\"WAIVE_LOANCHARGE_CHECKER\":true,\"READ_Disbursal Report\":true,\"READ_Aging Summary (Arrears in Weeks)(Pentaho)\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_OFFICE\":true,\"CREATE_CODE\":true,\"CREATE_CLIENTNOTE_CHECKER\":true,\"DELETE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_LOANTRANSACTIONNOTE\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_STAFFIMAGE\":true}}',1,'2018-01-26 10:03:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(17,'CREATE','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/template',3,NULL,'{\"name\":\"Accountant\",\"description\":\"Accountant\"}',1,'2018-01-26 10:06:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(18,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/3/permissions',3,NULL,'{\"permissions\":{\"CREATE_CALENDAR\":true,\"READ_ROLE\":true,\"DELETE_PAYMENTTYPE\":true,\"DELETE_HOOK\":true,\"CREATE_CODEVALUE_CHECKER\":true,\"DELETE_COLLATERAL\":true,\"UPDATE_CODEVALUE\":true,\"UPDATE_ADDRESS\":true,\"READ_LOANTRANSACTIONNOTE\":true,\"READ_CALENDAR\":true,\"READ_SMS\":true,\"DELETE_PROVISIONCRITERIA\":true,\"UPDATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE\":true,\"CREATE_OFFICE_CHECKER\":true,\"DELETE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"DELETE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_SMS_CHECKER\":true,\"DELETE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATECASHIERALLOCATION_TELLER\":true,\"UPDATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_FIXEDDEPOSITPRODUCT\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN\":true,\"DELETE_CALENDAR_CHECKER\":true,\"DELETE_HOLIDAY\":true,\"UPDATE_REPORTMAILINGJOB\":true,\"CREATE_TAXGROUP\":true,\"CLOSE_GROUP\":true,\"UPDATE_OFFICE\":true,\"CREATE_COLLATERAL_CHECKER\":true,\"CREATE_ACCOUNTNUMBERFORMAT\":true,\"UPDATE_GLACCOUNT\":true,\"UPDATE_CODE\":true,\"CREATE_CLIENTCHARGE\":true,\"CREATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_STAFF_CHECKER\":true,\"UPDATE_DATATABLE_CHECKER\":true,\"PAY_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_TAXCOMPONENT_CHECKER\":true,\"DELETE_LOANCHARGE_CHECKER\":true,\"DELETE_GLACCOUNT\":true,\"UPDATE_CACHE\":true,\"READ_CURRENCY\":true,\"READ_TAXGROUP\":true,\"CREATE_CHARTSLAB\":true,\"UPDATE_FLOATINGRATE_CHECKER\":true,\"UPDATE_SMSCAMPAIGN\":true,\"INACTIVATE_CLIENTCHARGE\":true,\"CREATE_PAYMENTTYPE\":true,\"RECREATE_PROVISIONENTRIES\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_REPORT\":true,\"READ_DOCUMENT\":true,\"REMOVESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"DELETE_LOAN_CHECKER\":true,\"READ_LOANNOTE\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT\":true,\"DELETE_TEMPLATE\":true,\"UPDATE_CHARTSLAB_CHECKER\":true,\"READ_RESCHEDULELOAN\":true,\"UPDATE_GUARANTOR_CHECKER\":true,\"READ_LOAN\":true,\"READ_TAXCOMPONENT\":true,\"READ_SMSCAMPAIGN\":true,\"UPDATE_CHARGE\":true,\"CREATE_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_ADDRESS_CHECKER\":true,\"CREATE_PROVISIONCATEGORY\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"CREATE_STAFFIMAGE_CHECKER\":true,\"CREATE_FUND\":true,\"DELETE_FINANCIALACTIVITYACCOUNT\":true,\"CREATE_CODE_CHECKER\":true,\"READ_PAYMENTTYPE\":true,\"UPDATE_TAXCOMPONENT\":true,\"READ_GLCLOSURE\":true,\"DELETE_CODEVALUE\":true,\"DELETE_SMSCAMPAIGN_CHECKER\":true,\"DELETE_CHARGE\":true,\"CREATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT_CHECKER\":true,\"DISABLE_ROLE_CHECKER\":true,\"DELETE_CODEVALUE_CHECKER\":true,\"CREATE_PROVISIONCRITERIA\":true,\"READ_PRODUCTMIX\":true,\"UPDATE_EXTERNALSERVICES\":true,\"UPDATE_SAVINGSPRODUCT\":true,\"WITHDRAW_CLIENT\":true,\"READ_STANDINGINSTRUCTION \":true,\"READ_MEETING\":true,\"CREATE_SAVINGSPRODUCT\":true,\"UPDATE_TAXGROUP\":true,\"UPDATE_SAVINGSACCOUNT\":true,\"CREATE_SMSCAMPAIGN_CHECKER\":true,\"READ_CLIENT\":true,\"UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"UPDATE_LOANTRANSACTIONNOTE\":true,\"CREATE_CODEVALUE\":true,\"DELETE_LOANNOTE_CHECKER\":true,\"UPDATERUNNINGBALANCE_JOURNALENTRY\":true,\"CREATE_STANDINGINSTRUCTION \":true,\"CREATE_ADDRESS_CHECKER\":true,\"READ_RECURRINGDEPOSITPRODUCT\":true,\"UPDATE_COLLATERAL\":true,\"WAIVE_CLIENTCHARGE\":true,\"READ_REPORTMAILINGJOB\":true,\"DELETE_STAFF\":true,\"READ_STAFF\":true,\"CREATE_PRODUCTMIX\":true,\"CREATE_FLOATINGRATE\":true,\"UPDATE_ACCOUNTINGRULE\":true,\"CREATE_ENTITYMAPPING\":true,\"UPDATE_CLIENTCHARGE\":true,\"CREATE_DATATABLE\":true,\"DELETE_HOLIDAY_CHECKER\":true,\"WAIVE_SAVINGSACCOUNTCHARGE\":true,\"CREATE_HOLIDAY\":true,\"SAVEORUPDATEATTENDANCE_MEETING\":true,\"UPDATE_SAVINGNOTE_CHECKER\":true,\"DELETE_SMSCAMPAIGN\":true,\"CREATE_STAFF\":true,\"DELETE_TELLER\":true,\"CREATE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_HOLIDAY\":true,\"READ_GUARANTOR\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"UPDATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_USER_CHECKER\":true,\"UPDATE_TEMPLATE\":true,\"UPDATE_CALENDAR_CHECKER\":true,\"UPDATE_PAYMENTTYPE\":true,\"CREATE_GLACCOUNT\":true,\"READ_SAVINGSPRODUCT\":true,\"CREATE_SAVINGNOTE_CHECKER\":true,\"PAY_CLIENTCHARGE_CHECKER\":true,\"CREATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_FIXEDDEPOSITACCOUNT\":true,\"CREATE_PROVISIONJOURNALENTRIES\":true,\"DELETE_ACCOUNTNUMBERFORMAT\":true,\"CREATE_CHARTSLAB_CHECKER\":true,\"CREATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_HOOK\":true,\"UPDATE_INTERESTRATECHART_CHECKER\":true,\"DELETE_SAVINGSPRODUCT\":true,\"DELETE_REPORTMAILINGJOB\":true,\"READ_CLIENTIMAGE\":true,\"DELETE_CHARGE_CHECKER\":true,\"CREATE_CHARGE_CHECKER\":true,\"ENABLE_ROLE\":true,\"DELETE_ADDRESS\":true,\"DELETE_PRODUCTMIX\":true,\"UPDATE_CODEVALUE_CHECKER\":true,\"UPDATE_SMSCAMPAIGN_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ACCOUNTNUMBERFORMAT\":true,\"UPDATE_PERMISSION\":true,\"CREATE_HOLIDAY_CHECKER\":true,\"UPDATE_FIXEDDEPOSITACCOUNT\":true,\"CREATE_ROLE\":true,\"UPDATE_FLOATINGRATE\":true,\"UPDATE_ENTITYMAPPING\":true,\"CREATE_REPORT_CHECKER\":true,\"CREATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"DELETE_GLCLOSURE\":true,\"UPDATE_GUARANTOR\":true,\"PERMISSIONS_ROLE\":true,\"CREATE_USER\":true,\"ACTIVATE_HOLIDAY_CHECKER\":true,\"DELETE_SAVINGNOTE_CHECKER\":true,\"REGISTER_DATATABLE_CHECKER\":true,\"WAIVE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"DELETE_FIXEDDEPOSITACCOUNT\":true,\"CREATE_DATATABLE_CHECKER\":true,\"DEREGISTER_DATATABLE\":true,\"READ_STAFFIMAGE\":true,\"UPDATE_SAVINGSACCOUNTCHARGE\":true,\"READ_USER\":true,\"READ_SAVINGSACCOUNTCHARGE\":true,\"DELETE_ROLE\":true,\"DELETE_INTERESTRATECHART\":true,\"DELETE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_JOURNALENTRY_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_ORGANISATIONCREDITBUREAU\":true,\"ACTIVATE_HOLIDAY\":true,\"READ_FLOATINGRATE\":true,\"DELETE_ENTITY_DATATABLE_CHECK\":true,\"REGISTER_DATATABLE\":true,\"UPDATE_ROLE\":true,\"UPDATE_LOANCHARGE_CHECKER\":true,\"CREATE_COLLATERAL\":true,\"DELETE_SAVINGSPRODUCT_CHECKER\":true,\"CREATE_LOANCHARGE_CHECKER\":true,\"CREATE_SMSCAMPAIGN\":true,\"CREATE_REPORTMAILINGJOB\":true,\"CREATE_PROVISIONENTRIES\":true,\"CREATE_TAXCOMPONENT\":true,\"DELETE_ENTITYMAPPING\":true,\"CREATE_FINANCIALACTIVITYACCOUNT\":true,\"DEREGISTER_DATATABLE_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_SMS\":true,\"ENABLE_ROLE_CHECKER\":true,\"WAIVE_CLIENTCHARGE_CHECKER\":true,\"CREATE_ROLE_CHECKER\":true,\"UPDATE_CURRENCY\":true,\"UPDATE_PRODUCTMIX\":true,\"UPDATE_CONFIGURATION\":true,\"UPDATE_USER_CHECKER\":true,\"UPDATE_TAXGROUP_CHECKER\":true,\"CREATE_STAFF_CHECKER\":true,\"UPDATE_GLCLOSURE\":true,\"DELETE_GUARANTOR\":true,\"DELETE_STAFF_CHECKER\":true,\"CREATE_SAVINGNOTE\":true,\"CREATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_FINANCIALACTIVITYACCOUNT\":true,\"SAVE_COLLECTIONSHEET\":true,\"READ_CLIENTCHARGE\":true,\"UPDATE_PROVISIONCRITERIA\":true,\"READ_SAVINGSACCOUNT\":true,\"CREATE_HOOK\":true,\"WAIVE_LOANCHARGE\":true,\"CREATE_CHARGE\":true,\"UNDOWITHDRAWAL_CLIENT\":true,\"READ_SAVINGNOTE\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_DATATABLE_CHECKER\":true,\"CREATE_GUARANTOR_CHECKER\":true,\"READ_JOURNALENTRY\":true,\"DELETE_CALENDAR\":true,\"UPDATE_MEETING\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"READ_WORKINGDAYS\":true,\"CREATE_FUND_CHECKER\":true,\"READ_CACHE\":true,\"READ_COLLECTIONSHEET\":true,\"UPDATE_PASSWORD_PREFERENCES_CHECKER\":true,\"CREATE_FLOATINGRATE_CHECKER\":true,\"DELETE_CLIENTCHARGE\":true,\"READ_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_OFFICETRANSACTION\":true,\"UPDATE_USER\":true,\"UPDATE_CURRENCY_CHECKER\":true,\"DELETE_LOANTRANSACTIONNOTE_CHECKER\":true,\"READ_PERMISSION\":true,\"DELETE_INTERESTRATECHART_CHECKER\":true,\"CREATE_RECURRINGDEPOSITPRODUCT\":true,\"ALLOCATECASHIER_TELLER\":true,\"CREATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_DATATABLE\":true,\"UPDATE_ADDRESS_CHECKER\":true,\"READ_ADDRESS\":true,\"READ_LOANPRODUCT\":true,\"UPDATE_COLLATERAL_CHECKER\":true,\"UPDATE_WORKINGDAYS\":true,\"UPDATE_INTERESTRATECHART\":true,\"FORECLOSURE_LOAN\":true,\"CREATE_OFFICE\":true,\"READ_CODEVALUE\":true,\"WITHDRAW_CLIENT_CHECKER\":true,\"DELETE_SMS\":true,\"ACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_CHARGE_CHECKER\":true,\"DISABLE_ROLE\":true,\"RECOVERGUARANTEES_LOAN_CHECKER\":true,\"DELETE_STAFFIMAGE\":true,\"CREATE_TELLER\":true,\"CREATE_LOANPRODUCT\":true,\"DELETE_REPORT\":true,\"UPDATE_DATATABLE\":true,\"CREATE_TEMPLATE\":true,\"DELETE_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_LOANNOTE\":true,\"DELETE_GUARANTOR_CHECKER\":true,\"DELETE_LOANPRODUCT\":true,\"UPDATE_TAXCOMPONENT_CHECKER\":true,\"READ_TEMPLATE\":true,\"UPDATE_REPORT\":true,\"CREATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE_CHECKER\":true,\"UPDATE_STANDINGINSTRUCTION \":true,\"UPDATE_PASSWORD_PREFERENCES\":true,\"READ_FUND\":true,\"UPDATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_SAVINGNOTE\":true,\"CREATE_DOCUMENT_CHECKER\":true,\"DELETE_CHARTSLAB_CHECKER\":true,\"DELETE_CHARTSLAB\":true,\"UPDATE_CHARTSLAB\":true,\"DELETE_SAVINGSACCOUNT\":true,\"READ_PASSWORD_PREFERENCES\":true,\"PAY_CLIENTCHARGE\":true,\"UPDATE_STAFF\":true,\"RECOVERGUARANTEES_LOAN\":true,\"UPDATE_SAVINGNOTE\":true,\"UPDATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_LOAN_CHECKER\":true,\"EXECUTEJOB_SCHEDULER\":true,\"READ_DATATABLE\":true,\"READ_ACCOUNTNUMBERFORMAT\":true,\"WITHDRAWTRANSFER_CLIENT_CHECKER\":true,\"CREATE_GLCLOSURE\":true,\"CREATE_ADDRESS\":true,\"DELETE_USER\":true,\"DEFINEOPENINGBALANCE_JOURNALENTRY\":true,\"CREATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"DELETE_ROLE_CHECKER\":true,\"READ_GLACCOUNT\":true,\"READ_AUDIT\":true,\"READ_CONFIGURATION\":true,\"DELETE_LOANPRODUCT_CHECKER\":true,\"DELETE_SAVINGSACCOUNTCHARGE\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE\":true,\"CREATE_OFFICETRANSACTION\":true,\"FORECLOSURE_LOAN_CHECKER\":true,\"DELETE_SMS_CHECKER\":true,\"ALLOCATECASHTOCASHIER_TELLER\":true,\"DELETE_CODE_CHECKER\":true,\"CREATE_CALENDAR_CHECKER\":true,\"UPDATE_TELLER\":true,\"PAY_SAVINGSACCOUNTCHARGE\":true,\"READ_ACCOUNTINGRULE\":true,\"READ_COLLATERAL\":true,\"DELETE_ACCOUNTINGRULE\":true,\"UPDATE_LOANCHARGE\":true,\"DELETE_PROVISIONCATEGORY\":true,\"READ_OFFICETRANSACTION\":true,\"UPDATE_LIKELIHOOD\":true,\"CREATE_REPORT\":true,\"DELETE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_MEETING\":true,\"DELETE_CODE\":true,\"REACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_PERMISSION_CHECKER\":true,\"CREATE_ORGANISATIONCREDITBUREAU\":true,\"CLOSE_SMSCAMPAIGN\":true,\"CLOSE_CENTER\":true,\"DELETE_REPORT_CHECKER\":true,\"CREATE_INTERESTRATECHART\":true,\"UPDATE_OFFICE_CHECKER\":true,\"READ_HOLIDAY\":true,\"UPDATE_SCHEDULER\":true,\"UPDATE_WORKINGDAYS_CHECKER\":true,\"REVERSE_JOURNALENTRY\":true,\"DELETE_FUND_CHECKER\":true,\"DELETE_STANDINGINSTRUCTION \":true,\"CREATE_LOANPRODUCT_CHECKER\":true,\"READ_HOOK\":true,\"CREATE_ACCOUNTINGRULE\":true,\"CREATE_LOANTRANSACTIONNOTE\":true,\"DELETECASHIERALLOCATION_TELLER\":true,\"CREATE_SMS_CHECKER\":true,\"CREATE_LOANNOTE_CHECKER\":true,\"READ_CHARGE\":true,\"DELETE_CLIENTNOTE_CHECKER\":true,\"CREATE_USER_CHECKER\":true,\"SETTLECASHFROMCASHIER_TELLER\":true,\"DELETE_LOANCHARGE\":true,\"READ_ENTITY_DATATABLE_CHECK\":true,\"READ_CODE\":true,\"UPDATE_CONFIGURATION_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"CREATE_JOURNALENTRY\":true,\"UPDATE_ROLE_CHECKER\":true,\"UPDATE_LOANPRODUCT\":true,\"CREATE_TAXGROUP_CHECKER\":true,\"READ_CLIENTNOTE\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_FUND\":true,\"UPDATE_SMS\":true,\"DELETE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_HOLIDAY_CHECKER\":true,\"CREATE_GUARANTOR\":true,\"CREATE_ENTITY_DATATABLE_CHECK\":true,\"UPDATE_CALENDAR\":true,\"CREATE_SAVINGSACCOUNT\":true,\"EXECUTE_PERIODICACCRUALACCOUNTING\":true,\"UPDATE_DISBURSEMENTDETAIL\":true,\"UPDATESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"UPDATE_CODE_CHECKER\":true,\"UPDATE_FUND_CHECKER\":true,\"UPDATE_LOANPRODUCT_CHECKER\":true,\"DELETE_COLLATERAL_CHECKER\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN\":true,\"READ_SCHEDULER\":true,\"DELETE_CLIENTCHARGE_CHECKER\":true,\"UPDATESAVINGSACCOUNT_CLIENT\":true,\"CREATE_LOANCHARGE\":true,\"DELETE_OFFICE_CHECKER\":true,\"READ_FINANCIALACTIVITYACCOUNT\":true,\"CREATE_MEETING\":true,\"UNDOWITHDRAWAL_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT\":true,\"UPDATE_REPORT_CHECKER\":true,\"DELETE_STAFFIMAGE_CHECKER\":true,\"DELETE_FUND\":true,\"INACTIVATE_CLIENTCHARGE_CHECKER\":true,\"WAIVE_LOANCHARGE_CHECKER\":true,\"READ_OFFICE\":true,\"CREATE_CODE\":true,\"DELETE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_LOANTRANSACTIONNOTE\":true,\"CREATE_STAFFIMAGE\":true}}',1,'2018-01-26 10:13:41',NULL,NULL,1,NULL,NULL,NULL,NULL),(19,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/2/permissions',2,NULL,'{\"permissions\":{\"CREATE_CLIENT\":false,\"ACTIVATE_CLIENT\":false}}',1,'2018-01-26 11:22:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(20,'CREATE','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/template',4,NULL,'{\"name\":\"Loan Officer\",\"description\":\"Loan Officer\"}',1,'2018-01-26 11:23:10',NULL,NULL,1,NULL,NULL,NULL,NULL),(21,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/4/permissions',4,NULL,'{\"permissions\":{\"DISASSOCIATECLIENTS_GROUP\":true,\"CREATE_CALENDAR\":true,\"READ_ROLE\":true,\"DELETE_PAYMENTTYPE\":true,\"DELETE_HOOK\":true,\"CREATE_CODEVALUE_CHECKER\":true,\"DELETE_COLLATERAL\":true,\"READ_Active Loans - Summary(Pentaho)\":true,\"ACTIVATE_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_CODEVALUE\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_ADDRESS\":true,\"READ_LOANTRANSACTIONNOTE\":true,\"REJECT_SAVINGSACCOUNT\":true,\"READ_CALENDAR\":true,\"READ_GroupSummaryCounts\":true,\"PROPOSETRANSFER_CLIENT_CHECKER\":true,\"READ_SMS\":true,\"DELETE_PROVISIONCRITERIA\":true,\"UPDATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE\":true,\"CREATE_OFFICE_CHECKER\":true,\"CLOSE_CLIENT\":true,\"DELETE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Obligation Met Loans Details(Pentaho)\":true,\"DELETE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_SMS_CHECKER\":true,\"REPAYMENT_LOAN_CHECKER\":true,\"DELETE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATECASHIERALLOCATION_TELLER\":true,\"UPDATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Portfolio at Risk by Branch(Pentaho)\":true,\"READ_FIXEDDEPOSITPRODUCT\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN\":true,\"DELETE_CALENDAR_CHECKER\":true,\"DELETE_LOAN\":true,\"DELETE_HOLIDAY\":true,\"UPDATE_REPORTMAILINGJOB\":true,\"READ_Loans Awaiting Disbursal Summary by Month(Pentaho)\":true,\"READ_Aging Summary (Arrears in Months)\":true,\"CREATE_TAXGROUP\":true,\"CLOSE_GROUP\":true,\"UPDATE_OFFICE\":true,\"DELETE_CLIENTIMAGE\":true,\"CREATE_COLLATERAL_CHECKER\":true,\"UNDOWRITEOFF_LOAN\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT\":true,\"CREATE_ACCOUNTNUMBERFORMAT\":true,\"DELETE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_GLACCOUNT\":true,\"UPDATE_CODE\":true,\"CREATE_CLIENTCHARGE\":true,\"CREATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_STAFF_CHECKER\":true,\"UPDATE_DATATABLE_CHECKER\":true,\"READ_Expected Payments By Date - Formatted\":true,\"ADJUSTTRANSACTION_SAVINGSACCOUNT\":true,\"PAY_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_TAXCOMPONENT_CHECKER\":true,\"CLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOANCHARGE_CHECKER\":true,\"APPROVEADDITIONALSHARES_SHAREACCOUNT\":true,\"APPROVALUNDO_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_GLACCOUNT\":true,\"READ_Active Loans in last installment Summary(Pentaho)\":true,\"CLOSE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CACHE\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CURRENCY\":true,\"READ_TAXGROUP\":true,\"DELETE_CLIENTIMAGE_CHECKER\":true,\"APPROVE_SAVINGSACCOUNT\":true,\"CREATE_CHARTSLAB\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT\":true,\"READ_Active Loans - Details\":true,\"UPDATE_FLOATINGRATE_CHECKER\":true,\"UPDATE_SMSCAMPAIGN\":true,\"INACTIVATE_CLIENTCHARGE\":true,\"CREATE_PAYMENTTYPE\":true,\"RECREATE_PROVISIONENTRIES\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_REPORT\":true,\"READ_DOCUMENT\":true,\"REMOVESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOAN_CHECKER\":true,\"READ_LOANNOTE\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT\":true,\"DELETE_TEMPLATE\":true,\"UPDATE_CHARTSLAB_CHECKER\":true,\"CLOSE_SAVINGSACCOUNT_CHECKER\":true,\"READ_RESCHEDULELOAN\":true,\"UPDATE_GUARANTOR_CHECKER\":true,\"READ_ProgramDetails\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_LOAN\":true,\"READ_TAXCOMPONENT\":true,\"CREATE_DIVIDEND_SHAREPRODUCT\":true,\"READ_SMSCAMPAIGN\":true,\"UPDATE_CHARGE\":true,\"DELETE_DOCUMENT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_ADDRESS_CHECKER\":true,\"CREATE_PROVISIONCATEGORY\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"POSTINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"ACTIVATE_CLIENT\":true,\"CREATE_STAFFIMAGE_CHECKER\":true,\"READ_Daily Teller Cash Report (Pentaho)\":true,\"CREATE_FUND\":true,\"DELETE_FINANCIALACTIVITYACCOUNT\":true,\"CREATE_CODE_CHECKER\":true,\"READ_PAYMENTTYPE\":true,\"UPDATE_TAXCOMPONENT\":true,\"APPLYADDITIONALSHARES_SHAREACCOUNT\":true,\"READ_GLCLOSURE\":true,\"DELETE_CODEVALUE\":true,\"DELETE_SMSCAMPAIGN_CHECKER\":true,\"DELETE_CHARGE\":true,\"CREATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT_CHECKER\":true,\"DISABLE_ROLE_CHECKER\":true,\"CREATE_LOANNOTE\":true,\"DELETE_CODEVALUE_CHECKER\":true,\"CREATE_PROVISIONCRITERIA\":true,\"ACTIVATE_SAVINGSACCOUNT\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT\":true,\"READ_PRODUCTMIX\":true,\"UPDATE_EXTERNALSERVICES\":true,\"UPDATE_SAVINGSPRODUCT\":true,\"WITHDRAW_CLIENT\":true,\"REDEEMSHARES_SHAREACCOUNT\":true,\"UPDATE_SHAREACCOUNT\":true,\"READ_STANDINGINSTRUCTION \":true,\"CREATE_CLIENTIMAGE\":true,\"READ_Active Loans by Disbursal Period\":true,\"DEPOSIT_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Pending Approval(Pentaho)\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_MEETING\":true,\"CREATE_SAVINGSPRODUCT\":true,\"SAVECOLLECTIONSHEET_GROUP\":true,\"READ_Branch Expected Cash Flow\":true,\"HOLDAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"ACTIVATE_CLIENT_CHECKER\":true,\"UPDATE_TAXGROUP\":true,\"READ_Active Loans - Summary\":true,\"READ_GroupNamesByStaff\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT\":true,\"CREATE_SMSCAMPAIGN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"REFUNDBYCASH_LOAN_CHECKER\":true,\"ACTIVATE_SHAREACCOUNT\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT\":true,\"READ_CLIENT\":true,\"CLOSEASRESCHEDULED_LOAN\":true,\"UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE\":true,\"DEPOSIT_SAVINGSACCOUNT\":true,\"READ_Expected Payments By Date - Basic(Pentaho)\":true,\"READ_Loans Awaiting Disbursal Summary by Month\":true,\"REACTIVATE_CLIENT\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT\":true,\"CREATE_CODEVALUE\":true,\"DELETE_LOANNOTE_CHECKER\":true,\"UNASSIGNSTAFF_GROUP_CHECKER\":true,\"UPDATERUNNINGBALANCE_JOURNALENTRY\":true,\"CREATE_STANDINGINSTRUCTION \":true,\"CREATE_ADDRESS_CHECKER\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT\":true,\"READ_RECURRINGDEPOSITPRODUCT\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_DOCUMENT_CHECKER\":true,\"READ_TxnRunningBalances\":true,\"UPDATE_COLLATERAL\":true,\"ASSOCIATEGROUPS_CENTER_CHECKER\":true,\"WAIVE_CLIENTCHARGE\":true,\"PROPOSETRANSFER_CLIENT\":true,\"REJECTTRANSFER_CLIENT\":true,\"READ_REPORTMAILINGJOB\":true,\"DELETE_STAFF\":true,\"CREATE_CLIENTIMAGE_CHECKER\":true,\"READ_STAFF\":true,\"CREATE_PRODUCTMIX\":true,\"CREATE_FLOATINGRATE\":true,\"READ_Active Loans by Disbursal Period(Pentaho)\":true,\"UPDATE_ACCOUNTINGRULE\":true,\"CREATE_ENTITYMAPPING\":true,\"UPDATE_CLIENTCHARGE\":true,\"READ_ChildrenStaffList\":true,\"CREATE_DATATABLE\":true,\"READ_Client Loans Listing\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ACTIVATE_CENTER_CHECKER\":true,\"APPROVE_SHAREACCOUNT\":true,\"DELETE_HOLIDAY_CHECKER\":true,\"WAIVE_SAVINGSACCOUNTCHARGE\":true,\"READ_BranchManagerStats\":true,\"CREATE_HOLIDAY\":true,\"READ_Disbursal_Vs_Awaitingdisbursal\":true,\"SAVEORUPDATEATTENDANCE_MEETING\":true,\"UPDATE_SAVINGNOTE_CHECKER\":true,\"DELETE_SMSCAMPAIGN\":true,\"CREATE_STAFF\":true,\"UPDATEROLE_GROUP\":true,\"READ_Client Saving Transactions\":true,\"DELETE_TELLER\":true,\"READ_ProgramDirectorStats\":true,\"CREATE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_HOLIDAY\":true,\"READ_GUARANTOR\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"REMOVELOANOFFICER_LOAN_CHECKER\":true,\"READ_Balance Outstanding\":true,\"UPDATE_CENTER_CHECKER\":true,\"READ_Rescheduled Loans(Pentaho)\":true,\"UPDATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Obligation Met Loans Summary\":true,\"DELETE_USER_CHECKER\":true,\"UPDATE_TEMPLATE\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATE_CALENDAR_CHECKER\":true,\"CREATE_GROUPNOTE\":true,\"UPDATE_PAYMENTTYPE\":true,\"CREATE_GLACCOUNT\":true,\"READ_SAVINGSPRODUCT\":true,\"CREATE_SAVINGNOTE_CHECKER\":true,\"READ_FieldAgentPrograms\":true,\"PAY_CLIENTCHARGE_CHECKER\":true,\"CREATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_FIXEDDEPOSITACCOUNT\":true,\"CREATE_PROVISIONJOURNALENTRIES\":true,\"UNDOREJECT_CLIENT\":true,\"DELETE_ACCOUNTNUMBERFORMAT\":true,\"CREATE_CLIENT_CHECKER\":true,\"CREATE_CHARTSLAB_CHECKER\":true,\"CREATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_HOOK\":true,\"UNDOAPPROVAL_SHAREACCOUNT\":true,\"UPDATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_SSBENEFICIARYTPT\":true,\"CLOSE_LOAN\":true,\"READ_Active Loans in last installment(Pentaho)\":true,\"DELETE_SAVINGSPRODUCT\":true,\"UPDATE_LOAN\":true,\"UNASSIGNSTAFF_CLIENT\":true,\"ASSIGNSTAFF_GROUP\":true,\"READ_Demand_Vs_Collection\":true,\"HOLDAMOUNT_SAVINGSACCOUNT\":true,\"DELETE_REPORTMAILINGJOB\":true,\"READ_CLIENTIMAGE\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARGE_CHECKER\":true,\"READ_Portfolio at Risk(Pentaho)\":true,\"CREATE_CHARGE_CHECKER\":true,\"ACTIVATE_GROUP\":true,\"ENABLE_ROLE\":true,\"DELETE_ADDRESS\":true,\"BLOCKCREDIT_SAVINGSACCOUNT\":true,\"REJECT_CLIENT_CHECKER\":true,\"CREATE_GROUP\":true,\"READ_Obligation Met Loans Summary(Pentaho)\":true,\"READ_ProgramStats\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_PRODUCTMIX\":true,\"UPDATE_CODEVALUE_CHECKER\":true,\"READ_Aging Summary (Arrears in Months)(Pentaho)\":true,\"BLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SMSCAMPAIGN_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ACCOUNTNUMBERFORMAT\":true,\"UPDATE_PERMISSION\":true,\"CREATE_CLIENTNOTE\":true,\"CREATE_HOLIDAY_CHECKER\":true,\"UPDATE_FIXEDDEPOSITACCOUNT\":true,\"CREATE_ROLE\":true,\"REMOVELOANOFFICER_LOAN\":true,\"WITHDRAWAL_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_FLOATINGRATE\":true,\"READ_Loan Account Schedule\":true,\"DELETE_CLIENT_CHECKER\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ENTITYMAPPING\":true,\"CREATE_REPORT_CHECKER\":true,\"DISASSOCIATEGROUPS_CENTER_CHECKER\":true,\"WITHDRAW_LOAN\":true,\"CREATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_Written-Off Loans\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_GLCLOSURE\":true,\"UPDATE_GUARANTOR\":true,\"REJECTADDITIONALSHARES_SHAREACCOUNT\":true,\"CLOSE_SHAREACCOUNT\":true,\"PERMISSIONS_ROLE\":true,\"CREATE_USER\":true,\"ACTIVATE_HOLIDAY_CHECKER\":true,\"DELETE_SAVINGNOTE_CHECKER\":true,\"REJECT_FIXEDDEPOSITACCOUNT\":true,\"WAIVEINTERESTPORTION_LOAN_CHECKER\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT\":true,\"ASSIGNSTAFF_CLIENT\":true,\"REGISTER_DATATABLE_CHECKER\":true,\"UPDATE_CLIENTNOTE\":true,\"WAIVE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Active Loans Passed Final Maturity(Pentaho)\":true,\"READ_Portfolio at Risk\":true,\"APPROVE_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary\":true,\"READ_Aging Detail(Pentaho)\":true,\"READ_Active Loans in last installment\":true,\"DELETE_CLIENTNOTE\":true,\"DELETE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"ASSIGNROLE_GROUP\":true,\"READ_Client Listing\":true,\"READ_Loans Pending Approval\":true,\"DELETE_FIXEDDEPOSITACCOUNT\":true,\"BULKREASSIGN_LOAN_CHECKER\":true,\"CREATE_DATATABLE_CHECKER\":true,\"APPROVE_LOAN\":true,\"DEREGISTER_DATATABLE\":true,\"UPDATELOANOFFICER_LOAN\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT\":true,\"READ_STAFFIMAGE\":true,\"UPDATE_SAVINGSACCOUNTCHARGE\":true,\"READ_USER\":true,\"READ_SAVINGSACCOUNTCHARGE\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CENTER\":true,\"DELETE_ROLE\":true,\"UPDATE_GROUPNOTE_CHECKER\":true,\"DELETE_INTERESTRATECHART\":true,\"ASSOCIATEGROUPS_CENTER\":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_JOURNALENTRY_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_ORGANISATIONCREDITBUREAU\":true,\"ACTIVATE_HOLIDAY\":true,\"READ_FLOATINGRATE\":true,\"DELETE_ENTITY_DATATABLE_CHECK\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT\":true,\"REPAYMENT_LOAN\":true,\"REGISTER_DATATABLE\":true,\"ACCEPTTRANSFER_CLIENT\":true,\"READ_Balance Sheet\":true,\"UPDATE_ROLE\":true,\"UPDATE_LOANCHARGE_CHECKER\":true,\"CREATE_COLLATERAL\":true,\"READ_Client Loan Account Schedule\":true,\"READ_LoanTrendsByMonth\":true,\"DELETE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_CLIENTIDENTIFIER\":true,\"READ_Client Savings Summary\":true,\"CREATE_LOANCHARGE_CHECKER\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT\":true,\"CREATE_CLIENT\":true,\"UPDATELOANOFFICER_LOAN_CHECKER\":true,\"ADJUST_LOAN\":true,\"CREATE_SMSCAMPAIGN\":true,\"CREATE_REPORTMAILINGJOB\":true,\"CREATE_PROVISIONENTRIES\":true,\"CREATE_TAXCOMPONENT\":true,\"BLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_DOCUMENT\":true,\"READ_ACCOUNTTRANSFER\":true,\"DELETE_GROUP\":true,\"DELETE_ENTITYMAPPING\":true,\"CREATE_FINANCIALACTIVITYACCOUNT\":true,\"DEREGISTER_DATATABLE_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Active Loans in last installment Summary\":true,\"CREATE_SMS\":true,\"WRITEOFF_LOAN\":true,\"READ_ClientTrendsByWeek\":true,\"CREATE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"READ_Aging Detail\":true,\"READ_GroupSummaryAmounts\":true,\"ENABLE_ROLE_CHECKER\":true,\"WAIVE_CLIENTCHARGE_CHECKER\":true,\"READ_TxnRunningBalances(Pentaho)\":true,\"CREATE_ROLE_CHECKER\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_GROUPNOTE_CHECKER\":true,\"UPDATE_CURRENCY\":true,\"UPDATE_PRODUCTMIX\":true,\"POSTINTEREST_SAVINGSACCOUNT\":true,\"UPDATE_CONFIGURATION\":true,\"UPDATE_USER_CHECKER\":true,\"UPDATE_TAXGROUP_CHECKER\":true,\"CREATE_STAFF_CHECKER\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_GLCLOSURE\":true,\"DELETE_GUARANTOR\":true,\"DELETE_STAFF_CHECKER\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT\":true,\"READ_Obligation Met Loans Details\":true,\"CREATE_SAVINGNOTE\":true,\"READ_GroupSavingSummary\":true,\"CREATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_FINANCIALACTIVITYACCOUNT\":true,\"READ_ClientTrendsByMonth\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_Income Statement\":true,\"SAVE_COLLECTIONSHEET\":true,\"READ_CLIENTCHARGE\":true,\"DELETE_SSBENEFICIARYTPT\":true,\"READ_Funds Disbursed Between Dates Summary\":true,\"UPDATE_PROVISIONCRITERIA\":true,\"WAIVEINTERESTPORTION_LOAN\":true,\"READ_SAVINGSACCOUNT\":true,\"CREATE_HOOK\":true,\"READ_General Ledger Report\":true,\"WAIVE_LOANCHARGE\":true,\"ACTIVATE_GROUP_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER_CHECKER\":true,\"CREATE_CHARGE\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT\":true,\"UNDOWITHDRAWAL_CLIENT\":true,\"READ_SAVINGNOTE\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT\":true,\"ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_DATATABLE_CHECKER\":true,\"APPROVALUNDO_SAVINGSACCOUNT\":true,\"DELETE_DOCUMENT\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"CREATE_GUARANTOR_CHECKER\":true,\"BLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_JOURNALENTRY\":true,\"READ_LoanCyclePerProduct\":true,\"DELETE_CALENDAR\":true,\"UPDATE_MEETING\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"READ_WORKINGDAYS\":true,\"CREATE_FUND_CHECKER\":true,\"READ_CACHE\":true,\"UNASSIGNROLE_GROUP\":true,\"DELETE_CENTER\":true,\"READ_COLLECTIONSHEET\":true,\"UPDATE_PASSWORD_PREFERENCES_CHECKER\":true,\"CREATE_LOAN_CHECKER\":true,\"CREATE_FLOATINGRATE_CHECKER\":true,\"DELETE_CLIENTCHARGE\":true,\"WITHDRAW_LOAN_CHECKER\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Listing(Pentaho)\":true,\"REFUNDBYCASH_LOAN\":true,\"READ_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_OFFICETRANSACTION\":true,\"CREATE_CENTER_CHECKER\":true,\"PAY_LOANCHARGE\":true,\"UPDATE_USER\":true,\"UPDATE_CURRENCY_CHECKER\":true,\"DELETE_LOANTRANSACTIONNOTE_CHECKER\":true,\"READ_PERMISSION\":true,\"DELETE_INTERESTRATECHART_CHECKER\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_RECURRINGDEPOSITPRODUCT\":true,\"READ_LoanTrendsByWeek\":true,\"ALLOCATECASHIER_TELLER\":true,\"CREATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_DATATABLE\":true,\"UPDATE_ADDRESS_CHECKER\":true,\"READ_ADDRESS\":true,\"READ_Funds Disbursed Between Dates Summary by Office(Pentaho)\":true,\"READ_Funds Disbursed Between Dates Summary(Pentaho)\":true,\"READ_LOANPRODUCT\":true,\"UPDATE_COLLATERAL_CHECKER\":true,\"UPDATE_WORKINGDAYS\":true,\"DISASSOCIATEGROUPS_CENTER\":true,\"BLOCK_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_INTERESTRATECHART\":true,\"FORECLOSURE_LOAN\":true,\"UNBLOCK_SAVINGSACCOUNT\":true,\"CREATE_OFFICE\":true,\"READ_CODEVALUE\":true,\"CREATE_SHAREACCOUNT\":true,\"APPROVE_RESCHEDULELOAN\":true,\"WITHDRAW_CLIENT_CHECKER\":true,\"DELETE_SMS\":true,\"ACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_CHARGE_CHECKER\":true,\"ACCEPTTRANSFER_CLIENT_CHECKER\":true,\"DISABLE_ROLE\":true,\"BULKREASSIGN_LOAN\":true,\"RECOVERGUARANTEES_LOAN_CHECKER\":true,\"ASSOCIATECLIENTS_GROUP\":true,\"DELETE_STAFFIMAGE\":true,\"UPDATE_CLIENT_CHECKER\":true,\"CREATE_TELLER\":true,\"CREATE_LOANPRODUCT\":true,\"READ_ClientSummary \":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_REPORT\":true,\"ACTIVATE_CENTER\":true,\"READ_Active Loan Summary per Branch\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT\":true,\"READ_CoordinatorStats\":true,\"UPDATE_DATATABLE\":true,\"CREATE_TEMPLATE\":true,\"DELETE_SAVINGSACCOUNT_CHECKER\":true,\"ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENT\":true,\"DELETE_LOANNOTE\":true,\"READ_Rescheduled Loans\":true,\"DELETE_GUARANTOR_CHECKER\":true,\"DELETE_LOANPRODUCT\":true,\"UPDATE_TAXCOMPONENT_CHECKER\":true,\"READ_TEMPLATE\":true,\"UPDATE_REPORT\":true,\"CREATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE_CHECKER\":true,\"UPDATE_STANDINGINSTRUCTION \":true,\"UPDATE_PASSWORD_PREFERENCES\":true,\"READ_FUND\":true,\"UPDATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_SAVINGNOTE\":true,\"CREATE_DOCUMENT_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARTSLAB_CHECKER\":true,\"UNASSIGNSTAFF_GROUP\":true,\"DELETE_CHARTSLAB\":true,\"UPDATE_CHARTSLAB\":true,\"DELETE_SAVINGSACCOUNT\":true,\"DELETE_CENTER_CHECKER\":true,\"READ_ClientTrendsByDay\":true,\"READ_PASSWORD_PREFERENCES\":true,\"CREATE_ACCOUNTTRANSFER_CHECKER\":true,\"REJECT_CLIENT\":true,\"READ_LoanTrendsByDay\":true,\"PAY_CLIENTCHARGE\":true,\"UPDATE_CENTER\":true,\"UPDATE_STAFF\":true,\"UNDOREJECT_CLIENT_CHECKER\":true,\"RECOVERGUARANTEES_LOAN\":true,\"READ_Staff Assignment History\":true,\"UPDATE_SAVINGNOTE\":true,\"UPDATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_SHAREPRODUCT\":true,\"UPDATE_LOAN_CHECKER\":true,\"EXECUTEJOB_SCHEDULER\":true,\"READ_DATATABLE\":true,\"CLOSE_LOAN_CHECKER\":true,\"READ_Collection Report\":true,\"REJECT_SHAREACCOUNT\":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_ACCOUNTNUMBERFORMAT\":true,\"REJECT_RESCHEDULELOAN\":true,\"WITHDRAWTRANSFER_CLIENT_CHECKER\":true,\"ALL_FUNCTIONS\":true,\"CREATE_GLCLOSURE\":true,\"CREATE_ADDRESS\":true,\"UPDATE_GROUP_CHECKER\":true,\"DELETE_USER\":true,\"RECOVERYPAYMENT_LOAN\":true,\"DEFINEOPENINGBALANCE_JOURNALENTRY\":true,\"CREATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"WITHDRAWAL_SAVINGSACCOUNT\":true,\"DELETE_ROLE_CHECKER\":true,\"READ_CENTER\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT\":true,\"TRANSFERCLIENTS_GROUP_CHECKER\":true,\"CREATE_LOAN\":true,\"WITHDRAW_SAVINGSACCOUNT\":true,\"READ_GLACCOUNT\":true,\"READ_AUDIT\":true,\"REJECT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CONFIGURATION\":true,\"DELETE_LOANPRODUCT_CHECKER\":true,\"DELETE_SAVINGSACCOUNTCHARGE\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_OFFICETRANSACTION\":true,\"FORECLOSURE_LOAN_CHECKER\":true,\"CREATE_ACCOUNTTRANSFER\":true,\"DELETE_SMS_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT\":true,\"ALLOCATECASHTOCASHIER_TELLER\":true,\"DELETE_CODE_CHECKER\":true,\"READ_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary(Pentaho)\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_CALENDAR_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER\":true,\"UPDATE_TELLER\":true,\"PAY_SAVINGSACCOUNTCHARGE\":true,\"READ_ACCOUNTINGRULE\":true,\"READ_COLLATERAL\":true,\"DELETE_ACCOUNTINGRULE\":true,\"REACTIVATE_CLIENT_CHECKER\":true,\"READ_CLIENTIDENTIFIER\":true,\"UPDATE_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary\":true,\"UPDATE_LOANCHARGE\":true,\"DELETE_PROVISIONCATEGORY\":true,\"READ_OFFICETRANSACTION\":true,\"READ_Funds Disbursed Between Dates Summary by Office\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT_CHECKER\":true,\"UPDATE_LIKELIHOOD\":true,\"CREATE_REPORT\":true,\"DELETE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_MEETING\":true,\"DELETE_CODE\":true,\"REACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_PERMISSION_CHECKER\":true,\"CREATE_ORGANISATIONCREDITBUREAU\":true,\"CLOSE_SMSCAMPAIGN\":true,\"CLOSE_CENTER\":true,\"DELETE_REPORT_CHECKER\":true,\"CREATE_INTERESTRATECHART\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_OFFICE_CHECKER\":true,\"READ_Portfolio at Risk by Branch\":true,\"CLOSEASRESCHEDULED_LOAN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT\":true,\"READ_HOLIDAY\":true,\"UPDATE_SCHEDULER\":true,\"UPDATE_WORKINGDAYS_CHECKER\":true,\"DELETE_CLIENT\":true,\"TRANSFERCLIENTS_GROUP\":true,\"REVERSE_JOURNALENTRY\":true,\"CREATE_RESCHEDULELOAN\":true,\"CLOSE_SAVINGSACCOUNT\":true,\"DELETE_GROUPNOTE_CHECKER\":true,\"READ_Trial Balance\":true,\"WRITEOFF_LOAN_CHECKER\":true,\"DELETE_FUND_CHECKER\":true,\"DELETE_STANDINGINSTRUCTION \":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_GROUP_CHECKER\":true,\"CREATE_LOANPRODUCT_CHECKER\":true,\"READ_Savings Transactions\":true,\"READ_HOOK\":true,\"READ_DIVIDEND_SHAREPRODUCT\":true,\"DELETE_GROUP_CHECKER\":true,\"READ_GROUPNOTE\":true,\"CREATE_ACCOUNTINGRULE\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_LOANTRANSACTIONNOTE\":true,\"REJECT_RECURRINGDEPOSITACCOUNT\":true,\"DELETECASHIERALLOCATION_TELLER\":true,\"REJECTTRANSFER_CLIENT_CHECKER\":true,\"CREATE_SMS_CHECKER\":true,\"CREATE_LOANNOTE_CHECKER\":true,\"CREATE_SSBENEFICIARYTPT\":true,\"READ_CHARGE\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER\":true,\"SAVECOLLECTIONSHEET_CENTER\":true,\"DELETE_CLIENTNOTE_CHECKER\":true,\"CREATE_USER_CHECKER\":true,\"SETTLECASHFROMCASHIER_TELLER\":true,\"DELETE_LOANCHARGE\":true,\"READ_ENTITY_DATATABLE_CHECK\":true,\"READ_Loans Awaiting Disbursal\":true,\"READ_SSBENEFICIARYTPT\":true,\"UPDATE_DOCUMENT\":true,\"READ_CODE\":true,\"READ_Expected Payments By Date - Basic\":true,\"CREATE_SHAREPRODUCT\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CONFIGURATION_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"CREATE_JOURNALENTRY\":true,\"UPDATE_ROLE_CHECKER\":true,\"UPDATE_LOANPRODUCT\":true,\"CREATE_TAXGROUP_CHECKER\":true,\"READ_CLIENTNOTE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary(Pentaho)\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT\":true,\"READ_Aging Summary (Arrears in Weeks)\":true,\"BLOCK_SAVINGSACCOUNT\":true,\"UPDATE_FUND\":true,\"UPDATE_SMS\":true,\"DELETE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_FIXEDDEPOSITPRODUCT\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT\":true,\"READ_Written-Off Loans(Pentaho)\":true,\"REJECT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_HOLIDAY_CHECKER\":true,\"CREATE_GUARANTOR\":true,\"CREATE_ENTITY_DATATABLE_CHECK\":true,\"UPDATE_CALENDAR\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT\":true,\"EXECUTE_PERIODICACCRUALACCOUNTING\":true,\"UPDATE_DISBURSEMENTDETAIL\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER\":true,\"UPDATESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_CODE_CHECKER\":true,\"UPDATE_FUND_CHECKER\":true,\"UPDATE_LOANPRODUCT_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER\":true,\"UPDATE_CLIENTNOTE_CHECKER\":true,\"DELETE_COLLATERAL_CHECKER\":true,\"UNBLOCK_SAVINGSACCOUNT_CHECKER\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN\":true,\"READ_FieldAgentStats\":true,\"DELETE_GROUPNOTE\":true,\"READ_Loans Awaiting Disbursal(Pentaho)\":true,\"UPDATE_GROUPNOTE\":true,\"READ_SCHEDULER\":true,\"DELETE_CLIENTCHARGE_CHECKER\":true,\"DELETE_CLIENTIDENTIFIER\":true,\"READ_Active Loans Passed Final Maturity\":true,\"UPDATESAVINGSACCOUNT_CLIENT\":true,\"CREATE_LOANCHARGE\":true,\"DELETE_OFFICE_CHECKER\":true,\"READ_FINANCIALACTIVITYACCOUNT\":true,\"REJECT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Loans Listing(Pentaho)\":true,\"CREATE_MEETING\":true,\"UNDOWITHDRAWAL_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT\":true,\"UPDATE_REPORT_CHECKER\":true,\"DELETE_STAFFIMAGE_CHECKER\":true,\"DELETE_FUND\":true,\"INACTIVATE_CLIENTCHARGE_CHECKER\":true,\"WAIVE_LOANCHARGE_CHECKER\":true,\"READ_Disbursal Report\":true,\"READ_Aging Summary (Arrears in Weeks)(Pentaho)\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_OFFICE\":true,\"CREATE_CODE\":true,\"CREATE_CLIENTNOTE_CHECKER\":true,\"DELETE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_LOANTRANSACTIONNOTE\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_STAFFIMAGE\":true}}',1,'2018-01-26 11:42:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(22,'CREATE','RECURRINGDEPOSITPRODUCT',NULL,NULL,NULL,NULL,NULL,'/recurringdepositproducts/template',1,NULL,'{\"currencyCode\":\"TZS\",\"digitsAfterDecimal\":2,\"interestCompoundingPeriodType\":1,\"interestPostingPeriodType\":4,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"preClosurePenalInterestOnTypeId\":1,\"accountingRule\":\"1\",\"depositAmount\":\"50000\",\"name\":\"Contribution Product\",\"shortName\":\"CP\",\"description\":\"CP\",\"inMultiplesOf\":\"1\",\"minDepositTerm\":\"1\",\"minDepositTermTypeId\":2,\"maxDepositTerm\":\"12\",\"maxDepositTermTypeId\":2,\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[],\"locale\":\"en\",\"charts\":[{\"fromDate\":\"26 January 2018\",\"dateFormat\":\"dd MMMM yyyy\",\"locale\":\"en\",\"chartSlabs\":[{\"fromPeriod\":\"1\",\"amountRangeFrom\":\"1\",\"annualInterestRate\":\"7\",\"locale\":\"en\",\"incentives\":[],\"periodType\":3}]}]}',1,'2018-01-26 12:52:02',NULL,NULL,1,NULL,NULL,NULL,NULL),(23,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/3',3,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":1,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-30 06:38:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(24,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":1,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-30 06:38:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(25,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/2',2,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":1,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-30 06:38:38',NULL,NULL,1,NULL,NULL,NULL,NULL),(26,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/5',5,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":1,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-01-30 06:38:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(27,'CREATE','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/template',5,NULL,'{\"name\":\"Office Attendant\",\"description\":\"Office Attendant\"}',1,'2018-01-30 06:43:39',NULL,NULL,1,NULL,NULL,NULL,NULL),(28,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/5/permissions',5,NULL,'{\"permissions\":{\"DISASSOCIATECLIENTS_GROUP\":true,\"CREATE_CALENDAR\":true,\"READ_ROLE\":true,\"DELETE_PAYMENTTYPE\":true,\"DELETE_HOOK\":true,\"CREATE_CODEVALUE_CHECKER\":true,\"DELETE_COLLATERAL\":true,\"READ_Active Loans - Summary(Pentaho)\":true,\"ACTIVATE_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_CODEVALUE\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_ADDRESS\":true,\"READ_LOANTRANSACTIONNOTE\":true,\"REJECT_SAVINGSACCOUNT\":true,\"READ_CALENDAR\":true,\"READ_GroupSummaryCounts\":true,\"PROPOSETRANSFER_CLIENT_CHECKER\":true,\"READ_SMS\":true,\"DELETE_PROVISIONCRITERIA\":true,\"UPDATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE\":true,\"CREATE_OFFICE_CHECKER\":true,\"CLOSE_CLIENT\":true,\"DELETE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Obligation Met Loans Details(Pentaho)\":true,\"DELETE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_SMS_CHECKER\":true,\"REPAYMENT_LOAN_CHECKER\":true,\"DELETE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATECASHIERALLOCATION_TELLER\":true,\"UPDATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"READ_Portfolio at Risk by Branch(Pentaho)\":true,\"READ_FIXEDDEPOSITPRODUCT\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN\":true,\"DELETE_CALENDAR_CHECKER\":true,\"DELETE_LOAN\":true,\"DELETE_HOLIDAY\":true,\"UPDATE_REPORTMAILINGJOB\":true,\"READ_Loans Awaiting Disbursal Summary by Month(Pentaho)\":true,\"READ_Aging Summary (Arrears in Months)\":true,\"CREATE_TAXGROUP\":true,\"CLOSE_GROUP\":true,\"UPDATE_OFFICE\":true,\"DELETE_CLIENTIMAGE\":true,\"CREATE_COLLATERAL_CHECKER\":true,\"UNDOWRITEOFF_LOAN\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT\":true,\"CREATE_ACCOUNTNUMBERFORMAT\":true,\"DELETE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_GLACCOUNT\":true,\"UPDATE_CODE\":true,\"CREATE_CLIENTCHARGE\":true,\"CREATE_INTERESTRATECHART_CHECKER\":true,\"UPDATE_STAFF_CHECKER\":true,\"UPDATE_DATATABLE_CHECKER\":true,\"READ_Expected Payments By Date - Formatted\":true,\"ADJUSTTRANSACTION_SAVINGSACCOUNT\":true,\"PAY_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_TAXCOMPONENT_CHECKER\":true,\"CLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOANCHARGE_CHECKER\":true,\"APPROVEADDITIONALSHARES_SHAREACCOUNT\":true,\"APPROVALUNDO_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_GLACCOUNT\":true,\"READ_Active Loans in last installment Summary(Pentaho)\":true,\"CLOSE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CACHE\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CURRENCY\":true,\"READ_TAXGROUP\":true,\"DELETE_CLIENTIMAGE_CHECKER\":true,\"APPROVE_SAVINGSACCOUNT\":true,\"CREATE_CHARTSLAB\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT\":true,\"READ_Active Loans - Details\":true,\"UPDATE_FLOATINGRATE_CHECKER\":true,\"UPDATE_SMSCAMPAIGN\":true,\"INACTIVATE_CLIENTCHARGE\":true,\"CREATE_PAYMENTTYPE\":true,\"RECREATE_PROVISIONENTRIES\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_REPORT\":true,\"READ_DOCUMENT\":true,\"REMOVESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_LOAN_CHECKER\":true,\"READ_LOANNOTE\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT\":true,\"DELETE_TEMPLATE\":true,\"UPDATE_CHARTSLAB_CHECKER\":true,\"CLOSE_SAVINGSACCOUNT_CHECKER\":true,\"READ_RESCHEDULELOAN\":true,\"UPDATE_GUARANTOR_CHECKER\":true,\"READ_ProgramDetails\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_LOAN\":true,\"READ_TAXCOMPONENT\":true,\"CREATE_DIVIDEND_SHAREPRODUCT\":true,\"READ_SMSCAMPAIGN\":true,\"UPDATE_CHARGE\":true,\"DELETE_DOCUMENT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT_CHECKER\":true,\"DELETE_ADDRESS_CHECKER\":true,\"CREATE_PROVISIONCATEGORY\":true,\"DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"ADJUST_LOAN_CHECKER\":true,\"POSTINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"READTRANSACTION_CLIENT\":true,\"ACTIVATE_CLIENT\":true,\"CREATE_STAFFIMAGE_CHECKER\":true,\"READ_Daily Teller Cash Report (Pentaho)\":true,\"CREATE_FUND\":true,\"DELETE_FINANCIALACTIVITYACCOUNT\":true,\"CREATE_CODE_CHECKER\":true,\"READ_PAYMENTTYPE\":true,\"UPDATE_TAXCOMPONENT\":true,\"APPLYADDITIONALSHARES_SHAREACCOUNT\":true,\"READ_GLCLOSURE\":true,\"DELETE_CODEVALUE\":true,\"DELETE_SMSCAMPAIGN_CHECKER\":true,\"DELETE_CHARGE\":true,\"CREATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT_CHECKER\":true,\"DISABLE_ROLE_CHECKER\":true,\"CREATE_LOANNOTE\":true,\"DELETE_CODEVALUE_CHECKER\":true,\"CREATE_PROVISIONCRITERIA\":true,\"ACTIVATE_SAVINGSACCOUNT\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT\":true,\"READ_PRODUCTMIX\":true,\"UPDATE_EXTERNALSERVICES\":true,\"UPDATE_SAVINGSPRODUCT\":true,\"WITHDRAW_CLIENT\":true,\"REDEEMSHARES_SHAREACCOUNT\":true,\"UPDATE_SHAREACCOUNT\":true,\"READ_STANDINGINSTRUCTION \":true,\"CREATE_CLIENTIMAGE\":true,\"READ_Active Loans by Disbursal Period\":true,\"DEPOSIT_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Pending Approval(Pentaho)\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_MEETING\":true,\"CREATE_SAVINGSPRODUCT\":true,\"SAVECOLLECTIONSHEET_GROUP\":true,\"READ_Branch Expected Cash Flow\":true,\"HOLDAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"ACTIVATE_CLIENT_CHECKER\":true,\"UPDATE_TAXGROUP\":true,\"READ_Active Loans - Summary\":true,\"READ_GroupNamesByStaff\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SAVINGSACCOUNT\":true,\"CREATE_SMSCAMPAIGN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"REFUNDBYCASH_LOAN_CHECKER\":true,\"ACTIVATE_SHAREACCOUNT\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT\":true,\"READ_CLIENT\":true,\"CLOSEASRESCHEDULED_LOAN\":true,\"UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE\":true,\"ALL_FUNCTIONS_READ\":true,\"DEPOSIT_SAVINGSACCOUNT\":true,\"READ_Expected Payments By Date - Basic(Pentaho)\":true,\"READ_Loans Awaiting Disbursal Summary by Month\":true,\"REACTIVATE_CLIENT\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT\":true,\"CREATE_CODEVALUE\":true,\"DELETE_LOANNOTE_CHECKER\":true,\"UNASSIGNSTAFF_GROUP_CHECKER\":true,\"UPDATERUNNINGBALANCE_JOURNALENTRY\":true,\"CREATE_STANDINGINSTRUCTION \":true,\"CREATE_ADDRESS_CHECKER\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT\":true,\"READ_RECURRINGDEPOSITPRODUCT\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_DOCUMENT_CHECKER\":true,\"READ_TxnRunningBalances\":true,\"UPDATE_COLLATERAL\":true,\"ASSOCIATEGROUPS_CENTER_CHECKER\":true,\"WAIVE_CLIENTCHARGE\":true,\"PROPOSETRANSFER_CLIENT\":true,\"REJECTTRANSFER_CLIENT\":true,\"READ_REPORTMAILINGJOB\":true,\"DELETE_STAFF\":true,\"CREATE_CLIENTIMAGE_CHECKER\":true,\"READ_STAFF\":true,\"CREATE_PRODUCTMIX\":true,\"CREATE_FLOATINGRATE\":true,\"READ_Active Loans by Disbursal Period(Pentaho)\":true,\"UPDATE_ACCOUNTINGRULE\":true,\"CREATE_ENTITYMAPPING\":true,\"UPDATE_CLIENTCHARGE\":true,\"READ_ChildrenStaffList\":true,\"CREATE_DATATABLE\":true,\"READ_Client Loans Listing\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ACTIVATE_CENTER_CHECKER\":true,\"APPROVE_SHAREACCOUNT\":true,\"DELETE_HOLIDAY_CHECKER\":true,\"WAIVE_SAVINGSACCOUNTCHARGE\":true,\"READ_BranchManagerStats\":true,\"CREATE_HOLIDAY\":true,\"READ_Disbursal_Vs_Awaitingdisbursal\":true,\"SAVEORUPDATEATTENDANCE_MEETING\":true,\"UPDATE_SAVINGNOTE_CHECKER\":true,\"DELETE_SMSCAMPAIGN\":true,\"CREATE_STAFF\":true,\"UPDATEROLE_GROUP\":true,\"READ_Client Saving Transactions\":true,\"DELETE_TELLER\":true,\"READ_ProgramDirectorStats\":true,\"CREATE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_HOLIDAY\":true,\"READ_GUARANTOR\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER\":true,\"REMOVELOANOFFICER_LOAN_CHECKER\":true,\"READ_Balance Outstanding\":true,\"UPDATE_CENTER_CHECKER\":true,\"READ_Rescheduled Loans(Pentaho)\":true,\"UPDATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Obligation Met Loans Summary\":true,\"DELETE_USER_CHECKER\":true,\"UPDATE_TEMPLATE\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATE_CALENDAR_CHECKER\":true,\"CREATE_GROUPNOTE\":true,\"UPDATE_PAYMENTTYPE\":true,\"CREATE_GLACCOUNT\":true,\"READ_SAVINGSPRODUCT\":true,\"CREATE_SAVINGNOTE_CHECKER\":true,\"READ_FieldAgentPrograms\":true,\"PAY_CLIENTCHARGE_CHECKER\":true,\"CREATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_FIXEDDEPOSITACCOUNT\":true,\"CREATE_PROVISIONJOURNALENTRIES\":true,\"UNDOREJECT_CLIENT\":true,\"DELETE_ACCOUNTNUMBERFORMAT\":true,\"CREATE_CLIENT_CHECKER\":true,\"CREATE_CHARTSLAB_CHECKER\":true,\"CREATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_HOOK\":true,\"UNDOAPPROVAL_SHAREACCOUNT\":true,\"UPDATE_INTERESTRATECHART_CHECKER\":true,\"CLOSE_LOAN\":true,\"READ_Active Loans in last installment(Pentaho)\":true,\"DELETE_SAVINGSPRODUCT\":true,\"UPDATE_LOAN\":true,\"UNASSIGNSTAFF_CLIENT\":true,\"ASSIGNSTAFF_GROUP\":true,\"READ_Demand_Vs_Collection\":true,\"HOLDAMOUNT_SAVINGSACCOUNT\":true,\"DELETE_REPORTMAILINGJOB\":true,\"READ_CLIENTIMAGE\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARGE_CHECKER\":true,\"READ_Portfolio at Risk(Pentaho)\":true,\"CREATE_CHARGE_CHECKER\":true,\"ACTIVATE_GROUP\":true,\"ENABLE_ROLE\":true,\"DELETE_ADDRESS\":true,\"BLOCKCREDIT_SAVINGSACCOUNT\":true,\"REJECT_CLIENT_CHECKER\":true,\"CREATE_GROUP\":true,\"READ_Obligation Met Loans Summary(Pentaho)\":true,\"READ_ProgramStats\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_PRODUCTMIX\":true,\"UPDATE_CODEVALUE_CHECKER\":true,\"READ_Aging Summary (Arrears in Months)(Pentaho)\":true,\"BLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_SMSCAMPAIGN_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ACCOUNTNUMBERFORMAT\":true,\"UPDATE_PERMISSION\":true,\"CREATE_CLIENTNOTE\":true,\"CREATE_HOLIDAY_CHECKER\":true,\"UPDATE_FIXEDDEPOSITACCOUNT\":true,\"CREATE_ROLE\":true,\"REMOVELOANOFFICER_LOAN\":true,\"WITHDRAWAL_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_FLOATINGRATE\":true,\"READ_Loan Account Schedule\":true,\"DELETE_CLIENT_CHECKER\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"UPDATE_ENTITYMAPPING\":true,\"CREATE_REPORT_CHECKER\":true,\"DISASSOCIATEGROUPS_CENTER_CHECKER\":true,\"WITHDRAW_LOAN\":true,\"CREATE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"READ_Written-Off Loans\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_GLCLOSURE\":true,\"UPDATE_GUARANTOR\":true,\"REJECTADDITIONALSHARES_SHAREACCOUNT\":true,\"CLOSE_SHAREACCOUNT\":true,\"PERMISSIONS_ROLE\":true,\"CREATE_USER\":true,\"ACTIVATE_HOLIDAY_CHECKER\":true,\"DELETE_SAVINGNOTE_CHECKER\":true,\"REJECT_FIXEDDEPOSITACCOUNT\":true,\"WAIVEINTERESTPORTION_LOAN_CHECKER\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT\":true,\"ASSIGNSTAFF_CLIENT\":true,\"REGISTER_DATATABLE_CHECKER\":true,\"UPDATE_CLIENTNOTE\":true,\"WAIVE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"READ_Active Loans Passed Final Maturity(Pentaho)\":true,\"READ_Portfolio at Risk\":true,\"APPROVE_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary\":true,\"READ_Aging Detail(Pentaho)\":true,\"READ_Active Loans in last installment\":true,\"DELETE_CLIENTNOTE\":true,\"DELETE_RECURRINGDEPOSITPRODUCT_CHECKER\":true,\"ASSIGNROLE_GROUP\":true,\"READ_Client Listing\":true,\"READ_Loans Pending Approval\":true,\"DELETE_FIXEDDEPOSITACCOUNT\":true,\"BULKREASSIGN_LOAN_CHECKER\":true,\"CREATE_DATATABLE_CHECKER\":true,\"DEREGISTER_DATATABLE\":true,\"UPDATELOANOFFICER_LOAN\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT\":true,\"READ_STAFFIMAGE\":true,\"UPDATE_SAVINGSACCOUNTCHARGE\":true,\"READ_USER\":true,\"READ_SAVINGSACCOUNTCHARGE\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CENTER\":true,\"DELETE_ROLE\":true,\"UPDATE_GROUPNOTE_CHECKER\":true,\"DELETE_INTERESTRATECHART\":true,\"ASSOCIATEGROUPS_CENTER\":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"CREATE_JOURNALENTRY_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENTIDENTIFIER_CHECKER\":true,\"UPDATE_ORGANISATIONCREDITBUREAU\":true,\"ACTIVATE_HOLIDAY\":true,\"READ_FLOATINGRATE\":true,\"DELETE_ENTITY_DATATABLE_CHECK\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT\":true,\"REPAYMENT_LOAN\":true,\"REGISTER_DATATABLE\":true,\"ACCEPTTRANSFER_CLIENT\":true,\"READ_Balance Sheet\":true,\"UPDATE_ROLE\":true,\"UPDATE_LOANCHARGE_CHECKER\":true,\"CREATE_COLLATERAL\":true,\"READ_Client Loan Account Schedule\":true,\"READ_LoanTrendsByMonth\":true,\"DELETE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_CLIENTIDENTIFIER\":true,\"READ_Client Savings Summary\":true,\"CREATE_LOANCHARGE_CHECKER\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT\":true,\"CREATE_CLIENT\":true,\"UPDATELOANOFFICER_LOAN_CHECKER\":true,\"ADJUST_LOAN\":true,\"CREATE_SMSCAMPAIGN\":true,\"CREATE_REPORTMAILINGJOB\":true,\"CREATE_PROVISIONENTRIES\":true,\"CREATE_TAXCOMPONENT\":true,\"BLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_DOCUMENT\":true,\"READ_ACCOUNTTRANSFER\":true,\"DELETE_GROUP\":true,\"DELETE_ENTITYMAPPING\":true,\"CREATE_FINANCIALACTIVITYACCOUNT\":true,\"DEREGISTER_DATATABLE_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Active Loans in last installment Summary\":true,\"CREATE_SMS\":true,\"WRITEOFF_LOAN\":true,\"READ_ClientTrendsByWeek\":true,\"CREATE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"READ_Aging Detail\":true,\"READ_GroupSummaryAmounts\":true,\"ENABLE_ROLE_CHECKER\":true,\"WAIVE_CLIENTCHARGE_CHECKER\":true,\"READ_TxnRunningBalances(Pentaho)\":true,\"CREATE_ROLE_CHECKER\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_GROUPNOTE_CHECKER\":true,\"UPDATE_CURRENCY\":true,\"UPDATE_PRODUCTMIX\":true,\"POSTINTEREST_SAVINGSACCOUNT\":true,\"UPDATE_CONFIGURATION\":true,\"UPDATE_USER_CHECKER\":true,\"UPDATE_TAXGROUP_CHECKER\":true,\"CREATE_STAFF_CHECKER\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_GLCLOSURE\":true,\"DELETE_GUARANTOR\":true,\"DELETE_STAFF_CHECKER\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT\":true,\"READ_Obligation Met Loans Details\":true,\"CREATE_SAVINGNOTE\":true,\"READ_GroupSavingSummary\":true,\"CREATE_SAVINGSPRODUCT_CHECKER\":true,\"UPDATE_FINANCIALACTIVITYACCOUNT\":true,\"READ_ClientTrendsByMonth\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_Income Statement\":true,\"SAVE_COLLECTIONSHEET\":true,\"READ_CLIENTCHARGE\":true,\"READ_Funds Disbursed Between Dates Summary\":true,\"UPDATE_PROVISIONCRITERIA\":true,\"WAIVEINTERESTPORTION_LOAN\":true,\"READ_SAVINGSACCOUNT\":true,\"CREATE_HOOK\":true,\"READ_General Ledger Report\":true,\"WAIVE_LOANCHARGE\":true,\"ACTIVATE_GROUP_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER_CHECKER\":true,\"CREATE_CHARGE\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT\":true,\"UNDOWITHDRAWAL_CLIENT\":true,\"READ_SAVINGNOTE\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT\":true,\"ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER\":true,\"DELETE_DATATABLE_CHECKER\":true,\"APPROVALUNDO_SAVINGSACCOUNT\":true,\"DELETE_DOCUMENT\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"CREATE_GUARANTOR_CHECKER\":true,\"BLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_JOURNALENTRY\":true,\"READ_LoanCyclePerProduct\":true,\"DELETE_CALENDAR\":true,\"UPDATE_MEETING\":true,\"UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING\":true,\"READ_WORKINGDAYS\":true,\"CREATE_FUND_CHECKER\":true,\"READ_CACHE\":true,\"UNASSIGNROLE_GROUP\":true,\"DELETE_CENTER\":true,\"READ_COLLECTIONSHEET\":true,\"UPDATE_PASSWORD_PREFERENCES_CHECKER\":true,\"CREATE_LOAN_CHECKER\":true,\"CREATE_FLOATINGRATE_CHECKER\":true,\"DELETE_CLIENTCHARGE\":true,\"WITHDRAW_LOAN_CHECKER\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Listing(Pentaho)\":true,\"REFUNDBYCASH_LOAN\":true,\"READ_RECURRINGDEPOSITACCOUNT\":true,\"UNDOTRANSACTION_CLIENT\":true,\"DELETE_OFFICETRANSACTION\":true,\"CREATE_CENTER_CHECKER\":true,\"PAY_LOANCHARGE\":true,\"UPDATE_USER\":true,\"UPDATE_CURRENCY_CHECKER\":true,\"DELETE_LOANTRANSACTIONNOTE_CHECKER\":true,\"READ_PERMISSION\":true,\"DELETE_INTERESTRATECHART_CHECKER\":true,\"APPROVE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_RECURRINGDEPOSITPRODUCT\":true,\"READ_LoanTrendsByWeek\":true,\"ALLOCATECASHIER_TELLER\":true,\"CREATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_DATATABLE\":true,\"UPDATE_ADDRESS_CHECKER\":true,\"READ_ADDRESS\":true,\"READ_Funds Disbursed Between Dates Summary by Office(Pentaho)\":true,\"READ_Funds Disbursed Between Dates Summary(Pentaho)\":true,\"READ_LOANPRODUCT\":true,\"UPDATE_COLLATERAL_CHECKER\":true,\"UPDATE_WORKINGDAYS\":true,\"DISASSOCIATEGROUPS_CENTER\":true,\"BLOCK_SAVINGSACCOUNT_CHECKER\":true,\"UPDATE_INTERESTRATECHART\":true,\"FORECLOSURE_LOAN\":true,\"UNBLOCK_SAVINGSACCOUNT\":true,\"CREATE_OFFICE\":true,\"READ_CODEVALUE\":true,\"CREATE_SHAREACCOUNT\":true,\"APPROVE_RESCHEDULELOAN\":true,\"WITHDRAW_CLIENT_CHECKER\":true,\"DELETE_SMS\":true,\"ACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_CHARGE_CHECKER\":true,\"ACCEPTTRANSFER_CLIENT_CHECKER\":true,\"DISABLE_ROLE\":true,\"BULKREASSIGN_LOAN\":true,\"RECOVERGUARANTEES_LOAN_CHECKER\":true,\"ASSOCIATECLIENTS_GROUP\":true,\"DELETE_STAFFIMAGE\":true,\"UPDATE_CLIENT_CHECKER\":true,\"CREATE_TELLER\":true,\"CREATE_LOANPRODUCT\":true,\"READ_ClientSummary \":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DELETE_REPORT\":true,\"ACTIVATE_CENTER\":true,\"READ_Active Loan Summary per Branch\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT\":true,\"READ_CoordinatorStats\":true,\"UPDATE_DATATABLE\":true,\"CREATE_TEMPLATE\":true,\"DELETE_SAVINGSACCOUNT_CHECKER\":true,\"ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CLIENT\":true,\"DELETE_LOANNOTE\":true,\"READ_Rescheduled Loans\":true,\"DELETE_GUARANTOR_CHECKER\":true,\"DELETE_LOANPRODUCT\":true,\"UPDATE_TAXCOMPONENT_CHECKER\":true,\"READ_TEMPLATE\":true,\"UPDATE_REPORT\":true,\"CREATE_FIXEDDEPOSITPRODUCT\":true,\"UPDATE_LOANNOTE_CHECKER\":true,\"UPDATE_STANDINGINSTRUCTION \":true,\"UPDATE_PASSWORD_PREFERENCES\":true,\"READ_FUND\":true,\"UPDATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_SAVINGNOTE\":true,\"CREATE_DOCUMENT_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_CHARTSLAB_CHECKER\":true,\"UNASSIGNSTAFF_GROUP\":true,\"DELETE_CHARTSLAB\":true,\"UPDATE_CHARTSLAB\":true,\"DELETE_SAVINGSACCOUNT\":true,\"DELETE_CENTER_CHECKER\":true,\"READ_ClientTrendsByDay\":true,\"READ_PASSWORD_PREFERENCES\":true,\"CREATE_ACCOUNTTRANSFER_CHECKER\":true,\"REJECT_CLIENT\":true,\"READ_LoanTrendsByDay\":true,\"PAY_CLIENTCHARGE\":true,\"UPDATE_CENTER\":true,\"UPDATE_STAFF\":true,\"UNDOREJECT_CLIENT_CHECKER\":true,\"RECOVERGUARANTEES_LOAN\":true,\"READ_Staff Assignment History\":true,\"UPDATE_SAVINGNOTE\":true,\"UPDATE_CLIENTCHARGE_CHECKER\":true,\"UPDATE_SHAREPRODUCT\":true,\"UPDATE_LOAN_CHECKER\":true,\"EXECUTEJOB_SCHEDULER\":true,\"READ_DATATABLE\":true,\"CLOSE_LOAN_CHECKER\":true,\"READ_Collection Report\":true,\"REJECT_SHAREACCOUNT\":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"READ_ACCOUNTNUMBERFORMAT\":true,\"REJECT_RESCHEDULELOAN\":true,\"WITHDRAWTRANSFER_CLIENT_CHECKER\":true,\"CREATE_GLCLOSURE\":true,\"CREATE_ADDRESS\":true,\"UPDATE_GROUP_CHECKER\":true,\"DELETE_USER\":true,\"RECOVERYPAYMENT_LOAN\":true,\"DEFINEOPENINGBALANCE_JOURNALENTRY\":true,\"CREATE_FIXEDDEPOSITPRODUCT_CHECKER\":true,\"WITHDRAWAL_SAVINGSACCOUNT\":true,\"DELETE_ROLE_CHECKER\":true,\"READ_CENTER\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT\":true,\"TRANSFERCLIENTS_GROUP_CHECKER\":true,\"CREATE_LOAN\":true,\"WITHDRAW_SAVINGSACCOUNT\":true,\"READ_GLACCOUNT\":true,\"READ_AUDIT\":true,\"REJECT_SAVINGSACCOUNT_CHECKER\":true,\"READ_CONFIGURATION\":true,\"DELETE_LOANPRODUCT_CHECKER\":true,\"DELETE_SAVINGSACCOUNTCHARGE\":true,\"INACTIVATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT_CHECKER\":true,\"CREATE_OFFICETRANSACTION\":true,\"FORECLOSURE_LOAN_CHECKER\":true,\"CREATE_ACCOUNTTRANSFER\":true,\"DELETE_SMS_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT\":true,\"ALLOCATECASHTOCASHIER_TELLER\":true,\"DELETE_CODE_CHECKER\":true,\"READ_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary(Pentaho)\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_CALENDAR_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER\":true,\"UPDATE_TELLER\":true,\"PAY_SAVINGSACCOUNTCHARGE\":true,\"READ_ACCOUNTINGRULE\":true,\"READ_COLLATERAL\":true,\"DELETE_ACCOUNTINGRULE\":true,\"REACTIVATE_CLIENT_CHECKER\":true,\"READ_CLIENTIDENTIFIER\":true,\"UPDATE_GROUP\":true,\"READ_Active Loans Passed Final Maturity Summary\":true,\"UPDATE_LOANCHARGE\":true,\"DELETE_PROVISIONCATEGORY\":true,\"READ_OFFICETRANSACTION\":true,\"READ_Funds Disbursed Between Dates Summary by Office\":true,\"UNDOTRANSACTION_CLIENT_CHECKER\":true,\"PROPOSEANDACCEPTTRANSFER_CLIENT_CHECKER\":true,\"UPDATE_LIKELIHOOD\":true,\"CREATE_REPORT\":true,\"DELETE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_SAVINGSACCOUNTCHARGE\":true,\"DELETE_MEETING\":true,\"DELETE_CODE\":true,\"REACTIVATE_SMSCAMPAIGN\":true,\"UPDATE_PERMISSION_CHECKER\":true,\"CREATE_ORGANISATIONCREDITBUREAU\":true,\"CLOSE_SMSCAMPAIGN\":true,\"CLOSE_CENTER\":true,\"DELETE_REPORT_CHECKER\":true,\"CREATE_INTERESTRATECHART\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_OFFICE_CHECKER\":true,\"READ_Portfolio at Risk by Branch\":true,\"CLOSEASRESCHEDULED_LOAN_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT\":true,\"READ_HOLIDAY\":true,\"UPDATE_SCHEDULER\":true,\"UPDATE_WORKINGDAYS_CHECKER\":true,\"DELETE_CLIENT\":true,\"TRANSFERCLIENTS_GROUP\":true,\"REVERSE_JOURNALENTRY\":true,\"CREATE_RESCHEDULELOAN\":true,\"CLOSE_SAVINGSACCOUNT\":true,\"DELETE_GROUPNOTE_CHECKER\":true,\"READ_Trial Balance\":true,\"WRITEOFF_LOAN_CHECKER\":true,\"DELETE_FUND_CHECKER\":true,\"DELETE_STANDINGINSTRUCTION \":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_GROUP_CHECKER\":true,\"CREATE_LOANPRODUCT_CHECKER\":true,\"READ_Savings Transactions\":true,\"READ_HOOK\":true,\"READ_DIVIDEND_SHAREPRODUCT\":true,\"DELETE_GROUP_CHECKER\":true,\"READ_GROUPNOTE\":true,\"CREATE_ACCOUNTINGRULE\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"CREATE_LOANTRANSACTIONNOTE\":true,\"REJECT_RECURRINGDEPOSITACCOUNT\":true,\"DELETECASHIERALLOCATION_TELLER\":true,\"REJECTTRANSFER_CLIENT_CHECKER\":true,\"CREATE_SMS_CHECKER\":true,\"CREATE_LOANNOTE_CHECKER\":true,\"READ_CHARGE\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_CLIENTIDENTIFIER\":true,\"SAVECOLLECTIONSHEET_CENTER\":true,\"DELETE_CLIENTNOTE_CHECKER\":true,\"CREATE_USER_CHECKER\":true,\"SETTLECASHFROMCASHIER_TELLER\":true,\"DELETE_LOANCHARGE\":true,\"READ_ENTITY_DATATABLE_CHECK\":true,\"READ_Loans Awaiting Disbursal\":true,\"UPDATE_DOCUMENT\":true,\"READ_CODE\":true,\"READ_Expected Payments By Date - Basic\":true,\"CREATE_SHAREPRODUCT\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_CONFIGURATION_CHECKER\":true,\"UPDATE_LOANTRANSACTIONNOTE_CHECKER\":true,\"CREATE_JOURNALENTRY\":true,\"UPDATE_ROLE_CHECKER\":true,\"UPDATE_LOANPRODUCT\":true,\"CREATE_TAXGROUP_CHECKER\":true,\"READ_CLIENTNOTE\":true,\"DELETE_DIVIDEND_SHAREPRODUCT\":true,\"UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT_CHECKER\":true,\"READ_Loans Awaiting Disbursal Summary(Pentaho)\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT\":true,\"READ_Aging Summary (Arrears in Weeks)\":true,\"BLOCK_SAVINGSACCOUNT\":true,\"UPDATE_FUND\":true,\"UPDATE_SMS\":true,\"DELETE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DELETE_FIXEDDEPOSITPRODUCT\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT\":true,\"READ_Written-Off Loans(Pentaho)\":true,\"REJECT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_HOLIDAY_CHECKER\":true,\"CREATE_GUARANTOR\":true,\"CREATE_ENTITY_DATATABLE_CHECK\":true,\"UPDATE_CALENDAR\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_SAVINGSACCOUNT\":true,\"EXECUTE_PERIODICACCRUALACCOUNTING\":true,\"UPDATE_DISBURSEMENTDETAIL\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER\":true,\"UPDATESAVINGSOFFICER_SAVINGSACCOUNT\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATE_CODE_CHECKER\":true,\"UPDATE_FUND_CHECKER\":true,\"UPDATE_LOANPRODUCT_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER\":true,\"UPDATE_CLIENTNOTE_CHECKER\":true,\"DELETE_COLLATERAL_CHECKER\":true,\"UNBLOCK_SAVINGSACCOUNT_CHECKER\":true,\"CREATESCHEDULEEXCEPTIONS_LOAN\":true,\"READ_FieldAgentStats\":true,\"DELETE_GROUPNOTE\":true,\"READ_Loans Awaiting Disbursal(Pentaho)\":true,\"UPDATE_GROUPNOTE\":true,\"READ_SCHEDULER\":true,\"DELETE_CLIENTCHARGE_CHECKER\":true,\"DELETE_CLIENTIDENTIFIER\":true,\"READ_Active Loans Passed Final Maturity\":true,\"UPDATESAVINGSACCOUNT_CLIENT\":true,\"CREATE_LOANCHARGE\":true,\"DELETE_OFFICE_CHECKER\":true,\"READ_FINANCIALACTIVITYACCOUNT\":true,\"REJECT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"READ_Client Loans Listing(Pentaho)\":true,\"CREATE_MEETING\":true,\"UNDOWITHDRAWAL_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT\":true,\"UPDATE_REPORT_CHECKER\":true,\"DELETE_STAFFIMAGE_CHECKER\":true,\"DELETE_FUND\":true,\"INACTIVATE_CLIENTCHARGE_CHECKER\":true,\"WAIVE_LOANCHARGE_CHECKER\":true,\"READ_Disbursal Report\":true,\"READ_Aging Summary (Arrears in Weeks)(Pentaho)\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT\":true,\"READ_OFFICE\":true,\"CREATE_CODE\":true,\"CREATE_CLIENTNOTE_CHECKER\":true,\"DELETE_OFFICETRANSACTION_CHECKER\":true,\"UPDATE_RECURRINGDEPOSITPRODUCT\":true,\"CREATE_RECURRINGDEPOSITACCOUNT\":true,\"DELETE_LOANTRANSACTIONNOTE\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"CREATE_STAFFIMAGE\":true}}',1,'2018-01-30 06:56:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(29,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',1,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"2\",\"glCode\":\"1000\",\"name\":\"ASSET\"}',1,'2018-01-30 07:43:52',NULL,NULL,1,NULL,NULL,NULL,NULL),(30,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',2,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"2\",\"parentId\":1,\"glCode\":\"1100\",\"name\":\"NON- CURRENT ASSETS\"}',1,'2018-01-30 07:45:24',NULL,NULL,1,NULL,NULL,NULL,NULL),(31,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',3,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"2\",\"parentId\":1,\"name\":\"CURRENT ASSETS\",\"glCode\":\"1200\"}',1,'2018-01-30 07:46:01',NULL,NULL,1,NULL,NULL,NULL,NULL),(32,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',4,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":2,\"name\":\"PROPERT AND EQUIPMENT\",\"glCode\":\"1101\"}',1,'2018-01-30 07:46:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(33,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',5,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"OUTSTANDING LOANS\",\"glCode\":\"1201\"}',1,'2018-01-30 07:47:31',NULL,NULL,1,NULL,NULL,NULL,NULL),(34,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',6,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"DEBTORS NHC\",\"glCode\":\"1202\"}',1,'2018-01-30 07:49:47',NULL,NULL,1,NULL,NULL,NULL,NULL),(35,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',7,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"PRE PAYMENTS\",\"glCode\":\"1203\"}',1,'2018-01-30 07:51:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(36,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',8,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"CASH IN HAND\",\"glCode\":\"1204\"}',1,'2018-01-30 07:51:58',NULL,NULL,1,NULL,NULL,NULL,NULL),(37,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',9,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"CASH AT BANK CRDB\",\"glCode\":\"1205\"}',1,'2018-01-30 07:53:03',NULL,NULL,1,NULL,NULL,NULL,NULL),(38,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',10,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"DCB\",\"glCode\":\"1206\"}',1,'2018-01-30 07:53:48',NULL,NULL,1,NULL,NULL,NULL,NULL),(39,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',11,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"T/SHIRTS\",\"glCode\":\"1207\"}',1,'2018-01-30 07:54:14',NULL,NULL,1,NULL,NULL,NULL,NULL),(40,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',12,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"2\",\"glCode\":\"2000\",\"name\":\"EQUITY\"}',1,'2018-01-30 07:58:55',NULL,NULL,1,NULL,NULL,NULL,NULL),(41,'UPDATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/12',12,NULL,'{\"name\":\"EQUITY LIABILITIES\"}',1,'2018-01-30 08:00:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(42,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',13,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"EQUITY\",\"glCode\":\"2010\"}',1,'2018-01-30 08:00:38',NULL,NULL,1,NULL,NULL,NULL,NULL),(43,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',14,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"STATUTORY RESERVES\",\"glCode\":\"2020\"}',1,'2018-01-30 08:01:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(44,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',15,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"BAD DEBTS\",\"glCode\":\"2030\"}',1,'2018-01-30 08:01:50',NULL,NULL,1,NULL,NULL,NULL,NULL),(45,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',16,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"SHARE TRANSFER FUND\",\"glCode\":\"2040\"}',1,'2018-01-30 08:02:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(46,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',17,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"EDUCATION FUND\",\"glCode\":\"2050\"}',1,'2018-01-30 08:02:44',NULL,NULL,1,NULL,NULL,NULL,NULL),(47,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',18,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"RETAINED SURPLUS\",\"glCode\":\"2060\"}',1,'2018-01-30 08:03:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(48,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',19,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"2\",\"name\":\"LIABILITES\",\"glCode\":\"3000\"}',1,'2018-01-30 08:04:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(49,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',20,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"MEMBERS SHARES\",\"glCode\":\"3010\"}',1,'2018-01-30 08:05:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(50,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',21,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"MEMBERS SAVINGS\",\"glCode\":\"3020\"}',1,'2018-01-30 08:05:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(51,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',22,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"TRA- PAYE\",\"glCode\":\"3030\"}',1,'2018-01-30 08:05:55',NULL,NULL,1,NULL,NULL,NULL,NULL),(52,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',23,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"TRA-S.D.L\",\"glCode\":\"3040\"}',1,'2018-01-30 08:06:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(53,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',24,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"REGISTRAR\",\"glCode\":\"3050\"}',1,'2018-01-30 08:06:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(54,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',25,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"COASCO\",\"glCode\":\"3060\"}',1,'2018-01-30 08:06:55',NULL,NULL,1,NULL,NULL,NULL,NULL),(55,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',26,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"2\",\"name\":\"INCOME\",\"glCode\":\"4000\"}',1,'2018-01-30 08:08:21',NULL,NULL,1,NULL,NULL,NULL,NULL),(56,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',27,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"name\":\"INTEREST ON LOANS\",\"glCode\":\"4010\"}',1,'2018-01-30 08:08:39',NULL,NULL,1,NULL,NULL,NULL,NULL),(57,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',28,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"name\":\"PROCESSING FEES\",\"glCode\":\"4020\"}',1,'2018-01-30 08:09:03',NULL,NULL,1,NULL,NULL,NULL,NULL),(58,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',29,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"name\":\"FDR INTEREST\",\"glCode\":\"4030\"}',1,'2018-01-30 08:09:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(59,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',30,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"name\":\"ENTRANCE FEES\",\"glCode\":\"4040\"}',1,'2018-01-30 08:09:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(60,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',31,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"2\",\"name\":\"LESS: EXPENDITURE\",\"glCode\":\"5000\"}',1,'2018-01-30 08:10:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(61,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',32,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SALARIES\",\"glCode\":\"5010\"}',1,'2018-01-30 08:11:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(62,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',33,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"LEAVE ALLOWANCE\",\"glCode\":\"5020\"}',1,'2018-01-30 08:11:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(63,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',34,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"PENSION FUND\",\"glCode\":\"5030\"}',1,'2018-01-30 08:12:02',NULL,NULL,1,NULL,NULL,NULL,NULL),(64,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',35,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"COMMUNICATION\",\"glCode\":\"5040\"}',1,'2018-01-30 08:12:25',NULL,NULL,1,NULL,NULL,NULL,NULL),(65,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',36,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"TRANSPORT\",\"glCode\":\"5050\"}',1,'2018-01-30 08:12:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(66,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',37,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"BOARD MEETING\",\"glCode\":\"5060\"}',1,'2018-01-30 08:13:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(67,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',38,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SUPERVISORY COMMITTEE\",\"glCode\":\"5070\"}',1,'2018-01-30 08:13:47',NULL,NULL,1,NULL,NULL,NULL,NULL),(68,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',39,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"glCode\":\"5080\",\"name\":\"INTEREST ON MEMBERS SAVINGS\"}',1,'2018-01-30 08:14:18',NULL,NULL,1,NULL,NULL,NULL,NULL),(69,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',40,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"LOAN COMMITTEE\",\"glCode\":\"5090\"}',1,'2018-01-30 08:14:41',NULL,NULL,1,NULL,NULL,NULL,NULL),(70,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',41,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"MEDICAL EXPENSES\",\"glCode\":\"5100\"}',1,'2018-01-30 08:15:15',NULL,NULL,1,NULL,NULL,NULL,NULL),(71,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',42,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"STATIONARY\",\"glCode\":\"5110\"}',1,'2018-01-30 08:15:32',NULL,NULL,1,NULL,NULL,NULL,NULL),(72,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',43,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"ELECTRICITY\",\"glCode\":\"5120\"}',1,'2018-01-30 08:15:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(73,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',44,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SEMINAR &EDUCATION\",\"glCode\":\"5130\"}',1,'2018-01-30 08:16:06',NULL,NULL,1,NULL,NULL,NULL,NULL),(74,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',45,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"AGM\",\"glCode\":\"5140\"}',1,'2018-01-30 08:16:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(75,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',46,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SUPERVISION\",\"glCode\":\"5150\"}',1,'2018-01-30 08:17:55',NULL,NULL,1,NULL,NULL,NULL,NULL),(76,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',47,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"BYE CAN EXPENSES\",\"glCode\":\"5160\"}',1,'2018-01-30 08:18:20',NULL,NULL,1,NULL,NULL,NULL,NULL),(77,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',48,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"REPAIR\",\"glCode\":\"5170\"}',1,'2018-01-30 08:18:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(78,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',49,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"PROMOTION EXPENSES\",\"glCode\":\"5180\"}',1,'2018-01-30 08:19:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(79,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',50,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"OFFICE TEA\",\"glCode\":\"5190\"}',1,'2018-01-30 08:19:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(80,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',51,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"CONSULTATION\",\"glCode\":\"5200\"}',1,'2018-01-30 08:19:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(81,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',52,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"OTHER EXPENSES\",\"glCode\":\"5210\"}',1,'2018-01-30 08:20:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(82,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',53,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"AUDIT FEES\",\"glCode\":\"5220\"}',1,'2018-01-30 08:20:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(83,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',54,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"glCode\":\"5230\",\"name\":\"BANK CHANGES\"}',1,'2018-01-30 08:21:15',NULL,NULL,1,NULL,NULL,NULL,NULL),(84,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',55,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"name\":\"MEMBER SHARES\",\"glCode\":\"2070\"}',1,'2018-02-01 07:26:42',NULL,NULL,1,NULL,NULL,NULL,NULL),(85,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',56,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"TRA-PAYE\",\"glCode\":\"5240\"}',1,'2018-02-01 07:28:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(86,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',57,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"TRA- S.D.L\",\"glCode\":\"5250\"}',1,'2018-02-01 07:28:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(87,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',59,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"BAD DOUBIFUL RESERVE FUND\",\"glCode\":\"5260\"}',1,'2018-02-01 07:29:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(88,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',60,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SALARIES\",\"glCode\":\"5270\"}',1,'2018-02-01 07:30:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(89,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',61,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"EDUCATION AND SEMINARS\",\"glCode\":\"5280\"}',1,'2018-02-01 07:31:04',NULL,NULL,1,NULL,NULL,NULL,NULL),(90,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',62,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"SUPERVISOR COMMITTEE\",\"glCode\":\"5290\"}',1,'2018-02-01 07:31:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(91,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',63,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"BY LAWS EXPENSES5\",\"glCode\":\"5300\"}',1,'2018-02-01 07:32:18',NULL,NULL,1,NULL,NULL,NULL,NULL),(92,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',64,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"0FICE TEA\",\"glCode\":\"5310\"}',1,'2018-02-01 07:37:02',NULL,NULL,1,NULL,NULL,NULL,NULL),(93,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',65,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":\"1\",\"parentId\":31,\"name\":\"BANK CHARGES\",\"glCode\":\"5320\"}',1,'2018-02-01 07:37:25',NULL,NULL,1,NULL,NULL,NULL,NULL),(94,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',66,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"OTHER RECEIVABLE NHC\",\"glCode\":\"1208\"}',1,'2018-02-01 07:38:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(95,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',67,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":2,\"name\":\"PROPERTY EQUIPMENT\",\"glCode\":\"1102\"}',1,'2018-02-01 07:39:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(96,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',68,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":3,\"name\":\"CASH AT BANK DCB\",\"glCode\":\"1209\"}',1,'2018-02-01 07:39:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(97,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',69,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"DIVIDENDS  n\",\"glCode\":\"3070\"}',1,'2018-02-01 07:41:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(98,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',70,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"name\":\"INTEREST ON MEMBER SAVINGS (6.5%)\",\"glCode\":\"3080\"}',1,'2018-02-01 07:41:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(99,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',71,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1210\",\"name\":\"Fund source\"}',1,'2018-02-05 10:55:48',NULL,NULL,1,NULL,NULL,NULL,NULL),(100,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',72,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1211\",\"name\":\"Interest Receivable\"}',1,'2018-02-05 10:57:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(101,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',73,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1212\",\"name\":\"Fee Receivable\"}',1,'2018-02-05 11:08:02',NULL,NULL,1,NULL,NULL,NULL,NULL),(102,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',74,NULL,'{\"manualEntriesAllowed\":false,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1213\",\"name\":\"Penalties Receivable\"}',1,'2018-02-05 11:13:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(103,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',75,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1214\",\"name\":\"Transfer In Suspence\"}',1,'2018-02-05 11:13:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(104,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',76,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"glCode\":\"4050\",\"name\":\"Income from Penalties\"}',1,'2018-02-05 11:20:58',NULL,NULL,1,NULL,NULL,NULL,NULL),(105,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',77,NULL,'{\"manualEntriesAllowed\":true,\"type\":4,\"usage\":\"1\",\"parentId\":26,\"glCode\":\"4060\",\"name\":\"Income From recovery Repayment\"}',1,'2018-02-05 11:30:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(106,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',79,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"glCode\":\"3090\",\"name\":\"Over payment Liability\"}',1,'2018-02-05 11:33:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(107,'UPDATE','RECURRINGDEPOSITPRODUCT',NULL,NULL,NULL,NULL,NULL,'/recurringdepositproducts/1',1,NULL,'{\"shortName\":\"CP\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-02-05 11:59:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(108,'UPDATE','RECURRINGDEPOSITPRODUCT',NULL,NULL,NULL,NULL,NULL,'/recurringdepositproducts/1',1,NULL,'{\"shortName\":\"CP\",\"paymentChannelToFundSourceMappings\":\"[]\",\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-02-05 11:59:52',NULL,NULL,1,NULL,NULL,NULL,NULL),(109,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',80,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1215\",\"name\":\"Saving Reference\"}',1,'2018-02-05 13:46:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(110,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',81,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"glCode\":\"3100\",\"name\":\"Saving Transfer in Suspence\"}',1,'2018-02-05 13:48:19',NULL,NULL,1,NULL,NULL,NULL,NULL),(111,'CREATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/template',2,NULL,'{\"currencyCode\":\"TZS\",\"digitsAfterDecimal\":2,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"accountingRule\":\"1\",\"name\":\"Contribution\",\"shortName\":\"CS\",\"description\":\"CS\",\"nominalAnnualInterestRate\":\"7\",\"inMultiplesOf\":\"0\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[],\"locale\":\"en\"}',1,'2018-02-05 14:05:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(112,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"accountingRule\":2,\"overdraftLimit\":null,\"locale\":\"en\",\"nominalAnnualInterestRateOverdraft\":null,\"minOverdraftForInterestCalculation\":null,\"minRequiredBalance\":null,\"savingsControlAccountId\":21,\"writeOffAccountId\":32,\"overdraftPortfolioControlId\":68,\"transfersInSuspenseAccountId\":81,\"incomeFromInterestId\":77,\"savingsReferenceAccountId\":80,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"incomeFromFeeAccountId\":28}',1,'2018-02-05 14:31:48',NULL,NULL,1,NULL,NULL,NULL,NULL),(113,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"savingsControlAccountId\":21,\"writeOffAccountId\":59,\"incomeFromInterestId\":28,\"transfersInSuspenseAccountId\":81,\"paymentChannelToFundSourceMappings\":\"[]\",\"escheatLiabilityId\":21,\"savingsReferenceAccountId\":80,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"penaltyToIncomeAccountMappings\":\"[]\",\"incomeFromFeeAccountId\":29,\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-02-05 14:44:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(114,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"writeOffAccountId\":59,\"incomeFromInterestId\":28,\"escheatLiabilityId\":21,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"savingsControlAccountId\":21,\"overdraftPortfolioControlId\":68,\"transfersInSuspenseAccountId\":81,\"paymentChannelToFundSourceMappings\":\"[]\",\"savingsReferenceAccountId\":80,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"incomeFromFeeAccountId\":29}',1,'2018-02-05 14:46:15',NULL,NULL,1,NULL,NULL,NULL,NULL),(115,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"writeOffAccountId\":59,\"incomeFromInterestId\":28,\"escheatLiabilityId\":21,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"savingsControlAccountId\":21,\"overdraftPortfolioControlId\":68,\"transfersInSuspenseAccountId\":81,\"paymentChannelToFundSourceMappings\":\"[]\",\"savingsReferenceAccountId\":80,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"incomeFromFeeAccountId\":29}',1,'2018-02-05 14:51:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(116,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"writeOffAccountId\":59,\"incomeFromInterestId\":28,\"escheatLiabilityId\":21,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"savingsControlAccountId\":21,\"overdraftPortfolioControlId\":68,\"transfersInSuspenseAccountId\":81,\"paymentChannelToFundSourceMappings\":\"[]\",\"savingsReferenceAccountId\":80,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"incomeFromFeeAccountId\":29}',1,'2018-02-05 15:01:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(117,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/3',3,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"accountingRule\":3,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"interestOnLoanAccountId\":27,\"writeOffAccountId\":62,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"transfersInSuspenseAccountId\":75,\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-05 15:04:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(118,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"accountingRule\":3,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"interestOnLoanAccountId\":27,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"transfersInSuspenseAccountId\":75,\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-05 15:05:41',NULL,NULL,1,NULL,NULL,NULL,NULL),(119,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/2',2,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"accountingRule\":3,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"interestOnLoanAccountId\":27,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"transfersInSuspenseAccountId\":75,\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-05 15:07:42',NULL,NULL,1,NULL,NULL,NULL,NULL),(120,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/5',5,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"accountingRule\":3,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"interestOnLoanAccountId\":27,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"transfersInSuspenseAccountId\":75,\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-05 15:10:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(121,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',82,NULL,'{\"manualEntriesAllowed\":true,\"type\":1,\"usage\":\"1\",\"parentId\":1,\"glCode\":\"1216\",\"name\":\"Share Reference\"}',1,'2018-02-05 15:12:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(122,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',83,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"parentId\":19,\"glCode\":\"3101\",\"name\":\"Share suspense control\"}',1,'2018-02-05 15:14:45',NULL,NULL,1,NULL,NULL,NULL,NULL),(123,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',84,NULL,'{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"parentId\":12,\"glCode\":\"2080\",\"name\":\"Share Equity\"}',1,'2018-02-05 15:15:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(124,'UPDATE','SHAREPRODUCT',NULL,NULL,NULL,NULL,NULL,'/products/share/1',1,NULL,'{\"unitPrice\":25000,\"shareReferenceId\":82,\"shareCapital\":250000000000,\"accountingRule\":2,\"shareEquityId\":84,\"allowDividendCalculationForInactiveClients\":false,\"chargesSelected\":[],\"currencyCode\":{\"code\":\"TZS\",\"digitsAfterDecimal\":2,\"inMultiplesOf\":1},\"incomeFromFeeAccountId\":28,\"shareSuspenseId\":21}',1,'2018-02-05 15:16:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(125,'UPDATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/3',3,NULL,'{\"incomeAccountId\":30}',1,'2018-02-05 15:17:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(126,'UPDATE','WORKINGDAYS',NULL,NULL,NULL,NULL,NULL,'/workingdays/',1,NULL,'{\"recurrence\":\"FREQ\\u003dWEEKLY;INTERVAL\\u003d1;BYDAY\\u003dMO,TU,WE,TH,FR\",\"repaymentRescheduleType\":{\"id\":4,\"code\":\"RepaymentRescheduleType.move.to.previous.working.day\",\"value\":\"move to previous working day\"}}',1,'2018-02-05 15:20:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(127,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/4/permissions',4,NULL,'{\"permissions\":{\"DISASSOCIATECLIENTS_GROUP\":false,\"READ_GROUP\":false,\"UPDATE_GLCLOSURE\":false,\"DELETE_HOLIDAY_CHECKER\":false,\"DELETE_SMSCAMPAIGN\":false,\"UPDATEROLE_GROUP\":false,\"CREATE_SAVINGSPRODUCT_CHECKER\":false,\"UPDATE_FINANCIALACTIVITYACCOUNT\":false,\"DELETE_TELLER\":false,\"UPDATE_FIXEDDEPOSITPRODUCT\":false,\"CREATE_OFFICE_CHECKER\":false,\"DELETE_FIXEDDEPOSITPRODUCT_CHECKER\":false,\"DELETE_ACCOUNTINGRULE\":false,\"DELETE_RECURRINGDEPOSITACCOUNT_CHECKER\":false,\"UPDATE_CENTER_CHECKER\":false,\"UPDATE_GROUP\":false,\"UPDATE_SMS_CHECKER\":false,\"DELETE_USER_CHECKER\":false,\"DELETE_RECURRINGDEPOSITACCOUNT\":false,\"CREATE_GROUPNOTE\":false,\"CREATE_GLACCOUNT\":false,\"CREATE_REPORT\":false,\"ACTIVATE_GROUP_CHECKER\":false,\"UPDATE_FIXEDDEPOSITPRODUCT_CHECKER\":false,\"DELETE_RECURRINGDEPOSITPRODUCT\":false,\"CREATE_CHARGE\":false,\"READ_FIXEDDEPOSITACCOUNT\":false,\"DELETE_MEETING\":false,\"DELETE_HOLIDAY\":false,\"REACTIVATE_SMSCAMPAIGN\":false,\"CLOSE_SMSCAMPAIGN\":false,\"CREATE_TAXGROUP\":false,\"CLOSE_GROUP\":false,\"UPDATE_OFFICE\":false,\"UPDATE_GLACCOUNT\":false,\"DELETE_SAVINGSPRODUCT\":false,\"TRANSFERCLIENTS_GROUP\":false,\"REVERSE_JOURNALENTRY\":false,\"UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER\":false,\"ASSIGNSTAFF_GROUP\":false,\"DELETE_GROUPNOTE_CHECKER\":false,\"UNASSIGNROLE_GROUP\":false,\"DELETE_CENTER\":false,\"CREATE_GROUP_CHECKER\":false,\"CREATE_TAXCOMPONENT_CHECKER\":false,\"CREATE_LOANPRODUCT_CHECKER\":false,\"ACTIVATE_GROUP\":false,\"DELETE_GLACCOUNT\":false,\"ENABLE_ROLE\":false,\"UPDATE_PASSWORD_PREFERENCES_CHECKER\":false,\"CREATE_GROUP\":false,\"DELETE_PRODUCTMIX\":false,\"DELETE_GROUP_CHECKER\":false,\"READ_GROUPNOTE\":false,\"CREATE_ACCOUNTINGRULE\":false,\"CREATE_SMS_CHECKER\":false,\"READ_RECURRINGDEPOSITACCOUNT\":false,\"UPDATE_RECURRINGDEPOSITACCOUNT\":false,\"UNDOTRANSACTION_CLIENT\":true,\"CREATE_CENTER_CHECKER\":false,\"UPDATE_USER\":false,\"CREATE_HOLIDAY_CHECKER\":false,\"UPDATE_FIXEDDEPOSITACCOUNT\":false,\"UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER\":false,\"CREATE_RECURRINGDEPOSITPRODUCT\":false,\"CREATE_ROLE\":false,\"CREATE_RECURRINGDEPOSITACCOUNT_CHECKER\":false,\"SAVECOLLECTIONSHEET_CENTER\":false,\"CREATE_USER_CHECKER\":false,\"DELETE_TEMPLATE\":false,\"DISASSOCIATEGROUPS_CENTER_CHECKER\":false,\"CREATE_RECURRINGDEPOSITPRODUCT_CHECKER\":false,\"DISASSOCIATEGROUPS_CENTER\":false,\"DELETE_GLCLOSURE\":false,\"READ_SMSCAMPAIGN\":false,\"UPDATE_CHARGE\":false,\"CREATE_OFFICE\":false,\"PERMISSIONS_ROLE\":false,\"CREATE_USER\":false,\"CREATE_JOURNALENTRY\":false,\"UPDATE_ROLE_CHECKER\":false,\"READTRANSACTION_CLIENT\":true,\"CREATE_TAXGROUP_CHECKER\":false,\"CREATE_FUND\":false,\"DELETE_FINANCIALACTIVITYACCOUNT\":false,\"DELETE_SMS\":false,\"ACTIVATE_SMSCAMPAIGN\":false,\"DISABLE_ROLE\":false,\"ASSOCIATECLIENTS_GROUP\":false,\"DELETE_SMSCAMPAIGN_CHECKER\":false,\"DELETE_CHARGE\":false,\"DELETE_RECURRINGDEPOSITPRODUCT_CHECKER\":false,\"CREATE_TELLER\":false,\"UPDATE_FUND\":false,\"CREATE_LOANPRODUCT\":false,\"DELETE_FIXEDDEPOSITACCOUNT_CHECKER\":false,\"ASSIGNROLE_GROUP\":false,\"DISABLE_ROLE_CHECKER\":false,\"DELETE_FIXEDDEPOSITPRODUCT\":false,\"DELETE_REPORT\":false,\"ACTIVATE_CENTER\":false,\"DELETE_FIXEDDEPOSITACCOUNT\":false,\"READ_PRODUCTMIX\":false,\"CREATE_TEMPLATE\":false,\"UPDATE_SAVINGSPRODUCT\":false,\"DELETE_LOANPRODUCT\":false,\"EXECUTE_PERIODICACCRUALACCOUNTING\":false,\"READ_MEETING\":false,\"CREATE_SAVINGSPRODUCT\":false,\"CREATE_CENTER\":false,\"SAVECOLLECTIONSHEET_GROUP\":false,\"DELETE_ROLE\":false,\"UPDATE_GROUPNOTE_CHECKER\":false,\"UPDATE_REPORT\":false,\"CREATE_FIXEDDEPOSITPRODUCT\":false,\"ASSOCIATEGROUPS_CENTER\":false,\"UPDATE_PASSWORD_PREFERENCES\":false,\"CREATE_JOURNALENTRY_CHECKER\":false,\"CREATE_FIXEDDEPOSITACCOUNT\":false,\"CREATE_SMSCAMPAIGN_CHECKER\":false,\"UPDATE_FIXEDDEPOSITACCOUNT_CHECKER\":false,\"UNASSIGNSTAFF_GROUP\":false,\"DELETE_GROUPNOTE\":false,\"DELETE_CENTER_CHECKER\":false,\"UPDATE_GROUPNOTE\":false,\"READ_PASSWORD_PREFERENCES\":false,\"UPDATE_ROLE\":false,\"UPDATE_CENTER\":false,\"DELETE_SAVINGSPRODUCT_CHECKER\":false,\"UPDATE_STAFF\":false,\"DELETE_OFFICE_CHECKER\":false,\"UNASSIGNSTAFF_GROUP_CHECKER\":false,\"UPDATERUNNINGBALANCE_JOURNALENTRY\":false,\"CREATE_SMSCAMPAIGN\":false,\"CREATE_MEETING\":false,\"DELETE_GROUP\":false,\"CREATE_GLCLOSURE\":false,\"UPDATE_GROUP_CHECKER\":false,\"DELETE_USER\":false,\"DEFINEOPENINGBALANCE_JOURNALENTRY\":false,\"CREATE_FINANCIALACTIVITYACCOUNT\":false,\"CREATE_FIXEDDEPOSITPRODUCT_CHECKER\":false,\"UPDATE_REPORT_CHECKER\":false,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":false,\"ASSOCIATEGROUPS_CENTER_CHECKER\":false,\"DELETE_ROLE_CHECKER\":false,\"DELETE_FUND\":false,\"CREATE_SMS\":false,\"READ_CENTER\":false,\"TRANSFERCLIENTS_GROUP_CHECKER\":false,\"ENABLE_ROLE_CHECKER\":false,\"CREATE_ROLE_CHECKER\":false,\"CREATE_GROUPNOTE_CHECKER\":false,\"DELETE_STAFF\":false,\"UPDATE_RECURRINGDEPOSITPRODUCT\":false,\"CREATE_PRODUCTMIX\":false,\"CREATE_RECURRINGDEPOSITACCOUNT\":false,\"UPDATE_ACCOUNTINGRULE\":false,\"DELETE_LOANPRODUCT_CHECKER\":false,\"UPDATE_PRODUCTMIX\":false,\"UPDATE_USER_CHECKER\":false,\"ACTIVATE_CENTER_CHECKER\":false}}',1,'2018-02-12 10:03:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(128,'PERMISSIONS','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/2/permissions',2,NULL,'{\"permissions\":{\"ALL_FUNCTIONS\":true,\"ALL_FUNCTIONS_READ\":true}}',1,'2018-02-12 10:04:31',NULL,NULL,1,NULL,NULL,NULL,NULL),(129,'CREATE','CLIENT',1,NULL,1,NULL,NULL,'/clients/template',1,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Rose\",\"lastname\":\"Malaki\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:25:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(130,'CREATE','LOAN',1,NULL,1,1,NULL,'/loans',1,NULL,'{\"clientId\":\"1\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":6,\"loanTermFrequencyType\":2,\"numberOfRepayments\":6,\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":1.08,\"amortizationType\":1,\"interestType\":1,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\"}',1,'2018-02-13 10:26:14',NULL,NULL,1,NULL,NULL,NULL,NULL),(131,'CREATE','CLIENT',1,NULL,2,NULL,NULL,'/clients/template',2,NULL,'{\"address\":[],\"officeId\":1,\"firstname\":\"Juma\",\"lastname\":\"Mseko\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:26:53',NULL,NULL,1,NULL,NULL,NULL,NULL),(132,'CREATE','CLIENT',1,NULL,3,NULL,NULL,'/clients/template',3,NULL,'{\"address\":[],\"officeId\":1,\"firstname\":\"Hadija\",\"lastname\":\"Kiseko\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:27:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(133,'CREATE','CLIENT',1,NULL,4,NULL,NULL,'/clients/template',4,NULL,'{\"address\":[],\"officeId\":1,\"firstname\":\"Lulu\",\"lastname\":\"Ibrahimu\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:27:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(134,'CREATE','CLIENT',1,NULL,5,NULL,NULL,'/clients/template',5,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Lucious\",\"lastname\":\"Muna\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:28:00',NULL,NULL,1,NULL,NULL,NULL,NULL),(135,'CREATE','CLIENT',1,NULL,6,NULL,NULL,'/clients/template',6,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Anna\",\"lastname\":\"Lusekelo\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:28:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(136,'CREATE','CLIENT',1,NULL,7,NULL,NULL,'/clients/template',7,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Eliza\",\"lastname\":\"Mushi\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:29:37',NULL,NULL,1,NULL,NULL,NULL,NULL),(137,'CREATE','CLIENT',1,NULL,8,NULL,NULL,'/clients/template',8,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Mulisi\",\"lastname\":\"Mulisi\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"savingsProductId\":null}',1,'2018-02-13 10:31:06',NULL,NULL,1,NULL,NULL,NULL,NULL),(138,'CREATE','LOAN',1,NULL,3,2,NULL,'/loans',2,NULL,'{\"clientId\":\"3\",\"productId\":5,\"disbursementData\":[],\"principal\":100000,\"loanTermFrequency\":1,\"loanTermFrequencyType\":2,\"numberOfRepayments\":1,\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":2.7,\"amortizationType\":1,\"interestType\":1,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"14 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"14 February 2018\"}]}',1,'2018-02-13 11:06:31',NULL,NULL,1,NULL,NULL,NULL,NULL),(139,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":1,\"chargeId\":2,\"amount\":500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]},{\"id\":2,\"chargeId\":1,\"amount\":250.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]}]}',1,'2018-02-13 11:07:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(140,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"principal\":1000000,\"locale\":\"en\",\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"numberOfRepayments\":12,\"charges\":[{\"id\":1,\"chargeId\":2,\"amount\":500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]},{\"id\":2,\"chargeId\":1,\"amount\":250.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]}],\"externalId\":12}',1,'2018-02-13 11:10:32',NULL,NULL,1,NULL,NULL,NULL,NULL),(141,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":0,\"charges\":[{\"id\":2,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]},{\"id\":1,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]}]}',1,'2018-02-13 11:18:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(142,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/5',5,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"maxInterestRatePerPeriod\":3,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"interestOnLoanAccountId\":27,\"transfersInSuspenseAccountId\":75,\"paymentChannelToFundSourceMappings\":\"[]\",\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-13 11:21:53',NULL,NULL,1,NULL,NULL,NULL,NULL),(143,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":2.7083,\"charges\":[{\"id\":1,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]},{\"id\":2,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]}]}',1,'2018-02-13 11:22:10',NULL,NULL,1,NULL,NULL,NULL,NULL),(144,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":2.70833333,\"charges\":[{\"id\":1,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]},{\"id\":2,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,14]}]}',1,'2018-02-13 11:24:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(145,'APPROVE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"13 February 2018\",\"expectedDisbursementDate\":{}}',1,'2018-02-13 11:32:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(146,'APPROVALUNDO','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',1,'2018-02-13 11:39:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(147,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[]}',1,'2018-02-13 11:39:45',NULL,NULL,1,NULL,NULL,NULL,NULL),(148,'UPDATE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[]}',1,'2018-02-13 11:40:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(149,'APPROVE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"13 February 2018\",\"expectedDisbursementDate\":{}}',1,'2018-02-13 11:40:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(150,'DISBURSE','LOAN',1,NULL,3,2,NULL,'/loans/2',2,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"13 February 2018\"}',1,'2018-02-13 11:41:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(151,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/3',3,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"maxInterestRatePerPeriod\":4,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"writeOffAccountId\":62,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"interestOnLoanAccountId\":27,\"transfersInSuspenseAccountId\":75,\"paymentChannelToFundSourceMappings\":\"[]\",\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',1,'2018-02-13 11:43:37',NULL,NULL,1,NULL,NULL,NULL,NULL),(152,'CREATE','LOAN',1,NULL,3,3,NULL,'/loans',3,NULL,'{\"clientId\":\"3\",\"productId\":3,\"disbursementData\":[],\"principal\":\"3000000\",\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"2.70833333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\"}',1,'2018-02-13 11:45:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(153,'CREATE','LOAN',1,NULL,5,4,NULL,'/loans',4,NULL,'{\"clientId\":\"5\",\"productId\":1,\"disbursementData\":[],\"principal\":\"50000000\",\"loanTermFrequency\":\"48\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"48\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.083333333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"13 February 2018\",\"submittedOnDate\":\"13 February 2018\"}',1,'2018-02-13 11:53:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(154,'UPDATE','LOAN',1,NULL,5,4,NULL,'/loans/4',4,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333333,\"charges\":[]}',1,'2018-02-13 11:56:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(155,'UPDATE','LOAN',1,NULL,5,4,NULL,'/loans/4',4,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.0833334,\"charges\":[]}',1,'2018-02-13 11:57:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(156,'UPDATE','LOAN',1,NULL,5,4,NULL,'/loans/4',4,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.0833335,\"charges\":[]}',1,'2018-02-13 11:57:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(157,'UPDATE','LOAN',1,NULL,5,4,NULL,'/loans/4',4,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[]}',1,'2018-02-13 12:00:45',NULL,NULL,1,NULL,NULL,NULL,NULL),(158,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"CS\",\"writeOffAccountId\":59,\"incomeFromInterestId\":28,\"escheatLiabilityId\":21,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"savingsControlAccountId\":21,\"overdraftPortfolioControlId\":68,\"transfersInSuspenseAccountId\":81,\"paymentChannelToFundSourceMappings\":\"[]\",\"savingsReferenceAccountId\":9,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"incomeFromFeeAccountId\":29}',1,'2018-02-13 12:24:50',NULL,NULL,1,NULL,NULL,NULL,NULL),(159,'REPAYMENT','LOAN',1,NULL,3,2,NULL,'/loans/2/transactions/template?command=repayment',2,NULL,'{\"transactionDate\":\"13 February 2018\",\"transactionAmount\":\"98721\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"paymentTypeId\":\"\"}',1,'2018-02-13 13:59:23',NULL,NULL,1,NULL,NULL,NULL,NULL),(160,'REPAYMENT','LOAN',1,NULL,3,2,NULL,'/loans/2/transactions/template?command=repayment',3,NULL,'{\"transactionDate\":\"13 February 2018\",\"transactionAmount\":\"98721\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"paymentTypeId\":\"\"}',1,'2018-02-13 13:59:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(161,'REPAYMENT','LOAN',1,NULL,3,2,NULL,'/loans/2/transactions/template?command=repayment',4,NULL,'{\"transactionDate\":\"13 February 2018\",\"transactionAmount\":\"500000\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"paymentTypeId\":\"\"}',1,'2018-02-13 14:02:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(162,'WAIVEINTERESTPORTION','LOAN',1,NULL,3,2,NULL,'/loans/2/transactions/template?command=waiveinterest',5,NULL,'{\"transactionDate\":\"13 February 2018\",\"transactionAmount\":\"3300\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',1,'2018-02-13 14:09:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(163,'CREATE','JOURNALENTRY',1,NULL,NULL,NULL,NULL,'/journalentries/template',NULL,NULL,'{\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"officeId\":1,\"transactionDate\":\"14 February 2018\",\"currencyCode\":\"TZS\",\"credits\":[{\"glAccountId\":9,\"amount\":\"10000000\"}],\"debits\":[{\"glAccountId\":71,\"amount\":\"10000000\"}]}',1,'2018-02-14 11:27:59',NULL,NULL,1,NULL,'8a1d96c10b4b',NULL,NULL),(164,'CREATE','LOAN',1,NULL,6,5,NULL,'/loans',5,NULL,'{\"clientId\":\"6\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":6,\"loanTermFrequencyType\":2,\"numberOfRepayments\":6,\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.08333333333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"14 February 2018\",\"submittedOnDate\":\"14 February 2018\"}',1,'2018-02-14 11:29:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(165,'CREATE','SAVINGSACCOUNT',1,NULL,6,NULL,1,'/savingsaccounts/template',1,NULL,'{\"productId\":2,\"nominalAnnualInterestRate\":7,\"minRequiredOpeningBalance\":\"400000\",\"withdrawalFeeForTransfers\":false,\"allowOverdraft\":false,\"enforceMinRequiredBalance\":false,\"withHoldTax\":false,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"submittedOnDate\":\"14 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"monthDayFormat\":\"dd MMM\",\"charges\":[],\"clientId\":\"6\"}',1,'2018-02-14 11:30:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(166,'APPROVE','SAVINGSACCOUNT',1,NULL,6,NULL,1,'/savingsaccounts/1?command=approve',1,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"14 February 2018\"}',1,'2018-02-14 11:30:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(167,'ACTIVATE','SAVINGSACCOUNT',1,NULL,6,NULL,1,'/savingsaccounts/1?command=activate',1,NULL,'{\"status\":{\"id\":300,\"code\":\"savingsAccountStatusType.active\",\"value\":\"Active\",\"submittedAndPendingApproval\":false,\"approved\":false,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":true,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activatedOnDate\":\"14 February 2018\"}',1,'2018-02-14 11:30:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(168,'CREATE','GUARANTOR',1,NULL,NULL,5,NULL,'/loans/5/guarantors',1,NULL,'{\"guarantorTypeId\":1,\"locale\":\"en\",\"entityId\":6,\"savingsId\":1,\"amount\":\"400000\"}',1,'2018-02-14 11:31:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(169,'APPROVE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"14 February 2018\",\"expectedDisbursementDate\":{}}',1,'2018-02-14 11:31:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(170,'DISBURSE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"14 February 2018\"}',1,'2018-02-14 11:32:23',NULL,NULL,1,NULL,NULL,NULL,NULL),(171,'DISBURSALUNDO','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"actualDisbursementDate\":\"\"}',1,'2018-02-14 11:36:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(172,'CREATE','ACCOUNTINGRULE',1,NULL,NULL,NULL,NULL,'/accountingrules/template',1,NULL,'{\"name\":\"Payrol\",\"officeId\":1,\"description\":\"Salaries and wages for the month\",\"accountToCredit\":9,\"accountToDebit\":32}',1,'2018-02-14 11:43:50',NULL,NULL,1,NULL,NULL,NULL,NULL),(173,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/11/codevalues/template',11,NULL,'{\"isActive\":true,\"name\":\"Payroll\",\"position\":\"1\"}',1,'2018-02-14 11:46:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(174,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/11/codevalues/template',11,NULL,'{\"isActive\":true,\"name\":\"nssf\",\"position\":\"2\"}',1,'2018-02-14 11:46:39',NULL,NULL,1,NULL,NULL,NULL,NULL),(175,'UPDATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/56',56,NULL,'{\"parentId\":31,\"tagId\":14}',1,'2018-02-14 11:47:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(176,'UPDATE','ACCOUNTINGRULE',NULL,NULL,NULL,NULL,NULL,'/accountingrules/1',1,NULL,'{\"allowMultipleDebitEntries\":true,\"debitTags\":[\"14\"]}',1,'2018-02-14 11:48:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(177,'UPDATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/32',32,NULL,'{\"parentId\":31,\"tagId\":14}',1,'2018-02-14 11:49:46',NULL,NULL,1,NULL,NULL,NULL,NULL),(178,'CREATE','JOURNALENTRY',1,NULL,NULL,NULL,NULL,'/journalentries/template',NULL,NULL,'{\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"officeId\":1,\"transactionDate\":\"14 February 2018\",\"accountingRule\":1,\"currencyCode\":\"TZS\",\"credits\":[{\"glAccountId\":9,\"amount\":\"100\"}],\"debits\":[{\"glAccountId\":32,\"amount\":\"100\"}]}',1,'2018-02-14 11:50:34',NULL,NULL,1,NULL,'8a1d9ed445d7',NULL,NULL),(179,'UPDATE','ACCOUNTINGRULE',NULL,NULL,NULL,NULL,NULL,'/accountingrules/1',1,NULL,'{\"debitTags\":[\"15\"]}',1,'2018-02-14 11:52:46',NULL,NULL,1,NULL,NULL,NULL,NULL),(180,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/11/codevalues/template',11,NULL,'{\"isActive\":true,\"name\":\"Makato TRA\",\"position\":\"3\"}',1,'2018-02-14 12:00:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(181,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/11/codevalues/template',11,NULL,'{\"isActive\":true,\"name\":\"WCF\",\"position\":\"4\"}',1,'2018-02-14 12:00:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(182,'UPDATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/32',32,NULL,'{\"parentId\":31}',1,'2018-02-14 12:02:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(183,'UPDATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/34',34,NULL,'{\"parentId\":31,\"tagId\":14}',1,'2018-02-14 12:03:03',NULL,NULL,1,NULL,NULL,NULL,NULL),(184,'UPDATE','ACCOUNTINGRULE',NULL,NULL,NULL,NULL,NULL,'/accountingrules/1',1,NULL,'{\"debitTags\":[\"16\",\"17\"]}',1,'2018-02-14 12:04:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(185,'CREATE','JOURNALENTRY',1,NULL,NULL,NULL,NULL,'/journalentries/template',NULL,NULL,'{\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"officeId\":1,\"transactionDate\":\"14 February 2018\",\"accountingRule\":1,\"currencyCode\":\"TZS\",\"credits\":[{\"glAccountId\":9,\"amount\":\"2200000\"}],\"debits\":[{\"glAccountId\":32,\"amount\":\"1000000\"},{\"glAccountId\":34,\"amount\":\"700000\"},{\"glAccountId\":56,\"amount\":\"500000\"}]}',1,'2018-02-14 12:05:58',NULL,NULL,1,NULL,'8a1da4577f47',NULL,NULL),(186,'CREATE','GLCLOSURE',1,NULL,NULL,NULL,NULL,'/glclosures/template',1,NULL,'{\"officeId\":1,\"comments\":\"being end of month expense disclosure\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"closingDate\":\"14 February 2018\"}',1,'2018-02-14 12:09:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(187,'EXECUTE','PERIODICACCRUALACCOUNTING',NULL,NULL,NULL,NULL,NULL,'/accrualaccounting',NULL,NULL,'{\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"tillDate\":\"12 December 2017\"}',1,'2018-02-14 12:14:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(188,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',85,NULL,'{\"manualEntriesAllowed\":true,\"type\":2,\"usage\":\"1\",\"glCode\":\"3091\",\"parentId\":19,\"name\":\"Provision For Bad debts\",\"description\":\"hh\"}',1,'2018-02-14 12:23:04',NULL,NULL,1,NULL,NULL,NULL,NULL),(189,'CREATE','GLACCOUNT',NULL,NULL,NULL,NULL,NULL,'/glaccounts/template',86,NULL,'{\"manualEntriesAllowed\":true,\"type\":5,\"usage\":1,\"glCode\":\"5191\",\"parentId\":null,\"name\":\"Bad debts expenses\"}',1,'2018-02-14 12:24:25',NULL,NULL,1,NULL,NULL,NULL,NULL),(190,'CREATE','PROVISIONCRITERIA',NULL,NULL,NULL,NULL,NULL,'/provisioningcriteria',1,NULL,'{\"criteriaName\":\"Bad debts\",\"locale\":\"en\",\"loanProducts\":[{\"id\":\"1\",\"name\":\"Development Loan\",\"includeInBorrowerCycle\":false},{\"id\":\"2\",\"name\":\"Education Loan\",\"includeInBorrowerCycle\":false},{\"id\":\"3\",\"name\":\"Computer Loan\",\"includeInBorrowerCycle\":false},{\"id\":\"5\",\"name\":\"Emergency  Loan\",\"includeInBorrowerCycle\":false}],\"definitions\":[{\"categoryId\":1,\"categoryName\":\"STANDARD\",\"minAge\":\"0\",\"maxAge\":\"30\",\"provisioningPercentage\":\"10\",\"liabilityAccount\":85,\"expenseAccount\":86},{\"categoryId\":2,\"categoryName\":\"SUB-STANDARD\",\"minAge\":31,\"maxAge\":\"60\",\"provisioningPercentage\":\"15\",\"liabilityAccount\":85,\"expenseAccount\":86},{\"categoryId\":3,\"categoryName\":\"DOUBTFUL\",\"minAge\":61,\"maxAge\":\"90\",\"provisioningPercentage\":\"30\",\"liabilityAccount\":85,\"expenseAccount\":86},{\"categoryId\":4,\"categoryName\":\"LOSS\",\"minAge\":91,\"maxAge\":\"360\",\"provisioningPercentage\":\"100\",\"liabilityAccount\":85,\"expenseAccount\":86}]}',1,'2018-02-14 12:27:47',NULL,NULL,1,NULL,NULL,NULL,NULL),(191,'CREATE','PROVISIONENTRIES',NULL,NULL,NULL,NULL,NULL,'/provisioningentries',1,NULL,'{\"createjournalentries\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"date\":\"14 February 2018\"}',1,'2018-02-14 12:29:06',NULL,NULL,1,NULL,NULL,NULL,NULL),(192,'CREATE','PAYMENTTYPE',NULL,NULL,NULL,NULL,NULL,'/paymenttype',1,NULL,'{\"name\":\"Payrol\",\"description\":\"Waajiriwa NHC\",\"isCashPayment\":true,\"position\":\"1\"}',1,'2018-02-14 12:58:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(193,'DELETE','GLCLOSURE',1,NULL,NULL,NULL,NULL,'/glclosures/1',1,NULL,'{}',1,'2018-02-14 12:59:24',NULL,NULL,1,NULL,NULL,NULL,NULL),(194,'DISBURSE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"14 February 2018\"}',1,'2018-02-14 12:59:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(195,'UPDATE','PASSWORD_PREFERENCES',NULL,NULL,NULL,NULL,NULL,'/passwordpreferences',NULL,NULL,'{\"active\":true}',1,'2018-02-14 13:03:01',NULL,NULL,1,NULL,NULL,NULL,NULL),(196,'CREATE','STANDINGINSTRUCTION',NULL,NULL,6,NULL,NULL,'/standinginstructions',1,NULL,'{\"fromOfficeId\":1,\"fromClientId\":6,\"fromAccountType\":2,\"toOfficeId\":1,\"toClientId\":6,\"toAccountType\":1,\"name\":\"Loan Payment\",\"transferType\":2,\"priority\":1,\"status\":1,\"fromAccountId\":1,\"toAccountId\":5,\"instructionType\":2,\"amount\":\"2000\",\"validFrom\":\"14 February 2018\",\"validTill\":\"30 August 2018\",\"recurrenceType\":2,\"recurrenceInterval\":\"1\",\"recurrenceFrequency\":0,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"recurrenceOnMonthDay\":\"14 February\",\"monthDayFormat\":\"dd MMMM\"}',1,'2018-02-14 13:11:38',NULL,NULL,1,NULL,NULL,NULL,NULL),(197,'CREATE','DATATABLE',NULL,NULL,NULL,NULL,NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"Beneficiary\",\"apptableName\":\"m_client\",\"multiRow\":true,\"columns\":[{\"name\":\"Name\",\"type\":\"Text\",\"mandatory\":true},{\"name\":\"Relationship with the client\",\"type\":\"String\",\"mandatory\":true,\"length\":\"50\"}]}',1,'2018-02-14 14:52:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(198,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/4/codevalues/template',4,NULL,'{\"isActive\":true,\"name\":\"Male\",\"position\":\"1\"}',1,'2018-02-14 14:57:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(199,'CREATE','CODEVALUE',NULL,NULL,NULL,NULL,NULL,'/codes/4/codevalues/template',4,NULL,'{\"isActive\":true,\"name\":\"Female\",\"position\":\"2\"}',1,'2018-02-14 14:58:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(200,'CREATE','ACCOUNTNUMBERFORMAT',NULL,NULL,NULL,NULL,NULL,'/accountnumberformats',1,NULL,'{\"accountType\":2,\"prefixType\":201}',1,'2018-02-14 15:05:32',NULL,NULL,1,NULL,NULL,NULL,NULL),(201,'CREATE','ROLE',NULL,NULL,NULL,NULL,NULL,'/roles/template',6,NULL,'{\"name\":\"IT\",\"description\":\"IT\"}',1,'2018-02-14 15:08:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(202,'UPDATE','SAVINGSPRODUCT',NULL,NULL,NULL,NULL,NULL,'/savingsproducts/2',2,NULL,'{\"shortName\":\"Cont\",\"description\":\"Cont\",\"savingsControlAccountId\":21,\"writeOffAccountId\":59,\"overdraftPortfolioControlId\":68,\"incomeFromInterestId\":28,\"transfersInSuspenseAccountId\":81,\"escheatLiabilityId\":21,\"savingsReferenceAccountId\":9,\"incomeFromPenaltyAccountId\":76,\"interestOnSavingsAccountId\":39,\"penaltyToIncomeAccountMappings\":\"[]\",\"incomeFromFeeAccountId\":29,\"feeToIncomeAccountMappings\":\"[]\"}',1,'2018-02-14 15:54:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(203,'CREATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/template',5,NULL,'{\"chargeAppliesTo\":1,\"name\":\"Processing Fee 1\",\"currencyCode\":\"TZS\",\"chargeTimeType\":2,\"chargeCalculationType\":2,\"chargePaymentMode\":0,\"amount\":\"0.5\",\"active\":true,\"locale\":\"en\",\"monthDayFormat\":\"dd MMM\"}',1,'2018-02-14 15:58:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(204,'UPDATE','PASSWORD_PREFERENCES',NULL,NULL,NULL,NULL,NULL,'/passwordpreferences',NULL,NULL,'{\"active\":true}',1,'2018-02-15 09:38:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(205,'CREATE','USER',1,NULL,NULL,NULL,NULL,'/users/template',3,NULL,'{\"sendPasswordToEmail\":false,\"roles\":[\"4\"],\"username\":\"rose\",\"firstname\":\"RoseMary\",\"lastname\":\"Masawe\",\"email\":\"rose@gmail.com\",\"password\":\"rose\",\"repeatPassword\":\"rose\",\"officeId\":1}',1,'2018-02-15 09:40:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(206,'CREATE','USER',1,NULL,NULL,NULL,NULL,'/users/template',4,NULL,'{\"sendPasswordToEmail\":false,\"roles\":[\"3\"],\"username\":\"grace\",\"firstname\":\"Grace\",\"password\":\"grace\",\"repeatPassword\":\"grace\",\"officeId\":1,\"email\":\"grace@gmail.com\",\"lastname\":\"Grace\"}',1,'2018-02-15 10:11:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(207,'UPDATE','USER',1,NULL,NULL,NULL,NULL,'/users/4',4,NULL,'{\"roles\":[\"1\"]}',1,'2018-02-15 11:52:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(208,'UPDATE','USER',1,NULL,NULL,NULL,NULL,'/users/3',3,NULL,'{\"roles\":[\"1\"]}',1,'2018-02-15 11:52:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(209,'CREATE','USER',1,NULL,NULL,NULL,NULL,'/users/template',5,NULL,'{\"sendPasswordToEmail\":false,\"roles\":[\"1\"],\"username\":\"justine\",\"firstname\":\"Justine\",\"lastname\":\"Warioba\",\"email\":\"justine@gmail.com\",\"password\":\"justine\",\"repeatPassword\":\"justine\",\"officeId\":1}',1,'2018-02-15 11:55:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(210,'UPDATE','USER',1,NULL,NULL,NULL,NULL,'/users/4',4,NULL,'{\"lastname\":\"Amin\"}',1,'2018-02-15 11:55:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(211,'CREATE','CLIENT',1,NULL,9,NULL,NULL,'/clients/template',9,NULL,'{\"address\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"mwakasungura\",\"middlename\":\"sinachangu\",\"lastname\":\"malikauli\",\"mobileNo\":\"0744252525\",\"genderId\":18,\"externalId\":\"PF 5000\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"dateOfBirth\":\"08 August 2017\",\"savingsProductId\":null}',4,'2018-02-15 12:05:21',NULL,NULL,1,NULL,NULL,NULL,NULL),(212,'CREATE','CLIENT',1,NULL,10,NULL,NULL,'/clients/template',10,NULL,'{\"address\":[],\"officeId\":1,\"firstname\":\"Saidi\",\"middlename\":\"A\",\"lastname\":\"Bungara\",\"mobileNo\":\"0713463030\",\"genderId\":18,\"externalId\":\"1720\",\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"dateOfBirth\":\"28 January 1991\",\"savingsProductId\":null}',5,'2018-02-15 12:05:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(213,'UPDATE','CLIENT',1,NULL,10,NULL,NULL,'/clients/10',10,NULL,'{\"externalId\":\"1819\",\"firstname\":\"Waryoba\",\"lastname\":\"Buritho\"}',5,'2018-02-15 12:07:19',NULL,NULL,1,NULL,NULL,NULL,NULL),(214,'CREATE','SAVINGSACCOUNT',1,NULL,10,NULL,2,'/savingsaccounts/template',2,NULL,'{\"productId\":2,\"nominalAnnualInterestRate\":7,\"minRequiredOpeningBalance\":\"700000\",\"withdrawalFeeForTransfers\":false,\"allowOverdraft\":false,\"enforceMinRequiredBalance\":false,\"withHoldTax\":false,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"submittedOnDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"monthDayFormat\":\"dd MMM\",\"charges\":[],\"clientId\":\"10\"}',5,'2018-02-15 12:17:14',NULL,NULL,1,NULL,NULL,NULL,NULL),(215,'CREATE','SAVINGSACCOUNT',1,NULL,9,NULL,3,'/savingsaccounts/template',3,NULL,'{\"productId\":2,\"nominalAnnualInterestRate\":7,\"minRequiredOpeningBalance\":\"700000\",\"withdrawalFeeForTransfers\":false,\"allowOverdraft\":false,\"enforceMinRequiredBalance\":false,\"withHoldTax\":false,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"externalId\":\"\",\"submittedOnDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"monthDayFormat\":\"dd MMM\",\"charges\":[],\"clientId\":\"9\"}',4,'2018-02-15 12:17:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(216,'APPROVE','SAVINGSACCOUNT',1,NULL,9,NULL,3,'/savingsaccounts/3?command=approve',3,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"note\":\"SAVINGS\"}',4,'2018-02-15 12:18:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(217,'ACTIVATE','SAVINGSACCOUNT',1,NULL,9,NULL,3,'/savingsaccounts/3?command=activate',3,NULL,'{\"status\":{\"id\":300,\"code\":\"savingsAccountStatusType.active\",\"value\":\"Active\",\"submittedAndPendingApproval\":false,\"approved\":false,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":true,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activatedOnDate\":\"15 February 2018\"}',4,'2018-02-15 12:18:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(218,'CREATE','CLIENT',1,NULL,11,NULL,4,'/clients/template',11,NULL,'{\"address\":[],\"officeId\":1,\"firstname\":\"diana\",\"middlename\":\"didas\",\"lastname\":\"kavishe\",\"mobileNo\":\"0718922173\",\"active\":true,\"isStaff\":false,\"genderId\":19,\"savingsProductId\":2,\"legalFormId\":1,\"externalId\":\"7000\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"dateOfBirth\":\"30 June 1994\"}',3,'2018-02-15 12:19:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(219,'APPROVE','SAVINGSACCOUNT',1,NULL,10,NULL,2,'/savingsaccounts/2?command=approve',2,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"note\":\"being amount deposited as a contribution for the month.\"}',5,'2018-02-15 12:20:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(220,'CREATE','SAVINGSACCOUNT',1,NULL,10,NULL,5,'/savingsaccounts/template',5,NULL,'{\"productId\":2,\"nominalAnnualInterestRate\":7,\"minRequiredOpeningBalance\":\"700000\",\"withdrawalFeeForTransfers\":false,\"allowOverdraft\":false,\"enforceMinRequiredBalance\":false,\"minRequiredBalance\":\"700000\",\"withHoldTax\":false,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"submittedOnDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"monthDayFormat\":\"dd MMM\",\"charges\":[],\"clientId\":\"10\"}',5,'2018-02-15 12:34:38',NULL,NULL,1,NULL,NULL,NULL,NULL),(221,'APPROVALUNDO','SAVINGSACCOUNT',1,NULL,10,NULL,2,'/savingsaccounts/2?command=undoapproval',2,NULL,'{\"status\":{\"id\":100,\"code\":\"savingsAccountStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"submittedAndPendingApproval\":true,\"approved\":false,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"approvedOnDate\":\"\",\"note\":\"contribution for the month\"}',5,'2018-02-15 12:36:53',NULL,NULL,1,NULL,NULL,NULL,NULL),(222,'APPROVE','SAVINGSACCOUNT',1,NULL,10,NULL,2,'/savingsaccounts/2?command=approve',2,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"note\":\"contribution\"}',5,'2018-02-15 12:37:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(223,'APPROVE','SAVINGSACCOUNT',1,NULL,10,NULL,5,'/savingsaccounts/5?command=approve',5,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"note\":\"contribution\"}',5,'2018-02-15 12:38:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(224,'ACTIVATE','SAVINGSACCOUNT',1,NULL,10,NULL,5,'/savingsaccounts/5?command=activate',5,NULL,'{\"status\":{\"id\":300,\"code\":\"savingsAccountStatusType.active\",\"value\":\"Active\",\"submittedAndPendingApproval\":false,\"approved\":false,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":true,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activatedOnDate\":\"15 February 2018\"}',5,'2018-02-15 12:39:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(225,'CREATE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share',1,NULL,'{\"productId\":1,\"unitPrice\":25000,\"requestedShares\":\"20\",\"submittedDate\":\"15 February 2018\",\"applicationDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"charges\":[],\"clientId\":\"10\",\"minimumActivePeriod\":\"3\",\"minimumActivePeriodFrequencyType\":0,\"lockinPeriodFrequencyType\":0,\"savingsAccountId\":5}',5,'2018-02-15 12:46:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(226,'APPROVE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share/1?command=approve',1,NULL,'{\"note\":\"share applyed\",\"id\":1}',5,'2018-02-15 12:47:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(227,'CREATE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share',2,NULL,'{\"productId\":1,\"unitPrice\":25000,\"requestedShares\":\"20\",\"submittedDate\":\"15 February 2018\",\"minimumActivePeriod\":\"3\",\"savingsAccountId\":3,\"applicationDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"charges\":[],\"clientId\":\"9\",\"minimumActivePeriodFrequencyType\":0}',4,'2018-02-15 12:47:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(228,'ACTIVATE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share/1?command=activate',1,NULL,'{\"charges\":\"Feb 15, 2018 12:00:00 AM\"}',5,'2018-02-15 12:47:50',NULL,NULL,1,NULL,NULL,NULL,NULL),(229,'APPROVE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share/2?command=approve',2,NULL,'{\"note\":\"shares\",\"id\":2}',4,'2018-02-15 12:48:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(230,'ACTIVATE','SHAREACCOUNT',NULL,NULL,NULL,NULL,NULL,'/accounts/share/2?command=activate',2,NULL,'{\"charges\":\"Feb 15, 2018 12:00:00 AM\"}',4,'2018-02-15 12:48:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(231,'CREATE','SAVINGSACCOUNT',1,NULL,11,NULL,6,'/savingsaccounts/template',6,NULL,'{\"productId\":2,\"nominalAnnualInterestRate\":7,\"minRequiredOpeningBalance\":\"50000\",\"withdrawalFeeForTransfers\":true,\"allowOverdraft\":false,\"enforceMinRequiredBalance\":false,\"minRequiredBalance\":\"700000\",\"withHoldTax\":false,\"interestCompoundingPeriodType\":7,\"interestPostingPeriodType\":7,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"externalId\":\"7000\",\"submittedOnDate\":\"15 February 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"monthDayFormat\":\"dd MMM\",\"charges\":[],\"clientId\":\"11\"}',3,'2018-02-15 13:09:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(232,'APPROVE','SAVINGSACCOUNT',1,NULL,11,NULL,6,'/savingsaccounts/6?command=approve',6,NULL,'{\"status\":{\"id\":200,\"code\":\"savingsAccountStatusType.approved\",\"value\":\"Approved\",\"submittedAndPendingApproval\":false,\"approved\":true,\"rejected\":false,\"withdrawnByApplicant\":false,\"active\":false,\"closed\":false,\"prematureClosed\":false,\"transferInProgress\":false,\"transferOnHold\":false,\"matured\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"note\":\"being bal of savings account\"}',3,'2018-02-15 13:10:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(233,'CREATE','LOAN',1,NULL,10,6,NULL,'/loans',6,NULL,'{\"clientId\":\"10\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":6,\"loanTermFrequencyType\":2,\"numberOfRepayments\":6,\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":1.08,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"linkAccountId\":5,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"01 March 2018\",\"submittedOnDate\":\"15 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"02 March 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"02 March 2018\"}]}',5,'2018-02-15 13:13:09',NULL,NULL,1,NULL,NULL,NULL,NULL),(234,'CREATE','LOAN',1,NULL,9,7,NULL,'/loans',7,NULL,'{\"clientId\":\"9\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":6,\"loanTermFrequencyType\":2,\"numberOfRepayments\":6,\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":1.08,\"amortizationType\":1,\"interestType\":1,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"linkAccountId\":3,\"interestChargedFromDate\":\"15 March 2018\",\"repaymentsStartingFromDate\":\"15 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"16 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"16 February 2018\"}]}',4,'2018-02-15 13:17:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(235,'UPDATESAVINGSACCOUNT','CLIENT',1,NULL,11,NULL,NULL,'/clients/11?command=updateSavingsAccount',11,NULL,'{\"savingsAccountId\":4}',3,'2018-02-15 13:22:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(236,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestType\":0,\"allowPartialPeriodInterestCalcualtion\":true,\"graceOnInterestCharged\":1,\"createStandingInstructionAtDisbursement\":true,\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 13:23:14',NULL,NULL,1,NULL,NULL,NULL,NULL),(237,'DEPOSIT','SAVINGSACCOUNT',1,NULL,11,NULL,4,'/savingsaccounts/4/transactions',4,NULL,'{\"transactionDate\":\"15 February 2018\",\"transactionAmount\":\"700000\",\"paymentTypeId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',3,'2018-02-15 13:26:21',NULL,NULL,1,NULL,NULL,NULL,NULL),(238,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"createStandingInstructionAtDisbursement\":false,\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 13:27:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(239,'CREATE','LOAN',1,NULL,11,8,NULL,'/loans',8,NULL,'{\"clientId\":\"11\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":\"36\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.0833333333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"externalId\":\"7000\",\"linkAccountId\":4,\"repaymentsStartingFromDate\":\"30 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"16 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"16 February 2018\"}]}',3,'2018-02-15 13:30:18',NULL,NULL,1,NULL,NULL,NULL,NULL),(240,'UPDATESAVINGSACCOUNT','CLIENT',1,NULL,11,NULL,NULL,'/clients/11?command=updateSavingsAccount',11,NULL,'{\"savingsAccountId\":4}',3,'2018-02-15 13:34:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(241,'UPDATE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"numberOfRepayments\":12,\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":3,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]},{\"id\":4,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]}],\"externalId\":12}',5,'2018-02-15 13:34:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(242,'DEPOSIT','SAVINGSACCOUNT',1,NULL,11,NULL,4,'/savingsaccounts/4/transactions',5,NULL,'{\"transactionDate\":\"15 February 2018\",\"transactionAmount\":\"150000\",\"paymentTypeId\":1,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',3,'2018-02-15 13:34:44',NULL,NULL,1,NULL,NULL,NULL,NULL),(243,'CREATE','GUARANTOR',1,NULL,NULL,7,NULL,'/loans/7/guarantors',2,NULL,'{\"guarantorTypeId\":1,\"locale\":\"en\",\"entityId\":9,\"savingsId\":3,\"amount\":\"700000\"}',4,'2018-02-15 13:39:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(244,'CREATE','GUARANTOR',1,NULL,NULL,6,NULL,'/loans/6/guarantors',3,NULL,'{\"guarantorTypeId\":1,\"locale\":\"en\",\"entityId\":10,\"savingsId\":5,\"amount\":\"350000\"}',5,'2018-02-15 13:47:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(245,'APPROVE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"DEV LOAN\"}',4,'2018-02-15 13:48:45',NULL,NULL,1,NULL,NULL,NULL,NULL),(246,'DISBURSE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"15 February 2018\"}',4,'2018-02-15 13:49:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(247,'APPROVE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"Development loan\"}',5,'2018-02-15 13:49:29',NULL,NULL,1,NULL,NULL,NULL,NULL),(248,'DISBURSALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"actualDisbursementDate\":\"\"}',4,'2018-02-15 13:53:00',NULL,NULL,1,NULL,NULL,NULL,NULL),(249,'APPROVALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 13:53:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(250,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"numberOfRepayments\":12,\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}],\"externalId\":12}',4,'2018-02-15 13:54:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(251,'APPROVE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"DEV LOAN\"}',4,'2018-02-15 13:54:18',NULL,NULL,1,NULL,NULL,NULL,NULL),(252,'DISBURSE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"15 February 2018\"}',4,'2018-02-15 13:54:35',NULL,NULL,1,NULL,NULL,NULL,NULL),(253,'CREATE','GUARANTOR',1,NULL,NULL,8,NULL,'/loans/8/guarantors',4,NULL,'{\"guarantorTypeId\":1,\"locale\":\"en\",\"entityId\":11,\"savingsId\":4,\"amount\":\"333333.33\"}',3,'2018-02-15 13:56:37',NULL,NULL,1,NULL,NULL,NULL,NULL),(254,'DISBURSALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"actualDisbursementDate\":\"\"}',4,'2018-02-15 13:58:24',NULL,NULL,1,NULL,NULL,NULL,NULL),(255,'APPROVALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 13:58:30',NULL,NULL,1,NULL,NULL,NULL,NULL),(256,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"allowPartialPeriodInterestCalcualtion\":false,\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 14:01:45',NULL,NULL,1,NULL,NULL,NULL,NULL),(257,'APPROVE','LOAN',1,NULL,11,8,NULL,'/loans/8',8,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{}}',3,'2018-02-15 14:05:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(258,'DISBURSE','LOAN',1,NULL,11,8,NULL,'/loans/8',8,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"15 February 2018\"}',3,'2018-02-15 14:05:49',NULL,NULL,1,NULL,NULL,NULL,NULL),(259,'APPROVALUNDO','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',5,'2018-02-15 14:11:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(260,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 14:12:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(261,'APPROVE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"DEV LOAN\"}',4,'2018-02-15 14:13:10',NULL,NULL,1,NULL,NULL,NULL,NULL),(262,'UPDATE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":4,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]},{\"id\":3,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]}]}',5,'2018-02-15 14:13:42',NULL,NULL,1,NULL,NULL,NULL,NULL),(263,'APPROVE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"development loan\"}',5,'2018-02-15 14:14:06',NULL,NULL,1,NULL,NULL,NULL,NULL),(264,'APPROVALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 14:19:57',NULL,NULL,1,NULL,NULL,NULL,NULL),(265,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 14:25:52',NULL,NULL,1,NULL,NULL,NULL,NULL),(266,'APPROVE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{}}',4,'2018-02-15 14:26:06',NULL,NULL,1,NULL,NULL,NULL,NULL),(267,'UPDATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/1',1,NULL,'{\"chargeTimeType\":1,\"locale\":\"en\"}',4,'2018-02-15 14:30:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(268,'DISBURSALUNDO','LOAN',1,NULL,11,8,NULL,'/loans/8',8,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"actualDisbursementDate\":\"\"}',4,'2018-02-15 14:31:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(269,'APPROVALUNDO','LOAN',1,NULL,11,8,NULL,'/loans/8',8,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 14:31:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(270,'APPROVALUNDO','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',5,'2018-02-15 14:42:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(271,'UPDATE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"transactionProcessingStrategyId\":5,\"repaymentsStartingFromDate\":\"31 March 2018\",\"dateFormat\":\"dd MMMM yyyy\",\"charges\":[{\"id\":3,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]},{\"id\":4,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,3,2]}]}',5,'2018-02-15 14:46:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(272,'CREATE','LOAN',1,NULL,6,9,NULL,'/loans',9,NULL,'{\"clientId\":\"6\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.083333333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"inArrearsTolerance\":\"0\",\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":5,\"graceOnInterestCharged\":\"0\",\"interestChargedFromDate\":\"31 March 2018\",\"repaymentsStartingFromDate\":\"31 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"16 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"16 February 2018\"}]}',4,'2018-02-15 14:46:22',NULL,NULL,1,NULL,NULL,NULL,NULL),(273,'CREATE','LOAN',1,NULL,11,10,NULL,'/loans',10,NULL,'{\"clientId\":\"11\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.0833333333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":5,\"interestChargedFromDate\":\"31 March 2018\",\"repaymentsStartingFromDate\":\"31 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\",\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"16 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"16 February 2018\"}]}',3,'2018-02-15 14:48:09',NULL,NULL,1,NULL,NULL,NULL,NULL),(274,'APPROVE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"approvedOnDate\":\"15 February 2018\",\"expectedDisbursementDate\":{},\"note\":\"Development loan\"}',5,'2018-02-15 14:56:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(275,'DISBURSE','LOAN',1,NULL,10,6,NULL,'/loans/6',6,NULL,'{\"status\":{\"id\":300,\"code\":\"loanStatusType.active\",\"value\":\"Active\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":true,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"actualDisbursementDate\":\"15 February 2018\"}',5,'2018-02-15 15:00:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(276,'REPAYMENT','LOAN',1,NULL,10,6,NULL,'/loans/6/transactions/template?command=repayment',16,NULL,'{\"transactionDate\":\"15 February 2018\",\"transactionAmount\":\"96817\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"paymentTypeId\":\"1\",\"note\":\"being payment for development loan\"}',5,'2018-02-15 15:11:15',NULL,NULL,1,NULL,NULL,NULL,NULL),(277,'DISBURSALUNDO','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":200,\"code\":\"loanStatusType.approved\",\"value\":\"Approved\",\"pendingApproval\":false,\"waitingForDisbursal\":true,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"actualDisbursementDate\":\"\"}',4,'2018-02-15 15:15:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(278,'APPROVALUNDO','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 15:15:58',NULL,NULL,1,NULL,NULL,NULL,NULL),(279,'UPDATE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"numberOfRepayments\":12,\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":null,\"chargeId\":1,\"amount\":2500.0000,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":null},{\"id\":null,\"chargeId\":2,\"amount\":5000.000,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}],\"externalId\":12}',4,'2018-02-15 15:19:32',NULL,NULL,1,NULL,NULL,NULL,NULL),(280,'UPDATE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":13,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":14,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:24:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(281,'CREATE','JOURNALENTRY',1,NULL,NULL,NULL,NULL,'/journalentries/template',NULL,NULL,'{\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"officeId\":1,\"transactionDate\":\"15 February 2018\",\"comments\":\"being amount authorized for communication expenses\",\"currencyCode\":\"TZS\",\"credits\":[{\"glAccountId\":9,\"amount\":\"500000\"}],\"debits\":[{\"glAccountId\":52,\"amount\":\"500000\"}]}',5,'2018-02-15 15:24:59',NULL,NULL,1,NULL,'8a1fee7e5f7b',NULL,NULL),(282,'UPDATE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":14,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":13,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":[2018,2,15]}]}',4,'2018-02-15 15:30:44',NULL,NULL,1,NULL,NULL,NULL,NULL),(283,'UPDATE','LOAN',1,NULL,6,5,NULL,'/loans/5',5,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"submittedOnDate\":\"15 February 2018\",\"dateFormat\":\"dd MMMM yyyy\",\"expectedDisbursementDate\":\"15 February 2018\",\"charges\":[{\"id\":14,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":13,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:31:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(284,'APPROVALUNDO','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":100,\"code\":\"loanStatusType.submitted.and.pending.approval\",\"value\":\"Submitted and pending approval\",\"pendingApproval\":true,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"approvedOnDate\":\"\"}',4,'2018-02-15 15:37:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(285,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"graceOnInterestCharged\":null,\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:38:25',NULL,NULL,1,NULL,NULL,NULL,NULL),(286,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"repaymentsStartingFromDate\":\"30 March 2018\",\"dateFormat\":\"dd MMMM yyyy\",\"interestChargedFromDate\":\"30 March 2018\",\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:39:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(287,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:40:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(288,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:40:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(289,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"transactionProcessingStrategyId\":5,\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:41:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(290,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:42:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(291,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"allowPartialPeriodInterestCalcualtion\":true,\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:43:20',NULL,NULL,1,NULL,NULL,NULL,NULL),(292,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"createStandingInstructionAtDisbursement\":true,\"charges\":[{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:44:13',NULL,NULL,1,NULL,NULL,NULL,NULL),(293,'UPDATE','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"externalId\":\"PF 5000\",\"charges\":[{\"id\":5,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]},{\"id\":6,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":2,\"chargeCalculationType\":2,\"dueDate\":[2018,2,16]}]}',4,'2018-02-15 15:45:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(294,'REJECT','LOAN',1,NULL,9,7,NULL,'/loans/7',7,NULL,'{\"status\":{\"id\":500,\"code\":\"loanStatusType.rejected\",\"value\":\"Rejected\",\"pendingApproval\":false,\"waitingForDisbursal\":false,\"active\":false,\"closedObligationsMet\":false,\"closedWrittenOff\":false,\"closedRescheduled\":false,\"closed\":false,\"overpaid\":false},\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"rejectedOnDate\":\"15 February 2018\",\"closedOnDate\":\"15 February 2018\"}',4,'2018-02-15 15:46:12',NULL,NULL,1,NULL,NULL,NULL,NULL),(295,'UPDATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/5',5,NULL,'{\"chargeTimeType\":1,\"locale\":\"en\"}',4,'2018-02-15 15:53:08',NULL,NULL,1,NULL,NULL,NULL,NULL),(296,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"interestType\":0,\"transactionProcessingStrategyId\":5,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"interestOnLoanAccountId\":27,\"transfersInSuspenseAccountId\":75,\"paymentChannelToFundSourceMappings\":\"[]\",\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',4,'2018-02-15 16:02:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(297,'UPDATE','CHARGE',NULL,NULL,NULL,NULL,NULL,'/charges/2',2,NULL,'{\"chargeTimeType\":1,\"locale\":\"en\"}',4,'2018-02-15 16:04:32',NULL,NULL,1,NULL,NULL,NULL,NULL),(298,'DEPOSIT','SAVINGSACCOUNT',1,NULL,6,NULL,1,'/savingsaccounts/1/transactions',6,NULL,'{\"transactionDate\":\"15 February 2018\",\"transactionAmount\":\"560000\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}',4,'2018-02-15 16:05:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(299,'CREATE','LOAN',1,NULL,6,14,NULL,'/loans',14,NULL,'{\"clientId\":\"6\",\"productId\":1,\"disbursementData\":[],\"principal\":\"2000000\",\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":1.083333,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":5,\"linkAccountId\":1,\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"15 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"15 February 2018\"}],\"interestChargedFromDate\":\"30 March 2018\",\"repaymentsStartingFromDate\":\"30 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\"}',4,'2018-02-15 16:06:42',NULL,NULL,1,NULL,NULL,NULL,NULL),(300,'CREATE','LOAN',1,NULL,9,15,NULL,'/loans',15,NULL,'{\"clientId\":\"9\",\"productId\":1,\"disbursementData\":[],\"principal\":\"2000000\",\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":1.083333,\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":5,\"linkAccountId\":3,\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"15 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"15 February 2018\"}],\"interestChargedFromDate\":\"30 March 2018\",\"repaymentsStartingFromDate\":\"30 March 2018\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\"}',5,'2018-02-15 16:14:19',NULL,NULL,1,NULL,NULL,NULL,NULL),(301,'UPDATE','LOAN',1,NULL,6,14,NULL,'/loans/14',14,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":15,\"chargeId\":1,\"amount\":5000.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":null},{\"id\":16,\"chargeId\":2,\"amount\":10000.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":null}]}',4,'2018-02-15 16:15:38',NULL,NULL,1,NULL,NULL,NULL,NULL),(302,'UPDATE','LOAN',1,NULL,9,15,NULL,'/loans/15',15,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"charges\":[{\"id\":18,\"chargeId\":1,\"amount\":5000.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":[2018,2,15]},{\"id\":17,\"chargeId\":2,\"amount\":10000.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":[2018,2,15]}]}',5,'2018-02-15 16:15:56',NULL,NULL,1,NULL,NULL,NULL,NULL),(303,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.1083333,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"interestOnLoanAccountId\":27,\"transfersInSuspenseAccountId\":75,\"paymentChannelToFundSourceMappings\":\"[]\",\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',4,'2018-02-15 16:19:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(304,'CREATE','LOAN',1,NULL,9,16,NULL,'/loans',16,NULL,'{\"clientId\":\"9\",\"productId\":1,\"disbursementData\":[],\"principal\":1000000,\"loanTermFrequency\":\"12\",\"loanTermFrequencyType\":2,\"numberOfRepayments\":\"12\",\"repaymentEvery\":1,\"repaymentFrequencyType\":2,\"interestRatePerPeriod\":\"1.1083333\",\"amortizationType\":1,\"interestType\":0,\"interestCalculationPeriodType\":1,\"allowPartialPeriodInterestCalcualtion\":false,\"graceOnArrearsAgeing\":30,\"transactionProcessingStrategyId\":1,\"charges\":[{\"chargeId\":1,\"amount\":0.25,\"dueDate\":\"15 February 2018\"},{\"chargeId\":2,\"amount\":0.5,\"dueDate\":\"16 February 2018\"}],\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"loanType\":\"individual\",\"expectedDisbursementDate\":\"15 February 2018\",\"submittedOnDate\":\"15 February 2018\"}',4,'2018-02-15 16:20:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(305,'UPDATE','LOAN',1,NULL,9,16,NULL,'/loans/16',16,NULL,'{\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.1,\"charges\":[{\"id\":19,\"chargeId\":1,\"amount\":2500.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":null},{\"id\":20,\"chargeId\":2,\"amount\":5000.00,\"chargeTimeType\":1,\"chargeCalculationType\":2,\"dueDate\":null}]}',4,'2018-02-15 16:26:11',NULL,NULL,1,NULL,NULL,NULL,NULL),(306,'UPDATE','LOANPRODUCT',NULL,NULL,NULL,NULL,NULL,'/loanproducts/1',1,NULL,'{\"inMultiplesOf\":1,\"repaymentFrequencyNthDayType\":null,\"repaymentFrequencyDayOfWeekType\":null,\"locale\":\"en\",\"interestRatePerPeriod\":1.083333333,\"allowAttributeOverrides\":\"{\\\"amortizationType\\\":true,\\\"interestType\\\":true,\\\"transactionProcessingStrategyId\\\":true,\\\"interestCalculationPeriodType\\\":true,\\\"inArrearsTolerance\\\":true,\\\"repaymentEvery\\\":true,\\\"graceOnPrincipalAndInterestPayment\\\":true,\\\"graceOnArrearsAgeing\\\":true}\",\"fundSourceAccountId\":71,\"writeOffAccountId\":59,\"overpaymentLiabilityAccountId\":79,\"loanPortfolioAccountId\":5,\"receivableFeeAccountId\":73,\"incomeFromRecoveryAccountId\":77,\"penaltyToIncomeAccountMappings\":\"[]\",\"feeToIncomeAccountMappings\":\"[]\",\"interestOnLoanAccountId\":27,\"transfersInSuspenseAccountId\":75,\"paymentChannelToFundSourceMappings\":\"[]\",\"incomeFromPenaltyAccountId\":76,\"receivableInterestAccountId\":72,\"receivablePenaltyAccountId\":74,\"incomeFromFeeAccountId\":28}',4,'2018-02-15 16:29:37',NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_portfolio_command_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan`
--

DROP TABLE IF EXISTS `m_product_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `min_principal_amount` decimal(19,6) DEFAULT NULL,
  `max_principal_amount` decimal(19,6) DEFAULT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `is_linked_to_floating_interest_rates` bit(1) NOT NULL DEFAULT b'0',
  `allow_variabe_installments` bit(1) NOT NULL DEFAULT b'0',
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `min_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `max_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(5) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(5) NOT NULL,
  `interest_calculated_in_period_enum` smallint(5) NOT NULL DEFAULT '1',
  `allow_partial_period_interest_calcualtion` tinyint(1) NOT NULL DEFAULT '0',
  `repay_every` smallint(5) NOT NULL,
  `repayment_period_frequency_enum` smallint(5) NOT NULL,
  `number_of_repayments` smallint(5) NOT NULL,
  `min_number_of_repayments` smallint(5) DEFAULT NULL,
  `max_number_of_repayments` smallint(5) DEFAULT NULL,
  `grace_on_principal_periods` smallint(5) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(5) DEFAULT NULL,
  `grace_on_interest_periods` smallint(5) DEFAULT NULL,
  `grace_interest_free_periods` smallint(5) DEFAULT NULL,
  `amortization_method_enum` smallint(5) NOT NULL,
  `accounting_type` smallint(5) NOT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `include_in_borrower_cycle` tinyint(1) NOT NULL DEFAULT '0',
  `use_borrower_cycle` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `allow_multiple_disbursals` tinyint(1) NOT NULL DEFAULT '0',
  `max_disbursals` int(2) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(5) DEFAULT NULL,
  `overdue_days_for_npa` smallint(5) DEFAULT NULL,
  `days_in_month_enum` smallint(5) NOT NULL DEFAULT '1',
  `days_in_year_enum` smallint(5) NOT NULL DEFAULT '1',
  `interest_recalculation_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `min_days_between_disbursal_and_first_repayment` int(3) DEFAULT NULL,
  `hold_guarantee_funds` tinyint(1) NOT NULL DEFAULT '0',
  `principal_threshold_for_last_installment` decimal(5,2) NOT NULL DEFAULT '50.00',
  `account_moves_out_of_npa_only_on_arrears_completion` tinyint(1) NOT NULL DEFAULT '0',
  `can_define_fixed_emi_amount` tinyint(1) NOT NULL DEFAULT '0',
  `instalment_amount_in_multiples_of` decimal(19,6) DEFAULT NULL,
  `can_use_for_topup` tinyint(1) NOT NULL DEFAULT '0',
  `sync_expected_with_disbursement_date` tinyint(4) DEFAULT '0',
  `is_equal_amortization` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`),
  UNIQUE KEY `unq_short_name` (`short_name`),
  UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  KEY `FKA6A8A7D77240145` (`fund_id`),
  KEY `FK_ltp_strategy` (`loan_transaction_strategy_id`),
  CONSTRAINT `FKA6A8A7D77240145` FOREIGN KEY (`fund_id`) REFERENCES `m_fund` (`id`),
  CONSTRAINT `FK_ltp_strategy` FOREIGN KEY (`loan_transaction_strategy_id`) REFERENCES `ref_loan_transaction_processing_strategy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan`
--

LOCK TABLES `m_product_loan` WRITE;
/*!40000 ALTER TABLE `m_product_loan` DISABLE KEYS */;
INSERT INTO `m_product_loan` VALUES (1,'DevL','TZS',2,1,1000000.000000,1000000.000000,50000000.000000,NULL,'Development Loan',NULL,NULL,'\0','\0',1.083333,1.000000,50.000000,2,13.000000,0,1,0,1,2,6,6,48,NULL,NULL,NULL,NULL,1,3,5,NULL,0,0,NULL,NULL,0,NULL,NULL,30,NULL,1,1,0,NULL,1,0.00,0,0,1.000000,0,0,0),(2,'EdL','TZS',2,1,100000.000000,100000.000000,2000000.000000,NULL,'Education Loan',NULL,NULL,'\0','\0',2.700000,2.700000,50.000000,2,32.400000,1,1,0,1,2,1,1,12,NULL,NULL,NULL,NULL,1,3,1,NULL,0,0,NULL,NULL,0,NULL,NULL,30,NULL,1,1,0,NULL,0,0.00,0,0,1.000000,0,0,0),(3,'CL','TZS',2,1,100000.000000,100000.000000,3000000.000000,NULL,'Computer Loan',NULL,NULL,'\0','\0',2.700000,2.700000,4.000000,2,32.400000,1,1,0,1,2,1,1,12,NULL,NULL,NULL,NULL,1,3,1,NULL,0,0,NULL,NULL,0,NULL,NULL,30,NULL,1,1,0,NULL,0,0.00,0,0,1.000000,0,0,0),(5,'EmL','TZS',2,1,100000.000000,100000.000000,1000000.000000,NULL,'Emergency  Loan',NULL,NULL,'\0','\0',2.700000,2.700000,3.000000,2,32.400000,1,1,0,1,2,1,1,12,NULL,NULL,NULL,NULL,1,3,1,NULL,0,0,NULL,NULL,0,NULL,NULL,30,NULL,1,1,0,NULL,0,0.00,0,0,1.000000,0,0,0);
/*!40000 ALTER TABLE `m_product_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_charge`
--

DROP TABLE IF EXISTS `m_product_loan_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_charge` (
  `product_loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_loan_id`,`charge_id`),
  KEY `charge_id` (`charge_id`),
  CONSTRAINT `m_product_loan_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_product_loan_charge_ibfk_2` FOREIGN KEY (`product_loan_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_charge`
--

LOCK TABLES `m_product_loan_charge` WRITE;
/*!40000 ALTER TABLE `m_product_loan_charge` DISABLE KEYS */;
INSERT INTO `m_product_loan_charge` VALUES (1,1),(2,1),(3,1),(5,1),(1,2),(2,2),(3,2),(5,2);
/*!40000 ALTER TABLE `m_product_loan_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_configurable_attributes`
--

DROP TABLE IF EXISTS `m_product_loan_configurable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_configurable_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint(20) NOT NULL,
  `amortization_method_enum` tinyint(4) NOT NULL DEFAULT '1',
  `interest_method_enum` tinyint(4) NOT NULL DEFAULT '1',
  `loan_transaction_strategy_id` tinyint(4) NOT NULL DEFAULT '1',
  `interest_calculated_in_period_enum` tinyint(4) NOT NULL DEFAULT '1',
  `arrearstolerance_amount` tinyint(4) NOT NULL DEFAULT '1',
  `repay_every` tinyint(4) NOT NULL DEFAULT '1',
  `moratorium` tinyint(4) NOT NULL DEFAULT '1',
  `grace_on_arrears_ageing` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_m_product_loan_configurable_attributes_0001` (`loan_product_id`),
  CONSTRAINT `fk_m_product_loan_configurable_attributes_0001` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_configurable_attributes`
--

LOCK TABLES `m_product_loan_configurable_attributes` WRITE;
/*!40000 ALTER TABLE `m_product_loan_configurable_attributes` DISABLE KEYS */;
INSERT INTO `m_product_loan_configurable_attributes` VALUES (1,1,1,1,1,1,1,1,1,1),(2,2,1,1,1,1,1,1,1,1),(3,3,1,1,1,1,1,1,1,1),(4,5,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `m_product_loan_configurable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_floating_rates`
--

DROP TABLE IF EXISTS `m_product_loan_floating_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_floating_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint(20) NOT NULL,
  `floating_rates_id` bigint(20) NOT NULL,
  `interest_rate_differential` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `min_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `default_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `max_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_floating_interest_rate_calculation_allowed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_mappings_m_product_loan_id` (`loan_product_id`),
  KEY `FK_mappings_m_floating_rates_id` (`floating_rates_id`),
  CONSTRAINT `FK_mappings_m_floating_rates_id` FOREIGN KEY (`floating_rates_id`) REFERENCES `m_floating_rates` (`id`),
  CONSTRAINT `FK_mappings_m_product_loan_id` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_floating_rates`
--

LOCK TABLES `m_product_loan_floating_rates` WRITE;
/*!40000 ALTER TABLE `m_product_loan_floating_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_product_loan_floating_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_guarantee_details`
--

DROP TABLE IF EXISTS `m_product_loan_guarantee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_guarantee_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint(20) NOT NULL,
  `mandatory_guarantee` decimal(19,5) NOT NULL,
  `minimum_guarantee_from_own_funds` decimal(19,5) DEFAULT NULL,
  `minimum_guarantee_from_guarantor_funds` decimal(19,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_guarantee_details_loan_product` (`loan_product_id`),
  CONSTRAINT `FK_guarantee_details_loan_product` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_guarantee_details`
--

LOCK TABLES `m_product_loan_guarantee_details` WRITE;
/*!40000 ALTER TABLE `m_product_loan_guarantee_details` DISABLE KEYS */;
INSERT INTO `m_product_loan_guarantee_details` VALUES (1,1,33.33333,33.33333,0.00000);
/*!40000 ALTER TABLE `m_product_loan_guarantee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_recalculation_details`
--

DROP TABLE IF EXISTS `m_product_loan_recalculation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_recalculation_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `compound_type_enum` smallint(5) NOT NULL,
  `reschedule_strategy_enum` smallint(5) NOT NULL,
  `rest_frequency_type_enum` smallint(1) NOT NULL,
  `rest_frequency_interval` smallint(3) NOT NULL DEFAULT '0',
  `arrears_based_on_original_schedule` tinyint(1) NOT NULL DEFAULT '0',
  `pre_close_interest_calculation_strategy` smallint(3) NOT NULL DEFAULT '1',
  `compounding_frequency_type_enum` smallint(1) DEFAULT NULL,
  `compounding_frequency_interval` smallint(3) DEFAULT NULL,
  `rest_frequency_nth_day_enum` int(5) DEFAULT NULL,
  `rest_frequency_on_day` int(5) DEFAULT NULL,
  `rest_frequency_weekday_enum` int(5) DEFAULT NULL,
  `compounding_frequency_nth_day_enum` int(5) DEFAULT NULL,
  `compounding_frequency_on_day` int(5) DEFAULT NULL,
  `compounding_frequency_weekday_enum` int(5) DEFAULT NULL,
  `is_compounding_to_be_posted_as_transaction` tinyint(1) NOT NULL DEFAULT '0',
  `allow_compounding_on_eod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_m_product_loan_m_product_loan_recalculation_details` (`product_id`),
  CONSTRAINT `FK_m_product_loan_m_product_loan_recalculation_details` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_recalculation_details`
--

LOCK TABLES `m_product_loan_recalculation_details` WRITE;
/*!40000 ALTER TABLE `m_product_loan_recalculation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_product_loan_recalculation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_variable_installment_config`
--

DROP TABLE IF EXISTS `m_product_loan_variable_installment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_variable_installment_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint(20) NOT NULL,
  `minimum_gap` int(4) NOT NULL,
  `maximum_gap` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mappings_m_variable_product_loan_id` (`loan_product_id`),
  CONSTRAINT `FK_mappings_m_variable_product_loan_id` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_variable_installment_config`
--

LOCK TABLES `m_product_loan_variable_installment_config` WRITE;
/*!40000 ALTER TABLE `m_product_loan_variable_installment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_product_loan_variable_installment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_loan_variations_borrower_cycle`
--

DROP TABLE IF EXISTS `m_product_loan_variations_borrower_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_loan_variations_borrower_cycle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint(20) NOT NULL DEFAULT '0',
  `borrower_cycle_number` int(3) NOT NULL DEFAULT '0',
  `value_condition` int(1) NOT NULL DEFAULT '0',
  `param_type` int(1) NOT NULL DEFAULT '0',
  `default_value` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `max_value` decimal(19,6) DEFAULT NULL,
  `min_value` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrower_cycle_loan_product_FK` (`loan_product_id`),
  CONSTRAINT `borrower_cycle_loan_product_FK` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_loan_variations_borrower_cycle`
--

LOCK TABLES `m_product_loan_variations_borrower_cycle` WRITE;
/*!40000 ALTER TABLE `m_product_loan_variations_borrower_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_product_loan_variations_borrower_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_product_mix`
--

DROP TABLE IF EXISTS `m_product_mix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_product_mix` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `restricted_product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_product_mix_product_id_to_m_product_loan` (`product_id`),
  KEY `FK_m_product_mix_restricted_product_id_to_m_product_loan` (`restricted_product_id`),
  CONSTRAINT `FK_m_product_mix_product_id_to_m_product_loan` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  CONSTRAINT `FK_m_product_mix_restricted_product_id_to_m_product_loan` FOREIGN KEY (`restricted_product_id`) REFERENCES `m_product_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_product_mix`
--

LOCK TABLES `m_product_mix` WRITE;
/*!40000 ALTER TABLE `m_product_mix` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_product_mix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_provision_category`
--

DROP TABLE IF EXISTS `m_provision_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_provision_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_provision_category`
--

LOCK TABLES `m_provision_category` WRITE;
/*!40000 ALTER TABLE `m_provision_category` DISABLE KEYS */;
INSERT INTO `m_provision_category` VALUES (1,'STANDARD','Punctual Payment without any dues'),(2,'SUB-STANDARD','Principal and/or Interest overdue by x days'),(3,'DOUBTFUL','Principal and/or Interest overdue by x days and less than y'),(4,'LOSS','Principal and/or Interest overdue by y days');
/*!40000 ALTER TABLE `m_provision_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_provisioning_criteria`
--

DROP TABLE IF EXISTS `m_provisioning_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_provisioning_criteria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `criteria_name` varchar(200) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criteria_name` (`criteria_name`),
  KEY `createdby_id` (`createdby_id`),
  KEY `lastmodifiedby_id` (`lastmodifiedby_id`),
  CONSTRAINT `m_provisioning_criteria_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_provisioning_criteria_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_provisioning_criteria`
--

LOCK TABLES `m_provisioning_criteria` WRITE;
/*!40000 ALTER TABLE `m_provisioning_criteria` DISABLE KEYS */;
INSERT INTO `m_provisioning_criteria` VALUES (1,'Bad debts',1,'2018-02-14 12:27:47',1,'2018-02-14 12:27:47');
/*!40000 ALTER TABLE `m_provisioning_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_provisioning_criteria_definition`
--

DROP TABLE IF EXISTS `m_provisioning_criteria_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_provisioning_criteria_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `criteria_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `min_age` bigint(20) NOT NULL,
  `max_age` bigint(20) NOT NULL,
  `provision_percentage` decimal(5,2) NOT NULL,
  `liability_account` bigint(20) DEFAULT NULL,
  `expense_account` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_id` (`criteria_id`),
  KEY `category_id` (`category_id`),
  KEY `liability_account` (`liability_account`),
  KEY `expense_account` (`expense_account`),
  CONSTRAINT `m_provisioning_criteria_definition_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`),
  CONSTRAINT `m_provisioning_criteria_definition_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `m_provision_category` (`id`),
  CONSTRAINT `m_provisioning_criteria_definition_ibfk_3` FOREIGN KEY (`liability_account`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `m_provisioning_criteria_definition_ibfk_4` FOREIGN KEY (`expense_account`) REFERENCES `acc_gl_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_provisioning_criteria_definition`
--

LOCK TABLES `m_provisioning_criteria_definition` WRITE;
/*!40000 ALTER TABLE `m_provisioning_criteria_definition` DISABLE KEYS */;
INSERT INTO `m_provisioning_criteria_definition` VALUES (1,1,1,0,30,10.00,85,86),(2,1,2,31,60,15.00,85,86),(3,1,4,91,360,100.00,85,86),(4,1,3,61,90,30.00,85,86);
/*!40000 ALTER TABLE `m_provisioning_criteria_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_provisioning_history`
--

DROP TABLE IF EXISTS `m_provisioning_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_provisioning_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_entry_created` bit(1) DEFAULT b'0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdby_id` (`createdby_id`),
  KEY `lastmodifiedby_id` (`lastmodifiedby_id`),
  CONSTRAINT `m_provisioning_history_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_provisioning_history_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_provisioning_history`
--

LOCK TABLES `m_provisioning_history` WRITE;
/*!40000 ALTER TABLE `m_provisioning_history` DISABLE KEYS */;
INSERT INTO `m_provisioning_history` VALUES (1,'',1,'2018-02-14',NULL,NULL);
/*!40000 ALTER TABLE `m_provisioning_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_report_mailing_job`
--

DROP TABLE IF EXISTS `m_report_mailing_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_report_mailing_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `start_datetime` datetime NOT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `created_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodified_date` date DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `email_recipients` text NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_message` text NOT NULL,
  `email_attachment_file_format` varchar(10) NOT NULL,
  `stretchy_report_id` int(11) NOT NULL,
  `stretchy_report_param_map` text,
  `previous_run_datetime` datetime DEFAULT NULL,
  `next_run_datetime` datetime DEFAULT NULL,
  `previous_run_status` varchar(10) DEFAULT NULL,
  `previous_run_error_log` text,
  `previous_run_error_message` text,
  `number_of_runs` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `run_as_userid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `createdby_id` (`createdby_id`),
  KEY `lastmodifiedby_id` (`lastmodifiedby_id`),
  KEY `stretchy_report_id` (`stretchy_report_id`),
  KEY `run_as_userid` (`run_as_userid`),
  CONSTRAINT `m_report_mailing_job_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_report_mailing_job_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_report_mailing_job_ibfk_3` FOREIGN KEY (`stretchy_report_id`) REFERENCES `stretchy_report` (`id`),
  CONSTRAINT `m_report_mailing_job_ibfk_4` FOREIGN KEY (`run_as_userid`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_report_mailing_job`
--

LOCK TABLES `m_report_mailing_job` WRITE;
/*!40000 ALTER TABLE `m_report_mailing_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_report_mailing_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_report_mailing_job_configuration`
--

DROP TABLE IF EXISTS `m_report_mailing_job_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_report_mailing_job_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_report_mailing_job_configuration`
--

LOCK TABLES `m_report_mailing_job_configuration` WRITE;
/*!40000 ALTER TABLE `m_report_mailing_job_configuration` DISABLE KEYS */;
INSERT INTO `m_report_mailing_job_configuration` VALUES (1,'GMAIL_SMTP_SERVER','smtp.gmail.com'),(2,'GMAIL_SMTP_PORT','587'),(3,'GMAIL_SMTP_USERNAME',''),(4,'GMAIL_SMTP_PASSWORD','');
/*!40000 ALTER TABLE `m_report_mailing_job_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_report_mailing_job_run_history`
--

DROP TABLE IF EXISTS `m_report_mailing_job_run_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_report_mailing_job_run_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `error_message` text,
  `error_log` text,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `m_report_mailing_job_run_history_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `m_report_mailing_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_report_mailing_job_run_history`
--

LOCK TABLES `m_report_mailing_job_run_history` WRITE;
/*!40000 ALTER TABLE `m_report_mailing_job_run_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_report_mailing_job_run_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_role`
--

DROP TABLE IF EXISTS `m_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_role`
--

LOCK TABLES `m_role` WRITE;
/*!40000 ALTER TABLE `m_role` DISABLE KEYS */;
INSERT INTO `m_role` VALUES (1,'Super user','This role provides all application permissions.',0),(2,'Managers','Managers',0),(3,'Accountant','Accountant',0),(4,'Loan Officer','Loan Officer',0),(5,'Office Attendant','Office Attendant',0),(6,'IT','IT',0),(7,'Self Service User','self service user role',1);
/*!40000 ALTER TABLE `m_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_role_permission`
--

DROP TABLE IF EXISTS `m_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK8DEDB04815CEC7AB` (`role_id`),
  KEY `FK8DEDB048103B544B` (`permission_id`),
  CONSTRAINT `FK8DEDB048103B544B` FOREIGN KEY (`permission_id`) REFERENCES `m_permission` (`id`),
  CONSTRAINT `FK8DEDB04815CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_role_permission`
--

LOCK TABLES `m_role_permission` WRITE;
/*!40000 ALTER TABLE `m_role_permission` DISABLE KEYS */;
INSERT INTO `m_role_permission` VALUES (1,1),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,57),(2,58),(2,59),(2,60),(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(2,94),(2,95),(2,96),(2,97),(2,98),(2,99),(2,100),(2,101),(2,102),(2,103),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,118),(2,119),(2,120),(2,121),(2,122),(2,123),(2,124),(2,125),(2,126),(2,127),(2,128),(2,129),(2,130),(2,131),(2,132),(2,133),(2,134),(2,135),(2,136),(2,137),(2,138),(2,139),(2,140),(2,141),(2,142),(2,143),(2,144),(2,145),(2,146),(2,147),(2,148),(2,149),(2,150),(2,151),(2,152),(2,153),(2,154),(2,155),(2,156),(2,157),(2,158),(2,159),(2,160),(2,161),(2,162),(2,163),(2,164),(2,165),(2,166),(2,167),(2,168),(2,169),(2,170),(2,171),(2,172),(2,173),(2,174),(2,175),(2,176),(2,177),(2,178),(2,179),(2,180),(2,181),(2,182),(2,183),(2,184),(2,185),(2,186),(2,187),(2,188),(2,189),(2,190),(2,191),(2,192),(2,193),(2,194),(2,195),(2,196),(2,197),(2,198),(2,199),(2,200),(2,201),(2,202),(2,203),(2,204),(2,205),(2,206),(2,207),(2,208),(2,209),(2,211),(2,213),(2,221),(2,222),(2,223),(2,224),(2,225),(2,226),(2,227),(2,228),(2,229),(2,230),(2,231),(2,232),(2,234),(2,236),(2,241),(2,244),(2,245),(2,246),(2,247),(2,248),(2,249),(2,250),(2,251),(2,252),(2,253),(2,254),(2,255),(2,256),(2,257),(2,258),(2,259),(2,260),(2,261),(2,262),(2,263),(2,264),(2,265),(2,266),(2,267),(2,268),(2,269),(2,270),(2,271),(2,272),(2,273),(2,274),(2,275),(2,276),(2,277),(2,278),(2,279),(2,280),(2,281),(2,282),(2,283),(2,284),(2,285),(2,286),(2,287),(2,288),(2,289),(2,290),(2,291),(2,292),(2,293),(2,294),(2,295),(2,296),(2,297),(2,298),(2,299),(2,300),(2,301),(2,302),(2,303),(2,304),(2,305),(2,306),(2,307),(2,308),(2,309),(2,310),(2,311),(2,313),(2,314),(2,315),(2,316),(2,317),(2,318),(2,319),(2,320),(2,321),(2,323),(2,324),(2,325),(2,326),(2,327),(2,328),(2,329),(2,330),(2,331),(2,332),(2,333),(2,334),(2,335),(2,336),(2,337),(2,346),(2,347),(2,348),(2,349),(2,350),(2,351),(2,352),(2,353),(2,354),(2,355),(2,356),(2,357),(2,358),(2,359),(2,360),(2,361),(2,362),(2,363),(2,364),(2,365),(2,366),(2,367),(2,368),(2,369),(2,370),(2,371),(2,372),(2,373),(2,374),(2,375),(2,376),(2,377),(2,378),(2,379),(2,380),(2,381),(2,382),(2,383),(2,384),(2,385),(2,386),(2,389),(2,390),(2,391),(2,392),(2,393),(2,394),(2,395),(2,396),(2,397),(2,398),(2,399),(2,400),(2,401),(2,402),(2,403),(2,404),(2,405),(2,406),(2,407),(2,408),(2,409),(2,410),(2,411),(2,412),(2,413),(2,414),(2,415),(2,416),(2,417),(2,418),(2,419),(2,420),(2,421),(2,422),(2,423),(2,424),(2,425),(2,426),(2,427),(2,428),(2,429),(2,430),(2,431),(2,432),(2,433),(2,434),(2,435),(2,436),(2,437),(2,438),(2,439),(2,440),(2,441),(2,442),(2,443),(2,444),(2,445),(2,446),(2,447),(2,448),(2,449),(2,450),(2,451),(2,452),(2,453),(2,454),(2,455),(2,456),(2,457),(2,458),(2,459),(2,460),(2,461),(2,462),(2,463),(2,464),(2,465),(2,466),(2,467),(2,468),(2,469),(2,470),(2,471),(2,472),(2,473),(2,474),(2,475),(2,476),(2,477),(2,478),(2,479),(2,480),(2,481),(2,482),(2,483),(2,484),(2,485),(2,486),(2,487),(2,488),(2,489),(2,490),(2,491),(2,492),(2,493),(2,494),(2,495),(2,496),(2,497),(2,498),(2,499),(2,500),(2,501),(2,502),(2,503),(2,504),(2,505),(2,506),(2,507),(2,508),(2,509),(2,510),(2,511),(2,512),(2,513),(2,514),(2,515),(2,516),(2,517),(2,518),(2,519),(2,520),(2,521),(2,522),(2,523),(2,524),(2,525),(2,526),(2,527),(2,528),(2,529),(2,530),(2,531),(2,532),(2,533),(2,534),(2,535),(2,536),(2,537),(2,538),(2,539),(2,541),(2,542),(2,543),(2,544),(2,545),(2,546),(2,547),(2,548),(2,549),(2,550),(2,551),(2,552),(2,553),(2,554),(2,555),(2,556),(2,557),(2,559),(2,560),(2,561),(2,562),(2,563),(2,564),(2,565),(2,566),(2,567),(2,568),(2,569),(2,570),(2,571),(2,572),(2,573),(2,574),(2,575),(2,576),(2,577),(2,578),(2,579),(2,580),(2,581),(2,582),(2,583),(2,584),(2,585),(2,586),(2,587),(2,588),(2,589),(2,590),(2,591),(2,592),(2,593),(2,594),(2,595),(2,596),(2,597),(2,598),(2,599),(2,600),(2,601),(2,602),(2,603),(2,604),(2,605),(2,606),(2,607),(2,608),(2,609),(2,610),(2,611),(2,612),(2,613),(2,614),(2,615),(2,616),(2,617),(2,618),(2,619),(2,620),(2,621),(2,622),(2,623),(2,624),(2,625),(2,626),(2,627),(2,628),(2,629),(2,630),(2,631),(2,632),(2,633),(2,634),(2,635),(2,636),(2,637),(2,638),(2,639),(2,640),(2,641),(2,642),(2,643),(2,644),(2,645),(2,646),(2,647),(2,648),(2,649),(2,650),(2,651),(2,652),(2,653),(2,654),(2,655),(2,656),(2,657),(2,658),(2,659),(2,660),(2,661),(2,662),(2,663),(2,664),(2,665),(2,666),(2,667),(2,668),(2,669),(2,670),(2,671),(2,672),(2,673),(2,674),(2,675),(2,676),(2,677),(2,678),(2,679),(2,680),(2,681),(2,682),(2,683),(2,684),(2,685),(2,686),(2,687),(2,688),(2,689),(2,690),(2,691),(2,692),(2,693),(2,694),(2,695),(2,696),(2,697),(2,698),(2,701),(2,702),(2,703),(2,704),(2,705),(2,706),(2,707),(2,708),(2,709),(2,710),(2,711),(2,712),(2,713),(2,714),(2,715),(2,716),(2,717),(2,718),(2,719),(2,720),(2,721),(2,722),(2,723),(2,724),(2,725),(2,726),(2,727),(2,728),(2,729),(2,730),(2,731),(2,732),(2,733),(2,734),(2,735),(2,736),(2,737),(2,738),(2,739),(2,740),(2,741),(2,742),(2,743),(2,744),(2,745),(2,746),(2,747),(2,748),(2,749),(2,750),(2,751),(2,752),(2,753),(2,754),(2,755),(2,756),(2,757),(2,758),(2,759),(2,760),(2,761),(2,762),(2,763),(2,764),(2,765),(2,766),(2,767),(2,768),(2,769),(2,770),(2,771),(2,772),(2,773),(2,774),(2,775),(2,776),(2,777),(2,778),(2,779),(2,780),(2,781),(2,782),(2,783),(2,784),(2,785),(2,786),(2,787),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101),(3,102),(3,103),(3,107),(3,109),(3,110),(3,117),(3,122),(3,128),(3,136),(3,138),(3,139),(3,140),(3,141),(3,142),(3,143),(3,144),(3,145),(3,146),(3,147),(3,148),(3,149),(3,150),(3,151),(3,152),(3,153),(3,154),(3,155),(3,156),(3,164),(3,166),(3,180),(3,181),(3,182),(3,183),(3,184),(3,185),(3,186),(3,187),(3,188),(3,189),(3,190),(3,191),(3,192),(3,193),(3,194),(3,195),(3,196),(3,197),(3,198),(3,199),(3,200),(3,201),(3,202),(3,203),(3,204),(3,205),(3,206),(3,207),(3,208),(3,257),(3,258),(3,259),(3,260),(3,261),(3,262),(3,263),(3,264),(3,305),(3,306),(3,307),(3,308),(3,309),(3,310),(3,311),(3,323),(3,324),(3,325),(3,328),(3,329),(3,330),(3,331),(3,332),(3,333),(3,334),(3,370),(3,371),(3,372),(3,373),(3,381),(3,382),(3,383),(3,384),(3,395),(3,396),(3,397),(3,398),(3,400),(3,401),(3,403),(3,404),(3,405),(3,406),(3,407),(3,408),(3,409),(3,410),(3,411),(3,412),(3,415),(3,416),(3,417),(3,418),(3,419),(3,420),(3,421),(3,422),(3,423),(3,424),(3,425),(3,426),(3,427),(3,428),(3,429),(3,430),(3,431),(3,432),(3,433),(3,435),(3,436),(3,437),(3,438),(3,439),(3,440),(3,441),(3,442),(3,443),(3,444),(3,445),(3,446),(3,447),(3,448),(3,449),(3,450),(3,451),(3,452),(3,453),(3,454),(3,455),(3,456),(3,457),(3,458),(3,459),(3,460),(3,461),(3,462),(3,463),(3,464),(3,465),(3,466),(3,467),(3,468),(3,469),(3,470),(3,471),(3,472),(3,473),(3,474),(3,475),(3,476),(3,477),(3,478),(3,479),(3,480),(3,481),(3,482),(3,506),(3,507),(3,508),(3,509),(3,510),(3,511),(3,512),(3,542),(3,543),(3,544),(3,545),(3,546),(3,547),(3,548),(3,550),(3,551),(3,552),(3,557),(3,561),(3,562),(3,563),(3,564),(3,565),(3,566),(3,608),(3,609),(3,610),(3,611),(3,612),(3,613),(3,616),(3,617),(3,626),(3,627),(3,628),(3,629),(3,630),(3,631),(3,632),(3,633),(3,634),(3,635),(3,636),(3,637),(3,638),(3,639),(3,640),(3,641),(3,642),(3,643),(3,644),(3,645),(3,646),(3,647),(3,648),(3,649),(3,650),(3,651),(3,652),(3,654),(3,655),(3,656),(3,657),(3,658),(3,663),(3,665),(3,666),(3,667),(3,668),(3,669),(3,670),(3,671),(3,672),(3,673),(3,674),(3,675),(3,676),(3,677),(3,678),(3,682),(3,683),(3,684),(3,685),(3,686),(3,687),(3,688),(3,689),(3,690),(3,691),(3,692),(3,693),(3,694),(3,695),(3,696),(3,697),(3,698),(3,705),(3,706),(3,707),(3,708),(3,709),(3,710),(3,711),(3,712),(3,713),(3,714),(3,715),(3,716),(3,737),(3,738),(3,739),(3,740),(3,741),(3,742),(3,743),(3,744),(3,745),(3,746),(3,747),(3,748),(3,749),(3,752),(3,753),(3,754),(3,755),(3,756),(3,757),(3,758),(3,759),(3,760),(3,761),(3,762),(3,763),(3,764),(3,765),(3,766),(3,767),(3,768),(3,769),(3,770),(4,1),(4,5),(4,9),(4,16),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,57),(4,59),(4,61),(4,63),(4,64),(4,66),(4,68),(4,70),(4,71),(4,74),(4,75),(4,78),(4,82),(4,83),(4,85),(4,86),(4,87),(4,88),(4,89),(4,90),(4,91),(4,93),(4,95),(4,96),(4,100),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,114),(4,115),(4,116),(4,117),(4,118),(4,119),(4,120),(4,121),(4,122),(4,123),(4,124),(4,125),(4,126),(4,127),(4,128),(4,136),(4,137),(4,138),(4,139),(4,140),(4,141),(4,142),(4,143),(4,144),(4,145),(4,146),(4,147),(4,148),(4,149),(4,150),(4,151),(4,152),(4,153),(4,154),(4,155),(4,156),(4,157),(4,158),(4,159),(4,160),(4,161),(4,162),(4,163),(4,164),(4,165),(4,166),(4,167),(4,168),(4,169),(4,170),(4,180),(4,181),(4,182),(4,183),(4,184),(4,185),(4,186),(4,187),(4,188),(4,189),(4,190),(4,191),(4,192),(4,193),(4,194),(4,195),(4,196),(4,197),(4,198),(4,199),(4,200),(4,201),(4,202),(4,203),(4,204),(4,205),(4,206),(4,207),(4,208),(4,209),(4,213),(4,219),(4,221),(4,222),(4,223),(4,224),(4,225),(4,226),(4,227),(4,228),(4,229),(4,230),(4,231),(4,236),(4,242),(4,245),(4,246),(4,247),(4,248),(4,249),(4,250),(4,251),(4,252),(4,253),(4,254),(4,255),(4,256),(4,265),(4,266),(4,267),(4,268),(4,269),(4,270),(4,271),(4,272),(4,273),(4,274),(4,275),(4,276),(4,277),(4,278),(4,279),(4,280),(4,281),(4,282),(4,283),(4,284),(4,285),(4,286),(4,287),(4,288),(4,289),(4,290),(4,291),(4,292),(4,293),(4,294),(4,295),(4,296),(4,297),(4,305),(4,307),(4,311),(4,312),(4,313),(4,326),(4,327),(4,328),(4,329),(4,330),(4,331),(4,332),(4,333),(4,334),(4,346),(4,347),(4,348),(4,349),(4,350),(4,351),(4,352),(4,353),(4,354),(4,355),(4,356),(4,357),(4,358),(4,359),(4,360),(4,361),(4,362),(4,363),(4,364),(4,365),(4,366),(4,367),(4,368),(4,369),(4,373),(4,374),(4,375),(4,377),(4,378),(4,379),(4,380),(4,382),(4,384),(4,389),(4,390),(4,391),(4,392),(4,393),(4,394),(4,395),(4,396),(4,398),(4,400),(4,401),(4,402),(4,403),(4,404),(4,405),(4,406),(4,407),(4,408),(4,409),(4,410),(4,411),(4,412),(4,413),(4,414),(4,417),(4,418),(4,420),(4,423),(4,426),(4,428),(4,429),(4,430),(4,431),(4,434),(4,435),(4,437),(4,438),(4,439),(4,440),(4,441),(4,442),(4,443),(4,444),(4,447),(4,448),(4,449),(4,450),(4,451),(4,452),(4,453),(4,454),(4,455),(4,456),(4,457),(4,458),(4,459),(4,460),(4,461),(4,462),(4,463),(4,483),(4,484),(4,485),(4,486),(4,487),(4,488),(4,489),(4,490),(4,491),(4,492),(4,493),(4,494),(4,495),(4,496),(4,497),(4,498),(4,499),(4,500),(4,501),(4,502),(4,503),(4,504),(4,505),(4,513),(4,514),(4,515),(4,516),(4,517),(4,518),(4,519),(4,520),(4,521),(4,522),(4,523),(4,524),(4,525),(4,526),(4,527),(4,528),(4,529),(4,530),(4,531),(4,532),(4,533),(4,534),(4,535),(4,536),(4,537),(4,538),(4,539),(4,541),(4,542),(4,543),(4,544),(4,548),(4,551),(4,552),(4,557),(4,558),(4,559),(4,560),(4,561),(4,562),(4,563),(4,564),(4,565),(4,566),(4,567),(4,568),(4,569),(4,570),(4,571),(4,572),(4,573),(4,574),(4,575),(4,576),(4,577),(4,578),(4,579),(4,580),(4,581),(4,582),(4,583),(4,584),(4,585),(4,586),(4,587),(4,588),(4,589),(4,590),(4,591),(4,592),(4,593),(4,594),(4,595),(4,596),(4,597),(4,598),(4,599),(4,600),(4,601),(4,602),(4,603),(4,604),(4,605),(4,606),(4,607),(4,608),(4,609),(4,610),(4,611),(4,612),(4,613),(4,614),(4,615),(4,616),(4,617),(4,618),(4,619),(4,620),(4,621),(4,622),(4,623),(4,624),(4,625),(4,627),(4,628),(4,629),(4,630),(4,631),(4,632),(4,638),(4,639),(4,640),(4,641),(4,642),(4,643),(4,644),(4,645),(4,649),(4,650),(4,651),(4,653),(4,654),(4,655),(4,656),(4,657),(4,658),(4,659),(4,660),(4,661),(4,662),(4,663),(4,664),(4,665),(4,666),(4,667),(4,668),(4,669),(4,670),(4,671),(4,672),(4,673),(4,674),(4,675),(4,676),(4,677),(4,678),(4,679),(4,680),(4,682),(4,683),(4,684),(4,685),(4,686),(4,687),(4,688),(4,689),(4,690),(4,691),(4,692),(4,693),(4,694),(4,695),(4,696),(4,697),(4,698),(4,701),(4,702),(4,703),(4,704),(4,705),(4,706),(4,708),(4,709),(4,710),(4,713),(4,714),(4,715),(4,716),(4,717),(4,718),(4,719),(4,720),(4,721),(4,722),(4,723),(4,724),(4,725),(4,726),(4,727),(4,728),(4,729),(4,730),(4,731),(4,732),(4,733),(4,734),(4,735),(4,736),(4,737),(4,738),(4,739),(4,740),(4,741),(4,742),(4,743),(4,744),(4,745),(4,746),(4,747),(4,748),(4,749),(4,750),(4,751),(4,752),(4,753),(4,757),(4,758),(4,764),(4,765),(4,766),(4,767),(4,768),(4,769),(4,770),(4,771),(4,772),(4,773),(4,774),(4,775),(4,776),(4,777),(4,778),(4,779),(4,780),(4,781),(4,782),(4,783),(4,784),(4,785),(4,786),(4,787),(5,2),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),(5,80),(5,81),(5,82),(5,83),(5,84),(5,85),(5,86),(5,87),(5,88),(5,89),(5,90),(5,91),(5,92),(5,93),(5,94),(5,95),(5,96),(5,97),(5,98),(5,99),(5,100),(5,101),(5,102),(5,103),(5,104),(5,105),(5,106),(5,107),(5,108),(5,109),(5,110),(5,111),(5,112),(5,113),(5,114),(5,115),(5,116),(5,117),(5,118),(5,119),(5,120),(5,121),(5,122),(5,123),(5,124),(5,125),(5,126),(5,127),(5,128),(5,129),(5,130),(5,131),(5,132),(5,133),(5,134),(5,135),(5,136),(5,137),(5,138),(5,139),(5,140),(5,141),(5,142),(5,143),(5,144),(5,145),(5,146),(5,147),(5,148),(5,149),(5,150),(5,151),(5,152),(5,153),(5,154),(5,155),(5,156),(5,157),(5,158),(5,159),(5,160),(5,161),(5,162),(5,163),(5,164),(5,165),(5,166),(5,167),(5,168),(5,169),(5,170),(5,171),(5,172),(5,173),(5,174),(5,175),(5,176),(5,177),(5,178),(5,179),(5,180),(5,181),(5,182),(5,183),(5,184),(5,185),(5,186),(5,187),(5,188),(5,189),(5,190),(5,191),(5,192),(5,193),(5,194),(5,195),(5,196),(5,197),(5,198),(5,199),(5,200),(5,201),(5,202),(5,203),(5,204),(5,205),(5,206),(5,207),(5,208),(5,213),(5,219),(5,221),(5,222),(5,223),(5,224),(5,225),(5,226),(5,227),(5,228),(5,229),(5,230),(5,231),(5,236),(5,242),(5,244),(5,245),(5,246),(5,247),(5,248),(5,249),(5,250),(5,251),(5,252),(5,253),(5,254),(5,255),(5,256),(5,257),(5,258),(5,259),(5,260),(5,261),(5,262),(5,263),(5,264),(5,265),(5,266),(5,267),(5,268),(5,269),(5,270),(5,271),(5,272),(5,273),(5,274),(5,275),(5,276),(5,277),(5,278),(5,279),(5,280),(5,281),(5,282),(5,283),(5,284),(5,285),(5,286),(5,287),(5,288),(5,289),(5,290),(5,291),(5,292),(5,293),(5,294),(5,295),(5,296),(5,297),(5,298),(5,299),(5,300),(5,301),(5,302),(5,303),(5,304),(5,305),(5,306),(5,307),(5,308),(5,309),(5,310),(5,311),(5,312),(5,313),(5,314),(5,315),(5,316),(5,317),(5,318),(5,319),(5,320),(5,321),(5,323),(5,324),(5,325),(5,326),(5,327),(5,328),(5,329),(5,330),(5,331),(5,332),(5,333),(5,334),(5,335),(5,336),(5,337),(5,346),(5,347),(5,348),(5,349),(5,350),(5,351),(5,352),(5,353),(5,354),(5,355),(5,356),(5,357),(5,358),(5,359),(5,360),(5,361),(5,362),(5,363),(5,364),(5,365),(5,366),(5,367),(5,368),(5,369),(5,370),(5,371),(5,372),(5,373),(5,374),(5,375),(5,376),(5,377),(5,378),(5,379),(5,380),(5,381),(5,382),(5,383),(5,384),(5,385),(5,386),(5,389),(5,390),(5,391),(5,392),(5,393),(5,394),(5,395),(5,396),(5,397),(5,398),(5,400),(5,401),(5,402),(5,403),(5,404),(5,405),(5,406),(5,407),(5,408),(5,409),(5,410),(5,411),(5,412),(5,413),(5,414),(5,415),(5,416),(5,417),(5,418),(5,419),(5,420),(5,421),(5,422),(5,423),(5,424),(5,425),(5,426),(5,427),(5,428),(5,429),(5,430),(5,431),(5,432),(5,433),(5,434),(5,435),(5,436),(5,437),(5,438),(5,439),(5,440),(5,441),(5,442),(5,443),(5,444),(5,445),(5,446),(5,447),(5,448),(5,449),(5,450),(5,451),(5,452),(5,453),(5,454),(5,455),(5,456),(5,457),(5,458),(5,459),(5,460),(5,461),(5,462),(5,463),(5,464),(5,465),(5,466),(5,467),(5,468),(5,469),(5,470),(5,471),(5,472),(5,473),(5,474),(5,475),(5,476),(5,477),(5,478),(5,479),(5,480),(5,481),(5,482),(5,483),(5,484),(5,485),(5,486),(5,487),(5,488),(5,489),(5,490),(5,491),(5,492),(5,493),(5,494),(5,495),(5,496),(5,497),(5,498),(5,499),(5,500),(5,501),(5,502),(5,503),(5,504),(5,505),(5,506),(5,507),(5,508),(5,509),(5,510),(5,511),(5,512),(5,513),(5,514),(5,515),(5,516),(5,517),(5,518),(5,519),(5,520),(5,521),(5,522),(5,523),(5,524),(5,525),(5,526),(5,527),(5,528),(5,529),(5,530),(5,531),(5,532),(5,533),(5,534),(5,535),(5,536),(5,537),(5,538),(5,539),(5,541),(5,542),(5,543),(5,544),(5,545),(5,546),(5,547),(5,548),(5,550),(5,551),(5,552),(5,553),(5,554),(5,555),(5,556),(5,557),(5,558),(5,559),(5,560),(5,561),(5,562),(5,563),(5,564),(5,565),(5,566),(5,567),(5,568),(5,569),(5,570),(5,571),(5,572),(5,573),(5,574),(5,575),(5,576),(5,577),(5,578),(5,579),(5,580),(5,581),(5,582),(5,583),(5,584),(5,585),(5,586),(5,587),(5,588),(5,589),(5,590),(5,591),(5,592),(5,593),(5,594),(5,595),(5,596),(5,597),(5,598),(5,599),(5,600),(5,601),(5,602),(5,603),(5,604),(5,605),(5,606),(5,607),(5,608),(5,609),(5,610),(5,611),(5,612),(5,613),(5,614),(5,615),(5,616),(5,617),(5,618),(5,619),(5,620),(5,621),(5,622),(5,623),(5,624),(5,625),(5,626),(5,627),(5,628),(5,629),(5,630),(5,631),(5,632),(5,633),(5,634),(5,635),(5,636),(5,637),(5,638),(5,639),(5,640),(5,641),(5,642),(5,643),(5,644),(5,645),(5,646),(5,647),(5,648),(5,649),(5,650),(5,651),(5,652),(5,653),(5,654),(5,655),(5,656),(5,657),(5,658),(5,659),(5,660),(5,661),(5,662),(5,663),(5,664),(5,665),(5,666),(5,667),(5,668),(5,669),(5,670),(5,671),(5,672),(5,673),(5,674),(5,675),(5,676),(5,677),(5,678),(5,679),(5,680),(5,681),(5,682),(5,683),(5,684),(5,685),(5,686),(5,687),(5,688),(5,689),(5,690),(5,691),(5,692),(5,693),(5,694),(5,695),(5,696),(5,697),(5,698),(5,701),(5,702),(5,703),(5,704),(5,705),(5,706),(5,707),(5,708),(5,709),(5,710),(5,711),(5,712),(5,713),(5,714),(5,715),(5,716),(5,717),(5,718),(5,719),(5,720),(5,721),(5,722),(5,723),(5,724),(5,725),(5,726),(5,727),(5,728),(5,729),(5,730),(5,731),(5,732),(5,737),(5,738),(5,739),(5,740),(5,741),(5,742),(5,743),(5,744),(5,745),(5,746),(5,747),(5,748),(5,749),(5,750),(5,751),(5,752),(5,753),(5,754),(5,755),(5,756),(5,757),(5,758),(5,759),(5,760),(5,761),(5,762),(5,763),(5,764),(5,765),(5,766),(5,767),(5,768),(5,769),(5,770),(5,771),(5,772),(5,773),(5,774),(5,775),(5,776),(5,777),(5,778),(5,779),(5,780),(5,781),(5,782),(5,783),(5,784),(5,785),(5,786),(5,787);
/*!40000 ALTER TABLE `m_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account`
--

DROP TABLE IF EXISTS `m_savings_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `field_officer_id` bigint(20) DEFAULT NULL,
  `status_enum` smallint(5) NOT NULL DEFAULT '300',
  `sub_status_enum` smallint(5) NOT NULL DEFAULT '0',
  `account_type_enum` smallint(5) NOT NULL DEFAULT '1',
  `deposit_type_enum` smallint(5) NOT NULL DEFAULT '100',
  `submittedon_date` date NOT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` bigint(20) DEFAULT NULL,
  `activatedon_date` date DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(5) NOT NULL,
  `interest_posting_period_enum` smallint(5) NOT NULL DEFAULT '4',
  `interest_calculation_type_enum` smallint(5) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(5) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(5) DEFAULT NULL,
  `withdrawal_fee_for_transfer` tinyint(4) DEFAULT '1',
  `allow_overdraft` tinyint(1) NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT '0.000000',
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT '0.000000',
  `lockedin_until_date_derived` date DEFAULT NULL,
  `total_deposits_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawals_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawal_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_fees_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_penalty_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_annual_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_earned_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_posted_derived` decimal(19,6) DEFAULT NULL,
  `total_overdraft_interest_derived` decimal(19,6) DEFAULT '0.000000',
  `total_withhold_tax_derived` decimal(19,6) DEFAULT NULL,
  `account_balance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` tinyint(1) NOT NULL DEFAULT '0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `start_interest_calculation_date` date DEFAULT NULL,
  `on_hold_funds_derived` decimal(19,6) DEFAULT NULL,
  `version` int(15) NOT NULL DEFAULT '1',
  `withhold_tax` tinyint(4) NOT NULL DEFAULT '0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `last_interest_calculation_date` date DEFAULT NULL,
  `total_savings_amount_on_hold` decimal(19,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sa_account_no_UNIQUE` (`account_no`),
  UNIQUE KEY `sa_externalid_UNIQUE` (`external_id`),
  KEY `FKSA00000000000001` (`client_id`),
  KEY `FKSA00000000000002` (`group_id`),
  KEY `FKSA00000000000003` (`product_id`),
  KEY `FK_savings_account_tax_group` (`tax_group_id`),
  CONSTRAINT `FKSA00000000000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FKSA00000000000002` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `FKSA00000000000003` FOREIGN KEY (`product_id`) REFERENCES `m_savings_product` (`id`),
  CONSTRAINT `FK_savings_account_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account`
--

LOCK TABLES `m_savings_account` WRITE;
/*!40000 ALTER TABLE `m_savings_account` DISABLE KEYS */;
INSERT INTO `m_savings_account` VALUES (1,'000000001',NULL,6,NULL,2,NULL,300,0,1,100,'2018-02-14',1,'2018-02-14',1,NULL,NULL,NULL,NULL,'2018-02-14',1,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,400000.000000,NULL,NULL,0,0,0.000000,0.000000,0.000000,NULL,960000.000000,NULL,NULL,NULL,NULL,NULL,260.820000,NULL,NULL,NULL,960000.000000,NULL,0,NULL,NULL,0.000000,7,0,NULL,'2018-02-15',NULL),(2,'000000002',NULL,10,NULL,2,NULL,200,0,1,100,'2018-02-15',5,'2018-02-15',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,700000.000000,NULL,NULL,0,0,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.000000,NULL,0,NULL,NULL,NULL,5,0,NULL,NULL,NULL),(3,'000000003',NULL,9,NULL,2,NULL,300,0,1,100,'2018-02-15',4,'2018-02-15',4,NULL,NULL,NULL,NULL,'2018-02-15',4,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,700000.000000,NULL,NULL,0,0,0.000000,0.000000,0.000000,NULL,700000.000000,NULL,NULL,NULL,NULL,NULL,134.250000,NULL,NULL,NULL,700000.000000,NULL,0,NULL,NULL,0.000000,12,0,NULL,'2018-02-15',NULL),(4,'000000004',NULL,11,NULL,2,NULL,300,0,1,100,'2018-02-15',3,'2018-02-15',3,NULL,NULL,NULL,NULL,'2018-02-15',3,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,NULL,NULL,NULL,0,0,0.000000,0.000000,0.000000,NULL,850000.000000,NULL,NULL,NULL,NULL,NULL,163.010000,NULL,NULL,NULL,850000.000000,NULL,0,NULL,NULL,0.000000,6,0,NULL,'2018-02-15',NULL),(5,'000000005',NULL,10,NULL,2,NULL,300,0,1,100,'2018-02-15',5,'2018-02-15',5,NULL,NULL,NULL,NULL,'2018-02-15',5,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,700000.000000,NULL,NULL,0,0,0.000000,0.000000,0.000000,NULL,700000.000000,NULL,NULL,NULL,NULL,NULL,134.250000,NULL,NULL,NULL,700000.000000,700000.000000,0,NULL,NULL,322530.715500,10,0,NULL,'2018-02-15',NULL),(6,'000000006','7000',11,NULL,2,NULL,200,0,1,100,'2018-02-15',3,'2018-02-15',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TZS',2,0,7.000000,7,7,1,365,50000.000000,NULL,NULL,1,0,0.000000,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.000000,700000.000000,0,NULL,NULL,NULL,3,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_savings_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_charge`
--

DROP TABLE IF EXISTS `m_savings_account_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(1) NOT NULL DEFAULT '0',
  `charge_time_enum` smallint(5) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `fee_on_month` smallint(5) DEFAULT NULL,
  `fee_on_day` smallint(5) DEFAULT NULL,
  `fee_interval` smallint(5) DEFAULT NULL,
  `charge_calculation_enum` smallint(5) NOT NULL,
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(1) NOT NULL DEFAULT '0',
  `waived` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `inactivated_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charge_id` (`charge_id`),
  KEY `m_savings_account_charge_ibfk_2` (`savings_account_id`),
  CONSTRAINT `m_savings_account_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_savings_account_charge_ibfk_2` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_charge`
--

LOCK TABLES `m_savings_account_charge` WRITE;
/*!40000 ALTER TABLE `m_savings_account_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_account_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_charge_paid_by`
--

DROP TABLE IF EXISTS `m_savings_account_charge_paid_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_charge_paid_by` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_transaction_id` bigint(20) NOT NULL,
  `savings_account_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__m_savings_account_transaction` (`savings_account_transaction_id`),
  KEY `FK__m_savings_account_charge` (`savings_account_charge_id`),
  CONSTRAINT `FK__m_savings_account_charge` FOREIGN KEY (`savings_account_charge_id`) REFERENCES `m_savings_account_charge` (`id`),
  CONSTRAINT `FK__m_savings_account_transaction` FOREIGN KEY (`savings_account_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_charge_paid_by`
--

LOCK TABLES `m_savings_account_charge_paid_by` WRITE;
/*!40000 ALTER TABLE `m_savings_account_charge_paid_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_account_charge_paid_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_interest_rate_chart`
--

DROP TABLE IF EXISTS `m_savings_account_interest_rate_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_interest_rate_chart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `from_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_primary_grouping_by_amount` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKSAIRC00000000000001` (`savings_account_id`),
  CONSTRAINT `FKSAIRC00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_interest_rate_chart`
--

LOCK TABLES `m_savings_account_interest_rate_chart` WRITE;
/*!40000 ALTER TABLE `m_savings_account_interest_rate_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_account_interest_rate_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_interest_rate_slab`
--

DROP TABLE IF EXISTS `m_savings_account_interest_rate_slab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_interest_rate_slab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_interest_rate_chart_id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `period_type_enum` smallint(5) DEFAULT NULL,
  `from_period` int(11) DEFAULT NULL,
  `to_period` int(11) DEFAULT NULL,
  `amount_range_from` decimal(19,6) DEFAULT NULL,
  `amount_range_to` decimal(19,6) DEFAULT NULL,
  `annual_interest_rate` decimal(19,6) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKSAIRS00000000000001` (`savings_account_interest_rate_chart_id`),
  CONSTRAINT `FKSAIRS00000000000001` FOREIGN KEY (`savings_account_interest_rate_chart_id`) REFERENCES `m_savings_account_interest_rate_chart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_interest_rate_slab`
--

LOCK TABLES `m_savings_account_interest_rate_slab` WRITE;
/*!40000 ALTER TABLE `m_savings_account_interest_rate_slab` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_account_interest_rate_slab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_transaction`
--

DROP TABLE IF EXISTS `m_savings_account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_account_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `transaction_type_enum` smallint(5) NOT NULL,
  `is_reversed` tinyint(1) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `overdraft_amount_derived` decimal(19,6) DEFAULT NULL,
  `balance_end_date_derived` date DEFAULT NULL,
  `balance_number_of_days_derived` int(11) DEFAULT NULL,
  `running_balance_derived` decimal(19,6) DEFAULT NULL,
  `cumulative_balance_derived` decimal(19,6) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `appuser_id` bigint(20) DEFAULT NULL,
  `is_manual` tinyint(1) DEFAULT '0',
  `release_id_of_hold_amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKSAT0000000001` (`savings_account_id`),
  KEY `FK_m_savings_account_transaction_m_payment_detail` (`payment_detail_id`),
  KEY `FK_m_savings_account_transaction_m_office` (`office_id`),
  CONSTRAINT `FKSAT0000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `FK_m_savings_account_transaction_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  CONSTRAINT `FK_m_savings_account_transaction_m_payment_detail` FOREIGN KEY (`payment_detail_id`) REFERENCES `m_payment_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_transaction`
--

LOCK TABLES `m_savings_account_transaction` WRITE;
/*!40000 ALTER TABLE `m_savings_account_transaction` DISABLE KEYS */;
INSERT INTO `m_savings_account_transaction` VALUES (1,1,1,NULL,1,0,'2018-02-14',400000.000000,NULL,'2018-02-14',1,400000.000000,400000.000000,'2018-02-14 11:30:54',1,0,NULL),(2,3,1,NULL,1,0,'2018-02-15',700000.000000,NULL,'2018-02-15',1,700000.000000,700000.000000,'2018-02-15 12:18:55',4,0,NULL),(3,5,1,NULL,1,0,'2018-02-15',700000.000000,NULL,'2018-02-15',1,700000.000000,700000.000000,'2018-02-15 12:39:22',5,0,NULL),(4,4,1,3,1,0,'2018-02-15',700000.000000,NULL,'2018-02-15',0,700000.000000,0.000000,'2018-02-15 13:26:21',3,0,NULL),(5,4,1,4,1,0,'2018-02-15',150000.000000,NULL,'2018-02-15',1,850000.000000,850000.000000,'2018-02-15 13:34:43',3,0,NULL),(6,1,1,NULL,1,0,'2018-02-15',560000.000000,NULL,'2018-02-15',1,960000.000000,960000.000000,'2018-02-15 16:05:06',4,0,NULL);
/*!40000 ALTER TABLE `m_savings_account_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_account_transaction_tax_details`
--

DROP TABLE IF EXISTS `m_savings_account_transaction_tax_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_account_transaction_tax_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `savings_transaction_id` bigint(20) NOT NULL,
  `tax_component_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_savings_account_transaction_tax_details_savings_transaction` (`savings_transaction_id`),
  KEY `FK_savings_account_transaction_tax_details_tax_component` (`tax_component_id`),
  CONSTRAINT `FK_savings_account_transaction_tax_details_savings_transaction` FOREIGN KEY (`savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  CONSTRAINT `FK_savings_account_transaction_tax_details_tax_component` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_account_transaction_tax_details`
--

LOCK TABLES `m_savings_account_transaction_tax_details` WRITE;
/*!40000 ALTER TABLE `m_savings_account_transaction_tax_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_account_transaction_tax_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_interest_incentives`
--

DROP TABLE IF EXISTS `m_savings_interest_incentives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_interest_incentives` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deposit_account_interest_rate_slab_id` bigint(20) NOT NULL,
  `entiry_type` smallint(2) NOT NULL,
  `attribute_name` smallint(2) NOT NULL,
  `condition_type` smallint(2) NOT NULL,
  `attribute_value` varchar(50) NOT NULL,
  `incentive_type` smallint(2) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_savings_interest_incentives_m_savings_interest_rate_slab` (`deposit_account_interest_rate_slab_id`),
  CONSTRAINT `FK_m_savings_interest_incentives_m_savings_interest_rate_slab` FOREIGN KEY (`deposit_account_interest_rate_slab_id`) REFERENCES `m_savings_account_interest_rate_slab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_interest_incentives`
--

LOCK TABLES `m_savings_interest_incentives` WRITE;
/*!40000 ALTER TABLE `m_savings_interest_incentives` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_interest_incentives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_officer_assignment_history`
--

DROP TABLE IF EXISTS `m_savings_officer_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_officer_assignment_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `savings_officer_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_m_savings_officer_assignment_history_0001` (`account_id`),
  KEY `fk_m_savings_officer_assignment_history_0002` (`savings_officer_id`),
  CONSTRAINT `fk_m_savings_officer_assignment_history_0001` FOREIGN KEY (`account_id`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `fk_m_savings_officer_assignment_history_0002` FOREIGN KEY (`savings_officer_id`) REFERENCES `m_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_officer_assignment_history`
--

LOCK TABLES `m_savings_officer_assignment_history` WRITE;
/*!40000 ALTER TABLE `m_savings_officer_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_officer_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_product`
--

DROP TABLE IF EXISTS `m_savings_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `description` varchar(500) NOT NULL,
  `deposit_type_enum` smallint(5) NOT NULL DEFAULT '100',
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(5) NOT NULL,
  `interest_posting_period_enum` smallint(5) NOT NULL DEFAULT '4',
  `interest_calculation_type_enum` smallint(5) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(5) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(5) DEFAULT NULL,
  `accounting_type` smallint(5) NOT NULL,
  `withdrawal_fee_amount` decimal(19,6) DEFAULT NULL,
  `withdrawal_fee_type_enum` smallint(5) DEFAULT NULL,
  `withdrawal_fee_for_transfer` tinyint(4) DEFAULT '1',
  `allow_overdraft` tinyint(1) NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT '0.000000',
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT '0.000000',
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` tinyint(1) NOT NULL DEFAULT '0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `withhold_tax` tinyint(4) NOT NULL DEFAULT '0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `is_dormancy_tracking_active` smallint(1) DEFAULT NULL,
  `days_to_inactive` int(11) DEFAULT NULL,
  `days_to_dormancy` int(11) DEFAULT NULL,
  `days_to_escheat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sp_unq_name` (`name`),
  UNIQUE KEY `sp_unq_short_name` (`short_name`),
  KEY `FK_savings_product_tax_group` (`tax_group_id`),
  CONSTRAINT `FK_savings_product_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_product`
--

LOCK TABLES `m_savings_product` WRITE;
/*!40000 ALTER TABLE `m_savings_product` DISABLE KEYS */;
INSERT INTO `m_savings_product` VALUES (2,'Contribution','Cont','Cont',100,'TZS',2,0,7.000000,7,7,1,365,NULL,NULL,NULL,2,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_savings_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_savings_product_charge`
--

DROP TABLE IF EXISTS `m_savings_product_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_savings_product_charge` (
  `savings_product_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  PRIMARY KEY (`savings_product_id`,`charge_id`),
  KEY `charge_id` (`charge_id`),
  CONSTRAINT `m_savings_product_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_savings_product_charge_ibfk_2` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_savings_product_charge`
--

LOCK TABLES `m_savings_product_charge` WRITE;
/*!40000 ALTER TABLE `m_savings_product_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_savings_product_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_selfservice_beneficiaries_tpt`
--

DROP TABLE IF EXISTS `m_selfservice_beneficiaries_tpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_selfservice_beneficiaries_tpt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `account_type` smallint(4) NOT NULL,
  `transfer_limit` bigint(20) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`app_user_id`,`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_selfservice_beneficiaries_tpt`
--

LOCK TABLES `m_selfservice_beneficiaries_tpt` WRITE;
/*!40000 ALTER TABLE `m_selfservice_beneficiaries_tpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_selfservice_beneficiaries_tpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_selfservice_user_client_mapping`
--

DROP TABLE IF EXISTS `m_selfservice_user_client_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_selfservice_user_client_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appuser_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appuser_id_client_id` (`appuser_id`,`client_id`),
  KEY `m_selfservice_client_id` (`client_id`),
  CONSTRAINT `m_selfservice_appuser_id` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_selfservice_client_id` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_selfservice_user_client_mapping`
--

LOCK TABLES `m_selfservice_user_client_mapping` WRITE;
/*!40000 ALTER TABLE `m_selfservice_user_client_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_selfservice_user_client_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_account`
--

DROP TABLE IF EXISTS `m_share_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(50) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` smallint(5) NOT NULL DEFAULT '300',
  `total_approved_shares` bigint(20) DEFAULT NULL,
  `total_pending_shares` bigint(20) DEFAULT NULL,
  `submitted_date` date NOT NULL,
  `submitted_userid` bigint(20) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `approved_userid` bigint(20) DEFAULT NULL,
  `rejected_date` date DEFAULT NULL,
  `rejected_userid` bigint(20) DEFAULT NULL,
  `activated_date` date DEFAULT NULL,
  `activated_userid` bigint(20) DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `closed_userid` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `minimum_active_period_frequency` decimal(19,6) DEFAULT NULL,
  `minimum_active_period_frequency_enum` smallint(5) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(5) DEFAULT NULL,
  `allow_dividends_inactive_clients` smallint(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_share_account_ibfk_1` (`product_id`),
  KEY `m_share_account_ibfk_2` (`savings_account_id`),
  KEY `m_share_account_ibfk_3` (`submitted_userid`),
  KEY `m_share_account_ibfk_4` (`approved_userid`),
  KEY `m_share_account_ibfk_5` (`rejected_userid`),
  KEY `m_share_account_ibfk_6` (`activated_userid`),
  KEY `m_share_account_ibfk_7` (`closed_userid`),
  KEY `m_share_account_ibfk_8` (`lastmodifiedby_id`),
  KEY `m_share_account_ibfk_9` (`client_id`),
  CONSTRAINT `m_share_account_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`),
  CONSTRAINT `m_share_account_ibfk_2` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  CONSTRAINT `m_share_account_ibfk_3` FOREIGN KEY (`submitted_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_4` FOREIGN KEY (`approved_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_5` FOREIGN KEY (`rejected_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_6` FOREIGN KEY (`activated_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_7` FOREIGN KEY (`closed_userid`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_8` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_account_ibfk_9` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_account`
--

LOCK TABLES `m_share_account` WRITE;
/*!40000 ALTER TABLE `m_share_account` DISABLE KEYS */;
INSERT INTO `m_share_account` VALUES (1,'000000001',1,10,NULL,300,20,NULL,'2018-02-15',5,'2018-02-15',5,NULL,NULL,'2018-02-15',5,NULL,NULL,'TZS',2,1,5,3.000000,0,NULL,0,NULL,NULL,NULL,NULL),(2,'000000002',1,9,NULL,300,20,NULL,'2018-02-15',4,'2018-02-15',4,NULL,NULL,'2018-02-15',4,NULL,NULL,'TZS',2,1,3,3.000000,0,NULL,4,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `m_share_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_account_charge`
--

DROP TABLE IF EXISTS `m_share_account_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_account_charge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `charge_time_enum` smallint(5) NOT NULL,
  `charge_calculation_enum` smallint(5) NOT NULL,
  `charge_payment_mode_enum` smallint(5) NOT NULL DEFAULT '0',
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `charge_amount_or_percentage` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(1) NOT NULL DEFAULT '0',
  `waived` tinyint(1) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `charge_id` (`charge_id`),
  KEY `m_share_account_charge_ibfk_2` (`account_id`),
  CONSTRAINT `m_share_account_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_share_account_charge_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_account_charge`
--

LOCK TABLES `m_share_account_charge` WRITE;
/*!40000 ALTER TABLE `m_share_account_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_account_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_account_charge_paid_by`
--

DROP TABLE IF EXISTS `m_share_account_charge_paid_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_account_charge_paid_by` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_transaction_id` bigint(20) DEFAULT NULL,
  `charge_transaction_id` bigint(20) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `m_share_account_transactions_charge_mapping_ibfk1` (`share_transaction_id`),
  KEY `m_share_account_transactions_charge_mapping_ibfk2` (`charge_transaction_id`),
  CONSTRAINT `m_share_account_transactions_charge_mapping_ibfk1` FOREIGN KEY (`share_transaction_id`) REFERENCES `m_share_account_transactions` (`id`),
  CONSTRAINT `m_share_account_transactions_charge_mapping_ibfk2` FOREIGN KEY (`charge_transaction_id`) REFERENCES `m_share_account_charge` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_account_charge_paid_by`
--

LOCK TABLES `m_share_account_charge_paid_by` WRITE;
/*!40000 ALTER TABLE `m_share_account_charge_paid_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_account_charge_paid_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_account_dividend_details`
--

DROP TABLE IF EXISTS `m_share_account_dividend_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_account_dividend_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dividend_pay_out_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` smallint(3) NOT NULL,
  `savings_transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_share_account_dividend_details_dividend_pay_out_id` (`dividend_pay_out_id`),
  KEY `FK_m_share_account_dividend_details_account_id` (`account_id`),
  CONSTRAINT `FK_m_share_account_dividend_details_account_id` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`),
  CONSTRAINT `FK_m_share_account_dividend_details_dividend_pay_out_id` FOREIGN KEY (`dividend_pay_out_id`) REFERENCES `m_share_product_dividend_pay_out` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_account_dividend_details`
--

LOCK TABLES `m_share_account_dividend_details` WRITE;
/*!40000 ALTER TABLE `m_share_account_dividend_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_account_dividend_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_account_transactions`
--

DROP TABLE IF EXISTS `m_share_account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_account_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `total_shares` bigint(20) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `charge_amount` decimal(20,2) DEFAULT NULL,
  `amount_paid` decimal(20,2) DEFAULT NULL,
  `status_enum` smallint(5) NOT NULL DEFAULT '300',
  `type_enum` smallint(5) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `m_share_account_purchased_shares_ibfk_1` (`account_id`),
  CONSTRAINT `m_share_account_purchased_shares_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_account_transactions`
--

LOCK TABLES `m_share_account_transactions` WRITE;
/*!40000 ALTER TABLE `m_share_account_transactions` DISABLE KEYS */;
INSERT INTO `m_share_account_transactions` VALUES (1,1,'2018-02-15',20,25000.00,500000.00,0.00,500000.00,300,500,1),(2,2,'2018-02-15',20,25000.00,500000.00,0.00,500000.00,300,500,1);
/*!40000 ALTER TABLE `m_share_account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_product`
--

DROP TABLE IF EXISTS `m_share_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(5) NOT NULL,
  `currency_multiplesof` smallint(5) DEFAULT NULL,
  `total_shares` bigint(20) NOT NULL,
  `issued_shares` bigint(20) DEFAULT NULL,
  `totalsubscribed_shares` bigint(20) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `capital_amount` decimal(20,2) NOT NULL,
  `minimum_client_shares` bigint(20) DEFAULT NULL,
  `nominal_client_shares` bigint(20) NOT NULL,
  `maximum_client_shares` bigint(20) DEFAULT NULL,
  `minimum_active_period_frequency` decimal(19,6) DEFAULT NULL,
  `minimum_active_period_frequency_enum` smallint(5) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(5) DEFAULT NULL,
  `allow_dividends_inactive_clients` smallint(1) DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `accounting_type` smallint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `m_share_product_ibfk_1` (`createdby_id`),
  KEY `m_share_product_ibfk_2` (`lastmodifiedby_id`),
  CONSTRAINT `m_share_product_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_share_product_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_product`
--

LOCK TABLES `m_share_product` WRITE;
/*!40000 ALTER TABLE `m_share_product` DISABLE KEYS */;
INSERT INTO `m_share_product` VALUES (1,'Share Product','SP',NULL,'SP','2018-01-26 00:00:00','2018-01-26 00:00:00','TZS',2,1,50000000000,10000000,40,25000.00,250000000000.00,10,20,1000,NULL,4,NULL,4,0,1,'2018-01-26 09:49:57',4,'2018-02-15 12:48:13',2);
/*!40000 ALTER TABLE `m_share_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_product_charge`
--

DROP TABLE IF EXISTS `m_share_product_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_product_charge` (
  `product_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`,`charge_id`),
  KEY `m_share_product_charge_ibfk_1` (`charge_id`),
  CONSTRAINT `m_share_product_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  CONSTRAINT `m_share_product_charge_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_product_charge`
--

LOCK TABLES `m_share_product_charge` WRITE;
/*!40000 ALTER TABLE `m_share_product_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_product_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_product_dividend_pay_out`
--

DROP TABLE IF EXISTS `m_share_product_dividend_pay_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_product_dividend_pay_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `dividend_period_start_date` date NOT NULL,
  `dividend_period_end_date` date NOT NULL,
  `status` smallint(3) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_share_product_dividend_pay_out_product_id` (`product_id`),
  KEY `FK_m_share_product_dividend_pay_out_createdby_id` (`createdby_id`),
  KEY `FK_m_share_product_dividend_pay_out_lastmodifiedby_id` (`lastmodifiedby_id`),
  CONSTRAINT `FK_m_share_product_dividend_pay_out_createdby_id` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_share_product_dividend_pay_out_lastmodifiedby_id` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_m_share_product_dividend_pay_out_product_id` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_product_dividend_pay_out`
--

LOCK TABLES `m_share_product_dividend_pay_out` WRITE;
/*!40000 ALTER TABLE `m_share_product_dividend_pay_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_product_dividend_pay_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_share_product_market_price`
--

DROP TABLE IF EXISTS `m_share_product_market_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_share_product_market_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `from_date` date DEFAULT NULL,
  `share_value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `m_share_product_market_price_ibfk_1` (`product_id`),
  CONSTRAINT `m_share_product_market_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_share_product_market_price`
--

LOCK TABLES `m_share_product_market_price` WRITE;
/*!40000 ALTER TABLE `m_share_product_market_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_share_product_market_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_staff`
--

DROP TABLE IF EXISTS `m_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_loan_officer` tinyint(1) NOT NULL DEFAULT '0',
  `office_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `display_name` varchar(102) NOT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `organisational_role_enum` smallint(6) DEFAULT NULL,
  `organisational_role_parent_staff_id` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `joining_date` date DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `display_name` (`display_name`),
  UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`),
  KEY `FK_m_staff_m_office` (`office_id`),
  KEY `FK_m_staff_m_image` (`image_id`),
  CONSTRAINT `FK_m_staff_m_image` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK_m_staff_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_staff`
--

LOCK TABLES `m_staff` WRITE;
/*!40000 ALTER TABLE `m_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_staff_assignment_history`
--

DROP TABLE IF EXISTS `m_staff_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_staff_assignment_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `centre_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_staff_assignment_history_centre_id_m_group` (`centre_id`),
  KEY `FK_m_staff_assignment_history_m_staff` (`staff_id`),
  CONSTRAINT `FK_m_staff_assignment_history_centre_id_m_group` FOREIGN KEY (`centre_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `FK_m_staff_assignment_history_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_staff_assignment_history`
--

LOCK TABLES `m_staff_assignment_history` WRITE;
/*!40000 ALTER TABLE `m_staff_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_staff_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_survey_components`
--

DROP TABLE IF EXISTS `m_survey_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_survey_components` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) NOT NULL,
  `a_key` varchar(32) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `sequence_no` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `m_survey_components_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_survey_components`
--

LOCK TABLES `m_survey_components` WRITE;
/*!40000 ALTER TABLE `m_survey_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_survey_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_survey_lookup_tables`
--

DROP TABLE IF EXISTS `m_survey_lookup_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_survey_lookup_tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) NOT NULL,
  `a_key` varchar(255) NOT NULL,
  `description` int(4) DEFAULT NULL,
  `value_from` int(4) NOT NULL,
  `value_to` int(4) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `m_survey_lookup_tables_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_survey_lookup_tables`
--

LOCK TABLES `m_survey_lookup_tables` WRITE;
/*!40000 ALTER TABLE `m_survey_lookup_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_survey_lookup_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_survey_questions`
--

DROP TABLE IF EXISTS `m_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_survey_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) NOT NULL,
  `component_key` varchar(32) DEFAULT NULL,
  `a_key` varchar(32) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `sequence_no` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `m_survey_questions_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_survey_questions`
--

LOCK TABLES `m_survey_questions` WRITE;
/*!40000 ALTER TABLE `m_survey_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_survey_responses`
--

DROP TABLE IF EXISTS `m_survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_survey_responses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `a_value` int(4) NOT NULL,
  `sequence_no` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `m_survey_responses_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `m_survey_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_survey_responses`
--

LOCK TABLES `m_survey_responses` WRITE;
/*!40000 ALTER TABLE `m_survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_survey_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_survey_scorecards`
--

DROP TABLE IF EXISTS `m_survey_scorecards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_survey_scorecards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `response_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `a_value` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  KEY `question_id` (`question_id`),
  KEY `response_id` (`response_id`),
  KEY `user_id` (`user_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `m_survey_scorecards_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`),
  CONSTRAINT `m_survey_scorecards_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `m_survey_questions` (`id`),
  CONSTRAINT `m_survey_scorecards_ibfk_3` FOREIGN KEY (`response_id`) REFERENCES `m_survey_responses` (`id`),
  CONSTRAINT `m_survey_scorecards_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `m_survey_scorecards_ibfk_5` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_survey_scorecards`
--

LOCK TABLES `m_survey_scorecards` WRITE;
/*!40000 ALTER TABLE `m_survey_scorecards` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_survey_scorecards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_surveys`
--

DROP TABLE IF EXISTS `m_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_surveys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_key` varchar(32) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_surveys`
--

LOCK TABLES `m_surveys` WRITE;
/*!40000 ALTER TABLE `m_surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_tax_component`
--

DROP TABLE IF EXISTS `m_tax_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tax_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `percentage` decimal(19,6) NOT NULL,
  `debit_account_type_enum` smallint(2) DEFAULT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `credit_account_type_enum` smallint(2) DEFAULT NULL,
  `credit_account_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tax_component_debit_gl_account` (`debit_account_id`),
  KEY `FK_tax_component_credit_gl_account` (`credit_account_id`),
  KEY `FK_tax_component_createdby` (`createdby_id`),
  KEY `FK_tax_component_lastmodifiedby` (`lastmodifiedby_id`),
  CONSTRAINT `FK_tax_component_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_component_credit_gl_account` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_tax_component_debit_gl_account` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_tax_component_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_tax_component`
--

LOCK TABLES `m_tax_component` WRITE;
/*!40000 ALTER TABLE `m_tax_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_tax_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_tax_component_history`
--

DROP TABLE IF EXISTS `m_tax_component_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tax_component_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_component_id` bigint(20) NOT NULL,
  `percentage` decimal(19,6) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tax_component_history_tax_component_id` (`tax_component_id`),
  KEY `FK_tax_component_history_createdby` (`createdby_id`),
  KEY `FK_tax_component_history_lastmodifiedby` (`lastmodifiedby_id`),
  CONSTRAINT `FK_tax_component_history_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_component_history_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_component_history_tax_component_id` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_tax_component_history`
--

LOCK TABLES `m_tax_component_history` WRITE;
/*!40000 ALTER TABLE `m_tax_component_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_tax_component_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_tax_group`
--

DROP TABLE IF EXISTS `m_tax_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tax_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tax_group_createdby` (`createdby_id`),
  KEY `FK_tax_group_lastmodifiedby` (`lastmodifiedby_id`),
  CONSTRAINT `FK_tax_group_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_group_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_tax_group`
--

LOCK TABLES `m_tax_group` WRITE;
/*!40000 ALTER TABLE `m_tax_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_tax_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_tax_group_mappings`
--

DROP TABLE IF EXISTS `m_tax_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tax_group_mappings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_group_id` bigint(20) NOT NULL,
  `tax_component_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tax_group_mappings_tax_group` (`tax_group_id`),
  KEY `FK_tax_group_mappings_tax_component` (`tax_component_id`),
  KEY `FK_tax_group_mappings_createdby` (`createdby_id`),
  KEY `FK_tax_group_mappings_lastmodifiedby` (`lastmodifiedby_id`),
  CONSTRAINT `FK_tax_group_mappings_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_group_mappings_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `FK_tax_group_mappings_tax_component` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`),
  CONSTRAINT `FK_tax_group_mappings_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_tax_group_mappings`
--

LOCK TABLES `m_tax_group_mappings` WRITE;
/*!40000 ALTER TABLE `m_tax_group_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_tax_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_tellers`
--

DROP TABLE IF EXISTS `m_tellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tellers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `office_id` bigint(20) NOT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `credit_account_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `state` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `m_tellers_name_unq` (`name`),
  KEY `IK_m_tellers_m_office` (`office_id`),
  KEY `FK_m_tellers_gl_account_debit_account_id` (`debit_account_id`),
  KEY `FK_m_tellers_gl_account_credit_account_id` (`credit_account_id`),
  CONSTRAINT `FK_m_tellers_gl_account_credit_account_id` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_m_tellers_gl_account_debit_account_id` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  CONSTRAINT `FK_m_tellers_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_tellers`
--

LOCK TABLES `m_tellers` WRITE;
/*!40000 ALTER TABLE `m_tellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_tellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_template`
--

DROP TABLE IF EXISTS `m_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entity` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_template`
--

LOCK TABLES `m_template` WRITE;
/*!40000 ALTER TABLE `m_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_template_m_templatemappers`
--

DROP TABLE IF EXISTS `m_template_m_templatemappers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_template_m_templatemappers` (
  `m_template_id` bigint(20) NOT NULL,
  `mappers_id` bigint(20) NOT NULL,
  UNIQUE KEY `mappers_id` (`mappers_id`),
  KEY `mappers_id_2` (`mappers_id`),
  KEY `m_template_id` (`m_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_template_m_templatemappers`
--

LOCK TABLES `m_template_m_templatemappers` WRITE;
/*!40000 ALTER TABLE `m_template_m_templatemappers` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_template_m_templatemappers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_templatemappers`
--

DROP TABLE IF EXISTS `m_templatemappers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_templatemappers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mapperkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mapperorder` int(11) DEFAULT NULL,
  `mappervalue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_templatemappers`
--

LOCK TABLES `m_templatemappers` WRITE;
/*!40000 ALTER TABLE `m_templatemappers` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_templatemappers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_working_days`
--

DROP TABLE IF EXISTS `m_working_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_working_days` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recurrence` varchar(100) DEFAULT NULL,
  `repayment_rescheduling_enum` smallint(5) DEFAULT NULL,
  `extend_term_daily_repayments` tinyint(1) DEFAULT '0',
  `extend_term_holiday_repayment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_working_days`
--

LOCK TABLES `m_working_days` WRITE;
/*!40000 ALTER TABLE `m_working_days` DISABLE KEYS */;
INSERT INTO `m_working_days` VALUES (1,'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',4,0,0);
/*!40000 ALTER TABLE `m_working_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mix_taxonomy`
--

DROP TABLE IF EXISTS `mix_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_taxonomy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `namespace_id` int(11) DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `need_mapping` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mix_taxonomy`
--

LOCK TABLES `mix_taxonomy` WRITE;
/*!40000 ALTER TABLE `mix_taxonomy` DISABLE KEYS */;
INSERT INTO `mix_taxonomy` VALUES (1,'AdministrativeExpense',1,NULL,3,NULL,1),(2,'Assets',3,NULL,1,'All outstanding principals due for all outstanding client loans. This includes current, delinquent, and renegotiated loans, but not loans that have been written off. It does not include interest receivable.',1),(3,'Assets',3,'MaturityDimension:LessThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',1),(4,'Assets',3,'MaturityDimension:MoreThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',1),(5,'CashAndCashEquivalents',1,NULL,1,NULL,1),(6,'Deposits',3,NULL,1,'The total value of funds placed in an account with an MFI that are payable to a depositor. This item includes any current, checking, or savings accounts that are payable on demand. It also includes time deposits which have a fixed maturity date and compulsory deposits.',1),(7,'Deposits',3,'DepositProductsDimension:CompulsoryMember',1,'The value of deposits that an MFI\'s clients are required to  maintain as a condition of an existing or future loan.',NULL),(8,'Deposits',3,'DepositProductsDimension:VoluntaryMember',1,'The value of deposits that an MFI\'s clients are not required to  maintain as a condition of an existing or future loan.',NULL),(9,'Deposits',3,'LocationDimension:RuralMember',1,'Located in rural areas. Segmentation based on location.',NULL),(10,'Deposits',3,'LocationDimension:UrbanMember',1,'Located in urban areas. Segmentation based on location.',NULL),(11,'Deposits',3,'MaturityDimension:LessThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',NULL),(12,'Deposits',3,'MaturityDimension:MoreThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',NULL),(13,'EmployeeBenefitsExpense',1,NULL,3,NULL,NULL),(14,'Equity',1,NULL,1,NULL,NULL),(15,'Expense',1,NULL,3,NULL,NULL),(16,'FinancialExpense',3,NULL,3,'All costs All costs incurred in raising funds from third parties, fee expenses from non-financial services, net gains (losses) due to changes in fair value of financial liabilities, impairment losses net of reversals of financial assets other than loan portfolio and net gains (losses) from restatement of financial statements in terms of the measuring unit current at the end of the reporting period.',NULL),(17,'FinancialRevenueOnLoans',3,NULL,2,'Interest and non-interest income generated by the provision of credit services to the clients. Fees and commissions for late payment are also included.',NULL),(18,'ImpairmentLossAllowanceGrossLoanPortfolio',3,NULL,2,'An allowance for the risk of losses in the gross loan portfolio due to default .',NULL),(19,'Liabilities',1,NULL,1,NULL,NULL),(20,'Liabilities',3,'MaturityDimension:LessThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',NULL),(21,'Liabilities',3,'MaturityDimension:MoreThanOneYearMember',1,'Segmentation based on the life of an asset or liability.',NULL),(22,'LoanPortfolioGross',3,NULL,2,'All outstanding principals due for all outstanding client loans. This includes current, delinquent, and renegotiated loans, but not loans that have been written off. It does not include interest receivable.',NULL),(23,'LoanPortfolioGross',3,'CreditProductsDimension:MicroenterpriseMember',2,'Loans that finance the production or trade of goods and  services for an individual\'s microenterprise, whether or not the microenterprise is legally registered. Segmentation based on loan product.',NULL),(24,'LoanPortfolioGross',3,'DelinquencyDimension:OneMonthOrMoreMember',2,'Segmentation based on the principal balance of all loans outstanding that have one or more installments of principal  past due or renegotiated. Segmentation based on the  principal balance of all loans outstanding that have one or  more installments of principal past due or renegotiated.',NULL),(25,'LoanPortfolioGross',3,'DelinquencyDimension:ThreeMonthsOrMoreMember',2,'Segmentation based on the principal balance of all loans outstanding that have one or more installments of principal  past due or renegotiated.? Segmentation based on the  principal balance of all loans outstanding that have one or  more installments of principal past due or renegotiated.',NULL),(26,'LoanPortfolioGross',3,'LocationDimension:RuralMember',2,'Located in rural areas. Segmentation based on geographic location.',NULL),(27,'LoanPortfolioGross',3,'LocationDimension:UrbanMember',2,'Located in urbal areas. Segmentation based on geographic location.',NULL),(28,'LoanPortfolioGross',3,'MaturityDimension:LessThanOneYearMember',2,'Segmentation based on the life of an asset or liability.',NULL),(29,'LoanPortfolioGross',3,'MaturityDimension:MoreThanOneYearMember',2,'Segmentation based on the life of an asset or liability.',NULL),(30,'NetLoanLoss',3,'',3,'Referred to the value of delinquency loans written off net of any principal recovery.',NULL),(31,'NetLoanLossProvisionExpense',3,NULL,3,'Represent the net value of loan portfolio impairment loss considering any reversal on impairment loss and any recovery on loans written off recognized as a income during the accounting period.',NULL),(32,'NetOperatingIncome',3,NULL,2,'Total operating revenue less all expenses related to the MFI\'s core financial service operation including total financial expense, impairment loss and operating expense. Donations are excluded.',NULL),(33,'NetOperatingIncomeNetOfTaxExpense',3,NULL,3,'Net operating income reported incorporating the effect of taxes. Taxes include all domestic and foreign taxes which are based on taxable profits, other taxes related to personnel, financial transactions or value-added taxes are not considered in calculation of this value.',NULL),(34,'NumberOfActiveBorrowers',3,NULL,0,'The number of individuals who currently have an outstanding loan balance with the MFI or are primarily responsible for repaying any portion of the gross loan portfolio. Individuals who have multiple loans with an MFI should be counted as a single borrower.',NULL),(35,'NumberOfActiveBorrowers',3,'GenderDimension:FemaleMember',0,'The number of individuals who currently have an outstanding loan balance with the MFI or are primarily responsible for repaying any portion of the gross loan portfolio. Individuals who have multiple loans with an MFI should be counted as a single borrower.',NULL),(36,'NumberOfBoardMembers',3,'GenderDimension:FemaleMember',0,'The number of members that comprise the board of directors at the end of the reporting period who are female.',NULL),(37,'NumberOfDepositAccounts',3,NULL,0,'The number of individuals who currently have funds on deposit with the MFI on a voluntary basis; i.e., they are not required to maintain the deposit account to access a loan. This number applies only to deposits held by an MFI, not to those deposits held in other institutions by the MFI\'s clients. The number should be based on the number of individuals rather than the number of groups. A single deposit account may represent multiple depositors.',NULL),(38,'NumberOfDepositors',3,'',0,'The number of deposit accounts, both voluntary and compulsory, opened at the MFI whose balances the institution is liable to repay. The number should be based on the number of individual accounts rather than on the number of groups.',NULL),(39,'NumberOfEmployees',3,NULL,0,'The number of individuals who are actively employed by an entity. This number includes contract employees or advisors who dedicate a substantial portion of their time to the entity, even if they are not on the entity\'s employees roster.',NULL),(40,'NumberOfEmployees',3,'GenderDimension:FemaleMember',0,'The number of individuals who are actively employed by an entity. This number includes contract employees or advisors who dedicate a substantial portion of their time to the entity, even if they are not on the entity\'s employees roster.',NULL),(41,'NumberOfLoanOfficers',3,NULL,0,'The number of employees whose main activity is to manage a portion of the gross loan portfolio. A loan officer is a staff member of record who is directly responsible for arranging and monitoring client loans.',NULL),(42,'NumberOfLoanOfficers',3,'GenderDimension:FemaleMember',0,'The number of employees whose main activity is to manage a portion of the gross loan portfolio. A loan officer is a staff member of record who is directly responsible for arranging and monitoring client loans.',NULL),(43,'NumberOfManagers',3,'GenderDimension:FemaleMember',0,'The number of members that comprise the management of the institution who are female.',NULL),(44,'NumberOfOffices',3,NULL,0,'The number of staffed points of service and administrative sites used to deliver or support the delivery of financial services to microfinance clients.',NULL),(45,'NumberOfOutstandingLoans',3,NULL,0,'The number of loans in the gross loan portfolio. For MFIs using a group lending methodology, the number of loans should refer to the number of individuals receiving loans as part of a group or as part of a group loan.',NULL),(46,'OperatingExpense',3,NULL,3,'Includes expenses not related to financial and credit loss impairment, such as personnel expenses, depreciation, amortization and administrative expenses.',NULL),(47,'OperatingIncome',3,NULL,2,'Includes all financial income and other operating revenue which is generated from non-financial services. Operating income also includes net gains (losses) from holding financial assets (changes on their values during the period and foreign exchange differences). Donations or any revenue not related with an MFI\'s core business of making loans and providing financial services are not considered under this category.',NULL),(48,'WriteOffsOnGrossLoanPortfolio',3,NULL,2,'The value of loans that have been recognized as uncollectible for accounting purposes. A write-off is an accounting procedure that removes the outstanding balance of the loan from the gross loan portfolio and impairment loss allowance. Thus, the write-off does not affect the net loan portfolio, total assets, or any equity account. If the impairment loss allowance is insufficient to cover the amount written off, the excess amount will result in an additional impairment loss on loans recognised in profit or loss of the period.',NULL);
/*!40000 ALTER TABLE `mix_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mix_taxonomy_mapping`
--

DROP TABLE IF EXISTS `mix_taxonomy_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_taxonomy_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `config` varchar(200) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `currency` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mix_taxonomy_mapping`
--

LOCK TABLES `mix_taxonomy_mapping` WRITE;
/*!40000 ALTER TABLE `mix_taxonomy_mapping` DISABLE KEYS */;
INSERT INTO `mix_taxonomy_mapping` VALUES (1,'default',NULL,NULL,'');
/*!40000 ALTER TABLE `mix_taxonomy_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mix_xbrl_namespace`
--

DROP TABLE IF EXISTS `mix_xbrl_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_xbrl_namespace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQUE` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mix_xbrl_namespace`
--

LOCK TABLES `mix_xbrl_namespace` WRITE;
/*!40000 ALTER TABLE `mix_xbrl_namespace` DISABLE KEYS */;
INSERT INTO `mix_xbrl_namespace` VALUES (1,'ifrs','http://xbrl.iasb.org/taxonomy/2009-04-01/ifrs'),(2,'iso4217','http://www.xbrl.org/2003/iso4217'),(3,'mix','http://www.themix.org/int/fr/ifrs/basi/YYYY-MM-DD/mx-cor'),(4,'xbrldi','http://xbrl.org/2006/xbrldi'),(5,'xbrli','http://www.xbrl.org/2003/instance'),(6,'link','http://www.xbrl.org/2003/linkbase'),(7,'dc-all','http://www.themix.org/int/fr/ifrs/basi/2010-08-31/dc-all');
/*!40000 ALTER TABLE `mix_xbrl_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` bit(1) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('community-app',NULL,'123','all','password,refresh_token',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_likelihoods`
--

DROP TABLE IF EXISTS `ppi_likelihoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_likelihoods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_likelihoods`
--

LOCK TABLES `ppi_likelihoods` WRITE;
/*!40000 ALTER TABLE `ppi_likelihoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppi_likelihoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_likelihoods_ppi`
--

DROP TABLE IF EXISTS `ppi_likelihoods_ppi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_likelihoods_ppi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `likelihood_id` bigint(20) NOT NULL,
  `ppi_name` varchar(250) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_likelihoods_ppi`
--

LOCK TABLES `ppi_likelihoods_ppi` WRITE;
/*!40000 ALTER TABLE `ppi_likelihoods_ppi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppi_likelihoods_ppi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_scores`
--

DROP TABLE IF EXISTS `ppi_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_scores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score_from` int(11) NOT NULL,
  `score_to` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_scores`
--

LOCK TABLES `ppi_scores` WRITE;
/*!40000 ALTER TABLE `ppi_scores` DISABLE KEYS */;
INSERT INTO `ppi_scores` VALUES (1,0,4),(2,5,9),(3,10,14),(4,15,19),(5,20,24),(6,25,29),(7,30,34),(8,35,39),(9,40,44),(10,45,49),(11,50,54),(12,55,59),(13,60,64),(14,65,69),(15,70,74),(16,75,79),(17,80,84),(18,85,89),(19,90,94),(20,95,100);
/*!40000 ALTER TABLE `ppi_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_enum_value`
--

DROP TABLE IF EXISTS `r_enum_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_enum_value` (
  `enum_name` varchar(100) NOT NULL,
  `enum_id` int(11) NOT NULL,
  `enum_message_property` varchar(100) NOT NULL,
  `enum_value` varchar(100) NOT NULL,
  `enum_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`enum_name`,`enum_id`),
  UNIQUE KEY `enum_message_property` (`enum_name`,`enum_message_property`),
  UNIQUE KEY `enum_value` (`enum_name`,`enum_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_enum_value`
--

LOCK TABLES `r_enum_value` WRITE;
/*!40000 ALTER TABLE `r_enum_value` DISABLE KEYS */;
INSERT INTO `r_enum_value` VALUES ('account_type_type_enum',0,'INVALID','INVALID',0),('account_type_type_enum',1,'INDIVIDUAL','INDIVIDUAL',0),('account_type_type_enum',2,'GROUP','GROUP',0),('account_type_type_enum',3,'JLG','JLG',0),('accrual_accounts_for_loan_type_enum',1,'FUND_SOURCE','FUND_SOURCE',0),('accrual_accounts_for_loan_type_enum',2,'LOAN_PORTFOLIO','LOAN_PORTFOLIO',0),('accrual_accounts_for_loan_type_enum',3,'INTEREST_ON_LOANS','INTEREST_ON_LOANS',0),('accrual_accounts_for_loan_type_enum',4,'INCOME_FROM_FEES','INCOME_FROM_FEES',0),('accrual_accounts_for_loan_type_enum',5,'INCOME_FROM_PENALTIES','INCOME_FROM_PENALTIES',0),('accrual_accounts_for_loan_type_enum',6,'LOSSES_WRITTEN_OFF','LOSSES_WRITTEN_OFF',0),('accrual_accounts_for_loan_type_enum',7,'INTEREST_RECEIVABLE','INTEREST_RECEIVABLE',0),('accrual_accounts_for_loan_type_enum',8,'FEES_RECEIVABLE','FEES_RECEIVABLE',0),('accrual_accounts_for_loan_type_enum',9,'PENALTIES_RECEIVABLE','PENALTIES_RECEIVABLE',0),('accrual_accounts_for_loan_type_enum',10,'TRANSFERS_SUSPENSE','TRANSFERS_SUSPENSE',0),('accrual_accounts_for_loan_type_enum',11,'OVERPAYMENT','OVERPAYMENT',0),('accrual_accounts_for_loan_type_enum',12,'INCOME_FROM_RECOVERY','INCOME_FROM_RECOVERY',0),('amortization_method_enum',0,'Equal principle payments','Equal principle payments',0),('amortization_method_enum',1,'Equal installments','Equal installments',0),('calendar_type_enum',0,'INVALID','INVALID',0),('calendar_type_enum',1,'CLIENTS','CLIENTS',0),('calendar_type_enum',2,'GROUPS','GROUPS',0),('calendar_type_enum',3,'LOANS','LOANS',0),('calendar_type_enum',4,'CENTERS','CENTERS',0),('calendar_type_enum',5,'SAVINGS','SAVINGS',0),('calendar_type_enum',6,'LOAN_RECALCULATION_REST_DETAIL','LOAN_RECALCULATION_REST_DETAIL',0),('calendar_type_enum',7,'LOAN_RECALCULATION_COMPOUNDING_DETAIL','LOAN_RECALCULATION_COMPOUNDING_DETAIL',0),('cash_accounts_for_loan_type_enum',1,'FUND_SOURCE','FUND_SOURCE',0),('cash_accounts_for_loan_type_enum',2,'LOAN_PORTFOLIO','LOAN_PORTFOLIO',0),('cash_accounts_for_loan_type_enum',3,'INTEREST_ON_LOANS','INTEREST_ON_LOANS',0),('cash_accounts_for_loan_type_enum',4,'INCOME_FROM_FEES','INCOME_FROM_FEES',0),('cash_accounts_for_loan_type_enum',5,'INCOME_FROM_PENALTIES','INCOME_FROM_PENALTIES',0),('cash_accounts_for_loan_type_enum',6,'LOSSES_WRITTEN_OFF','LOSSES_WRITTEN_OFF',0),('cash_accounts_for_loan_type_enum',10,'TRANSFERS_SUSPENSE','TRANSFERS_SUSPENSE',0),('cash_accounts_for_loan_type_enum',11,'OVERPAYMENT','OVERPAYMENT',0),('cash_accounts_for_loan_type_enum',12,'INCOME_FROM_RECOVERY','INCOME_FROM_RECOVERY',0),('cash_accounts_for_savings_type_enum',1,'SAVINGS_REFERENCE','SAVINGS_REFERENCE',0),('cash_accounts_for_savings_type_enum',2,'SAVINGS_CONTROL','SAVINGS_CONTROL',0),('cash_accounts_for_savings_type_enum',3,'INTEREST_ON_SAVINGS','INTEREST_ON_SAVINGS',0),('cash_accounts_for_savings_type_enum',4,'INCOME_FROM_FEES','INCOME_FROM_FEES',0),('cash_accounts_for_savings_type_enum',5,'INCOME_FROM_PENALTIES','INCOME_FROM_PENALTIES',0),('cash_accounts_for_savings_type_enum',10,'TRANSFERS_SUSPENSE','TRANSFERS_SUSPENSE',0),('cash_accounts_for_savings_type_enum',11,'OVERDRAFT_PORTFOLIO_CONTROL','OVERDRAFT_PORTFOLIO_CONTROL',0),('cash_accounts_for_savings_type_enum',12,'INCOME_FROM_INTEREST','INCOME_FROM_INTEREST',0),('cash_account_for_shares_type_enum',1,'SHARES_REFERENCE','SHARES_REFERENCE',0),('cash_account_for_shares_type_enum',2,'SHARES_SUSPENSE','SHARES_SUSPENSE',0),('cash_account_for_shares_type_enum',3,'INCOME_FROM_FEES','INCOME_FROM_FEES',0),('cash_account_for_shares_type_enum',4,'SHARES_EQUITY','SHARES_EQUITY',0),('client_transaction_type_enum',1,'PAY_CHARGE','PAY_CHARGE',0),('client_transaction_type_enum',2,'WAIVE_CHARGE','WAIVE_CHARGE',0),('entity_account_type_enum',1,'CLIENT','CLIENT',0),('entity_account_type_enum',2,'LOAN','LOAN',0),('entity_account_type_enum',3,'SAVINGS','SAVINGS',0),('entity_account_type_enum',4,'CENTER','CENTER',0),('entity_account_type_enum',5,'GROUP','GROUP',0),('entity_account_type_enum',6,'SHARES','SHARES',0),('financial_activity_type_enum',100,'ASSET_TRANSFER','ASSET_TRANSFER',0),('financial_activity_type_enum',101,'CASH_AT_MAINVAULT','CASH_AT_MAINVAULT',0),('financial_activity_type_enum',102,'CASH_AT_TELLER','CASH_AT_TELLER',0),('financial_activity_type_enum',103,'ASSET_FUND_SOURCE','ASSET_FUND_SOURCE',0),('financial_activity_type_enum',200,'LIABILITY_TRANSFER','LIABILITY_TRANSFER',0),('financial_activity_type_enum',201,'PAYABLE_DIVIDENDS','PAYABLE_DIVIDENDS',0),('financial_activity_type_enum',300,'OPENING_BALANCES_TRANSFER_CONTRA','OPENING_BALANCES_TRANSFER_CONTRA',0),('glaccount_type_enum',1,'ASSET','ASSET',0),('glaccount_type_enum',2,'LIABILITY','LIABILITY',0),('glaccount_type_enum',3,'EQUITY','EQUITY',0),('glaccount_type_enum',4,'INCOME','INCOME',0),('glaccount_type_enum',5,'EXPENSE','EXPENSE',0),('interest_calculated_in_period_enum',0,'Daily','Daily',0),('interest_calculated_in_period_enum',1,'Same as repayment period','Same as repayment period',0),('interest_method_enum',0,'Declining Balance','Declining Balance',0),('interest_method_enum',1,'Flat','Flat',0),('interest_period_frequency_enum',2,'Per month','Per month',0),('interest_period_frequency_enum',3,'Per year','Per year',0),('journal_entry_type_type_enum',1,'CREDIT','CREDIT',0),('journal_entry_type_type_enum',2,'DEBIT','DEBIT',0),('loan_status_id',0,'Invalid','Invalid',0),('loan_status_id',100,'Submitted and awaiting approval','Submitted and awaiting approval',0),('loan_status_id',200,'Approved','Approved',0),('loan_status_id',300,'Active','Active',0),('loan_status_id',400,'Withdrawn by client','Withdrawn by client',0),('loan_status_id',500,'Rejected','Rejected',0),('loan_status_id',600,'Closed','Closed',0),('loan_status_id',601,'Written-Off','Written-Off',0),('loan_status_id',602,'Rescheduled','Rescheduled',0),('loan_status_id',700,'Overpaid','Overpaid',0),('loan_transaction_strategy_id',1,'mifos-standard-strategy','Mifos style',0),('loan_transaction_strategy_id',2,'heavensfamily-strategy','Heavensfamily',0),('loan_transaction_strategy_id',3,'creocore-strategy','Creocore',0),('loan_transaction_strategy_id',4,'rbi-india-strategy','RBI (India)',0),('loan_transaction_type_enum',0,'INVALID','INVALID',0),('loan_transaction_type_enum',1,'DISBURSEMENT','DISBURSEMENT',0),('loan_transaction_type_enum',2,'REPAYMENT','REPAYMENT',0),('loan_transaction_type_enum',3,'CONTRA','CONTRA',0),('loan_transaction_type_enum',4,'WAIVE_INTEREST','WAIVE_INTEREST',0),('loan_transaction_type_enum',5,'REPAYMENT_AT_DISBURSEMENT','REPAYMENT_AT_DISBURSEMENT',0),('loan_transaction_type_enum',6,'WRITEOFF','WRITEOFF',0),('loan_transaction_type_enum',7,'MARKED_FOR_RESCHEDULING','MARKED_FOR_RESCHEDULING',0),('loan_transaction_type_enum',8,'RECOVERY_REPAYMENT','RECOVERY_REPAYMENT',0),('loan_transaction_type_enum',9,'WAIVE_CHARGES','WAIVE_CHARGES',0),('loan_transaction_type_enum',10,'ACCRUAL','ACCRUAL',0),('loan_transaction_type_enum',12,'INITIATE_TRANSFER','INITIATE_TRANSFER',0),('loan_transaction_type_enum',13,'APPROVE_TRANSFER','APPROVE_TRANSFER',0),('loan_transaction_type_enum',14,'WITHDRAW_TRANSFER','WITHDRAW_TRANSFER',0),('loan_transaction_type_enum',15,'REJECT_TRANSFER','REJECT_TRANSFER',0),('loan_transaction_type_enum',16,'REFUND','REFUND',0),('loan_transaction_type_enum',17,'CHARGE_PAYMENT','CHARGE_PAYMENT',0),('loan_transaction_type_enum',18,'REFUND_FOR_ACTIVE_LOAN','REFUND_FOR_ACTIVE_LOAN',0),('loan_transaction_type_enum',19,'INCOME_POSTING','INCOME_POSTING',0),('loan_type_enum',1,'Individual Loan','Individual Loan',0),('loan_type_enum',2,'Group Loan','Group Loan',0),('portfolio_account_type_enum',1,'LOAN','LOAN',0),('portfolio_account_type_enum',2,'SAVING','EXPENSE',0),('portfolio_account_type_enum',3,'PROVISIONING','PROVISIONING',0),('portfolio_account_type_enum',4,'SHARES','SHARES',0),('processing_result_enum',0,'invalid','Invalid',0),('processing_result_enum',1,'processed','Processed',0),('processing_result_enum',2,'awaiting.approval','Awaiting Approval',0),('processing_result_enum',3,'rejected','Rejected',0),('repayment_period_frequency_enum',0,'Days','Days',0),('repayment_period_frequency_enum',1,'Weeks','Weeks',0),('repayment_period_frequency_enum',2,'Months','Months',0),('savings_transaction_type_enum',0,'INVALID','INVALID',0),('savings_transaction_type_enum',1,'deposit','deposit',0),('savings_transaction_type_enum',2,'withdrawal','withdrawal',1),('savings_transaction_type_enum',3,'Interest Posting','Interest Posting',0),('savings_transaction_type_enum',4,'Withdrawal Fee','Withdrawal Fee',1),('savings_transaction_type_enum',5,'Annual Fee','Annual Fee',1),('savings_transaction_type_enum',6,'Waive Charge','Waive Charge',0),('savings_transaction_type_enum',7,'Pay Charge','Pay Charge',1),('savings_transaction_type_enum',8,'DIVIDEND_PAYOUT','DIVIDEND_PAYOUT',0),('savings_transaction_type_enum',12,'Initiate Transfer','Initiate Transfer',0),('savings_transaction_type_enum',13,'Approve Transfer','Approve Transfer',0),('savings_transaction_type_enum',14,'Withdraw Transfer','Withdraw Transfer',0),('savings_transaction_type_enum',15,'Reject Transfer','Reject Transfer',0),('savings_transaction_type_enum',16,'Written-Off','Written-Off',0),('savings_transaction_type_enum',17,'Overdraft Interest','Overdraft Interest',0),('savings_transaction_type_enum',19,'WITHHOLD_TAX','WITHHOLD_TAX',0),('status_enum',0,'Invalid','Invalid',0),('status_enum',100,'Pending','Pending',0),('status_enum',300,'Active','Active',0),('status_enum',600,'Closed','Closed',0),('teller_status',300,'Active','Active',0),('teller_status',400,'Inactive','Inactive',0),('teller_status',600,'Closed','Closed',0),('term_period_frequency_enum',0,'Days','Days',0),('term_period_frequency_enum',1,'Weeks','Weeks',0),('term_period_frequency_enum',2,'Months','Months',0),('term_period_frequency_enum',3,'Years','Years',0),('transaction_type_enum',1,'Disbursement','Disbursement',0),('transaction_type_enum',2,'Repayment','Repayment',0),('transaction_type_enum',3,'Contra','Contra',0),('transaction_type_enum',4,'Waive Interest','Waive Interest',0),('transaction_type_enum',5,'Repayment At Disbursement','Repayment At Disbursement',0),('transaction_type_enum',6,'Write-Off','Write-Off',0),('transaction_type_enum',7,'Marked for Rescheduling','Marked for Rescheduling',0),('transaction_type_enum',8,'Recovery Repayment','Recovery Repayment',0),('transaction_type_enum',9,'Waive Charges','Waive Charges',0),('transaction_type_enum',10,'Apply Charges','Apply Charges',0),('transaction_type_enum',11,'Apply Interest','Apply Interest',0);
/*!40000 ALTER TABLE `r_enum_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_loan_transaction_processing_strategy`
--

DROP TABLE IF EXISTS `ref_loan_transaction_processing_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_loan_transaction_processing_strategy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ltp_strategy_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_loan_transaction_processing_strategy`
--

LOCK TABLES `ref_loan_transaction_processing_strategy` WRITE;
/*!40000 ALTER TABLE `ref_loan_transaction_processing_strategy` DISABLE KEYS */;
INSERT INTO `ref_loan_transaction_processing_strategy` VALUES (1,'mifos-standard-strategy','Penalties, Fees, Interest, Principal order',1),(2,'heavensfamily-strategy','HeavensFamily Unique',6),(3,'creocore-strategy','Creocore Unique',7),(4,'rbi-india-strategy','Overdue/Due Fee/Int,Principal',2),(5,'principal-interest-penalties-fees-order-strategy','Principal, Interest, Penalties, Fees Order',3),(6,'interest-principal-penalties-fees-order-strategy','Interest, Principal, Penalties, Fees Order',4),(7,'early-repayment-strategy','Early Repayment Strategy',5);
/*!40000 ALTER TABLE `ref_loan_transaction_processing_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_audit_table`
--

DROP TABLE IF EXISTS `request_audit_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_audit_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `authentication_token` varchar(100) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `created_date` date NOT NULL,
  `account_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_request_audit_table_m_client` (`client_id`),
  CONSTRAINT `FK1_request_audit_table_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_audit_table`
--

LOCK TABLES `request_audit_table` WRITE;
/*!40000 ALTER TABLE `request_audit_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_audit_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpt_sequence`
--

DROP TABLE IF EXISTS `rpt_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpt_sequence`
--

LOCK TABLES `rpt_sequence` WRITE;
/*!40000 ALTER TABLE `rpt_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_email_campaign`
--

DROP TABLE IF EXISTS `scheduled_email_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_email_campaign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(100) NOT NULL,
  `campaign_type` int(11) NOT NULL,
  `businessRule_id` int(11) NOT NULL,
  `param_value` text,
  `status_enum` int(11) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_message` text NOT NULL,
  `email_attachment_file_format` varchar(10) NOT NULL,
  `stretchy_report_id` int(11) NOT NULL,
  `stretchy_report_param_map` text,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `next_trigger_date` datetime DEFAULT NULL,
  `last_trigger_date` datetime DEFAULT NULL,
  `recurrence_start_date` datetime DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `previous_run_error_log` text,
  `previous_run_error_message` text,
  PRIMARY KEY (`id`),
  KEY `scheduled_email_campaign_ibfk_1` (`stretchy_report_id`),
  CONSTRAINT `scheduled_email_campaign_ibfk_1` FOREIGN KEY (`stretchy_report_id`) REFERENCES `stretchy_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_email_campaign`
--

LOCK TABLES `scheduled_email_campaign` WRITE;
/*!40000 ALTER TABLE `scheduled_email_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled_email_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_email_configuration`
--

DROP TABLE IF EXISTS `scheduled_email_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_email_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_email_configuration`
--

LOCK TABLES `scheduled_email_configuration` WRITE;
/*!40000 ALTER TABLE `scheduled_email_configuration` DISABLE KEYS */;
INSERT INTO `scheduled_email_configuration` VALUES (1,'SMTP_SERVER',NULL),(2,'SMTP_PORT',NULL),(3,'SMTP_USERNAME',NULL),(4,'SMTP_PASSWORD',NULL);
/*!40000 ALTER TABLE `scheduled_email_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_email_messages_outbound`
--

DROP TABLE IF EXISTS `scheduled_email_messages_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_email_messages_outbound` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `email_campaign_id` bigint(20) DEFAULT NULL,
  `status_enum` int(5) NOT NULL DEFAULT '100',
  `email_address` varchar(50) NOT NULL,
  `email_subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `campaign_name` varchar(200) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `error_message` text,
  PRIMARY KEY (`id`),
  KEY `SEFKGROUP000000001` (`group_id`),
  KEY `SEFKCLIENT00000001` (`client_id`),
  KEY `SEFKSTAFF000000001` (`staff_id`),
  KEY `fk_schedule_email_campign1` (`email_campaign_id`),
  CONSTRAINT `SEFKCLIENT00000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `SEFKGROUP000000001` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `SEFKSTAFF000000001` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  CONSTRAINT `fk_schedule_email_campign1` FOREIGN KEY (`email_campaign_id`) REFERENCES `scheduled_email_campaign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_email_messages_outbound`
--

LOCK TABLES `scheduled_email_messages_outbound` WRITE;
/*!40000 ALTER TABLE `scheduled_email_messages_outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled_email_messages_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_detail`
--

DROP TABLE IF EXISTS `scheduler_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_detail` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `execute_misfired_jobs` tinyint(1) NOT NULL DEFAULT '1',
  `reset_scheduler_on_bootup` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_detail`
--

LOCK TABLES `scheduler_detail` WRITE;
/*!40000 ALTER TABLE `scheduler_detail` DISABLE KEYS */;
INSERT INTO `scheduler_detail` VALUES (1,0,1,1);
/*!40000 ALTER TABLE `scheduler_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,1,'1','mifosplatform-core-ddl-latest','SQL','V1__mifosplatform-core-ddl-latest.sql',955277628,'root','2018-01-26 06:59:18',902,1),(10,10,'10','interest-posting-fields-for-savings','SQL','V10__interest-posting-fields-for-savings.sql',-915121401,'root','2018-01-26 06:59:19',76,1),(100,100,'100','Group saving summary report','SQL','V100__Group_saving_summary_report.sql',1693648402,'root','2018-01-26 06:59:27',13,1),(101,101,'101','add mulitplesof to account transfers table','SQL','V101__add_mulitplesof_to_account_transfers_table.sql',1170497405,'root','2018-01-26 06:59:27',73,1),(102,102,'102','client attendance tables','SQL','V102__client_attendance_tables.sql',671600688,'root','2018-01-26 06:59:27',35,1),(103,103,'103','cluster support for batch jobs','SQL','V103__cluster_support_for_batch_jobs.sql',-1003733401,'root','2018-01-26 06:59:27',39,1),(104,104,'104','permissions for transfers','SQL','V104__permissions_for_transfers.sql',2097086645,'root','2018-01-26 06:59:27',4,1),(105,105,'105','track loan transaction against office','SQL','V105__track_loan_transaction_against_office.sql',-2088762881,'root','2018-01-26 06:59:27',102,1),(106,106,'106','more permissions for transfers','SQL','V106__more_permissions_for_transfers.sql',53789950,'root','2018-01-26 06:59:27',7,1),(107,107,'107','datatable code mappings','SQL','V107__datatable_code_mappings.sql',1936829107,'root','2018-01-26 06:59:27',14,1),(108,108,'108','client has transfer office','SQL','V108__client_has_transfer_office.sql',1848604685,'root','2018-01-26 06:59:27',32,1),(109,109,'109','account transfer withdrawal fee configuration','SQL','V109__account_transfer_withdrawal_fee_configuration.sql',-1509786056,'root','2018-01-26 06:59:27',71,1),(11,11,'11','add-payment-details','SQL','V11__add-payment-details.sql',-2044785781,'root','2018-01-26 06:59:19',45,1),(110,110,'110','group center close','SQL','V110__group_center_close.sql',-2002358105,'root','2018-01-26 06:59:27',47,1),(111,111,'111','disable constraint approach for datatables by default','SQL','V111__disable_constraint_approach_for_datatables_by_default.sql',-1856221518,'root','2018-01-26 06:59:28',2,1),(112,112,'111.1','set default transfers in suspense account for existing loan products','SQL','V111_1__set default_transfers_in_suspense_account_for_existing_loan_products.sql',-555049996,'root','2018-01-26 06:59:28',2,1),(113,113,'112','mixreport sql support','SQL','V112__mixreport_sql_support.sql',-1634685996,'root','2018-01-26 06:59:28',52,1),(114,114,'113','track savings transaction against office','SQL','V113__track_savings_transaction_against_office.sql',-1937464787,'root','2018-01-26 06:59:28',102,1),(115,115,'114','set default transfers in suspense account for existing savings products - Copy','SQL','V114__set_default_transfers_in_suspense_account_for_existing_savings_products - Copy.sql',-171456457,'root','2018-01-26 06:59:28',1,1),(116,116,'115','permissions for cache api','SQL','V115__permissions_for_cache_api.sql',1158425551,'root','2018-01-26 06:59:28',18,1),(117,117,'116','track currency for journal entries','SQL','V116__track_currency_for_journal_entries.sql',-532037257,'root','2018-01-26 06:59:28',98,1),(118,118,'117','loan charge from savings','SQL','V117__loan_charge_from_savings.sql',801798692,'root','2018-01-26 06:59:28',79,1),(119,119,'118','savings charge','SQL','V118__savings_charge.sql',-593125861,'root','2018-01-26 06:59:28',61,1),(120,120,'118.1','savings charge patch update','SQL','V118_1__savings_charge_patch_update.sql',409219698,'root','2018-01-26 06:59:28',45,1),(121,121,'118.2','product mapping delete duplicate fund source to account mappings','SQL','V118_2__product_mapping_delete_duplicate_fund_source_to_account_mappings.sql',1393421535,'root','2018-01-26 06:59:28',1,1),(122,122,'118.3','permissions form propose and accept client transfers','SQL','V118_3__permissions_form_propose_and_accept_client_transfers.sql',-1752486114,'root','2018-01-26 06:59:28',3,1),(123,123,'118.4','reset default transfers in suspense account for existing savings products','SQL','V118_4__reset_default_transfers_in_suspense_account_for_existing_savings_products.sql',-1647024296,'root','2018-01-26 06:59:28',2,1),(124,124,'118.5','batch job entry for pay savings charge','SQL','V118_5__batch_job_entry_for_pay_savings_charge.sql',-301143983,'root','2018-01-26 06:59:28',3,1),(125,125,'118.6','defaults for income from penalties for savings product','SQL','V118_6__defaults_for_income_from_penalties_for savings_product.sql',-1821592388,'root','2018-01-26 06:59:28',1,1),(126,126,'118.7','move withdrawal annual fee to charges','SQL','V118_7__move_withdrawal_annual_fee_to_charges.sql',-682159103,'root','2018-01-26 06:59:29',116,1),(127,127,'118.8','track overpayments seperately in loan transactions','SQL','V118_8__track_overpayments_seperately_in_loan_transactions.sql',543900977,'root','2018-01-26 06:59:29',39,1),(128,128,'119','add template table','SQL','V119__add_template_table.sql',506250383,'root','2018-01-26 06:59:29',44,1),(12,12,'12','add external id to couple of tables','SQL','V12__add_external_id_to_couple_of_tables.sql',472305363,'root','2018-01-26 06:59:20',167,1),(129,129,'120','accounting running balance','SQL','V120__accounting_running_balance.sql',2038578089,'root','2018-01-26 06:59:29',45,1),(130,130,'121','accounting running balance for organization','SQL','V121__accounting_running_balance_for_organization.sql',777437006,'root','2018-01-26 06:59:29',44,1),(131,131,'122','recurring fee support for savings','SQL','V122__recurring_fee_support_for_savings.sql',101575000,'root','2018-01-26 06:59:29',54,1),(132,132,'123','remove payment mode for savings','SQL','V123__remove_payment_mode_for_savings.sql',785052987,'root','2018-01-26 06:59:29',29,1),(133,133,'124','added min max cap for charges','SQL','V124__added_min_max_cap_for_charges.sql',-513616995,'root','2018-01-26 06:59:29',49,1),(134,134,'125','added column for actual fee amount or percentage','SQL','V125__added_column_for_actual_fee_amount_or_percentage.sql',-148629234,'root','2018-01-26 06:59:29',30,1),(135,135,'126','initial database structure for sms outbound','SQL','V126__initial_database_structure_for_sms_outbound.sql',537635250,'root','2018-01-26 06:59:29',23,1),(136,136,'127','mobile no fields','SQL','V127__mobile_no_fields.sql',-1231855730,'root','2018-01-26 06:59:29',88,1),(137,137,'128','added loan installment charge','SQL','V128__added_loan_installment_charge.sql',-2044492671,'root','2018-01-26 06:59:29',19,1),(138,138,'129','client and group timeline','SQL','V129__client_and_group_timeline.sql',-334848964,'root','2018-01-26 06:59:30',97,1),(13,13,'13','add group and client pending configuration','SQL','V13__add_group_and_client_pending_configuration.sql',2017249783,'root','2018-01-26 06:59:20',9,1),(139,139,'130','calendar-history-table','SQL','V130__calendar-history-table.sql',-1996204583,'root','2018-01-26 06:59:30',14,1),(140,140,'131','holiday-status-column-and-permissions','SQL','V131__holiday-status-column-and-permissions.sql',-2109352908,'root','2018-01-26 06:59:30',46,1),(141,141,'132','borrower cycle changes','SQL','V132__borrower_cycle_changes.sql',-238834331,'root','2018-01-26 06:59:30',51,1),(142,142,'133','adding payment detail with journal entry','SQL','V133__adding_payment_detail_with_journal_entry.sql',-604769594,'root','2018-01-26 06:59:30',39,1),(143,143,'134','added column value on c configuration','SQL','V134__added_column_value_on_c_configuration.sql',-1619312365,'root','2018-01-26 06:59:30',19,1),(144,144,'134.1','submitted date updation for clients','SQL','V134_1__submitted_date_updation_for_clients.sql',-835307031,'root','2018-01-26 06:59:30',2,1),(145,145,'134.2','permissions spelling correction','SQL','V134_2__permissions_spelling_correction.sql',-851162618,'root','2018-01-26 06:59:30',3,1),(146,146,'135','added permission for undo written off','SQL','V135__added_permission_for_undo_written_off.sql',-147929633,'root','2018-01-26 06:59:30',3,1),(147,147,'136.1','update script strechy parameter','SQL','V136_1__update_script_strechy_parameter.sql',493289660,'root','2018-01-26 06:59:30',4,1),(148,148,'137','added is active column in m staff','SQL','V137__added_is_active_column_in_m_staff.sql',-129240963,'root','2018-01-26 06:59:30',40,1),(149,149,'138','add short name for m product loan and m savings product','SQL','V138__add_short_name_for_m_product_loan_and_m_savings_product.sql',1111329012,'root','2018-01-26 06:59:30',140,1),(150,150,'139','default value for is active updated to true in m staff','SQL','V139__default_value_for_is_active_updated_to_true_in_m_staff.sql',26619575,'root','2018-01-26 06:59:30',35,1),(14,14,'14','rename status id to enum','SQL','V14__rename_status_id_to_enum.sql',971956550,'root','2018-01-26 06:59:20',15,1),(151,151,'140','added loan charge status','SQL','V140__added_loan_charge_status.sql',1403135602,'root','2018-01-26 06:59:30',25,1),(152,152,'140.1','added payment detail id in ac gl journal entry','SQL','V140_1__added_payment_detail_id_in_ac_gl_journal_entry.sql',-790452836,'root','2018-01-26 06:59:31',35,1),(153,153,'141','add early repayment strategy','SQL','V141__add_early_repayment_strategy.sql',1919258536,'root','2018-01-26 06:59:31',3,1),(154,154,'142','read savingsaccount charge permission','SQL','V142__read_savingsaccount_charge_permission.sql',445185341,'root','2018-01-26 06:59:31',3,1),(155,155,'143','create journalentry checker permission','SQL','V143__create_journalentry_checker_permission.sql',-1667764144,'root','2018-01-26 06:59:31',3,1),(156,156,'144','spelling mistake corrections','SQL','V144__spelling_mistake_corrections.sql',-795294413,'root','2018-01-26 06:59:31',10,1),(157,157,'145','add force password reset in c configuration','SQL','V145__add_force_password_reset_in_c_configuration.sql',450084438,'root','2018-01-26 06:59:31',66,1),(158,158,'146','tranche loans','SQL','V146__tranche_loans.sql',-618374535,'root','2018-01-26 06:59:31',159,1),(159,159,'147','tranche loans column name changes','SQL','V147__tranche_loans_column_name_changes.sql',-486809945,'root','2018-01-26 06:59:31',8,1),(160,160,'148','overdraft changes','SQL','V148__overdraft_changes.sql',-1245017565,'root','2018-01-26 06:59:31',139,1),(161,161,'149','add created date savings transaction','SQL','V149__add_created_date_savings_transaction.sql',-1464354272,'root','2018-01-26 06:59:31',42,1),(15,15,'15','center permissions','SQL','V15__center_permissions.sql',-1652318947,'root','2018-01-26 06:59:20',8,1),(162,162,'150','basic savings report','SQL','V150__basic_savings_report.sql',-367961884,'root','2018-01-26 06:59:31',41,1),(163,163,'151','add default savings account to client','SQL','V151__add_default_savings_account_to_client.sql',149734852,'root','2018-01-26 06:59:31',43,1),(164,164,'152','added grace for over due','SQL','V152__added_grace_for_over_due.sql',523114401,'root','2018-01-26 06:59:32',125,1),(165,165,'153','Insert missed permissions','SQL','V153__Insert_missed_permissions.sql',-1668699248,'root','2018-01-26 06:59:32',5,1),(166,166,'154','aging details','SQL','V154__aging_details.sql',1490415344,'root','2018-01-26 06:59:32',5,1),(167,167,'155','stretchy into pentaho','SQL','V155__stretchy_into_pentaho.sql',-1765542054,'root','2018-01-26 06:59:32',76,1),(168,168,'156','added loan saving txns pentaho','SQL','V156__added_loan_saving_txns_pentaho.sql',-225558880,'root','2018-01-26 06:59:32',6,1),(169,169,'157','overdue charge improvements','SQL','V157__overdue_charge_improvements.sql',557269609,'root','2018-01-26 06:59:32',43,1),(170,170,'158','dashboard and navigation queries','SQL','V158__dashboard_and_navigation_queries.sql',260379293,'root','2018-01-26 06:59:32',13,1),(171,171,'159','add transaction id column m portfolio command source','SQL','V159__add_transaction_id_column_m_portfolio_command_source.sql',848049166,'root','2018-01-26 06:59:32',62,1),(16,16,'16','drop min max column on loan table','SQL','V16__drop_min_max_column_on_loan_table.sql',-620841858,'root','2018-01-26 06:59:20',83,1),(172,172,'160','standing instruction changes','SQL','V160__standing_instruction_changes.sql',606544932,'root','2018-01-26 06:59:32',117,1),(173,173,'160.2','Allow nullValue For principal on lonProduct','SQL','V160_2__Allow_nullValue_For_principal_on_lonProduct.sql',-1888713202,'root','2018-01-26 06:59:32',43,1),(174,174,'161','added accrual batch job','SQL','V161__added_accrual_batch_job.sql',-2105048610,'root','2018-01-26 06:59:32',24,1),(175,175,'162','overdue charge batch job','SQL','V162__overdue_charge_batch_job.sql',-1920617111,'root','2018-01-26 06:59:32',4,1),(176,176,'163','added npa for loans','SQL','V163__added_npa_for_loans.sql',1195630185,'root','2018-01-26 06:59:33',136,1),(177,177,'164','fd and rd deposit tables','SQL','V164__fd_and_rd_deposit_tables.sql',210228160,'root','2018-01-26 06:59:33',299,1),(178,178,'165','added permission for disburse to saving account','SQL','V165__added_permission_for_disburse_to_saving_account.sql',1731284424,'root','2018-01-26 06:59:33',3,1),(179,179,'166','added deposit amount to product term and preclosure','SQL','V166__added_deposit_amount_to_product_term_and_preclosure.sql',1150192306,'root','2018-01-26 06:59:33',53,1),(180,180,'167','added columns for writtenOff loans recovered','SQL','V167__added_columns_for_writtenOff_loans_recovered.sql',2034680396,'root','2018-01-26 06:59:33',91,1),(181,181,'168','added transfer fixed deposit interest to linked account','SQL','V168__added_transfer_fixed_deposit_interest_to_linked_account.sql',-15179921,'root','2018-01-26 06:59:33',68,1),(182,182,'169','update dashboard reports to core reports use report to false','SQL','V169__update_dashboard_reports_to_core_reports_use_report_to_false.sql',1893278432,'root','2018-01-26 06:59:33',4,1),(17,17,'17','update stretchy reporting ddl','SQL','V17__update_stretchy_reporting_ddl.sql',1950226573,'root','2018-01-26 06:59:20',121,1),(183,183,'170','update deposit accounts maturity details job','SQL','V170__update_deposit_accounts_maturity_details_job.sql',-1809175088,'root','2018-01-26 06:59:33',3,1),(184,184,'171','added mandatory savings and rd changes','SQL','V171__added_mandatory_savings_and_rd_changes.sql',1819723867,'root','2018-01-26 06:59:34',158,1),(185,185,'172','accounting changes for transfers','SQL','V172__accounting_changes_for_transfers.sql',495285267,'root','2018-01-26 06:59:34',18,1),(186,186,'173','ppi','SQL','V173__ppi.sql',-315832082,'root','2018-01-26 06:59:34',88,1),(187,187,'174','remove interest accrual','SQL','V174__remove_interest_accrual.sql',-86335365,'root','2018-01-26 06:59:34',1,1),(188,188,'175','added incentive interest rates','SQL','V175__added_incentive_interest_rates.sql',477904540,'root','2018-01-26 06:59:34',114,1),(189,189,'176','updates to financial activity accounts','SQL','V176__updates_to_financial_activity_accounts.sql',-832139038,'root','2018-01-26 06:59:34',50,1),(190,190,'177','cleanup for client incentives','SQL','V177__cleanup_for_client_incentives.sql',1886371318,'root','2018-01-26 06:59:34',4,1),(191,191,'178','updates to financial activity accounts pt2','SQL','V178__updates_to_financial_activity_accounts_pt2.sql',1427890502,'root','2018-01-26 06:59:34',6,1),(192,192,'179','updates to action names for maker checker permissions','SQL','V179__updates_to_action_names_for_maker_checker_permissions.sql',1694854506,'root','2018-01-26 06:59:34',6,1),(18,18,'18','update stretchy reporting reportSql','SQL','V18__update_stretchy_reporting_reportSql.sql',897124129,'root','2018-01-26 06:59:20',5,1),(193,193,'180','update report schemas for disbursed vs awaitingdisbursal and groupnamesbystaff','SQL','V180__update_report_schemas_for_disbursed_vs_awaitingdisbursal_and_groupnamesbystaff.sql',-1059355980,'root','2018-01-26 06:59:34',4,1),(194,194,'181','standing instruction logging','SQL','V181__standing_instruction_logging.sql',37469411,'root','2018-01-26 06:59:34',11,1),(195,195,'182','added min required balance to savings product','SQL','V182__added_min_required_balance_to_savings_product.sql',293816320,'root','2018-01-26 06:59:34',88,1),(196,196,'183','added min balance for interest calculation','SQL','V183__added_min_balance_for_interest_calculation.sql',1252599574,'root','2018-01-26 06:59:34',74,1),(197,197,'184','update min required balance for savings product','SQL','V184__update_min_required_balance_for_savings_product.sql',1944024143,'root','2018-01-26 06:59:34',7,1),(198,198,'185','add accrual till date for periodic accrual','SQL','V185__add_accrual_till_date_for_periodic_accrual.sql',880447122,'root','2018-01-26 06:59:35',87,1),(199,199,'186','added periodic accrual job','SQL','V186__added_periodic_accrual_job.sql',301104388,'root','2018-01-26 06:59:35',3,1),(200,200,'187','added permission to periodic accrual','SQL','V187__added_permission_to_periodic_accrual.sql',-2074721454,'root','2018-01-26 06:59:35',3,1),(201,201,'188','add savingscharge inactivate permissions','SQL','V188__add_savingscharge_inactivate_permissions.sql',-540669352,'root','2018-01-26 06:59:35',29,1),(202,202,'189','m loan interest recalculation tables','SQL','V189__m_loan_interest_recalculation_tables.sql',-99299101,'root','2018-01-26 06:59:35',156,1),(19,19,'19','report maintenance permissions','SQL','V19__report_maintenance_permissions.sql',1970906090,'root','2018-01-26 06:59:20',13,1),(203,203,'190','add associategroup disassociategroup permissions','SQL','V190__add_associategroup_disassociategroup_permissions.sql',381935931,'root','2018-01-26 06:59:35',3,1),(204,204,'191','update gl account increase size of name col','SQL','V191__update_gl_account_increase_size_of_name_col.sql',1536985501,'root','2018-01-26 06:59:35',23,1),(205,205,'192','interest recalculate job','SQL','V192__interest_recalculate_job.sql',79432898,'root','2018-01-26 06:59:35',4,1),(206,206,'193','added column joiningDate for staff','SQL','V193__added_column_joiningDate_for_staff.sql',-821872836,'root','2018-01-26 06:59:35',38,1),(207,207,'194','added recalculatedInterestComponent for interest recalculation','SQL','V194__added_recalculatedInterestComponent_for_interest_recalculation.sql',-1166586891,'root','2018-01-26 06:59:35',23,1),(208,208,'195','moved rest frequency to product level','SQL','V195__moved_rest_frequency_to_product_level.sql',-1160182665,'root','2018-01-26 06:59:35',50,1),(209,209,'196','added loan running balance to transactions','SQL','V196__added_loan_running_balance_to_transactions.sql',1409766476,'root','2018-01-26 06:59:35',35,1),(210,210,'197','updated loan running balance of transactions','SQL','V197__updated_loan_running_balance_of_transactions.sql',1635739572,'root','2018-01-26 06:59:35',22,1),(211,211,'198','loan rescheduling tables and permissions','SQL','V198__loan_rescheduling_tables_and_permissions.sql',-1766835098,'root','2018-01-26 06:59:36',114,1),(212,212,'199','removed extra columns from schedule history','SQL','V199__removed_extra_columns_from_schedule_history.sql',-1832514885,'root','2018-01-26 06:59:36',29,1),(2,2,'2','mifosx-base-reference-data-utf8','SQL','V2__mifosx-base-reference-data-utf8.sql',-1196210340,'root','2018-01-26 06:59:18',67,1),(20,20,'20','report maint perms really configuration','SQL','V20__report_maint_perms_really_configuration.sql',453012588,'root','2018-01-26 06:59:20',11,1),(213,213,'200','alter savings account for start interest calculation date','SQL','V200__alter_savings_account_for_start_interest_calculation_date.sql',-1163540853,'root','2018-01-26 06:59:36',39,1),(214,214,'201','webhooks','SQL','V201__webhooks.sql',2049033132,'root','2018-01-26 06:59:36',60,1),(215,215,'202','savings officer history table','SQL','V202__savings_officer_history_table.sql',1234668850,'root','2018-01-26 06:59:36',15,1),(216,216,'203','added subbmittedDate loantransaction','SQL','V203__added_subbmittedDate_loantransaction.sql',-1629312170,'root','2018-01-26 06:59:36',38,1),(217,217,'204','insert script for charges paid by for accruals','SQL','V204__insert_script_for_charges_paid_by_for_accruals.sql',795810978,'root','2018-01-26 06:59:36',4,1),(218,218,'205','fix for charge and interest waiver with accruals','SQL','V205__fix_for_charge_and_interest_waiver_with_accruals.sql',1503546394,'root','2018-01-26 06:59:36',67,1),(219,219,'206','interest posting configuration','SQL','V206__interest_posting_configuration.sql',154771122,'root','2018-01-26 06:59:36',21,1),(220,220,'207','min max clients per group','SQL','V207__min_max_clients_per_group.sql',184134907,'root','2018-01-26 06:59:36',24,1),(221,221,'208','min max clients in group redux','SQL','V208__min_max_clients_in_group_redux.sql',-928317934,'root','2018-01-26 06:59:36',24,1),(222,222,'209','add all report names in m permission table','SQL','V209__add_all_report_names_in_m_permission_table.sql',-365542947,'root','2018-01-26 06:59:36',20,1),(21,21,'21','activation-permissions-for-clients','SQL','V21__activation-permissions-for-clients.sql',-247109946,'root','2018-01-26 06:59:20',42,1),(223,223,'210','track manually adjusted transactions','SQL','V210__track_manually_adjusted_transactions.sql',1826188666,'root','2018-01-26 06:59:36',37,1),(224,224,'211','minimum days between disbursal and first repayment','SQL','V211__minimum_days_between_disbursal_and_first_repayment.sql',-1661038663,'root','2018-01-26 06:59:36',51,1),(225,225,'212','add NthDay and DayOfWeek columns loan','SQL','V212__add_NthDay_and_DayOfWeek_columns_loan.sql',-604136808,'root','2018-01-26 06:59:37',85,1),(226,226,'213','NthDay and DayOfWeek columns should be nullable','SQL','V213__NthDay_and_DayOfWeek_columns_should_be_nullable.sql',-467766587,'root','2018-01-26 06:59:37',78,1),(227,227,'214','alter table add create SI at disbursement','SQL','V214__alter_table_add_create_SI_at_disbursement.sql',634522786,'root','2018-01-26 06:59:37',82,1),(228,228,'215','guarantee on hold fund changes','SQL','V215__guarantee_on_hold_fund_changes.sql',150894107,'root','2018-01-26 06:59:37',125,1),(229,229,'216','adding loan proposed amount to loan','SQL','V216__adding_loan_proposed_amount_to_loan.sql',-1187625362,'root','2018-01-26 06:59:37',85,1),(230,230,'217','client substatus and codevalue description','SQL','V217__client_substatus_and_codevalue_description.sql',1580988935,'root','2018-01-26 06:59:37',72,1),(231,231,'218','add user and datetime for loan savings transactions','SQL','V218__add_user_and_datetime_for_loan_savings_transactions.sql',79809857,'root','2018-01-26 06:59:37',70,1),(232,232,'219','guarantor on hold fund changes for account','SQL','V219__guarantor_on_hold_fund_changes_for_account.sql',605515418,'root','2018-01-26 06:59:37',226,1),(22,22,'22','alter-group-for-consistency-add-permissions','SQL','V22__alter-group-for-consistency-add-permissions.sql',1994886076,'root','2018-01-26 06:59:20',101,1),(233,233,'220','account number preferences','SQL','V220__account_number_preferences.sql',5010937,'root','2018-01-26 06:59:38',14,1),(234,234,'221','add version for m savings account','SQL','V221__add_version_for_m_savings_account.sql',-458458210,'root','2018-01-26 06:59:38',39,1),(235,235,'222','guarantor on hold fund changes for transactions','SQL','V222__guarantor_on_hold_fund_changes_for_transactions.sql',1500152124,'root','2018-01-26 06:59:38',135,1),(236,236,'223','add version for m loan account','SQL','V223__add_version_for_m_loan_account.sql',630974445,'root','2018-01-26 06:59:38',81,1),(237,237,'224','client lifecycle adding statuses','SQL','V224__client_lifecycle_adding_statuses.sql',-1899179981,'root','2018-01-26 06:59:38',122,1),(238,238,'225','permissions for updating recurring deposit amount','SQL','V225__permissions_for_updating_recurring_deposit_amount.sql',-1994557062,'root','2018-01-26 06:59:38',3,1),(239,239,'226','configuration for enforcing calendars for jlg loans','SQL','V226__configuration_for_enforcing_calendars_for_jlg_loans.sql',1439092124,'root','2018-01-26 06:59:38',2,1),(240,240,'227','loan-refund-permissions','SQL','V227__loan-refund-permissions.sql',-2112872726,'root','2018-01-26 06:59:38',4,1),(241,241,'228','entity to entity access','SQL','V228__entity_to_entity_access.sql',-283406757,'root','2018-01-26 06:59:38',20,1),(242,242,'229','teller cash management','SQL','V229__teller_cash_management.sql',-1424678232,'root','2018-01-26 06:59:38',61,1),(23,23,'23','remove-enable-disable-configuration-for-client-group-status','SQL','V23__remove-enable-disable-configuration-for-client-group-status.sql',267625051,'root','2018-01-26 06:59:21',49,1),(243,243,'230','role status and correspoding permissions','SQL','V230__role_status_and_correspoding_permissions.sql',-11380981,'root','2018-01-26 06:59:38',89,1),(244,244,'231','m cashier transaction added currency code','SQL','V231__m_cashier_transaction_added_currency_code.sql',613838774,'root','2018-01-26 06:59:38',26,1),(245,245,'232','insert center closure reason','SQL','V232__insert_center_closure_reason.sql',1610893120,'root','2018-01-26 06:59:39',3,1),(246,246,'233','Savings Transaction Receipt','SQL','V233__Savings_Transaction_Receipt.sql',-866032406,'root','2018-01-26 06:59:39',4,1),(247,247,'234','opening balaces setup','SQL','V234__opening_balaces_setup.sql',1086146792,'root','2018-01-26 06:59:39',17,1),(248,248,'235','add ugd template id m hook','SQL','V235__add_ugd_template_id_m_hook.sql',-1822383963,'root','2018-01-26 06:59:39',46,1),(249,249,'236','individual collection sheet permissions','SQL','V236__individual_collection_sheet_permissions.sql',2002138461,'root','2018-01-26 06:59:39',3,1),(250,250,'237','add threshold config for last instalment','SQL','V237__add_threshold_config_for_last_instalment.sql',-1244564740,'root','2018-01-26 06:59:39',39,1),(251,251,'238','update staff display name length','SQL','V238__update_staff_display_name_length.sql',-2026750320,'root','2018-01-26 06:59:39',30,1),(252,252,'239','Loan Transaction Receipt','SQL','V239__Loan_Transaction_Receipt.sql',-2048008570,'root','2018-01-26 06:59:39',3,1),(24,24,'24','add-group-client-foreign-key-constraint-in-loan-table','SQL','V24__add-group-client-foreign-key-constraint-in-loan-table.sql',-895801251,'root','2018-01-26 06:59:21',58,1),(253,253,'240','arrears aging config for interest recalculation','SQL','V240__arrears_aging_config_for_interest_recalculation.sql',-569040320,'root','2018-01-26 06:59:39',67,1),(254,254,'241','fixed emi changes','SQL','V241__fixed_emi_changes.sql',300787261,'root','2018-01-26 06:59:39',38,1),(255,255,'242','entitytoentitymappingrelation','SQL','V242__entitytoentitymappingrelation.sql',745908831,'root','2018-01-26 06:59:39',26,1),(256,256,'243','alter loan disbursement details','SQL','V243__alter_loan_disbursement_details.sql',-1491848388,'root','2018-01-26 06:59:39',26,1),(257,257,'244','staff assignment history table','SQL','V244__staff_assignment_history_table.sql',18710234,'root','2018-01-26 06:59:39',16,1),(258,258,'245','open rd changes','SQL','V245__open_rd_changes.sql',-2057800318,'root','2018-01-26 06:59:39',3,1),(259,259,'246','drop group client foreign key from m loan','SQL','V246__drop_group_client_foreign_key_from_m_loan.sql',1508935468,'root','2018-01-26 06:59:39',6,1),(260,260,'247','consistency wrt spelling principalThresholdForLastInstalment','SQL','V247__consistency_wrt_spelling_principalThresholdForLastInstalment.sql',682671217,'root','2018-01-26 06:59:39',5,1),(261,261,'248','added password never expired to User','SQL','V248__added_password_never_expired_to_User.sql',2112211436,'root','2018-01-26 06:59:39',33,1),(262,262,'249','workingdays permissions','SQL','V249__workingdays_permissions.sql',111355911,'root','2018-01-26 06:59:39',3,1),(25,25,'25','update client reports for status and activation change','SQL','V25__update_client_reports_for_status_and_activation_change.sql',-156638565,'root','2018-01-26 06:59:21',10,1),(263,263,'250','password validation policy','SQL','V250__password_validation_policy.sql',625441779,'root','2018-01-26 06:59:40',15,1),(264,264,'251','paymentType table','SQL','V251__paymentType_table.sql',-1153248008,'root','2018-01-26 06:59:40',87,1),(265,265,'252','bug fix teller cash management','SQL','V252__bug_fix_teller_cash_management.sql',-539616044,'root','2018-01-26 06:59:40',28,1),(266,266,'253','product loan configurable attributes','SQL','V253__product_loan_configurable_attributes.sql',611141994,'root','2018-01-26 06:59:40',14,1),(267,267,'254','General Ledger Report','SQL','V254__General_Ledger_Report.sql',2119102660,'root','2018-01-26 06:59:40',6,1),(268,268,'255','pre close interest period config','SQL','V255__pre_close_interest_period_config.sql',1808952818,'root','2018-01-26 06:59:40',30,1),(269,269,'256','Update script for General Ledger report','SQL','V256__Update script for General_Ledger_report.sql',696052144,'root','2018-01-26 06:59:40',6,1),(270,270,'257','staff image association','SQL','V257__staff_image_association.sql',-836387316,'root','2018-01-26 06:59:40',33,1),(271,271,'258','interest compounding changes','SQL','V258__interest_compounding_changes.sql',360400057,'root','2018-01-26 06:59:40',50,1),(272,272,'259','alter working days','SQL','V259__alter_working_days.sql',-1471987996,'root','2018-01-26 06:59:40',19,1),(26,26,'26','add-support-for-withdrawal-fees-on-savings','SQL','V26__add-support-for-withdrawal-fees-on-savings.sql',129901392,'root','2018-01-26 06:59:21',111,1),(273,273,'260','alter password validation policy','SQL','V260__alter_password_validation_policy.sql',-1248692662,'root','2018-01-26 06:59:40',26,1),(274,274,'261','Update script for Client Loan Account Schedule Report','SQL','V261__Update script for Client_Loan_Account_Schedule_Report.sql',425432201,'root','2018-01-26 06:59:40',4,1),(275,275,'262','accountNumber for groups','SQL','V262__accountNumber_for_groups.sql',1922297099,'root','2018-01-26 06:59:40',55,1),(276,276,'263','mifos reports','SQL','V263__mifos_reports.sql',2128016331,'root','2018-01-26 06:59:40',9,1),(277,277,'264','insert paymenttype and report read permission','SQL','V264__insert_paymenttype_and_report_read_permission.sql',-634268959,'root','2018-01-26 06:59:40',6,1),(278,278,'265','modify external service schema','SQL','V265__modify_external_service_schema.sql',300433155,'root','2018-01-26 06:59:41',113,1),(279,279,'266','client fees','SQL','V266__client_fees.sql',1859569785,'root','2018-01-26 06:59:41',43,1),(280,280,'267','client transaction permissions','SQL','V267__client_transaction_permissions.sql',731273171,'root','2018-01-26 06:59:41',4,1),(281,281,'268','update gmail password','SQL','V268__update_gmail_password.sql',1571111604,'root','2018-01-26 06:59:41',3,1),(282,282,'269','increased calendar title length ','SQL','V269__increased_calendar_title_length .sql',1602892066,'root','2018-01-26 06:59:41',41,1),(27,27,'27','add-loan-type-column-to-loan-table','SQL','V27__add-loan-type-column-to-loan-table.sql',612867183,'root','2018-01-26 06:59:21',94,1),(283,283,'270','add rounding mode configuration','SQL','V270__add_rounding_mode_configuration.sql',1970738261,'root','2018-01-26 06:59:41',32,1),(284,284,'271','accounting for client charges','SQL','V271__accounting_for_client_charges.sql',1964981050,'root','2018-01-26 06:59:41',57,1),(285,285,'272','loan tranche disbursement charge','SQL','V272__loan_tranche_disbursement_charge.sql',1144829058,'root','2018-01-26 06:59:41',61,1),(286,286,'273','oauth changes','SQL','V273__oauth_changes.sql',-245059913,'root','2018-01-26 06:59:41',31,1),(287,287,'274','Loan Reschedule Code Value','SQL','V274__Loan_Reschedule_Code_Value.sql',-5117183,'root','2018-01-26 06:59:41',3,1),(288,288,'275','loan transaction to repayment schedule mapping','SQL','V275__loan_transaction_to_repayment_schedule_mapping.sql',-221403658,'root','2018-01-26 06:59:41',15,1),(289,289,'276','loan recalulated till date','SQL','V276__loan_recalulated_till_date.sql',16474746,'root','2018-01-26 06:59:41',87,1),(290,290,'277','Loan Product Provisioning','SQL','V277__Loan_Product_Provisioning.sql',-391952085,'root','2018-01-26 06:59:41',100,1),(291,291,'278','LoanTransactionProcessingStrategy','SQL','V278__LoanTransactionProcessingStrategy.sql',-237974347,'root','2018-01-26 06:59:42',36,1),(292,292,'279','floating rates','SQL','V279__floating_rates.sql',-500468035,'root','2018-01-26 06:59:42',164,1),(28,28,'28','accounting-abstractions-and-autoposting','SQL','V28__accounting-abstractions-and-autoposting.sql',-2064898972,'root','2018-01-26 06:59:21',41,1),(293,293,'280','spm framework initial tables','SQL','V280__spm_framework_initial_tables.sql',-912305200,'root','2018-01-26 06:59:42',67,1),(294,294,'281','add configuration param backdate-penalties','SQL','V281__add_configuration_param_backdate-penalties.sql',-1810298086,'root','2018-01-26 06:59:42',4,1),(295,295,'282','CustomerSelfService','SQL','V282__CustomerSelfService.sql',240551284,'root','2018-01-26 06:59:42',52,1),(296,296,'283','Variable Installments','SQL','V283__Variable_Installments.sql',-1494982036,'root','2018-01-26 06:59:42',81,1),(297,297,'284','update codevalue','SQL','V284__update_codevalue.sql',-880137513,'root','2018-01-26 06:59:42',31,1),(298,298,'285','undo last tranche script','SQL','V285__undo_last_tranche_script.sql',-691462674,'root','2018-01-26 06:59:42',3,1),(299,299,'286','partial period interest calcualtion','SQL','V286__partial_period_interest_calcualtion.sql',2098674974,'root','2018-01-26 06:59:42',127,1),(300,300,'287','alter spm scorecard','SQL','V287__alter_spm_scorecard.sql',-1380609770,'root','2018-01-26 06:59:42',26,1),(301,301,'288','overdraft interest','SQL','V288__overdraft_interest.sql',-1725673774,'root','2018-01-26 06:59:43',74,1),(302,302,'289','client non person','SQL','V289__client_non_person.sql',-961697782,'root','2018-01-26 06:59:43',101,1),(29,29,'29','add-support-for-annual-fees-on-savings','SQL','V29__add-support-for-annual-fees-on-savings.sql',-995632079,'root','2018-01-26 06:59:21',109,1),(303,303,'290','shares dividends permissions script','SQL','V290__shares_dividends_permissions_script.sql',146587860,'root','2018-01-26 06:59:43',3,1),(304,304,'291','organisation start date config','SQL','V291__organisation_start_date_config.sql',-1674309950,'root','2018-01-26 06:59:43',27,1),(305,305,'292','update organisation start date','SQL','V292__update_organisation_start_date.sql',2016095558,'root','2018-01-26 06:59:43',4,1),(306,306,'293','interest rate chart support for amounts','SQL','V293__interest_rate_chart_support_for_amounts.sql',-1720908295,'root','2018-01-26 06:59:43',98,1),(307,307,'294','configuration for paymnettype application forDisbursement charge','SQL','V294__configuration_for_paymnettype_application_forDisbursement_charge.sql',-754382065,'root','2018-01-26 06:59:43',3,1),(308,308,'295','configuration for interest charged date same as disbursal date','SQL','V295__configuration_for_interest_charged_date_same_as_disbursal_date.sql',-1113285243,'root','2018-01-26 06:59:43',3,1),(309,309,'296','skip repayment on first-day of month','SQL','V296__skip_repayment_on first-day_of_month.sql',-172630113,'root','2018-01-26 06:59:43',4,1),(310,310,'297','Adding Meeting Time column','SQL','V297__Adding_Meeting_Time_column.sql',-637673654,'root','2018-01-26 06:59:43',21,1),(311,311,'298','savings interest tax','SQL','V298__savings_interest_tax.sql',-1023309693,'root','2018-01-26 06:59:43',151,1),(312,312,'299','share products','SQL','V299__share_products.sql',1270845438,'root','2018-01-26 06:59:44',203,1),(3,3,'3','mifosx-permissions-and-authorisation-utf8','SQL','V3__mifosx-permissions-and-authorisation-utf8.sql',656939441,'root','2018-01-26 06:59:18',39,1),(30,30,'30','add-referenceNumber-to-acc gl journal entry','SQL','V30__add-referenceNumber-to-acc_gl_journal_entry.sql',931391195,'root','2018-01-26 06:59:21',49,1),(313,313,'300','configuration for allow changing of emi amount','SQL','V300__configuration_for_allow_changing_of_emi_amount.sql',-490331317,'root','2018-01-26 06:59:44',30,1),(314,314,'301','recurring moratorium principal periods','SQL','V301__recurring_moratorium_principal_periods.sql',816871436,'root','2018-01-26 06:59:44',143,1),(315,315,'302','add status to client identifier','SQL','V302__add_status_to_client_identifier.sql',1978862509,'root','2018-01-26 06:59:44',37,1),(316,316,'303','Savings Account Dormancy','SQL','V303__Savings_Account_Dormancy.sql',-533139714,'root','2018-01-26 06:59:44',74,1),(317,317,'304','customer self service third party transfers','SQL','V304__customer_self_service_third_party_transfers.sql',-341614071,'root','2018-01-26 06:59:44',16,1),(318,318,'305','compounding and rest frequency nth day freq and insertion script for accrual job','SQL','V305__compounding_and_rest_frequency_nth_day_freq_and_insertion_script_for_accrual_job.sql',710584648,'root','2018-01-26 06:59:44',214,1),(319,319,'306','add domancy tracking job to savings group','SQL','V306__add_domancy_tracking_job_to_savings_group.sql',-2998873,'root','2018-01-26 06:59:44',4,1),(320,320,'307','add share notes','SQL','V307__add_share_notes.sql',-1950926410,'root','2018-01-26 06:59:44',75,1),(321,321,'308','add interest recalculation in savings account','SQL','V308__add_interest_recalculation_in_savings_account.sql',1869901088,'root','2018-01-26 06:59:44',47,1),(322,322,'309','add loan write off reason code','SQL','V309__add_loan_write_off_reason_code.sql',1221434865,'root','2018-01-26 06:59:45',52,1),(31,31,'31','drop-autopostings','SQL','V31__drop-autopostings.sql',1482958085,'root','2018-01-26 06:59:21',7,1),(323,323,'310','copy data from entitytoentityaccess to entitytoentitymapping','SQL','V310__copy_data_from_entitytoentityaccess_to_entitytoentitymapping.sql',1179078728,'root','2018-01-26 06:59:45',2,1),(324,324,'311','foreclosure details','SQL','V311__foreclosure_details.sql',1236003234,'root','2018-01-26 06:59:45',92,1),(325,325,'312','add is mandatory to code value','SQL','V312__add_is_mandatory_to_code_value.sql',-1943949742,'root','2018-01-26 06:59:45',26,1),(326,326,'313','multi rescheduling script','SQL','V313__multi_rescheduling_script.sql',-1003845274,'root','2018-01-26 06:59:45',158,1),(327,327,'314','updating r enum table','SQL','V314__updating_r_enum_table.sql',780881263,'root','2018-01-26 06:59:45',30,1),(328,328,'315','add sync expected with disbursement date in m product loan','SQL','V315__add_sync_expected_with_disbursement_date_in_m_product_loan.sql',553617808,'root','2018-01-26 06:59:45',40,1),(329,329,'316','address module tables metadat','SQL','V316__address_module_tables_metadat.sql',-776128404,'root','2018-01-26 06:59:45',57,1),(330,330,'317','report mailing job module','SQL','V317__report_mailing_job_module.sql',-1917516805,'root','2018-01-26 06:59:45',41,1),(331,331,'318','topuploan','SQL','V318__topuploan.sql',590465441,'root','2018-01-26 06:59:45',150,1),(332,332,'319','client undoreject','SQL','V319__client_undoreject.sql',-1615618857,'root','2018-01-26 06:59:46',82,1),(32,32,'32','associate-disassociate-clients-from-group-permissions','SQL','V32__associate-disassociate-clients-from-group-permissions.sql',-494472694,'root','2018-01-26 06:59:22',3,1),(333,333,'320','add holiday payment reschedule','SQL','V320__add_holiday_payment_reschedule.sql',1445492229,'root','2018-01-26 06:59:46',20,1),(334,334,'321','boolean field As Interest PostedOn','SQL','V321__boolean_field_As_Interest_PostedOn.sql',1906735834,'root','2018-01-26 06:59:46',34,1),(335,335,'322','sms campaign','SQL','V322__sms_campaign.sql',-1316831815,'root','2018-01-26 06:59:46',84,1),(336,347,'322.1','scheduled email campaign','SQL','V322_1__scheduled_email_campaign.sql',-386388269,'root','2018-02-18 11:56:29',4297,1),(337,348,'322.2','email business rules','SQL','V322_2__email_business_rules.sql',-134890028,'root','2018-02-18 11:56:30',125,1),(338,336,'323','spm replace dead fk with exisiting one','SQL','V323__spm_replace_dead_fk_with_exisiting_one.sql',656055500,'root','2018-01-26 06:59:46',27,1),(339,337,'324','datatable checks','SQL','V324__datatable_checks.sql',-142308095,'root','2018-01-26 06:59:46',22,1),(340,338,'325','add is staff client data','SQL','V325__add_is_staff_client_data.sql',1370025807,'root','2018-01-26 06:59:46',87,1),(341,339,'326','data migration for client tr gl entries','SQL','V326__data_migration_for_client_tr_gl_entries.sql',-1103682583,'root','2018-01-26 06:59:46',2,1),(342,340,'327','creditbureau configuration','SQL','V327__creditbureau_configuration.sql',108463042,'root','2018-01-26 06:59:46',110,1),(343,349,'328','family members sql support','SQL','V328__family_members_sql_support.sql',-341237965,'root','2018-02-18 11:56:31',609,1),(344,341,'329','sms messages without campaign','SQL','V329__sms_messages_without_campaign.sql',1747940025,'root','2018-01-26 06:59:46',44,1),(33,33,'33','drop unique check on stretchy report parameter','SQL','V33__drop_unique_check_on_stretchy_report_parameter.sql',594468369,'root','2018-01-26 06:59:22',7,1),(345,342,'330','savings account transaction releaseId','SQL','V330__savings_account_transaction_releaseId.sql',-825985219,'root','2018-01-26 06:59:46',76,1),(346,343,'331','holiday schema changes','SQL','V331__holiday_schema_changes.sql',-670966696,'root','2018-01-26 06:59:47',22,1),(347,344,'332','self service registration schema','SQL','V332__self_service_registration_schema.sql',-1798039801,'root','2018-01-26 06:59:47',11,1),(348,350,'333','adhocquery','SQL','V333__adhocquery.sql',689666282,'root','2018-02-18 11:56:31',406,1),(349,346,'334','client age','SQL','V334__client_age.sql',1306071247,'root','2018-02-15 05:53:18',2798,1),(350,351,'335','self service user role','SQL','V335__self_service_user_role.sql',1557583536,'root','2018-02-18 11:56:31',78,1),(351,352,'336','sms campaign notification','SQL','V336__sms_campaign_notification.sql',82407813,'root','2018-02-18 11:56:34',2110,1),(352,353,'337','equal amortization','SQL','V337__equal_amortization.sql',-786474615,'root','2018-02-18 11:56:36',2064,1),(353,354,'338','two factor authentication','SQL','V338__two_factor_authentication.sql',684696029,'root','2018-02-18 11:56:37',1063,1),(354,355,'339','report-run-frequency','SQL','V339__report-run-frequency.sql',-1943782342,'root','2018-02-18 11:56:40',2686,1),(34,34,'34','add unique check on stretchy report parameter','SQL','V34__add_unique_check_on_stretchy_report_parameter.sql',-174129685,'root','2018-01-26 06:59:22',15,1),(355,356,'340','nullable-adhoc-email','SQL','V340__nullable-adhoc-email.sql',-767526598,'root','2018-02-18 11:56:41',937,1),(356,357,'341','m import document','SQL','V341__m_import_document.sql',1614348901,'root','2018-02-18 11:56:42',656,1),(357,358,'342','topic module table','SQL','V342__topic_module_table.sql',55644581,'root','2018-02-18 11:56:44',1672,1),(35,35,'35','add hierarchy column for acc gl account','SQL','V35__add_hierarchy_column_for_acc_gl_account.sql',1606939439,'root','2018-01-26 06:59:22',29,1),(36,36,'36','add tag id column for acc gl account','SQL','V36__add_tag_id_column_for_acc_gl_account.sql',-1913861595,'root','2018-01-26 06:59:22',37,1),(37,37,'37','add-center-group-collection-sheet-permissions','SQL','V37__add-center-group-collection-sheet-permissions.sql',-1387816026,'root','2018-01-26 06:59:22',9,1),(38,38,'38','add-group-summary-details-report','SQL','V38__add-group-summary-details-report.sql',-734381577,'root','2018-01-26 06:59:22',4,1),(39,39,'39','payment-channels-updates','SQL','V39__payment-channels-updates.sql',-1060218860,'root','2018-01-26 06:59:22',79,1),(4,4,'4','mifosx-core-reports-utf8','SQL','V4__mifosx-core-reports-utf8.sql',1938269916,'root','2018-01-26 06:59:18',148,1),(40,40,'40','add permissions for accounting rule','SQL','V40__add_permissions_for_accounting_rule.sql',-116179709,'root','2018-01-26 06:59:22',4,1),(41,41,'41','group-summary-reports','SQL','V41__group-summary-reports.sql',-772715166,'root','2018-01-26 06:59:22',11,1),(42,42,'42','Add default value for id for acc accounting rule','SQL','V42__Add_default_value_for_id_for_acc_accounting_rule.sql',604918027,'root','2018-01-26 06:59:22',38,1),(43,43,'43','accounting-for-savings','SQL','V43__accounting-for-savings.sql',-1500414425,'root','2018-01-26 06:59:22',58,1),(44,44,'44','document-increase-size-of-column-type','SQL','V44__document-increase-size-of-column-type.sql',-1050476515,'root','2018-01-26 06:59:22',19,1),(45,45,'45','create acc rule tags table','SQL','V45__create_acc_rule_tags_table.sql',1162013385,'root','2018-01-26 06:59:22',19,1),(46,46,'46','extend datatables api','SQL','V46__extend_datatables_api.sql',1411386919,'root','2018-01-26 06:59:23',7,1),(47,47,'47','staff-hierarchy-link-to-users','SQL','V47__staff-hierarchy-link-to-users.sql',1889695678,'root','2018-01-26 06:59:23',103,1),(48,48,'48','adding-S3-Support','SQL','V48__adding-S3-Support.sql',1203678485,'root','2018-01-26 06:59:23',127,1),(49,49,'49','track-loan-charge-payment-transactions','SQL','V49__track-loan-charge-payment-transactions.sql',545881620,'root','2018-01-26 06:59:23',17,1),(5,5,'5','update-savings-product-and-account-tables','SQL','V5__update-savings-product-and-account-tables.sql',-1335665240,'root','2018-01-26 06:59:19',94,1),(50,50,'50','add-grace-settings-to-loan-product','SQL','V50__add-grace-settings-to-loan-product.sql',781542044,'root','2018-01-26 06:59:23',154,1),(358,345,'5000','Daily Teller Cash Report pentaho','SQL','V5000__Daily_Teller_Cash_Report_pentaho.sql',-638871297,'root','2018-01-26 06:59:47',11,1),(51,51,'51','track-additional-details-related-to-installment-performance','SQL','V51__track-additional-details-related-to-installment-performance.sql',1877290988,'root','2018-01-26 06:59:23',54,1),(52,52,'52','add boolean support cols to acc accounting rule','SQL','V52__add_boolean_support_cols_to_acc_accounting_rule.sql',-1027998479,'root','2018-01-26 06:59:23',65,1),(53,53,'53','track-advance-and-late-payments-on-installment','SQL','V53__track-advance-and-late-payments-on-installment.sql',1329153113,'root','2018-01-26 06:59:23',31,1),(54,54,'54','charge-to-income-account-mappings','SQL','V54__charge-to-income-account-mappings.sql',-407918884,'root','2018-01-26 06:59:24',32,1),(55,55,'55','add-additional-transaction-processing-strategies','SQL','V55__add-additional-transaction-processing-strategies.sql',431870896,'root','2018-01-26 06:59:24',35,1),(56,56,'56','track-overpaid-amount-on-loans','SQL','V56__track-overpaid-amount-on-loans.sql',-1032410124,'root','2018-01-26 06:59:24',95,1),(57,57,'57','add default values to debit and credit accounts acc accounting rule','SQL','V57__add_default_values_to_debit_and_credit_accounts_acc_accounting_rule.sql',235706681,'root','2018-01-26 06:59:24',39,1),(58,58,'58','create-holiday-tables changed','SQL','V58__create-holiday-tables_changed.sql',1656341096,'root','2018-01-26 06:59:24',30,1),(59,59,'59','add group roles schema and permissions','SQL','V59__add_group_roles_schema_and_permissions.sql',755577759,'root','2018-01-26 06:59:24',22,1),(6,6,'6','add min max principal column to loan','SQL','V6__add_min_max_principal_column_to_loan.sql',1691311198,'root','2018-01-26 06:59:19',142,1),(60,60,'60','quipo dashboard reports','SQL','V60__quipo_dashboard_reports.sql',1200522596,'root','2018-01-26 06:59:24',52,1),(61,61,'61','txn running balance example','SQL','V61__txn_running_balance_example.sql',1448824868,'root','2018-01-26 06:59:24',9,1),(62,62,'62','add staff id to m client changed','SQL','V62__add_staff_id_to_m_client_changed.sql',1876751638,'root','2018-01-26 06:59:24',41,1),(63,63,'63','add sync disbursement with meeting column to loan','SQL','V63__add_sync_disbursement_with_meeting_column_to_loan.sql',-668764096,'root','2018-01-26 06:59:24',90,1),(64,64,'64','add permission for assign staff','SQL','V64__add_permission_for_assign_staff.sql',-1177097659,'root','2018-01-26 06:59:24',4,1),(65,65,'65','fix rupee symbol issues','SQL','V65__fix_rupee_symbol_issues.sql',-1194106354,'root','2018-01-26 06:59:24',5,1),(66,66,'66','client close functionality','SQL','V66__client_close_functionality.sql',-1362214442,'root','2018-01-26 06:59:24',46,1),(67,67,'67','loans in advance table','SQL','V67__loans_in_advance_table.sql',29130560,'root','2018-01-26 06:59:25',10,1),(68,68,'68','quipo dashboard reports updated','SQL','V68__quipo_dashboard_reports_updated.sql',-1865417462,'root','2018-01-26 06:59:25',25,1),(69,69,'69','loans in advance initialise','SQL','V69__loans_in_advance_initialise.sql',1132804183,'root','2018-01-26 06:59:25',13,1),(7,7,'7','remove read makerchecker permission','SQL','V7__remove_read_makerchecker_permission.sql',-2078415771,'root','2018-01-26 06:59:19',4,1),(70,70,'70','quipo program detail query fix','SQL','V70__quipo_program_detail_query_fix.sql',-1314752325,'root','2018-01-26 06:59:25',4,1),(71,71,'71','insert reschedule repayment to configuration','SQL','V71__insert_reschedule_repayment_to_configuration.sql',-1744995263,'root','2018-01-26 06:59:25',3,1),(72,72,'72','add m loan counter changes','SQL','V72__add_m_loan_counter_changes.sql',1657331766,'root','2018-01-26 06:59:25',60,1),(73,73,'73','add repayments rescheduled to and processed column to holiday','SQL','V73__add_repayments_rescheduled_to_and_processed_column_to_holiday.sql',1126478114,'root','2018-01-26 06:59:25',26,1),(74,74,'74','alter m loan counter table add group','SQL','V74__alter_m_loan_counter_table_add_group.sql',-1934237868,'root','2018-01-26 06:59:25',83,1),(75,75,'75','add reschedule-repayments-on-holidays to configuration','SQL','V75__add_reschedule-repayments-on-holidays_to_configuration.sql',-1278134204,'root','2018-01-26 06:59:25',3,1),(76,76,'76','rename permission grouping','SQL','V76__rename_permission_grouping.sql',-1636539309,'root','2018-01-26 06:59:25',5,1),(77,77,'77','alter m product loan changes','SQL','V77__alter_m_product_loan_changes.sql',1835358988,'root','2018-01-26 06:59:25',35,1),(78,78,'78','breakdown portfolio grouping','SQL','V78__breakdown_portfolio_grouping.sql',-198729568,'root','2018-01-26 06:59:25',3,1),(79,79,'79','schedule jobs tables','SQL','V79__schedule_jobs_tables.sql',312120211,'root','2018-01-26 06:59:25',27,1),(8,8,'8','deposit-transaction-permissions-if-they-exist','SQL','V8__deposit-transaction-permissions-if-they-exist.sql',1801801284,'root','2018-01-26 06:59:19',1,1),(80,80,'80','schedule jobs tables updates','SQL','V80__schedule_jobs_tables_updates.sql',-748120531,'root','2018-01-26 06:59:25',70,1),(81,81,'81','savings related changes','SQL','V81__savings_related_changes.sql',-888957999,'root','2018-01-26 06:59:26',206,1),(82,82,'82','schedule jobs tables updates for running status','SQL','V82__schedule_jobs_tables_updates_for_running_status.sql',229481826,'root','2018-01-26 06:59:26',47,1),(83,83,'83','non-working-days-table','SQL','V83__non-working-days-table.sql',1881541622,'root','2018-01-26 06:59:26',13,1),(84,84,'84','undo savings transaction permission','SQL','V84__undo_savings_transaction_permission.sql',-1779650707,'root','2018-01-26 06:59:26',5,1),(85,85,'85','product mix related changes','SQL','V85__product_mix_related_changes.sql',-1468649166,'root','2018-01-26 06:59:26',77,1),(86,86,'86','update-working-days','SQL','V86__update-working-days.sql',-1140835665,'root','2018-01-26 06:59:26',13,1),(87,87,'87','add permission for scheduler','SQL','V87__add_permission_for_scheduler.sql',1996443143,'root','2018-01-26 06:59:26',3,1),(88,88,'88','added update constrain for scheduler jobs','SQL','V88__added_update_constrain_for_scheduler_jobs.sql',777067784,'root','2018-01-26 06:59:26',22,1),(89,89,'89','added scheduler group','SQL','V89__added_scheduler_group.sql',-2129901927,'root','2018-01-26 06:59:26',18,1),(9,9,'9','add min max constraint column to loan loanproduct','SQL','V9__add_min_max_constraint_column_to_loan_loanproduct.sql',-518699440,'root','2018-01-26 06:59:19',271,1),(90,90,'90','client performance history reports','SQL','V90__client_performance_history_reports.sql',-140192401,'root','2018-01-26 06:59:26',5,1),(91,91,'91','apply annual fees permission','SQL','V91__apply_annual_fees_permission.sql',923770634,'root','2018-01-26 06:59:26',3,1),(92,92,'91.1','configuration settings for holiday and non workingday','SQL','V91_1__configuration_settings_for_holiday_and_non_workingday.sql',-308211608,'root','2018-01-26 06:59:26',4,1),(93,93,'92','group center assign staff permission','SQL','V92__group_center_assign_staff_permission.sql',-1774462272,'root','2018-01-26 06:59:26',3,1),(94,94,'93','loan transaction external id','SQL','V93__loan_transaction_external_id.sql',1057431340,'root','2018-01-26 06:59:26',32,1),(95,95,'94','added savings accont type','SQL','V94__added_savings_accont type.sql',652367910,'root','2018-01-26 06:59:26',44,1),(96,96,'95','batch job postInterest','SQL','V95__batch_job_postInterest.sql',597753088,'root','2018-01-26 06:59:26',4,1),(97,97,'96','savings accounts transfers table','SQL','V96__savings_accounts_transfers_table.sql',695072575,'root','2018-01-26 06:59:26',32,1),(98,98,'97','add permission for adjust savings transaction','SQL','V97__add_permission_for_adjust_savings_transaction.sql',103624768,'root','2018-01-26 06:59:26',3,1),(99,99,'98','added currency roundof for multipleof','SQL','V98__added_currency_roundof_for_multipleof.sql',-2113842963,'root','2018-01-26 06:59:27',237,1);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_campaign`
--

DROP TABLE IF EXISTS `sms_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_campaign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(100) NOT NULL,
  `campaign_type` int(11) NOT NULL,
  `campaign_trigger_type` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `param_value` text,
  `status_enum` int(11) NOT NULL,
  `message` text NOT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `next_trigger_date` datetime DEFAULT NULL,
  `last_trigger_date` datetime DEFAULT NULL,
  `recurrence_start_date` datetime DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `is_notification` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `sms_campaign_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `stretchy_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_campaign`
--

LOCK TABLES `sms_campaign` WRITE;
/*!40000 ALTER TABLE `sms_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_messages_outbound`
--

DROP TABLE IF EXISTS `sms_messages_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_messages_outbound` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `status_enum` int(5) NOT NULL DEFAULT '100',
  `mobile_no` varchar(50) DEFAULT NULL,
  `message` varchar(1000) NOT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `delivered_on_date` datetime DEFAULT NULL,
  `is_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKGROUP000000001` (`group_id`),
  KEY `FKCLIENT00000001` (`client_id`),
  KEY `FKSTAFF000000001` (`staff_id`),
  KEY `FKCAMPAIGN00000001` (`campaign_id`),
  CONSTRAINT `FKCAMPAIGN00000001` FOREIGN KEY (`campaign_id`) REFERENCES `sms_campaign` (`id`),
  CONSTRAINT `FKCLIENT00000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  CONSTRAINT `FKGROUP000000001` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  CONSTRAINT `FKSTAFF000000001` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_messages_outbound`
--

LOCK TABLES `sms_messages_outbound` WRITE;
/*!40000 ALTER TABLE `sms_messages_outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_messages_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_parameter`
--

DROP TABLE IF EXISTS `stretchy_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(45) NOT NULL,
  `parameter_variable` varchar(45) DEFAULT NULL,
  `parameter_label` varchar(45) NOT NULL,
  `parameter_displayType` varchar(45) NOT NULL,
  `parameter_FormatType` varchar(10) NOT NULL,
  `parameter_default` varchar(45) NOT NULL,
  `special` varchar(1) DEFAULT NULL,
  `selectOne` varchar(1) DEFAULT NULL,
  `selectAll` varchar(1) DEFAULT NULL,
  `parameter_sql` text,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`parameter_name`),
  KEY `fk_stretchy_parameter_001_idx` (`parent_id`),
  CONSTRAINT `fk_stretchy_parameter_001` FOREIGN KEY (`parent_id`) REFERENCES `stretchy_parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_parameter`
--

LOCK TABLES `stretchy_parameter` WRITE;
/*!40000 ALTER TABLE `stretchy_parameter` DISABLE KEYS */;
INSERT INTO `stretchy_parameter` VALUES (1,'startDateSelect','startDate','startDate','date','date','today',NULL,NULL,NULL,NULL,NULL),(2,'endDateSelect','endDate','endDate','date','date','today',NULL,NULL,NULL,NULL,NULL),(3,'obligDateTypeSelect','obligDateType','obligDateType','select','number','0',NULL,NULL,NULL,'select * from\r\n(select 1 as id, \"Closed\" as `name` union all\r\nselect 2, \"Disbursal\" ) x\r\norder by x.`id`',NULL),(5,'OfficeIdSelectOne','officeId','Office','select','number','0',NULL,'Y',NULL,'select id, \r\nconcat(substring(\"........................................\", 1, \r\n   \n\n((LENGTH(`hierarchy`) - LENGTH(REPLACE(`hierarchy`, \'.\', \'\')) - 1) * 4)), \r\n   `name`) as tc\r\nfrom m_office\r\nwhere hierarchy like concat\n\n(\'${currentUserHierarchy}\', \'%\')\r\norder by hierarchy',NULL),(6,'loanOfficerIdSelectAll','loanOfficerId','Loan Officer','select','number','0',NULL,NULL,'Y','(select lo.id, lo.display_name as `Name` \r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\njoin m_staff lo on lo.office_id = ounder.id\r\nwhere lo.is_loan_officer = true\r\nand o.id = ${officeId})\r\nunion all\r\n(select -10, \'-\')\r\norder by 2',5),(10,'currencyIdSelectAll','currencyId','Currency','select','number','0',NULL,NULL,'Y','select `code`, `name`\r\nfrom m_organisation_currency\r\norder by `code`',NULL),(20,'fundIdSelectAll','fundId','Fund','select','number','0',NULL,NULL,'Y','(select id, `name`\r\nfrom m_fund)\r\nunion all\r\n(select -10, \'-\')\r\norder by 2',NULL),(25,'loanProductIdSelectAll','loanProductId','Product','select','number','0',NULL,NULL,'Y','select p.id, p.`name`\r\nfrom m_product_loan p\r\nwhere (p.currency_code = \'${currencyId}\' or \'-1\'= \'${currencyId}\')\r\norder by 2',10),(26,'loanPurposeIdSelectAll','loanPurposeId','Loan Purpose','select','number','0',NULL,NULL,'Y','select -10 as id, \'-\' as code_value\r\nunion all\r\nselect * from (select v.id, v.code_value\r\nfrom m_code c\r\njoin m_code_value v on v.code_id = c.id\r\nwhere c.code_name = \"loanPurpose\"\r\norder by v.order_position)  x',NULL),(100,'parTypeSelect','parType','parType','select','number','0',NULL,NULL,NULL,'select * from\r\n(select 1 as id, \"Principal Only\" as `name` union all\r\nselect 2, \"Principal + Interest\" union all\r\nselect 3, \"Principal + Interest + Fees\" union all\r\nselect 4, \"Principal + Interest + Fees + Penalties\") x\r\norder by x.`id`',NULL),(1001,'FullReportList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\nrp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id \n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.use_report is true\n  and exists\n  ( select \'f\'\n  from m_appuser_role ur \n  join m_role r on r.id = ur.role_id\n  join m_role_permission rp on rp.role_id = r.id\n  join m_permission p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id',NULL),(1002,'FullParameterList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select sp.parameter_name, sp.parameter_variable, sp.parameter_label, sp.parameter_displayType, \r sp.parameter_FormatType, sp.parameter_default, sp.selectOne,  sp.selectAll, spp.parameter_name as parentParameterName\r from stretchy_parameter sp\r left join stretchy_parameter spp on spp.id = sp.parent_id\r where sp.special is null\r and exists \r 	(select \'f\' \r 	from stretchy_report sr\r 	join stretchy_report_parameter srp on srp.report_id = sr.id\r 	where sr.report_name in(${reportListing})\r 	and srp.parameter_id = sp.id\r 	)\r order by sp.id',NULL),(1003,'reportCategoryList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\n  rp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id\n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.report_category = \'${reportCategory}\'\n  and r.use_report is true\n  and exists\n  (select \'f\'\n  from m_appuser_role ur \n  join m_role r on r.id = ur.role_id\n  join m_role_permission rp on rp.role_id = r.id\n  join m_permission p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id',NULL),(1004,'selectAccount','accountNo','Enter Account No','text','string','n/a',NULL,NULL,NULL,NULL,NULL),(1005,'savingsProductIdSelectAll','savingsProductId','Product','select','number','0',NULL,NULL,'Y','select p.id, p.`name`\r\nfrom m_savings_product p\r\norder by 2',NULL),(1006,'transactionId','transactionId','transactionId','text','string','n/a',NULL,NULL,NULL,NULL,NULL),(1007,'selectCenterId','centerId','Enter Center Id','text','string','n/a',NULL,NULL,NULL,NULL,NULL),(1008,'SelectGLAccountNO','GLAccountNO','GLAccountNO','select','number','0',NULL,NULL,NULL,'select id aid,name aname\r\nfrom acc_gl_account',NULL),(1009,'asOnDate','asOn','As On','date','date','today',NULL,NULL,NULL,NULL,NULL),(1010,'SavingsAccountSubStatus','subStatus','SavingsAccountDormancyStatus','select','number','100',NULL,NULL,NULL,'select * from\r\n(select 100 as id, \"Inactive\" as name  union all\r\nselect 200 as id, \"Dormant\" as  name union all \r\nselect 300 as id, \"Escheat\" as name) x\r\norder by x.`id`',NULL),(1011,'cycleXSelect','cycleX','Cycle X Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1012,'cycleYSelect','cycleY','Cycle Y Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1013,'fromXSelect','fromX','From X Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1014,'toYSelect','toY','To Y Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1015,'overdueXSelect','overdueX','Overdue X Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1016,'overdueYSelect','overdueY','Overdue Y Number','text','number','n/a',NULL,NULL,NULL,NULL,NULL),(1017,'DefaultLoan','loanId','Loan','none','number','-1',NULL,NULL,'Y','select ml.id \nfrom m_loan ml \nleft join m_client mc on mc.id = ml.client_id \nleft join m_office mo on mo.id = mc.office_id \nwhere mo.id = ${officeId} or ${officeId} = -1',5),(1018,'DefaultClient','clientId','Client','none','number','-1',NULL,NULL,'Y','select mc.id \nfrom m_client mc\n left join m_office on mc.office_id = mo.id\n where mo.id = ${officeId} or ${officeId} = -1',5),(1019,'DefaultGroup','groupId','Group','none','number','-1',NULL,NULL,'Y','select mg.id \nfrom m_group mg\nleft join m_office mo on mg.office_id = mo.id\nwhere mo.id = ${officeId} or ${officeId} = -1',5),(1020,'SelectLoanType','loanType','Loan Type','select','number','-1',NULL,NULL,'Y','select\nenum_id as id,\nenum_value as value\nfrom r_enum_value\nwhere enum_name = \'loan_type_enum\'',NULL),(1021,'DefaultSavings','savingsId','Savings','none','number','-1',NULL,NULL,'Y',NULL,5),(1022,'DefaultSavingsTransactionId','savingsTransactionId','Savings Transaction','none','number','-1',NULL,NULL,'Y',NULL,5),(1023,'tellerIdSelectOne','tellerId','Teller','select','number','0',NULL,'Y','N','select id, name from m_tellers where office_id = ${officeId}',5),(1024,'cashierIdSelectOne','cashierId','Cashier','select','number','0',NULL,'Y','N','select c.id, s.display_name from m_cashiers as c left join m_staff as s on c.staff_id = s.id where c.teller_id = ${tellerId}',1023),(1025,'currencyCodeSelectOne','currencyCode','Currency','select','string','0',NULL,'Y','N','select `code`, `name` from m_organisation_currency order by `code`',NULL);
/*!40000 ALTER TABLE `stretchy_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_report`
--

DROP TABLE IF EXISTS `stretchy_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `report_subtype` varchar(20) DEFAULT NULL,
  `report_category` varchar(45) DEFAULT NULL,
  `report_sql` text,
  `description` text,
  `core_report` tinyint(1) DEFAULT '0',
  `use_report` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_name_UNIQUE` (`report_name`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_report`
--

LOCK TABLES `stretchy_report` WRITE;
/*!40000 ALTER TABLE `stretchy_report` DISABLE KEYS */;
INSERT INTO `stretchy_report` VALUES (1,'Client Listing','Table',NULL,'Client','select\nconcat(repeat(\"..\",\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\n c.account_no as \"Client Account No.\",\nc.display_name as \"Name\",\nr.enum_message_property as \"Status\",\nc.activation_date as \"Activation\", c.external_id as \"External Id\"\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\nleft join r_enum_value r on r.enum_name = \'status_enum\' and r.enum_id = c.status_enum\nwhere o.id = ${officeId}\norder by ounder.hierarchy, c.account_no','Individual Client Report\r\n\r\nLists the small number of defined fields on the client table.  Would expect to copy this \n\nreport and add any \'one to one\' additional data for specific tenant needs.\r\n\r\nCan be run for any size MFI but you\'d expect it only to be run within a branch for \n\nlarger ones.  Depending on how many columns are displayed, there is probably is a limit of about 20/50k clients returned for html display (export to excel doesn\'t \n\nhave that client browser/memory impact).',1,1),(2,'Client Loans Listing','Table',NULL,'Client','select\nconcat(repeat(\"..\",\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\", c.account_no as \"Client Account No.\",\nc.display_name as \"Name\",\nr.enum_message_property as \"Client Status\",\nlo.display_name as \"Loan Officer\", l.account_no as \"Loan Account No.\", l.external_id as \"External Id\", p.name as Loan, st.enum_message_property as \"Status\",\nf.`name` as Fund, purp.code_value as \"Loan Purpose\",\nifnull(cur.display_symbol, l.currency_code) as Currency,\nl.principal_amount, l.arrearstolerance_amount as \"Arrears Tolerance Amount\",\nl.number_of_repayments as \"Expected No. Repayments\",\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\",\nl.nominal_interest_rate_per_period as \"Nominal Interest Rate Per Period\",\nipf.enum_message_property as \"Interest Rate Frequency\",\nim.enum_message_property as \"Interest Method\",\nicp.enum_message_property as \"Interest Calculated in Period\",\nl.term_frequency as \"Term Frequency\",\ntf.enum_message_property as \"Term Frequency Period\",\nl.repay_every as \"Repayment Frequency\",\nrf.enum_message_property as \"Repayment Frequency Period\",\nam.enum_message_property as \"Amortization\",\nl.total_charges_due_at_disbursement_derived as \"Total Charges Due At Disbursement\",\ndate(l.submittedon_date) as Submitted, date(l.approvedon_date) Approved, l.expected_disbursedon_date As \"Expected Disbursal\",\ndate(l.expected_firstrepaymenton_date) as \"Expected First Repayment\",\ndate(l.interest_calculated_from_date) as \"Interest Calculated From\" ,\ndate(l.disbursedon_date) as Disbursed,\ndate(l.expected_maturedon_date) \"Expected Maturity\",\ndate(l.maturedon_date) as \"Matured On\", date(l.closedon_date) as Closed,\ndate(l.rejectedon_date) as Rejected, date(l.rescheduledon_date) as Rescheduled,\ndate(l.withdrawnon_date) as Withdrawn, date(l.writtenoffon_date) \"Written Off\"\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\nleft join r_enum_value r on r.enum_name = \'status_enum\'\n and r.enum_id = c.status_enum\nleft join m_loan l on l.client_id = c.id\nleft join m_staff lo on lo.id = l.loan_officer_id\nleft join m_product_loan p on p.id = l.product_id\nleft join m_fund f on f.id = l.fund_id\nleft join r_enum_value st on st.enum_name = \"loan_status_id\" and st.enum_id = l.loan_status_id\nleft join r_enum_value ipf on ipf.enum_name = \"interest_period_frequency_enum\"\n and ipf.enum_id = l.interest_period_frequency_enum\nleft join r_enum_value im on im.enum_name = \"interest_method_enum\"\n and im.enum_id = l.interest_method_enum\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\"\n and tf.enum_id = l.term_period_frequency_enum\nleft join r_enum_value icp on icp.enum_name = \"interest_calculated_in_period_enum\"\n and icp.enum_id = l.interest_calculated_in_period_enum\nleft join r_enum_value rf on rf.enum_name = \"repayment_period_frequency_enum\"\n and rf.enum_id = l.repayment_period_frequency_enum\nleft join r_enum_value am on am.enum_name = \"amortization_method_enum\"\n and am.enum_id = l.amortization_method_enum\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\nleft join m_currency cur on cur.code = l.currency_code\nwhere o.id = ${officeId}\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\norder by ounder.hierarchy, 2 , l.id','Individual Client Report\r\n\r\nPretty \n\nwide report that lists the basic details of client loans.  \r\n\r\nCan be run for any size MFI but you\'d expect it only to be run within a branch for larger ones.  \n\nThere is probably is a limit of about 20/50k clients returned for html display (export to excel doesn\'t have that client browser/memory impact).',1,1),(5,'Loans Awaiting Disbursal','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nc.account_no as \"Client Account No\", c.display_name as \"Name\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund, ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nl.principal_amount as Principal,  \r\nl.term_frequency as \"Term Frequency\",\n\n\r\ntf.enum_message_property as \"Term Frequency Period\",\r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\",\r\ndate(l.approvedon_date) \"Approved\",\r\ndatediff(l.expected_disbursedon_date, curdate()) as \"Days to Disbursal\",\r\ndate(l.expected_disbursedon_date) \"Expected Disbursal\",\r\npurp.code_value as \"Loan Purpose\",\r\n lo.display_name as \"Loan Officer\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\" and tf.enum_id = l.term_period_frequency_enum\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\norder by ounder.hierarchy, datediff(l.expected_disbursedon_date, curdate()),  c.account_no','Individual Client Report',1,1),(6,'Loans Awaiting Disbursal Summary','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\npl.`name` as \"Product\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  f.`name` as Fund,\r\nsum(l.principal_amount) as Principal\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\ngroup by ounder.hierarchy, pl.`name`, l.currency_code,  f.`name`\r\norder by ounder.hierarchy, pl.`name`, l.currency_code,  f.`name`','Individual Client Report',1,1),(7,'Loans Awaiting Disbursal Summary by Month','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\npl.`name` as \"Product\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nyear(l.expected_disbursedon_date) as \"Year\", \r\nmonthname(l.expected_disbursedon_date) as \"Month\",\r\nsum(l.principal_amount) as Principal\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\ngroup by ounder.hierarchy, pl.`name`, l.currency_code, year(l.expected_disbursedon_date), month(l.expected_disbursedon_date)\r\norder by ounder.hierarchy, pl.`name`, l.currency_code, year(l.expected_disbursedon_date), month(l.expected_disbursedon_date)','Individual Client Report',1,1),(8,'Loans Pending Approval','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nc.account_no as \"Client Account No.\", c.display_name as \"Client Name\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  pl.`name` as \"Product\", \r\nl.account_no as \"Loan Account No.\", \r\nl.principal_amount as \"Loan Amount\", \r\nl.term_frequency as \"Term Frequency\",\n\n\r\ntf.enum_message_property as \"Term Frequency Period\",\r\nl.annual_nominal_interest_rate as \" Annual \n\nNominal Interest Rate\", \r\ndatediff(curdate(), l.submittedon_date) \"Days Pending Approval\", \r\npurp.code_value as \"Loan Purpose\",\r\nlo.display_name as \"Loan Officer\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\" and tf.enum_id = l.term_period_frequency_enum\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 100 /*Submitted and awaiting approval */\r\norder by ounder.hierarchy, l.submittedon_date,  l.account_no','Individual Client Report',1,1),(11,'Active Loans - Summary','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. loans_in_arrears_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select ounder.id as branch,\r\nifnull(cur.display_symbol, l.currency_code) as currency,\r\ncount(distinct(c.id)) as client_count, \r\ncount(distinct(l.id)) as  active_loan_count,\r\ncount(distinct(if(laa.loan_id is not null,  l.id, null)  )) as loans_in_arrears_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(laa.principal_overdue_derived) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(laa.interest_overdue_derived) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(laa.fee_charges_overdue_derived) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(laa.penalty_charges_overdue_derived) as penalties_overdue\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nleft join m_currency cur on cur.code = l.currency_code\r\n\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency',NULL,1,1),(12,'Active Loans - Details','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", \r\nc.display_name as \"Client\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\ndate(l.expected_maturedon_date) as \"Expected Matured On\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\npenalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no','Individual Client \n\nReport',1,1),(13,'Obligation Met Loans Details','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nc.account_no as \"Client Account No.\", c.display_name as \"Client\",\r\nl.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.total_repayment_derived  as \"Total Repaid\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", \r\ndate(l.closedon_date) as \"Closed\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nlo.display_name as \"Loan Officer\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand (case\r\n	when ${obligDateType} = 1 then\r\n    l.closedon_date between \'${startDate}\' and \'${endDate}\'\r\n	when ${obligDateType} = 2 then\r\n    l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\n	else 1 = 1\r\n	end)\r\nand l.loan_status_id = 600\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no','Individual Client \n\nReport',1,1),(14,'Obligation Met Loans Summary','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\ncount(distinct(c.id)) as \"No. of Clients\",\r\ncount(distinct(l.id)) as \"No. of Loans\",\r\nsum(l.principal_amount) as \"Total Loan Amount\", \r\nsum(l.principal_repaid_derived) as \"Total Principal Repaid\",\r\nsum(l.interest_repaid_derived) as \"Total Interest Repaid\",\r\nsum(l.fee_charges_repaid_derived) as \"Total Fees Repaid\",\r\nsum(l.penalty_charges_repaid_derived) as \"Total Penalties Repaid\",\r\nsum(l.interest_waived_derived) as \"Total Interest Waived\",\r\nsum(l.fee_charges_waived_derived) as \"Total Fees Waived\",\r\nsum(l.penalty_charges_waived_derived) as \"Total Penalties Waived\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand (case\r\n	when ${obligDateType} = 1 then\r\n    l.closedon_date between \'${startDate}\' and \'${endDate}\'\r\n	when ${obligDateType} = 2 then\r\n    l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\n	else 1 = 1\r\n	end)\r\nand l.loan_status_id = 600\r\ngroup by ounder.hierarchy, l.currency_code\r\norder by ounder.hierarchy, l.currency_code','Individual Client \n\nReport',1,1),(15,'Portfolio at Risk','Table',NULL,'Loan','select x.Currency, x.`Principal Outstanding`, x.`Principal Overdue`, x.`Interest Outstanding`, x.`Interest Overdue`, \r\nx.`Fees Outstanding`, x.`Fees Overdue`, x.`Penalties Outstanding`, x.`Penalties Overdue`,\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.`Principal Overdue` * 100) / x.`Principal Outstanding`, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding`), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding`), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue` + x.`Penalties Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding` + x.`Penalties Overdue`), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from \r\n(select  ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nsum(l.principal_outstanding_derived) as \"Principal Outstanding\",\r\nsum(laa.principal_overdue_derived) as \"Principal Overdue\",\r\n\r\nsum(l.interest_outstanding_derived) as \"Interest Outstanding\",\r\nsum(laa.interest_overdue_derived) as \"Interest Overdue\",\r\n\r\nsum(l.fee_charges_outstanding_derived)  as \"Fees Outstanding\",\r\nsum(laa.fee_charges_overdue_derived) as \"Fees Overdue\",\r\n\r\nsum(penalty_charges_outstanding_derived) as \"Penalties Outstanding\",\r\nsum(laa.penalty_charges_overdue_derived) as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin  m_loan l on l.client_id = c.id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join m_product_loan p on p.id = l.product_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by l.currency_code\r\norder by l.currency_code) x','Covers all loans.\r\n\r\nFor larger MFIs … we should add some derived fields on loan (or a 1:1 loan related table like mifos 2.x does)\r\nPrinciple, Interest, Fees, Penalties Outstanding and Overdue (possibly waived and written off too)',1,1),(16,'Portfolio at Risk by Branch','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\",\r\nx.Currency, x.`Principal Outstanding`, x.`Principal Overdue`, x.`Interest Outstanding`, x.`Interest Overdue`, \r\nx.`Fees Outstanding`, x.`Fees Overdue`, x.`Penalties Outstanding`, x.`Penalties Overdue`,\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.`Principal Overdue` * 100) / x.`Principal Outstanding`, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding`), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding`), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue` + x.`Penalties Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding` + x.`Penalties Overdue`), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select  ounder.id as \"branch\", ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\n\r\nsum(l.principal_outstanding_derived) as \"Principal Outstanding\",\r\nsum(laa.principal_overdue_derived) as \"Principal Overdue\",\r\n\r\nsum(l.interest_outstanding_derived) as \"Interest Outstanding\",\r\nsum(laa.interest_overdue_derived) as \"Interest Overdue\",\r\n\r\nsum(l.fee_charges_outstanding_derived)  as \"Fees Outstanding\",\r\nsum(laa.fee_charges_overdue_derived) as \"Fees Overdue\",\r\n\r\nsum(penalty_charges_outstanding_derived) as \"Penalties Outstanding\",\r\nsum(laa.penalty_charges_overdue_derived) as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin  m_loan l on l.client_id = c.id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join m_product_loan p on p.id = l.product_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency','Covers all loans.\r\n\r\nFor larger MFIs … we should add some derived fields on loan (or a 1:1 loan related table like mifos 2.x does)\r\nPrinciple, Interest, Fees, Penalties Outstanding and Overdue (possibly waived and written off too)',1,1),(20,'Funds Disbursed Between Dates Summary','Table',NULL,'Fund','select ifnull(f.`name`, \'-\') as Fund,  ifnull(cur.display_symbol, l.currency_code) as Currency, \r\nround(sum(l.principal_amount), 4) as disbursed_amount\r\nfrom m_office ounder \r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_currency cur on cur.`code` = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (l.currency_code = \'${currencyId}\' or \'-1\' = \'${currencyId}\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\ngroup by ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)\r\norder by ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)',NULL,1,1),(21,'Funds Disbursed Between Dates Summary by Office','Table',NULL,'Fund','select \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\n \n\nifnull(f.`name`, \'-\') as Fund,  ifnull(cur.display_symbol, l.currency_code) as Currency, round(sum(l.principal_amount), 4) as disbursed_amount\r\nfrom m_office o\r\n\n\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c \n\non c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_currency cur on cur.`code` = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\n\n\nwhere disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand o.id = ${officeId}\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand \n\n(l.currency_code = \'${currencyId}\' or \'-1\' = \'${currencyId}\')\r\ngroup by ounder.`name`,  ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, \n\nl.currency_code)\r\norder by ounder.`name`,  ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)',NULL,1,1),(48,'Balance Sheet','Pentaho',NULL,'Accounting',NULL,'Balance Sheet',1,1),(49,'Income Statement','Pentaho',NULL,'Accounting',NULL,'Profit and Loss Statement',1,1),(50,'Trial Balance','Pentaho',NULL,'Accounting',NULL,'Trial Balance Report',1,1),(51,'Written-Off Loans','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nc.account_no as \"Client Account No.\",\r\nc.display_name AS \'Client Name\',\r\nml.account_no AS \'Loan Account No.\',\r\nmpl.name AS \'Product Name\',\r\nml.disbursedon_date AS \'Disbursed Date\',\r\nlt.transaction_date AS \'Written Off date\',\r\nml.principal_amount as \"Loan Amount\",\r\nifnull(lt.principal_portion_derived, 0) AS \'Written-Off Principal\',\r\nifnull(lt.interest_portion_derived, 0) AS \'Written-Off Interest\',\r\nifnull(lt.fee_charges_portion_derived,0) AS \'Written-Off Fees\',\r\nifnull(lt.penalty_charges_portion_derived,0) AS \'Written-Off Penalties\',\r\nn.note AS \'Reason For Write-Off\',\r\nIFNULL(ms.display_name,\'-\') AS \'Loan Officer Name\'\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan ml ON ml.client_id = c.id\r\nJOIN m_product_loan mpl ON mpl.id=ml.product_id\r\nLEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\nJOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nLEFT JOIN m_note n ON n.loan_transaction_id = lt.id\r\nLEFT JOIN m_currency cur on cur.code = ml.currency_code\r\nWHERE lt.transaction_type_enum = 6 /*write-off */\r\nAND lt.is_reversed is false \r\nAND ml.loan_status_id=601\r\nAND o.id=${officeId}\r\nAND (mpl.id=${loanProductId} OR ${loanProductId}=-1)\r\nAND lt.transaction_date BETWEEN \'${startDate}\' AND \'${endDate}\'\r\nAND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\") \r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no','Individual Lending Report. Written Off Loans',1,1),(52,'Aging Detail','Table',NULL,'Loan','\r\nSELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nmc.account_no as \"Client Account No.\",\r\n 	mc.display_name AS \"Client Name\",\r\n 	ml.account_no AS \"Account Number\",\r\n 	ml.principal_amount AS \"Loan Amount\",\r\n ml.principal_disbursed_derived AS \"Original Principal\",\r\n ml.interest_charged_derived AS \"Original Interest\",\r\n ml.principal_repaid_derived AS \"Principal Paid\",\r\n ml.interest_repaid_derived AS \"Interest Paid\",\r\n laa.principal_overdue_derived AS \"Principal Overdue\",\r\n laa.interest_overdue_derived AS \"Interest Overdue\",\r\nDATEDIFF(CURDATE(), laa.overdue_since_date_derived) as \"Days in Arrears\",\r\n\r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<7, \'<1\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<8, \' 1\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<15,  \'2\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<22, \' 3\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<29, \' 4\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<36, \' 5\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<43, \' 6\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<50, \' 7\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<57, \' 8\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<64, \' 9\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<71, \'10\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<78, \'11\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<85, \'12\', \'12+\')))))))))))) )AS \"Weeks In Arrears Band\",\r\n\r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<31, \'0 - 30\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<61, \'30 - 60\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<91, \'60 - 90\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<181, \'90 - 180\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<361, \'180 - 360\', \r\n				 \'> 360\'))))) AS \"Days in Arrears Band\"\r\n\r\n	FROM m_office mo \r\n    JOIN m_office ounder ON ounder.hierarchy like concat(mo.hierarchy, \'%\')\r\n	        AND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n    INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n	    INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n	    INNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\n    INNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\n    left join m_currency cur on cur.code = ml.currency_code\r\n	WHERE ml.loan_status_id=300\r\n    AND mo.id=${officeId}\r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no\r\n','Loan arrears aging (Weeks)',1,1),(53,'Aging Summary (Arrears in Weeks)','Table',NULL,'Loan','SELECT \r\n  IFNULL(periods.currencyName, periods.currency) as currency, \r\n  periods.period_no \'Weeks In Arrears (Up To)\', \r\n  IFNULL(ars.loanId, 0) \'No Of Loans\', \r\n  IFNULL(ars.principal,0.0) \'Original Principal\', \r\n  IFNULL(ars.interest,0.0) \'Original Interest\', \r\n  IFNULL(ars.prinPaid,0.0) \'Principal Paid\', \r\n  IFNULL(ars.intPaid,0.0) \'Interest Paid\', \r\n  IFNULL(ars.prinOverdue,0.0) \'Principal Overdue\', \r\n  IFNULL(ars.intOverdue,0.0)\'Interest Overdue\'\r\nFROM \r\n	/* full table of aging periods/currencies used combo to ensure each line represented */\r\n  (SELECT curs.code as currency, curs.name as currencyName, pers.* from\r\n	(SELECT \'On Schedule\' period_no,1 pid UNION\r\n		SELECT \'1\',2 UNION\r\n		SELECT \'2\',3 UNION\r\n		SELECT \'3\',4 UNION\r\n		SELECT \'4\',5 UNION\r\n		SELECT \'5\',6 UNION\r\n		SELECT \'6\',7 UNION\r\n		SELECT \'7\',8 UNION\r\n		SELECT \'8\',9 UNION\r\n		SELECT \'9\',10 UNION\r\n		SELECT \'10\',11 UNION\r\n		SELECT \'11\',12 UNION\r\n		SELECT \'12\',13 UNION\r\n		SELECT \'12+\',14) pers,\r\n	(SELECT distinctrow moc.code, moc.name\r\n  	FROM m_office mo2\r\n   	INNER JOIN m_office ounder2 ON ounder2.hierarchy \r\n				LIKE CONCAT(mo2.hierarchy, \'%\')\r\nAND ounder2.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   	INNER JOIN m_client mc2 ON mc2.office_id=ounder2.id\r\n   	INNER JOIN m_loan ml2 ON ml2.client_id = mc2.id\r\n	INNER JOIN m_organisation_currency moc ON moc.code = ml2.currency_code\r\n	WHERE ml2.loan_status_id=300 /* active */\r\n	AND mo2.id=${officeId}\r\nAND (ml2.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")) curs) periods\r\n\r\n\r\nLEFT JOIN /* table of aging periods per currency with gaps if no applicable loans */\r\n(SELECT \r\n  	z.currency, z.arrPeriod, \r\n	COUNT(z.loanId) as loanId, SUM(z.principal) as principal, SUM(z.interest) as interest, \r\n	SUM(z.prinPaid) as prinPaid, SUM(z.intPaid) as intPaid, \r\n	SUM(z.prinOverdue) as prinOverdue, SUM(z.intOverdue) as intOverdue\r\nFROM\r\n	/*derived table just used to get arrPeriod value (was much slower to\r\n	duplicate calc of minOverdueDate in inner query)\r\nmight not be now with derived fields but didn’t check */\r\n	(SELECT x.loanId, x.currency, x.principal, x.interest, x.prinPaid, x.intPaid, x.prinOverdue, x.intOverdue,\r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<1, \'On Schedule\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<8, \'1\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<15, \'2\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<22, \'3\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<29, \'4\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<36, \'5\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<43, \'6\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<50, \'7\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<57, \'8\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<64, \'9\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<71, \'10\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<78, \'11\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<85, \'12\',\r\n				 \'12+\'))))))))))))) AS arrPeriod\r\n\r\n	FROM /* get the individual loan details */\r\n		(SELECT ml.id AS loanId, ml.currency_code as currency,\r\n   			ml.principal_disbursed_derived as principal, \r\n			   ml.interest_charged_derived as interest, \r\n   			ml.principal_repaid_derived as prinPaid, \r\n			   ml.interest_repaid_derived intPaid,\r\n\r\n			   laa.principal_overdue_derived as prinOverdue,\r\n			   laa.interest_overdue_derived as intOverdue,\r\n\r\n			   IFNULL(laa.overdue_since_date_derived, curdate()) as minOverdueDate\r\n			  \r\n  		FROM m_office mo\r\n   		INNER JOIN m_office ounder ON ounder.hierarchy \r\n				LIKE CONCAT(mo.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   		INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n   		INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n		   LEFT JOIN m_loan_arrears_aging laa on laa.loan_id = ml.id\r\n		WHERE ml.loan_status_id=300 /* active */\r\n     		AND mo.id=${officeId}\r\n     AND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\n  		GROUP BY ml.id) x\r\n	) z \r\nGROUP BY z.currency, z.arrPeriod ) ars ON ars.arrPeriod=periods.period_no and ars.currency = periods.currency\r\nORDER BY periods.currency, periods.pid','Loan amount in arrears by branch',1,1),(54,'Rescheduled Loans','Table',NULL,'Loan','SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nc.account_no as \"Client Account No.\",\r\nc.display_name AS \'Client Name\',\r\nml.account_no AS \'Loan Account No.\',\r\nmpl.name AS \'Product Name\',\r\nml.disbursedon_date AS \'Disbursed Date\',\r\nlt.transaction_date AS \'Written Off date\',\r\nml.principal_amount as \"Loan Amount\",\r\nifnull(lt.principal_portion_derived, 0) AS \'Rescheduled Principal\',\r\nifnull(lt.interest_portion_derived, 0) AS \'Rescheduled Interest\',\r\nifnull(lt.fee_charges_portion_derived,0) AS \'Rescheduled Fees\',\r\nifnull(lt.penalty_charges_portion_derived,0) AS \'Rescheduled Penalties\',\r\nn.note AS \'Reason For Rescheduling\',\r\nIFNULL(ms.display_name,\'-\') AS \'Loan Officer Name\'\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan ml ON ml.client_id = c.id\r\nJOIN m_product_loan mpl ON mpl.id=ml.product_id\r\nLEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\nJOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nLEFT JOIN m_note n ON n.loan_transaction_id = lt.id\r\nLEFT JOIN m_currency cur on cur.code = ml.currency_code\r\nWHERE lt.transaction_type_enum = 7 /*marked for rescheduling */\r\nAND lt.is_reversed is false \r\nAND ml.loan_status_id=602\r\nAND o.id=${officeId}\r\nAND (mpl.id=${loanProductId} OR ${loanProductId}=-1)\r\nAND lt.transaction_date BETWEEN \'${startDate}\' AND \'${endDate}\'\r\nAND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no','Individual Lending Report. Rescheduled Loans.  The ability to reschedule (or mark that you have rescheduled the loan elsewhere) is a legacy of the older Mifos product.  Needed for migration.',1,1),(55,'Active Loans Passed Final Maturity','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", \r\nc.display_name as \"Client\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\ndate(l.expected_maturedon_date) as \"Expected Matured On\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\nlaa.penalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand l.expected_maturedon_date < curdate()\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no','Individual Client \n\nReport',1,1),(56,'Active Loans Passed Final Maturity Summary','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. arrears_loan_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select ounder.id as branch,\r\nifnull(cur.display_symbol, l.currency_code) as currency,\r\ncount(distinct(c.id)) as client_count, \r\ncount(distinct(l.id)) as  active_loan_count,\r\ncount(distinct(laa.loan_id)  ) as arrears_loan_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(ifnull(laa.principal_overdue_derived,0)) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(ifnull(laa.interest_overdue_derived,0)) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(ifnull(laa.fee_charges_overdue_derived,0)) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(ifnull(laa.penalty_charges_overdue_derived,0)) as penalties_overdue\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\n\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand l.expected_maturedon_date < curdate()\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency',NULL,1,1),(57,'Active Loans in last installment','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(lastInstallment.`hierarchy`) - LENGTH(REPLACE(lastInstallment.`hierarchy`, \'.\', \'\')) - 1))), lastInstallment.branch) as \"Office/Branch\",\r\nlastInstallment.Currency,\r\nlastInstallment.`Loan Officer`, \r\nlastInstallment.`Client Account No`, lastInstallment.`Client`, \r\nlastInstallment.`Loan Account No`, lastInstallment.`Product`, \r\nlastInstallment.`Fund`,  lastInstallment.`Loan Amount`, \r\nlastInstallment.`Annual Nominal Interest Rate`, \r\nlastInstallment.`Disbursed`, lastInstallment.`Expected Matured On` ,\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\nlaa.penalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom \r\n(select l.id as loanId, l.number_of_repayments, min(r.installment), \r\nounder.id, ounder.hierarchy, ounder.`name` as branch, \r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", c.account_no as \"Client Account No\",\r\nc.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  l.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \"Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", date(l.expected_maturedon_date) as \"Expected Matured On\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_repayment_schedule r on r.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand r.completed_derived is false\r\nand r.duedate >= curdate()\r\ngroup by l.id\r\nhaving l.number_of_repayments = min(r.installment)) lastInstallment\r\njoin m_loan l on l.id = lastInstallment.loanId\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\norder by lastInstallment.hierarchy, lastInstallment.Currency, lastInstallment.`Client Account No`, lastInstallment.`Loan Account No`','Individual Client \n\nReport',1,1),(58,'Active Loans in last installment Summary','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. arrears_loan_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select lastInstallment.branchId as branchId,\r\nlastInstallment.Currency,\r\ncount(distinct(lastInstallment.clientId)) as client_count, \r\ncount(distinct(lastInstallment.loanId)) as  active_loan_count,\r\ncount(distinct(laa.loan_id)  ) as arrears_loan_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(ifnull(laa.principal_overdue_derived,0)) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(ifnull(laa.interest_overdue_derived,0)) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(ifnull(laa.fee_charges_overdue_derived,0)) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(ifnull(laa.penalty_charges_overdue_derived,0)) as penalties_overdue\r\n\r\nfrom \r\n(select l.id as loanId, l.number_of_repayments, min(r.installment), \r\nounder.id as branchId, ounder.hierarchy, ounder.`name` as branch, \r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", c.id as clientId, c.account_no as \"Client Account No\",\r\nc.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  l.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \"Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", date(l.expected_maturedon_date) as \"Expected Matured On\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_repayment_schedule r on r.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand r.completed_derived is false\r\nand r.duedate >= curdate()\r\ngroup by l.id\r\nhaving l.number_of_repayments = min(r.installment)) lastInstallment\r\njoin m_loan l on l.id = lastInstallment.loanId\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\ngroup by lastInstallment.branchId) x on x.branchId = mo.id\r\norder by mo.hierarchy, x.Currency','Individual Client \n\nReport',1,1),(59,'Active Loans by Disbursal Period','Table',NULL,'Loan','select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nc.account_no as \"Client Account No\", c.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Principal Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\n\r\nl.total_expected_repayment_derived as \"Total Loan (P+I+F+Pen)\",\r\nl.total_repayment_derived as \"Total Repaid (P+I+F+Pen)\",\r\nlo.display_name as \"Loan Officer\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand l.loan_status_id = 300\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no','Individual Client \n\nReport',1,1),(61,'Aging Summary (Arrears in Months)','Table',NULL,'Loan','SELECT \r\n  IFNULL(periods.currencyName, periods.currency) as currency, \r\n  periods.period_no \'Days In Arrears\', \r\n  IFNULL(ars.loanId, 0) \'No Of Loans\', \r\n  IFNULL(ars.principal,0.0) \'Original Principal\', \r\n  IFNULL(ars.interest,0.0) \'Original Interest\', \r\n  IFNULL(ars.prinPaid,0.0) \'Principal Paid\', \r\n  IFNULL(ars.intPaid,0.0) \'Interest Paid\', \r\n  IFNULL(ars.prinOverdue,0.0) \'Principal Overdue\', \r\n  IFNULL(ars.intOverdue,0.0)\'Interest Overdue\'\r\nFROM \r\n	/* full table of aging periods/currencies used combo to ensure each line represented */\r\n  (SELECT curs.code as currency, curs.name as currencyName, pers.* from\r\n	(SELECT \'On Schedule\' period_no,1 pid UNION\r\n		SELECT \'0 - 30\',2 UNION\r\n		SELECT \'30 - 60\',3 UNION\r\n		SELECT \'60 - 90\',4 UNION\r\n		SELECT \'90 - 180\',5 UNION\r\n		SELECT \'180 - 360\',6 UNION\r\n		SELECT \'> 360\',7 ) pers,\r\n	(SELECT distinctrow moc.code, moc.name\r\n  	FROM m_office mo2\r\n   	INNER JOIN m_office ounder2 ON ounder2.hierarchy \r\n				LIKE CONCAT(mo2.hierarchy, \'%\')\r\nAND ounder2.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   	INNER JOIN m_client mc2 ON mc2.office_id=ounder2.id\r\n   	INNER JOIN m_loan ml2 ON ml2.client_id = mc2.id\r\n	INNER JOIN m_organisation_currency moc ON moc.code = ml2.currency_code\r\n	WHERE ml2.loan_status_id=300 /* active */\r\n	AND mo2.id=${officeId}\r\nAND (ml2.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")) curs) periods\r\n\r\n\r\nLEFT JOIN /* table of aging periods per currency with gaps if no applicable loans */\r\n(SELECT \r\n  	z.currency, z.arrPeriod, \r\n	COUNT(z.loanId) as loanId, SUM(z.principal) as principal, SUM(z.interest) as interest, \r\n	SUM(z.prinPaid) as prinPaid, SUM(z.intPaid) as intPaid, \r\n	SUM(z.prinOverdue) as prinOverdue, SUM(z.intOverdue) as intOverdue\r\nFROM\r\n	/*derived table just used to get arrPeriod value (was much slower to\r\n	duplicate calc of minOverdueDate in inner query)\r\nmight not be now with derived fields but didn’t check */\r\n	(SELECT x.loanId, x.currency, x.principal, x.interest, x.prinPaid, x.intPaid, x.prinOverdue, x.intOverdue,\r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<1, \'On Schedule\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<31, \'0 - 30\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<61, \'30 - 60\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<91, \'60 - 90\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<181, \'90 - 180\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<361, \'180 - 360\', \r\n				 \'> 360\')))))) AS arrPeriod\r\n\r\n	FROM /* get the individual loan details */\r\n		(SELECT ml.id AS loanId, ml.currency_code as currency,\r\n   			ml.principal_disbursed_derived as principal, \r\n			   ml.interest_charged_derived as interest, \r\n   			ml.principal_repaid_derived as prinPaid, \r\n			   ml.interest_repaid_derived intPaid,\r\n\r\n			   laa.principal_overdue_derived as prinOverdue,\r\n			   laa.interest_overdue_derived as intOverdue,\r\n\r\n			   IFNULL(laa.overdue_since_date_derived, curdate()) as minOverdueDate\r\n			  \r\n  		FROM m_office mo\r\n   		INNER JOIN m_office ounder ON ounder.hierarchy \r\n				LIKE CONCAT(mo.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   		INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n   		INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n		   LEFT JOIN m_loan_arrears_aging laa on laa.loan_id = ml.id\r\n		WHERE ml.loan_status_id=300 /* active */\r\n     		AND mo.id=${officeId}\r\n     AND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\n  		GROUP BY ml.id) x\r\n	) z \r\nGROUP BY z.currency, z.arrPeriod ) ars ON ars.arrPeriod=periods.period_no and ars.currency = periods.currency\r\nORDER BY periods.currency, periods.pid','Loan amount in arrears by branch',1,1),(91,'Loan Account Schedule','Pentaho',NULL,'Loan',NULL,NULL,1,0),(92,'Branch Expected Cash Flow','Pentaho',NULL,'Loan',NULL,NULL,1,1),(93,'Expected Payments By Date - Basic','Table',NULL,'Loan','SELECT \r\n      ounder.name \'Office\', \r\n      IFNULL(ms.display_name,\'-\') \'Loan Officer\',\r\n	  mc.account_no \'Client Account Number\',\r\n	  mc.display_name \'Name\',\r\n	  mp.name \'Product\',\r\n	  ml.account_no \'Loan Account Number\',\r\n	  mr.duedate \'Due Date\',\r\n	  mr.installment \'Installment\',\r\n	  cu.display_symbol \'Currency\',\r\n	  mr.principal_amount- IFNULL(mr.principal_completed_derived,0) \'Principal Due\',\r\n	  mr.interest_amount- IFNULL(IFNULL(mr.interest_completed_derived,mr.interest_waived_derived),0) \'Interest Due\', \r\n	  IFNULL(mr.fee_charges_amount,0)- IFNULL(IFNULL(mr.fee_charges_completed_derived,mr.fee_charges_waived_derived),0) \'Fees Due\', \r\n	  IFNULL(mr.penalty_charges_amount,0)- IFNULL(IFNULL(mr.penalty_charges_completed_derived,mr.penalty_charges_waived_derived),0) \'Penalty Due\',\r\n      (mr.principal_amount- IFNULL(mr.principal_completed_derived,0)) +\r\n       (mr.interest_amount- IFNULL(IFNULL(mr.interest_completed_derived,mr.interest_waived_derived),0)) + \r\n       (IFNULL(mr.fee_charges_amount,0)- IFNULL(IFNULL(mr.fee_charges_completed_derived,mr.fee_charges_waived_derived),0)) + \r\n       (IFNULL(mr.penalty_charges_amount,0)- IFNULL(IFNULL(mr.penalty_charges_completed_derived,mr.penalty_charges_waived_derived),0)) \'Total Due\', \r\n     mlaa.total_overdue_derived \'Total Overdue\'\r\n										 \r\n FROM m_office mo\r\n  JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\n  \r\n  AND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n	\r\n  LEFT JOIN m_client mc ON mc.office_id=ounder.id\r\n  LEFT JOIN m_loan ml ON ml.client_id=mc.id AND ml.loan_status_id=300\r\n  LEFT JOIN m_loan_arrears_aging mlaa ON mlaa.loan_id=ml.id\r\n  LEFT JOIN m_loan_repayment_schedule mr ON mr.loan_id=ml.id AND mr.completed_derived=0\r\n  LEFT JOIN m_product_loan mp ON mp.id=ml.product_id\r\n  LEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\n  LEFT JOIN m_currency cu ON cu.code=ml.currency_code\r\n WHERE mo.id=${officeId}\r\n AND (IFNULL(ml.loan_officer_id, -10) = \"${loanOfficerId}\" OR \"-1\" = \"${loanOfficerId}\")\r\n AND mr.duedate BETWEEN \'${startDate}\' AND \'${endDate}\'\r\n ORDER BY ounder.id,mr.duedate,ml.account_no','Test',1,1),(94,'Expected Payments By Date - Formatted','Pentaho',NULL,'Loan',NULL,NULL,1,1),(96,'GroupSummaryCounts','Table',NULL,NULL,'\n/*\nActive Client is a client linked to the \'group\' via m_group_client\nand with an active \'status_enum\'.)\nActive Borrowers - Borrower may be a client or a \'group\'\n*/\nselect x.*\nfrom m_office o,\nm_group g,\n\n(select a.activeClients,\n(b.activeClientLoans + c.activeGroupLoans) as activeLoans,\nb.activeClientLoans, c.activeGroupLoans,\n(b.activeClientBorrowers + c.activeGroupBorrowers) as activeBorrowers,\nb.activeClientBorrowers, c.activeGroupBorrowers,\n(b.overdueClientLoans +  c.overdueGroupLoans) as overdueLoans,\nb.overdueClientLoans, c.overdueGroupLoans\nfrom\n(select count(*) as activeClients\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_group_client gc on gc.group_id = g.id\njoin m_client c on c.id = gc.client_id\nwhere topgroup.id = ${groupId}\nand c.status_enum = 300) a,\n\n(select count(*) as activeClientLoans,\ncount(distinct(l.client_id)) as activeClientBorrowers,\nifnull(sum(if(laa.loan_id is not null, 1, 0)), 0) as overdueClientLoans\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id and l.client_id is not null\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nwhere topgroup.id = ${groupId}\nand l.loan_status_id = 300) b,\n\n(select count(*) as activeGroupLoans,\ncount(distinct(l.group_id)) as activeGroupBorrowers,\nifnull(sum(if(laa.loan_id is not null, 1, 0)), 0) as overdueGroupLoans\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id and l.client_id is null\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nwhere topgroup.id = ${groupId}\nand l.loan_status_id = 300) c\n) x\n\nwhere g.id = ${groupId}\nand o.id = g.office_id\nand o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n','Utility query for getting group summary count details for a group_id',1,0),(97,'GroupSummaryAmounts','Table',NULL,NULL,'\nselect ifnull(cur.display_symbol, l.currency_code) as currency,\nifnull(sum(l.principal_disbursed_derived),0) as totalDisbursedAmount,\nifnull(sum(l.principal_outstanding_derived),0) as totalLoanOutstandingAmount,\ncount(laa.loan_id) as overdueLoans, ifnull(sum(laa.total_overdue_derived), 0) as totalLoanOverdueAmount\nfrom m_group topgroup\njoin m_office o on o.id = topgroup.office_id and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nwhere topgroup.id = ${groupId}\nand l.disbursedon_date is not null\ngroup by l.currency_code\n','Utility query for getting group summary currency amount details for a group_id',1,0),(106,'TxnRunningBalances','Table',NULL,'Transaction','\nselect date(\'${startDate}\') as \'Transaction Date\', \'Opening Balance\' as `Transaction Type`, null as Office,\n	null as \'Loan Officer\', null as `Loan Account No`, null as `Loan Product`, null as `Currency`,\n	null as `Client Account No`, null as Client,\n	null as Amount, null as Principal, null as Interest,\n@totalOutstandingPrincipal :=\nifnull(round(sum(\n	if (txn.transaction_type_enum = 1 /* disbursement */,\n		ifnull(txn.amount,0.00),\n		ifnull(txn.principal_portion_derived,0.00) * -1))\n			,2),0.00)  as \'Outstanding Principal\',\n\n@totalInterestIncome :=\nifnull(round(sum(\n	if (txn.transaction_type_enum in (2,5,8) /* repayment, repayment at disbursal, recovery repayment */,\n		ifnull(txn.interest_portion_derived,0.00),\n		0))\n			,2),0.00) as \'Interest Income\',\n\n@totalWriteOff :=\nifnull(round(sum(\n	if (txn.transaction_type_enum = 6 /* write-off */,\n		ifnull(txn.principal_portion_derived,0.00),\n		0))\n			,2),0.00) as \'Principal Write Off\'\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\n                          and ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\njoin m_loan l on l.client_id = c.id\njoin m_product_loan lp on lp.id = l.product_id\njoin m_loan_transaction txn on txn.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nwhere txn.is_reversed = false\nand txn.transaction_type_enum not in (10,11)\nand o.id = ${officeId}\nand txn.transaction_date < date(\'${startDate}\')\n\nunion all\n\nselect x.`Transaction Date`, x.`Transaction Type`, x.Office, x.`Loan Officer`, x.`Loan Account No`, x.`Loan Product`, x.`Currency`,\n	x.`Client Account No`, x.Client, x.Amount, x.Principal, x.Interest,\ncast(round(\n	if (x.transaction_type_enum = 1 /* disbursement */,\n		@totalOutstandingPrincipal := @totalOutstandingPrincipal + x.`Amount`,\n		@totalOutstandingPrincipal := @totalOutstandingPrincipal - x.`Principal`)\n			,2) as decimal(19,2)) as \'Outstanding Principal\',\ncast(round(\n	if (x.transaction_type_enum in (2,5,8) /* repayment, repayment at disbursal, recovery repayment */,\n		@totalInterestIncome := @totalInterestIncome + x.`Interest`,\n		@totalInterestIncome)\n			,2) as decimal(19,2)) as \'Interest Income\',\ncast(round(\n	if (x.transaction_type_enum = 6 /* write-off */,\n		@totalWriteOff := @totalWriteOff + x.`Principal`,\n		@totalWriteOff)\n			,2) as decimal(19,2)) as \'Principal Write Off\'\nfrom\n(select txn.transaction_type_enum, txn.id as txn_id, txn.transaction_date as \'Transaction Date\',\ncast(\n	ifnull(re.enum_message_property, concat(\'Unknown Transaction Type Value: \' , txn.transaction_type_enum))\n	as char) as \'Transaction Type\',\nounder.`name` as Office, lo.display_name as \'Loan Officer\',\nl.account_no  as \'Loan Account No\', lp.`name` as \'Loan Product\',\nifnull(cur.display_symbol, l.currency_code) as Currency,\nc.account_no as \'Client Account No\', c.display_name as \'Client\',\nifnull(txn.amount,0.00) as Amount,\nifnull(txn.principal_portion_derived,0.00) as Principal,\nifnull(txn.interest_portion_derived,0.00) as Interest\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\n                          and ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\njoin m_loan l on l.client_id = c.id\nleft join m_staff lo on lo.id = l.loan_officer_id\njoin m_product_loan lp on lp.id = l.product_id\njoin m_loan_transaction txn on txn.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nleft join r_enum_value re on re.enum_name = \'transaction_type_enum\'\n						and re.enum_id = txn.transaction_type_enum\nwhere txn.is_reversed = false\nand txn.transaction_type_enum not in (10,11)\nand (ifnull(l.loan_officer_id, -10) = \'${loanOfficerId}\' or \'-1\' = \'${loanOfficerId}\')\nand o.id = ${officeId}\nand txn.transaction_date >= date(\'${startDate}\')\nand txn.transaction_date <= date(\'${endDate}\')\norder by txn.transaction_date, txn.id) x\n','Running Balance Txn report for Individual Lending.\nSuitable for small MFI\'s.  Larger could use it using the branch or other parameters.\nBasically, suck it and see if its quick enough for you out-of-te box or whether it needs performance work in your situation.\n',0,0),(107,'FieldAgentStats','Table',NULL,'Quipo','\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) as clientsInDefault,\nround((count(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff fa\njoin m_office o on o.id = fa.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere fa.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n','Field Agent Statistics',0,0),(108,'FieldAgentPrograms','Table',NULL,'Quipo','\nselect pgm.id, pgm.display_name as `name`, sts.enum_message_property as status\n from m_group pgm\n join m_office o on o.id = pgm.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n left join r_enum_value sts on sts.enum_name = \'status_enum\' and sts.enum_id = pgm.status_enum\n where pgm.staff_id = ${staffId}\n','List of Field Agent Programs',0,0),(109,'ProgramDetails','Table',NULL,'Quipo','\n select l.id as loanId, l.account_no as loanAccountNo, c.id as clientId, c.account_no as clientAccountNo,\n pgm.display_name as programName,\n\n(select count(*)\nfrom m_loan cy\nwhere cy.group_id = pgm.id and cy.client_id =c.id\nand cy.disbursedon_date <= l.disbursedon_date) as loanCycleNo,\n\nc.display_name as clientDisplayName,\n ifnull(cur.display_symbol, l.currency_code) as Currency,\nifnull(l.principal_repaid_derived,0.0) as loanRepaidAmount,\nifnull(l.principal_outstanding_derived, 0.0) as loanOutstandingAmount,\nifnull(lpa.principal_in_advance_derived,0.0) as LoanPaidInAdvance,\n\nifnull(laa.principal_overdue_derived, 0.0) as loanInArrearsAmount,\nif(ifnull(laa.principal_overdue_derived, 0.00) > 0, \'Yes\', \'No\') as inDefault,\n\nif(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)  as portfolioAtRisk\n\n from m_group pgm\n join m_office o on o.id = pgm.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n join m_loan l on l.group_id = pgm.id and l.client_id is not null\n left join m_currency cur on cur.code = l.currency_code\n join m_client c on c.id = l.client_id\n left join m_loan_arrears_aging laa on laa.loan_id = l.id\n left join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\n where pgm.id = ${programId}\n and l.loan_status_id = 300\norder by c.display_name, l.account_no\n\n','List of Loans in a Program',0,0),(110,'ChildrenStaffList','Table',NULL,'Quipo','\n select s.id, s.display_name,\ns.firstname, s.lastname, s.organisational_role_enum,\ns.organisational_role_parent_staff_id,\nsp.display_name as `organisational_role_parent_staff_display_name`\nfrom m_staff s\njoin m_staff sp on s.organisational_role_parent_staff_id = sp.id\nwhere s.organisational_role_parent_staff_id = ${staffId}\n','Get Next Level Down Staff',0,0),(111,'CoordinatorStats','Table',NULL,'Quipo','\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) as clientsInDefault,\nround((count(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff coord\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere coord.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n','Coordinator Statistics',0,0),(112,'BranchManagerStats','Table',NULL,'Quipo','\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) as clientsInDefault,\nround((count(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff bm\njoin m_staff coord on coord.organisational_role_parent_staff_id = bm.id\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere bm.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n','Branch Manager Statistics',0,0),(113,'ProgramDirectorStats','Table',NULL,'Quipo','\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) as clientsInDefault,\nround((count(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff pd\njoin m_staff bm on bm.organisational_role_parent_staff_id = pd.id\njoin m_staff coord on coord.organisational_role_parent_staff_id = bm.id\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere pd.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n','Program DirectorStatistics',0,0),(114,'ProgramStats','Table',NULL,'Quipo','\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n	if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n		l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) as clientsInDefault,\nround((count(distinct(\n		if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n			c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_group pgm\njoin m_office o on o.id = pgm.office_id\n			and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere pgm.id = ${programId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n','Program Statistics',0,0),(115,'ClientSummary ','Table',NULL,NULL,'SELECT x.* FROM m_client c, m_office o, \n(\n       SELECT a.loanCycle, a.activeLoans, b.lastLoanAmount, d.activeSavings, d.totalSavings FROM \n	(SELECT IFNULL(MAX(l.loan_counter),0) AS loanCycle, COUNT(l.id) AS activeLoans FROM m_loan l WHERE l.loan_status_id=300 AND l.client_id=${clientId}) a, \n	(SELECT count(l.id), IFNULL(l.principal_amount,0) AS \'lastLoanAmount\' FROM m_loan l WHERE l.client_id=${clientId} AND l.disbursedon_date = (SELECT IFNULL(MAX(disbursedon_date),NOW()) FROM m_loan where client_id=${clientId} and loan_status_id=300)) b, \n	(SELECT COUNT(s.id) AS \'activeSavings\', IFNULL(SUM(s.account_balance_derived),0) AS \'totalSavings\' FROM m_savings_account s WHERE s.status_enum=300 AND s.client_id=${clientId}) d\n) x\nWHERE c.id=${clientId} AND o.id = c.office_id AND o.hierarchy LIKE CONCAT(\'${currentUserHierarchy}\', \'%\')','Utility query for getting the client summary details',1,0),(116,'LoanCyclePerProduct','Table',NULL,NULL,'SELECT lp.name AS \'productName\', MAX(l.loan_product_counter) AS \'loanProductCycle\' FROM m_loan l JOIN m_product_loan lp ON l.product_id=lp.id WHERE lp.include_in_borrower_cycle=1 AND l.loan_product_counter IS NOT NULL AND l.client_id=${clientId} GROUP BY l.product_id','Utility query for getting the client loan cycle details',1,0),(117,'GroupSavingSummary','Table',NULL,NULL,'select ifnull(cur.display_symbol, sa.currency_code) as currency,\ncount(sa.id) as totalSavingAccounts, ifnull(sum(sa.account_balance_derived),0) as totalSavings\nfrom m_group topgroup\njoin m_office o on o.id = topgroup.office_id and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_savings_account sa on sa.group_id = g.id\nleft join m_currency cur on cur.code = sa.currency_code\nwhere topgroup.id = ${groupId}\nand sa.activatedon_date is not null\ngroup by sa.currency_code','Utility query for getting group or center saving summary details for a group_id',1,0),(118,'Savings Transactions','Pentaho',NULL,'Savings',NULL,NULL,0,1),(119,'Client Savings Summary','Pentaho',NULL,'Savings',NULL,NULL,0,1),(120,'Active Loans - Details(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(121,'Active Loans - Summary(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(122,'Active Loans by Disbursal Period(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(123,'Active Loans in last installment Summary(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(124,'Active Loans in last installment(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(125,'Active Loans Passed Final Maturity Summary(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(126,'Active Loans Passed Final Maturity(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(127,'Aging Detail(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(128,'Aging Summary (Arrears in Months)(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(129,'Aging Summary (Arrears in Weeks)(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(130,'Client Listing(Pentaho)','Pentaho',NULL,'Client','(NULL)','(NULL)',1,1),(131,'Client Loans Listing(Pentaho)','Pentaho',NULL,'Client','(NULL)','(NULL)',1,1),(132,'Expected Payments By Date - Basic(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(133,'Funds Disbursed Between Dates Summary by Office(Pentaho)','Pentaho',NULL,'Fund','(NULL)','(NULL)',1,1),(134,'Funds Disbursed Between Dates Summary(Pentaho)','Pentaho',NULL,'Fund','(NULL)','(NULL)',1,1),(135,'Loans Awaiting Disbursal Summary by Month(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(136,'Loans Awaiting Disbursal Summary(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(137,'Loans Awaiting Disbursal(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(138,'Loans Pending Approval(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(139,'Obligation Met Loans Details(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(140,'Obligation Met Loans Summary(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(141,'Portfolio at Risk by Branch(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(142,'Portfolio at Risk(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(143,'Rescheduled Loans(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(144,'TxnRunningBalances(Pentaho)','Pentaho',NULL,'Transaction','(NULL)','(NULL)',1,1),(145,'Written-Off Loans(Pentaho)','Pentaho',NULL,'Loan','(NULL)','(NULL)',1,1),(146,'Client Saving Transactions','Pentaho',NULL,'Savings',NULL,NULL,0,0),(147,'Client Loan Account Schedule','Pentaho',NULL,'Loans',NULL,NULL,0,0),(148,'GroupNamesByStaff','Table','','','Select gr.id as id, gr.display_name as name from m_group gr where gr.level_id=1 and gr.staff_id = ${staffId}','',1,0),(149,'ClientTrendsByDay','Table','','Client','SELECT 	COUNT(cl.id) AS count, \n		cl.activation_date AS days\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 DAY) AND DATE(NOW()- INTERVAL 1 DAY))\nGROUP BY days','Retrieves the number of clients joined in last 12 days',1,0),(150,'ClientTrendsByWeek','Table','','Client','SELECT 	COUNT(cl.id) AS count, \n		WEEK(cl.activation_date) AS Weeks\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 WEEK) AND DATE(NOW()))\nGROUP BY Weeks','',1,0),(151,'ClientTrendsByMonth','Table','','Client','SELECT 	COUNT(cl.id) AS count, \n		MONTHNAME(cl.activation_date) AS Months\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND DATE(NOW()))\nGROUP BY Months','',1,0),(152,'LoanTrendsByDay','Table','','Loan','SELECT 	COUNT(ln.id) AS lcount, \n		ln.disbursedon_date AS days\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 DAY) AND DATE(NOW()- INTERVAL 1 DAY))\nGROUP BY days','Retrieves Number of loans disbursed for last 12 days',1,0),(153,'LoanTrendsByWeek','Table','','Loan','SELECT 	COUNT(ln.id) AS lcount, \n		WEEK(ln.disbursedon_date) AS Weeks\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 WEEK) AND DATE(NOW()))\nGROUP BY Weeks','',1,0),(154,'LoanTrendsByMonth','Table','','Loan','SELECT 	COUNT(ln.id) AS lcount, \n		MONTHNAME(ln.disbursedon_date) AS Months\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND DATE(NOW()))\nGROUP BY Months','',1,0),(155,'Demand_Vs_Collection','Table','','Loan','select amount.AmountDue-amount.AmountPaid as AmountDue, amount.AmountPaid as AmountPaid from\n(SELECT \n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \n - IFNULL(SUM(ls.interest_waived_derived),0)\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\n) AS AmountDue, \n\n(IFNULL(SUM(ls.principal_completed_derived),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0) + IFNULL(SUM(ls.interest_completed_derived),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \n - IFNULL(SUM(ls.interest_waived_derived),0)\n + IFNULL(SUM(ls.fee_charges_completed_derived),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\n + IFNULL(SUM(ls.penalty_charges_completed_derived),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\n) AS AmountPaid\nFROM m_office of\nLEFT JOIN m_client cl ON of.id = cl.office_id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nLEFT JOIN m_loan_repayment_schedule ls ON ln.id = ls.loan_id\nWHERE ls.duedate = DATE(NOW()) AND \n (of.hierarchy LIKE CONCAT((\nSELECT ino.hierarchy\nFROM m_office ino\nWHERE ino.id = ${officeId}),\"%\"))) as amount','Demand Vs Collection',1,0),(156,'Disbursal_Vs_Awaitingdisbursal','Table','','Loan','select awaitinddisbursal.amount-disbursedAmount.amount as amountToBeDisburse, disbursedAmount.amount as disbursedAmount from \n(\nSELECT 	COUNT(ln.id) AS noOfLoans, \n			IFNULL(SUM(ln.principal_amount),0) AS amount\nFROM \nm_office of\nLEFT JOIN m_client cl ON cl.office_id = of.id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nWHERE \nln.expected_disbursedon_date = DATE(NOW()) AND \n(ln.loan_status_id=200 OR ln.loan_status_id=300) AND\n of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" )\n) awaitinddisbursal,\n(\nSELECT 	COUNT(ltrxn.id) as count, \n			IFNULL(SUM(ltrxn.amount),0) as amount \nFROM \nm_office of\nLEFT JOIN m_client cl ON cl.office_id = of.id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nLEFT JOIN m_loan_transaction ltrxn ON ln.id = ltrxn.loan_id\nWHERE \nltrxn.transaction_date = DATE(NOW()) AND \nltrxn.is_reversed = 0 AND\nltrxn.transaction_type_enum=1 AND\n of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n) disbursedAmount','Disbursal_Vs_Awaitingdisbursal',1,0),(157,'Savings Transaction Receipt','Pentaho',NULL,NULL,NULL,NULL,0,1),(158,'Loan Transaction Receipt','Pentaho',NULL,NULL,NULL,NULL,0,1),(159,'Staff Assignment History','Pentaho',NULL,NULL,NULL,NULL,0,1),(160,'GeneralLedgerReport','Pentaho',NULL,'Accounting',NULL,NULL,0,1),(161,'Active Loan Summary per Branch','Pentaho',NULL,'Loans',NULL,NULL,0,1),(162,'Balance Outstanding','Pentaho',NULL,'Loans',NULL,NULL,0,1),(163,'Collection Report','Pentaho',NULL,'Loans',NULL,NULL,0,1),(164,'Disbursal Report','Pentaho',NULL,'Loans',NULL,NULL,0,1),(165,'Savings Accounts Dormancy Report','Table',NULL,'Savings','select cl.display_name as \'Client Display Name\',\r\nsa.account_no as \'Account Number\',\r\ncl.mobile_no as \'Mobile Number\',\r\n@lastdate:=(select IFNULL(max(sat.transaction_date),sa.activatedon_date) \r\n            from m_savings_account_transaction as sat \r\n            where sat.is_reversed = 0 \r\n            and sat.transaction_type_enum in (1,2) \r\n            and sat.savings_account_id = sa.id) as \'Date of Last Activity\',\r\nDATEDIFF(now(), @lastdate) as \'Days Since Last Activity\'\r\nfrom m_savings_account as sa \r\ninner join m_savings_product as sp on (sa.product_id = sp.id and sp.is_dormancy_tracking_active = 1) \r\nleft join m_client as cl on sa.client_id = cl.id \r\nwhere sa.sub_status_enum = ${subStatus}\r\nand cl.office_id = ${officeId}',NULL,1,1),(166,'Active Clients','SMS','NonTriggered','Clients','SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no','All clients with the status ‘Active’',0,1),(167,'Prospective Clients','SMS','NonTriggered','Clients','SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_loan l ON l.client_id = c.id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.client_id IS NULL\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no','All clients with the status ‘Active’ who have never had a loan before',0,1),(168,'Active Loan Clients','SMS','NonTriggered','Clients','SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\", \r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nounder.id AS \"officeNumber\", \r\nl.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", COUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nJOIN m_product_loan pl ON pl.id = l.product_id\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.loan_status_id = 300 AND (DATEDIFF(CURDATE(), l.disbursedon_date) BETWEEN ${cycleX} AND ${cycleY})\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no','All clients with an outstanding loan between cycleX and cycleY days',0,1),(169,'Loan in arrears','SMS','NonTriggered','Loan','SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nml.principal_disbursed_derived AS \"loanDisbursed\",\r\nlaa.overdue_since_date_derived AS \"paymentDueDate\",\r\nIFNULL(laa.total_overdue_derived, 0) AS \"totalDue\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", \r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${fromX} AND ${toY})\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no','All clients with an outstanding loan in arrears between fromX and toY days',0,1),(170,'Loan payments due','SMS','NonTriggered','Loan','SELECT \r\ncl.id AS \"id\", \r\ncl.firstname AS \"firstName\",\r\ncl.middlename AS \"middleName\",\r\ncl.lastname AS \"lastName\",\r\ncl.display_name AS \"fullName\",\r\ncl.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\nof.id AS \"officeNumber\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nls.duedate AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\",\r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ngp.display_name AS \"groupName\"\r\n\r\nFROM m_office of\r\nLEFT JOIN m_client cl ON of.id = cl.office_id\r\nLEFT JOIN m_loan l ON cl.id = l.client_id\r\nLEFT JOIN m_group_client gc ON gc.client_id = cl.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=l.id\r\nWHERE of.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), ls.duedate) BETWEEN ${fromX} AND ${toY}) \r\nAND (of.hierarchy LIKE CONCAT((\r\nSELECT ino.hierarchy\r\nFROM m_office ino\r\nWHERE ino.id = ${officeId}),\"%\"))\r\nGROUP BY l.id\r\nORDER BY of.hierarchy, l.currency_code, cl.account_no, l.account_no','All clients with an unpaid installment due on their loan between fromX and toY days',0,1),(171,'Dormant Prospects','SMS','NonTriggered','Clients','SELECT c.id AS \"id\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",  \r\no.id AS \"officeNumber\", \r\nTIMESTAMPDIFF(MONTH, c.activation_date, CURDATE()) AS \"dormant\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_loan l ON l.client_id = c.id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.client_id IS NULL AND (TIMESTAMPDIFF(MONTH, c.activation_date, CURDATE()) > 3)\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no','All individuals who have not yet received a loan but were also entered into the system more than 3 months',0,1),(172,'Active group leaders','SMS','NonTriggered','Clients','SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_group g ON g.office_id = ounder.id\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN m_group_client gc ON gc.group_id = g.id AND gc.client_id = c.id\r\nLEFT JOIN m_group_roles gr ON gr.group_id = g.id AND gr.client_id = c.id\r\nLEFT JOIN m_staff ms ON ms.id = c.staff_id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_code_value cv ON cv.id = gr.role_cv_id\r\nLEFT JOIN m_code code ON code.id = cv.code_id\r\nWHERE o.id = ${officeId} AND g.status_enum = 300 AND c.status_enum = 300  AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND code.code_name = \'GROUPROLE\' AND cv.code_value = \'Leader\'\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no','All active group chairmen',0,1),(173,'Loan payments due (Overdue Loans)','SMS','NonTriggered','Loan','SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nml.principal_disbursed_derived AS \"loanDisbursed\",\r\nlaa.overdue_since_date_derived AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", \r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_loan_repayment_schedule ls ON ls.loan_id = ml.id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) \r\nAND (DATEDIFF(CURDATE(), ls.duedate) BETWEEN ${fromX} AND ${toY})\r\nAND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${overdueX} AND ${overdueY})\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no','Loan Payments Due between fromX to toY days for clients in arrears between overdueX and overdueY days',0,1),(174,'Loan payments received (Active Loans)','SMS','NonTriggered','Loan','SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountNumber\",\r\nSUM(lt.amount) AS \"repaymentAmount\"\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nINNER JOIN m_appuser au ON au.id = lt.appuser_id\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_payment_detail mpd ON mpd.id=lt.payment_detail_id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), lt.transaction_date) BETWEEN ${fromX} AND ${toY}) AND lt.is_reversed=0 AND lt.transaction_type_enum=2 AND laa.loan_id IS NULL\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no','Payments received in the last fromX to toY days for any loan with the status Active (on-time)',0,1),(175,'Loan payments received (Overdue Loans)','SMS','NonTriggered','Loan','SELECT \r\nml.id AS \"loanId\", \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountNumber\",\r\nSUM(lt.amount) AS \"repaymentAmount\"\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nINNER JOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nINNER JOIN m_appuser au ON au.id = lt.appuser_id\r\nLEFT JOIN m_payment_detail mpd ON mpd.id=lt.payment_detail_id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), lt.transaction_date) BETWEEN ${fromX} AND ${toY}) AND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${overdueX} AND ${overdueY}) AND lt.is_reversed=0 AND lt.transaction_type_enum=2\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no','Payments received in the last fromX to toY days for any loan with the status Overdue (arrears) between overdueX and overdueY days',0,1),(176,'Happy Birthday','SMS','NonTriggered','Clients','SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\", \r\nc.date_of_birth AS \"dateOfBirth\",\r\nIF(c.date_of_birth IS NULL, 0, CEIL(DATEDIFF (NOW(), c.date_of_birth)/365)) AS \"age\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_staff ms ON ms.id = c.staff_id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND c.date_of_birth IS NOT NULL AND (DAY(c.date_of_birth)=DAY(NOW())) AND (MONTH(c.date_of_birth)=MONTH(NOW()))\r\nORDER BY ounder.hierarchy, c.account_no','This sends a message to all clients with the status Active on their Birthday',0,1),(177,'Loan fully repaid','SMS','NonTriggered','Loan','SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\no.id AS \"officeNumber\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\", COUNT(gua.id) AS \"numberOfGuarantors\",\r\nls.duedate AS \"dueDate\",\r\nlaa.total_overdue_derived AS \"totalDue\",\r\ngp.display_name AS \"groupName\",\r\nl.total_repayment_derived AS \"totalFullyPaid\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id=l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND \r\n(DATEDIFF(CURDATE(), l.closedon_date) BETWEEN ${fromX} AND ${toY})\r\n AND (l.loan_status_id IN (600, 700))\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no','All loans that have been fully repaid (Closed or Overpaid) in the last fromX to toY days',0,1),(178,'Loan outstanding after final instalment date','SMS','NonTriggered','Loan','SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\no.id AS \"officeNumber\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nls.duedate AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\",\r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ngp.display_name AS \"groupName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id = l.id\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.loan_status_id = 300 AND l.expected_maturedon_date < CURDATE() \r\nAND (DATEDIFF(CURDATE(), l.expected_maturedon_date) BETWEEN ${fromX} AND ${toY})\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no','All active loans (with an outstanding balance) between fromX to toY days after the final instalment date on their loan schedule',0,1),(179,'Loan Repayment','SMS','Triggered',NULL,'select ml.id as loanId,mc.id, mc.firstname, ifnull(mc.middlename,\'\') as middlename, mc.lastname, mc.display_name as FullName, mobile_no as mobileNo, mc.group_name as GroupName, round(ml.principal_amount, ml.currency_digits) as LoanAmount, round(ml.`total_outstanding_derived`, ml.currency_digits) as LoanOutstanding,\nml.`account_no` as LoanAccountId, round(mlt.amountPaid, ml.currency_digits) as repaymentAmount\nFROM m_office mo\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\nAND ounder.hierarchy like CONCAT(\'.\', \'%\')\nLEFT JOIN (\n select \n ml.id as loanId, \n ifnull(mc.id,mc2.id) as id, \n ifnull(mc.firstname,mc2.firstname) as firstname, \n ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename, \n ifnull(mc.lastname,mc2.lastname) as lastname, \n ifnull(mc.display_name,mc2.display_name) as display_name, \n ifnull(mc.status_enum,mc2.status_enum) as status_enum,\n ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no,\n ifnull(mg.office_id,mc2.office_id) as office_id,\n ifnull(mg.staff_id,mc2.staff_id) as staff_id,\n mg.id as group_id, \nmg.display_name as group_name\n from\n m_loan ml\n left join m_group mg on mg.id = ml.group_id\n left join m_group_client mgc on mgc.group_id = mg.id\n left join m_client mc on mc.id = mgc.client_id\n left join m_client mc2 on mc2.id = ml.client_id\n order by loanId\n ) mc on mc.office_id = ounder.id\nright join m_loan as ml on mc.loanId = ml.id\nright join(\nselect mlt.amount as amountPaid,mlt.id,mlt.loan_id\nfrom m_loan_transaction mlt\nwhere mlt.is_reversed = 0 \ngroup by mlt.loan_id\n) as mlt on mlt.loan_id = ml.id\nright join m_loan_repayment_schedule as mls1 on ml.id = mls1.loan_id and mls1.`completed_derived` = 0\nand mls1.installment = (SELECT MIN(installment) from m_loan_repayment_schedule where loan_id = ml.id and duedate <= CURDATE() and completed_derived=0)\nwhere mc.status_enum = 300 and mobile_no is not null and ml.`loan_status_id` = 300\nand (mo.id = ${officeId} or ${officeId} = -1)\nand (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1)\nand (ml.loan_type_enum = ${loanType} or ${loanType} = -1)\nand ml.id in (select mla.loan_id from m_loan_arrears_aging mla)\ngroup by ml.id','Loan Repayment',0,0),(180,'Loan Approved','SMS','Triggered',NULL,'SELECT mc.id, mc.firstname, mc.middlename as middlename, mc.lastname, mc.display_name as FullName, mc.mobile_no as mobileNo, mc.group_name as GroupName, mo.name as officename, ml.id as loanId, ml.account_no as accountnumber, ml.principal_amount_proposed as loanamount, ml.annual_nominal_interest_rate as annualinterestrate FROM m_office mo JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy like CONCAT(\'.\', \'%\') LEFT JOIN ( select  ml.id as loanId,  ifnull(mc.id,mc2.id) as id,  ifnull(mc.firstname,mc2.firstname) as firstname,  ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename,  ifnull(mc.lastname,mc2.lastname) as lastname,  ifnull(mc.display_name,mc2.display_name) as display_name,  ifnull(mc.status_enum,mc2.status_enum) as status_enum, ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no, ifnull(mg.office_id,mc2.office_id) as office_id, ifnull(mg.staff_id,mc2.staff_id) as staff_id, mg.id as group_id, mg.display_name as group_name from m_loan ml left join m_group mg on mg.id = ml.group_id left join m_group_client mgc on mgc.group_id = mg.id left join m_client mc on mc.id = mgc.client_id left join m_client mc2 on mc2.id = ml.client_id order by loanId ) mc on mc.office_id = ounder.id  left join m_loan ml on ml.id = mc.loanId WHERE mc.status_enum = 300 and mc.mobile_no is not null and (mo.id = ${officeId} or ${officeId} = -1) and (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1)and (ml.id = ${loanId} or ${loanId} = -1)and (mc.id = ${clientId} or ${clientId} = -1)and (mc.group_id = ${groupId} or ${groupId} = -1)and (ml.loan_type_enum = ${loanType} or ${loanType} = -1)','Loan and client data of approved loan',0,0),(181,'Loan Rejected','SMS','Triggered',NULL,'SELECT mc.id, mc.firstname, mc.middlename as middlename, mc.lastname, mc.display_name as FullName, mc.mobile_no as mobileNo, mc.group_name as GroupName,  mo.name as officename, ml.id as loanId, ml.account_no as accountnumber, ml.principal_amount_proposed as loanamount, ml.annual_nominal_interest_rate as annualinterestrate  FROM  m_office mo  JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')  AND ounder.hierarchy like CONCAT(\'.\', \'%\')  LEFT JOIN (  select   ml.id as loanId,   ifnull(mc.id,mc2.id) as id,   ifnull(mc.firstname,mc2.firstname) as firstname,   ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename,   ifnull(mc.lastname,mc2.lastname) as lastname,   ifnull(mc.display_name,mc2.display_name) as display_name,   ifnull(mc.status_enum,mc2.status_enum) as status_enum,  ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no,  ifnull(mg.office_id,mc2.office_id) as office_id,  ifnull(mg.staff_id,mc2.staff_id) as staff_id,  mg.id as group_id,  mg.display_name as group_name  from  m_loan ml  left join m_group mg on mg.id = ml.group_id  left join m_group_client mgc on mgc.group_id = mg.id  left join m_client mc on mc.id = mgc.client_id  left join m_client mc2 on mc2.id = ml.client_id  order by loanId  ) mc on mc.office_id = ounder.id  left join m_loan ml on ml.id = mc.loanId  WHERE mc.status_enum = 300 and mc.mobile_no is not null  and (mo.id = ${officeId} or ${officeId} = -1)  and (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1) and (ml.id = ${loanId} or ${loanId} = -1) and (mc.id = ${clientId} or ${clientId} = -1) and (mc.group_id = ${groupId} or ${groupId} = -1)  and (ml.loan_type_enum = ${loanType} or ${loanType} = -1)','Loan and client data of rejected loan',0,0),(182,'Client Rejected','SMS','Triggered','Clients','SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.id = ${clientId} AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})','Client Rejection',0,1),(183,'Client Activated','SMS','Triggered','Clients','SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.id = ${clientId} AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})','Client Activation',0,1),(184,'Savings Rejected','SMS','Triggered','Savings','SELECT \r\nc.id AS \"id\",\r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",\r\ns.account_no AS \"savingsAccountNo\",\r\nounder.id AS \"officeNumber\",\r\nounder.name AS \"officeName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_savings_account s ON s.client_id = c.id\r\nJOIN m_savings_product sp ON sp.id = s.product_id\r\nLEFT JOIN m_staff st ON st.id = s.field_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = s.currency_code\r\nWHERE o.id = ${officeId} AND (IFNULL(s.field_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND s.id = ${savingsId}','Savings Rejected',0,1),(185,'Savings Activated','SMS','Triggered','Savings','SELECT \r\nc.id AS \"id\",\r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",\r\ns.account_no AS \"savingsAccountNo\",\r\nounder.id AS \"officeNumber\",\r\nounder.name AS \"officeName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_savings_account s ON s.client_id = c.id\r\nJOIN m_savings_product sp ON sp.id = s.product_id\r\nLEFT JOIN m_staff st ON st.id = s.field_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = s.currency_code\r\nWHERE o.id = ${officeId} AND (IFNULL(s.field_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND s.id = ${savingsId}','Savings Activation',0,1),(186,'Savings Deposit','SMS','Triggered',NULL,'SELECT sc.savingsId AS savingsId, sc.id AS clientId, sc.firstname, IFNULL(sc.middlename,\'\') AS middlename, sc.lastname, sc.display_name AS FullName, sc.mobile_no AS mobileNo,\r\nms.`account_no` AS savingsAccountNo, ROUND(mst.amountPaid, ms.currency_digits) AS depositAmount, ms.account_balance_derived AS balance, \r\nmst.transactionDate AS transactionDate\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy LIKE CONCAT(\'.\', \'%\')\r\nLEFT JOIN (\r\nSELECT \r\n sa.id AS savingsId, mc.id AS id, mc.firstname AS firstname, mc.middlename AS middlename, mc.lastname AS lastname, \r\n mc.display_name AS display_name, mc.status_enum AS status_enum, \r\n mc.mobile_no AS mobile_no, mc.office_id AS office_id, \r\n mc.staff_id AS staff_id\r\nFROM\r\nm_savings_account sa\r\nLEFT JOIN m_client mc ON mc.id = sa.client_id\r\nORDER BY savingsId) sc ON sc.office_id = ounder.id\r\nRIGHT JOIN m_savings_account AS ms ON sc.savingsId = ms.id\r\nRIGHT JOIN(\r\nSELECT st.amount AS amountPaid, st.id, st.savings_account_id, st.id AS savingsTransactionId, st.transaction_date AS transactionDate\r\nFROM m_savings_account_transaction st\r\nWHERE st.is_reversed = 0\r\nGROUP BY st.savings_account_id\r\n) AS mst ON mst.savings_account_id = ms.id\r\nWHERE sc.mobile_no IS NOT NULL AND (mo.id = ${officeId} OR ${officeId} = -1) AND (sc.staff_id = ${loanOfficerId} OR ${loanOfficerId} = -1) AND mst.savingsTransactionId = ${savingsTransactionId}','Savings Deposit',0,1),(187,'Savings Withdrawal','SMS','Triggered',NULL,'SELECT sc.savingsId AS savingsId, sc.id AS clientId, sc.firstname, IFNULL(sc.middlename,\'\') AS middlename, sc.lastname, sc.display_name AS FullName, sc.mobile_no AS mobileNo,\r\nms.`account_no` AS savingsAccountNo, ROUND(mst.amountPaid, ms.currency_digits) AS withdrawAmount, ms.account_balance_derived AS balance, \r\nmst.transactionDate AS transactionDate\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy LIKE CONCAT(\'.\', \'%\')\r\nLEFT JOIN (\r\nSELECT \r\n sa.id AS savingsId, mc.id AS id, mc.firstname AS firstname, mc.middlename AS middlename, mc.lastname AS lastname, \r\n mc.display_name AS display_name, mc.status_enum AS status_enum, \r\n mc.mobile_no AS mobile_no, mc.office_id AS office_id, \r\n mc.staff_id AS staff_id\r\nFROM\r\nm_savings_account sa\r\nLEFT JOIN m_client mc ON mc.id = sa.client_id\r\nORDER BY savingsId) sc ON sc.office_id = ounder.id\r\nRIGHT JOIN m_savings_account AS ms ON sc.savingsId = ms.id\r\nRIGHT JOIN(\r\nSELECT st.amount AS amountPaid, st.id, st.savings_account_id, st.id AS savingsTransactionId, st.transaction_date AS transactionDate\r\nFROM m_savings_account_transaction st\r\nWHERE st.is_reversed = 0\r\nGROUP BY st.savings_account_id\r\n) AS mst ON mst.savings_account_id = ms.id\r\nWHERE sc.mobile_no IS NOT NULL AND (mo.id = ${officeId} OR ${officeId} = -1) AND (sc.staff_id = ${loanOfficerId} OR ${loanOfficerId} = -1) AND mst.savingsTransactionId = ${savingsTransactionId}','Savings Withdrawal',0,1),(188,'Daily Teller Cash Report (Pentaho)','Pentaho',NULL,NULL,NULL,'Daily Teller Cash Report',1,1);
/*!40000 ALTER TABLE `stretchy_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_report_parameter`
--

DROP TABLE IF EXISTS `stretchy_report_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_report_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `report_parameter_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_parameter_unique` (`report_id`,`parameter_id`),
  KEY `fk_report_parameter_001_idx` (`report_id`),
  KEY `fk_report_parameter_002_idx` (`parameter_id`),
  CONSTRAINT `fk_report_parameter_001` FOREIGN KEY (`report_id`) REFERENCES `stretchy_report` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_parameter_002` FOREIGN KEY (`parameter_id`) REFERENCES `stretchy_parameter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_report_parameter`
--

LOCK TABLES `stretchy_report_parameter` WRITE;
/*!40000 ALTER TABLE `stretchy_report_parameter` DISABLE KEYS */;
INSERT INTO `stretchy_report_parameter` VALUES (1,1,5,NULL),(2,2,5,NULL),(3,2,6,NULL),(4,2,10,NULL),(5,2,20,NULL),(6,2,25,NULL),(7,2,26,NULL),(8,5,5,NULL),(9,5,6,NULL),(10,5,10,NULL),(11,5,20,NULL),(12,5,25,NULL),(13,5,26,NULL),(14,6,5,NULL),(15,6,6,NULL),(16,6,10,NULL),(17,6,20,NULL),(18,6,25,NULL),(19,6,26,NULL),(20,7,5,NULL),(21,7,6,NULL),(22,7,10,NULL),(23,7,20,NULL),(24,7,25,NULL),(25,7,26,NULL),(26,8,5,NULL),(27,8,6,NULL),(28,8,10,NULL),(29,8,25,NULL),(30,8,26,NULL),(31,11,5,NULL),(32,11,6,NULL),(33,11,10,NULL),(34,11,20,NULL),(35,11,25,NULL),(36,11,26,NULL),(37,11,100,NULL),(38,12,5,NULL),(39,12,6,NULL),(40,12,10,NULL),(41,12,20,NULL),(42,12,25,NULL),(43,12,26,NULL),(44,13,1,NULL),(45,13,2,NULL),(46,13,3,NULL),(47,13,5,NULL),(48,13,6,NULL),(49,13,10,NULL),(50,13,20,NULL),(51,13,25,NULL),(52,13,26,NULL),(53,14,1,NULL),(54,14,2,NULL),(55,14,3,NULL),(56,14,5,NULL),(57,14,6,NULL),(58,14,10,NULL),(59,14,20,NULL),(60,14,25,NULL),(61,14,26,NULL),(62,15,5,NULL),(63,15,6,NULL),(64,15,10,NULL),(65,15,20,NULL),(66,15,25,NULL),(67,15,26,NULL),(68,15,100,NULL),(69,16,5,NULL),(70,16,6,NULL),(71,16,10,NULL),(72,16,20,NULL),(73,16,25,NULL),(74,16,26,NULL),(75,16,100,NULL),(76,20,1,NULL),(77,20,2,NULL),(78,20,10,NULL),(79,20,20,NULL),(80,21,1,NULL),(81,21,2,NULL),(82,21,5,NULL),(83,21,10,NULL),(84,21,20,NULL),(85,48,5,'branch'),(86,48,2,'date'),(87,49,5,'branch'),(88,49,1,'fromDate'),(89,49,2,'toDate'),(90,50,5,'branch'),(91,50,1,'fromDate'),(92,50,2,'toDate'),(93,51,1,NULL),(94,51,2,NULL),(95,51,5,NULL),(96,51,10,NULL),(97,51,25,NULL),(98,52,5,NULL),(99,53,5,NULL),(100,53,10,NULL),(101,54,1,NULL),(102,54,2,NULL),(103,54,5,NULL),(104,54,10,NULL),(105,54,25,NULL),(106,55,5,NULL),(107,55,6,NULL),(108,55,10,NULL),(109,55,20,NULL),(110,55,25,NULL),(111,55,26,NULL),(112,56,5,NULL),(113,56,6,NULL),(114,56,10,NULL),(115,56,20,NULL),(116,56,25,NULL),(117,56,26,NULL),(118,56,100,NULL),(119,57,5,NULL),(120,57,6,NULL),(121,57,10,NULL),(122,57,20,NULL),(123,57,25,NULL),(124,57,26,NULL),(125,58,5,NULL),(126,58,6,NULL),(127,58,10,NULL),(128,58,20,NULL),(129,58,25,NULL),(130,58,26,NULL),(131,58,100,NULL),(132,59,1,NULL),(133,59,2,NULL),(134,59,5,NULL),(135,59,6,NULL),(136,59,10,NULL),(137,59,20,NULL),(138,59,25,NULL),(139,59,26,NULL),(140,61,5,NULL),(141,61,10,NULL),(142,92,1,'fromDate'),(143,92,5,'selectOffice'),(144,92,2,'toDate'),(145,93,1,NULL),(146,93,2,NULL),(147,93,5,NULL),(148,93,6,NULL),(149,94,2,'endDate'),(150,94,6,'loanOfficerId'),(151,94,5,'officeId'),(152,94,1,'startDate'),(256,106,2,NULL),(257,106,6,NULL),(258,106,5,NULL),(259,106,1,NULL),(263,118,1,'fromDate'),(264,118,2,'toDate'),(265,118,1004,'accountNo'),(266,119,1,'fromDate'),(267,119,2,'toDate'),(268,119,5,'selectOffice'),(269,119,1005,'selectProduct'),(270,120,5,'branch'),(271,120,6,'loanOfficer'),(272,120,10,'currencyId'),(273,120,20,'fundId'),(274,120,25,'loanProductId'),(275,120,26,'loanPurposeId'),(276,121,5,'Branch'),(277,121,6,'loanOfficer'),(278,121,10,'CurrencyId'),(279,121,20,'fundId'),(280,121,25,'loanProductId'),(281,121,26,'loanPurposeId'),(282,121,100,'parType'),(283,122,5,'Branch'),(284,122,6,'loanOfficer'),(285,122,10,'CurrencyId'),(286,122,20,'fundId'),(287,122,25,'loanProductId'),(288,122,26,'loanPurposeId'),(289,122,1,'startDate'),(290,122,2,'endDate'),(291,123,5,'Branch'),(292,123,6,'Loan Officer'),(293,123,10,'CurrencyId'),(294,123,20,'fundId'),(295,123,25,'loanProductId'),(296,123,26,'loanPurposeId'),(297,123,100,'parType'),(298,124,5,'Branch'),(299,124,6,'Loan Officer'),(300,124,10,'CurrencyId'),(301,124,20,'fundId'),(302,124,25,'loanProductId'),(303,124,26,'loanPurposeId'),(304,125,5,'Branch'),(305,125,6,'Loan Officer'),(306,125,10,'CurrencyId'),(307,125,20,'fundId'),(308,125,25,'loanProductId'),(309,125,26,'loanPurposeId'),(310,125,100,'parType'),(311,126,5,'Branch'),(312,126,6,'Loan Officer'),(313,126,10,'CurrencyId'),(314,126,20,'fundId'),(315,126,25,'loanProductId'),(316,126,26,'loanPurposeId'),(317,127,5,'Branch'),(318,128,5,'Branch'),(319,128,10,'CurrencyId'),(320,129,5,'Branch'),(321,129,10,'CurrencyId'),(322,130,5,'selectOffice'),(323,131,5,'Branch'),(324,131,6,'Loan Officer'),(325,131,10,'CurrencyId'),(326,131,20,'fundId'),(327,131,25,'loanProductId'),(328,131,26,'loanPurposeId'),(329,132,5,'Branch'),(330,132,6,'Loan Officer'),(331,132,1,'startDate'),(332,132,2,'endDate'),(333,133,5,'Branch'),(334,133,10,'CurrencyId'),(335,133,20,'fundId'),(336,133,1,'startDate'),(337,133,2,'endDate'),(338,134,10,'CurrencyId'),(339,134,20,'fundId'),(340,134,1,'startDate'),(341,134,2,'endDate'),(342,135,5,'Branch'),(343,135,6,'Loan Officer'),(344,135,10,'CurrencyId'),(345,135,20,'fundId'),(346,135,25,'loanProductId'),(347,135,26,'loanPurposeId'),(348,136,5,'Branch'),(349,136,6,'Loan Officer'),(350,136,10,'CurrencyId'),(351,136,20,'fundId'),(352,136,25,'loanProductId'),(353,136,26,'loanPurposeId'),(354,137,5,'Branch'),(355,137,6,'Loan Officer'),(356,137,10,'CurrencyId'),(357,137,20,'fundId'),(358,137,25,'loanProductId'),(359,137,26,'loanPurposeId'),(360,138,5,'Branch'),(361,138,6,'Loan Officer'),(362,138,10,'CurrencyId'),(363,138,20,'fundId'),(364,138,25,'loanProductId'),(365,138,26,'loanPurposeId'),(366,139,5,'Branch'),(367,139,6,'Loan Officer'),(368,139,10,'CurrencyId'),(369,139,20,'fundId'),(370,139,25,'loanProductId'),(371,139,26,'loanPurposeId'),(372,139,1,'startDate'),(373,139,2,'endDate'),(374,139,3,'obligDateType'),(375,140,5,'Branch'),(376,140,6,'Loan Officer'),(377,140,10,'CurrencyId'),(378,140,20,'fundId'),(379,140,25,'loanProductId'),(380,140,26,'loanPurposeId'),(381,140,1,'Startdate'),(382,140,2,'Enddate'),(383,140,3,'obligDateType'),(384,141,5,'Branch'),(385,141,6,'Loan Officer'),(386,141,10,'CurrencyId'),(387,141,20,'fundId'),(388,141,25,'loanProductId'),(389,141,26,'loanPurposeId'),(390,141,100,'parType'),(391,142,5,'Branch'),(392,142,6,'loanOfficer'),(393,142,10,'CurrencyId'),(394,142,20,'fundId'),(395,142,25,'loanProductId'),(396,142,26,'loanPurposeId'),(397,142,100,'parType'),(398,143,5,'Branch'),(399,143,10,'CurrencyId'),(400,143,25,'loanProductId'),(401,143,1,'startDate'),(402,143,2,'endDate'),(403,144,5,'Branch'),(404,144,6,'Loan Officer'),(405,144,1,'startDate'),(406,144,2,'endDate'),(407,145,5,'Branch'),(408,145,10,'CurrencyId'),(409,145,25,'loanProductId'),(410,145,1,'startDate'),(411,145,2,'endDate'),(412,146,1,'startDate'),(413,146,2,'endDate'),(414,146,1004,'accountNo'),(415,147,1,'startDate'),(416,147,2,'endDate'),(417,147,1004,'selectLoan'),(418,149,5,''),(419,150,5,''),(420,151,5,''),(421,152,5,''),(422,153,5,''),(423,154,5,''),(424,155,5,''),(425,156,5,''),(426,157,1006,'transactionId'),(427,158,1006,'transactionId'),(428,159,1007,'centerId'),(429,160,1008,'account'),(430,160,1,'fromDate'),(431,160,2,'toDate'),(432,160,5,'branch'),(433,162,5,'branch'),(434,162,1009,'ondate'),(435,163,5,'branch'),(436,163,1,'fromDate'),(437,163,2,'toDate'),(438,164,5,'branch'),(439,164,1,'fromDate'),(440,164,2,'toDate'),(441,165,1010,NULL),(442,165,5,NULL),(443,166,5,'officeId'),(444,166,6,'loanOfficerId'),(445,167,5,'officeId'),(446,167,6,'loanOfficerId'),(447,168,5,'officeId'),(448,168,6,'loanOfficerId'),(449,168,1011,'cycleX'),(450,168,1012,'cycleY'),(451,169,5,'officeId'),(452,169,6,'loanOfficerId'),(453,169,1013,'fromX'),(454,169,1014,'toY'),(455,170,5,'officeId'),(456,170,6,'loanOfficerId'),(457,170,1013,'fromX'),(458,170,1014,'toY'),(459,171,5,'officeId'),(460,171,6,'loanOfficerId'),(461,172,5,'officeId'),(462,172,6,'loanOfficerId'),(463,173,5,'officeId'),(464,173,6,'loanOfficerId'),(465,173,1013,'fromX'),(466,173,1014,'toY'),(467,173,1015,'overdueX'),(468,173,1016,'overdueY'),(469,174,5,'officeId'),(470,174,6,'loanOfficerId'),(471,174,1013,'fromX'),(472,174,1014,'toY'),(473,175,5,'officeId'),(474,175,6,'loanOfficerId'),(475,175,1013,'fromX'),(476,175,1014,'toY'),(477,175,1015,'overdueX'),(478,175,1016,'overdueY'),(479,176,5,'officeId'),(480,176,6,'loanOfficerId'),(481,177,5,'officeId'),(482,177,6,'loanOfficerId'),(483,177,1013,'fromX'),(484,177,1014,'toY'),(485,178,5,'officeId'),(486,178,6,'loanOfficerId'),(487,178,1013,'fromX'),(488,178,1014,'toY'),(489,181,5,'officeId'),(490,180,5,'officeId'),(491,179,5,'officeId'),(492,181,6,'loanOfficerId'),(493,180,6,'loanOfficerId'),(494,179,6,'loanOfficerId'),(495,181,1017,'loanId'),(496,180,1017,'loanId'),(497,181,1018,'clientId'),(498,180,1018,'clientId'),(499,181,1019,'groupId'),(500,180,1019,'groupId'),(501,181,1020,'loanType'),(502,180,1020,'loanType'),(503,179,1020,'loanType'),(504,182,5,'officeId'),(505,183,5,'officeId'),(506,182,6,'loanOfficerId'),(507,183,6,'loanOfficerId'),(508,182,1018,'clientId'),(509,183,1018,'clientId'),(510,184,5,'officeId'),(511,184,6,'loanOfficerId'),(512,184,1021,'savingsId'),(513,185,5,'officeId'),(514,185,6,'loanOfficerId'),(515,185,1021,'savingsId'),(516,186,5,'officeId'),(517,186,6,'loanOfficerId'),(518,186,1022,'savingsTransactionId'),(519,187,5,'officeId'),(520,187,6,'loanOfficerId'),(521,187,1022,'savingsTransactionId'),(522,188,5,'officeId'),(523,188,1023,'tellerId'),(524,188,1024,'cashierId'),(525,188,1025,'currencyCode'),(526,188,1009,'asOnDate');
/*!40000 ALTER TABLE `stretchy_report_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type` text NOT NULL,
  `member_type` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Accountant of Nyumba Head Office',1,1,'OFFICE','ACCOUNTANT'),(2,'IT of Nyumba Head Office',1,1,'OFFICE','IT'),(3,'Loan Officer of Nyumba Head Office',1,1,'OFFICE','LOAN OFFICER'),(4,'Managers of Nyumba Head Office',1,1,'OFFICE','MANAGERS'),(5,'Office Attendant of Nyumba Head Office',1,1,'OFFICE','OFFICE ATTENDANT'),(6,'Self Service User of Nyumba Head Office',1,1,'OFFICE','SELF SERVICE USER'),(7,'Super user of Nyumba Head Office',1,1,'OFFICE','SUPER USER');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_subscriber`
--

DROP TABLE IF EXISTS `topic_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subscription_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_topic_has_m_appuser_topic` (`topic_id`),
  KEY `fk_topic_has_m_appuser_m_appuser1` (`user_id`),
  CONSTRAINT `fk_topic_has_m_appuser_m_appuser1` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`),
  CONSTRAINT `fk_topic_has_m_appuser_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_subscriber`
--

LOCK TABLES `topic_subscriber` WRITE;
/*!40000 ALTER TABLE `topic_subscriber` DISABLE KEYS */;
INSERT INTO `topic_subscriber` VALUES (1,7,1,'2018-02-18'),(2,7,3,'2018-02-18'),(3,7,4,'2018-02-18'),(4,7,5,'2018-02-18');
/*!40000 ALTER TABLE `topic_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twofactor_access_token`
--

DROP TABLE IF EXISTS `twofactor_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twofactor_access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `appuser_id` bigint(20) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_appuser_UNIQUE` (`token`,`appuser_id`),
  KEY `user` (`appuser_id`),
  KEY `token` (`token`),
  CONSTRAINT `fk_2fa_access_token_user_id` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twofactor_access_token`
--

LOCK TABLES `twofactor_access_token` WRITE;
/*!40000 ALTER TABLE `twofactor_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `twofactor_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twofactor_configuration`
--

DROP TABLE IF EXISTS `twofactor_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twofactor_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twofactor_configuration`
--

LOCK TABLES `twofactor_configuration` WRITE;
/*!40000 ALTER TABLE `twofactor_configuration` DISABLE KEYS */;
INSERT INTO `twofactor_configuration` VALUES (1,'otp-delivery-email-enable','true'),(2,'otp-delivery-email-subject','Fineract Two-Factor Authentication Token'),(3,'otp-delivery-email-body','Hello {{username}}.\nYour OTP login token is {{token}}.'),(4,'otp-delivery-sms-enable','false'),(5,'otp-delivery-sms-provider','1'),(6,'otp-delivery-sms-text','Your authentication token for Fineract is {{token}}.'),(7,'otp-token-live-time','300'),(8,'otp-token-length','5'),(9,'access-token-live-time','86400'),(10,'access-token-live-time-extended','604800');
/*!40000 ALTER TABLE `twofactor_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_registered_table`
--

DROP TABLE IF EXISTS `x_registered_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_registered_table` (
  `registered_table_name` varchar(50) NOT NULL,
  `application_table_name` varchar(50) NOT NULL,
  `category` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`registered_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_registered_table`
--

LOCK TABLES `x_registered_table` WRITE;
/*!40000 ALTER TABLE `x_registered_table` DISABLE KEYS */;
INSERT INTO `x_registered_table` VALUES ('Beneficiary','m_client',100);
/*!40000 ALTER TABLE `x_registered_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_table_column_code_mappings`
--

DROP TABLE IF EXISTS `x_table_column_code_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_table_column_code_mappings` (
  `column_alias_name` varchar(50) NOT NULL,
  `code_id` int(10) NOT NULL,
  PRIMARY KEY (`column_alias_name`),
  KEY `FK_x_code_id` (`code_id`),
  CONSTRAINT `FK_x_code_id` FOREIGN KEY (`code_id`) REFERENCES `m_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_table_column_code_mappings`
--

LOCK TABLES `x_table_column_code_mappings` WRITE;
/*!40000 ALTER TABLE `x_table_column_code_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_table_column_code_mappings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-19  9:43:43
