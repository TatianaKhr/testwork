# ************************************************************
# Sequel Ace SQL dump
# Версия 20044
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Хост: 127.0.0.1 (MySQL 8.0.31)
# База данных: tacka_db
# Время формирования: 2023-02-16 10:34:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы access_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_modules`;

CREATE TABLE `access_modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `access_modules` WRITE;
/*!40000 ALTER TABLE `access_modules` DISABLE KEYS */;

INSERT INTO `access_modules` (`id`, `title`, `order_index`)
VALUES
	(1,'Dashboard',NULL),
	(2,'Расписание',NULL),
	(3,'Пользователи',NULL),
	(4,'Касса',NULL);

/*!40000 ALTER TABLE `access_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы access_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_permissions`;

CREATE TABLE `access_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `access_permissions` WRITE;
/*!40000 ALTER TABLE `access_permissions` DISABLE KEYS */;

INSERT INTO `access_permissions` (`id`, `controller`, `action`, `created_at`, `updated_at`)
VALUES
	(1,'DashboardController','*','2020-10-16 18:23:42',NULL),
	(2,'ScheduleController','*','2020-10-16 18:23:56',NULL),
	(3,'UserController','*','2020-10-16 18:24:09',NULL),
	(4,'PaymentController','*','2020-10-16 18:24:29',NULL);

/*!40000 ALTER TABLE `access_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы access_permissions_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_permissions_groups`;

CREATE TABLE `access_permissions_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `access_module_id` int NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `order_index` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_module_id` (`access_module_id`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `access_permissions_groups` WRITE;
/*!40000 ALTER TABLE `access_permissions_groups` DISABLE KEYS */;

