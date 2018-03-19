/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.7.17-log : Database - pigeon
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pigeon` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pigeon`;

/*Table structure for table `product_decimal_info` */

DROP TABLE IF EXISTS `product_decimal_info`;

CREATE TABLE `product_decimal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `photo` text COMMENT '图片',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(2) NOT NULL COMMENT '1显示0不显示',
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product_decimal_info` */

/*Table structure for table `product_show_info` */

DROP TABLE IF EXISTS `product_show_info`;

CREATE TABLE `product_show_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sale_price` decimal(10,0) DEFAULT NULL COMMENT '售价',
  `photo` text COMMENT '图片',
  `original_price` decimal(10,0) DEFAULT NULL COMMENT '原价',
  `type` char(2) DEFAULT NULL COMMENT '产品种类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product_show_info` */

/*Table structure for table `product_xiangxin_info` */

DROP TABLE IF EXISTS `product_xiangxin_info`;

CREATE TABLE `product_xiangxin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `photo` text COMMENT '图片',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(2) NOT NULL COMMENT '1显示0不显示',
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product_xiangxin_info` */

/*Table structure for table `v_appuser` */

DROP TABLE IF EXISTS `v_appuser`;

/*!50001 DROP VIEW IF EXISTS `v_appuser` */;
/*!50001 DROP TABLE IF EXISTS `v_appuser` */;

/*!50001 CREATE TABLE  `v_appuser`(
 `count_appuser` bigint(21) ,
 `add_time` varchar(10) ,
 `belong_project` int(11) 
)*/;

/*Table structure for table `v_device_active` */

DROP TABLE IF EXISTS `v_device_active`;

/*!50001 DROP VIEW IF EXISTS `v_device_active` */;
/*!50001 DROP TABLE IF EXISTS `v_device_active` */;

/*!50001 CREATE TABLE  `v_device_active`(
 `count_device_active` decimal(23,0) ,
 `add_time` varchar(10) ,
 `belong_project` int(11) 
)*/;

/*Table structure for table `v_device_active_history` */

DROP TABLE IF EXISTS `v_device_active_history`;

/*!50001 DROP VIEW IF EXISTS `v_device_active_history` */;
/*!50001 DROP TABLE IF EXISTS `v_device_active_history` */;

/*!50001 CREATE TABLE  `v_device_active_history`(
 `bind_count` decimal(23,0) ,
 `unbind_count` decimal(23,0) ,
 `add_time` varchar(10) ,
 `belong_project` int(11) 
)*/;

/*Table structure for table `v_device_login` */

DROP TABLE IF EXISTS `v_device_login`;

/*!50001 DROP VIEW IF EXISTS `v_device_login` */;
/*!50001 DROP TABLE IF EXISTS `v_device_login` */;

/*!50001 CREATE TABLE  `v_device_login`(
 `count_device_login` bigint(21) ,
 `active_device` bigint(21) ,
 `add_time` varchar(10) ,
 `belong_project` int(11) ,
 `date_time` datetime 
)*/;

/*Table structure for table `v_userlogin` */

DROP TABLE IF EXISTS `v_userlogin`;

/*!50001 DROP VIEW IF EXISTS `v_userlogin` */;
/*!50001 DROP TABLE IF EXISTS `v_userlogin` */;

/*!50001 CREATE TABLE  `v_userlogin`(
 `count_userlogin` bigint(21) ,
 `active_user` bigint(21) ,
 `add_time` varchar(10) ,
 `belong_project` int(11) 
)*/;

/*View structure for view v_appuser */

/*!50001 DROP TABLE IF EXISTS `v_appuser` */;
/*!50001 DROP VIEW IF EXISTS `v_appuser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_appuser` AS select count(`appuserinfo`.`id`) AS `count_appuser`,substr(`appuserinfo`.`create_time`,1,10) AS `add_time`,`appuserinfo`.`belong_project` AS `belong_project` from `appuserinfo` group by `appuserinfo`.`belong_project`,substr(`appuserinfo`.`create_time`,1,10) */;

/*View structure for view v_device_active */

/*!50001 DROP TABLE IF EXISTS `v_device_active` */;
/*!50001 DROP VIEW IF EXISTS `v_device_active` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_device_active` AS select sum((case substr(`device_active_history`.`date_time`,1,10) when substr(`device_active_history`.`unbind_time`,1,10) then 0 else 1 end)) AS `count_device_active`,substr(`device_active_history`.`date_time`,1,10) AS `add_time`,`device_active_history`.`belong_project` AS `belong_project` from `device_active_history` where (`device_active_history`.`status` = '1') group by `device_active_history`.`belong_project`,substr(`device_active_history`.`date_time`,1,10) */;

/*View structure for view v_device_active_history */

/*!50001 DROP TABLE IF EXISTS `v_device_active_history` */;
/*!50001 DROP VIEW IF EXISTS `v_device_active_history` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_device_active_history` AS select sum((case `device_active_history`.`status` when '1' then 1 else 0 end)) AS `bind_count`,sum((case `device_active_history`.`status` when '0' then 1 else 0 end)) AS `unbind_count`,substr(`device_active_history`.`date_time`,1,10) AS `add_time`,`device_active_history`.`belong_project` AS `belong_project` from `device_active_history` group by `device_active_history`.`belong_project`,substr(`device_active_history`.`date_time`,1,10) */;

/*View structure for view v_device_login */

/*!50001 DROP TABLE IF EXISTS `v_device_login` */;
/*!50001 DROP VIEW IF EXISTS `v_device_login` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_device_login` AS select count(`device_login`.`id`) AS `count_device_login`,count(distinct `device_login`.`device_imei`) AS `active_device`,substr(`device_login`.`date_time`,1,10) AS `add_time`,`device_login`.`belong_project` AS `belong_project`,`device_login`.`date_time` AS `date_time` from `device_login` group by `device_login`.`belong_project`,substr(`device_login`.`date_time`,1,10) */;

/*View structure for view v_userlogin */

/*!50001 DROP TABLE IF EXISTS `v_userlogin` */;
/*!50001 DROP VIEW IF EXISTS `v_userlogin` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userlogin` AS select count(`userlogininfo`.`id`) AS `count_userlogin`,count(distinct `userlogininfo`.`user_id`) AS `active_user`,substr(`userlogininfo`.`login_time`,1,10) AS `add_time`,`userlogininfo`.`belong_project` AS `belong_project` from `userlogininfo` group by `userlogininfo`.`belong_project`,substr(`userlogininfo`.`login_time`,1,10) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
