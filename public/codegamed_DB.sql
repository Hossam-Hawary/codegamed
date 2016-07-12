-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: codegamed_dev
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin@example.com','$2a$11$5OlFtGBYSWiz/92Z.l0VmePgbMFkNW9aovZ7VHbgMi8bHgdGxL.Vi',NULL,NULL,NULL,18,'2016-06-13 21:10:59','2016-06-13 20:41:28','197.35.78.210','197.35.78.210','2016-06-11 17:07:28','2016-06-13 21:10:59');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'La3ib Gamed ','foursquare-newbie.png','2016-06-11 17:22:12','2016-06-11 21:05:02'),(2,'El PoP','weekly-mastery-512x512.png','2016-06-11 17:22:44','2016-06-11 21:05:27'),(3,'El King','LamborghiniLogo.png','2016-06-12 10:52:56','2016-06-12 23:31:56'),(4,'El 3omda','Badge-03.png','2016-06-12 11:06:04','2016-06-13 00:13:39'),(5,'Hero','logo_transparent.png','2016-06-12 11:07:49','2016-06-12 11:07:49'),(6,'Dark Knight','claymore.gif','2016-06-12 11:09:08','2016-06-12 12:49:12'),(7,'Coder Gamed','Code_Gamed_logo.png','2016-06-12 15:43:07','2016-06-12 15:43:07');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (9,7,4,1,'2016-06-11 20:38:51','2016-06-11 20:38:51'),(14,6,8,0,'2016-06-12 10:28:31','2016-06-12 10:28:31'),(16,9,8,1,'2016-06-12 12:08:06','2016-06-12 12:08:06'),(19,9,4,1,'2016-06-12 12:08:06','2016-06-12 12:08:06'),(22,7,8,0,'2016-06-13 02:25:40','2016-06-13 02:25:40'),(23,7,6,1,'2016-06-13 02:25:52','2016-06-13 21:08:10'),(24,10,4,1,'2016-06-13 07:33:19','2016-06-13 07:33:19'),(25,11,10,1,'2016-06-13 07:37:22','2016-06-13 07:37:22'),(26,12,7,1,'2016-06-13 07:48:49','2016-06-13 07:48:49'),(27,12,11,1,'2016-06-13 07:48:49','2016-06-13 07:48:49'),(33,15,7,1,'2016-06-13 09:07:42','2016-06-13 09:07:42'),(34,15,4,1,'2016-06-13 09:07:42','2016-06-13 09:07:42'),(35,15,12,1,'2016-06-13 09:07:42','2016-06-13 09:07:42'),(36,15,9,1,'2016-06-13 09:07:42','2016-06-13 09:07:42'),(37,15,6,1,'2016-06-13 09:07:42','2016-06-13 09:07:42'),(40,16,7,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(41,16,11,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(42,16,15,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(43,16,12,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(44,16,6,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(45,16,10,1,'2016-06-13 14:03:45','2016-06-13 14:03:45'),(48,16,4,1,'2016-06-13 14:06:31','2016-06-13 15:12:35'),(49,6,12,0,'2016-06-13 21:07:52','2016-06-13 21:07:52'),(50,17,7,1,'2016-06-13 21:09:03','2016-06-13 21:09:03'),(51,18,7,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(52,18,15,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(53,18,4,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(54,18,12,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(55,18,17,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(56,18,9,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(57,18,6,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(58,18,10,1,'2016-06-13 21:49:36','2016-06-13 21:49:36'),(61,21,20,1,'2016-06-14 12:21:03','2016-06-14 12:21:03'),(62,21,17,1,'2016-06-14 12:21:03','2016-06-14 12:21:03'),(63,22,21,1,'2016-06-14 12:22:11','2016-06-14 12:22:11'),(64,23,9,1,'2016-06-14 19:00:53','2016-06-14 19:00:53'),(65,24,7,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(66,24,11,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(67,24,12,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(68,24,18,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(69,24,10,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(70,25,7,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(71,25,11,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(72,25,4,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(73,25,12,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(74,25,9,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(75,25,6,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(76,25,24,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(77,25,16,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(78,25,18,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(79,25,10,1,'2016-06-15 11:06:54','2016-06-15 11:06:54'),(80,26,15,1,'2016-06-16 12:16:38','2016-06-16 12:16:38'),(81,27,7,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(82,27,25,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(83,27,11,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(84,27,15,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(85,27,4,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(86,27,12,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(87,27,9,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(88,27,6,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(89,27,24,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(90,27,16,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(91,27,18,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(92,27,10,1,'2016-06-16 14:06:16','2016-06-16 14:06:16'),(94,31,9,1,'2016-06-22 18:52:08','2016-06-22 18:52:08'),(95,32,7,1,'2016-06-26 22:14:42','2016-06-26 22:14:42'),(96,33,4,1,'2016-06-28 11:40:16','2016-07-11 07:59:41');
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_levels_on_badge_id` (`badge_id`),
  CONSTRAINT `fk_rails_738534555f` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,1,1,'2016-06-11 17:29:42','2016-06-12 16:02:13'),(2,2,2,'2016-06-11 17:29:42','2016-06-12 13:05:50'),(3,3,3,'2016-06-12 11:05:21','2016-06-12 13:05:50'),(4,4,4,'2016-06-12 16:12:57','2016-06-12 16:15:20');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `problem` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `initial_code` text,
  PRIMARY KEY (`id`),
  KEY `index_missions_on_level_id` (`level_id`),
  CONSTRAINT `fk_rails_786961fa4c` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,1,100,1,'https://player.vimeo.com/video/170303574','<p>Find the smallest number from the given two integers.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>For&nbsp;<code>a = 3</code>&nbsp;and&nbsp;<code>b = 2</code>, the output should be<br />\r\n<code>myMin(a, b) = 2</code>.</p>\r\n\r\n<p><strong>Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 3000ms (java)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] integer a</strong></p>\r\n\r\n	<p><em>Constraints:</em><br />\r\n	<code>0 &le; a &le; 20</code>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer b</strong></p>\r\n\r\n	<p><em>Constraints:</em><br />\r\n	<code>0 &le; b &le; 20</code>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] integer</strong></p>\r\n\r\n	<p>Min of&nbsp;<code>a</code>&nbsp;and&nbsp;<code>b</code>.</p>\r\n	</li>\r\n</ul>\r\n','2016-06-11 17:29:42','2016-06-11 18:33:19','\r\nint myMin(int a, int b) {\r\n  if (a > b) {\r\n    return a;\r\n  }\r\n  return b;\r\n}\r\n'),(2,2,200,1,'https://player.vimeo.com/video/170306770','<p>Given integer&nbsp;<code>n</code>, find&nbsp;<a href=\"javascript:void(0);\" target=\"_blank\" title=\"Click here to see the definition\">n!</a>.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>For&nbsp;<code>n = 5</code>, the output should be<br />\r\n<code>factorial(n) = 120</code>.</p>\r\n\r\n<p>Here&nbsp;<code>1 * 2 * 3 * 4 * 5 = 120</code>.</p>\r\n\r\n<p><strong>Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 4000ms (js)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] integer n</strong></p>\r\n\r\n	<p><em>Constraints:</em><br />\r\n	<code>0 &le; n &le; 10</code>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] integer</strong></p>\r\n	</li>\r\n</ul>\r\n','2016-06-11 17:29:42','2016-06-11 18:55:47','\r\nint factorial(int n) {\r\n\r\n  if (n == 0) {\r\n    return 1;\r\n  }\r\n\r\n  return  ... ;\r\n}\r\n'),(3,1,100,2,'https://player.vimeo.com/video/161243155','<p>return &quot;hello world&quot;.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>Press Submit and &nbsp;the output should be<br />\r\n<code>&quot;hello world&quot;</code>.</p>\r\n','2016-06-11 17:29:42','2016-06-12 10:25:48','String hello_world() {\r\n  return \"hello world\";\r\n}\r\n'),(4,2,200,2,'https://player.vimeo.com/video/164479194?title=0&byline=0&portrait=0','\n<p>Given integer&nbsp;<code>n</code>, find&nbsp;<a href=\'javascript:void(0);\' target=\'_blank\' title=\'Click here to see the definition\'>n!</a>.</p>\n\n<p><strong>Example</strong></p>\n\n<p>For&nbsp;<code>n = 5</code>, the output should be<br />\n<code>factorial(n) = 120</code>.</p>\n\n<p>Here&nbsp;<code>1 * 2 * 3 * 4 * 5 = 120</code>.</p>\n\n<p><strong>Input/Output</strong></p>\n\n<ul>\n	<li><strong>[time limit] 4000ms (js)</strong></li>\n</ul>\n\n<ul>\n	<li>\n	<p><strong>[input] integer n</strong></p>\n\n	<p><em>Constraints:</em><br />\n	<code>0 &le; n &le; 10</code>.</p>\n	</li>\n	<li>\n	<p><strong>[output] integer</strong></p>\n	</li>\n</ul>','2016-06-11 17:29:42','2016-06-11 17:29:42','\nint factorial(int n) {\n\n  if (n == 0) {\n    return 1;\n  }\n\n  return  ... ;\n}\n'),(5,1,100,3,'','<p>A function that adds two numbers.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>For&nbsp;<code>param1 = 1</code>&nbsp;and&nbsp;<code>param2 = 2</code>, the output should be&nbsp;<code>add(param1, param2) = 3</code>.</p>\r\n\r\n<p><strong>Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 3000ms (java)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] integer param1</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;-100 &le; param1 &le; 1000.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer param2</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;-100 &le; param2 &le; 1000.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] integer</strong></p>\r\n\r\n	<p>The sum of the two inputs.</p>\r\n	</li>\r\n</ul>\r\n','2016-06-12 11:07:26','2016-06-12 11:17:46','int add(int param1, int param2) {\r\n  return param1 + param1;\r\n}'),(6,2,200,3,'','<p>Given three integers, two of them are guaranteed to be equal, find the third one.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>For&nbsp;<code>A = 2</code>,&nbsp;<code>B = 4</code>&nbsp;and&nbsp;<code>C = 2</code>, the output should be&nbsp;<code>extraNumber(A, B, C) = 4</code>.</p>\r\n\r\n<p><strong>Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 3000ms (java)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] integer A</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;1 &le; A &le; 109.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer B</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;1 &le; B &le; 109.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer C</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;1 &le; C &le; 109.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] integer</strong></p>\r\n	</li>\r\n</ul>\r\n','2016-06-12 11:20:57','2016-06-12 11:20:57','int extraNumber(int A, int B, int C) {\r\n    if (A == B)\r\n        return ...;\r\n    \r\n    if (A == C)\r\n        return ...;\r\n    \r\n    return A;\r\n    \r\n    \r\n}'),(7,3,300,2,'','<p>Find the largest number from the given three integers.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>For&nbsp;<code>a = 3</code>,&nbsp;<code>b = 2</code>&nbsp;and&nbsp;<code>c = 4</code>, the output should be&nbsp;<code>myMaxOfThree(a, b, c) = 4</code>.</p>\r\n\r\n<p><strong>Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 3000ms (java)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] integer a</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;-100 &le; a &le; 100.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer b</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;-100 &le; b &le; 100.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] integer c</strong></p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;-100 &le; c &le; 100.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] integer</strong></p>\r\n\r\n	<p>Max of&nbsp;<code>a</code>,&nbsp;<code>b</code>&nbsp;and&nbsp;<code>c</code>.</p>\r\n	</li>\r\n</ul>\r\n','2016-06-12 11:34:49','2016-06-12 12:26:47','int myMaxOfThree(int a, int b, int c) {\r\n  if (a > b) {\r\n    if (a > c) {\r\n      return a;\r\n    }\r\n    return c;\r\n  }\r\n  if (b > a && b>c) {\r\n    return ......;\r\n  }\r\n  return c;\r\n}'),(8,3,300,3,'','<p>Compare two integers given as strings.</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; . for a = &quot;12&quot; and b = &quot;13&quot; , the output should be compareIntegers(a,b) = &quot;less&quot;;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; . for a =&quot;875&quot; and b = &quot;799&quot;, the output should be compareIntegers(a,b) = &quot;greater&quot;;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; .for a =&quot;1000&quot; and b = &quot;1000&quot; , the output should be compareIntegers(a,b) = &quot;equal&quot;.</p>\r\n\r\n<p><strong style=\"line-height:1.6\">Input/Output</strong></p>\r\n\r\n<ul>\r\n	<li><strong>[time limit] 3000ms (java)</strong></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>[input] string a</strong></p>\r\n\r\n	<p>A string representing a&nbsp;<em>positive</em>&nbsp;integer&nbsp;<em>without</em>&nbsp;leading zeroes.</p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;1 &le; a.length &le; 10.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[input] string b</strong></p>\r\n\r\n	<p>A string representing a&nbsp;<em>positive</em>&nbsp;integer&nbsp;<em>without</em>&nbsp;leading zeroes.</p>\r\n\r\n	<p><em>Constraints:</em>&nbsp;1 &le; b.length &le; 10.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>[output] string</strong></p>\r\n\r\n	<p><code>&#39;less&#39;</code>&nbsp;if&nbsp;<code>int(a) &lt; int(b)</code>,&nbsp;<code>&#39;equal&#39;</code>&nbsp;if&nbsp;<code>int(a) = int(b)</code>, and<code>&#39;greater&#39;</code>&nbsp;if&nbsp;<code>int(a) &gt; int(b)</code>, where&nbsp;<code>int(x)</code>&nbsp;is equal to integer represented by the string&nbsp;<code>x</code>.</p>\r\n	</li>\r\n</ul>\r\n','2016-06-12 12:32:21','2016-06-12 12:43:57','String compareIntegers(String a, String b) {\r\n\r\n  if (a.length() > b.length()) {\r\n    return  ... ;\r\n  }\r\n  if (a.length() < b.length()) {\r\n    return \"less\";\r\n  }\r\n  if (a.compareTo(b) < 0) {\r\n    return \"less\";\r\n  }\r\n  if (a.compareTo(b) > 0) {\r\n    return \"greater\";\r\n  }\r\n  return \"equal\";\r\n}\r\n'),(9,3,400,1,'','<p>Devide Two Numbers .</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>For x = 6 and y= 2 then the result is 3<br />\r\n	&nbsp;</li>\r\n	<li>For x = 12 and y= 3 then the result is 4</li>\r\n</ul>\r\n','2016-06-12 12:45:15','2016-06-13 07:54:39','int Divide(int x , int y) {\r\n\r\n    return .../...;\r\n}');
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passed_levels`
--

