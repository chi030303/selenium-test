/*
 Navicat Premium Data Transfer

 Source Server         : selenium_test
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : currency_db

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 21/01/2024 21:37:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for currency_mapping_table
-- ----------------------------
DROP TABLE IF EXISTS `currency_mapping_table`;
CREATE TABLE `currency_mapping_table`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currency_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency_mapping_table
-- ----------------------------
INSERT INTO `currency_mapping_table` VALUES (1, '港元', 'HKD');
INSERT INTO `currency_mapping_table` VALUES (2, '澳门元', 'MOP');
INSERT INTO `currency_mapping_table` VALUES (3, '人民币元', 'CNY');
INSERT INTO `currency_mapping_table` VALUES (4, '圆', 'KPW');
INSERT INTO `currency_mapping_table` VALUES (5, '越南盾', 'VND');
INSERT INTO `currency_mapping_table` VALUES (6, '日圆', 'JPY');
INSERT INTO `currency_mapping_table` VALUES (7, '基普', 'LAK');
INSERT INTO `currency_mapping_table` VALUES (8, '瑞尔', 'KHR');
INSERT INTO `currency_mapping_table` VALUES (9, '菲律宾比索', 'PHP');
INSERT INTO `currency_mapping_table` VALUES (10, '马元', 'MYR');
INSERT INTO `currency_mapping_table` VALUES (11, '新加坡元', 'SGD');
INSERT INTO `currency_mapping_table` VALUES (12, '泰铢', 'THP');
INSERT INTO `currency_mapping_table` VALUES (13, '缅元', 'BUK');
INSERT INTO `currency_mapping_table` VALUES (14, '斯里兰卡卢比', 'LKR');
INSERT INTO `currency_mapping_table` VALUES (15, '马尔代夫卢比', 'MVR');
INSERT INTO `currency_mapping_table` VALUES (16, '盾', 'IDR');
INSERT INTO `currency_mapping_table` VALUES (17, '巴基斯坦卢比', 'PRK');
INSERT INTO `currency_mapping_table` VALUES (18, '卢比', 'INR');
INSERT INTO `currency_mapping_table` VALUES (19, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (20, '阿富汗尼', 'AFA');
INSERT INTO `currency_mapping_table` VALUES (21, '伊朗里亚尔', 'IRR');
INSERT INTO `currency_mapping_table` VALUES (22, '伊拉克第纳尔', 'IQD');
INSERT INTO `currency_mapping_table` VALUES (23, '叙利亚镑', 'SYP');
INSERT INTO `currency_mapping_table` VALUES (24, '黎巴嫩镑', 'LBP');
INSERT INTO `currency_mapping_table` VALUES (25, '约旦第纳尔', 'JOD');
INSERT INTO `currency_mapping_table` VALUES (26, '亚尔', 'SAR');
INSERT INTO `currency_mapping_table` VALUES (27, '科威特第纳尔', 'KWD');
INSERT INTO `currency_mapping_table` VALUES (28, '巴林第纳尔', 'BHD');
INSERT INTO `currency_mapping_table` VALUES (29, '卡塔尔里亚尔', 'QAR');
INSERT INTO `currency_mapping_table` VALUES (30, '阿曼里亚尔', 'OMR');
INSERT INTO `currency_mapping_table` VALUES (31, '也门里亚尔', 'YER');
INSERT INTO `currency_mapping_table` VALUES (32, '也门第纳尔', 'YDD');
INSERT INTO `currency_mapping_table` VALUES (33, '土耳其镑', 'TRL');
INSERT INTO `currency_mapping_table` VALUES (34, '塞浦路斯镑', 'CYP');
INSERT INTO `currency_mapping_table` VALUES (35, '欧元', 'EUR');
INSERT INTO `currency_mapping_table` VALUES (36, '冰岛克朗', 'ISK');
INSERT INTO `currency_mapping_table` VALUES (37, '丹麦克朗', 'DKK');
INSERT INTO `currency_mapping_table` VALUES (38, '挪威克朗', 'NOK');
INSERT INTO `currency_mapping_table` VALUES (39, '瑞典克朗', 'SEK');
INSERT INTO `currency_mapping_table` VALUES (40, '芬兰马克', 'FIM');
INSERT INTO `currency_mapping_table` VALUES (41, '卢布', 'SUR');
INSERT INTO `currency_mapping_table` VALUES (42, '兹罗提', 'PLZ');
INSERT INTO `currency_mapping_table` VALUES (43, '捷克克朗', 'CSK');
INSERT INTO `currency_mapping_table` VALUES (44, '福林', 'HUF');
INSERT INTO `currency_mapping_table` VALUES (45, '马克', 'DEM');
INSERT INTO `currency_mapping_table` VALUES (46, '奥地利先令', 'ATS');
INSERT INTO `currency_mapping_table` VALUES (47, '瑞士法郎', 'CHF');
INSERT INTO `currency_mapping_table` VALUES (48, '荷兰盾', 'NLG');
INSERT INTO `currency_mapping_table` VALUES (49, '比利时法郎', 'BEF');
INSERT INTO `currency_mapping_table` VALUES (50, '卢森堡法郎', 'LUF');
INSERT INTO `currency_mapping_table` VALUES (51, '英镑', 'GBP');
INSERT INTO `currency_mapping_table` VALUES (52, '爱尔兰镑', 'IEP');
INSERT INTO `currency_mapping_table` VALUES (53, '法郎', 'FRF');
INSERT INTO `currency_mapping_table` VALUES (54, '比塞塔', 'ESP');
INSERT INTO `currency_mapping_table` VALUES (55, '埃斯库多', 'PTE**');
INSERT INTO `currency_mapping_table` VALUES (56, '里拉', 'ITL');
INSERT INTO `currency_mapping_table` VALUES (57, '马耳他镑', 'MTP');
INSERT INTO `currency_mapping_table` VALUES (58, '南斯拉夫新第纳尔', 'YUD');
INSERT INTO `currency_mapping_table` VALUES (59, '列伊', 'ROL');
INSERT INTO `currency_mapping_table` VALUES (60, '列弗', 'BGL');
INSERT INTO `currency_mapping_table` VALUES (61, '列克', 'ALL');
INSERT INTO `currency_mapping_table` VALUES (62, '德拉马克', 'GRD');
INSERT INTO `currency_mapping_table` VALUES (63, '加元', 'CAD');
INSERT INTO `currency_mapping_table` VALUES (64, '美元', 'USD');
INSERT INTO `currency_mapping_table` VALUES (65, '墨西哥比索', 'MXP');
INSERT INTO `currency_mapping_table` VALUES (66, '格查尔', 'GTQ');
INSERT INTO `currency_mapping_table` VALUES (67, '萨尔瓦多科朗', 'SVC');
INSERT INTO `currency_mapping_table` VALUES (68, '伦皮拉', 'HNL');
INSERT INTO `currency_mapping_table` VALUES (69, '科多巴', 'NIC');
INSERT INTO `currency_mapping_table` VALUES (70, '哥斯达黎加科朗', 'CRC');
INSERT INTO `currency_mapping_table` VALUES (71, '巴拿马巴波亚', 'PAB');
INSERT INTO `currency_mapping_table` VALUES (72, '古巴比索', 'CUP');
INSERT INTO `currency_mapping_table` VALUES (73, '巴哈马元', 'BSD');
INSERT INTO `currency_mapping_table` VALUES (74, '牙买加元', 'JMD');
INSERT INTO `currency_mapping_table` VALUES (75, '古德', 'HTG');
INSERT INTO `currency_mapping_table` VALUES (76, '多米尼加比索', 'DOP');
INSERT INTO `currency_mapping_table` VALUES (77, '特立尼达多巴哥元', 'TTD');
INSERT INTO `currency_mapping_table` VALUES (78, '巴巴多斯元', 'BBD');
INSERT INTO `currency_mapping_table` VALUES (79, '哥伦比亚比索', 'COP');
INSERT INTO `currency_mapping_table` VALUES (80, '博利瓦', 'VEB');
INSERT INTO `currency_mapping_table` VALUES (81, '圭亚那元', 'GYD');
INSERT INTO `currency_mapping_table` VALUES (82, '苏里南盾', 'SRG');
INSERT INTO `currency_mapping_table` VALUES (83, '新索尔', 'PES');
INSERT INTO `currency_mapping_table` VALUES (84, '苏克雷', 'ECS');
INSERT INTO `currency_mapping_table` VALUES (85, '新克鲁赛罗', 'BRC');
INSERT INTO `currency_mapping_table` VALUES (86, '玻利维亚比索', 'BOP');
INSERT INTO `currency_mapping_table` VALUES (87, '智利比索', 'CLP');
INSERT INTO `currency_mapping_table` VALUES (88, '阿根廷比索', 'ARP');
INSERT INTO `currency_mapping_table` VALUES (89, '巴拉圭瓜拉尼', 'PYG');
INSERT INTO `currency_mapping_table` VALUES (90, '乌拉圭新比索', 'UYP');
INSERT INTO `currency_mapping_table` VALUES (91, '埃及镑', 'EGP');
INSERT INTO `currency_mapping_table` VALUES (92, '利比亚第纳尔', 'LYD');
INSERT INTO `currency_mapping_table` VALUES (93, '苏丹镑', 'SDP');
INSERT INTO `currency_mapping_table` VALUES (94, '突尼斯第纳尔', 'TND');
INSERT INTO `currency_mapping_table` VALUES (95, '阿尔及利亚第纳尔', 'DZD');
INSERT INTO `currency_mapping_table` VALUES (96, '摩洛哥迪拉姆', 'MAD');
INSERT INTO `currency_mapping_table` VALUES (97, '乌吉亚', 'MRO');
INSERT INTO `currency_mapping_table` VALUES (98, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (99, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (100, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (101, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (102, '非共体法郎', 'XOF');
INSERT INTO `currency_mapping_table` VALUES (103, '法拉西', 'GMD');
INSERT INTO `currency_mapping_table` VALUES (104, '几内亚比索', 'GWP');
INSERT INTO `currency_mapping_table` VALUES (105, '几内亚西里', 'GNS');
INSERT INTO `currency_mapping_table` VALUES (106, '利昂', 'SLL');
INSERT INTO `currency_mapping_table` VALUES (107, '利比里亚元', 'LRD');
INSERT INTO `currency_mapping_table` VALUES (108, '塞地', 'GHC');
INSERT INTO `currency_mapping_table` VALUES (109, '奈拉', 'NGN');
INSERT INTO `currency_mapping_table` VALUES (110, '中非金融合作法郎', 'XAF');
INSERT INTO `currency_mapping_table` VALUES (111, '中非金融合作法郎', 'XAF');
INSERT INTO `currency_mapping_table` VALUES (112, '中非金融合作法郎', 'XAF');
INSERT INTO `currency_mapping_table` VALUES (113, '中非金融合作法郎', 'XAF');
INSERT INTO `currency_mapping_table` VALUES (114, '中非金融合作法郎', 'XAF');
INSERT INTO `currency_mapping_table` VALUES (115, '赤道几内亚埃奎勒', 'GQE');
INSERT INTO `currency_mapping_table` VALUES (116, '兰特', 'ZAR');
INSERT INTO `currency_mapping_table` VALUES (117, '吉布提法郎', 'DJF');
INSERT INTO `currency_mapping_table` VALUES (118, '索马里先令', 'SOS');
INSERT INTO `currency_mapping_table` VALUES (119, '肯尼亚先令', 'KES');
INSERT INTO `currency_mapping_table` VALUES (120, '乌干达先令', 'UGS');
INSERT INTO `currency_mapping_table` VALUES (121, '坦桑尼亚先令', 'TZS');
INSERT INTO `currency_mapping_table` VALUES (122, '卢旺达法郎', 'RWF');
INSERT INTO `currency_mapping_table` VALUES (123, '布隆迪法郎', 'BIF');
INSERT INTO `currency_mapping_table` VALUES (124, '扎伊尔', 'ZRZ');
INSERT INTO `currency_mapping_table` VALUES (125, '赞比亚克瓦查', 'ZMK');
INSERT INTO `currency_mapping_table` VALUES (126, '马达加斯加法郎', 'MCF');
INSERT INTO `currency_mapping_table` VALUES (127, '塞舌尔卢比', 'SCR');
INSERT INTO `currency_mapping_table` VALUES (128, '毛里求斯卢比', 'MUR');
INSERT INTO `currency_mapping_table` VALUES (129, '津巴布韦元', 'ZWD');
INSERT INTO `currency_mapping_table` VALUES (130, '科摩罗法郎', 'KMF');
INSERT INTO `currency_mapping_table` VALUES (131, '澳大利亚元', 'AUD');
INSERT INTO `currency_mapping_table` VALUES (132, '新西兰元', 'NZD');
INSERT INTO `currency_mapping_table` VALUES (133, '斐济元', 'FJD');
INSERT INTO `currency_mapping_table` VALUES (134, '所罗门元', 'SBD');

SET FOREIGN_KEY_CHECKS = 1;
