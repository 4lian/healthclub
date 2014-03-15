# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.16)
# Database: healthclube
# Generation Time: 2014-03-15 14:58:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bank_card
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bank_card`;

CREATE TABLE `bank_card` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bank_card_1_idx` (`user_id`),
  CONSTRAINT `bank_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bank_card` WRITE;
/*!40000 ALTER TABLE `bank_card` DISABLE KEYS */;

INSERT INTO `bank_card` (`id`, `user_id`)
VALUES
	('346734673477634764376hghghghgh',1),
	('hdrthrtujtyjhtyj',1),
	('fdgsfhghrthtyjuyj',2),
	('gdfgfhghrtdhtyejyt',2);

/*!40000 ALTER TABLE `bank_card` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coach
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coach`;

CREATE TABLE `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table doing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doing`;

CREATE TABLE `doing` (
  `address` varchar(45) DEFAULT NULL,
  `waiter_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doing_name` varchar(45) DEFAULT NULL,
  `doing_desc` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

LOCK TABLES `doing` WRITE;
/*!40000 ALTER TABLE `doing` DISABLE KEYS */;

INSERT INTO `doing` (`address`, `waiter_id`, `create_time`, `start_time`, `end_time`, `doing_name`, `doing_desc`, `id`)
VALUES
	('ergewrter',1,'2014-03-14 20:36:06','2014-03-28 22:50:00','2014-03-30 21:50:00','ffreg',NULL,18),
	('fergrtgrthtr',1,'2014-03-14 22:32:35','2014-03-06 10:30:00','2014-03-07 22:30:00','dkdkjdjk',NULL,19),
	('fergrtgrthtr',1,'2014-03-14 22:32:35','2014-03-06 10:30:00','2014-03-07 22:30:00','dkdkjdjk',NULL,20);

/*!40000 ALTER TABLE `doing` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doing_client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doing_client`;

CREATE TABLE `doing_client` (
  `doing_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invove_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`doing_id`,`user_id`),
  KEY `fk_doing_client_1_idx` (`doing_id`),
  KEY `fk_doing_client_2_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table doing_coach
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doing_coach`;

CREATE TABLE `doing_coach` (
  `cocah_id` int(11) NOT NULL,
  `doing_id` int(11) NOT NULL,
  PRIMARY KEY (`cocah_id`,`doing_id`),
  KEY `doing_id_idx` (`doing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_manager_1_idx` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pay_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pay_log`;

CREATE TABLE `pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `brank_card_id` varchar(50) DEFAULT NULL,
  `pay_type` enum('active','last_fee') DEFAULT NULL,
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` double DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `fk_pay_log_1_idx` (`user_id`),
  KEY `brank_card_id` (`brank_card_id`),
  CONSTRAINT `pay_log_ibfk_1` FOREIGN KEY (`brank_card_id`) REFERENCES `bank_card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

LOCK TABLES `pay_log` WRITE;
/*!40000 ALTER TABLE `pay_log` DISABLE KEYS */;

INSERT INTO `pay_log` (`id`, `user_id`, `brank_card_id`, `pay_type`, `pay_time`, `count`, `message`)
VALUES
	(11,1,'hdrthrtujtyjhtyj','active','2014-03-11 17:20:44',75,'???????????'),
	(12,1,'346734673477634764376hghghghgh','active','2014-03-12 10:01:39',75,'gsgrtgrth'),
	(13,1,'346734673477634764376hghghghgh','last_fee','2014-03-12 10:15:48',40,'dfdsgrtg'),
	(14,1,'346734673477634764376hghghghgh','last_fee','2014-03-12 10:27:01',40,'dgsgrstgrt'),
	(15,1,'346734673477634764376hghghghgh','last_fee','2014-03-12 10:41:55',40,'ferretr'),
	(16,1,'346734673477634764376hghghghgh','last_fee','2014-03-12 10:45:19',40,NULL),
	(17,2,'gdfgfhghrtdhtyejyt','active','2014-03-14 09:01:39',75,'egsrgrth'),
	(18,2,'fdgsfhghrthtyjuyj','last_fee','2014-03-14 09:10:51',155,'fadgsdgrhgrtshrt');

/*!40000 ALTER TABLE `pay_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `card_id` char(7) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `child_num` int(11) DEFAULT '0',
  `brith` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` enum('male','female') DEFAULT 'male',
  `regular_pay_time` timestamp NULL DEFAULT NULL,
  `status` enum('not-active','active','pending','end') NOT NULL DEFAULT 'not-active',
  `age` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;

INSERT INTO `profile` (`card_id`, `telephone`, `mobile_phone`, `address`, `full_name`, `child_num`, `brith`, `id`, `gender`, `regular_pay_time`, `status`, `age`)
VALUES
	('O6ea1Bv','15195991250','15195991250','df','ssjssh',10,'2014-03-07 00:00:00',1,'female','2014-03-14 21:03:00','pending',0),
	('85zCfc7','1717272626','23432435436546','kfjsfjkdjkgjfdjgjdfsjhgjhfgfd','sshjsjs',10,'2012-10-10 00:00:00',2,'female','2014-03-14 21:02:57','active',1),
	(NULL,NULL,NULL,NULL,NULL,0,'2011-10-10 00:00:00',3,'male','2014-03-14 22:11:48','active',3),
	(NULL,NULL,NULL,NULL,NULL,0,NULL,4,'male','2014-03-14 21:02:59','active',0),
	(NULL,NULL,NULL,NULL,NULL,0,NULL,5,'male','2014-03-14 21:02:59','active',0),
	(NULL,NULL,NULL,NULL,NULL,0,NULL,6,'male',NULL,'not-active',NULL);

/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `calculate_age` BEFORE INSERT ON `profile` FOR EACH ROW set new.age=timestampdiff(YEAR,timestamp(new.brith),timestamp(now()))+1; */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `update_age` BEFORE UPDATE ON `profile` FOR EACH ROW set new.age=timestampdiff(YEAR,timestamp(new.brith),timestamp(now()))+1; */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员ID，由7位组成。系统自动分配。',
  `end` enum('true','false') DEFAULT 'false',
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `type` enum('private','family') NOT NULL DEFAULT 'private',
  `role` enum('user','waiter','manager') NOT NULL DEFAULT 'user',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `end`, `password`, `name`, `email`, `type`, `role`, `create_time`)
VALUES
	(1,'false','18dfc2bc2a2f228028eeaf97a4f2218c','ssj','ssj970763342@163.com','family','waiter',NULL),
	(2,'false','18dfc2bc2a2f228028eeaf97a4f2218c','ssh','97073342@qq.com','family','user',NULL),
	(3,'false','18dfc2bc2a2f228028eeaf97a4f2218c','sshu','970733ww42@qq.com','private','waiter',NULL),
	(4,'false','18dfc2bc2a2f228028eeaf97a4f2218c','man','man@man.com','private','manager',NULL),
	(5,'false','18dfc2bc2a2f228028eeaf97a4f2218c','ssjssh','ssj970763342@163.coeem','private','user',NULL),
	(6,'false','dsfsdgdgrgtrgtrg','sshdf',NULL,'private','user','2014-03-15 15:19:07');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table waiter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `waiter`;

CREATE TABLE `waiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `waiter_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `waiter` WRITE;
/*!40000 ALTER TABLE `waiter` DISABLE KEYS */;

INSERT INTO `waiter` (`id`, `user_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `waiter` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