INSERT INTO `access_permissions_groups` (`id`, `access_module_id`, `title`, `order_index`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'Dashboard (*)',1,NULL,NULL,NULL),
	(2,2,'Расписание (*)',1,NULL,NULL,NULL),
	(3,3,'Пользователи (*)',1,NULL,NULL,NULL),
	(4,4,'Касса (*)',1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `access_permissions_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы access_permissions_groups_access_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_permissions_groups_access_permissions`;

CREATE TABLE `access_permissions_groups_access_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `access_permission_group_id` int DEFAULT NULL,
  `access_permission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_permission_group_id` (`access_permission_group_id`),
  KEY `acces_permission_id` (`access_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `access_permissions_groups_access_permissions` WRITE;
/*!40000 ALTER TABLE `access_permissions_groups_access_permissions` DISABLE KEYS */;

INSERT INTO `access_permissions_groups_access_permissions` (`id`, `access_permission_group_id`, `access_permission_id`)
VALUES
	(1,1,1),
	(2,2,2),
	(3,3,3),
	(4,4,4);

/*!40000 ALTER TABLE `access_permissions_groups_access_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы cars_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cars_brands`;

CREATE TABLE `cars_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `cars_brands` WRITE;
/*!40000 ALTER TABLE `cars_brands` DISABLE KEYS */;

INSERT INTO `cars_brands` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Audi','2023-01-13 21:06:44',NULL,NULL);

/*!40000 ALTER TABLE `cars_brands` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2019_12_14_000001_create_personal_access_tokens_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `handler_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='type_id: 1 - sms, 2 - email, etc.';

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;

INSERT INTO `notifications` (`id`, `type_id`, `handler_id`, `title`, `message`)
VALUES
	(1,1,NULL,'','Добро пожаловать'),
	(2,1,NULL,NULL,'Ждем вас %s в %s');

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `type_id` int NOT NULL,
  `method_id` int NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `updated_by_user_id` int DEFAULT NULL,
  `deleted_by_user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_type_id` int DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `locked` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `client_id` (`author_id`),
  KEY `side` (`method_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;

INSERT INTO `payments` (`id`, `user_id`, `author_id`, `type_id`, `method_id`, `transaction_id`, `updated_by_user_id`, `deleted_by_user_id`, `product_id`, `product_type_id`, `amount`, `comment`, `locked`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,19,18,1,1,NULL,NULL,NULL,NULL,1,200.00,NULL,0,1,'2023-01-18 11:36:17','2023-01-18 11:36:17',NULL),
	(9,19,NULL,1,2,NULL,NULL,NULL,6,2,2.00,NULL,0,1,'2023-01-18 15:42:31','2023-01-18 15:42:31',NULL),
	(11,19,18,1,1,NULL,NULL,NULL,NULL,1,100.00,NULL,0,1,'2023-01-18 16:07:30','2023-01-18 16:07:30',NULL),
	(12,19,18,1,1,NULL,NULL,NULL,NULL,1,100.00,NULL,0,1,'2023-01-18 16:07:44','2023-01-18 16:07:44',NULL);

/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы payments_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments_methods`;

CREATE TABLE `payments_methods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `refund_allowed` int NOT NULL DEFAULT '1',
  `hidden` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `payments_methods` WRITE;
/*!40000 ALTER TABLE `payments_methods` DISABLE KEYS */;

INSERT INTO `payments_methods` (`id`, `title`, `refund_allowed`, `hidden`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Наличные',1,0,'2020-10-13 18:04:55',NULL,NULL),
	(2,'Безналичный',1,0,'2023-01-18 12:30:00',NULL,NULL);

/*!40000 ALTER TABLE `payments_methods` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы phone_verification_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone_verification_codes`;

CREATE TABLE `phone_verification_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(16) NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `verification_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `phone_verification_codes` WRITE;
/*!40000 ALTER TABLE `phone_verification_codes` DISABLE KEYS */;

INSERT INTO `phone_verification_codes` (`id`, `phone`, `attempts`, `verification_code`, `last_attempt_at`, `sent_at`, `verified_at`, `created_at`, `updated_at`)
VALUES
	(6,'380975611595',0,NULL,NULL,NULL,NULL,'2023-01-06 21:24:39','2023-01-06 21:26:49'),
	(7,'380952711111',0,NULL,NULL,NULL,NULL,'2023-01-06 21:40:30','2023-01-06 21:40:51');

/*!40000 ALTER TABLE `phone_verification_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы products_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_types`;

CREATE TABLE `products_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `products_types` WRITE;
/*!40000 ALTER TABLE `products_types` DISABLE KEYS */;

INSERT INTO `products_types` (`id`, `title`)
VALUES
	(1,'Личный счет'),
	(2,'Оплата комиссии');

/*!40000 ALTER TABLE `products_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы ride_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ride_orders`;

CREATE TABLE `ride_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `driver_id` int DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `price` double DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commission` float(12,2) DEFAULT NULL,
  `commission_processed` int NOT NULL DEFAULT '0',
  `passenger_rating` int DEFAULT NULL,
  `driver_rating` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `driver_id` (`driver_id`),
  KEY `price` (`price`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `ride_orders` WRITE;
/*!40000 ALTER TABLE `ride_orders` DISABLE KEYS */;

INSERT INTO `ride_orders` (`id`, `user_id`, `driver_id`, `status_id`, `price`, `comment`, `commission`, `commission_processed`, `passenger_rating`, `driver_rating`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(2,18,NULL,5,20,NULL,NULL,0,NULL,NULL,'2023-01-21 12:36:36','2023-01-21 12:41:23',NULL),
	(3,18,19,2,25,NULL,NULL,0,5,5,'2023-01-21 12:41:35','2023-01-21 12:46:14',NULL),
	(4,18,19,2,30,NULL,NULL,0,NULL,NULL,'2023-01-21 12:54:23','2023-01-21 13:29:36',NULL),
	(5,18,19,2,40,NULL,NULL,0,NULL,NULL,'2023-01-21 13:29:48','2023-01-21 13:43:13',NULL),
	(6,18,19,2,50,NULL,NULL,0,NULL,NULL,'2023-01-21 13:43:27','2023-01-21 13:46:58',NULL),
	(7,18,19,4,30,NULL,NULL,0,NULL,NULL,'2023-01-21 13:47:02','2023-01-21 13:50:38',NULL),
	(8,18,19,2,50,NULL,NULL,0,NULL,NULL,'2023-01-21 13:51:12','2023-01-21 14:02:58',NULL),
	(9,18,19,2,65,NULL,NULL,0,NULL,NULL,'2023-01-21 14:06:16','2023-01-21 14:13:10',NULL);

/*!40000 ALTER TABLE `ride_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы ride_orders_process
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ride_orders_process`;

CREATE TABLE `ride_orders_process` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `ride_order_id` int NOT NULL,
  `status_id` int NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `processed` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rider_order_id` (`ride_order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `ride_orders_process` WRITE;
/*!40000 ALTER TABLE `ride_orders_process` DISABLE KEYS */;

INSERT INTO `ride_orders_process` (`id`, `parent_id`, `user_id`, `ride_order_id`, `status_id`, `data`, `comment`, `processed`, `created_at`, `updated_at`)
VALUES
	(29,NULL,18,2,5,NULL,NULL,NULL,'2023-01-21 12:41:23','2023-01-21 12:41:23'),
	(30,NULL,19,3,11,'25',NULL,NULL,'2023-01-21 12:41:49','2023-01-21 12:41:49'),
	(31,30,18,3,3,NULL,NULL,NULL,'2023-01-21 12:42:03','2023-01-21 12:42:03'),
	(32,NULL,19,3,7,NULL,NULL,NULL,'2023-01-21 12:43:29','2023-01-21 12:43:29'),
	(33,NULL,18,3,8,NULL,NULL,NULL,'2023-01-21 12:44:00','2023-01-21 12:44:00'),
	(34,NULL,19,3,9,NULL,NULL,NULL,'2023-01-21 12:44:29','2023-01-21 12:44:29'),
	(35,NULL,19,3,2,NULL,NULL,NULL,'2023-01-21 12:44:55','2023-01-21 12:44:55'),
	(36,NULL,18,4,1,NULL,NULL,NULL,'2023-01-21 12:54:23','2023-01-21 12:54:23'),
	(37,NULL,19,4,3,NULL,NULL,NULL,'2023-01-21 12:55:54','2023-01-21 12:55:54'),
	(38,NULL,19,4,10,'10',NULL,NULL,'2023-01-21 12:55:54','2023-01-21 12:55:54'),
	(39,37,18,4,3,NULL,NULL,NULL,'2023-01-21 12:59:00','2023-01-21 12:59:00'),
	(40,NULL,19,4,2,NULL,NULL,NULL,'2023-01-21 13:29:36','2023-01-21 13:29:36'),
	(41,NULL,18,5,1,NULL,NULL,NULL,'2023-01-21 13:29:48','2023-01-21 13:29:48'),
	(42,NULL,19,5,11,'40',NULL,NULL,'2023-01-21 13:30:45','2023-01-21 13:30:45'),
	(43,NULL,19,5,10,'10',NULL,NULL,'2023-01-21 13:30:45','2023-01-21 13:30:45'),
	(50,NULL,18,5,14,NULL,NULL,NULL,'2023-01-21 13:41:31','2023-01-21 13:41:31'),
	(51,42,18,5,3,NULL,NULL,NULL,'2023-01-21 13:41:31','2023-01-21 13:41:31'),
	(52,NULL,19,5,2,NULL,NULL,NULL,'2023-01-21 13:43:13','2023-01-21 13:43:13'),
	(53,NULL,18,6,1,NULL,NULL,NULL,'2023-01-21 13:43:27','2023-01-21 13:43:27'),
	(54,NULL,19,6,11,'50',NULL,NULL,'2023-01-21 13:43:43','2023-01-21 13:43:43'),
	(55,NULL,19,6,10,'10',NULL,NULL,'2023-01-21 13:43:43','2023-01-21 13:43:43'),
	(56,NULL,18,6,14,NULL,NULL,NULL,'2023-01-21 13:44:53','2023-01-21 13:44:53'),
	(57,54,18,6,3,NULL,NULL,NULL,'2023-01-21 13:44:53','2023-01-21 13:44:53'),
	(58,NULL,19,6,2,NULL,NULL,NULL,'2023-01-21 13:46:58','2023-01-21 13:46:58'),
	(59,NULL,18,7,1,NULL,NULL,NULL,'2023-01-21 13:47:02','2023-01-21 13:47:02'),
	(60,NULL,19,7,13,NULL,NULL,NULL,'2023-01-21 13:47:56','2023-01-21 13:47:56'),
	(61,NULL,18,7,14,NULL,NULL,NULL,'2023-01-21 13:48:25','2023-01-21 13:48:25'),
	(62,60,18,7,3,NULL,NULL,NULL,'2023-01-21 13:48:25','2023-01-21 13:48:25'),
	(63,NULL,19,7,4,NULL,NULL,NULL,'2023-01-21 13:50:38','2023-01-21 13:50:38'),
	(64,NULL,18,8,1,NULL,NULL,NULL,'2023-01-21 13:51:12','2023-01-21 13:51:12'),
	(65,NULL,19,8,11,'50',NULL,NULL,'2023-01-21 13:51:39','2023-01-21 13:51:39'),
	(66,NULL,19,8,10,'10',NULL,NULL,'2023-01-21 13:51:39','2023-01-21 13:51:39'),
	(69,NULL,18,8,14,NULL,NULL,NULL,'2023-01-21 13:56:52','2023-01-21 13:56:52'),
	(70,NULL,19,8,13,NULL,NULL,NULL,'2023-01-21 13:56:52','2023-01-21 13:56:52'),
	(71,65,18,8,3,NULL,NULL,NULL,'2023-01-21 13:56:52','2023-01-21 13:56:52'),
	(72,NULL,1,8,2,NULL,NULL,NULL,'2023-01-21 14:02:58','2023-01-21 14:02:58'),
	(73,NULL,18,9,1,NULL,NULL,NULL,'2023-01-21 14:06:16','2023-01-21 14:06:16'),
	(74,NULL,19,9,11,'70',NULL,NULL,'2023-01-21 14:07:12','2023-01-21 14:07:12'),
	(75,NULL,19,9,10,'10',NULL,NULL,'2023-01-21 14:07:12','2023-01-21 14:07:12'),
	(76,74,18,9,12,'60',NULL,NULL,'2023-01-21 14:08:18','2023-01-21 14:08:18'),
	(77,76,19,9,11,'65',NULL,NULL,'2023-01-21 14:09:06','2023-01-21 14:09:06'),
	(78,NULL,18,9,14,NULL,NULL,NULL,'2023-01-21 14:10:17','2023-01-21 14:10:17'),
	(79,NULL,19,9,13,NULL,NULL,NULL,'2023-01-21 14:10:17','2023-01-21 14:10:17'),
	(80,77,18,9,3,NULL,NULL,NULL,'2023-01-21 14:10:17','2023-01-21 14:10:17'),
	(81,NULL,1,9,2,NULL,NULL,NULL,'2023-01-21 14:13:10','2023-01-21 14:13:10');

/*!40000 ALTER TABLE `ride_orders_process` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы ride_orders_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ride_orders_routes`;

CREATE TABLE `ride_orders_routes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ride_order_id` int NOT NULL,
  `address` varchar(256) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `ride_orders_routes` WRITE;
/*!40000 ALTER TABLE `ride_orders_routes` DISABLE KEYS */;

INSERT INTO `ride_orders_routes` (`id`, `ride_order_id`, `address`, `lat`, `lng`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'Address #1',50.099998,50.099998,'2023-01-21 11:29:37','2023-01-21 11:29:37',NULL),
	(2,1,'Address #2',50.200001,50.200001,'2023-01-21 11:29:37','2023-01-21 11:29:37',NULL),
	(3,2,'Address #1',50.099998,50.099998,'2023-01-21 11:30:38','2023-01-21 11:30:38',NULL),
	(4,2,'Address #2',50.200001,50.200001,'2023-01-21 11:30:38','2023-01-21 11:30:38',NULL),
	(5,1,'Address #1',50.099998,50.099998,'2023-01-21 11:32:35','2023-01-21 11:32:35',NULL),
	(6,1,'Address #2',50.200001,50.200001,'2023-01-21 11:32:35','2023-01-21 11:32:35',NULL),
	(7,2,'Address #1',50.099998,50.099998,'2023-01-21 12:36:36','2023-01-21 12:36:36',NULL),
	(8,2,'Address #2',50.200001,50.200001,'2023-01-21 12:36:36','2023-01-21 12:36:36',NULL),
	(9,3,'Address #1',50.099998,50.099998,'2023-01-21 12:41:35','2023-01-21 12:41:35',NULL),
	(10,3,'Address #2',50.200001,50.200001,'2023-01-21 12:41:35','2023-01-21 12:41:35',NULL),
	(11,4,'Address #1',50.099998,50.099998,'2023-01-21 12:54:23','2023-01-21 12:54:23',NULL),
	(12,4,'Address #2',50.200001,50.200001,'2023-01-21 12:54:23','2023-01-21 12:54:23',NULL),
	(13,5,'Address #1',50.099998,50.099998,'2023-01-21 13:29:48','2023-01-21 13:29:48',NULL),
	(14,5,'Address #2',50.200001,50.200001,'2023-01-21 13:29:48','2023-01-21 13:29:48',NULL),
	(15,6,'Address #1',50.099998,50.099998,'2023-01-21 13:43:27','2023-01-21 13:43:27',NULL),
	(16,6,'Address #2',50.200001,50.200001,'2023-01-21 13:43:27','2023-01-21 13:43:27',NULL),
	(17,7,'Address #1',50.099998,50.099998,'2023-01-21 13:47:02','2023-01-21 13:47:02',NULL),
	(18,7,'Address #2',50.200001,50.200001,'2023-01-21 13:47:02','2023-01-21 13:47:02',NULL),
	(19,8,'Address #1',50.099998,50.099998,'2023-01-21 13:51:12','2023-01-21 13:51:12',NULL),
	(20,8,'Address #2',50.200001,50.200001,'2023-01-21 13:51:12','2023-01-21 13:51:12',NULL),
	(21,9,'Address #1',50.099998,50.099998,'2023-01-21 14:06:16','2023-01-21 14:06:16',NULL),
	(22,9,'Address #2',50.200001,50.200001,'2023-01-21 14:06:16','2023-01-21 14:06:16',NULL);

/*!40000 ALTER TABLE `ride_orders_routes` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы ride_orders_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ride_orders_statuses`;

CREATE TABLE `ride_orders_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `constant` varchar(32) DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `process_status` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_status` (`order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `ride_orders_statuses` WRITE;
/*!40000 ALTER TABLE `ride_orders_statuses` DISABLE KEYS */;

INSERT INTO `ride_orders_statuses` (`id`, `title`, `constant`, `order_status`, `process_status`, `created_at`)
VALUES
	(1,'Created','CREATED',1,1,'2023-01-10 15:17:35'),
	(2,'Complete','COMPLETE',1,1,'2023-01-10 15:17:38'),
	(3,'Taken by driver','TAKEN_BY_DRIVER',1,1,'2023-01-10 15:17:42'),
	(4,'Canceled by driver ','CANCELED_BY_DRIVER',1,1,'2023-01-10 15:17:45'),
	(5,'Canceled by passenger','CANCELED_BY_PASSENGER',1,1,'2023-01-10 15:17:48'),
	(6,'Canceled by manager','CANCELED_BY_MANAGER',1,1,'2023-01-10 15:17:54'),
	(7,'Driver has arrived','DRIVER_HAS_ARRIVED',1,1,'2023-01-10 15:17:56'),
	(8,'Passenger is coming','PASSENGER_IS_COMING',1,1,'2023-01-10 15:18:00'),
	(9,'Ride started','RIDE_HAS_STARTED',1,1,'2023-01-21 10:32:01'),
	(10,'Driver set arrival time','DRIVER_SET_ARRIVAL_TIME',0,1,'2023-01-21 10:50:41'),
	(11,'Price was suggested by driver','PRICE_SUGGESTED_BY_DRIVER',0,1,'2023-01-21 11:28:59'),
	(12,'Price was suggested by passenger','PRICE_SUGGESTED_BY_PASSENGER',0,1,'2023-01-21 11:29:29'),
	(13,'Driver agreed','DRIVER_AGREED',0,1,'2023-01-21 14:25:13'),
	(14,'Passenger agreed','PASSENGER_AGREED',0,1,'2023-01-21 14:32:50');

/*!40000 ALTER TABLE `ride_orders_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;

INSERT INTO `services` (`id`, `title`)
VALUES
	(1,'Персональная тернировка'),
	(2,'Правило'),
	(3,'Групповое занятие');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `user_level` int DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `last_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `patronymic` varchar(32) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(32) DEFAULT '',
  `skype` varchar(32) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `password` varchar(60) DEFAULT '',
  `balance` float(12,2) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT '',
  `interface_language` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'en',
  `profile_image` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `group_id`, `user_level`, `name`, `last_name`, `patronymic`, `gender`, `birthday`, `email`, `skype`, `phone`, `password`, `balance`, `remember_token`, `interface_language`, `profile_image`, `status`, `email_verified_at`, `phone_verified_at`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,NULL,0,X'55736572','System',NULL,1,NULL,'',NULL,'','',NULL,'','ua',NULL,0,NULL,NULL,'2020-09-07 12:27:07',NULL,NULL),
	(18,NULL,NULL,X'49686F72','Tykhonov',NULL,NULL,NULL,NULL,NULL,'380975611595','',NULL,'','en','2a868356d4ee531cda8f0d446d53bbde.jpg',0,NULL,'2023-01-06 22:25:08','2023-01-06 21:25:08','2023-01-17 16:18:53',NULL),
	(19,NULL,NULL,X'536572676579202875706429','Engstrem (upd)',NULL,NULL,NULL,'sergey.engstrem@gmail.com',NULL,'380952711111','',88.00,'','en',NULL,0,NULL,'2023-01-06 22:40:51','2023-01-06 21:40:51','2023-01-18 16:07:44',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_access_tokens`;

CREATE TABLE `users_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users_access_tokens` WRITE;
/*!40000 ALTER TABLE `users_access_tokens` DISABLE KEYS */;

INSERT INTO `users_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`)
VALUES
	(1,'App\\Models\\User',1,'public-api-token','0e61fb2c90103a02adf2e75b02e55dcfb35c3e34133e6229d243a464dda0c45d','[\"public-api\"]','2023-01-06 21:40:51',NULL,'2023-01-03 19:31:22','2023-01-06 21:40:51'),
	(15,'App\\Models\\User',18,'app','45d55efcd9e748abb206e24174f8d09d72f95f5d3ea0e752c86a59ff423a045a','[\"user-app\"]','2023-01-21 14:10:17',NULL,'2023-01-06 21:26:49','2023-01-21 14:10:17'),
	(16,'App\\Models\\User',19,'app','7b739629dd99f65ee335a6287a109ca938c3dd46c75ca65152e4a58a75d668f5','[\"user-app\"]','2023-01-21 14:09:06',NULL,'2023-01-06 21:40:51','2023-01-21 14:09:06');

/*!40000 ALTER TABLE `users_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_cars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_cars`;

CREATE TABLE `users_cars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `model` varchar(32) NOT NULL,
  `number_plate` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `year` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `in_use` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_cars` WRITE;
/*!40000 ALTER TABLE `users_cars` DISABLE KEYS */;

INSERT INTO `users_cars` (`id`, `user_id`, `brand_id`, `model`, `number_plate`, `year`, `photo`, `in_use`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(5,19,1,'Q8 (upd)','AA2255BK (upd)',2019,'c108b0b162d17234c38fd541be81f343.jpg',1,'2023-01-06 22:23:24','2023-01-14 11:48:25',NULL);

/*!40000 ALTER TABLE `users_cars` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_documents`;

CREATE TABLE `users_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_documents` WRITE;
/*!40000 ALTER TABLE `users_documents` DISABLE KEYS */;

INSERT INTO `users_documents` (`id`, `user_id`, `type_id`, `number`, `date`, `description`, `label`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(22,19,1,'3111120416 (upd)',NULL,NULL,'financial_id','2023-01-06 22:23:24','2023-01-06 22:24:11',NULL),
	(23,19,2,'AW324324WKGH78786 (upd)','2022-02-01',NULL,'driving_licence','2023-01-06 22:23:24','2023-01-14 10:48:42',NULL);

/*!40000 ALTER TABLE `users_documents` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_documents_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_documents_files`;

CREATE TABLE `users_documents_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_document_id` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mime_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_document_id` (`user_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_documents_files` WRITE;
/*!40000 ALTER TABLE `users_documents_files` DISABLE KEYS */;

INSERT INTO `users_documents_files` (`id`, `user_document_id`, `file_name`, `mime_type`, `label`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(81,23,'d97a5d24cac6fea992dc4d1c7e54ca07.png','image/png','file_1','2023-01-07 17:27:39','2023-01-07 17:27:50','2023-01-07 17:27:50'),
	(82,23,'6b88f0c037fea9d8704f0ea931a41366.png','image/png','file_2','2023-01-07 17:27:39','2023-01-07 17:27:50','2023-01-07 17:27:50'),
	(83,23,'1a5daeb459fc6538df2661c134bab5da.png','image/png','file_1','2023-01-07 17:27:50','2023-01-07 17:30:03','2023-01-07 17:30:03'),
	(84,23,'c9139edf0fc122c0d3e0af07526f4ec0.png','image/png','file_2','2023-01-07 17:27:50','2023-01-07 17:30:03','2023-01-07 17:30:03'),
	(85,23,'977b0d5dbcd09afd2adbb81a3e19e06a.png','image/png','file_1','2023-01-07 17:30:03','2023-01-07 17:31:17','2023-01-07 17:31:17'),
	(86,23,'025c2a7b0187e263dccd75bafca0dde8.png','image/png','file_2','2023-01-07 17:30:03','2023-01-07 17:31:17','2023-01-07 17:31:17'),
	(87,23,'087f332b78f2db45f5e5af034173913a.png','image/png','file_1','2023-01-07 17:31:17','2023-01-07 17:46:35','2023-01-07 17:46:35'),
	(88,23,'5e5ec7535a1425dc31ebcf64f9f9cadc.png','image/png','file_2','2023-01-07 17:31:17','2023-01-07 17:46:35','2023-01-07 17:46:35'),
	(89,23,'036b506c7a171a35c656ba929c7e6229.png','image/png','file_1','2023-01-07 17:46:35','2023-01-07 19:48:23','2023-01-07 19:48:23'),
	(90,23,'d024edb7d83bfe8bb7a4b1a034d2f6b2.png','image/png','file_2','2023-01-07 17:46:35','2023-01-07 19:48:23','2023-01-07 19:48:23'),
	(91,23,'300762b01f1bfe5cb076a162a84690a9.png','image/png','file_1','2023-01-07 19:48:23','2023-01-14 10:48:42','2023-01-14 10:48:42'),
	(92,23,'29ee3a06c7d331a2564cf594a946d638.png','image/png','file_2','2023-01-07 19:48:23','2023-01-14 10:48:42','2023-01-14 10:48:42'),
	(93,23,'8f87d238e6f22e99beec523deca0655c.png','image/png','file_1','2023-01-14 10:48:42','2023-01-14 11:33:16','2023-01-14 11:33:16'),
	(94,23,'1c0817373300727a854433c9602de681.png','image/png','file_2','2023-01-14 10:48:42','2023-01-14 11:42:40','2023-01-14 11:42:40'),
	(95,23,'ca1765775f6cd1aa1c03c98a2d0f6e59.png','image/png','file_1','2023-01-14 11:42:40','2023-01-14 11:46:40','2023-01-14 11:46:40'),
	(96,23,'5ce516391462954f6ad7f65e6bd4cef9.png','image/png','file_2','2023-01-14 11:42:40','2023-01-14 11:46:40','2023-01-14 11:46:40'),
	(97,23,'2e32c077e4bf8b4e77c770dbad577fd4.png','image/png','file_1','2023-01-14 11:46:40','2023-01-14 11:48:25','2023-01-14 11:48:25'),
	(98,23,'c77838d242c9bf26080001af3a371cc2.png','image/png','file_2','2023-01-14 11:46:40','2023-01-14 11:48:25','2023-01-14 11:48:25'),
	(99,23,'26c0bc1956c8f96b7812b012c0f8fb37.png','image/png','file_1','2023-01-14 11:48:25','2023-01-14 11:48:25',NULL),
	(100,23,'8abb8b33cb1be1815a5088d5cc4a1fa9.png','image/png','file_2','2023-01-14 11:48:25','2023-01-14 11:48:25',NULL);

/*!40000 ALTER TABLE `users_documents_files` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_documents_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_documents_types`;

CREATE TABLE `users_documents_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `cerated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_documents_types` WRITE;
/*!40000 ALTER TABLE `users_documents_types` DISABLE KEYS */;

INSERT INTO `users_documents_types` (`id`, `title`, `label`, `cerated_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Financial ID','financial_id','2023-01-06 13:25:14',NULL,NULL),
	(2,'Driving licence','driving_licence','2023-01-06 16:30:04',NULL,NULL);

/*!40000 ALTER TABLE `users_documents_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_notifications`;

CREATE TABLE `users_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `notification_id` int NOT NULL,
  `foreign_data_key` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `expired` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `user_id` (`user_id`),
  KEY `foreign_data_key` (`foreign_data_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='notification_id: ID of the notification, for example: when student was added to database and we needed to send him an email or sms, ID will be 100 or etc.\nforeign_data_key - some data for situations when we need to identify notifications existence in different contexts of usage\nstatus: 0 - awaiting, 1 - done';

LOCK TABLES `users_notifications` WRITE;
/*!40000 ALTER TABLE `users_notifications` DISABLE KEYS */;

INSERT INTO `users_notifications` (`id`, `type_id`, `user_id`, `notification_id`, `foreign_data_key`, `message`, `status`, `attempts`, `expired`, `scheduled_at`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(37,1,5,2,'45','Ждем вас 23/10 в 17:00',0,0,0,'2020-10-22 19:00:00','2020-10-16 14:58:05','2020-10-16 14:58:12','2020-10-16 14:58:12'),
	(38,1,2,2,'45','Ждем вас 23/10 в 17:00',0,0,0,'2020-10-22 19:00:00','2020-10-16 14:58:12','2020-10-16 14:58:21','2020-10-16 14:58:21'),
	(39,1,2,2,'45','Ждем вас 23/10 в 18:00',0,0,0,'2020-10-22 19:00:00','2020-10-16 14:58:21','2020-10-16 14:58:21',NULL);

/*!40000 ALTER TABLE `users_notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_ratings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_ratings`;

CREATE TABLE `users_ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `counter` int DEFAULT '0',
  `rate_1` int DEFAULT '0',
  `rate_2` int DEFAULT '0',
  `rate_3` int DEFAULT '0',
  `rate_4` int DEFAULT '0',
  `rate_5` int DEFAULT '0',
  `avarage` float(4,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_ratings` WRITE;
/*!40000 ALTER TABLE `users_ratings` DISABLE KEYS */;

INSERT INTO `users_ratings` (`id`, `user_id`, `counter`, `rate_1`, `rate_2`, `rate_3`, `rate_4`, `rate_5`, `avarage`, `created_at`, `updated_at`)
VALUES
	(4,19,2,0,0,0,0,2,5.00,'2023-01-07 19:47:08','2023-01-21 12:46:14'),
	(5,18,2,0,0,0,0,2,5.00,'2023-01-07 19:47:50','2023-01-21 12:45:23');

/*!40000 ALTER TABLE `users_ratings` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_requests`;

CREATE TABLE `users_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_requests` WRITE;
/*!40000 ALTER TABLE `users_requests` DISABLE KEYS */;

INSERT INTO `users_requests` (`id`, `user_id`, `type_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,19,1,'2023-01-17 16:08:47','2023-01-17 15:50:48','2023-01-17 15:50:48');

/*!40000 ALTER TABLE `users_requests` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`user_role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;

INSERT INTO `users_roles` (`id`, `user_id`, `user_role_id`)
VALUES
	(1,2,2),
	(12,19,5),
	(14,18,2),
	(15,18,3),
	(16,1,1),
	(17,18,6);

/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_roles_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_roles_types`;

CREATE TABLE `users_roles_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `system` int DEFAULT '0',
  `hidden` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_roles_types` WRITE;
/*!40000 ALTER TABLE `users_roles_types` DISABLE KEYS */;

INSERT INTO `users_roles_types` (`id`, `title`, `system`, `hidden`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'System',1,1,NULL,NULL,NULL),
	(2,'Главный администратор',1,0,NULL,NULL,NULL),
	(3,'Администратор',1,0,NULL,NULL,NULL),
	(5,'Driver',0,0,NULL,NULL,NULL),
	(6,'Passenger',0,0,NULL,NULL,NULL);

/*!40000 ALTER TABLE `users_roles_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_roles_types_access_permissions_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_roles_types_access_permissions_groups`;

CREATE TABLE `users_roles_types_access_permissions_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_role_type_id` int NOT NULL,
  `access_permission_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_type_id` (`user_role_type_id`),
  KEY `access_permission_group_id` (`access_permission_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_roles_types_access_permissions_groups` WRITE;
/*!40000 ALTER TABLE `users_roles_types_access_permissions_groups` DISABLE KEYS */;

INSERT INTO `users_roles_types_access_permissions_groups` (`id`, `user_role_type_id`, `access_permission_group_id`)
VALUES
	(1,3,1),
	(2,3,2),
	(3,3,3),
	(4,5,1),
	(5,5,2);

/*!40000 ALTER TABLE `users_roles_types_access_permissions_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_schedule`;

CREATE TABLE `users_schedule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `product_type_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_type_id` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users_schedule` WRITE;
/*!40000 ALTER TABLE `users_schedule` DISABLE KEYS */;

INSERT INTO `users_schedule` (`id`, `user_id`, `client_id`, `teacher_id`, `product_type_id`, `date_time`, `comment`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,2,NULL,1,'2020-10-14 17:00:00',NULL,'2020-10-14 17:27:21',NULL,NULL),
	(2,1,2,NULL,1,'2020-10-14 18:00:00',NULL,'2020-10-14 17:27:21',NULL,NULL),
	(3,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:14:18','2020-10-14 16:21:33','2020-10-14 16:21:33'),
	(4,2,2,NULL,2,'2020-10-08 14:00:00',NULL,'2020-10-14 16:14:51','2020-10-14 16:21:44','2020-10-14 16:21:44'),
	(5,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:16:49','2020-10-14 16:21:39','2020-10-14 16:21:39'),
	(6,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:16:54','2020-10-14 16:26:58','2020-10-14 16:26:58'),
	(7,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:17:17','2020-10-14 16:27:07','2020-10-14 16:27:07'),
	(8,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:27:13','2020-10-14 16:33:16','2020-10-14 16:33:16'),
	(9,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:33:23','2020-10-14 16:37:25','2020-10-14 16:37:25'),
	(10,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-14 16:38:15','2020-10-15 12:18:33','2020-10-15 12:18:33'),
	(11,2,2,5,2,'2020-10-08 16:00:00',NULL,'2020-10-14 16:43:33','2020-10-16 14:12:55','2020-10-16 14:12:55'),
	(12,2,1,NULL,1,'2020-09-30 09:00:00',NULL,'2020-10-15 08:26:45','2020-10-15 08:28:32','2020-10-15 08:28:32'),
	(13,2,1,2,1,'2020-10-08 09:00:00',NULL,'2020-10-15 11:23:35','2020-10-15 18:30:42','2020-10-15 18:30:42'),
	(14,2,1,5,1,'2020-10-08 11:00:00',NULL,'2020-10-15 11:32:02','2020-10-15 18:43:26','2020-10-15 18:43:26'),
	(15,2,1,NULL,1,'2020-10-08 09:00:00',NULL,'2020-10-15 12:17:03','2020-10-15 18:30:46','2020-10-15 18:30:46'),
	(16,2,2,5,2,'2020-10-08 15:00:00',NULL,'2020-10-15 12:17:18','2020-10-15 18:43:33','2020-10-15 18:43:33'),
	(17,2,2,NULL,1,'2020-10-15 19:00:00',NULL,'2020-10-15 12:36:09','2020-10-15 13:34:35',NULL),
	(18,2,5,1,1,'2020-10-08 08:00:00',NULL,'2020-10-15 18:00:57','2020-10-15 18:16:19','2020-10-15 18:16:19'),
	(19,2,5,1,1,'2020-10-08 08:00:00',NULL,'2020-10-15 18:13:51','2020-10-15 18:16:23','2020-10-15 18:16:23'),
	(20,2,2,5,1,'2020-10-09 12:00:00',NULL,'2020-10-15 18:16:38','2020-10-16 14:35:14',NULL),
	(21,2,2,5,1,'2020-10-18 12:00:00',NULL,'2020-10-15 18:32:09','2020-10-15 18:32:09',NULL),
	(22,2,2,5,1,'2020-10-09 12:00:00',NULL,'2020-10-15 18:34:09','2020-10-15 18:34:09',NULL),
	(23,2,5,5,2,'2020-10-08 11:00:00',NULL,'2020-10-15 18:43:19','2020-10-16 14:13:00','2020-10-16 14:13:00'),
	(24,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:29:45','2020-10-16 14:05:27','2020-10-16 14:05:27'),
	(25,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:30:11','2020-10-16 14:05:35','2020-10-16 14:05:35'),
	(26,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:30:23','2020-10-16 14:05:39','2020-10-16 14:05:39'),
	(27,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:31:39','2020-10-16 14:05:42','2020-10-16 14:05:42'),
	(28,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:40:35','2020-10-16 14:05:45','2020-10-16 14:05:45'),
	(29,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:41:07','2020-10-16 14:05:53','2020-10-16 14:05:53'),
	(30,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:41:26','2020-10-16 14:04:48','2020-10-16 14:04:48'),
	(31,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:43:24','2020-10-16 14:06:06','2020-10-16 14:06:06'),
	(32,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:43:51','2020-10-16 14:06:10','2020-10-16 14:06:10'),
	(33,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:44:28','2020-10-16 14:06:13','2020-10-16 14:06:13'),
	(34,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:53:50','2020-10-16 14:06:16','2020-10-16 14:06:16'),
	(35,2,2,1,1,'2020-10-08 08:00:00',NULL,'2020-10-16 13:55:45','2020-10-16 14:05:22','2020-10-16 14:05:22'),
	(36,2,2,5,1,'2020-10-08 08:00:00',NULL,'2020-10-16 14:06:30','2020-10-16 14:06:40','2020-10-16 14:06:40'),
	(37,2,2,5,1,'2020-10-08 10:00:00',NULL,'2020-10-16 14:06:53','2020-10-16 14:13:07','2020-10-16 14:13:07'),
	(38,2,2,5,1,'2020-10-17 13:00:00',NULL,'2020-10-16 14:13:44','2020-10-16 14:24:36','2020-10-16 14:24:36'),
	(39,2,2,1,1,'2020-10-17 11:00:00',NULL,'2020-10-16 14:24:42','2020-10-16 14:26:23','2020-10-16 14:26:23'),
	(40,2,2,5,2,'2020-10-17 11:00:00',NULL,'2020-10-16 14:26:36','2020-10-16 14:26:59',NULL),
	(41,2,2,1,3,'2020-10-09 08:00:00',NULL,'2020-10-16 14:39:49','2020-10-19 19:34:22',NULL),
	(42,2,6,1,1,'2020-10-09 08:00:00',NULL,'2020-10-16 14:40:05','2020-10-16 14:40:28','2020-10-16 14:40:28'),
	(43,2,6,1,2,'2020-10-09 08:00:00',NULL,'2020-10-16 14:40:55','2020-10-19 19:34:05',NULL),
	(44,2,6,1,1,'2020-10-18 16:00:00',NULL,'2020-10-16 14:41:50','2020-10-16 14:42:23','2020-10-16 14:42:23'),
	(45,2,2,5,1,'2020-10-23 18:00:00',NULL,'2020-10-16 14:42:40','2020-10-16 14:58:21',NULL),
	(46,2,1,1,2,'2020-10-09 08:00:00',NULL,'2020-10-19 19:33:58','2020-10-19 19:33:58',NULL);

/*!40000 ALTER TABLE `users_schedule` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
