DROP DATABASE IF EXISTS `so_active`;
CREATE DATABASE IF NOT EXISTS `so_active`;
USE `so_active`;

CREATE TABLE `rols` (
   `idRol` INT AUTO_INCREMENT,
   `roleType` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`idRol`)
);
CREATE TABLE `users` (
   `idUser` INT AUTO_INCREMENT,
   `name` VARCHAR(255) NOT NULL,
   `email` VARCHAR(255) NOT NULL,
   `image` VARCHAR(255) NOT NULL,
   `password` VARCHAR(255) NOT NULL,
   `rolId` INT NOT NULL,
   PRIMARY KEY (`idUser`),
   FOREIGN KEY (`rolId`) REFERENCES `rols`(`idRol`)
);
CREATE TABLE `categories` (
   `idCategorie` INT AUTO_INCREMENT,
   `name` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`idCategorie`)
);
CREATE TABLE `products` (
   `idProduct` INT AUTO_INCREMENT,
   `name` VARCHAR(255) NOT NULL,
   `description` VARCHAR(1234) NOT NULL,
   `image` VARCHAR(255) NOT NULL,
   `price` DECIMAL(10,0) NOT NULL,
   `categorieId` INT NOT NULL,
   `details`  VARCHAR(255) NOT NULL,
   PRIMARY KEY (`idProduct`),
   FOREIGN KEY (`categorieId`) REFERENCES `categories`(`idCategorie`)
);
CREATE TABLE `images` (
   `idImage` INT AUTO_INCREMENT,
   
   `image` VARCHAR(255) NOT NULL,
   
   `productoId` INT NOT NULL,
   PRIMARY KEY (`idImage`),
   FOREIGN KEY (`productoId`) REFERENCES `products`(`idProduct`)
);