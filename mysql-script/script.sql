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