DROP TABLE IF EXISTS `passed_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passed_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `last_mission_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_passed_levels_on_level_id` (`level_id`),
  KEY `index_passed_levels_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_bbf1b64d97` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_0359c8af94` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passed_levels`
--

LOCK TABLES `passed_levels` WRITE;
/*!40000 ALTER TABLE `passed_levels` DISABLE KEYS */;
INSERT INTO `passed_levels` VALUES (3,1,4,100,1,'2016-06-11 17:29:42','2016-06-13 07:53:58'),(7,1,7,100,1,'2016-06-11 20:38:51','2016-06-15 10:03:41'),(10,1,8,33,1,'2016-06-12 09:42:28','2016-06-12 09:43:22'),(12,1,9,66,1,'2016-06-12 12:08:05','2016-06-13 23:28:56'),(19,1,10,0,1,'2016-06-13 07:33:18','2016-06-13 07:33:18'),(20,1,11,33,1,'2016-06-13 07:37:22','2016-06-18 15:20:26'),(21,1,12,0,1,'2016-06-13 07:48:49','2016-06-13 07:48:49'),(22,2,4,100,1,'2016-06-13 07:53:58','2016-06-13 07:56:39'),(23,3,4,66,1,'2016-06-13 07:56:39','2016-06-13 07:58:32'),(26,1,15,100,1,'2016-06-13 09:07:42','2016-06-24 12:53:20'),(27,1,16,100,1,'2016-06-13 14:03:44','2016-06-13 14:06:01'),(28,2,16,0,1,'2016-06-13 14:06:01','2016-06-13 14:06:01'),(29,1,6,33,1,'0000-00-00 00:00:00','2016-06-13 21:10:04'),(30,1,17,0,1,'2016-06-13 21:09:03','2016-06-13 21:09:03'),(31,1,18,33,1,'2016-06-13 21:49:36','2016-06-13 21:55:29'),(32,1,19,0,1,'2016-06-14 10:27:34','2016-06-14 10:27:34'),(33,1,20,0,1,'2016-06-14 12:18:47','2016-06-14 12:18:47'),(34,1,21,0,1,'2016-06-14 12:21:02','2016-06-14 12:21:02'),(35,1,22,0,1,'2016-06-14 12:22:11','2016-06-14 12:22:11'),(36,1,23,33,1,'2016-06-14 19:00:53','2016-06-14 19:05:35'),(37,1,24,0,1,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(38,2,7,100,1,'2016-06-15 10:03:41','2016-06-15 10:04:37'),(39,3,7,66,1,'2016-06-15 10:04:37','2016-06-15 10:05:15'),(40,1,25,0,1,'2016-06-15 11:06:53','2016-06-15 11:06:53'),(41,1,26,0,1,'2016-06-16 12:16:38','2016-06-16 12:16:38'),(42,1,27,100,1,'2016-06-16 14:06:16','2016-06-16 14:39:59'),(43,2,27,100,1,'2016-06-16 14:39:59','2016-06-16 14:43:32'),(44,3,27,66,1,'2016-06-16 14:43:32','2016-06-16 14:54:06'),(45,1,28,0,1,'2016-06-17 12:16:24','2016-06-17 12:16:24'),(46,1,29,0,1,'2016-06-18 13:54:00','2016-06-18 13:54:00'),(47,1,30,0,1,'2016-06-21 03:08:02','2016-06-21 03:08:02'),(48,1,31,0,1,'2016-06-22 18:52:08','2016-06-22 18:52:08'),(49,2,15,100,1,'2016-06-24 12:53:20','2016-06-24 12:54:21'),(50,3,15,66,1,'2016-06-24 12:54:21','2016-06-24 12:54:59'),(51,1,32,0,1,'2016-06-26 22:14:42','2016-06-26 22:14:42'),(52,1,33,100,1,'2016-06-28 11:39:40','2016-06-28 11:43:43'),(53,2,33,66,1,'2016-06-28 11:43:43','2016-06-28 11:44:21'),(54,1,34,0,1,'2016-07-11 18:57:38','2016-07-11 18:57:38');
/*!40000 ALTER TABLE `passed_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passed_missions`
--

DROP TABLE IF EXISTS `passed_missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passed_missions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `mission_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_passed_missions_on_user_id` (`user_id`),
  KEY `index_passed_missions_on_mission_id` (`mission_id`),
  CONSTRAINT `fk_rails_55249bfd6b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_b3327a3ecc` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passed_missions`
--

LOCK TABLES `passed_missions` WRITE;
/*!40000 ALTER TABLE `passed_missions` DISABLE KEYS */;
INSERT INTO `passed_missions` VALUES (3,4,1,'2016-06-11 17:29:42','2016-06-13 07:33:47','2016-06-13 07:33:47'),(9,7,1,'2016-06-11 20:38:51','2016-06-13 07:57:43','2016-06-13 07:57:43'),(13,8,1,'2016-06-12 09:42:28','2016-06-12 09:43:22',NULL),(19,9,1,'2016-06-12 12:08:05','2016-06-13 08:34:05','2016-06-13 08:34:05'),(44,10,1,'2016-06-13 07:33:19','2016-06-13 07:33:19',NULL),(45,4,2,'2016-06-13 07:33:47','2016-06-13 07:34:29','2016-06-13 07:34:29'),(46,4,9,'2016-06-13 07:34:29','2016-06-13 07:53:58','2016-06-13 07:53:58'),(47,11,1,'2016-06-13 07:37:22','2016-06-18 15:20:26','2016-06-18 15:20:26'),(48,12,1,'2016-06-13 07:48:49','2016-06-13 07:48:49',NULL),(49,4,3,'2016-06-13 07:53:58','2016-06-13 07:55:41','2016-06-13 07:55:41'),(50,4,4,'2016-06-13 07:55:41','2016-06-13 07:56:12','2016-06-13 07:56:12'),(51,4,7,'2016-06-13 07:56:12','2016-06-13 07:56:39','2016-06-13 07:56:39'),(52,4,5,'2016-06-13 07:56:39','2016-06-13 07:57:13','2016-06-13 07:57:13'),(53,4,6,'2016-06-13 07:57:13','2016-06-13 07:58:32','2016-06-13 07:58:32'),(54,7,2,'2016-06-13 07:57:43','2016-06-15 10:03:23','2016-06-15 10:03:23'),(55,4,8,'2016-06-13 07:58:32','2016-06-13 07:58:32',NULL),(58,9,2,'2016-06-13 08:34:05','2016-06-13 23:28:56','2016-06-13 23:28:56'),(59,15,1,'2016-06-13 09:07:42','2016-06-13 09:09:08','2016-06-13 09:09:08'),(60,15,2,'2016-06-13 09:09:08','2016-06-24 12:52:56','2016-06-24 12:52:56'),(61,16,1,'2016-06-13 14:03:44','2016-06-13 14:04:57','2016-06-13 14:04:57'),(62,16,2,'2016-06-13 14:04:57','2016-06-13 14:05:38','2016-06-13 14:05:38'),(63,16,9,'2016-06-13 14:05:38','2016-06-13 14:06:01','2016-06-13 14:06:01'),(64,16,3,'2016-06-13 14:06:01','2016-06-13 14:06:01',NULL),(65,6,1,'0000-00-00 00:00:00','2016-06-13 21:10:04','2016-06-13 21:10:04'),(66,17,1,'2016-06-13 21:09:03','2016-06-13 21:09:03',NULL),(67,6,2,'2016-06-13 21:10:04','2016-06-13 21:10:04',NULL),(68,18,1,'2016-06-13 21:49:36','2016-06-13 21:55:29','2016-06-13 21:55:29'),(69,18,2,'2016-06-13 21:55:30','2016-06-13 21:55:30',NULL),(70,9,9,'2016-06-13 23:28:56','2016-06-13 23:28:56',NULL),(71,19,1,'2016-06-14 10:27:34','2016-06-14 10:27:34',NULL),(72,20,1,'2016-06-14 12:18:47','2016-06-14 12:18:47',NULL),(73,21,1,'2016-06-14 12:21:02','2016-06-14 12:21:02',NULL),(74,22,1,'2016-06-14 12:22:11','2016-06-14 12:22:11',NULL),(75,23,1,'2016-06-14 19:00:53','2016-06-14 19:05:35','2016-06-14 19:05:35'),(76,23,2,'2016-06-14 19:05:35','2016-06-14 19:05:35',NULL),(77,24,1,'2016-06-14 20:17:27','2016-06-14 20:17:27',NULL),(78,7,9,'2016-06-15 10:03:23','2016-06-15 10:03:41','2016-06-15 10:03:41'),(79,7,3,'2016-06-15 10:03:41','2016-06-15 10:04:07','2016-06-15 10:04:07'),(80,7,4,'2016-06-15 10:04:07','2016-06-15 10:04:22','2016-06-15 10:04:22'),(81,7,7,'2016-06-15 10:04:22','2016-06-15 10:04:37','2016-06-15 10:04:37'),(82,7,5,'2016-06-15 10:04:37','2016-06-15 10:04:56','2016-06-15 10:04:56'),(83,7,6,'2016-06-15 10:04:56','2016-06-15 10:05:15','2016-06-15 10:05:15'),(84,7,8,'2016-06-15 10:05:15','2016-06-15 10:05:15',NULL),(85,25,1,'2016-06-15 11:06:53','2016-06-15 11:06:53',NULL),(86,26,1,'2016-06-16 12:16:38','2016-06-16 12:16:38',NULL),(87,27,1,'2016-06-16 14:06:16','2016-06-16 14:34:38','2016-06-16 14:34:38'),(88,27,2,'2016-06-16 14:34:38','2016-06-16 14:38:53','2016-06-16 14:38:53'),(89,27,9,'2016-06-16 14:38:53','2016-06-16 14:39:59','2016-06-16 14:39:59'),(90,27,3,'2016-06-16 14:39:59','2016-06-16 14:40:23','2016-06-16 14:40:23'),(91,27,4,'2016-06-16 14:40:23','2016-06-16 14:40:58','2016-06-16 14:40:58'),(92,27,7,'2016-06-16 14:40:58','2016-06-16 14:43:32','2016-06-16 14:43:32'),(93,27,5,'2016-06-16 14:43:32','2016-06-16 14:44:00','2016-06-16 14:44:00'),(94,27,6,'2016-06-16 14:44:00','2016-06-16 14:54:06','2016-06-16 14:54:06'),(95,27,8,'2016-06-16 14:54:06','2016-06-16 14:54:06',NULL),(96,28,1,'2016-06-17 12:16:24','2016-06-17 12:16:24',NULL),(97,29,1,'2016-06-18 13:54:00','2016-06-18 13:54:00',NULL),(98,11,2,'2016-06-18 15:20:26','2016-06-18 15:20:26',NULL),(99,30,1,'2016-06-21 03:08:02','2016-06-21 03:08:02',NULL),(100,31,1,'2016-06-22 18:52:08','2016-06-22 18:52:08',NULL),(101,15,9,'2016-06-24 12:52:56','2016-06-24 12:53:20','2016-06-24 12:53:20'),(102,15,3,'2016-06-24 12:53:20','2016-06-24 12:53:29','2016-06-24 12:53:29'),(103,15,4,'2016-06-24 12:53:29','2016-06-24 12:54:02','2016-06-24 12:54:02'),(104,15,7,'2016-06-24 12:54:02','2016-06-24 12:54:21','2016-06-24 12:54:21'),(105,15,5,'2016-06-24 12:54:21','2016-06-24 12:54:37','2016-06-24 12:54:37'),(106,15,6,'2016-06-24 12:54:37','2016-06-24 12:54:59','2016-06-24 12:54:59'),(107,15,8,'2016-06-24 12:54:59','2016-06-24 12:54:59',NULL),(108,32,1,'2016-06-26 22:14:42','2016-06-26 22:14:42',NULL),(109,33,1,'2016-06-28 11:39:40','2016-06-28 11:42:33','2016-06-28 11:42:33'),(110,33,2,'2016-06-28 11:42:33','2016-06-28 11:43:12','2016-06-28 11:43:12'),(111,33,9,'2016-06-28 11:43:12','2016-06-28 11:43:43','2016-06-28 11:43:43'),(112,33,3,'2016-06-28 11:43:43','2016-06-28 11:43:57','2016-06-28 11:43:57'),(113,33,4,'2016-06-28 11:43:57','2016-06-28 11:44:21','2016-06-28 11:44:21'),(114,33,7,'2016-06-28 11:44:21','2016-06-28 11:44:21',NULL),(115,34,1,'2016-07-11 18:57:38','2016-07-11 18:57:38',NULL);
/*!40000 ALTER TABLE `passed_missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160518105700'),('20160518110534'),('20160518110852'),('20160518111113'),('20160518111331'),('20160518131122'),('20160518132929'),('20160519165431'),('20160521152302'),('20160529100441'),('20160531130526'),('20160605170357'),('20160611101843');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_cases`
--

