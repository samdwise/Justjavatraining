-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.31-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pensionmanager
--

CREATE DATABASE IF NOT EXISTS pensionmanager;
USE pensionmanager;

--
-- Definition of table `Account`
--

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `verifiedName` varchar(255) DEFAULT NULL,
  `verify` bit(1) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1D0C220D2823D40E` (`bank_id`),
  KEY `FK1D0C220D3BE0B72` (`owner_id`),
  CONSTRAINT `FK1D0C220D2823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`),
  CONSTRAINT `FK1D0C220D3BE0B72` FOREIGN KEY (`owner_id`) REFERENCES `AccountOwnerDetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Account`
--

/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` (`id`,`balance`,`name`,`number`,`verifiedName`,`verify`,`bank_id`,`owner_id`) VALUES 
 (1,NULL,'','',NULL,0x00,NULL,NULL),
 (2,NULL,'','',NULL,0x00,NULL,NULL),
 (3,NULL,'','',NULL,0x00,NULL,NULL),
 (4,NULL,'','',NULL,0x00,NULL,NULL);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;


--
-- Definition of table `accountownerdetail`
--

DROP TABLE IF EXISTS `AccountOwnerDetail`;
CREATE TABLE `AccountOwnerDetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uniqueIdentifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueIdentifier` (`uniqueIdentifier`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AccountOwnerDetail`
--

/*!40000 ALTER TABLE `AccountOwnerDetail` DISABLE KEYS */;
INSERT INTO `AccountOwnerDetail` (`id`,`email`,`name`,`uniqueIdentifier`) VALUES 
 (1,' info@diamondpfc.com',' Diamond Pension Fund Custodian Limited','diamondpensionfund'),
 (2,'info@firstcustodiannigeria.com','First Pension Custodian Nigeria Limited','Firstpension'),
 (3,'info@ubagroup.com','UBA Pensions Custodian Limited','ubapensions'),
 (4,'customercare@zenithcustodian.com','Zenith Pensions Custodian Limited','Zenithpensions'),
 (5,'elonge@aiicopension.com','AIICO Pension Managers Limited','AIICO'),
 (6,'gummia@aptpensions.com','APT Pension Fund Managers Limited','APT'),
 (7,'info@armpension.com','ARM Pension Managers Limited','ARM'),
 (8,'info@crusaderpensions.com','CrusaderSterling Pensions Limited','CSP'),
 (9,'info@fidelitypensionmanagers.com','Fidelity Pension Managers','FIDELITY'),
 (10,'info@firstguaranteepension.com','First Guarantee Pension Limited','Firstguarantee'),
 (11,'info@fugpensions.com','Future Unity Glanvils Pensions Limited','Futureunityglanvils'),
 (12,'enquiries@investment-onepension.com','Investment One Pension Managers Limited','Investmentonepension'),
 (13,'cservice@ieianchorpensions.com','IEI-Anchor Pension Managers Limited','IEI-Anchorpension'),
 (14,'info@igipfm.com','IGI Pension Fund Managers Limited','Igipension'),
 (15,'info@leadway-pensure.com','Leadway Pensure PFA Limited','Leadwaypensure'),
 (16,'info@legacypension.com','Legacy Pension Managers Limited','Legacypension'),
 (17,'info@nlpcpfa.com','NLPC Pension Fund Administrators Limited','Nlpcpension'),
 (18,'info@oakpensions.com','OAK Pensions Limited','oakpension'),
 (19,'info@pensionsalliance.com','Pensions Alliance Limited','Pensionsalliance'),
 (20,'info@premiumpension.com','Premium Pension Limited','Premiumpension'),
 (21,'info@sigmapensions.com','Sigma Pensions Limited','sigmapension'),
 (22,'pensionsolution@stanbicibtc.com','Stanbic IBTC Pension Managers Limited','Stanbicibtcpension'),
 (23,'enquiries@trustfundpensions.com','Trustfund Pensions Plc','Trustfundpension'),
 (24,'info@npfpensions.com','NPF Pensions Limited','npfpensions'),
 (26,'sam@justjava.com','CSCS','cscs'),
 (27,'customercare@nlpcpfa.com','NLPC Pension Fund','NLPC'),
 (28,'pensionsolution@stanbicibtc.com','Stanbic Pension Manager','STANBIC'),
 (29,'info@gtbam.com','GTB  Assets Management pensions','GTB');
/*!40000 ALTER TABLE `AccountOwnerDetail` ENABLE KEYS */;


--
-- Definition of table `Agent`
--

DROP TABLE IF EXISTS `Agent`;
CREATE TABLE `Agent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` tinyblob,
  `type` int(11) DEFAULT NULL,
  `uniqueCode` varchar(255) DEFAULT NULL,
  `biller_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3C452E551C53C8B` (`user_name`),
  KEY `FK3C452E58639540E` (`biller_id`),
  CONSTRAINT `FK3C452E551C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`),
  CONSTRAINT `FK3C452E58639540E` FOREIGN KEY (`biller_id`) REFERENCES `Biller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agent`
--

/*!40000 ALTER TABLE `Agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agent` ENABLE KEYS */;


--
-- Definition of table `Agents_CollectionItems`
--

DROP TABLE IF EXISTS `Agents_CollectionItems`;
CREATE TABLE `Agents_CollectionItems` (
  `agent_id` bigint(20) NOT NULL,
  `colectionItem_id` bigint(20) NOT NULL,
  KEY `FKDD0539144B13CFA` (`colectionItem_id`),
  KEY `FKDD05391A2A77646` (`agent_id`),
  CONSTRAINT `FKDD0539144B13CFA` FOREIGN KEY (`colectionItem_id`) REFERENCES `CollectionItem` (`id`),
  CONSTRAINT `FKDD05391A2A77646` FOREIGN KEY (`agent_id`) REFERENCES `Agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Agents_CollectionItems`
--

/*!40000 ALTER TABLE `Agents_CollectionItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agents_CollectionItems` ENABLE KEYS */;


--
-- Definition of table `Approver`
--

DROP TABLE IF EXISTS `Approver`;
CREATE TABLE `Approver` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `userGroup_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `FK4A7FCAE551C53C8B` (`user_name`),
  KEY `FK4A7FCAE5B459C446` (`corporate_id`),
  KEY `FK4A7FCAE575027B09` (`userGroup_id`),
  CONSTRAINT `FK4A7FCAE551C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`),
  CONSTRAINT `FK4A7FCAE575027B09` FOREIGN KEY (`userGroup_id`) REFERENCES `Approver` (`id`),
  CONSTRAINT `FK4A7FCAE5B459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Approver`
--

/*!40000 ALTER TABLE `Approver` DISABLE KEYS */;
INSERT INTO `Approver` (`DTYPE`,`id`,`enable`,`name`,`corporate_id`,`user_name`,`userGroup_id`) VALUES 
 ('CorporateUser',1,0x01,'oni ,samson',26,'sam@justjava.com',NULL);
/*!40000 ALTER TABLE `Approver` ENABLE KEYS */;


--
-- Definition of table `bank`
--

DROP TABLE IF EXISTS `Bank`;
CREATE TABLE `Bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bank`
--

/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;
INSERT INTO `Bank` (`id`,`code`,`name`) VALUES 
 (1,'044 ','ACCESS BANK PLC '),
 (2,'014 ','MAIN STREET BANK NIGERIA PLC '),
 (3,'082 ','KEYSTONE BANK PLC '),
 (4,'063 ','DIAMOND BANK PLC '),
 (5,'050','ECOBANK NIGERIA PLC '),
 (6,'07','FIDELITY BANK PLC '),
 (7,'011 ','FIRST BANK OF NIGERIA PLC '),
 (8,'214 ','FIRST CITY MONUMENT BANK PLC '),
 (9,'058 ','GUARANTY TRUST BANK PLC '),
 (10,'221 ','STANBIC IBTC BANK PLC '),
 (11,'023 ','CITI BANK '),
 (12,'076 ','SKYE BANK PLC '),
 (13,'084 ','ENTERPRISE BANK PLC '),
 (14,'068 ','STANDARD CHARTERED BANK PLC '),
 (15,'232 ','STERLING BANK PLC '),
 (16,'032 ','UNION BANK OF NIGERIA PLC '),
 (17,'033 ','UNITED BANK FOR AFRICA PLC '),
 (18,'215 ','UNITY BANK PLC '),
 (19,'035 ','WEMA BANK PLC '),
 (20,'057 ','ZENITH INTERNATIONAL BANK PLC '),
 (21,'030 ','HERITAGE BANK '),
 (22,'301','JAIZ BANK ');
