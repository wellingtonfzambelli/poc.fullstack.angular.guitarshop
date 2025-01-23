
DROP TABLE IF EXISTS `Addresses`;

CREATE TABLE `Addresses` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Line1` longtext NOT NULL,
  `Line2` longtext NOT NULL,
  `City` longtext NOT NULL,
  `State` longtext NOT NULL,
  `PostalCode` longtext NOT NULL,
  `Country` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Addresses` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `AspNetRoleClaims`;

CREATE TABLE `AspNetRoleClaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `AddressId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`),
  KEY `IX_AspNetUsers_AddressId` (`AddressId`),
  CONSTRAINT `FK_AspNetUsers_Addresses_AddressId` FOREIGN KEY (`AddressId`) REFERENCES `Addresses` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryMethods`
--

DROP TABLE IF EXISTS `DeliveryMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryMethods` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ShortName` longtext NOT NULL,
  `DeliveryTime` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryMethods`
--

LOCK TABLES `DeliveryMethods` WRITE;
/*!40000 ALTER TABLE `DeliveryMethods` DISABLE KEYS */;
INSERT INTO `DeliveryMethods` VALUES (1,'UPS1','1-2 Days','Fastest delivery time',10),(2,'UPS2','2-5 Days','Get it within 5 days',5),(3,'UPS3','5-10 Days','Slower but cheap',2),(4,'FREE','1-2 Weeks','Free! You get what you pay for',0);
/*!40000 ALTER TABLE `DeliveryMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItems` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ItemOrdered_ProductId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ItemOrdered_ProductName` longtext NOT NULL,
  `ItemOrdered_PictureUrl` longtext NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OrderItems_OrderId` (`OrderId`),
  CONSTRAINT `FK_OrderItems_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `OrderDate` datetime(6) NOT NULL,
  `BuyerEmail` longtext NOT NULL,
  `ShippingAddress_Name` longtext NOT NULL,
  `ShippingAddress_Line1` longtext NOT NULL,
  `ShippingAddress_Line2` longtext DEFAULT NULL,
  `ShippingAddress_City` longtext NOT NULL,
  `ShippingAddress_State` longtext NOT NULL,
  `ShippingAddress_PostalCode` longtext NOT NULL,
  `ShippingAddress_Country` longtext NOT NULL,
  `DeliveryMethodId` int(11) NOT NULL,
  `PaymentSummary_Last4` int(11) NOT NULL,
  `PaymentSummary_Brand` longtext NOT NULL,
  `PaymentSummary_ExpMonth` int(11) NOT NULL,
  `PaymentSummary_ExpYear` int(11) NOT NULL,
  `Subtotal` decimal(18,2) NOT NULL,
  `Status` longtext NOT NULL,
  `PaymentIntentId` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Orders_DeliveryMethodId` (`DeliveryMethodId`),
  CONSTRAINT `FK_Orders_DeliveryMethods_DeliveryMethodId` FOREIGN KEY (`DeliveryMethodId`) REFERENCES `DeliveryMethods` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Price` double NOT NULL,
  `PictureUrl` longtext NOT NULL,
  `Type` longtext NOT NULL,
  `Brand` longtext NOT NULL,
  `QuantityInStock` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES ('08dd1339-9dc7-459c-8e74-7a9e64d29c8f','Fender Stratocaster','A legendary electric guitar known for its versatility and iconic design. Perfect for rock, blues, and jazz players.',1200,'guitar-Fender-Stratocaster.jpg','Electric Guitar','Fender',15),('08dd1339-9dd0-4eca-81e3-a67a8b37758a','Gibson Les Paul','A classic guitar delivering rich tones and sustain. Ideal for professional guitarists seeking premium quality.',2500,'guitar-Gibson-Les-Paul.jpg','Electric Guitar','Gibson',10),('08dd1339-9dd0-4f6f-8063-ee2438a4ee56','PRS SE Custom 24','A versatile guitar with a warm, resonant tone. Perfect for studio and live performances.',849,'guitar-PRS-SE-Custom-24.jpg','Electric Guitar','PRS',12),('08dd1339-9dd0-4f7f-8650-3f944bdde98b','Ibanez SR300E Bass Guitar','A modern bass guitar with smooth playability and dynamic sound. Great for beginners and professionals.',349,'bass-Ibanez-SR300E-Bass-Guitar.jpg','Bass Guitar','Ibanez',18),('08dd1339-9dd0-4f97-8217-e0d4da975d7b','Epiphone Thunderbird IV','A powerful bass guitar with iconic design, known for its deep and punchy sound.',449,'bass-Epiphone-Thunderbird-IV.jpg','Bass Guitar','Epiphone',8),('08dd1339-9dd0-4f9f-8040-5cb33b7709fa','Yamaha Stage Custom Birch Drum Set','An excellent drum set for professionals and learners alike, offering great tonal quality and durability.',800,'drum-yamaha-stage-custom-birch-drum-set.jpg','Drums','Yamaha',20),('08dd1339-9dd0-4fa5-8b78-1d1732ee6773','Roland V-Drums TD-17KVX','A high-end electronic drum kit with realistic feel and premium sound quality.',1800,'drum-Roland-V-Drums-TD-17KVX.jpg','Drums','Roland',5),('08dd1339-9dd0-4fac-8310-a09db46849c2','Boss DS-1 Distortion Pedal','A distortion pedal that defines the sound of rock and metal for decades. Compact and powerful.',59,'acessories-Boss-DS-1-Distortion.jpg','Acessories','Boss',50),('08dd1339-9dd0-4fbc-83d8-72aa0cfa217e','Shure SM57 Microphone','A versatile microphone widely used for instruments and vocals, delivering studio-quality sound.',99,'acessories-Shure-SM57-Microphone.jpg','Acessories','Shure',40),('08dd1339-9dd0-4fc6-8cfb-5737a873d02e','MXR Carbon Copy Analog Delay','A lush analog delay pedal with a warm and vintage tone. Ideal for atmospheric sounds.',149,'acessories-MXR-Carbon-Copy-Analog-Delay.jpg','Acessories','MXR',25),('08dd1339-9dd0-4fcf-80cd-1a2551afdd01','Electro-Harmonix Big Muff Pi','An iconic fuzz pedal with a distinctive and saturated tone. A must-have for rock and grunge players.',99,'acessories-Electro-Harmonix-Big-Muff-Pi.jpg','Acessories','Electro-Harmonix',30),('08dd1339-9dd0-4fd7-808d-b7c6b4a18c14','Zildjian A Custom Cymbal Pack','A professional cymbal set offering a bright and expressive tone. Perfect for live gigs.',799,'acessories-Zildjian-A-Custom-Cymbal-Pack.jpg','Acessories','Zildjian',15),('08dd1339-9dd0-4fde-8ed9-541bb2a22b30','Ernie Ball Regular Slinky Guitar Strings','A set of high-quality strings known for durability and balanced tone.',6.99,'acessories-Ernie-Ball-Regular-Slinky-Guitar-Strings.jpg','Acessories','Ernie Ball',100),('08dd1339-9dd0-4fe6-8e0a-b978efa5265e','Gator Deluxe Guitar Case','A durable and lightweight case to protect your guitar on the road.',120,'acessories-Gator-Deluxe-Guitar-Case.jpg','Acessories','Gator',20),('08dd1339-9dd0-4fee-8de4-4e377c9b03a7','Ampeg SVT Bass Amp','A high-performance bass amplifier delivering exceptional sound quality. A favorite among bass players.',1400,'amp-Ampeg-SVT-Bass-Amp.jpg','Amplifier','Ampeg',5),('08dd1339-9dd0-4ffd-8ccd-9a5c3770f780','Marshall DSL40C Tube Combo Amp','A classic tube amplifier delivering rich and powerful sound for professionals.',749,'amp-Marshall-DSL40C-Tube-Combo-Amp.jpg','Amplifier','Marshall',7),('08dd1339-9dd1-4005-843b-87d820b9ab86','Line 6 Spider V 60 MkII','A feature-packed amplifier offering a variety of tones and effects for all genres.',399,'amp-Line-6-Spider-V-60-MkII.jpeg','Amplifier','Line 6',10);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20250123192107_nome_do_arquivo','8.0.11');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 17:03:25
