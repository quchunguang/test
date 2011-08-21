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
  `revision` int(11) DEFAULT '2358',
  `encrypt_id` varchar(16) DEFAULT NULL,
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

insert  into `customer`(`device_id`,`product_id`,`revision`,`encrypt_id`,`ukey_id`,`functions`,`username`,`password`,`tel`,`email`,`contact`,`last_update`,`last_ensure`,`status`,`random`) values ('XXXXXXXX','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',2358,'XXXXXXXXXXXXXXXX','XXXXXXXXXXXXXXXX','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('O2BND1jh','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX1',2358,'I9Y8fP7RiZfvBRyW','NsZnUpqehTUZwCkb','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EADhqT2v','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX2',2358,'tmxzy1dxh9QIVqO2','JsbDzGVkDES2nOJz','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('5a9iLy7K','E2654163-BF8A-402E-9AB1-5680C33694DD',2356,'FGXC16LQj6p4hIZI','TgTuTiHMh4LgLGJm','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'loVgLgZSt6fSfWPG'),('Y705whyR','E6F3AE4C-9FF6-4E07-B558-A07723669229',2424,'aFoXuTWRKlSPw7Cj','6zQ3wNY34baxkjmZ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'jWt0HCXOVapadCZu'),('bRRehzTj','49E71C90-7F2C-4063-9EFC-40F532E3BC55',2358,'QB8E7s81pvTBS9HX','L1g6Af9swwhQGEhF','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'b2LWRQHGbe7CfCvy'),('xV1octhP','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX6',2358,'lM1YuZiJeIiinjLB','FLGHznNtmj8AYLR7','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('tLyvA6Ol','36C45113-7D94-4C7A-8A5E-C360E9D079F3',2358,'jjDO9bdW6xXm64KR','avEa8b257HjbMZhR','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'xIz0JWhU5eZ0Hw9A'),('vFTlQ9oq','FC31807E-667D-4A5C-8618-D0E8E4605FBF',2358,'g9d8wTi92YRNI2Pr','8nW7880URxTeIaLi','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'tCXYHWdYXMNMLU34'),('pD44CmNA','8D5AAB37-3E7C-45E6-AD05-451FDEB3C9B9',2358,'JQDisgEWdZJKuRZ8','4NQCoi5UqNvAacPI','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'yNuvElKpytgJmNYX'),('Hemj53wW','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX10',2358,'oBFkUlTkJ8yRyLGF','XbgvJEO1B7DHFMn9','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('euRcY4XS','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX11',2358,'ZJnRqpe3PlbHAzdo','0DaMkD48O08oAnxY','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('7eBmOpcD','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX12',2358,'Ai6U3oFdWBsTKzY9','YdR6h5vhCyoGKaf8','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('tG7tsirx','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX13',2358,'GKpux1WMMxRMwvyw','dNjXPNv3d1QeONAb','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('VdhqGdLk','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX14',2358,'b4PFSSgdR8uZ5Syc','oRH5nCMnAztI97fM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('60UsuhK2','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX15',2358,'0l4YMq8Wmo6ih4dS','kY8xb1ZNtfrHsrgg','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('WMO8zo9q','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX16',2358,'xqVPIBqX8kmDBid1','GnJtpUhnTauqH9Aq','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('uEklmbiH','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX17',2358,'4InewWBiK7ZpAAHx','v8l6yKjrp8wfXdT4','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('NXwTzHC5','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX18',2358,'q3Mw2BTAlFEmnfMP','Y1VMlCzEbrsiYs6T','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('5WV0C6qW','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX19',2358,'nzukTt010pQYpWVf','ZQoX05MOCGrZhLrG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('gCudq14i','XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX20',2358,'p69R7sQQvUDhzNwl','cNSVPPXoHP53HBn6','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('ZAtg1gls','',2345,'z2fk7I30TkRWTaxM','liHsJwbEhm7MZCl0','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('lK1mHMVK','EBBF44ED-3062-4663-99B2-D1C93F70A3E6',2333,'fkzeZIhYFYHoJqFa','rAjehgXet0f6v61w','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('h2BcXOt2','F70A6F30-43D9-46CA-B63D-855C66984598',2333,'FePMNYpspYJmpSZy','RCbkFS3ep4z4XmZm','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('lM1K14Tw','73F34B88-17CA-474F-988B-23D55C319605',2415,'FEJEJipMt41QnMX0','FsNcPoT6BETCX27U','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('94HW9yZQ','B3B34EC1-D298-40ED-A58A-1728805D7139',2415,'H2ByhkTK7YtQdKH0','NIbaPGhuzaBUvu1A','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'m7ArodCTi90PeFiR'),('VYVUD0Tg','A23FEBF4-01CC-462D-BCED-06C55B009208',2415,'rsXANCt2X2z2TuBM','lyFaN07SZU5QT2VI','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'fWJqxWnEZ4XOBCR4'),('kF2PwdSj','5DC6DA27-BB17-4237-9F3C-A2968AD9766A',2420,'eLEF0XOR8907GraX','Wbs5WZOZ0JopE18P','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('ATIBA92f','FA17BB57-5EB4-4704-A35B-F6FCA6B09500',2420,'YNc7irAdStUfIXyJ','ENInIzObc90naDer','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('jUdAzotu','1D9F2750-98CB-4D78-89C4-7502578C4B54',2420,'JyNexWLgtkLefiT4','nC1s5mfiRiVMVubk','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('LeRA745w','1F543F3D-0FBC-4FBF-871B-385B9A6CB30D',2420,'tOHgzujKnojEDAhU','lmzaHgjQJ6R8DoPs','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('VY3YPmbC','B9DFC474-24BF-4544-9D5E-6E11ABEE5449',2420,'jQxyD0fcfCFeVeTy','DEjSBU16jORo1UtG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'x45YByDEpGPqduha'),('ZkNopUZQ','28C94DD5-F36D-4B30-B229-0F70C03C5AAD',2420,'pcDUbeRyfOvUP0Hq','TAhgd6nQJQlQdoLG','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'EfilcDypihmp8Xgr'),('BupedIZY','C5EA9E0D-8A2B-4633-8AEC-B31379ACA270',2420,'VyjuXyZeNwnmHY5M','7etcNQD0JAXo9wxM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'xsJkDq9spI9mBSlW'),('HeBSrivA','DDB24618-91A1-4C66-9ADF-E3C03F2AC4F5',2420,'jSXexw1gB25QfsJS','rAR2rY3MJUFe1qPQ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('PQnMlIrs','392720A0-35C9-43B1-B290-9FA11E2B5B17',2420,'BOR2NcLYVEvqJKbi','HgbMxKzML0fuBANO','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('1g5WhCJg','115CD8D9-E627-4A50-B627-664747DA12EF',2420,'lU5uXIL0BO7wvgLq','9m3oNEBSTULwHI9K','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Hm7e7ShUryvWTYTK'),('toNuVoPC','E65B2C51-151B-4AAD-BE5B-69964E08D4E5',2420,'HKRMzwZUZuzGdIJu','duPyJmrKfCtMZkvy','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'0BeR0nyrOFcd6JGf'),('XgTenuLg','0CFD885D-D494-4185-AB4D-DFD2D9A708F2',2420,'dOtifK7MV65QZqrW','r25KZsBaDYnSBaZO','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('z8DUVg9Y','2EDE4677-2A73-4717-937A-4DA3EE121940',2420,'LShIhwD2Z05CDmdo','Fop0lELU9qDKjgDY','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('jeVqriLy','D2E7E553-03CC-4328-9E6C-704A29F1A6BB',2420,'1srGLe3KFWZUrCPC','ByV0nOVwfG9krIJQ','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'MxiX2PCpiBqtI3KL');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`product_id`,`datetime`,`feedback`,`filename1`,`filename2`,`filename3`,`filename4`) values (1,'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX','2011-08-17 16:07:38',NULL,NULL,NULL,NULL,NULL),(2,'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX','2011-08-17 16:08:55',NULL,NULL,NULL,NULL,NULL),(3,'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX','2011-08-17 16:08:55',NULL,NULL,NULL,NULL,NULL),(4,'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX','2011-08-17 16:08:57',NULL,NULL,NULL,NULL,NULL);

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
  `release_date` datetime DEFAULT NULL,
  `release_notes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `version` */

insert  into `version`(`revision`,`version_major`,`version_minner`,`release_date`,`release_notes`) values (2358,1,0,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
