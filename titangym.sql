/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : titangym

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 30/05/2018 21:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `streetName` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `userID`(`id`) USING BTREE,
  CONSTRAINT `userID` FOREIGN KEY (`id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1527696954', 'Rajbari Lane Behind Eleye Cinema Hall', 'ASSAM', 'Jorhat');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pass_key` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `securekey` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin1', 'admin1', 'admin1');

-- ----------------------------
-- Table structure for enrolls_to
-- ----------------------------
DROP TABLE IF EXISTS `enrolls_to`;
CREATE TABLE `enrolls_to`  (
  `et_id` int(5) NOT NULL AUTO_INCREMENT,
  `pid` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paid_date` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expire` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `renewal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`et_id`) USING BTREE,
  INDEX `user_ID`(`uid`) USING BTREE,
  INDEX `plan_ID_idx`(`pid`) USING BTREE,
  CONSTRAINT `user_ID` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `plan_ID` FOREIGN KEY (`pid`) REFERENCES `plan` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enrolls_to
-- ----------------------------
INSERT INTO `enrolls_to` VALUES (8, 'TYLFGN', '1527696954', '2018-05-30', '1970-01-01', 'yes');

-- ----------------------------
-- Table structure for health_status
-- ----------------------------
DROP TABLE IF EXISTS `health_status`;
CREATE TABLE `health_status`  (
  `hid` int(5) NOT NULL AUTO_INCREMENT,
  `calorie` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `height` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weight` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fat` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remarks` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`hid`) USING BTREE,
  INDEX `userID_idx`(`uid`) USING BTREE,
  CONSTRAINT `uID` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_status
-- ----------------------------
INSERT INTO `health_status` VALUES (3, NULL, NULL, NULL, NULL, NULL, '1527696954');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `pid` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `planName` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `validity` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('BVDPWN', 'dfd', 'sdf', '2', 532);
INSERT INTO `plan` VALUES ('PMZBJS', 'Beginner', 'Basic', '3', 1400);
INSERT INTO `plan` VALUES ('TYLFGN', 'monthly', 'regular', '1', 500);

-- ----------------------------
-- Table structure for timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable`  (
  `tid` int(12) NOT NULL AUTO_INCREMENT,
  `tname` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day3` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day4` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day5` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day6` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day7` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pid` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `plan_id_idx`(`pid`) USING BTREE,
  CONSTRAINT `planID` FOREIGN KEY (`pid`) REFERENCES `plan` (`pid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of timetable
-- ----------------------------
INSERT INTO `timetable` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BVDPWN');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gender` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dob` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `joining_date` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1527696954', 'Rajkumar Rocktim Narayan Singha', 'Male', '8011806053', 'rocktim53@gmail.com', '1997-12-02', '2018-05-30');

SET FOREIGN_KEY_CHECKS = 1;
