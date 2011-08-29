/*
SQLyog Ultimate v8.32 
MySQL - 5.1.50-community-log : Database - sams
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sams` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sams`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `device_id` varchar(8) NOT NULL DEFAULT 'XXXXXXXX',
  `product_id` varchar(36) NOT NULL DEFAULT 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
  `revision` int(11) NOT NULL DEFAULT '2358',
  `encrypt_limit` varchar(256) DEFAULT NULL,
  `encrypt_id` varchar(16) NOT NULL DEFAULT 'XXXXXXXXXXXXXXXX',
  `ukey_id` varchar(16) NOT NULL DEFAULT 'XXXXXXXXXXXXXXXX',
  `functions` varchar(1024) NOT NULL DEFAULT '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `last_ensure` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `random` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`device_id`,`product_id`,`revision`,`encrypt_limit`,`encrypt_id`,`ukey_id`,`functions`,`username`,`password`,`tel`,`email`,`contact`,`last_update`,`last_ensure`,`status`,`random`) values ('XXXXXXXX','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',2358,'u500','XXXXXXXXXXXXXXXX','XXXXXXXXXXXXXXXX','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('O2BND1jh','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX1',2358,'u500','I9Y8fP7RiZfvBRyW','NsZnUpqehTUZwCkb','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EADhqT2v','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX2',2358,'u500','tmxzy1dxh9QIVqO2','JsbDzGVkDES2nOJz','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('5a9iLy7K','E2654163-BF8A-402E-9AB1-5680C33694DD',2356,'u500','FGXC16LQj6p4hIZI','TgTuTiHMh4LgLGJm','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'loVgLgZSt6fSfWPG'),('Y705whyR','E6F3AE4C-9FF6-4E07-B558-A07723669229',2424,'u500','aFoXuTWRKlSPw7Cj','6zQ3wNY34baxkjmZ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'jWt0HCXOVapadCZu'),('bRRehzTj','49E71C90-7F2C-4063-9EFC-40F532E3BC55',2358,'u500','QB8E7s81pvTBS9HX','L1g6Af9swwhQGEhF','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'b2LWRQHGbe7CfCvy'),('xV1octhP','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX6',2358,'u500','lM1YuZiJeIiinjLB','FLGHznNtmj8AYLR7','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('tLyvA6Ol','36C45113-7D94-4C7A-8A5E-C360E9D079F3',2358,'u500','jjDO9bdW6xXm64KR','avEa8b257HjbMZhR','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'xIz0JWhU5eZ0Hw9A'),('vFTlQ9oq','FC31807E-667D-4A5C-8618-D0E8E4605FBF',2358,'u500','g9d8wTi92YRNI2Pr','8nW7880URxTeIaLi','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'tCXYHWdYXMNMLU34'),('pD44CmNA','8D5AAB37-3E7C-45E6-AD05-451FDEB3C9B9',2358,'u500','JQDisgEWdZJKuRZ8','4NQCoi5UqNvAacPI','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'yNuvElKpytgJmNYX'),('Hemj53wW','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX10',2358,'u500','oBFkUlTkJ8yRyLGF','XbgvJEO1B7DHFMn9','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('euRcY4XS','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX11',2358,'u500','ZJnRqpe3PlbHAzdo','0DaMkD48O08oAnxY','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('7eBmOpcD','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX12',2358,'u500','Ai6U3oFdWBsTKzY9','YdR6h5vhCyoGKaf8','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('tG7tsirx','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX13',2358,'u500','GKpux1WMMxRMwvyw','dNjXPNv3d1QeONAb','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('VdhqGdLk','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX14',2358,'u500','b4PFSSgdR8uZ5Syc','oRH5nCMnAztI97fM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('60UsuhK2','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX15',2358,'u500','0l4YMq8Wmo6ih4dS','kY8xb1ZNtfrHsrgg','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('WMO8zo9q','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX16',2358,'u500','xqVPIBqX8kmDBid1','GnJtpUhnTauqH9Aq','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('uEklmbiH','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX17',2358,'u500','4InewWBiK7ZpAAHx','v8l6yKjrp8wfXdT4','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('NXwTzHC5','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX18',2358,'u500','q3Mw2BTAlFEmnfMP','Y1VMlCzEbrsiYs6T','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('5WV0C6qW','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX19',2358,'u500','nzukTt010pQYpWVf','ZQoX05MOCGrZhLrG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('gCudq14i','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX20',2358,'u500','p69R7sQQvUDhzNwl','cNSVPPXoHP53HBn6','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('ZAtg1gls','',2345,'u500','z2fk7I30TkRWTaxM','liHsJwbEhm7MZCl0','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('lK1mHMVK','EBBF44ED-3062-4663-99B2-D1C93F70A3E6',2333,'u500','fkzeZIhYFYHoJqFa','rAjehgXet0f6v61w','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('h2BcXOt2','F70A6F30-43D9-46CA-B63D-855C66984598',2333,'u500','FePMNYpspYJmpSZy','RCbkFS3ep4z4XmZm','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('lM1K14Tw','73F34B88-17CA-474F-988B-23D55C319605',2415,'u500','FEJEJipMt41QnMX0','FsNcPoT6BETCX27U','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('94HW9yZQ','B3B34EC1-D298-40ED-A58A-1728805D7139',2415,'u500','H2ByhkTK7YtQdKH0','NIbaPGhuzaBUvu1A','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'NInIzObc90naDero'),('VYVUD0Tg','A23FEBF4-01CC-462D-BCED-06C55B009208',2415,'u500','rsXANCt2X2z2TuBM','lyFaN07SZU5QT2VI','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'fWJqxWnEZ4XOBCR4'),('kF2PwdSj','5DC6DA27-BB17-4237-9F3C-A2968AD9766A',2420,'u500','eLEF0XOR8907GraX','Wbs5WZOZ0JopE18P','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('ATIBA92f','FA17BB57-5EB4-4704-A35B-F6FCA6B09500',2420,'u500','YNc7irAdStUfIXyJ','ENInIzObc90naDer','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('jUdAzotu','1D9F2750-98CB-4D78-89C4-7502578C4B54',2420,'u500','JyNexWLgtkLefiT4','nC1s5mfiRiVMVubk','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('LeRA745w','1F543F3D-0FBC-4FBF-871B-385B9A6CB30D',2420,'u500','tOHgzujKnojEDAhU','lmzaHgjQJ6R8DoPs','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('VY3YPmbC','B9DFC474-24BF-4544-9D5E-6E11ABEE5449',2420,'u500','jQxyD0fcfCFeVeTy','DEjSBU16jORo1UtG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'x45YByDEpGPqduha'),('ZkNopUZQ','28C94DD5-F36D-4B30-B229-0F70C03C5AAD',2420,'v/KrtVKZ1KZSsmXwcn23hnf2zlZlws1U0+IkD3nfoVbn04FT4eN+Zw==','pcDUbeRyfOvUP0Hq','TAhgd6nQJQlQdoLG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'jsbcrmliJQtAhO5m'),('BupedIZY','C5EA9E0D-8A2B-4633-8AEC-B31379ACA270',2420,'u500','VyjuXyZeNwnmHY5M','7etcNQD0JAXo9wxM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'xsJkDq9spI9mBSlW'),('HeBSrivA','DDB24618-91A1-4C66-9ADF-E3C03F2AC4F5',2420,'u500','jSXexw1gB25QfsJS','rAR2rY3MJUFe1qPQ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('PQnMlIrs','392720A0-35C9-43B1-B290-9FA11E2B5B17',2420,'u500','BOR2NcLYVEvqJKbi','HgbMxKzML0fuBANO','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('1g5WhCJg','115CD8D9-E627-4A50-B627-664747DA12EF',2420,'u500','lU5uXIL0BO7wvgLq','9m3oNEBSTULwHI9K','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Hm7e7ShUryvWTYTK'),('toNuVoPC','E65B2C51-151B-4AAD-BE5B-69964E08D4E5',2420,'u500','HKRMzwZUZuzGdIJu','duPyJmrKfCtMZkvy','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'0BeR0nyrOFcd6JGf'),('XgTenuLg','0CFD885D-D494-4185-AB4D-DFD2D9A708F2',2420,'u500','dOtifK7MV65QZqrW','r25KZsBaDYnSBaZO','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('z8DUVg9Y','2EDE4677-2A73-4717-937A-4DA3EE121940',2420,'u500','LShIhwD2Z05CDmdo','Fop0lELU9qDKjgDY','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('jeVqriLy','D2E7E553-03CC-4328-9E6C-704A29F1A6BB',2420,'u500','1srGLe3KFWZUrCPC','ByV0nOVwfG9krIJQ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'MxiX2PCpiBqtI3KL'),('nkDCHcx6','7791B248-F762-463F-B60B-0EEFBAB65CFD',9504,'u500','RqrE54rETUpiZwru','RapUfUpuDyjoL8d2','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'QpilQXqzCD4jQbMH'),('hEXKDIry','3A89D44C-A27E-4C76-92E3-6C471DDAF95E',9504,'u500','Ne9eZgFeJARcJKl4','t4twH4RYpyn4j4BM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'3Qtm5ylsX8dAVCHG'),('rODqfgDI','4BEE1B38-AC33-4F19-ADB0-1F9DE61A5DE7',9504,'u500','lKzeXQxU3kTUTKL8','XUvitmJipShix2Le','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'4B8PKzW3ixilKB6d'),('aPMDOrS7','4B06D664-BE1E-4B57-B0C1-603066BCACE7',9689,'D1IgTP/EDG/XYD3kQmfvTHNDZRdyapM6tSw7yVj6oIEOwZzRbX0FEQ==','qX0XifQV0VitOl2l','M7uxcBQh8TuxmnCz','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'S1YTE7ArMpon6L2t'),('8LYFGNQf','81D731AB-77AD-4245-B9DB-D000DC0D3E47',9689,'u500','OX69M7SDGn8bM5wx','CRY9w5ENwPYrUt8j','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Mlm7qF6pOD8lID6D'),('mHCfgb21','16545EB0-B88D-48B3-BAD6-F6E5DA961149',9689,'u500','s9MdKr25EHeBYfw1','MHQjQrmHe3ubepqv','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'dotenErKN614BGH0'),('GrYpcxyn','6F80D68B-71FA-4B84-899B-3B6976A07571',9729,'u500','S92fSZY7638Rgz4z','gv67gDK7IpkpKzS7','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'MjA9AzEvMF4l0loh'),('TSPSTynM','8706BF18-D18E-478F-AAD4-E8D43259C661',9729,'u500','Tw7abmDWdkNidYdE','HCfaTOvgfOR8xcTG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'poD4tCX4ZadaRK9S'),('5MB8FYNE','5538787D-A8A5-4886-B4AF-7B232C3DB824',9973,'Uu+nH2as/1Sg4mrdWerPA4IFWusIKYqMvlXrxadrTnrg8aQQNndBRA==','fynu34t45kV43mRU','tYDgzel2jURqryNQ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'HGZGTuRUrIbqXgr0'),('PkReDQXm','A019A823-C52F-40E1-B15F-539C65F0F1FD',9983,NULL,'fWVuL4hmzUJyfmhS','F6FQryRgpo5cdyRq','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Nc7irAdStUfIXyJE'),('z6hc52ZK','098917A1-398E-466E-B867-78878E214F31',9983,'eLctCkkCWYm14cKN8FMEzapz8P0MOe7DuD8flFc8T+CjSCQ2qiQb2w==','7U3ShEXQVWXKbcvQ','TAlGb2tATIBA92fY','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'NGRerMdeleR8vk9C'),('taJSXc9g','370C529A-E1F0-4E26-B94E-344A26AFB675',9983,'GmUmw6izpqkwdQZIruggS9deaEvvHlwjk/RKxgMQ2at6Dd56susLag==','Xare50zyHohiVexe','7IBqRgXa32j0LsFK','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'T4fyP6N0nUhkBo9k'),('D2lqTMl0','063B8A8C-7001-43A0-9870-63F424B416A9',9983,'S4eepnv7Az9/RfOlLNsyjU83WGvf8bYsw+8EQa6/fO6GzpnQiZ8hbQ==','lu5q5C5uXOzeB01Y','RSFKlkvmp2LQFqVu','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'ncLqvGzkZ6PwXQ1i'),('DaRcLCB8','D0DE1893-2E35-479D-9C91-39733CE613D7',9983,'CEEaK+1ynQaDxHGPOQJZ2fwgi4qZ9Y+Fcag9bkwDnbMJcR5447KG2g==','zIhwxeL0TeF07YlI','ryT2nebE7APubSbc','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'3atyV6JChefcBQnq'),('DCbAfSle','126D9326-1843-4F44-B3AC-D4978EB3FD93',9983,'0fDvcVQTVqovPLAa6t70LMKT15XbhrjQouotR9UrlxH3MxLmjF5WLA==','3GJsxkdsXQn8hwBE','JWtsPmTILmVQ3IX0','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'L6TcvMp23APQ1o7U'),('pu58lsFo','F1F9BE1A-F82F-452E-BC88-8A8951C828BC',9983,NULL,'3GPI3spgzkxY5Azu','Pi5gNeZsdsRuzMzw','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('5IduL4F4','FD97C3DA-65FB-4445-955E-2B0EB60B70DA',9983,'ZUk842eKiwQkcy7Ej45aaUprQSwB7lzpFJUr/AAXsyG/HSSiKxGhBw==','lUxah0bYPqHotWt6','X85wJMpkzq3sVSRy','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('fqviRyvi','20976162-B6B4-4BBE-A8B0-8A9A3CFC87BF',9983,'Ybzki5PNU0+gJtF1QVFazjuxtsPPgoAth6T9usAVZSDT6OBFSD50RQ==','dujWV8ryla7a50jA','vOhQH2vg3kHQFCnW','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('7uJKlYbk','E6DEE332-764C-4492-A817-85A03A8A352F',9983,'wRPPTw09LnmPXyeqB3sOng7LGStIS4DaMzCWPGPRAkxuqYFWq1NE/g==','tkj6vmvebCRCZoJY','9eJG9qJWJ2PanQTw','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Pa50VoJktKFoBan0'),('nebyPmPi','33B8040D-698F-4DCF-83C8-2C5FFC7835DC',9983,'2M7wLmTMCCdnx/54K1+Us6vutwTfGeEdoTHdVg0m14wowT6rNtk5bQ==','NqP6TmbgZkBQbM58','PQna3urKHQvWTm5w','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'hStyVcxQhq9EXWhg'),('tcT2zMVi','9AB40338-A9B0-4882-8051-066F7EDEC6C1',9983,'Tn0l86w2TH5vNx2nglEra6fboIs0GDcMW5TeqsduYFXVqoYV4CGtzw==','1ipkX8PWJYpcrg9S','XEhwTyhq5apEbUB0','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('vqD0baZs','C577698E-0369-4D34-91AC-F71A229C9F34',9983,'DyK8SCId8WW8exdugmNIOXnB10wk0e1Tz37YaIKAetdO3KC56jI2IQ==','zinULINa98ZMPWVw','9klYdIJopgjmPo5E','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'DGdsHchYLMVoVODw'),('3uDUJIVQ','16717CDB-9B93-4CB3-B37E-915D1735526A',9983,'HbBiDS0WUhldog+mp298pUYUp3O1Euhfpv0P50+o++f1aN23p3gCJA==','RadmvMvizIxEDohK','3Yt8XU76HmVGnenc','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'OjgTW12Da7ghqBMH'),('gd6nQJQl','E3CAA454-9313-40B1-A7AB-646A35A0D935',9983,NULL,'QdoLGD0x2dgfkXqL','I54HCBupedIZYVyj','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'D2H6x81ED6nczSLy'),('7mDeXuHo','EDE26064-E637-4516-BA80-297F6FF7FE68',10024,NULL,'DCrafGlSFmDyvyNu','7WzKBsVClg7EVM7E','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'pEdGzQBo329eZER0'),('nsDSzyjK','14C09E05-0B86-4413-85A9-0A8FC89DE12A',9983,'PKaz/I9zu7sXwhvJW4/DPicMOEC+uGhnzX6VkR9eUZ+kjyF7f5umJQ==','5EDK3GDajO1yvuLe','XQDchk5iR6n2hAtK','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'5a3WXcpKFKrGjI72'),('g1OdID8p','2B070C6E-BA4E-4548-BD96-18288EF60B1E',10122,'DcG7ipNH6p5MJYS7OISGTn3aPPeZhMUj7gpwmy9TvXo660FjAzA8Rw==','872dUVOxePYrwhmj','W1ufU3a7CBW1Y9CP','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('HgdENObW','5228FBE4-D2EC-4AA4-9F89-B519FDA16808',10122,'U/bSylcG1+I0cislnM34YkpT9wTT42Hmb+dqgqShKjn9scl327E/gg==','z0zavChuPcTQ1yNo','jIzyduzwrqrctkvg','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Idql6JYBKbo34xu3'),('qNMXsNcJ','B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA',10122,'H6UPGzFt8sDasLcU0v4hLNB2lIhCQd+SZcZlZi4uMp8lKqKNiLYH+w==','6FApgVgR8NeH6fkL','Sx4HSDMPKLuhqr0V','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Sb6vsR23kR8rUFG3'),('oz8TSDk9','47313CAD-193F-4179-9CA4-B6C26002559A',10122,NULL,'qZ4PGlq36HEFmNkh','QBehKRqfu3IxKVCh','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('SxetEVAz','2D9DDFCF-51DC-4B4B-BA8E-56BBB6DEFF6F',10122,NULL,'U5MXyZ8vinaNwJGd','Uhelo1Cz8HoZyLkX','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('0daLuDKX','73F290BE-BF9F-4D1B-85EC-4416340E6D53',10122,'UIzX5dFpu94Ral+/Pvn1UEVx0NLmh8qvK3QPViEZYtuSFB9A6+9L/Q==','q7270p4P8taZ0xQF','w7qLmVWlWXcjWref','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'AFUXk1mlWpO3SPAr');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(36) NOT NULL DEFAULT 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `feedback` varchar(4096) DEFAULT NULL,
  `filename1` varchar(16) DEFAULT NULL,
  `filename2` varchar(16) DEFAULT NULL,
  `filename3` varchar(16) DEFAULT NULL,
  `filename4` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`product_id`,`datetime`,`feedback`,`filename1`,`filename2`,`filename3`,`filename4`) values (7,'B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA','2011-08-29 13:02:46','test 20110829--003','<none>','<none>','<none>','<none>'),(6,'B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA','2011-08-29 11:48:12','用户反馈测试20110829-002','IjknkV4X4DUh.jpg','<none>','<none>','<none>'),(5,'B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA','2011-08-29 11:42:21','测试反馈信息20110829--001','<none>','<none>','<none>','<none>'),(8,'B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA','2011-08-29 13:07:34','用户反馈测试20110829-005','JWPMli5av0Zg.jpg','j0vSFWTyDKB6.jpg','B6pyFqLIHSV8.jpg','NSRAjCjEn0L6.png'),(9,'B8E3DA44-B1DD-46DE-95FD-E29ADD8E46DA','2011-08-29 13:11:19','gif图片上传测试20110829','<none>','<none>','<none>','leXujGRCDyd2.gif');

/*Table structure for table `functions` */