DROP TABLE IF EXISTS `test_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) DEFAULT NULL,
  `input` varchar(255) DEFAULT NULL,
  `output` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `return_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_cases_on_mission_id` (`mission_id`),
  CONSTRAINT `fk_rails_81e216ad55` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_cases`
--

LOCK TABLES `test_cases` WRITE;
/*!40000 ALTER TABLE `test_cases` DISABLE KEYS */;
INSERT INTO `test_cases` VALUES (1,1,'myMin(3,2)','2','2016-06-11 17:29:42','2016-06-11 23:16:45','int'),(2,2,'factorial(5)','120','2016-06-11 17:29:42','2016-06-11 23:17:01','int'),(3,2,'factorial(0)','1','2016-06-11 17:29:42','2016-06-11 23:17:22','int'),(4,3,'hello_world()','hello world','2016-06-11 17:29:42','2016-06-12 10:26:10','String'),(5,4,'factorial(5)','120','2016-06-11 17:29:42','2016-06-11 23:17:41','int'),(6,4,'factorial(0)','1','2016-06-11 17:29:42','2016-06-11 23:17:54','int'),(7,5,'add(1,2)','3','2016-06-12 11:09:05','2016-06-12 11:09:05','int'),(8,5,'add(0,1000)','1000','2016-06-12 11:14:35','2016-06-12 11:14:35','int'),(9,5,'add(1000,200)','1200','2016-06-12 11:15:00','2016-06-12 12:14:47','int'),(10,6,'extraNumber(2,4,2)','4','2016-06-12 11:21:52','2016-06-12 11:21:52','int'),(11,6,'extraNumber(3,2,2)','3','2016-06-12 11:22:22','2016-06-12 12:14:33','int'),(12,7,'myMaxOfThree(3,2,4)','4','2016-06-12 11:35:54','2016-06-12 11:35:54','int'),(13,7,'myMaxOfThree(1,20,40)','40','2016-06-12 11:36:48','2016-06-12 11:36:48','int'),(14,7,'myMaxOfThree(0,1,-2)','1','2016-06-12 11:37:27','2016-06-12 11:37:27','int'),(15,8,'compareIntegers(\"12\", \"13\")','\"less\"','2016-06-12 12:33:20','2016-06-12 12:33:20','String'),(16,8,'compareIntegers(\"875\", \"799\")','\"greater\"','2016-06-12 12:34:25','2016-06-12 12:34:25','String'),(17,8,'compareIntegers(\"1000\",\"1000\")','\"equal\"','2016-06-12 12:35:09','2016-06-12 12:35:09','String'),(18,9,'Divide(6,2)','3','2016-06-12 12:45:53','2016-06-13 07:51:46','int'),(20,1,'	myMin(9,2)','2','2016-06-12 16:07:55','2016-06-12 16:07:55','int'),(21,1,'	myMin(0,1)','0','2016-06-12 16:09:17','2016-06-12 16:09:17','int'),(22,1,'	myMin(-1,0)','-1','2016-06-12 16:11:03','2016-06-12 16:11:03','int'),(23,2,'factorial(1)','1','2016-06-12 16:15:25','2016-06-12 16:15:25','int'),(24,2,'factorial(3)','6','2016-06-12 16:16:54','2016-06-12 16:16:54','int'),(25,2,'factorial(6)','720','2016-06-12 16:20:39','2016-06-12 16:20:39','int'),(26,2,'factorial(7)','5040','2016-06-12 16:26:24','2016-06-12 16:26:24','int'),(27,9,'Divide(9,3)','3','2016-06-13 07:52:09','2016-06-13 07:52:09','int');
/*!40000 ALTER TABLE `test_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_badges`
--

DROP TABLE IF EXISTS `user_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_badges_on_user_id` (`user_id`),
  KEY `index_user_badges_on_badge_id` (`badge_id`),
  CONSTRAINT `fk_rails_d9eb7b26df` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`),
  CONSTRAINT `fk_rails_ff28d27c3c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_badges`
--

LOCK TABLES `user_badges` WRITE;
/*!40000 ALTER TABLE `user_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_expires_at` datetime DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'facebook','1277206948973530','Amr','EAADezcEXYPkBALI4ZCWUbKamcKsASVFYbeiNHjd1hE8SRbfyUtZBu13ojZAdTjqZCxhGuDaBD5upDEw9UMFT0MeSytebesIFM90r4ioToOZBHehEOdkZAAm4ePylEiLL3KsmF4yI3gD3PEBwybpLCQE3rIpmMKq1YZD',NULL,'https://graph.facebook.com/10209859636793847/picture?type=normal&__mref=message_bubble','ahmed.hamad@yahoo.com',1690,'2016-06-11 17:29:42','2016-06-13 07:58:32'),(6,'facebook','1008048612576251','Ahmed Abd El Ftah','EAADezcEXYPkBAGUqZCHWmx6VHVmS6jmkJRff3mGujXygPZAHFXHqjN6XV3OKR8HoKsy5dLFRJfnef4JeCLbG1clb41kGgg0GzlVhLZB1dMUJZAzgny9MCgeoENyxts6NroUb24LmYZC5s73X1rFWNeeKeWQZBMbZCMZD','2016-08-10 10:46:49','https://graph.facebook.com/1008048612576251/picture?type=normal','ahmed_mohamed95165@yahoo.com',100,'2016-06-11 18:13:51','2016-06-13 21:10:04'),(7,'facebook','10153712845933412','Ahmed Hamdy Hammad','EAADezcEXYPkBAITKuw1bj0Rz7G9WqMjpVTZBokA6qYMVtQ3mZAjMFz6JtTRZA5ovshShZBVGRuO7OpGCxWjZAJZAP8UsIZCNQRTNZAZAw9GANggCxAjtidwSxkMmWkyLpaqvxHvtZA7NfMBE94fMhsBwQZAjRULXyRNZBPUZD','2016-08-10 20:38:50','https://graph.facebook.com/10153712845933412/picture?type=normal','amendy_moftakas_kbeeer@yahoo.com',3100,'2016-06-11 20:38:51','2016-06-15 10:05:15'),(8,'facebook','10154891887488102','Mahmoud Khaled','EAADezcEXYPkBAG2Uwg7heBZBZBn6XZBwZBdNaCYypZCpTKM9Yie7u77hOe6mqCZAhJoDdrMJRhKQyZAgFbYMqp1XqX2ClZAHt1k35gjlsgswZA9mNdZCsNowy7V50l2sZAnCe8ejz5rUYyGuL1USICu8ZCSG8nd1Vgu0zc8ZD','2016-08-11 09:42:27','https://graph.facebook.com/10154891887488102/picture?type=normal','mahkhaled@gmail.com',100,'2016-06-12 09:42:28','2016-06-12 09:43:22'),(9,'facebook','1160080217370602','Hossam Eldeen Hawary','EAADezcEXYPkBABdRrB68iywSIVCEgymYZBFUP1s3NZAiZBSdZAmOrBbSG1HOqYKxRyHZBAQvmSFOPUnHBuPjgI8hA3LjwLCxYNrmZCgVDtU5lXYuCwr5MYwxwzSICgc1A0bYbox9kiJfDwTXHb08SkTQZCeEPEjT9qZAVURs1ZBpSQQZDZD','2016-08-10 21:41:42','https://graph.facebook.com/1160080217370602/picture?type=normal','hossam.hawary@yahoo.com',1800,'2016-06-12 12:08:05','2016-06-13 23:28:56'),(10,'facebook','902894309819083','Hanan El Metwally','EAADezcEXYPkBAA5loE5YPtqlpiERFoH4J2LsRDCraur8RGiB3efIUHZAMZB5fF1AxqZCQDedpZAwDHe8LaxbB069Y79Xjr2eOdBeKwlTVeCwhAZCZBbD1XZCogJIqllk9h3W6dQJZAmOrmtpL8aeSuFwqFJ2ZCvfrTPsGZAi564quSGgZDZD','2016-08-12 07:33:17','https://graph.facebook.com/902894309819083/picture?type=normal','nonaquean@yahoo.com',0,'2016-06-13 07:33:18','2016-06-13 07:33:18'),(11,'facebook','10206661491312833','Aya Aly Hassan','EAADezcEXYPkBAEimcZCGJzacKxLVpEhjoRqmeKFh4ZABUWHPVPGOzYtNmjyu9VKbt5xTm0LlUgzqrbFxP6RqweJI0AyUUJiL5fhZB4v7tWOsdThDvKsqcZBTXOKofQZBVnCwV9DhkwsJtJxapDgf4gwZAn2DraOnYZD','2016-08-12 07:37:21','https://graph.facebook.com/10206661491312833/picture?type=normal','ayaali35.aa@gmail.com',100,'2016-06-13 07:37:22','2016-06-18 15:20:26'),(12,'facebook','1345793552116473','Aya Adel','EAADezcEXYPkBAGWZB74quNXBvx94v9FdEsjNz3ZBZBeHGzoZB08aD5zZBr9ervVu9IwJQ3cfCGeyrXnTqXIVHr2e1CHb9qgtm5S7rbygZByHdZAoc4YZCoevv8Utud1U3be754JRfVNCHCWFlQJS2z9vHgFzeEK47QSXUewMYb6TPAZDZD','2016-08-12 07:48:48','https://graph.facebook.com/1345793552116473/picture?type=normal','ayaadel59@yahoo.com',0,'2016-06-13 07:48:49','2016-06-13 07:48:49'),(15,'facebook','10209859636793847','Ramez Maher Aziz','EAADezcEXYPkBAFA5qBCHJcIkvCTN20YfgKVTlU77e1JoliPT32BOUffm0TZBzqzQ6NyJTMsqEHSrONa8q3bp0wHl8QkOBDT9LAJHZBGTh1RroBZAcY0pZCUh2ZAhtZCMoWCH3DGyf6mmOkMKw6yI6360lYxqbBh8wZD','2016-08-11 10:24:48','https://graph.facebook.com/10209859636793847/picture?type=normal','rmzmaher@yahoo.com',1600,'2016-06-13 09:07:42','2016-06-24 12:54:59'),(16,'facebook','1122177044509496','Merna Nagy','EAADezcEXYPkBALWLqxQZCVfYI7DkE2TUpGMFP1rWvXmP33T3Pt6Ok0Bw1iJwLZAaOjrcLupUw9I9RvJAVGyNmufTSQIWG49NwqqGqmJrLUcMdqt7NPkUaBqobHRhkbALj8jP4YaUOxYZCgn7A6aZAbTQPTzRqLMZD','2016-08-12 14:03:44','https://graph.facebook.com/1122177044509496/picture?type=normal',NULL,700,'2016-06-13 14:03:44','2016-06-13 14:06:01'),(17,'facebook','1116804068360751','Hadeer W Tasneem','EAADezcEXYPkBAEbeRZAQKADdnZAOyou3x4RVVsTZAqEzR7fTSKuko4BtQKwFL6D3TORlWpBECMFfrVEnQKDlHF8pSus9cPUgTNoZBRQlBgdPMheqZAOlorDWMfniopVzoYgbMQdApVB301Ee228ezz7fXpv28IlkZD','2016-08-12 21:09:02','https://graph.facebook.com/1116804068360751/picture?type=normal','hadeer.fawzy92@yahoo.com',0,'2016-06-13 21:09:03','2016-06-13 21:09:03'),(18,'facebook','1038993676191720','Mohamed Ramadan','EAADezcEXYPkBAM2A7zafkZCs96PKueHrOvYeUXFqEafLz6SoztC8KZCJ6TJyDPGZAKFzDWNfh6qfZB1lhssIqMSGPXjX9hSQ0YU1piUAT9ixE3SCZCZBTShYbwZC7u65MgLX3PuiLxglvI7Vjy8oUqc46JrIeFdzZAwGvwP0MkqPeQZDZD','2016-08-12 21:49:35','https://graph.facebook.com/1038993676191720/picture?type=normal',NULL,100,'2016-06-13 21:49:36','2016-06-13 21:55:29'),(19,'facebook','1709684989305931','Hossam Eldeen Hawary','EAADezcEXYPkBAE48yhor50CoT5rFAO64DrP44Xx79NdG3CTWIUfa7MsFfF9RMbfgs7ePdDyjDoewTv4jPQbBxIZB60j4bpjgraZBsY0WpLXYOZCZAavZCwp4oMbjtmrh1QAkTYw62vYZABaORNxqJFq5h6Repofh3PZC4dZAx9XYSgZDZD','2016-08-13 10:27:33','https://graph.facebook.com/1709684989305931/picture?type=normal','hossam.hawary88@yahoo.com',0,'2016-06-14 10:27:34','2016-06-14 10:27:34'),(20,'facebook','10154586737430681','Sherif Sharaf','EAADezcEXYPkBAEfpG7mlXSSjTTKhvx0bvaFdvgqZBqxkvZA05dS0tWx9Ju1EqVSGdStlNff9XkNfRZCuZAoeIrE7ioK4g1GIyPZBxNB0P1dL6pEZAHeLwSZA7FLSnw6fy4xbzdXFMDUMukLAiC7KmmebhxSljvy8iIZD','2016-08-13 12:18:46','https://graph.facebook.com/10154586737430681/picture?type=normal','cocojumbo3000@yahoo.com',0,'2016-06-14 12:18:47','2016-06-14 12:18:47'),(21,'facebook','10156956395210524','Rasha Elbanna','EAADezcEXYPkBAKRZCbDq7dn88gSD6EO8wPFlC5BzZBXSQrB1ZCZCF6zABhBAI0BmMH3tU99Rn7E7iil4ozxk5nBBp3O1hoX7ZBvGZAeYXuTIi4ZBIDZADRUhjPoYEAZCqNA1POImzJumomr9yrd4R1DBRHRanhjKWuZBIZD','2016-08-13 12:21:01','https://graph.facebook.com/10156956395210524/picture?type=normal','rashaelbanna2010@hotmail.com',0,'2016-06-14 12:21:02','2016-06-14 12:21:02'),(22,'facebook','10157028859560029','Mohamed El-Refaey','EAADezcEXYPkBABH9UPaljQvaJOmzED8fouSZAR5NiUYy9ureJwsY8ZB5PCoIJiIj5osNNkft6fdl61h5uJJadryD5YI2BDOz6LPXqfS6IfDfVuit9NTLiaUo4iPjxa41ZAdu8DVirOGxWzTH7BPoKqSLqCfWSoZD','2016-08-13 12:22:09','https://graph.facebook.com/10157028859560029/picture?type=normal','mohamed.elrefaey@gmail.com',0,'2016-06-14 12:22:11','2016-06-14 12:22:11'),(23,'facebook','544640762409546','Mustafa Muhammad','EAADezcEXYPkBANCFNnFdQ0mxFWZBP6GDk9F6mT5vi7ZCBv1Mgih6Qeyowo0HKThFtVFKTvY25pkX5MogbV1eSXoutL9kujTsNYPDclyT0UYh47sNyI65DxjZBjKO1qUibhcYkWgQ4JgVFhkNlWu8KTxCY0kiU0832aLg85dpgZDZD','2016-08-13 19:00:52','https://graph.facebook.com/544640762409546/picture?type=normal',NULL,100,'2016-06-14 19:00:53','2016-06-14 19:05:35'),(24,'facebook','1093596740688246','Marwa Fawzi','EAADezcEXYPkBAFQyAndSOZCS5eDo9ONRDKpswRhrPqqkSZCXljcrnla9Mvu1166COxT7M4v1LhRULCcPVsN1y6FZBZC20FTIZC5ddJpCDdClWXDTT9zKqZC2zpCChJQIuTqB2UfWjjZBKGM8ESTcXZBQH6tGKnapyNMZD','2016-08-13 20:17:26','https://graph.facebook.com/1093596740688246/picture?type=normal','dr.merofawzi@hotmail.com',0,'2016-06-14 20:17:27','2016-06-14 20:17:27'),(25,'facebook','10207734069523000','Peter Wilson','EAADezcEXYPkBADOnZBqQI3RcJJaAvxEzCRXy95mHsOhykKyynJLmZA8T8ZAlL7ZCxmXTZChgCTfAh8ZCgRrZBJ24cJSVXb0PhOQsBZAuMCnZBemM5dnsKcQ6CjvHqeM0HKVnNymE6imN2GqldwZAuJHUil9yxsqyQ4taEZD','2016-08-14 11:06:52','https://graph.facebook.com/10207734069523000/picture?type=normal','peterwilson_2010@hotmail.com',0,'2016-06-15 11:06:53','2016-06-15 11:06:53'),(26,'facebook','10206999692695732','Michael Hany Anis','EAADezcEXYPkBADPbYoUYBU7gwNBToWkGMqGl3uFrgKyYAxwIGoaVFsUB0kmC87r39ckIrwo5jBZAZC6mbvTo3IvHVA46RUpo1PZCTOapu522XHjEPWsRAHUR89Sc5j8JY1UhHbbuoJhb0YpasXUso5Acm3LjBwZD','2016-08-15 12:16:37','https://graph.facebook.com/10206999692695732/picture?type=normal','dr_michael_hany@yahoo.com',0,'2016-06-16 12:16:38','2016-06-16 12:16:38'),(27,'facebook','2040473576177730','Jasmine Elsheikh','EAADezcEXYPkBAH7m4wFW5Gfsp1UsNY2FcZA9bByP2gHjL2O2S5bSMoJ6BzoAgz4Kc7B9a0nZAoYtOdFjbv1eysuVzoe7H9RLagzZAQLeGrJhQ4dJpZAD0yXeyTRaSM4bNDfGu9u9ZAFDxZB1TW3GKnbbZBEdGTZCbA6ZA1qM6BSbI9uj0pLD3ChAv','2016-08-15 14:06:16','https://graph.facebook.com/2040473576177730/picture?type=normal','jessy.mohamed2014@gmail.com',1600,'2016-06-16 14:06:16','2016-06-16 14:54:06'),(28,'facebook','1042216542500294','Manar Ahmed','EAADezcEXYPkBANy8WqpKB4ReBAn8LIBIFwPvCfMaost7h9vkqhI2E6VmECFH5DDYYoTAIJ957ZBZCS5i8oPhNDHD1GXxNf7TwMVwuQzgqA3W52DRIOZADzA4Si2CZBEi2ONAJ9S0Lf6lcYQkrgSz3GFgwehQSwB5LoZBgBPCk6AZDZD','2016-08-16 12:16:17','https://graph.facebook.com/1042216542500294/picture?type=normal','eng.mema2014@yahoo.com.au',0,'2016-06-17 12:16:24','2016-06-17 12:16:24'),(29,'facebook','10209936514549915','Morad Edwar','EAADezcEXYPkBAMkaN6CZApjKZB42V2gd2ax4umXK68ZBlvpqZCdCmKLtqyirZBEukBcpm8sAHqNtVMr2PkWd9DPg1zamVzIi6HGeal1WZB257Nqhq1DIM71pb3zkZCsOai2oeQGejCU5dcL0WDLBUL0XpNkukYFYoBFjjXaKtofbAZDZD','2016-08-17 13:53:59','https://graph.facebook.com/10209936514549915/picture?type=normal',NULL,0,'2016-06-18 13:54:00','2016-06-18 13:54:00'),(30,'facebook','883105138484271','Tiam Ashraf','EAADezcEXYPkBAJGQqDnRappZCa4aBpNTm6DzVI3Ox8oZCF8qqQRz5R6ywzfSpQ8GZCZCEfpSdt1mkVYiGeuUil90w90KnOhafb4qGQsDXPbJX6FDTBsxCTZCWtNTKocX4LVhnTc6GZCIdhrZBkvM4U4veeJZAeXjqpEZD','2016-08-20 03:08:01','https://graph.facebook.com/883105138484271/picture?type=normal','tiamashraf@yahoo.com',0,'2016-06-21 03:08:02','2016-06-21 03:08:02'),(31,'facebook','1067574549944339','Elrefaay Alex','EAADezcEXYPkBAM3g6NulOJmyY74ycGnZBhfBnmcYTYpuRqC1BLzv0dQHOAJZBHcucZB1S17jUDXdF2ugOrUV1ZCil5JZASmIF27WW7Cuymfzu0UkZCdl9nfbcMK8e8MG2fsNZC474mua8M70v8duMgDgEryuWstyZBhB6GDT3WD3eAZDZD','2016-08-21 18:52:03','https://graph.facebook.com/1067574549944339/picture?type=normal','abdo_ali9643@yahoo.com',0,'2016-06-22 18:52:08','2016-06-22 18:52:08'),(32,'facebook','1124242100950184','Shehab Eldean','EAADezcEXYPkBAAkPaPwt4KHbJrPSPRdUxnfkCfahJ80Ee1rSddtZAhoC62ZCxeNaRzETTrAZAxXcvSmOtfm6dgc7R7Ly4qsm8bltT2SHJ3aI1brdxatd2GYWZArZCkXkgAZAeAJ8IzpACfVlL9e4mkFB9FQ3ZArUeEZD','2016-08-25 22:14:41','https://graph.facebook.com/1124242100950184/picture?type=normal','shehab.ahmed44@yahoo.com',0,'2016-06-26 22:14:42','2016-06-26 22:14:42'),(33,'facebook','111502542614632','Amr Fayad','EAADezcEXYPkBAAkVKjiBiHLLojBoXyZAtl03VKjHZBvNZBM5R9Gwxp0hhZBwSRW22ZBi6iLqZAhZB5jkgPo1FJ7u3IJwT0upUNDBpwFchr96ZAUITNMe8TO2Y13J2Rqb4yy3PCmQftjZBThSFliROZBJaZBOm41s7X6pSSULgZCTj77MCAZDZD','2016-08-27 11:39:39','https://graph.facebook.com/111502542614632/picture?type=normal','amrfayad.sys.online@gmail.com',1000,'2016-06-28 11:39:40','2016-06-28 11:44:21'),(34,'facebook','10100591357182985','Caleb Brown','EAADezcEXYPkBAHiuOJv8V0Sg82lugLyobvvpT2pZAFb4LFOTDV37ZAKd21XFZB4SwXQqnBiKQZAF9LcPc0Yfl4oxtTSapEAkPnxEEO6QvTKZC7tdm9gQSY5IPPfw8MB8MUxRI7FWl6DuRgRm7KD5AZCZB8cZCGkgsygZD','2016-09-09 18:57:37','https://graph.facebook.com/10100591357182985/picture?type=normal','calebrown@gmail.com',0,'2016-07-11 18:57:38','2016-07-11 18:57:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-12  9:25:28
