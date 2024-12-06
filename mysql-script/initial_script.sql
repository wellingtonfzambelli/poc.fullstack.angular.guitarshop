CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` VARCHAR(255) NOT NULL,
    `ProductVersion` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`MigrationId`)
);

START TRANSACTION;

CREATE TABLE `Products` (
    `Id` VARCHAR(255) NOT NULL,
    `Name` VARCHAR(255) NULL,
    `Description` TEXT NULL,
    `Price` DOUBLE NOT NULL,
    `PictureUrl` VARCHAR(2083) NULL,
    `Type` VARCHAR(255) NULL,
    `Brand` VARCHAR(255) NULL,
    `QuantityInStock` INT NOT NULL,
    PRIMARY KEY (`Id`)
);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20241124191422_SeedProducts', '8.0.11');

COMMIT;

START TRANSACTION;

CREATE TABLE `Baskets` (
    `Id` VARCHAR(255) NOT NULL,
    `BuyerId` VARCHAR(255) NULL,
    PRIMARY KEY (`Id`)
);

CREATE TABLE `BasketItem` (
    `Id` VARCHAR(255) NOT NULL,
    `Quantity` INT NOT NULL,
    `ProductId` VARCHAR(255) NOT NULL,
    `BasketId` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`Id`),
    CONSTRAINT `FK_BasketItem_Baskets_BasketId` FOREIGN KEY (`BasketId`) REFERENCES `Baskets` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_BasketItem_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE
);

CREATE INDEX `IX_BasketItem_BasketId` ON `BasketItem` (`BasketId`);

CREATE INDEX `IX_BasketItem_ProductId` ON `BasketItem` (`ProductId`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20241126004759_BasketEntityAdded', '8.0.11');

COMMIT;


INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dc7-459c-8e74-7a9e64d29c8f','Fender Stratocaster','A legendary electric guitar known for its versatility and iconic design. Perfect for rock, blues, and jazz players.',1200,'guitar-Fender-Stratocaster.jpg','Electric Guitar','Fender',15);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4eca-81e3-a67a8b37758a','Gibson Les Paul','A classic guitar delivering rich tones and sustain. Ideal for professional guitarists seeking premium quality.',2500,'guitar-Gibson-Les-Paul.jpg','Electric Guitar','Gibson',10);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4f6f-8063-ee2438a4ee56','PRS SE Custom 24','A versatile guitar with a warm, resonant tone. Perfect for studio and live performances.',849,'guitar-PRS-SE-Custom-24.jpg','Electric Guitar','PRS',12);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4f7f-8650-3f944bdde98b','Ibanez SR300E Bass Guitar','A modern bass guitar with smooth playability and dynamic sound. Great for beginners and professionals.',349,'bass-Ibanez-SR300E-Bass-Guitar.jpg','Bass Guitar','Ibanez',18);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4f97-8217-e0d4da975d7b','Epiphone Thunderbird IV','A powerful bass guitar with iconic design, known for its deep and punchy sound.',449,'bass-Epiphone-Thunderbird-IV.jpg','Bass Guitar','Epiphone',8);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4f9f-8040-5cb33b7709fa','Yamaha Stage Custom Birch Drum Set','An excellent drum set for professionals and learners alike, offering great tonal quality and durability.',800,'drum-yamaha-stage-custom-birch-drum-set.jpg','Drums','Yamaha',20);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fa5-8b78-1d1732ee6773','Roland V-Drums TD-17KVX','A high-end electronic drum kit with realistic feel and premium sound quality.',1800,'drum-Roland-V-Drums-TD-17KVX.jpg','Drums','Roland',5);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fac-8310-a09db46849c2','Boss DS-1 Distortion Pedal','A distortion pedal that defines the sound of rock and metal for decades. Compact and powerful.',59,'acessories-Boss-DS-1-Distortion.jpg','Acessories','Boss',50);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fbc-83d8-72aa0cfa217e','Shure SM57 Microphone','A versatile microphone widely used for instruments and vocals, delivering studio-quality sound.',99,'acessories-Shure-SM57-Microphone.jpg','Acessories','Shure',40);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fc6-8cfb-5737a873d02e','MXR Carbon Copy Analog Delay','A lush analog delay pedal with a warm and vintage tone. Ideal for atmospheric sounds.',149,'acessories-MXR-Carbon-Copy-Analog-Delay.jpg','Acessories','MXR',25);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fcf-80cd-1a2551afdd01','Electro-Harmonix Big Muff Pi','An iconic fuzz pedal with a distinctive and saturated tone. A must-have for rock and grunge players.',99,'acessories-Electro-Harmonix-Big-Muff-Pi.jpg','Acessories','Electro-Harmonix',30);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fd7-808d-b7c6b4a18c14','Zildjian A Custom Cymbal Pack','A professional cymbal set offering a bright and expressive tone. Perfect for live gigs.',799,'acessories-Zildjian-A-Custom-Cymbal-Pack.jpg','Acessories','Zildjian',15);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fde-8ed9-541bb2a22b30','Ernie Ball Regular Slinky Guitar Strings','A set of high-quality strings known for durability and balanced tone.',6.99,'acessories-Ernie-Ball-Regular-Slinky-Guitar-Strings.jpg','Acessories','Ernie Ball',100);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fe6-8e0a-b978efa5265e','Gator Deluxe Guitar Case','A durable and lightweight case to protect your guitar on the road.',120,'acessories-Gator-Deluxe-Guitar-Case.jpg','Acessories','Gator',20);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4fee-8de4-4e377c9b03a7','Ampeg SVT Bass Amp','A high-performance bass amplifier delivering exceptional sound quality. A favorite among bass players.',1400,'amp-Ampeg-SVT-Bass-Amp.jpg','Amplifier','Ampeg',5);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd0-4ffd-8ccd-9a5c3770f780','Marshall DSL40C Tube Combo Amp','A classic tube amplifier delivering rich and powerful sound for professionals.',749,'amp-Marshall-DSL40C-Tube-Combo-Amp.jpg','Amplifier','Marshall',7);
INSERT INTO `Products` (`Id`,`Name`,`Description`,`Price`,`PictureUrl`,`Type`,`Brand`,`QuantityInStock`) VALUES ('08dd1339-9dd1-4005-843b-87d820b9ab86','Line 6 Spider V 60 MkII','A feature-packed amplifier offering a variety of tones and effects for all genres.',399,'amp-Line-6-Spider-V-60-MkII.jpeg','Amplifier','Line 6',10);
