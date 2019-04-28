/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 192.168.10.10:3306
 Source Schema         : testapp

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 28/04/2019 19:25:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_config_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-04-12 04:24:05');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '管理员', 'fa-tasks', NULL, NULL, NULL, '2019-04-12 04:24:48');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户', 'fa-users', 'auth/users', NULL, NULL, '2019-04-12 04:25:49');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2019-04-12 04:28:54');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-04-12 04:30:07');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, '2019-04-12 04:30:44');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-04-12 04:31:27');
INSERT INTO `admin_menu` VALUES (8, 0, 8, 'Config', 'fa-toggle-on', 'config', NULL, '2019-04-12 02:46:51', '2019-04-12 02:46:51');
INSERT INTO `admin_menu` VALUES (9, 0, 8, '帮助', 'fa-gears', NULL, NULL, '2019-04-12 02:50:56', '2019-04-12 07:40:55');
INSERT INTO `admin_menu` VALUES (10, 9, 9, '脚手架', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2019-04-12 02:50:56', '2019-04-12 07:42:09');
INSERT INTO `admin_menu` VALUES (11, 9, 10, '数据库终端', 'fa-database', 'helpers/terminal/database', NULL, '2019-04-12 02:50:56', '2019-04-12 07:42:30');
INSERT INTO `admin_menu` VALUES (12, 9, 11, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2019-04-12 02:50:56', '2019-04-12 02:50:56');
INSERT INTO `admin_menu` VALUES (13, 9, 12, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2019-04-12 02:50:56', '2019-04-12 02:50:56');
INSERT INTO `admin_menu` VALUES (14, 0, 0, '电影', 'fa-file-movie-o', 'movies', '*', '2019-04-12 06:51:40', '2019-04-12 08:15:45');
INSERT INTO `admin_menu` VALUES (15, 0, 0, '注册用户', 'fa-user-md', NULL, NULL, '2019-04-12 08:11:31', '2019-04-12 08:25:19');
INSERT INTO `admin_menu` VALUES (16, 15, 0, '用户列表', 'fa-align-left', 'users', NULL, '2019-04-12 08:27:22', '2019-04-12 09:09:21');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 899 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 02:47:56', '2019-04-12 02:47:56');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:48:03', '2019-04-12 02:48:03');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:48:05', '2019-04-12 02:48:05');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:48:11', '2019-04-12 02:48:11');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:49:58', '2019-04-12 02:49:58');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:50:01', '2019-04-12 02:50:01');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:50:14', '2019-04-12 02:50:14');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:50:21', '2019-04-12 02:50:21');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:50:33', '2019-04-12 02:50:33');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:51:24', '2019-04-12 02:51:24');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:51:28', '2019-04-12 02:51:28');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:51:30', '2019-04-12 02:51:30');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 02:53:25', '2019-04-12 02:53:25');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:27', '2019-04-12 02:54:27');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:29', '2019-04-12 02:54:29');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:31', '2019-04-12 02:54:31');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:34', '2019-04-12 02:54:34');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:45', '2019-04-12 02:54:45');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:45', '2019-04-12 02:54:45');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:52', '2019-04-12 02:54:52');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:54:58', '2019-04-12 02:54:58');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 02:55:01', '2019-04-12 02:55:01');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 03:00:35', '2019-04-12 03:00:35');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:00:39', '2019-04-12 03:00:39');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:00:59', '2019-04-12 03:00:59');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:01:03', '2019-04-12 03:01:03');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:01:11', '2019-04-12 03:01:11');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:01:23', '2019-04-12 03:01:23');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:01:25', '2019-04-12 03:01:25');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2019-04-12 03:03:20', '2019-04-12 03:03:20');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 03:03:35', '2019-04-12 03:03:35');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:08:32', '2019-04-12 03:08:32');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 03:12:30', '2019-04-12 03:12:30');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 04:11:01', '2019-04-12 04:11:01');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:04', '2019-04-12 04:11:04');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:11', '2019-04-12 04:11:11');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:18', '2019-04-12 04:11:18');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:22', '2019-04-12 04:11:22');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:52', '2019-04-12 04:11:52');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:11:58', '2019-04-12 04:11:58');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:12:02', '2019-04-12 04:12:02');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/config/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:12:08', '2019-04-12 04:12:08');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:12:19', '2019-04-12 04:12:19');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:12:28', '2019-04-12 04:12:28');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:13:20', '2019-04-12 04:13:20');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/helpers/terminal/database', 'POST', '192.168.10.1', '{\"c\":\"db:mysql\",\"q\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\"}', '2019-04-12 04:13:29', '2019-04-12 04:13:29');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:13:31', '2019-04-12 04:13:31');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:13:34', '2019-04-12 04:13:34');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:13:37', '2019-04-12 04:13:37');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:14:29', '2019-04-12 04:14:29');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:14:31', '2019-04-12 04:14:31');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:14:39', '2019-04-12 04:14:39');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:16:21', '2019-04-12 04:16:21');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:17:40', '2019-04-12 04:17:40');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:17:46', '2019-04-12 04:17:46');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:17:55', '2019-04-12 04:17:55');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:18:15', '2019-04-12 04:18:15');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:18:21', '2019-04-12 04:18:21');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:18:26', '2019-04-12 04:18:26');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:18:38', '2019-04-12 04:18:38');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:23:21', '2019-04-12 04:23:21');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:23:27', '2019-04-12 04:23:27');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:23:35', '2019-04-12 04:23:35');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:23:37', '2019-04-12 04:23:37');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:23:42', '2019-04-12 04:23:42');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:24:05', '2019-04-12 04:24:05');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:24:06', '2019-04-12 04:24:06');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:24:13', '2019-04-12 04:24:13');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:24:18', '2019-04-12 04:24:18');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:24:29', '2019-04-12 04:24:29');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:24:38', '2019-04-12 04:24:38');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:24:48', '2019-04-12 04:24:48');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:24:49', '2019-04-12 04:24:49');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:24:56', '2019-04-12 04:24:56');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:24:59', '2019-04-12 04:24:59');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:25:34', '2019-04-12 04:25:34');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:25:39', '2019-04-12 04:25:39');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:25:48', '2019-04-12 04:25:48');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:25:50', '2019-04-12 04:25:50');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:00', '2019-04-12 04:26:00');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:02', '2019-04-12 04:26:02');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:10', '2019-04-12 04:26:10');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:19', '2019-04-12 04:26:19');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:30', '2019-04-12 04:26:30');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:40', '2019-04-12 04:26:40');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:45', '2019-04-12 04:26:45');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:26:50', '2019-04-12 04:26:50');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:27:01', '2019-04-12 04:27:01');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:27:09', '2019-04-12 04:27:09');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:27:21', '2019-04-12 04:27:21');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:27:30', '2019-04-12 04:27:30');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:28:02', '2019-04-12 04:28:02');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:28:18', '2019-04-12 04:28:18');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:28:28', '2019-04-12 04:28:28');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:28:54', '2019-04-12 04:28:54');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:28:55', '2019-04-12 04:28:55');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:28:59', '2019-04-12 04:28:59');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:29:03', '2019-04-12 04:29:03');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:29:10', '2019-04-12 04:29:10');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:29:53', '2019-04-12 04:29:53');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:29:57', '2019-04-12 04:29:57');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:29:58', '2019-04-12 04:29:58');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\"}', '2019-04-12 04:30:06', '2019-04-12 04:30:06');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:30:08', '2019-04-12 04:30:08');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:30:15', '2019-04-12 04:30:15');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:30:44', '2019-04-12 04:30:44');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:30:45', '2019-04-12 04:30:45');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:30:49', '2019-04-12 04:30:49');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:30:53', '2019-04-12 04:30:53');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:09', '2019-04-12 04:31:09');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:15', '2019-04-12 04:31:15');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 04:31:26', '2019-04-12 04:31:26');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:31:27', '2019-04-12 04:31:27');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 04:31:32', '2019-04-12 04:31:32');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:36', '2019-04-12 04:31:36');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:40', '2019-04-12 04:31:40');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:41', '2019-04-12 04:31:41');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:31:49', '2019-04-12 04:31:49');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:32:01', '2019-04-12 04:32:01');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:25', '2019-04-12 04:33:25');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:27', '2019-04-12 04:33:27');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:29', '2019-04-12 04:33:29');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:29', '2019-04-12 04:33:29');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:31', '2019-04-12 04:33:31');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:31', '2019-04-12 04:33:31');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:34', '2019-04-12 04:33:34');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:34', '2019-04-12 04:33:34');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:34', '2019-04-12 04:33:34');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:35', '2019-04-12 04:33:35');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:37', '2019-04-12 04:33:37');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:33:40', '2019-04-12 04:33:40');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:35:15', '2019-04-12 04:35:15');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:46:17', '2019-04-12 04:46:17');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 04:56:48', '2019-04-12 04:56:48');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:03', '2019-04-12 04:57:03');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:09', '2019-04-12 04:57:09');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:10', '2019-04-12 04:57:10');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:14', '2019-04-12 04:57:14');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:17', '2019-04-12 04:57:17');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:23', '2019-04-12 04:57:23');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:38', '2019-04-12 04:57:38');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:42', '2019-04-12 04:57:42');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:46', '2019-04-12 04:57:46');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:52', '2019-04-12 04:57:52');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:55', '2019-04-12 04:57:55');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 04:57:58', '2019-04-12 04:57:58');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 05:00:21', '2019-04-12 05:00:21');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:23:21', '2019-04-12 06:23:21');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:23:26', '2019-04-12 06:23:26');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:23:50', '2019-04-12 06:23:50');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:24:59', '2019-04-12 06:24:59');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:03', '2019-04-12 06:25:03');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:34', '2019-04-12 06:25:34');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:40', '2019-04-12 06:25:40');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:41', '2019-04-12 06:25:41');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:42', '2019-04-12 06:25:42');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:25:51', '2019-04-12 06:25:51');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:29:55', '2019-04-12 06:29:55');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:31:13', '2019-04-12 06:31:13');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-04-12 06:45:52', '2019-04-12 06:45:52');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:45:57', '2019-04-12 06:45:57');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:46:46', '2019-04-12 06:46:46');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:46:47', '2019-04-12 06:46:47');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:46:48', '2019-04-12 06:46:48');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 06:46:50', '2019-04-12 06:46:50');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:46:55', '2019-04-12 06:46:55');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:47:00', '2019-04-12 06:47:00');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u89c6\\u9891\",\"icon\":\"fa-bars\",\"uri\":\"movies\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\"}', '2019-04-12 06:51:40', '2019-04-12 06:51:40');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 06:51:42', '2019-04-12 06:51:42');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:51:48', '2019-04-12 06:51:48');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:51:49', '2019-04-12 06:51:49');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:51:51', '2019-04-12 06:51:51');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:52:04', '2019-04-12 06:52:04');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:52:08', '2019-04-12 06:52:08');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:52:19', '2019-04-12 06:52:19');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:52:27', '2019-04-12 06:52:27');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:54:02', '2019-04-12 06:54:02');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/auth/roles', 'POST', '192.168.10.1', '{\"slug\":\"customerservice\",\"name\":\"\\u5ba2\\u670d\",\"permissions\":[\"3\",null],\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/roles\"}', '2019-04-12 06:55:02', '2019-04-12 06:55:02');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-04-12 06:55:03', '2019-04-12 06:55:03');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:55:12', '2019-04-12 06:55:12');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/auth/permissions/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:55:33', '2019-04-12 06:55:33');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/auth/permissions/1', 'PUT', '192.168.10.1', '{\"slug\":\"*\",\"name\":\"\\u6240\\u6709\\u6743\\u9650\",\"http_method\":[null],\"http_path\":\"*\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:55:54', '2019-04-12 06:55:54');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:55:55', '2019-04-12 06:55:55');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/auth/permissions/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:56:27', '2019-04-12 06:56:27');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/auth/permissions/2', 'PUT', '192.168.10.1', '{\"slug\":\"\\u4eea\\u8868\\u76d8\",\"name\":\"Dashboard\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:56:35', '2019-04-12 06:56:35');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:56:37', '2019-04-12 06:56:37');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/auth/permissions/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:56:45', '2019-04-12 06:56:45');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/auth/permissions/2', 'PUT', '192.168.10.1', '{\"slug\":\"dashboard\",\"name\":\"\\u4eea\\u8868\\u76d8\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:56:59', '2019-04-12 06:56:59');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:57:00', '2019-04-12 06:57:00');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/auth/permissions/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:57:23', '2019-04-12 06:57:23');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/auth/permissions/3', 'PUT', '192.168.10.1', '{\"slug\":\"auth.login\",\"name\":\"\\u767b\\u9646\\u6743\\u9650\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:57:57', '2019-04-12 06:57:57');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:57:58', '2019-04-12 06:57:58');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/auth/permissions/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:58:17', '2019-04-12 06:58:17');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/auth/permissions/3', 'PUT', '192.168.10.1', '{\"slug\":\"auth.login\",\"name\":\"\\u767b\\u9646\\u9000\\u51fa\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:58:29', '2019-04-12 06:58:29');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:58:30', '2019-04-12 06:58:30');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/permissions/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:58:37', '2019-04-12 06:58:37');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/permissions/3', 'PUT', '192.168.10.1', '{\"slug\":\"auth.login\",\"name\":\"\\u767b\\u5f55\\u6743\\u9650\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:58:48', '2019-04-12 06:58:48');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:58:49', '2019-04-12 06:58:49');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/permissions/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:59:09', '2019-04-12 06:59:09');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/permissions/4', 'PUT', '192.168.10.1', '{\"slug\":\"auth.setting\",\"name\":\"\\u7528\\u6237\\u8bbe\\u7f6e\",\"http_method\":[\"GET\",\"PUT\",null],\"http_path\":\"\\/auth\\/setting\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 06:59:24', '2019-04-12 06:59:24');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 06:59:25', '2019-04-12 06:59:25');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/permissions/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 06:59:53', '2019-04-12 06:59:53');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/permissions/5', 'PUT', '192.168.10.1', '{\"slug\":\"auth.management\",\"name\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/auth\\/roles\\r\\n\\/auth\\/permissions\\r\\n\\/auth\\/menu\\r\\n\\/auth\\/logs\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 07:00:17', '2019-04-12 07:00:17');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 07:00:19', '2019-04-12 07:00:19');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:00:58', '2019-04-12 07:00:58');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:01:04', '2019-04-12 07:01:04');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/permissions/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:01:29', '2019-04-12 07:01:29');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/permissions/6', 'PUT', '192.168.10.1', '{\"slug\":\"ext.config\",\"name\":\"\\u7ba1\\u7406\\u5458\\u914d\\u7f6e\",\"http_method\":[null],\"http_path\":\"\\/config*\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 07:01:40', '2019-04-12 07:01:40');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 07:01:41', '2019-04-12 07:01:41');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/permissions/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:01:47', '2019-04-12 07:01:47');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/permissions/7', 'PUT', '192.168.10.1', '{\"slug\":\"ext.helpers\",\"name\":\"\\u7ba1\\u7406\\u5458\\u5e2e\\u52a9\",\"http_method\":[null],\"http_path\":\"\\/helpers\\/*\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/permissions\"}', '2019-04-12 07:02:01', '2019-04-12 07:02:01');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 07:02:02', '2019-04-12 07:02:02');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:02:56', '2019-04-12 07:02:56');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:02:59', '2019-04-12 07:02:59');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:03:13', '2019-04-12 07:03:13');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:03:22', '2019-04-12 07:03:22');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/auth/menu/14', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u89c6\\u9891\",\"icon\":\"fa-bars\",\"uri\":\"movies\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:03:55', '2019-04-12 07:03:55');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:03:56', '2019-04-12 07:03:56');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:04:00', '2019-04-12 07:04:00');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-12 07:04:06', '2019-04-12 07:04:06');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:04:18', '2019-04-12 07:04:18');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:07', '2019-04-12 07:05:07');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:20', '2019-04-12 07:05:20');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:23', '2019-04-12 07:05:23');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:26', '2019-04-12 07:05:26');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:35', '2019-04-12 07:05:35');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:05:38', '2019-04-12 07:05:38');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:06:20', '2019-04-12 07:06:20');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:06:23', '2019-04-12 07:06:23');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2019-04-12 07:06:46', '2019-04-12 07:06:46');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2019-04-12 07:07:04', '2019-04-12 07:07:04');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:07:14', '2019-04-12 07:07:14');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:07:38', '2019-04-12 07:07:38');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-04-12 07:07:59', '2019-04-12 07:07:59');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:08:04', '2019-04-12 07:08:04');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:08:15', '2019-04-12 07:08:15');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:08:33', '2019-04-12 07:08:33');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:10:35', '2019-04-12 07:10:35');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:10:39', '2019-04-12 07:10:39');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:10:40', '2019-04-12 07:10:40');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:10:49', '2019-04-12 07:10:49');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name\",\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:10:58', '2019-04-12 07:10:58');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:11:03', '2019-04-12 07:11:03');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"1111\"}', '2019-04-12 07:11:39', '2019-04-12 07:11:39');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2019-04-12 07:11:47', '2019-04-12 07:11:47');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:11:54', '2019-04-12 07:11:54');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:11:59', '2019-04-12 07:11:59');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:13:02', '2019-04-12 07:13:02');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:13:26', '2019-04-12 07:13:26');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name\",\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:13:34', '2019-04-12 07:13:34');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:13:40', '2019-04-12 07:13:40');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:13:49', '2019-04-12 07:13:49');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:13:51', '2019-04-12 07:13:51');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:13:56', '2019-04-12 07:13:56');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:14:02', '2019-04-12 07:14:02');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:14:13', '2019-04-12 07:14:13');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:14:53', '2019-04-12 07:14:53');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:14:57', '2019-04-12 07:14:57');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:08', '2019-04-12 07:15:08');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:11', '2019-04-12 07:15:11');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:21', '2019-04-12 07:15:21');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/menu/14', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7535\\u5f71\",\"icon\":\"fa-bars\",\"uri\":\"movies\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:15:30', '2019-04-12 07:15:30');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:15:32', '2019-04-12 07:15:32');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:15:36', '2019-04-12 07:15:36');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:40', '2019-04-12 07:15:40');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/movies/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:48', '2019-04-12 07:15:48');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:54', '2019-04-12 07:15:54');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/movies/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:57', '2019-04-12 07:15:57');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:15:59', '2019-04-12 07:15:59');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:16:47', '2019-04-12 07:16:47');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:16:53', '2019-04-12 07:16:53');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:16:57', '2019-04-12 07:16:57');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:17:05', '2019-04-12 07:17:05');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/movies', 'POST', '192.168.10.1', '{\"name\":\"\\u6d41\\u6d6a\\u5730\\u533a\",\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies\"}', '2019-04-12 07:17:21', '2019-04-12 07:17:21');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:17:22', '2019-04-12 07:17:22');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:19:50', '2019-04-12 07:19:50');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:20:00', '2019-04-12 07:20:00');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/auth/roles/2', 'PUT', '192.168.10.1', '{\"slug\":\"customerservice\",\"name\":\"\\u5ba2\\u670d\",\"permissions\":[\"2\",\"3\",null],\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/roles\"}', '2019-04-12 07:20:21', '2019-04-12 07:20:21');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-04-12 07:20:22', '2019-04-12 07:20:22');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:20:31', '2019-04-12 07:20:31');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:20:35', '2019-04-12 07:20:35');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/users', 'POST', '192.168.10.1', '{\"username\":\"yujunnan\",\"name\":\"\\u4e8e\\u92c6\\u5357\",\"password\":\"64647728\",\"password_confirmation\":\"64647728\",\"roles\":[\"2\",null],\"permissions\":[\"2\",\"3\",null],\"_token\":\"fDIrBYUSQcCxeVAZT9WbmoI4KfKAWSkAgTuUZ54J\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/users\"}', '2019-04-12 07:21:58', '2019-04-12 07:21:58');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-04-12 07:21:59', '2019-04-12 07:21:59');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:22:10', '2019-04-12 07:22:10');
INSERT INTO `admin_operation_log` VALUES (285, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:22:49', '2019-04-12 07:22:49');
INSERT INTO `admin_operation_log` VALUES (286, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:22:54', '2019-04-12 07:22:54');
INSERT INTO `admin_operation_log` VALUES (287, 2, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:22:56', '2019-04-12 07:22:56');
INSERT INTO `admin_operation_log` VALUES (288, 2, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:01', '2019-04-12 07:23:01');
INSERT INTO `admin_operation_log` VALUES (289, 2, 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:04', '2019-04-12 07:23:04');
INSERT INTO `admin_operation_log` VALUES (290, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:06', '2019-04-12 07:23:06');
INSERT INTO `admin_operation_log` VALUES (291, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:07', '2019-04-12 07:23:07');
INSERT INTO `admin_operation_log` VALUES (292, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:23:14', '2019-04-12 07:23:14');
INSERT INTO `admin_operation_log` VALUES (293, 2, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:22', '2019-04-12 07:23:22');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:23:42', '2019-04-12 07:23:42');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:48', '2019-04-12 07:23:48');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:23:57', '2019-04-12 07:23:57');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/auth/users/2', 'PUT', '192.168.10.1', '{\"username\":\"yujunnan\",\"name\":\"\\u4e8e\\u92c6\\u5357\",\"password\":\"$2y$10$G41rWFZBRQnbV9Yc2GDa6.aZJ79\\/wakpF\\/OSZduPPKWG5h3dS\\/hem\",\"password_confirmation\":\"$2y$10$G41rWFZBRQnbV9Yc2GDa6.aZJ79\\/wakpF\\/OSZduPPKWG5h3dS\\/hem\",\"roles\":[\"2\",null],\"permissions\":[\"2\",\"3\",null],\"_token\":\"UnMTooXAyKDCvHLlxaKDvEkBixmG1LpoyiLIXHHw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/users\"}', '2019-04-12 07:24:11', '2019-04-12 07:24:11');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-04-12 07:24:12', '2019-04-12 07:24:12');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:24:15', '2019-04-12 07:24:15');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 07:26:38', '2019-04-12 07:26:38');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:26:47', '2019-04-12 07:26:47');
INSERT INTO `admin_operation_log` VALUES (302, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:27:15', '2019-04-12 07:27:15');
INSERT INTO `admin_operation_log` VALUES (303, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:27:27', '2019-04-12 07:27:27');
INSERT INTO `admin_operation_log` VALUES (304, 2, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:30:30', '2019-04-12 07:30:30');
INSERT INTO `admin_operation_log` VALUES (305, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:30:33', '2019-04-12 07:30:33');
INSERT INTO `admin_operation_log` VALUES (306, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:32:04', '2019-04-12 07:32:04');
INSERT INTO `admin_operation_log` VALUES (307, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:32:43', '2019-04-12 07:32:43');
INSERT INTO `admin_operation_log` VALUES (308, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:33:08', '2019-04-12 07:33:08');
INSERT INTO `admin_operation_log` VALUES (309, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:34:30', '2019-04-12 07:34:30');
INSERT INTO `admin_operation_log` VALUES (310, 2, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:35:19', '2019-04-12 07:35:19');
INSERT INTO `admin_operation_log` VALUES (311, 2, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:35:28', '2019-04-12 07:35:28');
INSERT INTO `admin_operation_log` VALUES (312, 2, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:35:31', '2019-04-12 07:35:31');
INSERT INTO `admin_operation_log` VALUES (313, 2, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:35:39', '2019-04-12 07:35:39');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 07:35:57', '2019-04-12 07:35:57');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:36:02', '2019-04-12 07:36:02');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name,roles,created_at,updated_at\",\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:36:10', '2019-04-12 07:36:10');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:36:18', '2019-04-12 07:36:18');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:36:27', '2019-04-12 07:36:27');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:36:32', '2019-04-12 07:36:32');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/auth/roles/2', 'PUT', '192.168.10.1', '{\"slug\":\"customerservice\",\"name\":\"\\u5ba2\\u670d\",\"permissions\":[\"1\",\"4\",\"5\",\"6\",\"7\",null],\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/roles\"}', '2019-04-12 07:37:18', '2019-04-12 07:37:18');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-04-12 07:37:20', '2019-04-12 07:37:20');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:37:27', '2019-04-12 07:37:27');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/auth/roles/2', 'PUT', '192.168.10.1', '{\"slug\":\"customerservice\",\"name\":\"\\u5ba2\\u670d\",\"permissions\":[\"2\",\"3\",null],\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/roles\"}', '2019-04-12 07:37:44', '2019-04-12 07:37:44');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-04-12 07:37:45', '2019-04-12 07:37:45');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:37:51', '2019-04-12 07:37:51');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:37:55', '2019-04-12 07:37:55');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:05', '2019-04-12 07:38:05');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:06', '2019-04-12 07:38:06');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:11', '2019-04-12 07:38:11');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:15', '2019-04-12 07:38:15');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:17', '2019-04-12 07:38:17');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:22', '2019-04-12 07:38:22');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:38:40', '2019-04-12 07:38:40');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:01', '2019-04-12 07:39:01');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:17', '2019-04-12 07:39:17');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:22', '2019-04-12 07:39:22');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/auth/menu/10/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:29', '2019-04-12 07:39:29');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:35', '2019-04-12 07:39:35');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:36', '2019-04-12 07:39:36');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:37', '2019-04-12 07:39:37');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:39:47', '2019-04-12 07:39:47');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:40:00', '2019-04-12 07:40:00');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:40:21', '2019-04-12 07:40:21');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:40:23', '2019-04-12 07:40:23');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:40:27', '2019-04-12 07:40:27');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:40:46', '2019-04-12 07:40:46');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5e2e\\u52a9\",\"icon\":\"fa-gears\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:40:55', '2019-04-12 07:40:55');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:40:56', '2019-04-12 07:40:56');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:41:13', '2019-04-12 07:41:13');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/auth/menu/8', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"Config\",\"icon\":\"fa-toggle-on\",\"uri\":\"config\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:41:22', '2019-04-12 07:41:22');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:41:24', '2019-04-12 07:41:24');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:41:40', '2019-04-12 07:41:40');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5e2e\\u52a9\",\"icon\":\"fa-gears\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:41:47', '2019-04-12 07:41:47');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:41:49', '2019-04-12 07:41:49');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/auth/menu/10/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:41:55', '2019-04-12 07:41:55');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/auth/menu/10', 'PUT', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u811a\\u624b\\u67b6\",\"icon\":\"fa-keyboard-o\",\"uri\":\"helpers\\/scaffold\",\"roles\":[null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:42:09', '2019-04-12 07:42:09');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:42:10', '2019-04-12 07:42:10');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/auth/menu/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:42:16', '2019-04-12 07:42:16');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/auth/menu/11', 'PUT', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u6570\\u636e\\u5e93\\u7ec8\\u7aef\",\"icon\":\"fa-database\",\"uri\":\"helpers\\/terminal\\/database\",\"roles\":[null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 07:42:30', '2019-04-12 07:42:30');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:42:31', '2019-04-12 07:42:31');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 07:42:42', '2019-04-12 07:42:42');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:54:16', '2019-04-12 07:54:16');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:54:18', '2019-04-12 07:54:18');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:56:15', '2019-04-12 07:56:15');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:56:22', '2019-04-12 07:56:22');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:56:28', '2019-04-12 07:56:28');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:57:37', '2019-04-12 07:57:37');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:57:43', '2019-04-12 07:57:43');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:58:02', '2019-04-12 07:58:02');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:58:03', '2019-04-12 07:58:03');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:58:04', '2019-04-12 07:58:04');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 07:58:14', '2019-04-12 07:58:14');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:58:19', '2019-04-12 07:58:19');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:58:40', '2019-04-12 07:58:40');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:59:05', '2019-04-12 07:59:05');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:59:40', '2019-04-12 07:59:40');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:59:45', '2019-04-12 07:59:45');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 07:59:48', '2019-04-12 07:59:48');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:00:59', '2019-04-12 08:00:59');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:01:04', '2019-04-12 08:01:04');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:01:09', '2019-04-12 08:01:09');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:01:13', '2019-04-12 08:01:13');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 08:02:16', '2019-04-12 08:02:16');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:02:19', '2019-04-12 08:02:19');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:02:56', '2019-04-12 08:02:56');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:03:22', '2019-04-12 08:03:22');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:03:26', '2019-04-12 08:03:26');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:04:16', '2019-04-12 08:04:16');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:04:44', '2019-04-12 08:04:44');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:04:48', '2019-04-12 08:04:48');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"50\"}', '2019-04-12 08:04:54', '2019-04-12 08:04:54');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:04:57', '2019-04-12 08:04:57');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:05:05', '2019-04-12 08:05:05');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/config/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:05:09', '2019-04-12 08:05:09');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:05:14', '2019-04-12 08:05:14');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/config/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:05:47', '2019-04-12 08:05:47');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:07:02', '2019-04-12 08:07:02');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:07:05', '2019-04-12 08:07:05');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:07:33', '2019-04-12 08:07:33');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:07:51', '2019-04-12 08:07:51');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:07:58', '2019-04-12 08:07:58');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/auth/users/2', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:08:06', '2019-04-12 08:08:06');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:08:11', '2019-04-12 08:08:11');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:08:14', '2019-04-12 08:08:14');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:09:36', '2019-04-12 08:09:36');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:10:06', '2019-04-12 08:10:06');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:10:47', '2019-04-12 08:10:47');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u6ce8\\u518c\\u7528\\u6237\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[\"2\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\"}', '2019-04-12 08:11:30', '2019-04-12 08:11:30');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:11:32', '2019-04-12 08:11:32');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:11:36', '2019-04-12 08:11:36');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:11:59', '2019-04-12 08:11:59');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:12:07', '2019-04-12 08:12:07');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:12:15', '2019-04-12 08:12:15');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:12:36', '2019-04-12 08:12:36');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:13:04', '2019-04-12 08:13:04');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:13:13', '2019-04-12 08:13:13');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/auth/menu/15/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:13:18', '2019-04-12 08:13:18');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/auth/menu/15/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 08:14:12', '2019-04-12 08:14:12');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:16', '2019-04-12 08:14:16');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:18', '2019-04-12 08:14:18');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:30', '2019-04-12 08:14:30');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:33', '2019-04-12 08:14:33');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:49', '2019-04-12 08:14:49');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:14:51', '2019-04-12 08:14:51');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:01', '2019-04-12 08:15:01');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:05', '2019-04-12 08:15:05');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:08', '2019-04-12 08:15:08');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:09', '2019-04-12 08:15:09');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:11', '2019-04-12 08:15:11');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:14', '2019-04-12 08:15:14');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:24', '2019-04-12 08:15:24');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/auth/menu/14', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7535\\u5f71\",\"icon\":\"fa-file-movie-o\",\"uri\":\"movies\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 08:15:45', '2019-04-12 08:15:45');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:15:46', '2019-04-12 08:15:46');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/auth/menu/15/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:15:54', '2019-04-12 08:15:54');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/menu/15', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u6ce8\\u518c\\u7528\\u6237\",\"icon\":\"fa-user-md\",\"uri\":\"users\",\"roles\":[\"2\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 08:16:59', '2019-04-12 08:16:59');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:17:01', '2019-04-12 08:17:01');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:17:05', '2019-04-12 08:17:05');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:17:10', '2019-04-12 08:17:10');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:19:51', '2019-04-12 08:19:51');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:19:53', '2019-04-12 08:19:53');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:19:54', '2019-04-12 08:19:54');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:19:56', '2019-04-12 08:19:56');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:19:57', '2019-04-12 08:19:57');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:20:00', '2019-04-12 08:20:00');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:20:01', '2019-04-12 08:20:01');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:21:59', '2019-04-12 08:21:59');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:08', '2019-04-12 08:22:08');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:16', '2019-04-12 08:22:16');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:18', '2019-04-12 08:22:18');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:19', '2019-04-12 08:22:19');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:33', '2019-04-12 08:22:33');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:38', '2019-04-12 08:22:38');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:22:44', '2019-04-12 08:22:44');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:23:21', '2019-04-12 08:23:21');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:23:30', '2019-04-12 08:23:30');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:23:36', '2019-04-12 08:23:36');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/auth/menu/15/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:25:05', '2019-04-12 08:25:05');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/auth/menu/15', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u6ce8\\u518c\\u7528\\u6237\",\"icon\":\"fa-user-md\",\"uri\":null,\"roles\":[\"2\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/auth\\/menu\"}', '2019-04-12 08:25:19', '2019-04-12 08:25:19');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:25:21', '2019-04-12 08:25:21');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:25:26', '2019-04-12 08:25:26');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:25:27', '2019-04-12 08:25:27');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:25:37', '2019-04-12 08:25:37');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-align-left\",\"uri\":\"users\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"lMcOJzlUiuvCqRejiVdVFmZ9c3Wl2OvzuhvNeOIH\"}', '2019-04-12 08:27:22', '2019-04-12 08:27:22');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:27:24', '2019-04-12 08:27:24');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 08:27:32', '2019-04-12 08:27:32');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:37', '2019-04-12 08:27:37');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:38', '2019-04-12 08:27:38');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:42', '2019-04-12 08:27:42');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:48', '2019-04-12 08:27:48');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:49', '2019-04-12 08:27:49');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:55', '2019-04-12 08:27:55');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:27:59', '2019-04-12 08:27:59');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:28:12', '2019-04-12 08:28:12');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:28:21', '2019-04-12 08:28:21');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:28:25', '2019-04-12 08:28:25');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:33:16', '2019-04-12 08:33:16');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2019-04-12 08:33:21', '2019-04-12 08:33:21');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:34:41', '2019-04-12 08:34:41');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:34:48', '2019-04-12 08:34:48');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:34:52', '2019-04-12 08:34:52');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:34:55', '2019-04-12 08:34:55');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:35:20', '2019-04-12 08:35:20');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 08:45:03', '2019-04-12 08:45:03');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:45:13', '2019-04-12 08:45:13');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:45:20', '2019-04-12 08:45:20');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:48:13', '2019-04-12 08:48:13');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:48:14', '2019-04-12 08:48:14');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-04-12 08:48:17', '2019-04-12 08:48:17');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:48:19', '2019-04-12 08:48:19');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 08:48:25', '2019-04-12 08:48:25');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:02', '2019-04-12 09:08:02');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:02', '2019-04-12 09:08:02');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:05', '2019-04-12 09:08:05');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:05', '2019-04-12 09:08:05');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:13', '2019-04-12 09:08:13');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:16', '2019-04-12 09:08:16');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:23', '2019-04-12 09:08:23');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:32', '2019-04-12 09:08:32');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:43', '2019-04-12 09:08:43');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:08:43', '2019-04-12 09:08:43');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 09:08:56', '2019-04-12 09:08:56');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/auth/menu/16/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:07', '2019-04-12 09:09:07');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/auth/menu/16/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:09', '2019-04-12 09:09:09');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/auth/menu/16', 'PUT', '192.168.10.1', '{\"parent_id\":\"15\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-align-left\",\"uri\":\"users\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"FYBbEtc83BVTQVQcBlF6hS2KeGRmwChqpmzI6lo6\",\"_method\":\"PUT\"}', '2019-04-12 09:09:21', '2019-04-12 09:09:21');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-04-12 09:09:22', '2019-04-12 09:09:22');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:30', '2019-04-12 09:09:30');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:31', '2019-04-12 09:09:31');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:36', '2019-04-12 09:09:36');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:42', '2019-04-12 09:09:42');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:09:51', '2019-04-12 09:09:51');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:10:04', '2019-04-12 09:10:04');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:10:05', '2019-04-12 09:10:05');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 09:10:06', '2019-04-12 09:10:06');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 11:52:32', '2019-04-12 11:52:32');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 11:52:38', '2019-04-12 11:52:38');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 11:52:49', '2019-04-12 11:52:49');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:07:48', '2019-04-12 12:07:48');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:07:58', '2019-04-12 12:07:58');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:09:36', '2019-04-12 12:09:36');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:13:23', '2019-04-12 12:13:23');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:13:42', '2019-04-12 12:13:42');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:13:51', '2019-04-12 12:13:51');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:13:52', '2019-04-12 12:13:52');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:14:23', '2019-04-12 12:14:23');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:14:32', '2019-04-12 12:14:32');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:17:33', '2019-04-12 12:17:33');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:17:39', '2019-04-12 12:17:39');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:31:59', '2019-04-12 12:31:59');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 12:32:21', '2019-04-12 12:32:21');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:32:30', '2019-04-12 12:32:30');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:32:37', '2019-04-12 12:32:37');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:32:47', '2019-04-12 12:32:47');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:34:22', '2019-04-12 12:34:22');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:34:45', '2019-04-12 12:34:45');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:34:54', '2019-04-12 12:34:54');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 12:35:00', '2019-04-12 12:35:00');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:46:52', '2019-04-12 12:46:52');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 12:59:32', '2019-04-12 12:59:32');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-12 12:59:54', '2019-04-12 12:59:54');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:00:01', '2019-04-12 13:00:01');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:00:05', '2019-04-12 13:00:05');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:00:10', '2019-04-12 13:00:10');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:01:16', '2019-04-12 13:01:16');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:01:16', '2019-04-12 13:01:16');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-12 13:02:06', '2019-04-12 13:02:06');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:02:14', '2019-04-12 13:02:14');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 13:02:29', '2019-04-12 13:02:29');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-12 13:02:41', '2019-04-12 13:02:41');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-12 13:03:12', '2019-04-12 13:03:12');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-13 01:01:53', '2019-04-13 01:01:53');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:01:59', '2019-04-13 01:01:59');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:02', '2019-04-13 01:02:02');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:02', '2019-04-13 01:02:02');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:07', '2019-04-13 01:02:07');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:12', '2019-04-13 01:02:12');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:24', '2019-04-13 01:02:24');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:30', '2019-04-13 01:02:30');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:02:40', '2019-04-13 01:02:40');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 01:12:58', '2019-04-13 01:12:58');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 01:13:14', '2019-04-13 01:13:14');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 01:14:09', '2019-04-13 01:14:09');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/movies', 'POST', '192.168.10.1', '{\"name\":null,\"\\u5185\\u5bb9\":null,\"_token\":\"uVrFma4Je0vLcHOiYDCVdeOlrBaOguOzTAvpsF46\"}', '2019-04-13 01:20:27', '2019-04-13 01:20:27');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 01:20:30', '2019-04-13 01:20:30');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:20:44', '2019-04-13 01:20:44');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:20:46', '2019-04-13 01:20:46');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:20:52', '2019-04-13 01:20:52');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/movies/1', 'PUT', '192.168.10.1', '{\"name\":\"Dr. Hillary Gerhold PhD\",\"\\u5185\\u5bb9\":null,\"_token\":\"uVrFma4Je0vLcHOiYDCVdeOlrBaOguOzTAvpsF46\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies\"}', '2019-04-13 01:20:58', '2019-04-13 01:20:58');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:21:00', '2019-04-13 01:21:00');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/movies/1', 'PUT', '192.168.10.1', '{\"name\":\"Dr. Hillary Gerhold PhD\",\"\\u5185\\u5bb9\":\"<p><\\/p><p>1111111<br><\\/p>\",\"_token\":\"uVrFma4Je0vLcHOiYDCVdeOlrBaOguOzTAvpsF46\",\"_method\":\"PUT\"}', '2019-04-13 01:21:10', '2019-04-13 01:21:10');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:21:12', '2019-04-13 01:21:12');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:21:50', '2019-04-13 01:21:50');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:22:07', '2019-04-13 01:22:07');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:27:04', '2019-04-13 01:27:04');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:31:52', '2019-04-13 01:31:52');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:32:36', '2019-04-13 01:32:36');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 01:34:11', '2019-04-13 01:34:11');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:43:34', '2019-04-13 01:43:34');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:46:48', '2019-04-13 01:46:48');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 01:56:49', '2019-04-13 01:56:49');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:07:40', '2019-04-13 02:07:40');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:08:34', '2019-04-13 02:08:34');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:08:56', '2019-04-13 02:08:56');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:09:58', '2019-04-13 02:09:58');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:10:16', '2019-04-13 02:10:16');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:10:18', '2019-04-13 02:10:18');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:13:02', '2019-04-13 02:13:02');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"uVrFma4Je0vLcHOiYDCVdeOlrBaOguOzTAvpsF46\"}', '2019-04-13 02:13:12', '2019-04-13 02:13:12');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:14:21', '2019-04-13 02:14:21');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:14:31', '2019-04-13 02:14:31');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:17:29', '2019-04-13 02:17:29');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:18:32', '2019-04-13 02:18:32');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:20:11', '2019-04-13 02:20:11');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:21:57', '2019-04-13 02:21:57');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:25:31', '2019-04-13 02:25:31');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:26:06', '2019-04-13 02:26:06');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:26:46', '2019-04-13 02:26:46');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:26:53', '2019-04-13 02:26:53');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:39:23', '2019-04-13 02:39:23');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 02:40:53', '2019-04-13 02:40:53');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:41:01', '2019-04-13 02:41:01');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:57:10', '2019-04-13 02:57:10');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 02:59:33', '2019-04-13 02:59:33');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:00:04', '2019-04-13 03:00:04');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:00:13', '2019-04-13 03:00:13');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:01:02', '2019-04-13 03:01:02');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:01:26', '2019-04-13 03:01:26');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:01:58', '2019-04-13 03:01:58');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:03:09', '2019-04-13 03:03:09');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:03:22', '2019-04-13 03:03:22');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:03:57', '2019-04-13 03:03:57');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:03:58', '2019-04-13 03:03:58');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:04:32', '2019-04-13 03:04:32');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:04:37', '2019-04-13 03:04:37');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:04:42', '2019-04-13 03:04:42');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:05:23', '2019-04-13 03:05:23');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:05:35', '2019-04-13 03:05:35');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:10:36', '2019-04-13 03:10:36');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:10:47', '2019-04-13 03:10:47');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:17:34', '2019-04-13 03:17:34');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:24:22', '2019-04-13 03:24:22');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:26:00', '2019-04-13 03:26:00');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:27:05', '2019-04-13 03:27:05');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:30:37', '2019-04-13 03:30:37');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:31:14', '2019-04-13 03:31:14');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:31:37', '2019-04-13 03:31:37');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:32:25', '2019-04-13 03:32:25');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:38:03', '2019-04-13 03:38:03');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:41:26', '2019-04-13 03:41:26');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:42:22', '2019-04-13 03:42:22');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:44:58', '2019-04-13 03:44:58');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:45:55', '2019-04-13 03:45:55');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:48:17', '2019-04-13 03:48:17');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:50:43', '2019-04-13 03:50:43');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:51:11', '2019-04-13 03:51:11');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:57:22', '2019-04-13 03:57:22');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:58:37', '2019-04-13 03:58:37');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:58:38', '2019-04-13 03:58:38');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"xD0aEH9PIh4MgM0EZzFdZU0cFImyyicFaPZRd4m9\"}', '2019-04-13 03:58:46', '2019-04-13 03:58:46');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 03:59:01', '2019-04-13 03:59:01');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:59:09', '2019-04-13 03:59:09');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-13 03:59:32', '2019-04-13 03:59:32');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:59:38', '2019-04-13 03:59:38');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 03:59:43', '2019-04-13 03:59:43');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 03:59:49', '2019-04-13 03:59:49');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 04:00:03', '2019-04-13 04:00:03');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:01:01', '2019-04-13 04:01:01');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 04:01:08', '2019-04-13 04:01:08');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 04:01:45', '2019-04-13 04:01:45');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:02:28', '2019-04-13 04:02:28');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:02:53', '2019-04-13 04:02:53');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:03:00', '2019-04-13 04:03:00');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:03:12', '2019-04-13 04:03:12');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 04:06:10', '2019-04-13 04:06:10');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:07:23', '2019-04-13 04:07:23');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:07:27', '2019-04-13 04:07:27');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"YLMc0qCcHzl68ryImCAoSQoOILfQc9K3RXcloW7Z\"}', '2019-04-13 04:07:34', '2019-04-13 04:07:34');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:08:12', '2019-04-13 04:08:12');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:08:31', '2019-04-13 04:08:31');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:08:37', '2019-04-13 04:08:37');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:08:44', '2019-04-13 04:08:44');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:08:44', '2019-04-13 04:08:44');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:08:54', '2019-04-13 04:08:54');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:09:41', '2019-04-13 04:09:41');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:10:17', '2019-04-13 04:10:17');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:16:15', '2019-04-13 04:16:15');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:18:09', '2019-04-13 04:18:09');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:19:11', '2019-04-13 04:19:11');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:19:18', '2019-04-13 04:19:18');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:29:32', '2019-04-13 04:29:32');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:30:06', '2019-04-13 04:30:06');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:30:14', '2019-04-13 04:30:14');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:32:08', '2019-04-13 04:32:08');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:32:16', '2019-04-13 04:32:16');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:32:26', '2019-04-13 04:32:26');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:34:10', '2019-04-13 04:34:10');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:34:18', '2019-04-13 04:34:18');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:36:30', '2019-04-13 04:36:30');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:36:38', '2019-04-13 04:36:38');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:36:49', '2019-04-13 04:36:49');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:37:19', '2019-04-13 04:37:19');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:41:43', '2019-04-13 04:41:43');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"cZf27ehSYP0RhbPakLkeeCuIMcvOLKxbCW2CYAdW\"}', '2019-04-13 04:41:51', '2019-04-13 04:41:51');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:44:00', '2019-04-13 04:44:00');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:44:25', '2019-04-13 04:44:25');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:44:48', '2019-04-13 04:44:48');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:45:20', '2019-04-13 04:45:20');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:45:26', '2019-04-13 04:45:26');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:45:31', '2019-04-13 04:45:31');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:45:31', '2019-04-13 04:45:31');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 04:45:32', '2019-04-13 04:45:32');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:45:57', '2019-04-13 04:45:57');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:47:13', '2019-04-13 04:47:13');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:47:18', '2019-04-13 04:47:18');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:47:35', '2019-04-13 04:47:35');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:47:53', '2019-04-13 04:47:53');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:48:01', '2019-04-13 04:48:01');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:48:43', '2019-04-13 04:48:43');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:49:34', '2019-04-13 04:49:34');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:49:40', '2019-04-13 04:49:40');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:51:16', '2019-04-13 04:51:16');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:51:44', '2019-04-13 04:51:44');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:51:51', '2019-04-13 04:51:51');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:51:57', '2019-04-13 04:51:57');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:52:33', '2019-04-13 04:52:33');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:52:44', '2019-04-13 04:52:44');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:55:14', '2019-04-13 04:55:14');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:55:22', '2019-04-13 04:55:22');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 04:56:38', '2019-04-13 04:56:38');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 04:56:44', '2019-04-13 04:56:44');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:06:55', '2019-04-13 05:06:55');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:07:30', '2019-04-13 05:07:30');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:07:37', '2019-04-13 05:07:37');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:16:34', '2019-04-13 05:16:34');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:16:42', '2019-04-13 05:16:42');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:20:55', '2019-04-13 05:20:55');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:21:01', '2019-04-13 05:21:01');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:21:46', '2019-04-13 05:21:46');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:22:16', '2019-04-13 05:22:16');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:24:51', '2019-04-13 05:24:51');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:24:58', '2019-04-13 05:24:58');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:25:33', '2019-04-13 05:25:33');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:25:57', '2019-04-13 05:25:57');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:26:01', '2019-04-13 05:26:01');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:26:08', '2019-04-13 05:26:08');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:26:12', '2019-04-13 05:26:12');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/auth/users/2/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:32:43', '2019-04-13 05:32:43');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:32:52', '2019-04-13 05:32:52');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:32:59', '2019-04-13 05:32:59');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 05:33:02', '2019-04-13 05:33:02');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:33:09', '2019-04-13 05:33:09');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:36:52', '2019-04-13 05:36:52');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:38:05', '2019-04-13 05:38:05');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 05:38:27', '2019-04-13 05:38:27');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:38:40', '2019-04-13 05:38:40');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 05:39:52', '2019-04-13 05:39:52');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:17:14', '2019-04-13 06:17:14');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:17:51', '2019-04-13 06:17:51');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:17:58', '2019-04-13 06:17:58');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:20:44', '2019-04-13 06:20:44');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:20:53', '2019-04-13 06:20:53');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:22:00', '2019-04-13 06:22:00');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:22:12', '2019-04-13 06:22:12');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:27:12', '2019-04-13 06:27:12');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:27:20', '2019-04-13 06:27:20');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:27:37', '2019-04-13 06:27:37');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:28:00', '2019-04-13 06:28:00');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:28:18', '2019-04-13 06:28:18');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:29:48', '2019-04-13 06:29:48');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:29:55', '2019-04-13 06:29:55');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:30:31', '2019-04-13 06:30:31');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:30:39', '2019-04-13 06:30:39');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:31:00', '2019-04-13 06:31:00');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:33:24', '2019-04-13 06:33:24');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:33:32', '2019-04-13 06:33:32');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:34:43', '2019-04-13 06:34:43');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:34:51', '2019-04-13 06:34:51');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:39:45', '2019-04-13 06:39:45');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:39:52', '2019-04-13 06:39:52');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:40:49', '2019-04-13 06:40:49');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:41:42', '2019-04-13 06:41:42');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:41:50', '2019-04-13 06:41:50');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:42:28', '2019-04-13 06:42:28');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:42:35', '2019-04-13 06:42:35');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:42:52', '2019-04-13 06:42:52');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:42:58', '2019-04-13 06:42:58');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:43:38', '2019-04-13 06:43:38');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:44:03', '2019-04-13 06:44:03');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:44:10', '2019-04-13 06:44:10');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:46:03', '2019-04-13 06:46:03');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:46:10', '2019-04-13 06:46:10');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:46:55', '2019-04-13 06:46:55');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:47:04', '2019-04-13 06:47:04');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:47:28', '2019-04-13 06:47:28');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:47:34', '2019-04-13 06:47:34');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:54:58', '2019-04-13 06:54:58');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:55:06', '2019-04-13 06:55:06');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:57:34', '2019-04-13 06:57:34');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 06:57:41', '2019-04-13 06:57:41');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 06:59:52', '2019-04-13 06:59:52');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:00:00', '2019-04-13 07:00:00');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:00:27', '2019-04-13 07:00:27');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 07:02:57', '2019-04-13 07:02:57');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:03:04', '2019-04-13 07:03:04');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '[]', '2019-04-13 07:03:25', '2019-04-13 07:03:25');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:03:35', '2019-04-13 07:03:35');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:04:31', '2019-04-13 07:04:31');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/movies/1', 'PUT', '192.168.10.1', '{\"name\":\"Dr. Hillary Gerhold PhD\",\"content\":\"<p><img src=\\\"\\/storage\\/images\\/d2c636857c10808360a184354fe301d5.png\\\" style=\\\"max-width:50%;\\\" class=\\\"\\\"><br><\\/p>\",\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\",\"_method\":\"PUT\"}', '2019-04-13 07:04:49', '2019-04-13 07:04:49');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-13 07:04:49', '2019-04-13 07:04:49');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:04:55', '2019-04-13 07:04:55');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:05:06', '2019-04-13 07:05:06');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/movies/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:05:13', '2019-04-13 07:05:13');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:05:21', '2019-04-13 07:05:21');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/movies/2', 'PUT', '192.168.10.1', '{\"name\":\"Jaydon Kub\",\"content\":\"<p><\\/p><p><img src=\\\"\\/storage\\/images\\/d8051bcde3db7982bf2cdae54db4cdec.jpg\\\" style=\\\"max-width:50%;\\\" class=\\\"\\\"><br><\\/p>\",\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies\"}', '2019-04-13 07:05:55', '2019-04-13 07:05:55');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-13 07:05:57', '2019-04-13 07:05:57');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/movies/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:06:01', '2019-04-13 07:06:01');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/movies/1', 'PUT', '192.168.10.1', '{\"name\":\"Dr. Hillary Gerhold PhD\",\"content\":\"<p><\\/p><p><img src=\\\"\\/storage\\/images\\/d2c636857c10808360a184354fe301d5.png\\\" style=\\\"max-width:50%;\\\" class=\\\"w-e-selected\\\"><br><\\/p><p><br><\\/p>\",\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies\"}', '2019-04-13 07:06:14', '2019-04-13 07:06:14');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/movies', 'GET', '192.168.10.1', '[]', '2019-04-13 07:06:15', '2019-04-13 07:06:15');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:06:23', '2019-04-13 07:06:23');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 07:33:40', '2019-04-13 07:33:40');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:33:48', '2019-04-13 07:33:48');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 07:36:26', '2019-04-13 07:36:26');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:36:33', '2019-04-13 07:36:33');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:37:19', '2019-04-13 07:37:19');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:38:51', '2019-04-13 07:38:51');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:41:55', '2019-04-13 07:41:55');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:43:35', '2019-04-13 07:43:35');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:45:26', '2019-04-13 07:45:26');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:47:31', '2019-04-13 07:47:31');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:48:33', '2019-04-13 07:48:33');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:50:01', '2019-04-13 07:50:01');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:50:54', '2019-04-13 07:50:54');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:52:09', '2019-04-13 07:52:09');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:52:28', '2019-04-13 07:52:28');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:53:13', '2019-04-13 07:53:13');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:54:29', '2019-04-13 07:54:29');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 07:59:11', '2019-04-13 07:59:11');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:01:20', '2019-04-13 08:01:20');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:02:41', '2019-04-13 08:02:41');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:06:24', '2019-04-13 08:06:24');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:07:48', '2019-04-13 08:07:48');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:09:02', '2019-04-13 08:09:02');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:09:59', '2019-04-13 08:09:59');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/movies', 'POST', '192.168.10.1', '{\"name\":null,\"content\":\"<p><\\/p><p><br><\\/p>\",\"_token\":\"x22YzVCqpiWOme7fpyhD326KqrrnFT0wLujNxoxz\"}', '2019-04-13 08:10:18', '2019-04-13 08:10:18');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/movies/create', 'GET', '192.168.10.1', '[]', '2019-04-13 08:10:21', '2019-04-13 08:10:21');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:27', '2019-04-13 08:10:27');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:29', '2019-04-13 08:10:29');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:42', '2019-04-13 08:10:42');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:46', '2019-04-13 08:10:46');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:54', '2019-04-13 08:10:54');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:10:58', '2019-04-13 08:10:58');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:11:07', '2019-04-13 08:11:07');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:22', '2019-04-13 08:17:22');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:27', '2019-04-13 08:17:27');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:33', '2019-04-13 08:17:33');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:40', '2019-04-13 08:17:40');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:50', '2019-04-13 08:17:50');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_columns_\":\"id,email_verified_at,password,remember_token,created_at,updated_at\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:17:56', '2019-04-13 08:17:56');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_columns_\":\"created_at,updated_at\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:18:05', '2019-04-13 08:18:05');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:18:13', '2019-04-13 08:18:13');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:20:05', '2019-04-13 08:20:05');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:20:12', '2019-04-13 08:20:12');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:20:19', '2019-04-13 08:20:19');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:20:43', '2019-04-13 08:20:43');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:20:54', '2019-04-13 08:20:54');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:21:12', '2019-04-13 08:21:12');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:21:16', '2019-04-13 08:21:16');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}', '2019-04-13 08:21:22', '2019-04-13 08:21:22');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}', '2019-04-13 08:21:22', '2019-04-13 08:21:22');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2019-04-13 08:21:27', '2019-04-13 08:21:27');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:21:50', '2019-04-13 08:21:50');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name,created_at\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:21:56', '2019-04-13 08:21:56');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name,created_at\",\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:22:02', '2019-04-13 08:22:02');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_columns_\":\"id,name,created_at\",\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2019-04-13 08:22:19', '2019-04-13 08:22:19');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:22:33', '2019-04-13 08:22:33');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:00', '2019-04-13 08:25:00');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:01', '2019-04-13 08:25:01');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:03', '2019-04-13 08:25:03');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:09', '2019-04-13 08:25:09');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:23', '2019-04-13 08:25:23');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:25:40', '2019-04-13 08:25:40');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-13 08:35:48', '2019-04-13 08:35:48');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-17 16:43:57', '2019-04-17 16:43:57');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 16:44:24', '2019-04-17 16:44:24');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 16:44:32', '2019-04-17 16:44:32');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 16:44:37', '2019-04-17 16:44:37');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 16:44:47', '2019-04-17 16:44:47');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 17:16:16', '2019-04-17 17:16:16');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 17:16:18', '2019-04-17 17:16:18');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 17:16:20', '2019-04-17 17:16:20');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-04-17 17:16:22', '2019-04-17 17:16:22');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 17:16:29', '2019-04-17 17:16:29');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 17:16:35', '2019-04-17 17:16:35');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-19 19:55:26', '2019-04-19 19:55:26');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-19 19:55:49', '2019-04-19 19:55:49');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-21 11:03:01', '2019-04-21 11:03:01');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-21 11:03:05', '2019-04-21 11:03:05');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-21 11:03:09', '2019-04-21 11:03:09');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-21 11:03:12', '2019-04-21 11:03:12');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-04-22 09:07:23', '2019-04-22 09:07:23');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:32:47', '2019-04-22 12:32:47');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:32:54', '2019-04-22 12:32:54');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2019-04-22 12:33:00', '2019-04-22 12:33:00');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/movies/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:05', '2019-04-22 12:33:05');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:12', '2019-04-22 12:33:12');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/movies/22/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:16', '2019-04-22 12:33:16');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"Gkq2c4ThuuHMsaJmwlZ7GknKiW10vxaQHxrTjbrM\"}', '2019-04-22 12:33:23', '2019-04-22 12:33:23');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/movies/22', 'PUT', '192.168.10.1', '{\"name\":\"Dr. Eliane Cummerata V\",\"content\":\"<p><\\/p><p><img src=\\\"\\/storage\\/images\\/2019-04-22\\/61b30882be75eae29d824e8e8db2e19c.jpg\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"_token\":\"Gkq2c4ThuuHMsaJmwlZ7GknKiW10vxaQHxrTjbrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies?&page=2\"}', '2019-04-22 12:33:29', '2019-04-22 12:33:29');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2019-04-22 12:33:30', '2019-04-22 12:33:30');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/movies/21/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:36', '2019-04-22 12:33:36');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/uploads/postUploadPicture', 'POST', '192.168.10.1', '{\"_token\":\"Gkq2c4ThuuHMsaJmwlZ7GknKiW10vxaQHxrTjbrM\"}', '2019-04-22 12:33:44', '2019-04-22 12:33:44');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/movies/21', 'PUT', '192.168.10.1', '{\"name\":\"Minnie Boehm\",\"content\":\"<p><\\/p><p><img src=\\\"\\/storage\\/images\\/2019-04-22\\/e11ccf818f13ad63ed0bd3454e0bf66f.jpg\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"_token\":\"Gkq2c4ThuuHMsaJmwlZ7GknKiW10vxaQHxrTjbrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/app.test\\/admin\\/movies?&page=2\"}', '2019-04-22 12:33:47', '2019-04-22 12:33:47');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2019-04-22 12:33:48', '2019-04-22 12:33:48');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/movies/21/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:53', '2019-04-22 12:33:53');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:33:57', '2019-04-22 12:33:57');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/movies/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:34:01', '2019-04-22 12:34:01');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:34:06', '2019-04-22 12:34:06');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/movies/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:34:11', '2019-04-22 12:34:11');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/movies', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-22 12:34:14', '2019-04-22 12:34:14');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, '所有权限', '*', '', '*', NULL, '2019-04-12 06:55:54');
INSERT INTO `admin_permissions` VALUES (2, '仪表盘', 'dashboard', 'GET', '/', NULL, '2019-04-12 06:56:59');
INSERT INTO `admin_permissions` VALUES (3, '登录权限', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, '2019-04-12 06:58:48');
INSERT INTO `admin_permissions` VALUES (4, '用户设置', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, '2019-04-12 06:59:24');
INSERT INTO `admin_permissions` VALUES (5, '权限管理', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, '2019-04-12 07:00:18');
INSERT INTO `admin_permissions` VALUES (6, '管理员配置', 'ext.config', '', '/config*', '2019-04-12 02:46:51', '2019-04-12 07:01:41');
INSERT INTO `admin_permissions` VALUES (7, '管理员帮助', 'ext.helpers', '', '/helpers/*', '2019-04-12 02:50:56', '2019-04-12 07:02:01');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 16, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 3, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-04-12 02:11:55', '2019-04-12 02:11:55');
INSERT INTO `admin_roles` VALUES (2, '客服', 'customerservice', '2019-04-12 06:55:02', '2019-04-12 06:55:02');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
INSERT INTO `admin_user_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_user_permissions` VALUES (2, 3, NULL, NULL);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$p38/kekCY/gIKXpAt.Nu2efssJyYo5y3WqUu/l8gQ9CJwiq5Sz8ju', 'Administrator', NULL, 'KqLGokzrzH1Er9VikOXhz9x4W7b1nLO1EQBtVb1Ju8XSPc2MEUjgBgiFqrBN', '2019-04-12 02:11:55', '2019-04-12 02:11:55');
INSERT INTO `admin_users` VALUES (2, 'yujunnan', '$2y$10$G41rWFZBRQnbV9Yc2GDa6.aZJ79/wakpF/OSZduPPKWG5h3dS/hem', '于鋆南', 'images/df0cd3d630787864e912e0bc6c3f0420.jpg', 'uHyEqqIfwAuEe75Urv0VcprZSNLuNvok3XU66EQST0pvT82Gft4ntBYTAgDt', '2019-04-12 07:21:58', '2019-04-12 07:24:11');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片URL',
  `imageable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_imageable_type_imageable_id_index`(`imageable_type`, `imageable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (14, '/storage/images/708bd54d20252fe6ef45a6a2ab3fdac2.jpg', 'App\\Post', 19, '2019-04-22 11:17:09', '2019-04-22 11:17:09');
INSERT INTO `images` VALUES (15, '/storage/images/773914b33c106ba81e22b57a8a2c77ed.jpg', 'App\\Post', 21, '2019-04-22 11:31:20', '2019-04-22 11:31:20');
INSERT INTO `images` VALUES (16, '/storage/images/2ab188ba92c36bcc08b9104f013a92a1.jpg', 'App\\Post', 20, '2019-04-22 11:39:49', '2019-04-22 11:39:49');
INSERT INTO `images` VALUES (17, '/storage/images/75df72ed1747208c8130af6c12d8ea84.jpg', 'App\\Post', 18, '2019-04-22 22:40:15', '2019-04-22 22:40:15');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2017_07_17_040159_create_config_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_04_12_031310_create_permission_tables', 3);
INSERT INTO `migrations` VALUES (6, '2019_04_12_032550_create_posts_table', 4);
INSERT INTO `migrations` VALUES (7, '2019_04_12_062054_create_movies_table', 5);
INSERT INTO `migrations` VALUES (8, '2019_04_13_004912_alter_movies_add_content', 6);
INSERT INTO `migrations` VALUES (9, '2019_04_15_005202_alter_posts_add_field', 7);
INSERT INTO `migrations` VALUES (10, '2019_04_21_155419_create_images_table', 8);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 1);

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `movies_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (1, 'Dr. Hillary Gerhold PhD', '<p></p><p><img src=\"/storage/images/d2c636857c10808360a184354fe301d5.png\" style=\"max-width:50%;\" class=\"w-e-selected\"><br></p><p><br></p>', '2019-04-12 06:34:17', '2019-04-13 07:06:14');
INSERT INTO `movies` VALUES (2, 'Jaydon Kub', '<p></p><p><img src=\"/storage/images/d8051bcde3db7982bf2cdae54db4cdec.jpg\" style=\"max-width:50%;\" class=\"\"><br></p>', '2019-04-12 06:34:17', '2019-04-13 07:05:56');
INSERT INTO `movies` VALUES (3, 'Janis Gislason III', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (4, 'Dr. Carlie Schoen', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (5, 'Vance Cruickshank', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (6, 'Dr. Israel Doyle', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (7, 'Dr. Dianna Jenkins', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (8, 'Amber Wyman', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (9, 'Leila Will', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (10, 'Abelardo Baumbach PhD', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (11, 'Ella Fay', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (12, 'Ahmed Upton', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (13, 'Mr. Kenyon Connelly IV', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (14, 'Tracy Daniel Sr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (15, 'Felton Bergstrom', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (16, 'Destiney Bartoletti', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (17, 'Mya Stanton', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (18, 'Dr. Annette Goodwin', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (19, 'Bobby Medhurst', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (20, 'Gladyce Lemke', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (21, 'Minnie Boehm', '<p></p><p><img src=\"/storage/images/2019-04-22/e11ccf818f13ad63ed0bd3454e0bf66f.jpg\" style=\"max-width:100%;\"><br></p>', '2019-04-12 06:34:17', '2019-04-22 12:33:47');
INSERT INTO `movies` VALUES (22, 'Dr. Eliane Cummerata V', '<p></p><p><img src=\"/storage/images/2019-04-22/61b30882be75eae29d824e8e8db2e19c.jpg\" style=\"max-width:100%;\"><br></p>', '2019-04-12 06:34:17', '2019-04-22 12:33:29');
INSERT INTO `movies` VALUES (23, 'Celestine Shields', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (24, 'Samson Gutkowski I', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (25, 'Mavis Sauer', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (26, 'Dr. Tod Friesen Sr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (27, 'Destinee Ritchie', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (28, 'Bryce Runolfsdottir Sr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (29, 'Dr. Amya Aufderhar', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (30, 'June Dickens', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (31, 'Maureen Goldner III', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (32, 'Everette Little', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (33, 'Maynard Abernathy DVM', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (34, 'Juana Cole', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (35, 'Tatyana Runolfsdottir', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (36, 'Prof. Shayne Davis', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (37, 'Louie Huels DVM', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (38, 'Aisha Gleason', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (39, 'Prof. Jedidiah Kovacek Jr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (40, 'Ms. Caroline Hoeger', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (41, 'Delphine Schuster', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (42, 'Miss Noemie Klein II', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (43, 'Tommie Corkery', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (44, 'Miss Luella Lang PhD', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (45, 'Carley Marvin', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (46, 'Ezequiel Christiansen', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (47, 'Claudia Altenwerth', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (48, 'Mrs. Reina Lehner', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (49, 'Toby Kulas', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (50, 'Akeem Block', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (51, 'Eleanore Collins', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (52, 'Natalie Hill', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (53, 'Melody Jakubowski', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (54, 'Shyann Hudson', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (55, 'Randi Conn', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (56, 'Louisa Eichmann Jr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (57, 'Jewel Ward', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (58, 'Nels Quitzon', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (59, 'Tia Torphy', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (60, 'Dr. Cristal Harvey', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (61, 'Hilton Goyette', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (62, 'Clifford Greenholt', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (63, 'Prof. Dameon Stanton', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (64, 'Blake Nikolaus DDS', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (65, 'Edna VonRueden', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (66, 'Nadia Rippin', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (67, 'Mara Dickinson', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (68, 'Prof. Dixie Wolff', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (69, 'Alta Haley', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (70, 'Rubie Balistreri', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (71, 'Marion Kuhic DVM', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (72, 'Sarai Dare', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (73, 'Beryl Shanahan', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (74, 'Kenny Little', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (75, 'Donavon Batz', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (76, 'Prof. Tabitha Wuckert', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (77, 'Dr. Wellington Cruickshank I', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (78, 'Miss Era Anderson Sr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (79, 'Annabel Orn PhD', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (80, 'Luna Witting', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (81, 'Luz Smith', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (82, 'Katheryn Frami', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (83, 'Oren Paucek', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (84, 'Quinten Wiegand', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (85, 'Brandy VonRueden', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (86, 'Clark Kulas', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (87, 'Marshall Fadel', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (88, 'Charlotte White', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (89, 'Dr. Petra Hoppe Jr.', '', '2019-04-12 06:34:17', '2019-04-12 06:34:17');
INSERT INTO `movies` VALUES (90, 'Darren Homenick', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (91, 'Dr. Rowland Kris', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (92, 'Eddie Goodwin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (93, 'Augustus Bode', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (94, 'Bettie Abshire', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (95, 'Lela Bednar', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (96, 'Cornelius Ruecker', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (97, 'Dr. Sven Feil Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (98, 'Kameron Ebert', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (99, 'Alanis Sporer Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (100, 'Jay Altenwerth', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (101, 'Kali Heaney', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (102, 'Dr. Wyatt Kihn III', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (103, 'Dr. Kaylin Schultz', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (104, 'Mr. Estevan Hintz Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (105, 'Mr. Enos Ritchie', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (106, 'Mrs. Maya Gorczany', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (107, 'Giovanni Stokes Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (108, 'Hardy Walker', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (109, 'Xavier Dach', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (110, 'Julien Wilkinson', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (111, 'Henri White', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (112, 'Dr. Selmer Torp', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (113, 'Alena Kertzmann', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (114, 'Nicolas Douglas', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (115, 'Abdullah Kuphal', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (116, 'Dr. Aditya Fisher', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (117, 'Alexander Hagenes', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (118, 'Carmel Hill', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (119, 'Noah Johnson', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (120, 'Ariel Wiza', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (121, 'Lamont Bogan', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (122, 'Rafaela Kub Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (123, 'Zita Bergstrom', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (124, 'Prof. Raegan Baumbach', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (125, 'Dane Murphy', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (126, 'Nina Feest', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (127, 'Hal Kirlin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (128, 'Gloria Gorczany', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (129, 'Arch Schultz', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (130, 'Ayden Auer', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (131, 'Jessica Gerlach', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (132, 'General Prohaska', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (133, 'Claudie O\'Hara', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (134, 'Dr. Hector Sporer V', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (135, 'Otha Goodwin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (136, 'Prof. Germaine Cruickshank III', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (137, 'Creola Graham', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (138, 'Raheem Rice', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (139, 'Mr. Anastacio Connelly', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (140, 'Noel Friesen', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (141, 'Vern Mayer', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (142, 'Ms. Octavia Reichert', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (143, 'Deonte Robel', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (144, 'Prof. Araceli Prosacco III', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (145, 'Alfredo Rohan', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (146, 'Tiana Bartoletti', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (147, 'Dr. Ally Rempel DVM', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (148, 'Berneice Spencer DDS', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (149, 'Koby Gusikowski', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (150, 'Effie Mraz', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (151, 'Johnson Leannon V', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (152, 'Malcolm Daugherty', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (153, 'Bria McKenzie Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (154, 'Wilford Bergnaum Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (155, 'Leanne Strosin II', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (156, 'Savanna Hill PhD', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (157, 'Gerard Roob', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (158, 'Tiara Batz', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (159, 'Miss Wendy Miller', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (160, 'Jeffrey Graham', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (161, 'Wilfrid Wisozk', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (162, 'Mr. Deondre Luettgen', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (163, 'Jaunita Kunde', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (164, 'Bridie Champlin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (165, 'Salvador Conroy', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (166, 'Mr. Stewart Williamson MD', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (167, 'Sallie Crooks', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (168, 'Hector Krajcik', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (169, 'Dr. Elbert Jenkins', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (170, 'Barry Hamill', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (171, 'Dimitri Upton DVM', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (172, 'Juwan Howell II', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (173, 'Maurine Balistreri', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (174, 'Hilda Anderson', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (175, 'Maybelle Fadel', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (176, 'Darwin Boehm', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (177, 'Ruben Kuhic', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (178, 'Earline Leuschke', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (179, 'Rosalyn VonRueden', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (180, 'Gust Johns', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (181, 'Clyde Barrows', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (182, 'Prof. Cristal Gleason', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (183, 'Mr. Rolando Jast V', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (184, 'Lorna Gleichner', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (185, 'Stuart Wunsch', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (186, 'Deborah Monahan', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (187, 'Sam Borer', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (188, 'Prof. Laverne Olson MD', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (189, 'Carmen Torphy', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (190, 'Camila Breitenberg I', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (191, 'Orie Lueilwitz', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (192, 'Dr. Polly Cassin Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (193, 'Elmer Botsford', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (194, 'Cassie Wuckert PhD', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (195, 'Lorenzo Kohler', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (196, 'Dr. Piper Sanford DVM', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (197, 'Mrs. Eda Oberbrunner', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (198, 'Evan Block', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (199, 'Ms. Reyna Prosacco', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (200, 'Aditya Windler', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (201, 'Chase Baumbach DDS', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (202, 'Jacinto Johnston', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (203, 'Amaya Schmeler', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (204, 'Rebeka Bernhard', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (205, 'Ashton Kuphal', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (206, 'Cathrine Shields', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (207, 'Breanna Larkin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (208, 'Sophie Friesen', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (209, 'Prof. Janiya O\'Reilly', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (210, 'Callie Zemlak DVM', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (211, 'Skye Bayer', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (212, 'Wava Krajcik', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (213, 'Owen Klein', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (214, 'Colton Stracke', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (215, 'Elvis Hoeger', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (216, 'Leonardo Rodriguez', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (217, 'Mr. Brooks Herman', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (218, 'Prof. Leonardo Corkery Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (219, 'Prof. Maurine Cassin', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (220, 'Amie Pacocha', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (221, 'Floyd Dare', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (222, 'Effie Zulauf', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (223, 'Adalberto Sporer Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (224, 'Prof. Aisha Muller Sr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (225, 'Kali Kuvalis', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (226, 'Zora Klein II', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (227, 'Doyle Waters Jr.', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (228, 'Rodolfo Konopelski', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (229, 'Dr. Sebastian Casper', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (230, 'Jewel Jacobs', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (231, 'Prof. Jacinto Reinger', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (232, 'Madelyn Romaguera', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (233, 'Annabel Konopelski', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (234, 'Dr. Bill Rau IV', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (235, 'Gunnar Steuber', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (236, 'Ms. Lina Altenwerth', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (237, 'Candice Krajcik', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (238, 'Stella Spinka', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (239, 'Ryan Barrows', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (240, 'Janiya Morar', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (241, 'Ellie Grady', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (242, 'Nadia Sawayn', '', '2019-04-12 06:34:18', '2019-04-12 06:34:18');
INSERT INTO `movies` VALUES (243, 'Mariam Stokes', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (244, 'Verner Crona', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (245, 'Marcos Brown', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (246, 'Miss Drew Padberg Jr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (247, 'Mrs. Ona Stoltenberg II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (248, 'Carissa Lowe', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (249, 'Buck Schamberger III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (250, 'Salma McKenzie', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (251, 'Carey Hyatt', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (252, 'Ray Hegmann', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (253, 'Osborne Gottlieb', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (254, 'Mr. Khalil Hudson DDS', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (255, 'Stewart Rutherford V', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (256, 'Tania Farrell III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (257, 'Gaylord Schmitt', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (258, 'Crystel King', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (259, 'Leif Kreiger', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (260, 'Miss Wanda Haag I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (261, 'Christine White I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (262, 'Darlene Botsford DDS', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (263, 'Prof. Evans Trantow', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (264, 'Earnestine Rowe', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (265, 'Alysson Deckow', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (266, 'Suzanne Jaskolski', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (267, 'Robbie Feil', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (268, 'Clarabelle Champlin', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (269, 'Charity Volkman MD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (270, 'Dr. Emanuel Zboncak DVM', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (271, 'Prof. Samson Runolfsson', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (272, 'Tiana Nicolas', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (273, 'Katherine Sipes II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (274, 'Providenci Kirlin V', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (275, 'Ms. Caroline Olson', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (276, 'Antonietta Renner', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (277, 'Prof. Ofelia Harvey', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (278, 'Lucy Johnston Sr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (279, 'Dr. Hyman Boyle II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (280, 'Mr. Ramon Zulauf', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (281, 'Marguerite Greenholt', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (282, 'Prof. Glenda Lesch', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (283, 'Garrett Treutel', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (284, 'Alvera Weissnat', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (285, 'Mr. Odell Thompson DDS', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (286, 'Dr. Shany Schoen', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (287, 'Gretchen Dooley', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (288, 'Ms. Shanie Mante V', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (289, 'Layla Mohr', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (290, 'Marc Breitenberg', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (291, 'Prof. Vickie Wunsch II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (292, 'Edmund Gislason', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (293, 'Lurline Hoeger', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (294, 'Dr. Kevon Beahan PhD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (295, 'Ms. Krystina Jacobs PhD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (296, 'Sabryna Koelpin', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (297, 'Vincenzo Langosh', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (298, 'Mrs. Christine Botsford DVM', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (299, 'Rosemary Carroll DDS', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (300, 'Betsy Little', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (301, 'Darwin Lubowitz', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (302, 'Prof. Germaine Kuphal PhD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (303, 'Zula Kerluke', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (304, 'Vicente Medhurst', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (305, 'Lazaro Sipes', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (306, 'Geovanni Williamson', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (307, 'Caroline Abshire', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (308, 'Abel Ebert', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (309, 'Lottie Stanton MD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (310, 'Miss Isabelle Kutch', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (311, 'Dr. Kaley Medhurst DDS', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (312, 'Lina Russel', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (313, 'Celine Hermann', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (314, 'Misty Baumbach', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (315, 'Marley Koelpin', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (316, 'Jaquan Williamson', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (317, 'Dr. Bailee Mitchell I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (318, 'Annie Abernathy', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (319, 'Vella King', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (320, 'Prof. Malinda Heidenreich', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (321, 'Prof. Korbin Fay', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (322, 'Kari Runte', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (323, 'Irwin Kerluke', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (324, 'Eriberto Wehner', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (325, 'Hardy Feeney V', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (326, 'Brook King I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (327, 'Prof. Milo Sauer', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (328, 'Carolyn Hettinger', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (329, 'Beryl Ebert', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (330, 'Anastacio Schuppe III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (331, 'Madaline Strosin I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (332, 'Karelle Runolfsson', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (333, 'Dimitri Kunde', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (334, 'Buck Barrows', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (335, 'Peyton Cronin', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (336, 'Mallory Pfeffer', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (337, 'Rubie Morar', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (338, 'Dr. Kenny Gusikowski MD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (339, 'Stacey Weber', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (340, 'Shaniya Bernhard', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (341, 'Mr. Orlando Walker II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (342, 'Mossie Wilderman', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (343, 'Dr. Micah Lang IV', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (344, 'Dr. Jaqueline Johnston', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (345, 'Grady Heidenreich MD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (346, 'Morgan Durgan', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (347, 'Rosalinda Bogisich', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (348, 'Willy Kris', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (349, 'Norberto Purdy', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (350, 'Lisandro Beier', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (351, 'Bertram Swaniawski', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (352, 'Darrion Schmeler I', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (353, 'Dr. Holden Luettgen Jr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (354, 'Magdalen Rath PhD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (355, 'Harry Renner', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (356, 'Delfina Kerluke', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (357, 'Elaina Connelly', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (358, 'Robert Kuphal DVM', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (359, 'Eula Bashirian', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (360, 'Adeline D\'Amore II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (361, 'Rosemarie Kulas', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (362, 'Payton McGlynn II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (363, 'Laurie VonRueden', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (364, 'Gerry Spinka', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (365, 'Mr. Edmond Kutch', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (366, 'Mallory Turcotte III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (367, 'Donnie Ernser III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (368, 'Mrs. Mollie Murazik Jr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (369, 'Dr. Araceli Yundt', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (370, 'Linnea Hermann', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (371, 'Marcos Parker', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (372, 'Prof. Lizzie Carter Jr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (373, 'Arlo Glover', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (374, 'Mrs. Elizabeth Schmitt DVM', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (375, 'Daren Blick', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (376, 'Delilah Cartwright', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (377, 'Vallie Kuphal', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (378, 'Mrs. Karina Frami MD', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (379, 'Imogene Adams', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (380, 'Collin VonRueden', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (381, 'Roxane Wuckert V', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (382, 'Zachariah Fay II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (383, 'Lori Simonis Jr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (384, 'Myrtice Casper', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (385, 'Jaron Mann', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (386, 'Yoshiko Pacocha', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (387, 'Mr. Nikolas Strosin II', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (388, 'Dr. Mac Price', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (389, 'Mr. Gene Sauer III', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (390, 'Dorris Kiehn', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (391, 'Ms. Shany Nienow Sr.', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (392, 'Hank Lowe DVM', '', '2019-04-12 06:34:19', '2019-04-12 06:34:19');
INSERT INTO `movies` VALUES (393, 'Mona Klocko', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (394, 'Dr. Darwin Bednar Jr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (395, 'Avery Morissette', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (396, 'Thomas Lowe', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (397, 'Lucio Sipes', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (398, 'Eryn Deckow', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (399, 'Lempi Gaylord', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (400, 'Miss Paige Morissette', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (401, 'Dr. Genevieve Fisher', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (402, 'Clara Pagac', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (403, 'Dr. Asha McClure MD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (404, 'Mr. Carleton Sipes', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (405, 'Perry Greenfelder II', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (406, 'Ubaldo Mosciski', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (407, 'Maribel Kuhlman', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (408, 'Donny Schulist', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (409, 'Yasmin Green', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (410, 'Miss Joanne Stokes', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (411, 'Darrion Kessler', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (412, 'Kayla Goodwin', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (413, 'Stephany Hegmann', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (414, 'Devyn Wiza', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (415, 'Eryn Walsh', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (416, 'Leonora Labadie III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (417, 'Ms. Elinore Vandervort Jr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (418, 'Audra Cartwright PhD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (419, 'Raphael Skiles DVM', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (420, 'Juanita Jacobi', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (421, 'Berta Wintheiser', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (422, 'Everett Gulgowski', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (423, 'Kariane Rowe', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (424, 'Albertha Hand', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (425, 'Coralie Rempel', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (426, 'Mr. Emmitt Hahn', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (427, 'Alexandrine Frami', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (428, 'Camren Kuhic', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (429, 'Weston Abshire', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (430, 'Yessenia Runolfsdottir', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (431, 'Modesta Ortiz', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (432, 'Randal Williamson', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (433, 'Mrs. Elyssa Brakus', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (434, 'Marcellus Steuber', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (435, 'Dr. Aileen Mayer IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (436, 'Avery Wiza', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (437, 'Miss Petra Hane', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (438, 'Prof. Tiffany Parisian III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (439, 'Dallin Hansen', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (440, 'Durward Koss', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (441, 'Lucile Torphy MD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (442, 'Stone Wunsch', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (443, 'Aubree Lindgren', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (444, 'Beth Lemke', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (445, 'Dr. Claire Koepp', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (446, 'Alvah Towne IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (447, 'Prof. Lisa Hyatt', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (448, 'Breana Abbott Sr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (449, 'Tyree Beatty', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (450, 'Jonathan Parker I', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (451, 'Mrs. Mikayla Ledner Sr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (452, 'Prof. Adah Swift', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (453, 'Gladys Gorczany', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (454, 'Floy Effertz', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (455, 'Prof. Shanelle Bergstrom IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (456, 'Ellsworth Macejkovic', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (457, 'Rosalee Dicki I', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (458, 'Kamryn Hodkiewicz', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (459, 'Hank Yundt', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (460, 'Enid Legros', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (461, 'Winifred Hirthe IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (462, 'Prof. Amelia Lehner', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (463, 'Mr. Regan Green', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (464, 'Susanna Feest', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (465, 'Dr. Aurelio Corkery II', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (466, 'Dr. Zaria Kunde V', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (467, 'Chad Kemmer', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (468, 'Dr. Lenore Aufderhar III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (469, 'Icie Doyle', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (470, 'Dr. Krystal Cassin MD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (471, 'Cara Funk', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (472, 'Julianne Schultz', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (473, 'Scottie Barton', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (474, 'Vivian Flatley', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (475, 'Lenna Morissette II', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (476, 'Ahmed Grimes', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (477, 'Miss Rebecca Davis III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (478, 'Edison Stroman', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (479, 'Orlo Hauck', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (480, 'Mr. Alexys Harris', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (481, 'Avery Bergnaum', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (482, 'Prof. Meaghan Orn', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (483, 'Prof. Erwin Rutherford Jr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (484, 'Reynold VonRueden', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (485, 'Arvel Yost', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (486, 'Oral Deckow', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (487, 'Aileen Graham', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (488, 'Jenifer O\'Keefe', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (489, 'Malachi Tremblay', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (490, 'Marcella Huel III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (491, 'Kitty Brakus', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (492, 'Shania Ferry', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (493, 'Dr. Raheem O\'Kon', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (494, 'Izaiah Gislason', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (495, 'America Gislason', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (496, 'Eryn Nicolas', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (497, 'Miss Raphaelle Hoppe', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (498, 'Armand Adams DVM', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (499, 'Aaliyah Crooks', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (500, 'Albina Kohler', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (501, 'Ms. Georgiana Schiller', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (502, 'Torey Dicki', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (503, 'Jaylon Hoppe', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (504, 'Kamille Ziemann', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (505, 'Annetta Pfeffer', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (506, 'Miss Therese Keeling', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (507, 'Filomena Sauer Jr.', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (508, 'Bert Herman', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (509, 'Henderson Lehner', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (510, 'Mr. Marcellus Purdy', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (511, 'Prof. Archibald Runte', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (512, 'Mr. Kamryn Adams', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (513, 'Lottie Wilderman', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (514, 'Talia Shields', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (515, 'Evans Williamson', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (516, 'Lucius Barrows MD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (517, 'Miss Patricia Dooley', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (518, 'Corrine Raynor', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (519, 'Aileen Murray', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (520, 'Prof. Flavio Upton', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (521, 'Anabel Skiles', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (522, 'Marco Tremblay', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (523, 'Prof. Harvey Smith DDS', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (524, 'Melissa Weissnat', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (525, 'Shanon Friesen', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (526, 'Torey Weber MD', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (527, 'Roosevelt Stanton', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (528, 'Matilde Wisoky', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (529, 'Dr. Enrico Koch III', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (530, 'Delfina Kreiger', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (531, 'Reece Nikolaus', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (532, 'Mrs. Eldora Reynolds', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (533, 'Mrs. Eldridge Mante', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (534, 'Dolly Konopelski', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (535, 'Dr. Scot Stanton IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (536, 'Dr. Kaela Kovacek', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (537, 'Mrs. Noemi Douglas IV', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (538, 'Dr. Melba Hettinger', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (539, 'Miss Dayna Kohler', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (540, 'Miss Sabrina Weimann V', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (541, 'Marina Bartell', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (542, 'Dakota Corkery', '', '2019-04-12 06:34:20', '2019-04-12 06:34:20');
INSERT INTO `movies` VALUES (543, 'Ana Denesik', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (544, 'Kendrick Volkman', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (545, 'Sadie Friesen', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (546, 'Enid Rippin', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (547, 'Bert Torp', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (548, 'Dr. Cesar VonRueden', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (549, 'Mr. Brando Cronin', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (550, 'Mrs. Maggie Skiles I', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (551, 'Dr. Lenny Jenkins', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (552, 'Angeline Weber', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (553, 'Nestor Williamson IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (554, 'Johnathan Wilderman', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (555, 'Elinor Littel DVM', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (556, 'Mr. Cameron Cartwright', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (557, 'Heather Leuschke PhD', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (558, 'Zechariah Kihn', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (559, 'Prof. Lorenzo Carroll', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (560, 'Dr. Deanna Doyle', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (561, 'Jerod Wolff', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (562, 'Arden Walter', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (563, 'Otilia Price', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (564, 'Alisha Shields', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (565, 'Maude Runolfsdottir', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (566, 'Ms. Josiane Franecki V', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (567, 'Angelica Toy', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (568, 'Dr. Jake Hahn II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (569, 'Dortha Dietrich', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (570, 'Dallas Schmidt', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (571, 'Emma Kling', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (572, 'Aniyah Strosin V', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (573, 'River Keebler', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (574, 'Antwon Gorczany Jr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (575, 'Rick Funk II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (576, 'Monica Prohaska', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (577, 'Rolando Turner', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (578, 'Maye Legros', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (579, 'Elias Spinka DDS', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (580, 'Jeffrey Reichert', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (581, 'Deangelo Spencer', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (582, 'Dr. Lawson Feest', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (583, 'Mr. Elliott Romaguera II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (584, 'Sibyl Berge', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (585, 'Maybelle Runte', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (586, 'Dr. Brooklyn Stehr DDS', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (587, 'Carey Jenkins', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (588, 'Therese Pouros', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (589, 'Martin Turcotte', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (590, 'Cyrus Hammes', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (591, 'Nia Rippin', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (592, 'Mr. Bobby Crooks', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (593, 'Mr. Soledad Wuckert DVM', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (594, 'Kyle Prohaska', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (595, 'Jayden Bradtke IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (596, 'Kirstin Walsh V', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (597, 'Odell Leffler', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (598, 'Mr. Marley Denesik Sr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (599, 'Alysson Cartwright', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (600, 'Mr. Antonio Lemke', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (601, 'Mrs. Lexi Green', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (602, 'Monroe Langosh', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (603, 'Ocie Schroeder', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (604, 'Susan Gaylord', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (605, 'Dorian Stiedemann', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (606, 'Paige Rempel', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (607, 'Ivory Fahey', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (608, 'Adan Schmidt', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (609, 'Felipa Dickens', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (610, 'Oma Sporer', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (611, 'Mrs. Precious Haag', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (612, 'Arno Altenwerth', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (613, 'Trycia Kemmer', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (614, 'Jimmy Parisian', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (615, 'Kennedy McKenzie Jr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (616, 'Destiny Hilpert II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (617, 'Frederique Yundt', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (618, 'Prof. Duane Morar DDS', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (619, 'Kathlyn Hirthe', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (620, 'Micaela Sporer Sr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (621, 'Bruce Rice', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (622, 'Zoila Dickinson', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (623, 'Lilian Rutherford', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (624, 'Arielle Ritchie', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (625, 'Prof. Keith Lesch Jr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (626, 'Prof. Joanne Nikolaus Sr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (627, 'Marianna Haag', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (628, 'Prof. Leta Collins', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (629, 'Miss Ruthe Rolfson V', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (630, 'Ms. Erica Schaden I', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (631, 'Dr. Orrin Botsford', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (632, 'Orpha Lockman III', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (633, 'Erick Gaylord', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (634, 'Prof. Kamron Bode', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (635, 'Hildegard Rempel Jr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (636, 'Dr. Clarissa Stokes', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (637, 'Mrs. Cierra Corkery', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (638, 'Ms. Dahlia Konopelski', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (639, 'Felicita Schulist', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (640, 'Prof. Lenore Medhurst II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (641, 'Dr. Alexzander Parker IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (642, 'Jettie Fritsch', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (643, 'Chadd Schneider', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (644, 'Gloria Marks', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (645, 'Steve Leuschke', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (646, 'Kelton Donnelly', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (647, 'Ms. Kailey Lakin', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (648, 'Ben Konopelski', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (649, 'Murphy Hoppe I', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (650, 'Miss Madaline Kulas', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (651, 'Beau Padberg', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (652, 'Prof. Addie Barrows', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (653, 'Dr. Darron McKenzie', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (654, 'Mrs. Dakota Kautzer DVM', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (655, 'Tyrese Watsica', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (656, 'Dr. Carolyne Fadel', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (657, 'Aliyah Breitenberg', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (658, 'Joseph Friesen', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (659, 'Aubrey Jacobi', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (660, 'Avis Rutherford', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (661, 'Marty Schiller', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (662, 'Nasir Crona', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (663, 'Dr. Mercedes Zulauf', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (664, 'Velva Beahan', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (665, 'Helene Blanda Jr.', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (666, 'Mr. Walter Batz', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (667, 'Kolby Bogisich', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (668, 'Freeda Miller', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (669, 'Eve Halvorson IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (670, 'Mattie Toy', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (671, 'Sadie Stoltenberg IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (672, 'Effie Shanahan I', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (673, 'Dejah Bailey', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (674, 'Cyril Green II', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (675, 'Prof. Ricky Osinski', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (676, 'Beatrice Funk', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (677, 'Ms. Savanna Lynch', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (678, 'Nathan Swaniawski', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (679, 'Santina Fadel', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (680, 'Carlos Casper', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (681, 'Prof. Vincenzo Labadie', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (682, 'Darren Lynch', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (683, 'Janick McCullough MD', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (684, 'Miracle Kutch', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (685, 'Dortha Christiansen', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (686, 'Daniella Hoppe', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (687, 'Dean Russel IV', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (688, 'Dr. Rollin Kilback', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (689, 'Prof. Jazmin Jakubowski', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (690, 'Mohammad Rice', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (691, 'Hanna Lemke', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (692, 'Brooks Anderson', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (693, 'Vesta Schiller', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (694, 'Ansley Moen', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (695, 'Ms. Juanita Stanton', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (696, 'Leopoldo Cronin', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (697, 'Bartholome Lockman', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (698, 'Prof. Naomie Padberg', '', '2019-04-12 06:34:21', '2019-04-12 06:34:21');
INSERT INTO `movies` VALUES (699, 'Amya Rippin', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (700, 'Noemie Brekke', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (701, 'Cleve Lesch', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (702, 'Prof. Skylar Gibson', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (703, 'Bernardo Aufderhar', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (704, 'Mr. Benjamin Strosin', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (705, 'Jeffry Grimes', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (706, 'Miss Marlee Grady', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (707, 'Leonie Ryan III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (708, 'Mr. Pierce Wehner', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (709, 'Camila Stiedemann', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (710, 'Hershel Hill', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (711, 'Alexandro Swaniawski', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (712, 'Lindsay Hettinger', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (713, 'London Beatty', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (714, 'Mrs. Sister Eichmann DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (715, 'Kamren Zulauf', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (716, 'Allan Lehner DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (717, 'Euna Labadie DDS', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (718, 'Karli Kuhn', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (719, 'Camden Hagenes III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (720, 'Alivia Brakus', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (721, 'Jarrod Denesik', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (722, 'Jennings Oberbrunner', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (723, 'Miss Beverly Padberg I', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (724, 'Keaton Bins', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (725, 'Baylee Waelchi', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (726, 'Dr. Olen Rempel', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (727, 'Kamron Larson II', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (728, 'Minnie Collins', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (729, 'Lulu Durgan IV', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (730, 'Amelia Barrows', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (731, 'Krista Hermann', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (732, 'Brennan Wehner', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (733, 'Gina Padberg', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (734, 'Christina Schulist', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (735, 'Bennie Kovacek', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (736, 'German Balistreri', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (737, 'Dr. Vernice Nolan', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (738, 'Dillan Rogahn', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (739, 'Evan Howell', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (740, 'Kelli Ullrich', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (741, 'Dr. Scottie Hudson', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (742, 'Miss Maribel Mante', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (743, 'Marilie Braun', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (744, 'Delbert Bailey', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (745, 'Adaline Altenwerth', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (746, 'Craig Pacocha', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (747, 'Alexane Gerlach', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (748, 'Frederic Waelchi DDS', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (749, 'Mossie Waters', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (750, 'Tad Schuster DDS', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (751, 'Christ Renner', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (752, 'Noble Littel III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (753, 'Gracie Kunde II', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (754, 'Burley Schaefer', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (755, 'Mr. Ulises Koepp DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (756, 'Wendy Heaney DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (757, 'Judson Mosciski', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (758, 'Vicky Kihn', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (759, 'Lindsey Nader', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (760, 'Hertha Emard DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (761, 'Amir Cruickshank', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (762, 'Helene Cummerata', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (763, 'Nathanial Larson', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (764, 'Dr. Ashlee Wintheiser', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (765, 'Johnathan Metz', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (766, 'Hassie Williamson', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (767, 'Miss Annabelle Dickinson PhD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (768, 'Dale Mayert PhD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (769, 'Prof. Elta O\'Hara', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (770, 'Reanna O\'Kon MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (771, 'Mr. Marcelino Kohler', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (772, 'Michelle Crona', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (773, 'Mrs. Norene Fay IV', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (774, 'Valentine Green', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (775, 'Alessia Ratke', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (776, 'Lexie Jenkins Sr.', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (777, 'Barry Keeling II', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (778, 'Ines Moore DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (779, 'Audrey Gerhold MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (780, 'Elsa Herzog', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (781, 'Alexandria Hane', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (782, 'Mrs. Kaylie Ziemann', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (783, 'Ms. Amara Hessel', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (784, 'Braden Reynolds', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (785, 'Mrs. Katarina Rodriguez III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (786, 'Ayden Toy', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (787, 'Kaylie Labadie', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (788, 'Dave Bartoletti', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (789, 'Ms. Winnifred Bayer', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (790, 'Freda Schulist MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (791, 'Shayna Streich', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (792, 'Margarett Schowalter', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (793, 'Shaina Ritchie', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (794, 'Lera Predovic', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (795, 'Elisabeth Gaylord', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (796, 'Andy Kuhic', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (797, 'Kelsie Rau DDS', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (798, 'Kaitlyn Raynor', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (799, 'Tod Streich Jr.', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (800, 'Yazmin Towne', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (801, 'Dr. Ruby Kozey III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (802, 'Evert Stark', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (803, 'Mr. Freddy Robel IV', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (804, 'Arlene Cronin', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (805, 'Dino Larkin', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (806, 'Marlee Rosenbaum', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (807, 'Izabella Kutch', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (808, 'Prof. Hunter Stracke I', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (809, 'Prof. Jany Wiegand', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (810, 'Ottis Jenkins', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (811, 'Prof. Mina Breitenberg Sr.', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (812, 'Antonetta Spinka', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (813, 'Mr. Jarod O\'Kon MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (814, 'Ms. Holly Runte MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (815, 'Bennett Herzog', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (816, 'Domenic Lowe', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (817, 'Dr. Arvilla Murazik', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (818, 'Dr. Meggie Paucek I', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (819, 'Miss Crystal Corwin MD', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (820, 'Gerard Torphy IV', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (821, 'Mrs. Isabel Schimmel I', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (822, 'Halie Rath', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (823, 'Estell Lueilwitz', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (824, 'Sterling Wunsch', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (825, 'Molly Bayer', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (826, 'Edmond Kiehn I', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (827, 'Alfredo Borer', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (828, 'Dr. Michele Daugherty II', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (829, 'Federico Mertz', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (830, 'Prof. Kaia Franecki II', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (831, 'Mrs. Diana Lakin III', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (832, 'Mollie Beatty', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (833, 'Madeline Smitham DVM', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (834, 'Joshuah Koepp', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (835, 'Oliver Streich', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (836, 'Mckayla Von', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (837, 'Virgil Miller', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (838, 'Emmitt Rippin', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (839, 'Lester Shields', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (840, 'Prof. Jaren White Sr.', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (841, 'Hipolito Renner', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (842, 'Hosea Herman', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (843, 'Dr. Kristin Jaskolski V', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (844, 'Mr. Efren Emmerich DDS', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (845, 'Henri Brekke Jr.', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (846, 'Isom Gaylord', '', '2019-04-12 06:34:22', '2019-04-12 06:34:22');
INSERT INTO `movies` VALUES (847, 'Lazaro Langworth', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (848, 'Dorian Lockman', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (849, 'Salvador Stracke III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (850, 'Evangeline Berge', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (851, 'Alexandria Prosacco MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (852, 'Prof. Ulises Wunsch II', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (853, 'Mrs. Marisa Larson Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (854, 'Josue Harber', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (855, 'Danika Kemmer', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (856, 'Mr. Payton Schinner', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (857, 'Justine Dietrich', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (858, 'Nannie Wunsch', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (859, 'Stephanie Thiel', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (860, 'Janet Turcotte', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (861, 'Lucinda Schulist', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (862, 'Jonas Hills', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (863, 'Prof. Delphia Keeling', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (864, 'Mckenna Kassulke I', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (865, 'Julie Schmidt III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (866, 'Mr. Jonathan Shields', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (867, 'Noemie Krajcik', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (868, 'Prof. Shayne Schumm III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (869, 'Trycia Keeling', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (870, 'Einar Berge', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (871, 'Jordyn West III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (872, 'Orpha Reynolds', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (873, 'Andre Hermann', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (874, 'Prof. Jarred Doyle III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (875, 'Mallory Hoppe', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (876, 'Annalise Veum', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (877, 'Lenora Eichmann', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (878, 'Dr. Vern Powlowski DDS', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (879, 'Hipolito Brakus I', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (880, 'Josie Cummings V', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (881, 'Devan Leannon', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (882, 'Tiffany Hermann', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (883, 'Charlotte Pfannerstill Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (884, 'Prof. Lindsay Russel', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (885, 'Anastacio Jacobson', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (886, 'Prof. Arianna Brown I', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (887, 'Alanna Kilback', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (888, 'Toney Reynolds V', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (889, 'Kaela Skiles II', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (890, 'Claudie Dach', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (891, 'Keeley Hill', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (892, 'Nikita Terry', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (893, 'Olga Conn', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (894, 'Mr. Cornelius Daugherty Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (895, 'Nia Altenwerth', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (896, 'Dolly Hoeger MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (897, 'Magnus Kling', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (898, 'Jaquelin Casper III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (899, 'Mrs. Margaretta Beahan', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (900, 'Magdalena Wisoky III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (901, 'Stuart Greenholt', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (902, 'Haskell Will II', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (903, 'Darrick Homenick III', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (904, 'Dora Blick DDS', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (905, 'Uriel Walker', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (906, 'Lucas Graham', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (907, 'Pinkie Bernier', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (908, 'Carley Hermiston', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (909, 'Althea Tremblay', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (910, 'Jessie Wolff', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (911, 'Pattie Koss', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (912, 'Kaycee McLaughlin', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (913, 'Dr. Cory Smitham DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (914, 'Carissa Abernathy', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (915, 'Clay McGlynn', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (916, 'Ms. Isabell Price', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (917, 'Isobel Deckow', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (918, 'Miss Alana Corwin', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (919, 'Keagan O\'Conner', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (920, 'Colten Cummings', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (921, 'Dr. Orlo Batz', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (922, 'Dr. Albertha Sporer', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (923, 'Prof. Katelynn Konopelski', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (924, 'Hellen Towne', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (925, 'Jerel Kozey', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (926, 'Lisa Schiller MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (927, 'Dexter Franecki Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (928, 'Jennie Bode', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (929, 'Shaun Vandervort DDS', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (930, 'Mr. Jordyn Lubowitz MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (931, 'Dr. Tod Renner MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (932, 'Jaren Cole Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (933, 'Roberta Morissette', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (934, 'Kaleb Farrell', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (935, 'Prof. Brock Leffler', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (936, 'Clemmie Graham', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (937, 'Jerome Larson', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (938, 'Tremaine Cartwright', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (939, 'Jamarcus Labadie', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (940, 'Tia Schumm', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (941, 'Savanna Stamm DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (942, 'Mr. Johnathan Hills MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (943, 'Jordi Keeling Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (944, 'Raphaelle Turcotte Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (945, 'Thea McGlynn V', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (946, 'Margarette Hilpert IV', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (947, 'Austin Kutch', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (948, 'Lonny Hartmann II', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (949, 'Dr. Verlie Brown IV', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (950, 'Mr. Harvey Larkin Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (951, 'Susana Fadel', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (952, 'Prof. Jedediah Denesik PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (953, 'Zander Lindgren', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (954, 'Claire Fahey', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (955, 'Dr. Velda Walker Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (956, 'Maybelle Koss PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (957, 'Kenna Borer', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (958, 'Nakia Koepp', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (959, 'Antwon Kerluke', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (960, 'Jermain Thompson', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (961, 'Prof. Ryder Blick Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (962, 'Genevieve Mosciski PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (963, 'Katelyn Legros', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (964, 'Xander Franecki', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (965, 'Dr. Lonnie Nienow', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (966, 'Dr. Yvonne Farrell Sr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (967, 'Malvina Swift DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (968, 'Juliana Wintheiser DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (969, 'Chet Walker', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (970, 'Dr. Reta Leannon DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (971, 'Hailee Spencer', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (972, 'Kiara Shanahan', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (973, 'Garret Zemlak MD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (974, 'Celestine Lynch', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (975, 'Prof. Alana Hilpert IV', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (976, 'Mr. Bernie Eichmann PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (977, 'Ms. Mariela Altenwerth II', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (978, 'Prof. Roslyn Prosacco', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (979, 'Jed Ondricka V', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (980, 'Fred Roberts', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (981, 'Isabelle Fay Jr.', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (982, 'Dax Torphy', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (983, 'Guadalupe Cruickshank', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (984, 'Emory Conn', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (985, 'Conrad Boyle PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (986, 'Dr. Oma Murphy', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (987, 'Prof. Marcelo Reichel I', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (988, 'Prof. Mabelle Terry', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (989, 'Miss Christina Hagenes DVM', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (990, 'Miss Leora Abshire', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (991, 'Fredrick VonRueden', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (992, 'Joy Stehr', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (993, 'Mr. Rasheed Kirlin PhD', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (994, 'Jake Gleichner', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (995, 'Collin Marquardt', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (996, 'Ms. Nola Steuber', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (997, 'Treva Kuhlman', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (998, 'Leta Considine', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (999, 'Dr. Kylee Kub', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (1000, 'D\'angelo Grady', '', '2019-04-12 06:34:23', '2019-04-12 06:34:23');
INSERT INTO `movies` VALUES (1001, '流浪地区', '', '2019-04-12 07:17:21', '2019-04-12 07:17:21');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('1804905923@qq.com', '$2y$10$ziKE.sWsHGcRukV1ZON.heaV1HtV6uupI3x3jXnBA.n87VWnlxK8e', '2019-04-20 12:11:02');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'Create Post', 'web', '2019-04-12 03:54:33', '2019-04-12 03:54:33');
INSERT INTO `permissions` VALUES (2, 'Edit Post', 'web', '2019-04-12 03:54:48', '2019-04-12 03:54:48');
INSERT INTO `permissions` VALUES (3, 'Delete Post', 'web', '2019-04-12 03:55:05', '2019-04-12 03:55:05');
INSERT INTO `permissions` VALUES (4, 'Administer roles & permissions', 'web', '2019-04-12 03:57:07', '2019-04-12 03:57:07');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `published_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'Harum non quisquam laboriosam.', 'harum-non-quisquam-laboriosam', 'Ut aut aut omnis incidunt odio nostrum enim. Laudantium dolore velit voluptas eligendi officia doloribus. Est qui cupiditate quidem molestias quis.\n\nFacere omnis eligendi aut ducimus vel. Et enim sint aliquid laboriosam illo quae voluptates. Minus accusantium reprehenderit illum quis.\n\nSit aliquid porro quibusdam quia. Corporis iure est dolore corporis quia asperiores veritatis perspiciatis. Non minus et quod autem enim nihil eum atque.\n\nVoluptatem sequi non deserunt deserunt. Ad magnam sequi autem porro nulla. Porro nisi ducimus recusandae quidem illum. Maiores et omnis placeat veniam aut assumenda.\n\nRepellat quis libero sint exercitationem placeat. Est ut ut maiores non. Voluptatum aspernatur tempora quia fuga. Eum aspernatur voluptas et consectetur quam atque.\n\nAlias in aut numquam officia id laboriosam et dolorem. Similique eum ex est consequuntur vitae voluptate. Sunt doloribus fugiat nam sit reprehenderit aut ex. Sunt dolores ratione id sed.', '2019-04-15 01:09:28', '2019-03-19 17:12:00', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (2, 'Quos quae consequatur eos est dolor aut est sed nihil optio ea.', 'quos-quae-consequatur-eos-est-dolor-aut-est-sed-nihil-optio-ea', 'Corporis eum unde corrupti officiis ea vel. Ut quisquam incidunt rerum qui. Sunt sapiente voluptatem quia aliquam qui est harum a. Suscipit minus quis est fugiat.\n\nOmnis autem ut optio quia excepturi. Ea deserunt harum eligendi eos. Mollitia praesentium vero fugit expedita.\n\nEnim animi iste maiores veritatis iste maxime. Voluptate necessitatibus quos consequatur sapiente delectus nobis. Ab officia illo perferendis maiores. Ea quam nam at facere voluptatem aspernatur.\n\nVeritatis sit possimus sunt iste aut et excepturi quas. Suscipit natus unde laboriosam laudantium et qui iure. Sed id id eveniet voluptatem. Vel eaque voluptates animi provident quia fuga voluptas.\n\nSequi temporibus suscipit unde est aut. Facere qui pariatur nesciunt quia quos aperiam. Explicabo dolor ut et saepe. Et tempora eius harum excepturi. Qui iure voluptas sit soluta cum molestiae.', '2019-04-15 01:09:28', '2019-04-13 04:46:19', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (3, 'Exercitationem vitae libero quos ut est tenetur facilis voluptas temporibus sequi.', 'exercitationem-vitae-libero-quos-ut-est-tenetur-facilis-voluptas-temporibus-sequi', 'Ea molestias alias qui delectus hic dignissimos voluptas. Molestiae qui maiores aliquid quibusdam. Possimus sit voluptate illum repellendus expedita qui fugit.\n\nExercitationem harum sit eveniet ut qui. Quas a recusandae ipsam enim quae ad. Consectetur corporis magnam aut eius qui ipsam voluptas.\n\nQuis consectetur dolorem nesciunt quasi. Facilis deleniti ut pariatur. Omnis quod neque placeat quasi unde. Occaecati sit tempora ratione aperiam.\n\nSoluta voluptas quis nostrum beatae provident dolor aut. Quo dolor neque id labore. Suscipit aperiam qui a quia repudiandae id atque.', '2019-04-15 01:09:28', '2019-03-15 07:05:34', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (4, 'Adipisci quaerat et itaque magnam earum ipsa exercitationem ex laudantium qui accusantium aliquid incidunt.', 'adipisci-quaerat-et-itaque-magnam-earum-ipsa-exercitationem-ex-laudantium-qui-accusantium-aliquid-incidunt', 'Rem itaque ea voluptatibus repellendus repudiandae ut. Voluptatem aliquam accusamus quidem nesciunt labore ab eligendi. Fugit porro est aperiam. Non distinctio sint dolorem sed quia libero.\n\nAssumenda error magnam quae et voluptas dolor. Temporibus ipsum eius corporis repudiandae. Rerum velit qui atque est quia.\n\nQuas reprehenderit eligendi possimus ut minima. Eaque explicabo nihil nesciunt et. Rerum molestiae explicabo doloribus et tenetur nostrum. Culpa aliquid est est sed facere.\n\nQui ut vel adipisci deserunt sapiente iusto. Et quia porro quo. Quidem nihil aut porro aliquid et in facilis sit.', '2019-04-15 01:09:28', '2019-04-01 20:58:39', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (5, 'Inventore in dolores ea soluta repellendus minima.', 'inventore-in-dolores-ea-soluta-repellendus-minima', 'Consequatur adipisci quis qui enim. Aut delectus quaerat corrupti assumenda. Facere molestiae veritatis ipsam dicta repudiandae incidunt. Magnam eum quos dignissimos vitae quos. Laboriosam consequatur omnis sit et.\n\nNeque quis necessitatibus blanditiis blanditiis quaerat omnis voluptatum. Eum veritatis et sapiente et recusandae earum. A quae quae sequi. Qui voluptatem libero est.\n\nVoluptatem amet et facilis odit. Quisquam assumenda dolorem veniam sint. Asperiores illum velit debitis. Autem officia omnis ut quasi.', '2019-04-15 01:09:28', '2019-04-04 20:38:25', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (6, 'Nihil rerum eos.', 'nihil-rerum-eos', 'Ipsam est voluptatibus excepturi et et voluptas aut. Molestiae magni dolores quis blanditiis sit esse placeat ut. Debitis iste neque facilis et pariatur qui iste veritatis. Aspernatur velit ullam omnis rerum.\n\nEarum velit eos dicta libero praesentium rerum. Dolor sint unde eligendi molestiae quidem. Iure sit ipsa cumque asperiores et consequatur. Non quibusdam beatae laborum accusantium.\n\nFacilis aspernatur omnis iure quia aut autem. Sint natus quasi ut quam qui saepe enim. Non id provident dicta omnis quos.\n\nAut dolor animi eum assumenda sunt aut hic. Harum quidem nam repudiandae dolor. Aut necessitatibus corrupti quia sapiente dicta nobis hic. Dolore aut dolorem omnis perferendis enim voluptas placeat similique. Omnis atque officiis necessitatibus et quia.', '2019-04-15 01:09:28', '2019-04-11 08:24:03', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (7, 'Magnam modi in eaque nisi voluptatem reprehenderit nemo qui.', 'magnam-modi-in-eaque-nisi-voluptatem-reprehenderit-nemo-qui', 'Est id quam placeat unde et. Sunt sed fugit quia omnis ab molestiae architecto. Ipsam unde laborum accusamus doloremque nobis porro maiores consectetur.\n\nMaiores sint est aut. Quod qui vel quo mollitia ducimus rem distinctio libero. Et laudantium quis cupiditate rem sed delectus.\n\nQui deleniti rerum dolores quos numquam illum accusantium. Aut repudiandae et laudantium cumque. Unde earum doloremque dolor excepturi inventore deleniti. Voluptas incidunt quaerat facere fugiat qui dolorem.', '2019-04-15 01:09:28', '2019-04-12 04:13:23', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (8, 'Dolor rerum quam suscipit quo atque quae officia dicta ut enim quia eligendi velit.', 'dolor-rerum-quam-suscipit-quo-atque-quae-officia-dicta-ut-enim-quia-eligendi-velit', 'Quo animi facere saepe dolor. Fugiat ratione sint veniam sunt aut tenetur soluta. Cumque repellat magni repudiandae voluptas sed eos eaque quia. Voluptas occaecati accusamus delectus explicabo ut doloremque odio.\n\nAutem temporibus optio tempore rerum aperiam. Ut maiores dolor quia dolor nostrum nihil. Et explicabo beatae similique in. Et reprehenderit debitis nemo iusto laudantium laboriosam et.\n\nSequi dolore non minus qui quia officiis expedita. Enim vel eaque accusantium perspiciatis. Nihil voluptatibus fugit aut quod. Magnam delectus illo officia voluptatem.\n\nAmet tenetur et sint. Iusto beatae dolores et consequuntur cumque quo molestiae. Doloribus ullam fugit cupiditate facere minus ipsa odit. Aut qui quia doloremque occaecati id et a.\n\nQui ut dolores sapiente excepturi culpa. Quas porro voluptates quia dicta quidem. Odio sunt aut debitis eos expedita et facilis. Atque recusandae accusantium ratione voluptatem. Sapiente quia eligendi adipisci tempore sapiente ut et.\n\nVel maiores excepturi dignissimos assumenda tempora. Fuga reiciendis sed consectetur sed magnam incidunt ut. Et quas est vel ratione nobis.', '2019-04-15 01:09:28', '2019-03-15 15:03:42', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (9, 'At debitis animi deleniti minus voluptatem nobis reiciendis ut.', 'at-debitis-animi-deleniti-minus-voluptatem-nobis-reiciendis-ut', 'Provident aut quia itaque voluptatem a beatae fugit. A officia sunt omnis sequi voluptatem ut. Perspiciatis error facere ipsum.\n\nLabore voluptates dolor porro incidunt veritatis. Placeat ut ut molestiae nulla cupiditate. Autem nobis neque nihil ea delectus vel ipsam. Et commodi officia eos sed.\n\nQuaerat sit possimus qui iure ut officiis. Ratione corrupti voluptas autem perferendis odio voluptatem.\n\nNumquam vel dignissimos est iusto. Omnis rerum autem culpa in voluptate non. Velit minima voluptatem eveniet sed. Ea nam deserunt dolores. Ea ipsam et voluptates at quidem eius eaque earum.\n\nQui repudiandae commodi voluptatibus rem et aut ut. Et quasi autem ipsum. Sed dolor dolorem voluptatem consequuntur. Sit ut minima quos omnis in temporibus dicta.\n\nAperiam consequatur enim blanditiis tenetur quod voluptas. Qui autem cupiditate repudiandae porro quam error placeat et. Omnis deserunt non repellat aut neque quod.', '2019-04-15 01:09:28', '2019-03-18 13:30:29', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (10, 'Voluptatum dicta dolores iure temporibus quibusdam et sed.', 'voluptatum-dicta-dolores-iure-temporibus-quibusdam-et-sed', 'Neque qui quos in modi quam sit. Sequi nihil soluta eveniet consequuntur ut aspernatur enim. Impedit magnam sapiente a delectus. Expedita sint corrupti voluptas soluta eveniet aut soluta.\n\nMaxime aut quaerat incidunt autem eum necessitatibus. Ut sunt provident sed harum beatae facilis natus.\n\nQui dolor sint dolorum. Eos neque aut quia officiis voluptate ut et. Reprehenderit alias quis natus aliquid beatae. Placeat a in est tempora.\n\nEt molestiae facilis aperiam officia. Et dolorum rerum nostrum iure soluta expedita. Odio aut mollitia unde id ut et. Consectetur minima velit beatae provident ut mollitia.\n\nVelit earum sed incidunt sed minima voluptatem omnis. Ipsam delectus sit velit voluptatem maiores est est. Eos ipsum deserunt quia facere. Quo facilis consequatur saepe. Ut repudiandae exercitationem iure quos et.', '2019-04-15 01:09:28', '2019-03-16 12:52:53', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (11, 'Dolores asperiores quaerat omnis.', 'dolores-asperiores-quaerat-omnis', 'Excepturi ut voluptates et tenetur ipsum deleniti. Est labore expedita placeat ut minus nesciunt. Numquam qui sunt quia sapiente.\n\nVoluptas reiciendis maxime vitae unde aut perferendis aut eum. Totam itaque voluptatibus in deleniti velit ipsa dolorem. Accusantium rem accusantium voluptatem nam earum.\n\nOptio aperiam in aspernatur. Saepe et delectus aspernatur aliquam similique. Sit blanditiis minus est dolores. Sint quisquam dolorum sapiente laudantium sit nobis.', '2019-04-15 01:09:28', '2019-03-23 16:09:12', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (12, 'Enim qui quaerat alias numquam laborum.', 'enim-qui-quaerat-alias-numquam-laborum', 'Praesentium ut provident tempora et. Tempore deserunt esse odio.\n\nIn id delectus suscipit ut enim. Dolorem aut dolorum similique incidunt iste sint. Vel sit dicta eveniet. Quod sit delectus aspernatur voluptate est vel qui.\n\nFugit dicta dolores officia. Accusantium nemo voluptas ut officia sunt. Sequi quo adipisci aut quis sapiente minus iure. Corporis labore quo eaque doloribus.\n\nQuod modi quas dolorem nemo eos sequi est. Aliquam voluptatibus quasi qui molestias. Omnis rem sunt velit quam ducimus pariatur. Odio eum qui omnis quam deleniti facere. Odio fugiat voluptatibus autem fuga odit modi sint.', '2019-04-15 01:09:28', '2019-03-31 16:21:41', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (13, 'Dignissimos fugiat consectetur necessitatibus iste quod iure consequatur odit exercitationem omnis.', 'dignissimos-fugiat-consectetur-necessitatibus-iste-quod-iure-consequatur-odit-exercitationem-omnis', 'Voluptatem eos nostrum quia. Quae nesciunt itaque repudiandae ad illo facilis repellendus.\n\nAliquam porro perferendis hic qui quidem. Ea aliquid saepe qui ipsa modi quidem. Qui exercitationem mollitia deserunt porro quibusdam est. Perspiciatis laudantium voluptas unde cum quis ea in sit. Omnis eius commodi sit accusamus non odit.\n\nArchitecto dolorem beatae blanditiis eius tempore dicta enim. Iusto et voluptate quibusdam ullam vel error et. Consequatur qui reprehenderit reiciendis quod qui tempora itaque. Nihil architecto et fugiat repellendus.\n\nEt modi voluptates et suscipit assumenda reprehenderit et. Voluptas dolorem voluptas laboriosam quia neque magnam dolorem. Et beatae at quisquam dolores minus sed.', '2019-04-15 01:09:28', '2019-03-16 14:00:52', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (14, 'Maiores nesciunt aut suscipit modi ipsum.', 'maiores-nesciunt-aut-suscipit-modi-ipsum', 'Ut nemo dolorem laboriosam aut sit ut. Qui quia asperiores quia aliquam occaecati aut. Quos expedita est consectetur ut.\n\nCupiditate consequatur unde aut accusamus qui. Repellat id qui recusandae. Voluptatem culpa ut in repellat optio id. Suscipit rerum eius aliquam beatae.\n\nOmnis quo doloremque illo sit dolor non ut veniam. Aut voluptatem natus repellat necessitatibus. Eos consequatur minus aut architecto eligendi. Temporibus eum fuga placeat autem.\n\nQuos blanditiis nemo quia. Animi quisquam quisquam quo placeat pariatur saepe aperiam repudiandae. Doloribus labore iure quam porro eum officia est. Voluptatum qui hic aut quia sunt debitis aliquam.\n\nTemporibus consectetur ut dolorem quia. Dignissimos blanditiis consectetur et enim. Cum ullam quia ut ut ipsam. Alias quia ab rem rerum expedita.', '2019-04-15 01:09:28', '2019-03-16 07:35:23', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (15, 'Ullam omnis maxime voluptatem minima.', 'ullam-omnis-maxime-voluptatem-minima', 'Sunt aliquam quasi dolorem voluptas omnis dolorem. Amet in quidem velit sunt praesentium alias. Voluptatem amet eaque est quod ut pariatur.\n\nExcepturi esse hic vel nulla iste aut minima. Illum facere impedit id voluptas ut omnis. Odit repudiandae ducimus et consequuntur iusto sit. Est maiores omnis ab sed et. Id occaecati eum ut sit dolorum modi.\n\nLibero eveniet voluptates sequi quis. Et consequatur natus pariatur. Consequatur a autem praesentium quam dignissimos sed.\n\nUt reiciendis occaecati debitis qui vel nihil est ipsum. Eos perspiciatis excepturi vel sed. Quae vel eum aut nobis et quae quod. Vel deserunt odio soluta non tempore.\n\nSapiente accusantium omnis in earum molestiae eaque unde. Nostrum corporis qui totam distinctio laborum impedit illum. Quo perspiciatis accusamus consequatur optio.\n\nQuo dolor hic dolorem ut qui. Et molestias et velit ut voluptates velit accusantium. Quasi unde rerum dolorum ea.', '2019-04-15 01:09:28', '2019-03-18 01:41:47', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (16, 'Culpa saepe debitis in.', 'culpa-saepe-debitis-in', 'Est error exercitationem ex alias rerum. Rerum tempore magnam et voluptatum et numquam. Quibusdam doloremque natus aperiam blanditiis.\n\nNecessitatibus et ea qui molestiae velit officia. Ab libero ut illo. Amet facere iusto inventore laudantium adipisci.\n\nRepudiandae consequatur magni ut id blanditiis voluptates dolores sunt. Et ut officia porro saepe. Voluptates iusto ut debitis maiores sequi.\n\nCupiditate omnis sunt voluptas fugit ullam ex. Et voluptas doloremque inventore reprehenderit molestiae. Consequuntur provident provident aut pariatur fugiat qui. Aut quia architecto fugiat adipisci iusto.\n\nEarum eaque rerum neque consequatur. Culpa tempora consequatur voluptate voluptatem ab voluptatem repellat.', '2019-04-15 01:09:28', '2019-04-01 23:27:30', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (17, 'Ut ipsam non.', 'ut-ipsam-non', 'Odit nisi beatae quia consequatur debitis qui nam. Voluptatem quo id non est. Incidunt dolor commodi cupiditate rerum impedit.\n\nVel dolores vel hic nihil illum vel earum quaerat. Ex doloremque et iusto qui dolor ut corporis excepturi. Id molestiae culpa quia cupiditate.\n\nSed praesentium at libero. Ex mollitia nemo possimus. Quia impedit sequi magni reprehenderit.\n\nRecusandae explicabo magni qui magnam. Molestiae qui nam et magni aut sed aut.\n\nSapiente qui laudantium alias ab doloremque neque voluptatem. Qui officiis et non rerum. Eum voluptatibus vitae minima est officia itaque labore. Debitis sit voluptatum distinctio provident.\n\nUnde ab sit perspiciatis quos quasi consequatur. Ad voluptatem ipsum aut corporis similique expedita. Autem delectus odit esse minus.', '2019-04-15 01:09:28', '2019-04-16 00:55:43', '2019-04-15 01:09:28', NULL);
INSERT INTO `posts` VALUES (18, 'Quis nihil quasi cumque.', 'quis-nihil-quasi-cumque', 'Et sed dolores et molestiae autem dolorem quis. Rerum labore voluptas ipsa sed. Accusamus amet iure voluptate omnis neque expedita modi.\r\n\r\nMagnam doloribus numquam sed praesentium hic. Quae voluptatem error iste nesciunt est velit laboriosam. Accusantium molestias quas qui beatae eum unde doloribus. Veniam earum eum sint odit et porro.\r\n\r\nSit consequatur labore et voluptas illum. Itaque veritatis ut quasi voluptatum illum est. Culpa vero cum veritatis est dicta et. Aliquid quia deleniti voluptas distinctio velit aliquid quod.', '2019-04-15 01:09:28', '2019-03-25 13:48:51', '2019-04-22 22:40:15', NULL);
INSERT INTO `posts` VALUES (19, 'Ex culpa inventore dolores saepe quasi amet.', 'ex-culpa-inventore-dolores-saepe-quasi-amet', 'Ea quo et odio sit blanditiis et sed. Itaque eaque eum adipisci dolores expedita praesentium.\r\n\r\nQuia ab ipsam odit doloribus magnam. Tempora est neque quaerat sed non. Id tenetur voluptate fugiat possimus iste.\r\n\r\nIpsam doloremque enim consequuntur eaque qui nobis non. Quasi voluptatibus assumenda tempora facere. Sit animi aperiam omnis et.\r\n\r\nIncidunt vitae perferendis totam deserunt enim. Maxime assumenda soluta atque dolor ea architecto accusantium enim. Consequatur similique neque similique id. Nam accusamus sed et accusamus.', '2019-04-15 01:09:28', '2019-03-15 05:41:43', '2019-04-22 11:12:47', NULL);
INSERT INTO `posts` VALUES (20, 'Sint non molestiae ducimus quaerat excepturi.', 'sint-non-molestiae-ducimus-quaerat-excepturi', 'Culpa assumenda et fugit aut id dolore. Minus quibusdam cumque et cupiditate qui aliquid. Autem qui ea voluptate voluptates.\r\n\r\nQuae veniam similique ut quis est quasi eum. Voluptatem ut ut ut laboriosam illum est dolores corporis. Tempore debitis atque harum et vel non. Quo earum tempora dicta.\r\n\r\nAccusamus earum error ut illo rerum repudiandae quia. Velit voluptatem repellendus eveniet autem voluptas. Dolores saepe neque delectus culpa eum occaecati.\r\n\r\nIure earum neque nihil repellat quia consequatur dicta animi. Debitis tempore ut qui exercitationem perferendis voluptatibus. A minus sed quia delectus earum excepturi. Cumque omnis non sit quod repudiandae dolor.\r\n\r\nQuibusdam saepe repellendus velit. Qui sit consectetur beatae est sed dignissimos asperiores. Et commodi sit nulla consequatur est.', '2019-04-15 01:09:28', '2019-04-05 21:06:05', '2019-04-21 21:42:22', NULL);
INSERT INTO `posts` VALUES (21, '创建一条心的数据', '', '111', '2019-04-22 11:31:20', NULL, '2019-04-22 11:31:20', NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (1, 3);
INSERT INTO `role_has_permissions` VALUES (2, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'web', '2019-04-12 03:58:11', '2019-04-12 03:58:11');
INSERT INTO `roles` VALUES (2, 'Owner', 'web', '2019-04-12 03:58:42', '2019-04-12 03:58:42');
INSERT INTO `roles` VALUES (3, 'Editor', 'web', '2019-04-12 03:59:02', '2019-04-12 03:59:02');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '于鋆南', '1804905923@qq.com', NULL, '$2y$10$vn9dHNzFte27vo1V.LYsJO/mxSvrp4aENfKe2bCXhnoqQZpX3QZA.', NULL, '2019-04-12 03:53:24', '2019-04-12 04:04:11');
INSERT INTO `users` VALUES (2, '于鋆南小号', '10001@qq.com', NULL, '$2y$10$fopdykDpZthYSNlm2RZ5teWXdf64BOAlyf3As7Smz8tZhGUDM1xJy', NULL, '2019-04-12 04:05:47', '2019-04-12 04:05:47');

SET FOREIGN_KEY_CHECKS = 1;
