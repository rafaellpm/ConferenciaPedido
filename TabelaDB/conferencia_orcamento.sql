/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3390
Source Database       : nova_esperanca

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2021-04-01 16:40:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for conferencia_orcamento
-- ----------------------------
DROP TABLE IF EXISTS `conferencia_orcamento`;
CREATE TABLE `conferencia_orcamento` (
  `cod_conferencia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) DEFAULT NULL,
  `cod_orcamento` int(11) DEFAULT NULL,
  `qtd` float DEFAULT NULL,
  `data_conferido` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_conferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
