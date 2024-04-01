/*
 Navicat Premium Data Transfer

 Source Server         : 安诺赛 47.99.143.102
 Source Server Type    : MySQL
 Source Server Version : 50728 (5.7.28)
 Source Host           : 47.99.143.102:3306
 Source Schema         : contact

 Target Server Type    : MySQL
 Target Server Version : 50728 (5.7.28)
 File Encoding         : 65001

 Date: 01/04/2024 16:52:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tab_contact
-- ----------------------------
DROP TABLE IF EXISTS `tab_contact`;
CREATE TABLE `tab_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `custom` varchar(50) DEFAULT NULL,
  `sign_date` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `war_period` varchar(50) DEFAULT NULL,
  `exe_person` varchar(50) DEFAULT NULL,
  `man_person` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `progress` varchar(200) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_contact
-- ----------------------------
BEGIN;
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (9, 'aaa', 'chid001', '设备采购', '11', '2024-03-07', 22, '33', '44', '55', '66', 0, NULL, '77', 8);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (10, 'wert', 'tre', '设备采购', 'yert', '2024-03-14', 23453, 'wter', 'rwetwt', 'wet', 'eryt', 0, NULL, NULL, 1);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (11, '设备采购（技改）合同', 'ZCQQ202403029', '维修保养', '中策清泉', '2024-03-19', 100000, '验收合格并开具发票后 90% ，质保金10%，承兑汇票', '6个月', '夏兰茂', '夏兰茂', 0, NULL, 'null', 0);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (12, '产品购买协议', 'KBDMR020230216004', '设备采购', '科博达嘉兴', '2023-02-16', 1640000, '预付款30%，发货前50%，验收后15%，质保金5%', '出厂18个月或调试合格12个月', '吴欣杰', '夏兰茂', 1, NULL, NULL, 0);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (13, '购销合同', '冷冻机采购', '设备采购', '嘉兴勇信', '2023-02-27', 954405, '预付款10%，发货前90%', '出厂18个月或调试合格12个月', '吴欣杰', '夏兰茂', 0, NULL, NULL, 12);
COMMIT;

-- ----------------------------
-- Table structure for tab_sche
-- ----------------------------
DROP TABLE IF EXISTS `tab_sche`;
CREATE TABLE `tab_sche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `proc` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `imgs` text,
  `file` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_sche
-- ----------------------------
BEGIN;
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (1, 5, '合同前期工作', '完工', 'aaa', 1, '[\"upload/20240317050531.png\"]', '[\"upload/20240317050534.xlsx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (2, 5, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (3, 5, '预付款', '', '', 0, '[\"upload/20240316084647.png\"]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (4, 5, '订货', 'aaaa', 'bbbb', 0, '[\"upload/20240316094454.png\", \"upload/20240316094457.png\"]', '[\"upload/20240316092811.xlsx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (5, 5, '发货款', '666', '7777', 0, '[]', '[\"upload/20240316094331.xlsx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (6, 5, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (7, 5, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (8, 5, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (9, 5, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (10, 5, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (11, 5, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (12, 5, '质保金', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (13, 8, '合同前期工作', 'aaa', 'bbb', 1, '[\"upload/20240317054524.png\"]', '[\"upload/20240317054527.xlsx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (14, 8, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (15, 8, '预付款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (16, 8, '订货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (17, 8, '发货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (18, 8, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (19, 8, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (20, 8, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (21, 8, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (22, 8, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (23, 8, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (24, 8, '质保金', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (25, 9, '合同前期工作', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (26, 9, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (27, 9, '预付款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (28, 9, '订货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (29, 9, '发货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (30, 9, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (31, 9, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (32, 9, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (33, 9, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (34, 9, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (35, 9, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (36, 9, '质保金', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (37, 10, '合同前期工作', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (38, 10, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (39, 10, '预付款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (40, 10, '订货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (41, 10, '发货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (42, 10, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (43, 10, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (44, 10, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (45, 10, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (46, 10, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (47, 10, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (48, 10, '质保金', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (49, 11, '合同前期工作', NULL, NULL, 1, '[]', '[\"upload/20240322132934-合同管理系统.xlsx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (50, 11, '合同生成', NULL, NULL, 1, '[]', '[\"upload/20240322131548-承包工程项目安全协议.docx\"]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (51, 11, '预付款', NULL, NULL, 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (52, 11, '订货', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (53, 11, '发货款', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (54, 11, '到货/验货', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (55, 11, '到货款', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (56, 11, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (57, 11, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (58, 11, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (59, 11, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (60, 11, '质保金', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (61, 12, '合同前期工作', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (62, 12, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (63, 12, '预付款', '', '', 1, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (64, 12, '订货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (65, 12, '发货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (66, 12, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (67, 12, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (68, 12, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (69, 12, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (70, 12, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (71, 12, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (72, 12, '质保金', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (73, 13, '合同前期工作', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (74, 13, '合同生成', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (75, 13, '预付款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (76, 13, '订货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (77, 13, '发货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (78, 13, '到货/验货', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (79, 13, '到货款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (80, 13, '安装', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (81, 13, '开发票', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (82, 13, '调试验收', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (83, 13, '调试款', '', '', 0, '[]', '[]');
INSERT INTO `tab_sche` (`id`, `cid`, `name`, `proc`, `info`, `status`, `imgs`, `file`) VALUES (84, 13, '质保金', '', '', 0, '[]', '[]');
COMMIT;

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
BEGIN;
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (1, 'admin', '管理员', 'ans-system-2022', '1|1|1|1');
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (2, 'xzq', '谢增钱', 'xie2022', '1|1|1|0');
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (3, 'wf', '王芬', 'wang2022', '1|1|0|0');
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (4, 'sys', 'sys', 'ans123456', '1|0|0|0');
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (5, 'liyang', '李阳', '123456', '1|0|1|0');
INSERT INTO `tab_user` (`id`, `usr`, `name`, `pwd`, `role`) VALUES (6, 'keboda', 'keboda', 'keboda', '1|0|1|1');
COMMIT;

-- ----------------------------
-- Procedure structure for DEBUG_MSG
-- ----------------------------
DROP PROCEDURE IF EXISTS `DEBUG_MSG`;
delimiter ;;
CREATE PROCEDURE `DEBUG_MSG`(msg VARCHAR(21812))
BEGIN
    select concat('**', msg) AS '** DEBUG:';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_DEL_CONTACT
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_DEL_CONTACT`;
delimiter ;;
CREATE PROCEDURE `PROC_DEL_CONTACT`(IN `data` varchar(20000))
BEGIN
	SET @pid = JSON_UNQUOTE(JSON_EXTRACT(data, '$.pid'));
	SET @id = JSON_UNQUOTE(JSON_EXTRACT(data, '$.id'));
	
	delete from tab_contact where id = @id;
	select t.id as `key`, t.* from tab_contact t where pid = @pid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_FINISH_CONTACT
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_FINISH_CONTACT`;
delimiter ;;
CREATE PROCEDURE `PROC_FINISH_CONTACT`(IN `data` varchar(20000))
BEGIN
	
	SET @pid = JSON_EXTRACT(data, '$.pid');
	SET @id = JSON_EXTRACT(data, '$.id');
	SET @status = JSON_EXTRACT(data, '$.status');
	
	UPDATE tab_contact SET status=@status where id = @id;
	select t.id as `key`, t.* from tab_contact t where pid = @pid;
      
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_FINISH_SCHE_ITEM
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_FINISH_SCHE_ITEM`;
delimiter ;;
CREATE PROCEDURE `PROC_FINISH_SCHE_ITEM`(IN `data` varchar(20000))
BEGIN
	
	SET @id = JSON_EXTRACT(data, '$.id');
	SET @cid = JSON_EXTRACT(data, '$.cid');
	SET @status = JSON_EXTRACT(data, '$.status');
	
	
	UPDATE tab_sche SET status=@status where id = @id;
	SELECT t.id as `key`, t.* from tab_sche t where t.cid = @cid; 
      
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_LOGIN
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_LOGIN`;
delimiter ;;
CREATE PROCEDURE `PROC_LOGIN`(IN `data` varchar(20000))
BEGIN
	DECLARE _usr  varchar(20) 	default null;
  DECLARE _pwd 	varchar(50) 	default null;

	SET _usr = JSON_UNQUOTE(JSON_EXTRACT(data,'$.usr'));
	SET _pwd = JSON_UNQUOTE(JSON_EXTRACT(data,'$.pwd'));
	
	SELECT * FROM tab_user WHERE usr = _usr AND pwd = _pwd;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_QUERY_CONTACT
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_QUERY_CONTACT`;
delimiter ;;
CREATE PROCEDURE `PROC_QUERY_CONTACT`(IN `data` varchar(20000))
BEGIN
	SET @pid = JSON_UNQUOTE(JSON_EXTRACT(data, '$.pid'));
	select t.id as `key`, t.* from tab_contact t where pid = @pid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_QUERY_CONTACT_SCHE
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_QUERY_CONTACT_SCHE`;
delimiter ;;
CREATE PROCEDURE `PROC_QUERY_CONTACT_SCHE`(IN `data` text)
BEGIN
	SET @cid = JSON_EXTRACT(data, '$.cid');
	select name from tab_sche where cid = @cid and status = 1 order by id desc limit 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_QUERY_SCHE
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_QUERY_SCHE`;
delimiter ;;
CREATE PROCEDURE `PROC_QUERY_SCHE`(IN `data` varchar(20000))
BEGIN
	
	SET @cid = JSON_UNQUOTE(JSON_EXTRACT(data, '$.cid'));
	
	select t.id as `key`, t.* from tab_sche t where t.cid = @cid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_SAVE_CONTACT
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_SAVE_CONTACT`;
delimiter ;;
CREATE PROCEDURE `PROC_SAVE_CONTACT`(IN jsonData TEXT)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE phase VARCHAR(50);
  DECLARE list_json JSON DEFAULT '["合同前期工作","合同生成","预付款","订货","发货款","到货/验货","到货款","安装","开发票","调试验收","调试款","质保金"]';
 
		SET @id = JSON_EXTRACT(jsonData, '$.id');
		SET @pid = JSON_EXTRACT(jsonData, '$.pid');
    SET @method = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.method'));
		SET @code = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.code'));
    SET @name = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.name'));
		SET @type = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.type'));
		SET @custom = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.custom'));
		SET @sign_date = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.sign_date'));
		SET @money = JSON_EXTRACT(jsonData, '$.money');
		SET @pay_method = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.pay_method'));
		SET @war_period = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.war_period'));
		SET @exe_person = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.exe_person'));
		SET @man_person = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.man_person'));
		SET @status =JSON_EXTRACT(jsonData, '$.status');
		SET @progress = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.progress'));
		SET @remark = JSON_UNQUOTE(JSON_EXTRACT(jsonData, '$.remark'));
    
    IF @method = 'update' THEN
			UPDATE tab_contact
			SET
				`name` = @name,
				`code` = @code,
				`type` = @type,
				`custom` = @custom,
				`sign_date` = @sign_date,
				`money` = @money,
				`pay_method` = @pay_method,
				`war_period` = @war_period,
				`exe_person` = @exe_person,
				`man_person` = @man_person,
				`progress` = @progress,
				`remark` = @remark
			WHERE id = @id;
		ELSEIF @method = 'insert' THEN
			INSERT INTO tab_contact (`name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`)
			VALUES (@name, @code, @type, @custom, @sign_date, @money, @pay_method, @war_period, @exe_person, @man_person, 0, @progress, @remark, @pid);
		
			set @cid = LAST_INSERT_ID();
			WHILE i < JSON_LENGTH(list_json) DO
					SET phase = JSON_UNQUOTE(JSON_EXTRACT(list_json, CONCAT('$[', i, ']')));
					INSERT INTO tab_sche (cid,name,proc,info,status,file,imgs) 
					VALUES (@cid,phase,'','',0,'[]','[]');

					SET i = i + 1;
			END WHILE;
    END IF;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_SAVE_FILE
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_SAVE_FILE`;
delimiter ;;
CREATE PROCEDURE `PROC_SAVE_FILE`(IN `data` varchar(20000))
BEGIN
	
	SET @id = JSON_EXTRACT(data, '$.id');
	SET @file = JSON_UNQUOTE(JSON_EXTRACT(data, '$.file'));
	SET @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.type'));
	
	if @type='file' THEN
		UPDATE TAB_SCHE SET file = @file where id = @id;
	ELSE
		UPDATE TAB_SCHE SET imgs = @file where id = @id;
	END IF;
      
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PROC_SAVE_SCHE_ITEM
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC_SAVE_SCHE_ITEM`;
delimiter ;;
CREATE PROCEDURE `PROC_SAVE_SCHE_ITEM`(IN `data` varchar(20000))
BEGIN
	
	SET @id = JSON_EXTRACT(data, '$.id');
	SET @file = JSON_UNQUOTE(JSON_EXTRACT(data, '$.file'));
	SET @imgs = JSON_UNQUOTE(JSON_EXTRACT(data, '$.imgs'));
	SET @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.type'));
	SET @proc = JSON_UNQUOTE(JSON_EXTRACT(data, '$.proc'));
	SET @info = JSON_UNQUOTE(JSON_EXTRACT(data, '$.info'));
	
	
	UPDATE tab_sche SET file = @file,imgs=@imgs,proc=@proc,info=@info where id = @id;
	
      
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
