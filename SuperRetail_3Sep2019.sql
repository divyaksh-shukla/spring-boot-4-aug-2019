-- MySQL dump 10.17  Distrib 10.3.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: SuperRetail
-- ------------------------------------------------------
-- Server version	10.3.15-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `AddressId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL,
  `AddressType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Home',
  `AddressLatitude` double DEFAULT NULL,
  `AddressLongitude` double DEFAULT NULL,
  `AddressLine1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressPincode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressCity` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressState` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressContactPerson` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `Address_FK` (`CustomerId`),
  CONSTRAINT `Address_FK` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `CartId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) unsigned NOT NULL,
  `CustomerId` int(10) unsigned NOT NULL,
  `CartDate` datetime NOT NULL,
  `CartQuantity` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`CartId`),
  KEY `Cart_FK` (`CustomerId`),
  KEY `Cart_FK_1` (`ProductId`),
  CONSTRAINT `Cart_FK` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `Cart_FK_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `CategoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `CommentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL,
  `ProductId` int(10) unsigned NOT NULL,
  `CommentTitle` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CommentDesc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CommentRating` int(10) unsigned NOT NULL DEFAULT 5,
  PRIMARY KEY (`CommentId`),
  KEY `Comment_FK` (`CustomerId`),
  KEY `Comment_FK_1` (`ProductId`),
  CONSTRAINT `Comment_FK` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `Comment_FK_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `CustomerName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerMobile` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerEmail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `Customer_FK` (`UserId`),
  CONSTRAINT `Customer_FK` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderHeader`
--

DROP TABLE IF EXISTS `OrderHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderHeader` (
  `OrderHeaderId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL,
  `OrderDate` datetime NOT NULL,
  `OrderStatus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Initiated',
  `OrderAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderHeaderId`),
  KEY `OrderHeader_FK` (`CustomerId`),
  CONSTRAINT `OrderHeader_FK` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderHeader`
--

LOCK TABLES `OrderHeader` WRITE;
/*!40000 ALTER TABLE `OrderHeader` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderProductLine`
--

DROP TABLE IF EXISTS `OrderProductLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderProductLine` (
  `OrderHeaderId` int(10) unsigned NOT NULL,
  `ProductId` int(10) unsigned NOT NULL,
  `OrderProductLineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `Amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderProductLineId`),
  KEY `OrderProductLine_FK` (`OrderHeaderId`),
  KEY `OrderProductLine_FK_1` (`ProductId`),
  CONSTRAINT `OrderProductLine_FK` FOREIGN KEY (`OrderHeaderId`) REFERENCES `OrderHeader` (`OrderHeaderId`),
  CONSTRAINT `OrderProductLine_FK_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderProductLine`
--

LOCK TABLES `OrderProductLine` WRITE;
/*!40000 ALTER TABLE `OrderProductLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderProductLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CategoryId` int(10) unsigned NOT NULL,
  `ProductDesc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProductQOH` int(10) unsigned NOT NULL,
  `ProductPrice` double NOT NULL,
  `ProductStatus` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Enabled',
  PRIMARY KEY (`ProductId`),
  KEY `Product_FK` (`CategoryId`),
  CONSTRAINT `Product_FK` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `UserId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserPassword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserRole` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Customer',
  `UserStatus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'root','iamroot','root','Active'),(2,'Divyaksh','Divyaksh','Customer','Enabled'),(3,'Divyaksh','Divyaksh','Customer','Enabled');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 20:02:02