DROP TABLE IF EXISTS `functions`;

CREATE TABLE `functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a2` varchar(255) NOT NULL,
  `bh` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `a5` varchar(255) NOT NULL,
  `a6` int(11) NOT NULL,
  `a7` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `isLeaf` int(11) NOT NULL,
  `showindex` int(11) NOT NULL,
  `a8` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `functions` */

insert  into `functions`(`id`,`a1`,`a2`,`bh`,`parent`,`a5`,`a6`,`a7`,`level`,`isLeaf`,`showindex`,`a8`) values (1,'资产负债表','Tp0512','512','5','05/p0512.htm',10,2,1,0,6,0),(2,'损溢表','Tp0513','513','5','05/p0513.htm',11,2,1,0,6,0),(3,'利润分析表','Tp0514','514','5','05/p0514.htm',12,2,1,0,6,0),(4,'费用统计表','Tp0515','515','5','05/p0515.htm',13,2,1,0,6,0),(5,'资金报表','Tp0516','516','5','05/p0516.htm',14,2,1,0,6,0),(6,'科目明细','Tp0517','517','5','05/p0517.htm',15,2,1,0,6,0),(7,'工资管理','Tp0508','508','5','05/p0508.htm',7,1,1,0,6,0),(8,'提成管理','Tp0510','510','5','05/p0510.htm',8,1,1,0,6,0),(9,'工资查询','Tp0518','518','5','05/p0518.htm',16,2,1,0,6,0),(10,'设置','Tp09','9','0','',0,1,0,4,9,0),(11,'帮助文档','Tp0901','901','9','09/p0901.htm',1,1,1,0,9,0),(12,'采购','Tp01','1','0','',0,1,0,2,1,0),(13,'采购管理','Tp0101','101','1','01/p0101.htm',1,1,1,0,1,0),(14,'采购返利管理','Tp0102','102','1','01/p0102.htm',2,1,1,0,1,0),(15,'销售','Tp02','2','0','',0,1,0,3,2,0),(16,'销售管理','Tp0201','201','2','02/p0201.htm',1,1,1,0,2,0),(17,'应收款调整','Tp0202','202','2','02/p0202.htm',2,1,1,0,2,0),(18,'收款管理','Tp0203','203','2','02/p0203.htm',3,1,1,0,2,0),(19,'纯销','Tp08','8','0','',0,1,0,1,3,0),(20,'流向管理','Tp0205','205','8','02/p0205.htm',1,1,1,0,3,0),(21,'库存','Tp03','3','0','',0,1,0,3,4,0),(22,'批号箱号管理','Tp0301','301','3','03/p0301.htm',1,1,1,0,4,0),(23,'移库管理','Tp0302','302','3','03/p0302.htm',2,1,1,0,4,0),(24,'损溢管理','Tp0303','303','3','03/p0303.htm',3,1,1,0,4,0),(25,'发票','Tp04','4','0','',0,1,0,3,5,0),(26,'进项发票管理','Tp0401','401','4','04/p0401.htm',1,1,1,0,5,0),(27,'销项发票管理','Tp0402','402','4','04/p0402.htm',2,1,1,0,5,0),(28,'税金支付管理','Tp0403','403','4','04/p0403.htm',3,1,1,0,5,0),(29,'财务','Tp05','5','0','',0,1,0,7,6,0),(30,'费用支出管理','Tp0501','501','5','05/p0501.htm',1,1,1,0,6,0),(31,'转账管理','Tp0502','502','5','05/p0502.htm',2,1,1,0,6,0),(32,'其他收入管理','Tp0503','503','5','05/p0503.htm',3,1,1,0,6,0),(33,'会计凭证管理','Tp0504','504','5','05/p0504.htm',4,1,1,0,6,0),(34,'预提管理','Tp0505','505','5','05/p0505.htm',5,1,1,0,6,0),(35,'预提支付管理','Tp0507','507','5','05/p0507.htm',6,1,1,0,6,0),(36,'档案','Tp06','6','0','',0,1,0,12,7,0),(37,'供应商基本信息','Tgysxx','601','6','06/p0601.htm',1,1,1,0,7,0),(38,'药品基本信息','TSpxx','602','6','06/p0602.htm',2,1,1,0,7,0),(39,'客户基本信息','Tkhxx','603','6','06/p0603.htm',3,1,1,0,7,0),(40,'部门信息','Tbmxx','604','6','06/p0604.htm',4,1,1,0,7,0),(41,'职员基本信息','Tzyxx','605','6','06/p0605.htm',5,1,1,0,7,0),(42,'会计科目设置','Tkjkm','606','6','06/p0606.htm',6,1,1,0,7,0),(43,'期初维护','Tqcwh','607','6','06/p0607.htm',7,1,1,0,7,0),(44,'开票单位基本信息','Tkpdwxx','609','6','06/p0610.htm',9,1,1,0,7,0),(45,'仓库基本信息','TCkxx','610','6','06/p0608.htm',10,1,1,0,7,0),(46,'全局设置','TXtsz','904','9','06/p0611.htm',4,1,1,0,9,0),(47,'修改密码','TXgmm','905','9','07/p0704.htm',5,1,1,0,9,0),(48,'采购统计','Tp0111','111','1','01/p0111.htm',3,2,1,0,1,0),(49,'采购返利统计','Tp0112','112','1','01/p0112.htm',4,2,1,0,1,0),(50,'采购退货统计','Tp0113','113','1','01/p0113.htm',5,2,1,0,1,0),(51,'应付查询','Tp0114','114','1','01/p0114.htm',6,2,1,0,1,0),(52,'采购趋势分析','Tp0115','115','1','01/p0115.htm',7,2,1,0,1,0),(53,'采购同期比较','Tp0116','116','1','01/p0116.htm',8,2,1,0,1,0),(54,'销售统计','Tp0211','211','2','02/p0211.htm',4,2,1,0,2,0),(55,'销售退货统计','Tp0212','212','2','02/p0212.htm',5,2,1,0,2,0),(56,'销售回款统计','Tp0213','213','2','02/p0213.htm',6,2,1,0,2,0),(57,'应收查询','Tp0215','215','2','02/p0215.htm',7,2,1,0,2,0),(58,'销售趋势分析','Tp0216','216','2','02/p0216.htm',8,2,1,0,2,0),(59,'销售同期比较','Tp0217','217','2','02/p0217.htm',9,2,1,0,2,0),(60,'纯销统计','Tp0214','214','8','02/p0214.htm',2,2,1,0,3,0),(61,'纯销趋势分析','Tp0811','811','8','08/p0801.htm',3,2,1,0,3,0),(62,'纯销同期比较','Tp0812','812','8','08/p0802.htm',4,2,1,0,3,0),(63,'库存状况表','Tp0311','311','3','03/p0311.htm',4,2,1,0,4,0),(64,'药品出入库统计','Tp0312','312','3','03/p0312.htm',5,2,1,0,4,0),(65,'批号流向查询','Tp0313','313','3','03/p0313.htm',6,2,1,0,4,0),(66,'进项发票统计','Tp0411','411','4','04/p0411.htm',4,2,1,0,5,0),(67,'进项发票抵扣统计','Tp0412','412','4','04/p0412.htm',5,2,1,0,5,0),(68,'销项发票统计','Tp0413','413','4','04/p0413.htm',6,2,1,0,5,0),(69,'往来税金核算','Tp0414','414','4','04/p0414.htm',7,2,1,0,5,0),(70,'预提费用统计','Tp0511','511','5','05/p0511.htm',9,2,1,0,6,0),(71,'关于我们','Tp0902','902','9','09/p0902.htm',2,1,1,0,9,0),(72,'软件升级','Tp0903','903','9','09/p0903.htm',3,1,1,0,9,0);

