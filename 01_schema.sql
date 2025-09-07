/* DATABASE SCHEMA: JEANS STORE */
CREATE DATABASE IF NOT EXISTS `jeans_store`;
USE `jeans_store`;

-- Itemized delivery lines
CREATE TABLE `delivery_line`(
    `delivery_id` CHAR(36) NOT NULL,
    `sku` VARCHAR(36) NOT NULL,
    `quantity` INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(`delivery_id`, `sku`)
);

-- Employees
CREATE TABLE `employee`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `hire_date` DATE NOT NULL,
    `home_store` CHAR(3) NOT NULL
) AUTO_INCREMENT=10000;

-- Itemized sale lines
CREATE TABLE `sale_line`(
    `sale_id` CHAR(36) NOT NULL,
    `sku` VARCHAR(36) NOT NULL,
    `quantity` INT NOT NULL,
    `price_at_sale` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY(`sale_id`, `sku`)
);

-- Inventory snapshot per store per SKU
CREATE TABLE `inventory`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
    `sku` VARCHAR(36) NOT NULL,
    `location` CHAR(3) NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`sku`, `location`)
);

-- Store locations
CREATE TABLE `location`(
    `code` CHAR(3) NOT NULL PRIMARY KEY,
    `address` TEXT NOT NULL,
    `store_size` ENUM('sm','md','lg') NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

-- Sales
CREATE TABLE `sale`(
    `id` CHAR(36) NOT NULL PRIMARY KEY,
    `location` CHAR(3) NOT NULL,
    `total` DECIMAL(8, 2) NOT NULL,
    `employee` BIGINT UNSIGNED NOT NULL,
    `sale_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- JEANS Product catalog
CREATE TABLE `product`(
    `sku` VARCHAR(36) NOT NULL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `msrp` DECIMAL(8, 2) NOT NULL,
    `sale_price` DECIMAL(8, 2) NOT NULL,
    `brand` VARCHAR(255) NULL,
    `fit` ENUM('skinny','slim','straight','tapered','bootcut','relaxed') NOT NULL,
    `wash` ENUM('light','medium','dark','black','grey','raw') NOT NULL,
    `color` VARCHAR(64) NOT NULL,
    `waist` TINYINT UNSIGNED NOT NULL,      -- e.g., 24..44
    `inseam` TINYINT UNSIGNED NOT NULL,     -- e.g., 28..36
    `rise` ENUM('low','mid','high') NOT NULL,
    `stretch_pct` DECIMAL(4,1) NOT NULL DEFAULT 0.0, -- e.g., 1.0 means 1%
    `gender_category` ENUM('M','F','U') NOT NULL,
    `image_url` TEXT NULL
);

-- Deliveries
CREATE TABLE `delivery`(
    `id` CHAR(36) NOT NULL PRIMARY KEY,
    `status` ENUM('Enroute','Scheduled','Cancelled','Delivered') NOT NULL,
    `date` DATE NOT NULL,
    `expected_date` DATE NULL,
    `location` CHAR(3) NOT NULL
);