/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;


--
-- Definition of table `Biller`
--

DROP TABLE IF EXISTS `Biller`;
CREATE TABLE `Biller` (
  `rccNo` varchar(255) DEFAULT NULL,
  `registerBy` varchar(255) DEFAULT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `sidRequired` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `sectorOfBusiness_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK769A3714DB0C82AE` (`sectorOfBusiness_id`),
  KEY `FK769A3714A09C7A66` (`id`),
  CONSTRAINT `FK769A3714A09C7A66` FOREIGN KEY (`id`) REFERENCES `AccountOwnerDetail` (`id`),
  CONSTRAINT `FK769A3714DB0C82AE` FOREIGN KEY (`sectorOfBusiness_id`) REFERENCES `SectorOfBusiness` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Biller`
--

/*!40000 ALTER TABLE `Biller` DISABLE KEYS */;
/*!40000 ALTER TABLE `Biller` ENABLE KEYS */;


--
-- Definition of table `BillerUser`
--

DROP TABLE IF EXISTS `BillerUser`;
CREATE TABLE `BillerUser`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biller_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA1E8ECFF51C53C8B` (`user_name`),
  KEY `FKA1E8ECFF8639540E` (`biller_id`),
  CONSTRAINT `FKA1E8ECFF51C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`),
  CONSTRAINT `FKA1E8ECFF8639540E` FOREIGN KEY (`biller_id`) REFERENCES `Biller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BillerUser`
--

/*!40000 ALTER TABLE `BillerUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `BillerUser` ENABLE KEYS */;


--
-- Definition of table `CalculatorItems`
--

