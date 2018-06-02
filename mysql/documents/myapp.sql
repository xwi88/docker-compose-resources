/*
Navicat MySQL Data Transfer

Source Server         : 192.168.11.10 root
Source Server Version : 80011
Source Host           : 192.168.11.10:3306
Source Database       : myapp

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-06-02 17:55:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chaindb`
-- ----------------------------
DROP TABLE IF EXISTS `chaindb`;
CREATE TABLE `chaindb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `count` bigint(20) DEFAULT NULL,
  `metric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of chaindb
-- ----------------------------
INSERT INTO `chaindb` VALUES ('1', '2018-06-02 11:05:27', '1', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('2', '2018-06-02 11:05:27', '0', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('3', '2018-06-02 11:05:27', '2', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('4', '2018-06-02 11:05:27', '0', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('5', '2018-06-02 11:05:27', '3', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('6', '2018-06-02 11:05:27', '0', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('7', '2018-06-02 11:05:27', '5', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('8', '2018-06-02 11:05:27', '6', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('9', '2018-06-02 11:26:27', '1', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('10', '2018-06-02 11:27:27', '5', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('11', '2018-06-02 11:27:27', '5', 'chaindb.compact.input.meter');
INSERT INTO `chaindb` VALUES ('12', '2018-06-02 11:28:27', '5', 'chaindb.compact.input.meter');