/*Table structure for table `version` */

DROP TABLE IF EXISTS `version`;

CREATE TABLE `version` (
  `revision` int(11) NOT NULL,
  `version_major` int(11) NOT NULL,
  `version_minner` int(11) NOT NULL,
  `release_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `release_notes` varchar(1024) DEFAULT NULL,
  `alter_sql` varchar(1024) DEFAULT NULL,
  `u500` varchar(36) DEFAULT NULL,
  `u1000` varchar(36) DEFAULT NULL,
  `unlimit` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `version` */

insert  into `version`(`revision`,`version_major`,`version_minner`,`release_date`,`release_notes`,`alter_sql`,`u500`,`u1000`,`unlimit`) values (2358,1,0,'2011-08-22 09:43:56',NULL,NULL,NULL,NULL,NULL),(2390,1,1,'2011-08-22 10:44:58',NULL,NULL,NULL,NULL,NULL),(2400,1,2,'2011-08-22 10:45:13',NULL,NULL,NULL,NULL,NULL),(9729,1,0,'2011-08-24 14:23:29',NULL,NULL,'a267be99-8e82-43ff-adc9-cb61932eb0df','66e7c6f6-72cd-412d-9340-f6a1b80e8f23','be636c67-241b-4c5d-9596-4f89cc1f6b94'),(2500,1,3,'2011-08-22 10:46:53',NULL,NULL,NULL,NULL,NULL),(9689,1,0,'2011-08-23 14:23:29',NULL,NULL,'a267be99-8e82-43ff-adc9-cb61932eb0df','66e7c6f6-72cd-412d-9340-f6a1b80e8f23','be636c67-241b-4c5d-9596-4f89cc1f6b94'),(9973,1,0,'2011-08-25 18:17:23',NULL,NULL,'a267be99-8e82-43ff-adc9-cb61932eb0df','66e7c6f6-72cd-412d-9340-f6a1b80e8f23','be636c67-241b-4c5d-9596-4f89cc1f6b94'),(9983,1,0,'2011-08-25 19:37:06',NULL,NULL,'a267be99-8e82-43ff-adc9-cb61932eb0df','66e7c6f6-72cd-412d-9340-f6a1b80e8f23','be636c67-241b-4c5d-9596-4f89cc1f6b94'),(10122,1,0,'2011-08-28 10:26:35',NULL,NULL,'a267be99-8e82-43ff-adc9-cb61932eb0df','66e7c6f6-72cd-412d-9340-f6a1b80e8f23','be636c67-241b-4c5d-9596-4f89cc1f6b94');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
