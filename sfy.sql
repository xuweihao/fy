/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : sfy

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2016-12-12 09:12:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data`
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `pId` int(11) DEFAULT NULL,
  `dataName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dataCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delete_Flag` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `create_Date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_User` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `update_Date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_User` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('1', '1', '教育成本费(保教,伙食费)', 'teachPrice', 'F', '2016-09-24 00:06:01', 'ADMIN', '2016-09-24 00:06:01', '许维浩');
INSERT INTO `data` VALUES ('2', '2', '生活用品费', 'lifePrice', 'F', '2016-09-21 17:44:04', 'ADMIN', '2016-09-21 17:44:09', 'ADMIN');
INSERT INTO `data` VALUES ('3', '3', '2333511', 'mobile', 'F', '2016-09-21 17:46:05', 'ADMIN', '2016-09-21 17:45:59', 'ADMIN');
INSERT INTO `data` VALUES ('4', '3', '22222', '1234', 'T', '2016-09-23 21:08:29', 'admin', '2016-09-23 21:08:29', 'admin');
INSERT INTO `data` VALUES ('5', '3', '123', '4444', 'T', '2016-09-23 21:09:02', 'admin', '2016-09-23 21:09:02', 'admin');
INSERT INTO `data` VALUES ('6', '4', '小班', 'small', 'F', '2016-09-23 23:16:49', '许维浩', '2016-09-23 23:16:49', '许维浩');
INSERT INTO `data` VALUES ('7', '4', '中班', 'middle', 'F', '2016-09-23 23:17:16', '许维浩', '2016-09-23 23:17:16', '许维浩');
INSERT INTO `data` VALUES ('8', '4', '大班', 'big', 'F', '2016-09-23 23:17:26', '许维浩', '2016-09-23 23:17:26', '许维浩');
INSERT INTO `data` VALUES ('9', '4', '学前班', 'before', 'F', '2016-09-23 23:17:37', '许维浩', '2016-09-23 23:17:37', '许维浩');
INSERT INTO `data` VALUES ('10', '5', '1', 'one', 'F', '2016-09-23 23:27:46', '许维浩', '2016-09-23 23:27:46', '许维浩');
INSERT INTO `data` VALUES ('11', '5', '2', 'two', 'F', '2016-09-23 23:27:54', '许维浩', '2016-09-23 23:27:54', '许维浩');
INSERT INTO `data` VALUES ('12', '6', '黄勉君', 'huang', 'F', '2016-09-23 23:33:40', '许维浩', '2016-09-23 23:33:40', '许维浩');
INSERT INTO `data` VALUES ('13', '7', '罗洁仪', 'luo', 'F', '2016-09-23 23:33:53', '许维浩', '2016-09-23 23:33:53', '许维浩');
INSERT INTO `data` VALUES ('14', '6', '罗洁仪', 'luo', 'F', '2016-09-23 23:37:42', '许维浩', '2016-09-23 23:37:42', '许维浩');
INSERT INTO `data` VALUES ('15', '7', '黄勉君', 'huang', 'F', '2016-09-23 23:37:54', '许维浩', '2016-09-23 23:37:54', '许维浩');
INSERT INTO `data` VALUES ('16', '8', '1', 'first', 'F', '2016-09-23 23:45:55', '许维浩', '2016-09-23 23:45:55', '许维浩');
INSERT INTO `data` VALUES ('17', '8', '2', 'twice', 'F', '2016-09-23 23:46:19', '许维浩', '2016-09-23 23:46:19', '许维浩');
INSERT INTO `data` VALUES ('18', '8', '3', 'third', 'F', '2016-09-23 23:46:30', '许维浩', '2016-09-23 23:46:30', '许维浩');
INSERT INTO `data` VALUES ('19', '8', '4', 'fourth', 'F', '2016-09-23 23:46:40', '许维浩', '2016-09-23 23:46:40', '许维浩');
INSERT INTO `data` VALUES ('20', '8', '5', 'fifth', 'F', '2016-09-23 23:47:45', '许维浩', '2016-09-23 23:47:45', '许维浩');
INSERT INTO `data` VALUES ('21', '9', '财务', 'finance', 'F', '2016-10-09 18:17:41', '许维浩', '2016-10-09 18:17:41', '许维浩');
INSERT INTO `data` VALUES ('22', '9', '法律', 'law', 'F', '2016-10-09 18:18:17', '许维浩', '2016-10-09 18:18:17', '许维浩');

-- ----------------------------
-- Table structure for `menubean`
-- ----------------------------
DROP TABLE IF EXISTS `menubean`;
CREATE TABLE `menubean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vId` int(11) DEFAULT NULL,
  `hId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'h横向  v 纵向',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'normal 通用 other 其他',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `delete_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of menubean
-- ----------------------------
INSERT INTO `menubean` VALUES ('5', '1', '0', '修改密码', 'h', null, 'normal', '2016-03-10 11:47:02', 'admin', '2016-03-10 11:47:02', 'admin', 'F');
INSERT INTO `menubean` VALUES ('6', '3', '0', '学生查询', 'h', 'page/student/queryStudent.jsp', 'normal', '2016-09-28 19:03:08', 'admin', '2016-09-28 19:03:08', 'admin', 'F');
INSERT INTO `menubean` VALUES ('7', '3', '0', '收据查询', 'h', 'page/shoufei/queryShoufei.jsp', 'normal', '2016-09-21 21:08:54', 'admin', '2016-09-21 21:08:54', 'admin', 'F');
INSERT INTO `menubean` VALUES ('8', '3', '0', '收据录单', 'h', 'shoufei.do/toAddOrEditShoufei.do', 'normal', '2016-09-28 21:23:21', 'admin', '2016-09-28 21:23:21', 'admin', 'T');
INSERT INTO `menubean` VALUES ('9', '3', '0', '学生导入', 'h', 'page/student/importStu.jsp', 'normal', '2016-09-28 19:03:59', 'admin', '2016-09-28 19:03:59', 'admin', 'F');
INSERT INTO `menubean` VALUES ('10', '2', '0', '数据字典维护', 'h', 'data.do/toData.do', 'normal', '2016-03-17 17:16:17', 'admin', '2016-03-17 17:16:17', 'admin', 'F');

-- ----------------------------
-- Table structure for `pdata`
-- ----------------------------
DROP TABLE IF EXISTS `pdata`;
CREATE TABLE `pdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `datacode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delete_Flag` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `create_Date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_User` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `update_Date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_User` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pdata
-- ----------------------------
INSERT INTO `pdata` VALUES ('1', '第一栏目', 'type1', 'F', '2016-09-21 17:41:06', 'ADMIN', '2016-09-21 17:41:11', 'ADMIN');
INSERT INTO `pdata` VALUES ('2', '第二栏目', 'type2', 'F', '2016-09-21 17:42:40', 'ADMIN', '2016-09-21 17:42:46', 'ADMIN');
INSERT INTO `pdata` VALUES ('3', '电话', 'mobile', 'F', '2016-09-21 17:45:23', 'ADMIN', '2016-09-21 17:45:28', 'ADMIN');
INSERT INTO `pdata` VALUES ('4', '班级', 'state', 'F', '2016-09-23 23:16:15', 'ADMIN', '2016-09-23 23:16:22', 'ADMIN');
INSERT INTO `pdata` VALUES ('5', '学期', 'xueqi', 'F', '2016-09-23 23:27:22', 'ADMIN', '2016-09-23 23:27:30', 'ADMIN');
INSERT INTO `pdata` VALUES ('6', '开票人', 'kaipiaoren', 'F', '2016-09-23 23:30:20', 'ADMIN', '2016-09-23 23:30:20', 'ADMIN');
INSERT INTO `pdata` VALUES ('7', '收款人', 'shoukuanren', 'F', '2016-09-23 23:30:45', 'ADMIN', '2016-09-23 23:30:45', 'ADMIN');
INSERT INTO `pdata` VALUES ('8', '班', 'className', 'F', '2016-09-23 23:45:34', 'ADMIN', '2016-09-23 23:45:34', 'ADMIN');
INSERT INTO `pdata` VALUES ('9', '类别', 'type', 'F', '2016-10-09 18:06:23', 'ADMIN', '2016-10-09 18:06:20', 'ADMIN');

