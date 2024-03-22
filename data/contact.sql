/*
 Navicat Premium Data Transfer

 Source Server         : 本機
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : contact

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 22/03/2024 09:44:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tab_contact
-- ----------------------------
DROP TABLE IF EXISTS `tab_contact`;
CREATE TABLE `tab_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `custom` varchar(50) DEFAULT NULL,
  `sign_date` varchar(20) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `war_period` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `exe_person` varchar(50) DEFAULT NULL,
  `man_person` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `progress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `pid` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tab_contact
-- ----------------------------
BEGIN;
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (1, '科博达项目合同', '20240318011', '设备采购', '科博达', '2024-02-01', 150, '转账', '1年', '下雨很', '张朝晖', 1, NULL, '进度说明', 0);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (5, '22', '111', '维修保养', '33', '2024-03-16', 44, '5', '6', '7', '8', 0, NULL, 'aaa', 0);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (8, 'ccc', 'bbb', '维修保养', 'dddd', '2024-03-04', 11, 'qq', 'aaa', 'eeee', 'rrrr', 0, NULL, 'ssss', 0);
INSERT INTO `tab_contact` (`id`, `name`, `code`, `type`, `custom`, `sign_date`, `money`, `pay_method`, `war_period`, `exe_person`, `man_person`, `status`, `progress`, `remark`, `pid`) VALUES (9, 'aaa', 'chid001', '设备采购', '11', '2024-03-07', 22, '33', '44', '55', '66', 0, NULL, '77', 8);
COMMIT;

-- ----------------------------
-- Table structure for tab_sche
-- ----------------------------
DROP TABLE IF EXISTS `tab_sche`;
CREATE TABLE `tab_sche` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `proc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `imgs` text,
  `file` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

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
COMMIT;

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usr` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

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
	
	SET @pid = JSON_UNQUOTE(JSON_EXTRACT(data, '$.pid'));
	SET @id = JSON_UNQUOTE(JSON_EXTRACT(data, '$.id'));
	
	UPDATE tab_contact SET status=1 where id = @id;
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
	
	
	UPDATE tab_sche SET status=1 where id = @id;
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
	
	
	UPDATE TAB_SCHE SET file = @file,imgs=@imgs,proc=@proc,info=@info where id = @id;
	
      
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
