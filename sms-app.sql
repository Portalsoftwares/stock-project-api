/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : sms-app

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 09/12/2023 08:07:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academic
-- ----------------------------
DROP TABLE IF EXISTS `academic`;
CREATE TABLE `academic`  (
  `academic_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `academic_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`academic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of academic
-- ----------------------------
INSERT INTO `academic` VALUES (1, 'ឆ្នាំសិក្សា​២០២៣​ - ២០២៤', '2023-01-01', '2024-01-01', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `academic` VALUES (2, 'ឆ្នាំសិក្សា​២០២៤ - ២០២៥', '2024-01-01', '2025-01-01', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `attendance_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `time_id` int NOT NULL,
  `class_id` int NOT NULL,
  `day_id` int NOT NULL,
  `subject_grade_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `date` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 1, 1, 1, 1, 0, '2023-12-04', NULL, '2023-12-08 19:31:03', '2023-12-08 19:31:03');
INSERT INTO `attendance` VALUES (2, 3, 1, 1, 2, 0, '2023-12-04', NULL, '2023-12-08 19:31:24', '2023-12-08 19:31:24');
INSERT INTO `attendance` VALUES (3, 1, 1, 2, 3, 0, '2023-12-05', NULL, '2023-12-08 19:31:37', '2023-12-08 19:31:37');
INSERT INTO `attendance` VALUES (4, 3, 1, 2, 4, 0, '2023-12-05', NULL, '2023-12-08 19:31:49', '2023-12-08 19:31:49');
INSERT INTO `attendance` VALUES (5, 1, 1, 3, 5, 0, '2023-12-06', NULL, '2023-12-08 19:32:01', '2023-12-08 19:32:01');
INSERT INTO `attendance` VALUES (6, 1, 1, 3, 6, 0, '2023-12-06', NULL, '2023-12-08 19:32:28', '2023-12-08 19:32:28');
INSERT INTO `attendance` VALUES (7, 1, 1, 3, 7, 0, '2023-12-07', NULL, '2023-12-08 19:32:36', '2023-12-08 19:32:36');
INSERT INTO `attendance` VALUES (8, 1, 1, 4, 7, 0, '2023-12-07', NULL, '2023-12-08 19:32:44', '2023-12-08 19:32:44');
INSERT INTO `attendance` VALUES (9, 1, 1, 5, 1, 0, '2023-12-08', NULL, '2023-12-08 19:32:55', '2023-12-08 19:32:55');
INSERT INTO `attendance` VALUES (10, 1, 1, 6, 1, 0, '2023-12-08', NULL, '2023-12-08 19:33:04', '2023-12-08 19:33:04');
INSERT INTO `attendance` VALUES (11, 1, 1, 1, 1, 0, '2023-12-11', NULL, '2023-12-08 19:33:14', '2023-12-08 19:33:14');
INSERT INTO `attendance` VALUES (12, 1, 1, 2, 3, 0, '2023-12-12', NULL, '2023-12-08 19:33:57', '2023-12-08 19:33:57');
INSERT INTO `attendance` VALUES (13, 1, 1, 3, 4, 0, '2023-12-13', NULL, '2023-12-08 19:34:07', '2023-12-08 19:34:07');
INSERT INTO `attendance` VALUES (14, 1, 1, 4, 5, 0, '2023-12-14', NULL, '2023-12-08 19:34:14', '2023-12-08 19:34:14');
INSERT INTO `attendance` VALUES (15, 1, 1, 5, 6, 0, '2023-12-15', NULL, '2023-12-08 19:34:25', '2023-12-08 19:34:25');
INSERT INTO `attendance` VALUES (16, 1, 1, 6, 7, 0, '2023-12-16', NULL, '2023-12-08 19:34:34', '2023-12-08 19:34:34');
INSERT INTO `attendance` VALUES (17, 1, 1, 1, 1, 0, '2023-12-18', NULL, '2023-12-08 19:34:48', '2023-12-08 19:34:48');
INSERT INTO `attendance` VALUES (18, 1, 1, 2, 2, 0, '2023-12-19', NULL, '2023-12-08 19:35:08', '2023-12-08 19:35:08');
INSERT INTO `attendance` VALUES (19, 1, 1, 3, 3, 0, '2023-12-20', NULL, '2023-12-08 19:35:15', '2023-12-08 19:35:15');
INSERT INTO `attendance` VALUES (20, 1, 1, 4, 4, 0, '2023-12-21', NULL, '2023-12-08 19:35:22', '2023-12-08 19:35:22');
INSERT INTO `attendance` VALUES (21, 1, 1, 5, 5, 0, '2023-12-22', NULL, '2023-12-08 19:35:32', '2023-12-08 19:35:32');
INSERT INTO `attendance` VALUES (22, 1, 1, 6, 5, 0, '2023-12-23', NULL, '2023-12-08 19:35:39', '2023-12-08 19:35:39');
INSERT INTO `attendance` VALUES (23, 1, 1, 1, 5, 0, '2023-12-25', NULL, '2023-12-08 19:35:49', '2023-12-08 19:35:49');
INSERT INTO `attendance` VALUES (24, 1, 1, 2, 2, 0, '2023-12-26', NULL, '2023-12-08 19:36:04', '2023-12-08 19:36:04');
INSERT INTO `attendance` VALUES (25, 1, 1, 3, 3, 0, '2023-12-27', NULL, '2023-12-08 19:36:11', '2023-12-08 19:36:11');
INSERT INTO `attendance` VALUES (26, 1, 1, 4, 4, 0, '2023-12-28', NULL, '2023-12-08 19:36:18', '2023-12-08 19:36:18');
INSERT INTO `attendance` VALUES (27, 1, 1, 5, 5, 0, '2023-12-29', NULL, '2023-12-08 19:36:25', '2023-12-08 19:36:25');
INSERT INTO `attendance` VALUES (28, 1, 1, 6, 6, 0, '2023-12-30', NULL, '2023-12-08 19:36:34', '2023-12-08 19:36:34');

-- ----------------------------
-- Table structure for attendance_line
-- ----------------------------
DROP TABLE IF EXISTS `attendance_line`;
CREATE TABLE `attendance_line`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `attendance_id` int NOT NULL,
  `student_id` int NOT NULL,
  `attendance_type_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_line
-- ----------------------------
INSERT INTO `attendance_line` VALUES (1, 1, 1, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (2, 1, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (3, 1, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (4, 1, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (5, 1, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (6, 1, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (7, 1, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (8, 1, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (9, 1, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (10, 1, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (11, 1, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (12, 1, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (13, 1, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (14, 1, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (15, 1, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (16, 1, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (17, 1, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (18, 1, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (19, 1, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (20, 1, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (21, 2, 1, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (22, 2, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (23, 2, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (24, 2, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (25, 2, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (26, 2, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (27, 2, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (28, 2, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (29, 2, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (30, 2, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (31, 2, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (32, 2, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (33, 2, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (34, 2, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (35, 2, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (36, 2, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (37, 2, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (38, 2, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (39, 2, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (40, 2, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (41, 3, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (42, 3, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (43, 3, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (44, 3, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (45, 3, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (46, 3, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (47, 3, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (48, 3, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (49, 3, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (50, 3, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (51, 3, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (52, 3, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (53, 3, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (54, 3, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (55, 3, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (56, 3, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (57, 3, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (58, 3, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (59, 3, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (60, 3, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (61, 4, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (62, 4, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (63, 4, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (64, 4, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (65, 4, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (66, 4, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (67, 4, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (68, 4, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (69, 4, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (70, 4, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (71, 4, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (72, 4, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (73, 4, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (74, 4, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (75, 4, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (76, 4, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (77, 4, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (78, 4, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (79, 4, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (80, 4, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (81, 5, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (82, 5, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (83, 5, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (84, 5, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (85, 5, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (86, 5, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (87, 5, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (88, 5, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (89, 5, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (90, 5, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (91, 5, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (92, 5, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (93, 5, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (94, 5, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (95, 5, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (96, 5, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (97, 5, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (98, 5, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (99, 5, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (100, 5, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (101, 6, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (102, 6, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (103, 6, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (104, 6, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (105, 6, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (106, 6, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (107, 6, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (108, 6, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (109, 6, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (110, 6, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (111, 6, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (112, 6, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (113, 6, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (114, 6, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (115, 6, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (116, 6, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (117, 6, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (118, 6, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (119, 6, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (120, 6, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (121, 7, 1, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (122, 7, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (123, 7, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (124, 7, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (125, 7, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (126, 7, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (127, 7, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (128, 7, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (129, 7, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (130, 7, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (131, 7, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (132, 7, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (133, 7, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (134, 7, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (135, 7, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (136, 7, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (137, 7, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (138, 7, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (139, 7, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (140, 7, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (141, 8, 1, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (142, 8, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (143, 8, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (144, 8, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (145, 8, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (146, 8, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (147, 8, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (148, 8, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (149, 8, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (150, 8, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (151, 8, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (152, 8, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (153, 8, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (154, 8, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (155, 8, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (156, 8, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (157, 8, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (158, 8, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (159, 8, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (160, 8, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (161, 9, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (162, 9, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (163, 9, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (164, 9, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (165, 9, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (166, 9, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (167, 9, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (168, 9, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (169, 9, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (170, 9, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (171, 9, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (172, 9, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (173, 9, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (174, 9, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (175, 9, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (176, 9, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (177, 9, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (178, 9, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (179, 9, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (180, 9, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (181, 10, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (182, 10, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (183, 10, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (184, 10, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (185, 10, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (186, 10, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (187, 10, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (188, 10, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (189, 10, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (190, 10, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (191, 10, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (192, 10, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (193, 10, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (194, 10, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (195, 10, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (196, 10, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (197, 10, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (198, 10, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (199, 10, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (200, 10, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (221, 11, 1, 2, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (222, 11, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (223, 11, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (224, 11, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (225, 11, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (226, 11, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (227, 11, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (228, 11, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (229, 11, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (230, 11, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (231, 11, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (232, 11, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (233, 11, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (234, 11, 14, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (235, 11, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (236, 11, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (237, 11, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (238, 11, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (239, 11, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (240, 11, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (241, 12, 1, 2, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (242, 12, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (243, 12, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (244, 12, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (245, 12, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (246, 12, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (247, 12, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (248, 12, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (249, 12, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (250, 12, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (251, 12, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (252, 12, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (253, 12, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (254, 12, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (255, 12, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (256, 12, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (257, 12, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (258, 12, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (259, 12, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (260, 12, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (261, 13, 1, 3, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (262, 13, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (263, 13, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (264, 13, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (265, 13, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (266, 13, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (267, 13, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (268, 13, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (269, 13, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (270, 13, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (271, 13, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (272, 13, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (273, 13, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (274, 13, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (275, 13, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (276, 13, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (277, 13, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (278, 13, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (279, 13, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (280, 13, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (281, 14, 1, 3, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (282, 14, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (283, 14, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (284, 14, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (285, 14, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (286, 14, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (287, 14, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (288, 14, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (289, 14, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (290, 14, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (291, 14, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (292, 14, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (293, 14, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (294, 14, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (295, 14, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (296, 14, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (297, 14, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (298, 14, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (299, 14, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (300, 14, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (301, 15, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (302, 15, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (303, 15, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (304, 15, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (305, 15, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (306, 15, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (307, 15, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (308, 15, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (309, 15, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (310, 15, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (311, 15, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (312, 15, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (313, 15, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (314, 15, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (315, 15, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (316, 15, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (317, 15, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (318, 15, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (319, 15, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (320, 15, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (321, 16, 1, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (322, 16, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (323, 16, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (324, 16, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (325, 16, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (326, 16, 6, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (327, 16, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (328, 16, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (329, 16, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (330, 16, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (331, 16, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (332, 16, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (333, 16, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (334, 16, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (335, 16, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (336, 16, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (337, 16, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (338, 16, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (339, 16, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (340, 16, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (361, 17, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (362, 17, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (363, 17, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (364, 17, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (365, 17, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (366, 17, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (367, 17, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (368, 17, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (369, 17, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (370, 17, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (371, 17, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (372, 17, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (373, 17, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (374, 17, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (375, 17, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (376, 17, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (377, 17, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (378, 17, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (379, 17, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (380, 17, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (381, 18, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (382, 18, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (383, 18, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (384, 18, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (385, 18, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (386, 18, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (387, 18, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (388, 18, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (389, 18, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (390, 18, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (391, 18, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (392, 18, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (393, 18, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (394, 18, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (395, 18, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (396, 18, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (397, 18, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (398, 18, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (399, 18, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (400, 18, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (401, 19, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (402, 19, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (403, 19, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (404, 19, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (405, 19, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (406, 19, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (407, 19, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (408, 19, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (409, 19, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (410, 19, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (411, 19, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (412, 19, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (413, 19, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (414, 19, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (415, 19, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (416, 19, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (417, 19, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (418, 19, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (419, 19, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (420, 19, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (421, 20, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (422, 20, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (423, 20, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (424, 20, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (425, 20, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (426, 20, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (427, 20, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (428, 20, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (429, 20, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (430, 20, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (431, 20, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (432, 20, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (433, 20, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (434, 20, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (435, 20, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (436, 20, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (437, 20, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (438, 20, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (439, 20, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (440, 20, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (441, 21, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (442, 21, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (443, 21, 3, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (444, 21, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (445, 21, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (446, 21, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (447, 21, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (448, 21, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (449, 21, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (450, 21, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (451, 21, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (452, 21, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (453, 21, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (454, 21, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (455, 21, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (456, 21, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (457, 21, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (458, 21, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (459, 21, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (460, 21, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (461, 22, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (462, 22, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (463, 22, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (464, 22, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (465, 22, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (466, 22, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (467, 22, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (468, 22, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (469, 22, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (470, 22, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (471, 22, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (472, 22, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (473, 22, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (474, 22, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (475, 22, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (476, 22, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (477, 22, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (478, 22, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (479, 22, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (480, 22, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (481, 23, 1, 2, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (482, 23, 2, 2, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (483, 23, 3, 2, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (484, 23, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (485, 23, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (486, 23, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (487, 23, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (488, 23, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (489, 23, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (490, 23, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (491, 23, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (492, 23, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (493, 23, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (494, 23, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (495, 23, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (496, 23, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (497, 23, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (498, 23, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (499, 23, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (500, 23, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (501, 24, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (502, 24, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (503, 24, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (504, 24, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (505, 24, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (506, 24, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (507, 24, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (508, 24, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (509, 24, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (510, 24, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (511, 24, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (512, 24, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (513, 24, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (514, 24, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (515, 24, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (516, 24, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (517, 24, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (518, 24, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (519, 24, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (520, 24, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (521, 25, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (522, 25, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (523, 25, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (524, 25, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (525, 25, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (526, 25, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (527, 25, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (528, 25, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (529, 25, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (530, 25, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (531, 25, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (532, 25, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (533, 25, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (534, 25, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (535, 25, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (536, 25, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (537, 25, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (538, 25, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (539, 25, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (540, 25, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (541, 26, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (542, 26, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (543, 26, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (544, 26, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (545, 26, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (546, 26, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (547, 26, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (548, 26, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (549, 26, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (550, 26, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (551, 26, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (552, 26, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (553, 26, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (554, 26, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (555, 26, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (556, 26, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (557, 26, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (558, 26, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (559, 26, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (560, 26, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (561, 27, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (562, 27, 2, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (563, 27, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (564, 27, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (565, 27, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (566, 27, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (567, 27, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (568, 27, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (569, 27, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (570, 27, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (571, 27, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (572, 27, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (573, 27, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (574, 27, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (575, 27, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (576, 27, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (577, 27, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (578, 27, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (579, 27, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (580, 27, 20, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (581, 28, 1, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (582, 28, 2, 4, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (583, 28, 3, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (584, 28, 4, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (585, 28, 5, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (586, 28, 6, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (587, 28, 7, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (588, 28, 8, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (589, 28, 9, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (590, 28, 10, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (591, 28, 11, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (592, 28, 12, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (593, 28, 13, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (594, 28, 14, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (595, 28, 15, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (596, 28, 16, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (597, 28, 17, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (598, 28, 18, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (599, 28, 19, 1, NULL, NULL, NULL);
INSERT INTO `attendance_line` VALUES (600, 28, 20, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for attendance_type
-- ----------------------------
DROP TABLE IF EXISTS `attendance_type`;
CREATE TABLE `attendance_type`  (
  `attendance_type_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `attendance_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance_sort_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_type
-- ----------------------------
INSERT INTO `attendance_type` VALUES (1, 'វត្តមាន', 'PS', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `attendance_type` VALUES (2, 'ច្បាប់', 'P', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `attendance_type` VALUES (3, 'យឺត', 'AL', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `attendance_type` VALUES (4, 'អវត្តមាន', 'A', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for backup_restore
-- ----------------------------
DROP TABLE IF EXISTS `backup_restore`;
CREATE TABLE `backup_restore`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backup_restore
-- ----------------------------
INSERT INTO `backup_restore` VALUES (1, 'sql', '2023-11-02', 'SMS/2023-11-02-16-20-05.zip', '7.79 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (2, 'sql', '2023-11-02', 'SMS/2023-11-02-16-24-12.zip', '7.79 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (3, 'sql', '2023-11-05', 'SMS/2023-11-05-02-42-00.zip', '8.01 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (4, 'sql', '2023-11-09', 'SMS/2023-11-09-09-16-39.zip', '8.89 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (5, 'sql', '2023-11-10', 'SMS/2023-11-10-01-46-11.zip', '8.96 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (6, 'sql', '2023-11-18', 'SMS/2023-11-18-13-04-19.zip', '8.15 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (7, 'sql', '2023-11-18', 'SMS/2023-11-18-13-10-17.zip', '8.15 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (8, 'sql', '2023-11-18', 'SMS/2023-11-18-13-13-03.zip', '8.15 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (9, 'sql', '2023-11-18', 'SMS/2023-11-18-13-17-51.zip', '8.15 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (10, 'sql', '2023-11-18', 'SMS/2023-11-18-20-59-01.zip', '8.15 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (11, 'sql', '2023-11-21', 'SMS/2023-11-21-13-28-41.zip', '9.68 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (12, 'sql', '2023-11-21', 'SMS/2023-11-21-13-39-54.zip', '9.77 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (13, 'sql', '2023-11-29', 'SMS/2023-11-29-13-10-33.zip', '9.77 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (14, 'sql', '2023-11-29', 'SMS/2023-11-29-16-53-02.zip', '9.93 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (15, 'sql', '2023-12-01', 'SMS/2023-12-01-08-13-58.zip', '9.93 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (16, 'sql', '2023-12-01', 'SMS/2023-12-01-16-53-06.zip', '10.00 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (17, 'sql', '2023-12-01', 'SMS/2023-12-01-22-51-06.zip', '16.06 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (18, 'sql', '2023-12-01', 'SMS/2023-12-01-22-51-44.zip', '16.06 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (19, 'sql', '2023-12-03', 'SMS/2023-12-03-19-59-19.zip', '10.00 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (20, 'sql', '2023-12-04', 'SMS/2023-12-04-16-53-04.zip', '10.44 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (21, 'sql', '2023-12-05', 'SMS/2023-12-05-16-53-11.zip', '10.44 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (22, 'sql', '2023-12-06', 'SMS/2023-12-06-16-53-08.zip', '10.44 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (23, 'sql', '2023-12-07', 'SMS/2023-12-07-16-53-02.zip', '8.23 KB', NULL, NULL, NULL);
INSERT INTO `backup_restore` VALUES (24, 'sql', '2023-12-08', 'SMS/2023-12-08-20-28-39.zip', '24.91 KB', '2023-12-08 21:16:42', NULL, '2023-12-08 21:16:42');
INSERT INTO `backup_restore` VALUES (25, 'sql', '2023-12-08', 'SMS/2023-12-08-20-29-32.zip', '24.91 KB', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_type_id` int NOT NULL,
  `grade_level_id` int NOT NULL,
  `academic_id` int NOT NULL,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '7 A', 1, 1, 1, NULL, NULL, '2023-12-07 23:46:27', '2023-12-07 23:46:27');
INSERT INTO `class` VALUES (2, '8 A', 1, 2, 1, NULL, NULL, '2023-12-07 23:46:44', '2023-12-07 23:46:44');
INSERT INTO `class` VALUES (3, '9 A', 1, 3, 1, NULL, NULL, '2023-12-07 23:46:53', '2023-12-07 23:46:53');
INSERT INTO `class` VALUES (4, '10 A', 1, 4, 1, NULL, NULL, '2023-12-07 23:47:03', '2023-12-07 23:47:03');
INSERT INTO `class` VALUES (5, '11 A', 2, 5, 1, NULL, NULL, '2023-12-07 23:47:12', '2023-12-07 23:47:12');
INSERT INTO `class` VALUES (6, '11 B', 3, 5, 1, NULL, NULL, '2023-12-07 23:47:28', '2023-12-07 23:47:28');
INSERT INTO `class` VALUES (7, '12 A', 2, 6, 1, NULL, NULL, '2023-12-07 23:47:39', '2023-12-07 23:47:39');
INSERT INTO `class` VALUES (8, '12 B', 3, 6, 1, NULL, NULL, '2023-12-07 23:47:52', '2023-12-07 23:47:52');

-- ----------------------------
-- Table structure for class_type
-- ----------------------------
DROP TABLE IF EXISTS `class_type`;
CREATE TABLE `class_type`  (
  `class_type_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`class_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_type
-- ----------------------------
INSERT INTO `class_type` VALUES (1, 'ថ្នាក់ ធម្មតា', 'សម្រាប់ថ្នាក់ទី​៧​,៨,​៩,១០', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `class_type` VALUES (2, 'ថ្នាក់ វិទ្យាសាស្រ្តពិត', 'សម្រាប់ថ្នាក់ទី​១១,១២', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `class_type` VALUES (3, 'ថ្នាក់ វិទ្យាសាស្រ្តសង្គម', 'សម្រាប់ថ្នាក់ទី​១១,១២', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for day
-- ----------------------------
DROP TABLE IF EXISTS `day`;
CREATE TABLE `day`  (
  `day_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `day_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`day_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of day
-- ----------------------------
INSERT INTO `day` VALUES (1, 'ថ្ងៃ ច័ន្ទ', 'Monday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `day` VALUES (2, 'ថ្ងៃ អង្គារ៍', 'Tuesday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `day` VALUES (3, 'ថ្ងៃ ពុធ', 'Wenesday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `day` VALUES (4, 'ថ្ងៃ ព្រហស្បតិ៍', 'Thursday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `day` VALUES (5, 'ថ្ងៃ សុក្រ', 'Friday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `day` VALUES (6, 'ថ្ងៃ សៅរ៍', 'saturday', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender`  (
  `gender_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `gender_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_sort_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_sort_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gender_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES (1, 'ប្រុស', 'Male', 'ប', 'M', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `gender` VALUES (2, 'ស្រី', 'Female', 'ស', 'F', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for grade_level
-- ----------------------------
DROP TABLE IF EXISTS `grade_level`;
CREATE TABLE `grade_level`  (
  `grade_level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade_level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`grade_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_level
-- ----------------------------
INSERT INTO `grade_level` VALUES (1, '7', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `grade_level` VALUES (2, '8', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `grade_level` VALUES (3, '9', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `grade_level` VALUES (4, '10', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `grade_level` VALUES (5, '11', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `grade_level` VALUES (6, '12', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000001_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_11_10_064440_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (6, '2022_11_11_061202_create_upload_files_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_06_15_060929_create_student_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_06_15_062301_create_teacher_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_06_15_062358_create_subject_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_06_15_062603_create_grade_level_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_06_15_062819_create_academic_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_06_15_063049_create_class_type_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_06_15_063230_create_teacher_class_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_06_15_063400_create_student_class_table', 1);
INSERT INTO `migrations` VALUES (15, '2023_06_17_032534_create_schedule_table', 1);
INSERT INTO `migrations` VALUES (16, '2023_06_17_041241_create_day_table', 1);
INSERT INTO `migrations` VALUES (17, '2023_06_17_042647_create_time_table', 1);
INSERT INTO `migrations` VALUES (18, '2023_06_19_055208_create_schedule_line_table', 1);
INSERT INTO `migrations` VALUES (19, '2023_06_30_060805_create_gender_table', 1);
INSERT INTO `migrations` VALUES (20, '2023_06_30_061254_create_class_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_06_30_062223_create_student_status_table', 1);
INSERT INTO `migrations` VALUES (22, '2023_06_30_062331_create_student_role_table', 1);
INSERT INTO `migrations` VALUES (23, '2023_06_30_063123_create_teacher_status_table', 1);
INSERT INTO `migrations` VALUES (24, '2023_06_30_063158_create_teacher_role_table', 1);
INSERT INTO `migrations` VALUES (25, '2023_06_30_064437_create_attendance_table', 1);
INSERT INTO `migrations` VALUES (26, '2023_06_30_064646_create_attendance_line_table', 1);
INSERT INTO `migrations` VALUES (27, '2023_06_30_064752_create_attendance_type_table', 1);
INSERT INTO `migrations` VALUES (28, '2023_06_30_065317_create_score_table', 1);
INSERT INTO `migrations` VALUES (29, '2023_06_30_065608_create_score_line_table', 1);
INSERT INTO `migrations` VALUES (30, '2023_06_30_065834_create_score_type_table', 1);
INSERT INTO `migrations` VALUES (31, '2023_06_30_133411_create_subject_grade_level_table', 1);
INSERT INTO `migrations` VALUES (32, '2023_06_30_133551_create_score_type_academic_table', 1);
INSERT INTO `migrations` VALUES (33, '2023_06_30_133582_create_backup_restore_table', 1);
INSERT INTO `migrations` VALUES (34, '2023_06_30_133582_create_setting_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Models\\User', 4);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Models\\User', 5);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'user-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (2, 'user-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (3, 'user-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (4, 'user-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (5, 'student-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (6, 'student-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (7, 'student-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (8, 'student-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (9, 'teacher-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (10, 'teacher-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (11, 'teacher-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (12, 'teacher-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (13, 'subject-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (14, 'subject-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (15, 'subject-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (16, 'subject-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (17, 'subject-level-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (18, 'subject-level-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (19, 'subject-level-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (20, 'subject-level-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (21, 'class-view', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (22, 'class-create', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (23, 'class-edit', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (24, 'class-delete', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (25, 'class-info', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (26, 'class-info-manage-schedule', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (27, 'class-info-add-teacher', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (28, 'class-info-edit-teacher', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (29, 'class-teacher', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (30, 'class-student', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (31, 'class-student-add', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (32, 'class-student-remove', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (33, 'class-attendance', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (34, 'class-attendance-collect', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (35, 'class-score', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (36, 'class-score-collect', 'web', '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `permissions` VALUES (37, 'exam-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (38, 'exam-create', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (39, 'exam-edit', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (40, 'exam-delete', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (41, 'time-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (42, 'time-create', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (43, 'time-edit', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (44, 'time-delete', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (45, 'academic-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (46, 'academic-create', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (47, 'academic-edit', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (48, 'academic-delete', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (49, 'report-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (50, 'preference-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (51, 'preference-update', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (52, 'backup-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (53, 'backup-create', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (54, 'backup-restore', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (55, 'backup-delete', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (56, 'role-permission-view', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (57, 'role-permission-create', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (58, 'role-permission-edit', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `permissions` VALUES (59, 'role-permission-delete', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\Models\\User', 1, 'devop', '04d04c32c31a32639642bf28039e1b1b3fa44495580b0c0b4d4595bc5f5ef612', '[\"*\"]', '2023-12-09 08:05:37', NULL, '2023-12-08 21:37:49', '2023-12-09 08:05:37');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (1, 3);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (5, 3);
INSERT INTO `role_has_permissions` VALUES (5, 4);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (7, 4);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (9, 3);
INSERT INTO `role_has_permissions` VALUES (9, 4);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (11, 2);
INSERT INTO `role_has_permissions` VALUES (11, 4);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (13, 3);
INSERT INTO `role_has_permissions` VALUES (13, 4);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (15, 2);
INSERT INTO `role_has_permissions` VALUES (15, 4);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (17, 2);
INSERT INTO `role_has_permissions` VALUES (17, 3);
INSERT INTO `role_has_permissions` VALUES (17, 4);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (19, 2);
INSERT INTO `role_has_permissions` VALUES (19, 4);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (21, 2);
INSERT INTO `role_has_permissions` VALUES (21, 3);
INSERT INTO `role_has_permissions` VALUES (21, 4);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (23, 2);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (25, 2);
INSERT INTO `role_has_permissions` VALUES (25, 3);
INSERT INTO `role_has_permissions` VALUES (25, 4);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (26, 2);
INSERT INTO `role_has_permissions` VALUES (26, 4);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (27, 4);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (28, 2);
INSERT INTO `role_has_permissions` VALUES (28, 4);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (29, 2);
INSERT INTO `role_has_permissions` VALUES (29, 3);
INSERT INTO `role_has_permissions` VALUES (29, 4);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (30, 2);
INSERT INTO `role_has_permissions` VALUES (30, 3);
INSERT INTO `role_has_permissions` VALUES (30, 4);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (31, 2);
INSERT INTO `role_has_permissions` VALUES (31, 4);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (32, 2);
INSERT INTO `role_has_permissions` VALUES (32, 4);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (33, 2);
INSERT INTO `role_has_permissions` VALUES (33, 3);
INSERT INTO `role_has_permissions` VALUES (33, 4);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (34, 2);
INSERT INTO `role_has_permissions` VALUES (34, 4);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (35, 2);
INSERT INTO `role_has_permissions` VALUES (35, 3);
INSERT INTO `role_has_permissions` VALUES (35, 4);
INSERT INTO `role_has_permissions` VALUES (36, 1);
INSERT INTO `role_has_permissions` VALUES (36, 2);
INSERT INTO `role_has_permissions` VALUES (36, 4);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (37, 2);
INSERT INTO `role_has_permissions` VALUES (37, 3);
INSERT INTO `role_has_permissions` VALUES (38, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (39, 2);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (41, 1);
INSERT INTO `role_has_permissions` VALUES (41, 2);
INSERT INTO `role_has_permissions` VALUES (41, 3);
INSERT INTO `role_has_permissions` VALUES (42, 1);
INSERT INTO `role_has_permissions` VALUES (43, 1);
INSERT INTO `role_has_permissions` VALUES (43, 2);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (45, 2);
INSERT INTO `role_has_permissions` VALUES (45, 3);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (47, 1);
INSERT INTO `role_has_permissions` VALUES (47, 2);
INSERT INTO `role_has_permissions` VALUES (48, 1);
INSERT INTO `role_has_permissions` VALUES (49, 1);
INSERT INTO `role_has_permissions` VALUES (49, 2);
INSERT INTO `role_has_permissions` VALUES (49, 3);
INSERT INTO `role_has_permissions` VALUES (49, 4);
INSERT INTO `role_has_permissions` VALUES (50, 1);
INSERT INTO `role_has_permissions` VALUES (50, 2);
INSERT INTO `role_has_permissions` VALUES (50, 3);
INSERT INTO `role_has_permissions` VALUES (51, 1);
INSERT INTO `role_has_permissions` VALUES (51, 2);
INSERT INTO `role_has_permissions` VALUES (52, 1);
INSERT INTO `role_has_permissions` VALUES (52, 2);
INSERT INTO `role_has_permissions` VALUES (52, 3);
INSERT INTO `role_has_permissions` VALUES (53, 1);
INSERT INTO `role_has_permissions` VALUES (54, 1);
INSERT INTO `role_has_permissions` VALUES (54, 2);
INSERT INTO `role_has_permissions` VALUES (55, 1);
INSERT INTO `role_has_permissions` VALUES (56, 1);
INSERT INTO `role_has_permissions` VALUES (56, 2);
INSERT INTO `role_has_permissions` VALUES (56, 3);
INSERT INTO `role_has_permissions` VALUES (57, 1);
INSERT INTO `role_has_permissions` VALUES (58, 1);
INSERT INTO `role_has_permissions` VALUES (58, 2);
INSERT INTO `role_has_permissions` VALUES (59, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super-admin', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `roles` VALUES (2, 'role-editor', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `roles` VALUES (3, 'role-viewer', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `roles` VALUES (4, 'teacher', 'web', '2023-12-07 23:41:46', '2023-12-07 23:41:46');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schedule_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, 1, NULL, '2023-12-07 23:46:27', '2023-12-07 23:46:27');
INSERT INTO `schedule` VALUES (2, 2, NULL, '2023-12-07 23:46:44', '2023-12-07 23:46:44');
INSERT INTO `schedule` VALUES (3, 3, NULL, '2023-12-07 23:46:53', '2023-12-07 23:46:53');
INSERT INTO `schedule` VALUES (4, 4, NULL, '2023-12-07 23:47:03', '2023-12-07 23:47:03');
INSERT INTO `schedule` VALUES (5, 5, NULL, '2023-12-07 23:47:12', '2023-12-07 23:47:12');
INSERT INTO `schedule` VALUES (6, 6, NULL, '2023-12-07 23:47:28', '2023-12-07 23:47:28');
INSERT INTO `schedule` VALUES (7, 7, NULL, '2023-12-07 23:47:39', '2023-12-07 23:47:39');
INSERT INTO `schedule` VALUES (8, 8, NULL, '2023-12-07 23:47:52', '2023-12-07 23:47:52');
INSERT INTO `schedule` VALUES (9, 9, NULL, '2023-12-07 23:51:34', '2023-12-07 23:51:34');

-- ----------------------------
-- Table structure for schedule_line
-- ----------------------------
DROP TABLE IF EXISTS `schedule_line`;
CREATE TABLE `schedule_line`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `time_id` int NOT NULL,
  `day_id` int NOT NULL,
  `subject_grade_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_line
-- ----------------------------
INSERT INTO `schedule_line` VALUES (1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (2, 1, 1, 2, 3, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (3, 1, 1, 3, 5, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (4, 1, 1, 4, 7, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (5, 1, 1, 5, 2, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (6, 1, 1, 6, 4, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (7, 1, 2, 1, 1, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (8, 1, 2, 2, 3, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (9, 1, 2, 3, 5, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (10, 1, 2, 4, 7, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (11, 1, 2, 5, 2, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (12, 1, 2, 6, 4, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (13, 1, 3, 1, 2, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (14, 1, 3, 2, 4, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (15, 1, 3, 3, 6, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (16, 1, 3, 4, 1, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (17, 1, 3, 5, 3, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (18, 1, 3, 6, 5, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (19, 1, 4, 1, 2, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (20, 1, 4, 2, 4, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (21, 1, 4, 3, 6, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (22, 1, 4, 4, 1, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (23, 1, 4, 5, 3, NULL, NULL, NULL);
INSERT INTO `schedule_line` VALUES (24, 1, 4, 6, 5, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `score_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `score_type_id` int NOT NULL,
  `subject_grade_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, 1, 1, 1, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (2, 1, 1, 2, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (3, 1, 1, 3, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (4, 1, 1, 4, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (5, 1, 1, 5, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (6, 1, 1, 6, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (7, 1, 1, 7, NULL, '2023-12-08 14:01:44', '2023-12-08 14:01:44');
INSERT INTO `score` VALUES (8, 1, 2, 1, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (9, 1, 2, 2, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (10, 1, 2, 3, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (11, 1, 2, 4, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (12, 1, 2, 5, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (13, 1, 2, 6, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (14, 1, 2, 7, NULL, '2023-12-08 19:40:44', '2023-12-08 19:40:44');
INSERT INTO `score` VALUES (15, 1, 3, 1, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (16, 1, 3, 2, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (17, 1, 3, 3, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (18, 1, 3, 4, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (19, 1, 3, 5, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (20, 1, 3, 6, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (21, 1, 3, 7, NULL, '2023-12-08 19:40:50', '2023-12-08 19:40:50');
INSERT INTO `score` VALUES (22, 1, 4, 1, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (23, 1, 4, 2, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (24, 1, 4, 3, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (25, 1, 4, 4, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (26, 1, 4, 5, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (27, 1, 4, 6, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (28, 1, 4, 7, NULL, '2023-12-08 19:40:56', '2023-12-08 19:40:56');
INSERT INTO `score` VALUES (29, 1, 5, 1, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (30, 1, 5, 2, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (31, 1, 5, 3, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (32, 1, 5, 4, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (33, 1, 5, 5, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (34, 1, 5, 6, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (35, 1, 5, 7, NULL, '2023-12-08 19:41:02', '2023-12-08 19:41:02');
INSERT INTO `score` VALUES (36, 1, 6, 1, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (37, 1, 6, 2, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (38, 1, 6, 3, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (39, 1, 6, 4, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (40, 1, 6, 5, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (41, 1, 6, 6, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (42, 1, 6, 7, NULL, '2023-12-08 19:41:09', '2023-12-08 19:41:09');
INSERT INTO `score` VALUES (43, 1, 7, 1, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (44, 1, 7, 2, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (45, 1, 7, 3, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (46, 1, 7, 4, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (47, 1, 7, 5, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (48, 1, 7, 6, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (49, 1, 7, 7, NULL, '2023-12-08 19:41:16', '2023-12-08 19:41:16');
INSERT INTO `score` VALUES (50, 1, 8, 1, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (51, 1, 8, 2, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (52, 1, 8, 3, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (53, 1, 8, 4, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (54, 1, 8, 5, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (55, 1, 8, 6, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (56, 1, 8, 7, NULL, '2023-12-08 19:41:24', '2023-12-08 19:41:24');
INSERT INTO `score` VALUES (57, 1, 9, 1, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (58, 1, 9, 2, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (59, 1, 9, 3, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (60, 1, 9, 4, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (61, 1, 9, 5, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (62, 1, 9, 6, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (63, 1, 9, 7, NULL, '2023-12-08 19:41:30', '2023-12-08 19:41:30');
INSERT INTO `score` VALUES (64, 1, 10, 1, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (65, 1, 10, 2, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (66, 1, 10, 3, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (67, 1, 10, 4, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (68, 1, 10, 5, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (69, 1, 10, 6, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (70, 1, 10, 7, NULL, '2023-12-08 19:41:36', '2023-12-08 19:41:36');
INSERT INTO `score` VALUES (71, 1, 13, 1, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (72, 1, 13, 2, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (73, 1, 13, 3, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (74, 1, 13, 4, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (75, 1, 13, 5, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (76, 1, 13, 6, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (77, 1, 13, 7, NULL, '2023-12-08 19:41:42', '2023-12-08 19:41:42');
INSERT INTO `score` VALUES (78, 1, 14, 1, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (79, 1, 14, 2, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (80, 1, 14, 3, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (81, 1, 14, 4, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (82, 1, 14, 5, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (83, 1, 14, 6, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');
INSERT INTO `score` VALUES (84, 1, 14, 7, NULL, '2023-12-08 19:41:49', '2023-12-08 19:41:49');

-- ----------------------------
-- Table structure for score_line
-- ----------------------------
DROP TABLE IF EXISTS `score_line`;
CREATE TABLE `score_line`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `score_id` int NOT NULL,
  `student_id` int NOT NULL,
  `mark` decimal(8, 2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_line
-- ----------------------------
INSERT INTO `score_line` VALUES (2801, 1, 1, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2802, 2, 1, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2803, 3, 1, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2804, 4, 1, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2805, 5, 1, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2806, 6, 1, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2807, 7, 1, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2808, 1, 2, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2809, 2, 2, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2810, 3, 2, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2811, 4, 2, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2812, 5, 2, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2813, 6, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2814, 7, 2, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2815, 1, 3, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2816, 2, 3, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2817, 3, 3, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2818, 4, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2819, 5, 3, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2820, 6, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2821, 7, 3, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2822, 1, 4, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2823, 2, 4, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2824, 3, 4, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2825, 4, 4, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2826, 5, 4, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2827, 6, 4, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2828, 7, 4, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2829, 1, 5, 144.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2830, 2, 5, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2831, 3, 5, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2832, 4, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2833, 5, 5, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2834, 6, 5, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2835, 7, 5, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2836, 1, 6, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2837, 2, 6, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2838, 3, 6, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2839, 4, 6, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2840, 5, 6, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2841, 6, 6, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2842, 7, 6, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2843, 1, 7, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2844, 2, 7, 79.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2845, 3, 7, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2846, 4, 7, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2847, 5, 7, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2848, 6, 7, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2849, 7, 7, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2850, 1, 8, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2851, 2, 8, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2852, 3, 8, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2853, 4, 8, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2854, 5, 8, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2855, 6, 8, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2856, 7, 8, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2857, 1, 9, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2858, 2, 9, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2859, 3, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2860, 4, 9, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2861, 5, 9, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2862, 6, 9, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2863, 7, 9, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2864, 1, 10, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2865, 2, 10, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2866, 3, 10, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2867, 4, 10, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2868, 5, 10, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2869, 6, 10, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2870, 7, 10, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2871, 1, 11, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2872, 2, 11, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2873, 3, 11, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2874, 4, 11, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2875, 5, 11, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2876, 6, 11, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2877, 7, 11, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2878, 1, 12, 127.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2879, 2, 12, 144.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2880, 3, 12, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2881, 4, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2882, 5, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2883, 6, 12, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2884, 7, 12, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2885, 1, 13, 146.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2886, 2, 13, 150.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2887, 3, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2888, 4, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2889, 5, 13, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2890, 6, 13, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2891, 7, 13, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2892, 1, 14, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2893, 2, 14, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2894, 3, 14, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2895, 4, 14, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2896, 5, 14, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2897, 6, 14, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2898, 7, 14, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2899, 1, 15, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2900, 2, 15, 150.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2901, 3, 15, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2902, 4, 15, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2903, 5, 15, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2904, 6, 15, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2905, 7, 15, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2906, 1, 16, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2907, 2, 16, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2908, 3, 16, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2909, 4, 16, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2910, 5, 16, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2911, 6, 16, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2912, 7, 16, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2913, 1, 17, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2914, 2, 17, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2915, 3, 17, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2916, 4, 17, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2917, 5, 17, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2918, 6, 17, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2919, 7, 17, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2920, 1, 18, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2921, 2, 18, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2922, 3, 18, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2923, 4, 18, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2924, 5, 18, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2925, 6, 18, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2926, 7, 18, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2927, 1, 19, 92.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2928, 2, 19, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2929, 3, 19, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2930, 4, 19, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2931, 5, 19, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2932, 6, 19, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2933, 7, 19, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2934, 1, 20, 76.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2935, 2, 20, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2936, 3, 20, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2937, 4, 20, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2938, 5, 20, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2939, 6, 20, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (2940, 7, 20, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4271, 8, 1, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4272, 9, 1, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4273, 10, 1, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4274, 11, 1, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4275, 12, 1, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4276, 13, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4277, 14, 1, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4278, 8, 2, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4279, 9, 2, 133.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4280, 10, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4281, 11, 2, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4282, 12, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4283, 13, 2, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4284, 14, 2, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4285, 8, 3, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4286, 9, 3, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4287, 10, 3, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4288, 11, 3, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4289, 12, 3, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4290, 13, 3, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4291, 14, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4292, 8, 4, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4293, 9, 4, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4294, 10, 4, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4295, 11, 4, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4296, 12, 4, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4297, 13, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4298, 14, 4, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4299, 8, 5, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4300, 9, 5, 93.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4301, 10, 5, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4302, 11, 5, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4303, 12, 5, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4304, 13, 5, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4305, 14, 5, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4306, 8, 6, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4307, 9, 6, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4308, 10, 6, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4309, 11, 6, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4310, 12, 6, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4311, 13, 6, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4312, 14, 6, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4313, 8, 7, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4314, 9, 7, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4315, 10, 7, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4316, 11, 7, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4317, 12, 7, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4318, 13, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4319, 14, 7, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4320, 8, 8, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4321, 9, 8, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4322, 10, 8, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4323, 11, 8, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4324, 12, 8, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4325, 13, 8, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4326, 14, 8, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4327, 8, 9, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4328, 9, 9, 126.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4329, 10, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4330, 11, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4331, 12, 9, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4332, 13, 9, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4333, 14, 9, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4334, 8, 10, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4335, 9, 10, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4336, 10, 10, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4337, 11, 10, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4338, 12, 10, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4339, 13, 10, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4340, 14, 10, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4341, 8, 11, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4342, 9, 11, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4343, 10, 11, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4344, 11, 11, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4345, 12, 11, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4346, 13, 11, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4347, 14, 11, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4348, 8, 12, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4349, 9, 12, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4350, 10, 12, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4351, 11, 12, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4352, 12, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4353, 13, 12, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4354, 14, 12, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4355, 8, 13, 95.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4356, 9, 13, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4357, 10, 13, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4358, 11, 13, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4359, 12, 13, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4360, 13, 13, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4361, 14, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4362, 8, 14, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4363, 9, 14, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4364, 10, 14, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4365, 11, 14, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4366, 12, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4367, 13, 14, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4368, 14, 14, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4369, 8, 15, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4370, 9, 15, 93.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4371, 10, 15, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4372, 11, 15, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4373, 12, 15, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4374, 13, 15, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4375, 14, 15, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4376, 8, 16, 94.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4377, 9, 16, 111.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4378, 10, 16, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4379, 11, 16, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4380, 12, 16, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4381, 13, 16, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4382, 14, 16, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4383, 8, 17, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4384, 9, 17, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4385, 10, 17, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4386, 11, 17, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4387, 12, 17, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4388, 13, 17, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4389, 14, 17, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4390, 8, 18, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4391, 9, 18, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4392, 10, 18, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4393, 11, 18, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4394, 12, 18, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4395, 13, 18, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4396, 14, 18, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4397, 8, 19, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4398, 9, 19, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4399, 10, 19, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4400, 11, 19, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4401, 12, 19, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4402, 13, 19, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4403, 14, 19, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4404, 8, 20, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4405, 9, 20, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4406, 10, 20, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4407, 11, 20, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4408, 12, 20, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4409, 13, 20, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (4410, 14, 20, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5741, 15, 1, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5742, 16, 1, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5743, 17, 1, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5744, 18, 1, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5745, 19, 1, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5746, 20, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5747, 21, 1, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5748, 15, 2, 144.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5749, 16, 2, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5750, 17, 2, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5751, 18, 2, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5752, 19, 2, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5753, 20, 2, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5754, 21, 2, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5755, 15, 3, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5756, 16, 3, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5757, 17, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5758, 18, 3, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5759, 19, 3, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5760, 20, 3, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5761, 21, 3, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5762, 15, 4, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5763, 16, 4, 128.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5764, 17, 4, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5765, 18, 4, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5766, 19, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5767, 20, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5768, 21, 4, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5769, 15, 5, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5770, 16, 5, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5771, 17, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5772, 18, 5, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5773, 19, 5, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5774, 20, 5, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5775, 21, 5, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5776, 15, 6, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5777, 16, 6, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5778, 17, 6, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5779, 18, 6, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5780, 19, 6, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5781, 20, 6, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5782, 21, 6, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5783, 15, 7, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5784, 16, 7, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5785, 17, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5786, 18, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5787, 19, 7, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5788, 20, 7, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5789, 21, 7, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5790, 15, 8, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5791, 16, 8, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5792, 17, 8, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5793, 18, 8, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5794, 19, 8, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5795, 20, 8, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5796, 21, 8, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5797, 15, 9, 100.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5798, 16, 9, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5799, 17, 9, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5800, 18, 9, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5801, 19, 9, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5802, 20, 9, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5803, 21, 9, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5804, 15, 10, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5805, 16, 10, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5806, 17, 10, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5807, 18, 10, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5808, 19, 10, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5809, 20, 10, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5810, 21, 10, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5811, 15, 11, 113.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5812, 16, 11, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5813, 17, 11, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5814, 18, 11, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5815, 19, 11, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5816, 20, 11, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5817, 21, 11, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5818, 15, 12, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5819, 16, 12, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5820, 17, 12, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5821, 18, 12, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5822, 19, 12, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5823, 20, 12, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5824, 21, 12, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5825, 15, 13, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5826, 16, 13, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5827, 17, 13, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5828, 18, 13, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5829, 19, 13, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5830, 20, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5831, 21, 13, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5832, 15, 14, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5833, 16, 14, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5834, 17, 14, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5835, 18, 14, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5836, 19, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5837, 20, 14, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5838, 21, 14, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5839, 15, 15, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5840, 16, 15, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5841, 17, 15, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5842, 18, 15, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5843, 19, 15, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5844, 20, 15, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5845, 21, 15, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5846, 15, 16, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5847, 16, 16, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5848, 17, 16, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5849, 18, 16, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5850, 19, 16, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5851, 20, 16, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5852, 21, 16, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5853, 15, 17, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5854, 16, 17, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5855, 17, 17, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5856, 18, 17, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5857, 19, 17, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5858, 20, 17, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5859, 21, 17, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5860, 15, 18, 150.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5861, 16, 18, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5862, 17, 18, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5863, 18, 18, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5864, 19, 18, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5865, 20, 18, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5866, 21, 18, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5867, 15, 19, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5868, 16, 19, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5869, 17, 19, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5870, 18, 19, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5871, 19, 19, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5872, 20, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5873, 21, 19, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5874, 15, 20, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5875, 16, 20, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5876, 17, 20, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5877, 18, 20, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5878, 19, 20, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5879, 20, 20, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (5880, 21, 20, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7211, 22, 1, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7212, 23, 1, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7213, 24, 1, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7214, 25, 1, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7215, 26, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7216, 27, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7217, 28, 1, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7218, 22, 2, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7219, 23, 2, 141.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7220, 24, 2, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7221, 25, 2, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7222, 26, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7223, 27, 2, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7224, 28, 2, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7225, 22, 3, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7226, 23, 3, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7227, 24, 3, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7228, 25, 3, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7229, 26, 3, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7230, 27, 3, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7231, 28, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7232, 22, 4, 101.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7233, 23, 4, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7234, 24, 4, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7235, 25, 4, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7236, 26, 4, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7237, 27, 4, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7238, 28, 4, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7239, 22, 5, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7240, 23, 5, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7241, 24, 5, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7242, 25, 5, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7243, 26, 5, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7244, 27, 5, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7245, 28, 5, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7246, 22, 6, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7247, 23, 6, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7248, 24, 6, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7249, 25, 6, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7250, 26, 6, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7251, 27, 6, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7252, 28, 6, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7253, 22, 7, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7254, 23, 7, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7255, 24, 7, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7256, 25, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7257, 26, 7, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7258, 27, 7, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7259, 28, 7, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7260, 22, 8, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7261, 23, 8, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7262, 24, 8, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7263, 25, 8, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7264, 26, 8, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7265, 27, 8, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7266, 28, 8, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7267, 22, 9, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7268, 23, 9, 113.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7269, 24, 9, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7270, 25, 9, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7271, 26, 9, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7272, 27, 9, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7273, 28, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7274, 22, 10, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7275, 23, 10, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7276, 24, 10, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7277, 25, 10, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7278, 26, 10, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7279, 27, 10, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7280, 28, 10, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7281, 22, 11, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7282, 23, 11, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7283, 24, 11, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7284, 25, 11, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7285, 26, 11, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7286, 27, 11, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7287, 28, 11, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7288, 22, 12, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7289, 23, 12, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7290, 24, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7291, 25, 12, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7292, 26, 12, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7293, 27, 12, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7294, 28, 12, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7295, 22, 13, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7296, 23, 13, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7297, 24, 13, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7298, 25, 13, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7299, 26, 13, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7300, 27, 13, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7301, 28, 13, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7302, 22, 14, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7303, 23, 14, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7304, 24, 14, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7305, 25, 14, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7306, 26, 14, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7307, 27, 14, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7308, 28, 14, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7309, 22, 15, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7310, 23, 15, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7311, 24, 15, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7312, 25, 15, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7313, 26, 15, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7314, 27, 15, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7315, 28, 15, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7316, 22, 16, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7317, 23, 16, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7318, 24, 16, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7319, 25, 16, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7320, 26, 16, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7321, 27, 16, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7322, 28, 16, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7323, 22, 17, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7324, 23, 17, 100.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7325, 24, 17, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7326, 25, 17, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7327, 26, 17, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7328, 27, 17, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7329, 28, 17, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7330, 22, 18, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7331, 23, 18, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7332, 24, 18, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7333, 25, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7334, 26, 18, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7335, 27, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7336, 28, 18, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7337, 22, 19, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7338, 23, 19, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7339, 24, 19, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7340, 25, 19, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7341, 26, 19, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7342, 27, 19, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7343, 28, 19, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7344, 22, 20, 81.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7345, 23, 20, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7346, 24, 20, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7347, 25, 20, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7348, 26, 20, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7349, 27, 20, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (7350, 28, 20, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8681, 29, 1, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8682, 30, 1, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8683, 31, 1, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8684, 32, 1, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8685, 33, 1, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8686, 34, 1, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8687, 35, 1, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8688, 29, 2, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8689, 30, 2, 136.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8690, 31, 2, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8691, 32, 2, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8692, 33, 2, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8693, 34, 2, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8694, 35, 2, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8695, 29, 3, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8696, 30, 3, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8697, 31, 3, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8698, 32, 3, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8699, 33, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8700, 34, 3, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8701, 35, 3, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8702, 29, 4, 128.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8703, 30, 4, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8704, 31, 4, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8705, 32, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8706, 33, 4, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8707, 34, 4, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8708, 35, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8709, 29, 5, 150.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8710, 30, 5, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8711, 31, 5, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8712, 32, 5, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8713, 33, 5, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8714, 34, 5, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8715, 35, 5, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8716, 29, 6, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8717, 30, 6, 106.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8718, 31, 6, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8719, 32, 6, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8720, 33, 6, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8721, 34, 6, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8722, 35, 6, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8723, 29, 7, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8724, 30, 7, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8725, 31, 7, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8726, 32, 7, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8727, 33, 7, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8728, 34, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8729, 35, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8730, 29, 8, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8731, 30, 8, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8732, 31, 8, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8733, 32, 8, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8734, 33, 8, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8735, 34, 8, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8736, 35, 8, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8737, 29, 9, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8738, 30, 9, 95.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8739, 31, 9, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8740, 32, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8741, 33, 9, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8742, 34, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8743, 35, 9, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8744, 29, 10, 76.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8745, 30, 10, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8746, 31, 10, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8747, 32, 10, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8748, 33, 10, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8749, 34, 10, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8750, 35, 10, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8751, 29, 11, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8752, 30, 11, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8753, 31, 11, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8754, 32, 11, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8755, 33, 11, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8756, 34, 11, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8757, 35, 11, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8758, 29, 12, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8759, 30, 12, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8760, 31, 12, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8761, 32, 12, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8762, 33, 12, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8763, 34, 12, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8764, 35, 12, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8765, 29, 13, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8766, 30, 13, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8767, 31, 13, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8768, 32, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8769, 33, 13, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8770, 34, 13, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8771, 35, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8772, 29, 14, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8773, 30, 14, 93.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8774, 31, 14, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8775, 32, 14, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8776, 33, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8777, 34, 14, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8778, 35, 14, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8779, 29, 15, 120.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8780, 30, 15, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8781, 31, 15, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8782, 32, 15, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8783, 33, 15, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8784, 34, 15, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8785, 35, 15, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8786, 29, 16, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8787, 30, 16, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8788, 31, 16, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8789, 32, 16, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8790, 33, 16, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8791, 34, 16, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8792, 35, 16, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8793, 29, 17, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8794, 30, 17, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8795, 31, 17, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8796, 32, 17, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8797, 33, 17, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8798, 34, 17, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8799, 35, 17, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8800, 29, 18, 81.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8801, 30, 18, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8802, 31, 18, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8803, 32, 18, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8804, 33, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8805, 34, 18, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8806, 35, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8807, 29, 19, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8808, 30, 19, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8809, 31, 19, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8810, 32, 19, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8811, 33, 19, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8812, 34, 19, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8813, 35, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8814, 29, 20, 100.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8815, 30, 20, 106.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8816, 31, 20, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8817, 32, 20, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8818, 33, 20, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8819, 34, 20, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (8820, 35, 20, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10151, 36, 1, 128.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10152, 37, 1, 102.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10153, 38, 1, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10154, 39, 1, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10155, 40, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10156, 41, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10157, 42, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10158, 36, 2, 146.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10159, 37, 2, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10160, 38, 2, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10161, 39, 2, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10162, 40, 2, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10163, 41, 2, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10164, 42, 2, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10165, 36, 3, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10166, 37, 3, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10167, 38, 3, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10168, 39, 3, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10169, 40, 3, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10170, 41, 3, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10171, 42, 3, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10172, 36, 4, 136.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10173, 37, 4, 111.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10174, 38, 4, 48.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10175, 39, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10176, 40, 4, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10177, 41, 4, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10178, 42, 4, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10179, 36, 5, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10180, 37, 5, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10181, 38, 5, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10182, 39, 5, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10183, 40, 5, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10184, 41, 5, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10185, 42, 5, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10186, 36, 6, 113.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10187, 37, 6, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10188, 38, 6, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10189, 39, 6, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10190, 40, 6, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10191, 41, 6, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10192, 42, 6, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10193, 36, 7, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10194, 37, 7, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10195, 38, 7, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10196, 39, 7, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10197, 40, 7, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10198, 41, 7, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10199, 42, 7, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10200, 36, 8, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10201, 37, 8, 94.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10202, 38, 8, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10203, 39, 8, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10204, 40, 8, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10205, 41, 8, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10206, 42, 8, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10207, 36, 9, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10208, 37, 9, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10209, 38, 9, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10210, 39, 9, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10211, 40, 9, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10212, 41, 9, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10213, 42, 9, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10214, 36, 10, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10215, 37, 10, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10216, 38, 10, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10217, 39, 10, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10218, 40, 10, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10219, 41, 10, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10220, 42, 10, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10221, 36, 11, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10222, 37, 11, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10223, 38, 11, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10224, 39, 11, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10225, 40, 11, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10226, 41, 11, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10227, 42, 11, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10228, 36, 12, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10229, 37, 12, 105.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10230, 38, 12, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10231, 39, 12, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10232, 40, 12, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10233, 41, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10234, 42, 12, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10235, 36, 13, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10236, 37, 13, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10237, 38, 13, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10238, 39, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10239, 40, 13, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10240, 41, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10241, 42, 13, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10242, 36, 14, 113.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10243, 37, 14, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10244, 38, 14, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10245, 39, 14, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10246, 40, 14, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10247, 41, 14, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10248, 42, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10249, 36, 15, 120.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10250, 37, 15, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10251, 38, 15, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10252, 39, 15, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10253, 40, 15, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10254, 41, 15, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10255, 42, 15, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10256, 36, 16, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10257, 37, 16, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10258, 38, 16, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10259, 39, 16, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10260, 40, 16, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10261, 41, 16, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10262, 42, 16, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10263, 36, 17, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10264, 37, 17, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10265, 38, 17, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10266, 39, 17, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10267, 40, 17, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10268, 41, 17, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10269, 42, 17, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10270, 36, 18, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10271, 37, 18, 126.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10272, 38, 18, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10273, 39, 18, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10274, 40, 18, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10275, 41, 18, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10276, 42, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10277, 36, 19, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10278, 37, 19, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10279, 38, 19, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10280, 39, 19, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10281, 40, 19, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10282, 41, 19, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10283, 42, 19, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10284, 36, 20, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10285, 37, 20, 104.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10286, 38, 20, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10287, 39, 20, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10288, 40, 20, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10289, 41, 20, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (10290, 42, 20, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11621, 43, 1, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11622, 44, 1, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11623, 45, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11624, 46, 1, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11625, 47, 1, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11626, 48, 1, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11627, 49, 1, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11628, 43, 2, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11629, 44, 2, 102.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11630, 45, 2, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11631, 46, 2, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11632, 47, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11633, 48, 2, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11634, 49, 2, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11635, 43, 3, 137.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11636, 44, 3, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11637, 45, 3, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11638, 46, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11639, 47, 3, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11640, 48, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11641, 49, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11642, 43, 4, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11643, 44, 4, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11644, 45, 4, 48.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11645, 46, 4, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11646, 47, 4, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11647, 48, 4, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11648, 49, 4, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11649, 43, 5, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11650, 44, 5, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11651, 45, 5, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11652, 46, 5, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11653, 47, 5, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11654, 48, 5, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11655, 49, 5, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11656, 43, 6, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11657, 44, 6, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11658, 45, 6, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11659, 46, 6, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11660, 47, 6, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11661, 48, 6, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11662, 49, 6, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11663, 43, 7, 126.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11664, 44, 7, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11665, 45, 7, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11666, 46, 7, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11667, 47, 7, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11668, 48, 7, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11669, 49, 7, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11670, 43, 8, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11671, 44, 8, 95.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11672, 45, 8, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11673, 46, 8, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11674, 47, 8, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11675, 48, 8, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11676, 49, 8, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11677, 43, 9, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11678, 44, 9, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11679, 45, 9, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11680, 46, 9, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11681, 47, 9, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11682, 48, 9, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11683, 49, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11684, 43, 10, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11685, 44, 10, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11686, 45, 10, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11687, 46, 10, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11688, 47, 10, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11689, 48, 10, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11690, 49, 10, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11691, 43, 11, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11692, 44, 11, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11693, 45, 11, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11694, 46, 11, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11695, 47, 11, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11696, 48, 11, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11697, 49, 11, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11698, 43, 12, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11699, 44, 12, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11700, 45, 12, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11701, 46, 12, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11702, 47, 12, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11703, 48, 12, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11704, 49, 12, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11705, 43, 13, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11706, 44, 13, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11707, 45, 13, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11708, 46, 13, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11709, 47, 13, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11710, 48, 13, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11711, 49, 13, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11712, 43, 14, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11713, 44, 14, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11714, 45, 14, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11715, 46, 14, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11716, 47, 14, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11717, 48, 14, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11718, 49, 14, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11719, 43, 15, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11720, 44, 15, 137.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11721, 45, 15, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11722, 46, 15, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11723, 47, 15, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11724, 48, 15, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11725, 49, 15, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11726, 43, 16, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11727, 44, 16, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11728, 45, 16, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11729, 46, 16, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11730, 47, 16, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11731, 48, 16, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11732, 49, 16, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11733, 43, 17, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11734, 44, 17, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11735, 45, 17, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11736, 46, 17, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11737, 47, 17, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11738, 48, 17, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11739, 49, 17, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11740, 43, 18, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11741, 44, 18, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11742, 45, 18, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11743, 46, 18, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11744, 47, 18, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11745, 48, 18, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11746, 49, 18, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11747, 43, 19, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11748, 44, 19, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11749, 45, 19, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11750, 46, 19, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11751, 47, 19, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11752, 48, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11753, 49, 19, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11754, 43, 20, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11755, 44, 20, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11756, 45, 20, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11757, 46, 20, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11758, 47, 20, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11759, 48, 20, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (11760, 49, 20, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13091, 50, 1, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13092, 51, 1, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13093, 52, 1, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13094, 53, 1, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13095, 54, 1, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13096, 55, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13097, 56, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13098, 50, 2, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13099, 51, 2, 126.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13100, 52, 2, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13101, 53, 2, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13102, 54, 2, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13103, 55, 2, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13104, 56, 2, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13105, 50, 3, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13106, 51, 3, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13107, 52, 3, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13108, 53, 3, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13109, 54, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13110, 55, 3, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13111, 56, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13112, 50, 4, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13113, 51, 4, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13114, 52, 4, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13115, 53, 4, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13116, 54, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13117, 55, 4, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13118, 56, 4, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13119, 50, 5, 149.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13120, 51, 5, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13121, 52, 5, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13122, 53, 5, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13123, 54, 5, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13124, 55, 5, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13125, 56, 5, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13126, 50, 6, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13127, 51, 6, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13128, 52, 6, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13129, 53, 6, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13130, 54, 6, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13131, 55, 6, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13132, 56, 6, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13133, 50, 7, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13134, 51, 7, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13135, 52, 7, 48.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13136, 53, 7, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13137, 54, 7, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13138, 55, 7, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13139, 56, 7, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13140, 50, 8, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13141, 51, 8, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13142, 52, 8, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13143, 53, 8, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13144, 54, 8, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13145, 55, 8, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13146, 56, 8, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13147, 50, 9, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13148, 51, 9, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13149, 52, 9, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13150, 53, 9, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13151, 54, 9, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13152, 55, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13153, 56, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13154, 50, 10, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13155, 51, 10, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13156, 52, 10, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13157, 53, 10, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13158, 54, 10, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13159, 55, 10, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13160, 56, 10, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13161, 50, 11, 93.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13162, 51, 11, 120.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13163, 52, 11, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13164, 53, 11, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13165, 54, 11, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13166, 55, 11, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13167, 56, 11, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13168, 50, 12, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13169, 51, 12, 127.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13170, 52, 12, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13171, 53, 12, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13172, 54, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13173, 55, 12, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13174, 56, 12, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13175, 50, 13, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13176, 51, 13, 100.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13177, 52, 13, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13178, 53, 13, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13179, 54, 13, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13180, 55, 13, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13181, 56, 13, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13182, 50, 14, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13183, 51, 14, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13184, 52, 14, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13185, 53, 14, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13186, 54, 14, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13187, 55, 14, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13188, 56, 14, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13189, 50, 15, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13190, 51, 15, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13191, 52, 15, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13192, 53, 15, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13193, 54, 15, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13194, 55, 15, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13195, 56, 15, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13196, 50, 16, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13197, 51, 16, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13198, 52, 16, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13199, 53, 16, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13200, 54, 16, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13201, 55, 16, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13202, 56, 16, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13203, 50, 17, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13204, 51, 17, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13205, 52, 17, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13206, 53, 17, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13207, 54, 17, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13208, 55, 17, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13209, 56, 17, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13210, 50, 18, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13211, 51, 18, 128.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13212, 52, 18, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13213, 53, 18, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13214, 54, 18, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13215, 55, 18, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13216, 56, 18, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13217, 50, 19, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13218, 51, 19, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13219, 52, 19, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13220, 53, 19, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13221, 54, 19, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13222, 55, 19, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13223, 56, 19, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13224, 50, 20, 136.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13225, 51, 20, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13226, 52, 20, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13227, 53, 20, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13228, 54, 20, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13229, 55, 20, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (13230, 56, 20, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14561, 57, 1, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14562, 58, 1, 137.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14563, 59, 1, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14564, 60, 1, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14565, 61, 1, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14566, 62, 1, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14567, 63, 1, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14568, 57, 2, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14569, 58, 2, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14570, 59, 2, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14571, 60, 2, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14572, 61, 2, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14573, 62, 2, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14574, 63, 2, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14575, 57, 3, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14576, 58, 3, 88.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14577, 59, 3, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14578, 60, 3, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14579, 61, 3, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14580, 62, 3, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14581, 63, 3, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14582, 57, 4, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14583, 58, 4, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14584, 59, 4, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14585, 60, 4, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14586, 61, 4, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14587, 62, 4, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14588, 63, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14589, 57, 5, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14590, 58, 5, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14591, 59, 5, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14592, 60, 5, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14593, 61, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14594, 62, 5, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14595, 63, 5, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14596, 57, 6, 108.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14597, 58, 6, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14598, 59, 6, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14599, 60, 6, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14600, 61, 6, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14601, 62, 6, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14602, 63, 6, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14603, 57, 7, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14604, 58, 7, 111.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14605, 59, 7, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14606, 60, 7, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14607, 61, 7, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14608, 62, 7, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14609, 63, 7, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14610, 57, 8, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14611, 58, 8, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14612, 59, 8, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14613, 60, 8, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14614, 61, 8, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14615, 62, 8, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14616, 63, 8, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14617, 57, 9, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14618, 58, 9, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14619, 59, 9, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14620, 60, 9, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14621, 61, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14622, 62, 9, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14623, 63, 9, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14624, 57, 10, 146.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14625, 58, 10, 110.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14626, 59, 10, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14627, 60, 10, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14628, 61, 10, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14629, 62, 10, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14630, 63, 10, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14631, 57, 11, 148.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14632, 58, 11, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14633, 59, 11, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14634, 60, 11, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14635, 61, 11, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14636, 62, 11, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14637, 63, 11, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14638, 57, 12, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14639, 58, 12, 127.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14640, 59, 12, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14641, 60, 12, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14642, 61, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14643, 62, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14644, 63, 12, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14645, 57, 13, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14646, 58, 13, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14647, 59, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14648, 60, 13, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14649, 61, 13, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14650, 62, 13, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14651, 63, 13, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14652, 57, 14, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14653, 58, 14, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14654, 59, 14, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14655, 60, 14, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14656, 61, 14, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14657, 62, 14, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14658, 63, 14, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14659, 57, 15, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14660, 58, 15, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14661, 59, 15, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14662, 60, 15, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14663, 61, 15, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14664, 62, 15, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14665, 63, 15, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14666, 57, 16, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14667, 58, 16, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14668, 59, 16, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14669, 60, 16, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14670, 61, 16, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14671, 62, 16, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14672, 63, 16, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14673, 57, 17, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14674, 58, 17, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14675, 59, 17, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14676, 60, 17, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14677, 61, 17, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14678, 62, 17, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14679, 63, 17, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14680, 57, 18, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14681, 58, 18, 146.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14682, 59, 18, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14683, 60, 18, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14684, 61, 18, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14685, 62, 18, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14686, 63, 18, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14687, 57, 19, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14688, 58, 19, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14689, 59, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14690, 60, 19, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14691, 61, 19, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14692, 62, 19, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14693, 63, 19, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14694, 57, 20, 136.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14695, 58, 20, 144.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14696, 59, 20, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14697, 60, 20, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14698, 61, 20, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14699, 62, 20, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (14700, 63, 20, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16031, 64, 1, 125.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16032, 65, 1, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16033, 66, 1, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16034, 67, 1, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16035, 68, 1, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16036, 69, 1, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16037, 70, 1, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16038, 64, 2, 129.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16039, 65, 2, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16040, 66, 2, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16041, 67, 2, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16042, 68, 2, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16043, 69, 2, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16044, 70, 2, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16045, 64, 3, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16046, 65, 3, 101.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16047, 66, 3, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16048, 67, 3, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16049, 68, 3, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16050, 69, 3, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16051, 70, 3, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16052, 64, 4, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16053, 65, 4, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16054, 66, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16055, 67, 4, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16056, 68, 4, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16057, 69, 4, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16058, 70, 4, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16059, 64, 5, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16060, 65, 5, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16061, 66, 5, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16062, 67, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16063, 68, 5, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16064, 69, 5, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16065, 70, 5, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16066, 64, 6, 107.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16067, 65, 6, 79.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16068, 66, 6, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16069, 67, 6, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16070, 68, 6, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16071, 69, 6, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16072, 70, 6, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16073, 64, 7, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16074, 65, 7, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16075, 66, 7, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16076, 67, 7, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16077, 68, 7, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16078, 69, 7, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16079, 70, 7, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16080, 64, 8, 120.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16081, 65, 8, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16082, 66, 8, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16083, 67, 8, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16084, 68, 8, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16085, 69, 8, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16086, 70, 8, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16087, 64, 9, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16088, 65, 9, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16089, 66, 9, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16090, 67, 9, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16091, 68, 9, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16092, 69, 9, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16093, 70, 9, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16094, 64, 10, 130.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16095, 65, 10, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16096, 66, 10, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16097, 67, 10, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16098, 68, 10, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16099, 69, 10, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16100, 70, 10, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16101, 64, 11, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16102, 65, 11, 76.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16103, 66, 11, 48.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16104, 67, 11, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16105, 68, 11, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16106, 69, 11, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16107, 70, 11, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16108, 64, 12, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16109, 65, 12, 101.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16110, 66, 12, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16111, 67, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16112, 68, 12, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16113, 69, 12, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16114, 70, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16115, 64, 13, 128.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16116, 65, 13, 77.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16117, 66, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16118, 67, 13, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16119, 68, 13, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16120, 69, 13, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16121, 70, 13, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16122, 64, 14, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16123, 65, 14, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16124, 66, 14, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16125, 67, 14, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16126, 68, 14, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16127, 69, 14, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16128, 70, 14, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16129, 64, 15, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16130, 65, 15, 133.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16131, 66, 15, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16132, 67, 15, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16133, 68, 15, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16134, 69, 15, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16135, 70, 15, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16136, 64, 16, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16137, 65, 16, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16138, 66, 16, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16139, 67, 16, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16140, 68, 16, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16141, 69, 16, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16142, 70, 16, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16143, 64, 17, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16144, 65, 17, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16145, 66, 17, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16146, 67, 17, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16147, 68, 17, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16148, 69, 17, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16149, 70, 17, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16150, 64, 18, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16151, 65, 18, 118.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16152, 66, 18, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16153, 67, 18, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16154, 68, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16155, 69, 18, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16156, 70, 18, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16157, 64, 19, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16158, 65, 19, 136.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16159, 66, 19, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16160, 67, 19, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16161, 68, 19, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16162, 69, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16163, 70, 19, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16164, 64, 20, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16165, 65, 20, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16166, 66, 20, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16167, 67, 20, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16168, 68, 20, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16169, 69, 20, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (16170, 70, 20, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17501, 71, 1, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17502, 72, 1, 140.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17503, 73, 1, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17504, 74, 1, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17505, 75, 1, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17506, 76, 1, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17507, 77, 1, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17508, 71, 2, 81.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17509, 72, 2, 146.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17510, 73, 2, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17511, 74, 2, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17512, 75, 2, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17513, 76, 2, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17514, 77, 2, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17515, 71, 3, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17516, 72, 3, 83.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17517, 73, 3, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17518, 74, 3, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17519, 75, 3, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17520, 76, 3, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17521, 77, 3, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17522, 71, 4, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17523, 72, 4, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17524, 73, 4, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17525, 74, 4, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17526, 75, 4, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17527, 76, 4, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17528, 77, 4, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17529, 71, 5, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17530, 72, 5, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17531, 73, 5, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17532, 74, 5, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17533, 75, 5, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17534, 76, 5, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17535, 77, 5, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17536, 71, 6, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17537, 72, 6, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17538, 73, 6, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17539, 74, 6, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17540, 75, 6, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17541, 76, 6, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17542, 77, 6, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17543, 71, 7, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17544, 72, 7, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17545, 73, 7, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17546, 74, 7, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17547, 75, 7, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17548, 76, 7, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17549, 77, 7, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17550, 71, 8, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17551, 72, 8, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17552, 73, 8, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17553, 74, 8, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17554, 75, 8, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17555, 76, 8, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17556, 77, 8, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17557, 71, 9, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17558, 72, 9, 124.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17559, 73, 9, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17560, 74, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17561, 75, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17562, 76, 9, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17563, 77, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17564, 71, 10, 145.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17565, 72, 10, 104.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17566, 73, 10, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17567, 74, 10, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17568, 75, 10, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17569, 76, 10, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17570, 77, 10, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17571, 71, 11, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17572, 72, 11, 117.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17573, 73, 11, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17574, 74, 11, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17575, 75, 11, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17576, 76, 11, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17577, 77, 11, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17578, 71, 12, 86.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17579, 72, 12, 99.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17580, 73, 12, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17581, 74, 12, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17582, 75, 12, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17583, 76, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17584, 77, 12, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17585, 71, 13, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17586, 72, 13, 138.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17587, 73, 13, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17588, 74, 13, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17589, 75, 13, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17590, 76, 13, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17591, 77, 13, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17592, 71, 14, 141.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17593, 72, 14, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17594, 73, 14, 41.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17595, 74, 14, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17596, 75, 14, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17597, 76, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17598, 77, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17599, 71, 15, 103.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17600, 72, 15, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17601, 73, 15, 39.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17602, 74, 15, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17603, 75, 15, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17604, 76, 15, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17605, 77, 15, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17606, 71, 16, 131.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17607, 72, 16, 78.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17608, 73, 16, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17609, 74, 16, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17610, 75, 16, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17611, 76, 16, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17612, 77, 16, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17613, 71, 17, 96.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17614, 72, 17, 112.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17615, 73, 17, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17616, 74, 17, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17617, 75, 17, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17618, 76, 17, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17619, 77, 17, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17620, 71, 18, 137.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17621, 72, 18, 89.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17622, 73, 18, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17623, 74, 18, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17624, 75, 18, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17625, 76, 18, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17626, 77, 18, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17627, 71, 19, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17628, 72, 19, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17629, 73, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17630, 74, 19, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17631, 75, 19, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17632, 76, 19, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17633, 77, 19, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17634, 71, 20, 93.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17635, 72, 20, 80.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17636, 73, 20, 49.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17637, 74, 20, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17638, 75, 20, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17639, 76, 20, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (17640, 77, 20, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18971, 78, 1, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18972, 79, 1, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18973, 80, 1, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18974, 81, 1, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18975, 82, 1, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18976, 83, 1, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18977, 84, 1, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18978, 78, 2, 127.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18979, 79, 2, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18980, 80, 2, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18981, 81, 2, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18982, 82, 2, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18983, 83, 2, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18984, 84, 2, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18985, 78, 3, 90.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18986, 79, 3, 102.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18987, 80, 3, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18988, 81, 3, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18989, 82, 3, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18990, 83, 3, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18991, 84, 3, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18992, 78, 4, 147.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18993, 79, 4, 109.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18994, 80, 4, 46.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18995, 81, 4, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18996, 82, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18997, 83, 4, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18998, 84, 4, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (18999, 78, 5, 139.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19000, 79, 5, 132.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19001, 80, 5, 50.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19002, 81, 5, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19003, 82, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19004, 83, 5, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19005, 84, 5, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19006, 78, 6, 91.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19007, 79, 6, 119.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19008, 80, 6, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19009, 81, 6, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19010, 82, 6, 25.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19011, 83, 6, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19012, 84, 6, 28.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19013, 78, 7, 98.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19014, 79, 7, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19015, 80, 7, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19016, 81, 7, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19017, 82, 7, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19018, 83, 7, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19019, 84, 7, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19020, 78, 8, 104.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19021, 79, 8, 85.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19022, 80, 8, 44.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19023, 81, 8, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19024, 82, 8, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19025, 83, 8, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19026, 84, 8, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19027, 78, 9, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19028, 79, 9, 84.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19029, 80, 9, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19030, 81, 9, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19031, 82, 9, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19032, 83, 9, 27.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19033, 84, 9, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19034, 78, 10, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19035, 79, 10, 97.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19036, 80, 10, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19037, 81, 10, 22.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19038, 82, 10, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19039, 83, 10, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19040, 84, 10, 18.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19041, 78, 11, 116.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19042, 79, 11, 94.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19043, 80, 11, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19044, 81, 11, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19045, 82, 11, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19046, 83, 11, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19047, 84, 11, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19048, 78, 12, 122.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19049, 79, 12, 81.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19050, 80, 12, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19051, 81, 12, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19052, 82, 12, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19053, 83, 12, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19054, 84, 12, 23.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19055, 78, 13, 115.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19056, 79, 13, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19057, 80, 13, 40.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19058, 81, 13, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19059, 82, 13, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19060, 83, 13, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19061, 84, 13, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19062, 78, 14, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19063, 79, 14, 142.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19064, 80, 14, 43.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19065, 81, 14, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19066, 82, 14, 21.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19067, 83, 14, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19068, 84, 14, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19069, 78, 15, 82.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19070, 79, 15, 114.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19071, 80, 15, 42.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19072, 81, 15, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19073, 82, 15, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19074, 83, 15, 17.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19075, 84, 15, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19076, 78, 16, 121.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19077, 79, 16, 102.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19078, 80, 16, 45.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19079, 81, 16, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19080, 82, 16, 34.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19081, 83, 16, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19082, 84, 16, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19083, 78, 17, 123.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19084, 79, 17, 143.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19085, 80, 17, 30.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19086, 81, 17, 37.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19087, 82, 17, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19088, 83, 17, 29.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19089, 84, 17, 38.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19090, 78, 18, 87.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19091, 79, 18, 134.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19092, 80, 18, 31.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19093, 81, 18, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19094, 82, 18, 24.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19095, 83, 18, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19096, 84, 18, 32.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19097, 78, 19, 75.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19098, 79, 19, 135.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19099, 80, 19, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19100, 81, 19, 33.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19101, 82, 19, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19102, 83, 19, 26.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19103, 84, 19, 20.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19104, 78, 20, 95.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19105, 79, 20, 94.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19106, 80, 20, 47.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19107, 81, 20, 19.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19108, 82, 20, 35.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19109, 83, 20, 36.00, NULL, NULL, NULL);
INSERT INTO `score_line` VALUES (19110, 84, 20, 33.00, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for score_type
-- ----------------------------
DROP TABLE IF EXISTS `score_type`;
CREATE TABLE `score_type`  (
  `score_type_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`score_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_type
-- ----------------------------
INSERT INTO `score_type` VALUES (1, 'ប្រឡងប្រចាំខែមករា', '2023-01-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (2, 'ប្រឡងប្រចាំខែកុម្ភៈ', '2023-02-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (3, 'ប្រឡងប្រចាំខែមីនា', '2023-03-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (4, 'ប្រឡងប្រចាំខែមេសា', '2023-04-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (5, 'ប្រឡងប្រចាំខែឧសភា', '2023-05-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (6, 'ប្រឡងប្រចាំខែមិថុនា', '2023-06-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (7, 'ប្រឡងប្រចាំខែកក្កដា', '2023-07-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (8, 'ប្រឡងប្រចាំខែសីហា', '2023-08-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (9, 'ប្រឡងប្រចាំខែកញ្ញា', '2023-09-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (10, 'ប្រឡងប្រចាំខែតុលា', '2023-10-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (11, 'ប្រឡងប្រចាំខែវិច្ចិកា', '2023-11-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (12, 'ប្រឡងប្រចាំខែធ្នូ', '2023-12-01', 1, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (13, 'ប្រឡងប្រចាំឆមាសទី១', '0000-00-00', 2, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (14, 'ប្រឡងប្រចាំឆមាសទី២', '0000-00-00', 2, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (15, 'ប្រចាំឆមាសទី១', '0000-00-00', 3, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (16, 'ប្រចាំឆមាសទី២', '0000-00-00', 3, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type` VALUES (17, 'ប្រចាំឆ្នាំ', '0000-00-00', 4, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for score_type_academic
-- ----------------------------
DROP TABLE IF EXISTS `score_type_academic`;
CREATE TABLE `score_type_academic`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `academic_id` int NOT NULL,
  `under_score_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_type_academic
-- ----------------------------
INSERT INTO `score_type_academic` VALUES (1, 1, '1,2,3,4,5,13', '15', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `score_type_academic` VALUES (2, 1, '6,7,8,9,10,14', '16', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `backup_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `backup_time` time NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'វិទ្យាល័យចំណេះទូទៅនិងបច្ចេកទេសពួក', '', '', 'សាលារៀនវិទ្យាល័យចំណេះទូទៅ និងបច្ចេកទេសពួក ដែលមានទីតាំងស្ថិតនៅ    ភូមិប្រយុទ្ធ ឃុំពួក ស្រុកពួក ខេត្តសៀមរាប', '', '1', '12:00:00', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `file_upload_id` int NULL DEFAULT NULL,
  `gender_id` int NULL DEFAULT NULL,
  `status_id` int NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `place_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_secondary_high_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `secondary_exam_date` date NULL DEFAULT NULL,
  `secondary_exam_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `secondary_exam_room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `secondary_exam_desk` int NULL DEFAULT NULL,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'PK-S0001', 'សិន​', 'មាលា', 'សិន​ មាលា', 'sin', 'Melea', 'sin Melea', '2003-01-01', 11, 1, 1, '08765432345', 'melea@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (2, 'PK-S0002', 'ភីម', 'សាមី', 'ភីម សាមី', 'Phim', 'Samiii', 'Phim Samiii', '2003-01-01', 12, 2, 1, '03951706824', 'Samiii@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (3, 'PK-S0002', 'ផន', 'វិហាប់​', 'ផន វិហាប់​', 'Porn', 'Vihab', 'Porn Vihab', '2003-01-01', 13, 1, 1, '02187653094', 'hab@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (4, 'PK-S0003', 'វីរះ', 'ច័ន្ទណាវី', 'វីរះ ច័ន្ទណាវី', 'Vireak', 'Chann navy', 'Vireak Chann navy', '2003-01-01', 14, 2, 1, '08742053169', 'navy@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (5, 'PK-S0004', 'ភូមិ', 'មាស', 'ភូមិ មាស', 'Phom', 'Meas', 'Phom Meas', '2003-01-01', 15, 1, 1, '06309251784', 'meas@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (6, 'PK-S0005', 'សៀវ ', 'ស្រីណែត', 'សៀវ ស្រីណែត', 'Siev', 'Sreyneath', 'Siev Sreyneath', '2003-01-01', 16, 2, 1, '04956873210', 'neath@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (7, 'PK-S0006', 'ម៉ាប់ ', 'ពិរុណ', 'ម៉ាប់ ពិរុណ', 'Mab', 'Piron', 'Mab Piron', '2003-01-01', 17, 1, 1, '07132485096', 'piron@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (8, 'PK-S0007', 'ឡាយ ', 'សារឿន', 'ឡាយ សារឿន', 'Lay', 'Saroeun', 'Lay Saroeun', '2003-01-01', 18, 1, 1, '08294761053', 'roeun@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (9, 'PK-S0008', 'លំអង', 'ឡុង', 'លំអង ឡុង', 'Lomong', 'Long', 'Lomong Long', '2003-01-01', 19, 1, 1, '05601928374', 'Long@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (10, 'PK-S0009', 'ឯក', 'សារិទ្ធ', 'ឯក សារិទ្ធ', 'Ek', 'Sarith', 'Ek Sarith', '2003-01-01', 20, 1, 1, '03872405169', 'Sarith@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (11, 'PK-S0010', 'សោន', 'សៀវផាច', 'សោន សៀវផាច', 'san', 'sievpatch', 'san sievpatch', '2003-01-01', NULL, 2, 1, '01246357890', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (12, 'PK-S0011', 'មាស', 'ឆាយ៉ា', 'មាស ឆាយ៉ា', 'Meas', 'Chariya', 'Meas Chariya', '2003-01-01', NULL, 1, 1, '09052746183', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (13, 'PK-S0012', 'ផុន', 'រិតសាក', 'ផុន រិតសាក', 'Phon', 'Rithisak', 'Phon Rithisak', '2003-01-01', NULL, 1, 1, '06798154320', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (14, 'PK-S0013', 'អុក', 'សារីន', 'អុក សារីន', 'Ok', 'Samrin', 'Ok Samrin', '2003-01-01', NULL, 1, 1, '03184592067', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (15, 'PK-S0014', 'ហេង', 'បូណា', 'ហេង បូណា', 'Heang', 'Bona', 'Heang Bona', '2003-01-01', NULL, 1, 1, '05426873019', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (16, 'PK-S0014', 'មាស', 'ឆាយ៉ា', 'អីវ ដារានី', 'Iv', 'Darany', 'Iv Darany', '2003-01-01', NULL, 2, 1, '07652301984', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (17, 'PK-S0016', 'នោន', 'សុធារិត', 'នោន សុធារិត', 'Nourn', 'Sotearith', 'Nourn Sotearith', '2003-01-01', NULL, 1, 1, '01406975283', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (18, 'PK-S0017', 'មាស', 'ឆាយ៉ា', 'សង់ ចក្រា', 'Song', 'Chakra', 'Song Chakra', '2003-01-01', NULL, 1, 1, '09823470156', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (19, 'PK-S0018', 'ចិន', 'រតនា', 'ចិន រតនា', 'Chin', 'Rotha', 'Chin Rotha', '2003-01-01', NULL, 1, 1, '03562081974', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (20, 'PK-S0019', 'សាន', 'ភក្ដី', 'សាន ភក្ដី', 'San', 'Pheakkley', 'San Pheakkley', '2003-01-01', NULL, 2, 1, '08740563219', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (21, 'PK-S0020', 'រស់', 'ដាវី', 'រស់ ដាវី', 'Rous', 'Daevy', 'Rous Daevy', '2003-01-01', NULL, 2, 1, '06198342750', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (22, 'PK-S0021', 'សម', 'វាសនា', 'សម វាសនា', 'Som', 'Veasna', 'Som Veasna', '2003-01-01', NULL, 1, 1, '05032167894', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (23, 'PK-S0022', 'សៀង', 'សុជាតិ', 'សៀង សុជាតិ', 'Sieng', 'Socheat', 'Sieng Socheat', '2003-01-01', NULL, 2, 1, '02918475036', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (24, 'PK-S0023', 'ម៉េង', 'សុរិយា', 'ម៉េង សុរិយា', 'Meng', 'Sorya', 'Meng Sorya', '2003-01-01', NULL, 2, 1, '04289056137', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student` VALUES (25, 'PK-S0024', 'ឈៀន', 'រំចង់', 'ឈៀន រំចង់', 'Choem', 'Roumjong', 'Choem Roumjong', '2003-01-01', NULL, 1, 1, '07650321984', 'Davann@gmail.com', 'siem reap', 'siem reap', NULL, NULL, NULL, NULL, NULL, '', '2023-12-08 21:14:58', '2023-12-07 23:41:47', '2023-12-08 21:14:58');

-- ----------------------------
-- Table structure for student_class
-- ----------------------------
DROP TABLE IF EXISTS `student_class`;
CREATE TABLE `student_class`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `from_class_id` int NOT NULL,
  `is_duplicate` tinyint(1) NOT NULL,
  `role_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_class
-- ----------------------------
INSERT INTO `student_class` VALUES (1, 1, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (2, 2, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (3, 3, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (4, 4, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (5, 5, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (6, 6, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (7, 7, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (8, 8, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (9, 9, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (10, 10, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (11, 11, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (12, 12, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (13, 13, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (14, 14, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (15, 15, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (16, 16, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (17, 17, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (18, 18, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (19, 19, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (20, 20, 1, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (21, 21, 5, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (22, 22, 5, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (23, 23, 5, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `student_class` VALUES (24, 24, 8, 0, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for student_role
-- ----------------------------
DROP TABLE IF EXISTS `student_role`;
CREATE TABLE `student_role`  (
  `role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_role
-- ----------------------------
INSERT INTO `student_role` VALUES (1, 'ប្រធាន', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student_role` VALUES (2, 'អនុប្រធាន', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student_role` VALUES (3, 'សមាជិក', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for student_status
-- ----------------------------
DROP TABLE IF EXISTS `student_status`;
CREATE TABLE `student_status`  (
  `status_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_status
-- ----------------------------
INSERT INTO `student_status` VALUES (1, 'កំពុងសិក្សា', 'Studying', '#84cc16', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `student_status` VALUES (2, 'បានឈប់', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `subject_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_sort_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'ភាសាខ្មែរ', 'Khmer', 'K', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (2, 'គណិតវិទ្យា', 'Math', 'M', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (3, 'រូបវិទ្យា', 'Physic', 'P', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (4, 'គីមីវិទ្យា', 'Chimistery', 'C', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (5, 'ជីវះវិទ្យា', 'Biology', 'B', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (6, 'ភូមិវិទ្យា', 'Giography', 'G', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject` VALUES (7, 'ប្រវត្តិវិទ្យា', 'History', 'H', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for subject_grade_level
-- ----------------------------
DROP TABLE IF EXISTS `subject_grade_level`;
CREATE TABLE `subject_grade_level`  (
  `subject_grade_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `grade_level_id` int NOT NULL,
  `class_type_id` int NOT NULL,
  `full_score` decimal(8, 2) NOT NULL,
  `divide` decimal(8, 2) NOT NULL,
  `average` decimal(8, 2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`subject_grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject_grade_level
-- ----------------------------
INSERT INTO `subject_grade_level` VALUES (1, 1, 1, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (2, 2, 1, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (3, 3, 1, 1, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (4, 4, 1, 1, 37.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (5, 5, 1, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (6, 6, 1, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (7, 7, 1, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (8, 1, 2, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (9, 2, 2, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (10, 3, 2, 1, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (11, 4, 2, 1, 37.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (12, 5, 2, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (13, 6, 2, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (14, 7, 2, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (15, 1, 3, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (16, 2, 3, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (17, 3, 3, 1, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (18, 4, 3, 1, 37.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (19, 5, 3, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (20, 6, 3, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (21, 7, 3, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (22, 1, 4, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (23, 2, 4, 1, 150.00, 3.00, 75.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (24, 3, 4, 1, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (25, 4, 4, 1, 37.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (26, 5, 4, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (27, 6, 4, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (28, 7, 4, 1, 38.00, 0.75, 17.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (29, 1, 5, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (30, 2, 5, 2, 125.00, 2.50, 62.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (31, 3, 5, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (32, 4, 5, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (33, 5, 5, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (34, 6, 5, 2, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (35, 7, 5, 2, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (36, 1, 5, 3, 125.00, 2.50, 62.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (37, 2, 5, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (38, 3, 5, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (39, 4, 5, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (40, 5, 5, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (41, 6, 5, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (42, 7, 5, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (43, 1, 6, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (44, 2, 6, 2, 125.00, 2.50, 62.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (45, 3, 6, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (46, 4, 6, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (47, 5, 6, 2, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (48, 6, 6, 2, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (49, 7, 6, 2, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (50, 1, 6, 3, 125.00, 2.50, 62.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (51, 2, 6, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (52, 3, 6, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (53, 4, 6, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (54, 5, 6, 3, 50.00, 1.00, 25.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (55, 6, 6, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `subject_grade_level` VALUES (56, 7, 6, 3, 75.00, 1.50, 37.00, NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender_id` int NOT NULL,
  `teacher_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `profession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `join_date` date NULL DEFAULT NULL,
  `place_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_id` int NULL DEFAULT NULL,
  `file_upload_id` int NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_enable_account` tinyint(1) NOT NULL DEFAULT 0,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'PK-T0002', 'វាន់', 'ស៊ីវម៉ី', 'វាន់ ស៊ីវម៉ី', 'Van', 'Sivmey', 'Van Sivmey', '2003-01-07', 1, '2', '1', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 1, '07428501963', 'sivmey@gmail.com', 1, '', NULL, '2023-12-07 23:41:47', '2023-12-08 00:07:32');
INSERT INTO `teacher` VALUES (2, 'PK-T0003', 'សុខ សាន្ត វណ្ណា', 'វណ្ណា', 'សុខ សាន្ត វណ្ណា', 'sok san', 'vana', 'vana sok san', '2003-01-07', 2, '2', '2', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 2, '05098346271', 'soksan@gmail.com', 1, NULL, NULL, '2023-12-07 23:41:47', '2023-12-08 00:33:16');
INSERT INTO `teacher` VALUES (3, 'PK-T0004', 'កែវ', 'ចន្ទវត្តី', 'កែវ ចន្ទវត្តី', 'keo', 'chanvettey', 'keo chanvettey', '2003-01-07', 2, '2', '3', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 3, '03156842079', 'chanvettey@gmail.com', 1, '', NULL, '2023-12-07 23:41:47', '2023-12-08 09:07:56');
INSERT INTO `teacher` VALUES (4, 'PK-T0005', 'គីម', 'សុភារី', 'គីម សុភារី', 'kim', 'sopheary', 'kim sopheary', '2003-01-07', 2, '2', '4', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 4, '09283750146', 'sopheary@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher` VALUES (5, 'PK-T0006', 'ទេព', 'ទេវី', 'ទេព ទេវី', 'teb', 'tevy', 'teb tevy', '2003-01-07', 2, '2', '5', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 5, '06047819325', 'tevy@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher` VALUES (6, 'PK-T0007', 'ម្លិះរួត', 'មល្លិកា', 'ម្លិះរួត មល្លិកា', 'mlekrout', 'milekka', 'mlekrout milekka', '2003-01-07', 2, '2', '6', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 6, '01872304956', 'milekka@gmail.com', 1, '', NULL, '2023-12-07 23:41:47', '2023-12-08 13:34:35');
INSERT INTO `teacher` VALUES (7, 'PK-T0008', 'សាល', 'តារារស្មី', 'សាល តារារស្មី', 'sal', 'darareaksmey', 'sal darareaksmey', '2003-01-07', 1, '2', '7', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 7, '08549631702', 'darareaksmey@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher` VALUES (8, 'PK-T0008', 'នាង', 'សុជាតា', 'នាង សុជាតា', 'neng', 'socheata', 'neng socheata', '2003-01-08', 2, '2', '1,5', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 8, '02396715084', 'socheata@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher` VALUES (9, 'PK-T0009', 'រិន', 'បុរី', 'រិន បុរី', 'rin', 'borey', 'rin borey', '0000-00-00', 1, '2', '2,3', '8', '2003-01-09', 'siem reap', 'siem reap', 1, 9, '03615928407', 'borey@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher` VALUES (10, 'PK-T0010', 'មាលី', 'មាលា', 'មាលី មាលា', 'Maly', 'Melea', 'Maly Melea', '2003-01-10', 1, '2', '5,6', '8', '2023-09-08', 'siem reap', 'siem reap', 1, 10, '04978052163', 'melea@gmail.com', 0, '', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `class_id` int NOT NULL,
  `subject_grade_id` int NOT NULL,
  `role_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------
INSERT INTO `teacher_class` VALUES (1, 1, 1, 1, 0, NULL, '2023-12-08 00:03:31', '2023-12-08 00:03:31');
INSERT INTO `teacher_class` VALUES (2, 2, 1, 2, 1, NULL, '2023-12-08 00:04:00', '2023-12-08 00:04:00');
INSERT INTO `teacher_class` VALUES (3, 3, 1, 3, 0, NULL, '2023-12-08 00:04:15', '2023-12-08 00:04:15');
INSERT INTO `teacher_class` VALUES (4, 4, 1, 4, 0, NULL, '2023-12-08 00:04:21', '2023-12-08 00:04:21');
INSERT INTO `teacher_class` VALUES (5, 5, 1, 5, 0, NULL, '2023-12-08 00:04:26', '2023-12-08 00:04:26');
INSERT INTO `teacher_class` VALUES (6, 6, 1, 6, 0, NULL, '2023-12-08 00:04:30', '2023-12-08 00:04:30');
INSERT INTO `teacher_class` VALUES (7, 6, 1, 7, 0, NULL, '2023-12-08 00:04:34', '2023-12-08 00:04:34');
INSERT INTO `teacher_class` VALUES (8, 10, 5, 29, 0, NULL, '2023-12-08 19:53:41', '2023-12-08 19:53:41');
INSERT INTO `teacher_class` VALUES (9, 9, 5, 30, 1, NULL, '2023-12-08 19:53:52', '2023-12-08 19:53:52');
INSERT INTO `teacher_class` VALUES (10, 8, 5, 31, 0, NULL, '2023-12-08 19:54:04', '2023-12-08 19:54:04');
INSERT INTO `teacher_class` VALUES (11, 1, 8, 51, 0, NULL, '2023-12-08 19:56:04', '2023-12-08 19:56:04');
INSERT INTO `teacher_class` VALUES (12, 6, 8, 50, 0, NULL, '2023-12-08 19:57:05', '2023-12-08 19:57:05');
INSERT INTO `teacher_class` VALUES (13, 7, 8, 52, 0, NULL, '2023-12-08 19:57:11', '2023-12-08 19:57:11');

-- ----------------------------
-- Table structure for teacher_role
-- ----------------------------
DROP TABLE IF EXISTS `teacher_role`;
CREATE TABLE `teacher_role`  (
  `role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_role
-- ----------------------------
INSERT INTO `teacher_role` VALUES (1, 'គ្រូនាយក', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (2, 'នាយករង', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (3, 'ជំនួយការនាយក', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (4, 'លេខាធិការ', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (5, 'វិន័យ', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (6, 'បុ.ទីចាត់ការ', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (7, 'គ្រូបន្ទុក', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_role` VALUES (8, 'សិក្ខាបនធារី', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for teacher_status
-- ----------------------------
DROP TABLE IF EXISTS `teacher_status`;
CREATE TABLE `teacher_status`  (
  `status_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_status
-- ----------------------------
INSERT INTO `teacher_status` VALUES (1, 'កំពុងបង្រៀន', 'Teaching', '#84cc16', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (2, 'មិនបង្រៀន', 'Not Teaching', '#cbd5e1', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (3, 'លំហែមាតុភាព', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (4, 'បុ.ទីចាត់ការ', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (5, 'វិន័យ', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (6, 'លេខា', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `teacher_status` VALUES (7, 'បានឈប់', 'Stopped', '#ef4444', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for time
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time`  (
  `time_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` time NOT NULL,
  `end_date` time NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`time_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time
-- ----------------------------
INSERT INTO `time` VALUES (1, 'ម៉ោងទី១', '07:00:00', '08:00:00', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `time` VALUES (2, 'ម៉ោងទី២', '08:00:00', '09:00:00', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `time` VALUES (3, 'ម៉ោងទី៣', '09:00:00', '10:00:00', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');
INSERT INTO `time` VALUES (4, 'ម៉ោងទី៤', '10:00:00', '11:00:00', NULL, '2023-12-07 23:41:47', '2023-12-07 23:41:47');

-- ----------------------------
-- Table structure for upload_files
-- ----------------------------
DROP TABLE IF EXISTS `upload_files`;
CREATE TABLE `upload_files`  (
  `file_upload_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`file_upload_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_files
-- ----------------------------
INSERT INTO `upload_files` VALUES (1, 'teacher1', 'storage/uploads/teacher1.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (2, 'teacher2', 'storage/uploads/teacher2.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (3, 'teacher3', 'storage/uploads/teacher3.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (4, 'teacher4', 'storage/uploads/teacher4.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (5, 'teacher5', 'storage/uploads/teacher5.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (6, 'teacher6', 'storage/uploads/teacher6.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (7, 'teacher7', 'storage/uploads/teacher7.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (8, 'teacher8', 'storage/uploads/teacher8.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (9, 'teacher9', 'storage/uploads/teacher9.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (10, 'teacher10', 'storage/uploads/teacher10.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (11, 'student1', 'storage/uploads/student1.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (12, 'student2', 'storage/uploads/student2.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (13, 'student3', 'storage/uploads/student3.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (14, 'student4', 'storage/uploads/student4.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (15, 'student5', 'storage/uploads/student5.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (16, 'student6', 'storage/uploads/student6.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (17, 'student7', 'storage/uploads/student7.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (18, 'student8', 'storage/uploads/student8.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (19, 'student9', 'storage/uploads/student9.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');
INSERT INTO `upload_files` VALUES (20, 'student10', 'storage/uploads/student10.jpg', '2', 'jpg', NULL, '2023-12-07 23:41:45', '2023-12-07 23:41:45');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_upload_id` int NULL DEFAULT NULL,
  `teacher_id` int NULL DEFAULT NULL,
  `is_system` int NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Super Admin', '0956487667', 'admin@gmail.com', NULL, NULL, 1, NULL, '$2y$10$omaN8EmKkctP7Y.98WlBTOREg2N1Ga.aouYNjZdjAF8IUxum2BGkG', NULL, NULL, '2023-12-07 23:41:46', '2023-12-07 23:41:46');
INSERT INTO `users` VALUES (2, 'វាន់ ស៊ីវម៉ី', '07428501963', 'sivmey@gmail.com', 1, 1, 0, NULL, '$2y$10$4mpsypq7CmXjnZO1LeYIgOEqOwJYfn9..N6C1uMBDTXuyoXqpejaa', NULL, NULL, '2023-12-08 00:07:32', '2023-12-08 00:07:32');
INSERT INTO `users` VALUES (3, 'សុខ សាន្ត', '05098346271', 'soksan@gmail.com', 2, 2, 0, NULL, '$2y$10$WdmHkl99iCo3GeHhsLd.YO8KvMA7fUqxojdkgtreUGkBh2aVZD0PC', NULL, NULL, '2023-12-08 00:07:49', '2023-12-08 00:07:49');
INSERT INTO `users` VALUES (4, 'កែវ ចន្ទវត្តី', '03156842079', 'chanvettey@gmail.com', 3, 3, 0, NULL, '$2y$10$5BBrVhju6scfsgtgazrGJ.DW.ysuDDWoel8CBxdzlFkrqZZlyVVB6', NULL, NULL, '2023-12-08 09:07:56', '2023-12-08 09:07:56');
INSERT INTO `users` VALUES (5, 'មល្លិកា', '01872304956', 'milekka@gmail.com', 6, 6, 0, NULL, '$2y$10$koDG5GbsFKtYSYw7XjtDw.E1uG/z/hHw63QPHxOEVeAf0Cjb65SWi', NULL, NULL, '2023-12-08 13:34:35', '2023-12-08 13:34:35');

SET FOREIGN_KEY_CHECKS = 1;
