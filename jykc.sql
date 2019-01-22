/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : 192.168.57.138:3306
Source Database       : jykc

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-22 09:46:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_actions
-- ----------------------------
DROP TABLE IF EXISTS `acl_actions`;
CREATE TABLE `acl_actions` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` smallint(6) unsigned NOT NULL,
  `controller_id` smallint(6) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_controllers
-- ----------------------------
DROP TABLE IF EXISTS `acl_controllers`;
CREATE TABLE `acl_controllers` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` smallint(6) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_modules
-- ----------------------------
DROP TABLE IF EXISTS `acl_modules`;
CREATE TABLE `acl_modules` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_role_action
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_action`;
CREATE TABLE `acl_role_action` (
  `role_id` smallint(6) unsigned NOT NULL,
  `action_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_roles
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles`;
CREATE TABLE `acl_roles` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_sitegroup
-- ----------------------------
DROP TABLE IF EXISTS `acl_sitegroup`;
CREATE TABLE `acl_sitegroup` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  `timestamp` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_sitegroup_site
-- ----------------------------
DROP TABLE IF EXISTS `acl_sitegroup_site`;
CREATE TABLE `acl_sitegroup_site` (
  `sitegroup_id` smallint(6) unsigned NOT NULL,
  `site_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_user_action
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_action`;
CREATE TABLE `acl_user_action` (
  `user_id` smallint(6) unsigned NOT NULL,
  `action_id` smallint(6) unsigned NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role` (
  `user_id` smallint(6) unsigned NOT NULL,
  `role_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_user_site
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_site`;
CREATE TABLE `acl_user_site` (
  `user_id` smallint(6) unsigned NOT NULL,
  `site_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acl_user_sitegroup
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_sitegroup`;
CREATE TABLE `acl_user_sitegroup` (
  `user_id` smallint(6) unsigned NOT NULL,
  `sitegroup_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `NewIndex1` (`user_id`,`sitegroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for add_test
-- ----------------------------
DROP TABLE IF EXISTS `add_test`;
CREATE TABLE `add_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `description` text,
  `ip` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=785 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tags` varchar(500) DEFAULT NULL,
  `data` text,
  `site_id` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COMMENT '岗位描述',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `user_id` int(10) NOT NULL COMMENT '创建人',
  `type_id` int(10) NOT NULL COMMENT 'job type id',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态 0-待审核 1-审核通过 2-审核未通过',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `company` varchar(200) NOT NULL DEFAULT '' COMMENT '公司名称',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `salary` varchar(200) NOT NULL DEFAULT '' COMMENT '薪酬',
  `is_top` int(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_delete` int(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for job_type
-- ----------------------------
DROP TABLE IF EXISTS `job_type`;
CREATE TABLE `job_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '职位类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `user_id` int(10) NOT NULL COMMENT '创建人',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态 0-待审核 1-审核通过 2-审核未通过',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_date` date NOT NULL COMMENT '开始时间',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `image` varchar(200) NOT NULL COMMENT '新闻头像图片',
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for other
-- ----------------------------
DROP TABLE IF EXISTS `other`;
CREATE TABLE `other` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `js` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `site_id` smallint(6) unsigned NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `isactive` enum('YES','NO') NOT NULL DEFAULT 'YES',
  PRIMARY KEY (`site_id`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int(10) NOT NULL,
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `company_id` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` text CHARACTER SET latin1 NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `real_name` varchar(45) NOT NULL DEFAULT '',
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `update_pwd` int(1) DEFAULT '0' COMMENT '是否更新过密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