-- ----------------------------
-- Table structure for `userbean`
-- ----------------------------
DROP TABLE IF EXISTS `userbean`;
CREATE TABLE `userbean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '1男2女',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `delete_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'T 删除 F 未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userbean
-- ----------------------------
INSERT INTO `userbean` VALUES ('1', 'admin', 'sss', '123', '1', null, null, null, null, null, 'F');

-- ----------------------------
-- Table structure for `word`
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chinese` varchar(255) DEFAULT NULL,
  `english` varchar(255) DEFAULT NULL,
  `example` varchar(700) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `delete_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES ('1', '钱', 'money', 'i have so much money', '财务', '2016-10-09 20:06:48', 'admin', '2016-12-12 09:08:10', 'sss', 'F');
INSERT INTO `word` VALUES ('2', '财务', 'finance', 'He does not understand finance at all.', '财务', '2016-10-09 20:17:46', 'admin', '2016-10-09 20:17:52', 'admin', 'F');
INSERT INTO `word` VALUES ('3', '会计', 'accountant', 'She has an appointment with her accountant ', '财务', '2016-10-09 20:18:33', 'admin', '2016-10-19 20:58:20', null, 'F');
INSERT INTO `word` VALUES ('4', '经济', 'economic', 'While in the past we stressed aid, now we stress economic cooperation.', '财务', '2016-10-09 20:19:22', 'admin', '2016-10-09 20:19:27', 'admin', 'F');
INSERT INTO `word` VALUES ('5', '会计学', 'accounting', 'Majors like finance, accounting and management are popular. ', '财务', '2016-10-09 20:20:54', 'admin', '2016-10-09 20:20:59', 'admin', 'F');
INSERT INTO `word` VALUES ('6', '税收', 'revenue', 'Shrinking economies mean falling tax revenues and more government debt.', '财务', '2016-10-19 20:45:57', null, '2016-10-19 20:45:57', null, 'F');
INSERT INTO `word` VALUES ('7', '被告人', 'accused', 'The accused has the right to defense.', '法律', '2016-12-12 09:07:26', 'sss', '2016-12-12 09:07:26', 'sss', 'F');
