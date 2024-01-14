/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : stock-project-api

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 10/01/2024 12:47:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backup_restore
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------

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
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_date` date NOT NULL,
  `exchange_rate` decimal(8, 2) NOT NULL,
  `costomer_ref_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices
-- ----------------------------

-- ----------------------------
-- Table structure for invoices_lines
-- ----------------------------
DROP TABLE IF EXISTS `invoices_lines`;
CREATE TABLE `invoices_lines`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `txn_ref_id` int NOT NULL,
  `txn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ref_id` int NOT NULL,
  `qty` int NOT NULL,
  `unit_price` decimal(8, 2) NOT NULL,
  `amount` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices_lines
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000001_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_11_10_064440_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (6, '2022_11_11_061202_create_upload_files_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_06_30_133582_create_backup_restore_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_06_30_133582_create_setting_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_01_09_000221_create_product_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_01_09_000629_create_categories_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_01_09_000654_create_products_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_01_09_000756_create_customers_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_01_09_000850_create_vendors_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_01_09_000928_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_01_09_001057_create_invoices_lines_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_01_09_001247_create_purchases_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_01_09_001325_create_purchases_lines_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_01_09_000223_create_products_table', 2);

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
INSERT INTO `permissions` VALUES (1, 'user-view', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (2, 'user-create', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (3, 'user-edit', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (4, 'user-delete', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (5, 'student-view', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (6, 'student-create', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (7, 'student-edit', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (8, 'student-delete', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (9, 'teacher-view', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (10, 'teacher-create', 'web', '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `permissions` VALUES (11, 'teacher-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (12, 'teacher-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (13, 'subject-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (14, 'subject-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (15, 'subject-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (16, 'subject-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (17, 'subject-level-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (18, 'subject-level-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (19, 'subject-level-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (20, 'subject-level-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (21, 'class-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (22, 'class-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (23, 'class-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (24, 'class-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (25, 'class-info', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (26, 'class-info-manage-schedule', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (27, 'class-info-add-teacher', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (28, 'class-info-edit-teacher', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (29, 'class-teacher', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (30, 'class-student', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (31, 'class-student-add', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (32, 'class-student-remove', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (33, 'class-attendance', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (34, 'class-attendance-collect', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (35, 'class-score', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (36, 'class-score-collect', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (37, 'exam-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (38, 'exam-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (39, 'exam-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (40, 'exam-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (41, 'time-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (42, 'time-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (43, 'time-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (44, 'time-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (45, 'academic-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (46, 'academic-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (47, 'academic-edit', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (48, 'academic-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (49, 'report-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (50, 'preference-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (51, 'preference-update', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (52, 'backup-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (53, 'backup-create', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (54, 'backup-restore', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (55, 'backup-delete', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (56, 'role-permission-view', 'web', '2024-01-09 01:14:38', '2024-01-09 01:14:38');
INSERT INTO `permissions` VALUES (57, 'role-permission-create', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');
INSERT INTO `permissions` VALUES (58, 'role-permission-edit', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');
INSERT INTO `permissions` VALUES (59, 'role-permission-delete', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', 1, 'devop', 'e499e6697fe7fad463d76b899e79884d96e6db6e790c6dc8bca4adda76fd0e04', '[\"*\"]', '2024-01-10 12:36:21', NULL, '2024-01-10 12:09:10', '2024-01-10 12:36:21');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_ref_id` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cost` decimal(8, 2) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '001', 'IOS', 'tesing sds sd', 0, NULL, 350.00, '2024-01-09 22:56:50', '2024-01-09 23:26:05');
INSERT INTO `products` VALUES (3, '002', 'IGH', 'sdfsdf', 0, NULL, 9302.00, '2024-01-10 07:11:16', '2024-01-10 07:11:16');

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_date` date NOT NULL,
  `exchange_rate` decimal(8, 2) NOT NULL,
  `vendor_ref_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases
-- ----------------------------

-- ----------------------------
-- Table structure for purchases_lines
-- ----------------------------
DROP TABLE IF EXISTS `purchases_lines`;
CREATE TABLE `purchases_lines`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `txn_ref_id` int NOT NULL,
  `txn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ref_id` int NOT NULL,
  `qty` int NOT NULL,
  `unit_price` decimal(8, 2) NOT NULL,
  `amount` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases_lines
-- ----------------------------

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
INSERT INTO `roles` VALUES (1, 'super-admin', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');
INSERT INTO `roles` VALUES (2, 'role-editor', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');
INSERT INTO `roles` VALUES (3, 'role-viewer', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');
INSERT INTO `roles` VALUES (4, 'teacher', 'web', '2024-01-09 01:14:39', '2024-01-09 01:14:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------

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
INSERT INTO `upload_files` VALUES (1, 'teacher1', 'storage/uploads/teacher1.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (2, 'teacher2', 'storage/uploads/teacher2.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (3, 'teacher3', 'storage/uploads/teacher3.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (4, 'teacher4', 'storage/uploads/teacher4.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (5, 'teacher5', 'storage/uploads/teacher5.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (6, 'teacher6', 'storage/uploads/teacher6.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (7, 'teacher7', 'storage/uploads/teacher7.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (8, 'teacher8', 'storage/uploads/teacher8.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (9, 'teacher9', 'storage/uploads/teacher9.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (10, 'teacher10', 'storage/uploads/teacher10.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (11, 'student1', 'storage/uploads/student1.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (12, 'student2', 'storage/uploads/student2.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (13, 'student3', 'storage/uploads/student3.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (14, 'student4', 'storage/uploads/student4.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (15, 'student5', 'storage/uploads/student5.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (16, 'student6', 'storage/uploads/student6.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (17, 'student7', 'storage/uploads/student7.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (18, 'student8', 'storage/uploads/student8.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (19, 'student9', 'storage/uploads/student9.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');
INSERT INTO `upload_files` VALUES (20, 'student10', 'storage/uploads/student10.jpg', '2', 'jpg', NULL, '2024-01-09 01:14:37', '2024-01-09 01:14:37');

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
  `is_system` int NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Super Admin', '0956487667', 'admin@gmail.com', NULL, 1, NULL, '$2y$10$Ms0ccRZMVTs1uoK.ZxEEhuHdMZ8733/cmYEjToxEWgmyAKHPsnJvq', NULL, NULL, '2024-01-09 01:14:39', '2024-01-09 01:14:39');

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendors
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
