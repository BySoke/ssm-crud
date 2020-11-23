/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1-mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : dbdemo

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 05/06/2020 09:41:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_user_ssm
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_ssm`;
CREATE TABLE `tb_user_ssm`  (
  `id` int(8) NOT NULL COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `age` int(8) NULL DEFAULT NULL COMMENT '用户年龄',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在市'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_ssm
-- ----------------------------
INSERT INTO `tb_user_ssm` VALUES (1, 'jianghui', 22, '123', '13333333333', 'a');
INSERT INTO `tb_user_ssm` VALUES (2, 'jianghui', 23, '123', '13333333333', 'b');
INSERT INTO `tb_user_ssm` VALUES (3, 'jianghui', 24, '123', '13333333333', 'c');
INSERT INTO `tb_user_ssm` VALUES (4, 'jianghui', 22, '123', '13333333333', 'd');
INSERT INTO `tb_user_ssm` VALUES (5, 'jianghui', 23, '123', '13333333333', 'e');
INSERT INTO `tb_user_ssm` VALUES (6, 'jianghui', 24, '123', '13333333333', 'f');
INSERT INTO `tb_user_ssm` VALUES (7, 'jianghui', 22, '123', '13333333333', 'g');
INSERT INTO `tb_user_ssm` VALUES (8, 'jianghui', 23, '123', '13333333333', 'h');
INSERT INTO `tb_user_ssm` VALUES (9, 'jianghui', 24, '123', '13333333333', 'i');
INSERT INTO `tb_user_ssm` VALUES (10, 'jianghui', 22, '123', '13333333333', 'j');
INSERT INTO `tb_user_ssm` VALUES (11, 'jianghui', 23, '123', '13333333333', 'k');
INSERT INTO `tb_user_ssm` VALUES (12, 'jianghui', 24, '123', '13333333333', 'l');
INSERT INTO `tb_user_ssm` VALUES (13, 'jianghui', 22, '123', '13333333333', 'm');
INSERT INTO `tb_user_ssm` VALUES (14, 'jianghui', 23, '123', '13333333333', 'n');
INSERT INTO `tb_user_ssm` VALUES (15, 'jianghui', 24, '123', '13333333333', 'o');
INSERT INTO `tb_user_ssm` VALUES (16, 'jianghui', 22, '123', '13333333333', 'p');
INSERT INTO `tb_user_ssm` VALUES (17, 'jianghui', 23, '123', '13333333333', 'q');
INSERT INTO `tb_user_ssm` VALUES (18, 'jianghui', 24, '123', '13333333333', 'r');
INSERT INTO `tb_user_ssm` VALUES (19, 'jianghui', 22, '123', '13333333333', 's');
INSERT INTO `tb_user_ssm` VALUES (20, 'jianghui', 23, '123', '13333333333', 't');
INSERT INTO `tb_user_ssm` VALUES (21, 'jianghui', 24, '123', '13333333333', 'u');
INSERT INTO `tb_user_ssm` VALUES (22, 'jianghui', 22, '123', '13333333333', 'v');
INSERT INTO `tb_user_ssm` VALUES (23, 'jianghui', 23, '123', '13333333333', 'w');
INSERT INTO `tb_user_ssm` VALUES (24, 'sunyuhuan', 24, '123', '13333333333', 'x');
INSERT INTO `tb_user_ssm` VALUES (25, 'sunyuhuan', 22, '123', '13333333333', 'y');
INSERT INTO `tb_user_ssm` VALUES (26, 'sunyuhuan', 23, '123', '13333333333', 'z');
INSERT INTO `tb_user_ssm` VALUES (27, 'sunyuhuan', 24, '123', '13333333333', 'z');
INSERT INTO `tb_user_ssm` VALUES (28, 'sunyuhuan', 22, '456', '13333333333', 'z');
INSERT INTO `tb_user_ssm` VALUES (29, 'sunyuhuan', 23, '456', '15222222222', 'z');
INSERT INTO `tb_user_ssm` VALUES (30, 'sunyuhuan', 24, '456', '18111111111', 't');
INSERT INTO `tb_user_ssm` VALUES (31, 'jianghui', 22, '456', '18111111111', 't');
INSERT INTO `tb_user_ssm` VALUES (32, 'jianghui', 23, '456', '18111111111', 't');
INSERT INTO `tb_user_ssm` VALUES (33, 'sunyuhuan', 24, '456', '18111111111', 't');
INSERT INTO `tb_user_ssm` VALUES (34, 'sunyuhuan', 22, '456', '15222222222', 't');
INSERT INTO `tb_user_ssm` VALUES (35, 'sunyuhuan', 23, '456', '15222222222', 'a');
INSERT INTO `tb_user_ssm` VALUES (36, 'sunyuhuan', 24, '456', '15222222222', 's');
INSERT INTO `tb_user_ssm` VALUES (37, 'sunyuhuan', 22, '456', '15222222222', 'f');
INSERT INTO `tb_user_ssm` VALUES (38, 'sunyuhuan', 23, '456', '15222222222', 'h');
INSERT INTO `tb_user_ssm` VALUES (39, 'sunyuhuan', 24, '456', '15222222222', 'j');
INSERT INTO `tb_user_ssm` VALUES (40, 'sunyuhuan', 22, '456', '15222222222', 'k');
INSERT INTO `tb_user_ssm` VALUES (41, 'sunyuhuan', 23, '456', '15222222222', 'u');
INSERT INTO `tb_user_ssm` VALUES (42, 'sunyuhuan', 24, '456', '15222222222', 'cvxcv');
INSERT INTO `tb_user_ssm` VALUES (43, 'sunyuhuan', 22, '456', '13888888888', 'a');
INSERT INTO `tb_user_ssm` VALUES (44, 'sunyuhuan', 23, '456', '13888888888', 'b');
INSERT INTO `tb_user_ssm` VALUES (45, 'sunyuhuan', 24, '456', '13888888888', 'c');
INSERT INTO `tb_user_ssm` VALUES (46, 'sunyuhuan', 22, '456', '13888888888', 'd');
INSERT INTO `tb_user_ssm` VALUES (47, 'sunyuhuan', 23, '456', '13888888888', 'e');
INSERT INTO `tb_user_ssm` VALUES (48, 'sunyuhuan', 24, '456', '13888888888', 'f');
INSERT INTO `tb_user_ssm` VALUES (49, 'sunyuhuan', 22, '456', '13888888888', 'g');
INSERT INTO `tb_user_ssm` VALUES (50, 'sunyuhuan', 22, '456', '13888888888', 'h');
INSERT INTO `tb_user_ssm` VALUES (51, 'sunyuhuan', 22, '456', '13888888888', 'y');
INSERT INTO `tb_user_ssm` VALUES (52, 'sunyuhuan', 24, '456', '13888888888', 'i');
INSERT INTO `tb_user_ssm` VALUES (53, 'sunyuhuan', 24, '456', '13888888888', 'j');
INSERT INTO `tb_user_ssm` VALUES (54, 'sunyuhuan', 24, '456', '13888888888', 'k');
INSERT INTO `tb_user_ssm` VALUES (55, 'sunyuhuan', 23, '456', '13888888888', 'l');
INSERT INTO `tb_user_ssm` VALUES (56, 'sunyuhuan', 23, '456', '13888888888', 'm');
INSERT INTO `tb_user_ssm` VALUES (57, 'sunyuhuan', 23, '456', '13888888888', 'n');
INSERT INTO `tb_user_ssm` VALUES (58, 'sunyuhuan', 23, '456', '13888888888', 'o');
INSERT INTO `tb_user_ssm` VALUES (59, 'sunyuhuan', 22, '456', '13888888888', 'p');
INSERT INTO `tb_user_ssm` VALUES (60, 'sunyuhuan', 23, '456', '13888888888', 'q');
INSERT INTO `tb_user_ssm` VALUES (61, 'sunyuhuan', 23, '456', '13888888888', 'r');
INSERT INTO `tb_user_ssm` VALUES (62, 'sunyuhuan', 23, '456', '13888888888', 's');
INSERT INTO `tb_user_ssm` VALUES (63, 'sunyuhuan', 24, '456', '13888888888', 't');
INSERT INTO `tb_user_ssm` VALUES (64, 'sunyuhuan', 24, '456', '13888888888', 'u');
INSERT INTO `tb_user_ssm` VALUES (65, 'sunyuhuan', 24, '456', '13888888888', 'v');
INSERT INTO `tb_user_ssm` VALUES (66, 'sunyuhuan', 23, '456', '13888888888', 'w');
INSERT INTO `tb_user_ssm` VALUES (67, 'sunyuhuan', 23, '456', '13888888888', 'x');
INSERT INTO `tb_user_ssm` VALUES (68, 'sunyuhuan', 23, '456', '13888888888', 'y');
INSERT INTO `tb_user_ssm` VALUES (69, 'sunyuhuan', 23, '456', '13888888888', 'z');

SET FOREIGN_KEY_CHECKS = 1;