DROP TABLE IF EXISTS `CalculatorItems`;
CREATE TABLE `CalculatorItems` (
  `calculator_id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `FKC47ED5BEF026514` (`calculator_id`),
  CONSTRAINT `FKC47ED5BEF026514` FOREIGN KEY (`calculator_id`) REFERENCES `PensionCalculator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CalculatorItems`
--

/*!40000 ALTER TABLE `CalculatorItems` DISABLE KEYS */;
INSERT INTO `CalculatorItems` (`calculator_id`,`active`,`amount`,`name`) VALUES 
 (1,0x01,NULL,'BASIC ALLOWANCE'),
 (1,0x01,NULL,'HOUSING ALLOWANCE'),
 (1,0x01,NULL,'TRANSPORT ALLOWANCE');
/*!40000 ALTER TABLE `CalculatorItems` ENABLE KEYS */;


--
-- Definition of table `CollectionItem`
--

DROP TABLE IF EXISTS `CollectionItem`;
CREATE TABLE `CollectionItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expectedAmount` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `biller_id` bigint(20) DEFAULT NULL,
  `identifier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD6CAEAF1A6534A46` (`account_id`),
  KEY `FKD6CAEAF14ED7FC6C` (`identifier_id`),
  KEY `FKD6CAEAF18639540E` (`biller_id`),
  CONSTRAINT `FKD6CAEAF14ED7FC6C` FOREIGN KEY (`identifier_id`) REFERENCES `CustomerIdentifier` (`id`),
  CONSTRAINT `FKD6CAEAF18639540E` FOREIGN KEY (`biller_id`) REFERENCES `Biller` (`id`),
  CONSTRAINT `FKD6CAEAF1A6534A46` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CollectionItem`
--

/*!40000 ALTER TABLE `CollectionItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionItem` ENABLE KEYS */;


--
-- Definition of table `CompanyPayItem`
--

DROP TABLE IF EXISTS `CompanyPayItem`;
CREATE TABLE `CompanyPayItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `payItem_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK858A289ED10F92E` (`company_id`),
  KEY `FK858A289EACDD1B78` (`payItem_code`),
  CONSTRAINT `FK858A289EACDD1B78` FOREIGN KEY (`payItem_code`) REFERENCES `PayItem` (`code`),
  CONSTRAINT `FK858A289ED10F92E` FOREIGN KEY (`company_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CompanyPayItem`
--

/*!40000 ALTER TABLE `CompanyPayItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyPayItem` ENABLE KEYS */;


--
-- Definition of table `Corporate`
--

DROP TABLE IF EXISTS `Corporate`;
CREATE TABLE `Corporate` (
  `RSAHolderContribution` double NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `companyContribution` double NOT NULL,
  `corporatePhoneNumber` varchar(255) DEFAULT NULL,
  `disabled` bit(1) NOT NULL,
  `highestApprovalLevel` int(11) NOT NULL,
  `periodMoved` int(11) NOT NULL,
  `periodReach` int(11) NOT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `accountToDebit` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `deductionType` int(11) DEFAULT NULL,
  `naration` varchar(255) DEFAULT NULL,
  `rcNo` varchar(255) DEFAULT NULL,
  `receiving` bit(1) NOT NULL,
  `terminalId` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `yearReach` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `sectorOfBusiness_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2C8228452823D40E` (`bank_id`),
  KEY `FK2C822845DB0C82AE` (`sectorOfBusiness_id`),
  KEY `FK2C822845A09C7A66` (`id`),
  CONSTRAINT `FK2C8228452823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`),
  CONSTRAINT `FK2C822845A09C7A66` FOREIGN KEY (`id`) REFERENCES `AccountOwnerDetail` (`id`),
  CONSTRAINT `FK2C822845DB0C82AE` FOREIGN KEY (`sectorOfBusiness_id`) REFERENCES `SectorOfBusiness` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Corporate`
--

/*!40000 ALTER TABLE `Corporate` DISABLE KEYS */;
INSERT INTO `Corporate` (`RSAHolderContribution`,`address`,`companyContribution`,`corporatePhoneNumber`,`disabled`,`highestApprovalLevel`,`periodMoved`,`periodReach`,`accountName`,`accountNumber`,`accountToDebit`,`amount`,`deductionType`,`naration`,`rcNo`,`receiving`,`terminalId`,`website`,`yearReach`,`id`,`bank_id`,`sectorOfBusiness_id`) VALUES 
 (8,'STOCK EXCHANGE HOUSE',10,'',0x00,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'',0x00,NULL,'',0,26,NULL,NULL);
/*!40000 ALTER TABLE `Corporate` ENABLE KEYS */;


--
-- Definition of table `Corporate_Approver`
--

DROP TABLE IF EXISTS `Corporate_Approver`;
CREATE TABLE `Corporate_Approver` (
  `Corporate_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `userGroups_id` bigint(20) NOT NULL,
  UNIQUE KEY `users_id` (`users_id`),
  UNIQUE KEY `userGroups_id` (`userGroups_id`),
  KEY `FK671B519FB459C446` (`Corporate_id`),
  KEY `FK671B519FC5BAA72E` (`users_id`),
  KEY `FK671B519F2DBB935E` (`userGroups_id`),
  CONSTRAINT `FK671B519F2DBB935E` FOREIGN KEY (`userGroups_id`) REFERENCES `Approver` (`id`),
  CONSTRAINT `FK671B519FB459C446` FOREIGN KEY (`Corporate_id`) REFERENCES `Corporate` (`id`),
  CONSTRAINT `FK671B519FC5BAA72E` FOREIGN KEY (`users_id`) REFERENCES `approver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Aorporate_Approver`
--

/*!40000 ALTER TABLE `Corporate_Approver` DISABLE KEYS */;
/*!40000 ALTER TABLE `Corporate_Approver` ENABLE KEYS */;


--
-- Definition of table `Corporate_CorporateApprover`
--

DROP TABLE IF EXISTS `Corporate_CorporateApprover`;
CREATE TABLE `Corporate_CorporateApprover` (
  `Corporate_id` bigint(20) NOT NULL,
  `approvers_id` bigint(20) NOT NULL,
  UNIQUE KEY `approvers_id` (`approvers_id`),
  KEY `FK4D2348B0B459C446` (`Corporate_id`),
  KEY `FK4D2348B02531CFA2` (`approvers_id`),
  CONSTRAINT `FK4D2348B02531CFA2` FOREIGN KEY (`approvers_id`) REFERENCES `CorporateApprover` (`id`),
  CONSTRAINT `FK4D2348B0B459C446` FOREIGN KEY (`Corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Corporate_CorporateApprover`
--

/*!40000 ALTER TABLE `Corporate_CorporateApprover` DISABLE KEYS */;
/*!40000 ALTER TABLE `Corporate_CorporateApprover` ENABLE KEYS */;


--
-- Definition of table `corporate_items`
--

DROP TABLE IF EXISTS `Corporate_Items`;
CREATE TABLE `Corporate_Items` (
  `Corporate_id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `compulsory` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `FK266C6B46B459C446` (`Corporate_id`),
  CONSTRAINT `FK266C6B46B459C446` FOREIGN KEY (`Corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `corporate_items`
--

/*!40000 ALTER TABLE `Corporate_Items` DISABLE KEYS */;
INSERT INTO `Corporate_Items` (`Corporate_id`,`active`,`code`,`compulsory`,`name`) VALUES 
 (26,0x00,'BAS',0x00,'BASIC ALLOWANCE'),
 (26,0x00,'HOUS',0x00,'HOUSING ALLOWANCE'),
 (26,0x00,'TRAN',0x00,'TRANSPORT ALLOWANCE');
/*!40000 ALTER TABLE `Corporate_Items` ENABLE KEYS */;


--
-- Definition of table `CorporateApprover`
--

DROP TABLE IF EXISTS `CorporateApprover`;
CREATE TABLE `CorporateApprover` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `transaction` int(11) DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7CCBDE2AE06C116E` (`approver_id`),
  KEY `FK7CCBDE2AB459C446` (`corporate_id`),
  CONSTRAINT `FK7CCBDE2AB459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`),
  CONSTRAINT `FK7CCBDE2AE06C116E` FOREIGN KEY (`approver_id`) REFERENCES `Approver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CorporateApprover`
--

/*!40000 ALTER TABLE `CorporateApprover` DISABLE KEYS */;
/*!40000 ALTER TABLE `CorporateApprover` ENABLE KEYS */;


--
-- Definition of table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customerId` varchar(255) DEFAULT NULL,
  `stateIdentification` varchar(255) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27FBE3FE51C53C8B` (`user_name`),
  CONSTRAINT `FK27FBE3FE51C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;


--
-- Definition of table `CustomerIdentifier`
--

DROP TABLE IF EXISTS `CustomerIdentifier`;
CREATE TABLE `CustomerIdentifier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CustomerIdentifier`
--

/*!40000 ALTER TABLE `CustomerIdentifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerIdentifier` ENABLE KEYS */;


--
-- Definition of table `Images`
--

DROP TABLE IF EXISTS `Images`;
CREATE TABLE `Images` (
  `ID` varchar(255) NOT NULL,
  `GALLERY` varchar(255) DEFAULT NULL,
  `IMAGE` tinyblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

/*!40000 ALTER TABLE `Images` DISABLE KEYS */;
/*!40000 ALTER TABLE `Images` ENABLE KEYS */;


--
-- Definition of table `Investor`
--

DROP TABLE IF EXISTS `Investor`;
CREATE TABLE `Investor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `netPayment` decimal(19,2) DEFAULT NULL,
  `payItem1` decimal(19,2) DEFAULT NULL,
  `payItem2` decimal(19,2) DEFAULT NULL,
  `payItem3` decimal(19,2) DEFAULT NULL,
  `payItem4` decimal(19,2) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `fundManager_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK294468B84C3B4883` (`fundManager_id`),
  KEY `FK294468B8A6534A46` (`account_id`),
  CONSTRAINT `FK294468B84C3B4883` FOREIGN KEY (`fundManager_id`) REFERENCES `Corporate` (`id`),
  CONSTRAINT `FK294468B8A6534A46` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Investor`
--

/*!40000 ALTER TABLE `Investor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Investor` ENABLE KEYS */;


--
-- Definition of table `lodgecomplaint`
--

DROP TABLE IF EXISTS `LodgeComplaint`;
CREATE TABLE `LodgeComplaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(255) DEFAULT NULL,
  `dateAttendedTo` datetime DEFAULT NULL,
  `dateLodge` datetime DEFAULT NULL,
  `previousComment` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `visibleToCompany` bit(1) NOT NULL,
  `visibleToMyPFA` bit(1) NOT NULL,
  `complainant_id` bigint(20) DEFAULT NULL,
  `specialComplainant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE6DAEFACC83794D7` (`specialComplainant_id`),
  KEY `FKE6DAEFAC9BE69154` (`complainant_id`),
  CONSTRAINT `FKE6DAEFAC9BE69154` FOREIGN KEY (`complainant_id`) REFERENCES `RSAHolder` (`id`),
  CONSTRAINT `FKE6DAEFACC83794D7` FOREIGN KEY (`specialComplainant_id`) REFERENCES `PFAUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LodgeComplaint`
--

/*!40000 ALTER TABLE `LodgeComplaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `LodgeComplaint` ENABLE KEYS */;


--
-- Definition of table `MailManager`
--

DROP TABLE IF EXISTS `MailManager`;
CREATE TABLE `MailManager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `sent` bit(1) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `toAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mailmanager`
--

/*!40000 ALTER TABLE `MailManager` DISABLE KEYS */;
INSERT INTO `MailManager` (`id`,`content`,`sent`,`subject`,`toAddress`) VALUES 
 (1,' Your Username is sam@justjava.com and the password is password Please ensure to change your password during first login ',0x01,'Notification of User Credentials ','sam@justjava.com');
/*!40000 ALTER TABLE `MailManager` ENABLE KEYS */;


--
-- Definition of table `MakePayment`
--

DROP TABLE IF EXISTS `MakePayment`;
CREATE TABLE `MakePayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SID` varchar(255) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `customerEmail` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `madeBy` varchar(255) DEFAULT NULL,
  `madeFor` varchar(255) DEFAULT NULL,
  `means` varchar(255) DEFAULT NULL,
  `meansOfPayment` int(11) DEFAULT NULL,
  `meansValue` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `otherReference` varchar(255) DEFAULT NULL,
  `paid` bit(1) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `biller_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK816384182001FB6C` (`item_id`),
  KEY `FK816384182823D40E` (`bank_id`),
  KEY `FK816384188639540E` (`biller_id`),
  CONSTRAINT `FK816384182001FB6C` FOREIGN KEY (`item_id`) REFERENCES `CollectionItem` (`id`),
  CONSTRAINT `FK816384182823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`),
  CONSTRAINT `FK816384188639540E` FOREIGN KEY (`biller_id`) REFERENCES `Biller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MakePayment`
--

/*!40000 ALTER TABLE `MakePayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `MakePayment` ENABLE KEYS */;


--
-- Definition of table `monthlyupload`
--

DROP TABLE IF EXISTS `MonthlyUpload`;
CREATE TABLE `MonthlyUpload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateEntered` datetime DEFAULT NULL,
  `enteredBy` varchar(255) DEFAULT NULL,
  `levelReached` int(11) NOT NULL,
  `month` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  `payingAccount_id` bigint(20) DEFAULT NULL,
  `year_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6602BC4EB459C446` (`corporate_id`),
  KEY `FK6602BC4E16E90DD5` (`payingAccount_id`),
  KEY `FK6602BC4E9007FACF` (`year_id`),
  CONSTRAINT `FK6602BC4E16E90DD5` FOREIGN KEY (`payingAccount_id`) REFERENCES `TransitAccount` (`id`),
  CONSTRAINT `FK6602BC4E9007FACF` FOREIGN KEY (`year_id`) REFERENCES `PeriodYear` (`id`),
  CONSTRAINT `FK6602BC4EB459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MonthlyUpload`
--

/*!40000 ALTER TABLE `MonthlyUpload` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonthlyUpload` ENABLE KEYS */;


--
-- Definition of table `nibbsresponsedescription`
--

DROP TABLE IF EXISTS `NibbsResponseDescription`;
CREATE TABLE `NibbsResponseDescription` (
  `code` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NibbsResponseDescription`
--

/*!40000 ALTER TABLE `NibbsResponseDescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `NibbsResponseDescription` ENABLE KEYS */;


--
-- Definition of table `OXFOLDERS`
--

DROP TABLE IF EXISTS `OXFOLDERS`;
CREATE TABLE `OXFOLDERS` (
  `id` varchar(32) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `orderInFolder` int(11) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7897AB9C6988A33F` (`parent_id`),
  CONSTRAINT `FK7897AB9C6988A33F` FOREIGN KEY (`parent_id`) REFERENCES `OXFOLDERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXFOLDERS`
--

/*!40000 ALTER TABLE `OXFOLDERS` DISABLE KEYS */;
INSERT INTO `OXFOLDERS` (`id`,`name`,`orderInFolder`,`parent_id`) VALUES 
 ('40288ae94909ee8a014909ee9abf0000','Admin',9999,NULL),
 ('40288c0e4c08f9d6014c08fdefb70000','Approve',9999,NULL);
/*!40000 ALTER TABLE `OXFOLDERS` ENABLE KEYS */;


--
-- Definition of table `OXMODULES`
--

DROP TABLE IF EXISTS `OXMODULES`;
CREATE TABLE `OXMODULES` (
  `name` varchar(80) NOT NULL,
  `application` varchar(50) NOT NULL,
  `hidden` char(1) NOT NULL,
  `orderInFolder` int(11) DEFAULT NULL,
  `unrestricted` char(1) NOT NULL,
  `folder_id` varchar(32) DEFAULT NULL,
  `enterprise` char(1) NOT NULL,
  PRIMARY KEY (`name`,`application`),
  KEY `FKEA7A615ED92C8FB` (`folder_id`),
  CONSTRAINT `FKEA7A615ED92C8FB` FOREIGN KEY (`folder_id`) REFERENCES `OXFOLDERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXMODULES`
--

/*!40000 ALTER TABLE `OXMODULES` DISABLE KEYS */;
INSERT INTO `OXMODULES` (`name`,`application`,`hidden`,`orderInFolder`,`unrestricted`,`folder_id`,`enterprise`) VALUES 
 ('Account','pensionmanager','N',9999,'N',NULL,'N'),
 ('AccountOwnerDetail','pensionmanager','N',9999,'N',NULL,'N'),
 ('Agent','pensionmanager','N',9999,'N',NULL,'N'),
 ('AllCorporateUsers','pensionmanager','N',9999,'N',NULL,'N'),
 ('ApproveDebitAccount','pensionmanager','N',9999,'N','40288c0e4c08f9d6014c08fdefb70000','N'),
 ('ApproveIncomingTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('ApproveMonthlyRemittance','pensionmanager','N',9999,'N',NULL,'Y'),
 ('ApproveOutgoingTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('ApprovePayment','pensionmanager','N',9999,'N','40288c0e4c08f9d6014c08fdefb70000','N'),
 ('ApprovePensionRemittance','pensionmanager','N',9999,'N',NULL,'N'),
 ('Approver','pensionmanager','N',9999,'N',NULL,'N'),
 ('ApproveTransaction','pensionmanager','N',9999,'N',NULL,'N'),
 ('ApproveUser','pensionmanager','N',9999,'N','40288c0e4c08f9d6014c08fdefb70000','N'),
 ('BalanceEnquiry','pensionmanager','N',9999,'N',NULL,'N'),
 ('Bank','pensionmanager','N',9999,'N',NULL,'N'),
 ('Biller','pensionmanager','N',9999,'N',NULL,'N'),
 ('BillerUser','pensionmanager','N',9999,'N',NULL,'N'),
 ('ChangeInvestorContributionDetail','pensionmanager','N',9999,'N',NULL,'N'),
 ('ChangePassword','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('CloseComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('CollectionItem','pensionmanager','N',9999,'N',NULL,'N'),
 ('CollectionMade','pensionmanager','N',9999,'N',NULL,'N'),
 ('CollectionPayment','pensionmanager','N',9999,'N',NULL,'N'),
 ('CompanyPayitem','pensionmanager','N',9999,'N',NULL,'N'),
 ('ConfirmFundTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('Corporate','pensionmanager','N',9999,'N',NULL,'N'),
 ('CorporateAccountVerification','pensionmanager','N',9999,'N',NULL,'N'),
 ('CorporateApprover','pensionmanager','N',9999,'N',NULL,'N'),
 ('CorporateUser','pensionmanager','N',9999,'N',NULL,'N'),
 ('CorporateUserGroup','pensionmanager','N',9999,'N',NULL,'N'),
 ('Customer','pensionmanager','N',9999,'N',NULL,'N'),
 ('CustomerIdentifier','pensionmanager','N',9999,'N',NULL,'N'),
 ('CustomerRegistration','pensionmanager','N',9999,'N',NULL,'N'),
 ('Folder','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('FundTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('InitiatePensionRemittance','pensionmanager','N',9999,'N',NULL,'N'),
 ('Investor','pensionmanager','N',9999,'N',NULL,'N'),
 ('LodgeComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('MailManager','pensionmanager','N',9999,'N',NULL,'N'),
 ('MakePayment','pensionmanager','N',9999,'N',NULL,'N'),
 ('Module','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('ModuleRights','pensionmanager','Y',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('MonthlyUpload','pensionmanager','N',9999,'N',NULL,'Y'),
 ('MyCorporate','pensionmanager','N',9999,'N',NULL,'N'),
 ('MyPFA','pensionmanager','N',9999,'N',NULL,'N'),
 ('NibbsResponseDescription','pensionmanager','N',9999,'N',NULL,'N'),
 ('OneToManyPayment','pensionmanager','N',9999,'N',NULL,'N'),
 ('PasswordReset','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('PayBill','pensionmanager','N',9999,'N',NULL,'N'),
 ('Payer','pensionmanager','N',9999,'N',NULL,'N'),
 ('PayItem','pensionmanager','N',9999,'N',NULL,'N'),
 ('PayItemChangeLog','pensionmanager','N',9999,'N',NULL,'N'),
 ('Payment','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentBatch','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentFunding','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentInstruction','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentMadeToMe','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentOption','pensionmanager','N',9999,'N',NULL,'N'),
 ('PaymentUpload','pensionmanager','N',9999,'N',NULL,'N'),
 ('PensionCalculator','pensionmanager','N',9999,'Y',NULL,'N'),
 ('PensionFundAdministrator','pensionmanager','N',9999,'N',NULL,'N'),
 ('PensionFundCustodian','pensionmanager','N',9999,'N',NULL,'N'),
 ('PensionPayitemSetup','pensionmanager','N',9999,'N',NULL,'N'),
 ('PeriodicRSAHoldersViewByPFA','pensionmanager','N',9999,'N',NULL,'N'),
 ('PeriodicViewOfRSAHoldersByPFC','pensionmanager','N',9999,'N',NULL,'N'),
 ('PeriodYear','pensionmanager','N',9999,'N',NULL,'N'),
 ('PFAToPFAFundTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('PFATransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('PFAUser','pensionmanager','N',9999,'N',NULL,'N'),
 ('PFCUser','pensionmanager','N',9999,'N',NULL,'N'),
 ('Profile','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('RegisterBiller','pensionmanager','N',9999,'N',NULL,'N'),
 ('RegisterInvestor','pensionmanager','N',9999,'N',NULL,'N'),
 ('RegisterPersonalContribution','pensionmanager','N',9999,'N',NULL,'N'),
 ('Remit','pensionmanager','N',9999,'N',NULL,'N'),
 ('RemitPension','pensionmanager','N',9999,'N',NULL,'N'),
 ('ReportController','pensionmanager','N',9999,'N',NULL,'N'),
 ('ReportControllerPFA','pensionmanager','N',9999,'N',NULL,'N'),
 ('ReportControllerPFC','pensionmanager','N',9999,'N',NULL,'N'),
 ('Role','pensionmanager','N',9999,'N',NULL,'N'),
 ('RSAHolder','pensionmanager','N',9999,'N',NULL,'N'),
 ('RSAPayItem','pensionmanager','N',9999,'N',NULL,'N'),
 ('ScratchCard','pensionmanager','N',9999,'N',NULL,'N'),
 ('SectorOfBusiness','pensionmanager','N',9999,'N',NULL,'N'),
 ('SendForPayment','pensionmanager','N',9999,'N',NULL,'N'),
 ('SystemSetup','pensionmanager','N',9999,'N',NULL,'N'),
 ('SystemWideSetup','pensionmanager','N',9999,'N',NULL,'N'),
 ('Transaction','pensionmanager','N',9999,'N',NULL,'N'),
 ('TransitAccount','pensionmanager','N',9999,'N',NULL,'N'),
 ('UpdatePFATransferStatus','pensionmanager','N',9999,'N',NULL,'N'),
 ('UploadLog','pensionmanager','N',9999,'N',NULL,'N'),
 ('User','pensionmanager','N',9999,'N','40288ae94909ee8a014909ee9abf0000','N'),
 ('VerifyIncomingTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('VerifyOutgoingTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewAccountBalance','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewClientComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewContributorsRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewCorporateUser','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewGlobalPensionRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewGlobalRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewGlobalTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewMyComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewMyContribution','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewMyPensionContribution','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewMyRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewPensionRecordPerPeriod','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewPFAPensionRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewPFCPensionRecord','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewRSAHolderRecords','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewStatusOfMyComplaint','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewStatusofMyTransfer','pensionmanager','N',9999,'N',NULL,'N'),
 ('ViewVerifiedAccount','pensionmanager','N',9999,'N',NULL,'N');
/*!40000 ALTER TABLE `OXMODULES` ENABLE KEYS */;


--
-- Definition of table `OXROLES`
--

DROP TABLE IF EXISTS `OXROLES`;
CREATE TABLE `OXROLES` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXROLES`
--

/*!40000 ALTER TABLE `OXROLES` DISABLE KEYS */;
INSERT INTO `OXROLES` (`name`) VALUES 
 ('accountOfficer'),
 ('admin'),
 ('companyAdmin'),
 ('pencommAdmin'),
 ('pfaAdmin'),
 ('pfcAdmin'),
 ('RSAHolder');
/*!40000 ALTER TABLE `OXROLES` ENABLE KEYS */;


--
-- Definition of table `OXROLES_OXMODULES`
--

DROP TABLE IF EXISTS `OXROLES_OXMODULES`;
CREATE TABLE `OXROLES_OXMODULES` (
  `excludedActions` longtext,
  `modules_name` varchar(80) NOT NULL,
  `modules_application` varchar(50) NOT NULL,
  `roles_name` varchar(30) NOT NULL,
  PRIMARY KEY (`roles_name`,`modules_name`,`modules_application`),
  KEY `FKA3F1D933CB6A3584` (`roles_name`),
  KEY `FKA3F1D93343A39D48` (`modules_name`,`modules_application`),
  CONSTRAINT `FKA3F1D933CB6A3584` FOREIGN KEY (`roles_name`) REFERENCES `OXROLES` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXROLES_OXMODULES`
--

/*!40000 ALTER TABLE `OXROLES_OXMODULES` DISABLE KEYS */;
INSERT INTO `OXROLES_OXMODULES` (`excludedActions`,`modules_name`,`modules_application`,`roles_name`) VALUES 
 (NULL,'Bank','pensionmanager','admin'),
 (NULL,'Corporate','pensionmanager','admin'),
 (NULL,'Module','pensionmanager','admin'),
 (NULL,'PayItem','pensionmanager','admin'),
 (NULL,'PensionFundAdministrator','pensionmanager','admin'),
 (NULL,'PensionFundCustodian','pensionmanager','admin'),
 (NULL,'Profile','pensionmanager','admin'),
 (NULL,'Role','pensionmanager','admin'),
 (NULL,'SystemWideSetup','pensionmanager','admin'),
 (NULL,'User','pensionmanager','admin'),
 (NULL,'CorporateUser','pensionmanager','companyAdmin'),
 (NULL,'MonthlyUpload','pensionmanager','companyAdmin'),
 (NULL,'MyCorporate','pensionmanager','companyAdmin'),
 (NULL,'Profile','pensionmanager','companyAdmin'),
 (NULL,'RSAHolder','pensionmanager','companyAdmin'),
 (NULL,'ViewComplaint','pensionmanager','companyAdmin'),
 (NULL,'ViewPensionRecordPerPeriod','pensionmanager','companyAdmin'),
 (NULL,'CloseComplaint','pensionmanager','pencommAdmin'),
 (NULL,'PFAToPFAFundTransfer','pensionmanager','pencommAdmin'),
 (NULL,'ReportController','pensionmanager','pencommAdmin'),
 (NULL,'ViewGlobalPensionRecord','pensionmanager','pencommAdmin'),
 (NULL,'ViewGlobalTransfer','pensionmanager','pencommAdmin'),
 (NULL,'ApproveOutgoingTransfer','pensionmanager','pfaAdmin'),
 (NULL,'ConfirmFundTransfer','pensionmanager','pfaAdmin'),
 (NULL,'MyPFA','pensionmanager','pfaAdmin'),
 (NULL,'UpdatePFATransferStatus','pensionmanager','pfaAdmin'),
 (NULL,'VerifyIncomingTransfer','pensionmanager','pfaAdmin'),
 (NULL,'ViewClientComplaint','pensionmanager','pfaAdmin'),
 (NULL,'ViewContributorsRecord','pensionmanager','pfaAdmin'),
 (NULL,'ViewPFCPensionRecord','pensionmanager','pfcAdmin'),
 (NULL,'ViewRSAHolderRecords','pensionmanager','pfcAdmin'),
 (NULL,'LodgeComplaint','pensionmanager','RSAHolder'),
 (NULL,'PFATransfer','pensionmanager','RSAHolder'),
 (NULL,'ViewMyComplaint','pensionmanager','RSAHolder'),
 (NULL,'ViewMyPensionContribution','pensionmanager','RSAHolder'),
 (NULL,'ViewMyRecord','pensionmanager','RSAHolder'),
 (NULL,'ViewStatusOfMyComplaint','pensionmanager','RSAHolder'),
 (NULL,'ViewStatusofMyTransfer','pensionmanager','RSAHolder');
/*!40000 ALTER TABLE `OXROLES_OXMODULES` ENABLE KEYS */;


--
-- Definition of table `OXUSERS`
--

DROP TABLE IF EXISTS `OXUSERS`;
CREATE TABLE `OXUSERS` (
  `name` varchar(30) NOT NULL,
  `active` char(1) NOT NULL,
  `authenticateWithLDAP` char(1) NOT NULL,
  `birthDate` datetime DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `familyName` varchar(30) DEFAULT NULL,
  `givenName` varchar(30) DEFAULT NULL,
  `jobTitle` varchar(30) DEFAULT NULL,
  `middleName` varchar(30) DEFAULT NULL,
  `nickName` varchar(30) DEFAULT NULL,
  `password` varchar(41) DEFAULT NULL,
  `firstLogin` bit(1) NOT NULL,
  `loginAttempt` int(11) NOT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXUSERS`
--

/*!40000 ALTER TABLE `OXUSERS` DISABLE KEYS */;
INSERT INTO `OXUSERS` (`name`,`active`,`authenticateWithLDAP`,`birthDate`,`email`,`familyName`,`givenName`,`jobTitle`,`middleName`,`nickName`,`password`,`firstLogin`,`loginAttempt`,`phoneNumber`,`address`) VALUES 
 ('admin','Y','N',NULL,'akinrinde@justjava.com.ng','admin','admin','','','','-2fcc1dd51cb7514a99f03debf513ca7af3b25669',0x01,0,'',''),
 ('sam@justjava.com','Y','N',NULL,'sam@justjava.com','oni','samson','',NULL,NULL,'-d6f45e4eb5d342b550477b7c7f867a1acd4f1a1',0x01,0,'07031149513','');
/*!40000 ALTER TABLE `OXUSERS` ENABLE KEYS */;


--
-- Definition of table `OXUSERS_OXROLES`
--

DROP TABLE IF EXISTS `OXUSERS_OXROLES`;
CREATE TABLE `OXUSERS_OXROLES` (
  `OXUSERS_name` varchar(30) NOT NULL,
  `roles_name` varchar(30) NOT NULL,
  KEY `FKFCD643B4F31CF717` (`OXUSERS_name`),
  KEY `FKFCD643B4CB6A3584` (`roles_name`),
  CONSTRAINT `FKFCD643B4CB6A3584` FOREIGN KEY (`roles_name`) REFERENCES `OXROLES` (`name`),
  CONSTRAINT `FKFCD643B4F31CF717` FOREIGN KEY (`OXUSERS_name`) REFERENCES `OXUSERS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OXUSERS_OXROLES`
--

/*!40000 ALTER TABLE `OXUSERS_OXROLES` DISABLE KEYS */;
INSERT INTO `OXUSERS_OXROLES` (`OXUSERS_name`,`roles_name`) VALUES 
 ('admin','admin'),
 ('sam@justjava.com','companyAdmin');
/*!40000 ALTER TABLE `OXUSERS_OXROLES` ENABLE KEYS */;


--
-- Definition of table `payer`
--

DROP TABLE IF EXISTS `Payer`;
CREATE TABLE `Payer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Payer`
--

/*!40000 ALTER TABLE `Payer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payer` ENABLE KEYS */;


--
-- Definition of table `payer_account`
--

DROP TABLE IF EXISTS `Payer_Account`;
CREATE TABLE `Payer_Account` (
  `Payer_id` bigint(20) NOT NULL,
  `payingAccounts_id` bigint(20) NOT NULL,
  UNIQUE KEY `payingAccounts_id` (`payingAccounts_id`),
  KEY `FKE46907039DE5D446` (`Payer_id`),
  KEY `FKE46907037DED0373` (`payingAccounts_id`),
  CONSTRAINT `FKE46907037DED0373` FOREIGN KEY (`payingAccounts_id`) REFERENCES `Account` (`id`),
  CONSTRAINT `FKE46907039DE5D446` FOREIGN KEY (`Payer_id`) REFERENCES `Payer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Payer_Account`
--

/*!40000 ALTER TABLE `Payer_Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payer_Account` ENABLE KEYS */;


--
-- Definition of table `payitem`
--

DROP TABLE IF EXISTS `PayItem`;
CREATE TABLE `PayItem` (
  `code` varchar(15) NOT NULL,
  `compulsory` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PayItem`
--

/*!40000 ALTER TABLE `PayItem` DISABLE KEYS */;
INSERT INTO `PayItem` (`code`,`compulsory`,`name`) VALUES 
 ('BAS',0x01,'BASIC ALLOWANCE'),
 ('HOUS',0x01,'HOUSING ALLOWANCE'),
 ('TRAN',0x01,'TRANSPORT ALLOWANCE');
/*!40000 ALTER TABLE `PayItem` ENABLE KEYS */;


--
-- Definition of table `PayItemChangeLog`
--

DROP TABLE IF EXISTS `PayItemChangeLog`;
CREATE TABLE `PayItemChangeLog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemCode` varchar(255) DEFAULT NULL,
  `monthChanged` int(11) NOT NULL,
  `newAmount` decimal(19,2) DEFAULT NULL,
  `previousAmount` decimal(19,2) DEFAULT NULL,
  `rsaHolderId` bigint(20) DEFAULT NULL,
  `yearChanged` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PayItemChangeLog`
--

/*!40000 ALTER TABLE `PayItemChangeLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayItemChangeLog` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `narration` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0',
  `alreadyPaid` int(11) DEFAULT NULL,
  `batchNumber` bigint(20) DEFAULT NULL,
  `batchSummary` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL,
  `queryString` varchar(255) DEFAULT NULL,
  `referenceId` varchar(255) DEFAULT NULL,
  `softToken` varchar(255) DEFAULT NULL,
  `switching` int(11) DEFAULT NULL,
  `totalAmount` decimal(19,2) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `payingAccount_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3454C9E6A6534A46` (`account_id`),
  KEY `FK3454C9E63BE0B72` (`owner_id`),
  KEY `FK3454C9E616E90DD5` (`payingAccount_id`),
  CONSTRAINT `FK3454C9E616E90DD5` FOREIGN KEY (`payingAccount_id`) REFERENCES `TransitAccount` (`id`),
  CONSTRAINT `FK3454C9E63BE0B72` FOREIGN KEY (`owner_id`) REFERENCES `AccountOwnerDetail` (`id`),
  CONSTRAINT `FK3454C9E6A6534A46` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Payment`
--

/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;


--
-- Definition of table `Payment_PaymentInstruction`
--

DROP TABLE IF EXISTS `Payment_PaymentInstruction`;
CREATE TABLE `Payment_PaymentInstruction` (
  `Payment_id` bigint(20) NOT NULL,
  `payments_id` bigint(20) NOT NULL,
  UNIQUE KEY `payments_id` (`payments_id`),
  KEY `FK8B1E35C1F42012E9` (`payments_id`),
  KEY `FK8B1E35C1115082E` (`Payment_id`),
  CONSTRAINT `FK8B1E35C1115082E` FOREIGN KEY (`Payment_id`) REFERENCES `Payment` (`id`),
  CONSTRAINT `FK8B1E35C1F42012E9` FOREIGN KEY (`payments_id`) REFERENCES `PaymentInstruction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Payment_PaymentInstruction`
--

/*!40000 ALTER TABLE `Payment_PaymentInstruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment_PaymentInstruction` ENABLE KEYS */;


--
-- Definition of table `paymentinstruction`
--

DROP TABLE IF EXISTS `PaymentInstruction`;
CREATE TABLE `PaymentInstruction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `beneficiaryId` varchar(255) DEFAULT NULL,
  `fundGateMessage` varchar(255) DEFAULT NULL,
  `fundGateStatus` varchar(255) DEFAULT NULL,
  `initiator` varchar(255) DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sourceReference` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `fromAccount_id` bigint(20) DEFAULT NULL,
  `paymentBatch_id` bigint(20) DEFAULT NULL,
  `toAccount_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6900BEC896715570` (`fromAccount_id`),
  KEY `FK6900BEC8BD834EE` (`paymentBatch_id`),
  KEY `FK6900BEC8B1FBBB01` (`toAccount_id`),
  CONSTRAINT `FK6900BEC896715570` FOREIGN KEY (`fromAccount_id`) REFERENCES `Account` (`id`),
  CONSTRAINT `FK6900BEC8B1FBBB01` FOREIGN KEY (`toAccount_id`) REFERENCES `Account` (`id`),
  CONSTRAINT `FK6900BEC8BD834EE` FOREIGN KEY (`paymentBatch_id`) REFERENCES `Payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentinstruction`
--

/*!40000 ALTER TABLE `PaymentInstruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentInstruction` ENABLE KEYS */;


--
-- Definition of table `PaymentOption`
--

DROP TABLE IF EXISTS `PaymentOption`;
CREATE TABLE `PaymentOption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paymentOption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PaymentOption`
--

/*!40000 ALTER TABLE `PaymentOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentOption` ENABLE KEYS */;


--
-- Definition of table `paymentupload`
--

DROP TABLE IF EXISTS `PaymentUpload`;
CREATE TABLE `PaymentUpload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `accountnumber` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `beneficiaryId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `sourceReference` varchar(255) DEFAULT NULL,
  `treated` bit(1) NOT NULL,
  `uploader` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK881C3F872823D40E` (`bank_id`),
  CONSTRAINT `FK881C3F872823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PaymentUpload`
--

/*!40000 ALTER TABLE `PaymentUpload` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentUpload` ENABLE KEYS */;


--
-- Definition of table `pensioncalculator`
--

DROP TABLE IF EXISTS `PensionCalculator`;
CREATE TABLE `PensionCalculator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employeeRate` double NOT NULL,
  `employerRate` double NOT NULL,
  `voluntaryContribution` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pensioncalculator`
--

/*!40000 ALTER TABLE `PensionCalculator` DISABLE KEYS */;
INSERT INTO `PensionCalculator` (`id`,`employeeRate`,`employerRate`,`voluntaryContribution`) VALUES 
 (1,8,0,NULL);
/*!40000 ALTER TABLE `PensionCalculator` ENABLE KEYS */;


--
-- Definition of table `PensionFundAdministrator`
--

DROP TABLE IF EXISTS `PensionFundAdministrator`;
CREATE TABLE `PensionFundAdministrator` (
  `rcNo` varchar(255) DEFAULT NULL,
  `registerBy` varchar(255) DEFAULT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `custodian_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26F1867AA09C7A66` (`id`),
  KEY `FK26F1867AD1E224DB` (`custodian_id`),
  CONSTRAINT `FK26F1867AA09C7A66` FOREIGN KEY (`id`) REFERENCES `AccountOwnerDetail` (`id`),
  CONSTRAINT `FK26F1867AD1E224DB` FOREIGN KEY (`custodian_id`) REFERENCES `PensionFundCustodian` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PensionFundAdministrator`
--

/*!40000 ALTER TABLE `PensionFundAdministrator` DISABLE KEYS */;
INSERT INTO `PensionFundAdministrator` (`rcNo`,`registerBy`,`registeredDate`,`id`,`custodian_id`) VALUES 
 ('','admin','2016-02-04 00:00:00',5,2),
 ('','admin','2016-02-04 00:00:00',6,2),
 ('','admin','2016-02-04 00:00:00',7,3),
 ('','admin','2016-02-04 00:00:00',8,2),
 ('','admin','2016-02-04 00:00:00',9,1),
 ('','admin','2016-02-04 00:00:00',10,2),
 ('','admin','2016-02-04 00:00:00',11,2),
 ('','admin','2016-02-04 00:00:00',12,1),
 ('','admin','2016-02-04 00:00:00',13,4),
 ('','admin','2016-02-04 00:00:00',14,3),
 ('','admin','2016-02-04 00:00:00',15,4),
 ('','admin','2016-02-04 00:00:00',16,1),
 ('','admin','2016-02-04 00:00:00',17,2),
 ('','admin','2016-02-04 00:00:00',18,2),
 ('','admin','2016-02-04 00:00:00',19,3),
 ('','admin','2016-02-04 00:00:00',20,2),
 ('','admin','2016-02-04 00:00:00',21,3),
 ('','admin','2016-02-04 00:00:00',22,4),
 ('','admin','2016-02-04 00:00:00',23,4),
 ('','admin','2016-02-04 00:00:00',24,2),
 ('','admin','2016-02-11 00:00:00',27,2),
 ('','admin','2016-02-11 00:00:00',28,4),
 ('','admin','2016-02-11 00:00:00',29,1);
/*!40000 ALTER TABLE `PensionFundAdministrator` ENABLE KEYS */;


--
-- Definition of table `pensionfundcustodian`
--

DROP TABLE IF EXISTS `PensionFundCustodian`;
CREATE TABLE `PensionFundCustodian` (
  `rcNo` varchar(255) DEFAULT NULL,
  `registerBy` varchar(255) DEFAULT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `pensionAccount_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC83141B26235C14` (`pensionAccount_id`),
  KEY `FKBC83141BA09C7A66` (`id`),
  CONSTRAINT `FKBC83141B26235C14` FOREIGN KEY (`pensionAccount_id`) REFERENCES `Account` (`id`),
  CONSTRAINT `FKBC83141BA09C7A66` FOREIGN KEY (`id`) REFERENCES `AccountOwnerDetail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PensionFundCustodian`
--

/*!40000 ALTER TABLE `PensionFundCustodian` DISABLE KEYS */;
INSERT INTO `PensionFundCustodian` (`rcNo`,`registerBy`,`registeredDate`,`id`,`pensionAccount_id`) VALUES 
 ('','admin','2016-02-04 00:00:00',1,1),
 ('','admin','2016-02-04 00:00:00',2,2),
 ('','admin','2016-02-04 00:00:00',3,3),
 ('','admin','2016-02-04 00:00:00',4,4);
/*!40000 ALTER TABLE `PensionFundCustodian` ENABLE KEYS */;


--
-- Definition of table `periodyear`
--

DROP TABLE IF EXISTS `PeriodYear`;
CREATE TABLE `PeriodYear` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PeriodYear`
--

/*!40000 ALTER TABLE `PeriodYear` DISABLE KEYS */;
INSERT INTO `PeriodYear` (`id`,`year`) VALUES 
 (1,2014),
 (2,2015),
 (3,2016);
/*!40000 ALTER TABLE `PeriodYear` ENABLE KEYS */;


--
-- Definition of table `PFATransfer`
--

DROP TABLE IF EXISTS `PFATransfer`;
CREATE TABLE `PFATransfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amountToDate` decimal(19,2) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `dateApproved` datetime DEFAULT NULL,
  `dateEntered` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `RSAHolder_id` bigint(20) DEFAULT NULL,
  `outgoing_id` bigint(20) DEFAULT NULL,
  `pfa_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4920161672C9B8DD` (`pfa_id`),
  KEY `FK49201616867482FC` (`outgoing_id`),
  KEY `FK492016165648AB06` (`RSAHolder_id`),
  CONSTRAINT `FK492016165648AB06` FOREIGN KEY (`RSAHolder_id`) REFERENCES `RSAHolder` (`id`),
  CONSTRAINT `FK4920161672C9B8DD` FOREIGN KEY (`pfa_id`) REFERENCES `PensionFundAdministrator` (`id`),
  CONSTRAINT `FK49201616867482FC` FOREIGN KEY (`outgoing_id`) REFERENCES `PensionFundAdministrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PFATransfer`
--

/*!40000 ALTER TABLE `PFATransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `PFATransfer` ENABLE KEYS */;


--
-- Definition of table `pfauser`
--

DROP TABLE IF EXISTS `PFAUser`;
CREATE TABLE `PFAUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pfa_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK322177672C9B8DD` (`pfa_id`),
  KEY `FK322177651C53C8B` (`user_name`),
  CONSTRAINT `FK322177651C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`),
  CONSTRAINT `FK322177672C9B8DD` FOREIGN KEY (`pfa_id`) REFERENCES `PensionFundAdministrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PFAUser`
--

/*!40000 ALTER TABLE `PFAUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `PFAUser` ENABLE KEYS */;


--
-- Definition of table `PFCUser`
--

DROP TABLE IF EXISTS `PFCUser`;
CREATE TABLE `PFCUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pfc_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33E467851C53C8B` (`user_name`),
  KEY `FK33E4678374B293C` (`pfc_id`),
  CONSTRAINT `FK33E4678374B293C` FOREIGN KEY (`pfc_id`) REFERENCES `PensionFundCustodian` (`id`),
  CONSTRAINT `FK33E467851C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PFCUser`
--

/*!40000 ALTER TABLE `PFCUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `PFCUser` ENABLE KEYS */;


--
-- Definition of table `profile`
--

DROP TABLE IF EXISTS `Profile`;
CREATE TABLE `Profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approver` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `transaction` int(11) DEFAULT NULL,
  `universal` bit(1) NOT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  `role_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50C72189518E6F6B` (`role_name`),
  KEY `FK50C72189B459C446` (`corporate_id`),
  CONSTRAINT `FK50C72189518E6F6B` FOREIGN KEY (`role_name`) REFERENCES `OXROLES` (`name`),
  CONSTRAINT `FK50C72189B459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Profile`
--

/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
INSERT INTO `Profile` (`id`,`approver`,`level`,`transaction`,`universal`,`corporate_id`,`role_name`) VALUES 
 (1,0x00,0,NULL,0x01,NULL,'companyAdmin');
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;


--
-- Definition of table `RegisterBiller`
--

DROP TABLE IF EXISTS `RegisterBiller`;
CREATE TABLE `RegisterBiller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `registerBy` varchar(255) DEFAULT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `biller_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK89FA6B978639540E` (`biller_id`),
  CONSTRAINT `FK89FA6B978639540E` FOREIGN KEY (`biller_id`) REFERENCES `Biller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RegisterBiller`
--

/*!40000 ALTER TABLE `RegisterBiller` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegisterBiller` ENABLE KEYS */;


--
-- Definition of table `RemitPension`
--

DROP TABLE IF EXISTS `RemitPension`;
CREATE TABLE `RemitPension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `dateEntered` datetime DEFAULT NULL,
  `enteredBy` varchar(255) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `softToken` varchar(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  `payingAccount_id` bigint(20) DEFAULT NULL,
  `payingBank_id` bigint(20) DEFAULT NULL,
  `periodYear_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK551078697EFEF894` (`payingBank_id`),
  KEY `FK551078695009B9EE` (`periodYear_id`),
  KEY `FK55107869B459C446` (`corporate_id`),
  KEY `FK5510786916E90DD5` (`payingAccount_id`),
  CONSTRAINT `FK5510786916E90DD5` FOREIGN KEY (`payingAccount_id`) REFERENCES `TransitAccount` (`id`),
  CONSTRAINT `FK551078695009B9EE` FOREIGN KEY (`periodYear_id`) REFERENCES `PeriodYear` (`id`),
  CONSTRAINT `FK551078697EFEF894` FOREIGN KEY (`payingBank_id`) REFERENCES `Bank` (`id`),
  CONSTRAINT `FK55107869B459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RemitPension`
--

/*!40000 ALTER TABLE `RemitPension` DISABLE KEYS */;
/*!40000 ALTER TABLE `RemitPension` ENABLE KEYS */;


--
-- Definition of table `RSAHolder`
--

DROP TABLE IF EXISTS `RSAHolder`;
CREATE TABLE `RSAHolder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base` int(11) NOT NULL,
  `cummulatedAmount` decimal(19,2) DEFAULT NULL,
  `dirty` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `monthCreated` int(11) NOT NULL,
  `monthlyContribution` decimal(19,2) DEFAULT NULL,
  `otherName` varchar(255) DEFAULT NULL,
  `pencommNumber` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `secondName` varchar(255) DEFAULT NULL,
  `voluntaryDonation` decimal(19,2) DEFAULT NULL,
  `yearCreated` int(11) NOT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  `pfa_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B8DDFEC3249D733` (`upload_id`),
  KEY `FK1B8DDFEC72C9B8DD` (`pfa_id`),
  KEY `FK1B8DDFEC51C53C8B` (`user_name`),
  KEY `FK1B8DDFECB459C446` (`corporate_id`),
  CONSTRAINT `FK1B8DDFEC3249D733` FOREIGN KEY (`upload_id`) REFERENCES `MonthlyUpload` (`id`),
  CONSTRAINT `FK1B8DDFEC51C53C8B` FOREIGN KEY (`user_name`) REFERENCES `OXUSERS` (`name`),
  CONSTRAINT `FK1B8DDFEC72C9B8DD` FOREIGN KEY (`pfa_id`) REFERENCES `PensionFundAdministrator` (`id`),
  CONSTRAINT `FK1B8DDFECB459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RSAHolder`
--

/*!40000 ALTER TABLE `RSAHolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `RSAHolder` ENABLE KEYS */;


--
-- Definition of table `RSAPayItem`
--

DROP TABLE IF EXISTS `RSAPayItem`;
CREATE TABLE `RSAPayItem` (
  `holder_id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `changeLog` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `compulsory` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `FKDFEB8D80769CDD46` (`holder_id`),
  CONSTRAINT `FKDFEB8D80769CDD46` FOREIGN KEY (`holder_id`) REFERENCES `RSAHolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RSAPayItem`
--

/*!40000 ALTER TABLE `RSAPayItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `RSAPayItem` ENABLE KEYS */;


--
-- Definition of table `RSAPayItem`
--

DROP TABLE IF EXISTS `RSAPayItem`;
CREATE TABLE `RSAPayItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `originalAmount` decimal(19,2) DEFAULT NULL,
  `payItem_id` bigint(20) DEFAULT NULL,
  `rSAHolder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE627419B5648AB06` (`rSAHolder_id`),
  KEY `FKE627419BF63EFB71` (`payItem_id`),
  CONSTRAINT `FKE627419B5648AB06` FOREIGN KEY (`rSAHolder_id`) REFERENCES `RSAHolder` (`id`),
  CONSTRAINT `FKE627419BF63EFB71` FOREIGN KEY (`payItem_id`) REFERENCES `CompanyPayItem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RSAPayItem`
--

/*!40000 ALTER TABLE `RSAPayItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `RSAPayItem` ENABLE KEYS */;


--
-- Definition of table `ScratchCard`
--

DROP TABLE IF EXISTS `ScratchCard`;
CREATE TABLE `ScratchCard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateEntered` varchar(255) DEFAULT NULL,
  `expired` bit(1) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ScratchCard`
--

/*!40000 ALTER TABLE `ScratchCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScratchCard` ENABLE KEYS */;


--
-- Definition of table `SectorOfBusiness`
--

DROP TABLE IF EXISTS `SectorOfBusiness`;
CREATE TABLE `SectorOfBusiness` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SectorOfBusiness`
--

/*!40000 ALTER TABLE `SectorOfBusiness` DISABLE KEYS */;
/*!40000 ALTER TABLE `SectorOfBusiness` ENABLE KEYS */;


--
-- Definition of table `SystemWideSetup`
--

DROP TABLE IF EXISTS `SystemWideSetup`;
CREATE TABLE `SystemWideSetup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nibssURL` varchar(255) DEFAULT NULL,
  `allowAlphabeticalSequence` bit(1) NOT NULL,
  `atLeastOneLowerCase` bit(1) NOT NULL,
  `atLeastOneUpperCase` bit(1) NOT NULL,
  `digitRequired` bit(1) NOT NULL,
  `maximumLength` int(11) NOT NULL,
  `minimumLength` int(11) NOT NULL,
  `nonAlphaNumericRequired` bit(1) NOT NULL,
  `numberOfRepeatCharacter` int(11) NOT NULL,
  `numberOfRuleMustMet` int(11) NOT NULL,
  `employeeContributionPercent` double NOT NULL,
  `employerContributionPercent` double NOT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `accountToDebit` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `deductionType` int(11) DEFAULT NULL,
  `naration` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA07951DB2823D40E` (`bank_id`),
  CONSTRAINT `FKA07951DB2823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SystemWideSetup`
--

/*!40000 ALTER TABLE `SystemWideSetup` DISABLE KEYS */;
INSERT INTO `SystemWideSetup` (`id`,`email`,`name`,`nibssURL`,`allowAlphabeticalSequence`,`atLeastOneLowerCase`,`atLeastOneUpperCase`,`digitRequired`,`maximumLength`,`minimumLength`,`nonAlphaNumericRequired`,`numberOfRepeatCharacter`,`numberOfRuleMustMet`,`employeeContributionPercent`,`employerContributionPercent`,`accountName`,`accountNumber`,`accountToDebit`,`amount`,`deductionType`,`naration`,`url`,`bank_id`) VALUES 
 (1,'',NULL,NULL,0x01,0x01,0x01,0x01,10,6,0x01,3,3,8,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SystemWideSetup` ENABLE KEYS */;


--
-- Definition of table `TransAction`
--

DROP TABLE IF EXISTS `TransAction`;
CREATE TABLE `TransAction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approvedBy` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `dateEntered` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enteredBy` varchar(255) DEFAULT NULL,
  `levelReach` int(11) NOT NULL,
  `modelId` bigint(20) DEFAULT NULL,
  `modelName` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `transRef` int(11) DEFAULT NULL,
  `corporate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE30A7ABEB459C446` (`corporate_id`),
  CONSTRAINT `FKE30A7ABEB459C446` FOREIGN KEY (`corporate_id`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TransAction`
--

/*!40000 ALTER TABLE `TransAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransAction` ENABLE KEYS */;


--
-- Definition of table `TransitAccount`
--

DROP TABLE IF EXISTS `TransitAccount`;
CREATE TABLE `TransitAccount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` bit(1) NOT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `terminalId` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `accountOwnerId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF3D754FAC84BA952` (`accountOwnerId`),
  KEY `FKF3D754FA2823D40E` (`bank_id`),
  CONSTRAINT `FKF3D754FA2823D40E` FOREIGN KEY (`bank_id`) REFERENCES `Bank` (`id`),
  CONSTRAINT `FKF3D754FAC84BA952` FOREIGN KEY (`accountOwnerId`) REFERENCES `Corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TransitAccount`
--

/*!40000 ALTER TABLE `TransitAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransitAccount` ENABLE KEYS */;


--
-- Definition of table `UploadLog`
--

DROP TABLE IF EXISTS `UploadLog`;
CREATE TABLE `UploadLog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateTimeLog` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uploadlog`
--

/*!40000 ALTER TABLE `UploadLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `UploadLog` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
