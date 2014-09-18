-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sales
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `filename` varchar(50) NOT NULL,
  `importtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_detail`
--

DROP TABLE IF EXISTS `sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增字段',
  `tabledate` date DEFAULT NULL COMMENT '数据文件日期',
  `qdmc` varchar(50) DEFAULT NULL COMMENT '渠道名称',
  `sdlx` varchar(50) DEFAULT NULL COMMENT '商店类型',
  `khbm` int(11) DEFAULT NULL COMMENT '客户编码',
  `sdlxbm` varchar(50) DEFAULT NULL COMMENT '商店类型编码',
  `khmc` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `sptm` varchar(20) DEFAULT NULL COMMENT '商品条码',
  `xsdb` varchar(50) DEFAULT NULL COMMENT '销售代表',
  `plmc` varchar(50) DEFAULT NULL COMMENT '品类名称',
  `ppmc` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `mdbm` bigint(20) DEFAULT NULL COMMENT '门店编码',
  `mdmc` varchar(100) DEFAULT NULL COMMENT '门店名称',
  `jybbm` varchar(6) DEFAULT NULL COMMENT '经营部编码',
  `spbm` varchar(50) DEFAULT NULL COMMENT '商品编码',
  `spmc` varchar(150) DEFAULT NULL COMMENT '商品名称',
  `yz` float DEFAULT NULL COMMENT '因子',
  `xs` float DEFAULT NULL COMMENT '箱数',
  `ps` float DEFAULT NULL COMMENT '片数',
  `zs` float DEFAULT NULL COMMENT '总数',
  `hsxse` float DEFAULT NULL COMMENT '含税销售额',
  `bhsxse` float DEFAULT NULL COMMENT '不含税销售额',
  `xscb` float DEFAULT NULL COMMENT '销售成本',
  `ml` float DEFAULT NULL COMMENT '毛利',
  `mll` float DEFAULT NULL COMMENT '毛利率',
  `xsdbbm` int(11) DEFAULT NULL COMMENT '销售代表编码',
  `bz` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `tabledate` (`tabledate`),
  KEY `khmc` (`khmc`)
) ENGINE=InnoDB AUTO_INCREMENT=3375969 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-18 16:18:44
