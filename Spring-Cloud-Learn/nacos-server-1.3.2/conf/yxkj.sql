/*
 Navicat Premium Data Transfer

 Source Server         : 47.105.177.52
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.105.177.52:3306
 Source Schema         : yxkj

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 17/09/2020 22:10:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_flash_banner
-- ----------------------------
DROP TABLE IF EXISTS `act_flash_banner`;
CREATE TABLE `act_flash_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态0不启用1启用',
  `pc_mobile` tinyint(4) NULL DEFAULT NULL COMMENT '1、PC端图片；2、mobile端图片',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_flash_banner
-- ----------------------------

-- ----------------------------
-- Table structure for act_flash_sale
-- ----------------------------
DROP TABLE IF EXISTS `act_flash_sale`;
CREATE TABLE `act_flash_sale`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_flash_sale_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `act_date` datetime(0) NOT NULL COMMENT '活动日期',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、商品征集；3、征集结束；4、作废；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请规则，用于给商家申请时的须知',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_flash_sale
-- ----------------------------

-- ----------------------------
-- Table structure for act_flash_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `act_flash_sale_log`;
CREATE TABLE `act_flash_sale_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_flash_sale_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动id',
  `act_flash_sale_product_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动商品id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '所属商家id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `order_product_id` int(10) UNSIGNED NOT NULL COMMENT '网单id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动参加日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_flash_sale_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_flash_sale_product
-- ----------------------------
DROP TABLE IF EXISTS `act_flash_sale_product`;
CREATE TABLE `act_flash_sale_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_flash_sale_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动id',
  `act_flash_sale_stage_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动阶段id',
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '活动价格',
  `stock` int(11) UNSIGNED NOT NULL COMMENT '库存量',
  `actual_sales` int(11) UNSIGNED NOT NULL COMMENT '已售出数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、提交审核；2、审核通过；3、审核失败',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序权重',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_flash_sale_product
-- ----------------------------

-- ----------------------------
-- Table structure for act_flash_sale_stage
-- ----------------------------
DROP TABLE IF EXISTS `act_flash_sale_stage`;
CREATE TABLE `act_flash_sale_stage`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_flash_sale_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动id',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '阶段描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动阶段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_flash_sale_stage
-- ----------------------------

-- ----------------------------
-- Table structure for act_full
-- ----------------------------
DROP TABLE IF EXISTS `act_full`;
CREATE TABLE `act_full`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `act_full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '满减活动名称',
  `first_full` decimal(10, 2) UNSIGNED NOT NULL COMMENT '第一档满额',
  `first_discount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '第一档减免额',
  `second_full` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第二档满额',
  `second_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第二档减免额',
  `third_full` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第三档满额',
  `third_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第三档减免额',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_full
-- ----------------------------

-- ----------------------------
-- Table structure for act_full_log
-- ----------------------------
DROP TABLE IF EXISTS `act_full_log`;
CREATE TABLE `act_full_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_full_id` int(10) UNSIGNED NOT NULL COMMENT '满减活动id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '所属商家id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减活动参加日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_full_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_group
-- ----------------------------
DROP TABLE IF EXISTS `act_group`;
CREATE TABLE `act_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '团购分类',
  `type_state` tinyint(4) NOT NULL COMMENT '分类状态：0、不显示；1、显示',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `descinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `virtual_sale_num` int(11) NOT NULL COMMENT '虚拟销量',
  `sale_num` int(11) NOT NULL COMMENT '实际销量',
  `start_time` datetime(0) NOT NULL COMMENT '活动开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '活动结束时间',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `market_price` decimal(10, 2) NOT NULL COMMENT '原价或市场价',
  `price` decimal(10, 2) NOT NULL COMMENT '团购价格',
  `purchase` int(11) NOT NULL COMMENT '限购数量',
  `stock` int(11) NOT NULL COMMENT '库存',
  `sort_num` int(4) NOT NULL COMMENT '排序',
  `is_best` tinyint(4) NOT NULL COMMENT '是否推荐',
  `activity_state` tinyint(4) NOT NULL COMMENT '活动状态1、未发布；2、发布；3、结束',
  `state` tinyint(4) NOT NULL COMMENT '审核状态1、未审核；2、提交审核；3、审核通过；4、审核失败',
  `audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人Name',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动列表图片',
  `channel` tinyint(4) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_group_banner
-- ----------------------------
DROP TABLE IF EXISTS `act_group_banner`;
CREATE TABLE `act_group_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态0不启用1启用',
  `pc_mobile` tinyint(4) NULL DEFAULT NULL COMMENT '1、PC端图片；2、mobile端图片',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_group_banner
-- ----------------------------

-- ----------------------------
-- Table structure for act_group_type
-- ----------------------------
DROP TABLE IF EXISTS `act_group_type`;
CREATE TABLE `act_group_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '团购分类名称',
  `sort` int(4) NOT NULL COMMENT '权重',
  `state` tinyint(4) NOT NULL COMMENT '分类状态：0、不显示；1、显示',
  `create_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_id` int(11) NULL DEFAULT NULL COMMENT '更新人ID',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_group_type
-- ----------------------------

-- ----------------------------
-- Table structure for act_integral
-- ----------------------------
DROP TABLE IF EXISTS `act_integral`;
CREATE TABLE `act_integral`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '积分商城分类',
  `type_state` tinyint(4) NOT NULL COMMENT '分类状态：0、不显示；1、显示',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `descinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `virtual_sale_num` int(11) NOT NULL COMMENT '虚拟销量',
  `sale_num` int(11) NOT NULL COMMENT '实际销量',
  `start_time` datetime(0) NOT NULL COMMENT '活动开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '活动结束时间',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `market_price` decimal(10, 2) NOT NULL COMMENT '原价或市场价',
  `price` int(11) NOT NULL COMMENT '积分换购价格，即积分数量',
  `is_with_money` tinyint(1) NOT NULL COMMENT '是否有现金（为1表示积分+现金换购）：0-否，1-是',
  `price_money` decimal(10, 2) NOT NULL COMMENT '现金价格',
  `grade_value` tinyint(4) NOT NULL COMMENT '等级限制',
  `purchase` int(11) NOT NULL COMMENT '限购数量',
  `stock` int(11) NOT NULL COMMENT '库存',
  `sort_num` int(4) NOT NULL COMMENT '排序',
  `is_best` tinyint(4) NOT NULL COMMENT '是否推荐',
  `activity_state` tinyint(4) NOT NULL COMMENT '活动状态1、未发布；2、发布；3、结束',
  `state` tinyint(4) NOT NULL COMMENT '审核状态1、未审核；2、提交审核；3、审核通过；4、审核失败',
  `audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人Name',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动列表图片',
  `channel` tinyint(4) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分商城' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_integral
-- ----------------------------

-- ----------------------------
-- Table structure for act_integral_banner
-- ----------------------------
DROP TABLE IF EXISTS `act_integral_banner`;
CREATE TABLE `act_integral_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态0不启用1启用',
  `pc_mobile` tinyint(4) NULL DEFAULT NULL COMMENT '1、PC端图片；2、mobile端图片',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分商城轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_integral_banner
-- ----------------------------

-- ----------------------------
-- Table structure for act_integral_type
-- ----------------------------
DROP TABLE IF EXISTS `act_integral_type`;
CREATE TABLE `act_integral_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '积分商城名称',
  `sort` int(4) NOT NULL COMMENT '权重',
  `state` tinyint(4) NOT NULL COMMENT '分类状态：0、不显示；1、显示',
  `create_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_id` int(11) NULL DEFAULT NULL COMMENT '更新人ID',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分商城分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_integral_type
-- ----------------------------

-- ----------------------------
-- Table structure for act_single
-- ----------------------------
DROP TABLE IF EXISTS `act_single`;
CREATE TABLE `act_single`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `act_single_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单品立减活动名称',
  `type` tinyint(1) NOT NULL COMMENT '活动类型1、减免金额；2、折扣',
  `discount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '类型为减免金额时为金额，折扣类型时为折扣（如0.90为打九折）',
  `product_ids` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品id列表，逗号隔开，前后有逗号，如果同一个商品有多个单品立减活动取有效活动中最新的一个',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单品立减活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_single
-- ----------------------------

-- ----------------------------
-- Table structure for act_single_log
-- ----------------------------
DROP TABLE IF EXISTS `act_single_log`;
CREATE TABLE `act_single_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_single_id` int(10) UNSIGNED NOT NULL COMMENT '单品立减活动id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '所属商家id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `order_product_id` int(10) UNSIGNED NOT NULL COMMENT '网单id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单品立减活动参加日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_single_log
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `count` int(11) NOT NULL COMMENT '数量',
  `spec_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格ID，多个规格用逗号分隔',
  `spec_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格详情',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `product_goods_id` int(11) NOT NULL COMMENT '货品ID',
  `checked` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否选中0未选中、1选中',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for code_master
-- ----------------------------
DROP TABLE IF EXISTS `code_master`;
CREATE TABLE `code_master`  (
  `code_div` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code组id',
  `code_cd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'codeId',
  `code_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code中文名称',
  `sort_order` int(11) NULL DEFAULT 0 COMMENT '组内顺序为',
  `use_yn` int(11) NULL DEFAULT 1 COMMENT '是否使用',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人Id',
  `create_user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '修改人Id',
  `update_user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`code_div`, `code_cd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of code_master
-- ----------------------------
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_STATE', '1', '新建', 1, 1, 0, '', '2015-08-28 18:34:39', 2, 'ejavashop', '2016-03-03 19:15:17');
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_STATE', '2', '提交审核', 2, 1, 0, '', '2015-08-28 18:35:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_STATE', '3', '上架', 3, 1, 0, '', '2015-08-28 18:35:17', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_STATE', '4', '审核不通过', 4, 1, 0, '', '2015-08-28 18:35:42', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_STATE', '5', '下架', 5, 1, 0, '', '2015-08-28 18:36:07', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_TYPE', '1', '满减', 1, 1, 0, '', '2015-09-07 14:35:14', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACTIVITY_FUOFF_TYPE', '2', '满折', 2, 1, 0, '', '2015-09-07 14:35:25', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SINGLE_TYPE', '1', '减免金额', 1, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SINGLE_TYPE', '2', '折扣', 2, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '1', '新建', 1, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '2', '商品征集', 2, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '3', '征集结束', 3, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '4', '作废', 4, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '5', '上架', 5, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_SPECIAL_STATUS', '6', '下架', 6, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '1', '新建', 1, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '2', '提交审核', 2, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '3', '审核通过', 3, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '4', '审核失败', 4, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '5', '上架', 5, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ACT_STATUS', '6', '下架', 6, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ADMIN_STATUS', '1', '正常', 1, 1, 0, '', '2015-08-19 09:35:38', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ADMIN_STATUS', '2', '冻结', 2, 1, 0, '', '2015-08-19 09:35:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ADMIN_STATUS', '3', '删除', 3, 1, 0, '', '2015-08-19 09:36:07', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ATT', '1', 'TXT', 0, 0, 1, 'admin', '2017-04-06 16:42:11', 1, 'admin', '2017-04-06 16:42:47');
INSERT INTO `code_master` VALUES ('ATTR_TYPE', '1', '检索属性', 1, 1, NULL, NULL, NULL, 0, '', '2015-05-24 12:13:36');
INSERT INTO `code_master` VALUES ('ATTR_TYPE', '2', '自定义属性', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('AUDIT_STATE', '2', '审核通过', 0, 1, 0, '', '2015-05-10 08:46:38', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('AUDIT_STATE', '3', '审核不通过', 0, 1, 0, '', '2015-05-10 08:46:38', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_A_STATE', '1', '未发布', 0, 1, 1, 'admin', '2016-01-27 11:29:44', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_A_STATE', '2', '发布', 0, 1, 1, 'admin', '2016-01-27 11:29:55', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_A_STATE', '3', '结束', 0, 1, 1, 'admin', '2016-01-27 11:30:05', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_STATE', '1', '新建', 0, 1, 1, 'admin', '2016-01-27 11:31:31', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_STATE', '2', '提交审核', 0, 1, 1, 'admin', '2016-01-27 11:31:40', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_STATE', '3', '审核通过', 0, 1, 1, 'admin', '2016-01-27 11:31:50', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BIDDING_STATE', '4', '审核失败', 0, 1, 1, 'admin', '2016-01-27 11:32:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_STATE', '1', '提交审核', 1, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_STATE', '2', '审核通过', 2, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_STATE', '3', '审核失败', 3, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_STATE', '4', '删除', 4, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_STATE', 'O', '默认', 0, 1, 0, '', '2015-05-19 21:13:18', 0, '', '2015-05-19 21:14:55');
INSERT INTO `code_master` VALUES ('BRAND_TOP', '1', '推荐', 0, 1, 0, '', '2015-12-15 02:33:44', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('BRAND_TOP', '2', '不推荐', 0, 1, 0, '', '2015-12-15 02:33:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CAR_STATE', '1', '测试', 0, 1, 1, 'admin', '2019-04-24 11:51:49', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CAR_STATE', '2', '测试2', 1, 0, 1, 'admin', '2019-04-24 11:52:57', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CHANNEL', '1', '通用', 1, 1, 1, 'admin', '2016-03-27 20:08:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CHANNEL', '2', 'PC', 2, 1, 1, 'admin', '2016-03-27 20:08:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CHANNEL', '3', 'mobile', 3, 1, 1, 'admin', '2016-03-27 20:08:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('CODE DIV DFV', '11', 'CODE DIV SDF', 0, 1, 1, 'admin', '2017-03-14 15:51:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('COUPON_TYPE', '1', '在线领取', 1, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('COUPON_TYPE', '2', '线下发放', 2, 1, 1, 'admin', '2016-03-27 20:03:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('DATA_TYPE', '1', '商品', 1, 1, 0, '', '2016-01-04 10:00:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('DATA_TYPE', '2', '图片链接', 2, 1, 0, '', '2016-01-04 10:00:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('DISABLE_STATE', '1', '可用', 1, 1, 0, '', '2015-07-22 10:34:13', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('DISABLE_STATE', '2', '不可用', 3, 1, 0, '', '2015-07-22 10:34:27', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('EVALUATE_STATE', '0', '未评价', 0, 1, 0, NULL, '2017-01-19 00:00:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('EVALUATE_STATE', '1', '已评价', 1, 1, 0, NULL, '2017-01-19 00:00:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_PRODUCT_STATUS', '1', '提交审核', 1, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_PRODUCT_STATUS', '2', '审核通过', 2, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_PRODUCT_STATUS', '3', '审核失败', 3, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '1', '新建', 1, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '2', '商品征集', 2, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '3', '征集结束', 3, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '4', '作废', 4, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '5', '上架', 5, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('FLASH_SALE_STATUS', '6', '下架', 6, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('GENDER', '0', '保密', 1, 1, 0, '', '2015-05-07 21:57:50', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('GENDER', '1', '男', 1, 1, 0, '', '2015-05-07 21:58:09', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('GENDER', '2', '女', 2, 1, 0, '', '2015-05-07 21:58:33', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('GOODS_FLOOR_DIS', '0', '不显示', 0, 1, 0, '', '2015-09-06 14:22:32', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('GOODS_FLOOR_DIS', '1', '显示', 1, 1, 0, '', '2015-09-06 14:22:46', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_CONTENT_TYPE', '1', '明细', 1, 1, 0, '', '2015-08-06 10:06:05', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_CONTENT_TYPE', '2', '办公用品', 2, 1, 0, '', '2015-08-06 10:06:17', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_CONTENT_TYPE', '3', '电脑配件', 3, 1, 0, '', '2015-08-06 10:06:42', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_CONTENT_TYPE', '4', '耗材', 4, 1, 0, '', '2015-08-06 10:06:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_TYPE', '1', '普通发票', 1, 1, 0, '', '2015-08-06 09:32:31', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_TYPE', '2', '电子发票', 2, 1, 0, '', '2015-08-06 09:32:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('INVOICE_TYPE', '3', '增值税发票', 3, 1, 0, '', '2015-08-06 09:33:12', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('IS_WITH_MONEY', '0', '否', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('IS_WITH_MONEY', '1', '是', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('LOOK_METHOD', '1', '图片', 0, 1, 0, '', '2015-05-10 08:15:07', 0, '', '2015-05-10 08:20:07');
INSERT INTO `code_master` VALUES ('LOOK_METHOD', '2', '文字', 1, 1, 0, '', '2015-05-10 08:15:29', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MANAGE_STATE', '0', '默认', 4, 1, 0, '', '2015-05-19 21:13:18', 0, '', '2015-05-19 21:14:55');
INSERT INTO `code_master` VALUES ('MANAGE_STATE', '1', '提交审核', 3, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MANAGE_STATE', '2', '审核通过', 2, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MANAGE_STATE', '3', '审核失败', 1, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MANAGE_STATE', '4', '停用', 0, 1, 0, '', '2015-05-19 21:13:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_ADDRESS_STATE', '1', '默认', 1, 1, 0, NULL, '2015-05-22 00:23:20', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_ADDRESS_STATE', '2', '不是默认', 2, 1, 0, NULL, '2015-05-22 00:23:47', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '1', '充值', 1, 1, 0, NULL, '2015-05-21 23:39:20', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '2', '退款', 2, 1, 0, '', '2015-05-21 23:41:04', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '3', '消费', 3, 1, 0, '', '2015-05-21 23:41:40', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '4', '提款', 4, 1, 0, '', '2015-05-21 23:41:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '5', '系统添加', 5, 1, 0, '', '2015-05-21 23:42:19', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_BALANCE_STATE', '6', '系统减少', 6, 1, 0, '', '2015-05-21 23:42:35', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_COLLECT_STATE', '1', '显示', 1, 1, 0, NULL, '2015-05-22 01:36:34', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_COLLECT_STATE', '2', '删除', 1, 1, 0, NULL, '2015-05-22 01:36:55', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_DRAWING_STATE', '1', '提交申请', 1, 1, 0, NULL, '2015-05-12 22:03:03', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_DRAWING_STATE', '2', '申请通过', 2, 1, 0, NULL, '2015-05-12 22:03:03', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_DRAWING_STATE', '3', '已打款', 3, 1, 0, NULL, '2015-05-12 22:03:03', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_DRAWING_STATE', '4', '处理失败', 4, 1, 0, NULL, '2015-05-12 22:03:03', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRADE', '1', '普通会员', 1, 1, 0, '', '2015-05-07 21:28:14', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRADE', '2', '铜牌会员', 2, 1, 0, '', '2015-05-07 21:28:52', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRADE', '3', '银牌会员', 3, 1, 0, '', '2015-05-07 21:29:15', 0, '', '2015-05-07 21:30:07');
INSERT INTO `code_master` VALUES ('MEMBER_GRADE', '4', '金牌会员', 4, 1, 0, '', '2015-05-07 21:29:34', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRADE', '5', '钻石会员', 5, 1, 0, '', '2015-05-07 21:30:01', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRD_INT_LOG_T', '1', '经验值', 1, 1, 0, '', '2015-05-17 18:35:25', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_GRD_INT_LOG_T', '2', '积分', 2, 1, 0, '', '2015-05-17 18:35:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_RULE_STATE', '1', '开始', 1, 1, 0, '', '2015-05-10 15:50:15', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_RULE_STATE', '2', '关闭', 2, 1, 0, '', '2015-05-10 15:50:29', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_SOURCE', '1', 'PC', 1, 1, 0, '', '2015-05-07 21:37:44', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_SOURCE', '2', 'H5', 2, 1, 0, '', '2015-05-07 21:38:04', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_SOURCE', '3', 'Android', 3, 1, 0, '', '2015-05-07 21:38:53', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_SOURCE', '4', 'IOS', 4, 1, 0, '', '2015-05-07 21:39:48', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_SOURCE', '5', '微信商城', 5, 1, 0, '', '2015-07-09 09:58:11', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_STATUS', '1', '正常使用', 1, 1, 0, '', '2015-05-07 21:26:14', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_STATUS', '2', '停用', 2, 1, 0, '', '2015-05-07 21:27:11', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '1', '会员注册', 1, 1, 0, '', '2015-05-20 23:29:51', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '10', '用户签到', 6, 1, 0, '', '2016-08-04 15:03:14', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '11', '订单取消', 11, 1, 0, '', '2016-08-04 18:05:24', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '12', '退货追回', 12, 1, 0, '', '2016-08-08 15:08:58', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '13', '取消追回', 13, 1, 0, '', '2016-11-01 10:00:58', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '2', '会员登录', 2, 1, 0, '', '2015-05-20 23:31:35', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '3', '商品购买', 3, 1, 0, '', '2015-05-20 23:32:06', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '4', '商品评论', 4, 1, 0, '', '2015-05-20 23:32:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '5', '系统添加', 5, 1, 0, '', '2015-05-20 23:32:50', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '6', '系统减少', 6, 1, 0, '', '2015-05-20 23:33:10', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '7', '订单消费', 6, 1, 0, '', '2016-04-27 10:59:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '8', '商品退货', 6, 1, 0, '', '2016-04-27 10:59:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEMBER_VAL_OPT_TYPE', '9', '年度减少', 6, 1, 0, '', '2016-08-03 15:54:05', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_MONEY', '1', '未退款', 1, 1, 0, '', '2015-07-21 15:00:49', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_MONEY', '2', '退款到账户', 2, 1, 0, '', '2015-07-21 15:01:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_MONEY', '3', '退款到银行', 3, 1, 0, '', '2015-07-21 15:01:19', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_RETURN', '1', '未处理', 1, 1, 0, '', '2015-07-21 14:56:22', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_RETURN', '2', '审核通过', 2, 1, 0, '', '2015-07-21 14:56:37', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_RETURN', '3', '用户发货', 3, 1, 0, '', '2015-07-21 14:57:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_RETURN', '4', '店铺收货', 4, 1, 0, '', '2015-07-21 14:57:54', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PB_STATE_RETURN', '5', '不予处理', 4, 1, 0, '', '2015-07-21 14:57:54', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '1', '未处理', 1, 1, 0, '', '2015-07-21 16:29:29', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '2', '审核通过', 2, 1, 0, '', '2015-07-21 16:29:44', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '3', '用户发回退件', 3, 1, 0, '', '2015-07-21 16:30:13', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '4', '商家收到退件', 4, 1, 0, '', '2015-07-21 16:30:43', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '5', '商家发出换件', 5, 1, 0, '', '2015-07-21 16:31:01', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '6', '原件退还', 6, 1, 0, '', '2015-07-21 16:31:49', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('MEM_PROD_EXCHG_STATE', '7', '不处理', 7, 1, 0, '', '2015-07-21 16:31:49', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('NEWS_PARTNER_STATUS', '0', '不可见', 2, 1, 0, '', '2015-07-17 11:46:43', 0, '', '2015-07-17 13:04:56');
INSERT INTO `code_master` VALUES ('NEWS_PARTNER_STATUS', '1', '可见', 1, 1, 0, '', '2015-07-17 11:48:17', 0, '', '2015-07-17 13:05:07');
INSERT INTO `code_master` VALUES ('NEWS_TREE_ROOT_TEXT', '0', '根结点', 0, 1, 0, '', '2015-07-13 15:40:25', 0, '', '2015-07-13 15:41:25');
INSERT INTO `code_master` VALUES ('NORM_STATE', '0', '删除', 1, 0, 0, '', '2015-05-31 20:12:03', 0, '', '2015-05-31 20:12:25');
INSERT INTO `code_master` VALUES ('NORM_STATE', '1', '正常', 2, 1, 0, '', '2015-05-31 20:12:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('NORM_STATE', '2', '停用', 3, 1, 0, '', '2015-05-31 20:12:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('NORM_TYPE', '1', '文字', 0, 1, 0, '', '2015-05-18 20:45:24', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('NORM_TYPE', '2', '图片', 1, 1, 0, '', '2015-05-18 20:45:35', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '1', '未付款', 1, 1, 0, '', '2015-07-16 11:08:29', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '2', '待确认', 2, 1, 0, '', '2015-07-16 11:08:43', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '3', '待发货', 3, 1, 0, '', '2015-07-16 11:09:07', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '4', '已发货', 4, 1, 0, '', '2015-07-16 11:09:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '5', '已完成', 5, 1, 0, '', '2015-07-16 11:10:00', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDERS_ORDER_STATE', '6', '已取消', 6, 1, 0, '', '2015-07-16 11:10:19', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_INVIOCE_STATE', '1', '公司', 1, 1, 0, '', '2015-07-16 11:59:52', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_INVIOCE_STATE', '2', '个人', 2, 1, 0, '', '2015-07-16 12:00:05', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_INVOICE_STATUS', '0', '不要发票', 0, 1, 0, '', '2015-07-16 11:49:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_INVOICE_STATUS', '1', '单位', 1, 1, 0, '', '2015-07-16 11:50:13', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_INVOICE_STATUS', '2', '个人', 2, 1, 0, '', '2015-07-16 11:50:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_PAYMENT_STATUS', '0', '未付款', 0, 1, 0, '', '2015-07-16 11:45:49', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_PAYMENT_STATUS', '1', '已付款', 1, 1, 0, '', '2015-07-16 11:46:17', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '1', '商城订单', 0, 1, 1, 'admin', '2016-07-30 16:01:47', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '2', '限时抢购订单', 0, 1, 1, 'admin', '2016-07-30 16:02:17', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '3', '团购订单', 0, 1, 1, 'admin', '2016-07-30 16:02:32', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '4', '定金订单', 0, 1, 1, 'admin', '2016-07-30 16:02:58', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '5', '尾款订单', 0, 1, 1, 'admin', '2016-07-30 16:03:12', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('ORDER_TYPE', '6', '积分商城订单', 0, 1, 1, 'admin', '2016-07-30 16:04:01', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PC_INDEX_IMAGE', '1', '首页头部图片', 0, 1, 1, 'admin', '2016-08-11 19:14:15', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PC_INDEX_IMAGE', '2', '首页轮播图浮动图片', 0, 1, 1, 'admin', '2016-08-11 19:14:34', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PC_INDEX_IMAGE', '3', '首页轮播图下面图片', 0, 1, 1, 'admin', '2016-08-11 19:15:10', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PC_MOBILE', '1', 'PC', 0, 1, 1, 'admin', '2016-06-23 15:18:25', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PC_MOBILE', '2', 'Mobile', 0, 1, 1, 'admin', '2016-06-23 15:18:41', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_ASK_STATE', '1', '咨询', 1, 1, 0, '', '2015-07-15 15:30:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_ASK_STATE', '2', '已经回答', 2, 1, 0, '', '2015-07-15 15:31:15', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_ASK_STATE', '3', '前台显示', 3, 1, 0, '', '2015-07-15 15:31:37', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_ASK_STATE', '4', '删除', 4, 1, 0, '', '2015-07-15 15:32:12', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_CATE_STATUS', '1', '显示', 1, 1, 0, '', '2015-07-27 18:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_CATE_STATUS', '2', '不显示', 2, 1, 0, '', '2015-07-27 18:28:36', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_CATE_STATUS', '3', '删除', 3, 1, 0, '', '2015-07-27 18:29:01', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_COMM_STATE', '1', '评价', 1, 1, 0, '', '2015-07-15 15:29:29', 0, '', '2015-07-15 15:30:11');
INSERT INTO `code_master` VALUES ('PRODUCT_COMM_STATE', '2', '审核通过，前台显示', 2, 1, 0, '', '2015-07-15 15:29:54', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_COMM_STATE', '3', '删除', 3, 1, 0, '', '2015-07-15 15:30:30', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_IS_INVENTED', '1', '实物商品', 1, 1, NULL, NULL, NULL, 0, '', '2015-06-03 06:59:29');
INSERT INTO `code_master` VALUES ('PRODUCT_IS_INVENTED', '2', '虚拟商品', 2, 1, NULL, NULL, NULL, 0, '', '2015-06-03 06:59:29');
INSERT INTO `code_master` VALUES ('PRODUCT_IS_NORM', '1', '不启用', 1, 1, NULL, NULL, NULL, 0, '', '2015-06-03 06:59:29');
INSERT INTO `code_master` VALUES ('PRODUCT_IS_NORM', '2', '启用', 2, 1, NULL, NULL, NULL, 0, '', '2015-05-24 12:13:36');
INSERT INTO `code_master` VALUES ('PRODUCT_IS_TOP', '1', '不推荐', 1, 1, NULL, NULL, NULL, 0, '', '2015-06-03 06:59:29');
INSERT INTO `code_master` VALUES ('PRODUCT_IS_TOP', '2', '推荐', 2, 1, NULL, NULL, NULL, 0, '', '2015-06-03 06:59:29');
INSERT INTO `code_master` VALUES ('PRODUCT_SELLER_STATE', '1', '店铺正常', 1, 1, 0, '', '2015-09-12 11:42:14', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_SELLER_STATE', '2', '店铺关闭', 2, 1, 0, '', '2015-09-12 11:42:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '1', '新建', 1, 1, 0, '', '2015-05-05 21:39:23', 0, '', '2015-05-05 21:39:30');
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '2', '提交审核', 2, 1, 0, '', '2015-05-05 21:39:23', 0, '', '2015-05-05 21:39:30');
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '3', '审核通过', 3, 1, 0, '', '2015-05-05 21:39:23', 0, '', '2015-08-20 16:33:26');
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '4', '申请驳回', 4, 1, 0, '', '2015-05-05 21:39:23', 0, '', '2015-05-05 21:39:30');
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '5', '商品删除', 5, 1, 0, '', '2015-05-05 21:39:23', 0, '', '2015-05-05 21:39:30');
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '6', '上架', 6, 1, 0, '', '2015-08-20 16:35:21', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRODUCT_STATE', '7', '下架', 7, 1, 0, '', '2015-08-20 16:35:33', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('PRO_TRANSPORT_TYPE', '1', '按件数', 1, 1, 0, '', '2017-01-20 17:00:11', 0, '', '2017-01-20 17:00:11');
INSERT INTO `code_master` VALUES ('PRO_TRANSPORT_TYPE', '2', '按重量', 2, 1, 0, '', '2015-01-20 17:00:11', 0, '', '2017-01-20 17:00:11');
INSERT INTO `code_master` VALUES ('PRO_TRANSPORT_TYPE', '3', '按体积', 3, 1, 0, '', '2015-01-20 17:00:11', 0, '', '2017-01-20 17:00:11');
INSERT INTO `code_master` VALUES ('QAZ', '1', 'WSX', 0, 1, 1, 'admin', '2017-03-14 15:53:30', 1, 'admin', '2017-03-14 15:54:19');
INSERT INTO `code_master` VALUES ('RECOMMEND_TYPE', '1', 'PC首页热销商品', 1, 1, 0, '', '2016-02-19 17:26:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('RECOMMEND_TYPE', '2', 'PC首页今日推荐', 2, 1, 0, '', '2016-02-19 17:26:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('RESOURCE_STATUS', '1', '未删除', 1, 1, 0, '', '2015-08-13 10:32:10', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('RESOURCE_STATUS', '2', '删除', 2, 1, 0, '', '2015-08-13 10:32:19', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_MEMBER_STATE', '1', '未提交审核', 0, 1, 1, 'admin', '2018-02-26 11:49:07', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_MEMBER_STATE', '2', '提交审核', 0, 1, 1, 'admin', '2018-02-26 11:49:16', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_MEMBER_STATE', '3', '审核通过', 0, 1, 1, 'admin', '2018-02-26 11:49:33', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_MEMBER_STATE', '4', '审核失败', 0, 1, 1, 'admin', '2018-02-26 11:49:44', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_ORDER_STATE', '1', '预计收益', 0, 1, 1, 'admin', '2018-03-06 11:18:37', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_ORDER_STATE', '2', '可以提现', 0, 1, 1, 'admin', '2018-03-06 11:18:52', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_ORDER_STATE', '3', '提现中', 0, 1, 1, 'admin', '2018-03-06 11:19:07', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_ORDER_STATE', '4', '提现完成', 0, 1, 1, 'admin', '2018-03-06 11:19:23', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_SETTING', '1', '平台承担', 0, 1, 1, 'admin', '2018-02-25 09:48:34', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SALE_SETTING', '2', '商家承担', 0, 1, 1, 'admin', '2018-02-25 09:48:48', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SEARCH_KEYWORDFILTER', '1', '不过滤', 0, 1, 0, '', '2015-12-11 00:26:27', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SEARCH_KEYWORDFILTER', '2', '过滤', 0, 1, 0, '', '2015-12-11 00:26:40', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_APPLY_STATE', '1', '提交申请', 1, 1, 0, '', '2015-07-10 10:52:46', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_APPLY_STATE', '2', '审核通过', 2, 1, 0, '', '2015-07-10 10:54:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_APPLY_STATE', '3', '缴纳保证金', 3, 1, 0, '', '2015-07-10 10:58:21', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_APPLY_STATE', '4', '审核失败', 4, 1, 0, '', '2015-07-10 10:58:37', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_AUDIT_STATE', '1', '待审核', 1, 1, 0, '', '2015-07-11 15:45:19', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_AUDIT_STATE', '2', '审核通过', 2, 1, 0, '', '2015-07-11 15:45:35', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_AUDIT_STATE', '3', '已冻结   ', 3, 1, 0, '', '2015-07-11 15:46:22', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_CATE_STATE', '0', '默认', 1, 1, 0, '', '2015-08-28 18:34:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_CATE_STATE', '1', '提交审核', 2, 1, 0, '', '2015-08-28 18:34:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_CATE_STATE', '2', '审核通过', 3, 1, 0, '', '2015-08-28 18:34:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_CATE_STATE', '3', '审核失败', 4, 1, 0, '', '2015-08-28 18:34:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_CATE_STATE', '4', '停用', 5, 1, 0, '', '2015-08-28 18:34:39', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '1', '买家投诉待审核', 1, 1, 0, '', '2015-07-22 14:57:08', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '2', '买家投诉不通过', 2, 1, 0, '', '2015-07-22 14:57:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '3', '买家投诉通过', 3, 1, 0, '', '2015-07-22 14:57:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '4', '卖家申诉待审核', 4, 1, 0, '', '2015-07-22 14:58:32', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '5', '卖家申诉不通过', 5, 1, 0, '', '2015-07-22 14:59:02', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_COMPLAINT', '6', '卖家申诉通过', 6, 1, 0, '', '2015-07-22 14:59:29', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_QQ_STATE', '1', '显示', 1, 1, 0, '', '2015-07-20 11:20:55', 0, '', '2015-07-20 11:21:29');
INSERT INTO `code_master` VALUES ('SELLER_QQ_STATE', '2', '不显示', 2, 1, 0, '', '2015-07-20 11:21:10', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_QQ_STATE', '3', '删除', 3, 0, 0, '', '2015-07-20 11:21:22', 0, '', '2015-11-27 16:44:37');
INSERT INTO `code_master` VALUES ('SELLER_STATE', '0', '默认', 1, 1, 0, '', '2015-05-10 14:17:24', 0, '', '2015-05-12 21:15:01');
INSERT INTO `code_master` VALUES ('SELLER_STATE', '1', '提交审核', 2, 1, 0, '', '2015-05-10 14:17:24', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SELLER_STATE', '2', '显示中', 3, 1, 0, '', '2015-05-10 14:17:24', 0, '', '2015-05-12 21:15:47');
INSERT INTO `code_master` VALUES ('SELLER_STATE', '3', '审核失败', 4, 1, 0, '', '2015-05-10 14:17:24', 0, '', '2015-05-12 21:15:32');
INSERT INTO `code_master` VALUES ('SELLER_STATE', '4', '已删除', 5, 0, 0, '', '2015-05-10 14:17:24', 0, '', '2015-06-13 17:32:16');
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '1', '账单生成', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '2', '平台审核通过', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '3', '商家核对通过', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '4', '商家核对质疑', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '5', '对账完成', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLEMENT_STATUS', '6', '支付完成', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLE_OTHER_TYPE', '1', '支付增加', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SETTLE_OTHER_TYPE', '2', '支付扣减', 1, 1, 0, '', '2015-12-07 09:08:56', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SPECIAL_PRO_STATUS', '1', '提交审核', 1, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SPECIAL_PRO_STATUS', '2', '审核通过', 2, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SPECIAL_PRO_STATUS', '3', '审核失败', 3, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SPECIAL_TYPE_STATE', '0', '不显示', 1, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SPECIAL_TYPE_STATE', '1', '显示', 2, 1, 0, '', '2016-05-10 15:28:26', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SYSTEM_ADVERT_STATUS', '1', '待审核', 1, 1, 0, '', '2015-09-10 11:16:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SYSTEM_ADVERT_STATUS', '2', '冻结', 2, 1, 0, '', '2015-09-10 11:17:17', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('SYSTEM_ADVERT_STATUS', '3', '投放中', 3, 1, 0, '', '2015-09-10 11:21:58', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_MODEL', '1', '平邮', 1, 1, 0, '', '2015-07-21 17:14:57', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_MODEL', '2', 'EMS', 2, 1, 0, '', '2015-07-21 17:15:08', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_MODEL', '3', '快递', 3, 1, 0, '', '2015-07-21 17:15:22', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_STATE', '1', '使用中', 1, 1, 0, '', '2015-09-06 09:30:22', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_STATE', '2', '禁用', 2, 1, 0, '', '2015-09-06 09:30:40', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '12', '12小时内', 1, 1, 0, '', '2015-09-07 11:06:47', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '15', '15天内', 7, 1, 0, '', '2015-09-07 11:09:18', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '24', '24小时内', 2, 1, 0, '', '2015-09-07 11:07:15', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '30', '30天内', 8, 1, 0, '', '2015-09-07 11:09:36', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '45', '45天内', 9, 1, 0, '', '2015-09-07 11:09:50', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '48', '48小时内', 3, 1, 0, '', '2015-09-07 11:07:28', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '5', '5天内', 5, 1, 0, '', '2015-09-07 11:08:30', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '7', '7天内', 6, 1, 0, '', '2015-09-07 11:08:59', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TIME', '72', '72小时内', 4, 1, 0, '', '2015-09-07 11:07:54', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('TRANSPORT_TYPE', '1', '按件数', 1, 1, 0, '', '2015-07-21 17:00:11', 0, '', '2015-09-06 09:33:22');
INSERT INTO `code_master` VALUES ('TRANSPORT_TYPE', '2', '按重量', 2, 1, 0, '', '2015-07-21 17:00:30', 0, '', '2015-09-06 09:33:42');
INSERT INTO `code_master` VALUES ('USE_PRE', '1', '使用', 1, 1, 0, '', '2016-02-19 14:40:06', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('USE_PRE', '2', '预使用', 2, 1, 0, '', '2016-02-19 14:40:06', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('USE_PRE', '3', '不使用', 3, 1, 0, '', '2016-02-19 14:40:06', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('USE_YN', '0', '不使用', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('USE_YN', '1', '使用', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('YES_NO', '0', '否', 2, 1, 0, '', '2015-05-20 11:09:11', NULL, NULL, NULL);
INSERT INTO `code_master` VALUES ('YES_NO', '1', '是', 1, 1, 0, '', '2015-05-20 11:08:56', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `integral_scale` int(11) NOT NULL DEFAULT 1 COMMENT '积分换算比例，多少积分换算成1元人民币',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 10);

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `coupon_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券前缀',
  `coupon_value` decimal(10, 2) UNSIGNED NOT NULL COMMENT '优惠券面值',
  `min_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '适用的最低订单金额',
  `send_start_time` datetime(0) NOT NULL COMMENT '发放开始时间',
  `send_end_time` datetime(0) NOT NULL COMMENT '发放结束时间',
  `use_start_time` datetime(0) NOT NULL COMMENT '使用起始时间',
  `use_end_time` datetime(0) NOT NULL COMMENT '使用截止时间',
  `person_limit_num` int(10) UNSIGNED NOT NULL COMMENT '每个会员限制领取的张数，0为不限',
  `total_limit_num` int(10) UNSIGNED NOT NULL COMMENT '总共允许发放的总张数',
  `received_num` int(10) UNSIGNED NOT NULL COMMENT '已发放的张数',
  `type` tinyint(1) NOT NULL COMMENT '优惠券类型1、在线领取；2、线下发放',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券描述',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `coupon_opt_log`;
CREATE TABLE `coupon_opt_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_user_id` int(10) UNSIGNED NOT NULL COMMENT '优惠券用户id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '所属商家id',
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT '优惠券id',
  `opt_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、领取；2、下单消费；3、订单取消返回；4、商品退货返回',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id(无订单赋0)',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_opt_log
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '所属商家id',
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT '优惠券id',
  `coupon_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列号',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `can_use` int(10) UNSIGNED NOT NULL COMMENT '可使用次数（默认都是1次，不支持多次使用）',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '领取时间',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id(无订单赋0)',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `use_start_time` datetime(0) NOT NULL COMMENT '使用开始时间',
  `use_end_time` datetime(0) NOT NULL COMMENT '使用结束时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_sn`(`coupon_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for courier_company
-- ----------------------------
DROP TABLE IF EXISTS `courier_company`;
CREATE TABLE `courier_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(2) NOT NULL DEFAULT 0 COMMENT '状态 1-可用 2-不可用',
  `company_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递代码',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `seq` int(11) NULL DEFAULT 0 COMMENT '排序号',
  `company_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '3' COMMENT '快递类型 1-平邮 2-EMS 3-快递',
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '快递模板路径',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打印模板生成的js文件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courier_company
-- ----------------------------
INSERT INTO `courier_company` VALUES (4, 1, 'STO', '申通物流', 1, '3', 0, '2020-03-06 15:36:32', NULL, '/images/couriercompany/dbd4660e-5979-4306-8c64-8368ab212f22.png', '申通无敌');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发票抬头',
  `tax_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `state` tinyint(4) NOT NULL COMMENT '状态1、显示；2、不显示',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content`(`content`, `tax_num`, `create_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发票信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for log_act_flash_sale
-- ----------------------------
DROP TABLE IF EXISTS `log_act_flash_sale`;
CREATE TABLE `log_act_flash_sale`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opt_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型，C、新建，U、修改，D、删除',
  `opt_user_id` int(10) UNSIGNED NOT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  `opt_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `act_flash_sale_id` int(10) UNSIGNED NOT NULL,
  `act_flash_sale_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `act_date` datetime(0) NOT NULL COMMENT '活动日期',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、商品征集；3、征集结束；4、作废；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请规则，用于给商家申请时的须知',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_act_flash_sale
-- ----------------------------

-- ----------------------------
-- Table structure for log_act_flash_sale_product
-- ----------------------------
DROP TABLE IF EXISTS `log_act_flash_sale_product`;
CREATE TABLE `log_act_flash_sale_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opt_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型，C、新建，U、修改，D、删除',
  `opt_user_id` int(10) UNSIGNED NOT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  `opt_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `act_flash_sale_product_id` int(10) UNSIGNED NOT NULL,
  `act_flash_sale_stage_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动阶段id',
  `act_flash_sale_id` int(11) NULL DEFAULT NULL,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '活动价格',
  `stock` int(11) UNSIGNED NOT NULL COMMENT '库存量',
  `actual_sales` int(11) UNSIGNED NOT NULL COMMENT '已售出数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、提交审核；2、审核通过；3、审核失败',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动商品日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_act_flash_sale_product
-- ----------------------------

-- ----------------------------
-- Table structure for log_act_flash_sale_stage
-- ----------------------------
DROP TABLE IF EXISTS `log_act_flash_sale_stage`;
CREATE TABLE `log_act_flash_sale_stage`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_flash_sale_stage_id` int(10) UNSIGNED NOT NULL,
  `act_flash_sale_id` int(10) UNSIGNED NOT NULL COMMENT '限时抢购活动id',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '阶段描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时抢购活动阶段日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_act_flash_sale_stage
-- ----------------------------

-- ----------------------------
-- Table structure for log_act_full
-- ----------------------------
DROP TABLE IF EXISTS `log_act_full`;
CREATE TABLE `log_act_full`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opt_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型，C、新建，U、修改，D、删除',
  `opt_user_id` int(10) UNSIGNED NOT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  `opt_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `act_full_id` int(10) UNSIGNED NOT NULL COMMENT '订单满减活动ID',
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `act_full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '满减活动名称',
  `first_full` decimal(10, 2) UNSIGNED NOT NULL COMMENT '第一档满额',
  `first_discount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '第一档减免额',
  `second_full` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第二档满额',
  `second_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第二档减免额',
  `third_full` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第三档满额',
  `third_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '第三档减免额',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减活动日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_act_full
-- ----------------------------

-- ----------------------------
-- Table structure for log_act_single
-- ----------------------------
DROP TABLE IF EXISTS `log_act_single`;
CREATE TABLE `log_act_single`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opt_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型，C、新建，U、修改，D、删除',
  `opt_user_id` int(10) UNSIGNED NOT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  `opt_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `act_single_id` int(10) UNSIGNED NOT NULL COMMENT '单品立减活动ID',
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `act_single_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单品立减活动名称',
  `type` tinyint(1) NOT NULL COMMENT '活动类型1、减免金额；2、折扣',
  `discount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '类型为减免金额时为金额，折扣类型时为折扣（如0.90为打九折）',
  `product_ids` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品id列表，逗号隔开，前后有逗号，如果同一个商品有多个单品立减活动取有效活动中最新的一个',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单品立减活动日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_act_single
-- ----------------------------

-- ----------------------------
-- Table structure for log_coupon
-- ----------------------------
DROP TABLE IF EXISTS `log_coupon`;
CREATE TABLE `log_coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opt_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型，C、新建，U、修改，D、删除',
  `opt_user_id` int(10) UNSIGNED NOT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  `opt_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT '优惠券ID',
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '商家ID',
  `coupon_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券前缀',
  `coupon_value` decimal(10, 2) UNSIGNED NOT NULL COMMENT '优惠券面值',
  `min_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '适用的最低订单金额',
  `send_start_time` datetime(0) NOT NULL COMMENT '发放开始时间',
  `send_end_time` datetime(0) NOT NULL COMMENT '发放结束时间',
  `use_start_time` datetime(0) NOT NULL COMMENT '使用起始时间',
  `use_end_time` datetime(0) NOT NULL COMMENT '使用截止时间',
  `person_limit_num` int(10) UNSIGNED NOT NULL COMMENT '每个会员限制领取的张数，0为不限',
  `total_limit_num` int(10) UNSIGNED NOT NULL COMMENT '总共允许发放的总张数',
  `received_num` int(10) UNSIGNED NOT NULL COMMENT '已发放的张数',
  `type` tinyint(1) NOT NULL COMMENT '优惠券类型1、在线领取；2、线下发放',
  `channel` tinyint(1) NOT NULL COMMENT '活动应用渠道1、通用；2、PC；3、Mobile',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、新建；2、提交审核；3、审核通过；4、审核失败；5、上架；6、下架',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券描述',
  `audit_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for m_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `m_index_banner`;
CREATE TABLE `m_index_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用0不使用',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '移动端首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_index_banner
-- ----------------------------
INSERT INTO `m_index_banner` VALUES (5, '复工图', '#', '/images/admobile/52de9f3d-4d08-4c99-9587-0e0d8e7f153f.png', 1, '2020-03-07 10:27:49', '2020-06-07 10:27:53', 1, 1, 'admin', '2020-03-07 10:28:21', 1, 'admin', '2020-03-07 11:52:30');
INSERT INTO `m_index_banner` VALUES (6, '春上新', '#', '/images/admobile/8be043d7-9b3c-4d3b-b2da-a498b42aa7e4.png', 2, '2020-03-07 10:29:03', '2020-06-07 10:29:05', 1, 1, 'admin', '2020-03-07 10:29:14', 1, 'admin', '2020-03-07 11:52:30');

-- ----------------------------
-- Table structure for m_index_floor
-- ----------------------------
DROP TABLE IF EXISTS `m_index_floor`;
CREATE TABLE `m_index_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '楼层名称',
  `order_no` int(2) NOT NULL COMMENT '楼层排序号',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态1显示0不显示',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层备注',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `adv_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层上端广告图片',
  `adv_link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层上端广告图片链接地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '移动端首页楼层表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_index_floor
-- ----------------------------

-- ----------------------------
-- Table structure for m_index_floor_data
-- ----------------------------
DROP TABLE IF EXISTS `m_index_floor_data`;
CREATE TABLE `m_index_floor_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_floor_id` int(10) UNSIGNED NOT NULL COMMENT '所属楼层ID',
  `data_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1商品2图片链接',
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '数据ID（data_type为1表示商品ID）',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接标题',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页楼层数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_index_floor_data
-- ----------------------------

-- ----------------------------
-- Table structure for m_recommend
-- ----------------------------
DROP TABLE IF EXISTS `m_recommend`;
CREATE TABLE `m_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommend_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1多惠部落',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用0不使用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'm推荐商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for m_seller_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `m_seller_index_banner`;
CREATE TABLE `m_seller_index_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用0不使用',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '移动端商家首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_seller_index_banner
-- ----------------------------

-- ----------------------------
-- Table structure for m_seller_index_floor
-- ----------------------------
DROP TABLE IF EXISTS `m_seller_index_floor`;
CREATE TABLE `m_seller_index_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '楼层名称',
  `order_no` int(2) NOT NULL COMMENT '楼层排序号',
  `adv_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层上端广告图片',
  `adv_link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层上端广告图片链接地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态1显示0不显示',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '楼层备注',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '移动端商家首页楼层表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_seller_index_floor
-- ----------------------------

-- ----------------------------
-- Table structure for m_seller_index_floor_data
-- ----------------------------
DROP TABLE IF EXISTS `m_seller_index_floor_data`;
CREATE TABLE `m_seller_index_floor_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `index_floor_id` int(10) UNSIGNED NOT NULL COMMENT '所属楼层ID',
  `data_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1商品2图片链接',
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '数据ID（data_type为1表示商品ID）',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接标题',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家首页楼层数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_seller_index_floor_data
-- ----------------------------

-- ----------------------------
-- Table structure for m_seller_recommend
-- ----------------------------
DROP TABLE IF EXISTS `m_seller_recommend`;
CREATE TABLE `m_seller_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) NOT NULL COMMENT '商家ID',
  `data_type` tinyint(1) NOT NULL COMMENT '数据类型：1商品2图片链接',
  `ref_id` int(10) NULL DEFAULT NULL COMMENT '数据ID（data_type为1表示商品ID）',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接标题',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已删除：0-否，1-是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家首页推荐' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_seller_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `grade` int(11) NOT NULL DEFAULT 1 COMMENT '会员等级',
  `grade_value` int(11) NOT NULL DEFAULT 0 COMMENT '会员经验值',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '会员积分',
  `register_time` datetime(0) NOT NULL COMMENT '注册时间',
  `last_login_time` datetime(0) NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后登录IP',
  `login_number` int(11) NOT NULL COMMENT '登陆次数',
  `last_address_id` int(11) NULL DEFAULT NULL COMMENT '上次使用的地址',
  `last_payment_code` int(11) NULL DEFAULT NULL COMMENT '上次使用的支付方式',
  `gender` tinyint(1) NULL DEFAULT 0 COMMENT '性别0、保密；1、男；2、女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mobile',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `pwd_err_count` int(11) NOT NULL DEFAULT 0 COMMENT '密码输入错误次数',
  `source` tinyint(4) NOT NULL COMMENT '会员来源1、pc；2、H5；3、Android；4、IOS ;5、微信商城',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '账户余额',
  `balance_pwd` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户支付密码',
  `is_email_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否验证邮箱0、未验证；1、验证',
  `is_sms_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否验证手机0、未验证；1、验证',
  `sms_verify_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信验证码',
  `email_verify_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件验证码',
  `can_receive_sms` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否接受短信0、不接受；1、接受',
  `can_receive_email` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否接收邮件',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1、正常使用；2、停用',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL,
  `session_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sms_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 'huashan', '4297f44b13955235245b2497399d7a93', 5, 12754, 1176, '2017-12-01 15:35:04', '2020-03-06 16:18:12', '219.144.189.79', 234, NULL, NULL, 0, '2019-01-30', '', '', '15811569528', '15811569528', 0, 1, 166219.81, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, '044c626057da4576953671a8f47aaca3', '2020-03-06 16:18:12', '15pl6w2d9eufj1irutlaj506a4', NULL);
INSERT INTO `member` VALUES (2, 'ejstest_1', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2017-12-01 15:47:17', '2017-12-01 15:47:17', '192.168.1.110', 0, NULL, NULL, NULL, NULL, '', NULL, '13823432345', '13823432345', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2017-12-01 15:47:18', NULL, NULL);
INSERT INTO `member` VALUES (3, 'ejstest_3', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2017-12-01 15:54:02', '2017-12-01 15:54:02', '192.168.1.110', 0, NULL, NULL, NULL, NULL, '', NULL, '15823459765', '15823459765', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2017-12-01 15:54:02', NULL, NULL);
INSERT INTO `member` VALUES (4, 'ejsejs1', 'e10adc3949ba59abbe56e057f20f883e', 1, 19, 20, '2018-02-27 14:15:34', '2018-02-27 14:15:34', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '18612670879', '18612670879', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, 'o6auO4j_giaDlcyH4Ms7P7dKXCSc', '2020-02-27 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (7, 'ejs001', '4297f44b13955235245b2497399d7a93', 3, 553, 528, '2018-02-27 14:58:25', '2018-10-11 19:05:37', '127.0.0.1', 63, NULL, NULL, NULL, NULL, '', NULL, '18612670871', '18612670871', 0, 1, 154036.00, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2020-02-27 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (8, 'ejs002', '4297f44b13955235245b2497399d7a93', 1, 34, 35, '2018-02-27 15:02:39', '2018-08-08 11:38:00', '127.0.0.1', 7, NULL, NULL, NULL, NULL, '', NULL, '18612670872', '18612670872', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2020-02-27 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (12, 'ejs0011', '4297f44b13955235245b2497399d7a93', 3, 538, 538, '2018-02-27 19:03:30', '2018-08-08 11:36:39', '127.0.0.1', 4, NULL, NULL, NULL, NULL, '', NULL, '18612670875', '18612670875', 0, 1, 148996.00, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2020-02-27 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (13, 'ejs0012', '4297f44b13955235245b2497399d7a93', 3, 647, 647, '2018-02-27 19:04:22', '2018-08-08 11:37:20', '127.0.0.1', 5, NULL, NULL, NULL, NULL, '', NULL, '15811078996', '15811078996', 0, 1, 138605.00, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2020-02-27 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (14, 'ejs00121', '4297f44b13955235245b2497399d7a93', 1, 217, 217, '2018-03-03 16:14:40', '2018-03-05 09:05:15', '127.0.0.1', 3, NULL, NULL, NULL, NULL, '', NULL, '15811078998', '15811078998', 0, 1, 181232.33, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2020-03-03 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (15, 'ejs001211', '4297f44b13955235245b2497399d7a93', 1, 34, 35, '2018-03-03 16:20:20', '2018-03-17 11:31:01', '127.0.0.1', 3, NULL, NULL, NULL, NULL, '', NULL, '18612671111', '18612671111', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2020-03-03 04:20:00', NULL, NULL);
INSERT INTO `member` VALUES (16, 'ejs003', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2018-03-11 18:56:28', '2018-03-11 18:56:28', '192.168.1.103', 0, NULL, NULL, NULL, NULL, '', NULL, '18612679999', '18612679999', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-03-11 18:56:28', NULL, NULL);
INSERT INTO `member` VALUES (17, 'ejs0016', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2018-03-19 15:54:15', '2018-03-19 15:54:15', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '18612676666', '18612676666', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-03-19 15:54:15', NULL, NULL);
INSERT INTO `member` VALUES (18, 'yixiekeji001', '4297f44b13955235245b2497399d7a93', 1, 0, 0, '2018-08-21 09:10:49', '2018-08-21 09:10:49', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '18611115555', '18611115555', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 09:10:49', NULL, NULL);
INSERT INTO `member` VALUES (19, 'yx0001', '4297f44b13955235245b2497399d7a93', 1, 0, 0, '2018-08-21 09:21:33', '2018-08-21 09:21:33', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '18612340000', '18612340000', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 09:21:33', NULL, NULL);
INSERT INTO `member` VALUES (20, 'yx0002', '4297f44b13955235245b2497399d7a93', 1, 0, 0, '2018-08-21 09:23:48', '2018-08-21 09:23:48', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '15812340000', '15812340000', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 09:23:48', NULL, NULL);
INSERT INTO `member` VALUES (21, 'yx0003', '4297f44b13955235245b2497399d7a93', 1, 0, 0, '2018-08-21 11:01:17', '2018-08-21 11:01:17', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '13691225673', '13691225673', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 11:01:17', NULL, NULL);
INSERT INTO `member` VALUES (22, 'yx0005', '4297f44b13955235245b2497399d7a93', 1, 0, 0, '2018-08-21 11:19:43', '2018-08-21 11:19:43', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, '13691229922', '13691229922', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 11:19:43', NULL, NULL);
INSERT INTO `member` VALUES (23, 'yx0006', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2018-08-21 11:36:27', '2018-08-21 11:36:28', '127.0.0.1', 1, NULL, NULL, NULL, NULL, '', NULL, '15611112222', '15611112222', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 11:36:27', NULL, NULL);
INSERT INTO `member` VALUES (24, 'yx00011', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2018-08-21 11:37:24', '2018-08-21 11:37:24', '127.0.0.1', 1, NULL, NULL, NULL, NULL, '', NULL, '18612348888', '18612348888', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2018-08-21 11:37:24', NULL, NULL);
INSERT INTO `member` VALUES (25, 'yx0008', '4297f44b13955235245b2497399d7a93', 1, 120, 1020, '2018-08-21 11:45:25', '2018-08-21 11:45:26', '127.0.0.1', 1, NULL, NULL, NULL, NULL, '', NULL, '18612676543', '18612676543', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2019-01-05 09:51:48', NULL, NULL);
INSERT INTO `member` VALUES (27, 'admin-seller-apply-hs002', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 0, '2019-01-05 10:25:48', '2019-01-05 10:25:48', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 1, 0.00, '', 0, 0, '', '', 1, 1, 1, NULL, '2019-01-05 10:25:48', NULL, NULL);
INSERT INTO `member` VALUES (28, '王先生', '4297f44b13955235245b2497399d7a93', 1, 26, 26, '2019-04-02 11:57:18', '2019-04-02 15:25:56', '192.168.1.118', 7, NULL, NULL, NULL, NULL, '', NULL, '18518368999', '18518368999', 0, 3, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2019-04-16 15:15:00', NULL, NULL);
INSERT INTO `member` VALUES (29, 'admin-seller-apply-yixiekeji0423', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 0, '2019-04-23 15:59:10', '2019-04-23 15:59:10', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 1, 0.00, '', 0, 0, '', '', 1, 1, 1, NULL, '2019-04-23 15:59:10', NULL, NULL);
INSERT INTO `member` VALUES (30, 'admin-seller-apply-ejstest_3', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 0, '2019-04-24 11:17:57', '2019-04-24 11:17:57', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 1, 0.00, '', 0, 0, '', '', 1, 1, 1, NULL, '2019-04-24 11:17:57', NULL, NULL);
INSERT INTO `member` VALUES (31, 'admin-seller-apply-ejstest_31', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 0, '2019-04-24 11:19:41', '2019-04-24 11:19:41', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 1, 0.00, '', 0, 0, '', '', 1, 1, 1, NULL, '2019-04-24 11:19:41', NULL, NULL);
INSERT INTO `member` VALUES (32, 'test0512', 'e10adc3949ba59abbe56e057f20f883e', 1, 20, 20, '2019-05-12 15:40:51', '2019-05-12 15:40:59', '127.0.0.1', 1, NULL, NULL, NULL, NULL, '', NULL, '', '', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2019-05-12 15:41:17', NULL, NULL);
INSERT INTO `member` VALUES (33, 'zhangsan0517', '4297f44b13955235245b2497399d7a93', 1, 20, 20, '2019-05-23 10:10:01', '2019-05-23 10:10:02', '127.0.0.1', 1, NULL, NULL, NULL, NULL, '', NULL, '18518368000', '18518368000', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2019-05-23 10:10:01', NULL, NULL);
INSERT INTO `member` VALUES (34, '张三0819', 'e10adc3949ba59abbe56e057f20f883e', 3, 688, 264, '2019-08-19 16:01:10', '2019-08-24 00:40:06', '127.0.0.1', 9, NULL, NULL, NULL, NULL, '', NULL, '18518368001', '18518368001', 0, 2, 903491.00, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2019-09-06 17:05:00', NULL, NULL);
INSERT INTO `member` VALUES (35, 'YHQ1001', '4297f44b13955235245b2497399d7a93', 1, 96, 6703, '2019-08-28 14:12:21', '2019-09-10 14:57:41', '127.0.0.1', 9, NULL, NULL, NULL, NULL, '', NULL, '18823456879', '18823456879', 0, 2, 99993542.00, '4297f44b13955235245b2497399d7a93', 0, 1, '', '', 1, 1, 1, NULL, '2019-09-10 14:57:40', NULL, NULL);
INSERT INTO `member` VALUES (36, '身骑白马走三关', 'b629b7a709cd6b5602b6708ff6ccb325', 1, 20, 30, '2019-09-24 19:04:22', '2019-09-24 19:04:22', '192.168.1.104', 0, NULL, NULL, 1, NULL, '', NULL, '18518368980', '18518368980', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, 'o6auO4gf1N9yyVbmBxfrFwafSp8o', '2019-11-19 14:27:18', NULL, NULL);
INSERT INTO `member` VALUES (37, '应龙nmsmkn829391', '2016224aca155c3395f1ff66eab158f7', 1, 20, 20, '2019-09-24 21:51:15', '2019-09-24 21:51:15', '192.168.1.114', 0, NULL, NULL, 1, NULL, '', NULL, '18515293119', '18515293119', 0, 2, 0.00, '', 0, 1, '', '', 1, 1, 1, 'o6auO4pBJ8IekXYS70gYKxY2GsQ0', '2019-09-24 21:51:15', NULL, NULL);
INSERT INTO `member` VALUES (38, 'zhangsan1205', '4297f44b13955235245b2497399d7a93', 1, 26, 26, '2019-12-05 11:26:23', '2019-12-05 11:43:57', '127.0.0.1', 2, NULL, NULL, NULL, NULL, '', NULL, '18823456877', '18823456877', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2019-12-05 11:43:56', NULL, '888888');
INSERT INTO `member` VALUES (40, 'AAAAAA', '96e79218965eb72c92a549dd5a330112', 1, 20, 20, '2020-03-07 10:57:13', '2020-03-07 10:57:13', '111.19.94.142', 0, NULL, NULL, NULL, NULL, '', NULL, '18392396707', '18392396707', 0, 1, 0.00, '', 0, 1, '', '', 1, 1, 1, NULL, '2020-03-07 10:57:13', NULL, '260589');

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `area_id` int(11) NOT NULL COMMENT '地区ID',
  `add_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市区组合',
  `address_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `state` tinyint(4) NOT NULL COMMENT '1、默认；2、不是默认',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_address
-- ----------------------------
INSERT INTO `member_address` VALUES (16, 1, '郭德纲', 2, 716, 937, '北京北京昌平区', '昌平区', '15029999920', NULL, '', '710020', 2, '2020-03-06 15:29:09', NULL);

-- ----------------------------
-- Table structure for member_apply_drawing
-- ----------------------------
DROP TABLE IF EXISTS `member_apply_drawing`;
CREATE TABLE `member_apply_drawing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现编号',
  `money` decimal(10, 2) NOT NULL COMMENT '提现金额',
  `create_time` datetime(0) NOT NULL COMMENT '申请时间',
  `auditing_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款银行',
  `bank_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款账号',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '1、提交申请；2、申请通过；3、已打款；4、处理失败',
  `fail_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '处理人ID',
  `opt_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员提款申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_apply_drawing
-- ----------------------------

-- ----------------------------
-- Table structure for member_balance_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_balance_logs`;
CREATE TABLE `member_balance_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `money_before` decimal(10, 2) NOT NULL COMMENT '变化之前的余额',
  `money_after` decimal(10, 2) NOT NULL COMMENT '变化之后的余额',
  `money` decimal(10, 2) NOT NULL COMMENT '变化金额',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `state` tinyint(4) NOT NULL COMMENT '1、充值；2、退款；3、消费；4、提款；5、系统添加；6、系统减少',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `opt_id` int(11) NOT NULL COMMENT '操作人ID',
  `opt_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员账户余额变化日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_balance_logs
-- ----------------------------
INSERT INTO `member_balance_logs` VALUES (138, 1, 'huashan', 166338.81, 166219.81, 119.00, '2020-03-06 15:29:33', 3, '消费，订单号20030615292008380347', 1, 'huashan');

-- ----------------------------
-- Table structure for member_balance_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `member_balance_pay_log`;
CREATE TABLE `member_balance_pay_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式code：PCUNIONPAY；H5UNIONPAY；PCALIPAY；H5ALIPAY；PCWXPAY；H5WXPAY',
  `payment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式名称：PC银联；H5银联；PC支付宝；H5支付宝；PC微信；H5微信',
  `pay_money` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `pay_state` tinyint(1) NOT NULL COMMENT '支付状态 1-未支付 2-已支付',
  `pay_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付号（提交支付的订单号）',
  `trade_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付交易流水号（银行返回）',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `pay_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员充值记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_balance_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for member_collection_product
-- ----------------------------
DROP TABLE IF EXISTS `member_collection_product`;
CREATE TABLE `member_collection_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `create_time` datetime(0) NOT NULL COMMENT '收藏时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `state` tinyint(4) NOT NULL COMMENT '1、正常显示；2、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收藏商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_collection_product
-- ----------------------------

-- ----------------------------
-- Table structure for member_collection_seller
-- ----------------------------
DROP TABLE IF EXISTS `member_collection_seller`;
CREATE TABLE `member_collection_seller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `seller_id` int(11) NOT NULL COMMENT '商铺ID',
  `create_time` datetime(0) NOT NULL COMMENT '收藏时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `state` tinyint(4) NOT NULL COMMENT '1、显示；2、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收藏商铺表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_collection_seller
-- ----------------------------

-- ----------------------------
-- Table structure for member_grade_config
-- ----------------------------
DROP TABLE IF EXISTS `member_grade_config`;
CREATE TABLE `member_grade_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade1` int(11) NOT NULL COMMENT '注册会员经验值',
  `grade2` int(11) NOT NULL COMMENT '铜牌会员经验值',
  `grade3` int(11) NOT NULL COMMENT '银牌会员经验值',
  `grade4` int(11) NOT NULL COMMENT '金牌会员经验值',
  `grade5` int(11) NOT NULL COMMENT '钻石会员经验值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_grade_config
-- ----------------------------
INSERT INTO `member_grade_config` VALUES (1, 0, 260, 500, 7500, 12000);
INSERT INTO `member_grade_config` VALUES (2, 1, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for member_grade_down_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_grade_down_logs`;
CREATE TABLE `member_grade_down_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `excute_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '递减日期，yyyy-MM-dd（记录某年减少的某月某日注册的会员经验值）',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员经验值年度递减日志表（每天执行完定时任务后记录）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_grade_down_logs
-- ----------------------------
INSERT INTO `member_grade_down_logs` VALUES (68, '2020-02-23', '2020-02-23 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (69, '2020-02-22', '2020-02-23 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (70, '2020-02-21', '2020-02-23 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (71, '2020-02-24', '2020-02-24 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (72, '2020-02-25', '2020-02-25 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (73, '2020-02-26', '2020-02-26 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (74, '2020-02-27', '2020-02-27 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (75, '2020-02-28', '2020-02-28 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (76, '2020-02-29', '2020-02-29 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (77, '2020-03-01', '2020-03-01 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (78, '2020-03-02', '2020-03-02 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (79, '2020-03-03', '2020-03-03 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (80, '2020-03-04', '2020-03-04 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (81, '2020-03-05', '2020-03-05 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (82, '2020-03-06', '2020-03-06 04:20:00');
INSERT INTO `member_grade_down_logs` VALUES (83, '2020-03-07', '2020-03-07 04:20:00');

-- ----------------------------
-- Table structure for member_grade_integral_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_grade_integral_logs`;
CREATE TABLE `member_grade_integral_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员名称',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT '经验值或积分',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `opt_type` tinyint(4) NOT NULL COMMENT '具体操作1、会员注册；2、会员登录；3、商品购买；4、商品评论；5、系统添加；6、系统减少；7、订单消费（减少，下单时积分支付扣减）；8、商品退货（增加，用户退货时如果订单有积分支付则返回用户已使用的积分）；9、年度减少扣减经验值（减少）；10、用户签到赠送积分（增加）；11、订单取消退回积分（增加）；12、网单退货追回积分（减少，网单发生退货后，扣除用户因为购物（类型3）得到的积分，注意与8、13的区别）；13、订单取消追回积分（减少，订单取消时，扣除用户因为购物（类型3）得到的积分，注意与8、12的区别）',
  `opt_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述，订单记录订单号，商品评论记录商品ID',
  `ref_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联code，根据opt_type判断字段值意义，3-订单sn，4-网单ID，7-订单sn，8-网单ID，11-订单sn，12-网单ID，13-订单sn',
  `type` tinyint(4) NOT NULL COMMENT '1、经验值；2、积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 567 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员经验积分日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_grade_integral_logs
-- ----------------------------
INSERT INTO `member_grade_integral_logs` VALUES (549, 1, 'yixiekeji', 6, '2020-02-22 17:31:32', 2, '会员登录', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (550, 1, 'yixiekeji', 6, '2020-02-22 17:31:32', 2, '会员登录', NULL, 2);
INSERT INTO `member_grade_integral_logs` VALUES (551, 1, 'yixiekeji', 10, '2020-02-22 17:37:22', 10, '签到送积分', NULL, 2);
INSERT INTO `member_grade_integral_logs` VALUES (552, 4, 'ejsejs1', 1, '2020-02-27 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (553, 7, 'ejs001', 0, '2020-02-27 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (554, 8, 'ejs002', 1, '2020-02-27 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (555, 12, 'ejs0011', 0, '2020-02-27 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (556, 13, 'ejs0012', 0, '2020-02-27 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (557, 14, 'ejs00121', 1, '2020-03-03 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (558, 15, 'ejs001211', 1, '2020-03-03 04:20:00', 9, '会员经验值年度减少', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (559, 1, 'huashan', 6, '2020-03-06 15:10:13', 2, '会员登录', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (560, 1, 'huashan', 6, '2020-03-06 15:10:13', 2, '会员登录', NULL, 2);
INSERT INTO `member_grade_integral_logs` VALUES (561, 1, 'huashan', 1, '2020-03-06 15:29:33', 3, '购物送经验值(订单号:20030615292008380347)', '20030615292008380347', 1);
INSERT INTO `member_grade_integral_logs` VALUES (562, 1, 'huashan', 1, '2020-03-06 15:29:33', 3, '购物送积分(订单号:20030615292008380347)', '20030615292008380347', 2);
INSERT INTO `member_grade_integral_logs` VALUES (563, 39, 'AAAAAA', 20, '2020-03-07 10:33:48', 1, '会员注册', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (564, 39, 'AAAAAA', 20, '2020-03-07 10:33:48', 1, '会员注册', NULL, 2);
INSERT INTO `member_grade_integral_logs` VALUES (565, 40, 'AAAAAA', 20, '2020-03-07 10:57:13', 1, '会员注册', NULL, 1);
INSERT INTO `member_grade_integral_logs` VALUES (566, 40, 'AAAAAA', 20, '2020-03-07 10:57:13', 1, '会员注册', NULL, 2);

-- ----------------------------
-- Table structure for member_grade_up_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_grade_up_logs`;
CREATE TABLE `member_grade_up_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `before_exper` int(11) NOT NULL COMMENT '升级之前的经验值',
  `after_exper` int(11) NOT NULL COMMENT '升级之后的经验值',
  `before_grade` int(11) NOT NULL COMMENT '升级之前的等级',
  `after_grade` int(11) NOT NULL COMMENT '升级之后的等级',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级升级日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_grade_up_logs
-- ----------------------------
INSERT INTO `member_grade_up_logs` VALUES (13, 14, 'ejs00121', 218, 217, 2, 1, '2020-03-03 04:20:00');

-- ----------------------------
-- Table structure for member_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_login_logs`;
CREATE TABLE `member_login_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录IP',
  `create_time` datetime(0) NOT NULL COMMENT '登录时间',
  `source` tinyint(3) NOT NULL COMMENT '会员来源1、pc；2、H5；3、Android；4、IOS ;5、微信商城',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 438 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_login_logs
-- ----------------------------
INSERT INTO `member_login_logs` VALUES (433, 1, 'yixiekeji', '127.0.0.1', '2020-02-22 17:31:31', 2);
INSERT INTO `member_login_logs` VALUES (434, 1, 'yixiekeji', '127.0.0.1', '2020-02-22 17:37:16', 1);
INSERT INTO `member_login_logs` VALUES (435, 1, 'huashan', '1.80.235.16', '2020-02-22 18:04:37', 1);
INSERT INTO `member_login_logs` VALUES (436, 1, 'huashan', '219.144.189.79', '2020-03-06 15:10:13', 1);
INSERT INTO `member_login_logs` VALUES (437, 1, 'huashan', '219.144.189.79', '2020-03-06 16:18:12', 2);

-- ----------------------------
-- Table structure for member_product_back
-- ----------------------------
DROP TABLE IF EXISTS `member_product_back`;
CREATE TABLE `member_product_back`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '所属商家',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家名称',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `order_product_id` int(11) NOT NULL COMMENT '网单ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Name',
  `province_id` int(11) NULL DEFAULT NULL COMMENT 'Province',
  `city_id` int(11) NULL DEFAULT NULL COMMENT 'city',
  `area_id` int(11) NULL DEFAULT NULL COMMENT 'area',
  `address_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市区组合',
  `address_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `contact_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家联系人手机',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家联系人姓名',
  `logistics_id` int(11) NULL DEFAULT NULL COMMENT '物流公司ID',
  `logistics_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logistics_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司快递代码',
  `logistics_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `state_return` tinyint(1) NOT NULL COMMENT '退货状态：1、未处理；2、审核通过；3、用户发货，4、店铺收货；5、不予处理',
  `state_money` tinyint(1) NOT NULL COMMENT '退款状态：1、未退款；2、退款到账户；3、退款到银行',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '退货数量',
  `back_money` decimal(10, 2) NOT NULL COMMENT '退款金额',
  `back_integral` int(11) NULL DEFAULT NULL COMMENT '退回积分',
  `back_integral_money` decimal(10, 2) NOT NULL COMMENT '退回积分金额（退回积分转换成金额）',
  `back_coupon_user_id` int(11) NULL DEFAULT NULL COMMENT '退回优惠券ID，0表示没有',
  `back_money_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '处理人',
  `opt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户退货' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product_back
-- ----------------------------

-- ----------------------------
-- Table structure for member_product_back_log
-- ----------------------------
DROP TABLE IF EXISTS `member_product_back_log`;
CREATE TABLE `member_product_back_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operating_id` int(11) NOT NULL COMMENT '操作人',
  `operating_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `member_product_back_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product_back_log
-- ----------------------------

-- ----------------------------
-- Table structure for member_product_exchange
-- ----------------------------
DROP TABLE IF EXISTS `member_product_exchange`;
CREATE TABLE `member_product_exchange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '所属商家',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家名称',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `order_product_id` int(11) NOT NULL COMMENT '网单ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Name',
  `province_id` int(11) NULL DEFAULT NULL COMMENT 'Province',
  `city_id` int(11) NULL DEFAULT NULL COMMENT 'city',
  `area_id` int(11) NULL DEFAULT NULL COMMENT 'area',
  `address_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市区组合',
  `address_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `change_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户收货人',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户收货人电话',
  `logistics_id` int(11) NULL DEFAULT NULL COMMENT '换件物流公司ID',
  `logistics_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '换件物流公司',
  `logistics_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '换件物流公司快递代码',
  `logistics_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '换件快递单号',
  `province_id2` int(11) NULL DEFAULT NULL COMMENT 'Province',
  `city_id2` int(11) NULL DEFAULT NULL COMMENT 'city',
  `area_id2` int(11) NULL DEFAULT NULL COMMENT 'area',
  `address_all2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市区组合',
  `address_info2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zip_code2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `change_name2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家收货人',
  `phone2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家收货人电话',
  `logistics_id2` int(11) NULL DEFAULT NULL COMMENT '退件物流公司ID',
  `logistics_name2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件物流公司',
  `logistics_mark2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件物流公司快递代码',
  `logistics_number2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件快递单号',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '换货数量',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `state` tinyint(1) NOT NULL COMMENT '换货状态：1、未处理；2、审核通过；3、用户发回退件；4、商家收到退件；5、商家发出换件；6、原件退还；7、不处理',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '处理人',
  `opt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户换货' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for member_product_exchange_log
-- ----------------------------
DROP TABLE IF EXISTS `member_product_exchange_log`;
CREATE TABLE `member_product_exchange_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operating_id` int(11) NOT NULL COMMENT '操作人',
  `operating_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `member_product_exchange_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '换货日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product_exchange_log
-- ----------------------------

-- ----------------------------
-- Table structure for member_rule
-- ----------------------------
DROP TABLE IF EXISTS `member_rule`;
CREATE TABLE `member_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register` int(11) NOT NULL COMMENT '会员注册',
  `login` int(11) NOT NULL COMMENT '会员每天登陆',
  `sign` int(11) NOT NULL COMMENT '会员签到送积分数量',
  `order_evaluate` int(11) NOT NULL COMMENT '订单商品评论',
  `order_buy` int(11) NOT NULL COMMENT '购物积分',
  `order_max` int(11) NOT NULL COMMENT '购物积分上限',
  `state` tinyint(4) NOT NULL COMMENT '1、开始；2、关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员经验值和积分规则' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_rule
-- ----------------------------
INSERT INTO `member_rule` VALUES (1, 20, 6, 5, 6, 100, 10000, 1);
INSERT INTO `member_rule` VALUES (2, 20, 6, 10, 20, 100, 10000, 1);

-- ----------------------------
-- Table structure for member_sign_logs
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_logs`;
CREATE TABLE `member_sign_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录IP',
  `create_time` datetime(0) NOT NULL COMMENT '签到时间',
  `source` tinyint(3) NOT NULL COMMENT '会员来源1、pc；2、H5；3、Android；4、IOS ;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员签到日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_sign_logs
-- ----------------------------
INSERT INTO `member_sign_logs` VALUES (2, 1, 'yixiekeji', '127.0.0.1', '2020-02-22 17:37:22', 1);

-- ----------------------------
-- Table structure for member_wxsign
-- ----------------------------
DROP TABLE IF EXISTS `member_wxsign`;
CREATE TABLE `member_wxsign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信用户标识',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信联合登录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_wxsign
-- ----------------------------

-- ----------------------------
-- Table structure for mobile_verify_code
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verify_code`;
CREATE TABLE `mobile_verify_code`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'uid',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `send_num` int(4) NOT NULL COMMENT '获取验证码次数',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序验证码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mobile_verify_code
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `type_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源',
  `is_out` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是外部链接0、不是；1、是(已废弃使用)',
  `out_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外部链接的URL',
  `status` tinyint(1) NOT NULL COMMENT '0、不显示；1、显示',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐文章0、不是推荐文章；1、推荐文章',
  `create_id` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻资讯' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 1, '\r\n									帮助中心', '如何注册成为会员', '<p><a href=\"http://\" title=\"如何注册成为会员\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">如何注册成为会员</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:22:34', '2016-03-02 19:22:34');
INSERT INTO `news` VALUES (2, 1, '\r\n									帮助中心', '积分细则', '<p><a href=\"http://\" title=\"积分细则\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">积分细则</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:23:15', '2016-03-02 19:23:15');
INSERT INTO `news` VALUES (3, 1, '\r\n									帮助中心', '积分兑换说明', '<p><a href=\"http://\" title=\"积分兑换说明\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">积分兑换说明</a>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:33:52', '2016-03-02 19:33:52');
INSERT INTO `news` VALUES (4, 1, '\r\n									帮助中心', '如何搜索', '<p><a href=\"http://\" title=\"如何搜索\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">如何搜索</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:34:21', '2016-03-02 19:34:21');
INSERT INTO `news` VALUES (5, 1, '\r\n									帮助中心', '忘记密码', '<p>									</p><p>									</p><p><a href=\"http://\" title=\"如何搜索\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">忘记密码</a>fgdfgdgrt&nbsp;<img src=\"${(domainUrlUtil.EJS_IMAGE_RESOURCES)!}/images/seller/1/46431502251199363.jpg\" _src=\"${(domainUrlUtil.EJS_IMAGE_RESOURCES)!}/images/seller/1/46431502251199363.jpg\"/></p><p>\r						</p><p>\r						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:35:00', '2017-08-09 11:58:54');
INSERT INTO `news` VALUES (6, 2, '\r\n									店主之家', '如何管理店铺', '<p>如何管理店铺						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 20:04:03', '2016-03-02 20:04:03');
INSERT INTO `news` VALUES (7, 2, '\r\n									店主之家', '查看售出商品', '<p>									</p><p><a href=\"http://\" title=\"查看售出商品\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">查看售出商品</a>\r\n						</p><p>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 20:33:49', '2016-03-02 20:33:49');
INSERT INTO `news` VALUES (8, 2, '\r\n									店主之家', '如何发货', '<p><a href=\"http://\" title=\"如何发货\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">如何发货</a>\r\n						</p>', 'admin', '', 0, '', 1, 3, 0, 1, '2016-03-02 19:35:46', '2016-03-02 19:35:46');
INSERT INTO `news` VALUES (9, 2, '\r\n									店主之家', '商城商品推荐', '<p><a href=\"http://\" title=\"商城商品推荐\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">商城商品推荐</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:41:04', '2016-03-02 19:41:04');
INSERT INTO `news` VALUES (10, 2, '\r\n									店主之家', '如何申请开店', '<p><a href=\"http://\" title=\"如何申请开店\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">如何申请开店</a>\r\n						</p>', 'admin', '', 0, '', 1, 5, 0, 1, '2016-03-02 19:51:24', '2016-03-02 19:51:24');
INSERT INTO `news` VALUES (11, 3, '\r\n									支付方式', '分期付款', '<p><a href=\"http://\" title=\"分期付款\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">分期付款</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:52:01', '2016-03-02 19:52:01');
INSERT INTO `news` VALUES (12, 3, '\r\n									支付方式', '邮局汇款', '<p>									</p><p><a href=\"http://\" title=\"邮局汇款\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">邮局汇款</a>\r\n						</p><p>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 20:34:49', '2016-03-02 20:34:49');
INSERT INTO `news` VALUES (13, 3, '\r\n									支付方式', '公司转账', '<p>									</p><p><a href=\"http://\" title=\"公司转账\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">公司转账</a>\r\n						</p><p>\r\n						</p>', 'admin', '', 0, '', 1, 3, 0, 1, '2016-03-02 20:33:28', '2016-03-02 20:33:28');
INSERT INTO `news` VALUES (14, 3, '\r\n									支付方式', '如何注册支付宝', '<p><a href=\"http://\" title=\"如何注册支付宝\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">如何注册支付宝</a>\r\n						</p>', 'admin', '', 0, '', 1, 4, 0, 1, '2016-03-02 19:52:52', '2016-03-02 19:52:52');
INSERT INTO `news` VALUES (15, 3, '\r\n									支付方式', ' 在线支付', '<p><span style=\"color: rgb(102, 102, 102); font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">&nbsp;</span><a href=\"http://\" title=\"在线支付\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">在线支付</a>\r\n						</p>', 'admin', '', 0, '', 1, 5, 0, 1, '2016-03-02 19:53:08', '2016-03-02 19:53:08');
INSERT INTO `news` VALUES (16, 4, '\r\n									售后服务', '联系卖家', '<p><a href=\"http://\" title=\"联系卖家\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">联系卖家</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:53:43', '2016-03-02 19:53:43');
INSERT INTO `news` VALUES (17, 4, '\r\n									售后服务', '退换货政策', '<p><a href=\"http://\" title=\"退换货政策\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">退换货政策</a>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:54:04', '2016-03-02 19:54:04');
INSERT INTO `news` VALUES (18, 4, '\r\n									售后服务', '退换货流程', '<p><span style=\"color: rgb(102, 102, 102); font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">&nbsp;</span><a href=\"http://\" title=\"退换货流程\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">退换货流程</a>\r\n						</p>', 'admin', '', 0, '', 1, 3, 0, 1, '2016-03-02 19:54:27', '2016-03-02 19:54:27');
INSERT INTO `news` VALUES (19, 4, '\r\n									售后服务', '返修/退换货', '<p>									</p><p><a href=\"http://\" title=\"返修/退换货\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">返修/退换货</a>\r\n						</p><p>\r\n						</p>', 'admin', '', 0, '', 1, 4, 0, 1, '2016-03-02 20:34:18', '2016-03-02 20:34:18');
INSERT INTO `news` VALUES (20, 5, '\r\n									客服中心', '退款申请', '<p><a href=\"http://\" title=\"退款申请 \" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">退款申请</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:55:23', '2016-03-02 19:55:23');
INSERT INTO `news` VALUES (21, 5, '\r\n									客服中心', '会员修改密码', '<a href=\"http://\" title=\"会员修改密码\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">会员修改密码</a><p><br/></p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:56:09', '2016-03-02 19:56:09');
INSERT INTO `news` VALUES (22, 5, '\r\n									客服中心', '会员修改个人资料', '<p><span style=\"color: rgb(102, 102, 102); font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">&nbsp;</span><a href=\"http://\" title=\"会员修改个人资料\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">会员修改个人资料</a>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:56:29', '2016-03-02 19:56:29');
INSERT INTO `news` VALUES (23, 5, '\r\n									客服中心', '常见问题', '<p><a rel=\"nofollow\" target=\"_blank\" href=\"http://help.jd.com/user/issue.html\" style=\"color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 20px; white-space: normal;\">常见问题</a>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:57:03', '2016-03-02 19:57:03');
INSERT INTO `news` VALUES (24, 5, '\r\n									客服中心', '修改收货地址', '<p><a href=\"http://\" title=\"修改收货地址\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">修改收货地址</a>\r\n						</p>', 'admin', '', 0, '', 1, 3, 0, 1, '2016-03-02 19:57:29', '2016-03-02 19:57:29');
INSERT INTO `news` VALUES (25, 6, '\r\n									关于我们', '合作及洽谈', '<p><a href=\"http://\" title=\"合作及洽谈\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">合作及洽谈</a>\r\n						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:58:23', '2016-03-02 19:58:23');
INSERT INTO `news` VALUES (26, 6, '\r\n									关于我们', '招聘英才', '<p><a href=\"http://\" title=\"招聘英才\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">招聘英才</a>\r\n						</p>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:58:44', '2016-03-02 19:58:44');
INSERT INTO `news` VALUES (27, 6, '\r\n									关于我们', '联系我们', '<a href=\"http://\" title=\"联系我们\" style=\"box-sizing: border-box; font-family: &#39;microsoft yahei&#39;; font-size: 12px; line-height: 20px; background-color: rgb(250, 250, 250);\">联系我们</a>', 'admin', '', 0, '', 1, 2, 0, 1, '2016-03-02 19:59:17', '2016-03-02 19:59:17');
INSERT INTO `news` VALUES (28, 6, '\r\n									关于我们', '关于华山创业', '<p>									</p><p>									</p><p>关于华山创业的说明</p><p>\r						</p><p>\r						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2016-03-02 19:59:40', '2020-01-19 15:00:16');
INSERT INTO `news` VALUES (30, 1, '\r\n									帮助中心', '使用说明', '<p>\r									使用说明</p><p>\r						</p>', 'admin', '', 0, '', 1, 123, 0, 1, '2019-01-08 19:25:31', '2020-01-19 15:00:47');
INSERT INTO `news` VALUES (31, 1, '\r\n									帮助中心', '使用说明', '<p>									</p><p>使用说明</p><p>\r						</p>', 'admin', '', 0, '', 1, 123, 0, 1, '2019-01-14 17:53:39', '2020-01-19 15:00:35');
INSERT INTO `news` VALUES (33, 1, '\n									帮助中心', '忘记密码', '<p>忘记密码						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2019-04-24 11:47:49', '2019-04-24 11:47:49');
INSERT INTO `news` VALUES (46, 1, '\r\n									帮助中心', '使用说明', '<p>\r									使用说明</p><p>\r						</p>', 'admin', '', 0, '', 1, 1, 0, 1, '2019-04-28 11:10:06', '2020-01-19 15:01:09');

-- ----------------------------
-- Table structure for news_partner
-- ----------------------------
DROP TABLE IF EXISTS `news_partner`;
CREATE TABLE `news_partner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片标识',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `sort` int(11) NOT NULL COMMENT '数字越小，越靠前',
  `status` tinyint(1) NOT NULL COMMENT '0、不可见；1、可见',
  `create_id` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合作伙伴' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news_partner
-- ----------------------------

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `parent_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL COMMENT '序号越小，越靠前',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES (1, 0, '根结点', '帮助中心', 1, '', '2015-11-11 11:12:12');
INSERT INTO `news_type` VALUES (2, 0, '根结点', '店主之家', 2, '', '2015-11-11 11:12:12');
INSERT INTO `news_type` VALUES (3, 0, '根结点', '支付方式', 3, '', '2015-11-11 11:12:12');
INSERT INTO `news_type` VALUES (4, 0, '根结点', '售后服务', 4, '', '2015-11-11 11:12:12');
INSERT INTO `news_type` VALUES (5, 0, '根结点', '客服中心', 5, '', '2015-11-11 11:12:12');
INSERT INTO `news_type` VALUES (6, 0, '根结点', '关于我们', 6, '', '2015-11-11 11:12:12');

-- ----------------------------
-- Table structure for notice_click_situation
-- ----------------------------
DROP TABLE IF EXISTS `notice_click_situation`;
CREATE TABLE `notice_click_situation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `notice_id` int(11) NOT NULL COMMENT '公告id',
  `view_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '查看时间',
  `state` tinyint(1) NOT NULL COMMENT '状态 0-未读 1-已读（可标记为未读，暂时不用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_seller_id`(`seller_id`) USING BTREE,
  INDEX `idx_notice_id`(`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家公告查看情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_click_situation
-- ----------------------------

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operating_id` int(11) NOT NULL COMMENT '操作人，系统操作为0',
  `operating_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orders_id` int(11) NOT NULL,
  `orders_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES (652, 1, 'huashan', 307, '20030615292008380347', '您提交了订单', '2020-03-06 15:29:20');
INSERT INTO `order_log` VALUES (653, 1, 'huashan', 308, '20030615292008389107', '您提交了订单', '2020-03-06 15:29:20');
INSERT INTO `order_log` VALUES (654, 1, 'huashan', 307, '20030615292008380347', '订单完成支付', '2020-03-06 15:29:33');
INSERT INTO `order_log` VALUES (655, 1, 'huashan', 308, '20030615292008389107', '订单完成支付', '2020-03-06 15:29:33');
INSERT INTO `order_log` VALUES (656, 1, 'huashan', 307, '20030615292008380347', '商家已发货', '2020-03-06 15:37:10');

-- ----------------------------
-- Table structure for order_pay_cash_log
-- ----------------------------
DROP TABLE IF EXISTS `order_pay_cash_log`;
CREATE TABLE `order_pay_cash_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号，第三方支付时传给第三方的订单号',
  `trade_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付交易流水号',
  `payment_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式code：PCUNIONPAY；H5UNIONPAY；PCALIPAY；H5ALIPAY；PCWXPAY；H5WXPAY',
  `payment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式名称：PC银联；H5银联；PC支付宝；H5支付宝；PC微信；H5微信',
  `pay_money` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `pay_order_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付的所有订单号以逗号分隔',
  `pay_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付返回的代码',
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单第三方支付日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_pay_cash_log
-- ----------------------------

-- ----------------------------
-- Table structure for order_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `order_pay_log`;
CREATE TABLE `order_pay_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式code：INTEGRAL；BALANCE;PCUNIONPAY；H5UNIONPAY；PCALIPAY；H5ALIPAY；PCWXPAY；H5WXPAY',
  `payment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式名称：积分支付；余额支付；PC银联；H5银联；PC支付宝；H5支付宝；PC微信；H5微信',
  `pay_money` decimal(10, 2) NOT NULL COMMENT '支付金额(积分支付时为换算后的金额)',
  `pay_integral` int(11) NOT NULL COMMENT '积分支付使用的积分数量',
  `pay_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号，第三方支付时传给第三方的订单号，积分和余额支付时不记录',
  `trade_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付交易流水号',
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单支付日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_pay_log
-- ----------------------------
INSERT INTO `order_pay_log` VALUES (236, 307, '20030615292008380347', 'BALANCE', '余额支付', 119.00, 0, NULL, NULL, 1, 'huashan', '2020-03-06 15:29:33');
INSERT INTO `order_pay_log` VALUES (237, 308, '20030615292008389107', 'BALANCE', '余额支付', 119.00, 0, NULL, NULL, 1, 'huashan', '2020-03-06 15:29:33');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `order_psn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父订单编号',
  `is_parent` tinyint(1) NOT NULL COMMENT '是否总订单：0-否；1-是，总订单在买家支付前使用，子订单在平台和商家端使用',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示：0-否；1-是，总订单在支付前为1，支付后为0，子订单反之，用于买家端显示',
  `relation_order_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联订单编号',
  `order_type` tinyint(3) NOT NULL COMMENT '1、普通订单，2、限时抢购订单，3、团购订单，4、竞价定金订单，5、竞价尾款订单，6、积分商城订单',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员name',
  `order_state` tinyint(3) NOT NULL COMMENT '订单状态：1、未付款的订单；2、待确认的订单；3、待发货的订单；4、已发货的订单；5、已完成的订单；6、取消的订单',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `payment_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '付款状态：0 买家未付款 1 买家已付款',
  `invoice_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '发票状态0、不要发票；1、单位；2个人',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票类型（内容）',
  `tax_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `money_product` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品金额，等于订单中所有的商品的单价乘以数量之和',
  `money_logistics` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '物流费用',
  `money_order` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额，等于商品总金额＋运费-优惠金额总额',
  `money_paid_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额账户支付总金额',
  `money_paid_reality` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '现金支付金额',
  `money_coupon` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `money_act_full` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单满减金额',
  `money_discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额总额（满减、立减、优惠券等所有优惠额的和）',
  `money_back` decimal(10, 2) NOT NULL COMMENT '退款的金额，订单没有退款则为0',
  `money_integral` decimal(10, 2) NOT NULL COMMENT '积分换算金额',
  `integral` int(11) NOT NULL COMMENT '订单使用的积分数量',
  `coupon_user_id` int(11) NOT NULL COMMENT '优惠码ID',
  `act_full_id` int(11) NOT NULL COMMENT '订单满减活动ID',
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID，团购存放团购的ID，集合竞价存放集合竞价的ID，限时抢购限时抢购的ID',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip',
  `payment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式名称',
  `payment_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式code',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `province_id` int(11) NOT NULL COMMENT 'Province',
  `city_id` int(11) NOT NULL COMMENT 'city',
  `area_id` int(11) NOT NULL COMMENT 'area',
  `address_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省市区组合',
  `address_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮编',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单备注',
  `deliver_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '订单完成时间',
  `trade_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '在线支付交易流水号',
  `source` tinyint(4) NOT NULL COMMENT '会员来源1、pc；2、H5；3、Android；4、IOS',
  `logistics_id` int(11) NOT NULL COMMENT '物流公司ID',
  `logistics_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流公司',
  `logistics_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `is_codconfim` tinyint(4) NOT NULL COMMENT '是否货到付款订单0、不是；1、是',
  `codconfirm_id` int(11) NOT NULL COMMENT '货到付款确认人',
  `codconfirm_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货到付款确认Name',
  `codconfirm_time` datetime(0) NULL DEFAULT NULL COMMENT '货到付款确认时间',
  `codconfirm_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货到付款确认备注',
  `codconfirm_state` tinyint(3) NOT NULL COMMENT '货到付款状态 0、非货到付款；1、待确认；2、确认通过可以发货；3、订单取消',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `evaluate_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否评价:1.未评价,2.部分评价,3.全部评价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderSn`(`order_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (307, '20030615292008380347', '20030615292008389107', 0, 1, '', 1, 1, '平台自营', 1, 'huashan', 4, '2020-03-06 15:29:33', 1, 0, NULL, NULL, NULL, 109.00, 10.00, 119.00, 119.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, '219.144.189.79', '余额支付', 'BALANCE', '郭德纲', 2, 716, 937, '北京北京昌平区', '昌平区', '15029999920', '', '710020', '', '2020-03-06 15:37:10', NULL, '', 1, 4, '申通物流', '770000941316867', 0, 0, '', NULL, '', 0, '2020-03-06 15:29:20', '2020-03-06 15:37:10', 1);
INSERT INTO `orders` VALUES (308, '20030615292008389107', '', 1, 0, '', 1, 0, '', 1, 'huashan', 3, '2020-03-06 15:29:33', 1, 0, NULL, NULL, NULL, 109.00, 10.00, 119.00, 119.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, '219.144.189.79', '余额支付', 'BALANCE', '郭德纲', 2, 716, 937, '北京北京昌平区', '昌平区', '15029999920', '', '710020', '', NULL, NULL, '', 1, 0, '', '', 0, 0, '', NULL, '', 0, '2020-03-06 15:29:20', '2020-03-06 15:29:33', 1);

-- ----------------------------
-- Table structure for orders_product
-- ----------------------------
DROP TABLE IF EXISTS `orders_product`;
CREATE TABLE `orders_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `orders_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `orders_psn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '父订单号',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `product_cate_id` int(11) NULL DEFAULT NULL COMMENT '商品分类ID',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `product_goods_id` int(11) NOT NULL COMMENT '货品ID',
  `spec_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格详情',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_sku` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抽象商品sku',
  `package_groups_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销套装0、不是促销套装；大于0，促销套装ID，价格是促销套装的ID',
  `mall_groups_id` int(11) NOT NULL DEFAULT 0 COMMENT '商城套装0，不是上次套装；大于0商城套装ID',
  `gift_id` int(11) NOT NULL DEFAULT 0 COMMENT '赠品ID 0:不是赠品；大于0：是赠品，存赠品的ID',
  `is_gift` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是赠品，0、不是；1、是；',
  `money_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品单价',
  `number` int(11) NOT NULL COMMENT '商品数量',
  `money_amount` decimal(10, 2) NOT NULL COMMENT '网单金额（减去立减优惠后的金额和）',
  `money_act_single` decimal(10, 2) NOT NULL COMMENT '立减优惠金额和',
  `act_single_id` int(11) NOT NULL DEFAULT 0 COMMENT '单品立减活动ID，无设置0',
  `act_group_id` int(11) NOT NULL DEFAULT 0 COMMENT '团购ID，为0正常购买',
  `act_flash_sale_id` int(11) NOT NULL DEFAULT 0 COMMENT '限时抢购ID，为0正常购买',
  `act_flash_sale_product_id` int(11) NOT NULL DEFAULT 0 COMMENT '限时抢购活动商品ID',
  `act_bidding_id` int(11) NOT NULL DEFAULT 0 COMMENT '集合竞价ID，为0正常购买',
  `act_integral_id` int(11) NOT NULL DEFAULT 0 COMMENT '积分换购ID，为0正常购买',
  `act_integral_num` int(11) NOT NULL DEFAULT 0 COMMENT '使用积分数量',
  `act_integral_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '积分换购的现金价格',
  `system_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '系统备注，不给用户显示',
  `back_number` int(11) NOT NULL COMMENT '退货数量，默认为0',
  `exchange_number` int(11) NOT NULL COMMENT '换货数量，默认为0',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `is_evaluate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否评价:0.未评价，1.已评价',
  `salecode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推荐人的推广码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders_product
-- ----------------------------
INSERT INTO `orders_product` VALUES (217, 307, '20030615292008380347', '20030615292008389107', 1, '平台自营', 424, 86, 203, '', '无敌的进口面粉', '111', 0, 0, 0, 0, 109.00, 1, 109.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, '2020-03-06 15:29:20', '2020-03-06 15:29:20', 0, '');

-- ----------------------------
-- Table structure for pc_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_banner`;
CREATE TABLE `pc_index_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用2预使用3不使用',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_banner
-- ----------------------------
INSERT INTO `pc_index_banner` VALUES (6, '春上新', '#', '/images/ad/6341a834-a05d-44e2-a64c-b96f10b5ef10.png', 1, '2020-03-03 20:49:43', '2020-06-03 20:49:46', 1, 2, 'huashan', '2020-03-03 20:50:07', 2, 'huashan', '2020-03-03 23:58:15');
INSERT INTO `pc_index_banner` VALUES (7, '复工物资', '#', '/images/ad/56381b6b-4dcd-4ae3-8598-22a1549e2ef1.png', 6, '2020-03-04 00:23:32', '2020-06-04 00:23:34', 1, 2, 'huashan', '2020-03-04 00:23:43', 2, 'huashan', '2020-03-04 00:25:33');

-- ----------------------------
-- Table structure for pc_index_floor
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_floor`;
CREATE TABLE `pc_index_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼层名称',
  `order_no` int(2) NOT NULL COMMENT '楼层排序号',
  `master_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼层主图片',
  `master_link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '楼层主图片链接地址',
  `adv_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '楼层上端广告图片',
  `adv_link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层上端广告图片链接地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态1使用2预使用3不使用',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '楼层备注',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页楼层表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_floor
-- ----------------------------

-- ----------------------------
-- Table structure for pc_index_floor_class
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_floor_class`;
CREATE TABLE `pc_index_floor_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_id` int(11) UNSIGNED NOT NULL COMMENT '所属楼层ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼层分类名称',
  `order_no` int(2) NOT NULL COMMENT '楼层分类排序号',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态1使用2预使用3不使用',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '楼层分类备注',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页楼层分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_floor_class
-- ----------------------------

-- ----------------------------
-- Table structure for pc_index_floor_data
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_floor_data`;
CREATE TABLE `pc_index_floor_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_class_id` int(10) UNSIGNED NOT NULL COMMENT '所属楼层分类ID',
  `data_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1商品2图片链接',
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '数据ID（data_type为1表示商品ID）',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接标题',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页楼层分类数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_floor_data
-- ----------------------------

-- ----------------------------
-- Table structure for pc_index_floor_patch
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_floor_patch`;
CREATE TABLE `pc_index_floor_patch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_id` int(10) UNSIGNED NOT NULL COMMENT '所属楼层分类ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示文字',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `status` tinyint(1) NOT NULL COMMENT '状态1使用2预使用3不使用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页楼层碎屑表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_floor_patch
-- ----------------------------

-- ----------------------------
-- Table structure for pc_index_image
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_image`;
CREATE TABLE `pc_index_image`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用2预使用3不使用',
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1、首页头部，2、轮播图浮动图片，3、轮播图下面图片',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端首页的一些图片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_index_image
-- ----------------------------

-- ----------------------------
-- Table structure for pc_recommend
-- ----------------------------
DROP TABLE IF EXISTS `pc_recommend`;
CREATE TABLE `pc_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommend_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1首页热销商品2首页今日推荐(字段已不使用)',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用2预使用3不使用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC推荐商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for pc_seller_index
-- ----------------------------
DROP TABLE IF EXISTS `pc_seller_index`;
CREATE TABLE `pc_seller_index`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'logo图片',
  `notice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细介绍',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端商家首页信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_seller_index
-- ----------------------------

-- ----------------------------
-- Table structure for pc_seller_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `pc_seller_index_banner`;
CREATE TABLE `pc_seller_index_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `order_no` int(2) UNSIGNED NOT NULL COMMENT '排序',
  `start_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '展示开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '展示结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用2预使用3不使用',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端商家首页轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_seller_index_banner
-- ----------------------------

-- ----------------------------
-- Table structure for pc_seller_recommend
-- ----------------------------
DROP TABLE IF EXISTS `pc_seller_recommend`;
CREATE TABLE `pc_seller_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐标题',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1使用2预使用3不使用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端商家推荐类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_seller_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for pc_seller_recommend_data
-- ----------------------------
DROP TABLE IF EXISTS `pc_seller_recommend_data`;
CREATE TABLE `pc_seller_recommend_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED NOT NULL COMMENT '商家ID',
  `recommend_id` int(10) UNSIGNED NOT NULL COMMENT '推荐类型ID',
  `data_type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据类型：1商品2图片链接',
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '数据ID（data_type为1表示商品ID）',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接标题',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `order_no` int(2) NOT NULL COMMENT '排序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据说明',
  `create_user_id` int(10) UNSIGNED NOT NULL,
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user_id` int(10) UNSIGNED NOT NULL,
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端商家推荐数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_seller_recommend_data
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_cate_id` int(11) NOT NULL COMMENT '分类ID',
  `product_cate_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品所属分类路径（只包含父路径）',
  `name1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称建议50个字符',
  `name2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品促销信息（建议100个字符）',
  `keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品关键字，用于检索商品，用逗号分隔',
  `product_brand_id` int(11) NOT NULL COMMENT '品牌ID',
  `is_self` tinyint(4) NOT NULL COMMENT '1、自营；2、商家',
  `cost_price` decimal(10, 2) NOT NULL COMMENT '成本价',
  `protected_price` decimal(10, 2) NOT NULL COMMENT '保护价，最低价格不能低于',
  `market_price` decimal(10, 2) NOT NULL COMMENT '市场价',
  `mall_pc_price` decimal(10, 2) NOT NULL COMMENT '商城价',
  `mal_mobile_price` decimal(10, 2) NOT NULL COMMENT '商城价Mobile',
  `virtual_sales` int(11) NOT NULL COMMENT '虚拟销量',
  `actual_sales` int(11) NOT NULL COMMENT '实际销量',
  `product_stock` int(11) NOT NULL COMMENT '商品库存',
  `is_norm` tinyint(4) NOT NULL COMMENT '1、没有启用规格；2、启用规格',
  `norm_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格ID集合',
  `norm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格属性值集合 空',
  `state` tinyint(3) NOT NULL DEFAULT 0 COMMENT '1、刚创建；2、提交审核；3、审核通过；4、申请驳回；5、商品删除；6、上架；7、下架',
  `is_top` tinyint(4) NOT NULL COMMENT '1、不推荐；2、推荐',
  `up_time` datetime(0) NOT NULL COMMENT '商品上架时间',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述信息',
  `packing` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包装清单',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `seller_cate_id` int(11) NOT NULL COMMENT '商家分类ID',
  `seller_is_top` tinyint(4) NOT NULL COMMENT '商品推荐，1、不推荐；2、推荐',
  `seller_state` tinyint(4) NOT NULL COMMENT '店铺状态：1、店铺正常；2、店铺关闭 默认1',
  `comments_number` int(11) NOT NULL DEFAULT 0 COMMENT '评价总数',
  `product_cate_state` tinyint(4) NOT NULL COMMENT '平台商品分类状态：1、分类正常；2、分类关闭 默认1',
  `is_invented_product` tinyint(4) NOT NULL COMMENT '是否是虚拟商品：1、实物商品；2、虚拟商品',
  `transport_type` tinyint(1) NULL DEFAULT NULL COMMENT '运费计算类型：1、按件，2、按重量，3、按体积',
  `transport_id` int(11) NULL DEFAULT NULL COMMENT '运费模板id',
  `master_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主图',
  `product_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `sale_scale1` decimal(10, 2) NULL DEFAULT NULL COMMENT '一级分佣比例',
  `sale_scale2` decimal(10, 2) NULL DEFAULT NULL COMMENT '二级分佣比例',
  `group_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合商品ID',
  `group_total_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '组合商品总价',
  `group_discount_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '组合商品总优惠',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (86, 424, '/389/400', '无敌的进口面粉', '面粉', '面粉', 50, 1, 70.00, 90.00, 120.00, 109.00, 108.00, 122, 1, 221, 1, '', '', 6, 2, '2020-03-06 15:18:34', '无敌的进口面粉<p><br/>									</p>', '1袋', 1, 1, '2020-03-06 15:19:19', '2020-03-06 15:29:20', 43, 1, 1, 0, 1, 1, 1, 8, '/images/seller/1/65814456-886c-4a55-9deb-ba2bd8033d56.png', 'g-000001', NULL, NULL, NULL, 0.00, 0.00);
INSERT INTO `product` VALUES (87, 424, '/389/400', '俄罗斯黑土谷德维尔高筋小麦面粉 2kg（90份起订）', '来自俄罗斯的精选', '小麦面粉,高筋,俄罗斯,谷德维尔', 50, 1, 35.00, 35.00, 49.00, 35.00, 35.00, 90, 0, 90, 1, '', '', 6, 2, '2020-03-07 00:49:59', '<p><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FmLOWw-WfsGja5z60LBRBFQ4ZSvM.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FmLOWw-WfsGja5z60LBRBFQ4ZSvM.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FqcI02uaOnFAnkbvyH5-J4zprBDe.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FqcI02uaOnFAnkbvyH5-J4zprBDe.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FlIflCzRStLTgxbQw-jlQadTjryT.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FlIflCzRStLTgxbQw-jlQadTjryT.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fj_bDSvEmUfyrJmbRsYYA2lKCBva.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fj_bDSvEmUfyrJmbRsYYA2lKCBva.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FqRVhhAwJEJ9_gVh9xnpsR2Ge7pI.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FqRVhhAwJEJ9_gVh9xnpsR2Ge7pI.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'570\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FsfW5bO4Jv3jCBxYITIyPdp-Vi5F.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FsfW5bO4Jv3jCBxYITIyPdp-Vi5F.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><br/>									</p>', '俄罗斯黑土谷德维尔高筋小麦面粉 2kg（90份起订）', 1, 1, '2020-03-07 00:55:41', '2020-03-07 01:00:26', 43, 1, 1, 0, 1, 1, 1, 8, '/images/seller/1/a9b810a9-957e-4f6d-a6c8-0394bf5a0c6c.png', 'jkxmmfgd', NULL, NULL, NULL, 0.00, 0.00);
INSERT INTO `product` VALUES (88, 425, '/389/400', '奥利班娜特级初榨橄榄油 750ml*2礼盒装（45份起订）', '来自西班牙核心产区的橄榄油', '特级,初榨,橄榄油,奥利班娜,礼盒', 51, 1, 125.00, 125.00, 149.00, 125.00, 125.00, 45, 0, 90, 1, '', '', 6, 2, '2020-03-07 01:04:35', '<p style=\'text-align: center;\'><img data-origin-width=\'750\' data-origin-height=\'3037\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FkG8p32KLkbiCWgZDUo8lsrjM6GN.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FkG8p32KLkbiCWgZDUo8lsrjM6GN.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'750\' data-origin-height=\'3037\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FlzgXPikGH2RH-Kbk9rCVTUwdz0m.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FlzgXPikGH2RH-Kbk9rCVTUwdz0m.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><br/>									</p>', '750ml*2礼盒装', 1, 1, '2020-03-07 01:09:44', '2020-03-07 01:10:25', 43, 2, 1, 0, 1, 1, 1, 8, '/images/seller/1/408e7856-2de2-44a1-b05f-9fe62e4c3875.jpg', 'jk20200307002', NULL, NULL, NULL, 0.00, 0.00);
INSERT INTO `product` VALUES (89, 424, '/389/400', '瀛七星日本特A级北海道大米 2KG/包（90份起订）', '北海道原装进口', '瀛七星,日本,特A级,北海道,大米', 52, 1, 142.00, 142.00, 188.00, 142.00, 142.00, 90, 0, 90, 1, '', '', 6, 2, '2020-03-07 01:15:28', '<p style=\'text-align: center;\'><img data-origin-width=\'800\' data-origin-height=\'615\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fv8s_ow2qB9itGd-Nlqpvyzhthas.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fv8s_ow2qB9itGd-Nlqpvyzhthas.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'684\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fi_mIn0eO5epVyc2AM4SiscR1Foy.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fi_mIn0eO5epVyc2AM4SiscR1Foy.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'800\' data-origin-height=\'800\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FoqfWversatuZyiSDfiGkj3ew0Ik.png!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FoqfWversatuZyiSDfiGkj3ew0Ik.png!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'2480\' data-origin-height=\'3366\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fh8dzWPiL-QyVzx-pbQrugbbXl-l.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/Fh8dzWPiL-QyVzx-pbQrugbbXl-l.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><img data-origin-width=\'2480\' data-origin-height=\'3366\' src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FnZlhTazzwbkcE58e5Awm9FNvI9e.jpg!730x0.jpg\' _src=\'https://img.yzcdn.cn/upload_files/2020/01/14/FnZlhTazzwbkcE58e5Awm9FNvI9e.jpg!730x0.jpg\' style=\'max-width: 100%; width: auto; height: auto; color: rgb(0, 0, 0); font-family: Helvetica, &quot;STHeiti STXihei&quot;, &quot;Microsoft JhengHei&quot;, &quot;Microsoft YaHei&quot;, Tohoma, Arial; white-space: normal;\'/><br/>									</p>', '2kg装', 1, 1, '2020-03-07 01:17:19', '2020-03-07 01:17:59', 43, 2, 1, 0, 1, 1, 1, 8, '/images/seller/1/a1bca75f-eb64-4475-a175-86a8b7a88cb6.jpg', 'jk20200307003', NULL, NULL, NULL, 0.00, 0.00);

-- ----------------------------
-- Table structure for product_ask
-- ----------------------------
DROP TABLE IF EXISTS `product_ask`;
CREATE TABLE `product_ask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '咨询人ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询人账号',
  `ask_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询内容',
  `reply_id` int(11) NULL DEFAULT NULL COMMENT '回复人ID',
  `reply_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复人账号',
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `reply_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `state` tinyint(4) NOT NULL COMMENT '1、咨询；2、已经回答；3、前台显示；4、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品咨询管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_ask
-- ----------------------------

-- ----------------------------
-- Table structure for product_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_attr`;
CREATE TABLE `product_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `product_type_attr_id` int(11) NOT NULL COMMENT '属性ID，可以根据属性ID来进行检索',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `state` tinyint(4) NOT NULL COMMENT '1、检索属性；2、自定义属性；3、商品自定义属性（product_tyep_attr_id=0）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2067 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品对应属性表(保存商品时插入)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attr
-- ----------------------------
INSERT INTO `product_attr` VALUES (2056, 86, 91, '小麦面粉', '高筋', 1);
INSERT INTO `product_attr` VALUES (2057, 86, 95, '大米', '特A级', 1);
INSERT INTO `product_attr` VALUES (2058, 86, 92, '米面种类', '', 2);
INSERT INTO `product_attr` VALUES (2059, 87, 91, '小麦面粉', '高筋', 1);
INSERT INTO `product_attr` VALUES (2060, 87, 95, '大米', '', 1);
INSERT INTO `product_attr` VALUES (2061, 87, 92, '米面种类', '小麦面粉', 2);
INSERT INTO `product_attr` VALUES (2062, 88, 93, '油品', '橄榄油', 1);
INSERT INTO `product_attr` VALUES (2063, 88, 94, '油品种类', '初榨', 2);
INSERT INTO `product_attr` VALUES (2064, 89, 91, '小麦面粉', '高筋', 1);
INSERT INTO `product_attr` VALUES (2065, 89, 95, '大米', '', 1);
INSERT INTO `product_attr` VALUES (2066, 89, 92, '米面种类', '特A级', 2);

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `name_first` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌首字母',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '品牌图片',
  `look_method` tinyint(4) NOT NULL COMMENT '展示方式1、图片；2、文字',
  `top` tinyint(4) NOT NULL COMMENT '推荐1、推荐；2、不推荐',
  `sort` int(4) NOT NULL COMMENT '排序',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `state` tinyint(4) NOT NULL COMMENT '状态 0、默认；1、提交审核；2、显示中；3、审核失败；4、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品品牌' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
INSERT INTO `product_brand` VALUES (50, '谷德维尔(goodwill)', 'G', '/images/brand/6b885c19-570e-433f-b6ff-9569aac3fddb.png', 2, 1, 100, 2, '2020-03-03 16:55:24', 2, '2020-03-03 16:55:24', 2);
INSERT INTO `product_brand` VALUES (51, '奥利班娜', 'O', '/images/brand/eca0c86a-a39d-4c91-9377-fefe88d25322.png', 2, 2, 5, 2, '2020-03-03 17:17:19', 2, '2020-03-03 17:17:19', 2);
INSERT INTO `product_brand` VALUES (52, '瀛七星', 'Y', '/images/brand/f73122db-53d2-4a80-a21d-2600a8d90f86.png', 2, 1, 10, 2, '2020-03-03 17:22:06', 2, '2020-03-03 17:22:06', 2);
INSERT INTO `product_brand` VALUES (53, '白水', 'B', '/images/brand/4afe296e-014c-4f4e-8994-5746f95fd28e.png', 2, 2, 10, 2, '2020-03-03 17:24:46', 2, '2020-03-03 17:24:46', 2);
INSERT INTO `product_brand` VALUES (54, '猫山王', 'M', '/images/brand/d11e945b-1ce7-43a4-a71b-b4a3e5674cc1.png', 2, 2, 10, 2, '2020-03-03 17:26:34', 2, '2020-03-03 17:26:34', 2);
INSERT INTO `product_brand` VALUES (55, '横羊天下', 'H', '/images/brand/b45db477-40dd-4b8b-8f6e-6d73596f1a03.png', 2, 2, 10, 2, '2020-03-03 17:30:52', 2, '2020-03-03 17:30:52', 2);
INSERT INTO `product_brand` VALUES (56, '晖腾晖哥', 'H', '/images/brand/7e92b717-335c-4f28-a627-4c6d674e8738.png', 2, 1, 10, 2, '2020-03-06 00:25:20', 2, '2020-03-06 00:25:20', 2);
INSERT INTO `product_brand` VALUES (57, '萃美天谷', 'C', '/images/brand/5c0e1346-9a7e-45da-a5a3-39691a31c6f9.png', 2, 2, 10, 2, '2020-03-06 00:29:19', 2, '2020-03-06 00:29:19', 2);
INSERT INTO `product_brand` VALUES (58, '爱菊', 'A', '/images/brand/a679d28c-f22c-4c7a-9d0d-1f9b3a9cba67.png', 2, 1, 10, 2, '2020-03-06 10:30:41', 2, '2020-03-06 10:30:41', 2);
INSERT INTO `product_brand` VALUES (59, '阿利维娅', 'A', '/images/brand/d310a514-f7c8-4e5e-8a68-82714c207b71.png', 2, 2, 10, 2, '2020-03-06 10:31:27', 2, '2020-03-06 10:31:27', 2);
INSERT INTO `product_brand` VALUES (60, '泰玛丽', 'T', '/images/brand/ab52e809-2185-4487-ac98-edad01898d69.png', 2, 2, 10, 2, '2020-03-06 10:34:28', 2, '2020-03-06 10:34:28', 2);
INSERT INTO `product_brand` VALUES (61, '旌仕坊', 'J', '/images/brand/6d094357-53aa-4a30-882d-38f225de81b6.png', 2, 2, 10, 2, '2020-03-06 10:42:09', 2, '2020-03-06 10:42:09', 2);
INSERT INTO `product_brand` VALUES (62, '白水杜康', 'B', '/images/brand/ea8391be-ccb2-4271-9dba-badac64d2aa5.png', 2, 1, 10, 2, '2020-03-06 10:54:55', 2, '2020-03-06 10:54:55', 2);
INSERT INTO `product_brand` VALUES (63, '长麟', 'C', '/images/brand/bf498870-e679-4429-8445-b05b4efff346.png', 2, 1, 10, 2, '2020-03-06 14:49:30', 2, '2020-03-06 14:49:30', 2);
INSERT INTO `product_brand` VALUES (64, '魔鑫王', 'M', '/images/brand/bdfdf84d-703d-4bf3-9b00-1bfc2b739313.png', 2, 1, 10, 2, '2020-03-06 14:52:46', 2, '2020-03-06 14:52:46', 2);
INSERT INTO `product_brand` VALUES (65, '大秦岭牛伯伯', 'D', '/images/brand/b20bde69-3290-4135-bcfc-88b7d3b5d500.png', 2, 1, 10, 2, '2020-03-06 15:34:15', 2, '2020-03-06 15:36:23', 2);
INSERT INTO `product_brand` VALUES (66, '兴华果业', 'X', '/images/brand/fa762562-a740-48b1-9b15-a5005c803b9e.png', 2, 1, 10, 2, '2020-03-06 16:37:31', 2, '2020-03-06 16:37:31', 2);
INSERT INTO `product_brand` VALUES (67, '果乡情', 'G', '/images/brand/f72aee26-032c-47ab-982a-f0a7becfd91b.png', 2, 2, 10, 2, '2020-03-06 16:48:48', 2, '2020-03-06 16:48:48', 2);

-- ----------------------------
-- Table structure for product_cate
-- ----------------------------
DROP TABLE IF EXISTS `product_cate`;
CREATE TABLE `product_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '类型ID',
  `pid` int(11) NOT NULL COMMENT '父类ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上级分类路径',
  `scaling` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '分佣比例(商家给平台的分佣比例，填写0到1的数字)',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `update_id` int(11) NOT NULL COMMENT '更新人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '0、默认；1、提交审核；2、审核通过；3、审核失败；4、停用',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 481 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_cate
-- ----------------------------
INSERT INTO `product_cate` VALUES (389, 0, 0, '进口食品', '/', 0.000, 2, 2, '2020-03-03 15:57:43', '2020-03-03 15:57:43', 100, 1, NULL);
INSERT INTO `product_cate` VALUES (390, 0, 0, '扶贫专区', '/', 0.000, 2, 2, '2020-03-03 15:57:58', '2020-03-03 15:57:58', 1, 1, NULL);
INSERT INTO `product_cate` VALUES (391, 0, 0, '粮油调味', '/', 0.000, 2, 2, '2020-03-03 15:58:18', '2020-03-03 15:58:49', 15, 1, NULL);
INSERT INTO `product_cate` VALUES (392, 0, 0, '果蔬蛋品', '/', 0.000, 2, 2, '2020-03-03 15:58:36', '2020-03-03 15:58:36', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (393, 0, 0, '酒水饮料', '/', 0.000, 2, 2, '2020-03-03 15:59:02', '2020-03-03 15:59:02', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (394, 0, 0, '休闲零食', '/', 0.000, 2, 2, '2020-03-03 15:59:17', '2020-03-03 15:59:17', 25, 1, NULL);
INSERT INTO `product_cate` VALUES (395, 0, 0, '商洛专区', '/', 0.000, 2, 2, '2020-03-03 15:59:57', '2020-03-03 15:59:57', 30, 3, NULL);
INSERT INTO `product_cate` VALUES (396, 0, 0, '麟游', '/', 0.000, 2, 2, '2020-03-03 16:00:22', '2020-03-03 16:00:22', 30, 3, NULL);
INSERT INTO `product_cate` VALUES (397, 0, 0, '白水系列', '/', 0.000, 2, 2, '2020-03-03 16:00:42', '2020-03-03 16:00:42', 40, 3, NULL);
INSERT INTO `product_cate` VALUES (398, 0, 0, '食品/酒类/生鲜/特产', '/', 0.000, 2, 2, '2020-03-03 16:21:35', '2020-03-03 16:21:35', 1, 3, NULL);
INSERT INTO `product_cate` VALUES (399, 0, 398, '食品', '/398', 0.000, 2, 2, '2020-03-03 16:22:32', '2020-03-03 16:24:26', 10, 3, NULL);
INSERT INTO `product_cate` VALUES (400, 0, 389, '进口食品', '/389', 0.000, 2, 2, '2020-03-05 13:39:01', '2020-03-05 13:39:01', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (401, 0, 390, '扶贫产品', '/390', 0.000, 2, 2, '2020-03-05 13:39:24', '2020-03-05 13:39:24', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (402, 0, 391, '米面', '/391', 0.000, 2, 2, '2020-03-05 13:39:52', '2020-03-05 13:39:52', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (403, 0, 391, '油品', '/391', 0.000, 2, 2, '2020-03-05 13:40:40', '2020-03-05 13:40:40', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (404, 0, 391, '调味料', '/391', 0.000, 2, 2, '2020-03-05 13:41:12', '2020-03-05 13:41:12', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (405, 0, 391, '南北干货', '/391', 0.000, 2, 2, '2020-03-05 13:41:37', '2020-03-05 13:41:37', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (406, 0, 391, '其他', '/391', 0.000, 2, 2, '2020-03-05 13:41:58', '2020-03-05 13:41:58', 30, 1, NULL);
INSERT INTO `product_cate` VALUES (407, 0, 392, '水果', '/392', 0.000, 2, 2, '2020-03-05 13:42:36', '2020-03-05 13:42:36', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (408, 0, 392, '蛋类', '/392', 0.000, 2, 2, '2020-03-05 13:42:49', '2020-03-05 13:42:49', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (409, 0, 392, '生鲜菜品', '/392', 0.000, 2, 2, '2020-03-05 13:43:16', '2020-03-05 13:43:16', 30, 1, NULL);
INSERT INTO `product_cate` VALUES (410, 0, 393, '白酒', '/393', 0.000, 2, 2, '2020-03-05 13:43:42', '2020-03-05 13:43:42', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (411, 0, 393, '饮料', '/393', 0.000, 2, 2, '2020-03-05 13:44:05', '2020-03-05 13:44:05', 5, 1, NULL);
INSERT INTO `product_cate` VALUES (412, 0, 393, '红酒', '/393', 0.000, 2, 2, '2020-03-05 13:44:38', '2020-03-05 13:44:38', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (413, 0, 393, '其他酒类', '/393', 0.000, 2, 2, '2020-03-05 17:13:16', '2020-03-05 17:13:16', 30, 1, NULL);
INSERT INTO `product_cate` VALUES (414, 0, 393, '乳品', '/393', 0.000, 2, 2, '2020-03-05 17:13:41', '2020-03-05 17:13:41', 25, 1, NULL);
INSERT INTO `product_cate` VALUES (415, 0, 394, '饼干零食', '/394', 0.000, 2, 2, '2020-03-05 17:14:26', '2020-03-05 20:53:26', 5, 1, NULL);
INSERT INTO `product_cate` VALUES (416, 0, 394, '糖果巧克力', '/394', 0.000, 2, 2, '2020-03-05 17:14:38', '2020-03-05 20:54:06', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (417, 0, 394, '坚果干货', '/394', 0.000, 2, 2, '2020-03-05 20:52:51', '2020-03-05 20:53:12', 30, 1, NULL);
INSERT INTO `product_cate` VALUES (418, 0, 394, '风味特产', '/394', 0.000, 2, 2, '2020-03-05 20:54:40', '2020-03-05 20:54:40', 40, 1, NULL);
INSERT INTO `product_cate` VALUES (419, 0, 394, '其他零食', '/394', 0.000, 2, 2, '2020-03-05 20:55:01', '2020-03-05 20:55:01', 50, 1, NULL);
INSERT INTO `product_cate` VALUES (420, 0, 0, '产地风味', '/', 0.000, 2, 2, '2020-03-05 20:55:36', '2020-03-05 20:55:36', 60, 1, NULL);
INSERT INTO `product_cate` VALUES (421, 0, 420, '商洛专区', '/420', 0.000, 2, 2, '2020-03-05 20:55:56', '2020-03-05 20:55:56', 5, 1, NULL);
INSERT INTO `product_cate` VALUES (422, 0, 420, '白水系列', '/420', 0.000, 2, 2, '2020-03-05 20:56:10', '2020-03-05 20:56:10', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (423, 0, 420, '麟游', '/420', 0.000, 2, 2, '2020-03-05 20:56:40', '2020-03-05 20:56:40', 40, 1, NULL);
INSERT INTO `product_cate` VALUES (424, 12, 400, '进口米面', '/389/400', 0.000, 2, 2, '2020-03-05 22:46:30', '2020-03-05 22:46:30', 100, 1, NULL);
INSERT INTO `product_cate` VALUES (425, 13, 400, '进口油品', '/389/400', 0.000, 2, 2, '2020-03-05 22:47:18', '2020-03-05 22:47:18', 90, 1, NULL);
INSERT INTO `product_cate` VALUES (426, 14, 400, '进口生鲜', '/389/400', 0.000, 2, 2, '2020-03-05 22:47:48', '2020-03-05 22:47:48', 80, 1, NULL);
INSERT INTO `product_cate` VALUES (427, 14, 401, '蔬果生鲜', '/390/401', 0.000, 2, 2, '2020-03-06 00:16:49', '2020-03-06 00:16:49', 5, 1, NULL);
INSERT INTO `product_cate` VALUES (428, 14, 401, '风味特产', '/390/401', 0.000, 2, 2, '2020-03-06 16:53:17', '2020-03-06 16:53:17', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (429, 14, 401, '农业特产', '/390/401', 0.000, 2, 2, '2020-03-06 16:54:00', '2020-03-06 16:55:07', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (430, 12, 401, '米面粮油', '/390/401', 0.000, 2, 2, '2020-03-06 16:54:49', '2020-03-06 16:54:49', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (431, 12, 402, '面粉', '/391/402', 0.000, 2, 2, '2020-03-06 19:22:18', '2020-03-06 19:22:18', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (432, 12, 402, '大米', '/391/402', 0.000, 2, 2, '2020-03-06 19:22:52', '2020-03-06 19:22:52', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (433, 13, 403, '橄榄油', '/391/403', 0.000, 2, 2, '2020-03-06 19:23:30', '2020-03-06 19:23:30', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (434, 13, 403, '花生油', '/391/403', 0.000, 2, 2, '2020-03-06 19:23:55', '2020-03-06 19:23:55', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (435, 13, 403, '玉米油', '/391/403', 0.000, 2, 2, '2020-03-06 19:24:15', '2020-03-06 19:24:15', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (436, 13, 403, '菜籽油', '/391/403', 0.000, 2, 2, '2020-03-06 19:24:42', '2020-03-06 19:24:42', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (437, 13, 403, '食用油', '/391/403', 0.000, 2, 2, '2020-03-06 19:24:58', '2020-03-06 19:24:58', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (438, 14, 404, '花椒', '/391/404', 0.000, 2, 2, '2020-03-06 19:26:10', '2020-03-06 19:26:10', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (439, 13, 403, '核桃油', '/391/403', 0.000, 2, 2, '2020-03-06 19:26:47', '2020-03-06 19:26:47', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (440, 13, 403, '其他油', '/391/403', 0.000, 2, 2, '2020-03-06 19:41:46', '2020-03-06 19:41:46', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (441, 14, 405, '木耳', '/391/405', 0.000, 2, 2, '2020-03-06 19:42:16', '2020-03-06 19:42:16', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (442, 14, 405, '香菇', '/391/405', 0.000, 2, 2, '2020-03-06 19:43:06', '2020-03-06 19:43:06', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (443, 14, 405, '黄花菜', '/391/405', 0.000, 2, 2, '2020-03-06 19:43:46', '2020-03-06 19:43:46', 20, 1, NULL);
INSERT INTO `product_cate` VALUES (444, 14, 405, '其他干货', '/391/405', 0.000, 2, 2, '2020-03-06 19:44:07', '2020-03-06 19:44:07', 30, 1, NULL);
INSERT INTO `product_cate` VALUES (445, 12, 406, '礼盒套装', '/391/406', 0.000, 2, 2, '2020-03-06 19:44:34', '2020-03-06 19:44:34', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (446, 14, 407, '苹果', '/392/407', 0.000, 2, 2, '2020-03-06 19:45:25', '2020-03-06 19:45:25', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (447, 14, 407, '榴莲', '/392/407', 0.000, 2, 2, '2020-03-06 19:45:47', '2020-03-06 19:45:47', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (448, 14, 408, '鸡蛋', '/392/408', 0.000, 2, 2, '2020-03-06 19:46:12', '2020-03-06 19:46:12', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (449, 12, 408, '鸭蛋', '/392/408', 0.000, 2, 2, '2020-03-06 19:46:29', '2020-03-06 19:46:29', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (450, 12, 408, '其他蛋类', '/392/408', 0.000, 2, 2, '2020-03-06 19:46:52', '2020-03-06 19:46:52', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (451, 14, 409, '蔬菜礼盒', '/392/409', 0.000, 2, 2, '2020-03-06 19:47:19', '2020-03-06 19:47:19', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (452, 13, 411, '苹果醋', '/393/411', 0.000, 2, 2, '2020-03-06 19:48:04', '2020-03-06 19:48:04', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (453, 13, 410, '白水杜康', '/393/410', 0.000, 2, 2, '2020-03-06 19:48:27', '2020-03-06 19:48:27', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (454, 13, 411, '蜂蜜', '/393/411', 0.000, 2, 2, '2020-03-06 19:48:52', '2020-03-06 19:48:52', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (455, 13, 411, '其他饮料', '/393/411', 0.000, 2, 2, '2020-03-06 19:49:15', '2020-03-06 19:49:15', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (456, 13, 412, '葡萄酒', '/393/412', 0.000, 2, 2, '2020-03-06 19:49:39', '2020-03-06 19:49:39', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (457, 13, 412, '白葡萄酒', '/393/412', 0.000, 2, 2, '2020-03-06 19:50:15', '2020-03-06 19:50:15', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (458, 13, 413, '白兰地', '/393/413', 0.000, 2, 2, '2020-03-06 19:50:38', '2020-03-06 19:50:38', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (459, 13, 413, '威士忌', '/393/413', 0.000, 2, 2, '2020-03-06 19:50:54', '2020-03-06 19:50:54', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (460, 14, 418, '肉干', '/394/418', 0.000, 2, 2, '2020-03-06 20:28:07', '2020-03-06 20:28:07', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (461, 12, 417, '坚果礼盒', '/394/417', 0.000, 2, 2, '2020-03-06 20:28:46', '2020-03-06 20:28:46', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (462, 12, 415, '魔芋制品', '/394/415', 0.000, 2, 2, '2020-03-06 20:31:12', '2020-03-06 20:31:12', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (463, 14, 418, '蜂蜜', '/394/418', 0.000, 2, 2, '2020-03-06 20:32:23', '2020-03-06 20:32:23', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (464, 12, 417, '核桃制品', '/394/417', 0.000, 2, 2, '2020-03-06 20:33:01', '2020-03-06 20:33:01', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (465, 12, 415, '果干', '/394/415', 0.000, 2, 2, '2020-03-06 21:59:00', '2020-03-06 21:59:00', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (466, 12, 415, '板栗制品', '/394/415', 0.000, 2, 2, '2020-03-06 21:59:51', '2020-03-06 21:59:51', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (467, 14, 409, '羊肉', '/392/409', 0.000, 2, 2, '2020-03-06 22:00:42', '2020-03-06 22:00:42', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (468, 12, 421, '肉干', '/420/421', 0.000, 2, 2, '2020-03-06 22:01:38', '2020-03-06 22:01:38', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (469, 14, 421, '礼盒', '/420/421', 0.000, 2, 2, '2020-03-06 22:02:12', '2020-03-06 22:02:12', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (470, 12, 421, '核桃制品', '/420/421', 0.000, 2, 2, '2020-03-06 22:02:35', '2020-03-06 23:04:15', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (471, 14, 421, '板栗', '/420/421', 0.000, 2, 2, '2020-03-06 22:02:57', '2020-03-06 22:02:57', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (472, 12, 421, '魔芋挂面', '/420/421', 0.000, 2, 2, '2020-03-06 22:54:11', '2020-03-06 23:03:45', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (473, 12, 423, '槐花蜜', '/420/423', 0.000, 2, 2, '2020-03-06 23:05:07', '2020-03-06 23:05:07', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (474, 12, 423, '核桃制品', '/420/423', 0.000, 2, 2, '2020-03-06 23:05:34', '2020-03-06 23:05:34', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (475, 12, 423, '土蜂蜜', '/420/423', 0.000, 2, 2, '2020-03-06 23:06:05', '2020-03-06 23:06:05', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (476, 14, 422, '苹果', '/420/422', 0.000, 2, 2, '2020-03-06 23:06:34', '2020-03-06 23:06:34', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (477, 13, 422, '果醋', '/420/422', 0.000, 2, 2, '2020-03-06 23:06:51', '2020-03-06 23:06:51', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (478, 13, 422, '苹果汁', '/420/422', 0.000, 2, 2, '2020-03-06 23:07:16', '2020-03-06 23:07:16', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (479, 12, 422, '苹果脆片', '/420/422', 0.000, 2, 2, '2020-03-06 23:07:40', '2020-03-06 23:07:40', 10, 1, NULL);
INSERT INTO `product_cate` VALUES (480, 13, 422, '白水杜康', '/420/422', 0.000, 2, 2, '2020-03-06 23:08:01', '2020-03-06 23:08:01', 10, 1, NULL);

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '评价人ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价人账号',
  `grade` tinyint(4) NOT NULL COMMENT '评分(1到5)',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `seller_attitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价商家服务',
  `create_time` datetime(0) NOT NULL COMMENT '评价时间',
  `product_id` int(11) NOT NULL COMMENT '评价商品',
  `product_goods_id` int(11) NOT NULL COMMENT '货品ID',
  `seller_id` int(11) NOT NULL COMMENT '所属商家',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `orders_product_id` int(11) NOT NULL COMMENT '网单ID',
  `reply_id` int(11) NULL DEFAULT NULL COMMENT '回复人ID',
  `reply_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复人名称',
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '1、评价；2、审核通过，前台显示；3、删除',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '审核上架人',
  `description` tinyint(4) NOT NULL COMMENT '描述相符(1到5星)',
  `service_attitude` tinyint(4) NOT NULL COMMENT '服务态度(1到5星)',
  `product_speed` tinyint(4) NOT NULL COMMENT '发货速度(1到5星)',
  `logistics_speed` tinyint(4) NULL DEFAULT NULL COMMENT '物流态度（1到5星）',
  `express_attitude` tinyint(4) NULL DEFAULT NULL COMMENT '快递员态度(1到5星)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评论管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_comments
-- ----------------------------

-- ----------------------------
-- Table structure for product_goods
-- ----------------------------
DROP TABLE IF EXISTS `product_goods`;
CREATE TABLE `product_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `norm_attr_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格属性值ID，用逗号分隔',
  `norm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格值，用逗号分隔',
  `mall_pc_price` decimal(10, 2) NOT NULL COMMENT 'PC价格',
  `mall_mobile_price` decimal(10, 2) NOT NULL COMMENT 'Mobile价格',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_stock_warning` int(11) NOT NULL COMMENT '库存预警值',
  `actual_sales` int(11) NOT NULL COMMENT '所有规格销量相加等于商品总销量',
  `sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格图片（规格图片，用逗号隔开，和规格值对应，如果没有图片，那为空）',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1-启用 0-不启用',
  `weight` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '重量kg',
  `length` int(11) NULL DEFAULT 0 COMMENT '长度cm',
  `width` int(11) NULL DEFAULT 0 COMMENT '宽度cm',
  `height` int(11) NULL DEFAULT 0 COMMENT '高度cm',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_goods
-- ----------------------------
INSERT INTO `product_goods` VALUES (203, 86, '', '', 109.00, 108.00, 221, -1, 1, '111', '', 1, 0.000, 0, 0, 0);
INSERT INTO `product_goods` VALUES (204, 87, '', '', 35.00, 35.00, 90, -1, 0, '4607120230407', '', 1, 2.000, 0, 0, 0);
INSERT INTO `product_goods` VALUES (205, 88, '', '', 125.00, 125.00, 90, -1, 0, '8437016924952', '', 1, 1.500, 0, 0, 0);
INSERT INTO `product_goods` VALUES (206, 89, '', '', 142.00, 142.00, 90, -1, 0, 'jk20200307003', '', 1, 2.000, 0, 0, 0);

-- ----------------------------
-- Table structure for product_norm
-- ----------------------------
DROP TABLE IF EXISTS `product_norm`;
CREATE TABLE `product_norm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `type` tinyint(4) NOT NULL COMMENT '规格类型1、文字；2、图片',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `state` tinyint(4) NOT NULL COMMENT '状态 0：删除 1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_norm
-- ----------------------------
INSERT INTO `product_norm` VALUES (11, '重量', 5, 1, 2, '2020-03-03 16:59:36', 2, '2020-03-03 17:19:29', 1);
INSERT INTO `product_norm` VALUES (12, '容量', 10, 1, 2, '2020-03-03 17:18:51', 2, '2020-03-03 17:18:51', 1);

-- ----------------------------
-- Table structure for product_norm_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_norm_attr`;
CREATE TABLE `product_norm_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `product_norm_id` int(11) NOT NULL COMMENT '规格ID',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规格属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_norm_attr
-- ----------------------------
INSERT INTO `product_norm_attr` VALUES (59, '千克kg', 11, 5, 2, '2020-03-03 16:59:36', '');
INSERT INTO `product_norm_attr` VALUES (60, '克g', 11, 4, 2, '2020-03-03 16:59:36', '');
INSERT INTO `product_norm_attr` VALUES (61, '毫升(ml)', 12, 5, 2, '2020-03-03 17:18:51', '');
INSERT INTO `product_norm_attr` VALUES (62, '升(L)', 12, 5, 2, '2020-03-03 17:18:51', '');

-- ----------------------------
-- Table structure for product_norm_attr_opt
-- ----------------------------
DROP TABLE IF EXISTS `product_norm_attr_opt`;
CREATE TABLE `product_norm_attr_opt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_norm_id` int(11) NULL DEFAULT NULL COMMENT '规格ID',
  `product_norm_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `seller_id` int(11) NULL DEFAULT NULL COMMENT '商家ID',
  `type_attr` tinyint(4) NULL DEFAULT NULL COMMENT '1、商城属性 2、自定义属性',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '1、文字；2、图片',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `create_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `attr_id` int(11) NULL DEFAULT NULL COMMENT '属性id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品选定的颜色规格' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_norm_attr_opt
-- ----------------------------

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_id` int(11) NOT NULL COMMENT '上传人',
  `create_time` datetime(0) NOT NULL COMMENT '上传时间',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `state` tinyint(4) NOT NULL COMMENT '1、启用；2、不启用',
  `product_lead` tinyint(4) NOT NULL COMMENT '商品主图1、主图；2、非主图，主图只能有一张',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 582 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品对应图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (570, 86, '/images/seller/1/65814456-886c-4a55-9deb-ba2bd8033d56.png', 0, 1, '2020-03-06 15:19:19', 1, 1, 1);
INSERT INTO `product_picture` VALUES (571, 87, '/images/seller/1/a9b810a9-957e-4f6d-a6c8-0394bf5a0c6c.png', 0, 1, '2020-03-07 00:55:41', 1, 1, 1);
INSERT INTO `product_picture` VALUES (572, 87, '/images/seller/1/7e0ea9f5-7b21-4d1c-a3b8-43c9d4313302.jpg', 1, 1, '2020-03-07 00:55:41', 1, 1, 2);
INSERT INTO `product_picture` VALUES (573, 87, '/images/seller/1/38f7af9c-bd65-4dce-ae8c-1fc0cf41df4c.jpg', 2, 1, '2020-03-07 00:55:41', 1, 1, 2);
INSERT INTO `product_picture` VALUES (574, 87, '/images/seller/1/c2adf0b4-6a5d-4c38-92c6-cb223823eb5a.jpg', 3, 1, '2020-03-07 00:55:41', 1, 1, 2);
INSERT INTO `product_picture` VALUES (575, 87, '/images/seller/1/7c7e011a-67a3-49b3-bc86-609604fc2a35.jpg', 4, 1, '2020-03-07 00:55:41', 1, 1, 2);
INSERT INTO `product_picture` VALUES (576, 88, '/images/seller/1/408e7856-2de2-44a1-b05f-9fe62e4c3875.jpg', 0, 1, '2020-03-07 01:09:44', 1, 1, 1);
INSERT INTO `product_picture` VALUES (577, 88, '/images/seller/1/888157a4-8198-4703-9f22-9dd08665e944.jpg', 1, 1, '2020-03-07 01:09:44', 1, 1, 2);
INSERT INTO `product_picture` VALUES (578, 89, '/images/seller/1/a1bca75f-eb64-4475-a175-86a8b7a88cb6.jpg', 0, 1, '2020-03-07 01:17:19', 1, 1, 1);
INSERT INTO `product_picture` VALUES (579, 89, '/images/seller/1/fb6247a6-06d3-4292-a049-73a2742c4d22.png', 1, 1, '2020-03-07 01:17:19', 1, 1, 2);
INSERT INTO `product_picture` VALUES (580, 89, '/images/seller/1/8dcc20f9-eb20-458f-882e-340821b99722.jpg', 2, 1, '2020-03-07 01:17:19', 1, 1, 2);
INSERT INTO `product_picture` VALUES (581, 89, '/images/seller/1/809a030d-c325-4130-a63b-65c14e8c6a72.jpg', 3, 1, '2020-03-07 01:17:19', 1, 1, 2);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `product_norm_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联规格ID集合',
  `product_brand_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联品牌ID集合',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (12, '米面种类', 5, '', '50,52,58,60', 2, '2020-03-03 17:04:19');
INSERT INTO `product_type` VALUES (13, '油品种类', 3, '', '51,57,59', 2, '2020-03-05 21:56:29');
INSERT INTO `product_type` VALUES (14, '生鲜种类', 10, '', '53,54,63,64,65,66,67', 2, '2020-03-05 22:21:10');

-- ----------------------------
-- Table structure for product_type_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_type_attr`;
CREATE TABLE `product_type_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值，用逗号隔开',
  `product_type_id` int(11) NOT NULL COMMENT '属性分类id',
  `type` tinyint(4) NOT NULL COMMENT '1、检索属性；2、自定义属性',
  `create_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序0到255，越大越靠前展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_type_attr
-- ----------------------------
INSERT INTO `product_type_attr` VALUES (91, '小麦面粉', '高筋', 12, 1, 2, '2020-03-03 17:04:19', 0);
INSERT INTO `product_type_attr` VALUES (92, '米面种类', '', 12, 2, 2, '2020-03-03 17:04:19', 0);
INSERT INTO `product_type_attr` VALUES (93, '油品', '橄榄油', 13, 1, 2, '2020-03-05 21:56:29', 0);
INSERT INTO `product_type_attr` VALUES (94, '油品种类', '', 13, 2, 2, '2020-03-05 21:56:29', 0);
INSERT INTO `product_type_attr` VALUES (95, '大米', '特A级', 12, 1, 2, '2020-03-05 22:08:46', 0);
INSERT INTO `product_type_attr` VALUES (97, '重量', '', 14, 2, 2, '2020-03-05 22:21:10', 0);
INSERT INTO `product_type_attr` VALUES (99, '品种', '猫山王', 14, 1, 2, '2020-03-06 16:51:21', 0);
INSERT INTO `product_type_attr` VALUES (100, '产地', '中国', 14, 1, 2, '2020-03-06 16:51:21', 0);

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID，自关联',
  `regionName` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区名称',
  `parentPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父路径',
  `firstLetter` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '首字母',
  `regionType` tinyint(1) NOT NULL DEFAULT 2 COMMENT '类型：1省级，2市级，3区级',
  `agencyId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `shippingId` int(2) NOT NULL COMMENT '市场级别',
  `visible` tinyint(3) NOT NULL COMMENT '是否可见',
  `rowId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parentId`) USING BTREE,
  INDEX `region_type`(`regionType`) USING BTREE,
  INDEX `agency_id`(`agencyId`) USING BTREE,
  INDEX `region_name`(`regionName`) USING BTREE,
  INDEX `rowId`(`rowId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1381038 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES (2, 0, '北京', '/', 'B', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (3, 0, '天津', '/', 'T', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (4, 0, '河北', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (5, 0, '山西', '/', 'S', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (6, 0, '内蒙古', '/', 'N', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (7, 0, '辽宁', '/', 'L', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (8, 0, '吉林', '/', 'J', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (9, 0, '黑龙江', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (10, 0, '上海', '/', 'S', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (11, 0, '江苏', '/', 'J', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (12, 0, '浙江', '/', 'Z', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (13, 0, '安徽', '/', 'A', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (14, 0, '福建', '/', 'F', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (15, 0, '江西', '/', 'J', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (16, 0, '山东', '/', 'S', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (17, 0, '河南', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (18, 0, '湖北', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (19, 0, '湖南', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (20, 0, '广东', '/', 'G', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (21, 0, '广西', '/', 'G', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (22, 0, '海南', '/', 'H', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (23, 0, '重庆', '/', 'C', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (24, 0, '四川', '/', 'S', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (25, 0, '贵州', '/', 'G', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (26, 0, '云南', '/', 'Y', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (27, 0, '西藏', '/', 'X', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (28, 0, '陕西', '/', 'S', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (29, 0, '甘肃', '/', 'G', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (30, 0, '青海', '/', 'Q', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (31, 0, '宁夏', '/', 'N', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (32, 0, '新疆', '/', 'X', 1, 0, 0, 0, '');
INSERT INTO `regions` VALUES (37, 4, '石家庄', '/4/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (38, 4, '唐山', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (39, 4, '秦皇岛', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (40, 4, '邯郸', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (41, 4, '邢台', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (42, 4, '保定', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (43, 4, '张家口', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (44, 4, '承德', '/4/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (45, 4, '沧州', '/4/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (46, 4, '廊坊', '/4/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (47, 4, '衡水', '/4/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (48, 5, '太原', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (49, 5, '大同', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (50, 5, '阳泉', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (51, 5, '长治', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (52, 5, '晋城', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (53, 5, '朔州', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (54, 5, '晋中', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (55, 5, '运城', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (56, 5, '忻州', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (57, 5, '临汾', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (58, 5, '吕梁', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (59, 5, '侯马', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (60, 5, '五台山', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (61, 5, '离石', '/5/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (62, 6, '呼和浩特', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (63, 6, '包头', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (64, 6, '乌海', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (65, 6, '赤峰', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (66, 6, '通辽', '/6/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (67, 6, '鄂尔多斯', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (68, 6, '呼伦贝尔', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (69, 6, '巴彦淖尔', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (70, 6, '乌兰察布', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (71, 6, '兴安盟', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (72, 6, '锡林郭勒盟', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (73, 6, '阿拉善盟', '/6/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (74, 7, '沈阳', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (75, 7, '大连', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (76, 7, '鞍山', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (77, 7, '抚顺', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (78, 7, '本溪', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (79, 7, '丹东', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (80, 7, '锦州', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (81, 7, '营口', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (82, 7, '阜新', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (83, 7, '辽阳', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (84, 7, '盘锦', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (85, 7, '铁岭', '/7/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (86, 7, '朝阳', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (87, 7, '葫芦岛', '/7/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (88, 8, '长春', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (89, 8, '吉林', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (90, 8, '四平', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (91, 8, '辽源', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (92, 8, '通化', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (93, 8, '白山', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (94, 8, '松原', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (95, 8, '白城', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (96, 8, '延边', '/8/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (97, 9, '哈尔滨', '/9/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (98, 9, '齐齐哈尔', '/9/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (99, 9, '鸡西', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (100, 9, '鹤岗', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (101, 9, '双鸭山', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (102, 9, '大庆', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (104, 9, '佳木斯', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (105, 9, '七台河', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (106, 9, '牡丹江', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (107, 9, '黑河', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (108, 9, '绥化', '/9/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (109, 9, '大兴安岭', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (111, 11, '南京', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (112, 11, '无锡', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (113, 11, '徐州', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (114, 11, '常州', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (115, 11, '苏州', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (116, 11, '南通', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (117, 11, '连云港', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (118, 11, '淮安', '/11/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (119, 11, '盐城', '/11/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (120, 11, '扬州', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (121, 11, '镇江', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (122, 11, '泰州', '/11/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (123, 11, '宿迁', '/11/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (124, 12, '杭州', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (125, 12, '宁波', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (126, 12, '温州', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (127, 12, '嘉兴', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (128, 12, '湖州', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (129, 12, '绍兴', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (130, 12, '金华', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (131, 12, '衢州', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (132, 12, '舟山', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (133, 12, '台州', '/12/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (134, 12, '丽水', '/12/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (135, 13, '合肥', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (136, 13, '芜湖', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (137, 13, '蚌埠', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (138, 13, '淮南', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (139, 13, '马鞍山', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (140, 13, '淮北', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (141, 13, '铜陵', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (142, 13, '安庆', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (143, 13, '黄山', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (144, 13, '滁州', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (145, 13, '阜阳', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (146, 13, '宿州', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (147, 13, '巢湖', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (148, 13, '六安', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (149, 13, '亳州', '/13/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (150, 13, '池州', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (151, 13, '宣城', '/13/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (152, 14, '福州', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (153, 14, '厦门', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (154, 14, '莆田', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (155, 14, '三明', '/14/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (156, 14, '泉州', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (157, 14, '漳州', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (158, 14, '南平', '/14/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (159, 14, '龙岩', '/14/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (160, 14, '宁德', '/14/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (161, 15, '南昌', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (162, 15, '景德镇', '/15/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (163, 15, '萍乡', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (164, 15, '九江', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (165, 15, '新余', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (166, 15, '鹰潭', '/15/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (167, 15, '赣州', '/15/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (168, 15, '吉安', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (169, 15, '宜春', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (170, 15, '抚州', '/15/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (171, 15, '上饶', '/15/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (172, 16, '济南', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (173, 16, '青岛', '/16/', '', 2, 1, 0, 1, '');
INSERT INTO `regions` VALUES (174, 16, '淄博', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (175, 16, '枣庄', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (176, 16, '东营', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (177, 16, '烟台', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (178, 16, '潍坊', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (179, 16, '济宁', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (180, 16, '泰安', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (181, 16, '威海', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (182, 16, '日照', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (183, 16, '莱芜', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (184, 16, '临沂', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (185, 16, '德州', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (186, 16, '聊城', '/16/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (187, 16, '滨州', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (188, 16, '菏泽', '/16/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (189, 17, '郑州', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (190, 17, '开封', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (191, 17, '洛阳', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (192, 17, '平顶山', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (193, 17, '焦作', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (194, 17, '鹤壁', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (195, 17, '新乡', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (196, 17, '安阳', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (197, 17, '濮阳', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (198, 17, '许昌', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (199, 17, '漯河', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (200, 17, '三门峡', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (201, 17, '南阳', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (202, 17, '商丘', '/17/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (203, 17, '信阳', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (204, 17, '周口', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (205, 17, '驻马店', '/17/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (206, 18, '武汉', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (207, 18, '黄石', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (208, 18, '襄樊', '/18/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (209, 18, '十堰', '/18/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (210, 18, '荆州', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (211, 18, '宜昌', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (212, 18, '荆门', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (213, 18, '鄂州', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (214, 18, '孝感', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (215, 18, '黄冈', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (216, 18, '咸宁', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (217, 18, '随州', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (218, 18, '恩施', '/18/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (219, 19, '长沙', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (220, 19, '株洲', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (221, 19, '湘潭', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (222, 19, '衡阳', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (223, 19, '邵阳', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (224, 19, '岳阳', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (225, 19, '常德', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (226, 19, '张家界', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (227, 19, '益阳', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (228, 19, '郴州', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (229, 19, '永州', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (230, 19, '怀化', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (231, 19, '娄底', '/19/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (232, 19, '湘西', '/19/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (233, 20, '广州', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (234, 20, '深圳', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (235, 20, '珠海', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (236, 20, '汕头', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (237, 20, '韶关', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (238, 20, '佛山', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (239, 20, '江门', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (240, 20, '湛江', '/20/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (241, 20, '茂名', '/20/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (242, 20, '肇庆', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (243, 20, '惠州', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (244, 20, '梅州', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (245, 20, '汕尾', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (246, 20, '河源', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (247, 20, '阳江', '/20/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (248, 20, '清远', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (249, 20, '东莞', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (250, 20, '中山', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (251, 20, '潮州', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (252, 20, '揭阳', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (253, 20, '云浮', '/20/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (254, 21, '南宁', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (255, 21, '柳州', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (256, 21, '桂林', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (257, 21, '梧州', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (258, 21, '北海', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (259, 21, '防城港', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (260, 21, '钦州', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (261, 21, '贵港', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (262, 21, '玉林', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (263, 21, '百色', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (264, 21, '贺州', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (265, 21, '河池', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (266, 21, '来宾', '/21/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (267, 21, '崇左', '/21/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (268, 22, '海口', '/22/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (269, 22, '三亚', '/22/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (271, 23, '重庆', '/23/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (272, 24, '成都', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (273, 24, '自贡', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (274, 24, '攀枝花', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (275, 24, '泸州', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (276, 24, '德阳', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (277, 24, '绵阳', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (278, 24, '广元', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (279, 24, '遂宁', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (280, 24, '内江', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (281, 24, '乐山', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (282, 24, '南充', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (283, 24, '宜宾', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (284, 24, '广安', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (285, 24, '达州', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (286, 24, '眉山', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (287, 24, '雅安', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (288, 24, '巴中', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (289, 24, '资阳', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (290, 24, '阿坝', '/24/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (291, 24, '甘孜', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (292, 24, '凉山', '/24/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (293, 25, '贵阳', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (294, 25, '六盘水', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (295, 25, '遵义', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (296, 25, '安顺', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (297, 25, '铜仁', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (298, 25, '毕节', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (299, 25, '黔西南', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (300, 25, '黔东南', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (301, 25, '黔南', '/25/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (302, 26, '昆明', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (303, 26, '曲靖', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (304, 26, '玉溪', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (305, 26, '保山', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (306, 26, '昭通', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (307, 26, '丽江', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (308, 26, '普洱', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (309, 26, '临沧', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (310, 26, '文山', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (311, 26, '红河', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (312, 26, '西双版纳', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (313, 26, '楚雄', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (314, 26, '大理', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (315, 26, '德宏', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (316, 26, '怒江', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (317, 26, '迪庆', '/26/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (318, 27, '拉萨', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (319, 27, '昌都', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (320, 27, '山南', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (321, 27, '日喀则', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (322, 27, '那曲', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (323, 27, '阿里', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (324, 27, '林芝', '/27/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (325, 28, '西安', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (326, 28, '铜川', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (327, 28, '宝鸡', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (328, 28, '咸阳', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (329, 28, '渭南', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (330, 28, '延安', '/28/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (331, 28, '汉中', '/28/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (332, 28, '榆林', '/28/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (333, 28, '安康', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (334, 28, '商洛', '/28/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (335, 29, '兰州', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (336, 29, '嘉峪关', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (337, 29, '金昌', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (338, 29, '白银', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (339, 29, '天水', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (340, 29, '武威', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (341, 29, '张掖', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (342, 29, '平凉', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (343, 29, '酒泉', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (344, 29, '庆阳', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (345, 29, '定西', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (346, 29, '陇南', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (347, 29, '临夏', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (348, 29, '甘南', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (349, 30, '西宁', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (350, 30, '海东', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (351, 30, '海北', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (352, 30, '黄南', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (353, 30, '海南', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (354, 30, '果洛', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (355, 30, '玉树', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (356, 30, '海西', '/30/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (357, 31, '银川', '/31/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (358, 31, '石嘴山', '/31/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (359, 31, '吴忠', '/31/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (360, 31, '固原', '/31/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (361, 31, '中卫', '/31/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (362, 32, '乌鲁木齐', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (363, 32, '克拉玛依', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (365, 32, '哈密', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (366, 32, '和田', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (367, 32, '阿克苏地区', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (368, 32, '喀什', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (369, 32, '克孜勒苏', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (370, 32, '巴音郭楞', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (371, 32, '昌吉', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (372, 32, '博尔塔拉', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (373, 32, '伊犁', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (374, 32, '塔城', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (375, 32, '阿勒泰', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (428, 18, '潜江', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (429, 32, '石河子', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (432, 29, '玉门', '/29/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (433, 20, '怀集', '/20/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (458, 135, '瑶海区', '/13/135/', '', 3, 0, 1, 0, '20030916000744');
INSERT INTO `regions` VALUES (459, 135, '蜀山区', '/13/135/', '', 3, 0, 1, 0, '20030916000745');
INSERT INTO `regions` VALUES (460, 135, '包河区', '/13/135/', '', 3, 0, 1, 0, '20030916000746');
INSERT INTO `regions` VALUES (462, 135, '肥东县', '/13/135/', '', 3, 0, 3, 0, '20030916000748');
INSERT INTO `regions` VALUES (463, 135, '肥西县', '/13/135/', '', 3, 0, 3, 0, '20030916000749');
INSERT INTO `regions` VALUES (464, 140, '相山区', '/13/140/', '', 3, 0, 2, 0, '20030916000755');
INSERT INTO `regions` VALUES (465, 140, '杜集区', '/13/140/', '', 3, 0, 2, 0, '20030916000756');
INSERT INTO `regions` VALUES (466, 140, '烈山区', '/13/140/', '', 3, 0, 2, 0, '20030916000757');
INSERT INTO `regions` VALUES (467, 140, '濉溪县', '/13/140/', '', 3, 0, 3, 0, '20030916000758');
INSERT INTO `regions` VALUES (470, 146, '埇桥区', '/13/146/', '', 3, 0, 2, 0, '20030916000750');
INSERT INTO `regions` VALUES (471, 146, '砀山县', '/13/146/', '', 3, 0, 3, 0, '20030916000751');
INSERT INTO `regions` VALUES (472, 146, '萧县', '/13/146/', '', 3, 0, 3, 0, '20030916000752');
INSERT INTO `regions` VALUES (473, 146, '灵璧县', '/13/146/', '', 3, 0, 3, 0, '20030916000753');
INSERT INTO `regions` VALUES (474, 146, '泗县', '/13/146/', '', 3, 0, 3, 0, '20030916000754');
INSERT INTO `regions` VALUES (475, 149, '谯城区', '/13/149/', '', 3, 0, 2, 0, '20030916000767');
INSERT INTO `regions` VALUES (476, 149, '涡阳县', '/13/149/', '', 3, 0, 3, 0, '20030916000768');
INSERT INTO `regions` VALUES (477, 149, '蒙城县', '/13/149/', '', 3, 0, 3, 0, '20030916000769');
INSERT INTO `regions` VALUES (478, 149, '利辛县', '/13/149/', '', 3, 0, 3, 0, '20030916000770');
INSERT INTO `regions` VALUES (484, 137, '蚌山区', '/13/137/', '', 3, 0, 2, 0, '20030916000771');
INSERT INTO `regions` VALUES (485, 137, '龙子湖区', '/13/137/', '', 3, 0, 2, 0, '20030916000772');
INSERT INTO `regions` VALUES (486, 137, '禹会区', '/13/137/', '', 3, 0, 2, 0, '20030916000773');
INSERT INTO `regions` VALUES (487, 137, '淮上区', '/13/137/', '', 3, 0, 2, 0, '20030916000774');
INSERT INTO `regions` VALUES (488, 137, '怀远县', '/13/137/', '', 3, 0, 3, 0, '20030916000775');
INSERT INTO `regions` VALUES (489, 137, '五河县', '/13/137/', '', 3, 0, 3, 0, '20030916000776');
INSERT INTO `regions` VALUES (490, 137, '固镇县', '/13/137/', '', 3, 0, 3, 0, '20030916000777');
INSERT INTO `regions` VALUES (491, 144, '琅琊区', '/13/144/', '', 3, 0, 2, 0, '20030916000784');
INSERT INTO `regions` VALUES (492, 144, '南谯区', '/13/144/', '', 3, 0, 2, 0, '20030916000785');
INSERT INTO `regions` VALUES (493, 144, '明光市', '/13/144/', '', 3, 0, 2, 0, '20030916000786');
INSERT INTO `regions` VALUES (494, 144, '天长市', '/13/144/', '', 3, 0, 2, 0, '20030916000787');
INSERT INTO `regions` VALUES (495, 144, '来安县', '/13/144/', '', 3, 0, 3, 0, '20030916000788');
INSERT INTO `regions` VALUES (496, 144, '全椒县', '/13/144/', '', 3, 0, 3, 0, '20030916000789');
INSERT INTO `regions` VALUES (497, 144, '定远县', '/13/144/', '', 3, 0, 3, 0, '20030916000790');
INSERT INTO `regions` VALUES (498, 144, '凤阳县', '/13/144/', '', 3, 0, 3, 0, '20030916000791');
INSERT INTO `regions` VALUES (499, 138, '田家庵区', '/13/138/', '', 3, 0, 2, 0, '20030916000778');
INSERT INTO `regions` VALUES (500, 138, '大通区', '/13/138/', '', 3, 0, 2, 0, '20030916000779');
INSERT INTO `regions` VALUES (501, 138, '谢家集区', '/13/138/', '', 3, 0, 2, 0, '20030916000780');
INSERT INTO `regions` VALUES (502, 138, '八公山区', '/13/138/', '', 3, 0, 2, 0, '20030916000781');
INSERT INTO `regions` VALUES (503, 138, '潘集区', '/13/138/', '', 3, 0, 2, 0, '20030916000782');
INSERT INTO `regions` VALUES (504, 138, '凤台县', '/13/138/', '', 3, 0, 3, 0, '20030916000783');
INSERT INTO `regions` VALUES (505, 139, '雨山区', '/13/139/', '', 3, 0, 2, 0, '20030916000792');
INSERT INTO `regions` VALUES (506, 139, '花山区', '/13/139/', '', 3, 0, 2, 0, '20030916000793');
INSERT INTO `regions` VALUES (507, 139, '金家庄区', '/13/139/', '', 3, 0, 2, 0, '20030916000794');
INSERT INTO `regions` VALUES (508, 139, '当涂县', '/13/139/', '', 3, 0, 3, 0, '20030916000795');
INSERT INTO `regions` VALUES (509, 136, '镜湖区', '/13/136/', '', 3, 0, 2, 0, '20030916000796');
INSERT INTO `regions` VALUES (510, 136, '弋江区', '/13/136/', '', 3, 0, 2, 0, '20030916000797');
INSERT INTO `regions` VALUES (511, 136, '三山区', '/13/136/', '', 3, 0, 2, 0, '3000000158683942');
INSERT INTO `regions` VALUES (512, 136, '鸠江区', '/13/136/', '', 3, 0, 2, 0, '20030916000799');
INSERT INTO `regions` VALUES (513, 136, '芜湖县', '/13/136/', '', 3, 0, 3, 0, '20030916000800');
INSERT INTO `regions` VALUES (514, 136, '繁昌县', '/13/136/', '', 3, 0, 3, 0, '20030916000801');
INSERT INTO `regions` VALUES (515, 136, '南陵县', '/13/136/', '', 3, 0, 3, 0, '20030916000802');
INSERT INTO `regions` VALUES (517, 141, '铜官山区', '/13/141/', '', 3, 0, 2, 0, '20030916000803');
INSERT INTO `regions` VALUES (518, 141, '狮子山区', '/13/141/', '', 3, 0, 2, 0, '20030916000804');
INSERT INTO `regions` VALUES (519, 141, '郊区', '/13/141/', '', 3, 0, 2, 0, '20030916000805');
INSERT INTO `regions` VALUES (520, 141, '铜陵县', '/13/141/', '', 3, 0, 3, 0, '20030916000806');
INSERT INTO `regions` VALUES (521, 142, '迎江区', '/13/142/', '', 3, 0, 2, 0, '20030916000807');
INSERT INTO `regions` VALUES (522, 142, '大观区', '/13/142/', '', 3, 0, 2, 0, '20030916000808');
INSERT INTO `regions` VALUES (523, 142, '宜秀区', '/13/142/', '', 3, 0, 2, 0, '20030916000809');
INSERT INTO `regions` VALUES (524, 142, '桐城市', '/13/142/', '', 3, 0, 2, 0, '20030916000810');
INSERT INTO `regions` VALUES (525, 142, '怀宁县', '/13/142/', '', 3, 0, 3, 0, '20030916000811');
INSERT INTO `regions` VALUES (526, 142, '枞阳县', '/13/142/', '', 3, 0, 3, 0, '20030916000812');
INSERT INTO `regions` VALUES (527, 142, '潜山县', '/13/142/', '', 3, 0, 3, 0, '20030916000813');
INSERT INTO `regions` VALUES (528, 142, '太湖县', '/13/142/', '', 3, 0, 3, 0, '20030916000814');
INSERT INTO `regions` VALUES (529, 142, '宿松县', '/13/142/', '', 3, 0, 3, 0, '20030916000815');
INSERT INTO `regions` VALUES (530, 142, '望江县', '/13/142/', '', 3, 0, 3, 0, '20030916000816');
INSERT INTO `regions` VALUES (531, 142, '岳西县', '/13/142/', '', 3, 0, 3, 0, '20030916000817');
INSERT INTO `regions` VALUES (532, 143, '屯溪区', '/13/143/', '', 3, 0, 2, 0, '20030916000818');
INSERT INTO `regions` VALUES (533, 143, '黄山区', '/13/143/', '', 3, 0, 2, 0, '20030916000819');
INSERT INTO `regions` VALUES (534, 143, '徽州区', '/13/143/', '', 3, 0, 2, 0, '20030916000820');
INSERT INTO `regions` VALUES (535, 143, '歙县', '/13/143/', '', 3, 0, 3, 0, '20030916000821');
INSERT INTO `regions` VALUES (536, 143, '休宁县', '/13/143/', '', 3, 0, 3, 0, '20030916000822');
INSERT INTO `regions` VALUES (537, 143, '黟县', '/13/143/', '', 3, 0, 3, 0, '20030916000823');
INSERT INTO `regions` VALUES (538, 143, '祁门县', '/13/143/', '', 3, 0, 3, 0, '20030916000824');
INSERT INTO `regions` VALUES (539, 145, '颍州区', '/13/145/', '', 3, 0, 2, 0, '20030916000759');
INSERT INTO `regions` VALUES (540, 145, '颍东区', '/13/145/', '', 3, 0, 2, 0, '20030916000760');
INSERT INTO `regions` VALUES (541, 145, '颍泉区', '/13/145/', '', 3, 0, 2, 0, '20030916000761');
INSERT INTO `regions` VALUES (542, 145, '界首市', '/13/145/', '', 3, 0, 2, 0, '20030916000762');
INSERT INTO `regions` VALUES (543, 145, '临泉县', '/13/145/', '', 3, 0, 3, 0, '20030916000763');
INSERT INTO `regions` VALUES (544, 145, '太和县', '/13/145/', '', 3, 0, 3, 0, '20030916000764');
INSERT INTO `regions` VALUES (545, 145, '阜南县', '/13/145/', '', 3, 0, 3, 0, '20030916000765');
INSERT INTO `regions` VALUES (546, 145, '颍上县', '/13/145/', '', 3, 0, 3, 0, '20030916000766');
INSERT INTO `regions` VALUES (547, 148, '金安区', '/13/148/', '', 3, 0, 2, 0, '20030916000825');
INSERT INTO `regions` VALUES (548, 148, '裕安区', '/13/148/', '', 3, 0, 2, 0, '20030916000826');
INSERT INTO `regions` VALUES (549, 148, '寿县', '/13/148/', '', 3, 0, 3, 0, '20030916000827');
INSERT INTO `regions` VALUES (550, 148, '霍邱县', '/13/148/', '', 3, 0, 3, 0, '20030916000828');
INSERT INTO `regions` VALUES (551, 148, '舒城县', '/13/148/', '', 3, 0, 3, 0, '20030916000829');
INSERT INTO `regions` VALUES (552, 148, '金寨县', '/13/148/', '', 3, 0, 3, 0, '20030916000830');
INSERT INTO `regions` VALUES (553, 148, '霍山县', '/13/148/', '', 3, 0, 3, 0, '20030916000831');
INSERT INTO `regions` VALUES (554, 147, '居巢区', '/13/147/', '', 3, 0, 2, 0, '20030916000832');
INSERT INTO `regions` VALUES (555, 147, '庐江县', '/13/147/', '', 3, 0, 3, 0, '20030916000833');
INSERT INTO `regions` VALUES (556, 147, '无为县', '/13/147/', '', 3, 0, 3, 0, '20030916000834');
INSERT INTO `regions` VALUES (557, 147, '含山县', '/13/147/', '', 3, 0, 3, 0, '20030916000835');
INSERT INTO `regions` VALUES (558, 147, '和县', '/13/147/', '', 3, 0, 3, 0, '20030916000836');
INSERT INTO `regions` VALUES (559, 150, '贵池区', '/13/150/', '', 3, 0, 2, 0, '20030916000837');
INSERT INTO `regions` VALUES (560, 150, '东至县', '/13/150/', '', 3, 0, 3, 0, '20030916000838');
INSERT INTO `regions` VALUES (561, 150, '石台县', '/13/150/', '', 3, 0, 3, 0, '20030916000839');
INSERT INTO `regions` VALUES (562, 150, '青阳县', '/13/150/', '', 3, 0, 3, 0, '20030916000840');
INSERT INTO `regions` VALUES (563, 151, '宣州区', '/13/151/', '', 3, 0, 2, 0, '20030916000841');
INSERT INTO `regions` VALUES (564, 151, '宁国市', '/13/151/', '', 3, 0, 2, 0, '20030916000842');
INSERT INTO `regions` VALUES (565, 151, '郎溪县', '/13/151/', '', 3, 0, 3, 0, '20030916000843');
INSERT INTO `regions` VALUES (566, 151, '广德县', '/13/151/', '', 3, 0, 3, 0, '20030916000844');
INSERT INTO `regions` VALUES (567, 151, '泾县', '/13/151/', '', 3, 0, 3, 0, '20030916000845');
INSERT INTO `regions` VALUES (568, 151, '旌德县', '/13/151/', '', 3, 0, 3, 0, '20030916000846');
INSERT INTO `regions` VALUES (569, 151, '绩溪县', '/13/151/', '', 3, 0, 3, 0, '20030916000847');
INSERT INTO `regions` VALUES (570, 135, '庐阳区', '/13/135/', '', 3, 0, 1, 0, '20030916000743');
INSERT INTO `regions` VALUES (626, 124, '拱墅区', '/12/124/', '', 3, 0, 1, 0, '20030916000888');
INSERT INTO `regions` VALUES (627, 124, '上城区', '/12/124/', '', 3, 0, 1, 0, '20030916000889');
INSERT INTO `regions` VALUES (628, 124, '下城区', '/12/124/', '', 3, 0, 1, 0, '20030916000890');
INSERT INTO `regions` VALUES (629, 124, '江干区', '/12/124/', '', 3, 0, 1, 0, '20030916000891');
INSERT INTO `regions` VALUES (630, 124, '西湖区', '/12/124/', '', 3, 0, 1, 0, '20030916000892');
INSERT INTO `regions` VALUES (631, 124, '滨江区', '/12/124/', '', 3, 0, 1, 0, '20030916000893');
INSERT INTO `regions` VALUES (632, 124, '余杭区', '/12/124/', '', 3, 0, 1, 0, '20030916000894');
INSERT INTO `regions` VALUES (633, 124, '萧山区', '/12/124/', '', 3, 0, 1, 0, '20030916000895');
INSERT INTO `regions` VALUES (634, 124, '临安市', '/12/124/', '', 3, 0, 2, 0, '20030916000896');
INSERT INTO `regions` VALUES (635, 124, '富阳市', '/12/124/', '', 3, 0, 2, 0, '20030916000897');
INSERT INTO `regions` VALUES (636, 124, '桐庐县', '/12/124/', '', 3, 0, 2, 0, '20030916000899');
INSERT INTO `regions` VALUES (637, 124, '淳安县', '/12/124/', '', 3, 0, 3, 0, '20030916000900');
INSERT INTO `regions` VALUES (638, 124, '建德市', '/12/124/', '', 3, 0, 2, 0, '20030916000898');
INSERT INTO `regions` VALUES (639, 128, '吴兴区', '/12/128/', '', 3, 0, 2, 0, '20030916000901');
INSERT INTO `regions` VALUES (640, 128, '南浔区', '/12/128/', '', 3, 0, 3, 0, '20030916000902');
INSERT INTO `regions` VALUES (641, 128, '长兴县', '/12/128/', '', 3, 0, 3, 0, '20030916000903');
INSERT INTO `regions` VALUES (642, 128, '德清县', '/12/128/', '', 3, 0, 3, 0, '20030916000904');
INSERT INTO `regions` VALUES (643, 128, '安吉县', '/12/128/', '', 3, 0, 3, 0, '20030916000905');
INSERT INTO `regions` VALUES (645, 127, '秀洲区', '/12/127/', '', 3, 0, 2, 0, '20030916000907');
INSERT INTO `regions` VALUES (646, 127, '平湖市', '/12/127/', '', 3, 0, 2, 0, '20030916000908');
INSERT INTO `regions` VALUES (647, 127, '海宁市', '/12/127/', '', 3, 0, 2, 0, '20030916000909');
INSERT INTO `regions` VALUES (648, 127, '桐乡市', '/12/127/', '', 3, 0, 2, 0, '20030916000910');
INSERT INTO `regions` VALUES (649, 127, '嘉善县', '/12/127/', '', 3, 0, 3, 0, '20030916000911');
INSERT INTO `regions` VALUES (650, 127, '海盐县', '/12/127/', '', 3, 0, 3, 0, '20030916000912');
INSERT INTO `regions` VALUES (651, 132, '定海区', '/12/132/', '', 3, 0, 2, 0, '20030916001331');
INSERT INTO `regions` VALUES (652, 132, '普陀区', '/12/132/', '', 3, 0, 2, 0, '20030916001332');
INSERT INTO `regions` VALUES (653, 132, '岱山县', '/12/132/', '', 3, 0, 3, 0, '20030916001333');
INSERT INTO `regions` VALUES (654, 132, '嵊泗县', '/12/132/', '', 3, 0, 3, 0, '20030916001334');
INSERT INTO `regions` VALUES (655, 125, '海曙区', '/12/125/', '', 3, 0, 1, 0, '20030916001294');
INSERT INTO `regions` VALUES (656, 125, '江东区', '/12/125/', '', 3, 0, 1, 0, '20030916001295');
INSERT INTO `regions` VALUES (657, 125, '江北区', '/12/125/', '', 3, 0, 1, 0, '20030916001296');
INSERT INTO `regions` VALUES (658, 125, '北仑区', '/12/125/', '', 3, 0, 1, 0, '20030916001297');
INSERT INTO `regions` VALUES (659, 125, '镇海区', '/12/125/', '', 3, 0, 1, 0, '20030916001298');
INSERT INTO `regions` VALUES (660, 125, '鄞州区', '/12/125/', '', 3, 0, 1, 0, '20030916001299');
INSERT INTO `regions` VALUES (661, 125, '慈溪市', '/12/125/', '', 3, 0, 2, 0, '20030916001300');
INSERT INTO `regions` VALUES (662, 125, '余姚市', '/12/125/', '', 3, 0, 2, 0, '20030916001301');
INSERT INTO `regions` VALUES (663, 125, '奉化市', '/12/125/', '', 3, 0, 2, 0, '20030916001302');
INSERT INTO `regions` VALUES (664, 125, '宁海县', '/12/125/', '', 3, 0, 2, 0, '20030916001303');
INSERT INTO `regions` VALUES (665, 125, '象山县', '/12/125/', '', 3, 0, 2, 0, '20030916001304');
INSERT INTO `regions` VALUES (666, 129, '越城区', '/12/129/', '', 3, 0, 2, 0, '20030916001305');
INSERT INTO `regions` VALUES (667, 129, '诸暨市', '/12/129/', '', 3, 0, 2, 0, '20030916001306');
INSERT INTO `regions` VALUES (668, 129, '上虞市', '/12/129/', '', 3, 0, 2, 0, '20030916001307');
INSERT INTO `regions` VALUES (669, 129, '嵊州市', '/12/129/', '', 3, 0, 2, 0, '20030916001308');
INSERT INTO `regions` VALUES (670, 129, '绍兴县', '/12/129/', '', 3, 0, 2, 0, '20030916001309');
INSERT INTO `regions` VALUES (671, 129, '新昌县', '/12/129/', '', 3, 0, 2, 0, '20030916001310');
INSERT INTO `regions` VALUES (672, 131, '柯城区', '/12/131/', '', 3, 0, 2, 0, '20030916000913');
INSERT INTO `regions` VALUES (673, 131, '衢江区', '/12/131/', '', 3, 0, 2, 0, '20030916000914');
INSERT INTO `regions` VALUES (674, 131, '江山市', '/12/131/', '', 3, 0, 2, 0, '20030916000915');
INSERT INTO `regions` VALUES (675, 131, '常山县', '/12/131/', '', 3, 0, 3, 0, '20030916000916');
INSERT INTO `regions` VALUES (676, 131, '开化县', '/12/131/', '', 3, 0, 3, 0, '20030916000917');
INSERT INTO `regions` VALUES (677, 131, '龙游县', '/12/131/', '', 3, 0, 2, 0, '20030916000918');
INSERT INTO `regions` VALUES (678, 130, '婺城区', '/12/130/', '', 3, 0, 2, 0, '20030916000919');
INSERT INTO `regions` VALUES (679, 130, '金东区', '/12/130/', '', 3, 0, 2, 0, '20030916000920');
INSERT INTO `regions` VALUES (680, 130, '兰溪市', '/12/130/', '', 3, 0, 2, 0, '20030916000921');
INSERT INTO `regions` VALUES (681, 130, '永康市', '/12/130/', '', 3, 0, 2, 0, '20030916000922');
INSERT INTO `regions` VALUES (682, 130, '义乌市', '/12/130/', '', 3, 0, 2, 0, '20030916000923');
INSERT INTO `regions` VALUES (683, 130, '东阳市', '/12/130/', '', 3, 0, 2, 0, '20030916000924');
INSERT INTO `regions` VALUES (684, 130, '武义县', '/12/130/', '', 3, 0, 2, 0, '20030916000925');
INSERT INTO `regions` VALUES (685, 130, '浦江县', '/12/130/', '', 3, 0, 2, 0, '20030916000926');
INSERT INTO `regions` VALUES (686, 130, '磐安县', '/12/130/', '', 3, 0, 3, 0, '20030916000927');
INSERT INTO `regions` VALUES (687, 133, '椒江区', '/12/133/', '', 3, 0, 2, 0, '20030916001311');
INSERT INTO `regions` VALUES (688, 133, '黄岩区', '/12/133/', '', 3, 0, 2, 0, '20030916001312');
INSERT INTO `regions` VALUES (689, 133, '路桥区', '/12/133/', '', 3, 0, 2, 0, '20030916001313');
INSERT INTO `regions` VALUES (690, 133, '临海市', '/12/133/', '', 3, 0, 2, 0, '20030916001314');
INSERT INTO `regions` VALUES (691, 133, '温岭市', '/12/133/', '', 3, 0, 2, 0, '20030916001315');
INSERT INTO `regions` VALUES (692, 133, '三门县', '/12/133/', '', 3, 0, 3, 0, '20030916001316');
INSERT INTO `regions` VALUES (693, 133, '天台县', '/12/133/', '', 3, 0, 2, 0, '20030916001317');
INSERT INTO `regions` VALUES (694, 133, '仙居县', '/12/133/', '', 3, 0, 2, 0, '20030916001318');
INSERT INTO `regions` VALUES (695, 133, '玉环县', '/12/133/', '', 3, 0, 3, 0, '20030916001319');
INSERT INTO `regions` VALUES (696, 126, '鹿城区', '/12/126/', '', 3, 0, 2, 0, '20030916001320');
INSERT INTO `regions` VALUES (697, 126, '龙湾区', '/12/126/', '', 3, 0, 2, 0, '20030916001321');
INSERT INTO `regions` VALUES (698, 126, '瓯海区', '/12/126/', '', 3, 0, 2, 0, '20030916001322');
INSERT INTO `regions` VALUES (699, 126, '瑞安市', '/12/126/', '', 3, 0, 2, 0, '20030916001323');
INSERT INTO `regions` VALUES (700, 126, '乐清市', '/12/126/', '', 3, 0, 3, 0, '20030916001324');
INSERT INTO `regions` VALUES (701, 126, '永嘉县', '/12/126/', '', 3, 0, 3, 0, '20030916001325');
INSERT INTO `regions` VALUES (702, 126, '文成县', '/12/126/', '', 3, 0, 3, 0, '20030916001326');
INSERT INTO `regions` VALUES (703, 126, '平阳县', '/12/126/', '', 3, 0, 3, 0, '20030916001327');
INSERT INTO `regions` VALUES (704, 126, '泰顺县', '/12/126/', '', 3, 0, 3, 0, '20030916001328');
INSERT INTO `regions` VALUES (705, 126, '洞头县', '/12/126/', '', 3, 0, 3, 0, '20030916001329');
INSERT INTO `regions` VALUES (706, 126, '苍南县', '/12/126/', '', 3, 0, 3, 0, '20030916001330');
INSERT INTO `regions` VALUES (707, 134, '莲都区', '/12/134/', '', 3, 0, 2, 0, '20030916001335');
INSERT INTO `regions` VALUES (708, 134, '龙泉市', '/12/134/', '', 3, 0, 2, 0, '20030916001336');
INSERT INTO `regions` VALUES (709, 134, '缙云县', '/12/134/', '', 3, 0, 3, 0, '20030916001337');
INSERT INTO `regions` VALUES (710, 134, '青田县', '/12/134/', '', 3, 0, 3, 0, '20030916001338');
INSERT INTO `regions` VALUES (711, 134, '云和县', '/12/134/', '', 3, 0, 3, 0, '20030916001339');
INSERT INTO `regions` VALUES (712, 134, '遂昌县', '/12/134/', '', 3, 0, 3, 0, '20030916001340');
INSERT INTO `regions` VALUES (713, 134, '松阳县', '/12/134/', '', 3, 0, 3, 0, '20030916001341');
INSERT INTO `regions` VALUES (714, 134, '庆元县', '/12/134/', '', 3, 0, 3, 0, '20030916001342');
INSERT INTO `regions` VALUES (715, 134, '景宁畲族自治县', '/12/134/', '', 3, 0, 3, 0, '20030916001343');
INSERT INTO `regions` VALUES (716, 2, '北京', '/2/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (717, 3, '天津', '/3/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (718, 10, '上海', '/10/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (738, 18, '神农架林区', '/18/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (739, 18, '天门', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (740, 32, '吐鲁番', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (741, 32, '五家渠', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (742, 18, '仙桃', '/18/', '', 2, 0, 0, 1, '');
INSERT INTO `regions` VALUES (743, 32, '阿拉尔', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (744, 290, '阿坝县', '/24/290/', '', 3, 0, 4, 0, '20030916000141');
INSERT INTO `regions` VALUES (745, 290, '黑水县', '/24/290/', '', 3, 0, 4, 0, '20030916000139');
INSERT INTO `regions` VALUES (746, 290, '红原县', '/24/290/', '', 3, 0, 4, 0, '20030916000143');
INSERT INTO `regions` VALUES (747, 290, '金川县', '/24/290/', '', 3, 0, 4, 0, '20030916000137');
INSERT INTO `regions` VALUES (748, 290, '九寨沟县', '/24/290/', '', 3, 0, 4, 0, '20030916000136');
INSERT INTO `regions` VALUES (749, 290, '理县', '/24/290/', '', 3, 0, 4, 0, '20030916000133');
INSERT INTO `regions` VALUES (750, 290, '马尔康县', '/24/290/', '', 3, 0, 4, 0, '20030916000131');
INSERT INTO `regions` VALUES (751, 290, '茂县', '/24/290/', '', 3, 0, 4, 0, '20030916000134');
INSERT INTO `regions` VALUES (752, 290, '壤塘县', '/24/290/', '', 3, 0, 4, 0, '20030916000140');
INSERT INTO `regions` VALUES (753, 290, '若尔盖县', '/24/290/', '', 3, 0, 4, 0, '20030916000142');
INSERT INTO `regions` VALUES (754, 290, '松潘县', '/24/290/', '', 3, 0, 4, 0, '20030916000135');
INSERT INTO `regions` VALUES (755, 290, '汶川县', '/24/290/', '', 3, 0, 4, 0, '20030916000132');
INSERT INTO `regions` VALUES (756, 290, '小金县', '/24/290/', '', 3, 0, 4, 0, '20030916000138');
INSERT INTO `regions` VALUES (757, 367, '阿克苏市', '/32/367/', '', 3, 0, 3, 0, '20030916002191');
INSERT INTO `regions` VALUES (758, 367, '阿瓦提县', '/32/367/', '', 3, 0, 3, 0, '20030916002198');
INSERT INTO `regions` VALUES (759, 367, '拜城县', '/32/367/', '', 3, 0, 3, 0, '20030916002196');
INSERT INTO `regions` VALUES (760, 367, '柯坪县', '/32/367/', '', 3, 0, 3, 0, '20030916002199');
INSERT INTO `regions` VALUES (761, 367, '库车县', '/32/367/', '', 3, 0, 3, 0, '20030916002193');
INSERT INTO `regions` VALUES (762, 367, '沙雅县', '/32/367/', '', 3, 0, 3, 0, '20030916002194');
INSERT INTO `regions` VALUES (763, 367, '温宿县', '/32/367/', '', 3, 0, 3, 0, '20030916002192');
INSERT INTO `regions` VALUES (764, 367, '乌什县', '/32/367/', '', 3, 0, 3, 0, '20030916002197');
INSERT INTO `regions` VALUES (765, 367, '新和县', '/32/367/', '', 3, 0, 3, 0, '20030916002195');
INSERT INTO `regions` VALUES (766, 743, '阿拉尔市', '/32/743/', '', 3, 0, 3, 0, '20030916002176');
INSERT INTO `regions` VALUES (767, 73, '阿拉善右旗', '/6/73/', '', 3, 0, 4, 0, '20030916001293');
INSERT INTO `regions` VALUES (768, 73, '阿拉善左旗', '/6/73/', '', 3, 0, 4, 0, '20030916002471');
INSERT INTO `regions` VALUES (769, 73, '额济纳旗', '/6/73/', '', 3, 0, 4, 0, '3000000085982009');
INSERT INTO `regions` VALUES (770, 375, '阿勒泰市', '/32/375/', '', 3, 0, 3, 0, '20030916002253');
INSERT INTO `regions` VALUES (771, 375, '布尔津县', '/32/375/', '', 3, 0, 3, 0, '20030916002254');
INSERT INTO `regions` VALUES (772, 375, '福海县', '/32/375/', '', 3, 0, 3, 0, '20030916002256');
INSERT INTO `regions` VALUES (773, 375, '富蕴县', '/32/375/', '', 3, 0, 3, 0, '20030916002255');
INSERT INTO `regions` VALUES (774, 375, '哈巴河县', '/32/375/', '', 3, 0, 3, 0, '20030916002257');
INSERT INTO `regions` VALUES (775, 375, '吉木乃县', '/32/375/', '', 3, 0, 3, 0, '20030916002259');
INSERT INTO `regions` VALUES (776, 375, '青河县', '/32/375/', '', 3, 0, 3, 0, '20030916002258');
INSERT INTO `regions` VALUES (777, 323, '措勤县', '/32/323/', '', 3, 0, 3, 0, '20030916002415');
INSERT INTO `regions` VALUES (778, 323, '噶尔县', '/32/323/', '', 3, 0, 3, 0, '20030916002409');
INSERT INTO `regions` VALUES (779, 323, '改则县', '/32/323/', '', 3, 0, 3, 0, '20030916002414');
INSERT INTO `regions` VALUES (780, 323, '革吉县', '/32/323/', '', 3, 0, 3, 0, '20030916002413');
INSERT INTO `regions` VALUES (781, 323, '普兰县', '/32/323/', '', 3, 0, 3, 0, '20030916002410');
INSERT INTO `regions` VALUES (782, 323, '日土县', '/32/323/', '', 3, 0, 3, 0, '20030916002412');
INSERT INTO `regions` VALUES (783, 323, '札达县', '/32/323/', '', 3, 0, 3, 0, '20030916002411');
INSERT INTO `regions` VALUES (784, 333, '白河县', '/28/333/', '', 3, 0, 3, 0, '20030916002684');
INSERT INTO `regions` VALUES (785, 333, '汉滨区', '/28/333/', '', 3, 0, 2, 0, '20030916002681');
INSERT INTO `regions` VALUES (786, 333, '汉阴县', '/28/333/', '', 3, 0, 3, 0, '20030916002707');
INSERT INTO `regions` VALUES (787, 333, '岚皋县', '/28/333/', '', 3, 0, 3, 0, '20030916002718');
INSERT INTO `regions` VALUES (788, 333, '宁陕县', '/28/333/', '', 3, 0, 3, 0, '20030916002734');
INSERT INTO `regions` VALUES (789, 333, '平利县', '/28/333/', '', 3, 0, 3, 0, '20030916002735');
INSERT INTO `regions` VALUES (790, 333, '石泉县', '/28/333/', '', 3, 0, 3, 0, '20030916002746');
INSERT INTO `regions` VALUES (791, 333, '旬阳县', '/28/333/', '', 3, 0, 3, 0, '20030916002760');
INSERT INTO `regions` VALUES (792, 333, '镇坪县', '/28/333/', '', 3, 0, 3, 0, '20030916002775');
INSERT INTO `regions` VALUES (793, 333, '紫阳县', '/28/333/', '', 3, 0, 3, 0, '20030916002780');
INSERT INTO `regions` VALUES (805, 296, '关岭布依族苗族自治县', '/25/296/', '', 3, 0, 3, 0, '20030916000434');
INSERT INTO `regions` VALUES (806, 296, '平坝县', '/25/296/', '', 3, 0, 3, 0, '20030916000432');
INSERT INTO `regions` VALUES (807, 296, '普定县', '/25/296/', '', 3, 0, 3, 0, '20030916000433');
INSERT INTO `regions` VALUES (808, 296, '西秀区', '/25/296/', '', 3, 0, 2, 0, '3000000138871205');
INSERT INTO `regions` VALUES (809, 296, '镇宁布依族苗族自治县', '/25/296/', '', 3, 0, 3, 0, '20030916000435');
INSERT INTO `regions` VALUES (810, 296, '紫云苗族布依族自治县', '/25/296/', '', 3, 0, 3, 0, '20030916000436');
INSERT INTO `regions` VALUES (811, 196, '安阳县', '/17/196/', '', 3, 0, 3, 0, '20030916002557');
INSERT INTO `regions` VALUES (812, 196, '北关区', '/17/196/', '', 3, 0, 2, 0, '20030916002552');
INSERT INTO `regions` VALUES (813, 196, '滑县', '/17/196/', '', 3, 0, 3, 0, '20030916002559');
INSERT INTO `regions` VALUES (814, 196, '林州市', '/17/196/', '', 3, 0, 2, 0, '20030916002556');
INSERT INTO `regions` VALUES (815, 196, '龙安区', '/17/196/', '', 3, 0, 2, 0, '20030916002555');
INSERT INTO `regions` VALUES (816, 196, '内黄县', '/17/196/', '', 3, 0, 3, 0, '20030916002560');
INSERT INTO `regions` VALUES (817, 196, '汤阴县', '/17/196/', '', 3, 0, 3, 0, '20030916002558');
INSERT INTO `regions` VALUES (818, 196, '文峰区', '/17/196/', '', 3, 0, 2, 0, '20030916002553');
INSERT INTO `regions` VALUES (819, 196, '殷都区', '/17/196/', '', 3, 0, 2, 0, '20030916002554');
INSERT INTO `regions` VALUES (820, 76, '海城市', '/7/76/', '', 3, 0, 2, 0, '20030916001836');
INSERT INTO `regions` VALUES (821, 76, '立山区', '/7/76/', '', 3, 0, 2, 0, '20030916001834');
INSERT INTO `regions` VALUES (822, 76, '千山区', '/7/76/', '', 3, 0, 2, 0, '20030916001835');
INSERT INTO `regions` VALUES (823, 76, '台安县', '/7/76/', '', 3, 0, 3, 0, '20030916001837');
INSERT INTO `regions` VALUES (824, 76, '铁东区', '/7/76/', '', 3, 0, 2, 0, '20030916001832');
INSERT INTO `regions` VALUES (825, 76, '铁西区', '/7/76/', '', 3, 0, 2, 0, '20030916001833');
INSERT INTO `regions` VALUES (826, 76, '岫岩满族自治县', '/7/76/', '', 3, 0, 3, 0, '20030916001838');
INSERT INTO `regions` VALUES (827, 69, '磴口县', '/6/69/', '', 3, 0, 3, 0, '20030916001494');
INSERT INTO `regions` VALUES (828, 69, '杭锦后旗', '/6/69/', '', 3, 0, 3, 0, '20030916001498');
INSERT INTO `regions` VALUES (829, 69, '临河区', '/6/69/', '', 3, 0, 2, 0, '20030916001492');
INSERT INTO `regions` VALUES (830, 69, '乌拉特后旗', '/6/69/', '', 3, 0, 4, 0, '20030916001497');
INSERT INTO `regions` VALUES (831, 69, '乌拉特前旗', '/6/69/', '', 3, 0, 3, 0, '20030916001495');
INSERT INTO `regions` VALUES (832, 69, '乌拉特中旗', '/6/69/', '', 3, 0, 4, 0, '20030916001496');
INSERT INTO `regions` VALUES (833, 69, '五原县', '/6/69/', '', 3, 0, 3, 0, '20030916001493');
INSERT INTO `regions` VALUES (843, 288, '巴州区', '/24/288/', '', 3, 0, 2, 0, '20030916000105');
INSERT INTO `regions` VALUES (844, 288, '南江县', '/24/288/', '', 3, 0, 3, 0, '20030916000107');
INSERT INTO `regions` VALUES (845, 288, '平昌县', '/24/288/', '', 3, 0, 3, 0, '20030916000108');
INSERT INTO `regions` VALUES (846, 288, '通江县', '/24/288/', '', 3, 0, 3, 0, '20030916000106');
INSERT INTO `regions` VALUES (847, 95, '大安市', '/8/95/', '', 3, 0, 2, 0, '20030916000173');
INSERT INTO `regions` VALUES (848, 95, '洮北区', '/8/95/', '', 3, 0, 2, 0, '20030916000172');
INSERT INTO `regions` VALUES (849, 95, '洮南市', '/8/95/', '', 3, 0, 2, 0, '20030916000174');
INSERT INTO `regions` VALUES (850, 95, '通榆县', '/8/95/', '', 3, 0, 3, 0, '20030916000176');
INSERT INTO `regions` VALUES (851, 95, '镇赉县', '/8/95/', '', 3, 0, 3, 0, '20030916000175');
INSERT INTO `regions` VALUES (852, 93, '八道江区', '/8/93/', '', 3, 0, 2, 0, '20030916000208');
INSERT INTO `regions` VALUES (853, 93, '长白朝鲜族自治县', '/8/93/', '', 3, 0, 3, 0, '20030916000213');
INSERT INTO `regions` VALUES (854, 93, '抚松县', '/8/93/', '', 3, 0, 3, 0, '20030916000211');
INSERT INTO `regions` VALUES (855, 93, '江源县', '/8/93/', '', 3, 0, 3, 0, '20030916000210');
INSERT INTO `regions` VALUES (856, 93, '靖宇县', '/8/93/', '', 3, 0, 3, 0, '20030916000212');
INSERT INTO `regions` VALUES (857, 93, '临江市', '/8/93/', '', 3, 0, 2, 0, '20030916000209');
INSERT INTO `regions` VALUES (858, 338, '白银区', '/29/338/', '', 3, 0, 2, 0, '20030916001225');
INSERT INTO `regions` VALUES (859, 338, '会宁县', '/29/338/', '', 3, 0, 4, 0, '20030916001228');
INSERT INTO `regions` VALUES (860, 338, '景泰县', '/29/338/', '', 3, 0, 4, 0, '20030916001229');
INSERT INTO `regions` VALUES (861, 338, '靖远县', '/29/338/', '', 3, 0, 4, 0, '20030916001227');
INSERT INTO `regions` VALUES (862, 338, '平川区', '/29/338/', '', 3, 0, 2, 0, '20030916001226');
INSERT INTO `regions` VALUES (863, 263, '德保县', '/21/263/', '', 3, 0, 3, 0, '20030916001500');
INSERT INTO `regions` VALUES (864, 263, '靖西县', '/21/263/', '', 3, 0, 3, 0, '20030916001501');
INSERT INTO `regions` VALUES (865, 263, '乐业县', '/21/263/', '', 3, 0, 3, 0, '20030916001502');
INSERT INTO `regions` VALUES (866, 263, '凌云县', '/21/263/', '', 3, 0, 3, 0, '20030916001503');
INSERT INTO `regions` VALUES (867, 263, '隆林各族自治县', '/21/263/', '', 3, 0, 3, 0, '20030916001504');
INSERT INTO `regions` VALUES (868, 263, '那坡县', '/21/263/', '', 3, 0, 3, 0, '20030916001505');
INSERT INTO `regions` VALUES (869, 263, '平果县', '/21/263/', '', 3, 0, 3, 0, '20030916001506');
INSERT INTO `regions` VALUES (870, 263, '田东县', '/21/263/', '', 3, 0, 3, 0, '20030916001507');
INSERT INTO `regions` VALUES (871, 263, '田林县', '/21/263/', '', 3, 0, 3, 0, '20030916001508');
INSERT INTO `regions` VALUES (872, 263, '田阳县', '/21/263/', '', 3, 0, 3, 0, '20030916001509');
INSERT INTO `regions` VALUES (873, 263, '西林县', '/21/263/', '', 3, 0, 3, 0, '20030916001510');
INSERT INTO `regions` VALUES (874, 263, '右江区', '/21/263/', '', 3, 0, 2, 0, '20030916001499');
INSERT INTO `regions` VALUES (882, 63, '白云矿区', '/6/63/', '', 3, 0, 2, 0, '20030916001456');
INSERT INTO `regions` VALUES (883, 63, '达尔罕茂明安联合旗', '/6/63/', '', 3, 0, 4, 0, '20030916001460');
INSERT INTO `regions` VALUES (884, 63, '东河区', '/6/63/', '', 3, 0, 2, 0, '20030916001453');
INSERT INTO `regions` VALUES (885, 63, '固阳县', '/6/63/', '', 3, 0, 3, 0, '20030916001458');
INSERT INTO `regions` VALUES (886, 63, '九原区', '/6/63/', '', 3, 0, 3, 0, '20030916001457');
INSERT INTO `regions` VALUES (887, 63, '昆都仑区', '/6/63/', '', 3, 0, 2, 0, '20030916001452');
INSERT INTO `regions` VALUES (888, 63, '青山区', '/6/63/', '', 3, 0, 2, 0, '20030916001454');
INSERT INTO `regions` VALUES (889, 63, '石拐区', '/6/63/', '', 3, 0, 2, 0, '20030916001455');
INSERT INTO `regions` VALUES (890, 63, '土默特右旗', '/6/63/', '', 3, 0, 4, 0, '20030916001459');
INSERT INTO `regions` VALUES (891, 327, '陈仓区', '/28/327/', '', 3, 0, 3, 0, '20030916002687');
INSERT INTO `regions` VALUES (892, 327, '凤县', '/28/327/', '', 3, 0, 3, 0, '20030916002697');
INSERT INTO `regions` VALUES (893, 327, '凤翔县', '/28/327/', '', 3, 0, 3, 0, '20030916002698');
INSERT INTO `regions` VALUES (894, 327, '扶风县', '/28/327/', '', 3, 0, 3, 0, '20030916002700');
INSERT INTO `regions` VALUES (895, 327, '金台区', '/28/327/', '', 3, 0, 2, 0, '3000000133163873');
INSERT INTO `regions` VALUES (896, 327, '麟游县', '/28/327/', '', 3, 0, 3, 0, '20030916002723');
INSERT INTO `regions` VALUES (897, 327, '陇县', '/28/327/', '', 3, 0, 3, 0, '20030916002725');
INSERT INTO `regions` VALUES (898, 327, '眉县', '/28/327/', '', 3, 0, 3, 0, '20030916002729');
INSERT INTO `regions` VALUES (899, 327, '岐山县', '/28/327/', '', 3, 0, 3, 0, '20030916002737');
INSERT INTO `regions` VALUES (900, 327, '千阳县', '/28/327/', '', 3, 0, 3, 0, '20030916002738');
INSERT INTO `regions` VALUES (901, 327, '太白县', '/28/327/', '', 3, 0, 3, 0, '20030916002748');
INSERT INTO `regions` VALUES (902, 327, '渭滨区', '/28/327/', '', 3, 0, 2, 0, '20030916002686');
INSERT INTO `regions` VALUES (903, 42, '安国市', '/4/42/', '', 3, 0, 2, 0, '20030916001723');
INSERT INTO `regions` VALUES (904, 42, '安新县', '/4/42/', '', 3, 0, 3, 0, '20030916001736');
INSERT INTO `regions` VALUES (905, 42, '北市区', '/4/42/', '', 3, 0, 2, 0, '20030916001718');
INSERT INTO `regions` VALUES (906, 42, '博野县', '/4/42/', '', 3, 0, 3, 0, '20030916001741');
INSERT INTO `regions` VALUES (907, 42, '定兴县', '/4/42/', '', 3, 0, 3, 0, '20030916001730');
INSERT INTO `regions` VALUES (908, 42, '定州市', '/4/42/', '', 3, 0, 2, 0, '20030916001721');
INSERT INTO `regions` VALUES (909, 42, '阜平县', '/4/42/', '', 3, 0, 3, 0, '20030916001740');
INSERT INTO `regions` VALUES (910, 42, '高碑店市', '/4/42/', '', 3, 0, 2, 0, '20030916001724');
INSERT INTO `regions` VALUES (911, 42, '高阳县', '/4/42/', '', 3, 0, 3, 0, '20030916001735');
INSERT INTO `regions` VALUES (912, 42, '涞水县', '/4/42/', '', 3, 0, 3, 0, '20030916001734');
INSERT INTO `regions` VALUES (913, 42, '涞源县', '/4/42/', '', 3, 0, 3, 0, '20030916001729');
INSERT INTO `regions` VALUES (914, 42, '蠡县', '/4/42/', '', 3, 0, 3, 0, '20030916001742');
INSERT INTO `regions` VALUES (915, 42, '满城县', '/4/42/', '', 3, 0, 2, 0, '20030916001725');
INSERT INTO `regions` VALUES (916, 42, '南市区', '/4/42/', '', 3, 0, 2, 0, '20030916001719');
INSERT INTO `regions` VALUES (917, 42, '清苑县', '/4/42/', '', 3, 0, 3, 0, '20030916001726');
INSERT INTO `regions` VALUES (918, 42, '曲阳县', '/4/42/', '', 3, 0, 3, 0, '20030916001739');
INSERT INTO `regions` VALUES (919, 42, '容城县', '/4/42/', '', 3, 0, 3, 0, '20030916001738');
INSERT INTO `regions` VALUES (920, 42, '顺平县', '/4/42/', '', 3, 0, 3, 0, '20030916001731');
INSERT INTO `regions` VALUES (921, 42, '唐县', '/4/42/', '', 3, 0, 3, 0, '20030916001732');
INSERT INTO `regions` VALUES (922, 42, '望都县', '/4/42/', '', 3, 0, 3, 0, '20030916001733');
INSERT INTO `regions` VALUES (923, 42, '新市区', '/4/42/', '', 3, 0, 2, 0, '20030916001717');
INSERT INTO `regions` VALUES (924, 42, '雄县', '/4/42/', '', 3, 0, 3, 0, '20030916001737');
INSERT INTO `regions` VALUES (925, 42, '徐水县', '/4/42/', '', 3, 0, 3, 0, '20030916001728');
INSERT INTO `regions` VALUES (926, 42, '易县', '/4/42/', '', 3, 0, 3, 0, '20030916001727');
INSERT INTO `regions` VALUES (927, 42, '涿州市', '/4/42/', '', 3, 0, 2, 0, '20030916001722');
INSERT INTO `regions` VALUES (928, 305, '昌宁县', '/26/305/', '', 3, 0, 3, 0, '20030916001097');
INSERT INTO `regions` VALUES (929, 305, '龙陵县', '/26/305/', '', 3, 0, 3, 0, '20030916001096');
INSERT INTO `regions` VALUES (930, 305, '隆阳区', '/26/305/', '', 3, 0, 2, 0, '20030916001093');
INSERT INTO `regions` VALUES (931, 305, '施甸县', '/26/305/', '', 3, 0, 3, 0, '20030916001094');
INSERT INTO `regions` VALUES (932, 305, '腾冲县', '/26/305/', '', 3, 0, 3, 0, '20030916001095');
INSERT INTO `regions` VALUES (933, 258, '海城区', '/21/258/', '', 3, 0, 2, 0, '20030916001511');
INSERT INTO `regions` VALUES (934, 258, '合浦县', '/21/258/', '', 3, 0, 3, 0, '20030916001512');
INSERT INTO `regions` VALUES (935, 258, '铁山港区', '/21/258/', '', 3, 0, 3, 0, '3000000137783850');
INSERT INTO `regions` VALUES (936, 258, '银海区', '/21/258/', '', 3, 0, 3, 0, '3000000137783662');
INSERT INTO `regions` VALUES (937, 716, '昌平区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100001');
INSERT INTO `regions` VALUES (938, 716, '朝阳区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100002');
INSERT INTO `regions` VALUES (939, 716, '崇文区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100003');
INSERT INTO `regions` VALUES (940, 716, '大兴区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100004');
INSERT INTO `regions` VALUES (941, 716, '东城区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100005');
INSERT INTO `regions` VALUES (942, 716, '房山区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100006');
INSERT INTO `regions` VALUES (943, 716, '丰台区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100007');
INSERT INTO `regions` VALUES (944, 716, '海淀区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100008');
INSERT INTO `regions` VALUES (945, 716, '怀柔区', '/2/716/', '', 3, 0, 2, 0, 'rowid09230100009');
INSERT INTO `regions` VALUES (946, 716, '门头沟区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100010');
INSERT INTO `regions` VALUES (947, 716, '密云县', '/2/716/', '', 3, 0, 2, 0, 'rowid09230100011');
INSERT INTO `regions` VALUES (948, 716, '平谷区', '/2/716/', '', 3, 0, 2, 0, 'rowid09230100012');
INSERT INTO `regions` VALUES (949, 716, '石景山区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100013');
INSERT INTO `regions` VALUES (950, 716, '顺义区', '/2/716/', '', 3, 0, 2, 0, 'rowid09230100014');
INSERT INTO `regions` VALUES (951, 716, '通州区', '/2/716/', '', 3, 0, 2, 0, 'rowid09230100015');
INSERT INTO `regions` VALUES (952, 716, '西城区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100016');
INSERT INTO `regions` VALUES (953, 716, '宣武区', '/2/716/', '', 3, 0, 1, 0, 'rowid09230100017');
INSERT INTO `regions` VALUES (954, 716, '延庆县', '/2/716/', '', 3, 0, 3, 0, 'rowid09230100018');
INSERT INTO `regions` VALUES (955, 78, '本溪满族自治县', '/7/78/', '', 3, 0, 3, 0, '20030916001823');
INSERT INTO `regions` VALUES (956, 78, '桓仁满族自治县', '/7/78/', '', 3, 0, 3, 0, '20030916001824');
INSERT INTO `regions` VALUES (957, 78, '明山区', '/7/78/', '', 3, 0, 2, 0, '20030916001821');
INSERT INTO `regions` VALUES (958, 78, '南芬区', '/7/78/', '', 3, 0, 2, 0, '20030916001822');
INSERT INTO `regions` VALUES (959, 78, '平山区', '/7/78/', '', 3, 0, 2, 0, '20030916001819');
INSERT INTO `regions` VALUES (960, 78, '溪湖区', '/7/78/', '', 3, 0, 2, 0, '20030916001820');
INSERT INTO `regions` VALUES (961, 298, '毕节市', '/25/298/', '', 3, 0, 2, 0, '20030916000437');
INSERT INTO `regions` VALUES (962, 298, '大方县', '/25/298/', '', 3, 0, 3, 0, '20030916000438');
INSERT INTO `regions` VALUES (963, 298, '赫章县', '/25/298/', '', 3, 0, 3, 0, '20030916000443');
INSERT INTO `regions` VALUES (964, 298, '金沙县', '/25/298/', '', 3, 0, 3, 0, '20030916000440');
INSERT INTO `regions` VALUES (965, 298, '纳雍县', '/25/298/', '', 3, 0, 3, 0, '20030916000442');
INSERT INTO `regions` VALUES (966, 298, '黔西县', '/25/298/', '', 3, 0, 3, 0, '20030916000439');
INSERT INTO `regions` VALUES (967, 298, '威宁彝族回族苗族自治县', '/25/298/', '', 3, 0, 3, 0, '20030916000444');
INSERT INTO `regions` VALUES (968, 298, '织金县', '/25/298/', '', 3, 0, 3, 0, '20030916000441');
INSERT INTO `regions` VALUES (969, 187, '滨城区', '/16/187/', '', 3, 0, 2, 0, '20030916000995');
INSERT INTO `regions` VALUES (970, 187, '博兴县', '/16/187/', '', 3, 0, 3, 0, '20030916000996');
INSERT INTO `regions` VALUES (971, 187, '惠民县', '/16/187/', '', 3, 0, 3, 0, '20030916000997');
INSERT INTO `regions` VALUES (972, 187, '无棣县', '/16/187/', '', 3, 0, 3, 0, '20030916000998');
INSERT INTO `regions` VALUES (973, 187, '阳信县', '/16/187/', '', 3, 0, 3, 0, '20030916000999');
INSERT INTO `regions` VALUES (974, 187, '沾化县', '/16/187/', '', 3, 0, 3, 0, '20030916001000');
INSERT INTO `regions` VALUES (975, 187, '邹平县', '/16/187/', '', 3, 0, 2, 0, '20030916001001');
INSERT INTO `regions` VALUES (980, 372, '博乐市', '/32/372/', '', 3, 0, 3, 0, '20030916002217');
INSERT INTO `regions` VALUES (981, 372, '精河县', '/32/372/', '', 3, 0, 3, 0, '20030916002218');
INSERT INTO `regions` VALUES (982, 372, '温泉县', '/32/372/', '', 3, 0, 3, 0, '20030916002219');
INSERT INTO `regions` VALUES (983, 45, '泊头市', '/4/45/', '', 3, 0, 2, 0, '20030916001883');
INSERT INTO `regions` VALUES (984, 45, '沧县', '/4/45/', '', 3, 0, 3, 0, '3000000137082132');
INSERT INTO `regions` VALUES (985, 45, '东光县', '/4/45/', '', 3, 0, 3, 0, '20030916001889');
INSERT INTO `regions` VALUES (986, 45, '海兴县', '/4/45/', '', 3, 0, 3, 0, '20030916001890');
INSERT INTO `regions` VALUES (987, 45, '河间市', '/4/45/', '', 3, 0, 3, 0, '20030916001886');
INSERT INTO `regions` VALUES (988, 45, '黄骅市', '/4/45/', '', 3, 0, 2, 0, '20030916001885');
INSERT INTO `regions` VALUES (989, 45, '孟村回族自治县', '/4/45/', '', 3, 0, 3, 0, '20030916001896');
INSERT INTO `regions` VALUES (990, 45, '南皮县', '/4/45/', '', 3, 0, 3, 0, '20030916001893');
INSERT INTO `regions` VALUES (991, 45, '青县', '/4/45/', '', 3, 0, 3, 0, '20030916001888');
INSERT INTO `regions` VALUES (992, 45, '任丘市', '/4/45/', '', 3, 0, 2, 0, '20030916001884');
INSERT INTO `regions` VALUES (993, 45, '肃宁县', '/4/45/', '', 3, 0, 3, 0, '20030916001892');
INSERT INTO `regions` VALUES (994, 45, '吴桥县', '/4/45/', '', 3, 0, 3, 0, '20030916001894');
INSERT INTO `regions` VALUES (995, 45, '献县', '/4/45/', '', 3, 0, 3, 0, '20030916001895');
INSERT INTO `regions` VALUES (996, 45, '新华区', '/4/45/', '', 3, 0, 2, 0, '3000000137082086');
INSERT INTO `regions` VALUES (997, 45, '盐山县', '/4/45/', '', 3, 0, 3, 0, '20030916001891');
INSERT INTO `regions` VALUES (998, 45, '运河区', '/4/45/', '', 3, 0, 2, 0, '20030916001887');
INSERT INTO `regions` VALUES (999, 319, '八宿县', '/27/319/', '', 3, 0, 6, 0, '20030916002367');
INSERT INTO `regions` VALUES (1000, 319, '边坝县', '/27/319/', '', 3, 0, 6, 0, '20030916002371');
INSERT INTO `regions` VALUES (1001, 319, '察雅县', '/27/319/', '', 3, 0, 6, 0, '20030916002366');
INSERT INTO `regions` VALUES (1002, 319, '昌都县', '/27/319/', '', 3, 0, 6, 0, '3000000008460610');
INSERT INTO `regions` VALUES (1003, 319, '丁青县', '/27/319/', '', 3, 0, 6, 0, '20030916002365');
INSERT INTO `regions` VALUES (1004, 319, '贡觉县', '/27/319/', '', 3, 0, 6, 0, '20030916002363');
INSERT INTO `regions` VALUES (1005, 319, '江达县', '/27/319/', '', 3, 0, 6, 0, '20030916002362');
INSERT INTO `regions` VALUES (1006, 319, '类乌齐县', '/27/319/', '', 3, 0, 6, 0, '20030916002364');
INSERT INTO `regions` VALUES (1007, 319, '洛隆县', '/27/319/', '', 3, 0, 6, 0, '20030916002370');
INSERT INTO `regions` VALUES (1008, 319, '芒康县', '/27/319/', '', 3, 0, 6, 0, '20030916002369');
INSERT INTO `regions` VALUES (1009, 319, '左贡县', '/27/319/', '', 3, 0, 6, 0, '20030916002368');
INSERT INTO `regions` VALUES (1010, 371, '昌吉市', '/32/371/', '', 3, 0, 5, 0, '20030916002220');
INSERT INTO `regions` VALUES (1011, 371, '阜康市', '/32/371/', '', 3, 0, 5, 0, '20030916002221');
INSERT INTO `regions` VALUES (1012, 371, '呼图壁县', '/32/371/', '', 3, 0, 6, 0, '20030916002223');
INSERT INTO `regions` VALUES (1013, 371, '吉木萨尔县', '/32/371/', '', 3, 0, 6, 0, '20030916002226');
INSERT INTO `regions` VALUES (1014, 371, '玛纳斯县', '/32/371/', '', 3, 0, 6, 0, '20030916002224');
INSERT INTO `regions` VALUES (1015, 371, '米泉市', '/32/371/', '', 3, 0, 5, 0, '20030916002222');
INSERT INTO `regions` VALUES (1016, 371, '木垒哈萨克自治县', '/32/371/', '', 3, 0, 6, 0, '20030916002227');
INSERT INTO `regions` VALUES (1017, 371, '奇台县', '/32/371/', '', 3, 0, 6, 0, '20030916002225');
INSERT INTO `regions` VALUES (1018, 88, '朝阳区', '/8/88/', '', 3, 0, 1, 0, '20030916000162');
INSERT INTO `regions` VALUES (1019, 88, '德惠市', '/8/88/', '', 3, 0, 2, 0, '20030916000168');
INSERT INTO `regions` VALUES (1020, 88, '二道区', '/8/88/', '', 3, 0, 1, 0, '20030916000165');
INSERT INTO `regions` VALUES (1021, 88, '九台市', '/8/88/', '', 3, 0, 2, 0, '20030916000169');
INSERT INTO `regions` VALUES (1022, 88, '宽城区', '/8/88/', '', 3, 0, 1, 0, '20030916000164');
INSERT INTO `regions` VALUES (1023, 88, '绿园区', '/8/88/', '', 3, 0, 1, 0, '20030916000166');
INSERT INTO `regions` VALUES (1024, 88, '南关区', '/8/88/', '', 3, 0, 1, 0, '20030916000163');
INSERT INTO `regions` VALUES (1025, 88, '农安县', '/8/88/', '', 3, 0, 3, 0, '20030916000171');
INSERT INTO `regions` VALUES (1026, 88, '双阳区', '/8/88/', '', 3, 0, 1, 0, '20030916000167');
INSERT INTO `regions` VALUES (1027, 88, '榆树市', '/8/88/', '', 3, 0, 2, 0, '20030916000170');
INSERT INTO `regions` VALUES (1028, 219, '长沙县', '/19/219/', '', 3, 0, 3, 0, '20030916000305');
INSERT INTO `regions` VALUES (1029, 219, '芙蓉区', '/19/219/', '', 3, 0, 1, 0, '20030916000300');
INSERT INTO `regions` VALUES (1030, 219, '开福区', '/19/219/', '', 3, 0, 1, 0, '20030916000302');
INSERT INTO `regions` VALUES (1031, 219, '浏阳市', '/19/219/', '', 3, 0, 2, 0, '20030916000304');
INSERT INTO `regions` VALUES (1032, 219, '宁乡县', '/19/219/', '', 3, 0, 3, 0, '20030916000307');
INSERT INTO `regions` VALUES (1033, 219, '天心区', '/19/219/', '', 3, 0, 1, 0, '20030916000301');
INSERT INTO `regions` VALUES (1034, 219, '望城县', '/19/219/', '', 3, 0, 3, 0, '20030916000306');
INSERT INTO `regions` VALUES (1035, 219, '雨花区', '/19/219/', '', 3, 0, 1, 0, '20030916000303');
INSERT INTO `regions` VALUES (1036, 219, '岳麓区', '/19/219/', '', 3, 0, 1, 0, '20030916000299');
INSERT INTO `regions` VALUES (1037, 51, '长治县', '/5/51/', '', 3, 0, 3, 0, '20030916001966');
INSERT INTO `regions` VALUES (1038, 51, '长子县', '/5/51/', '', 3, 0, 3, 0, '20030916001972');
INSERT INTO `regions` VALUES (1039, 51, '城区', '/5/51/', '', 3, 0, 2, 0, '20030916001963');
INSERT INTO `regions` VALUES (1040, 51, '壶关县', '/5/51/', '', 3, 0, 3, 0, '20030916001971');
INSERT INTO `regions` VALUES (1041, 51, '郊区', '/5/51/', '', 3, 0, 2, 0, '20030916001964');
INSERT INTO `regions` VALUES (1042, 51, '黎城县', '/5/51/', '', 3, 0, 3, 0, '20030916001970');
INSERT INTO `regions` VALUES (1043, 51, '潞城市', '/5/51/', '', 3, 0, 2, 0, '20030916001965');
INSERT INTO `regions` VALUES (1044, 51, '平顺县', '/5/51/', '', 3, 0, 3, 0, '20030916001969');
INSERT INTO `regions` VALUES (1045, 51, '沁县', '/5/51/', '', 3, 0, 3, 0, '20030916001974');
INSERT INTO `regions` VALUES (1046, 51, '沁源县', '/5/51/', '', 3, 0, 3, 0, '20030916001975');
INSERT INTO `regions` VALUES (1047, 51, '屯留县', '/5/51/', '', 3, 0, 3, 0, '20030916001968');
INSERT INTO `regions` VALUES (1048, 51, '武乡县', '/5/51/', '', 3, 0, 3, 0, '20030916001973');
INSERT INTO `regions` VALUES (1049, 51, '襄垣县', '/5/51/', '', 3, 0, 3, 0, '20030916001967');
INSERT INTO `regions` VALUES (1050, 225, '安乡县', '/19/225/', '', 3, 0, 3, 0, '3000000016684084');
INSERT INTO `regions` VALUES (1051, 225, '鼎城区', '/19/225/', '', 3, 0, 3, 0, '3000000137789554');
INSERT INTO `regions` VALUES (1052, 225, '汉寿县', '/19/225/', '', 3, 0, 3, 0, '20030916000314');
INSERT INTO `regions` VALUES (1053, 225, '津市市', '/19/225/', '', 3, 0, 2, 0, '20030916000312');
INSERT INTO `regions` VALUES (1054, 225, '澧县', '/19/225/', '', 3, 0, 3, 0, '20030916000315');
INSERT INTO `regions` VALUES (1055, 225, '临澧县', '/19/225/', '', 3, 0, 3, 0, '20030916000316');
INSERT INTO `regions` VALUES (1056, 225, '石门县', '/19/225/', '', 3, 0, 3, 0, '20030916000318');
INSERT INTO `regions` VALUES (1057, 225, '桃源县', '/19/225/', '', 3, 0, 3, 0, '20030916000317');
INSERT INTO `regions` VALUES (1058, 225, '武陵区', '/19/225/', '', 3, 0, 2, 0, '20030916000311');
INSERT INTO `regions` VALUES (1059, 114, '金坛市', '/11/114/', '', 3, 0, 3, 0, '20030916002121');
INSERT INTO `regions` VALUES (1060, 114, '溧阳市', '/11/114/', '', 3, 0, 3, 0, '20030916002122');
INSERT INTO `regions` VALUES (1061, 114, '戚墅堰区', '/11/114/', '', 3, 0, 2, 0, '3000000137083480');
INSERT INTO `regions` VALUES (1062, 114, '天宁区', '/11/114/', '', 3, 0, 2, 0, '3000000137083454');
INSERT INTO `regions` VALUES (1063, 114, '武进区', '/11/114/', '', 3, 0, 2, 0, '3000000137083516');
INSERT INTO `regions` VALUES (1064, 114, '新北区', '/11/114/', '', 3, 0, 2, 0, '3000000137083496');
INSERT INTO `regions` VALUES (1065, 114, '钟楼区', '/11/114/', '', 3, 0, 2, 0, '20030916002120');
INSERT INTO `regions` VALUES (1072, 86, '北票市', '/7/86/', '', 3, 0, 2, 0, '20030916001019');
INSERT INTO `regions` VALUES (1073, 86, '朝阳县', '/7/86/', '', 3, 0, 3, 0, '20030916001021');
INSERT INTO `regions` VALUES (1074, 86, '建平县', '/7/86/', '', 3, 0, 3, 0, '20030916001022');
INSERT INTO `regions` VALUES (1075, 86, '喀喇沁左翼蒙古族自治县', '/7/86/', '', 3, 0, 3, 0, '20030916001023');
INSERT INTO `regions` VALUES (1076, 86, '凌源市', '/7/86/', '', 3, 0, 2, 0, '20030916001020');
INSERT INTO `regions` VALUES (1077, 86, '龙城区', '/7/86/', '', 3, 0, 2, 0, '20030916001018');
INSERT INTO `regions` VALUES (1078, 86, '双塔区', '/7/86/', '', 3, 0, 2, 0, '20030916001017');
INSERT INTO `regions` VALUES (1079, 251, '潮安县', '/20/251/', '', 3, 0, 3, 0, '20030916000492');
INSERT INTO `regions` VALUES (1080, 251, '饶平县', '/20/251/', '', 3, 0, 3, 0, '20030916000494');
INSERT INTO `regions` VALUES (1081, 251, '湘桥区', '/20/251/', '', 3, 0, 2, 0, '20030916000495');
INSERT INTO `regions` VALUES (1082, 228, '安仁县', '/19/228/', '', 3, 0, 3, 0, '20030916000358');
INSERT INTO `regions` VALUES (1083, 228, '北湖区', '/19/228/', '', 3, 0, 2, 0, '20030916000349');
INSERT INTO `regions` VALUES (1084, 228, '桂东县', '/19/228/', '', 3, 0, 3, 0, '20030916000357');
INSERT INTO `regions` VALUES (1085, 228, '桂阳县', '/19/228/', '', 3, 0, 3, 0, '20030916000351');
INSERT INTO `regions` VALUES (1086, 228, '嘉禾县', '/19/228/', '', 3, 0, 3, 0, '20030916000354');
INSERT INTO `regions` VALUES (1087, 228, '临武县', '/19/228/', '', 3, 0, 3, 0, '20030916000355');
INSERT INTO `regions` VALUES (1088, 228, '汝城县', '/19/228/', '', 3, 0, 3, 0, '20030916000356');
INSERT INTO `regions` VALUES (1089, 228, '苏仙区', '/19/228/', '', 3, 0, 2, 0, '3000000137888122');
INSERT INTO `regions` VALUES (1090, 228, '宜章县', '/19/228/', '', 3, 0, 3, 0, '20030916000353');
INSERT INTO `regions` VALUES (1091, 228, '永兴县', '/19/228/', '', 3, 0, 3, 0, '20030916000352');
INSERT INTO `regions` VALUES (1092, 228, '资兴市', '/19/228/', '', 3, 0, 2, 0, '20030916000350');
INSERT INTO `regions` VALUES (1094, 272, '成华区', '/24/272/', '', 3, 0, 1, 0, '20030916000024');
INSERT INTO `regions` VALUES (1095, 272, '崇州市', '/24/272/', '', 3, 0, 3, 0, '20030916000029');
INSERT INTO `regions` VALUES (1096, 272, '大邑县', '/24/272/', '', 3, 0, 3, 0, '20030916000036');
INSERT INTO `regions` VALUES (1097, 272, '都江堰市', '/24/272/', '', 3, 0, 3, 0, '20030916000031');
INSERT INTO `regions` VALUES (1098, 272, '金牛区', '/24/272/', '', 3, 0, 1, 0, '20030916000022');
INSERT INTO `regions` VALUES (1099, 272, '金堂县', '/24/272/', '', 3, 0, 3, 0, '20030916000033');
INSERT INTO `regions` VALUES (1100, 272, '锦江区', '/24/272/', '', 3, 0, 1, 0, '20030916000021');
INSERT INTO `regions` VALUES (1101, 272, '龙泉驿区', '/24/272/', '', 3, 0, 1, 0, '20030916000025');
INSERT INTO `regions` VALUES (1102, 272, '彭州市', '/24/272/', '', 3, 0, 3, 0, '20030916000032');
INSERT INTO `regions` VALUES (1103, 272, '郫县', '/24/272/', '', 3, 0, 3, 0, '20030916000035');
INSERT INTO `regions` VALUES (1104, 272, '蒲江县', '/24/272/', '', 3, 0, 3, 0, '20030916000037');
INSERT INTO `regions` VALUES (1105, 272, '青白江区', '/24/272/', '', 3, 0, 1, 0, '20030916000026');
INSERT INTO `regions` VALUES (1106, 272, '青羊区', '/24/272/', '', 3, 0, 1, 0, '20030916000020');
INSERT INTO `regions` VALUES (1107, 272, '邛崃市', '/24/272/', '', 3, 0, 3, 0, '20030916000030');
INSERT INTO `regions` VALUES (1108, 272, '双流县', '/24/272/', '', 3, 0, 2, 0, '20030916000034');
INSERT INTO `regions` VALUES (1109, 272, '温江区', '/24/272/', '', 3, 0, 1, 0, '20030916000028');
INSERT INTO `regions` VALUES (1110, 272, '武侯区', '/24/272/', '', 3, 0, 1, 0, '20030916000023');
INSERT INTO `regions` VALUES (1111, 272, '新都区', '/24/272/', '', 3, 0, 1, 0, '20030916000027');
INSERT INTO `regions` VALUES (1112, 272, '新津县', '/24/272/', '', 3, 0, 3, 0, '20030916000038');
INSERT INTO `regions` VALUES (1113, 44, '承德县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100034');
INSERT INTO `regions` VALUES (1114, 44, '丰宁满族自治县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100039');
INSERT INTO `regions` VALUES (1115, 44, '宽城满族自治县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100040');
INSERT INTO `regions` VALUES (1116, 44, '隆化县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100038');
INSERT INTO `regions` VALUES (1117, 44, '滦平县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100037');
INSERT INTO `regions` VALUES (1118, 44, '平泉县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100036');
INSERT INTO `regions` VALUES (1119, 44, '双滦区', '/4/44/', '', 3, 0, 3, 0, '3000000137081860');
INSERT INTO `regions` VALUES (1120, 44, '双桥区', '/4/44/', '', 3, 0, 2, 0, 'rowid09230100033');
INSERT INTO `regions` VALUES (1121, 44, '围场满族蒙古族自治县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100041');
INSERT INTO `regions` VALUES (1122, 44, '兴隆县', '/4/44/', '', 3, 0, 3, 0, 'rowid09230100035');
INSERT INTO `regions` VALUES (1123, 44, '鹰手营子矿区', '/4/44/', '', 3, 0, 3, 0, '3000000137081885');
INSERT INTO `regions` VALUES (1128, 65, '阿鲁科尔沁旗', '/6/65/', '', 3, 0, 5, 0, '20030916001053');
INSERT INTO `regions` VALUES (1129, 65, '敖汉旗', '/6/65/', '', 3, 0, 4, 0, '20030916001059');
INSERT INTO `regions` VALUES (1130, 65, '巴林右旗', '/6/65/', '', 3, 0, 4, 0, '20030916001055');
INSERT INTO `regions` VALUES (1131, 65, '巴林左旗', '/6/65/', '', 3, 0, 4, 0, '20030916001054');
INSERT INTO `regions` VALUES (1132, 65, '红山区', '/6/65/', '', 3, 0, 2, 0, '20030916001048');
INSERT INTO `regions` VALUES (1133, 65, '喀喇沁旗', '/6/65/', '', 3, 0, 3, 0, '20030916001058');
INSERT INTO `regions` VALUES (1134, 65, '克什克腾旗', '/6/65/', '', 3, 0, 4, 0, '20030916001056');
INSERT INTO `regions` VALUES (1135, 65, '林西县', '/6/65/', '', 3, 0, 5, 0, '20030916001052');
INSERT INTO `regions` VALUES (1136, 65, '宁城县', '/6/65/', '', 3, 0, 4, 0, '20030916001051');
INSERT INTO `regions` VALUES (1137, 65, '松山区', '/6/65/', '', 3, 0, 2, 0, '20030916001050');
INSERT INTO `regions` VALUES (1138, 65, '翁牛特旗', '/6/65/', '', 3, 0, 3, 0, '20030916001057');
INSERT INTO `regions` VALUES (1139, 65, '元宝山区', '/6/65/', '', 3, 0, 2, 0, '20030916001049');
INSERT INTO `regions` VALUES (1140, 267, '大新县', '/21/267/', '', 3, 0, 3, 0, '20030916001567');
INSERT INTO `regions` VALUES (1141, 267, '扶绥县', '/21/267/', '', 3, 0, 3, 0, '20030916001568');
INSERT INTO `regions` VALUES (1142, 267, '江洲区', '/21/267/', '', 3, 0, 3, 0, '20030916001566');
INSERT INTO `regions` VALUES (1143, 267, '龙州县', '/21/267/', '', 3, 0, 3, 0, '20030916001578');
INSERT INTO `regions` VALUES (1144, 267, '宁明县', '/21/267/', '', 3, 0, 3, 0, '20030916001572');
INSERT INTO `regions` VALUES (1145, 267, '凭祥市', '/21/267/', '', 3, 0, 3, 0, '20030916001579');
INSERT INTO `regions` VALUES (1146, 267, '天等县', '/21/267/', '', 3, 0, 3, 0, '20030916001575');
INSERT INTO `regions` VALUES (1155, 313, '楚雄市', '/26/313/', '', 3, 0, 3, 0, '20030916001154');
INSERT INTO `regions` VALUES (1156, 313, '大姚县', '/26/313/', '', 3, 0, 3, 0, '20030916001159');
INSERT INTO `regions` VALUES (1157, 313, '禄丰县', '/26/313/', '', 3, 0, 3, 0, '20030916001163');
INSERT INTO `regions` VALUES (1158, 313, '牟定县', '/26/313/', '', 3, 0, 3, 0, '20030916001156');
INSERT INTO `regions` VALUES (1159, 313, '南华县', '/26/313/', '', 3, 0, 3, 0, '20030916001157');
INSERT INTO `regions` VALUES (1160, 313, '双柏县', '/26/313/', '', 3, 0, 3, 0, '20030916001155');
INSERT INTO `regions` VALUES (1161, 313, '武定县', '/26/313/', '', 3, 0, 3, 0, '20030916001162');
INSERT INTO `regions` VALUES (1162, 313, '姚安县', '/26/313/', '', 3, 0, 3, 0, '20030916001158');
INSERT INTO `regions` VALUES (1163, 313, '永仁县', '/26/313/', '', 3, 0, 3, 0, '20030916001160');
INSERT INTO `regions` VALUES (1164, 313, '元谋县', '/26/313/', '', 3, 0, 3, 0, '20030916001161');
INSERT INTO `regions` VALUES (1165, 285, '达县', '/24/285/', '', 3, 0, 3, 0, '20030916000270');
INSERT INTO `regions` VALUES (1166, 285, '大竹县', '/24/285/', '', 3, 0, 3, 0, '20030916000271');
INSERT INTO `regions` VALUES (1167, 285, '开江县', '/24/285/', '', 3, 0, 3, 0, '20030916000274');
INSERT INTO `regions` VALUES (1168, 285, '渠县', '/24/285/', '', 3, 0, 3, 0, '20030916000272');
INSERT INTO `regions` VALUES (1169, 285, '通川区', '/24/285/', '', 3, 0, 2, 0, '20030916000269');
INSERT INTO `regions` VALUES (1170, 285, '万源市', '/24/285/', '', 3, 0, 3, 0, '20030916000275');
INSERT INTO `regions` VALUES (1171, 285, '宣汉县', '/24/285/', '', 3, 0, 3, 0, '20030916000273');
INSERT INTO `regions` VALUES (1172, 314, '宾川县', '/26/314/', '', 3, 0, 4, 0, '20030916001144');
INSERT INTO `regions` VALUES (1173, 314, '大理市', '/26/314/', '', 3, 0, 2, 0, '20030916001142');
INSERT INTO `regions` VALUES (1174, 314, '洱源县', '/26/314/', '', 3, 0, 3, 0, '20030916001148');
INSERT INTO `regions` VALUES (1175, 314, '鹤庆县', '/26/314/', '', 3, 0, 3, 0, '20030916001150');
INSERT INTO `regions` VALUES (1176, 314, '剑川县', '/26/314/', '', 3, 0, 3, 0, '20030916001149');
INSERT INTO `regions` VALUES (1177, 314, '弥渡县', '/26/314/', '', 3, 0, 3, 0, '20030916001145');
INSERT INTO `regions` VALUES (1178, 314, '南涧彝族自治县', '/26/314/', '', 3, 0, 3, 0, '20030916001152');
INSERT INTO `regions` VALUES (1179, 314, '巍山彝族回族自治县', '/26/314/', '', 3, 0, 3, 0, '20030916001153');
INSERT INTO `regions` VALUES (1180, 314, '祥云县', '/26/314/', '', 3, 0, 3, 0, '20030916001143');
INSERT INTO `regions` VALUES (1181, 314, '漾濞彝族自治县', '/26/314/', '', 3, 0, 3, 0, '20030916001151');
INSERT INTO `regions` VALUES (1182, 314, '永平县', '/26/314/', '', 3, 0, 3, 0, '20030916001146');
INSERT INTO `regions` VALUES (1183, 314, '云龙县', '/26/314/', '', 3, 0, 3, 0, '20030916001147');
INSERT INTO `regions` VALUES (1184, 75, '长海县', '/7/75/', '', 3, 0, 3, 0, '20030916002665');
INSERT INTO `regions` VALUES (1185, 75, '甘井子区', '/7/75/', '', 3, 0, 1, 0, '20030916002659');
INSERT INTO `regions` VALUES (1186, 75, '金州区', '/7/75/', '', 3, 0, 3, 0, '20030916002661');
INSERT INTO `regions` VALUES (1187, 75, '旅顺口区', '/7/75/', '', 3, 0, 2, 0, '20030916002660');
INSERT INTO `regions` VALUES (1188, 75, '普兰店市', '/7/75/', '', 3, 0, 2, 0, '20030916002663');
INSERT INTO `regions` VALUES (1189, 75, '沙河口区', '/7/75/', '', 3, 0, 1, 0, '20030916002658');
INSERT INTO `regions` VALUES (1190, 75, '瓦房店市', '/7/75/', '', 3, 0, 2, 0, '20030916002662');
INSERT INTO `regions` VALUES (1191, 75, '西岗区', '/7/75/', '', 3, 0, 1, 0, '20030916002656');
INSERT INTO `regions` VALUES (1192, 75, '中山区', '/7/75/', '', 3, 0, 1, 0, '20030916002657');
INSERT INTO `regions` VALUES (1193, 75, '庄河市', '/7/75/', '', 3, 0, 2, 0, '20030916002664');
INSERT INTO `regions` VALUES (1194, 102, '大同区', '/9/102/', '', 3, 0, 2, 0, '20030916000651');
INSERT INTO `regions` VALUES (1195, 102, '杜尔伯特蒙古族自治县', '/9/102/', '', 3, 0, 3, 0, '20030916000656');
INSERT INTO `regions` VALUES (1196, 102, '红岗区', '/9/102/', '', 3, 0, 2, 0, '20030916000652');
INSERT INTO `regions` VALUES (1197, 102, '林甸县', '/9/102/', '', 3, 0, 3, 0, '20030916000655');
INSERT INTO `regions` VALUES (1198, 102, '龙凤区', '/9/102/', '', 3, 0, 2, 0, '20030916000649');
INSERT INTO `regions` VALUES (1199, 102, '让胡路区', '/9/102/', '', 3, 0, 2, 0, '20030916000650');
INSERT INTO `regions` VALUES (1200, 102, '萨尔图区', '/9/102/', '', 3, 0, 2, 0, '20030916000648');
INSERT INTO `regions` VALUES (1201, 102, '肇源县', '/9/102/', '', 3, 0, 3, 0, '20030916000654');
INSERT INTO `regions` VALUES (1202, 102, '肇州县', '/9/102/', '', 3, 0, 3, 0, '20030916000653');
INSERT INTO `regions` VALUES (1203, 49, '城区', '/5/49/', '', 3, 0, 2, 0, '20030916001941');
INSERT INTO `regions` VALUES (1204, 49, '大同县', '/5/49/', '', 3, 0, 3, 0, '20030916001951');
INSERT INTO `regions` VALUES (1205, 49, '广灵县', '/5/49/', '', 3, 0, 3, 0, '20030916001947');
INSERT INTO `regions` VALUES (1206, 49, '浑源县', '/5/49/', '', 3, 0, 3, 0, '20030916001949');
INSERT INTO `regions` VALUES (1207, 49, '矿区', '/5/49/', '', 3, 0, 2, 0, '20030916001942');
INSERT INTO `regions` VALUES (1208, 49, '灵丘县', '/5/49/', '', 3, 0, 3, 0, '20030916001948');
INSERT INTO `regions` VALUES (1209, 49, '南郊区', '/5/49/', '', 3, 0, 3, 0, '20030916001943');
INSERT INTO `regions` VALUES (1210, 49, '天镇县', '/5/49/', '', 3, 0, 3, 0, '20030916001946');
INSERT INTO `regions` VALUES (1211, 49, '新荣区', '/5/49/', '', 3, 0, 3, 0, '20030916001944');
INSERT INTO `regions` VALUES (1212, 49, '阳高县', '/5/49/', '', 3, 0, 3, 0, '20030916001945');
INSERT INTO `regions` VALUES (1213, 49, '左云县', '/5/49/', '', 3, 0, 3, 0, '20030916001950');
INSERT INTO `regions` VALUES (1214, 109, '大兴安岭地区', '/9/109/', '', 3, 0, 3, 0, '3000000019087530');
INSERT INTO `regions` VALUES (1215, 109, '呼玛县', '/9/109/', '', 3, 0, 3, 0, '20030916000734');
INSERT INTO `regions` VALUES (1216, 109, '漠河县', '/9/109/', '', 3, 0, 3, 0, '20030916000736');
INSERT INTO `regions` VALUES (1217, 109, '塔河县', '/9/109/', '', 3, 0, 3, 0, '20030916000735');
INSERT INTO `regions` VALUES (1218, 79, '东港市', '/7/79/', '', 3, 0, 2, 0, '20030916002654');
INSERT INTO `regions` VALUES (1219, 79, '凤城市', '/7/79/', '', 3, 0, 2, 0, '20030916002653');
INSERT INTO `regions` VALUES (1220, 79, '宽甸满族自治县', '/7/79/', '', 3, 0, 3, 0, '20030916002655');
INSERT INTO `regions` VALUES (1221, 79, '元宝区', '/7/79/', '', 3, 0, 2, 0, '20030916002651');
INSERT INTO `regions` VALUES (1222, 79, '振安区', '/7/79/', '', 3, 0, 2, 0, '20030916002652');
INSERT INTO `regions` VALUES (1223, 79, '振兴区', '/7/79/', '', 3, 0, 2, 0, '20030916002650');
INSERT INTO `regions` VALUES (1224, 315, '梁河县', '/26/315/', '', 3, 0, 3, 0, '20030916001132');
INSERT INTO `regions` VALUES (1225, 315, '陇川县', '/26/315/', '', 3, 0, 3, 0, '20030916001134');
INSERT INTO `regions` VALUES (1226, 315, '潞西市', '/26/315/', '', 3, 0, 3, 0, '20030916001130');
INSERT INTO `regions` VALUES (1227, 315, '瑞丽市', '/26/315/', '', 3, 0, 3, 0, '20030916001131');
INSERT INTO `regions` VALUES (1228, 315, '盈江县', '/26/315/', '', 3, 0, 3, 0, '20030916001133');
INSERT INTO `regions` VALUES (1229, 276, '广汉市', '/24/276/', '', 3, 0, 3, 0, '20030916000057');
INSERT INTO `regions` VALUES (1230, 276, '旌阳区', '/24/276/', '', 3, 0, 2, 0, '20030916000060');
INSERT INTO `regions` VALUES (1231, 276, '罗江县', '/24/276/', '', 3, 0, 3, 0, '20030916000058');
INSERT INTO `regions` VALUES (1232, 276, '绵竹市', '/24/276/', '', 3, 0, 3, 0, '20030916000062');
INSERT INTO `regions` VALUES (1233, 276, '什邡市', '/24/276/', '', 3, 0, 2, 0, '20030916000061');
INSERT INTO `regions` VALUES (1234, 276, '中江县', '/24/276/', '', 3, 0, 3, 0, '20030916000059');
INSERT INTO `regions` VALUES (1235, 185, '德城区', '/16/185/', '', 3, 0, 2, 0, '20030916002856');
INSERT INTO `regions` VALUES (1236, 185, '乐陵市', '/16/185/', '', 3, 0, 2, 0, '20030916000981');
INSERT INTO `regions` VALUES (1237, 185, '临邑县', '/16/185/', '', 3, 0, 3, 0, '20030916000982');
INSERT INTO `regions` VALUES (1238, 185, '陵县', '/16/185/', '', 3, 0, 3, 0, '20030916000983');
INSERT INTO `regions` VALUES (1239, 185, '宁津县', '/16/185/', '', 3, 0, 3, 0, '20030916000984');
INSERT INTO `regions` VALUES (1240, 185, '平原县', '/16/185/', '', 3, 0, 3, 0, '20030916000985');
INSERT INTO `regions` VALUES (1241, 185, '齐河县', '/16/185/', '', 3, 0, 3, 0, '20030916000986');
INSERT INTO `regions` VALUES (1242, 185, '庆云县', '/16/185/', '', 3, 0, 2, 0, '20030916000979');
INSERT INTO `regions` VALUES (1243, 185, '武城县', '/16/185/', '', 3, 0, 3, 0, '20030916000987');
INSERT INTO `regions` VALUES (1244, 185, '夏津县', '/16/185/', '', 3, 0, 3, 0, '20030916000988');
INSERT INTO `regions` VALUES (1245, 185, '禹城市', '/16/185/', '', 3, 0, 2, 0, '20030916000989');
INSERT INTO `regions` VALUES (1246, 317, '德钦县', '/26/317/', '', 3, 0, 3, 0, '20030916001140');
INSERT INTO `regions` VALUES (1247, 317, '维西傈僳族自治县', '/26/317/', '', 3, 0, 3, 0, '20030916001141');
INSERT INTO `regions` VALUES (1248, 317, '香格里拉县', '/26/317/', '', 3, 0, 3, 0, '20030916001139');
INSERT INTO `regions` VALUES (1249, 345, '安定区', '/29/345/', '', 3, 0, 2, 0, '20030916001262');
INSERT INTO `regions` VALUES (1250, 345, '临洮县', '/29/345/', '', 3, 0, 4, 0, '20030916001264');
INSERT INTO `regions` VALUES (1251, 345, '陇西县', '/29/345/', '', 3, 0, 4, 0, '20030916001268');
INSERT INTO `regions` VALUES (1252, 345, '岷县', '/29/345/', '', 3, 0, 4, 0, '20030916001266');
INSERT INTO `regions` VALUES (1253, 345, '通渭县', '/29/345/', '', 3, 0, 4, 0, '20030916001263');
INSERT INTO `regions` VALUES (1254, 345, '渭源县', '/29/345/', '', 3, 0, 4, 0, '20030916001267');
INSERT INTO `regions` VALUES (1255, 345, '漳县', '/29/345/', '', 3, 0, 4, 0, '20030916001265');
INSERT INTO `regions` VALUES (1256, 249, '东莞市', '/20/249/', '', 3, 0, 2, 0, '20030916000496');
INSERT INTO `regions` VALUES (1257, 176, '东营区', '/16/176/', '', 3, 0, 2, 0, '20030916001002');
INSERT INTO `regions` VALUES (1258, 176, '广饶县', '/16/176/', '', 3, 0, 3, 0, '20030916001003');
INSERT INTO `regions` VALUES (1259, 176, '河口区', '/16/176/', '', 3, 0, 2, 0, '20030916001004');
INSERT INTO `regions` VALUES (1260, 176, '垦利县', '/16/176/', '', 3, 0, 3, 0, '20030916001005');
INSERT INTO `regions` VALUES (1261, 176, '利津县', '/16/176/', '', 3, 0, 3, 0, '20030916001006');
INSERT INTO `regions` VALUES (1262, 67, '达拉特旗', '/6/67/', '', 3, 0, 3, 0, '20030916001462');
INSERT INTO `regions` VALUES (1263, 67, '东胜区', '/6/67/', '', 3, 0, 2, 0, '20030916001461');
INSERT INTO `regions` VALUES (1264, 67, '鄂托克旗', '/6/67/', '', 3, 0, 3, 0, '20030916001465');
INSERT INTO `regions` VALUES (1265, 67, '鄂托克前旗', '/6/67/', '', 3, 0, 4, 0, '20030916001464');
INSERT INTO `regions` VALUES (1266, 67, '杭锦旗', '/6/67/', '', 3, 0, 3, 0, '20030916001466');
INSERT INTO `regions` VALUES (1267, 67, '乌审旗', '/6/67/', '', 3, 0, 4, 0, '20030916001467');
INSERT INTO `regions` VALUES (1268, 67, '伊金霍洛旗', '/6/67/', '', 3, 0, 3, 0, '20030916001468');
INSERT INTO `regions` VALUES (1269, 67, '准格尔旗', '/6/67/', '', 3, 0, 3, 0, '20030916001463');
INSERT INTO `regions` VALUES (1270, 213, '鄂城区', '/18/213/', '', 3, 0, 2, 0, '20030916002069');
INSERT INTO `regions` VALUES (1271, 213, '华容区', '/18/213/', '', 3, 0, 3, 0, '20030916002071');
INSERT INTO `regions` VALUES (1272, 213, '梁子湖区', '/18/213/', '', 3, 0, 2, 0, '20030916002070');
INSERT INTO `regions` VALUES (1273, 218, '巴东县', '/18/218/', '', 3, 0, 3, 0, '20030916002112');
INSERT INTO `regions` VALUES (1274, 218, '恩施市', '/18/218/', '', 3, 0, 2, 0, '20030916002109');
INSERT INTO `regions` VALUES (1275, 218, '鹤峰县', '/18/218/', '', 3, 0, 3, 0, '20030916002116');
INSERT INTO `regions` VALUES (1276, 218, '建始县', '/18/218/', '', 3, 0, 3, 0, '20030916002111');
INSERT INTO `regions` VALUES (1277, 218, '来凤县', '/18/218/', '', 3, 0, 3, 0, '20030916002115');
INSERT INTO `regions` VALUES (1278, 218, '利川市', '/18/218/', '', 3, 0, 2, 0, '20030916002110');
INSERT INTO `regions` VALUES (1279, 218, '咸丰县', '/18/218/', '', 3, 0, 3, 0, '20030916002114');
INSERT INTO `regions` VALUES (1280, 218, '宣恩县', '/18/218/', '', 3, 0, 3, 0, '20030916002113');
INSERT INTO `regions` VALUES (1281, 259, '东兴市', '/21/259/', '', 3, 0, 3, 0, '20030916001514');
INSERT INTO `regions` VALUES (1282, 259, '防城区', '/21/259/', '', 3, 0, 3, 0, '3000000137786968');
INSERT INTO `regions` VALUES (1283, 259, '港口区', '/21/259/', '', 3, 0, 2, 0, '20030916001515');
INSERT INTO `regions` VALUES (1284, 259, '上思县', '/21/259/', '', 3, 0, 3, 0, '20030916001516');
INSERT INTO `regions` VALUES (1285, 238, '禅城区', '/20/238/', '', 3, 0, 2, 0, '20030916000497');
INSERT INTO `regions` VALUES (1286, 238, '高明区', '/20/238/', '', 3, 0, 2, 0, '20030916000499');
INSERT INTO `regions` VALUES (1287, 238, '南海区', '/20/238/', '', 3, 0, 2, 0, '20030916000500');
INSERT INTO `regions` VALUES (1288, 238, '三水区', '/20/238/', '', 3, 0, 2, 0, '20030916000501');
INSERT INTO `regions` VALUES (1289, 238, '顺德区', '/20/238/', '', 3, 0, 2, 0, '20030916000502');
INSERT INTO `regions` VALUES (1290, 152, '仓山区', '/14/152/', '', 3, 0, 1, 0, '20030916001620');
INSERT INTO `regions` VALUES (1291, 152, '长乐市', '/14/152/', '', 3, 0, 2, 0, '20030916001638');
INSERT INTO `regions` VALUES (1292, 152, '福清市', '/14/152/', '', 3, 0, 3, 0, '20030916001631');
INSERT INTO `regions` VALUES (1293, 152, '鼓楼区', '/14/152/', '', 3, 0, 2, 0, '20030916001618');
INSERT INTO `regions` VALUES (1294, 152, '晋安区', '/14/152/', '', 3, 0, 1, 0, '20030916001621');
INSERT INTO `regions` VALUES (1295, 152, '连江县', '/14/152/', '', 3, 0, 3, 0, '20030916001634');
INSERT INTO `regions` VALUES (1296, 152, '罗源县', '/14/152/', '', 3, 0, 3, 0, '20030916001635');
INSERT INTO `regions` VALUES (1297, 152, '马尾区', '/14/152/', '', 3, 0, 1, 0, '20030916001622');
INSERT INTO `regions` VALUES (1298, 152, '闽侯县', '/14/152/', '', 3, 0, 3, 0, '20030916001632');
INSERT INTO `regions` VALUES (1299, 152, '闽清县', '/14/152/', '', 3, 0, 3, 0, '20030916001636');
INSERT INTO `regions` VALUES (1300, 152, '平潭县', '/14/152/', '', 3, 0, 3, 0, '20030916001633');
INSERT INTO `regions` VALUES (1301, 152, '台江区', '/14/152/', '', 3, 0, 1, 0, '20030916001619');
INSERT INTO `regions` VALUES (1302, 152, '永泰县', '/14/152/', '', 3, 0, 3, 0, '20030916001637');
INSERT INTO `regions` VALUES (1303, 77, '东洲区', '/7/77/', '', 3, 0, 2, 0, '20030916001813');
INSERT INTO `regions` VALUES (1304, 77, '抚顺县', '/7/77/', '', 3, 0, 3, 0, '20030916001816');
INSERT INTO `regions` VALUES (1305, 77, '清原满族自治县', '/7/77/', '', 3, 0, 3, 0, '20030916001818');
INSERT INTO `regions` VALUES (1306, 77, '顺城区', '/7/77/', '', 3, 0, 2, 0, '20030916001815');
INSERT INTO `regions` VALUES (1307, 77, '望花区', '/7/77/', '', 3, 0, 2, 0, '20030916001814');
INSERT INTO `regions` VALUES (1308, 77, '新宾满族自治县', '/7/77/', '', 3, 0, 3, 0, '20030916001817');
INSERT INTO `regions` VALUES (1309, 77, '新抚区', '/7/77/', '', 3, 0, 2, 0, '20030916001812');
INSERT INTO `regions` VALUES (1310, 170, '崇仁县', '/15/170/', '', 3, 0, 3, 0, '20030916001350');
INSERT INTO `regions` VALUES (1311, 170, '东乡县', '/15/170/', '', 3, 0, 3, 0, '20030916001357');
INSERT INTO `regions` VALUES (1312, 170, '广昌县', '/15/170/', '', 3, 0, 3, 0, '20030916001365');
INSERT INTO `regions` VALUES (1313, 170, '金溪县', '/15/170/', '', 3, 0, 3, 0, '20030916001373');
INSERT INTO `regions` VALUES (1314, 170, '乐安县', '/15/170/', '', 3, 0, 3, 0, '20030916001378');
INSERT INTO `regions` VALUES (1315, 170, '黎川县', '/15/170/', '', 3, 0, 3, 0, '20030916001380');
INSERT INTO `regions` VALUES (1316, 170, '临川区', '/15/170/', '', 3, 0, 2, 0, '20030916001382');
INSERT INTO `regions` VALUES (1317, 170, '南城县', '/15/170/', '', 3, 0, 3, 0, '20030916001387');
INSERT INTO `regions` VALUES (1318, 170, '南丰县', '/15/170/', '', 3, 0, 3, 0, '20030916001388');
INSERT INTO `regions` VALUES (1319, 170, '宜黄县', '/15/170/', '', 3, 0, 3, 0, '20030916001427');
INSERT INTO `regions` VALUES (1320, 170, '资溪县', '/15/170/', '', 3, 0, 3, 0, '20030916001442');
INSERT INTO `regions` VALUES (1321, 82, '阜新蒙古族自治县', '/7/82/', '', 3, 0, 3, 0, '20030916001030');
INSERT INTO `regions` VALUES (1322, 82, '海州区', '/7/82/', '', 3, 0, 2, 0, '20030916001024');
INSERT INTO `regions` VALUES (1323, 82, '清河门区', '/7/82/', '', 3, 0, 2, 0, '20030916001027');
INSERT INTO `regions` VALUES (1324, 82, '太平区', '/7/82/', '', 3, 0, 2, 0, '20030916001026');
INSERT INTO `regions` VALUES (1325, 82, '细河区', '/7/82/', '', 3, 0, 2, 0, '20030916001028');
INSERT INTO `regions` VALUES (1326, 82, '新邱区', '/7/82/', '', 3, 0, 2, 0, '20030916001025');
INSERT INTO `regions` VALUES (1327, 82, '彰武县', '/7/82/', '', 3, 0, 3, 0, '20030916001029');
INSERT INTO `regions` VALUES (1336, 348, '迭部县', '/29/348/', '', 3, 0, 5, 0, '20030916001289');
INSERT INTO `regions` VALUES (1337, 348, '合作市', '/29/348/', '', 3, 0, 2, 0, '20030916001285');
INSERT INTO `regions` VALUES (1338, 348, '临潭县', '/29/348/', '', 3, 0, 5, 0, '20030916001286');
INSERT INTO `regions` VALUES (1339, 348, '碌曲县', '/29/348/', '', 3, 0, 5, 0, '20030916001291');
INSERT INTO `regions` VALUES (1340, 348, '玛曲县', '/29/348/', '', 3, 0, 5, 0, '20030916001290');
INSERT INTO `regions` VALUES (1341, 348, '夏河县', '/29/348/', '', 3, 0, 5, 0, '20030916001292');
INSERT INTO `regions` VALUES (1342, 348, '舟曲县', '/29/348/', '', 3, 0, 3, 0, '20030916001288');
INSERT INTO `regions` VALUES (1343, 348, '卓尼县', '/29/348/', '', 3, 0, 3, 0, '20030916001287');
INSERT INTO `regions` VALUES (1344, 291, '巴塘县', '/29/291/', '', 3, 0, 5, 0, '20030916000063');
INSERT INTO `regions` VALUES (1345, 291, '白玉县', '/29/291/', '', 3, 0, 5, 0, '20030916000158');
INSERT INTO `regions` VALUES (1346, 291, '丹巴县', '/29/291/', '', 3, 0, 5, 0, '20030916000154');
INSERT INTO `regions` VALUES (1347, 291, '道孚县', '/29/291/', '', 3, 0, 5, 0, '20030916000149');
INSERT INTO `regions` VALUES (1348, 291, '稻城县', '/29/291/', '', 3, 0, 5, 0, '20030916000160');
INSERT INTO `regions` VALUES (1349, 291, '得荣县', '/29/291/', '', 3, 0, 5, 0, '20030916000161');
INSERT INTO `regions` VALUES (1350, 291, '德格县', '/29/291/', '', 3, 0, 5, 0, '20030916000153');
INSERT INTO `regions` VALUES (1351, 291, '甘孜县', '/29/291/', '', 3, 0, 5, 0, '20030916000151');
INSERT INTO `regions` VALUES (1352, 291, '九龙县', '/29/291/', '', 3, 0, 5, 0, '20030916000147');
INSERT INTO `regions` VALUES (1353, 291, '康定县', '/29/291/', '', 3, 0, 5, 0, '20030916000144');
INSERT INTO `regions` VALUES (1354, 291, '理塘县', '/29/291/', '', 3, 0, 5, 0, '20030916000157');
INSERT INTO `regions` VALUES (1355, 291, '泸定县', '/29/291/', '', 3, 0, 5, 0, '20030916000145');
INSERT INTO `regions` VALUES (1356, 291, '炉霍县', '/29/291/', '', 3, 0, 5, 0, '20030916000150');
INSERT INTO `regions` VALUES (1357, 291, '色达县', '/29/291/', '', 3, 0, 5, 0, '20030916000156');
INSERT INTO `regions` VALUES (1358, 291, '石渠县', '/29/291/', '', 3, 0, 5, 0, '20030916000155');
INSERT INTO `regions` VALUES (1359, 291, '乡城县', '/29/291/', '', 3, 0, 5, 0, '20030916000159');
INSERT INTO `regions` VALUES (1360, 291, '新龙县', '/29/291/', '', 3, 0, 5, 0, '20030916000152');
INSERT INTO `regions` VALUES (1361, 291, '雅江县', '/29/291/', '', 3, 0, 3, 0, '20030916000148');
INSERT INTO `regions` VALUES (1362, 167, '安远县', '/15/167/', '', 3, 0, 3, 0, '20030916001347');
INSERT INTO `regions` VALUES (1363, 167, '崇义县', '/15/167/', '', 3, 0, 3, 0, '20030916001351');
INSERT INTO `regions` VALUES (1364, 167, '大余县', '/15/167/', '', 3, 0, 3, 0, '20030916001352');
INSERT INTO `regions` VALUES (1365, 167, '定南县', '/15/167/', '', 3, 0, 3, 0, '20030916001355');
INSERT INTO `regions` VALUES (1366, 167, '赣县', '/15/167/', '', 3, 0, 3, 0, '20030916001363');
INSERT INTO `regions` VALUES (1367, 167, '会昌县', '/15/167/', '', 3, 0, 3, 0, '20030916001370');
INSERT INTO `regions` VALUES (1368, 167, '龙南县', '/15/167/', '', 3, 0, 3, 0, '20030916001383');
INSERT INTO `regions` VALUES (1369, 167, '南康市', '/15/167/', '', 3, 0, 2, 0, '20030916001389');
INSERT INTO `regions` VALUES (1370, 167, '宁都县', '/15/167/', '', 3, 0, 3, 0, '20030916001390');
INSERT INTO `regions` VALUES (1371, 167, '全南县', '/15/167/', '', 3, 0, 3, 0, '20030916001398');
INSERT INTO `regions` VALUES (1372, 167, '瑞金市', '/15/167/', '', 3, 0, 3, 0, '20030916001400');
INSERT INTO `regions` VALUES (1373, 167, '上犹县', '/15/167/', '', 3, 0, 3, 0, '20030916001403');
INSERT INTO `regions` VALUES (1374, 167, '石城县', '/15/167/', '', 3, 0, 3, 0, '20030916001404');
INSERT INTO `regions` VALUES (1375, 167, '信丰县', '/15/167/', '', 3, 0, 3, 0, '20030916001419');
INSERT INTO `regions` VALUES (1376, 167, '兴国县', '/15/167/', '', 3, 0, 3, 0, '20030916001421');
INSERT INTO `regions` VALUES (1377, 167, '寻乌县', '/15/167/', '', 3, 0, 3, 0, '20030916001424');
INSERT INTO `regions` VALUES (1378, 167, '于都县', '/15/167/', '', 3, 0, 3, 0, '20030916001433');
INSERT INTO `regions` VALUES (1379, 167, '章贡区', '/15/167/', '', 3, 0, 2, 0, '20030916001439');
INSERT INTO `regions` VALUES (1380, 360, '泾源县', '/31/360/', '', 3, 0, 3, 0, '20030916002468');
INSERT INTO `regions` VALUES (1381, 360, '隆德县', '/31/360/', '', 3, 0, 3, 0, '20030916002467');
INSERT INTO `regions` VALUES (1382, 360, '彭阳县', '/31/360/', '', 3, 0, 3, 0, '20030916002469');
INSERT INTO `regions` VALUES (1383, 360, '西吉县', '/31/360/', '', 3, 0, 3, 0, '20030916002466');
INSERT INTO `regions` VALUES (1384, 360, '原州区', '/31/360/', '', 3, 0, 2, 0, '20030916002464');
INSERT INTO `regions` VALUES (1385, 284, '广安区', '/24/284/', '', 3, 0, 2, 0, '20030916000276');
INSERT INTO `regions` VALUES (1386, 284, '华蓥市', '/24/284/', '', 3, 0, 2, 0, '20030916000280');
INSERT INTO `regions` VALUES (1387, 284, '邻水县', '/24/284/', '', 3, 0, 3, 0, '20030916000279');
INSERT INTO `regions` VALUES (1388, 284, '武胜县', '/24/284/', '', 3, 0, 3, 0, '20030916000278');
INSERT INTO `regions` VALUES (1389, 284, '岳池县', '/24/284/', '', 3, 0, 3, 0, '20030916000277');
INSERT INTO `regions` VALUES (1390, 278, '苍溪县', '/24/278/', '', 3, 0, 3, 0, '20030916000046');
INSERT INTO `regions` VALUES (1391, 278, '朝天区', '/24/278/', '', 3, 0, 3, 0, '20030916000042');
INSERT INTO `regions` VALUES (1392, 278, '剑阁县', '/24/278/', '', 3, 0, 3, 0, '20030916000045');
INSERT INTO `regions` VALUES (1393, 278, '青川县', '/24/278/', '', 3, 0, 3, 0, '20030916000044');
INSERT INTO `regions` VALUES (1394, 278, '市中区', '/24/278/', '', 3, 0, 2, 0, '20030916000040');
INSERT INTO `regions` VALUES (1395, 278, '旺苍县', '/24/278/', '', 3, 0, 2, 0, '20030916000043');
INSERT INTO `regions` VALUES (1396, 278, '元坝区', '/24/278/', '', 3, 0, 2, 0, '20030916000041');
INSERT INTO `regions` VALUES (1397, 233, '白云区', '/20/233/', '', 3, 0, 1, 0, '20030916000503');
INSERT INTO `regions` VALUES (1398, 233, '从化市', '/20/233/', '', 3, 0, 2, 0, '20030916000504');
INSERT INTO `regions` VALUES (1399, 233, '番禺区', '/20/233/', '', 3, 0, 1, 0, '20030916000506');
INSERT INTO `regions` VALUES (1400, 233, '海珠区', '/20/233/', '', 3, 0, 1, 0, '20030916000509');
INSERT INTO `regions` VALUES (1401, 233, '花都区', '/20/233/', '', 3, 0, 1, 0, '20030916000510');
INSERT INTO `regions` VALUES (1402, 233, '黄埔区', '/20/233/', '', 3, 0, 1, 0, '20030916000511');
INSERT INTO `regions` VALUES (1403, 233, '荔湾区', '/20/233/', '', 3, 0, 1, 0, '20030916000512');
INSERT INTO `regions` VALUES (1404, 233, '萝岗区', '/20/233/', '', 3, 0, 1, 0, '3000000158671445');
INSERT INTO `regions` VALUES (1405, 233, '南沙区', '/20/233/', '', 3, 0, 1, 0, '3000000158671272');
INSERT INTO `regions` VALUES (1406, 233, '天河区', '/20/233/', '', 3, 0, 1, 0, '20030916000513');
INSERT INTO `regions` VALUES (1407, 233, '越秀区', '/20/233/', '', 3, 0, 1, 0, '20030916000514');
INSERT INTO `regions` VALUES (1408, 233, '增城市', '/20/233/', '', 3, 0, 2, 0, '20030916000515');
INSERT INTO `regions` VALUES (1409, 261, '港北区', '/21/261/', '', 3, 0, 3, 0, '20030916001517');
INSERT INTO `regions` VALUES (1410, 261, '港南区', '/21/261/', '', 3, 0, 2, 0, '3000000137786277');
INSERT INTO `regions` VALUES (1411, 261, '桂平市', '/21/261/', '', 3, 0, 3, 0, '20030916001532');
INSERT INTO `regions` VALUES (1412, 261, '平南县', '/21/261/', '', 3, 0, 3, 0, '20030916001518');
INSERT INTO `regions` VALUES (1413, 261, '覃塘区', '/21/261/', '', 3, 0, 3, 0, '3000000137786401');
INSERT INTO `regions` VALUES (1414, 293, '白云区', '/25/293/', '', 3, 0, 1, 0, '20030916000408');
INSERT INTO `regions` VALUES (1415, 293, '花溪区', '/25/293/', '', 3, 0, 1, 0, '20030916000406');
INSERT INTO `regions` VALUES (1416, 293, '开阳县', '/25/293/', '', 3, 0, 3, 0, '20030916000411');
INSERT INTO `regions` VALUES (1417, 293, '南明区', '/25/293/', '', 3, 0, 1, 0, '20030916000404');
INSERT INTO `regions` VALUES (1418, 293, '清镇市', '/25/293/', '', 3, 0, 2, 0, '20030916000410');
INSERT INTO `regions` VALUES (1419, 293, '乌当区', '/25/293/', '', 3, 0, 1, 0, '20030916000407');
INSERT INTO `regions` VALUES (1420, 293, '息烽县', '/25/293/', '', 3, 0, 3, 0, '20030916000413');
INSERT INTO `regions` VALUES (1421, 293, '小河区', '/25/293/', '', 3, 0, 1, 0, '20030916000409');
INSERT INTO `regions` VALUES (1422, 293, '修文县', '/25/293/', '', 3, 0, 3, 0, '20030916000412');
INSERT INTO `regions` VALUES (1423, 293, '云岩区', '/25/293/', '', 3, 0, 1, 0, '20030916000405');
INSERT INTO `regions` VALUES (1424, 256, '叠彩区', '/21/256/', '', 3, 0, 2, 0, '3000000137785423');
INSERT INTO `regions` VALUES (1425, 256, '恭城瑶族自治县', '/21/256/', '', 3, 0, 3, 0, '20030916001519');
INSERT INTO `regions` VALUES (1426, 256, '灌阳县', '/21/256/', '', 3, 0, 3, 0, '20030916001520');
INSERT INTO `regions` VALUES (1427, 256, '荔浦县', '/21/256/', '', 3, 0, 3, 0, '20030916001522');
INSERT INTO `regions` VALUES (1428, 256, '临桂县', '/21/256/', '', 3, 0, 3, 0, '20030916001523');
INSERT INTO `regions` VALUES (1429, 256, '灵川县', '/21/256/', '', 3, 0, 3, 0, '20030916001524');
INSERT INTO `regions` VALUES (1430, 256, '龙胜各族自治县', '/21/256/', '', 3, 0, 3, 0, '20030916001525');
INSERT INTO `regions` VALUES (1431, 256, '平乐县', '/21/256/', '', 3, 0, 3, 0, '20030916001526');
INSERT INTO `regions` VALUES (1432, 256, '七星区', '/21/256/', '', 3, 0, 2, 0, '3000000137785657');
INSERT INTO `regions` VALUES (1433, 256, '全州县', '/21/256/', '', 3, 0, 3, 0, '20030916001527');
INSERT INTO `regions` VALUES (1434, 256, '象山区', '/21/256/', '', 3, 0, 2, 0, '20030916001521');
INSERT INTO `regions` VALUES (1435, 256, '兴安县', '/21/256/', '', 3, 0, 3, 0, '20030916001528');
INSERT INTO `regions` VALUES (1436, 256, '秀峰区', '/21/256/', '', 3, 0, 2, 0, '3000000137785583');
INSERT INTO `regions` VALUES (1437, 256, '雁山区', '/21/256/', '', 3, 0, 2, 0, '3000000137785745');
INSERT INTO `regions` VALUES (1438, 256, '阳朔县', '/21/256/', '', 3, 0, 3, 0, '20030916001529');
INSERT INTO `regions` VALUES (1439, 256, '永福县', '/21/256/', '', 3, 0, 3, 0, '20030916001530');
INSERT INTO `regions` VALUES (1440, 256, '资源县', '/21/256/', '', 3, 0, 3, 0, '20030916001531');
INSERT INTO `regions` VALUES (1441, 354, '班玛县', '/30/354/', '', 3, 0, 5, 0, '20030916002326');
INSERT INTO `regions` VALUES (1442, 354, '达日县', '/30/354/', '', 3, 0, 5, 0, '20030916002328');
INSERT INTO `regions` VALUES (1443, 354, '甘德县', '/30/354/', '', 3, 0, 5, 0, '20030916002327');
INSERT INTO `regions` VALUES (1444, 354, '久治县', '/30/354/', '', 3, 0, 5, 0, '20030916002329');
INSERT INTO `regions` VALUES (1445, 354, '玛多县', '/30/354/', '', 3, 0, 5, 0, '20030916002330');
INSERT INTO `regions` VALUES (1446, 354, '玛沁县', '/30/354/', '', 3, 0, 5, 0, '20030916002325');
INSERT INTO `regions` VALUES (1447, 97, '阿城市', '/9/97/', '', 3, 0, 2, 0, '20030916000617');
INSERT INTO `regions` VALUES (1448, 97, '巴彦县', '/9/97/', '', 3, 0, 3, 0, '20030916000622');
INSERT INTO `regions` VALUES (1449, 97, '宾县', '/9/97/', '', 3, 0, 3, 0, '20030916000621');
INSERT INTO `regions` VALUES (1450, 97, '道里区', '/9/97/', '', 3, 0, 1, 0, '20030916000607');
INSERT INTO `regions` VALUES (1451, 97, '道外区', '/9/97/', '', 3, 0, 1, 0, '20030916000609');
INSERT INTO `regions` VALUES (1453, 97, '方正县', '/9/97/', '', 3, 0, 3, 0, '20030916000620');
INSERT INTO `regions` VALUES (1454, 97, '呼兰区', '/9/97/', '', 3, 0, 1, 0, '20030916000618');
INSERT INTO `regions` VALUES (1455, 97, '木兰县', '/9/97/', '', 3, 0, 3, 0, '20030916000623');
INSERT INTO `regions` VALUES (1456, 97, '南岗区', '/9/97/', '', 3, 0, 1, 0, '20030916000608');
INSERT INTO `regions` VALUES (1457, 97, '平房区', '/9/97/', '', 3, 0, 1, 0, '20030916000613');
INSERT INTO `regions` VALUES (1458, 97, '尚志市', '/9/97/', '', 3, 0, 3, 0, '20030916000615');
INSERT INTO `regions` VALUES (1459, 97, '双城市', '/9/97/', '', 3, 0, 3, 0, '20030916000614');
INSERT INTO `regions` VALUES (1460, 97, '松北区', '/9/97/', '', 3, 0, 1, 0, '20030916000610');
INSERT INTO `regions` VALUES (1461, 97, '通河县', '/9/97/', '', 3, 0, 3, 0, '20030916000624');
INSERT INTO `regions` VALUES (1462, 97, '五常市', '/9/97/', '', 3, 0, 3, 0, '20030916000616');
INSERT INTO `regions` VALUES (1463, 97, '香坊区', '/9/97/', '', 3, 0, 1, 0, '20030916000611');
INSERT INTO `regions` VALUES (1464, 97, '延寿县', '/9/97/', '', 3, 0, 3, 0, '20030916000625');
INSERT INTO `regions` VALUES (1465, 97, '依兰县', '/9/97/', '', 3, 0, 3, 0, '20030916000619');
INSERT INTO `regions` VALUES (1466, 365, '巴里坤哈萨克自治县', '/32/365/', '', 3, 0, 5, 0, '20030916002212');
INSERT INTO `regions` VALUES (1467, 365, '哈密市', '/32/365/', '', 3, 0, 3, 0, '20030916002210');
INSERT INTO `regions` VALUES (1468, 365, '伊吾县', '/32/365/', '', 3, 0, 3, 0, '20030916002211');
INSERT INTO `regions` VALUES (1469, 351, '刚察县', '/30/351/', '', 3, 0, 5, 0, '20030916002314');
INSERT INTO `regions` VALUES (1470, 351, '海晏县', '/30/351/', '', 3, 0, 5, 0, '20030916002312');
INSERT INTO `regions` VALUES (1471, 351, '门源回族自治县', '/30/351/', '', 3, 0, 5, 0, '20030916002315');
INSERT INTO `regions` VALUES (1472, 351, '祁连县', '/30/351/', '', 3, 0, 5, 0, '20030916002313');
INSERT INTO `regions` VALUES (1473, 350, '互助土族自治县', '/30/350/', '', 3, 0, 5, 0, '20030916002309');
INSERT INTO `regions` VALUES (1474, 350, '化隆回族自治县', '/30/350/', '', 3, 0, 5, 0, '20030916002310');
INSERT INTO `regions` VALUES (1475, 350, '乐都县', '/30/350/', '', 3, 0, 5, 0, '20030916002307');
INSERT INTO `regions` VALUES (1476, 350, '民和回族土族自治县', '/30/350/', '', 3, 0, 5, 0, '20030916002308');
INSERT INTO `regions` VALUES (1477, 350, '平安县', '/30/350/', '', 3, 0, 5, 0, '20030916002306');
INSERT INTO `regions` VALUES (1478, 350, '循化撒拉族自治县', '/30/350/', '', 3, 0, 5, 0, '20030916002311');
INSERT INTO `regions` VALUES (1479, 268, '龙华区', '/22/268/', '', 3, 0, 1, 0, '20030916000849');
INSERT INTO `regions` VALUES (1480, 268, '美兰区', '/22/268/', '', 3, 0, 1, 0, '20030916000852');
INSERT INTO `regions` VALUES (1481, 268, '琼山区', '/22/268/', '', 3, 0, 1, 0, '20030916000851');
INSERT INTO `regions` VALUES (1482, 268, '秀英区', '/22/268/', '', 3, 0, 1, 0, '20030916000850');
INSERT INTO `regions` VALUES (1483, 353, '共和县', '/30/353/', '', 3, 0, 5, 0, '20030916002316');
INSERT INTO `regions` VALUES (1484, 353, '贵德县', '/30/353/', '', 3, 0, 5, 0, '20030916002318');
INSERT INTO `regions` VALUES (1485, 353, '贵南县', '/30/353/', '', 3, 0, 5, 0, '20030916002320');
INSERT INTO `regions` VALUES (1486, 353, '同德县', '/30/353/', '', 3, 0, 4, 0, '20030916002317');
INSERT INTO `regions` VALUES (1487, 353, '兴海县', '/30/353/', '', 3, 0, 4, 0, '20030916002319');
INSERT INTO `regions` VALUES (1488, 356, '德令哈市', '/30/356/', '', 3, 0, 2, 0, '20030916002337');
INSERT INTO `regions` VALUES (1489, 356, '都兰县', '/30/356/', '', 3, 0, 5, 0, '20030916002340');
INSERT INTO `regions` VALUES (1490, 356, '格尔木市', '/30/356/', '', 3, 0, 2, 0, '20030916002338');
INSERT INTO `regions` VALUES (1491, 356, '天峻县', '/30/356/', '', 3, 0, 4, 0, '20030916002341');
INSERT INTO `regions` VALUES (1492, 356, '乌兰县', '/30/356/', '', 3, 0, 4, 0, '20030916002339');
INSERT INTO `regions` VALUES (1493, 40, '成安县', '/4/40/', '', 3, 0, 3, 0, '20030916001780');
INSERT INTO `regions` VALUES (1494, 40, '磁县', '/4/40/', '', 3, 0, 3, 0, '20030916001783');
INSERT INTO `regions` VALUES (1495, 40, '丛台区', '/4/40/', '', 3, 0, 2, 0, '20030916001773');
INSERT INTO `regions` VALUES (1496, 40, '大名县', '/4/40/', '', 3, 0, 3, 0, '20030916001781');
INSERT INTO `regions` VALUES (1497, 40, '肥乡县', '/4/40/', '', 3, 0, 3, 0, '20030916001784');
INSERT INTO `regions` VALUES (1498, 40, '峰峰矿区', '/4/40/', '', 3, 0, 3, 0, '20030916001776');
INSERT INTO `regions` VALUES (1499, 40, '复兴区', '/4/40/', '', 3, 0, 2, 0, '20030916001775');
INSERT INTO `regions` VALUES (1500, 40, '馆陶县', '/4/40/', '', 3, 0, 3, 0, '20030916001789');
INSERT INTO `regions` VALUES (1501, 40, '广平县', '/4/40/', '', 3, 0, 3, 0, '20030916001788');
INSERT INTO `regions` VALUES (1502, 40, '邯郸县', '/4/40/', '', 3, 0, 3, 0, '20030916001778');
INSERT INTO `regions` VALUES (1503, 40, '邯山区', '/4/40/', '', 3, 0, 2, 0, '20030916001774');
INSERT INTO `regions` VALUES (1504, 40, '鸡泽县', '/4/40/', '', 3, 0, 3, 0, '20030916001787');
INSERT INTO `regions` VALUES (1505, 40, '临漳县', '/4/40/', '', 3, 0, 3, 0, '20030916001779');
INSERT INTO `regions` VALUES (1506, 40, '邱县', '/4/40/', '', 3, 0, 3, 0, '20030916001786');
INSERT INTO `regions` VALUES (1507, 40, '曲周县', '/4/40/', '', 3, 0, 3, 0, '20030916001791');
INSERT INTO `regions` VALUES (1508, 40, '涉县', '/4/40/', '', 3, 0, 3, 0, '20030916001782');
INSERT INTO `regions` VALUES (1509, 40, '魏县', '/4/40/', '', 3, 0, 3, 0, '20030916001790');
INSERT INTO `regions` VALUES (1510, 40, '武安市', '/4/40/', '', 3, 0, 3, 0, '20030916001777');
INSERT INTO `regions` VALUES (1511, 40, '永年县', '/4/40/', '', 3, 0, 3, 0, '20030916001785');
INSERT INTO `regions` VALUES (1512, 331, '城固县', '/28/331/', '', 3, 0, 3, 0, '20030916002692');
INSERT INTO `regions` VALUES (1513, 331, '佛坪县', '/28/331/', '', 3, 0, 3, 0, '20030916002699');
INSERT INTO `regions` VALUES (1514, 331, '汉台区', '/28/331/', '', 3, 0, 2, 0, '20030916002708');
INSERT INTO `regions` VALUES (1515, 331, '留坝县', '/28/331/', '', 3, 0, 3, 0, '20030916002724');
INSERT INTO `regions` VALUES (1516, 331, '略阳县', '/28/331/', '', 3, 0, 3, 0, '20030916002726');
INSERT INTO `regions` VALUES (1517, 331, '勉县', '/28/331/', '', 3, 0, 3, 0, '20030916002731');
INSERT INTO `regions` VALUES (1518, 331, '南郑县', '/28/331/', '', 3, 0, 3, 0, '20030916002732');
INSERT INTO `regions` VALUES (1519, 331, '宁强县', '/28/331/', '', 3, 0, 3, 0, '20030916002733');
INSERT INTO `regions` VALUES (1520, 331, '西乡县', '/28/331/', '', 3, 0, 3, 0, '20030916002756');
INSERT INTO `regions` VALUES (1521, 331, '洋县', '/28/331/', '', 3, 0, 3, 0, '20030916002767');
INSERT INTO `regions` VALUES (1522, 331, '镇巴县', '/28/331/', '', 3, 0, 3, 0, '20030916002774');
INSERT INTO `regions` VALUES (1543, 366, '策勒县', '/32/366/', '', 3, 0, 5, 0, '20030916002204');
INSERT INTO `regions` VALUES (1544, 366, '和田县', '/32/366/', '', 3, 0, 5, 0, '3000000137780047');
INSERT INTO `regions` VALUES (1545, 366, '洛浦县', '/32/366/', '', 3, 0, 5, 0, '20030916002203');
INSERT INTO `regions` VALUES (1546, 366, '民丰县', '/32/366/', '', 3, 0, 5, 0, '20030916002206');
INSERT INTO `regions` VALUES (1547, 366, '墨玉县', '/32/366/', '', 3, 0, 5, 0, '20030916002201');
INSERT INTO `regions` VALUES (1548, 366, '皮山县', '/32/366/', '', 3, 0, 5, 0, '20030916002202');
INSERT INTO `regions` VALUES (1549, 366, '于田县', '/32/366/', '', 3, 0, 5, 0, '20030916002205');
INSERT INTO `regions` VALUES (1550, 265, '巴马瑶族自治县', '/21/265/', '', 3, 0, 3, 0, '20030916001534');
INSERT INTO `regions` VALUES (1551, 265, '大化瑶族自治县', '/21/265/', '', 3, 0, 3, 0, '20030916001535');
INSERT INTO `regions` VALUES (1552, 265, '东兰县', '/21/265/', '', 3, 0, 3, 0, '20030916001536');
INSERT INTO `regions` VALUES (1553, 265, '都安瑶族自治县', '/21/265/', '', 3, 0, 3, 0, '20030916001537');
INSERT INTO `regions` VALUES (1554, 265, '凤山县', '/21/265/', '', 3, 0, 3, 0, '20030916001538');
INSERT INTO `regions` VALUES (1555, 265, '环江毛南族自治县', '/21/265/', '', 3, 0, 3, 0, '20030916001540');
INSERT INTO `regions` VALUES (1556, 265, '金城江区', '/21/265/', '', 3, 0, 2, 0, '20030916001539');
INSERT INTO `regions` VALUES (1557, 265, '罗城仫佬族自治县', '/21/265/', '', 3, 0, 3, 0, '20030916001541');
INSERT INTO `regions` VALUES (1558, 265, '南丹县', '/21/265/', '', 3, 0, 3, 0, '20030916001542');
INSERT INTO `regions` VALUES (1559, 265, '天峨县', '/21/265/', '', 3, 0, 3, 0, '20030916001543');
INSERT INTO `regions` VALUES (1560, 265, '宜州市', '/21/265/', '', 3, 0, 3, 0, '20030916001544');
INSERT INTO `regions` VALUES (1561, 246, '东源县', '/20/246/', '', 3, 0, 3, 0, '20030916000516');
INSERT INTO `regions` VALUES (1562, 246, '和平县', '/20/246/', '', 3, 0, 3, 0, '20030916000517');
INSERT INTO `regions` VALUES (1563, 246, '连平县', '/20/246/', '', 3, 0, 3, 0, '20030916000519');
INSERT INTO `regions` VALUES (1564, 246, '龙川县', '/20/246/', '', 3, 0, 3, 0, '20030916000520');
INSERT INTO `regions` VALUES (1565, 246, '源城区', '/20/246/', '', 3, 0, 2, 0, '20030916000521');
INSERT INTO `regions` VALUES (1566, 246, '紫金县', '/20/246/', '', 3, 0, 3, 0, '20030916000522');
INSERT INTO `regions` VALUES (1567, 188, '曹县', '/16/188/', '', 3, 0, 3, 0, '20030916000944');
INSERT INTO `regions` VALUES (1568, 188, '成武县', '/16/188/', '', 3, 0, 3, 0, '20030916000940');
INSERT INTO `regions` VALUES (1569, 188, '单县', '/16/188/', '', 3, 0, 3, 0, '20030916000941');
INSERT INTO `regions` VALUES (1570, 188, '定陶县', '/16/188/', '', 3, 0, 3, 0, '20030916000942');
INSERT INTO `regions` VALUES (1571, 188, '东明县', '/16/188/', '', 3, 0, 3, 0, '20030916000943');
INSERT INTO `regions` VALUES (1572, 188, '巨野县', '/16/188/', '', 3, 0, 3, 0, '20030916000945');
INSERT INTO `regions` VALUES (1573, 188, '鄄城县', '/16/188/', '', 3, 0, 3, 0, '20030916000947');
INSERT INTO `regions` VALUES (1574, 188, '牡丹区', '/16/188/', '', 3, 0, 3, 0, '20030916000939');
INSERT INTO `regions` VALUES (1575, 188, '郓城县', '/16/188/', '', 3, 0, 3, 0, '20030916000946');
INSERT INTO `regions` VALUES (1576, 264, '八步区', '/21/264/', '', 3, 0, 3, 0, '20030916001546');
INSERT INTO `regions` VALUES (1577, 264, '富川瑶族自治县', '/21/264/', '', 3, 0, 3, 0, '20030916001545');
INSERT INTO `regions` VALUES (1578, 264, '昭平县', '/21/264/', '', 3, 0, 3, 0, '20030916001547');
INSERT INTO `regions` VALUES (1579, 264, '钟山县', '/21/264/', '', 3, 0, 3, 0, '20030916001548');
INSERT INTO `regions` VALUES (1580, 194, '鹤山区', '/17/194/', '', 3, 0, 2, 0, '20030916002549');
INSERT INTO `regions` VALUES (1581, 194, '浚县', '/17/194/', '', 3, 0, 3, 0, '20030916002550');
INSERT INTO `regions` VALUES (1582, 194, '淇滨区', '/17/194/', '', 3, 0, 2, 0, '20030916002547');
INSERT INTO `regions` VALUES (1583, 194, '淇县', '/17/194/', '', 3, 0, 3, 0, '20030916002551');
INSERT INTO `regions` VALUES (1584, 194, '山城区', '/17/194/', '', 3, 0, 2, 0, '20030916002548');
INSERT INTO `regions` VALUES (1585, 100, '东山区', '/9/100/', '', 3, 0, 2, 0, '20030916000679');
INSERT INTO `regions` VALUES (1586, 100, '工农区', '/9/100/', '', 3, 0, 2, 0, '20030916000676');
INSERT INTO `regions` VALUES (1587, 100, '萝北县', '/9/100/', '', 3, 0, 3, 0, '20030916000680');
INSERT INTO `regions` VALUES (1588, 100, '南山区', '/9/100/', '', 3, 0, 2, 0, '20030916000677');
INSERT INTO `regions` VALUES (1589, 100, '绥滨县', '/9/100/', '', 3, 0, 3, 0, '20030916000681');
INSERT INTO `regions` VALUES (1590, 100, '向阳区', '/9/100/', '', 3, 0, 2, 0, '20030916000675');
INSERT INTO `regions` VALUES (1591, 100, '兴安区', '/9/100/', '', 3, 0, 2, 0, '20030916000678');
INSERT INTO `regions` VALUES (1592, 100, '兴山区', '/9/100/', '', 3, 0, 2, 0, '20030916000674');
INSERT INTO `regions` VALUES (1593, 107, '爱辉区', '/9/107/', '', 3, 0, 2, 0, '20030916000642');
INSERT INTO `regions` VALUES (1594, 107, '北安市', '/9/107/', '', 3, 0, 2, 0, '20030916000643');
INSERT INTO `regions` VALUES (1595, 107, '嫩江县', '/9/107/', '', 3, 0, 3, 0, '20030916000645');
INSERT INTO `regions` VALUES (1596, 107, '孙吴县', '/9/107/', '', 3, 0, 2, 0, '20030916000647');
INSERT INTO `regions` VALUES (1597, 107, '五大连池市', '/9/107/', '', 3, 0, 2, 0, '20030916000644');
INSERT INTO `regions` VALUES (1598, 107, '逊克县', '/9/107/', '', 3, 0, 2, 0, '20030916000646');
INSERT INTO `regions` VALUES (1599, 47, '安平县', '/4/47/', '', 3, 0, 3, 0, '20030916001750');
INSERT INTO `regions` VALUES (1600, 47, '阜城县', '/4/47/', '', 3, 0, 3, 0, '20030916001753');
INSERT INTO `regions` VALUES (1601, 47, '故城县', '/4/47/', '', 3, 0, 3, 0, '20030916001751');
INSERT INTO `regions` VALUES (1602, 47, '冀州市', '/4/47/', '', 3, 0, 3, 0, '20030916001744');
INSERT INTO `regions` VALUES (1603, 47, '景县', '/4/47/', '', 3, 0, 3, 0, '20030916001752');
INSERT INTO `regions` VALUES (1604, 47, '饶阳县', '/4/47/', '', 3, 0, 3, 0, '20030916001749');
INSERT INTO `regions` VALUES (1605, 47, '深州市', '/4/47/', '', 3, 0, 3, 0, '20030916001745');
INSERT INTO `regions` VALUES (1606, 47, '桃城区', '/4/47/', '', 3, 0, 2, 0, '20030916001743');
INSERT INTO `regions` VALUES (1607, 47, '武强县', '/4/47/', '', 3, 0, 3, 0, '20030916001748');
INSERT INTO `regions` VALUES (1608, 47, '武邑县', '/4/47/', '', 3, 0, 3, 0, '20030916001747');
INSERT INTO `regions` VALUES (1609, 47, '枣强县', '/4/47/', '', 3, 0, 3, 0, '20030916001746');
INSERT INTO `regions` VALUES (1610, 222, '常宁市', '/19/222/', '', 3, 0, 2, 0, '20030916000342');
INSERT INTO `regions` VALUES (1611, 222, '衡东县', '/19/222/', '', 3, 0, 3, 0, '20030916000347');
INSERT INTO `regions` VALUES (1612, 222, '衡南县', '/19/222/', '', 3, 0, 3, 0, '20030916000345');
INSERT INTO `regions` VALUES (1613, 222, '衡山县', '/19/222/', '', 3, 0, 3, 0, '20030916000346');
INSERT INTO `regions` VALUES (1614, 222, '衡阳县', '/19/222/', '', 3, 0, 3, 0, '20030916000344');
INSERT INTO `regions` VALUES (1615, 222, '耒阳市', '/19/222/', '', 3, 0, 2, 0, '20030916000343');
INSERT INTO `regions` VALUES (1616, 222, '南岳区', '/19/222/', '', 3, 0, 2, 0, '3000000137791446');
INSERT INTO `regions` VALUES (1617, 222, '祁东县', '/19/222/', '', 3, 0, 3, 0, '20030916000348');
INSERT INTO `regions` VALUES (1618, 222, '石鼓区', '/19/222/', '', 3, 0, 2, 0, '3000000137791222');
INSERT INTO `regions` VALUES (1619, 222, '雁峰区', '/19/222/', '', 3, 0, 2, 0, '20030916000341');
INSERT INTO `regions` VALUES (1620, 222, '蒸湘区', '/19/222/', '', 3, 0, 2, 0, '3000000137791311');
INSERT INTO `regions` VALUES (1621, 222, '珠晖区', '/19/222/', '', 3, 0, 2, 0, '3000000137791122');
INSERT INTO `regions` VALUES (1622, 311, '个旧市', '/26/311/', '', 3, 0, 2, 0, '20030916001164');
INSERT INTO `regions` VALUES (1623, 311, '河口瑶族自治县', '/26/311/', '', 3, 0, 3, 0, '20030916001175');
INSERT INTO `regions` VALUES (1624, 311, '红河县', '/26/311/', '', 3, 0, 3, 0, '20030916001173');
INSERT INTO `regions` VALUES (1625, 311, '建水县', '/26/311/', '', 3, 0, 3, 0, '20030916001168');
INSERT INTO `regions` VALUES (1626, 311, '金平苗族瑶族傣族自治县', '/26/311/', '', 3, 0, 3, 0, '20030916001174');
INSERT INTO `regions` VALUES (1627, 311, '开远市', '/26/311/', '', 3, 0, 2, 0, '20030916001165');
INSERT INTO `regions` VALUES (1628, 311, '泸西县', '/26/311/', '', 3, 0, 3, 0, '20030916001171');
INSERT INTO `regions` VALUES (1629, 311, '绿春县', '/26/311/', '', 3, 0, 3, 0, '20030916001167');
INSERT INTO `regions` VALUES (1630, 311, '蒙自县', '/26/311/', '', 3, 0, 3, 0, '20030916001166');
INSERT INTO `regions` VALUES (1631, 311, '弥勒县', '/26/311/', '', 3, 0, 3, 0, '20030916001170');
INSERT INTO `regions` VALUES (1632, 311, '屏边苗族自治县', '/26/311/', '', 3, 0, 3, 0, '20030916001176');
INSERT INTO `regions` VALUES (1633, 311, '石屏县', '/26/311/', '', 3, 0, 3, 0, '20030916001169');
INSERT INTO `regions` VALUES (1634, 311, '元阳县', '/26/311/', '', 3, 0, 3, 0, '20030916001172');
INSERT INTO `regions` VALUES (1635, 62, '和林格尔县', '/6/62/', '', 3, 0, 3, 0, '20030916001449');
INSERT INTO `regions` VALUES (1636, 62, '回民区', '/6/62/', '', 3, 0, 1, 0, '20030916001443');
INSERT INTO `regions` VALUES (1637, 62, '清水河县', '/6/62/', '', 3, 0, 4, 0, '20030916001450');
INSERT INTO `regions` VALUES (1638, 62, '赛罕区', '/6/62/', '', 3, 0, 1, 0, '20030916001446');
INSERT INTO `regions` VALUES (1639, 62, '土默特左旗', '/6/62/', '', 3, 0, 3, 0, '20030916001451');
INSERT INTO `regions` VALUES (1640, 62, '托克托县', '/6/62/', '', 3, 0, 4, 0, '20030916001447');
INSERT INTO `regions` VALUES (1641, 62, '武川县', '/6/62/', '', 3, 0, 3, 0, '20030916001448');
INSERT INTO `regions` VALUES (1642, 62, '新城区', '/6/62/', '', 3, 0, 1, 0, '20030916001444');
INSERT INTO `regions` VALUES (1643, 62, '玉泉区', '/6/62/', '', 3, 0, 1, 0, '20030916001445');
INSERT INTO `regions` VALUES (1644, 68, '阿荣旗', '/6/68/', '', 3, 0, 5, 0, '3000000019007598');
INSERT INTO `regions` VALUES (1645, 68, '陈巴尔虎旗', '/6/68/', '', 3, 0, 4, 0, '20030916000739');
INSERT INTO `regions` VALUES (1646, 68, '额尔古纳市', '/6/68/', '', 3, 0, 5, 0, '3000000019007642');
INSERT INTO `regions` VALUES (1647, 68, '鄂伦春自治旗', '/6/68/', '', 3, 0, 5, 0, '20030916000740');
INSERT INTO `regions` VALUES (1648, 68, '鄂温克族自治旗', '/6/68/', '', 3, 0, 4, 0, '20030916000741');
INSERT INTO `regions` VALUES (1649, 68, '根河市', '/6/68/', '', 3, 0, 5, 0, '3000000138111818');
INSERT INTO `regions` VALUES (1650, 68, '海拉尔区', '/6/68/', '', 3, 0, 2, 0, '3000000019007469');
INSERT INTO `regions` VALUES (1651, 68, '满洲里市', '/6/68/', '', 3, 0, 4, 0, '3000000019007512');
INSERT INTO `regions` VALUES (1652, 68, '莫力达瓦达斡尔族自治旗', '/6/68/', '', 3, 0, 5, 0, '20030916000742');
INSERT INTO `regions` VALUES (1653, 68, '新巴尔虎右旗', '/6/68/', '', 3, 0, 5, 0, '20030916000737');
INSERT INTO `regions` VALUES (1654, 68, '新巴尔虎左旗', '/6/68/', '', 3, 0, 4, 0, '20030916000738');
INSERT INTO `regions` VALUES (1655, 68, '牙克石市', '/6/68/', '', 3, 0, 3, 0, '3000000019007551');
INSERT INTO `regions` VALUES (1656, 68, '扎兰屯市', '/6/68/', '', 3, 0, 5, 0, '3000000019007619');
INSERT INTO `regions` VALUES (1662, 87, '建昌县', '/7/87/', '', 3, 0, 3, 0, '20030916001047');
INSERT INTO `regions` VALUES (1663, 87, '连山区', '/7/87/', '', 3, 0, 2, 0, '20030916001043');
INSERT INTO `regions` VALUES (1664, 87, '龙港区', '/7/87/', '', 3, 0, 2, 0, '20030916001042');
INSERT INTO `regions` VALUES (1665, 87, '南票区', '/7/87/', '', 3, 0, 2, 0, '20030916001044');
INSERT INTO `regions` VALUES (1666, 87, '绥中县', '/7/87/', '', 3, 0, 3, 0, '20030916001046');
INSERT INTO `regions` VALUES (1667, 87, '兴城市', '/7/87/', '', 3, 0, 2, 0, '20030916001045');
INSERT INTO `regions` VALUES (1668, 230, '辰溪县', '/19/230/', '', 3, 0, 3, 0, '20030916000382');
INSERT INTO `regions` VALUES (1669, 230, '鹤城区', '/19/230/', '', 3, 0, 2, 0, '20030916000379');
INSERT INTO `regions` VALUES (1670, 230, '洪江市', '/19/230/', '', 3, 0, 3, 0, '20030916000380');
INSERT INTO `regions` VALUES (1671, 230, '会同县', '/19/230/', '', 3, 0, 3, 0, '20030916000385');
INSERT INTO `regions` VALUES (1672, 230, '靖州苗族侗族自治县', '/19/230/', '', 3, 0, 3, 0, '20030916000389');
INSERT INTO `regions` VALUES (1673, 230, '麻阳苗族自治县', '/19/230/', '', 3, 0, 3, 0, '20030916000386');
INSERT INTO `regions` VALUES (1674, 230, '通道侗族自治县', '/19/230/', '', 3, 0, 3, 0, '20030916000390');
INSERT INTO `regions` VALUES (1675, 230, '新晃侗族自治县', '/19/230/', '', 3, 0, 3, 0, '20030916000387');
INSERT INTO `regions` VALUES (1676, 230, '溆浦县', '/19/230/', '', 3, 0, 3, 0, '20030916000383');
INSERT INTO `regions` VALUES (1677, 230, '沅陵县', '/19/230/', '', 3, 0, 3, 0, '20030916000381');
INSERT INTO `regions` VALUES (1678, 230, '芷江侗族自治县', '/19/230/', '', 3, 0, 3, 0, '20030916000388');
INSERT INTO `regions` VALUES (1679, 230, '中方县', '/19/230/', '', 3, 0, 3, 0, '20030916000384');
INSERT INTO `regions` VALUES (1680, 118, '楚州区', '/11/118/', '', 3, 0, 3, 0, '20030916002428');
INSERT INTO `regions` VALUES (1681, 118, '洪泽县', '/11/118/', '', 3, 0, 3, 0, '20030916002430');
INSERT INTO `regions` VALUES (1682, 118, '淮阴区', '/11/118/', '', 3, 0, 3, 0, '20030916002429');
INSERT INTO `regions` VALUES (1683, 118, '金湖县', '/11/118/', '', 3, 0, 3, 0, '20030916002432');
INSERT INTO `regions` VALUES (1684, 118, '涟水县', '/11/118/', '', 3, 0, 3, 0, '20030916002431');
INSERT INTO `regions` VALUES (1685, 118, '清河区', '/11/118/', '', 3, 0, 2, 0, '3000000137304760');
INSERT INTO `regions` VALUES (1686, 118, '清浦区', '/11/118/', '', 3, 0, 2, 0, '3000000137304792');
INSERT INTO `regions` VALUES (1687, 118, '盱眙县', '/11/118/', '', 3, 0, 3, 0, '20030916002433');
INSERT INTO `regions` VALUES (1698, 215, '红安县', '/18/215/', '', 3, 0, 3, 0, '20030916002062');
INSERT INTO `regions` VALUES (1699, 215, '黄梅县', '/18/215/', '', 3, 0, 3, 0, '20030916002067');
INSERT INTO `regions` VALUES (1700, 215, '黄州区', '/18/215/', '', 3, 0, 2, 0, '20030916002059');
INSERT INTO `regions` VALUES (1701, 215, '罗田县', '/18/215/', '', 3, 0, 3, 0, '20030916002063');
INSERT INTO `regions` VALUES (1702, 215, '麻城市', '/18/215/', '', 3, 0, 2, 0, '20030916002060');
INSERT INTO `regions` VALUES (1703, 215, '蕲春县', '/18/215/', '', 3, 0, 3, 0, '20030916002066');
INSERT INTO `regions` VALUES (1704, 215, '团风县', '/18/215/', '', 3, 0, 3, 0, '20030916002068');
INSERT INTO `regions` VALUES (1705, 215, '武穴市', '/18/215/', '', 3, 0, 2, 0, '20030916002061');
INSERT INTO `regions` VALUES (1706, 215, '浠水县', '/18/215/', '', 3, 0, 3, 0, '20030916002065');
INSERT INTO `regions` VALUES (1707, 215, '英山县', '/18/215/', '', 3, 0, 3, 0, '20030916002064');
INSERT INTO `regions` VALUES (1708, 352, '河南蒙古族自治县', '/30/352/', '', 3, 0, 5, 0, '20030916002324');
INSERT INTO `regions` VALUES (1710, 352, '尖扎县', '/30/352/', '', 3, 0, 5, 0, '20030916002322');
INSERT INTO `regions` VALUES (1711, 352, '同仁县', '/30/352/', '', 3, 0, 4, 0, '20030916002321');
INSERT INTO `regions` VALUES (1712, 352, '泽库县', '/30/352/', '', 3, 0, 3, 0, '20030916002323');
INSERT INTO `regions` VALUES (1720, 207, '大冶市', '/18/207/', '', 3, 0, 2, 0, '20030916002076');
INSERT INTO `regions` VALUES (1721, 207, '黄石港区', '/18/207/', '', 3, 0, 2, 0, '20030916002072');
INSERT INTO `regions` VALUES (1722, 207, '铁山区', '/18/207/', '', 3, 0, 2, 0, '20030916002075');
INSERT INTO `regions` VALUES (1723, 207, '西塞山区', '/18/207/', '', 3, 0, 2, 0, '20030916002073');
INSERT INTO `regions` VALUES (1724, 207, '下陆区', '/18/207/', '', 3, 0, 2, 0, '20030916002074');
INSERT INTO `regions` VALUES (1725, 207, '阳新县', '/18/207/', '', 3, 0, 3, 0, '20030916002077');
INSERT INTO `regions` VALUES (1726, 243, '博罗县', '/20/243/', '', 3, 0, 3, 0, '20030916000523');
INSERT INTO `regions` VALUES (1727, 243, '惠城区', '/20/243/', '', 3, 0, 2, 0, '20030916000524');
INSERT INTO `regions` VALUES (1728, 243, '惠东县', '/20/243/', '', 3, 0, 2, 0, '20030916000525');
INSERT INTO `regions` VALUES (1729, 243, '惠阳区', '/20/243/', '', 3, 0, 2, 0, '20030916000526');
INSERT INTO `regions` VALUES (1730, 243, '龙门县', '/20/243/', '', 3, 0, 2, 0, '20030916000528');
INSERT INTO `regions` VALUES (1731, 99, '城子河区', '/9/99/', '', 3, 0, 2, 0, '20030916000709');
INSERT INTO `regions` VALUES (1732, 99, '滴道区', '/9/99/', '', 3, 0, 2, 0, '20030916000707');
INSERT INTO `regions` VALUES (1733, 99, '恒山区', '/9/99/', '', 3, 0, 2, 0, '20030916000706');
INSERT INTO `regions` VALUES (1734, 99, '虎林市', '/9/99/', '', 3, 0, 3, 0, '20030916000711');
INSERT INTO `regions` VALUES (1735, 99, '鸡东县', '/9/99/', '', 3, 0, 3, 0, '20030916000713');
INSERT INTO `regions` VALUES (1736, 99, '鸡冠区', '/9/99/', '', 3, 0, 2, 0, '20030916000705');
INSERT INTO `regions` VALUES (1737, 99, '梨树区', '/9/99/', '', 3, 0, 2, 0, '20030916000708');
INSERT INTO `regions` VALUES (1738, 99, '麻山区', '/9/99/', '', 3, 0, 2, 0, '20030916000710');
INSERT INTO `regions` VALUES (1739, 99, '密山市', '/9/99/', '', 3, 0, 3, 0, '20030916000712');
INSERT INTO `regions` VALUES (1740, 168, '安福县', '/15/168/', '', 3, 0, 3, 0, '20030916001344');
INSERT INTO `regions` VALUES (1741, 168, '吉安县', '/15/168/', '', 3, 0, 3, 0, '3000000023545669');
INSERT INTO `regions` VALUES (1742, 168, '吉水县', '/15/168/', '', 3, 0, 3, 0, '20030916001371');
INSERT INTO `regions` VALUES (1743, 168, '吉州区', '/15/168/', '', 3, 0, 2, 0, '20030916001372');
INSERT INTO `regions` VALUES (1745, 168, '青原区', '/15/168/', '', 3, 0, 2, 0, '3000000137305264');
INSERT INTO `regions` VALUES (1746, 168, '遂川县', '/15/168/', '', 3, 0, 3, 0, '20030916001405');
INSERT INTO `regions` VALUES (1747, 168, '泰和县', '/15/168/', '', 3, 0, 3, 0, '20030916001406');
INSERT INTO `regions` VALUES (1748, 168, '万安县', '/15/168/', '', 3, 0, 3, 0, '20030916001409');
INSERT INTO `regions` VALUES (1749, 168, '峡江县', '/15/168/', '', 3, 0, 3, 0, '20030916001415');
INSERT INTO `regions` VALUES (1750, 168, '新干县', '/15/168/', '', 3, 0, 3, 0, '20030916001417');
INSERT INTO `regions` VALUES (1751, 168, '永丰县', '/15/168/', '', 3, 0, 3, 0, '20030916001429');
INSERT INTO `regions` VALUES (1752, 168, '永新县', '/15/168/', '', 3, 0, 3, 0, '20030916001430');
INSERT INTO `regions` VALUES (1753, 89, '昌邑区', '/8/89/', '', 3, 0, 2, 0, '20030916000184');
INSERT INTO `regions` VALUES (1754, 89, '船营区', '/8/89/', '', 3, 0, 2, 0, '20030916000182');
INSERT INTO `regions` VALUES (1755, 89, '丰满区', '/8/89/', '', 3, 0, 2, 0, '20030916000185');
INSERT INTO `regions` VALUES (1756, 89, '桦甸市', '/8/89/', '', 3, 0, 2, 0, '20030916000188');
INSERT INTO `regions` VALUES (1757, 89, '蛟河市', '/8/89/', '', 3, 0, 2, 0, '20030916000187');
INSERT INTO `regions` VALUES (1758, 89, '龙潭区', '/8/89/', '', 3, 0, 2, 0, '20030916000183');
INSERT INTO `regions` VALUES (1759, 89, '磐石市', '/8/89/', '', 3, 0, 2, 0, '20030916000186');
INSERT INTO `regions` VALUES (1760, 89, '舒兰市', '/8/89/', '', 3, 0, 2, 0, '20030916000189');
INSERT INTO `regions` VALUES (1761, 89, '永吉县', '/8/89/', '', 3, 0, 3, 0, '20030916000190');
INSERT INTO `regions` VALUES (1762, 172, '长清区', '/16/172/', '', 3, 0, 1, 0, '20030916000961');
INSERT INTO `regions` VALUES (1763, 172, '槐荫区', '/16/172/', '', 3, 0, 1, 0, '20030916000962');
INSERT INTO `regions` VALUES (1764, 172, '济阳县', '/16/172/', '', 3, 0, 3, 0, '20030916000963');
INSERT INTO `regions` VALUES (1765, 172, '历城区', '/16/172/', '', 3, 0, 1, 0, '20030916000964');
INSERT INTO `regions` VALUES (1766, 172, '历下区', '/16/172/', '', 3, 0, 1, 0, '20030916000965');
INSERT INTO `regions` VALUES (1767, 172, '平阴县', '/16/172/', '', 3, 0, 3, 0, '20030916000966');
INSERT INTO `regions` VALUES (1768, 172, '商河县', '/16/172/', '', 3, 0, 2, 0, '20030916000967');
INSERT INTO `regions` VALUES (1769, 172, '市中区', '/16/172/', '', 3, 0, 1, 0, '20030916000968');
INSERT INTO `regions` VALUES (1770, 172, '天桥区', '/16/172/', '', 3, 0, 1, 0, '20030916000969');
INSERT INTO `regions` VALUES (1771, 172, '章丘市', '/16/172/', '', 3, 0, 2, 0, '20030916000970');
INSERT INTO `regions` VALUES (1772, 179, '嘉祥县', '/16/179/', '', 3, 0, 3, 0, '20030916000929');
INSERT INTO `regions` VALUES (1773, 179, '金乡县', '/16/179/', '', 3, 0, 3, 0, '20030916000930');
INSERT INTO `regions` VALUES (1774, 179, '梁山县', '/16/179/', '', 3, 0, 3, 0, '20030916000931');
INSERT INTO `regions` VALUES (1775, 179, '曲阜市', '/16/179/', '', 3, 0, 2, 0, '20030916000932');
INSERT INTO `regions` VALUES (1776, 179, '任城区', '/16/179/', '', 3, 0, 1, 0, '20030916000928');
INSERT INTO `regions` VALUES (1777, 179, '市中区', '/16/179/', '', 3, 0, 2, 0, '3000000137304221');
INSERT INTO `regions` VALUES (1778, 179, '泗水县', '/16/179/', '', 3, 0, 2, 0, '20030916000938');
INSERT INTO `regions` VALUES (1779, 179, '微山县', '/16/179/', '', 3, 0, 2, 0, '20030916000933');
INSERT INTO `regions` VALUES (1780, 179, '汶上县', '/16/179/', '', 3, 0, 3, 0, '20030916000937');
INSERT INTO `regions` VALUES (1781, 179, '兖州市', '/16/179/', '', 3, 0, 2, 0, '20030916000936');
INSERT INTO `regions` VALUES (1782, 179, '鱼台县', '/16/179/', '', 3, 0, 3, 0, '20030916000934');
INSERT INTO `regions` VALUES (1783, 179, '邹城市', '/16/179/', '', 3, 0, 2, 0, '20030916000935');
INSERT INTO `regions` VALUES (1784, 193, '济源市', '/17/193/', '', 3, 0, 2, 0, '20030916002649');
INSERT INTO `regions` VALUES (1785, 104, '东风区', '/9/104/', '', 3, 0, 2, 0, '20030916000685');
INSERT INTO `regions` VALUES (1786, 104, '抚远县', '/9/104/', '', 3, 0, 3, 0, '20030916000692');
INSERT INTO `regions` VALUES (1787, 104, '富锦市', '/9/104/', '', 3, 0, 3, 0, '20030916000688');
INSERT INTO `regions` VALUES (1788, 104, '桦川县', '/9/104/', '', 3, 0, 2, 0, '20030916000690');
INSERT INTO `regions` VALUES (1789, 104, '桦南县', '/9/104/', '', 3, 0, 3, 0, '20030916000689');
INSERT INTO `regions` VALUES (1790, 104, '郊区', '/9/104/', '', 3, 0, 2, 0, '20030916000686');
INSERT INTO `regions` VALUES (1791, 104, '前进区', '/9/104/', '', 3, 0, 2, 0, '20030916000682');
INSERT INTO `regions` VALUES (1792, 104, '汤原县', '/9/104/', '', 3, 0, 3, 0, '20030916000691');
INSERT INTO `regions` VALUES (1793, 104, '同江市', '/9/104/', '', 3, 0, 2, 0, '20030916000687');
INSERT INTO `regions` VALUES (1794, 104, '向阳区', '/9/104/', '', 3, 0, 2, 0, '20030916000684');
INSERT INTO `regions` VALUES (1795, 104, '永红区', '/9/104/', '', 3, 0, 3, 0, '20030916000683');
INSERT INTO `regions` VALUES (1803, 336, '嘉峪关市', '/29/336/', '', 3, 0, 2, 0, '20030916001221');
INSERT INTO `regions` VALUES (1804, 239, '恩平市', '/20/239/', '', 3, 0, 2, 0, '20030916000529');
INSERT INTO `regions` VALUES (1805, 239, '鹤山市', '/20/239/', '', 3, 0, 3, 0, '20030916000530');
INSERT INTO `regions` VALUES (1806, 239, '江海区', '/20/239/', '', 3, 0, 2, 0, '20030916000531');
INSERT INTO `regions` VALUES (1807, 239, '开平市', '/20/239/', '', 3, 0, 2, 0, '20030916000533');
INSERT INTO `regions` VALUES (1808, 239, '蓬江区', '/20/239/', '', 3, 0, 2, 0, '20030916000534');
INSERT INTO `regions` VALUES (1809, 239, '台山市', '/20/239/', '', 3, 0, 2, 0, '20030916000535');
INSERT INTO `regions` VALUES (1811, 193, '博爱县', '/17/193/', '', 3, 0, 3, 0, '20030916002532');
INSERT INTO `regions` VALUES (1812, 193, '解放区', '/17/193/', '', 3, 0, 2, 0, '20030916002526');
INSERT INTO `regions` VALUES (1813, 193, '马村区', '/17/193/', '', 3, 0, 2, 0, '20030916002528');
INSERT INTO `regions` VALUES (1814, 193, '孟州市', '/17/193/', '', 3, 0, 2, 0, '20030916002529');
INSERT INTO `regions` VALUES (1815, 193, '沁阳市', '/17/193/', '', 3, 0, 2, 0, '20030916002530');
INSERT INTO `regions` VALUES (1816, 193, '山阳区', '/17/193/', '', 3, 0, 2, 0, '20030916002525');
INSERT INTO `regions` VALUES (1817, 193, '温县', '/17/193/', '', 3, 0, 3, 0, '20030916002534');
INSERT INTO `regions` VALUES (1818, 193, '武陟县', '/17/193/', '', 3, 0, 3, 0, '20030916002533');
INSERT INTO `regions` VALUES (1819, 193, '修武县', '/17/193/', '', 3, 0, 3, 0, '20030916002531');
INSERT INTO `regions` VALUES (1820, 193, '中站区', '/17/193/', '', 3, 0, 2, 0, '20030916002527');
INSERT INTO `regions` VALUES (1821, 252, '惠来县', '/20/252/', '', 3, 0, 3, 0, '20030916000537');
INSERT INTO `regions` VALUES (1822, 252, '揭东县', '/20/252/', '', 3, 0, 3, 0, '20030916000538');
INSERT INTO `regions` VALUES (1823, 252, '揭西县', '/20/252/', '', 3, 0, 3, 0, '20030916000539');
INSERT INTO `regions` VALUES (1824, 252, '普宁市', '/20/252/', '', 3, 0, 2, 0, 'GDADD00000000004');
INSERT INTO `regions` VALUES (1825, 252, '榕城区', '/20/252/', '', 3, 0, 2, 0, '20030916000542');
INSERT INTO `regions` VALUES (1826, 337, '金川区', '/29/337/', '', 3, 0, 2, 0, '20030916001223');
INSERT INTO `regions` VALUES (1827, 337, '永昌县', '/29/337/', '', 3, 0, 3, 0, '20030916001224');
INSERT INTO `regions` VALUES (1837, 80, '北宁市', '/7/80/', '', 3, 0, 4, 0, '20030916001039');
INSERT INTO `regions` VALUES (1838, 80, '古塔区', '/7/80/', '', 3, 0, 1, 0, '20030916001036');
INSERT INTO `regions` VALUES (1839, 80, '黑山县', '/7/80/', '', 3, 0, 4, 0, '20030916001040');
INSERT INTO `regions` VALUES (1840, 80, '凌海市', '/7/80/', '', 3, 0, 4, 0, '20030916001038');
INSERT INTO `regions` VALUES (1841, 80, '凌河区', '/7/80/', '', 3, 0, 1, 0, '20030916001037');
INSERT INTO `regions` VALUES (1842, 80, '太和区', '/7/80/', '', 3, 0, 1, 0, '20030916001035');
INSERT INTO `regions` VALUES (1843, 80, '义县', '/7/80/', '', 3, 0, 4, 0, '20030916001041');
INSERT INTO `regions` VALUES (1844, 52, '城区', '/5/52/', '', 3, 0, 2, 0, '20030916001976');
INSERT INTO `regions` VALUES (1845, 52, '高平市', '/5/52/', '', 3, 0, 2, 0, '20030916001977');
INSERT INTO `regions` VALUES (1846, 52, '陵川县', '/5/52/', '', 3, 0, 3, 0, '20030916001981');
INSERT INTO `regions` VALUES (1847, 52, '沁水县', '/5/52/', '', 3, 0, 3, 0, '20030916001979');
INSERT INTO `regions` VALUES (1848, 52, '阳城县', '/5/52/', '', 3, 0, 2, 0, '20030916001980');
INSERT INTO `regions` VALUES (1849, 52, '泽州县', '/5/52/', '', 3, 0, 3, 0, '20030916001978');
INSERT INTO `regions` VALUES (1850, 54, '和顺县', '/5/54/', '', 3, 0, 3, 0, '20030916002000');
INSERT INTO `regions` VALUES (1851, 54, '介休市', '/5/54/', '', 3, 0, 2, 0, '20030916001997');
INSERT INTO `regions` VALUES (1852, 54, '灵石县', '/5/54/', '', 3, 0, 3, 0, '20030916002006');
INSERT INTO `regions` VALUES (1853, 54, '平遥县', '/5/54/', '', 3, 0, 3, 0, '20030916002005');
INSERT INTO `regions` VALUES (1854, 54, '祁县', '/5/54/', '', 3, 0, 3, 0, '20030916002004');
INSERT INTO `regions` VALUES (1855, 54, '寿阳县', '/5/54/', '', 3, 0, 3, 0, '20030916002002');
INSERT INTO `regions` VALUES (1856, 54, '太谷县', '/5/54/', '', 3, 0, 3, 0, '20030916002003');
INSERT INTO `regions` VALUES (1857, 54, '昔阳县', '/5/54/', '', 3, 0, 3, 0, '20030916002001');
INSERT INTO `regions` VALUES (1858, 54, '榆次区', '/5/54/', '', 3, 0, 2, 0, '20030916001996');
INSERT INTO `regions` VALUES (1859, 54, '榆社县', '/5/54/', '', 3, 0, 3, 0, '20030916001998');
INSERT INTO `regions` VALUES (1860, 54, '左权县', '/5/54/', '', 3, 0, 3, 0, '20030916001999');
INSERT INTO `regions` VALUES (1861, 212, '东宝区', '/18/212/', '', 3, 0, 2, 0, '20030916002156');
INSERT INTO `regions` VALUES (1862, 212, '掇刀区', '/18/212/', '', 3, 0, 2, 0, '20030916002157');
INSERT INTO `regions` VALUES (1863, 212, '京山县', '/18/212/', '', 3, 0, 3, 0, '20030916002051');
INSERT INTO `regions` VALUES (1864, 212, '沙洋县', '/18/212/', '', 3, 0, 3, 0, '20030916002159');
INSERT INTO `regions` VALUES (1865, 212, '钟祥市', '/18/212/', '', 3, 0, 2, 0, '20030916002158');
INSERT INTO `regions` VALUES (1866, 210, '公安县', '/18/210/', '', 3, 0, 3, 0, '20030916002090');
INSERT INTO `regions` VALUES (1867, 210, '洪湖市', '/18/210/', '', 3, 0, 2, 0, '20030916002087');
INSERT INTO `regions` VALUES (1868, 210, '监利县', '/18/210/', '', 3, 0, 3, 0, '20030916002091');
INSERT INTO `regions` VALUES (1869, 210, '江陵县', '/18/210/', '', 3, 0, 3, 0, '20030916002089');
INSERT INTO `regions` VALUES (1870, 210, '荆州区', '/18/210/', '', 3, 0, 2, 0, '20030916002085');
INSERT INTO `regions` VALUES (1871, 210, '沙市区', '/18/210/', '', 3, 0, 2, 0, '20030916002084');
INSERT INTO `regions` VALUES (1872, 210, '石首市', '/18/210/', '', 3, 0, 2, 0, '20030916002086');
INSERT INTO `regions` VALUES (1873, 210, '松滋市', '/18/210/', '', 3, 0, 3, 0, '20030916002088');
INSERT INTO `regions` VALUES (1874, 162, '昌江区', '/15/162/', '', 3, 0, 2, 0, '20030916001349');
INSERT INTO `regions` VALUES (1875, 162, '浮梁县', '/15/162/', '', 3, 0, 3, 0, '20030916001362');
INSERT INTO `regions` VALUES (1876, 162, '乐平市', '/15/162/', '', 3, 0, 2, 0, '20030916001379');
INSERT INTO `regions` VALUES (1877, 162, '珠山区', '/15/162/', '', 3, 0, 2, 0, '20030916001441');
INSERT INTO `regions` VALUES (1878, 164, '德安县', '/15/164/', '', 3, 0, 2, 0, '20030916001353');
INSERT INTO `regions` VALUES (1879, 164, '都昌县', '/15/164/', '', 3, 0, 3, 0, '20030916001358');
INSERT INTO `regions` VALUES (1880, 164, '湖口县', '/15/164/', '', 3, 0, 3, 0, '20030916001369');
INSERT INTO `regions` VALUES (1881, 164, '九江县', '/15/164/', '', 3, 0, 3, 0, '20030916001377');
INSERT INTO `regions` VALUES (1882, 164, '庐山区', '/15/164/', '', 3, 0, 2, 0, '20030916001384');
INSERT INTO `regions` VALUES (1883, 164, '彭泽县', '/15/164/', '', 3, 0, 3, 0, '20030916001392');
INSERT INTO `regions` VALUES (1884, 164, '瑞昌市', '/15/164/', '', 3, 0, 2, 0, '20030916001399');
INSERT INTO `regions` VALUES (1885, 164, '武宁县', '/15/164/', '', 3, 0, 3, 0, '20030916001412');
INSERT INTO `regions` VALUES (1886, 164, '星子县', '/15/164/', '', 3, 0, 3, 0, '20030916001422');
INSERT INTO `regions` VALUES (1887, 164, '修水县', '/15/164/', '', 3, 0, 3, 0, '20030916001423');
INSERT INTO `regions` VALUES (1888, 164, '浔阳区', '/15/164/', '', 3, 0, 2, 0, '20030916001425');
INSERT INTO `regions` VALUES (1889, 164, '永修县', '/15/164/', '', 3, 0, 3, 0, '20030916001431');
INSERT INTO `regions` VALUES (1890, 343, '阿克塞哈萨克族自治县', '/29/343/', '', 3, 0, 4, 0, '20030916001247');
INSERT INTO `regions` VALUES (1891, 343, '安西县', '/29/343/', '', 3, 0, 4, 0, '20030916001245');
INSERT INTO `regions` VALUES (1892, 343, '敦煌市', '/29/343/', '', 3, 0, 4, 0, '20030916001243');
INSERT INTO `regions` VALUES (1893, 343, '金塔县', '/29/343/', '', 3, 0, 5, 0, '20030916001244');
INSERT INTO `regions` VALUES (1894, 343, '肃北蒙古族自治县', '/29/343/', '', 3, 0, 5, 0, '20030916001246');
INSERT INTO `regions` VALUES (1895, 343, '肃州区', '/29/343/', '', 3, 0, 3, 0, '20030916001241');
INSERT INTO `regions` VALUES (1896, 343, '玉门市', '/29/343/', '', 3, 0, 2, 0, '20030916001242');
INSERT INTO `regions` VALUES (1897, 368, '巴楚县', '/32/368/', '', 3, 0, 3, 0, '20030916002189');
INSERT INTO `regions` VALUES (1898, 368, '伽师县', '/32/368/', '', 3, 0, 3, 0, '20030916002188');
INSERT INTO `regions` VALUES (1899, 368, '喀什市', '/32/368/', '', 3, 0, 3, 0, '20030916002179');
INSERT INTO `regions` VALUES (1900, 368, '麦盖提县', '/32/368/', '', 3, 0, 3, 0, '20030916002186');
INSERT INTO `regions` VALUES (1901, 368, '莎车县', '/32/368/', '', 3, 0, 3, 0, '20030916002184');
INSERT INTO `regions` VALUES (1902, 368, '疏附县', '/32/368/', '', 3, 0, 3, 0, '20030916002180');
INSERT INTO `regions` VALUES (1903, 368, '疏勒县', '/32/368/', '', 3, 0, 3, 0, '20030916002181');
INSERT INTO `regions` VALUES (1904, 368, '塔什库尔干塔吉克自治县', '/32/368/', '', 3, 0, 3, 0, '20030916002190');
INSERT INTO `regions` VALUES (1905, 368, '叶城县', '/32/368/', '', 3, 0, 3, 0, '20030916002185');
INSERT INTO `regions` VALUES (1906, 368, '英吉沙县', '/32/368/', '', 3, 0, 3, 0, '20030916002182');
INSERT INTO `regions` VALUES (1907, 368, '岳普湖县', '/32/368/', '', 3, 0, 3, 0, '20030916002187');
INSERT INTO `regions` VALUES (1908, 368, '泽普县', '/32/368/', '', 3, 0, 3, 0, '20030916002183');
INSERT INTO `regions` VALUES (1909, 190, '鼓楼区', '/17/190/', '', 3, 0, 2, 0, '20030916002567');
INSERT INTO `regions` VALUES (1910, 190, '金明区', '/17/190/', '', 3, 0, 3, 0, '20030916002571');
INSERT INTO `regions` VALUES (1911, 190, '开封县', '/17/190/', '', 3, 0, 3, 0, '20030916002575');
INSERT INTO `regions` VALUES (1912, 190, '兰考县', '/17/190/', '', 3, 0, 3, 0, '20030916002576');
INSERT INTO `regions` VALUES (1913, 190, '龙亭区', '/17/190/', '', 3, 0, 2, 0, '20030916002568');
INSERT INTO `regions` VALUES (1914, 190, '杞县', '/17/190/', '', 3, 0, 3, 0, '20030916002572');
INSERT INTO `regions` VALUES (1915, 190, '顺河回族区', '/17/190/', '', 3, 0, 2, 0, '20030916002569');
INSERT INTO `regions` VALUES (1916, 190, '通许县', '/17/190/', '', 3, 0, 3, 0, '20030916002573');
INSERT INTO `regions` VALUES (1917, 190, '尉氏县', '/17/190/', '', 3, 0, 3, 0, '20030916002574');
INSERT INTO `regions` VALUES (1918, 190, '禹王台区', '/17/190/', '', 3, 0, 2, 0, '20030916002570');
INSERT INTO `regions` VALUES (1919, 363, '白碱滩区', '/32/363/', '', 3, 0, 3, 0, '20030916002173');
INSERT INTO `regions` VALUES (1920, 363, '独山子区', '/32/363/', '', 3, 0, 3, 0, '20030916002172');
INSERT INTO `regions` VALUES (1921, 363, '克拉玛依区', '/32/363/', '', 3, 0, 3, 0, '20030916002171');
INSERT INTO `regions` VALUES (1922, 363, '乌尔禾区', '/32/363/', '', 3, 0, 3, 0, '20030916002174');
INSERT INTO `regions` VALUES (1923, 369, '阿合奇县', '/32/369/', '', 3, 0, 3, 0, '20030916002215');
INSERT INTO `regions` VALUES (1924, 369, '阿克陶县', '/32/369/', '', 3, 0, 3, 0, '20030916002214');
INSERT INTO `regions` VALUES (1925, 369, '阿图什市', '/32/369/', '', 3, 0, 3, 0, '20030916002213');
INSERT INTO `regions` VALUES (1926, 369, '乌恰县', '/32/369/', '', 3, 0, 3, 0, '20030916002216');
INSERT INTO `regions` VALUES (1927, 302, '安宁市', '/26/302/', '', 3, 0, 3, 0, '20030916001066');
INSERT INTO `regions` VALUES (1928, 302, '呈贡县', '/26/302/', '', 3, 0, 3, 0, '20030916001067');
INSERT INTO `regions` VALUES (1929, 302, '东川区', '/26/302/', '', 3, 0, 1, 0, '20030916001065');
INSERT INTO `regions` VALUES (1930, 302, '富民县', '/26/302/', '', 3, 0, 3, 0, '20030916001069');
INSERT INTO `regions` VALUES (1931, 302, '官渡区', '/26/302/', '', 3, 0, 1, 0, '20030916001063');
INSERT INTO `regions` VALUES (1932, 302, '晋宁县', '/26/302/', '', 3, 0, 3, 0, '20030916001068');
INSERT INTO `regions` VALUES (1933, 302, '禄劝彝族苗族自治县', '/26/302/', '', 3, 0, 3, 0, '20030916001073');
INSERT INTO `regions` VALUES (1934, 302, '盘龙区', '/26/302/', '', 3, 0, 1, 0, '20030916001061');
INSERT INTO `regions` VALUES (1935, 302, '石林彝族自治县', '/26/302/', '', 3, 0, 3, 0, '20030916001072');
INSERT INTO `regions` VALUES (1936, 302, '嵩明县', '/26/302/', '', 3, 0, 3, 0, '20030916001071');
INSERT INTO `regions` VALUES (1937, 302, '五华区', '/26/302/', '', 3, 0, 1, 0, '20030916001062');
INSERT INTO `regions` VALUES (1938, 302, '西山区', '/26/302/', '', 3, 0, 1, 0, '20030916001064');
INSERT INTO `regions` VALUES (1939, 302, '寻甸回族彝族自治县', '/26/302/', '', 3, 0, 3, 0, '20030916001074');
INSERT INTO `regions` VALUES (1940, 302, '宜良县', '/26/302/', '', 3, 0, 3, 0, '20030916001070');
INSERT INTO `regions` VALUES (1941, 318, '城关区', '/27/318/', '', 3, 0, 1, 0, '20030916002343');
INSERT INTO `regions` VALUES (1942, 318, '达孜县', '/27/318/', '', 3, 0, 6, 0, '20030916002349');
INSERT INTO `regions` VALUES (1943, 318, '当雄县', '/27/318/', '', 3, 0, 6, 0, '20030916002345');
INSERT INTO `regions` VALUES (1944, 318, '堆龙德庆县', '/27/318/', '', 3, 0, 6, 0, '20030916002348');
INSERT INTO `regions` VALUES (1945, 318, '林周县', '/27/318/', '', 3, 0, 6, 0, '20030916002344');
INSERT INTO `regions` VALUES (1946, 318, '墨竹工卡县', '/27/318/', '', 3, 0, 6, 0, '20030916002350');
INSERT INTO `regions` VALUES (1947, 318, '尼木县', '/27/318/', '', 3, 0, 6, 0, '20030916002346');
INSERT INTO `regions` VALUES (1948, 318, '曲水县', '/27/318/', '', 3, 0, 6, 0, '20030916002347');
INSERT INTO `regions` VALUES (1949, 266, '合山市', '/21/266/', '', 3, 0, 3, 0, '20030916001533');
INSERT INTO `regions` VALUES (1950, 266, '金秀瑶族自治县', '/21/266/', '', 3, 0, 3, 0, '20030916001549');
INSERT INTO `regions` VALUES (1951, 266, '武宣县', '/21/266/', '', 3, 0, 3, 0, '20030916001557');
INSERT INTO `regions` VALUES (1952, 266, '象州县', '/21/266/', '', 3, 0, 3, 0, '20030916001558');
INSERT INTO `regions` VALUES (1953, 266, '忻城县', '/21/266/', '', 3, 0, 3, 0, '20030916001559');
INSERT INTO `regions` VALUES (1954, 266, '兴宾区', '/21/266/', '', 3, 0, 3, 0, '20030916001550');
INSERT INTO `regions` VALUES (1955, 183, '钢城区', '/16/183/', '', 3, 0, 2, 0, '20030916001007');
INSERT INTO `regions` VALUES (1956, 183, '莱城区', '/16/183/', '', 3, 0, 2, 0, '20030916001008');
INSERT INTO `regions` VALUES (1957, 335, '安宁区', '/29/335/', '', 3, 0, 1, 0, '20030916001216');
INSERT INTO `regions` VALUES (1958, 335, '城关区', '/29/335/', '', 3, 0, 1, 0, '20030916001213');
INSERT INTO `regions` VALUES (1959, 335, '皋兰县', '/29/335/', '', 3, 0, 3, 0, '20030916001219');
INSERT INTO `regions` VALUES (1960, 335, '红古区', '/29/335/', '', 3, 0, 1, 0, '20030916001217');
INSERT INTO `regions` VALUES (1961, 335, '七里河区', '/29/335/', '', 3, 0, 1, 0, '20030916001214');
INSERT INTO `regions` VALUES (1962, 335, '西固区', '/29/335/', '', 3, 0, 1, 0, '20030916001215');
INSERT INTO `regions` VALUES (1963, 335, '永登县', '/29/335/', '', 3, 0, 3, 0, '20030916001218');
INSERT INTO `regions` VALUES (1964, 335, '榆中县', '/29/335/', '', 3, 0, 3, 0, '20030916001220');
INSERT INTO `regions` VALUES (1965, 46, '安次区', '/4/46/', '', 3, 0, 2, 0, '20030916001871');
INSERT INTO `regions` VALUES (1966, 46, '霸州市', '/4/46/', '', 3, 0, 3, 0, '20030916001873');
INSERT INTO `regions` VALUES (1967, 46, '大厂回族自治县', '/4/46/', '', 3, 0, 3, 0, '20030916001880');
INSERT INTO `regions` VALUES (1968, 46, '大城县', '/4/46/', '', 3, 0, 3, 0, '20030916001878');
INSERT INTO `regions` VALUES (1969, 46, '固安县', '/4/46/', '', 3, 0, 3, 0, '20030916001875');
INSERT INTO `regions` VALUES (1970, 46, '广阳区', '/4/46/', '', 3, 0, 2, 0, '20030916001872');
INSERT INTO `regions` VALUES (1971, 46, '三河市', '/4/46/', '', 3, 0, 3, 0, '20030916001881');
INSERT INTO `regions` VALUES (1972, 46, '文安县', '/4/46/', '', 3, 0, 3, 0, '20030916001879');
INSERT INTO `regions` VALUES (1973, 46, '香河县', '/4/46/', '', 3, 0, 3, 0, '20030916001877');
INSERT INTO `regions` VALUES (1974, 46, '永清县', '/4/46/', '', 3, 0, 3, 0, '20030916001876');
INSERT INTO `regions` VALUES (1975, 281, '峨边彝族自治县', '/24/281/', '', 3, 0, 5, 0, '20030916000095');
INSERT INTO `regions` VALUES (1976, 281, '峨眉山市', '/24/281/', '', 3, 0, 3, 0, '20030916000090');
INSERT INTO `regions` VALUES (1977, 281, '夹江县', '/24/281/', '', 3, 0, 4, 0, '20030916000093');
INSERT INTO `regions` VALUES (1978, 281, '犍为县', '/24/281/', '', 3, 0, 4, 0, '20030916000091');
INSERT INTO `regions` VALUES (1979, 281, '金口河区', '/24/281/', '', 3, 0, 4, 0, '20030916000089');
INSERT INTO `regions` VALUES (1980, 281, '井研县', '/24/281/', '', 3, 0, 4, 0, '20030916000092');
INSERT INTO `regions` VALUES (1981, 281, '马边彝族自治县', '/24/281/', '', 3, 0, 4, 0, '20030916000096');
INSERT INTO `regions` VALUES (1982, 281, '沐川县', '/24/281/', '', 3, 0, 4, 0, '20030916000094');
INSERT INTO `regions` VALUES (1983, 281, '沙湾区', '/24/281/', '', 3, 0, 3, 0, '20030916000087');
INSERT INTO `regions` VALUES (1984, 281, '市中区', '/24/281/', '', 3, 0, 2, 0, '20030916000086');
INSERT INTO `regions` VALUES (1985, 281, '五通桥区', '/24/281/', '', 3, 0, 3, 0, '20030916000088');
INSERT INTO `regions` VALUES (1986, 307, '古城区', '/26/307/', '', 3, 0, 2, 0, '20030916001107');
INSERT INTO `regions` VALUES (1987, 307, '华坪县', '/26/307/', '', 3, 0, 3, 0, '20030916001109');
INSERT INTO `regions` VALUES (1988, 307, '宁蒗彝族自治县', '/26/307/', '', 3, 0, 3, 0, '20030916001111');
INSERT INTO `regions` VALUES (1989, 307, '永胜县', '/26/307/', '', 3, 0, 3, 0, '20030916001108');
INSERT INTO `regions` VALUES (1990, 307, '玉龙纳西族自治县', '/26/307/', '', 3, 0, 3, 0, '20030916001110');
INSERT INTO `regions` VALUES (2000, 117, '东海县', '/11/117/', '', 3, 0, 3, 0, '20030916002427');
INSERT INTO `regions` VALUES (2001, 117, '赣榆县', '/11/117/', '', 3, 0, 3, 0, '20030916002426');
INSERT INTO `regions` VALUES (2002, 117, '灌南县', '/11/117/', '', 3, 0, 3, 0, '20030916002425');
INSERT INTO `regions` VALUES (2003, 117, '灌云县', '/11/117/', '', 3, 0, 3, 0, '20030916002424');
INSERT INTO `regions` VALUES (2004, 117, '海州区', '/11/117/', '', 3, 0, 2, 0, '20030916002423');
INSERT INTO `regions` VALUES (2005, 117, '连云区', '/11/117/', '', 3, 0, 2, 0, '3000000137305044');
INSERT INTO `regions` VALUES (2006, 117, '新浦区', '/11/117/', '', 3, 0, 2, 0, '3000000137304989');
INSERT INTO `regions` VALUES (2007, 292, '布拖县', '/24/292/', '', 3, 0, 3, 0, '20030916001194');
INSERT INTO `regions` VALUES (2008, 292, '德昌县', '/24/292/', '', 3, 0, 3, 0, '20030916001191');
INSERT INTO `regions` VALUES (2009, 292, '甘洛县', '/24/292/', '', 3, 0, 3, 0, '20030916001200');
INSERT INTO `regions` VALUES (2010, 292, '会东县', '/24/292/', '', 3, 0, 3, 0, '20030916001211');
INSERT INTO `regions` VALUES (2011, 292, '会理县', '/24/292/', '', 3, 0, 2, 0, '20030916001210');
INSERT INTO `regions` VALUES (2012, 292, '金阳县', '/24/292/', '', 3, 0, 3, 0, '20030916001195');
INSERT INTO `regions` VALUES (2013, 292, '雷波县', '/24/292/', '', 3, 0, 3, 0, '20030916001202');
INSERT INTO `regions` VALUES (2014, 292, '美姑县', '/24/292/', '', 3, 0, 3, 0, '20030916001201');
INSERT INTO `regions` VALUES (2015, 292, '冕宁县', '/24/292/', '', 3, 0, 3, 0, '20030916001198');
INSERT INTO `regions` VALUES (2016, 292, '木里藏族自治县', '/24/292/', '', 3, 0, 3, 0, '20030916001203');
INSERT INTO `regions` VALUES (2017, 292, '宁南县', '/24/292/', '', 3, 0, 3, 0, '20030916001192');
INSERT INTO `regions` VALUES (2018, 292, '普格县', '/24/292/', '', 3, 0, 3, 0, '20030916001193');
INSERT INTO `regions` VALUES (2019, 292, '西昌市', '/24/292/', '', 3, 0, 3, 0, '20030916001189');
INSERT INTO `regions` VALUES (2020, 292, '喜德县', '/24/292/', '', 3, 0, 3, 0, '20030916001197');
INSERT INTO `regions` VALUES (2021, 292, '盐源县', '/24/292/', '', 3, 0, 3, 0, '20030916001190');
INSERT INTO `regions` VALUES (2022, 292, '越西县', '/24/292/', '', 3, 0, 3, 0, '20030916001199');
INSERT INTO `regions` VALUES (2023, 292, '昭觉县', '/24/292/', '', 3, 0, 3, 0, '20030916001196');
INSERT INTO `regions` VALUES (2024, 83, '白塔区', '/7/83/', '', 3, 0, 2, 0, '20030916001825');
INSERT INTO `regions` VALUES (2025, 83, '灯塔市', '/7/83/', '', 3, 0, 2, 0, '20030916001831');
INSERT INTO `regions` VALUES (2026, 83, '弓长岭区', '/7/83/', '', 3, 0, 2, 0, '20030916001827');
INSERT INTO `regions` VALUES (2027, 83, '宏伟区', '/7/83/', '', 3, 0, 2, 0, '20030916001830');
INSERT INTO `regions` VALUES (2028, 83, '辽阳县', '/7/83/', '', 3, 0, 3, 0, '20030916001829');
INSERT INTO `regions` VALUES (2029, 83, '太子河区', '/7/83/', '', 3, 0, 2, 0, '20030916001828');
INSERT INTO `regions` VALUES (2030, 83, '文圣区', '/7/83/', '', 3, 0, 2, 0, '20030916001826');
INSERT INTO `regions` VALUES (2031, 91, '东丰县', '/8/91/', '', 3, 0, 3, 0, '20030916000199');
INSERT INTO `regions` VALUES (2032, 91, '东辽县', '/8/91/', '', 3, 0, 3, 0, '20030916000200');
INSERT INTO `regions` VALUES (2033, 91, '龙山区', '/8/91/', '', 3, 0, 2, 0, '20030916000197');
INSERT INTO `regions` VALUES (2034, 91, '西安区', '/8/91/', '', 3, 0, 2, 0, '20030916000198');
INSERT INTO `regions` VALUES (2035, 186, '茌平县', '/16/186/', '', 3, 0, 3, 0, '20030916001009');
INSERT INTO `regions` VALUES (2036, 186, '东阿县', '/16/186/', '', 3, 0, 3, 0, '20030916001010');
INSERT INTO `regions` VALUES (2037, 186, '东昌府区', '/16/186/', '', 3, 0, 3, 0, '20030916001013');
INSERT INTO `regions` VALUES (2038, 186, '高唐县', '/16/186/', '', 3, 0, 2, 0, '20030916001011');
INSERT INTO `regions` VALUES (2039, 186, '冠县', '/16/186/', '', 3, 0, 3, 0, '20030916001012');
INSERT INTO `regions` VALUES (2040, 186, '临清市', '/16/186/', '', 3, 0, 3, 0, '20030916001014');
INSERT INTO `regions` VALUES (2041, 186, '莘县', '/16/186/', '', 3, 0, 3, 0, '20030916001015');
INSERT INTO `regions` VALUES (2042, 186, '阳谷县', '/16/186/', '', 3, 0, 3, 0, '20030916001016');
INSERT INTO `regions` VALUES (2043, 324, '波密县', '/27/324/', '', 3, 0, 6, 0, '20030916002376');
INSERT INTO `regions` VALUES (2044, 324, '察隅县', '/27/324/', '', 3, 0, 6, 0, '20030916002377');
INSERT INTO `regions` VALUES (2045, 324, '工布江达县', '/27/324/', '', 3, 0, 6, 0, '20030916002373');
INSERT INTO `regions` VALUES (2046, 324, '朗县', '/27/324/', '', 3, 0, 6, 0, '20030916002378');
INSERT INTO `regions` VALUES (2048, 324, '米林县', '/27/324/', '', 3, 0, 6, 0, '20030916002374');
INSERT INTO `regions` VALUES (2049, 324, '墨脱县', '/27/324/', '', 3, 0, 6, 0, '20030916002375');
INSERT INTO `regions` VALUES (2050, 309, '沧源佤族自治县', '/26/309/', '', 3, 0, 3, 0, '20030916001129');
INSERT INTO `regions` VALUES (2051, 309, '凤庆县', '/26/309/', '', 3, 0, 3, 0, '20030916001123');
INSERT INTO `regions` VALUES (2052, 309, '耿马傣族佤族自治县', '/26/309/', '', 3, 0, 3, 0, '20030916001128');
INSERT INTO `regions` VALUES (2053, 309, '临翔区', '/26/309/', '', 3, 0, 2, 0, '20030916001122');
INSERT INTO `regions` VALUES (2054, 309, '双江拉祜族佤族布朗族傣族自治县', '/26/309/', '', 3, 0, 3, 0, '20030916001127');
INSERT INTO `regions` VALUES (2055, 309, '永德县', '/26/309/', '', 3, 0, 3, 0, '20030916001125');
INSERT INTO `regions` VALUES (2056, 309, '云县', '/26/309/', '', 3, 0, 3, 0, '20030916001124');
INSERT INTO `regions` VALUES (2057, 309, '镇康县', '/26/309/', '', 3, 0, 3, 0, '20030916001126');
INSERT INTO `regions` VALUES (2058, 57, '安泽县', '/5/57/', '', 3, 0, 3, 0, '20030916002015');
INSERT INTO `regions` VALUES (2059, 57, '大宁县', '/5/57/', '', 3, 0, 3, 0, '20030916002020');
INSERT INTO `regions` VALUES (2060, 57, '汾西县', '/5/57/', '', 3, 0, 3, 0, '20030916002023');
INSERT INTO `regions` VALUES (2061, 57, '浮山县', '/5/57/', '', 3, 0, 3, 0, '20030916002016');
INSERT INTO `regions` VALUES (2062, 57, '古县', '/5/57/', '', 3, 0, 3, 0, '20030916002014');
INSERT INTO `regions` VALUES (2063, 57, '洪洞县', '/5/57/', '', 3, 0, 3, 0, '20030916002013');
INSERT INTO `regions` VALUES (2064, 57, '侯马市', '/5/57/', '', 3, 0, 2, 0, '20030916002008');
INSERT INTO `regions` VALUES (2065, 57, '霍州市', '/5/57/', '', 3, 0, 2, 0, '20030916002009');
INSERT INTO `regions` VALUES (2066, 57, '吉县', '/5/57/', '', 3, 0, 3, 0, '20030916002017');
INSERT INTO `regions` VALUES (2067, 57, '蒲县', '/5/57/', '', 3, 0, 3, 0, '20030916002019');
INSERT INTO `regions` VALUES (2068, 57, '曲沃县', '/5/57/', '', 3, 0, 3, 0, '20030916002010');
INSERT INTO `regions` VALUES (2069, 57, '隰县', '/5/57/', '', 3, 0, 3, 0, '20030916002022');
INSERT INTO `regions` VALUES (2070, 57, '乡宁县', '/5/57/', '', 3, 0, 3, 0, '20030916002018');
INSERT INTO `regions` VALUES (2071, 57, '襄汾县', '/5/57/', '', 3, 0, 3, 0, '20030916002012');
INSERT INTO `regions` VALUES (2072, 57, '尧都区', '/5/57/', '', 3, 0, 2, 0, '20030916002007');
INSERT INTO `regions` VALUES (2073, 57, '翼城县', '/5/57/', '', 3, 0, 3, 0, '20030916002011');
INSERT INTO `regions` VALUES (2074, 57, '永和县', '/5/57/', '', 3, 0, 3, 0, '20030916002021');
INSERT INTO `regions` VALUES (2075, 347, '东乡族自治县', '/29/347/', '', 3, 0, 4, 0, '20030916001283');
INSERT INTO `regions` VALUES (2076, 347, '广河县', '/29/347/', '', 3, 0, 4, 0, '20030916001281');
INSERT INTO `regions` VALUES (2077, 347, '和政县', '/29/347/', '', 3, 0, 4, 0, '20030916001282');
INSERT INTO `regions` VALUES (2078, 347, '积石山保安族东乡族撒拉族自治县', '/29/347/', '', 3, 0, 4, 0, '20030916001284');
INSERT INTO `regions` VALUES (2079, 347, '康乐县', '/29/347/', '', 3, 0, 4, 0, '20030916001279');
INSERT INTO `regions` VALUES (2080, 347, '临夏市', '/29/347/', '', 3, 0, 2, 0, '20030916001277');
INSERT INTO `regions` VALUES (2081, 347, '临夏县', '/29/347/', '', 3, 0, 4, 0, '20030916001278');
INSERT INTO `regions` VALUES (2082, 347, '永靖县', '/29/347/', '', 3, 0, 4, 0, '20030916001280');
INSERT INTO `regions` VALUES (2083, 184, '苍山县', '/16/184/', '', 3, 0, 3, 0, '20030916000953');
INSERT INTO `regions` VALUES (2084, 184, '费县', '/16/184/', '', 3, 0, 3, 0, '20030916000952');
INSERT INTO `regions` VALUES (2085, 184, '河东区', '/16/184/', '', 3, 0, 2, 0, '20030916000951');
INSERT INTO `regions` VALUES (2086, 184, '莒南县', '/16/184/', '', 3, 0, 3, 0, '20030916000960');
INSERT INTO `regions` VALUES (2087, 184, '兰山区', '/16/184/', '', 3, 0, 2, 0, '3000000137304459');
INSERT INTO `regions` VALUES (2088, 184, '临沭县', '/16/184/', '', 3, 0, 3, 0, '20030916000954');
INSERT INTO `regions` VALUES (2089, 184, '罗庄区', '/16/184/', '', 3, 0, 2, 0, '3000000137304519');
INSERT INTO `regions` VALUES (2090, 184, '蒙阴县', '/16/184/', '', 3, 0, 3, 0, '20030916000955');
INSERT INTO `regions` VALUES (2091, 184, '平邑县', '/16/184/', '', 3, 0, 3, 0, '20030916000956');
INSERT INTO `regions` VALUES (2092, 184, '郯城县', '/16/184/', '', 3, 0, 3, 0, '20030916000959');
INSERT INTO `regions` VALUES (2093, 184, '沂南县', '/16/184/', '', 3, 0, 3, 0, '20030916000957');
INSERT INTO `regions` VALUES (2094, 184, '沂水县', '/16/184/', '', 3, 0, 3, 0, '20030916000958');
INSERT INTO `regions` VALUES (2095, 255, '城中区', '/21/255/', '', 3, 0, 2, 0, '20030916001553');
INSERT INTO `regions` VALUES (2096, 255, '柳北区', '/21/255/', '', 3, 0, 2, 0, '3000000137784431');
INSERT INTO `regions` VALUES (2097, 255, '柳城县', '/21/255/', '', 3, 0, 3, 0, '20030916001551');
INSERT INTO `regions` VALUES (2098, 255, '柳江县', '/21/255/', '', 3, 0, 3, 0, '20030916001552');
INSERT INTO `regions` VALUES (2099, 255, '柳南区', '/21/255/', '', 3, 0, 2, 0, '3000000137784319');
INSERT INTO `regions` VALUES (2100, 255, '鹿寨县', '/21/255/', '', 3, 0, 3, 0, '20030916001554');
INSERT INTO `regions` VALUES (2101, 255, '融安县', '/21/255/', '', 3, 0, 3, 0, '20030916001573');
INSERT INTO `regions` VALUES (2102, 255, '融水苗族自治县', '/21/255/', '', 3, 0, 3, 0, '20030916001555');
INSERT INTO `regions` VALUES (2103, 255, '三江侗族自治县', '/21/255/', '', 3, 0, 3, 0, '20030916001556');
INSERT INTO `regions` VALUES (2104, 255, '鱼峰区', '/21/255/', '', 3, 0, 2, 0, '3000000137784179');
INSERT INTO `regions` VALUES (2112, 294, '六枝特区', '/25/294/', '', 3, 0, 3, 0, '20030916000416');
INSERT INTO `regions` VALUES (2113, 294, '盘县', '/25/294/', '', 3, 0, 3, 0, '20030916000415');
INSERT INTO `regions` VALUES (2114, 294, '水城县（滥坝镇）', '/25/294/', '', 3, 0, 3, 0, '20030916000417');
INSERT INTO `regions` VALUES (2115, 294, '钟山区', '/25/294/', '', 3, 0, 2, 0, '20030916000414');
INSERT INTO `regions` VALUES (2116, 159, '长汀县', '/14/159/', '', 3, 0, 3, 0, '20030916002293');
INSERT INTO `regions` VALUES (2117, 159, '连城县', '/14/159/', '', 3, 0, 3, 0, '20030916002295');
INSERT INTO `regions` VALUES (2118, 159, '上杭县', '/14/159/', '', 3, 0, 3, 0, '20030916002297');
INSERT INTO `regions` VALUES (2119, 159, '武平县', '/14/159/', '', 3, 0, 3, 0, '20030916002296');
INSERT INTO `regions` VALUES (2120, 159, '新罗区', '/14/159/', '', 3, 0, 2, 0, '20030916002292');
INSERT INTO `regions` VALUES (2121, 159, '永定县', '/14/159/', '', 3, 0, 3, 0, '20030916002298');
INSERT INTO `regions` VALUES (2122, 159, '漳平市', '/14/159/', '', 3, 0, 2, 0, '20030916002294');
INSERT INTO `regions` VALUES (2123, 346, '成县', '/29/346/', '', 3, 0, 4, 0, '20030916001269');
INSERT INTO `regions` VALUES (2124, 346, '宕昌县', '/29/346/', '', 3, 0, 4, 0, '20030916001271');
INSERT INTO `regions` VALUES (2125, 346, '徽县', '/29/346/', '', 3, 0, 4, 0, '20030916001276');
INSERT INTO `regions` VALUES (2126, 346, '康县', '/29/346/', '', 3, 0, 4, 0, '20030916001272');
INSERT INTO `regions` VALUES (2127, 346, '礼县', '/29/346/', '', 3, 0, 4, 0, '20030916001274');
INSERT INTO `regions` VALUES (2128, 346, '两当县', '/29/346/', '', 3, 0, 4, 0, '20030916001275');
INSERT INTO `regions` VALUES (2129, 346, '文县', '/29/346/', '', 3, 0, 4, 0, '3000000007581225');
INSERT INTO `regions` VALUES (2130, 346, '武都区', '/29/346/', '', 3, 0, 3, 0, '20030916001270');
INSERT INTO `regions` VALUES (2131, 346, '西和县', '/29/346/', '', 3, 0, 3, 0, '20030916001273');
INSERT INTO `regions` VALUES (2132, 231, '冷水江市', '/19/231/', '', 3, 0, 2, 0, '20030916000392');
INSERT INTO `regions` VALUES (2133, 231, '涟源市', '/19/231/', '', 3, 0, 2, 0, '20030916000393');
INSERT INTO `regions` VALUES (2134, 231, '娄星区', '/19/231/', '', 3, 0, 2, 0, '20030916000391');
INSERT INTO `regions` VALUES (2135, 231, '双峰县', '/19/231/', '', 3, 0, 3, 0, '20030916000394');
INSERT INTO `regions` VALUES (2136, 231, '新化县', '/19/231/', '', 3, 0, 3, 0, '20030916000395');
INSERT INTO `regions` VALUES (2137, 275, '古蔺县', '/24/275/', '', 3, 0, 3, 0, '20030916000297');
INSERT INTO `regions` VALUES (2138, 275, '合江县', '/24/275/', '', 3, 0, 3, 0, '20030916000294');
INSERT INTO `regions` VALUES (2139, 275, '江阳区', '/24/275/', '', 3, 0, 2, 0, '20030916000292');
INSERT INTO `regions` VALUES (2140, 275, '龙马潭区', '/24/275/', '', 3, 0, 2, 0, '20030916000291');
INSERT INTO `regions` VALUES (2141, 275, '泸县', '/24/275/', '', 3, 0, 3, 0, '20030916000293');
INSERT INTO `regions` VALUES (2142, 275, '纳溪区', '/24/275/', '', 3, 0, 2, 0, '20030916000295');
INSERT INTO `regions` VALUES (2143, 275, '叙永县', '/24/275/', '', 3, 0, 3, 0, '20030916000296');
INSERT INTO `regions` VALUES (2144, 58, '方山县', '/5/58/', '', 3, 0, 3, 0, '20030916001925');
INSERT INTO `regions` VALUES (2145, 58, '汾阳市', '/5/58/', '', 3, 0, 2, 0, '20030916001920');
INSERT INTO `regions` VALUES (2146, 58, '交城县', '/5/58/', '', 3, 0, 3, 0, '20030916001929');
INSERT INTO `regions` VALUES (2147, 58, '交口县', '/5/58/', '', 3, 0, 3, 0, '20030916001928');
INSERT INTO `regions` VALUES (2148, 58, '岚县', '/5/58/', '', 3, 0, 3, 0, '20030916001927');
INSERT INTO `regions` VALUES (2149, 58, '离石区', '/5/58/', '', 3, 0, 2, 0, '20030916001918');
INSERT INTO `regions` VALUES (2150, 58, '临县', '/5/58/', '', 3, 0, 2, 0, '20030916001924');
INSERT INTO `regions` VALUES (2151, 58, '柳林县', '/5/58/', '', 3, 0, 3, 0, '20030916001926');
INSERT INTO `regions` VALUES (2152, 58, '石楼县', '/5/58/', '', 3, 0, 3, 0, '20030916001930');
INSERT INTO `regions` VALUES (2153, 58, '文水县', '/5/58/', '', 3, 0, 3, 0, '20030916001921');
INSERT INTO `regions` VALUES (2154, 58, '孝义市', '/5/58/', '', 3, 0, 2, 0, '20030916001919');
INSERT INTO `regions` VALUES (2155, 58, '兴县', '/5/58/', '', 3, 0, 3, 0, '20030916001923');
INSERT INTO `regions` VALUES (2156, 58, '中阳县', '/5/58/', '', 3, 0, 3, 0, '20030916001922');
INSERT INTO `regions` VALUES (2157, 191, '瀍河回族区', '/17/191/', '', 3, 0, 2, 0, '20030916002512');
INSERT INTO `regions` VALUES (2158, 191, '吉利区', '/17/191/', '', 3, 0, 2, 0, '20030916002514');
INSERT INTO `regions` VALUES (2159, 191, '涧西区', '/17/191/', '', 3, 0, 2, 0, '20030916002513');
INSERT INTO `regions` VALUES (2160, 191, '老城区', '/17/191/', '', 3, 0, 2, 0, '20030916002511');
INSERT INTO `regions` VALUES (2161, 191, '栾川县', '/17/191/', '', 3, 0, 3, 0, '20030916002519');
INSERT INTO `regions` VALUES (2162, 191, '洛龙区', '/17/191/', '', 3, 0, 2, 0, '20030916002515');
INSERT INTO `regions` VALUES (2163, 191, '洛宁县', '/17/191/', '', 3, 0, 3, 0, '20030916002523');
INSERT INTO `regions` VALUES (2164, 191, '孟津县', '/17/191/', '', 3, 0, 3, 0, '20030916002517');
INSERT INTO `regions` VALUES (2165, 191, '汝阳县', '/17/191/', '', 3, 0, 3, 0, '20030916002521');
INSERT INTO `regions` VALUES (2166, 191, '嵩县', '/17/191/', '', 3, 0, 3, 0, '20030916002520');
INSERT INTO `regions` VALUES (2167, 191, '西工区', '/17/191/', '', 3, 0, 2, 0, '20030916002510');
INSERT INTO `regions` VALUES (2168, 191, '新安县', '/17/191/', '', 3, 0, 3, 0, '20030916002518');
INSERT INTO `regions` VALUES (2169, 191, '偃师市', '/17/191/', '', 3, 0, 3, 0, '20030916002516');
INSERT INTO `regions` VALUES (2170, 191, '伊川县', '/17/191/', '', 3, 0, 3, 0, '20030916002524');
INSERT INTO `regions` VALUES (2171, 191, '宜阳县', '/17/191/', '', 3, 0, 3, 0, '20030916002522');
INSERT INTO `regions` VALUES (2172, 199, '临颍县', '/17/199/', '', 3, 0, 3, 0, '20030916002594');
INSERT INTO `regions` VALUES (2173, 199, '舞阳县', '/17/199/', '', 3, 0, 3, 0, '20030916002593');
INSERT INTO `regions` VALUES (2174, 199, '郾城区', '/17/199/', '', 3, 0, 2, 0, '20030916002595');
INSERT INTO `regions` VALUES (2175, 199, '源汇区', '/17/199/', '', 3, 0, 2, 0, '20030916002592');
INSERT INTO `regions` VALUES (2176, 199, '召陵区', '/17/199/', '', 3, 0, 2, 0, '3000000138112236');
INSERT INTO `regions` VALUES (2181, 241, '电白县', '/20/241/', '', 3, 0, 3, 0, '20030916000878');
INSERT INTO `regions` VALUES (2182, 241, '高州市', '/20/241/', '', 3, 0, 2, 0, '20030916000877');
INSERT INTO `regions` VALUES (2183, 241, '化州市', '/20/241/', '', 3, 0, 2, 0, '20030916000875');
INSERT INTO `regions` VALUES (2184, 241, '茂港区', '/20/241/', '', 3, 0, 2, 0, '3000000138871726');
INSERT INTO `regions` VALUES (2185, 241, '茂南区', '/20/241/', '', 3, 0, 2, 0, '3000000138871649');
INSERT INTO `regions` VALUES (2186, 241, '信宜市', '/20/241/', '', 3, 0, 2, 0, '20030916000876');
INSERT INTO `regions` VALUES (2187, 286, '丹棱县', '/24/286/', '', 3, 0, 3, 0, '20030916000119');
INSERT INTO `regions` VALUES (2188, 286, '东坡区', '/24/286/', '', 3, 0, 2, 0, '20030916000115');
INSERT INTO `regions` VALUES (2189, 286, '洪雅县', '/24/286/', '', 3, 0, 3, 0, '20030916000118');
INSERT INTO `regions` VALUES (2190, 286, '彭山县', '/24/286/', '', 3, 0, 3, 0, '20030916000117');
INSERT INTO `regions` VALUES (2191, 286, '青神县', '/24/286/', '', 3, 0, 3, 0, '20030916000120');
INSERT INTO `regions` VALUES (2192, 286, '仁寿县', '/24/286/', '', 3, 0, 3, 0, '20030916000116');
INSERT INTO `regions` VALUES (2193, 244, '大埔县', '/20/244/', '', 3, 0, 3, 0, '20030916000543');
INSERT INTO `regions` VALUES (2194, 244, '丰顺县', '/20/244/', '', 3, 0, 3, 0, '20030916000544');
INSERT INTO `regions` VALUES (2195, 244, '蕉岭县', '/20/244/', '', 3, 0, 3, 0, '20030916000545');
INSERT INTO `regions` VALUES (2196, 244, '梅江区', '/20/244/', '', 3, 0, 2, 0, '20030916000546');
INSERT INTO `regions` VALUES (2197, 244, '梅县', '/20/244/', '', 3, 0, 3, 0, '20030916000547');
INSERT INTO `regions` VALUES (2198, 244, '平远县', '/20/244/', '', 3, 0, 3, 0, '20030916000549');
INSERT INTO `regions` VALUES (2199, 244, '五华县', '/20/244/', '', 3, 0, 3, 0, '20030916000550');
INSERT INTO `regions` VALUES (2200, 244, '兴宁市', '/20/244/', '', 3, 0, 2, 0, '20030916000551');
INSERT INTO `regions` VALUES (2201, 277, '安县', '/24/277/', '', 3, 0, 3, 0, '20030916000053');
INSERT INTO `regions` VALUES (2202, 277, '北川羌族自治县', '/24/277/', '', 3, 0, 3, 0, '20030916000055');
INSERT INTO `regions` VALUES (2203, 277, '涪城区', '/24/277/', '', 3, 0, 2, 0, '20030916000048');
INSERT INTO `regions` VALUES (2204, 277, '江油市', '/24/277/', '', 3, 0, 2, 0, '20030916000050');
INSERT INTO `regions` VALUES (2205, 277, '平武县', '/24/277/', '', 3, 0, 3, 0, '20030916000056');
INSERT INTO `regions` VALUES (2206, 277, '三台县', '/24/277/', '', 3, 0, 3, 0, '20030916000051');
INSERT INTO `regions` VALUES (2207, 277, '盐亭县', '/24/277/', '', 3, 0, 3, 0, '20030916000052');
INSERT INTO `regions` VALUES (2208, 277, '游仙区', '/24/277/', '', 3, 0, 2, 0, '20030916000049');
INSERT INTO `regions` VALUES (2209, 277, '梓潼县', '/24/277/', '', 3, 0, 3, 0, '20030916000054');
INSERT INTO `regions` VALUES (2210, 106, '爱民区', '/9/106/', '', 3, 0, 2, 0, '20030916000714');
INSERT INTO `regions` VALUES (2211, 106, '东安区', '/9/106/', '', 3, 0, 2, 0, '20030916000715');
INSERT INTO `regions` VALUES (2212, 106, '东宁县', '/9/106/', '', 3, 0, 3, 0, '20030916000722');
INSERT INTO `regions` VALUES (2213, 106, '海林市', '/9/106/', '', 3, 0, 3, 0, '20030916000720');
INSERT INTO `regions` VALUES (2214, 106, '林口县', '/9/106/', '', 3, 0, 3, 0, '20030916000723');
INSERT INTO `regions` VALUES (2215, 106, '穆棱市', '/9/106/', '', 3, 0, 3, 0, '20030916000718');
INSERT INTO `regions` VALUES (2216, 106, '宁安市', '/9/106/', '', 3, 0, 3, 0, '20030916000721');
INSERT INTO `regions` VALUES (2217, 106, '绥芬河市', '/9/106/', '', 3, 0, 3, 0, '20030916000719');
INSERT INTO `regions` VALUES (2218, 106, '西安区', '/9/106/', '', 3, 0, 2, 0, '20030916000717');
INSERT INTO `regions` VALUES (2219, 106, '阳明区', '/9/106/', '', 3, 0, 2, 0, '20030916000716');
INSERT INTO `regions` VALUES (2220, 280, '东兴区', '/24/280/', '', 3, 0, 2, 0, '20030916000081');
INSERT INTO `regions` VALUES (2221, 280, '隆昌县', '/24/280/', '', 3, 0, 3, 0, '20030916000084');
INSERT INTO `regions` VALUES (2222, 280, '市中区', '/24/280/', '', 3, 0, 2, 0, '20030916000080');
INSERT INTO `regions` VALUES (2223, 280, '威远县', '/24/280/', '', 3, 0, 3, 0, '20030916000082');
INSERT INTO `regions` VALUES (2224, 280, '资中县', '/24/280/', '', 3, 0, 3, 0, '20030916000083');
INSERT INTO `regions` VALUES (2225, 322, '安多县', '/27/322/', '', 3, 0, 6, 0, '20030916002355');
INSERT INTO `regions` VALUES (2226, 322, '巴青县', '/27/322/', '', 3, 0, 6, 0, '20030916002359');
INSERT INTO `regions` VALUES (2227, 322, '班戈县', '/27/322/', '', 3, 0, 6, 0, '20030916002358');
INSERT INTO `regions` VALUES (2228, 322, '比如县', '/27/322/', '', 3, 0, 6, 0, '20030916002353');
INSERT INTO `regions` VALUES (2229, 322, '嘉黎县', '/27/322/', '', 3, 0, 6, 0, '20030916002352');
INSERT INTO `regions` VALUES (2230, 322, '那曲县', '/27/322/', '', 3, 0, 6, 0, '20030916002351');
INSERT INTO `regions` VALUES (2231, 322, '尼玛县', '/27/322/', '', 3, 0, 6, 0, '20030916002360');
INSERT INTO `regions` VALUES (2232, 322, '聂荣县', '/27/322/', '', 3, 0, 6, 0, '20030916002354');
INSERT INTO `regions` VALUES (2233, 322, '申扎县', '/27/322/', '', 3, 0, 6, 0, '20030916002356');
INSERT INTO `regions` VALUES (2234, 322, '索县', '/27/322/', '', 3, 0, 6, 0, '20030916002357');
INSERT INTO `regions` VALUES (2235, 161, '安义县', '/15/161/', '', 3, 0, 3, 0, '20030916001345');
INSERT INTO `regions` VALUES (2236, 161, '东湖区', '/15/161/', '', 3, 0, 1, 0, '20030916001356');
INSERT INTO `regions` VALUES (2237, 161, '进贤县', '/15/161/', '', 3, 0, 3, 0, '20030916001374');
INSERT INTO `regions` VALUES (2238, 161, '南昌县', '/15/161/', '', 3, 0, 3, 0, '20030916001386');
INSERT INTO `regions` VALUES (2239, 161, '青山湖区', '/15/161/', '', 3, 0, 1, 0, '20030916001394');
INSERT INTO `regions` VALUES (2240, 161, '青云谱区', '/15/161/', '', 3, 0, 1, 0, '20030916001396');
INSERT INTO `regions` VALUES (2241, 161, '湾里区', '/15/161/', '', 3, 0, 1, 0, '20030916001408');
INSERT INTO `regions` VALUES (2242, 161, '西湖区', '/15/161/', '', 3, 0, 1, 0, '20030916001414');
INSERT INTO `regions` VALUES (2243, 161, '新建县', '/15/161/', '', 3, 0, 3, 0, '20030916001418');
INSERT INTO `regions` VALUES (2244, 282, '高坪区', '/24/282/', '', 3, 0, 2, 0, '20030916000066');
INSERT INTO `regions` VALUES (2245, 282, '嘉陵区', '/24/282/', '', 3, 0, 3, 0, '20030916000067');
INSERT INTO `regions` VALUES (2246, 282, '阆中市', '/24/282/', '', 3, 0, 2, 0, '20030916000068');
INSERT INTO `regions` VALUES (2247, 282, '南部县', '/24/282/', '', 3, 0, 3, 0, '20030916000069');
INSERT INTO `regions` VALUES (2248, 282, '蓬安县', '/24/282/', '', 3, 0, 3, 0, '20030916000071');
INSERT INTO `regions` VALUES (2249, 282, '顺庆区', '/24/282/', '', 3, 0, 2, 0, '20030916000065');
INSERT INTO `regions` VALUES (2250, 282, '西充县', '/24/282/', '', 3, 0, 3, 0, '20030916000073');
INSERT INTO `regions` VALUES (2251, 282, '仪陇县', '/24/282/', '', 3, 0, 3, 0, '20030916000072');
INSERT INTO `regions` VALUES (2252, 282, '营山县', '/24/282/', '', 3, 0, 3, 0, '20030916000070');
INSERT INTO `regions` VALUES (2253, 111, '白下区', '/11/111/', '', 3, 0, 1, 0, '20030916002783');
INSERT INTO `regions` VALUES (2254, 111, '高淳县', '/11/111/', '', 3, 0, 3, 0, '20030916002794');
INSERT INTO `regions` VALUES (2255, 111, '鼓楼区', '/11/111/', '', 3, 0, 1, 0, '20030916002786');
INSERT INTO `regions` VALUES (2256, 111, '建邺区', '/11/111/', '', 3, 0, 1, 0, '20030916002785');
INSERT INTO `regions` VALUES (2257, 111, '江宁区', '/11/111/', '', 3, 0, 1, 0, '20030916002792');
INSERT INTO `regions` VALUES (2258, 111, '溧水县', '/11/111/', '', 3, 0, 3, 0, '20030916002793');
INSERT INTO `regions` VALUES (2259, 111, '六合区', '/11/111/', '', 3, 0, 1, 0, '20030916002789');
INSERT INTO `regions` VALUES (2260, 111, '浦口区', '/11/111/', '', 3, 0, 1, 0, '20030916002788');
INSERT INTO `regions` VALUES (2261, 111, '栖霞区', '/11/111/', '', 3, 0, 1, 0, '20030916002790');
INSERT INTO `regions` VALUES (2262, 111, '秦淮区', '/11/111/', '', 3, 0, 1, 0, '20030916002784');
INSERT INTO `regions` VALUES (2263, 111, '下关区', '/11/111/', '', 3, 0, 1, 0, '20030916002787');
INSERT INTO `regions` VALUES (2264, 111, '玄武区', '/11/111/', '', 3, 0, 1, 0, '20030916002782');
INSERT INTO `regions` VALUES (2265, 111, '雨花台区', '/11/111/', '', 3, 0, 1, 0, '20030916002791');
INSERT INTO `regions` VALUES (2266, 254, '宾阳县', '/21/254/', '', 3, 0, 3, 0, '20030916001565');
INSERT INTO `regions` VALUES (2267, 254, '横县', '/21/254/', '', 3, 0, 3, 0, '20030916001569');
INSERT INTO `regions` VALUES (2268, 254, '江南区', '/21/254/', '', 3, 0, 1, 0, '20030916001561');
INSERT INTO `regions` VALUES (2269, 254, '良庆区', '/21/254/', '', 3, 0, 1, 0, '20030916001564');
INSERT INTO `regions` VALUES (2270, 254, '隆安县', '/21/254/', '', 3, 0, 3, 0, '20030916001570');
INSERT INTO `regions` VALUES (2271, 254, '马山县', '/21/254/', '', 3, 0, 3, 0, '20030916001571');
INSERT INTO `regions` VALUES (2272, 254, '青秀区', '/21/254/', '', 3, 0, 1, 0, '20030916001562');
INSERT INTO `regions` VALUES (2273, 254, '上林县', '/21/254/', '', 3, 0, 3, 0, '20030916001574');
INSERT INTO `regions` VALUES (2274, 254, '武鸣县', '/21/254/', '', 3, 0, 3, 0, '20030916001576');
INSERT INTO `regions` VALUES (2275, 254, '西乡塘区', '/21/254/', '', 3, 0, 1, 0, '20030916001560');
INSERT INTO `regions` VALUES (2276, 254, '兴宁区', '/21/254/', '', 3, 0, 1, 0, '20030916001563');
INSERT INTO `regions` VALUES (2277, 254, '邕宁区', '/21/254/', '', 3, 0, 1, 0, '20030916001577');
INSERT INTO `regions` VALUES (2278, 158, '光泽县', '/14/158/', '', 3, 0, 3, 0, '20030916001673');
INSERT INTO `regions` VALUES (2279, 158, '建瓯市', '/14/158/', '', 3, 0, 2, 0, '20030916001672');
INSERT INTO `regions` VALUES (2280, 158, '建阳市', '/14/158/', '', 3, 0, 2, 0, '20030916001668');
INSERT INTO `regions` VALUES (2281, 158, '浦城县', '/14/158/', '', 3, 0, 3, 0, '20030916001667');
INSERT INTO `regions` VALUES (2282, 158, '邵武市', '/14/158/', '', 3, 0, 2, 0, '20030916001666');
INSERT INTO `regions` VALUES (2283, 158, '顺昌县', '/14/158/', '', 3, 0, 3, 0, '20030916001670');
INSERT INTO `regions` VALUES (2284, 158, '松溪县', '/14/158/', '', 3, 0, 3, 0, '20030916001674');
INSERT INTO `regions` VALUES (2285, 158, '武夷山市', '/14/158/', '', 3, 0, 2, 0, '20030916001669');
INSERT INTO `regions` VALUES (2286, 158, '延平区', '/14/158/', '', 3, 0, 2, 0, '20030916001665');
INSERT INTO `regions` VALUES (2287, 158, '政和县', '/14/158/', '', 3, 0, 3, 0, '20030916001671');
INSERT INTO `regions` VALUES (2288, 116, '崇川区', '/11/116/', '', 3, 0, 2, 0, '20030916002129');
INSERT INTO `regions` VALUES (2289, 116, '港闸区', '/11/116/', '', 3, 0, 2, 0, '3000000137083425');
INSERT INTO `regions` VALUES (2290, 116, '海安县', '/11/116/', '', 3, 0, 3, 0, '20030916002135');
INSERT INTO `regions` VALUES (2291, 116, '海门市', '/11/116/', '', 3, 0, 3, 0, '20030916002130');
INSERT INTO `regions` VALUES (2292, 116, '启东市', '/11/116/', '', 3, 0, 3, 0, '20030916002131');
INSERT INTO `regions` VALUES (2293, 116, '如东县', '/11/116/', '', 3, 0, 3, 0, '20030916002133');
INSERT INTO `regions` VALUES (2294, 116, '如皋市', '/11/116/', '', 3, 0, 3, 0, '20030916002134');
INSERT INTO `regions` VALUES (2295, 116, '通州市', '/11/116/', '', 3, 0, 3, 0, '20030916002132');
INSERT INTO `regions` VALUES (2296, 201, '邓州市', '/17/201/', '', 3, 0, 2, 0, '20030916002608');
INSERT INTO `regions` VALUES (2297, 201, '方城县', '/17/201/', '', 3, 0, 3, 0, '20030916002610');
INSERT INTO `regions` VALUES (2298, 201, '内乡县', '/17/201/', '', 3, 0, 3, 0, '20030916002613');
INSERT INTO `regions` VALUES (2299, 201, '南召县', '/17/201/', '', 3, 0, 3, 0, '20030916002609');
INSERT INTO `regions` VALUES (2300, 201, '社旗县', '/17/201/', '', 3, 0, 3, 0, '20030916002615');
INSERT INTO `regions` VALUES (2301, 201, '唐河县', '/17/201/', '', 3, 0, 3, 0, '20030916002616');
INSERT INTO `regions` VALUES (2302, 201, '桐柏县', '/17/201/', '', 3, 0, 3, 0, '20030916002618');
INSERT INTO `regions` VALUES (2303, 201, '宛城区', '/17/201/', '', 3, 0, 2, 0, '20030916002607');
INSERT INTO `regions` VALUES (2304, 201, '卧龙区', '/17/201/', '', 3, 0, 2, 0, '20030916002606');
INSERT INTO `regions` VALUES (2305, 201, '西峡县', '/17/201/', '', 3, 0, 3, 0, '20030916002611');
INSERT INTO `regions` VALUES (2306, 201, '淅川县', '/17/201/', '', 3, 0, 2, 0, '20030916002614');
INSERT INTO `regions` VALUES (2307, 201, '新野县', '/17/201/', '', 3, 0, 3, 0, '20030916002617');
INSERT INTO `regions` VALUES (2308, 201, '镇平县', '/17/201/', '', 3, 0, 2, 0, '20030916002612');
INSERT INTO `regions` VALUES (2320, 160, '福安市', '/14/160/', '', 3, 0, 2, 0, '20030916001647');
INSERT INTO `regions` VALUES (2321, 160, '福鼎市', '/14/160/', '', 3, 0, 2, 0, '20030916001642');
INSERT INTO `regions` VALUES (2322, 160, '古田县', '/14/160/', '', 3, 0, 3, 0, '20030916001640');
INSERT INTO `regions` VALUES (2323, 160, '蕉城区', '/14/160/', '', 3, 0, 2, 0, '20030916001639');
INSERT INTO `regions` VALUES (2324, 160, '屏南县', '/14/160/', '', 3, 0, 3, 0, '20030916001646');
INSERT INTO `regions` VALUES (2325, 160, '寿宁县', '/14/160/', '', 3, 0, 3, 0, '20030916001645');
INSERT INTO `regions` VALUES (2326, 160, '霞浦县', '/14/160/', '', 3, 0, 2, 0, '20030916001641');
INSERT INTO `regions` VALUES (2327, 160, '柘荣县', '/14/160/', '', 3, 0, 3, 0, '20030916001643');
INSERT INTO `regions` VALUES (2328, 160, '周宁县', '/14/160/', '', 3, 0, 3, 0, '20030916001644');
INSERT INTO `regions` VALUES (2329, 316, '福贡县', '/26/316/', '', 3, 0, 3, 0, '20030916001136');
INSERT INTO `regions` VALUES (2330, 316, '贡山独龙族怒族自治县', '/26/316/', '', 3, 0, 3, 0, '20030916001137');
INSERT INTO `regions` VALUES (2331, 316, '兰坪白族普米族自治县', '/26/316/', '', 3, 0, 3, 0, '20030916001138');
INSERT INTO `regions` VALUES (2332, 316, '泸水县', '/26/316/', '', 3, 0, 3, 0, '20030916001135');
INSERT INTO `regions` VALUES (2333, 274, '东区', '/24/274/', '', 3, 0, 2, 0, '20030916001204');
INSERT INTO `regions` VALUES (2334, 274, '米易县', '/24/274/', '', 3, 0, 3, 0, '20030916001208');
INSERT INTO `regions` VALUES (2335, 274, '仁和区', '/24/274/', '', 3, 0, 2, 0, '20030916001207');
INSERT INTO `regions` VALUES (2336, 274, '西区', '/24/274/', '', 3, 0, 2, 0, '20030916001206');
INSERT INTO `regions` VALUES (2337, 274, '盐边县', '/24/274/', '', 3, 0, 3, 0, '20030916001209');
INSERT INTO `regions` VALUES (2338, 84, '大洼县', '/7/84/', '', 3, 0, 3, 0, '20030916001033');
INSERT INTO `regions` VALUES (2339, 84, '盘山县', '/7/84/', '', 3, 0, 3, 0, '20030916001034');
INSERT INTO `regions` VALUES (2340, 84, '双台子区', '/7/84/', '', 3, 0, 2, 0, '20030916001032');
INSERT INTO `regions` VALUES (2341, 84, '兴隆台区', '/7/84/', '', 3, 0, 2, 0, '20030916001031');
INSERT INTO `regions` VALUES (2342, 192, '宝丰县', '/17/192/', '', 3, 0, 2, 0, '20030916002602');
INSERT INTO `regions` VALUES (2343, 192, '郏县', '/17/192/', '', 3, 0, 3, 0, '20030916002605');
INSERT INTO `regions` VALUES (2344, 192, '鲁山县', '/17/192/', '', 3, 0, 3, 0, '20030916002604');
INSERT INTO `regions` VALUES (2345, 192, '汝州市', '/17/192/', '', 3, 0, 2, 0, '20030916002601');
INSERT INTO `regions` VALUES (2346, 192, '石龙区', '/17/192/', '', 3, 0, 2, 0, '20030916002599');
INSERT INTO `regions` VALUES (2347, 192, '卫东区', '/17/192/', '', 3, 0, 2, 0, '20030916002597');
INSERT INTO `regions` VALUES (2348, 192, '舞钢市', '/17/192/', '', 3, 0, 2, 0, '20030916002600');
INSERT INTO `regions` VALUES (2349, 192, '新华区', '/17/192/', '', 3, 0, 2, 0, '20030916002596');
INSERT INTO `regions` VALUES (2350, 192, '叶县', '/17/192/', '', 3, 0, 3, 0, '20030916002603');
INSERT INTO `regions` VALUES (2351, 192, '湛河区', '/17/192/', '', 3, 0, 2, 0, '20030916002598');
INSERT INTO `regions` VALUES (2352, 342, '崇信县', '/29/342/', '', 3, 0, 3, 0, '20030916001258');
INSERT INTO `regions` VALUES (2353, 342, '华亭县', '/29/342/', '', 3, 0, 3, 0, '20030916001259');
INSERT INTO `regions` VALUES (2354, 342, '泾川县', '/29/342/', '', 3, 0, 3, 0, '20030916001256');
INSERT INTO `regions` VALUES (2355, 342, '静宁县', '/29/342/', '', 3, 0, 3, 0, '20030916001261');
INSERT INTO `regions` VALUES (2356, 342, '崆峒区', '/29/342/', '', 3, 0, 2, 0, '20030916001255');
INSERT INTO `regions` VALUES (2357, 342, '灵台县', '/29/342/', '', 3, 0, 3, 0, '20030916001257');
INSERT INTO `regions` VALUES (2358, 342, '庄浪县', '/29/342/', '', 3, 0, 3, 0, '20030916001260');
INSERT INTO `regions` VALUES (2359, 163, '安源区', '/15/163/', '', 3, 0, 2, 0, '20030916001346');
INSERT INTO `regions` VALUES (2360, 163, '莲花县', '/15/163/', '', 3, 0, 3, 0, '20030916001381');
INSERT INTO `regions` VALUES (2361, 163, '芦溪县', '/15/163/', '', 3, 0, 3, 0, '20030916001385');
INSERT INTO `regions` VALUES (2362, 163, '上栗县', '/15/163/', '', 3, 0, 3, 0, '20030916001402');
INSERT INTO `regions` VALUES (2363, 163, '湘东区', '/15/163/', '', 3, 0, 2, 0, '20030916001416');
INSERT INTO `regions` VALUES (2364, 154, '城厢区', '/14/154/', '', 3, 0, 2, 0, '20030916001648');
INSERT INTO `regions` VALUES (2365, 154, '涵江区', '/14/154/', '', 3, 0, 2, 0, '20030916001652');
INSERT INTO `regions` VALUES (2366, 154, '荔城区', '/14/154/', '', 3, 0, 2, 0, '20030916001650');
INSERT INTO `regions` VALUES (2367, 154, '仙游县', '/14/154/', '', 3, 0, 3, 0, '20030916001651');
INSERT INTO `regions` VALUES (2368, 154, '秀屿区', '/14/154/', '', 3, 0, 3, 0, '20030916001649');
INSERT INTO `regions` VALUES (2369, 197, '范县', '/17/197/', '', 3, 0, 3, 0, '20030916002564');
INSERT INTO `regions` VALUES (2370, 197, '华龙区', '/17/197/', '', 3, 0, 2, 0, '20030916002561');
INSERT INTO `regions` VALUES (2371, 197, '南乐县', '/17/197/', '', 3, 0, 3, 0, '20030916002563');
INSERT INTO `regions` VALUES (2372, 197, '濮阳县', '/17/197/', '', 3, 0, 3, 0, '20030916002566');
INSERT INTO `regions` VALUES (2373, 197, '清丰县', '/17/197/', '', 3, 0, 3, 0, '20030916002562');
INSERT INTO `regions` VALUES (2374, 197, '台前县', '/17/197/', '', 3, 0, 3, 0, '20030916002565');
INSERT INTO `regions` VALUES (2375, 105, '勃利县', '/9/105/', '', 3, 0, 3, 0, '20030916000704');
INSERT INTO `regions` VALUES (2376, 105, '茄子河区', '/9/105/', '', 3, 0, 2, 0, '20030916000703');
INSERT INTO `regions` VALUES (2377, 105, '桃山区', '/9/105/', '', 3, 0, 2, 0, '20030916000701');
INSERT INTO `regions` VALUES (2378, 105, '新兴区', '/9/105/', '', 3, 0, 2, 0, '20030916000702');
INSERT INTO `regions` VALUES (2379, 98, '昂昂溪区', '/9/98/', '', 3, 0, 2, 0, '3000000006192979');
INSERT INTO `regions` VALUES (2380, 98, '拜泉县', '/9/98/', '', 3, 0, 3, 0, '20030916000641');
INSERT INTO `regions` VALUES (2381, 98, '富拉尔基区', '/9/98/', '', 3, 0, 2, 0, '3000000006193083');
INSERT INTO `regions` VALUES (2382, 98, '富裕县', '/9/98/', '', 3, 0, 3, 0, '20030916000638');
INSERT INTO `regions` VALUES (2383, 98, '甘南县', '/9/98/', '', 3, 0, 3, 0, '20030916000637');
INSERT INTO `regions` VALUES (2384, 98, '建华区', '/9/98/', '', 3, 0, 2, 0, '3000000006192809');
INSERT INTO `regions` VALUES (2385, 98, '克东县', '/9/98/', '', 3, 0, 3, 0, '20030916000640');
INSERT INTO `regions` VALUES (2386, 98, '克山县', '/9/98/', '', 3, 0, 3, 0, '20030916000639');
INSERT INTO `regions` VALUES (2387, 98, '龙江县', '/9/98/', '', 3, 0, 3, 0, '20030916000634');
INSERT INTO `regions` VALUES (2388, 98, '龙沙区', '/9/98/', '', 3, 0, 2, 0, '20030916000626');
INSERT INTO `regions` VALUES (2389, 98, '梅里斯达斡尔族区', '/9/98/', '', 3, 0, 2, 0, '3000000006193175');
INSERT INTO `regions` VALUES (2390, 98, '讷河市', '/9/98/', '', 3, 0, 3, 0, '20030916000633');
INSERT INTO `regions` VALUES (2391, 98, '碾子山区', '/9/98/', '', 3, 0, 2, 0, '3000000006193131');
INSERT INTO `regions` VALUES (2392, 98, '泰来县', '/9/98/', '', 3, 0, 3, 0, '20030916000636');
INSERT INTO `regions` VALUES (2393, 98, '铁锋区', '/9/98/', '', 3, 0, 2, 0, '3000000006192940');
INSERT INTO `regions` VALUES (2394, 98, '依安县', '/9/98/', '', 3, 0, 3, 0, '20030916000635');
INSERT INTO `regions` VALUES (2395, 428, '潜江市', '/18/428/', '', 3, 0, 2, 0, '20030916002108');
INSERT INTO `regions` VALUES (2396, 300, '岑巩县', '/25/300/', '', 3, 0, 3, 0, '20030916000460');
INSERT INTO `regions` VALUES (2397, 300, '从江县', '/25/300/', '', 3, 0, 3, 0, '20030916000467');
INSERT INTO `regions` VALUES (2398, 300, '丹寨县', '/25/300/', '', 3, 0, 3, 0, '20030916000470');
INSERT INTO `regions` VALUES (2399, 300, '黄平县', '/25/300/', '', 3, 0, 3, 0, '20030916000456');
INSERT INTO `regions` VALUES (2400, 300, '剑河县', '/25/300/', '', 3, 0, 3, 0, '20030916000463');
INSERT INTO `regions` VALUES (2401, 300, '锦屏县', '/25/300/', '', 3, 0, 3, 0, '20030916000462');
INSERT INTO `regions` VALUES (2402, 300, '凯里市', '/25/300/', '', 3, 0, 2, 0, '20030916000455');
INSERT INTO `regions` VALUES (2403, 300, '雷山县', '/25/300/', '', 3, 0, 3, 0, '20030916000468');
INSERT INTO `regions` VALUES (2404, 300, '黎平县', '/25/300/', '', 3, 0, 3, 0, '20030916000465');
INSERT INTO `regions` VALUES (2405, 300, '麻江县', '/25/300/', '', 3, 0, 3, 0, '20030916000469');
INSERT INTO `regions` VALUES (2406, 300, '榕江县', '/25/300/', '', 3, 0, 3, 0, '20030916000466');
INSERT INTO `regions` VALUES (2407, 300, '三穗县', '/25/300/', '', 3, 0, 3, 0, '20030916000458');
INSERT INTO `regions` VALUES (2408, 300, '施秉县', '/25/300/', '', 3, 0, 3, 0, '20030916000457');
INSERT INTO `regions` VALUES (2409, 300, '台江县', '/25/300/', '', 3, 0, 3, 0, '20030916000464');
INSERT INTO `regions` VALUES (2410, 300, '天柱县', '/25/300/', '', 3, 0, 3, 0, '20030916000461');
INSERT INTO `regions` VALUES (2411, 300, '镇远县', '/25/300/', '', 3, 0, 4, 0, '20030916000459');
INSERT INTO `regions` VALUES (2412, 300, '长顺县', '/25/300/', '', 3, 0, 3, 0, '20030916000479');
INSERT INTO `regions` VALUES (2413, 300, '都匀市', '/25/300/', '', 3, 0, 2, 0, '20030916000471');
INSERT INTO `regions` VALUES (2414, 300, '独山县', '/25/300/', '', 3, 0, 3, 0, '20030916000476');
INSERT INTO `regions` VALUES (2415, 300, '福泉市', '/25/300/', '', 3, 0, 2, 0, '20030916000472');
INSERT INTO `regions` VALUES (2416, 300, '贵定县', '/25/300/', '', 3, 0, 3, 0, '20030916000474');
INSERT INTO `regions` VALUES (2417, 300, '惠水县', '/25/300/', '', 3, 0, 3, 0, '20030916000481');
INSERT INTO `regions` VALUES (2418, 300, '荔波县', '/25/300/', '', 3, 0, 3, 0, '20030916000473');
INSERT INTO `regions` VALUES (2419, 300, '龙里县', '/25/300/', '', 3, 0, 3, 0, '20030916000480');
INSERT INTO `regions` VALUES (2420, 300, '罗甸县', '/25/300/', '', 3, 0, 3, 0, '20030916000478');
INSERT INTO `regions` VALUES (2421, 300, '平塘县', '/25/300/', '', 3, 0, 3, 0, '20030916000477');
INSERT INTO `regions` VALUES (2423, 300, '三都水族自治县', '/25/300/', '', 3, 0, 3, 0, '20030916000482');
INSERT INTO `regions` VALUES (2424, 300, '瓮安县', '/25/300/', '', 3, 0, 3, 0, '20030916000475');
INSERT INTO `regions` VALUES (2425, 300, '安龙县', '/25/300/', '', 3, 0, 3, 0, '20030916000490');
INSERT INTO `regions` VALUES (2426, 300, '册亨县', '/25/300/', '', 3, 0, 3, 0, '20030916000489');
INSERT INTO `regions` VALUES (2427, 300, '普安县', '/25/300/', '', 3, 0, 3, 0, '20030916000485');
INSERT INTO `regions` VALUES (2428, 300, '晴隆县', '/25/300/', '', 3, 0, 3, 0, '20030916000486');
INSERT INTO `regions` VALUES (2429, 300, '望谟县', '/25/300/', '', 3, 0, 3, 0, '20030916000488');
INSERT INTO `regions` VALUES (2430, 300, '兴仁县', '/25/300/', '', 3, 0, 3, 0, '20030916000484');
INSERT INTO `regions` VALUES (2431, 300, '兴义市', '/25/300/', '', 3, 0, 2, 0, '20030916000483');
INSERT INTO `regions` VALUES (2432, 300, '贞丰县', '/25/300/', '', 3, 0, 3, 0, '20030916000487');
INSERT INTO `regions` VALUES (2433, 260, '灵山县', '/21/260/', '', 3, 0, 3, 0, '20030916001580');
INSERT INTO `regions` VALUES (2434, 260, '浦北县', '/21/260/', '', 3, 0, 3, 0, '20030916001581');
INSERT INTO `regions` VALUES (2435, 260, '钦北区', '/21/260/', '', 3, 0, 3, 0, '3000000137786709');
INSERT INTO `regions` VALUES (2436, 260, '钦南区', '/21/260/', '', 3, 0, 2, 0, '20030916001582');
INSERT INTO `regions` VALUES (2437, 39, '北戴河区', '/4/39/', '', 3, 0, 1, 0, '20030916001913');
INSERT INTO `regions` VALUES (2438, 39, '昌黎县', '/4/39/', '', 3, 0, 3, 0, '20030916001916');
INSERT INTO `regions` VALUES (2439, 39, '抚宁县', '/4/39/', '', 3, 0, 3, 0, '20030916001917');
INSERT INTO `regions` VALUES (2440, 39, '海港区', '/4/39/', '', 3, 0, 2, 0, '20030916001911');
INSERT INTO `regions` VALUES (2441, 39, '卢龙县', '/4/39/', '', 3, 0, 3, 0, '20030916001914');
INSERT INTO `regions` VALUES (2442, 39, '青龙满族自治县', '/4/39/', '', 3, 0, 3, 0, '20030916001915');
INSERT INTO `regions` VALUES (2443, 39, '山海关区', '/4/39/', '', 3, 0, 2, 0, '20030916001912');
INSERT INTO `regions` VALUES (2444, 173, '城阳区', '/16/173/', '', 3, 0, 1, 0, '20030916001600');
INSERT INTO `regions` VALUES (2445, 173, '黄岛区', '/16/173/', '', 3, 0, 1, 0, '20030916001598');
INSERT INTO `regions` VALUES (2446, 173, '即墨市', '/16/173/', '', 3, 0, 2, 0, '20030916001603');
INSERT INTO `regions` VALUES (2447, 173, '胶南市', '/16/173/', '', 3, 0, 2, 0, '20030916001615');
INSERT INTO `regions` VALUES (2448, 173, '胶州市', '/16/173/', '', 3, 0, 2, 0, '20030916001607');
INSERT INTO `regions` VALUES (2449, 173, '莱西市', '/16/173/', '', 3, 0, 2, 0, '20030916001608');
INSERT INTO `regions` VALUES (2450, 173, '崂山区', '/16/173/', '', 3, 0, 1, 0, '20030916001597');
INSERT INTO `regions` VALUES (2451, 173, '李沧区', '/16/173/', '', 3, 0, 1, 0, '20030916001599');
INSERT INTO `regions` VALUES (2452, 173, '平度市', '/16/173/', '', 3, 0, 2, 0, '20030916001606');
INSERT INTO `regions` VALUES (2453, 173, '市北区', '/16/173/', '', 3, 0, 1, 0, '20030916001594');
INSERT INTO `regions` VALUES (2454, 173, '市南区', '/16/173/', '', 3, 0, 1, 0, '20030916001595');
INSERT INTO `regions` VALUES (2455, 173, '四方区', '/16/173/', '', 3, 0, 1, 0, '20030916001596');
INSERT INTO `regions` VALUES (2456, 248, '佛冈县', '/20/248/', '', 3, 0, 3, 0, '20030916000552');
INSERT INTO `regions` VALUES (2457, 248, '连南瑶族自治县', '/20/248/', '', 3, 0, 3, 0, '20030916000553');
INSERT INTO `regions` VALUES (2458, 248, '连山壮族瑶族自治县', '/20/248/', '', 3, 0, 3, 0, '20030916000554');
INSERT INTO `regions` VALUES (2459, 248, '连州市', '/20/248/', '', 3, 0, 3, 0, '20030916000555');
INSERT INTO `regions` VALUES (2460, 248, '清城区', '/20/248/', '', 3, 0, 2, 0, '20030916000556');
INSERT INTO `regions` VALUES (2461, 248, '清新县', '/20/248/', '', 3, 0, 3, 0, '20030916000557');
INSERT INTO `regions` VALUES (2462, 248, '阳山县', '/20/248/', '', 3, 0, 3, 0, '20030916000559');
INSERT INTO `regions` VALUES (2463, 248, '英德市', '/20/248/', '', 3, 0, 2, 0, '20030916000560');
INSERT INTO `regions` VALUES (2464, 344, '合水县', '/29/344/', '', 3, 0, 4, 0, '20030916002678');
INSERT INTO `regions` VALUES (2465, 344, '华池县', '/29/344/', '', 3, 0, 4, 0, '20030916002680');
INSERT INTO `regions` VALUES (2466, 344, '环县', '/29/344/', '', 3, 0, 4, 0, '20030916002679');
INSERT INTO `regions` VALUES (2467, 344, '宁县', '/29/344/', '', 3, 0, 4, 0, '20030916002674');
INSERT INTO `regions` VALUES (2468, 344, '庆城县', '/29/344/', '', 3, 0, 4, 0, '20030916002675');
INSERT INTO `regions` VALUES (2469, 344, '西峰区', '/29/344/', '', 3, 0, 3, 0, '20030916002676');
INSERT INTO `regions` VALUES (2470, 344, '镇原县', '/29/344/', '', 3, 0, 4, 0, '20030916002677');
INSERT INTO `regions` VALUES (2471, 344, '正宁县', '/29/344/', '', 3, 0, 4, 0, '20030916002673');
INSERT INTO `regions` VALUES (2472, 303, '富源县', '/26/303/', '', 3, 0, 3, 0, '20030916001079');
INSERT INTO `regions` VALUES (2473, 303, '会泽县', '/26/303/', '', 3, 0, 3, 0, '20030916001083');
INSERT INTO `regions` VALUES (2474, 303, '陆良县', '/26/303/', '', 3, 0, 3, 0, '20030916001082');
INSERT INTO `regions` VALUES (2475, 303, '罗平县', '/26/303/', '', 3, 0, 3, 0, '20030916001080');
INSERT INTO `regions` VALUES (2476, 303, '马龙县', '/26/303/', '', 3, 0, 3, 0, '20030916001077');
INSERT INTO `regions` VALUES (2477, 303, '麒麟区', '/26/303/', '', 3, 0, 2, 0, '20030916001075');
INSERT INTO `regions` VALUES (2478, 303, '师宗县', '/26/303/', '', 3, 0, 3, 0, '20030916001081');
INSERT INTO `regions` VALUES (2479, 303, '宣威市', '/26/303/', '', 3, 0, 2, 0, '20030916001076');
INSERT INTO `regions` VALUES (2480, 303, '沾益县', '/26/303/', '', 3, 0, 3, 0, '20030916001078');
INSERT INTO `regions` VALUES (2487, 156, '安溪县', '/14/156/', '', 3, 0, 3, 0, '20030916002275');
INSERT INTO `regions` VALUES (2488, 156, '德化县', '/14/156/', '', 3, 0, 3, 0, '20030916002278');
INSERT INTO `regions` VALUES (2489, 156, '丰泽区', '/14/156/', '', 3, 0, 2, 0, '20030916002272');
INSERT INTO `regions` VALUES (2490, 156, '惠安县', '/14/156/', '', 3, 0, 3, 0, '20030916002277');
INSERT INTO `regions` VALUES (2491, 156, '晋江市', '/14/156/', '', 3, 0, 2, 0, '20030916002274');
INSERT INTO `regions` VALUES (2492, 156, '鲤城区', '/14/156/', '', 3, 0, 2, 0, '20030916002271');
INSERT INTO `regions` VALUES (2493, 156, '洛江区', '/14/156/', '', 3, 0, 3, 0, '20030916002273');
INSERT INTO `regions` VALUES (2494, 156, '南安市', '/14/156/', '', 3, 0, 2, 0, '20030916002280');
INSERT INTO `regions` VALUES (2495, 156, '泉港区', '/14/156/', '', 3, 0, 2, 0, '3000000002629053');
INSERT INTO `regions` VALUES (2496, 156, '石狮市', '/14/156/', '', 3, 0, 2, 0, '20030916002276');
INSERT INTO `regions` VALUES (2497, 156, '永春县', '/14/156/', '', 3, 0, 3, 0, '20030916002279');
INSERT INTO `regions` VALUES (2498, 321, '昂仁县', '/27/321/', '', 3, 0, 6, 0, '20030916002397');
INSERT INTO `regions` VALUES (2499, 321, '白朗县', '/27/321/', '', 3, 0, 6, 0, '20030916002399');
INSERT INTO `regions` VALUES (2500, 321, '定结县', '/27/321/', '', 3, 0, 6, 0, '20030916002402');
INSERT INTO `regions` VALUES (2501, 321, '定日县', '/27/321/', '', 3, 0, 6, 0, '20030916002394');
INSERT INTO `regions` VALUES (2502, 321, '岗巴县', '/27/321/', '', 3, 0, 6, 0, '20030916002408');
INSERT INTO `regions` VALUES (2503, 321, '吉隆县', '/27/321/', '', 3, 0, 6, 0, '20030916002405');
INSERT INTO `regions` VALUES (2504, 321, '江孜县', '/27/321/', '', 3, 0, 6, 0, '20030916002393');
INSERT INTO `regions` VALUES (2505, 321, '康马县', '/27/321/', '', 3, 0, 6, 0, '20030916002401');
INSERT INTO `regions` VALUES (2506, 321, '拉孜县', '/27/321/', '', 3, 0, 6, 0, '20030916002396');
INSERT INTO `regions` VALUES (2507, 321, '南木林县', '/27/321/', '', 3, 0, 6, 0, '20030916002392');
INSERT INTO `regions` VALUES (2508, 321, '聂拉木县', '/27/321/', '', 3, 0, 6, 0, '20030916002406');
INSERT INTO `regions` VALUES (2509, 321, '仁布县', '/27/321/', '', 3, 0, 6, 0, '20030916002400');
INSERT INTO `regions` VALUES (2510, 321, '日喀则市', '/27/321/', '', 3, 0, 5, 0, '20030916002391');
INSERT INTO `regions` VALUES (2511, 321, '萨嘎县', '/27/321/', '', 3, 0, 6, 0, '20030916002407');
INSERT INTO `regions` VALUES (2512, 321, '萨迦县', '/27/321/', '', 3, 0, 6, 0, '20030916002395');
INSERT INTO `regions` VALUES (2513, 321, '谢通门县', '/27/321/', '', 3, 0, 6, 0, '20030916002398');
INSERT INTO `regions` VALUES (2514, 321, '亚东县', '/27/321/', '', 3, 0, 6, 0, '20030916002404');
INSERT INTO `regions` VALUES (2515, 321, '仲巴县', '/27/321/', '', 3, 0, 6, 0, '20030916002403');
INSERT INTO `regions` VALUES (2516, 182, '东港区', '/16/182/', '', 3, 0, 2, 0, '20030916001604');
INSERT INTO `regions` VALUES (2517, 182, '莒县', '/16/182/', '', 3, 0, 3, 0, '20030916001610');
INSERT INTO `regions` VALUES (2518, 182, '岚山区', '/16/182/', '', 3, 0, 2, 0, '3000000137304017');
INSERT INTO `regions` VALUES (2519, 182, '五莲县', '/16/182/', '', 3, 0, 3, 0, '20030916001612');
INSERT INTO `regions` VALUES (2520, 200, '湖滨区', '/17/200/', '', 3, 0, 2, 0, '20030916002504');
INSERT INTO `regions` VALUES (2521, 200, '灵宝市', '/17/200/', '', 3, 0, 3, 0, '20030916002506');
INSERT INTO `regions` VALUES (2522, 200, '卢氏县', '/17/200/', '', 3, 0, 3, 0, '20030916002509');
INSERT INTO `regions` VALUES (2523, 200, '陕县', '/17/200/', '', 3, 0, 3, 0, '20030916002508');
INSERT INTO `regions` VALUES (2524, 200, '渑池县', '/17/200/', '', 3, 0, 3, 0, '20030916002507');
INSERT INTO `regions` VALUES (2525, 200, '义马市', '/17/200/', '', 3, 0, 2, 0, '20030916002505');
INSERT INTO `regions` VALUES (2526, 155, '大田县', '/14/155/', '', 3, 0, 3, 0, '20030916001661');
INSERT INTO `regions` VALUES (2527, 155, '将乐县', '/14/155/', '', 3, 0, 3, 0, '20030916001656');
INSERT INTO `regions` VALUES (2528, 155, '梅列区', '/14/155/', '', 3, 0, 2, 0, '20030916001653');
INSERT INTO `regions` VALUES (2529, 155, '明溪县', '/14/155/', '', 3, 0, 3, 0, '20030916001663');
INSERT INTO `regions` VALUES (2530, 155, '宁化县', '/14/155/', '', 3, 0, 3, 0, '20030916001659');
INSERT INTO `regions` VALUES (2531, 155, '清流县', '/14/155/', '', 3, 0, 3, 0, '20030916001664');
INSERT INTO `regions` VALUES (2532, 155, '三元区', '/14/155/', '', 3, 0, 2, 0, '20030916001654');
INSERT INTO `regions` VALUES (2533, 155, '沙县', '/14/155/', '', 3, 0, 2, 0, '20030916001660');
INSERT INTO `regions` VALUES (2534, 155, '泰宁县', '/14/155/', '', 3, 0, 3, 0, '20030916001662');
INSERT INTO `regions` VALUES (2535, 155, '永安市', '/14/155/', '', 3, 0, 2, 0, '20030916001655');
INSERT INTO `regions` VALUES (2536, 155, '尤溪县', '/14/155/', '', 3, 0, 3, 0, '20030916001658');
INSERT INTO `regions` VALUES (2537, 3579, '白沙黎族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000864');
INSERT INTO `regions` VALUES (2538, 3579, '保亭黎族苗族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000867');
INSERT INTO `regions` VALUES (2539, 3579, '昌江黎族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000863');
INSERT INTO `regions` VALUES (2540, 3579, '澄迈县', '/22/3579/', '', 3, 0, 5, 0, '20030916000860');
INSERT INTO `regions` VALUES (2541, 3579, '儋州市', '/22/3579/', '', 3, 0, 5, 0, '20030916000858');
INSERT INTO `regions` VALUES (2542, 3579, '定安县', '/22/3579/', '', 3, 0, 5, 0, '20030916000861');
INSERT INTO `regions` VALUES (2543, 3579, '东方市', '/22/3579/', '', 3, 0, 5, 0, '20030916000857');
INSERT INTO `regions` VALUES (2544, 3579, '乐东黎族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000868');
INSERT INTO `regions` VALUES (2545, 3579, '临高县', '/22/3579/', '', 3, 0, 5, 0, '20030916000859');
INSERT INTO `regions` VALUES (2546, 3579, '陵水黎族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000866');
INSERT INTO `regions` VALUES (2547, 3579, '琼海市', '/22/3579/', '', 3, 0, 5, 0, '20030916000854');
INSERT INTO `regions` VALUES (2548, 3579, '琼中黎族苗族自治县', '/22/3579/', '', 3, 0, 5, 0, '20030916000865');
INSERT INTO `regions` VALUES (2549, 3579, '屯昌县', '/22/3579/', '', 3, 0, 5, 0, '20030916000862');
INSERT INTO `regions` VALUES (2550, 3579, '万宁市', '/22/3579/', '', 3, 0, 5, 0, '20030916000855');
INSERT INTO `regions` VALUES (2551, 3579, '文昌市', '/22/3579/', '', 3, 0, 5, 0, '20030916000853');
INSERT INTO `regions` VALUES (2552, 3579, '五指山市', '/22/3579/', '', 3, 0, 5, 0, '20030916000856');
INSERT INTO `regions` VALUES (2553, 320, '措美县', '/27/320/', '', 3, 0, 6, 0, '20030916002385');
INSERT INTO `regions` VALUES (2554, 320, '错那县', '/27/320/', '', 3, 0, 6, 0, '20030916002389');
INSERT INTO `regions` VALUES (2555, 320, '贡嘎县', '/27/320/', '', 3, 0, 6, 0, '20030916002381');
INSERT INTO `regions` VALUES (2556, 320, '加查县', '/27/320/', '', 3, 0, 6, 0, '20030916002387');
INSERT INTO `regions` VALUES (2557, 320, '浪卡子县', '/27/320/', '', 3, 0, 6, 0, '20030916002390');
INSERT INTO `regions` VALUES (2558, 320, '隆子县', '/27/320/', '', 3, 0, 6, 0, '20030916002388');
INSERT INTO `regions` VALUES (2559, 320, '洛扎县', '/27/320/', '', 3, 0, 6, 0, '20030916002386');
INSERT INTO `regions` VALUES (2560, 320, '乃东县', '/27/320/', '', 3, 0, 6, 0, '20030916002379');
INSERT INTO `regions` VALUES (2561, 320, '琼结县', '/27/320/', '', 3, 0, 6, 0, '20030916002383');
INSERT INTO `regions` VALUES (2562, 320, '曲松县', '/27/320/', '', 3, 0, 6, 0, '20030916002384');
INSERT INTO `regions` VALUES (2563, 320, '桑日县', '/27/320/', '', 3, 0, 6, 0, '20030916002382');
INSERT INTO `regions` VALUES (2565, 320, '扎囊县', '/27/320/', '', 3, 0, 6, 0, '20030916002380');
INSERT INTO `regions` VALUES (2566, 236, '潮南区', '/20/236/', '', 3, 0, 2, 0, '20030916000569');
INSERT INTO `regions` VALUES (2567, 236, '潮阳区', '/20/236/', '', 3, 0, 2, 0, '20030916000561');
INSERT INTO `regions` VALUES (2568, 236, '澄海区', '/20/236/', '', 3, 0, 2, 0, '20030916000562');
INSERT INTO `regions` VALUES (2569, 236, '濠江区', '/20/236/', '', 3, 0, 2, 0, '20030916000563');
INSERT INTO `regions` VALUES (2570, 236, '金平区', '/20/236/', '', 3, 0, 2, 0, '20030916000565');
INSERT INTO `regions` VALUES (2571, 236, '龙湖区', '/20/236/', '', 3, 0, 2, 0, '20030916000566');
INSERT INTO `regions` VALUES (2572, 236, '南澳县', '/20/236/', '', 3, 0, 3, 0, '20030916000567');
INSERT INTO `regions` VALUES (2573, 245, '城区', '/20/245/', '', 3, 0, 2, 0, '20030916000570');
INSERT INTO `regions` VALUES (2574, 245, '海丰县', '/20/245/', '', 3, 0, 3, 0, '20030916000571');
INSERT INTO `regions` VALUES (2575, 245, '陆丰市', '/20/245/', '', 3, 0, 2, 0, '20030916000572');
INSERT INTO `regions` VALUES (2576, 245, '陆河县', '/20/245/', '', 3, 0, 3, 0, '20030916000573');
INSERT INTO `regions` VALUES (2577, 334, '丹凤县', '/28/334/', '', 3, 0, 3, 0, '20030916002696');
INSERT INTO `regions` VALUES (2578, 334, '洛南县', '/28/334/', '', 3, 0, 3, 0, '20030916002728');
INSERT INTO `regions` VALUES (2579, 334, '山阳县', '/28/334/', '', 3, 0, 3, 0, '20030916002742');
INSERT INTO `regions` VALUES (2580, 334, '商南县', '/28/334/', '', 3, 0, 3, 0, '20030916002743');
INSERT INTO `regions` VALUES (2581, 334, '商州区', '/28/334/', '', 3, 0, 2, 0, '20030916002744');
INSERT INTO `regions` VALUES (2582, 334, '镇安县', '/28/334/', '', 3, 0, 3, 0, '20030916002773');
INSERT INTO `regions` VALUES (2583, 334, '柞水县', '/28/334/', '', 3, 0, 3, 0, '20030916002781');
INSERT INTO `regions` VALUES (2584, 202, '梁园区', '/17/202/', '', 3, 0, 2, 0, '20030916002577');
INSERT INTO `regions` VALUES (2585, 202, '民权县', '/17/202/', '', 3, 0, 3, 0, '20030916002581');
INSERT INTO `regions` VALUES (2586, 202, '宁陵县', '/17/202/', '', 3, 0, 3, 0, '20030916002582');
INSERT INTO `regions` VALUES (2587, 202, '睢县', '/17/202/', '', 3, 0, 3, 0, '20030916002583');
INSERT INTO `regions` VALUES (2588, 202, '睢阳区', '/17/202/', '', 3, 0, 2, 0, '20030916002578');
INSERT INTO `regions` VALUES (2589, 202, '夏邑县', '/17/202/', '', 3, 0, 3, 0, '20030916002584');
INSERT INTO `regions` VALUES (2590, 202, '永城市', '/17/202/', '', 3, 0, 3, 0, '20030916002579');
INSERT INTO `regions` VALUES (2591, 202, '虞城县', '/17/202/', '', 3, 0, 3, 0, '20030916002580');
INSERT INTO `regions` VALUES (2592, 202, '柘城县', '/17/202/', '', 3, 0, 3, 0, '20030916002585');
INSERT INTO `regions` VALUES (2593, 718, '宝山区', '/10/718/', '', 3, 0, 2, 0, '20030916001685');
INSERT INTO `regions` VALUES (2594, 718, '长宁区', '/10/718/', '', 3, 0, 1, 0, '20030916001678');
INSERT INTO `regions` VALUES (2595, 718, '崇明县', '/10/718/', '', 3, 0, 3, 0, '20030916001693');
INSERT INTO `regions` VALUES (2596, 718, '奉贤区', '/10/718/', '', 3, 0, 1, 0, '20030916001692');
INSERT INTO `regions` VALUES (2597, 718, '虹口区', '/10/718/', '', 3, 0, 1, 0, '20030916001682');
INSERT INTO `regions` VALUES (2598, 718, '黄浦区', '/10/718/', '', 3, 0, 1, 0, '20030916001675');
INSERT INTO `regions` VALUES (2599, 718, '嘉定区', '/10/718/', '', 3, 0, 1, 0, '20030916001686');
INSERT INTO `regions` VALUES (2600, 718, '金山区', '/10/718/', '', 3, 0, 1, 0, '20030916001688');
INSERT INTO `regions` VALUES (2601, 718, '静安区', '/10/718/', '', 3, 0, 1, 0, '20030916001679');
INSERT INTO `regions` VALUES (2602, 718, '卢湾区', '/10/718/', '', 3, 0, 1, 0, '20030916001676');
INSERT INTO `regions` VALUES (2603, 718, '闵行区', '/10/718/', '', 3, 0, 1, 0, '20030916001684');
INSERT INTO `regions` VALUES (2604, 718, '南汇区', '/10/718/', '', 3, 0, 1, 0, '20030916001691');
INSERT INTO `regions` VALUES (2605, 718, '浦东新区', '/10/718/', '', 3, 0, 1, 0, '20030916001687');
INSERT INTO `regions` VALUES (2606, 718, '普陀区', '/10/718/', '', 3, 0, 1, 0, '20030916001680');
INSERT INTO `regions` VALUES (2607, 718, '青浦区', '/10/718/', '', 3, 0, 1, 0, '20030916001690');
INSERT INTO `regions` VALUES (2608, 718, '松江区', '/10/718/', '', 3, 0, 1, 0, '20030916001689');
INSERT INTO `regions` VALUES (2609, 718, '徐汇区', '/10/718/', '', 3, 0, 1, 0, '20030916001677');
INSERT INTO `regions` VALUES (2610, 718, '杨浦区', '/10/718/', '', 3, 0, 1, 0, '20030916001683');
INSERT INTO `regions` VALUES (2611, 718, '闸北区', '/10/718/', '', 3, 0, 1, 0, '20030916001681');
INSERT INTO `regions` VALUES (2612, 171, '德兴市', '/15/171/', '', 3, 0, 3, 0, '20030916001354');
INSERT INTO `regions` VALUES (2613, 171, '广丰县', '/15/171/', '', 3, 0, 3, 0, '20030916001366');
INSERT INTO `regions` VALUES (2614, 171, '横峰县', '/15/171/', '', 3, 0, 3, 0, '20030916001368');
INSERT INTO `regions` VALUES (2615, 171, '鄱阳县', '/15/171/', '', 3, 0, 3, 0, '20030916001348');
INSERT INTO `regions` VALUES (2616, 171, '铅山县', '/15/171/', '', 3, 0, 3, 0, '20030916001393');
INSERT INTO `regions` VALUES (2617, 171, '上饶县', '/15/171/', '', 3, 0, 3, 0, '3000000024580428');
INSERT INTO `regions` VALUES (2618, 171, '万年县', '/15/171/', '', 3, 0, 3, 0, '20030916001410');
INSERT INTO `regions` VALUES (2619, 171, '婺源县', '/15/171/', '', 3, 0, 3, 0, '20030916001413');
INSERT INTO `regions` VALUES (2620, 171, '信州区', '/15/171/', '', 3, 0, 2, 0, '20030916001420');
INSERT INTO `regions` VALUES (2621, 171, '弋阳县', '/15/171/', '', 3, 0, 3, 0, '20030916001428');
INSERT INTO `regions` VALUES (2622, 171, '余干县', '/15/171/', '', 3, 0, 3, 0, '20030916001434');
INSERT INTO `regions` VALUES (2623, 171, '玉山县', '/15/171/', '', 3, 0, 3, 0, '20030916001436');
INSERT INTO `regions` VALUES (2624, 237, '乐昌市', '/20/237/', '', 3, 0, 3, 0, '20030916000576');
INSERT INTO `regions` VALUES (2625, 237, '南雄市', '/20/237/', '', 3, 0, 2, 0, '20030916000577');
INSERT INTO `regions` VALUES (2626, 237, '曲江区', '/20/237/', '', 3, 0, 3, 0, '20030916000578');
INSERT INTO `regions` VALUES (2627, 237, '仁化县', '/20/237/', '', 3, 0, 3, 0, '20030916000579');
INSERT INTO `regions` VALUES (2628, 237, '乳源瑶族自治县', '/20/237/', '', 3, 0, 3, 0, '20030916000580');
INSERT INTO `regions` VALUES (2629, 237, '始兴县', '/20/237/', '', 3, 0, 3, 0, '20030916000582');
INSERT INTO `regions` VALUES (2630, 237, '翁源县', '/20/237/', '', 3, 0, 3, 0, '20030916000583');
INSERT INTO `regions` VALUES (2631, 237, '武江区', '/20/237/', '', 3, 0, 2, 0, '20030916000581');
INSERT INTO `regions` VALUES (2632, 237, '新丰县', '/20/237/', '', 3, 0, 2, 0, '20030916000585');
INSERT INTO `regions` VALUES (2633, 237, '浈江区', '/20/237/', '', 3, 0, 2, 0, '3000000137316309');
INSERT INTO `regions` VALUES (2634, 223, '北塔区', '/19/223/', '', 3, 0, 2, 0, '3000000137889097');
INSERT INTO `regions` VALUES (2635, 223, '城步苗族自治县', '/19/223/', '', 3, 0, 3, 0, '20030916000378');
INSERT INTO `regions` VALUES (2636, 223, '大祥区', '/19/223/', '', 3, 0, 2, 0, '20030916000369');
INSERT INTO `regions` VALUES (2637, 223, '洞口县', '/19/223/', '', 3, 0, 3, 0, '20030916000375');
INSERT INTO `regions` VALUES (2638, 223, '隆回县', '/19/223/', '', 3, 0, 3, 0, '20030916000374');
INSERT INTO `regions` VALUES (2639, 223, '邵东县', '/19/223/', '', 3, 0, 3, 0, '20030916000371');
INSERT INTO `regions` VALUES (2640, 223, '邵阳县', '/19/223/', '', 3, 0, 3, 0, '20030916000372');
INSERT INTO `regions` VALUES (2641, 223, '双清区', '/19/223/', '', 3, 0, 2, 0, '3000000137888966');
INSERT INTO `regions` VALUES (2642, 223, '绥宁县', '/19/223/', '', 3, 0, 3, 0, '20030916000376');
INSERT INTO `regions` VALUES (2643, 223, '武冈市', '/19/223/', '', 3, 0, 2, 0, '20030916000370');
INSERT INTO `regions` VALUES (2644, 223, '新宁县', '/19/223/', '', 3, 0, 3, 0, '20030916000377');
INSERT INTO `regions` VALUES (2645, 223, '新邵县', '/19/223/', '', 3, 0, 3, 0, '20030916000373');
INSERT INTO `regions` VALUES (2652, 234, '宝安区', '/20/234/', '', 3, 0, 2, 0, '20030916001852');
INSERT INTO `regions` VALUES (2653, 234, '福田区', '/20/234/', '', 3, 0, 2, 0, '20030916001849');
INSERT INTO `regions` VALUES (2654, 234, '龙岗区', '/20/234/', '', 3, 0, 2, 0, '20030916001851');
INSERT INTO `regions` VALUES (2655, 234, '罗湖区', '/20/234/', '', 3, 0, 2, 0, '20030916001847');
INSERT INTO `regions` VALUES (2656, 234, '南山区', '/20/234/', '', 3, 0, 2, 0, '20030916001850');
INSERT INTO `regions` VALUES (2657, 234, '盐田区', '/20/234/', '', 3, 0, 1, 0, '20030916001848');
INSERT INTO `regions` VALUES (2658, 738, '神农架林区', '/18/738/', '', 3, 0, 3, 0, '20030916002162');
INSERT INTO `regions` VALUES (2659, 74, '大东区', '/7/74/', '', 3, 0, 1, 0, '20030916001794');
INSERT INTO `regions` VALUES (2660, 74, '东陵区', '/7/74/', '', 3, 0, 1, 0, '20030916001798');
INSERT INTO `regions` VALUES (2661, 74, '法库县', '/7/74/', '', 3, 0, 3, 0, '20030916001804');
INSERT INTO `regions` VALUES (2662, 74, '和平区', '/7/74/', '', 3, 0, 1, 0, '20030916001793');
INSERT INTO `regions` VALUES (2663, 74, '皇姑区', '/7/74/', '', 3, 0, 1, 0, '20030916001795');
INSERT INTO `regions` VALUES (2664, 74, '康平县', '/7/74/', '', 3, 0, 3, 0, '20030916001803');
INSERT INTO `regions` VALUES (2665, 74, '辽中县', '/7/74/', '', 3, 0, 3, 0, '20030916001802');
INSERT INTO `regions` VALUES (2666, 74, '沈河区', '/7/74/', '', 3, 0, 1, 0, '20030916001792');
INSERT INTO `regions` VALUES (2667, 74, '苏家屯区', '/7/74/', '', 3, 0, 1, 0, '20030916001797');
INSERT INTO `regions` VALUES (2668, 74, '铁西区', '/7/74/', '', 3, 0, 2, 0, '20030916001796');
INSERT INTO `regions` VALUES (2670, 74, '新民市', '/7/74/', '', 3, 0, 2, 0, '20030916001801');
INSERT INTO `regions` VALUES (2671, 74, '于洪区', '/7/74/', '', 3, 0, 1, 0, '20030916001800');
INSERT INTO `regions` VALUES (2672, 209, '丹江口市', '/18/209/', '', 3, 0, 2, 0, '20030916002139');
INSERT INTO `regions` VALUES (2673, 209, '房县', '/18/209/', '', 3, 0, 3, 0, '20030916002142');
INSERT INTO `regions` VALUES (2674, 209, '茅箭区', '/18/209/', '', 3, 0, 2, 0, '20030916002138');
INSERT INTO `regions` VALUES (2675, 209, '郧西县', '/18/209/', '', 3, 0, 3, 0, '20030916002143');
INSERT INTO `regions` VALUES (2676, 209, '郧县', '/18/209/', '', 3, 0, 3, 0, '20030916002140');
INSERT INTO `regions` VALUES (2677, 209, '张湾区', '/18/209/', '', 3, 0, 2, 0, '20030916002137');
INSERT INTO `regions` VALUES (2678, 209, '竹山县', '/18/209/', '', 3, 0, 3, 0, '20030916002141');
INSERT INTO `regions` VALUES (2679, 209, '竹溪县', '/18/209/', '', 3, 0, 3, 0, '20030916002144');
INSERT INTO `regions` VALUES (2680, 429, '石河子市', '/32/429/', '', 3, 0, 5, 0, '20030916002175');
INSERT INTO `regions` VALUES (2681, 37, '长安区', '/4/37/', '', 3, 0, 1, 0, '20030916001694');
INSERT INTO `regions` VALUES (2682, 37, '高邑县', '/4/37/', '', 3, 0, 3, 0, '20030916001710');
INSERT INTO `regions` VALUES (2683, 37, '藁城市', '/4/37/', '', 3, 0, 3, 0, '20030916001701');
INSERT INTO `regions` VALUES (2684, 37, '晋州市', '/4/37/', '', 3, 0, 3, 0, '20030916001702');
INSERT INTO `regions` VALUES (2685, 37, '井陉矿区', '/4/37/', '', 3, 0, 1, 0, '20030916001699');
INSERT INTO `regions` VALUES (2686, 37, '井陉县', '/4/37/', '', 3, 0, 3, 0, '20030916001705');
INSERT INTO `regions` VALUES (2687, 37, '灵寿县', '/4/37/', '', 3, 0, 3, 0, '20030916001709');
INSERT INTO `regions` VALUES (2688, 37, '鹿泉市', '/4/37/', '', 3, 0, 3, 0, '20030916001704');
INSERT INTO `regions` VALUES (2689, 37, '栾城县', '/4/37/', '', 3, 0, 3, 0, '20030916001707');
INSERT INTO `regions` VALUES (2690, 37, '平山县', '/4/37/', '', 3, 0, 3, 0, '20030916001714');
INSERT INTO `regions` VALUES (2691, 37, '桥东区', '/4/37/', '', 3, 0, 1, 0, '20030916001695');
INSERT INTO `regions` VALUES (2692, 37, '桥西区', '/4/37/', '', 3, 0, 1, 0, '20030916001696');
INSERT INTO `regions` VALUES (2693, 37, '深泽县', '/4/37/', '', 3, 0, 3, 0, '20030916001711');
INSERT INTO `regions` VALUES (2694, 37, '无极县', '/4/37/', '', 3, 0, 3, 0, '20030916001713');
INSERT INTO `regions` VALUES (2695, 37, '辛集市', '/4/37/', '', 3, 0, 3, 0, '20030916001700');
INSERT INTO `regions` VALUES (2696, 37, '新华区', '/4/37/', '', 3, 0, 1, 0, '20030916001697');
INSERT INTO `regions` VALUES (2697, 37, '新乐市', '/4/37/', '', 3, 0, 2, 0, '20030916001703');
INSERT INTO `regions` VALUES (2698, 37, '行唐县', '/4/37/', '', 3, 0, 3, 0, '20030916001708');
INSERT INTO `regions` VALUES (2699, 37, '裕华区', '/4/37/', '', 3, 0, 1, 0, '20030916001698');
INSERT INTO `regions` VALUES (2700, 37, '元氏县', '/4/37/', '', 3, 0, 3, 0, '20030916001715');
INSERT INTO `regions` VALUES (2701, 37, '赞皇县', '/4/37/', '', 3, 0, 3, 0, '20030916001712');
INSERT INTO `regions` VALUES (2702, 37, '赵县', '/4/37/', '', 3, 0, 3, 0, '20030916001716');
INSERT INTO `regions` VALUES (2703, 37, '正定县', '/4/37/', '', 3, 0, 2, 0, '20030916001706');
INSERT INTO `regions` VALUES (2704, 358, '大武口区', '/31/358/', '', 3, 0, 2, 0, '20030916002452');
INSERT INTO `regions` VALUES (2705, 358, '惠农区', '/31/358/', '', 3, 0, 2, 0, '20030916002456');
INSERT INTO `regions` VALUES (2706, 358, '平罗县', '/31/358/', '', 3, 0, 3, 0, '20030916002454');
INSERT INTO `regions` VALUES (2707, 101, '宝清县', '/9/101/', '', 3, 0, 3, 0, '20030916000699');
INSERT INTO `regions` VALUES (2708, 101, '宝山区', '/9/101/', '', 3, 0, 2, 0, '20030916000696');
INSERT INTO `regions` VALUES (2709, 101, '集贤县', '/9/101/', '', 3, 0, 3, 0, '20030916000697');
INSERT INTO `regions` VALUES (2710, 101, '尖山区', '/9/101/', '', 3, 0, 2, 0, '20030916000693');
INSERT INTO `regions` VALUES (2711, 101, '岭东区', '/9/101/', '', 3, 0, 2, 0, '20030916000694');
INSERT INTO `regions` VALUES (2712, 101, '饶河县', '/9/101/', '', 3, 0, 3, 0, '20030916000700');
INSERT INTO `regions` VALUES (2713, 101, '四方台区', '/9/101/', '', 3, 0, 2, 0, '20030916000695');
INSERT INTO `regions` VALUES (2714, 101, '友谊县', '/9/101/', '', 3, 0, 3, 0, '20030916000698');
INSERT INTO `regions` VALUES (2715, 53, '怀仁县', '/5/53/', '', 3, 0, 3, 0, '20030916001957');
INSERT INTO `regions` VALUES (2716, 53, '平鲁区', '/5/53/', '', 3, 0, 3, 0, '20030916001953');
INSERT INTO `regions` VALUES (2717, 53, '山阴县', '/5/53/', '', 3, 0, 3, 0, '20030916001954');
INSERT INTO `regions` VALUES (2718, 53, '朔城区', '/5/53/', '', 3, 0, 2, 0, '20030916001952');
INSERT INTO `regions` VALUES (2719, 53, '应县', '/5/53/', '', 3, 0, 3, 0, '20030916001955');
INSERT INTO `regions` VALUES (2720, 53, '右玉县', '/5/53/', '', 3, 0, 3, 0, '20030916001956');
INSERT INTO `regions` VALUES (2721, 308, '翠云区', '/26/308/', '', 3, 0, 3, 0, '20030916001112');
INSERT INTO `regions` VALUES (2722, 308, '江城哈尼族彝族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001118');
INSERT INTO `regions` VALUES (2723, 308, '景东彝族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001115');
INSERT INTO `regions` VALUES (2724, 308, '景谷傣族彝族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001116');
INSERT INTO `regions` VALUES (2725, 308, '澜沧拉祜族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001120');
INSERT INTO `regions` VALUES (2726, 308, '孟连傣族拉祜族佤族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001119');
INSERT INTO `regions` VALUES (2727, 308, '墨江哈尼族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001114');
INSERT INTO `regions` VALUES (2728, 308, '宁洱哈尼族彝族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001113');
INSERT INTO `regions` VALUES (2729, 308, '西盟佤族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001121');
INSERT INTO `regions` VALUES (2730, 308, '镇沅彝族哈尼族拉祜族自治县', '/26/308/', '', 3, 0, 3, 0, '20030916001117');
INSERT INTO `regions` VALUES (2731, 90, '公主岭市', '/8/90/', '', 3, 0, 2, 0, '20030916000194');
INSERT INTO `regions` VALUES (2732, 90, '梨树县', '/8/90/', '', 3, 0, 3, 0, '20030916000195');
INSERT INTO `regions` VALUES (2733, 90, '双辽市', '/8/90/', '', 3, 0, 2, 0, '20030916000193');
INSERT INTO `regions` VALUES (2734, 90, '铁东区', '/8/90/', '', 3, 0, 2, 0, '20030916000192');
INSERT INTO `regions` VALUES (2735, 90, '铁西区', '/8/90/', '', 3, 0, 2, 0, '20030916000191');
INSERT INTO `regions` VALUES (2736, 90, '伊通满族自治县', '/8/90/', '', 3, 0, 3, 0, '20030916000196');
INSERT INTO `regions` VALUES (2737, 94, '长岭县', '/8/94/', '', 3, 0, 3, 0, '20030916000179');
INSERT INTO `regions` VALUES (2738, 94, '扶余县', '/8/94/', '', 3, 0, 3, 0, '20030916000178');
INSERT INTO `regions` VALUES (2739, 94, '宁江区', '/8/94/', '', 3, 0, 2, 0, '20030916000177');
INSERT INTO `regions` VALUES (2740, 94, '前郭尔罗斯蒙古族自治县', '/8/94/', '', 3, 0, 3, 0, '20030916000181');
INSERT INTO `regions` VALUES (2741, 94, '乾安县', '/8/94/', '', 3, 0, 3, 0, '20030916000180');
INSERT INTO `regions` VALUES (2742, 115, '沧浪区', '/11/115/', '', 3, 0, 2, 0, '3000000137302057');
INSERT INTO `regions` VALUES (2743, 115, '常熟市', '/11/115/', '', 3, 0, 3, 0, '20030916002127');
INSERT INTO `regions` VALUES (2744, 115, '虎丘区', '/11/115/', '', 3, 0, 2, 0, '3000000137302224');
INSERT INTO `regions` VALUES (2745, 115, '金阊区', '/11/115/', '', 3, 0, 2, 0, '3000000137301999');
INSERT INTO `regions` VALUES (2746, 115, '昆山市', '/11/115/', '', 3, 0, 3, 0, '20030916002125');
INSERT INTO `regions` VALUES (2747, 115, '平江区', '/11/115/', '', 3, 0, 2, 0, '3000000137302093');
INSERT INTO `regions` VALUES (2748, 115, '太仓市', '/11/115/', '', 3, 0, 3, 0, '20030916002126');
INSERT INTO `regions` VALUES (2749, 115, '吴江市', '/11/115/', '', 3, 0, 3, 0, '20030916002124');
INSERT INTO `regions` VALUES (2750, 115, '吴中区', '/11/115/', '', 3, 0, 2, 0, '3000000137302409');
INSERT INTO `regions` VALUES (2751, 115, '相城区', '/11/115/', '', 3, 0, 2, 0, '3000000137302465');
INSERT INTO `regions` VALUES (2752, 115, '张家港市', '/11/115/', '', 3, 0, 3, 0, '20030916002128');
INSERT INTO `regions` VALUES (2753, 123, '沭阳县', '/11/123/', '', 3, 0, 3, 0, '20030916002435');
INSERT INTO `regions` VALUES (2754, 123, '泗洪县', '/11/123/', '', 3, 0, 3, 0, '20030916002437');
INSERT INTO `regions` VALUES (2755, 123, '泗阳县', '/11/123/', '', 3, 0, 3, 0, '20030916002436');
INSERT INTO `regions` VALUES (2756, 123, '宿城区', '/11/123/', '', 3, 0, 2, 0, '20030916002434');
INSERT INTO `regions` VALUES (2757, 123, '宿豫区', '/11/123/', '', 3, 0, 3, 0, '3000000137779255');
INSERT INTO `regions` VALUES (2763, 108, '安达市', '/9/108/', '', 3, 0, 2, 0, '20030916000725');
INSERT INTO `regions` VALUES (2764, 108, '北林区', '/9/108/', '', 3, 0, 3, 0, '20030916000724');
INSERT INTO `regions` VALUES (2765, 108, '海伦市', '/9/108/', '', 3, 0, 3, 0, '20030916000727');
INSERT INTO `regions` VALUES (2766, 108, '兰西县', '/9/108/', '', 3, 0, 3, 0, '20030916000729');
INSERT INTO `regions` VALUES (2767, 108, '明水县', '/9/108/', '', 3, 0, 3, 0, '20030916000732');
INSERT INTO `regions` VALUES (2768, 108, '青冈县', '/9/108/', '', 3, 0, 3, 0, '20030916000730');
INSERT INTO `regions` VALUES (2769, 108, '庆安县', '/9/108/', '', 3, 0, 3, 0, '20030916000731');
INSERT INTO `regions` VALUES (2770, 108, '绥棱县', '/9/108/', '', 3, 0, 3, 0, '20030916000733');
INSERT INTO `regions` VALUES (2771, 108, '望奎县', '/9/108/', '', 3, 0, 3, 0, '20030916000728');
INSERT INTO `regions` VALUES (2772, 108, '肇东市', '/9/108/', '', 3, 0, 3, 0, '20030916000726');
INSERT INTO `regions` VALUES (2773, 217, '广水市', '/18/217/', '', 3, 0, 2, 0, '20030916002105');
INSERT INTO `regions` VALUES (2774, 217, '曾都区', '/18/217/', '', 3, 0, 2, 0, '20030916002161');
INSERT INTO `regions` VALUES (2775, 279, '安居区', '/24/279/', '', 3, 0, 3, 0, '20030916000074');
INSERT INTO `regions` VALUES (2776, 279, '船山区', '/24/279/', '', 3, 0, 2, 0, '20030916000075');
INSERT INTO `regions` VALUES (2777, 279, '大英县', '/24/279/', '', 3, 0, 3, 0, '20030916000078');
INSERT INTO `regions` VALUES (2778, 279, '蓬溪县', '/24/279/', '', 3, 0, 3, 0, '20030916000076');
INSERT INTO `regions` VALUES (2779, 279, '射洪县', '/24/279/', '', 3, 0, 3, 0, '20030916000077');
INSERT INTO `regions` VALUES (2780, 374, '额敏县', '/32/374/', '', 3, 0, 3, 0, '20030916002248');
INSERT INTO `regions` VALUES (2781, 374, '和布克赛尔蒙古自治县', '/32/374/', '', 3, 0, 3, 0, '20030916002252');
INSERT INTO `regions` VALUES (2782, 374, '沙湾县', '/32/374/', '', 3, 0, 3, 0, '20030916002249');
INSERT INTO `regions` VALUES (2784, 374, '塔城市', '/32/374/', '', 3, 0, 3, 0, '20030916002246');
INSERT INTO `regions` VALUES (2785, 374, '托里县', '/32/374/', '', 3, 0, 3, 0, '20030916002250');
INSERT INTO `regions` VALUES (2786, 374, '乌苏市', '/32/374/', '', 3, 0, 3, 0, '20030916002247');
INSERT INTO `regions` VALUES (2787, 374, '裕民县', '/32/374/', '', 3, 0, 3, 0, '20030916002251');
INSERT INTO `regions` VALUES (2797, 48, '古交市', '/5/48/', '', 3, 0, 2, 0, '20030916001937');
INSERT INTO `regions` VALUES (2798, 48, '尖草坪区', '/5/48/', '', 3, 0, 1, 0, '20030916001934');
INSERT INTO `regions` VALUES (2799, 48, '晋源区', '/5/48/', '', 3, 0, 1, 0, '20030916001936');
INSERT INTO `regions` VALUES (2800, 48, '娄烦县', '/5/48/', '', 3, 0, 3, 0, '20030916001940');
INSERT INTO `regions` VALUES (2801, 48, '清徐县', '/5/48/', '', 3, 0, 3, 0, '20030916001938');
INSERT INTO `regions` VALUES (2802, 48, '万柏林区', '/5/48/', '', 3, 0, 1, 0, '20030916001935');
INSERT INTO `regions` VALUES (2803, 48, '小店区', '/5/48/', '', 3, 0, 1, 0, '20030916001932');
INSERT INTO `regions` VALUES (2804, 48, '杏花岭区', '/5/48/', '', 3, 0, 1, 0, '20030916001931');
INSERT INTO `regions` VALUES (2805, 48, '阳曲县', '/5/48/', '', 3, 0, 3, 0, '20030916001939');
INSERT INTO `regions` VALUES (2806, 48, '迎泽区', '/5/48/', '', 3, 0, 1, 0, '20030916001933');
INSERT INTO `regions` VALUES (2807, 180, '岱岳区', '/16/180/', '', 3, 0, 2, 0, '3000000137778900');
INSERT INTO `regions` VALUES (2808, 180, '东平县', '/16/180/', '', 3, 0, 3, 0, '20030916000990');
INSERT INTO `regions` VALUES (2809, 180, '肥城市', '/16/180/', '', 3, 0, 2, 0, '20030916000991');
INSERT INTO `regions` VALUES (2810, 180, '宁阳县', '/16/180/', '', 3, 0, 3, 0, '20030916000992');
INSERT INTO `regions` VALUES (2811, 180, '泰山区', '/16/180/', '', 3, 0, 2, 0, '20030916000993');
INSERT INTO `regions` VALUES (2812, 180, '新泰市', '/16/180/', '', 3, 0, 2, 0, '20030916000994');
INSERT INTO `regions` VALUES (2813, 122, '高港区', '/11/122/', '', 3, 0, 2, 0, '20030916002795');
INSERT INTO `regions` VALUES (2814, 122, '海陵区', '/11/122/', '', 3, 0, 2, 0, '3000000137303289');
INSERT INTO `regions` VALUES (2815, 122, '姜堰市', '/11/122/', '', 3, 0, 2, 0, '20030916002798');
INSERT INTO `regions` VALUES (2816, 122, '靖江市', '/11/122/', '', 3, 0, 3, 0, '20030916002796');
INSERT INTO `regions` VALUES (2817, 122, '泰兴市', '/11/122/', '', 3, 0, 3, 0, '20030916002797');
INSERT INTO `regions` VALUES (2818, 122, '兴化市', '/11/122/', '', 3, 0, 3, 0, '20030916002799');
INSERT INTO `regions` VALUES (2819, 38, '丰南区', '/4/38/', '', 3, 0, 1, 0, '20030916001904');
INSERT INTO `regions` VALUES (2820, 38, '丰润区', '/4/38/', '', 3, 0, 1, 0, '20030916001901');
INSERT INTO `regions` VALUES (2821, 38, '古冶区', '/4/38/', '', 3, 0, 1, 0, '20030916001899');
INSERT INTO `regions` VALUES (2822, 38, '开平区', '/4/38/', '', 3, 0, 1, 0, '20030916001900');
INSERT INTO `regions` VALUES (2823, 38, '乐亭县', '/4/38/', '', 3, 0, 2, 0, '20030916001910');
INSERT INTO `regions` VALUES (2824, 38, '路北区', '/4/38/', '', 3, 0, 1, 0, '20030916001897');
INSERT INTO `regions` VALUES (2825, 38, '路南区', '/4/38/', '', 3, 0, 1, 0, '20030916001898');
INSERT INTO `regions` VALUES (2826, 38, '滦南县', '/4/38/', '', 3, 0, 3, 0, '20030916001907');
INSERT INTO `regions` VALUES (2827, 38, '滦县', '/4/38/', '', 3, 0, 3, 0, '20030916001906');
INSERT INTO `regions` VALUES (2828, 38, '迁安市', '/4/38/', '', 3, 0, 2, 0, '20030916001903');
INSERT INTO `regions` VALUES (2829, 38, '迁西县', '/4/38/', '', 3, 0, 2, 0, '20030916001905');
INSERT INTO `regions` VALUES (2830, 38, '唐海县', '/4/38/', '', 3, 0, 3, 0, '20030916001909');
INSERT INTO `regions` VALUES (2831, 38, '玉田县', '/4/38/', '', 3, 0, 3, 0, '20030916001908');
INSERT INTO `regions` VALUES (2832, 38, '遵化市', '/4/38/', '', 3, 0, 3, 0, '20030916001902');
INSERT INTO `regions` VALUES (2833, 717, '宝坻区', '/3/717/', '', 3, 0, 1, 0, '20030916001867');
INSERT INTO `regions` VALUES (2834, 717, '北辰区', '/3/717/', '', 3, 0, 2, 0, '20030916001865');
INSERT INTO `regions` VALUES (2836, 717, '东丽区', '/3/717/', '', 3, 0, 1, 0, '20030916001862');
INSERT INTO `regions` VALUES (2838, 717, '和平区', '/3/717/', '', 3, 0, 1, 0, '20030916001853');
INSERT INTO `regions` VALUES (2839, 717, '河北区', '/3/717/', '', 3, 0, 1, 0, '20030916001857');
INSERT INTO `regions` VALUES (2840, 717, '河东区', '/3/717/', '', 3, 0, 1, 0, '20030916001854');
INSERT INTO `regions` VALUES (2841, 717, '河西区', '/3/717/', '', 3, 0, 1, 0, '20030916001855');
INSERT INTO `regions` VALUES (2842, 717, '红桥区', '/3/717/', '', 3, 0, 1, 0, '20030916001858');
INSERT INTO `regions` VALUES (2843, 717, '蓟县', '/3/717/', '', 3, 0, 2, 0, '20030916001868');
INSERT INTO `regions` VALUES (2844, 717, '津南区', '/3/717/', '', 3, 0, 1, 0, '20030916001864');
INSERT INTO `regions` VALUES (2845, 717, '静海县', '/3/717/', '', 3, 0, 3, 0, '20030916001870');
INSERT INTO `regions` VALUES (2846, 717, '南开区', '/3/717/', '', 3, 0, 1, 0, '20030916001856');
INSERT INTO `regions` VALUES (2847, 717, '宁河县', '/3/717/', '', 3, 0, 3, 0, '20030916001869');
INSERT INTO `regions` VALUES (2849, 717, '武清区', '/3/717/', '', 3, 0, 2, 0, '20030916001866');
INSERT INTO `regions` VALUES (2850, 717, '西青区', '/3/717/', '', 3, 0, 2, 0, '20030916001863');
INSERT INTO `regions` VALUES (2851, 739, '天门市', '/18/739/', '', 3, 0, 2, 0, '20030916002107');
INSERT INTO `regions` VALUES (2852, 339, '甘谷县', '/29/339/', '', 3, 0, 3, 0, '20030916001233');
INSERT INTO `regions` VALUES (2853, 339, '麦积区', '/29/339/', '', 3, 0, 2, 0, '20030916001230');
INSERT INTO `regions` VALUES (2854, 339, '秦安县', '/29/339/', '', 3, 0, 3, 0, '20030916001232');
INSERT INTO `regions` VALUES (2855, 339, '秦州区', '/29/339/', '', 3, 0, 2, 0, '3000000138653081');
INSERT INTO `regions` VALUES (2856, 339, '清水县', '/29/339/', '', 3, 0, 3, 0, '20030916001231');
INSERT INTO `regions` VALUES (2857, 339, '武山县', '/29/339/', '', 3, 0, 3, 0, '20030916001234');
INSERT INTO `regions` VALUES (2858, 339, '张家川回族自治县', '/29/339/', '', 3, 0, 3, 0, '20030916001235');
INSERT INTO `regions` VALUES (2859, 85, '昌图县', '/7/85/', '', 3, 0, 3, 0, '20030916001811');
INSERT INTO `regions` VALUES (2860, 85, '调兵山市', '/7/85/', '', 3, 0, 2, 0, '20030916001807');
INSERT INTO `regions` VALUES (2861, 85, '开原市', '/7/85/', '', 3, 0, 2, 0, '20030916001808');
INSERT INTO `regions` VALUES (2862, 85, '清河区', '/7/85/', '', 3, 0, 2, 0, '20030916001806');
INSERT INTO `regions` VALUES (2863, 85, '铁岭县', '/7/85/', '', 3, 0, 3, 0, '20030916001809');
INSERT INTO `regions` VALUES (2864, 85, '西丰县', '/7/85/', '', 3, 0, 3, 0, '20030916001810');
INSERT INTO `regions` VALUES (2865, 85, '银州区', '/7/85/', '', 3, 0, 2, 0, '20030916001805');
INSERT INTO `regions` VALUES (2866, 92, '东昌区', '/8/92/', '', 3, 0, 2, 0, '20030916000201');
INSERT INTO `regions` VALUES (2867, 92, '二道江区', '/8/92/', '', 3, 0, 2, 0, '20030916000202');
INSERT INTO `regions` VALUES (2868, 92, '辉南县', '/8/92/', '', 3, 0, 3, 0, '20030916000206');
INSERT INTO `regions` VALUES (2869, 92, '集安市', '/8/92/', '', 3, 0, 2, 0, '20030916000204');
INSERT INTO `regions` VALUES (2870, 92, '柳河县', '/8/92/', '', 3, 0, 3, 0, '20030916000207');
INSERT INTO `regions` VALUES (2871, 92, '梅河口市', '/8/92/', '', 3, 0, 2, 0, '20030916000203');
INSERT INTO `regions` VALUES (2872, 92, '通化县', '/8/92/', '', 3, 0, 3, 0, '20030916000205');
INSERT INTO `regions` VALUES (2873, 66, '霍林郭勒市', '/6/66/', '', 3, 0, 2, 0, '20030916001840');
INSERT INTO `regions` VALUES (2874, 66, '开鲁县', '/6/66/', '', 3, 0, 3, 0, '20030916001841');
INSERT INTO `regions` VALUES (2875, 66, '科尔沁区', '/6/66/', '', 3, 0, 2, 0, '20030916001839');
INSERT INTO `regions` VALUES (2876, 66, '科尔沁左翼后旗', '/6/66/', '', 3, 0, 3, 0, '20030916001846');
INSERT INTO `regions` VALUES (2877, 66, '科尔沁左翼中旗', '/6/66/', '', 3, 0, 4, 0, '20030916001845');
INSERT INTO `regions` VALUES (2878, 66, '库伦旗', '/6/66/', '', 3, 0, 4, 0, '20030916001842');
INSERT INTO `regions` VALUES (2879, 66, '奈曼旗', '/6/66/', '', 3, 0, 4, 0, '20030916001843');
INSERT INTO `regions` VALUES (2880, 66, '扎鲁特旗', '/6/66/', '', 3, 0, 4, 0, '20030916001844');
INSERT INTO `regions` VALUES (2881, 326, '王益区', '/28/326/', '', 3, 0, 2, 0, '3000000137306376');
INSERT INTO `regions` VALUES (2882, 326, '耀州区', '/28/326/', '', 3, 0, 2, 0, '20030916002768');
INSERT INTO `regions` VALUES (2883, 326, '宜君县', '/28/326/', '', 3, 0, 3, 0, '20030916002770');
INSERT INTO `regions` VALUES (2884, 326, '印台区', '/28/326/', '', 3, 0, 2, 0, '20030916002749');
INSERT INTO `regions` VALUES (2889, 297, '德江县', '/25/297/', '', 3, 0, 3, 0, '20030916000449');
INSERT INTO `regions` VALUES (2890, 297, '江口县', '/25/297/', '', 3, 0, 3, 0, '20030916000446');
INSERT INTO `regions` VALUES (2891, 297, '石阡县', '/25/297/', '', 3, 0, 3, 0, '20030916000447');
INSERT INTO `regions` VALUES (2892, 297, '思南县', '/25/297/', '', 3, 0, 3, 0, '20030916000448');
INSERT INTO `regions` VALUES (2893, 297, '松桃苗族自治县', '/25/297/', '', 3, 0, 3, 0, '20030916000453');
INSERT INTO `regions` VALUES (2894, 297, '铜仁市', '/25/297/', '', 3, 0, 2, 0, '20030916000445');
INSERT INTO `regions` VALUES (2895, 297, '万山特区', '/25/297/', '', 3, 0, 3, 0, '20030916000454');
INSERT INTO `regions` VALUES (2896, 297, '沿河土家族自治县', '/25/297/', '', 3, 0, 3, 0, '20030916000452');
INSERT INTO `regions` VALUES (2897, 297, '印江土家族苗族自治县', '/25/297/', '', 3, 0, 3, 0, '20030916000451');
INSERT INTO `regions` VALUES (2898, 297, '玉屏侗族自治县', '/25/297/', '', 3, 0, 3, 0, '20030916000450');
INSERT INTO `regions` VALUES (2900, 740, '鄯善县', '/32/740/', '', 3, 0, 3, 0, '20030916002208');
INSERT INTO `regions` VALUES (2901, 740, '吐鲁番市', '/32/740/', '', 3, 0, 3, 0, '20030916002207');
INSERT INTO `regions` VALUES (2902, 740, '托克逊县', '/32/740/', '', 3, 0, 3, 0, '20030916002209');
INSERT INTO `regions` VALUES (2903, 181, '环翠区', '/16/181/', '', 3, 0, 2, 0, '20030916002491');
INSERT INTO `regions` VALUES (2904, 181, '荣成市', '/16/181/', '', 3, 0, 2, 0, '20030916002490');
INSERT INTO `regions` VALUES (2905, 181, '乳山市', '/16/181/', '', 3, 0, 2, 0, '20030916002486');
INSERT INTO `regions` VALUES (2906, 181, '文登市', '/16/181/', '', 3, 0, 2, 0, '20030916002483');
INSERT INTO `regions` VALUES (2907, 178, '安丘市', '/16/178/', '', 3, 0, 3, 0, '20030916001613');
INSERT INTO `regions` VALUES (2908, 178, '昌乐县', '/16/178/', '', 3, 0, 3, 0, '20030916001611');
INSERT INTO `regions` VALUES (2909, 178, '昌邑市', '/16/178/', '', 3, 0, 2, 0, '20030916001617');
INSERT INTO `regions` VALUES (2910, 178, '坊子区', '/16/178/', '', 3, 0, 3, 0, '3000000137303878');
INSERT INTO `regions` VALUES (2911, 178, '高密市', '/16/178/', '', 3, 0, 3, 0, '20030916001605');
INSERT INTO `regions` VALUES (2912, 178, '寒亭区', '/16/178/', '', 3, 0, 2, 0, '3000000137303848');
INSERT INTO `regions` VALUES (2913, 178, '奎文区', '/16/178/', '', 3, 0, 2, 0, '20030916001601');
INSERT INTO `regions` VALUES (2914, 178, '临朐县', '/16/178/', '', 3, 0, 3, 0, '20030916001616');
INSERT INTO `regions` VALUES (2915, 178, '青州市', '/16/178/', '', 3, 0, 2, 0, '20030916001602');
INSERT INTO `regions` VALUES (2916, 178, '寿光市', '/16/178/', '', 3, 0, 2, 0, '20030916001614');
INSERT INTO `regions` VALUES (2917, 178, '潍城区', '/16/178/', '', 3, 0, 2, 0, '3000000137303836');
INSERT INTO `regions` VALUES (2918, 178, '诸城市', '/16/178/', '', 3, 0, 2, 0, '20030916001609');
INSERT INTO `regions` VALUES (2919, 329, '白水县', '/28/329/', '', 3, 0, 3, 0, '20030916002685');
INSERT INTO `regions` VALUES (2920, 329, '澄城县', '/28/329/', '', 3, 0, 3, 0, '20030916002693');
INSERT INTO `regions` VALUES (2921, 329, '大荔县', '/28/329/', '', 3, 0, 3, 0, '20030916002695');
INSERT INTO `regions` VALUES (2922, 329, '富平县', '/28/329/', '', 3, 0, 3, 0, '20030916002702');
INSERT INTO `regions` VALUES (2923, 329, '韩城市', '/28/329/', '', 3, 0, 2, 0, '20030916002706');
INSERT INTO `regions` VALUES (2924, 329, '合阳县', '/28/329/', '', 3, 0, 3, 0, '20030916002709');
INSERT INTO `regions` VALUES (2925, 329, '华县', '/28/329/', '', 3, 0, 3, 0, '20030916002712');
INSERT INTO `regions` VALUES (2926, 329, '华阴市', '/28/329/', '', 3, 0, 2, 0, '20030916002713');
INSERT INTO `regions` VALUES (2927, 329, '临渭区', '/28/329/', '', 3, 0, 2, 0, '20030916002752');
INSERT INTO `regions` VALUES (2928, 329, '蒲城县', '/28/329/', '', 3, 0, 3, 0, '20030916002736');
INSERT INTO `regions` VALUES (2929, 329, '潼关县', '/28/329/', '', 3, 0, 3, 0, '20030916002750');
INSERT INTO `regions` VALUES (2941, 310, '富宁县', '/26/310/', '', 3, 0, 3, 0, '20030916001184');
INSERT INTO `regions` VALUES (2942, 310, '广南县', '/26/310/', '', 3, 0, 3, 0, '20030916001183');
INSERT INTO `regions` VALUES (2943, 310, '麻栗坡县', '/26/310/', '', 3, 0, 3, 0, '20030916001180');
INSERT INTO `regions` VALUES (2944, 310, '马关县', '/26/310/', '', 3, 0, 3, 0, '20030916001181');
INSERT INTO `regions` VALUES (2945, 310, '丘北县', '/26/310/', '', 3, 0, 3, 0, '20030916001182');
INSERT INTO `regions` VALUES (2946, 310, '文山县', '/26/310/', '', 3, 0, 3, 0, '20030916001177');
INSERT INTO `regions` VALUES (2947, 310, '西畴县', '/26/310/', '', 3, 0, 3, 0, '20030916001179');
INSERT INTO `regions` VALUES (2948, 310, '砚山县', '/26/310/', '', 3, 0, 3, 0, '20030916001178');
INSERT INTO `regions` VALUES (2949, 64, '海勃湾区', '/6/64/', '', 3, 0, 2, 0, '20030916002470');
INSERT INTO `regions` VALUES (2950, 64, '海南区', '/6/64/', '', 3, 0, 2, 0, '3000000137315973');
INSERT INTO `regions` VALUES (2951, 64, '乌达区', '/6/64/', '', 3, 0, 2, 0, '3000000137316040');
INSERT INTO `regions` VALUES (2952, 70, '察哈尔右翼后旗', '/6/70/', '', 3, 0, 3, 0, '20030916001490');
INSERT INTO `regions` VALUES (2953, 70, '察哈尔右翼前旗', '/6/70/', '', 3, 0, 3, 0, '20030916001488');
INSERT INTO `regions` VALUES (2954, 70, '察哈尔右翼中旗', '/6/70/', '', 3, 0, 3, 0, '20030916001489');
INSERT INTO `regions` VALUES (2955, 70, '丰镇市', '/6/70/', '', 3, 0, 3, 0, '20030916001482');
INSERT INTO `regions` VALUES (2956, 70, '化德县', '/6/70/', '', 3, 0, 3, 0, '20030916001484');
INSERT INTO `regions` VALUES (2957, 70, '集宁区', '/6/70/', '', 3, 0, 2, 0, '20030916001481');
INSERT INTO `regions` VALUES (2958, 70, '凉城县', '/6/70/', '', 3, 0, 3, 0, '20030916001487');
INSERT INTO `regions` VALUES (2959, 70, '商都县', '/6/70/', '', 3, 0, 3, 0, '20030916001485');
INSERT INTO `regions` VALUES (2960, 70, '四子王旗', '/6/70/', '', 3, 0, 3, 0, '20030916001491');
INSERT INTO `regions` VALUES (2961, 70, '兴和县', '/6/70/', '', 3, 0, 3, 0, '20030916001486');
INSERT INTO `regions` VALUES (2962, 70, '卓资县', '/6/70/', '', 3, 0, 3, 0, '20030916001483');
INSERT INTO `regions` VALUES (2963, 362, '达坂城区', '/32/362/', '', 3, 0, 1, 0, '20030916002168');
INSERT INTO `regions` VALUES (2965, 362, '沙依巴克区', '/32/362/', '', 3, 0, 1, 0, '20030916002164');
INSERT INTO `regions` VALUES (2966, 362, '水磨沟区', '/32/362/', '', 3, 0, 1, 0, '20030916002166');
INSERT INTO `regions` VALUES (2967, 362, '天山区', '/32/362/', '', 3, 0, 1, 0, '20030916002163');
INSERT INTO `regions` VALUES (2968, 362, '头屯河区', '/32/362/', '', 3, 0, 1, 0, '20030916002167');
INSERT INTO `regions` VALUES (2969, 362, '乌鲁木齐县', '/32/362/', '', 3, 0, 3, 0, '20030916002170');
INSERT INTO `regions` VALUES (2970, 362, '新市区', '/32/362/', '', 3, 0, 1, 0, '20030916002165');
INSERT INTO `regions` VALUES (2971, 112, '北塘区', '/11/112/', '', 3, 0, 1, 0, '3000000137083574');
INSERT INTO `regions` VALUES (2972, 112, '滨湖区', '/11/112/', '', 3, 0, 1, 0, '3000000137316914');
INSERT INTO `regions` VALUES (2973, 112, '崇安区', '/11/112/', '', 3, 0, 1, 0, '20030916002117');
INSERT INTO `regions` VALUES (2974, 112, '惠山区', '/11/112/', '', 3, 0, 1, 0, '3000000137083608');
INSERT INTO `regions` VALUES (2975, 112, '江阴市', '/11/112/', '', 3, 0, 2, 0, '20030916002119');
INSERT INTO `regions` VALUES (2976, 112, '南长区', '/11/112/', '', 3, 0, 1, 0, '3000000137083567');
INSERT INTO `regions` VALUES (2977, 112, '锡山区', '/11/112/', '', 3, 0, 1, 0, '3000000137083629');
INSERT INTO `regions` VALUES (2978, 112, '宜兴市', '/11/112/', '', 3, 0, 2, 0, '20030916002118');
INSERT INTO `regions` VALUES (2979, 359, '利通区', '/31/359/', '', 3, 0, 2, 0, '20030916002458');
INSERT INTO `regions` VALUES (2980, 359, '青铜峡市', '/31/359/', '', 3, 0, 2, 0, '20030916002459');
INSERT INTO `regions` VALUES (2981, 359, '同心县', '/31/359/', '', 3, 0, 3, 0, '20030916002463');
INSERT INTO `regions` VALUES (2982, 359, '盐池县', '/31/359/', '', 3, 0, 3, 0, '20030916002462');
INSERT INTO `regions` VALUES (2990, 257, '苍梧县', '/21/257/', '', 3, 0, 3, 0, '20030916001584');
INSERT INTO `regions` VALUES (2991, 257, '岑溪市', '/21/257/', '', 3, 0, 3, 0, '20030916001587');
INSERT INTO `regions` VALUES (2992, 257, '长洲区', '/21/257/', '', 3, 0, 2, 0, '3000000137786069');
INSERT INTO `regions` VALUES (2993, 257, '蝶山区', '/21/257/', '', 3, 0, 2, 0, '3000000137785967');
INSERT INTO `regions` VALUES (2994, 257, '蒙山县', '/21/257/', '', 3, 0, 3, 0, '20030916001585');
INSERT INTO `regions` VALUES (2995, 257, '藤县', '/21/257/', '', 3, 0, 3, 0, '20030916001591');
INSERT INTO `regions` VALUES (2996, 257, '万秀区', '/21/257/', '', 3, 0, 2, 0, '20030916001586');
INSERT INTO `regions` VALUES (2997, 741, '五家渠市', '/32/741/', '', 3, 0, 3, 0, '20030916002178');
INSERT INTO `regions` VALUES (2998, 206, '蔡甸区', '/18/206/', '', 3, 0, 1, 0, '20030916002047');
INSERT INTO `regions` VALUES (2999, 206, '东西湖区', '/18/206/', '', 3, 0, 1, 0, '20030916002045');
INSERT INTO `regions` VALUES (3000, 206, '汉南区', '/18/206/', '', 3, 0, 1, 0, '20030916002046');
INSERT INTO `regions` VALUES (3001, 206, '汉阳区', '/18/206/', '', 3, 0, 1, 0, '20030916002041');
INSERT INTO `regions` VALUES (3002, 206, '洪山区', '/18/206/', '', 3, 0, 1, 0, '20030916002044');
INSERT INTO `regions` VALUES (3003, 206, '黄陂区', '/18/206/', '', 3, 0, 1, 0, '20030916002049');
INSERT INTO `regions` VALUES (3004, 206, '江岸区', '/18/206/', '', 3, 0, 1, 0, '20030916002038');
INSERT INTO `regions` VALUES (3005, 206, '江汉区', '/18/206/', '', 3, 0, 1, 0, '20030916002039');
INSERT INTO `regions` VALUES (3006, 206, '江夏区', '/18/206/', '', 3, 0, 1, 0, '20030916002857');
INSERT INTO `regions` VALUES (3007, 206, '硚口区', '/18/206/', '', 3, 0, 1, 0, '20030916002040');
INSERT INTO `regions` VALUES (3008, 206, '青山区', '/18/206/', '', 3, 0, 1, 0, '20030916002043');
INSERT INTO `regions` VALUES (3009, 206, '武昌区', '/18/206/', '', 3, 0, 1, 0, '20030916002042');
INSERT INTO `regions` VALUES (3010, 206, '新洲区', '/18/206/', '', 3, 0, 1, 0, '20030916002050');
INSERT INTO `regions` VALUES (3011, 340, '古浪县', '/29/340/', '', 3, 0, 2, 0, '20030916001239');
INSERT INTO `regions` VALUES (3012, 340, '凉州区', '/29/340/', '', 3, 0, 2, 0, '20030916001237');
INSERT INTO `regions` VALUES (3013, 340, '民勤县', '/29/340/', '', 3, 0, 3, 0, '20030916001238');
INSERT INTO `regions` VALUES (3014, 340, '天祝藏族自治县', '/29/340/', '', 3, 0, 3, 0, '20030916001240');
INSERT INTO `regions` VALUES (3015, 325, '灞桥区', '/28/325/', '', 3, 0, 1, 0, '20030916002683');
INSERT INTO `regions` VALUES (3016, 325, '碑林区', '/28/325/', '', 3, 0, 1, 0, '20030916002688');
INSERT INTO `regions` VALUES (3017, 325, '长安区', '/28/325/', '', 3, 0, 1, 0, '20030916002690');
INSERT INTO `regions` VALUES (3018, 325, '高陵县', '/28/325/', '', 3, 0, 3, 0, '20030916002705');
INSERT INTO `regions` VALUES (3019, 325, '户县', '/28/325/', '', 3, 0, 3, 0, '20030916002711');
INSERT INTO `regions` VALUES (3020, 325, '蓝田县', '/28/325/', '', 3, 0, 3, 0, '20030916002719');
INSERT INTO `regions` VALUES (3021, 325, '莲湖区', '/28/325/', '', 3, 0, 1, 0, '20030916002721');
INSERT INTO `regions` VALUES (3022, 325, '临潼区', '/28/325/', '', 3, 0, 1, 0, '20030916002722');
INSERT INTO `regions` VALUES (3023, 325, '未央区', '/28/325/', '', 3, 0, 1, 0, '20030916002751');
INSERT INTO `regions` VALUES (3024, 325, '新城区', '/28/325/', '', 3, 0, 1, 0, '20030916002758');
INSERT INTO `regions` VALUES (3025, 325, '阎良区', '/28/325/', '', 3, 0, 1, 0, '20030916002764');
INSERT INTO `regions` VALUES (3026, 325, '雁塔区', '/28/325/', '', 3, 0, 1, 0, '20030916002765');
INSERT INTO `regions` VALUES (3027, 325, '周至县', '/28/325/', '', 3, 0, 3, 0, '20030916002777');
INSERT INTO `regions` VALUES (3028, 349, '城北区', '/30/349/', '', 3, 0, 1, 0, '20030916002302');
INSERT INTO `regions` VALUES (3029, 349, '城东区', '/30/349/', '', 3, 0, 1, 0, '20030916002300');
INSERT INTO `regions` VALUES (3030, 349, '城西区', '/30/349/', '', 3, 0, 1, 0, '20030916002301');
INSERT INTO `regions` VALUES (3031, 349, '城中区', '/30/349/', '', 3, 0, 2, 0, '20030916002299');
INSERT INTO `regions` VALUES (3032, 349, '大通回族土族自治县', '/30/349/', '', 3, 0, 5, 0, '20030916002303');
INSERT INTO `regions` VALUES (3033, 349, '湟源县', '/30/349/', '', 3, 0, 5, 0, '20030916002304');
INSERT INTO `regions` VALUES (3034, 349, '湟中县', '/30/349/', '', 3, 0, 5, 0, '20030916002305');
INSERT INTO `regions` VALUES (3035, 312, '景洪市', '/26/312/', '', 3, 0, 2, 0, '20030916001185');
INSERT INTO `regions` VALUES (3036, 312, '勐海县', '/26/312/', '', 3, 0, 3, 0, '20030916001186');
INSERT INTO `regions` VALUES (3037, 312, '勐腊县', '/26/312/', '', 3, 0, 3, 0, '20030916001187');
INSERT INTO `regions` VALUES (3038, 72, '阿巴嘎旗', '/6/72/', '', 3, 0, 3, 0, '20030916001472');
INSERT INTO `regions` VALUES (3039, 72, '东乌珠穆沁旗', '/6/72/', '', 3, 0, 3, 0, '20030916001475');
INSERT INTO `regions` VALUES (3040, 72, '多伦县', '/6/72/', '', 3, 0, 3, 0, '20030916001471');
INSERT INTO `regions` VALUES (3041, 72, '二连浩特市', '/6/72/', '', 3, 0, 2, 0, '20030916001470');
INSERT INTO `regions` VALUES (3042, 72, '苏尼特右旗', '/6/72/', '', 3, 0, 3, 0, '20030916001474');
INSERT INTO `regions` VALUES (3043, 72, '苏尼特左旗', '/6/72/', '', 3, 0, 3, 0, '20030916001473');
INSERT INTO `regions` VALUES (3044, 72, '太仆寺旗', '/6/72/', '', 3, 0, 3, 0, '20030916001477');
INSERT INTO `regions` VALUES (3045, 72, '西乌珠穆沁旗', '/6/72/', '', 3, 0, 3, 0, '20030916001476');
INSERT INTO `regions` VALUES (3046, 72, '锡林浩特市', '/6/72/', '', 3, 0, 2, 0, '20030916001469');
INSERT INTO `regions` VALUES (3047, 72, '镶黄旗', '/6/72/', '', 3, 0, 3, 0, '20030916001478');
INSERT INTO `regions` VALUES (3048, 72, '正蓝旗', '/6/72/', '', 3, 0, 3, 0, '20030916001480');
INSERT INTO `regions` VALUES (3049, 72, '正镶白旗', '/6/72/', '', 3, 0, 3, 0, '20030916001479');
INSERT INTO `regions` VALUES (3050, 153, '海沧区', '/14/153/', '', 3, 0, 2, 0, '20030916002269');
INSERT INTO `regions` VALUES (3051, 153, '湖里区', '/14/153/', '', 3, 0, 2, 0, '20030916002266');
INSERT INTO `regions` VALUES (3052, 153, '集美区', '/14/153/', '', 3, 0, 2, 0, '20030916002264');
INSERT INTO `regions` VALUES (3053, 153, '思明区', '/14/153/', '', 3, 0, 2, 0, '20030916002267');
INSERT INTO `regions` VALUES (3054, 153, '同安区', '/14/153/', '', 3, 0, 2, 0, '20030916002270');
INSERT INTO `regions` VALUES (3055, 153, '翔安区', '/14/153/', '', 3, 0, 1, 0, '3000000002491068');
INSERT INTO `regions` VALUES (3056, 742, '仙桃市', '/18/742/', '', 3, 0, 2, 0, '20030916002106');
INSERT INTO `regions` VALUES (3057, 216, '赤壁市', '/18/216/', '', 3, 0, 2, 0, '20030916002079');
INSERT INTO `regions` VALUES (3058, 216, '崇阳县', '/18/216/', '', 3, 0, 3, 0, '20030916002082');
INSERT INTO `regions` VALUES (3059, 216, '嘉鱼县', '/18/216/', '', 3, 0, 3, 0, '20030916002080');
INSERT INTO `regions` VALUES (3060, 216, '通城县', '/18/216/', '', 3, 0, 3, 0, '20030916002081');
INSERT INTO `regions` VALUES (3061, 216, '通山县', '/18/216/', '', 3, 0, 3, 0, '20030916002083');
INSERT INTO `regions` VALUES (3062, 216, '咸安区', '/18/216/', '', 3, 0, 2, 0, '20030916002078');
INSERT INTO `regions` VALUES (3063, 328, '彬县', '/28/328/', '', 3, 0, 3, 0, '20030916002689');
INSERT INTO `regions` VALUES (3064, 328, '长武县', '/28/328/', '', 3, 0, 3, 0, '20030916002691');
INSERT INTO `regions` VALUES (3065, 328, '淳化县', '/28/328/', '', 3, 0, 3, 0, '20030916002694');
INSERT INTO `regions` VALUES (3066, 328, '泾阳县', '/28/328/', '', 3, 0, 3, 0, '20030916002717');
INSERT INTO `regions` VALUES (3067, 328, '礼泉县', '/28/328/', '', 3, 0, 3, 0, '20030916002720');
INSERT INTO `regions` VALUES (3068, 328, '乾县', '/28/328/', '', 3, 0, 3, 0, '20030916002739');
INSERT INTO `regions` VALUES (3069, 328, '秦都区', '/28/328/', '', 3, 0, 2, 0, '3000000137779690');
INSERT INTO `regions` VALUES (3070, 328, '三原县', '/28/328/', '', 3, 0, 3, 0, '20030916002741');
INSERT INTO `regions` VALUES (3071, 328, '渭城区', '/28/328/', '', 3, 0, 2, 0, '20030916002757');
INSERT INTO `regions` VALUES (3072, 328, '武功县', '/28/328/', '', 3, 0, 3, 0, '20030916002755');
INSERT INTO `regions` VALUES (3073, 328, '兴平市', '/28/328/', '', 3, 0, 2, 0, '20030916002759');
INSERT INTO `regions` VALUES (3074, 328, '旬邑县', '/28/328/', '', 3, 0, 3, 0, '20030916002761');
INSERT INTO `regions` VALUES (3075, 328, '杨陵区', '/28/328/', '', 3, 0, 2, 0, '20030916002766');
INSERT INTO `regions` VALUES (3076, 328, '永寿县', '/28/328/', '', 3, 0, 3, 0, '20030916002771');
INSERT INTO `regions` VALUES (3077, 221, '韶山市', '/19/221/', '', 3, 0, 3, 0, '20030916000339');
INSERT INTO `regions` VALUES (3078, 221, '湘潭县', '/19/221/', '', 3, 0, 3, 0, '20030916000340');
INSERT INTO `regions` VALUES (3079, 221, '湘乡市', '/19/221/', '', 3, 0, 2, 0, '20030916000338');
INSERT INTO `regions` VALUES (3080, 221, '雨湖区', '/19/221/', '', 3, 0, 2, 0, '20030916000337');
INSERT INTO `regions` VALUES (3081, 221, '岳塘区', '/19/221/', '', 3, 0, 2, 0, '3000000137790622');
INSERT INTO `regions` VALUES (3082, 232, '保靖县', '/19/232/', '', 3, 0, 3, 0, '20030916000400');
INSERT INTO `regions` VALUES (3083, 232, '凤凰县', '/19/232/', '', 3, 0, 3, 0, '20030916000398');
INSERT INTO `regions` VALUES (3084, 232, '古丈县', '/19/232/', '', 3, 0, 3, 0, '20030916000401');
INSERT INTO `regions` VALUES (3085, 232, '花垣县', '/19/232/', '', 3, 0, 3, 0, '20030916000399');
INSERT INTO `regions` VALUES (3086, 232, '吉首市', '/19/232/', '', 3, 0, 2, 0, '20030916000396');
INSERT INTO `regions` VALUES (3087, 232, '龙山县', '/19/232/', '', 3, 0, 2, 0, '20030916000403');
INSERT INTO `regions` VALUES (3088, 232, '泸溪县', '/19/232/', '', 3, 0, 3, 0, '20030916000397');
INSERT INTO `regions` VALUES (3089, 232, '永顺县', '/19/232/', '', 3, 0, 3, 0, '20030916000402');
INSERT INTO `regions` VALUES (3090, 208, '保康县', '/18/208/', '', 3, 0, 3, 0, '20030916002154');
INSERT INTO `regions` VALUES (3091, 208, '樊城区', '/18/208/', '', 3, 0, 2, 0, '20030916002147');
INSERT INTO `regions` VALUES (3092, 208, '谷城县', '/18/208/', '', 3, 0, 3, 0, '20030916002153');
INSERT INTO `regions` VALUES (3093, 208, '老河口市', '/18/208/', '', 3, 0, 3, 0, '20030916002149');
INSERT INTO `regions` VALUES (3094, 208, '南漳县', '/18/208/', '', 3, 0, 3, 0, '20030916002152');
INSERT INTO `regions` VALUES (3095, 208, '襄城区', '/18/208/', '', 3, 0, 2, 0, '20030916002146');
INSERT INTO `regions` VALUES (3096, 208, '襄阳区', '/18/208/', '', 3, 0, 2, 0, '20030916002148');
INSERT INTO `regions` VALUES (3097, 208, '宜城市', '/18/208/', '', 3, 0, 3, 0, '20030916002151');
INSERT INTO `regions` VALUES (3098, 208, '枣阳市', '/18/208/', '', 3, 0, 2, 0, '20030916002150');
INSERT INTO `regions` VALUES (3099, 214, '安陆市', '/18/214/', '', 3, 0, 2, 0, '20030916002054');
INSERT INTO `regions` VALUES (3100, 214, '大悟县', '/18/214/', '', 3, 0, 3, 0, '20030916002057');
INSERT INTO `regions` VALUES (3101, 214, '汉川市', '/18/214/', '', 3, 0, 2, 0, '20030916002055');
INSERT INTO `regions` VALUES (3102, 214, '孝昌县', '/18/214/', '', 3, 0, 3, 0, '20030916002056');
INSERT INTO `regions` VALUES (3103, 214, '孝南区', '/18/214/', '', 3, 0, 2, 0, '20030916002052');
INSERT INTO `regions` VALUES (3104, 214, '应城市', '/18/214/', '', 3, 0, 2, 0, '20030916002053');
INSERT INTO `regions` VALUES (3105, 214, '云梦县', '/18/214/', '', 3, 0, 3, 0, '20030916002058');
INSERT INTO `regions` VALUES (3106, 56, '保德县', '/5/56/', '', 3, 0, 3, 0, '20030916001994');
INSERT INTO `regions` VALUES (3107, 56, '代县', '/5/56/', '', 3, 0, 3, 0, '20030916001986');
INSERT INTO `regions` VALUES (3108, 56, '定襄县', '/5/56/', '', 3, 0, 3, 0, '20030916001984');
INSERT INTO `regions` VALUES (3109, 56, '繁峙县', '/5/56/', '', 3, 0, 3, 0, '20030916001987');
INSERT INTO `regions` VALUES (3110, 56, '河曲县', '/5/56/', '', 3, 0, 3, 0, '20030916001993');
INSERT INTO `regions` VALUES (3111, 56, '静乐县', '/5/56/', '', 3, 0, 3, 0, '20030916001989');
INSERT INTO `regions` VALUES (3112, 56, '岢岚县', '/5/56/', '', 3, 0, 3, 0, '20030916001992');
INSERT INTO `regions` VALUES (3113, 56, '宁武县', '/5/56/', '', 3, 0, 2, 0, '20030916001988');
INSERT INTO `regions` VALUES (3114, 56, '偏关县', '/5/56/', '', 3, 0, 3, 0, '20030916001995');
INSERT INTO `regions` VALUES (3115, 56, '神池县', '/5/56/', '', 3, 0, 3, 0, '20030916001990');
INSERT INTO `regions` VALUES (3116, 56, '五台县', '/5/56/', '', 3, 0, 3, 0, '20030916001985');
INSERT INTO `regions` VALUES (3117, 56, '五寨县', '/5/56/', '', 3, 0, 3, 0, '20030916001991');
INSERT INTO `regions` VALUES (3118, 56, '忻府区', '/5/56/', '', 3, 0, 2, 0, '20030916001982');
INSERT INTO `regions` VALUES (3119, 56, '原平市', '/5/56/', '', 3, 0, 2, 0, '20030916001983');
INSERT INTO `regions` VALUES (3120, 195, '长垣县', '/17/195/', '', 3, 0, 2, 0, '20030916002546');
INSERT INTO `regions` VALUES (3121, 195, '封丘县', '/17/195/', '', 3, 0, 3, 0, '20030916002545');
INSERT INTO `regions` VALUES (3122, 195, '凤泉区', '/17/195/', '', 3, 0, 2, 0, '20030916002537');
INSERT INTO `regions` VALUES (3123, 195, '红旗区', '/17/195/', '', 3, 0, 2, 0, '20030916002536');
INSERT INTO `regions` VALUES (3124, 195, '辉县市', '/17/195/', '', 3, 0, 2, 0, '20030916002540');
INSERT INTO `regions` VALUES (3125, 195, '获嘉县', '/17/195/', '', 3, 0, 3, 0, '20030916002542');
INSERT INTO `regions` VALUES (3126, 195, '牧野区', '/17/195/', '', 3, 0, 2, 0, '20030916002538');
INSERT INTO `regions` VALUES (3127, 195, '卫滨区', '/17/195/', '', 3, 0, 2, 0, '20030916002535');
INSERT INTO `regions` VALUES (3128, 195, '卫辉市', '/17/195/', '', 3, 0, 3, 0, '20030916002539');
INSERT INTO `regions` VALUES (3129, 195, '新乡县', '/17/195/', '', 3, 0, 3, 0, '20030916002541');
INSERT INTO `regions` VALUES (3130, 195, '延津县', '/17/195/', '', 3, 0, 3, 0, '20030916002544');
INSERT INTO `regions` VALUES (3131, 195, '原阳县', '/17/195/', '', 3, 0, 3, 0, '20030916002543');
INSERT INTO `regions` VALUES (3132, 165, '分宜县', '/15/165/', '', 3, 0, 3, 0, '20030916001359');
INSERT INTO `regions` VALUES (3133, 165, '渝水区', '/15/165/', '', 3, 0, 2, 0, '20030916001432');
INSERT INTO `regions` VALUES (3134, 203, '固始县', '/17/203/', '', 3, 0, 3, 0, '20030916002625');
INSERT INTO `regions` VALUES (3135, 203, '光山县', '/17/203/', '', 3, 0, 2, 0, '20030916002624');
INSERT INTO `regions` VALUES (3136, 203, '淮滨县', '/17/203/', '', 3, 0, 3, 0, '20030916002622');
INSERT INTO `regions` VALUES (3137, 203, '潢川县', '/17/203/', '', 3, 0, 2, 0, '20030916002623');
INSERT INTO `regions` VALUES (3138, 203, '罗山县', '/17/203/', '', 3, 0, 3, 0, '20030916002627');
INSERT INTO `regions` VALUES (3139, 203, '平桥区', '/17/203/', '', 3, 0, 2, 0, '20030916002620');
INSERT INTO `regions` VALUES (3140, 203, '商城县', '/17/203/', '', 3, 0, 3, 0, '20030916002626');
INSERT INTO `regions` VALUES (3141, 203, '息县', '/17/203/', '', 3, 0, 3, 0, '20030916002621');
INSERT INTO `regions` VALUES (3142, 203, '新县', '/17/203/', '', 3, 0, 3, 0, '20030916002628');
INSERT INTO `regions` VALUES (3143, 203, '浉河区', '/17/203/', '', 3, 0, 2, 0, '20030916002619');
INSERT INTO `regions` VALUES (3144, 71, '阿尔山市', '/6/71/', '', 3, 0, 2, 0, '20030916000223');
INSERT INTO `regions` VALUES (3145, 71, '科尔沁右翼前旗', '/6/71/', '', 3, 0, 3, 0, '20030916000225');
INSERT INTO `regions` VALUES (3146, 71, '科尔沁右翼中旗', '/6/71/', '', 3, 0, 3, 0, '20030916000226');
INSERT INTO `regions` VALUES (3147, 71, '突泉县', '/6/71/', '', 3, 0, 3, 0, '20030916000224');
INSERT INTO `regions` VALUES (3148, 71, '乌兰浩特市', '/6/71/', '', 3, 0, 2, 0, '20030916000222');
INSERT INTO `regions` VALUES (3149, 71, '扎赉特旗', '/6/71/', '', 3, 0, 3, 0, '20030916000227');
INSERT INTO `regions` VALUES (3150, 41, '柏乡县', '/4/41/', '', 3, 0, 3, 0, '20030916001761');
INSERT INTO `regions` VALUES (3151, 41, '广宗县', '/4/41/', '', 3, 0, 3, 0, '20030916001768');
INSERT INTO `regions` VALUES (3152, 41, '巨鹿县', '/4/41/', '', 3, 0, 3, 0, '20030916001766');
INSERT INTO `regions` VALUES (3153, 41, '临城县', '/4/41/', '', 3, 0, 3, 0, '20030916001759');
INSERT INTO `regions` VALUES (3154, 41, '临西县', '/4/41/', '', 3, 0, 3, 0, '20030916001772');
INSERT INTO `regions` VALUES (3155, 41, '隆尧县', '/4/41/', '', 3, 0, 3, 0, '20030916001762');
INSERT INTO `regions` VALUES (3156, 41, '内丘县', '/4/41/', '', 3, 0, 3, 0, '20030916001760');
INSERT INTO `regions` VALUES (3157, 41, '南宫市', '/4/41/', '', 3, 0, 2, 0, '20030916001756');
INSERT INTO `regions` VALUES (3158, 41, '南和县', '/4/41/', '', 3, 0, 3, 0, '20030916001764');
INSERT INTO `regions` VALUES (3159, 41, '宁晋县', '/4/41/', '', 3, 0, 3, 0, '20030916001765');
INSERT INTO `regions` VALUES (3160, 41, '平乡县', '/4/41/', '', 3, 0, 3, 0, '20030916001769');
INSERT INTO `regions` VALUES (3161, 41, '桥东区', '/4/41/', '', 3, 0, 2, 0, '20030916001754');
INSERT INTO `regions` VALUES (3162, 41, '桥西区', '/4/41/', '', 3, 0, 2, 0, '20030916001755');
INSERT INTO `regions` VALUES (3163, 41, '清河县', '/4/41/', '', 3, 0, 3, 0, '20030916001771');
INSERT INTO `regions` VALUES (3164, 41, '任县', '/4/41/', '', 3, 0, 3, 0, '20030916001763');
INSERT INTO `regions` VALUES (3165, 41, '沙河市', '/4/41/', '', 3, 0, 2, 0, '20030916001757');
INSERT INTO `regions` VALUES (3166, 41, '威县', '/4/41/', '', 3, 0, 3, 0, '20030916001770');
INSERT INTO `regions` VALUES (3167, 41, '新河县', '/4/41/', '', 3, 0, 3, 0, '20030916001767');
INSERT INTO `regions` VALUES (3168, 41, '邢台县', '/4/41/', '', 3, 0, 2, 0, '20030916001758');
INSERT INTO `regions` VALUES (3169, 113, '丰县', '/11/113/', '', 3, 0, 3, 0, '20030916002418');
INSERT INTO `regions` VALUES (3170, 113, '鼓楼区', '/11/113/', '', 3, 0, 1, 0, '3000000007539488');
INSERT INTO `regions` VALUES (3171, 113, '贾汪区', '/11/113/', '', 3, 0, 1, 0, '20030916002416');
INSERT INTO `regions` VALUES (3172, 113, '九里区', '/11/113/', '', 3, 0, 1, 0, '3000000007539756');
INSERT INTO `regions` VALUES (3173, 113, '沛县', '/11/113/', '', 3, 0, 3, 0, '20030916002419');
INSERT INTO `regions` VALUES (3174, 113, '邳州市', '/11/113/', '', 3, 0, 3, 0, '20030916002421');
INSERT INTO `regions` VALUES (3175, 113, '泉山区', '/11/113/', '', 3, 0, 1, 0, '3000000007539314');
INSERT INTO `regions` VALUES (3176, 113, '睢宁县', '/11/113/', '', 3, 0, 3, 0, '20030916002420');
INSERT INTO `regions` VALUES (3177, 113, '铜山县', '/11/113/', '', 3, 0, 3, 0, '3000000007560252');
INSERT INTO `regions` VALUES (3178, 113, '新沂市', '/11/113/', '', 3, 0, 3, 0, '20030916002422');
INSERT INTO `regions` VALUES (3179, 113, '云龙区', '/11/113/', '', 3, 0, 1, 0, '3000000007536903');
INSERT INTO `regions` VALUES (3180, 198, '长葛市', '/17/198/', '', 3, 0, 2, 0, '20030916002588');
INSERT INTO `regions` VALUES (3181, 198, '魏都区', '/17/198/', '', 3, 0, 2, 0, '20030916002586');
INSERT INTO `regions` VALUES (3182, 198, '襄城县', '/17/198/', '', 3, 0, 3, 0, '20030916002591');
INSERT INTO `regions` VALUES (3183, 198, '许昌县', '/17/198/', '', 3, 0, 3, 0, '20030916002589');
INSERT INTO `regions` VALUES (3184, 198, '鄢陵县', '/17/198/', '', 3, 0, 3, 0, '20030916002590');
INSERT INTO `regions` VALUES (3185, 198, '禹州市', '/17/198/', '', 3, 0, 2, 0, '20030916002587');
INSERT INTO `regions` VALUES (3193, 287, '宝兴县', '/24/287/', '', 3, 0, 3, 0, '20030916000129');
INSERT INTO `regions` VALUES (3194, 287, '汉源县', '/24/287/', '', 3, 0, 3, 0, '20030916000125');
INSERT INTO `regions` VALUES (3195, 287, '芦山县', '/24/287/', '', 3, 0, 3, 0, '20030916000128');
INSERT INTO `regions` VALUES (3196, 287, '名山县', '/24/287/', '', 3, 0, 3, 0, '20030916000123');
INSERT INTO `regions` VALUES (3197, 287, '石棉县', '/24/287/', '', 3, 0, 2, 0, '20030916000126');
INSERT INTO `regions` VALUES (3198, 287, '天全县', '/24/287/', '', 3, 0, 3, 0, '20030916000127');
INSERT INTO `regions` VALUES (3199, 287, '荥经县', '/24/287/', '', 3, 0, 3, 0, '20030916000124');
INSERT INTO `regions` VALUES (3200, 287, '雨城区', '/24/287/', '', 3, 0, 2, 0, '20030916000122');
INSERT INTO `regions` VALUES (3201, 177, '长岛县', '/16/177/', '', 3, 0, 3, 0, '20030916002480');
INSERT INTO `regions` VALUES (3202, 177, '福山区', '/16/177/', '', 3, 0, 1, 0, '20030916002474');
INSERT INTO `regions` VALUES (3203, 177, '海阳市', '/16/177/', '', 3, 0, 2, 0, '20030916002488');
INSERT INTO `regions` VALUES (3204, 177, '莱山区', '/16/177/', '', 3, 0, 1, 0, '20030916002476');
INSERT INTO `regions` VALUES (3205, 177, '莱阳市', '/16/177/', '', 3, 0, 2, 0, '20030916002489');
INSERT INTO `regions` VALUES (3206, 177, '莱州市', '/16/177/', '', 3, 0, 2, 0, '20030916002487');
INSERT INTO `regions` VALUES (3207, 177, '龙口市', '/16/177/', '', 3, 0, 2, 0, '20030916002481');
INSERT INTO `regions` VALUES (3208, 177, '牟平区', '/16/177/', '', 3, 0, 1, 0, '20030916002479');
INSERT INTO `regions` VALUES (3209, 177, '蓬莱市', '/16/177/', '', 3, 0, 2, 0, '20030916002485');
INSERT INTO `regions` VALUES (3210, 177, '栖霞市', '/16/177/', '', 3, 0, 2, 0, '20030916002482');
INSERT INTO `regions` VALUES (3211, 177, '招远市', '/16/177/', '', 3, 0, 2, 0, '20030916002484');
INSERT INTO `regions` VALUES (3212, 177, '芝罘区', '/16/177/', '', 3, 0, 1, 0, '20030916002478');
INSERT INTO `regions` VALUES (3213, 330, '安塞县', '/28/330/', '', 3, 0, 4, 0, '20030916002682');
INSERT INTO `regions` VALUES (3214, 330, '宝塔区', '/28/330/', '', 3, 0, 3, 0, '20030916002762');
INSERT INTO `regions` VALUES (3215, 330, '富县', '/28/330/', '', 3, 0, 4, 0, '20030916002703');
INSERT INTO `regions` VALUES (3216, 330, '甘泉县', '/28/330/', '', 3, 0, 4, 0, '20030916002704');
INSERT INTO `regions` VALUES (3217, 330, '黄陵县', '/28/330/', '', 3, 0, 4, 0, '20030916002714');
INSERT INTO `regions` VALUES (3218, 330, '黄龙县', '/28/330/', '', 3, 0, 4, 0, '20030916002715');
INSERT INTO `regions` VALUES (3219, 330, '洛川县', '/28/330/', '', 3, 0, 4, 0, '20030916002727');
INSERT INTO `regions` VALUES (3220, 330, '吴起县', '/28/330/', '', 3, 0, 4, 0, '20030916002754');
INSERT INTO `regions` VALUES (3221, 330, '延长县', '/28/330/', '', 3, 0, 4, 0, '3000000009387571');
INSERT INTO `regions` VALUES (3222, 330, '延川县', '/28/330/', '', 3, 0, 4, 0, '20030916002763');
INSERT INTO `regions` VALUES (3223, 330, '宜川县', '/28/330/', '', 3, 0, 4, 0, '20030916002769');
INSERT INTO `regions` VALUES (3224, 330, '志丹县', '/28/330/', '', 3, 0, 4, 0, '20030916002776');
INSERT INTO `regions` VALUES (3225, 330, '子长县', '/28/330/', '', 3, 0, 4, 0, '20030916002778');
INSERT INTO `regions` VALUES (3226, 96, '安图县', '/8/96/', '', 3, 0, 3, 0, '20030916000221');
INSERT INTO `regions` VALUES (3227, 96, '敦化市', '/8/96/', '', 3, 0, 2, 0, '20030916000216');
INSERT INTO `regions` VALUES (3228, 96, '和龙市', '/8/96/', '', 3, 0, 2, 0, '20030916000219');
INSERT INTO `regions` VALUES (3229, 96, '珲春市', '/8/96/', '', 3, 0, 2, 0, '20030916000217');
INSERT INTO `regions` VALUES (3230, 96, '龙井市', '/8/96/', '', 3, 0, 2, 0, '20030916000218');
INSERT INTO `regions` VALUES (3231, 96, '图们市', '/8/96/', '', 3, 0, 2, 0, '20030916000215');
INSERT INTO `regions` VALUES (3232, 96, '汪清县', '/8/96/', '', 3, 0, 3, 0, '20030916000220');
INSERT INTO `regions` VALUES (3233, 96, '延吉市', '/8/96/', '', 3, 0, 2, 0, '20030916000214');
INSERT INTO `regions` VALUES (3234, 119, '滨海县', '/11/119/', '', 3, 0, 3, 0, '20030916002443');
INSERT INTO `regions` VALUES (3235, 119, '大丰市', '/11/119/', '', 3, 0, 3, 0, '20030916002439');
INSERT INTO `regions` VALUES (3236, 119, '东台市', '/11/119/', '', 3, 0, 3, 0, '20030916002440');
INSERT INTO `regions` VALUES (3237, 119, '阜宁县', '/11/119/', '', 3, 0, 3, 0, '20030916002442');
INSERT INTO `regions` VALUES (3238, 119, '建湖县', '/11/119/', '', 3, 0, 3, 0, '20030916002445');
INSERT INTO `regions` VALUES (3239, 119, '射阳县', '/11/119/', '', 3, 0, 3, 0, '20030916002441');
INSERT INTO `regions` VALUES (3240, 119, '亭湖区', '/11/119/', '', 3, 0, 2, 0, '3000000137304891');
INSERT INTO `regions` VALUES (3241, 119, '响水县', '/11/119/', '', 3, 0, 3, 0, '20030916002444');
INSERT INTO `regions` VALUES (3242, 119, '盐都区', '/11/119/', '', 3, 0, 2, 0, '20030916002438');
INSERT INTO `regions` VALUES (3243, 120, '宝应县', '/11/120/', '', 3, 0, 3, 0, '20030916002805');
INSERT INTO `regions` VALUES (3244, 120, '高邮市', '/11/120/', '', 3, 0, 3, 0, '20030916002804');
INSERT INTO `regions` VALUES (3245, 120, '广陵区', '/11/120/', '', 3, 0, 2, 0, '20030916002800');
INSERT INTO `regions` VALUES (3246, 120, '邗江区', '/11/120/', '', 3, 0, 2, 0, '20030916002801');
INSERT INTO `regions` VALUES (3247, 120, '江都市', '/11/120/', '', 3, 0, 3, 0, '20030916002803');
INSERT INTO `regions` VALUES (3248, 120, '维扬区', '/11/120/', '', 3, 0, 2, 0, '3000000137778530');
INSERT INTO `regions` VALUES (3249, 120, '仪征市', '/11/120/', '', 3, 0, 3, 0, '20030916002802');
INSERT INTO `regions` VALUES (3250, 247, '江城区', '/20/247/', '', 3, 0, 2, 0, '20030916000870');
INSERT INTO `regions` VALUES (3251, 247, '阳春市', '/20/247/', '', 3, 0, 2, 0, '20030916000871');
INSERT INTO `regions` VALUES (3252, 247, '阳东县', '/20/247/', '', 3, 0, 3, 0, '20030916000873');
INSERT INTO `regions` VALUES (3253, 247, '阳西县', '/20/247/', '', 3, 0, 3, 0, '20030916000872');
INSERT INTO `regions` VALUES (3254, 50, '城区', '/5/50/', '', 3, 0, 2, 0, '20030916001958');
INSERT INTO `regions` VALUES (3255, 50, '郊区', '/5/50/', '', 3, 0, 2, 0, '20030916001960');
INSERT INTO `regions` VALUES (3256, 50, '矿区', '/5/50/', '', 3, 0, 2, 0, '20030916001959');
INSERT INTO `regions` VALUES (3257, 50, '平定县', '/5/50/', '', 3, 0, 3, 0, '20030916001961');
INSERT INTO `regions` VALUES (3258, 50, '盂县', '/5/50/', '', 3, 0, 3, 0, '20030916001962');
INSERT INTO `regions` VALUES (3259, 373, '察布查尔锡伯自治县', '/32/373/', '', 3, 0, 3, 0, '20030916002245');
INSERT INTO `regions` VALUES (3260, 373, '巩留县', '/32/373/', '', 3, 0, 3, 0, '20030916002240');
INSERT INTO `regions` VALUES (3261, 373, '霍城县', '/32/373/', '', 3, 0, 3, 0, '20030916002239');
INSERT INTO `regions` VALUES (3262, 373, '奎屯市', '/32/373/', '', 3, 0, 3, 0, '20030916002237');
INSERT INTO `regions` VALUES (3263, 373, '尼勒克县', '/32/373/', '', 3, 0, 3, 0, '20030916002244');
INSERT INTO `regions` VALUES (3264, 373, '特克斯县', '/32/373/', '', 3, 0, 3, 0, '20030916002243');
INSERT INTO `regions` VALUES (3265, 373, '新源县', '/32/373/', '', 3, 0, 3, 0, '20030916002241');
INSERT INTO `regions` VALUES (3266, 373, '伊宁市', '/32/373/', '', 3, 0, 3, 0, '20030916002238');
INSERT INTO `regions` VALUES (3267, 373, '伊宁县', '/32/373/', '', 3, 0, 3, 0, '3000000137311053');
INSERT INTO `regions` VALUES (3268, 373, '昭苏县', '/32/373/', '', 3, 0, 3, 0, '20030916002242');
INSERT INTO `regions` VALUES (3269, 283, '长宁县', '/24/283/', '', 3, 0, 3, 0, '20030916000284');
INSERT INTO `regions` VALUES (3270, 283, '翠屏区', '/24/283/', '', 3, 0, 2, 0, '20030916000281');
INSERT INTO `regions` VALUES (3271, 283, '高县', '/24/283/', '', 3, 0, 3, 0, '20030916000288');
INSERT INTO `regions` VALUES (3272, 283, '珙县', '/24/283/', '', 3, 0, 3, 0, '20030916000286');
INSERT INTO `regions` VALUES (3273, 283, '江安县', '/24/283/', '', 3, 0, 3, 0, '20030916000283');
INSERT INTO `regions` VALUES (3274, 283, '筠连县', '/24/283/', '', 3, 0, 3, 0, '20030916000289');
INSERT INTO `regions` VALUES (3275, 283, '南溪县', '/24/283/', '', 3, 0, 3, 0, '20030916000282');
INSERT INTO `regions` VALUES (3276, 283, '屏山县', '/24/283/', '', 3, 0, 3, 0, '20030916000290');
INSERT INTO `regions` VALUES (3277, 283, '兴文县', '/24/283/', '', 3, 0, 3, 0, '20030916000285');
INSERT INTO `regions` VALUES (3278, 283, '宜宾县', '/24/283/', '', 3, 0, 3, 0, '20030916000287');
INSERT INTO `regions` VALUES (3279, 211, '长阳土家族自治县', '/18/211/', '', 3, 0, 3, 0, '20030916002103');
INSERT INTO `regions` VALUES (3280, 211, '当阳市', '/18/211/', '', 3, 0, 2, 0, '20030916002099');
INSERT INTO `regions` VALUES (3281, 211, '点军区', '/18/211/', '', 3, 0, 2, 0, '20030916002094');
INSERT INTO `regions` VALUES (3282, 211, '五峰土家族自治县', '/18/211/', '', 3, 0, 3, 0, '20030916002104');
INSERT INTO `regions` VALUES (3283, 211, '伍家岗区', '/18/211/', '', 3, 0, 2, 0, '20030916002093');
INSERT INTO `regions` VALUES (3284, 211, '西陵区', '/18/211/', '', 3, 0, 2, 0, '20030916002092');
INSERT INTO `regions` VALUES (3285, 211, '猇亭区', '/18/211/', '', 3, 0, 2, 0, '20030916002095');
INSERT INTO `regions` VALUES (3286, 211, '兴山县', '/18/211/', '', 3, 0, 3, 0, '20030916002101');
INSERT INTO `regions` VALUES (3287, 211, '夷陵区', '/18/211/', '', 3, 0, 2, 0, '20030916002096');
INSERT INTO `regions` VALUES (3288, 211, '宜都市', '/18/211/', '', 3, 0, 2, 0, '20030916002098');
INSERT INTO `regions` VALUES (3289, 211, '远安县', '/18/211/', '', 3, 0, 3, 0, '20030916002100');
INSERT INTO `regions` VALUES (3290, 211, '枝江市', '/18/211/', '', 3, 0, 2, 0, '20030916002097');
INSERT INTO `regions` VALUES (3291, 211, '秭归县', '/18/211/', '', 3, 0, 3, 0, '20030916002102');
INSERT INTO `regions` VALUES (3292, 169, '丰城市', '/15/169/', '', 3, 0, 2, 0, '20030916001360');
INSERT INTO `regions` VALUES (3293, 169, '奉新县', '/15/169/', '', 3, 0, 3, 0, '20030916001361');
INSERT INTO `regions` VALUES (3294, 169, '高安市', '/15/169/', '', 3, 0, 2, 0, '20030916001364');
INSERT INTO `regions` VALUES (3295, 169, '靖安县', '/15/169/', '', 3, 0, 3, 0, '20030916001376');
INSERT INTO `regions` VALUES (3296, 169, '上高县', '/15/169/', '', 3, 0, 2, 0, '20030916001401');
INSERT INTO `regions` VALUES (3297, 169, '铜鼓县', '/15/169/', '', 3, 0, 3, 0, '20030916001407');
INSERT INTO `regions` VALUES (3298, 169, '万载县', '/15/169/', '', 3, 0, 2, 0, '20030916001411');
INSERT INTO `regions` VALUES (3299, 169, '宜丰县', '/15/169/', '', 3, 0, 3, 0, '20030916001426');
INSERT INTO `regions` VALUES (3300, 169, '袁州区', '/15/169/', '', 3, 0, 2, 0, '20030916001437');
INSERT INTO `regions` VALUES (3301, 169, '樟树市', '/15/169/', '', 3, 0, 2, 0, '20030916001440');
INSERT INTO `regions` VALUES (3302, 227, '安化县', '/19/227/', '', 3, 0, 3, 0, '20030916000323');
INSERT INTO `regions` VALUES (3303, 227, '赫山区', '/19/227/', '', 3, 0, 2, 0, '20030916000319');
INSERT INTO `regions` VALUES (3304, 227, '南县', '/19/227/', '', 3, 0, 3, 0, '20030916000321');
INSERT INTO `regions` VALUES (3305, 227, '桃江县', '/19/227/', '', 3, 0, 3, 0, '20030916000322');
INSERT INTO `regions` VALUES (3306, 227, '沅江市', '/19/227/', '', 3, 0, 2, 0, '20030916000320');
INSERT INTO `regions` VALUES (3307, 227, '资阳区', '/19/227/', '', 3, 0, 2, 0, '3000000137789704');
INSERT INTO `regions` VALUES (3308, 357, '贺兰县', '/31/357/', '', 3, 0, 3, 0, '20030916002451');
INSERT INTO `regions` VALUES (3309, 357, '金凤区', '/31/357/', '', 3, 0, 1, 0, '20030916002447');
INSERT INTO `regions` VALUES (3310, 357, '灵武市', '/31/357/', '', 3, 0, 3, 0, '20030916002449');
INSERT INTO `regions` VALUES (3311, 357, '西夏区', '/31/357/', '', 3, 0, 1, 0, '20030916002448');
INSERT INTO `regions` VALUES (3312, 357, '兴庆区', '/31/357/', '', 3, 0, 1, 0, '20030916002446');
INSERT INTO `regions` VALUES (3313, 357, '永宁县', '/31/357/', '', 3, 0, 2, 0, '20030916002450');
INSERT INTO `regions` VALUES (3314, 166, '贵溪市', '/15/166/', '', 3, 0, 2, 0, '20030916001367');
INSERT INTO `regions` VALUES (3315, 166, '余江县', '/15/166/', '', 3, 0, 3, 0, '20030916001435');
INSERT INTO `regions` VALUES (3316, 166, '月湖区', '/15/166/', '', 3, 0, 2, 0, '20030916001438');
INSERT INTO `regions` VALUES (3317, 81, '鲅鱼圈区', '/7/81/', '', 3, 0, 2, 0, '20030916002668');
INSERT INTO `regions` VALUES (3318, 81, '大石桥市', '/7/81/', '', 3, 0, 2, 0, '20030916002670');
INSERT INTO `regions` VALUES (3319, 81, '盖州市', '/7/81/', '', 3, 0, 2, 0, '20030916002671');
INSERT INTO `regions` VALUES (3320, 81, '老边区', '/7/81/', '', 3, 0, 2, 0, '20030916002669');
INSERT INTO `regions` VALUES (3321, 81, '西市区', '/7/81/', '', 3, 0, 2, 0, '20030916002667');
INSERT INTO `regions` VALUES (3322, 81, '站前区', '/7/81/', '', 3, 0, 2, 0, '20030916002666');
INSERT INTO `regions` VALUES (3323, 229, '道县', '/19/229/', '', 3, 0, 3, 0, '20030916000361');
INSERT INTO `regions` VALUES (3324, 229, '东安县', '/19/229/', '', 3, 0, 3, 0, '20030916000360');
INSERT INTO `regions` VALUES (3325, 229, '江华瑶族自治县', '/19/229/', '', 3, 0, 3, 0, '20030916000368');
INSERT INTO `regions` VALUES (3326, 229, '江永县', '/19/229/', '', 3, 0, 3, 0, '20030916000363');
INSERT INTO `regions` VALUES (3327, 229, '蓝山县', '/19/229/', '', 3, 0, 3, 0, '20030916000364');
INSERT INTO `regions` VALUES (3328, 229, '冷水滩区', '/19/229/', '', 3, 0, 2, 0, '3000000137888459');
INSERT INTO `regions` VALUES (3329, 229, '零陵区', '/19/229/', '', 3, 0, 2, 0, '20030916000359');
INSERT INTO `regions` VALUES (3330, 229, '宁远县', '/19/229/', '', 3, 0, 3, 0, '20030916000362');
INSERT INTO `regions` VALUES (3331, 229, '祁阳县', '/19/229/', '', 3, 0, 3, 0, '20030916000367');
INSERT INTO `regions` VALUES (3332, 229, '双牌县', '/19/229/', '', 3, 0, 3, 0, '20030916000366');
INSERT INTO `regions` VALUES (3333, 229, '新田县', '/19/229/', '', 3, 0, 3, 0, '20030916000365');
INSERT INTO `regions` VALUES (3334, 332, '定边县', '/28/332/', '', 3, 0, 4, 0, '20030916002473');
INSERT INTO `regions` VALUES (3335, 332, '府谷县', '/28/332/', '', 3, 0, 4, 0, '20030916002701');
INSERT INTO `regions` VALUES (3336, 332, '横山县', '/28/332/', '', 3, 0, 4, 0, '20030916002710');
INSERT INTO `regions` VALUES (3337, 332, '佳县', '/28/332/', '', 3, 0, 4, 0, '20030916002716');
INSERT INTO `regions` VALUES (3338, 332, '靖边县', '/28/332/', '', 3, 0, 4, 0, '20030916002472');
INSERT INTO `regions` VALUES (3339, 332, '米脂县', '/28/332/', '', 3, 0, 4, 0, '20030916002730');
INSERT INTO `regions` VALUES (3340, 332, '清涧县', '/28/332/', '', 3, 0, 4, 0, '20030916002740');
INSERT INTO `regions` VALUES (3341, 332, '神木县', '/28/332/', '', 3, 0, 4, 0, '20030916002745');
INSERT INTO `regions` VALUES (3342, 332, '绥德县', '/28/332/', '', 3, 0, 4, 0, '20030916002747');
INSERT INTO `regions` VALUES (3343, 332, '吴堡县', '/28/332/', '', 3, 0, 4, 0, '20030916002753');
INSERT INTO `regions` VALUES (3344, 332, '榆阳区', '/28/332/', '', 3, 0, 4, 0, '20030916002772');
INSERT INTO `regions` VALUES (3345, 332, '子洲县', '/28/332/', '', 3, 0, 4, 0, '20030916002779');
INSERT INTO `regions` VALUES (3346, 262, '北流市', '/21/262/', '', 3, 0, 2, 0, '20030916001513');
INSERT INTO `regions` VALUES (3347, 262, '博白县', '/21/262/', '', 3, 0, 3, 0, '20030916001588');
INSERT INTO `regions` VALUES (3348, 262, '陆川县', '/21/262/', '', 3, 0, 3, 0, '20030916001589');
INSERT INTO `regions` VALUES (3349, 262, '容县', '/21/262/', '', 3, 0, 3, 0, '20030916001590');
INSERT INTO `regions` VALUES (3350, 262, '兴业县', '/21/262/', '', 3, 0, 3, 0, '20030916001592');
INSERT INTO `regions` VALUES (3351, 262, '玉州区', '/21/262/', '', 3, 0, 2, 0, '20030916001593');
INSERT INTO `regions` VALUES (3352, 355, '称多县', '/30/355/', '', 3, 0, 5, 0, '20030916002333');
INSERT INTO `regions` VALUES (3353, 355, '囊谦县', '/30/355/', '', 3, 0, 5, 0, '20030916002335');
INSERT INTO `regions` VALUES (3354, 355, '曲麻莱县', '/30/355/', '', 3, 0, 5, 0, '20030916002336');
INSERT INTO `regions` VALUES (3356, 355, '玉树县', '/30/355/', '', 3, 0, 5, 0, '20030916002331');
INSERT INTO `regions` VALUES (3357, 355, '杂多县', '/30/355/', '', 3, 0, 5, 0, '20030916002332');
INSERT INTO `regions` VALUES (3358, 355, '治多县', '/30/355/', '', 3, 0, 5, 0, '20030916002334');
INSERT INTO `regions` VALUES (3359, 304, '澄江县', '/26/304/', '', 3, 0, 3, 0, '20030916001086');
INSERT INTO `regions` VALUES (3360, 304, '峨山彝族自治县', '/26/304/', '', 3, 0, 3, 0, '20030916001090');
INSERT INTO `regions` VALUES (3361, 304, '红塔区', '/26/304/', '', 3, 0, 2, 0, '20030916001084');
INSERT INTO `regions` VALUES (3362, 304, '华宁县', '/26/304/', '', 3, 0, 3, 0, '20030916001088');
INSERT INTO `regions` VALUES (3363, 304, '江川县', '/26/304/', '', 3, 0, 3, 0, '20030916001085');
INSERT INTO `regions` VALUES (3364, 304, '通海县', '/26/304/', '', 3, 0, 3, 0, '20030916001087');
INSERT INTO `regions` VALUES (3365, 304, '新平彝族傣族自治县', '/26/304/', '', 3, 0, 3, 0, '20030916001091');
INSERT INTO `regions` VALUES (3366, 304, '易门县', '/26/304/', '', 3, 0, 3, 0, '20030916001089');
INSERT INTO `regions` VALUES (3367, 304, '元江哈尼族彝族傣族自治县', '/26/304/', '', 3, 0, 3, 0, '20030916001092');
INSERT INTO `regions` VALUES (3368, 224, '华容县', '/19/224/', '', 3, 0, 3, 0, '20030916000328');
INSERT INTO `regions` VALUES (3369, 224, '君山区', '/19/224/', '', 3, 0, 2, 0, '3000000137789920');
INSERT INTO `regions` VALUES (3370, 224, '临湘市', '/19/224/', '', 3, 0, 2, 0, '20030916000326');
INSERT INTO `regions` VALUES (3371, 224, '汨罗市', '/19/224/', '', 3, 0, 3, 0, '20030916000325');
INSERT INTO `regions` VALUES (3372, 224, '平江县', '/19/224/', '', 3, 0, 3, 0, '20030916000330');
INSERT INTO `regions` VALUES (3373, 224, '湘阴县', '/19/224/', '', 3, 0, 3, 0, '20030916000329');
INSERT INTO `regions` VALUES (3374, 224, '岳阳楼区', '/19/224/', '', 3, 0, 2, 0, '20030916000324');
INSERT INTO `regions` VALUES (3375, 224, '岳阳县', '/19/224/', '', 3, 0, 3, 0, '20030916000327');
INSERT INTO `regions` VALUES (3376, 224, '云溪区', '/19/224/', '', 3, 0, 2, 0, '3000000137790010');
INSERT INTO `regions` VALUES (3377, 253, '罗定市', '/20/253/', '', 3, 0, 2, 0, '20030916000587');
INSERT INTO `regions` VALUES (3378, 253, '新兴县', '/20/253/', '', 3, 0, 3, 0, '20030916000588');
INSERT INTO `regions` VALUES (3379, 253, '郁南县', '/20/253/', '', 3, 0, 3, 0, '20030916000589');
INSERT INTO `regions` VALUES (3380, 253, '云安县', '/20/253/', '', 3, 0, 3, 0, '20030916000590');
INSERT INTO `regions` VALUES (3381, 253, '云城区', '/20/253/', '', 3, 0, 2, 0, '20030916000591');
INSERT INTO `regions` VALUES (3382, 55, '河津市', '/5/55/', '', 3, 0, 2, 0, '20030916002026');
INSERT INTO `regions` VALUES (3383, 55, '稷山县', '/5/55/', '', 3, 0, 3, 0, '20030916002032');
INSERT INTO `regions` VALUES (3384, 55, '绛县', '/5/55/', '', 3, 0, 3, 0, '20030916002035');
INSERT INTO `regions` VALUES (3385, 55, '临猗县', '/5/55/', '', 3, 0, 3, 0, '20030916002029');
INSERT INTO `regions` VALUES (3386, 55, '平陆县', '/5/55/', '', 3, 0, 3, 0, '20030916002036');
INSERT INTO `regions` VALUES (3387, 55, '芮城县', '/5/55/', '', 3, 0, 3, 0, '20030916002028');
INSERT INTO `regions` VALUES (3388, 55, '万荣县', '/5/55/', '', 3, 0, 3, 0, '20030916002030');
INSERT INTO `regions` VALUES (3389, 55, '闻喜县', '/5/55/', '', 3, 0, 3, 0, '20030916002033');
INSERT INTO `regions` VALUES (3390, 55, '夏县', '/5/55/', '', 3, 0, 3, 0, '20030916002034');
INSERT INTO `regions` VALUES (3391, 55, '新绛县', '/5/55/', '', 3, 0, 3, 0, '20030916002031');
INSERT INTO `regions` VALUES (3392, 55, '盐湖区', '/5/55/', '', 3, 0, 2, 0, '20030916002024');
INSERT INTO `regions` VALUES (3393, 55, '永济市', '/5/55/', '', 3, 0, 2, 0, '20030916002025');
INSERT INTO `regions` VALUES (3394, 55, '垣曲县', '/5/55/', '', 3, 0, 3, 0, '20030916002037');
INSERT INTO `regions` VALUES (3395, 175, '山亭区', '/16/175/', '', 3, 0, 1, 0, '20030916000948');
INSERT INTO `regions` VALUES (3396, 175, '市中区', '/16/175/', '', 3, 0, 1, 0, '3000000137304266');
INSERT INTO `regions` VALUES (3397, 175, '台儿庄区', '/16/175/', '', 3, 0, 1, 0, '20030916000949');
INSERT INTO `regions` VALUES (3398, 175, '滕州市', '/16/175/', '', 3, 0, 1, 0, '20030916000950');
INSERT INTO `regions` VALUES (3399, 175, '薛城区', '/16/175/', '', 3, 0, 1, 0, '3000000137304308');
INSERT INTO `regions` VALUES (3400, 175, '峄城区', '/16/175/', '', 3, 0, 1, 0, '3000000137304363');
INSERT INTO `regions` VALUES (3401, 240, '赤坎区', '/20/240/', '', 3, 0, 2, 0, '20030916000879');
INSERT INTO `regions` VALUES (3402, 240, '雷州市', '/20/240/', '', 3, 0, 2, 0, '20030916000884');
INSERT INTO `regions` VALUES (3403, 240, '廉江市', '/20/240/', '', 3, 0, 2, 0, '20030916000885');
INSERT INTO `regions` VALUES (3404, 240, '麻章区', '/20/240/', '', 3, 0, 3, 0, '20030916000882');
INSERT INTO `regions` VALUES (3405, 240, '坡头区', '/20/240/', '', 3, 0, 2, 0, '20030916000881');
INSERT INTO `regions` VALUES (3406, 240, '遂溪县', '/20/240/', '', 3, 0, 3, 0, '20030916000886');
INSERT INTO `regions` VALUES (3407, 240, '吴川市', '/20/240/', '', 3, 0, 2, 0, '20030916000883');
INSERT INTO `regions` VALUES (3408, 240, '霞山区', '/20/240/', '', 3, 0, 2, 0, '20030916000880');
INSERT INTO `regions` VALUES (3409, 240, '徐闻县', '/20/240/', '', 3, 0, 2, 0, '20030916000887');
INSERT INTO `regions` VALUES (3410, 226, '慈利县', '/19/226/', '', 3, 0, 3, 0, '20030916000309');
INSERT INTO `regions` VALUES (3411, 226, '桑植县', '/19/226/', '', 3, 0, 3, 0, '20030916000310');
INSERT INTO `regions` VALUES (3412, 226, '武陵源区', '/19/226/', '', 3, 0, 2, 0, '3000000138471371');
INSERT INTO `regions` VALUES (3413, 226, '永定区', '/19/226/', '', 3, 0, 2, 0, '20030916000308');
INSERT INTO `regions` VALUES (3414, 43, '赤城县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100031');
INSERT INTO `regions` VALUES (3415, 43, '崇礼县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100032');
INSERT INTO `regions` VALUES (3416, 43, '沽源县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100023');
INSERT INTO `regions` VALUES (3417, 43, '怀安县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100027');
INSERT INTO `regions` VALUES (3418, 43, '怀来县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100029');
INSERT INTO `regions` VALUES (3419, 43, '康保县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100022');
INSERT INTO `regions` VALUES (3420, 43, '桥东区', '/4/43/', '', 3, 0, 2, 0, '3000000137081930');
INSERT INTO `regions` VALUES (3421, 43, '桥西区', '/4/43/', '', 3, 0, 2, 0, 'rowid09230100019');
INSERT INTO `regions` VALUES (3422, 43, '尚义县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100024');
INSERT INTO `regions` VALUES (3423, 43, '万全县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100028');
INSERT INTO `regions` VALUES (3424, 43, '蔚县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100025');
INSERT INTO `regions` VALUES (3425, 43, '下花园区', '/4/43/', '', 3, 0, 2, 0, '3000000137081987');
INSERT INTO `regions` VALUES (3426, 43, '宣化区', '/4/43/', '', 3, 0, 2, 0, '3000000137082306');
INSERT INTO `regions` VALUES (3427, 43, '宣化县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100020');
INSERT INTO `regions` VALUES (3428, 43, '阳原县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100026');
INSERT INTO `regions` VALUES (3429, 43, '张北县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100021');
INSERT INTO `regions` VALUES (3430, 43, '涿鹿县', '/4/43/', '', 3, 0, 3, 0, 'rowid09230100030');
INSERT INTO `regions` VALUES (3431, 341, '甘州区', '/29/341/', '', 3, 0, 2, 0, '20030916001249');
INSERT INTO `regions` VALUES (3432, 341, '高台县', '/29/341/', '', 3, 0, 3, 0, '20030916001252');
INSERT INTO `regions` VALUES (3433, 341, '临泽县', '/29/341/', '', 3, 0, 3, 0, '20030916001251');
INSERT INTO `regions` VALUES (3434, 341, '民乐县', '/29/341/', '', 3, 0, 3, 0, '20030916001250');
INSERT INTO `regions` VALUES (3435, 341, '山丹县', '/29/341/', '', 3, 0, 3, 0, '20030916001253');
INSERT INTO `regions` VALUES (3436, 341, '肃南裕固族自治县', '/29/341/', '', 3, 0, 3, 0, '20030916001254');
INSERT INTO `regions` VALUES (3437, 157, '长泰县', '/14/157/', '', 3, 0, 3, 0, '20030916002289');
INSERT INTO `regions` VALUES (3438, 157, '东山县', '/14/157/', '', 3, 0, 3, 0, '20030916002288');
INSERT INTO `regions` VALUES (3439, 157, '华安县', '/14/157/', '', 3, 0, 3, 0, '20030916002291');
INSERT INTO `regions` VALUES (3440, 157, '龙海市', '/14/157/', '', 3, 0, 3, 0, '20030916002284');
INSERT INTO `regions` VALUES (3441, 157, '龙文区', '/14/157/', '', 3, 0, 3, 0, '20030916002282');
INSERT INTO `regions` VALUES (3442, 157, '南靖县', '/14/157/', '', 3, 0, 3, 0, '20030916002285');
INSERT INTO `regions` VALUES (3443, 157, '平和县', '/14/157/', '', 3, 0, 3, 0, '20030916002290');
INSERT INTO `regions` VALUES (3444, 157, '芗城区', '/14/157/', '', 3, 0, 2, 0, '20030916002281');
INSERT INTO `regions` VALUES (3445, 157, '云霄县', '/14/157/', '', 3, 0, 3, 0, '20030916002283');
INSERT INTO `regions` VALUES (3446, 157, '漳浦县', '/14/157/', '', 3, 0, 3, 0, '20030916002286');
INSERT INTO `regions` VALUES (3447, 157, '诏安县', '/14/157/', '', 3, 0, 3, 0, '20030916002287');
INSERT INTO `regions` VALUES (3448, 306, '大关县', '/26/306/', '', 3, 0, 3, 0, '20030916001102');
INSERT INTO `regions` VALUES (3449, 306, '鲁甸县', '/26/306/', '', 3, 0, 3, 0, '20030916001099');
INSERT INTO `regions` VALUES (3450, 306, '巧家县', '/26/306/', '', 3, 0, 3, 0, '20030916001100');
INSERT INTO `regions` VALUES (3451, 306, '水富县', '/26/306/', '', 3, 0, 3, 0, '20030916000298');
INSERT INTO `regions` VALUES (3452, 306, '绥江县', '/26/306/', '', 3, 0, 3, 0, '20030916001104');
INSERT INTO `regions` VALUES (3453, 306, '威信县', '/26/306/', '', 3, 0, 3, 0, '20030916001106');
INSERT INTO `regions` VALUES (3454, 306, '盐津县', '/26/306/', '', 3, 0, 3, 0, '20030916001101');
INSERT INTO `regions` VALUES (3455, 306, '彝良县', '/26/306/', '', 3, 0, 3, 0, '20030916001105');
INSERT INTO `regions` VALUES (3456, 306, '永善县', '/26/306/', '', 3, 0, 3, 0, '20030916001103');
INSERT INTO `regions` VALUES (3457, 306, '昭阳区', '/26/306/', '', 3, 0, 2, 0, '20030916001098');
INSERT INTO `regions` VALUES (3458, 306, '镇雄县', '/26/306/', '', 3, 0, 3, 0, '20030916000491');
INSERT INTO `regions` VALUES (3459, 242, '德庆县', '/20/242/', '', 3, 0, 2, 0, '20030916000593');
INSERT INTO `regions` VALUES (3460, 242, '鼎湖区', '/20/242/', '', 3, 0, 2, 0, 'GDADD00000000001');
INSERT INTO `regions` VALUES (3461, 242, '端州区', '/20/242/', '', 3, 0, 2, 0, 'GDADD00000000002');
INSERT INTO `regions` VALUES (3462, 242, '封开县', '/20/242/', '', 3, 0, 3, 0, '20030916000596');
INSERT INTO `regions` VALUES (3463, 242, '高要市', '/20/242/', '', 3, 0, 2, 0, '20030916000597');
INSERT INTO `regions` VALUES (3464, 242, '广宁县', '/20/242/', '', 3, 0, 3, 0, '20030916000598');
INSERT INTO `regions` VALUES (3465, 242, '怀集县', '/20/242/', '', 3, 0, 3, 0, '20030916000599');
INSERT INTO `regions` VALUES (3466, 242, '四会市', '/20/242/', '', 3, 0, 2, 0, 'GDADD00000000003');
INSERT INTO `regions` VALUES (3467, 121, '丹徒区', '/11/121/', '', 3, 0, 3, 0, '20030916002807');
INSERT INTO `regions` VALUES (3468, 121, '丹阳市', '/11/121/', '', 3, 0, 3, 0, '20030916002808');
INSERT INTO `regions` VALUES (3469, 121, '京口区', '/11/121/', '', 3, 0, 2, 0, '3000000137302818');
INSERT INTO `regions` VALUES (3470, 121, '句容市', '/11/121/', '', 3, 0, 3, 0, '20030916002810');
INSERT INTO `regions` VALUES (3471, 121, '润州区', '/11/121/', '', 3, 0, 2, 0, '20030916002806');
INSERT INTO `regions` VALUES (3472, 121, '扬中市', '/11/121/', '', 3, 0, 3, 0, '20030916002809');
INSERT INTO `regions` VALUES (3473, 189, '登封市', '/17/189/', '', 3, 0, 2, 0, '20030916002640');
INSERT INTO `regions` VALUES (3474, 189, '二七区', '/17/189/', '', 3, 0, 1, 0, '20030916002493');
INSERT INTO `regions` VALUES (3475, 189, '巩义市', '/17/189/', '', 3, 0, 2, 0, '20030916002501');
INSERT INTO `regions` VALUES (3476, 189, '管城回族区', '/17/189/', '', 3, 0, 1, 0, '20030916002494');
INSERT INTO `regions` VALUES (3477, 189, '惠济区', '/17/189/', '', 3, 0, 1, 0, '20030916002497');
INSERT INTO `regions` VALUES (3478, 189, '金水区', '/17/189/', '', 3, 0, 1, 0, '20030916002495');
INSERT INTO `regions` VALUES (3479, 189, '上街区', '/17/189/', '', 3, 0, 1, 0, '20030916002496');
INSERT INTO `regions` VALUES (3480, 189, '新密市', '/17/189/', '', 3, 0, 2, 0, '20030916002500');
INSERT INTO `regions` VALUES (3481, 189, '新郑市', '/17/189/', '', 3, 0, 2, 0, '20030916002498');
INSERT INTO `regions` VALUES (3482, 189, '荥阳市', '/17/189/', '', 3, 0, 2, 0, '20030916002502');
INSERT INTO `regions` VALUES (3483, 189, '中牟县', '/17/189/', '', 3, 0, 3, 0, '20030916002503');
INSERT INTO `regions` VALUES (3484, 189, '中原区', '/17/189/', '', 3, 0, 1, 0, '20030916002492');
INSERT INTO `regions` VALUES (3485, 250, '中山市', '/20/250/', '', 3, 0, 2, 0, '20030916000602');
INSERT INTO `regions` VALUES (3486, 361, '海原县（海城镇）', '/31/361/', '', 3, 0, 3, 0, '20030916002465');
INSERT INTO `regions` VALUES (3487, 361, '沙坡头区', '/31/361/', '', 3, 0, 2, 0, '20030916002460');
INSERT INTO `regions` VALUES (3488, 361, '中宁县（宁安镇）', '/31/361/', '', 3, 0, 3, 0, '20030916002461');
INSERT INTO `regions` VALUES (3493, 204, '川汇区', '/17/204/', '', 3, 0, 2, 0, '20030916002629');
INSERT INTO `regions` VALUES (3494, 204, '郸城县', '/17/204/', '', 3, 0, 3, 0, '20030916002636');
INSERT INTO `regions` VALUES (3495, 204, '扶沟县', '/17/204/', '', 3, 0, 3, 0, '20030916002631');
INSERT INTO `regions` VALUES (3496, 204, '淮阳县', '/17/204/', '', 3, 0, 3, 0, '20030916002637');
INSERT INTO `regions` VALUES (3497, 204, '鹿邑县', '/17/204/', '', 3, 0, 3, 0, '20030916002635');
INSERT INTO `regions` VALUES (3498, 204, '商水县', '/17/204/', '', 3, 0, 3, 0, '20030916002633');
INSERT INTO `regions` VALUES (3499, 204, '沈丘县', '/17/204/', '', 3, 0, 3, 0, '20030916002638');
INSERT INTO `regions` VALUES (3500, 204, '太康县', '/17/204/', '', 3, 0, 3, 0, '20030916002634');
INSERT INTO `regions` VALUES (3501, 204, '西华县', '/17/204/', '', 3, 0, 3, 0, '20030916002632');
INSERT INTO `regions` VALUES (3502, 204, '项城市', '/17/204/', '', 3, 0, 3, 0, '20030916002630');
INSERT INTO `regions` VALUES (3503, 220, '茶陵县', '/19/220/', '', 3, 0, 3, 0, '20030916000335');
INSERT INTO `regions` VALUES (3504, 220, '荷塘区', '/19/220/', '', 3, 0, 2, 0, '20030916000331');
INSERT INTO `regions` VALUES (3505, 220, '醴陵市', '/19/220/', '', 3, 0, 2, 0, '20030916000332');
INSERT INTO `regions` VALUES (3506, 220, '芦淞区', '/19/220/', '', 3, 0, 2, 0, '3000000137790395');
INSERT INTO `regions` VALUES (3507, 220, '石峰区', '/19/220/', '', 3, 0, 2, 0, '3000000137790486');
INSERT INTO `regions` VALUES (3508, 220, '天元区', '/19/220/', '', 3, 0, 2, 0, '3000000137790236');
INSERT INTO `regions` VALUES (3509, 220, '炎陵县', '/19/220/', '', 3, 0, 3, 0, '20030916000336');
INSERT INTO `regions` VALUES (3510, 220, '攸县', '/19/220/', '', 3, 0, 3, 0, '20030916000334');
INSERT INTO `regions` VALUES (3511, 220, '株洲县', '/19/220/', '', 3, 0, 3, 0, '20030916000333');
INSERT INTO `regions` VALUES (3512, 235, '斗门区', '/20/235/', '', 3, 0, 3, 0, '20030916000603');
INSERT INTO `regions` VALUES (3513, 235, '金湾区', '/20/235/', '', 3, 0, 3, 0, '20030916000604');
INSERT INTO `regions` VALUES (3514, 235, '香洲区', '/20/235/', '', 3, 0, 2, 0, '20030916000605');
INSERT INTO `regions` VALUES (3515, 205, '泌阳县', '/17/205/', '', 3, 0, 3, 0, '20030916002641');
INSERT INTO `regions` VALUES (3516, 205, '平舆县', '/17/205/', '', 3, 0, 3, 0, '20030916002646');
INSERT INTO `regions` VALUES (3517, 205, '确山县', '/17/205/', '', 3, 0, 3, 0, '20030916002499');
INSERT INTO `regions` VALUES (3518, 205, '汝南县', '/17/205/', '', 3, 0, 3, 0, '20030916002645');
INSERT INTO `regions` VALUES (3519, 205, '上蔡县', '/17/205/', '', 3, 0, 3, 0, '20030916002644');
INSERT INTO `regions` VALUES (3520, 205, '遂平县', '/17/205/', '', 3, 0, 3, 0, '20030916002642');
INSERT INTO `regions` VALUES (3521, 205, '西平县', '/17/205/', '', 3, 0, 2, 0, '20030916002643');
INSERT INTO `regions` VALUES (3522, 205, '新蔡县', '/17/205/', '', 3, 0, 3, 0, '20030916002647');
INSERT INTO `regions` VALUES (3523, 205, '驿城区', '/17/205/', '', 3, 0, 2, 0, '20030916002639');
INSERT INTO `regions` VALUES (3524, 205, '正阳县', '/17/205/', '', 3, 0, 3, 0, '20030916002648');
INSERT INTO `regions` VALUES (3525, 289, '安岳县', '/24/289/', '', 3, 0, 3, 0, '20030916000113');
INSERT INTO `regions` VALUES (3526, 289, '简阳市', '/24/289/', '', 3, 0, 3, 0, '20030916000111');
INSERT INTO `regions` VALUES (3527, 289, '乐至县', '/24/289/', '', 3, 0, 3, 0, '20030916000112');
INSERT INTO `regions` VALUES (3528, 289, '雁江区', '/24/289/', '', 3, 0, 2, 0, '20030916000110');
INSERT INTO `regions` VALUES (3529, 174, '博山区', '/16/174/', '', 3, 0, 2, 0, '20030916000971');
INSERT INTO `regions` VALUES (3530, 174, '高青县', '/16/174/', '', 3, 0, 3, 0, '20030916000972');
INSERT INTO `regions` VALUES (3531, 174, '桓台县', '/16/174/', '', 3, 0, 3, 0, '20030916000973');
INSERT INTO `regions` VALUES (3532, 174, '临淄区', '/16/174/', '', 3, 0, 2, 0, '20030916000974');
INSERT INTO `regions` VALUES (3533, 174, '沂源县', '/16/174/', '', 3, 0, 3, 0, '20030916000975');
INSERT INTO `regions` VALUES (3534, 174, '张店区', '/16/174/', '', 3, 0, 2, 0, '20030916000976');
INSERT INTO `regions` VALUES (3535, 174, '周村区', '/16/174/', '', 3, 0, 2, 0, '20030916000977');
INSERT INTO `regions` VALUES (3536, 174, '淄川区', '/16/174/', '', 3, 0, 2, 0, '20030916000978');
INSERT INTO `regions` VALUES (3537, 273, '大安区', '/24/273/', '', 3, 0, 3, 0, '20030916000098');
INSERT INTO `regions` VALUES (3538, 273, '富顺县', '/24/273/', '', 3, 0, 5, 0, '20030916000103');
INSERT INTO `regions` VALUES (3539, 273, '贡井区', '/24/273/', '', 3, 0, 3, 0, '20030916000099');
INSERT INTO `regions` VALUES (3540, 273, '荣县', '/24/273/', '', 3, 0, 5, 0, '20030916000102');
INSERT INTO `regions` VALUES (3541, 273, '沿滩区', '/24/273/', '', 3, 0, 4, 0, '20030916000101');
INSERT INTO `regions` VALUES (3542, 273, '自流井区', '/24/273/', '', 3, 0, 3, 0, '20030916000100');
INSERT INTO `regions` VALUES (3543, 295, '赤水市', '/25/295/', '', 3, 0, 2, 0, '20030916000419');
INSERT INTO `regions` VALUES (3544, 295, '道真仡佬族苗族自治县', '/25/295/', '', 3, 0, 4, 0, '20030916000429');
INSERT INTO `regions` VALUES (3545, 295, '凤冈县', '/25/295/', '', 3, 0, 4, 0, '20030916000425');
INSERT INTO `regions` VALUES (3546, 295, '红花岗区', '/25/295/', '', 3, 0, 2, 0, '20030916000418');
INSERT INTO `regions` VALUES (3547, 295, '汇川区', '/25/295/', '', 3, 0, 2, 0, '3000000137789046');
INSERT INTO `regions` VALUES (3548, 295, '湄潭县', '/25/295/', '', 3, 0, 4, 0, '20030916000426');
INSERT INTO `regions` VALUES (3549, 295, '仁怀市', '/25/295/', '', 3, 0, 2, 0, '20030916000420');
INSERT INTO `regions` VALUES (3550, 295, '绥阳县', '/25/295/', '', 3, 0, 4, 0, '20030916000423');
INSERT INTO `regions` VALUES (3551, 295, '桐梓县', '/25/295/', '', 3, 0, 4, 0, '20030916000422');
INSERT INTO `regions` VALUES (3552, 295, '务川仡佬族苗族自治县', '/25/295/', '', 3, 0, 4, 0, '20030916000430');
INSERT INTO `regions` VALUES (3553, 295, '习水县', '/25/295/', '', 3, 0, 4, 0, '20030916000428');
INSERT INTO `regions` VALUES (3554, 295, '余庆县', '/25/295/', '', 3, 0, 4, 0, '20030916000427');
INSERT INTO `regions` VALUES (3555, 295, '正安县', '/25/295/', '', 3, 0, 4, 0, '20030916000424');
INSERT INTO `regions` VALUES (3556, 295, '遵义县', '/25/295/', '', 3, 0, 4, 0, '20030916000421');
INSERT INTO `regions` VALUES (3557, 271, '渝中区', '/23/271/', '', 3, 0, 1, 0, '20030916000228');
INSERT INTO `regions` VALUES (3558, 271, '大渡口区', '/23/271/', '', 3, 0, 1, 0, '20030916000234');
INSERT INTO `regions` VALUES (3559, 271, '江北区', '/23/271/', '', 3, 0, 1, 0, '20030916000229');
INSERT INTO `regions` VALUES (3560, 271, '南岸区', '/23/271/', '', 3, 0, 1, 0, '20030916000233');
INSERT INTO `regions` VALUES (3561, 271, '沙坪坝区', '/23/271/', '', 3, 0, 1, 0, '20030916000230');
INSERT INTO `regions` VALUES (3562, 271, '九龙坡区', '/23/271/', '', 3, 0, 1, 0, '20030916000232');
INSERT INTO `regions` VALUES (3563, 271, '北碚区', '/23/271/', '', 3, 0, 1, 0, '20030916000235');
INSERT INTO `regions` VALUES (3564, 271, '万盛区', '/23/271/', '', 3, 0, 2, 0, '20030916000236');
INSERT INTO `regions` VALUES (3565, 271, '双桥区', '/23/271/', '', 3, 0, 1, 0, '20030916000237');
INSERT INTO `regions` VALUES (3566, 271, '渝北区', '/23/271/', '', 3, 0, 1, 0, '20030916000238');
INSERT INTO `regions` VALUES (3567, 271, '巴南区', '/23/271/', '', 3, 0, 1, 0, '20030916000240');
INSERT INTO `regions` VALUES (3568, 271, '万州区', '/23/271/', '', 3, 0, 2, 0, '20030916000250');
INSERT INTO `regions` VALUES (3569, 271, '涪陵区', '/23/271/', '', 3, 0, 2, 0, '20030916000259');
INSERT INTO `regions` VALUES (3570, 271, '黔江区', '/23/271/', '', 3, 0, 1, 0, '20030916000266');
INSERT INTO `regions` VALUES (3571, 271, '长寿区', '/23/271/', '', 3, 0, 1, 0, '20030916000239');
INSERT INTO `regions` VALUES (3572, 271, '江津区', '/23/271/', '', 3, 0, 1, 0, '20030916000244');
INSERT INTO `regions` VALUES (3573, 271, '合川区', '/23/271/', '', 3, 0, 1, 0, '20030916000242');
INSERT INTO `regions` VALUES (3574, 271, '永川区', '/23/271/', '', 3, 0, 1, 0, '20030916000243');
INSERT INTO `regions` VALUES (3575, 271, '南川区', '/23/271/', '', 3, 0, 1, 0, '20030916000263');
INSERT INTO `regions` VALUES (3579, 22, '海南省直辖市县', '/22/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (3580, 269, '三亚市', '/22/269/', '', 3, 0, 3, 0, '20030916000869');
INSERT INTO `regions` VALUES (3591, 271, '綦江县', '/23/271/', '', 3, 0, 3, 0, '20030916000241');
INSERT INTO `regions` VALUES (3592, 271, '潼南县', '/23/271/', '', 3, 0, 2, 0, '20030916000248');
INSERT INTO `regions` VALUES (3593, 271, '铜梁县', '/23/271/', '', 3, 0, 2, 0, '20030916000247');
INSERT INTO `regions` VALUES (3594, 271, '大足县', '/23/271/', '', 3, 0, 2, 0, '20030916000245');
INSERT INTO `regions` VALUES (3595, 271, '荣昌县', '/23/271/', '', 3, 0, 3, 0, '20030916000246');
INSERT INTO `regions` VALUES (3596, 271, '璧山县', '/23/271/', '', 3, 0, 2, 0, '20030916000249');
INSERT INTO `regions` VALUES (3597, 271, '梁平县', '/23/271/', '', 3, 0, 3, 0, '20030916000255');
INSERT INTO `regions` VALUES (3598, 271, '城口县', '/23/271/', '', 3, 0, 3, 0, '20030916000258');
INSERT INTO `regions` VALUES (3599, 271, '丰都县', '/23/271/', '', 3, 0, 3, 0, '20030916000260');
INSERT INTO `regions` VALUES (3600, 271, '垫江县', '/23/271/', '', 3, 0, 3, 0, '20030916000262');
INSERT INTO `regions` VALUES (3601, 271, '武隆县', '/23/271/', '', 3, 0, 3, 0, '20030916000261');
INSERT INTO `regions` VALUES (3602, 271, '忠县', '/23/271/', '', 3, 0, 3, 0, '20030916000251');
INSERT INTO `regions` VALUES (3603, 271, '开县', '/23/271/', '', 3, 0, 2, 0, '20030916000256');
INSERT INTO `regions` VALUES (3604, 271, '云阳县', '/23/271/', '', 3, 0, 2, 0, '20030916000252');
INSERT INTO `regions` VALUES (3605, 271, '奉节县', '/23/271/', '', 3, 0, 3, 0, '20030916000253');
INSERT INTO `regions` VALUES (3606, 271, '巫山县', '/23/271/', '', 3, 0, 3, 0, '20030916000254');
INSERT INTO `regions` VALUES (3607, 271, '巫溪县', '/23/271/', '', 3, 0, 3, 0, '20030916000257');
INSERT INTO `regions` VALUES (3608, 271, '石柱自治县', '/23/271/', '', 3, 0, 3, 0, '20030916000264');
INSERT INTO `regions` VALUES (3609, 271, '秀山自治县', '/23/271/', '', 3, 0, 3, 0, '20030916000268');
INSERT INTO `regions` VALUES (3610, 271, '酉阳自治县', '/23/271/', '', 3, 0, 3, 0, '20030916000267');
INSERT INTO `regions` VALUES (3611, 271, '彭水自治县', '/23/271/', '', 3, 0, 3, 0, '20030916000265');
INSERT INTO `regions` VALUES (3612, 717, '大港区', '/3/717/', '', 3, 0, 2, 0, '20030916001861');
INSERT INTO `regions` VALUES (3615, 362, '米东区', '/32/362/', '', 3, 0, 3, 0, '20030916002169');
INSERT INTO `regions` VALUES (3617, 168, '井冈山市', '/15/168/', '', 3, 0, 2, 0, '20030916001375');
INSERT INTO `regions` VALUES (46495, 301, '都匀市', '/25/301/', '', 3, 0, 3, 0, '20030916000471');
INSERT INTO `regions` VALUES (46496, 301, '福泉市', '/25/301/', '', 3, 0, 3, 0, '20030916000472');
INSERT INTO `regions` VALUES (46497, 301, '荔波县', '/25/301/', '', 3, 0, 3, 0, '20030916000473');
INSERT INTO `regions` VALUES (46498, 301, '贵定县', '/25/301/', '', 3, 0, 3, 0, '20030916000474');
INSERT INTO `regions` VALUES (46499, 301, '瓮安县', '/25/301/', '', 3, 0, 3, 0, '20030916000475');
INSERT INTO `regions` VALUES (46500, 301, '独山县', '/25/301/', '', 3, 0, 3, 0, '20030916000476');
INSERT INTO `regions` VALUES (46501, 301, '平塘县', '/25/301/', '', 3, 0, 3, 0, '20030916000477');
INSERT INTO `regions` VALUES (46502, 301, '罗甸县', '/25/301/', '', 3, 0, 3, 0, '20030916000478');
INSERT INTO `regions` VALUES (46503, 301, '长顺县', '/25/301/', '', 3, 0, 3, 0, '20030916000479');
INSERT INTO `regions` VALUES (46504, 301, '龙里县', '/25/301/', '', 3, 0, 3, 0, '20030916000480');
INSERT INTO `regions` VALUES (46505, 301, '惠水县', '/25/301/', '', 3, 0, 3, 0, '20030916000481');
INSERT INTO `regions` VALUES (46506, 301, '三都水族自治县', '/25/301/', '', 3, 0, 3, 0, '20030916000482');
INSERT INTO `regions` VALUES (46507, 299, '兴义市', '/25/299/', '', 3, 0, 3, 0, '20030916000483');
INSERT INTO `regions` VALUES (46508, 299, '兴仁县', '/25/299/', '', 3, 0, 3, 0, '20030916000484');
INSERT INTO `regions` VALUES (46509, 299, '普安县', '/25/299/', '', 3, 0, 3, 0, '20030916000485');
INSERT INTO `regions` VALUES (46510, 299, '晴隆县', '/25/299/', '', 3, 0, 3, 0, '20030916000486');
INSERT INTO `regions` VALUES (46511, 299, '贞丰县', '/25/299/', '', 3, 0, 3, 0, '20030916000487');
INSERT INTO `regions` VALUES (46512, 299, '望谟县', '/25/299/', '', 3, 0, 3, 0, '20030916000488');
INSERT INTO `regions` VALUES (46513, 299, '册亨县', '/25/299/', '', 3, 0, 3, 0, '20030916000489');
INSERT INTO `regions` VALUES (46514, 299, '安龙县', '/25/299/', '', 3, 0, 3, 0, '20030916000490');
INSERT INTO `regions` VALUES (46515, 155, '建宁县', '/14/155/', '', 3, 0, 3, 0, '20030916001657');
INSERT INTO `regions` VALUES (46517, 9, '伊春', '/9/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (46520, 46517, '乌伊岭区', '/9/46517/', '', 3, 0, 0, 0, '20030916000669');
INSERT INTO `regions` VALUES (46521, 46517, '伊春市红星区', '/9/46517/', '', 3, 0, 0, 0, '20030916000670');
INSERT INTO `regions` VALUES (46522, 46517, '伊春市上甘岭区', '/9/46517/', '', 3, 0, 0, 0, '20030916000671');
INSERT INTO `regions` VALUES (46523, 46517, '铁力市', '/9/46517/', '', 3, 0, 0, 0, '20030916000672');
INSERT INTO `regions` VALUES (46524, 46517, '嘉荫县', '/9/46517/', '', 3, 0, 0, 0, '20030916000673');
INSERT INTO `regions` VALUES (46525, 46517, '伊春市美溪区', '/9/46517/', '', 3, 0, 0, 0, '20030916000663');
INSERT INTO `regions` VALUES (46526, 46517, '伊春市南岔区', '/9/46517/', '', 3, 0, 0, 0, '20030916000658');
INSERT INTO `regions` VALUES (46527, 46517, '伊春市友好区', '/9/46517/', '', 3, 0, 0, 0, '20030916000659');
INSERT INTO `regions` VALUES (46528, 46517, '伊春市西林区', '/9/46517/', '', 3, 0, 0, 0, '20030916000660');
INSERT INTO `regions` VALUES (46529, 46517, '伊春市新青区', '/9/46517/', '', 3, 0, 0, 0, '20030916000662');
INSERT INTO `regions` VALUES (46530, 46517, '伊春市带岭区', '/9/46517/', '', 3, 0, 0, 0, '20030916000668');
INSERT INTO `regions` VALUES (46531, 46517, '伊春市翠峦区', '/9/46517/', '', 3, 0, 0, 0, '20030916000661');
INSERT INTO `regions` VALUES (46532, 46517, '伊春市金山屯区', '/9/46517/', '', 3, 0, 0, 0, '20030916000664');
INSERT INTO `regions` VALUES (46533, 46517, '伊春市五营区', '/9/46517/', '', 3, 0, 0, 0, '20030916000665');
INSERT INTO `regions` VALUES (46534, 46517, '伊春市乌马河区', '/9/46517/', '', 3, 0, 0, 0, '20030916000666');
INSERT INTO `regions` VALUES (46535, 46517, '伊春市汤旺河区', '/9/46517/', '', 3, 0, 0, 0, '20030916000667');
INSERT INTO `regions` VALUES (46536, 281, '乐山市', '/24/281/', '', 3, 0, 0, 0, '20030916000085');
INSERT INTO `regions` VALUES (46537, 280, '内江市', '/24/280/', '', 3, 0, 0, 0, '20030916000079');
INSERT INTO `regions` VALUES (46538, 292, '凉山州', '/24/292/', '', 3, 0, 0, 0, '20030916001188');
INSERT INTO `regions` VALUES (46539, 282, '南充市', '/24/282/', '', 3, 0, 0, 0, '20030916000064');
INSERT INTO `regions` VALUES (46540, 288, '巴中市', '/24/288/', '', 3, 0, 0, 0, '20030916000104');
INSERT INTO `regions` VALUES (46541, 278, '广元市', '/24/278/', '', 3, 0, 0, 0, '20030916000039');
INSERT INTO `regions` VALUES (46542, 286, '眉山市', '/24/286/', '', 3, 0, 0, 0, '20030916000114');
INSERT INTO `regions` VALUES (46543, 277, '绵阳市', '/24/277/', '', 3, 0, 0, 0, '20030916000047');
INSERT INTO `regions` VALUES (46544, 273, '自贡市', '/24/273/', '', 3, 0, 0, 0, '20030916000097');
INSERT INTO `regions` VALUES (46545, 289, '资阳市', '/24/289/', '', 3, 0, 0, 0, '20030916000109');
INSERT INTO `regions` VALUES (46546, 287, '雅安市', '/24/287/', '', 3, 0, 0, 0, '20030916000121');
INSERT INTO `regions` VALUES (46547, 318, '拉萨市', '/27/318/', '', 3, 0, 0, 0, '20030916002342');
INSERT INTO `regions` VALUES (46548, 324, '林芝县', '/27/324/', '', 3, 0, 0, 0, '20030916002372');
INSERT INTO `regions` VALUES (46549, 296, '安顺市', '/25/296/', '', 3, 0, 0, 0, '20030916000431');
INSERT INTO `regions` VALUES (46550, 349, '城南新区', '/30/349/', '', 3, 0, 0, 0, '3000000025702303');
INSERT INTO `regions` VALUES (46551, 135, '长丰县', '/13/135/', '', 3, 0, 0, 0, '20030916000747');
INSERT INTO `regions` VALUES (46552, 243, '惠州市', '/20/243/', '', 3, 0, 0, 0, '20030916000527');
INSERT INTO `regions` VALUES (46553, 245, '汕尾市', '/20/245/', '', 3, 0, 0, 0, '20030916000574');
INSERT INTO `regions` VALUES (46554, 239, '新会市', '/20/239/', '', 3, 0, 0, 0, '20030916000536');
INSERT INTO `regions` VALUES (46555, 246, '河源市', '/20/246/', '', 3, 0, 0, 0, '20030916000518');
INSERT INTO `regions` VALUES (46556, 366, '和田市', '/32/366/', '', 3, 0, 0, 0, '20030916002200');
INSERT INTO `regions` VALUES (46557, 370, '和硕县', '/32/370/', '', 3, 0, 0, 0, '20030916002234');
INSERT INTO `regions` VALUES (46558, 370, '博湖县', '/32/370/', '', 3, 0, 0, 0, '20030916002235');
INSERT INTO `regions` VALUES (46559, 370, '焉耆回族自治县', '/32/370/', '', 3, 0, 0, 0, '20030916002236');
INSERT INTO `regions` VALUES (46560, 370, '库尔勒市', '/32/370/', '', 3, 0, 0, 0, '20030916002228');
INSERT INTO `regions` VALUES (46561, 370, '轮台县', '/32/370/', '', 3, 0, 0, 0, '20030916002229');
INSERT INTO `regions` VALUES (46562, 370, '尉犁县', '/32/370/', '', 3, 0, 0, 0, '20030916002230');
INSERT INTO `regions` VALUES (46563, 370, '且末县', '/32/370/', '', 3, 0, 0, 0, '20030916002232');
INSERT INTO `regions` VALUES (46564, 127, '秀城区', '/12/127/', '', 3, 0, 0, 0, '20030916000906');
INSERT INTO `regions` VALUES (46565, 74, '新城子区', '/7/74/', '', 3, 0, 0, 0, '20030916001799');
INSERT INTO `regions` VALUES (1380999, 292, '东区', '/24/292/', '', 3, 0, 0, 0, '20030916001205');
INSERT INTO `regions` VALUES (1381001, 718, '上海区', '/10/718/', '', 3, 0, 0, 0, '3000000002564821');
INSERT INTO `regions` VALUES (1381002, 717, '塘沽区', '/3/717/', '', 3, 0, 0, 0, '20030916001859');
INSERT INTO `regions` VALUES (1381003, 717, '汉沽区', '/3/717/', '', 3, 0, 0, 0, '20030916001860');
INSERT INTO `regions` VALUES (1381004, 358, '石嘴山区', '/31/358/', '', 3, 0, 0, 0, '20030916002453');
INSERT INTO `regions` VALUES (1381005, 253, '云浮市', '/20/253/', '', 3, 0, 0, 0, '20030916000592');
INSERT INTO `regions` VALUES (1381006, 238, '佛山市', '/20/238/', '', 3, 0, 0, 0, '20030916000498');
INSERT INTO `regions` VALUES (1381007, 233, '广州市', '/20/233/', '', 3, 0, 0, 0, '20030916000508');
INSERT INTO `regions` VALUES (1381008, 252, '揭阳市', '/20/252/', '', 3, 0, 0, 0, '20030916000540');
INSERT INTO `regions` VALUES (1381009, 244, '梅州市', '/20/244/', '', 3, 0, 0, 0, '20030916000548');
INSERT INTO `regions` VALUES (1381010, 236, '汕头市', '/20/236/', '', 3, 0, 0, 0, '20030916000568');
INSERT INTO `regions` VALUES (1381011, 239, '江门市', '/20/239/', '', 3, 0, 0, 0, '20030916000532');
INSERT INTO `regions` VALUES (1381012, 248, '清远市', '/20/248/', '', 3, 0, 0, 0, '20030916000558');
INSERT INTO `regions` VALUES (1381013, 251, '潮州市', '/20/251/', '', 3, 0, 0, 0, '20030916000493');
INSERT INTO `regions` VALUES (1381014, 251, '潮州市', '/20/251/', '', 3, 0, 0, 0, '20030916000493');
INSERT INTO `regions` VALUES (1381015, 235, '珠海市', '/20/235/', '', 3, 0, 0, 0, '20030916000606');
INSERT INTO `regions` VALUES (1381016, 242, '肇庆市', '/20/242/', '', 3, 0, 0, 0, '20030916000601');
INSERT INTO `regions` VALUES (1381017, 241, '茂名市', '/20/241/', '', 3, 0, 0, 0, '20030916000874');
INSERT INTO `regions` VALUES (1381018, 32, '图木舒克', '/32/', '', 2, 0, 0, 0, '');
INSERT INTO `regions` VALUES (1381019, 1381018, '图木舒克市', '/32/1381018/', '', 3, 0, 0, 0, '20030916002177');
INSERT INTO `regions` VALUES (1381020, 363, '和丰县', '/32/363/', '', 3, 0, 0, 0, '20030916002261');
INSERT INTO `regions` VALUES (1381021, 370, '马兰县', '/32/370/', '', 3, 0, 0, 0, '20030916002260');
INSERT INTO `regions` VALUES (1381022, 370, '和静县', '/32/370/', '', 3, 0, 0, 0, '20030916002233');
INSERT INTO `regions` VALUES (1381023, 370, '若羌县', '/32/370/', '', 3, 0, 0, 0, '20030916002231');
INSERT INTO `regions` VALUES (1381024, 209, '十堰市', '/18/209/', '', 3, 0, 0, 0, '20030916002136');
INSERT INTO `regions` VALUES (1381025, 212, '荆门市', '/18/212/', '', 3, 0, 0, 0, '20030916002155');
INSERT INTO `regions` VALUES (1381026, 208, '襄樊市', '/18/208/', '', 3, 0, 0, 0, '20030916002145');
INSERT INTO `regions` VALUES (1381027, 217, '随州市', '/18/217/', '', 3, 0, 0, 0, '20030916002160');
INSERT INTO `regions` VALUES (1381028, 341, '张掖市', '/29/341/', '', 3, 0, 0, 0, '20030916001248');
INSERT INTO `regions` VALUES (1381029, 340, '武威市', '/29/340/', '', 3, 0, 0, 0, '20030916001236');
INSERT INTO `regions` VALUES (1381030, 337, '金昌市', '/29/337/', '', 3, 0, 0, 0, '20030916001222');
INSERT INTO `regions` VALUES (1381031, 155, '三明', '/14/155/', '', 3, 0, 0, 0, '3000000024123400');
INSERT INTO `regions` VALUES (1381032, 158, '南平', '/14/158/', '', 3, 0, 0, 0, '3000000024123717');
INSERT INTO `regions` VALUES (1381033, 160, '宁德', '/14/160/', '', 3, 0, 0, 0, '3000000024124072');
INSERT INTO `regions` VALUES (1381034, 152, '福州市', '/14/152/', '', 3, 0, 0, 0, '3000000024109771');
INSERT INTO `regions` VALUES (1381035, 154, '莆田', '/14/154/', '', 3, 0, 0, 0, '3000000024124491');
INSERT INTO `regions` VALUES (1381036, 74, '新民市兴隆堡', '/7/74/', '', 3, 0, 0, 0, '3000000041909055');
INSERT INTO `regions` VALUES (1381037, 46517, '伊春市伊春区', '/9/46517/', '', 3, 0, 0, 0, '20030916000657');

-- ----------------------------
-- Table structure for search_keyword
-- ----------------------------
DROP TABLE IF EXISTS `search_keyword`;
CREATE TABLE `search_keyword`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `create_id` int(11) NOT NULL,
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1065 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索敏感词过滤' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_keyword
-- ----------------------------
INSERT INTO `search_keyword` VALUES (1, '阿扁推翻', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (2, '阿宾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (3, '阿賓', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (4, '挨了一炮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (5, '爱液横流', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (6, '安街逆', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (7, '安局办公楼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (8, '安局豪华', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (9, '安门事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (10, '安眠藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (11, '案的准确', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (12, '八九民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (13, '八九学', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (14, '八九政治', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (15, '把病人整', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (16, '把邓小平', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (17, '把学生整', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (18, '罢工门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (19, '白黄牙签', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (20, '败培训', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (21, '办本科', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (22, '办理本科', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (23, '办理各种', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (24, '办理票据', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (25, '办理文凭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (26, '办理真实', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (27, '办理证书', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (28, '办理资格', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (29, '办文凭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (30, '办怔', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (31, '办证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (32, '半刺刀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (33, '辦毕业', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (34, '辦證', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (35, '谤罪获刑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (36, '磅解码器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (37, '磅遥控器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (38, '宝在甘肃修', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (39, '保过答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (40, '报复执法', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (41, '爆发骚', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (42, '北省委门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (43, '被打死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (44, '被指抄袭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (45, '被中共', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (46, '本公司担', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (47, '本无码', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (48, '毕业證', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (49, '变牌绝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (50, '辩词与梦', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (51, '冰毒', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (52, '冰火毒', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (53, '冰火佳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (54, '冰火九重', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (55, '冰火漫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (56, '冰淫传', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (57, '冰在火上', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (58, '波推龙', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (59, '博彩娱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (60, '博会暂停', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (61, '博园区伪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (62, '不查都', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (63, '不查全', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (64, '不思四化', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (65, '布卖淫女', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (66, '部忙组阁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (67, '部是这样', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (68, '才知道只生', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (69, '财众科技', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (70, '采花堂', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (71, '踩踏事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (72, '苍山兰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (73, '苍蝇水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (74, '藏春阁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (75, '藏獨', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (76, '操了嫂', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (77, '操嫂子', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (78, '策没有不', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (79, '插屁屁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (80, '察象蚂', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (81, '拆迁灭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (82, '车牌隐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (83, '成人电', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (84, '成人卡通', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (85, '成人聊', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (86, '成人片', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (87, '成人视', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (88, '成人图', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (89, '成人文', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (90, '成人小', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (91, '城管灭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (92, '惩公安', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (93, '惩贪难', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (94, '充气娃', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (95, '冲凉死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (96, '抽着大中', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (97, '抽着芙蓉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (98, '出成绩付', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (99, '出售发票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (100, '出售军', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (101, '穿透仪器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (102, '春水横溢', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (103, '纯度白', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (104, '纯度黄', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (105, '次通过考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (106, '催眠水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (107, '催情粉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (108, '催情药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (109, '催情藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (110, '挫仑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (111, '达毕业证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (112, '答案包', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (113, '答案提供', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (114, '打标语', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (115, '打错门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (116, '打飞机专', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (117, '打死经过', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (118, '打死人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (119, '打砸办公', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (120, '大鸡巴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (121, '大雞巴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (122, '大纪元', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (123, '大揭露', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (124, '大奶子', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (125, '大批贪官', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (126, '大肉棒', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (127, '大嘴歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (128, '代办发票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (129, '代办各', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (130, '代办文', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (131, '代办学', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (132, '代办制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (133, '代辦', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (134, '代表烦', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (135, '代開', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (136, '代考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (137, '代理发票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (138, '代理票据', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (139, '代您考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (140, '代您考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (141, '代写毕', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (142, '代写论', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (143, '代孕', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (144, '贷办', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (145, '贷借款', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (146, '贷开', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (147, '戴海静', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (148, '当代七整', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (149, '当官要精', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (150, '当官在于', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (151, '党的官', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (152, '党后萎', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (153, '党前干劲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (154, '刀架保安', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (155, '导的情人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (156, '导叫失', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (157, '导人的最', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (158, '导人最', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (159, '导小商', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (160, '到花心', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (161, '得财兼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (162, '的同修', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (163, '灯草和', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (164, '等级證', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (165, '等屁民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (166, '等人老百', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (167, '等人是老', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (168, '等人手术', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (169, '邓爷爷转', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (170, '邓玉娇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (171, '地产之歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (172, '地下先烈', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (173, '地震哥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (174, '帝国之梦', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (175, '递纸死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (176, '点数优惠', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (177, '电狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (178, '电话监', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (179, '电鸡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (180, '甸果敢', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (181, '蝶舞按', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (182, '丁香社', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (183, '丁子霖', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (184, '顶花心', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (185, '东北独立', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (186, '东复活', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (187, '东京热', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (188, '東京熱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (189, '洞小口紧', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (190, '都当警', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (191, '都当小姐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (192, '都进中央', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (193, '毒蛇钻', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (194, '独立台湾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (195, '赌球网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (196, '短信截', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (197, '对日强硬', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (198, '多美康', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (199, '躲猫猫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (200, '俄羅斯', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (201, '恶势力操', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (202, '恶势力插', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (203, '恩氟烷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (204, '儿园惨', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (205, '儿园砍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (206, '儿园杀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (207, '儿园凶', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (208, '二奶大', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (209, '发牌绝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (210, '发票出', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (211, '发票代', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (212, '发票销', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (213, '發票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (214, '法车仑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (215, '法伦功', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (216, '法轮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (217, '法轮佛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (218, '法维权', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (219, '法一轮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (220, '法院给废', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (221, '法正乾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (222, '反测速雷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (223, '反雷达测', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (224, '反屏蔽', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (225, '范燕琼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (226, '方迷香', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (227, '防电子眼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (228, '防身药水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (229, '房贷给废', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (230, '仿真枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (231, '仿真证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (232, '诽谤罪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (233, '费私服', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (234, '封锁消', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (235, '佛同修', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (236, '夫妻交换', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (237, '福尔马林', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (238, '福娃的預', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (239, '福娃頭上', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (240, '福香巴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (241, '府包庇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (242, '府集中领', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (243, '妇销魂', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (244, '附送枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (245, '复印件生', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (246, '复印件制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (247, '富民穷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (248, '富婆给废', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (249, '改号软件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (250, '感扑克', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (251, '冈本真', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (252, '肛交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (253, '肛门是邻', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (254, '岡本真', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (255, '钢针狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (256, '钢珠枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (257, '港澳博球', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (258, '港馬會', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (259, '港鑫華', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (260, '高就在政', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (261, '高考黑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (262, '高莺莺', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (263, '搞媛交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (264, '告长期', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (265, '告洋状', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (266, '格证考试', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (267, '各类考试', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (268, '各类文凭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (269, '跟踪器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (270, '工程吞得', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (271, '工力人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (272, '公安错打', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (273, '公安网监', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (274, '公开小姐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (275, '攻官小姐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (276, '共狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (277, '共王储', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (278, '狗粮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (279, '狗屁专家', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (280, '鼓动一些', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (281, '乖乖粉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (282, '官商勾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (283, '官也不容', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (284, '官因发帖', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (285, '光学真题', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (286, '跪真相', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (287, '滚圆大乳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (288, '国际投注', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (289, '国家妓', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (290, '国家软弱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (291, '国家吞得', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (292, '国库折', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (293, '国一九五七', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (294, '國內美', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (295, '哈药直销', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (296, '海访民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (297, '豪圈钱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (298, '号屏蔽器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (299, '和狗交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (300, '和狗性', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (301, '和狗做', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (302, '黑火药的', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (303, '红色恐怖', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (304, '红外透视', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (305, '紅色恐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (306, '胡江内斗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (307, '胡紧套', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (308, '胡錦濤', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (309, '胡适眼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (310, '胡耀邦', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (311, '湖淫娘', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (312, '虎头猎', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (313, '华国锋', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (314, '华门开', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (315, '化学扫盲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (316, '划老公', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (317, '还会吹萧', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (318, '还看锦涛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (319, '环球证件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (320, '换妻', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (321, '皇冠投注', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (322, '黄冰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (323, '浑圆豪乳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (324, '活不起', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (325, '火车也疯', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (326, '机定位器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (327, '机号定', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (328, '机号卫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (329, '机卡密', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (330, '机屏蔽器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (331, '基本靠吼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (332, '绩过后付', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (333, '激情电', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (334, '激情短', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (335, '激情妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (336, '激情炮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (337, '级办理', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (338, '级答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (339, '急需嫖', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (340, '集体打砸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (341, '集体腐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (342, '挤乳汁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (343, '擠乳汁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (344, '佳静安定', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (345, '家一样饱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (346, '家属被打', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (347, '甲虫跳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (348, '甲流了', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (349, '奸成瘾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (350, '兼职上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (351, '监听器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (352, '监听王', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (353, '简易炸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (354, '江胡内斗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (355, '江太上', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (356, '江系人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (357, '江贼民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (358, '疆獨', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (359, '蒋彦永', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (360, '叫自慰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (361, '揭贪难', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (362, '姐包夜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (363, '姐服务', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (364, '姐兼职', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (365, '姐上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (366, '金扎金', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (367, '金钟气', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (368, '津大地震', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (369, '津地震', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (370, '进来的罪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (371, '京地震', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (372, '京要地震', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (373, '经典谎言', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (374, '精子射在', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (375, '警察被', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (376, '警察的幌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (377, '警察殴打', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (378, '警察说保', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (379, '警车雷达', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (380, '警方包庇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (381, '警用品', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (382, '径步枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (383, '敬请忍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (384, '究生答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (385, '九龙论坛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (386, '九评共', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (387, '酒象喝汤', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (388, '酒像喝汤', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (389, '就爱插', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (390, '就要色', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (391, '举国体', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (392, '巨乳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (393, '据说全民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (394, '绝食声', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (395, '军长发威', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (396, '军刺', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (397, '军品特', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (398, '军用手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (399, '开邓选', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (400, '开锁工具', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (401, '開碼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (402, '開票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (403, '砍杀幼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (404, '砍伤儿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (405, '康没有不', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (406, '康跳楼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (407, '考答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (408, '考后付款', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (409, '考机构', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (410, '考考邓', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (411, '考联盟', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (412, '考前答', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (413, '考前答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (414, '考前付', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (415, '考设备', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (416, '考试包过', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (417, '考试保', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (418, '考试答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (419, '考试机构', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (420, '考试联盟', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (421, '考试枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (422, '考研考中', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (423, '考中答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (424, '磕彰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (425, '克分析', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (426, '克千术', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (427, '克透视', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (428, '空和雅典', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (429, '孔摄像', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (430, '控诉世博', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (431, '控制媒', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (432, '口手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (433, '骷髅死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (434, '快速办', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (435, '矿难不公', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (436, '拉登说', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (437, '拉开水晶', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (438, '来福猎', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (439, '拦截器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (440, '狼全部跪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (441, '浪穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (442, '老虎机', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (443, '雷人女官', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (444, '类准确答', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (445, '黎阳平', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (446, '李洪志', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (447, '李咏曰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (448, '理各种证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (449, '理是影帝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (450, '理证件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (451, '理做帐报', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (452, '力骗中央', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (453, '力月西', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (454, '丽媛离', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (455, '利他林', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (456, '连发手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (457, '聯繫電', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (458, '炼大法', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (459, '两岸才子', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (460, '两会代', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (461, '两会又三', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (462, '聊视频', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (463, '聊斋艳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (464, '了件渔袍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (465, '猎好帮手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (466, '猎枪销', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (467, '猎槍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (468, '獵槍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (469, '领土拿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (470, '流血事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (471, '六合彩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (472, '六死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (473, '六四事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (474, '六月联盟', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (475, '龙湾事件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (476, '隆手指', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (477, '陆封锁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (478, '陆同修', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (479, '氯胺酮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (480, '乱奸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (481, '乱伦类', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (482, '乱伦小', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (483, '亂倫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (484, '伦理大', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (485, '伦理电影', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (486, '伦理毛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (487, '伦理片', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (488, '轮功', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (489, '轮手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (490, '论文代', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (491, '罗斯小姐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (492, '裸聊网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (493, '裸舞视', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (494, '落霞缀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (495, '麻古', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (496, '麻果配', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (497, '麻果丸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (498, '麻将透', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (499, '麻醉狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (500, '麻醉枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (501, '麻醉槍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (502, '麻醉藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (503, '蟆叫专家', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (504, '卖地财政', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (505, '卖发票', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (506, '卖银行卡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (507, '卖自考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (508, '漫步丝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (509, '忙爱国', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (510, '猫眼工具', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (511, '毛一鲜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (512, '媒体封锁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (513, '每周一死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (514, '美艳少妇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (515, '妹按摩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (516, '妹上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (517, '门按摩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (518, '门保健', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (519, '門服務', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (520, '氓培训', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (521, '蒙汗药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (522, '迷幻型', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (523, '迷幻药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (524, '迷幻藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (525, '迷昏口', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (526, '迷昏药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (527, '迷昏藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (528, '迷魂香', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (529, '迷魂药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (530, '迷魂藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (531, '迷奸药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (532, '迷情水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (533, '迷情药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (534, '迷藥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (535, '谜奸药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (536, '蜜穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (537, '灭绝罪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (538, '民储害', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (539, '民九亿商', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (540, '民抗议', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (541, '明慧网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (542, '铭记印尼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (543, '摩小姐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (544, '母乳家', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (545, '木齐针', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (546, '幕没有不', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (547, '幕前戲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (548, '内射', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (549, '南充针', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (550, '嫩穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (551, '嫩阴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (552, '泥马之歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (553, '你的西域', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (554, '拟涛哥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (555, '娘两腿之间', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (556, '妞上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (557, '浓精', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (558, '怒的志愿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (559, '女被人家搞', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (560, '女激情', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (561, '女技师', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (562, '女人和狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (563, '女任职名', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (564, '女上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (565, '女優', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (566, '鸥之歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (567, '拍肩神药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (568, '拍肩型', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (569, '牌分析', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (570, '牌技网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (571, '炮的小蜜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (572, '陪考枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (573, '配有消', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (574, '喷尿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (575, '嫖俄罗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (576, '嫖鸡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (577, '平惨案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (578, '平叫到床', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (579, '仆不怕饮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (580, '普通嘌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (581, '期货配', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (582, '奇迹的黄', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (583, '奇淫散', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (584, '骑单车出', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (585, '气狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (586, '气枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (587, '汽狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (588, '汽枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (589, '氣槍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (590, '铅弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (591, '钱三字经', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (592, '枪出售', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (593, '枪的参', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (594, '枪的分', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (595, '枪的结', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (596, '枪的制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (597, '枪货到', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (598, '枪决女犯', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (599, '枪决现场', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (600, '枪模', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (601, '枪手队', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (602, '枪手网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (603, '枪销售', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (604, '枪械制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (605, '枪子弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (606, '强权政府', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (607, '强硬发言', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (608, '抢其火炬', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (609, '切听器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (610, '窃听器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (611, '禽流感了', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (612, '勤捞致', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (613, '氢弹手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (614, '清除负面', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (615, '清純壆', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (616, '情聊天室', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (617, '情妹妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (618, '情视频', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (619, '情自拍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (620, '氰化钾', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (621, '氰化钠', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (622, '请集会', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (623, '请示威', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (624, '请愿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (625, '琼花问', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (626, '区的雷人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (627, '娶韩国', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (628, '全真证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (629, '群奸暴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (630, '群起抗暴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (631, '群体性事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (632, '绕过封锁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (633, '惹的国', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (634, '人权律', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (635, '人体艺', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (636, '人游行', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (637, '人在云上', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (638, '人真钱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (639, '认牌绝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (640, '任于斯国', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (641, '柔胸粉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (642, '肉洞', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (643, '肉棍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (644, '如厕死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (645, '乳交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (646, '软弱的国', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (647, '赛后骚', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (648, '三挫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (649, '三级片', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (650, '三秒倒', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (651, '三网友', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (652, '三唑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (653, '骚妇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (654, '骚浪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (655, '骚穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (656, '骚嘴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (657, '扫了爷爷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (658, '色电影', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (659, '色妹妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (660, '色视频', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (661, '色小说', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (662, '杀指南', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (663, '山涉黑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (664, '煽动不明', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (665, '煽动群众', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (666, '上门激', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (667, '烧公安局', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (668, '烧瓶的', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (669, '韶关斗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (670, '韶关玩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (671, '韶关旭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (672, '射网枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (673, '涉嫌抄袭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (674, '深喉冰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (675, '神七假', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (676, '神韵艺术', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (677, '生被砍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (678, '生踩踏', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (679, '生肖中特', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (680, '圣战不息', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (681, '盛行在舞', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (682, '尸博', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (683, '失身水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (684, '失意药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (685, '狮子旗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (686, '十八等', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (687, '十大谎', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (688, '十大禁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (689, '十个预言', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (690, '十类人不', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (691, '十七大幕', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (692, '实毕业证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (693, '实体娃', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (694, '实学历文', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (695, '士康事件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (696, '式粉推', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (697, '视解密', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (698, '是躲猫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (699, '手变牌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (700, '手答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (701, '手狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (702, '手机跟', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (703, '手机监', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (704, '手机窃', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (705, '手机追', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (706, '手拉鸡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (707, '手木仓', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (708, '手槍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (709, '守所死法', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (710, '兽交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (711, '售步枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (712, '售纯度', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (713, '售单管', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (714, '售弹簧刀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (715, '售防身', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (716, '售狗子', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (717, '售虎头', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (718, '售火药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (719, '售假币', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (720, '售健卫', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (721, '售军用', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (722, '售猎枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (723, '售氯胺', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (724, '售麻醉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (725, '售冒名', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (726, '售枪支', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (727, '售热武', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (728, '售三棱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (729, '售手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (730, '售五四', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (731, '售信用', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (732, '售一元硬', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (733, '售子弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (734, '售左轮', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (735, '书办理', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (736, '熟妇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (737, '术牌具', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (738, '双管立', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (739, '双管平', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (740, '水阎王', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (741, '丝护士', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (742, '丝情侣', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (743, '丝袜保', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (744, '丝袜恋', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (745, '丝袜美', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (746, '丝袜妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (747, '丝袜网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (748, '丝足按', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (749, '司长期有', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (750, '司法黑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (751, '私房写真', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (752, '死法分布', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (753, '死要见毛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (754, '四博会', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (755, '四大扯', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (756, '四小码', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (757, '苏家屯集', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (758, '诉讼集团', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (759, '素女心', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (760, '速代办', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (761, '速取证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (762, '酸羟亚胺', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (763, '蹋纳税', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (764, '太王四神', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (765, '泰兴幼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (766, '泰兴镇中', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (767, '泰州幼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (768, '贪官也辛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (769, '探测狗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (770, '涛共产', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (771, '涛一样胡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (772, '特工资', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (773, '特码', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (774, '特上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (775, '体透视镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (776, '替考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (777, '替人体', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (778, '天朝特', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (779, '天鹅之旅', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (780, '天推广歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (781, '田罢工', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (782, '田田桑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (783, '田停工', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (784, '庭保养', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (785, '庭审直播', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (786, '通钢总经', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (787, '偷電器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (788, '偷肃贪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (789, '偷听器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (790, '偷偷贪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (791, '头双管', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (792, '透视功能', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (793, '透视镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (794, '透视扑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (795, '透视器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (796, '透视眼镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (797, '透视药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (798, '透视仪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (799, '秃鹰汽', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (800, '突破封锁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (801, '突破网路', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (802, '推油按', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (803, '脱衣艳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (804, '瓦斯手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (805, '袜按摩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (806, '外透视镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (807, '外围赌球', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (808, '湾版假', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (809, '万能钥匙', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (810, '万人骚动', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (811, '王立军', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (812, '王益案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (813, '网民案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (814, '网民获刑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (815, '网民诬', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (816, '微型摄像', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (817, '围攻警', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (818, '围攻上海', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (819, '维汉员', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (820, '维权基', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (821, '维权人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (822, '维权谈', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (823, '委坐船', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (824, '谓的和谐', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (825, '温家堡', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (826, '温切斯特', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (827, '温影帝', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (828, '溫家寶', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (829, '瘟加饱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (830, '瘟假饱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (831, '文凭证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (832, '文强', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (833, '纹了毛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (834, '闻被控制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (835, '闻封锁', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (836, '瓮安', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (837, '我的西域', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (838, '我搞台独', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (839, '乌蝇水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (840, '无耻语录', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (841, '无码专', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (842, '五套功', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (843, '五月天', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (844, '午夜电', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (845, '午夜极', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (846, '武警暴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (847, '武警殴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (848, '武警已增', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (849, '务员答案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (850, '务员考试', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (851, '雾型迷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (852, '西藏限', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (853, '西服进去', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (854, '希脏', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (855, '习进平', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (856, '习晋平', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (857, '席复活', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (858, '席临终前', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (859, '席指着护', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (860, '洗澡死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (861, '喜贪赃', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (862, '先烈纷纷', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (863, '现大地震', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (864, '现金投注', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (865, '线透视镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (866, '限制言', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (867, '陷害案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (868, '陷害罪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (869, '相自首', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (870, '香港论坛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (871, '香港马会', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (872, '香港一类', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (873, '香港总彩', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (874, '硝化甘', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (875, '小穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (876, '校骚乱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (877, '协晃悠', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (878, '写两会', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (879, '泄漏的内', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (880, '新建户', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (881, '新疆叛', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (882, '新疆限', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (883, '新金瓶', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (884, '新唐人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (885, '信访专班', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (886, '信接收器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (887, '兴中心幼', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (888, '星上门', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (889, '行长王益', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (890, '形透视镜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (891, '型手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (892, '姓忽悠', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (893, '幸运码', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (894, '性爱日', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (895, '性福情', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (896, '性感少', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (897, '性推广歌', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (898, '胸主席', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (899, '徐玉元', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (900, '学骚乱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (901, '学位證', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (902, '學生妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (903, '丫与王益', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (904, '烟感器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (905, '严晓玲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (906, '言被劳教', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (907, '言论罪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (908, '盐酸曲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (909, '颜射', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (910, '恙虫病', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (911, '姚明进去', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (912, '要人权', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (913, '要射精了', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (914, '要射了', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (915, '要泄了', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (916, '夜激情', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (917, '液体炸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (918, '一小撮别', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (919, '遗情书', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (920, '蚁力神', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (921, '益关注组', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (922, '益受贿', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (923, '阴间来电', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (924, '陰唇', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (925, '陰道', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (926, '陰戶', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (927, '淫魔舞', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (928, '淫情女', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (929, '淫肉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (930, '淫騷妹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (931, '淫兽', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (932, '淫兽学', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (933, '淫水', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (934, '淫穴', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (935, '隐形耳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (936, '隐形喷剂', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (937, '应子弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (938, '婴儿命', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (939, '咏妓', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (940, '用手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (941, '幽谷三', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (942, '游精佑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (943, '有奶不一', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (944, '右转是政', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (945, '幼齿类', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (946, '娱乐透视', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (947, '愚民同', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (948, '愚民政', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (949, '与狗性', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (950, '玉蒲团', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (951, '育部女官', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (952, '冤民大', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (953, '鸳鸯洗', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (954, '园惨案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (955, '园发生砍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (956, '园砍杀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (957, '园凶杀', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (958, '园血案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (959, '原一九五七', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (960, '原装弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (961, '袁腾飞', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (962, '晕倒型', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (963, '韵徐娘', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (964, '遭便衣', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (965, '遭到警', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (966, '遭警察', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (967, '遭武警', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (968, '择油录', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (969, '曾道人', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (970, '炸弹教', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (971, '炸弹遥控', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (972, '炸广州', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (973, '炸立交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (974, '炸药的制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (975, '炸药配', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (976, '炸药制', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (977, '张春桥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (978, '找枪手', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (979, '找援交', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (980, '找政法委副', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (981, '赵紫阳', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (982, '针刺案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (983, '针刺伤', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (984, '针刺事', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (985, '针刺死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (986, '侦探设备', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (987, '真钱斗地', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (988, '真钱投注', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (989, '真善忍', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (990, '真实文凭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (991, '真实资格', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (992, '震惊一个民', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (993, '震其国土', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (994, '证到付款', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (995, '证件办', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (996, '证件集团', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (997, '证生成器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (998, '证书办', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (999, '证一次性', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1000, '政府操', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1001, '政论区', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1002, '證件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1003, '植物冰', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1004, '殖器护', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1005, '指纹考勤', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1006, '指纹膜', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1007, '指纹套', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1008, '至国家高', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1009, '志不愿跟', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1010, '制服诱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1011, '制手枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1012, '制证定金', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1013, '制作证件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1014, '中的班禅', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1015, '中共黑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1016, '中国不强', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1017, '种公务员', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1018, '种学历证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1019, '众像羔', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1020, '州惨案', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1021, '州大批贪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1022, '州三箭', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1023, '宙最高法', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1024, '昼将近', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1025, '主席忏', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1026, '住英国房', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1027, '助考', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1028, '助考网', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1029, '专业办理', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1030, '专业代', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1031, '专业代写', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1032, '专业助', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1033, '转是政府', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1034, '赚钱资料', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1035, '装弹甲', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1036, '装枪套', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1037, '装消音', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1038, '着护士的胸', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1039, '着涛哥', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1040, '姿不对死', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1041, '资格證', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1042, '资料泄', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1043, '梓健特药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1044, '字牌汽', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1045, '自己找枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1046, '自慰用', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1047, '自由圣', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1048, '自由亚', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1049, '总会美女', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1050, '足球玩法', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1051, '最牛公安', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1052, '醉钢枪', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1053, '醉迷药', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1054, '醉乙醚', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1055, '尊爵粉', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1056, '左转是政', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1057, '作弊器', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1058, '作各种证', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1059, '作硝化甘', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1060, '唑仑', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1061, '做爱', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1062, '做原子弹', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1063, '做证件', '2015-01-01 00:00:00', 1, 'admin', '2015-01-01 00:00:00');
INSERT INTO `search_keyword` VALUES (1064, '小黄人', '2016-01-20 09:32:59', 1, 'admin', '2016-01-20 09:32:59');

-- ----------------------------
-- Table structure for search_logs
-- ----------------------------
DROP TABLE IF EXISTS `search_logs`;
CREATE TABLE `search_logs`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '搜索词',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `site_cookie` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'cookie埋点',
  `member_id` int(11) NOT NULL COMMENT '用户不登录存0',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索历史记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_logs
-- ----------------------------
INSERT INTO `search_logs` VALUES (19, '联想', '127.0.0.1', '09aa6c89-d4f4-4da7-8c21-1e22a35e81da', 1, '2020-02-22 17:37:32');
INSERT INTO `search_logs` VALUES (20, '\"   searchlogs.keyword   \"', '107.175.77.183', '', 0, '2020-03-05 10:00:06');
INSERT INTO `search_logs` VALUES (21, '\"   searchrecord.keyword   \"', '107.175.77.183', '', 0, '2020-03-05 10:00:16');
INSERT INTO `search_logs` VALUES (22, '\"   kd   \"', '107.175.77.183', '', 0, '2020-03-05 10:00:24');
INSERT INTO `search_logs` VALUES (23, '联想', '203.208.60.103', '', 0, '2020-03-03 23:49:39');
INSERT INTO `search_logs` VALUES (24, '面粉', '219.144.189.79', 'c97c74c1-9ff6-476b-b268-947db4bc2183', 1, '2020-03-06 15:27:09');

-- ----------------------------
-- Table structure for search_record
-- ----------------------------
DROP TABLE IF EXISTS `search_record`;
CREATE TABLE `search_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '热搜词',
  `keyword_pinyin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '热搜词拼音',
  `keyword_index` int(11) NOT NULL COMMENT '热搜词索引数量',
  `create_id` int(11) NOT NULL,
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '热搜词表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_record
-- ----------------------------

-- ----------------------------
-- Table structure for search_setting
-- ----------------------------
DROP TABLE IF EXISTS `search_setting`;
CREATE TABLE `search_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '搜索框下关键字设置',
  `keyword_filter` tinyint(4) NOT NULL COMMENT '关键字过滤1、不过滤；2、过滤',
  `index_product_id` int(11) NOT NULL COMMENT '1已生成索引，0未生成索引',
  `index_product_time` datetime(0) NOT NULL COMMENT '上次索引处理的时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_setting
-- ----------------------------
INSERT INTO `search_setting` VALUES (1, '联想,苹果,华硕', 2, 1, '2020-03-07 01:20:00', '2020-03-07 01:20:00');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `seller_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺logo',
  `seller_grade` int(11) NOT NULL COMMENT '店铺等级',
  `score_service` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺评分服务',
  `score_deliver_goods` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺评分发货',
  `score_description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺评分描述',
  `product_number` int(11) NOT NULL COMMENT '商品数量',
  `collection_number` int(11) NOT NULL COMMENT '店铺收藏',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `sale_money` decimal(10, 2) NOT NULL COMMENT '店铺总销售金额',
  `order_count` int(11) NOT NULL COMMENT '店铺总订单量',
  `order_count_over` int(11) NOT NULL COMMENT '店铺完成订单量',
  `seller_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO关键字',
  `seller_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO店铺描述',
  `audit_status` tinyint(4) NOT NULL COMMENT '审核状态 1、待审核；2、审核通过；3、冻结',
  `store_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺轮播图 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (1, 1, 'huashan', '平台自营', NULL, 1, '4.0', '5.0', '4.0', 4, 0, '2017-12-01 15:42:12', 0.00, 1, 0, '', '', 2, NULL);
INSERT INTO `seller` VALUES (2, 2, 'ejstest1', '服装旗舰店', NULL, 1, '0', '0', '0', 0, 0, '2017-12-01 15:51:27', 0.00, 0, 0, '', '', 2, NULL);
INSERT INTO `seller` VALUES (3, 3, 'ejstest2', '食品旗舰店', NULL, 1, '5.0', '5.0', '5.0', 0, 0, '2017-12-01 15:57:06', 0.00, 0, 0, '', '', 2, NULL);
INSERT INTO `seller` VALUES (4, 27, 'hs002', '廊坊测试1', NULL, 1, '0', '0', '0', 0, 0, '2019-01-05 10:25:48', 0.00, 0, 0, '', '', 2, NULL);

-- ----------------------------
-- Table structure for seller_apply
-- ----------------------------
DROP TABLE IF EXISTS `seller_apply`;
CREATE TABLE `seller_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `company` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `bussiness_license` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照注册号',
  `tax_license` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记号',
  `company_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业注册省',
  `company_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业注册市',
  `company_start_time` datetime(0) NULL DEFAULT NULL COMMENT '营业开始日期',
  `company_end_time` datetime(0) NULL DEFAULT NULL COMMENT '营业结束日期',
  `company_add` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用地址',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `bussiness_license_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照扫描件',
  `organization` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `bank_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行账户名称',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_name_branch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行支行名称',
  `brand_name_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行支行联行号',
  `bank_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `bank_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行省',
  `bank_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行市',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定代表人',
  `legal_person_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定代表人身份证',
  `person_card_up` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证正面扫描件',
  `person_card_down` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证背面扫描件',
  `person_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `state` tinyint(4) NOT NULL COMMENT '1、提交申请；2、审核通过；3、缴纳保证金；4、审核失败',
  `type` tinyint(4) NOT NULL COMMENT '1、平台自营；2、商家入驻',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `bond` int(11) NULL DEFAULT NULL COMMENT '保证金额度',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_apply
-- ----------------------------
INSERT INTO `seller_apply` VALUES (1, 1, 'huashan', '4297f44b13955235245b2497399d7a93', '陕西华山创业', '532501100006302', '3543534', '2', '716', '2015-11-01 00:00:00', '2021-12-01 00:00:00', '立水桥', '029-1231231', '', '/images/seller/apply/c92a17afc18b45b79c19b7b3e12e98d9.png', '532501100006302', '王先生', '建行', '立水桥', '123232432432123456', '234321232123456787', '2', '716', '王先生', '431121199312345431', '/images/seller/apply/15bb73bfa39e4fd09e2c53afd530508a.png', '/images/seller/apply/523766a29f2243c38cc861e7dc3ecbde.png', '13812341234', '13812341234@qq.com', 2, 2, 1, NULL, '2017-12-01 15:42:11', '2017-12-01 15:58:48');
INSERT INTO `seller_apply` VALUES (2, 2, 'ejstest_1', '4297f44b13955235245b2497399d7a93', '北京ejstest', '330106000109206', '667897432121123123', '2', '716', '2014-12-01 00:00:00', '2022-12-01 00:00:00', '天通苑馆', '010-5678876', '', '/images/seller/apply/9d9eb579f9394315a3ec631e5c0df9d9.png', '330106000109206', 'ejstest', '建行', '天通苑', '667897432121123123', '667897432121123123', '2', '716', '李先生', '431121134321232123', '/images/seller/apply/2dcbf12d379244b494ffb919cf039c5e.jpg', '/images/seller/apply/202606de13ee423cb9f976e04de57f65.jpg', '13809876754', '13809876754@qq.com', 2, 2, 1, NULL, '2017-12-01 15:51:27', '2017-12-01 15:58:31');
INSERT INTO `seller_apply` VALUES (3, 3, 'ejstest_3', '4297f44b13955235245b2497399d7a93', '先锋公司', '532501100006302', '34567897543212345', '2', '716', '2012-12-01 00:00:00', '2029-12-01 00:00:00', '霍营', '010-9876678', '', '/images/seller/apply/376941fddccc4ff9ab4b3d038f555bb5.jpg', '532501100006302', '工商', '工商', '霍营', '34567897543212345', '34567897543212345', '2', '716', '刘先生', '532501100006302', '/images/seller/apply/480cd322ba20470ba0ba40198c2b72a0.jpg', '/images/seller/apply/77fbeeff448443e8856b51429032f9c9.jpg', '13812349870', '13812349870@qq.com', 2, 2, 1, NULL, '2017-12-01 15:57:06', '2017-12-01 15:58:14');
INSERT INTO `seller_apply` VALUES (4, 27, 'admin-seller-apply-hs002', 'e10adc3949ba59abbe56e057f20f883e', '石家庄测试有限公司123', '1111', '111', '2', '716', '2019-01-05 00:00:00', '2019-01-30 00:00:00', '中山路1号', '12312312', '123123', '/images/seller/apply/6d3091d3e44c44839cdf0ac8ff8c6a12.png', '123', '111', '12341234', '123123', '123123', '1234567812345678', '2', '716', '123', '123', '/images/seller/apply/99dcf79e8a5040f4a95b4791fb276f40.png', '/images/seller/apply/d7f5f2be8650439eba5af25dead4f638.jpg', '11111111', '43006111@qq.com', 2, 2, 1, NULL, '2019-01-05 10:25:48', '2019-01-05 10:26:29');
INSERT INTO `seller_apply` VALUES (5, 39, 'admin-seller-apply-ceshi001', 'e10adc3949ba59abbe56e057f20f883e', '测试001', '11111111111', '111111', '2', '716', '2020-01-16 00:00:00', '2022-01-16 00:00:00', '测试001', '1111111111111111', '', '/images/seller/apply/334a80bf4a6b4151b014f779d8ee8b0d.png', '11111111111', '11111', '1111', '1111', '1111', '1111', '18', '207', '测试001', '111111111111', '/images/seller/apply/65bbae7cf9ff46d99c39d016bcf470fc.png', '/images/seller/apply/cc5a962287944bff9b50c945cd36c2f4.png', '11111111111', '11111111111@QQ.COM', 2, 2, 2, NULL, '2020-01-16 18:45:12', '2020-01-16 18:45:38');

-- ----------------------------
-- Table structure for seller_apply_brand
-- ----------------------------
DROP TABLE IF EXISTS `seller_apply_brand`;
CREATE TABLE `seller_apply_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '所属商家',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `name_first` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌首字母',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片大小比例3:1',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人名称',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `explain_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌说明',
  `state` tinyint(4) NOT NULL COMMENT '0、默认；1、提交审核；2、显示中；3、审核失败；4、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家品牌申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_apply_brand
-- ----------------------------

-- ----------------------------
-- Table structure for seller_cate
-- ----------------------------
DROP TABLE IF EXISTS `seller_cate`;
CREATE TABLE `seller_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `pid` int(11) NOT NULL COMMENT '父类ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL COMMENT '1、显示；2、不显示；3、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_cate
-- ----------------------------
INSERT INTO `seller_cate` VALUES (43, 1, 0, '进口食品', '/', 100, 1, '2020-03-03 15:56:34', 1);

-- ----------------------------
-- Table structure for seller_complaint
-- ----------------------------
DROP TABLE IF EXISTS `seller_complaint`;
CREATE TABLE `seller_complaint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '投诉人ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉人账户',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_product_id` int(11) NULL DEFAULT NULL COMMENT '网单ID',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态：1、买家投诉待审核；2、买家投诉不通过；3、买家投诉通过；4、卖家申诉待审核；5、卖家申诉不通过；6、卖家申诉通过；',
  `product_back_id` int(11) NOT NULL COMMENT '退货管理id，如没有置为0',
  `product_exchange_id` int(11) NOT NULL COMMENT '换货管理id，如没有置为0',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉内容',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉图片',
  `complaint_time` datetime(0) NOT NULL COMMENT '投诉时间',
  `seller_id` int(11) NOT NULL COMMENT '投诉商家',
  `seller_complaint_time` datetime(0) NULL DEFAULT NULL COMMENT '商家申诉时间',
  `seller_comp_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商家申诉内容',
  `seller_comp_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家申诉图片',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '平台处理人ID',
  `opt_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台处理结果',
  `user_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户反馈意见',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `opt_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家投诉管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for seller_manage_cate
-- ----------------------------
DROP TABLE IF EXISTS `seller_manage_cate`;
CREATE TABLE `seller_manage_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` int(11) NOT NULL COMMENT '商家id',
  `create_id` int(11) NOT NULL COMMENT '申请人',
  `create_time` datetime(0) NOT NULL COMMENT '申请时间',
  `product_cate_id` int(11) NOT NULL COMMENT '申请分类id',
  `product_cate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请分类名称,提交类目组合',
  `state` tinyint(4) NOT NULL COMMENT '0-默认;1-提交审核;2-审核通过;3-审核失败;4-停用',
  `opt_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `opt_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `stop_id` int(11) NULL DEFAULT NULL COMMENT '停用人',
  `stop_time` datetime(0) NULL DEFAULT NULL COMMENT '停用时间',
  `stop_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停用原由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家可以经营商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_manage_cate
-- ----------------------------
INSERT INTO `seller_manage_cate` VALUES (63, 1, 1, '2020-03-05 22:48:34', 424, '进口米面', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (64, 1, 1, '2020-03-05 22:48:38', 425, '进口油品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (65, 1, 1, '2020-03-05 22:48:42', 426, '进口生鲜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (66, 1, 1, '2020-03-06 23:09:06', 427, '蔬果生鲜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (67, 1, 1, '2020-03-06 23:09:09', 428, '风味特产', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (68, 1, 1, '2020-03-06 23:09:13', 429, '农业特产', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (69, 1, 1, '2020-03-06 23:09:16', 430, '米面粮油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (70, 1, 1, '2020-03-06 23:09:23', 431, '面粉', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (71, 1, 1, '2020-03-06 23:09:27', 432, '大米', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (72, 1, 1, '2020-03-06 23:09:33', 433, '橄榄油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (73, 1, 1, '2020-03-06 23:09:36', 434, '花生油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (74, 1, 1, '2020-03-06 23:09:39', 435, '玉米油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (75, 1, 1, '2020-03-06 23:09:42', 436, '菜籽油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (76, 1, 1, '2020-03-06 23:09:45', 437, '食用油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (77, 1, 1, '2020-03-06 23:09:48', 439, '核桃油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (78, 1, 1, '2020-03-06 23:09:51', 440, '其他油', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (79, 1, 1, '2020-03-06 23:09:56', 438, '花椒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (80, 1, 1, '2020-03-06 23:10:02', 441, '木耳', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (81, 1, 1, '2020-03-06 23:10:07', 442, '香菇', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (82, 1, 1, '2020-03-06 23:10:11', 443, '黄花菜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (83, 1, 1, '2020-03-06 23:10:15', 444, '其他干货', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (84, 1, 1, '2020-03-06 23:10:21', 445, '礼盒套装', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (85, 1, 1, '2020-03-06 23:10:29', 446, '苹果', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (86, 1, 1, '2020-03-06 23:10:32', 447, '榴莲', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (87, 1, 1, '2020-03-06 23:10:38', 448, '鸡蛋', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (88, 1, 1, '2020-03-06 23:10:43', 449, '鸭蛋', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (89, 1, 1, '2020-03-06 23:10:47', 450, '其他蛋类', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (90, 1, 1, '2020-03-06 23:10:52', 451, '蔬菜礼盒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (91, 1, 1, '2020-03-06 23:10:56', 467, '羊肉', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (92, 1, 1, '2020-03-06 23:11:03', 453, '白水杜康', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (93, 1, 1, '2020-03-06 23:11:09', 452, '苹果醋', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (94, 1, 1, '2020-03-06 23:11:12', 454, '蜂蜜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (95, 1, 1, '2020-03-06 23:11:15', 455, '其他饮料', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (96, 1, 1, '2020-03-06 23:11:25', 456, '葡萄酒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (97, 1, 1, '2020-03-06 23:11:30', 457, '白葡萄酒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (98, 1, 1, '2020-03-06 23:11:37', 458, '白兰地', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (99, 1, 1, '2020-03-06 23:11:41', 459, '威士忌', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (100, 1, 1, '2020-03-06 23:11:52', 462, '魔芋制品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (101, 1, 1, '2020-03-06 23:11:56', 465, '果干', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (102, 1, 1, '2020-03-06 23:12:02', 466, '板栗制品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (103, 1, 1, '2020-03-06 23:12:12', 461, '坚果礼盒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (104, 1, 1, '2020-03-06 23:12:16', 464, '核桃制品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (105, 1, 1, '2020-03-06 23:12:22', 460, '肉干', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (106, 1, 1, '2020-03-06 23:12:26', 463, '蜂蜜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (107, 1, 1, '2020-03-06 23:12:33', 468, '肉干', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (108, 1, 1, '2020-03-06 23:12:37', 469, '礼盒', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (109, 1, 1, '2020-03-06 23:12:40', 470, '核桃制品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (110, 1, 1, '2020-03-06 23:12:44', 471, '板栗', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (111, 1, 1, '2020-03-06 23:12:48', 472, '魔芋挂面', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (112, 1, 1, '2020-03-06 23:12:56', 476, '苹果', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (113, 1, 1, '2020-03-06 23:12:59', 477, '果醋', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (114, 1, 1, '2020-03-06 23:13:03', 478, '苹果汁', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (115, 1, 1, '2020-03-06 23:13:07', 479, '苹果脆片', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (116, 1, 1, '2020-03-06 23:13:10', 480, '白水杜康', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (117, 1, 1, '2020-03-06 23:13:15', 473, '槐花蜜', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (118, 1, 1, '2020-03-06 23:13:21', 474, '核桃制品', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `seller_manage_cate` VALUES (119, 1, 1, '2020-03-06 23:13:25', 475, '土蜂蜜', 2, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for seller_qq
-- ----------------------------
DROP TABLE IF EXISTS `seller_qq`;
CREATE TABLE `seller_qq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服名称',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服QQ',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `state` tinyint(4) NOT NULL COMMENT '1、显示；2、不显示；3、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家客服QQ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_qq
-- ----------------------------

-- ----------------------------
-- Table structure for seller_resources_roles
-- ----------------------------
DROP TABLE IF EXISTS `seller_resources_roles`;
CREATE TABLE `seller_resources_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_id` int(11) NULL DEFAULT NULL,
  `seller_roles_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1956 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家角色资源对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_resources_roles
-- ----------------------------
INSERT INTO `seller_resources_roles` VALUES (1047, 13, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1048, 14, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1049, 318, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1050, 319, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1051, 15, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1052, 34, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1053, 35, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1054, 16, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1055, 36, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1056, 679, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1057, 321, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1058, 322, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1059, 329, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1060, 323, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1061, 332, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1062, 324, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1063, 325, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1064, 326, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1065, 388, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1066, 389, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1067, 681, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1068, 17, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1069, 18, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1070, 37, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1071, 19, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1072, 41, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1073, 42, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1074, 43, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1075, 44, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1076, 20, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1077, 45, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1078, 46, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1079, 47, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1080, 21, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1081, 22, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1082, 48, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1083, 167, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1084, 38, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1085, 39, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1086, 40, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1087, 142, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1088, 567, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1089, 168, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1090, 143, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1091, 568, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1092, 724, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1093, 169, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1094, 311, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1095, 23, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1096, 24, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1097, 49, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1098, 50, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1099, 51, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1100, 26, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1101, 393, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1102, 394, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1103, 395, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1104, 396, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1105, 677, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1106, 675, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1107, 722, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1108, 723, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1109, 348, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1110, 349, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1111, 350, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1112, 366, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1113, 367, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1114, 548, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1115, 549, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1116, 550, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1117, 551, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1118, 552, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1119, 553, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1120, 360, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1121, 361, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1122, 363, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1123, 362, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1124, 371, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1125, 372, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1126, 373, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1127, 374, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1128, 375, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1129, 376, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1130, 377, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1131, 378, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1132, 379, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1133, 380, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1134, 381, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1135, 382, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1136, 400, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1137, 420, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1138, 421, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1139, 422, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1140, 423, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1141, 424, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1142, 433, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1143, 434, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1144, 425, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1145, 426, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1146, 427, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1147, 428, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1148, 435, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1149, 436, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1150, 429, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1151, 430, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1152, 431, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1153, 432, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1154, 485, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1155, 486, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1156, 487, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1157, 488, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1158, 489, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1159, 490, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1160, 491, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1161, 492, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1162, 493, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1163, 494, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1164, 495, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1165, 496, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1166, 497, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1167, 498, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1168, 499, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1169, 500, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1170, 501, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1171, 502, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1172, 503, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1173, 504, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1174, 505, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1175, 506, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1176, 507, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1177, 508, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1178, 509, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1179, 510, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1180, 511, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1181, 512, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1182, 513, 3, '2018-03-11 23:01:24');
INSERT INTO `seller_resources_roles` VALUES (1183, 514, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1184, 515, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1185, 516, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1186, 517, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1187, 518, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1188, 519, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1189, 520, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1190, 521, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1191, 522, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1192, 523, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1193, 524, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1194, 525, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1195, 526, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1196, 527, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1197, 535, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1198, 565, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1199, 566, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1200, 577, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1201, 578, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1202, 579, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1203, 580, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1204, 581, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1205, 582, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1206, 583, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1207, 584, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1208, 615, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1209, 616, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1210, 617, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1211, 618, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1212, 619, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1213, 620, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1214, 621, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1215, 622, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1216, 641, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1217, 642, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1218, 643, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1219, 644, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1220, 645, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1221, 646, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1222, 647, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1223, 648, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1224, 704, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1225, 705, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1226, 706, 3, '2018-03-11 23:01:25');
INSERT INTO `seller_resources_roles` VALUES (1227, 13, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1228, 14, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1229, 318, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1230, 319, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1231, 15, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1232, 34, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1233, 35, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1234, 16, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1235, 36, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1236, 679, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1237, 321, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1238, 322, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1239, 329, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1240, 323, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1241, 332, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1242, 324, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1243, 325, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1244, 326, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1245, 388, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1246, 389, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1247, 681, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1248, 17, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1249, 18, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1250, 37, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1251, 19, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1252, 41, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1253, 42, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1254, 43, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1255, 44, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1256, 20, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1257, 45, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1258, 46, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1259, 47, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1260, 21, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1261, 22, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1262, 48, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1263, 167, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1264, 38, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1265, 39, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1266, 40, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1267, 142, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1268, 567, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1269, 168, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1270, 143, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1271, 568, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1272, 724, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1273, 169, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1274, 311, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1275, 23, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1276, 24, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1277, 49, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1278, 50, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1279, 51, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1280, 26, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1281, 393, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1282, 394, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1283, 395, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1284, 396, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1285, 677, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1286, 675, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1287, 722, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1288, 723, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1289, 348, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1290, 349, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1291, 350, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1292, 366, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1293, 367, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1294, 548, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1295, 549, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1296, 550, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1297, 551, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1298, 552, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1299, 553, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1300, 360, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1301, 361, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1302, 363, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1303, 362, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1304, 371, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1305, 372, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1306, 373, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1307, 374, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1308, 375, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1309, 376, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1310, 377, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1311, 378, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1312, 379, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1313, 380, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1314, 381, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1315, 382, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1316, 400, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1317, 420, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1318, 421, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1319, 422, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1320, 423, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1321, 424, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1322, 433, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1323, 434, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1324, 425, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1325, 426, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1326, 427, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1327, 428, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1328, 435, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1329, 436, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1330, 429, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1331, 430, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1332, 431, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1333, 432, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1334, 485, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1335, 486, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1336, 487, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1337, 488, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1338, 489, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1339, 490, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1340, 491, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1341, 492, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1342, 493, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1343, 494, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1344, 495, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1345, 496, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1346, 497, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1347, 498, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1348, 499, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1349, 500, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1350, 501, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1351, 502, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1352, 503, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1353, 504, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1354, 505, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1355, 506, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1356, 507, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1357, 508, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1358, 509, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1359, 510, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1360, 511, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1361, 512, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1362, 513, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1363, 514, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1364, 515, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1365, 516, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1366, 517, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1367, 518, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1368, 519, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1369, 520, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1370, 521, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1371, 522, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1372, 523, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1373, 524, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1374, 525, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1375, 526, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1376, 527, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1377, 535, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1378, 565, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1379, 566, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1380, 577, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1381, 578, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1382, 579, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1383, 580, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1384, 581, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1385, 582, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1386, 583, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1387, 584, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1388, 615, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1389, 616, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1390, 617, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1391, 618, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1392, 619, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1393, 620, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1394, 621, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1395, 622, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1396, 641, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1397, 642, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1398, 643, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1399, 644, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1400, 645, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1401, 646, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1402, 647, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1403, 648, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1404, 704, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1405, 705, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1406, 706, 1, '2018-03-19 15:56:02');
INSERT INTO `seller_resources_roles` VALUES (1407, 13, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1408, 14, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1409, 318, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1410, 319, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1411, 15, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1412, 34, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1413, 35, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1414, 16, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1415, 36, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1416, 679, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1417, 321, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1418, 322, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1419, 329, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1420, 323, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1421, 332, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1422, 324, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1423, 325, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1424, 326, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1425, 388, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1426, 389, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1427, 681, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1428, 17, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1429, 18, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1430, 37, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1431, 19, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1432, 41, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1433, 42, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1434, 43, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1435, 44, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1436, 20, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1437, 45, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1438, 46, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1439, 47, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1440, 21, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1441, 22, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1442, 48, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1443, 167, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1444, 38, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1445, 39, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1446, 40, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1447, 142, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1448, 567, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1449, 168, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1450, 143, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1451, 568, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1452, 724, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1453, 169, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1454, 311, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1455, 23, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1456, 24, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1457, 49, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1458, 50, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1459, 51, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1460, 26, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1461, 393, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1462, 394, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1463, 395, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1464, 396, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1465, 677, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1466, 675, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1467, 722, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1468, 723, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1469, 348, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1470, 349, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1471, 350, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1472, 366, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1473, 367, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1474, 548, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1475, 549, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1476, 550, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1477, 551, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1478, 552, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1479, 553, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1480, 360, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1481, 361, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1482, 363, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1483, 362, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1484, 371, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1485, 372, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1486, 373, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1487, 374, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1488, 375, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1489, 376, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1490, 377, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1491, 378, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1492, 379, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1493, 380, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1494, 381, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1495, 382, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1496, 400, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1497, 420, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1498, 421, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1499, 422, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1500, 423, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1501, 424, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1502, 433, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1503, 434, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1504, 425, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1505, 426, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1506, 427, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1507, 428, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1508, 435, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1509, 436, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1510, 429, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1511, 430, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1512, 431, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1513, 432, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1514, 485, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1515, 486, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1516, 487, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1517, 488, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1518, 489, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1519, 490, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1520, 491, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1521, 492, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1522, 493, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1523, 494, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1524, 495, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1525, 496, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1526, 497, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1527, 498, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1528, 499, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1529, 500, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1530, 501, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1531, 502, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1532, 503, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1533, 504, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1534, 505, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1535, 506, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1536, 507, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1537, 508, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1538, 509, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1539, 510, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1540, 511, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1541, 512, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1542, 513, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1543, 514, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1544, 515, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1545, 516, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1546, 517, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1547, 518, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1548, 519, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1549, 520, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1550, 521, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1551, 522, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1552, 523, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1553, 524, 2, '2018-03-21 17:24:30');
INSERT INTO `seller_resources_roles` VALUES (1554, 525, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1555, 526, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1556, 527, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1557, 535, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1558, 565, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1559, 566, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1560, 577, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1561, 578, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1562, 579, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1563, 580, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1564, 581, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1565, 582, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1566, 583, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1567, 584, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1568, 615, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1569, 616, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1570, 617, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1571, 618, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1572, 619, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1573, 620, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1574, 621, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1575, 622, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1576, 641, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1577, 642, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1578, 643, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1579, 644, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1580, 645, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1581, 646, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1582, 647, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1583, 648, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1584, 704, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1585, 705, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1586, 706, 2, '2018-03-21 17:24:31');
INSERT INTO `seller_resources_roles` VALUES (1587, 27, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1588, 13, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1589, 14, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1590, 318, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1591, 319, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1592, 15, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1593, 34, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1594, 35, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1595, 16, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1596, 36, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1597, 679, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1598, 321, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1599, 322, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1600, 329, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1601, 323, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1602, 332, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1603, 324, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1604, 325, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1605, 326, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1606, 388, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1607, 389, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1608, 681, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1609, 17, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1610, 18, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1611, 37, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1612, 19, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1613, 41, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1614, 42, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1615, 43, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1616, 44, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1617, 20, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1618, 45, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1619, 46, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1620, 47, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1621, 21, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1622, 22, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1623, 48, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1624, 167, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1625, 38, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1626, 39, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1627, 40, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1628, 142, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1629, 567, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1630, 168, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1631, 143, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1632, 568, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1633, 724, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1634, 169, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1635, 311, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1636, 23, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1637, 24, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1638, 49, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1639, 50, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1640, 51, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1641, 26, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1642, 393, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1643, 394, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1644, 395, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1645, 396, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1646, 677, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1647, 675, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1648, 722, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1649, 723, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1650, 348, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1651, 349, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1652, 350, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1653, 366, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1654, 367, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1655, 548, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1656, 549, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1657, 550, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1658, 551, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1659, 552, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1660, 553, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1661, 360, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1662, 361, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1663, 363, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1664, 362, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1665, 371, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1666, 372, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1667, 373, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1668, 374, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1669, 375, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1670, 376, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1671, 377, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1672, 378, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1673, 379, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1674, 380, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1675, 381, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1676, 382, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1677, 400, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1678, 420, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1679, 421, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1680, 422, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1681, 423, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1682, 424, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1683, 433, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1684, 434, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1685, 425, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1686, 426, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1687, 427, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1688, 428, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1689, 435, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1690, 436, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1691, 429, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1692, 430, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1693, 431, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1694, 432, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1695, 485, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1696, 486, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1697, 487, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1698, 488, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1699, 489, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1700, 490, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1701, 491, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1702, 492, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1703, 493, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1704, 494, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1705, 495, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1706, 496, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1707, 497, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1708, 498, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1709, 499, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1710, 500, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1711, 501, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1712, 502, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1713, 503, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1714, 504, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1715, 505, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1716, 506, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1717, 507, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1718, 508, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1719, 509, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1720, 510, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1721, 511, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1722, 512, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1723, 513, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1724, 514, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1725, 515, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1726, 516, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1727, 517, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1728, 518, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1729, 519, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1730, 520, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1731, 521, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1732, 522, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1733, 523, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1734, 524, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1735, 525, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1736, 526, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1737, 527, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1738, 535, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1739, 565, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1740, 566, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1741, 577, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1742, 578, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1743, 579, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1744, 580, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1745, 581, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1746, 582, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1747, 583, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1748, 584, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1749, 615, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1750, 616, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1751, 617, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1752, 618, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1753, 619, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1754, 620, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1755, 621, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1756, 622, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1757, 641, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1758, 642, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1759, 643, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1760, 644, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1761, 645, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1762, 646, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1763, 647, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1764, 648, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1765, 704, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1766, 705, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1767, 706, 5, '2019-01-05 10:26:29');
INSERT INTO `seller_resources_roles` VALUES (1768, 13, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1769, 14, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1770, 318, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1771, 319, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1772, 15, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1773, 34, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1774, 35, 6, '2019-01-25 20:31:51');
INSERT INTO `seller_resources_roles` VALUES (1775, 27, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1776, 13, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1777, 14, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1778, 318, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1779, 319, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1780, 15, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1781, 34, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1782, 35, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1783, 16, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1784, 36, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1785, 679, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1786, 321, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1787, 322, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1788, 329, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1789, 323, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1790, 332, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1791, 324, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1792, 325, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1793, 326, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1794, 388, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1795, 389, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1796, 681, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1797, 17, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1798, 18, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1799, 37, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1800, 19, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1801, 41, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1802, 42, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1803, 43, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1804, 44, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1805, 20, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1806, 45, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1807, 46, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1808, 47, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1809, 21, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1810, 22, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1811, 48, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1812, 167, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1813, 38, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1814, 39, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1815, 40, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1816, 142, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1817, 567, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1818, 168, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1819, 143, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1820, 568, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1821, 724, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1822, 169, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1823, 311, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1824, 23, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1825, 24, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1826, 49, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1827, 50, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1828, 51, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1829, 26, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1830, 393, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1831, 394, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1832, 395, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1833, 396, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1834, 677, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1835, 675, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1836, 722, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1837, 723, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1838, 348, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1839, 349, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1840, 350, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1841, 366, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1842, 367, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1843, 548, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1844, 549, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1845, 550, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1846, 551, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1847, 552, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1848, 553, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1849, 360, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1850, 361, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1851, 363, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1852, 362, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1853, 371, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1854, 372, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1855, 373, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1856, 374, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1857, 375, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1858, 376, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1859, 377, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1860, 378, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1861, 379, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1862, 380, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1863, 381, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1864, 382, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1865, 400, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1866, 420, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1867, 421, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1868, 422, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1869, 423, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1870, 424, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1871, 433, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1872, 434, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1873, 425, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1874, 426, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1875, 427, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1876, 428, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1877, 435, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1878, 436, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1879, 429, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1880, 430, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1881, 431, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1882, 432, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1883, 485, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1884, 486, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1885, 487, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1886, 488, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1887, 489, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1888, 490, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1889, 491, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1890, 492, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1891, 493, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1892, 494, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1893, 495, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1894, 496, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1895, 497, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1896, 498, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1897, 499, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1898, 500, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1899, 501, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1900, 502, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1901, 503, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1902, 504, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1903, 505, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1904, 506, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1905, 507, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1906, 508, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1907, 509, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1908, 510, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1909, 511, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1910, 512, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1911, 513, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1912, 514, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1913, 515, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1914, 516, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1915, 517, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1916, 518, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1917, 519, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1918, 520, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1919, 521, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1920, 522, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1921, 523, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1922, 524, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1923, 525, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1924, 526, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1925, 527, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1926, 535, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1927, 565, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1928, 566, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1929, 577, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1930, 578, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1931, 579, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1932, 580, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1933, 581, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1934, 582, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1935, 583, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1936, 584, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1937, 615, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1938, 616, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1939, 617, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1940, 618, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1941, 619, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1942, 620, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1943, 621, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1944, 622, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1945, 641, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1946, 642, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1947, 643, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1948, 644, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1949, 645, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1950, 646, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1951, 647, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1952, 648, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1953, 704, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1954, 705, 7, '2020-01-16 18:45:38');
INSERT INTO `seller_resources_roles` VALUES (1955, 706, 7, '2020-01-16 18:45:38');

-- ----------------------------
-- Table structure for seller_roles
-- ----------------------------
DROP TABLE IF EXISTS `seller_roles`;
CREATE TABLE `seller_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `roles_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色code,唯一',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `user_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `status` tinyint(11) NOT NULL COMMENT '1、未删除2、删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_roles
-- ----------------------------
INSERT INTO `seller_roles` VALUES (1, 3, '店铺超级管理员', 'seller_admin', '店铺超级管理员', 0, '2017-12-01 15:58:14', '2017-12-01 15:58:14', 1);
INSERT INTO `seller_roles` VALUES (2, 2, '店铺超级管理员', 'seller_admin', '店铺超级管理员', 0, '2017-12-01 15:58:31', '2017-12-01 15:58:31', 1);
INSERT INTO `seller_roles` VALUES (3, 1, '店铺超级管理员', 'seller_admin', '店铺超级管理员', 0, '2017-12-01 15:58:49', '2017-12-01 15:58:49', 1);
INSERT INTO `seller_roles` VALUES (4, 1, '发货员', 'fhy', '负责发货', 1, '2018-03-11 22:45:04', '2018-03-11 22:45:04', 1);
INSERT INTO `seller_roles` VALUES (5, 4, '店铺超级管理员', 'seller_admin', '店铺超级管理员', 0, '2019-01-05 10:26:29', '2019-01-05 10:26:29', 1);
INSERT INTO `seller_roles` VALUES (6, 1, '订单操作员', 'dd', '订单操作员12', 1, '2019-01-25 20:31:31', '2019-01-25 20:31:38', 1);
INSERT INTO `seller_roles` VALUES (7, 5, '店铺超级管理员', 'seller_admin', '店铺超级管理员', 0, '2020-01-16 18:45:38', '2020-01-16 18:45:38', 1);

-- ----------------------------
-- Table structure for seller_transport
-- ----------------------------
DROP TABLE IF EXISTS `seller_transport`;
CREATE TABLE `seller_transport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(1) NULL DEFAULT 1 COMMENT '状态 1-使用中 2-禁用',
  `seller_id` int(11) NULL DEFAULT NULL COMMENT '商家id',
  `trans_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模板名称',
  `trans_type` int(11) NULL DEFAULT 0 COMMENT '计价方式 1-按件数 2-按重量',
  `trans_ratio` int(11) NULL DEFAULT 0 COMMENT '换算比例，用于体积与重量的换算',
  `trans_express` int(1) NULL DEFAULT NULL COMMENT '快递',
  `trans_express_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快递模板信息',
  `trans_ems` int(1) NULL DEFAULT NULL COMMENT 'EMS',
  `trans_ems_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'EMS模板信息',
  `trans_mail` int(1) NULL DEFAULT NULL COMMENT '平邮',
  `trans_mail_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '平邮模板信息',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `trans_time` int(11) NULL DEFAULT 0 COMMENT '发货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家运费模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_transport
-- ----------------------------
INSERT INTO `seller_transport` VALUES (8, 1, 1, '包邮', 1, 0, 1, '[{\"city_name\":\"全国\",\"trans_fee\":10.0,\"trans_weight\":1.0,\"trans_add_weight\":2.0,\"trans_add_fee\":10.0,\"city_id\":\"-1\"}]', 0, '', 0, '', '2020-03-06 15:16:04', 24);

-- ----------------------------
-- Table structure for seller_type
-- ----------------------------
DROP TABLE IF EXISTS `seller_type`;
CREATE TABLE `seller_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `money` int(11) NOT NULL COMMENT '保证金数额',
  `state` tinyint(4) NOT NULL COMMENT '状态1、显示；2、不显示',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_type
-- ----------------------------

-- ----------------------------
-- Table structure for seller_type_logs
-- ----------------------------
DROP TABLE IF EXISTS `seller_type_logs`;
CREATE TABLE `seller_type_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_id` int(11) NOT NULL COMMENT '修改人',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人账号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改内容',
  `create_time` datetime(0) NOT NULL COMMENT '修改时间',
  `product_cate_id` int(11) NOT NULL COMMENT '商品分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家类型修改日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_type_logs
-- ----------------------------
INSERT INTO `seller_type_logs` VALUES (55, 2, 'huashan', '0.000', '2020-03-03 15:57:43', 389);
INSERT INTO `seller_type_logs` VALUES (56, 2, 'huashan', '0.000', '2020-03-03 15:57:58', 390);
INSERT INTO `seller_type_logs` VALUES (57, 2, 'huashan', '0.000', '2020-03-03 15:58:18', 391);
INSERT INTO `seller_type_logs` VALUES (58, 2, 'huashan', '0.000', '2020-03-03 15:58:36', 392);
INSERT INTO `seller_type_logs` VALUES (59, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-03 15:58:48', 391);
INSERT INTO `seller_type_logs` VALUES (60, 2, 'huashan', '0.000', '2020-03-03 15:59:02', 393);
INSERT INTO `seller_type_logs` VALUES (61, 2, 'huashan', '0.000', '2020-03-03 15:59:17', 394);
INSERT INTO `seller_type_logs` VALUES (62, 2, 'huashan', '0.000', '2020-03-03 15:59:57', 395);
INSERT INTO `seller_type_logs` VALUES (63, 2, 'huashan', '0.000', '2020-03-03 16:00:22', 396);
INSERT INTO `seller_type_logs` VALUES (64, 2, 'huashan', '0.000', '2020-03-03 16:00:42', 397);
INSERT INTO `seller_type_logs` VALUES (65, 2, 'huashan', '0.000', '2020-03-03 16:21:35', 398);
INSERT INTO `seller_type_logs` VALUES (66, 2, 'huashan', '0.000', '2020-03-03 16:22:32', 399);
INSERT INTO `seller_type_logs` VALUES (67, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-03 16:24:26', 399);
INSERT INTO `seller_type_logs` VALUES (68, 2, 'huashan', '0.000', '2020-03-05 13:39:01', 400);
INSERT INTO `seller_type_logs` VALUES (69, 2, 'huashan', '0.000', '2020-03-05 13:39:24', 401);
INSERT INTO `seller_type_logs` VALUES (70, 2, 'huashan', '0.000', '2020-03-05 13:39:52', 402);
INSERT INTO `seller_type_logs` VALUES (71, 2, 'huashan', '0.000', '2020-03-05 13:40:40', 403);
INSERT INTO `seller_type_logs` VALUES (72, 2, 'huashan', '0.000', '2020-03-05 13:41:12', 404);
INSERT INTO `seller_type_logs` VALUES (73, 2, 'huashan', '0.000', '2020-03-05 13:41:37', 405);
INSERT INTO `seller_type_logs` VALUES (74, 2, 'huashan', '0.000', '2020-03-05 13:41:58', 406);
INSERT INTO `seller_type_logs` VALUES (75, 2, 'huashan', '0.000', '2020-03-05 13:42:36', 407);
INSERT INTO `seller_type_logs` VALUES (76, 2, 'huashan', '0.000', '2020-03-05 13:42:49', 408);
INSERT INTO `seller_type_logs` VALUES (77, 2, 'huashan', '0.000', '2020-03-05 13:43:16', 409);
INSERT INTO `seller_type_logs` VALUES (78, 2, 'huashan', '0.000', '2020-03-05 13:43:42', 410);
INSERT INTO `seller_type_logs` VALUES (79, 2, 'huashan', '0.000', '2020-03-05 13:44:05', 411);
INSERT INTO `seller_type_logs` VALUES (80, 2, 'huashan', '0.000', '2020-03-05 13:44:38', 412);
INSERT INTO `seller_type_logs` VALUES (81, 2, 'huashan', '0.000', '2020-03-05 17:13:16', 413);
INSERT INTO `seller_type_logs` VALUES (82, 2, 'huashan', '0.000', '2020-03-05 17:13:41', 414);
INSERT INTO `seller_type_logs` VALUES (83, 2, 'huashan', '0.000', '2020-03-05 17:14:26', 415);
INSERT INTO `seller_type_logs` VALUES (84, 2, 'huashan', '0.000', '2020-03-05 17:14:38', 416);
INSERT INTO `seller_type_logs` VALUES (85, 2, 'huashan', '0.000', '2020-03-05 20:52:51', 417);
INSERT INTO `seller_type_logs` VALUES (86, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-05 20:53:11', 417);
INSERT INTO `seller_type_logs` VALUES (87, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-05 20:53:26', 415);
INSERT INTO `seller_type_logs` VALUES (88, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-05 20:54:05', 416);
INSERT INTO `seller_type_logs` VALUES (89, 2, 'huashan', '0.000', '2020-03-05 20:54:40', 418);
INSERT INTO `seller_type_logs` VALUES (90, 2, 'huashan', '0.000', '2020-03-05 20:55:01', 419);
INSERT INTO `seller_type_logs` VALUES (91, 2, 'huashan', '0.000', '2020-03-05 20:55:36', 420);
INSERT INTO `seller_type_logs` VALUES (92, 2, 'huashan', '0.000', '2020-03-05 20:55:56', 421);
INSERT INTO `seller_type_logs` VALUES (93, 2, 'huashan', '0.000', '2020-03-05 20:56:10', 422);
INSERT INTO `seller_type_logs` VALUES (94, 2, 'huashan', '0.000', '2020-03-05 20:56:40', 423);
INSERT INTO `seller_type_logs` VALUES (95, 2, 'huashan', '0.000', '2020-03-05 22:46:30', 424);
INSERT INTO `seller_type_logs` VALUES (96, 2, 'huashan', '0.000', '2020-03-05 22:47:18', 425);
INSERT INTO `seller_type_logs` VALUES (97, 2, 'huashan', '0.000', '2020-03-05 22:47:48', 426);
INSERT INTO `seller_type_logs` VALUES (98, 2, 'huashan', '0.000', '2020-03-06 00:16:49', 427);
INSERT INTO `seller_type_logs` VALUES (99, 2, 'huashan', '0.000', '2020-03-06 16:53:17', 428);
INSERT INTO `seller_type_logs` VALUES (100, 2, 'huashan', '0.000', '2020-03-06 16:54:00', 429);
INSERT INTO `seller_type_logs` VALUES (101, 2, 'huashan', '0.000', '2020-03-06 16:54:49', 430);
INSERT INTO `seller_type_logs` VALUES (102, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-06 16:55:06', 429);
INSERT INTO `seller_type_logs` VALUES (103, 2, 'huashan', '0.000', '2020-03-06 19:22:18', 431);
INSERT INTO `seller_type_logs` VALUES (104, 2, 'huashan', '0.000', '2020-03-06 19:22:52', 432);
INSERT INTO `seller_type_logs` VALUES (105, 2, 'huashan', '0.000', '2020-03-06 19:23:30', 433);
INSERT INTO `seller_type_logs` VALUES (106, 2, 'huashan', '0.000', '2020-03-06 19:23:55', 434);
INSERT INTO `seller_type_logs` VALUES (107, 2, 'huashan', '0.000', '2020-03-06 19:24:15', 435);
INSERT INTO `seller_type_logs` VALUES (108, 2, 'huashan', '0.000', '2020-03-06 19:24:42', 436);
INSERT INTO `seller_type_logs` VALUES (109, 2, 'huashan', '0.000', '2020-03-06 19:24:58', 437);
INSERT INTO `seller_type_logs` VALUES (110, 2, 'huashan', '0.000', '2020-03-06 19:26:10', 438);
INSERT INTO `seller_type_logs` VALUES (111, 2, 'huashan', '0.000', '2020-03-06 19:26:47', 439);
INSERT INTO `seller_type_logs` VALUES (112, 2, 'huashan', '0.000', '2020-03-06 19:41:46', 440);
INSERT INTO `seller_type_logs` VALUES (113, 2, 'huashan', '0.000', '2020-03-06 19:42:16', 441);
INSERT INTO `seller_type_logs` VALUES (114, 2, 'huashan', '0.000', '2020-03-06 19:43:06', 442);
INSERT INTO `seller_type_logs` VALUES (115, 2, 'huashan', '0.000', '2020-03-06 19:43:46', 443);
INSERT INTO `seller_type_logs` VALUES (116, 2, 'huashan', '0.000', '2020-03-06 19:44:07', 444);
INSERT INTO `seller_type_logs` VALUES (117, 2, 'huashan', '0.000', '2020-03-06 19:44:34', 445);
INSERT INTO `seller_type_logs` VALUES (118, 2, 'huashan', '0.000', '2020-03-06 19:45:25', 446);
INSERT INTO `seller_type_logs` VALUES (119, 2, 'huashan', '0.000', '2020-03-06 19:45:47', 447);
INSERT INTO `seller_type_logs` VALUES (120, 2, 'huashan', '0.000', '2020-03-06 19:46:12', 448);
INSERT INTO `seller_type_logs` VALUES (121, 2, 'huashan', '0.000', '2020-03-06 19:46:29', 449);
INSERT INTO `seller_type_logs` VALUES (122, 2, 'huashan', '0.000', '2020-03-06 19:46:52', 450);
INSERT INTO `seller_type_logs` VALUES (123, 2, 'huashan', '0.000', '2020-03-06 19:47:19', 451);
INSERT INTO `seller_type_logs` VALUES (124, 2, 'huashan', '0.000', '2020-03-06 19:48:04', 452);
INSERT INTO `seller_type_logs` VALUES (125, 2, 'huashan', '0.000', '2020-03-06 19:48:27', 453);
INSERT INTO `seller_type_logs` VALUES (126, 2, 'huashan', '0.000', '2020-03-06 19:48:52', 454);
INSERT INTO `seller_type_logs` VALUES (127, 2, 'huashan', '0.000', '2020-03-06 19:49:15', 455);
INSERT INTO `seller_type_logs` VALUES (128, 2, 'huashan', '0.000', '2020-03-06 19:49:39', 456);
INSERT INTO `seller_type_logs` VALUES (129, 2, 'huashan', '0.000', '2020-03-06 19:50:15', 457);
INSERT INTO `seller_type_logs` VALUES (130, 2, 'huashan', '0.000', '2020-03-06 19:50:38', 458);
INSERT INTO `seller_type_logs` VALUES (131, 2, 'huashan', '0.000', '2020-03-06 19:50:54', 459);
INSERT INTO `seller_type_logs` VALUES (132, 2, 'huashan', '0.000', '2020-03-06 20:28:07', 460);
INSERT INTO `seller_type_logs` VALUES (133, 2, 'huashan', '0.000', '2020-03-06 20:28:46', 461);
INSERT INTO `seller_type_logs` VALUES (134, 2, 'huashan', '0.000', '2020-03-06 20:31:12', 462);
INSERT INTO `seller_type_logs` VALUES (135, 2, 'huashan', '0.000', '2020-03-06 20:32:23', 463);
INSERT INTO `seller_type_logs` VALUES (136, 2, 'huashan', '0.000', '2020-03-06 20:33:01', 464);
INSERT INTO `seller_type_logs` VALUES (137, 2, 'huashan', '0.000', '2020-03-06 21:59:00', 465);
INSERT INTO `seller_type_logs` VALUES (138, 2, 'huashan', '0.000', '2020-03-06 21:59:51', 466);
INSERT INTO `seller_type_logs` VALUES (139, 2, 'huashan', '0.000', '2020-03-06 22:00:42', 467);
INSERT INTO `seller_type_logs` VALUES (140, 2, 'huashan', '0.000', '2020-03-06 22:01:38', 468);
INSERT INTO `seller_type_logs` VALUES (141, 2, 'huashan', '0.000', '2020-03-06 22:02:12', 469);
INSERT INTO `seller_type_logs` VALUES (142, 2, 'huashan', '0.000', '2020-03-06 22:02:35', 470);
INSERT INTO `seller_type_logs` VALUES (143, 2, 'huashan', '0.000', '2020-03-06 22:02:57', 471);
INSERT INTO `seller_type_logs` VALUES (144, 2, 'huashan', '0.000', '2020-03-06 22:54:11', 472);
INSERT INTO `seller_type_logs` VALUES (145, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-06 23:03:45', 472);
INSERT INTO `seller_type_logs` VALUES (146, 2, 'huashan', '修改商品分类，佣金:0.000', '2020-03-06 23:04:15', 470);
INSERT INTO `seller_type_logs` VALUES (147, 2, 'huashan', '0.000', '2020-03-06 23:05:07', 473);
INSERT INTO `seller_type_logs` VALUES (148, 2, 'huashan', '0.000', '2020-03-06 23:05:34', 474);
INSERT INTO `seller_type_logs` VALUES (149, 2, 'huashan', '0.000', '2020-03-06 23:06:05', 475);
INSERT INTO `seller_type_logs` VALUES (150, 2, 'huashan', '0.000', '2020-03-06 23:06:34', 476);
INSERT INTO `seller_type_logs` VALUES (151, 2, 'huashan', '0.000', '2020-03-06 23:06:51', 477);
INSERT INTO `seller_type_logs` VALUES (152, 2, 'huashan', '0.000', '2020-03-06 23:07:16', 478);
INSERT INTO `seller_type_logs` VALUES (153, 2, 'huashan', '0.000', '2020-03-06 23:07:40', 479);
INSERT INTO `seller_type_logs` VALUES (154, 2, 'huashan', '0.000', '2020-03-06 23:08:01', 480);

-- ----------------------------
-- Table structure for seller_user
-- ----------------------------
DROP TABLE IF EXISTS `seller_user`;
CREATE TABLE `seller_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工号',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `seller_id` int(11) NOT NULL COMMENT '所属商家',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '商家角色ID',
  `state` tinyint(4) NOT NULL COMMENT '状态 1-正常 2-冻结 3-删除',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间（最后一次登陆时间）',
  `cookie_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_user
-- ----------------------------
INSERT INTO `seller_user` VALUES (1, 'huashan', '4297f44b13955235245b2497399d7a93', '', '', '', '', 1, 3, 1, 0, '2017-12-01 15:59:01', 0, '2018-06-06 16:45:01', '7d687429-d535-448b-9b48-53e652ef71bb');
INSERT INTO `seller_user` VALUES (2, 'ejstest1', '4297f44b13955235245b2497399d7a93', '', '', '', '', 2, 2, 1, 0, '2017-12-01 15:58:39', 0, '2017-12-01 15:58:39', '');
INSERT INTO `seller_user` VALUES (3, 'ejstest2', '4297f44b13955235245b2497399d7a93', '', '', '', '', 3, 1, 1, 0, '2017-12-01 15:58:22', 0, '2017-12-01 15:58:22', '');
INSERT INTO `seller_user` VALUES (4, 'hs002', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', 4, 5, 1, 0, '2019-01-05 10:26:29', 0, '2019-01-05 10:26:29', '');
INSERT INTO `seller_user` VALUES (5, 'yixiekeji-2', 'e10adc3949ba59abbe56e057f20f883e', 'ceshi111', '测试123', '18612670879', '订单操作员', 1, 6, 1, 1, '2019-01-25 20:33:07', 1, '2019-01-25 20:33:37', '');
INSERT INTO `seller_user` VALUES (6, 'ceshi001', '4297f44b13955235245b2497399d7a93', '', '', '', '', 5, 7, 1, 0, '2020-01-16 18:45:38', 0, '2020-01-16 18:45:38', '');

-- ----------------------------
-- Table structure for seller_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `seller_user_login_log`;
CREATE TABLE `seller_user_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家用户登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller_user_login_log
-- ----------------------------
INSERT INTO `seller_user_login_log` VALUES (138, 1, 'yixiekeji', '127.0.0.1', '2020-02-22 17:08:05');
INSERT INTO `seller_user_login_log` VALUES (139, 1, 'yixiekeji', '127.0.0.1', '2020-02-22 17:15:43');
INSERT INTO `seller_user_login_log` VALUES (140, 1, 'yixiekeji', '1.80.235.16', '2020-02-22 18:10:45');
INSERT INTO `seller_user_login_log` VALUES (141, 1, 'yixiekeji', '1.80.235.16', '2020-02-22 18:21:51');
INSERT INTO `seller_user_login_log` VALUES (142, 1, 'yixiekeji', '113.3.38.210', '2020-02-22 18:23:01');
INSERT INTO `seller_user_login_log` VALUES (143, 1, 'huashan', '1.80.235.16', '2020-02-22 18:27:59');
INSERT INTO `seller_user_login_log` VALUES (144, 1, 'huashan', '113.3.38.210', '2020-02-22 18:28:18');
INSERT INTO `seller_user_login_log` VALUES (145, 1, 'huashan', '123.139.94.149', '2020-03-01 20:14:03');
INSERT INTO `seller_user_login_log` VALUES (146, 1, 'huashan', '123.139.94.149', '2020-03-01 21:09:51');
INSERT INTO `seller_user_login_log` VALUES (147, 1, 'huashan', '123.139.101.54', '2020-03-03 15:53:43');
INSERT INTO `seller_user_login_log` VALUES (148, 1, 'huashan', '123.139.101.54', '2020-03-03 16:03:18');
INSERT INTO `seller_user_login_log` VALUES (149, 1, 'huashan', '123.139.101.54', '2020-03-03 16:23:12');
INSERT INTO `seller_user_login_log` VALUES (150, 1, 'huashan', '123.139.101.54', '2020-03-03 17:10:23');
INSERT INTO `seller_user_login_log` VALUES (151, 1, 'huashan', '123.139.75.76', '2020-03-05 20:57:48');
INSERT INTO `seller_user_login_log` VALUES (152, 1, 'huashan', '123.139.75.76', '2020-03-05 22:48:20');
INSERT INTO `seller_user_login_log` VALUES (153, 1, 'huashan', '123.139.75.76', '2020-03-05 23:39:23');
INSERT INTO `seller_user_login_log` VALUES (154, 1, 'huashan', '123.139.75.76', '2020-03-06 00:30:47');
INSERT INTO `seller_user_login_log` VALUES (155, 1, 'huashan', '123.139.75.76', '2020-03-06 09:48:55');
INSERT INTO `seller_user_login_log` VALUES (156, 1, 'huashan', '219.144.189.79', '2020-03-06 15:04:15');
INSERT INTO `seller_user_login_log` VALUES (157, 1, 'huashan', '219.144.189.79', '2020-03-06 15:26:23');
INSERT INTO `seller_user_login_log` VALUES (158, 1, 'huashan', '219.144.189.79', '2020-03-06 15:36:46');
INSERT INTO `seller_user_login_log` VALUES (159, 1, 'huashan', '123.139.37.196', '2020-03-06 23:08:49');
INSERT INTO `seller_user_login_log` VALUES (160, 1, 'huashan', '123.139.37.196', '2020-03-07 00:47:54');

-- ----------------------------
-- Table structure for settlement
-- ----------------------------
DROP TABLE IF EXISTS `settlement`;
CREATE TABLE `settlement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settle_cycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算周期',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `seller_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家名称',
  `money_product` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总金额，等于订单中所有的商品的单价乘以数量之和：orders.money_product总和',
  `money_logistics` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '物流费用之和：orders.money_logistics总和',
  `money_order` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际应收金额总计：orders.money_order总和',
  `money_paid_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额账户支付总金额：money_paid_balance总和',
  `money_paid_reality` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '现金支付金额：money_paid_reality总和',
  `money_coupon` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠码优惠金额：money_coupon总和',
  `money_act_full` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单满减总金额：money_act_full总和',
  `money_discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额总额（满减、立减、优惠券等所有优惠额的和）：money_discount总和',
  `money_integral` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '积分换算金额',
  `integral` int(11) NOT NULL COMMENT '使用积分数量',
  `money_back` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当月退款的总金额：退货表back_money总和',
  `money_integral_back` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当月退回积分金额的总金额：退货表back_money总和',
  `money_other` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '其他金额，应支付给商家的其他金额',
  `money_other_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '其他金额加减状态：1、支付增加；2、支付扣减',
  `money_other_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他金额理由',
  `commision` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `money_sale` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '三级分销佣金金额',
  `sale_set` tinyint(4) NULL DEFAULT 2 COMMENT '1、平台承担；2、商家承担',
  `payable` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应付金额：money_order-money_back-commision',
  `status` tinyint(3) NOT NULL COMMENT '结算状态：1、账单生成；2、平台审核通过；3、商家核对通过；4、商家核对质疑；5、对账完成；6、支付完成',
  `seller_doubt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商家质疑',
  `platform_explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '平台解释',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `update_user_id` int(11) NOT NULL COMMENT '修改者ID',
  `update_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '结算表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settlement
-- ----------------------------

-- ----------------------------
-- Table structure for settlement_op
-- ----------------------------
DROP TABLE IF EXISTS `settlement_op`;
CREATE TABLE `settlement_op`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `orders_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `product_goods_id` int(11) NOT NULL COMMENT '货品ID',
  `spec_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格详情',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_sku` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抽象商品sku',
  `package_groups_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销套装0、不是促销套装；大于0，促销套装ID，价格是促销套装的ID',
  `mall_groups_id` int(11) NOT NULL DEFAULT 0 COMMENT '商城套装0，不是上次套装；大于0商城套装ID',
  `gift_id` int(11) NOT NULL DEFAULT 0 COMMENT '赠品ID 0:不是赠品；大于0：是赠品，存赠品的ID',
  `is_gift` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是赠品，0、不是；1、是；',
  `money_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品单价',
  `number` int(11) NOT NULL COMMENT '商品数量',
  `money_amount` decimal(10, 2) NOT NULL COMMENT '网单金额（减去立减优惠后的金额和）',
  `money_act_single` decimal(10, 2) NOT NULL COMMENT '立减优惠金额和',
  `act_single_id` int(11) NOT NULL DEFAULT 0 COMMENT '单品立减活动ID，无设置0',
  `act_group_id` int(11) NOT NULL DEFAULT 0 COMMENT '团购ID，为0正常购买',
  `act_flash_sale_id` int(11) NOT NULL DEFAULT 0 COMMENT '限时抢购ID，为0正常购买',
  `act_flash_sale_product_id` int(11) NOT NULL DEFAULT 0 COMMENT '限时抢购活动商品ID',
  `act_bidding_id` int(11) NOT NULL DEFAULT 0 COMMENT '集合竞价ID，为0正常购买',
  `act_integral_id` int(11) NOT NULL DEFAULT 0 COMMENT '积分换购ID，为0正常购买',
  `act_integral_num` int(11) NOT NULL DEFAULT 0 COMMENT '使用积分数量',
  `logistics_id` int(11) NULL DEFAULT NULL COMMENT '物流',
  `logistics_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流name',
  `logistics_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票快递单号',
  `shipping_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '网单完成关闭或取消关闭时间',
  `system_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '系统备注，不给用户显示',
  `back_number` int(11) NOT NULL COMMENT '退货数量，默认为0',
  `exchange_number` int(11) NOT NULL COMMENT '换货数量，默认为0',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `settlement_id` int(11) NOT NULL COMMENT '结算ID',
  `settle_cycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算周期',
  `product_cate_id` int(11) NOT NULL COMMENT '商品分类ID',
  `product_cate_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  `scaling` decimal(10, 3) NOT NULL COMMENT '商品分类分佣比例',
  `commision` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '网单佣金',
  `sale_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '网单三级分销佣金',
  `settle_time` datetime(0) NOT NULL COMMENT '结算日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '结算网单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settlement_op
-- ----------------------------

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人 只能是管理员',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态 1-正常 2-冻结 3-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES (1, 'admin', '4297f44b13955235245b2497399d7a93', 1, '2016-03-02 17:33:47', 0, '', 1);
INSERT INTO `system_admin` VALUES (2, 'huashan', '4297f44b13955235245b2497399d7a93', 1, '2016-03-02 17:33:47', 0, NULL, 1);
INSERT INTO `system_admin` VALUES (3, 'ceshi', 'e10adc3949ba59abbe56e057f20f883e', 1, '2019-04-24 14:53:25', 1, '', 1);
INSERT INTO `system_admin` VALUES (4, 'ceshi1', 'e10adc3949ba59abbe56e057f20f883e', 1, '2019-04-24 14:57:40', 1, '', 1);

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `describe` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建人（管理员id）',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人（管理员id）',
  `is_top` tinyint(1) NOT NULL COMMENT '是否置顶 0-否 1-是',
  `sort` int(6) NOT NULL COMMENT '排序号 越小越靠前',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notice
-- ----------------------------

-- ----------------------------
-- Table structure for system_resources
-- ----------------------------
DROP TABLE IF EXISTS `system_resources`;
CREATE TABLE `system_resources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '1、菜单；2、按钮',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '1、未删除2、删除',
  `scope` tinyint(3) NULL DEFAULT NULL COMMENT '应用范围: 1-商家 2-平台',
  `res_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源id,有些菜单及按钮需要特定id以注册点击事件',
  `res_icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源图标,按钮资源可能需要指定图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 726 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_resources
-- ----------------------------
INSERT INTO `system_resources` VALUES (1, 0, '/', '资源管理', '2015-08-15 10:35:09', 0, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (13, 27, '/seller_menu_order', '交易管理', '2015-08-15 10:39:20', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (14, 13, '/seller/order/orders,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print,/seller/order/orders/details', '全部订单', '2015-08-15 10:40:20', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (15, 13, '/seller/order/productBack,/seller/order/productBack/list', '退货管理', '2015-08-15 10:40:36', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (16, 13, '/seller/order/productExchange,/seller/order/productExchange/list', '换货管理', '2015-08-15 10:41:12', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (17, 27, '/seller_menu_product', '商品管理', '2015-08-15 10:41:45', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (18, 17, '/seller/product/saleAll,/seller/product/list,/seller/product/list_goods,/seller/product/details', '全部商品', '2015-08-15 10:42:07', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (19, 17, '/seller/product/brand,/seller/product/brand/list', '品牌管理', '2015-08-15 10:42:33', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (20, 17, '/seller/product/sellerCate,/seller/product/sellerCate/getByPid', '店铺分类', '2015-08-15 10:43:01', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (21, 17, '/seller/product/chooseCate,/seller/product/getCateById,/seller/product/add,/seller/product/uploadFiles,/seller/product/sellerCate/getByPid,/seller/product/create,/seller/product/uploadSKUImage,/seller/product/validateSPU,/seller/product/validateSKU,/seller/operate/sellerTransport/getByType', '发布商品', '2015-08-15 10:43:34', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (22, 17, '/seller/product/cate,/seller/product/cate/getByPid', '商品分类申请', '2015-08-15 10:44:02', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (23, 27, '/seller_menu_operate', '运营管理', '2015-08-15 10:44:28', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (24, 23, '/seller/operate/sellerqq,/seller/operate/sellerqq/list', '客服QQ设置', '2015-08-15 10:44:53', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (26, 23, '/seller/operate/sellerTransport,/seller/operate/sellerTransport/list,/seller/operate/sellerTransport/getTransport', '运费设置', '2015-08-15 10:46:08', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (27, 1, '/', '商家资源管理', '2015-08-15 11:56:42', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (28, 1, '/', '平台资源管理', '2015-08-15 11:57:26', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (29, 28, '/admin_menu_system', '系统管理', '2015-08-15 11:58:00', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (34, 15, '/seller/order/productBack/edit,/seller/order/productBack/audit,/seller/system/regions/getRegionByParentId', '处理退货申请', '2015-08-17 13:39:15', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (35, 15, '/seller/order/productBack/takeDeliver', '确认收货', '2015-08-17 13:39:44', 2, 1, 1, 'btn_deliver', 'icon-add');
INSERT INTO `system_resources` VALUES (36, 16, '/seller/order/productExchange/edit,/seller/order/productExchange/audit,/seller/system/regions/getRegionByParentId', '处理换货申请', '2015-08-17 14:05:39', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (37, 18, '/seller/product/chooseCate,/seller/product/getCateById,/seller/product/add,/seller/product/uploadFiles,/seller/product/sellerCate/getByPid,/seller/product/create,/seller/product/uploadSKUImage,/seller/product/validateSPU,/seller/product/validateSKU', '发布商品', '2015-08-17 15:38:58', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (38, 167, '/seller/product/queryList,/seller/product/edit,/seller/product/uploadFiles,/seller/product/sellerCate/getByPid,/seller/product/update', '编辑', '2015-08-17 15:45:05', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (39, 167, '/seller/product/del', '删除', '2015-08-17 15:45:44', 2, 1, 1, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (40, 167, '/seller/product/commit', '提交审核', '2015-08-17 15:46:27', 2, 1, 1, 'a-gridCommit', 'icon-saved');
INSERT INTO `system_resources` VALUES (41, 19, '/seller/product/brand/add,/seller/product/brand/create', '添加', '2015-08-17 15:55:06', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (42, 19, '/seller/product/brand/edit,/seller/product/brand/update', '编辑', '2015-08-17 15:55:28', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (43, 19, '/seller/product/brand/del', '删除', '2015-08-17 15:55:52', 2, 1, 1, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (44, 19, '/seller/product/brand/commit', '提交审核', '2015-08-17 15:56:18', 2, 1, 1, 'a-gridCommit', 'icon-saved');
INSERT INTO `system_resources` VALUES (45, 20, '/seller/product/sellerCate/add,/seller/product/sellerCate/create', '添加', '2015-08-17 16:09:59', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (46, 20, '/seller/product/sellerCate/edit,/seller/product/sellerCate/update', '编辑', '2015-08-17 16:10:28', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (47, 20, '/seller/product/sellerCate/del', '删除', '2015-08-17 16:10:45', 2, 1, 1, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (48, 22, '/seller/product/cate/commit', '提交审核', '2015-08-17 16:14:33', 2, 1, 1, 'btn-audit', 'icon-add');
INSERT INTO `system_resources` VALUES (49, 24, '/seller/operate/sellerqq/add,/seller/operate/sellerqq/doAdd', '新增', '2015-08-17 16:17:03', 2, 1, 1, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (50, 24, '/seller/operate/sellerqq/edit,/seller/operate/sellerqq/doAdd', '编辑', '2015-08-17 16:17:18', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (51, 24, '/seller/operate/sellerqq/del', '删除', '2015-08-17 16:17:36', 2, 1, 1, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (55, 29, '/admin/system/code,/admin/system/code/list', '数据字典', '2015-08-17 17:26:08', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (56, 29, '/admin/system/role,/admin/system/role/list', '角色管理', '2015-08-17 17:26:27', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (57, 29, '/admin/system/resource,/admin/system/resource/list', '资源管理', '2015-08-17 17:26:43', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (58, 28, '/admin_menu_order', '交易管理', '2015-08-17 17:27:11', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (59, 28, '/admin_menu_news', '网站文章', '2015-08-17 17:27:30', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (60, 28, '/admin_menu_member', '会员管理', '2015-08-17 17:27:44', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (61, 28, '/admin_menu_product', '商品管理', '2015-08-17 17:28:03', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (62, 58, '/admin/order/complaint,/admin/order/complaint/list', '投诉管理', '2015-08-17 17:29:20', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (63, 59, '/admin/system/newstype,/admin/system/newstype/list', '文章分类', '2015-08-17 17:30:26', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (64, 59, '/admin/system/news,/admin/system/news/list,/admin/system/news/imageUp,/uploadUEImage', '文章管理', '2015-08-17 17:31:00', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (65, 59, '/admin/system/newsParter,/admin/system/newsParter/list', '合作伙伴管理', '2015-08-17 17:31:35', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (66, 60, '/admin/member/member,/admin/member/member/list', '会员管理', '2015-08-17 17:32:20', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (67, 73, '/admin/seller/audit,/admin/seller/audit/list', '商家申请', '2015-08-17 17:33:01', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (68, 73, '/admin/seller/manage,/admin/seller/manage/list', '商家管理', '2015-08-17 17:33:46', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (69, 60, '/admin/member/config/gradevalue,/admin/member/config/gradevalue/update', '会员经验规则管理', '2015-08-17 17:34:24', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (70, 60, '/admin/member/config/intvalue,/admin/member/config/intvalue/update', '会员积分规则管理', '2015-08-17 17:34:56', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (71, 60, '/admin/member/config/grade,/admin/member/config/grade/update', '会员等级配置', '2015-08-17 17:35:25', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (72, 60, '/admin/member/drawmoney,/admin/member/drawmoney/list', '会员提款申请', '2015-08-17 17:35:52', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (73, 28, '/admin_menu_seller', '商家管理', '2015-08-17 17:35:52', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (82, 29, '/admin/system/adminuser,/admin/system/adminuser/list', '管理员管理', '2015-08-17 17:46:25', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (84, 55, '/admin/system/code/add,/admin/system/code/create', '添加', '2015-08-19 15:53:24', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (85, 55, '/admin/system/code/edit,/admin/system/code/update', '编辑', '2015-08-19 15:53:56', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (86, 56, '/admin/system/role/add,/admin/system/role/validateRole,/admin/system/role/save', '新增', '2015-08-19 15:57:18', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (87, 56, '/admin/system/role/edit,/admin/system/role/validateRole,/admin/system/role/save', '编辑', '2015-08-19 15:57:41', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (88, 56, '/admin/system/role/del', '删除', '2015-08-19 15:58:14', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (89, 56, '/admin/system/role/role2Res,/admin/system/role/saveRoleRes,/admin/system/resource/roleResTree', '分配权限', '2015-08-19 15:58:38', 2, 1, 2, 'btn_res', 'icon-add');
INSERT INTO `system_resources` VALUES (90, 57, '/admin/system/resource/addWin,/admin/system/resource/save,/admin/system/resource/resTree', '添加', '2015-08-19 16:21:27', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (91, 57, '/admin/system/resource/editWin,/admin/system/resource/save,/admin/system/resource/resTree', '编辑', '2015-08-19 16:22:09', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (92, 57, '/admin/system/resource/del', '删除', '2015-08-19 16:22:54', 2, 1, 2, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (93, 82, '/admin/system/adminuser/add,/admin/system/adminuser/save', '新增', '2015-08-19 16:25:29', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (94, 82, '/admin/system/adminuser/edit,/admin/system/adminuser/save', '修改', '2015-08-19 16:25:55', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (95, 82, '/admin/system/adminuser/freeze', '冻结', '2015-08-19 16:26:17', 2, 1, 2, 'btn_freeze', 'icon-remove');
INSERT INTO `system_resources` VALUES (96, 82, '/admin/system/adminuser/del', '删除', '2015-08-19 16:26:41', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (97, 62, '/admin/order/complaint/auditPage,/admin/order/complaint/doAudit', '处理', '2015-08-19 16:29:15', 2, 1, 2, 'btn_audit', 'icon-edit');
INSERT INTO `system_resources` VALUES (98, 63, '/admin/system/newstype/add,/admin/system/newstype/doAdd', '新增', '2015-08-19 16:30:45', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (99, 63, '/admin/system/newstype/edit,/admin/system/newstype/doAdd', '编辑', '2015-08-19 16:31:11', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (100, 63, '/admin/system/newstype/del', '删除', '2015-08-19 16:32:30', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (101, 64, '/admin/system/news/add,/admin/system/news/doAdd', '新增', '2015-08-20 09:38:03', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (102, 64, '/admin/system/news/edit,/admin/system/news/doAdd', '编辑', '2015-08-20 09:38:21', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (103, 64, '/admin/system/news/del', '删除', '2015-08-20 09:38:46', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (104, 65, '/admin/system/newsParter/add,/admin/system/newsParter/doAdd', '新增', '2015-08-20 09:40:29', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (105, 65, '/admin/system/newsParter/edit,/admin/system/newsParter/doAdd', '编辑', '2015-08-20 09:40:47', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (106, 65, '/admin/system/newsParter/del', '删除', '2015-08-20 09:41:16', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (107, 66, '/admin/member/member/valueopt', '经验积分管理', '2015-08-20 09:44:38', 2, 1, 2, 'a-gridOptIntegral', 'icon-edit');
INSERT INTO `system_resources` VALUES (108, 66, '/admin/member/member/balanceopt', '余额管理', '2015-08-20 09:45:14', 2, 1, 2, 'a-gridOptBalance', 'icon-edit');
INSERT INTO `system_resources` VALUES (109, 66, '/admin/member/member/uploglist', '升级日志', '2015-08-20 09:45:48', 2, 1, 2, 'a-gridUpLog', 'icon-search');
INSERT INTO `system_resources` VALUES (110, 66, '/admin/member/member/grdIntloglist', '经验值日志', '2015-08-20 09:46:13', 2, 1, 2, 'a-gridGradeLog', 'icon-search');
INSERT INTO `system_resources` VALUES (111, 66, '/admin/member/member/grdIntloglist', '积分值日志', '2015-08-20 09:46:44', 2, 1, 2, 'a-gridIntegralLog', 'icon-search');
INSERT INTO `system_resources` VALUES (112, 66, '/admin/member/member/balanceloglist', '余额日志', '2015-08-20 09:47:07', 2, 1, 2, 'a-gridBalanceLog', 'icon-search');
INSERT INTO `system_resources` VALUES (113, 66, '/admin/member/member/addresslist', '收货地址', '2015-08-20 09:47:33', 2, 1, 2, 'a-gridAddress', 'icon-search');
INSERT INTO `system_resources` VALUES (114, 67, '/admin/seller/audit/audit.html,/admin/seller/audit/pass,/admin/seller/audit/reject,/admin/regions/getArea.html', '审核', '2015-08-20 09:49:42', 2, 1, 2, 'btn_audit', 'icon-saved');
INSERT INTO `system_resources` VALUES (115, 67, '/admin/seller/audit/delete', '删除', '2015-08-20 09:50:04', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (116, 68, '/admin/seller/manage/freeze', '停用', '2015-08-20 09:52:16', 2, 1, 2, 'btn_freeze', 'icon-delete');
INSERT INTO `system_resources` VALUES (118, 72, '/admin/member/drawmoney/auditing', '通过', '2015-08-20 09:57:50', 2, 1, 2, 'a-gridAuditing', 'icon-edit');
INSERT INTO `system_resources` VALUES (119, 308, '/admin/product/waitSalePass,/admin/product/auditProduct', '审核通过', '2015-08-20 10:04:41', 2, 1, 2, 'a-gridCommit', 'icon-saved');
INSERT INTO `system_resources` VALUES (120, 301, '/admin/product/brand/add,/admin/product/brand/create', '添加', '2015-08-20 10:05:43', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (121, 301, '/admin/product/brand/edit,/admin/product/brand/update', '编辑', '2015-08-20 10:06:01', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (122, 301, '/admin/product/brand/del', '删除', '2015-08-20 10:06:21', 2, 1, 2, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (123, 305, '/admin/product/brand/auditing', '审核', '2015-08-20 10:08:08', 2, 1, 2, 'a-gridCommit', 'icon-saved');
INSERT INTO `system_resources` VALUES (124, 302, '/admin/product/norm/add,/admin/product/norm/create', '添加', '2015-08-20 10:10:52', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (125, 302, '/admin/product/norm/edit,/admin/product/norm/update', '编辑', '2015-08-20 10:11:06', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (126, 302, '/admin/product/norm/del', '删除', '2015-08-20 10:11:31', 2, 1, 2, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (130, 303, '/admin/product/type/add,/admin/product/type/create,/admin/product/norm/list_no_page,/admin/product/brand/list_no_page,/admin/product/brand/getByIds,/admin/product/norm/getByIds', '添加', '2015-08-20 10:15:01', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (131, 303, '/admin/product/type/edit,/admin/product/type/update,/admin/product/norm/list_no_page,/admin/product/brand/list_no_page,/admin/product/brand/getByIds,/admin/product/norm/getByIds', '编辑', '2015-08-20 10:15:22', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (132, 303, '/admin/product/type/del', '删除', '2015-08-20 10:15:39', 2, 1, 2, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (136, 304, '/admin/product/cate/add,/admin/product/cate/create,/admin/product/type/list', '添加', '2015-08-20 10:19:01', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (137, 304, '/admin/product/cate/edit,/admin/product/cate/update,/admin/product/type/list', '编辑', '2015-08-20 10:19:17', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (138, 304, '/admin/product/cate/del', '删除', '2015-08-20 10:19:32', 2, 1, 2, 'a-gridRemove', 'icon-remove');
INSERT INTO `system_resources` VALUES (139, 306, '/admin/product/cate/auditPass', '审核通过', '2015-08-20 10:21:10', 2, 1, 2, 'btn_audit', 'icon-saved');
INSERT INTO `system_resources` VALUES (140, 308, '/admin/product/waitSaleReject,/admin/product/auditProduct', '申请驳回', '2015-08-20 15:20:20', 2, 1, 2, 'a_pro_back', 'icon-remove');
INSERT INTO `system_resources` VALUES (141, 308, '/admin/product/waitSaleDel,/admin/product/auditProduct', '删除商品', '2015-08-20 15:21:07', 2, 1, 2, 'a_pro_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (142, 167, '/seller/product/waitSaleUp,/seller/product/handler', '上架', '2015-08-20 16:55:06', 2, 1, 1, 'a_pro_up', 'icon-add');
INSERT INTO `system_resources` VALUES (143, 168, '/seller/product/onSaleDown,/seller/product/handler', '下架', '2015-08-20 16:57:09', 2, 1, 1, 'a_pro_down', 'icon-remove');
INSERT INTO `system_resources` VALUES (145, 28, '/admin_menu_operate', '运营管理', '2015-08-31 16:41:00', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (150, 60, '/admin/member/productcomments,/admin/member/productcomments/list', '会员商品评价管理', '2015-09-06 11:19:19', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (151, 60, '/admin/member/productask,/admin/member/productask/list', '会员商品咨询管理', '2015-09-06 15:47:49', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (167, 17, '/seller/product/waitSale,/seller/product/list,/seller/product/list_goods', '待售商品', '2015-11-21 17:04:51', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (168, 17, '/seller/product/onSale,/seller/product/list,/seller/product/list_goods', '在售商品', '2015-11-21 17:05:15', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (169, 17, '/seller/product/delSale,/seller/product/list,/seller/product/list_goods', '已删除商品', '2015-11-21 17:05:38', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (301, 61, '/admin/product/brand,/admin/product/brand/list', '品牌管理', '2015-08-17 17:37:50', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (302, 61, '/admin/product/norm,/admin/product/norm/list', '规格管理', '2015-08-17 17:38:42', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (303, 61, '/admin/product/type,/admin/product/type/list', '类型管理', '2015-08-17 17:40:01', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (304, 61, '/admin/product/cate,/admin/product/cate/getByPid', '分类管理', '2015-08-17 17:41:53', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (305, 61, '/admin/product/brand/todo,/admin/product/brand/todolist', '待审核品牌', '2015-08-17 17:38:22', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (306, 61, '/admin/product/cate/audit,/admin/product/cate/list', '商家分类申请', '2015-08-17 17:42:32', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (308, 61, '/admin/product/waitSale,/admin/product/list,/admin/product/list_goods,/admin/product/toDetail.html,/admin/product/recommond,/admin/product/del,/admin/product/details', '待售商品', '2015-11-24 20:09:58', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (309, 61, '/admin/product/onSale,/admin/product/list,/admin/product/list_goods,/admin/product/toDetail.html,/admin/product/recommond,/admin/product/del', '在售商品', '2015-11-24 20:10:22', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (310, 61, '/admin/product/delSale,/admin/product/list', '已删除商品', '2015-11-24 20:10:49', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (311, 17, '/seller/product/manager,/seller/product/manager/list', '已申请分类', '2015-11-24 21:47:24', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (314, 309, '/admin/product/onSaleDel,/admin/product/auditProduct', '删除商品', '2015-11-29 17:36:36', 2, 1, 2, 'a_pro_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (315, 309, '/admin/product/onSaleDown,/admin/product/auditProduct', '下架商品', '2015-11-29 17:37:19', 2, 1, 2, 'a_pro_down', 'icon-remove');
INSERT INTO `system_resources` VALUES (318, 14, '/seller/order/orders/confirm', '确认', '2015-12-03 16:13:25', 2, 1, 1, 'a_comfirm', 'icon-add');
INSERT INTO `system_resources` VALUES (319, 14, '/seller/order/orders/delivery,/seller/order/orders/doDelivery', '发货', '2015-12-03 16:14:14', 2, 1, 1, 'btn_dev', 'icon-edit');
INSERT INTO `system_resources` VALUES (321, 13, '/seller/order/orders/state1,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print', '未付款订单', '2015-12-03 16:15:46', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (322, 13, '/seller/order/orders/state2,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print', '待确认订单', '2015-12-03 16:16:38', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (323, 13, '/seller/order/orders/state3,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print', '待发货订单', '2015-12-03 16:16:57', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (324, 13, '/seller/order/orders/state4,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print,/seller/order/orders/printcourier', '已发货订单', '2015-12-03 16:17:15', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (325, 13, '/seller/order/orders/state5,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct,/seller/order/orders/print', '已完成订单', '2015-12-03 16:17:42', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (326, 13, '/seller/order/orders/state6,/seller/order/orders/list,/seller/order/ordersProduct/getOrdersProduct', '已取消订单', '2015-12-03 16:18:00', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (329, 322, '/seller/order/orders/confirm', '确认', '2015-12-03 16:38:12', 2, 1, 1, 'a_comfirm', 'icon-add');
INSERT INTO `system_resources` VALUES (332, 323, '/seller/order/orders/delivery,/seller/order/orders/doDelivery', '发货', '2015-12-03 16:40:00', 2, 1, 1, 'btn_dev', 'icon-edit');
INSERT INTO `system_resources` VALUES (336, 58, '/admin/order/orders,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct,/admin/order/orders/details', '全部订单', '2015-12-03 17:33:03', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (337, 58, '/admin/order/orders/state1,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct', '未付款订单', '2015-12-03 17:36:11', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (338, 58, '/admin/order/orders/state2,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct', '待确认订单', '2015-12-03 17:37:30', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (339, 58, '/admin/order/orders/state3,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct', '待发货订单', '2015-12-03 17:37:59', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (340, 58, '/admin/order/orders/state4,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct', '已发货订单', '2015-12-03 17:38:23', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (341, 58, '/admin/order/orders/state5,/admin/order/orders/list,/admin/order/orders/print,/admin/order/ordersProduct/getOrdersProduct', '已完成订单', '2015-12-03 17:38:47', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (342, 58, '/admin/order/orders/state6,/admin/order/orders/list,/admin/order/ordersProduct/getOrdersProduct', '已取消订单', '2015-12-03 17:39:08', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (343, 58, '/admin/order/productBack,/admin/order/productBack/list', '退货管理', '2015-12-04 17:20:30', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (344, 58, '/admin/order/productExchange,/admin/order/productExchange/list', '换货管理', '2015-12-04 17:21:03', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (345, 343, '/admin/order/productBack/backmoney', '退款到账户', '2015-12-05 15:47:25', 2, 1, 2, 'btn_backMoney', 'icon-edit');
INSERT INTO `system_resources` VALUES (346, 28, '/admin_menu_settlement', '统计结算', '2015-12-07 11:17:40', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (347, 346, '/admin/settlement,/admin/settlement/list', '结算管理', '2015-12-07 11:18:31', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (348, 27, '/seller_menu_settlement', '统计结算', '2015-12-07 18:07:59', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (349, 348, '/seller/settlement,/seller/settlement/list', '结算管理', '2015-12-07 18:09:03', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (350, 349, '/seller/settlement/detail,/seller/settlement/checkOver,/seller/settlement/payOver,/seller/settlement/getSettlementOp,/seller/settlement/orderlist,/seller/settlement/backlist,/seller/settlement/checkDoubt', '详情', '2015-12-07 18:11:49', 2, 1, 1, 'btn-detail', 'icon-edit');
INSERT INTO `system_resources` VALUES (351, 347, '/admin/settlement/detail,/admin/settlement/settleStart,/admin/settlement/platformExplain,/admin/settlement/checkOver,/admin/settlement/payOver,/admin/settlement/getSettlementOp,/admin/settlement/orderlist,/admin/settlement/backlist', '详情', '2015-12-07 18:12:58', 2, 1, 2, 'btn-detail', 'icon-edit');
INSERT INTO `system_resources` VALUES (352, 145, '/admin/operate/courierCompany,/admin/operate/courierCompany/list,/admin/operate/courierCompany/editCourierCompany,/admin/operate/courierCompany/install_lodop32.exe', '物流公司', '2015-12-07 23:21:19', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (353, 352, '/admin/operate/courierCompany/add,/admin/operate/courierCompany/doAdd', '新增', '2015-12-07 23:23:54', 2, 1, 2, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (354, 352, '/admin/operate/courierCompany/edit,/admin/operate/courierCompany/doAdd', '编辑', '2015-12-07 23:24:48', 2, 1, 2, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (355, 352, '/admin/operate/courierCompany/del', '删除', '2015-12-07 23:25:39', 2, 1, 2, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (356, 150, '/admin/member/productcomments/pass', '审核通过', '2015-12-08 14:48:29', 2, 1, 2, 'a-gridAuditPass', 'icon-edit');
INSERT INTO `system_resources` VALUES (357, 150, '/admin/member/productcomments/reject', '审核不通过', '2015-12-08 14:49:26', 2, 1, 2, 'a-gridAuditReject', 'icon-edit');
INSERT INTO `system_resources` VALUES (358, 151, '/admin/member/productask/pass', '审核通过', '2015-12-08 14:50:37', 2, 1, 2, 'a-gridAuditPass', 'icon-edit');
INSERT INTO `system_resources` VALUES (359, 151, '/admin/member/productask/reject', '审核不通过', '2015-12-08 14:51:27', 2, 1, 2, 'a-gridAuditReject', 'icon-edit');
INSERT INTO `system_resources` VALUES (360, 27, '/seller_menu_member', '会员管理', '2015-12-08 15:22:25', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (361, 360, '/seller/member/productask,/seller/member/productask/list', '会员咨询管理', '2015-12-08 15:23:36', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (362, 360, '/seller/member/productcomments,/seller/member/productcomments/list', '会员评价管理', '2015-12-08 15:24:15', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (363, 361, '/seller/member/productask/reply,/seller/member/productask/doreply', '回复', '2015-12-08 15:25:13', 2, 1, 1, 'a-gridReply', 'icon-edit');
INSERT INTO `system_resources` VALUES (364, 346, '/admin/report/orderday,/admin/report/orderday/list', '每日订单统计', '2015-12-08 18:24:05', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (365, 346, '/admin/report/productday,/admin/report/productday/list', '每日商品统计', '2015-12-08 22:04:38', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (366, 348, '/seller/report/orderday,/seller/report/orderday/list', '每日订单统计', '2015-12-08 22:27:27', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (367, 348, '/seller/report/productday,/seller/report/productday/list', '每日商品统计', '2015-12-08 22:28:15', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (368, 369, '/admin/search/keyword,/admin/search/updateKeyword', '关键词设置', '2015-12-10 23:54:58', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (369, 28, '/admin_menu_search', '搜索管理', '2015-12-10 23:57:05', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (370, 369, '/admin/search/keywordfilter,/admin/search/updateKeywordfilter', '敏感词过滤', '2015-12-11 00:02:43', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (371, 27, '/seller_menu_system', '系统管理', '2015-12-09 16:22:16', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (372, 371, '/seller/system/role,/seller/system/role/list', '角色管理', '2015-12-09 16:23:14', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (373, 372, '/seller/system/role/add,/seller/system/role/validateRole,/seller/system/role/save', '新增', '2015-12-09 16:29:06', 2, 1, 1, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (374, 372, '/seller/system/role/edit,/seller/system/role/validateRole,/seller/system/role/save', '编辑', '2015-12-09 16:30:13', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (375, 372, '/seller/system/role/del', '删除', '2015-12-09 16:31:03', 2, 1, 1, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (376, 372, '/seller/system/role/role2Res,/seller/system/role/saveRoleRes,/seller/system/role/roleResTree', '分配权限', '2015-12-09 16:32:34', 2, 1, 1, 'btn_res', 'icon-add');
INSERT INTO `system_resources` VALUES (377, 371, '/seller/system/sellerUser,/seller/system/sellerUser/list', '管理员管理', '2015-12-09 19:27:02', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (378, 377, '/seller/system/sellerUser/add,/seller/system/sellerUser/save', '新增', '2015-12-09 19:27:59', 2, 1, 1, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (379, 377, '/seller/system/sellerUser/edit,/seller/system/sellerUser/save', '编辑', '2015-12-09 19:28:49', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (380, 377, '/seller/system/sellerUser/freeze', '冻结', '2015-12-09 19:35:25', 2, 1, 1, 'btn_freeze', 'icon-edit');
INSERT INTO `system_resources` VALUES (381, 377, '/seller/system/sellerUser/unfreeze', '解冻', '2015-12-09 19:36:00', 2, 1, 1, 'btn_unfreeze', 'icon-edit');
INSERT INTO `system_resources` VALUES (382, 377, '/seller/system/sellerUser/del', '删除', '2015-12-09 19:36:45', 2, 1, 1, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (383, 145, '/admin/config,/admin/config/update', '配置管理', '2015-12-10 14:53:13', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (384, 369, '/admin/searchkeyword,/admin/searchkeyword/list', '敏感词', '2015-12-12 10:53:55', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (385, 384, '/admin/searchkeyword/add,/admin/searchkeyword/create', '添加', '2015-12-12 11:03:54', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (386, 384, '/admin/searchkeyword/edit,/admin/searchkeyword/update', '修改', '2015-12-12 11:05:39', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (387, 384, '/admin/searchkeyword/del', '删除', '2015-12-12 11:09:13', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (388, 13, '/seller/order/complaint,/seller/order/complaint/list', '投诉管理', '2015-12-12 22:11:17', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (389, 388, '/seller/order/complaint/auditPage,/seller/order/complaint/doAudit', '申诉', '2015-12-12 22:12:55', 2, 1, 1, 'btn_audit', 'icon-edit');
INSERT INTO `system_resources` VALUES (390, 340, '/admin/order/orders/submitpay', '确认收款', '2015-12-12 23:29:07', 2, 1, 2, 'a_submit_pay', 'icon-add');
INSERT INTO `system_resources` VALUES (391, 341, '/admin/order/orders/submitpay', '确认收款', '2015-12-12 23:29:48', 2, 1, 2, 'a_submit_pay', 'icon-add');
INSERT INTO `system_resources` VALUES (392, 336, '/admin/order/orders/submitpay', '确认收款', '2015-12-13 00:29:11', 2, 1, 2, 'a_submit_pay', 'icon-add');
INSERT INTO `system_resources` VALUES (393, 26, '/seller/operate/sellerTransport/add,/seller/operate/sellerTransport/doAdd,/seller/operate/sellerTransport/transport_area,/seller/operate/sellerTransport/transportType', '新增', '2015-12-13 11:22:14', 2, 1, 1, 'btn_add', 'icon-add');
INSERT INTO `system_resources` VALUES (394, 26, '/seller/operate/sellerTransport/edit,/seller/operate/sellerTransport/doAdd,/seller/operate/sellerTransport/transport_area,/seller/operate/sellerTransport/transportType', '编辑', '2015-12-13 11:23:44', 2, 1, 1, 'btn_edit', 'icon-edit');
INSERT INTO `system_resources` VALUES (395, 26, '/seller/operate/sellerTransport/inuse', '启用', '2015-12-13 11:25:07', 2, 1, 1, 'btn-inuse', 'icon-edit');
INSERT INTO `system_resources` VALUES (396, 26, '/seller/operate/sellerTransport/del', '删除', '2015-12-13 11:26:08', 2, 1, 1, 'btn_del', 'icon-delete');
INSERT INTO `system_resources` VALUES (397, 68, '/admin/seller/manage/unfreeze', '启用', '2015-12-14 14:56:02', 2, 1, 2, 'btn_unfreeze', 'icon-edit');
INSERT INTO `system_resources` VALUES (398, 306, '/admin/product/cate/auditPass', '审核不通过', '2015-12-14 21:08:22', 2, 1, 2, 'btn_audit1', 'icon-remove');
INSERT INTO `system_resources` VALUES (399, 29, '/admin/system/adminuser/editpwd,/admin/system/adminuser/editpwd/update', '修改密码', '2015-12-14 23:32:25', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (400, 371, '/seller/system/sellerUser/editpwd,/seller/system/sellerUser/editpwd/update', '修改密码', '2015-12-14 23:47:43', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (401, 72, '/admin/member/drawmoney/reject', '拒绝', '2015-12-16 03:35:41', 2, 1, 2, 'a-gridReject', 'icon-edit');
INSERT INTO `system_resources` VALUES (402, 72, '/admin/member/drawmoney/paid', '已打款', '2015-12-16 03:40:47', 2, 1, 2, 'a-gridPaid', 'icon-edit');
INSERT INTO `system_resources` VALUES (403, 28, '/admin_menu_mobile', '移动端管理', '2016-01-04 16:30:33', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (404, 403, '/admin/mindex/banner,/admin/mindex/banner/list', '首页轮播图', '2016-01-04 16:31:51', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (405, 404, '/admin/mindex/banner/add,/admin/mindex/banner/create', '新增', '2016-01-04 16:34:24', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (406, 404, '/admin/mindex/banner/edit,/admin/mindex/banner/update', '修改', '2016-01-04 16:35:01', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (407, 404, '/admin/mindex/banner/delete', '删除', '2016-01-04 16:36:33', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (408, 403, '/admin/mindex/floor,/admin/mindex/floor/list', '移动端首页楼层', '2016-01-04 23:52:28', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (409, 408, '/admin/mindex/floor/add,/admin/mindex/floor/create', '新增', '2016-01-04 23:53:13', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (410, 408, '/admin/mindex/floor/edit,/admin/mindex/floor/update', '修改', '2016-01-04 23:53:46', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (411, 408, '/admin/mindex/floor/delete', '删除', '2016-01-04 23:54:26', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (412, 403, '/admin/mindex/floordata,/admin/mindex/floordata/list', '楼层数据', '2016-01-05 00:13:08', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (413, 412, '/admin/mindex/floordata/add,/admin/mindex/floordata/create,/admin/product/listnopage,/admin/product/cate/productCaseTree', '新增', '2016-01-05 00:13:50', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (414, 412, '/admin/mindex/floordata/edit,/admin/mindex/floordata/update,/admin/product/listnopage,/admin/product/cate/productCaseTree', '修改', '2016-01-05 00:14:27', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (415, 412, '/admin/mindex/floordata/delete', '删除', '2016-01-05 00:15:15', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (416, 404, '/admin/mindex/banner/up', '启用', '2016-01-04 16:34:24', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (417, 404, '/admin/mindex/banner/down', '停用', '2016-01-04 16:34:24', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (418, 408, '/admin/mindex/floor/up', '启用', '2016-01-04 23:53:46', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (419, 408, '/admin/mindex/floor/down', '停用', '2016-01-04 23:53:46', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (420, 27, '/seller_menu_mobile', '移动端管理', '2016-01-05 18:30:13', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (421, 420, '/seller/mindex/banner,/seller/mindex/banner/list', '首页轮播图', '2016-01-04 16:31:51', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (422, 421, '/seller/mindex/banner/add,/seller/mindex/banner/create', '新增', '2016-01-04 16:34:24', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (423, 421, '/seller/mindex/banner/edit,/seller/mindex/banner/update', '修改', '2016-01-04 16:35:01', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (424, 421, '/seller/mindex/banner/delete', '删除', '2016-01-04 16:36:33', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (425, 420, '/seller/mindex/floor,/seller/mindex/floor/list', '移动端首页楼层', '2016-01-04 23:52:28', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (426, 425, '/seller/mindex/floor/add,/seller/mindex/floor/create', '新增', '2016-01-04 23:53:13', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (427, 425, '/seller/mindex/floor/edit,/seller/mindex/floor/update', '修改', '2016-01-04 23:53:46', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (428, 425, '/seller/mindex/floor/delete', '删除', '2016-01-04 23:54:26', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (429, 420, '/seller/mindex/floordata,/seller/mindex/floordata/list', '楼层数据', '2016-01-05 00:13:08', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (430, 429, '/seller/mindex/floordata/add,/seller/mindex/floordata/create,/seller/product/listnopage', '新增', '2016-01-05 00:13:50', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (431, 429, '/seller/mindex/floordata/edit,/seller/mindex/floordata/update,/seller/product/listnopage', '修改', '2016-01-05 00:14:27', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (432, 429, '/seller/mindex/floordata/delete', '删除', '2016-01-05 00:15:15', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (433, 421, '/seller/mindex/banner/up', '启用', '2016-01-04 16:34:24', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (434, 421, '/seller/mindex/banner/down', '停用', '2016-01-04 16:34:24', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (435, 425, '/seller/mindex/floor/up', '启用', '2016-01-04 23:53:46', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (436, 425, '/seller/mindex/floor/down', '停用', '2016-01-04 23:53:46', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (437, 67, '/admin/seller/audit/add,/admin/seller/audit/create,/admin/regions/getRegionByParentId', '新增', '2016-01-13 11:53:26', 2, 1, 2, 'btn-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (438, 67, '/admin/seller/audit/edit,/admin/seller/audit/update,/admin/regions/getRegionByParentId', '修改', '2016-01-13 11:54:30', 2, 1, 2, 'btn-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (444, 28, '/admin_menu_pcindex', 'PC端首页管理', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (445, 444, '/admin/pcindex/banner,/admin/pcindex/banner/list', 'PC首页轮播图', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (446, 445, '/admin/pcindex/banner/add,/admin/pcindex/banner/create', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (447, 445, '/admin/pcindex/banner/edit,/admin/pcindex/banner/update', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (448, 445, '/admin/pcindex/banner/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (449, 445, '/admin/pcindex/banner/up', '使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (450, 445, '/admin/pcindex/banner/pre', '预使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (451, 445, '/admin/pcindex/banner/down', '停用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (452, 444, '/admin/pcindex/recommend,/admin/pcindex/recommend/list', 'PC多惠部落', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (453, 452, '/admin/pcindex/recommend/add,/admin/pcindex/recommend/create,/admin/product/listnopage,/admin/product/cate/productCaseTree', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (454, 452, '/admin/pcindex/recommend/edit,/admin/pcindex/recommend/update,/admin/product/listnopage,/admin/product/cate/productCaseTree', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (455, 452, '/admin/pcindex/recommend/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (456, 452, '/admin/pcindex/recommend/up', '使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (457, 452, '/admin/pcindex/recommend/pre', '预使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (458, 452, '/admin/pcindex/recommend/down', '停用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (459, 444, '/admin/pcindex/floor,/admin/pcindex/floor/list,/admin/pcindex/floorclass/listbyfloor', 'PC首页楼层', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (460, 459, '/admin/pcindex/floor/add,/admin/pcindex/floor/create', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (461, 459, '/admin/pcindex/floor/edit,/admin/pcindex/floor/update', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (462, 459, '/admin/pcindex/floor/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (463, 459, '/admin/pcindex/floor/up', '使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (464, 459, '/admin/pcindex/floor/pre', '预使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (465, 459, '/admin/pcindex/floor/down', '停用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (466, 444, '/admin/pcindex/floorclass,/admin/pcindex/floorclass/list,/admin/pcindex/floordata/listbyfloorclass', 'PC首页楼层分类', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (467, 466, '/admin/pcindex/floorclass/add,/admin/pcindex/floorclass/create', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (468, 466, '/admin/pcindex/floorclass/edit,/admin/pcindex/floorclass/update', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (469, 466, '/admin/pcindex/floorclass/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (470, 466, '/admin/pcindex/floorclass/up', '使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (471, 466, '/admin/pcindex/floorclass/pre', '预使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (472, 466, '/admin/pcindex/floorclass/down', '停用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (473, 466, '/admin/pcindex/floordata/add', '新增数据', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAddData', 'icon-add');
INSERT INTO `system_resources` VALUES (474, 444, '/admin/pcindex/floordata,/admin/pcindex/floordata/list', 'PC首页楼层分类数据', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (475, 474, '/admin/pcindex/floordata/add,/admin/pcindex/floordata/create,/admin/product/listnopage,/admin/product/cate/productCaseTree', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (476, 474, '/admin/pcindex/floordata/edit,/admin/pcindex/floordata/update,/admin/product/listnopage,/admin/product/cate/productCaseTree', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (477, 474, '/admin/pcindex/floordata/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (478, 444, '/admin/pcindex/floorpatch,/admin/pcindex/floorpatch/list', 'PC首页楼层碎屑', '2016-02-19 15:04:12', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (479, 478, '/admin/pcindex/floorpatch/add,/admin/pcindex/floorpatch/create', '新增', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (480, 478, '/admin/pcindex/floorpatch/edit,/admin/pcindex/floorpatch/update', '修改', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (481, 478, '/admin/pcindex/floorpatch/delete', '删除', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (482, 478, '/admin/pcindex/floorpatch/up', '使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (483, 478, '/admin/pcindex/floorpatch/pre', '预使用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (484, 478, '/admin/pcindex/floorpatch/down', '停用', '2016-02-19 15:04:12', 2, 1, 2, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (485, 27, '/seller_menu_pcindex', 'PC端首页管理', '2016-02-24 14:59:42', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (486, 485, '/seller/pcindex/sellerinfo,/seller/pcindex/sellerinfo/update', 'PC端首页信息', '2016-02-24 14:59:42', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (487, 485, '/seller/pcindex/banner,/seller/pcindex/banner/list', 'PC首页轮播图', '2016-02-24 17:12:01', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (488, 487, '/seller/pcindex/banner/add,/seller/pcindex/banner/create', '新增', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (489, 487, '/seller/pcindex/banner/edit,/seller/pcindex/banner/update', '修改', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (490, 487, '/seller/pcindex/banner/delete', '删除', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (491, 487, '/seller/pcindex/banner/up', '使用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (492, 487, '/seller/pcindex/banner/pre', '预使用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (493, 487, '/seller/pcindex/banner/down', '停用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (494, 485, '/seller/pcindex/recommend,/seller/pcindex/recommend/list', 'PC推荐类型', '2016-02-24 17:12:01', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (495, 494, '/seller/pcindex/recommend/add,/seller/pcindex/recommend/create', '新增', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (496, 494, '/seller/pcindex/recommend/edit,/seller/pcindex/recommend/update', '修改', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (497, 494, '/seller/pcindex/recommend/delete', '删除', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (498, 494, '/seller/pcindex/recommend/up', '使用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (499, 494, '/seller/pcindex/recommend/pre', '预使用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridPre', 'icon-edit');
INSERT INTO `system_resources` VALUES (500, 494, '/seller/pcindex/recommend/down', '停用', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (501, 485, '/seller/pcindex/recommenddata,/seller/pcindex/recommenddata/list', 'PC推荐类型数据', '2016-02-24 17:12:01', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (502, 501, '/seller/pcindex/recommenddata/add,/seller/pcindex/recommenddata/create,/seller/product/list,/seller/product/cate/productCaseTree', '新增', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (503, 501, '/seller/pcindex/recommenddata/edit,/seller/pcindex/recommenddata/update,/seller/product/list,/seller/product/cate/productCaseTree', '修改', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (504, 501, '/seller/pcindex/recommenddata/delete', '删除', '2016-02-24 17:12:01', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (505, 27, '/seller_menu_promotion', '促销管理', '2016-03-27 20:22:56', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (506, 505, '/seller/promotion/full,/seller/promotion/full/list', '订单满减', '2016-03-27 20:22:56', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (507, 506, '/seller/promotion/full/add,/seller/promotion/full/create', '新增', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (508, 506, '/seller/promotion/full/edit,/seller/promotion/full/update', '修改', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (509, 506, '/seller/promotion/full/delete', '删除', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (510, 506, '/seller/promotion/full/audit', '提交审核', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (511, 506, '/seller/promotion/full/up', '上架', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (512, 506, '/seller/promotion/full/down', '下架', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (513, 505, '/seller/promotion/single,/seller/promotion/single/list,/seller/promotion/single/detail', '单品立减', '2016-03-27 20:22:56', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (514, 513, '/seller/promotion/single/add,/seller/promotion/single/create,/seller/product/list,/seller/product/cate/productCaseTree', '新增', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (515, 513, '/seller/promotion/single/edit,/seller/promotion/single/update,/seller/product/list,/seller/product/cate/productCaseTree', '修改', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (516, 513, '/seller/promotion/single/delete', '删除', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (517, 513, '/seller/promotion/single/audit', '提交审核', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridAudit', 'icon-edit');
INSERT INTO `system_resources` VALUES (518, 513, '/seller/promotion/single/up', '上架', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (519, 513, '/seller/promotion/single/down', '下架', '2016-03-27 20:22:56', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (520, 505, '/seller/promotion/coupon,/seller/promotion/coupon/list', '优惠券管理', '2016-03-31 14:33:46', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (521, 520, '/seller/promotion/coupon/add,/seller/promotion/coupon/create', '新增', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridAdd', 'icon-add');
INSERT INTO `system_resources` VALUES (522, 520, '/seller/promotion/coupon/edit,/seller/promotion/coupon/update', '修改', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridEdit', 'icon-edit');
INSERT INTO `system_resources` VALUES (523, 520, '/seller/promotion/coupon/delete', '删除', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridDel', 'icon-delete');
INSERT INTO `system_resources` VALUES (524, 520, '/seller/promotion/coupon/audit', '提交审核', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridAudit', 'icon-edit');
INSERT INTO `system_resources` VALUES (525, 520, '/seller/promotion/coupon/up', '上架', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridUp', 'icon-edit');
INSERT INTO `system_resources` VALUES (526, 520, '/seller/promotion/coupon/down', '下架', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (527, 520, '/seller/promotion/coupon/export,/seller/promotion/coupon/doexport', '导出', '2016-03-31 14:33:46', 2, 1, 1, 'a-gridDown', 'icon-edit');
INSERT INTO `system_resources` VALUES (528, 28, '/admin_menu_promotion', '促销管理', '2016-04-01 11:42:55', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (529, 528, '/admin/promotion/full,/admin/promotion/full/list', '订单满减', '2016-04-01 11:45:34', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (530, 529, '/admin/promotion/full/audit,/admin/promotion/full/doaudit', '审核', '2016-04-01 11:45:34', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (531, 528, '/admin/promotion/single,/admin/promotion/single/list,/admin/promotion/single/detail', '单品立减', '2016-04-01 11:48:55', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (532, 531, '/admin/promotion/single/audit,/admin/promotion/single/doaudit', '审核', '2016-04-01 11:48:55', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (533, 528, '/admin/promotion/coupon,/admin/promotion/coupon/list', '优惠券管理', '2016-04-01 11:48:55', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (534, 533, '/admin/promotion/coupon/audit,/admin/promotion/coupon/doaudit', '审核', '2016-04-01 11:48:55', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (535, 520, '/seller/promotion/couponuser,/seller/promotion/couponuser/list,/seller/promotion/couponuser/doexport', '发放详情', '2016-03-31 14:33:46', 2, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (536, 533, '/admin/promotion/couponuser,/admin/promotion/couponuser/list,/admin/promotion/couponuser/doexport', '发放详情', '2016-04-01 11:48:55', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (537, 369, '/admin/searchIndexes,/admin/searchIndexes/operation', '索引初始化', '2016-03-31 15:22:25', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (538, 369, '/admin/searchrecord,/admin/searchrecord/list', '模糊搜索词', '2016-03-31 19:54:13', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (539, 538, '/admin/searchrecord/add,/admin/searchrecord/create', '添加', '2016-04-05 16:39:27', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (540, 538, '/admin/searchrecord/edit,/admin/searchrecord/update', '编辑', '2016-04-05 16:41:03', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (541, 538, '/admin/searchrecord/del', '删除', '2016-04-05 16:41:44', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (542, 346, '/admin/report/orders/orderOverview', '订单概况', '2016-04-19 21:32:40', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (543, 346, '/admin/report/orders/saleOverview', '订单销量统计', '2016-04-19 23:06:33', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (544, 346, '/admin/report/product/phurchaseRate', '购买率统计', '2016-04-21 21:51:50', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (545, 346, '/admin/report/orders/goodsReturnRate', '退货率统计', '2016-04-25 15:57:43', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (546, 346, '/admin/report/orders/CPIstatistics', '人均消费统计', '2016-04-25 16:00:50', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (547, 346, '/admin/report/product/productSale', '商品销量统计', '2016-05-03 11:18:34', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (548, 348, '/seller/report/orders/orderOverview', '订单概况', '2016-04-19 21:32:40', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (549, 348, '/seller/report/orders/saleOverview', '订单销量统计', '2016-04-19 23:06:33', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (550, 348, '/seller/report/product/phurchaseRate', '购买率统计', '2016-04-21 21:51:50', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (551, 348, '/seller/report/orders/goodsReturnRate', '退货率统计', '2016-04-25 15:57:43', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (552, 348, '/seller/report/orders/CPIstatistics', '人均消费统计', '2016-04-25 16:00:50', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (553, 348, '/seller/report/product/productSale', '商品销量统计', '2016-05-03 11:18:34', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (554, 346, '/admin/report/product/pvStatistics', '商品浏览量统计', '2016-05-12 11:12:13', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (555, 528, '/admin/promotion/flash,/admin/promotion/flash/list,/admin/promotion/flash/detail', '限时抢购', '2016-05-10 16:30:53', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (556, 555, '/admin/promotion/flash/add,/admin/promotion/flash/create', '新增', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (557, 555, '/admin/promotion/flash/edit,/admin/promotion/flash/update', '修改', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (558, 555, '/admin/promotion/flash/delete', '删除', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (559, 555, '/admin/promotion/flash/recruitstart', '征集商品', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (560, 555, '/admin/promotion/flash/recruitend', '征集结束', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (561, 555, '/admin/promotion/flash/abolish,/admin/promotion/flash/doabolish', '作废', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (562, 555, '/admin/promotion/flash/audit,/admin/promotion/flash/doaudit,/admin/promotion/flash/stage/list,/admin/promotion/flash/product/list,/admin/promotion/flash/sort', '审核商品', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (563, 555, '/admin/promotion/flash/up', '上架', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (564, 555, '/admin/promotion/flash/down', '下架', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (565, 505, '/seller/promotion/flash,/seller/promotion/flash/list', '限时抢购', '2016-05-11 14:45:35', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (566, 565, '/seller/promotion/flash/apply,/seller/promotion/flash/saveproduct,/seller/promotion/flash/applydelete,/seller/product/list,/seller/product/cate/productCaseTree', '申请', '2016-05-11 14:45:35', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (567, 167, '/seller/product/goodsSet,/seller/product/goodssetSumit', '库存价格设置', '2016-05-17 18:29:02', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (568, 168, '/seller/product/goodsSet,/seller/product/goodssetSumit', '库存价格设置', '2016-05-17 18:32:34', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (569, 555, '/admin/promotion/flash/toProductSort', '修改排序', '2016-05-18 09:44:40', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (570, 369, '/admin/searchlogs,/admin/searchlogs/list', '搜索词历史记录', '2016-06-07 15:12:21', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (571, 528, '/admin/promotion/grouptype,/admin/promotion/grouptype/list', '团购分类', '2016-06-14 18:59:35', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (572, 571, '/admin/promotion/grouptype/add,/admin/promotion/grouptype/create', '添加', '2016-06-14 19:05:56', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (573, 571, '/admin/promotion/grouptype/edit,/admin/promotion/grouptype/update', '编辑', '2016-06-14 19:07:02', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (574, 571, '/admin/promotion/grouptype/del', '删除', '2016-06-14 19:08:28', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (575, 571, '/admin/promotion/grouptype/auditYes', '启用', '2016-06-14 19:09:34', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (576, 571, '/admin/promotion/grouptype/auditNo', '停用', '2016-06-14 19:10:03', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (577, 505, '/seller/promotion/actgroup,/seller/promotion/actgroup/list', '团购管理', '2016-06-16 18:26:05', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (578, 577, '/seller/promotion/actgroup/add,/seller/promotion/actgroup/create,/seller/product/list', '添加', '2016-06-16 18:27:43', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (579, 577, '/seller/promotion/actgroup/edit,/seller/promotion/actgroup/update,/seller/product/list', '编辑', '2016-06-16 18:29:05', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (580, 577, '/seller/promotion/actgroup/auditYes', '提交审核', '2016-06-16 18:30:16', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (581, 577, '/seller/promotion/actgroup/auditNo', '审核撤回', '2016-06-16 18:30:50', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (582, 577, '/seller/promotion/actgroup/release', '发布', '2016-06-16 18:32:18', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (583, 577, '/seller/promotion/actgroup/releaseFinal', '结束', '2016-06-16 18:33:13', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (584, 577, '/seller/promotion/actgroup/look', '详情', '2016-06-16 18:34:13', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (585, 528, '/admin/promotion/actgroup,/admin/promotion/actgroup/list', '团购管理', '2016-06-20 17:05:05', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (586, 585, '/admin/promotion/actgroup/edit,/admin/promotion/actgroup/update', '编辑', '2016-06-20 17:07:32', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (587, 585, '/admin/promotion/actgroup/auditYes', '审核通过', '2016-06-20 17:09:28', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (588, 585, '/admin/promotion/actgroup/auditNo', '审核驳回', '2016-06-20 17:10:19', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (589, 585, '/admin/promotion/actgroup/releaseFinal', '结束', '2016-06-20 17:13:30', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (590, 585, '/admin/promotion/actgroup/look', '详情', '2016-06-20 17:14:23', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (591, 528, '/admin/actgroupbanner/banner,/admin/actgroupbanner/banner/list', '团购首页轮播图', '2016-06-27 18:51:58', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (592, 591, '/admin/actgroupbanner/banner/add,/admin/actgroupbanner/banner/create', '添加', '2016-06-27 19:01:22', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (593, 591, '/admin/actgroupbanner/banner/edit,/admin/actgroupbanner/banner/update', '编辑', '2016-06-27 19:01:59', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (594, 591, '/admin/actgroupbanner/banner/delete', '删除', '2016-06-27 19:02:55', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (595, 591, '/admin/actgroupbanner/banner/up', '使用', '2016-06-27 19:03:35', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (596, 591, '/admin/actgroupbanner/banner/down', '停用', '2016-06-27 19:04:00', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (597, 528, '/admin/promotion/biddingtype,/admin/promotion/biddingtype/list', '拼多多分类', '2016-07-07 16:19:47', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (598, 597, '/admin/promotion/biddingtype/add,/admin/promotion/biddingtype/create', '新增', '2016-07-07 16:21:32', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (599, 597, '/admin/promotion/biddingtype/edit,/admin/promotion/biddingtype/update', '修改', '2016-07-07 16:22:46', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (600, 597, '/admin/promotion/biddingtype/auditYes', '启用', '2016-07-07 16:23:31', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (601, 597, '/admin/promotion/biddingtype/auditNo', '停用', '2016-07-07 16:24:36', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (602, 597, '/admin/promotion/biddingtype/del', '删除', '2016-07-07 16:25:07', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (603, 528, '/admin/actbiddingbanner/banner,/admin/actbiddingbanner/banner/list', '拼多多首页轮播图', '2016-07-07 16:26:21', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (604, 603, '/admin/actbiddingbanner/banner/add,/admin/actbiddingbanner/banner/create', '添加', '2016-07-07 16:27:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (605, 603, '/admin/actbiddingbanner/banner/edit,/admin/actbiddingbanner/banner/update', '编辑', '2016-07-07 16:28:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (606, 603, '/admin/actbiddingbanner/banner/delete', '删除', '2016-07-07 16:29:49', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (607, 603, '/admin/actbiddingbanner/banner/up', '使用', '2016-07-07 16:32:02', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (608, 603, '/admin/actbiddingbanner/banner/down', '停用', '2016-07-07 16:32:49', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (609, 528, '/admin/promotion/actbidding,/admin/promotion/actbidding/list', '拼多多管理', '2016-07-07 19:51:53', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (610, 609, '/admin/promotion/actbidding/edit,/admin/promotion/actbidding/update', '编辑', '2016-07-07 19:52:47', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (611, 609, '/admin/promotion/actbidding/auditYes', '审核通过', '2016-07-07 19:54:14', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (612, 609, '/admin/promotion/actbidding/auditNo', '审核驳回', '2016-07-07 19:55:15', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (613, 609, '/admin/promotion/actbidding/releaseFinal', '结束', '2016-07-07 19:56:24', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (614, 609, '/admin/promotion/actbidding/look', '详情', '2016-07-07 19:57:24', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (615, 505, '/seller/promotion/actbidding,/seller/promotion/actbidding/list', '拼多多管理', '2016-07-08 09:29:48', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (616, 615, '/seller/promotion/actbidding/add,/seller/promotion/actbidding/create,/seller/product/list', '添加', '2016-07-08 09:41:34', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (617, 615, '/seller/promotion/actbidding/edit,/seller/promotion/actbidding/update,/seller/product/list', '编辑', '2016-07-08 09:42:59', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (618, 615, '/seller/promotion/actbidding/auditYes', '提交审核', '2016-07-08 09:43:55', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (619, 615, '/seller/promotion/actbidding/auditNo', '审核撤回', '2016-07-08 09:44:43', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (620, 615, '/seller/promotion/actbidding/release', '发布', '2016-07-08 09:45:23', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (621, 615, '/seller/promotion/actbidding/releaseFinal', '结束', '2016-07-08 09:46:07', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (622, 615, '/seller/promotion/actbidding/look', '详情', '2016-07-08 09:55:46', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (623, 528, '/admin/actintegralbanner/banner,/admin/actintegralbanner/banner/list', '积分商城首页轮播图', '2016-07-27 15:33:37', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (624, 623, '/admin/actintegralbanner/banner/add,/admin/actintegralbanner/banner/create', '新加', '2016-07-27 15:35:59', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (625, 623, '/admin/actintegralbanner/banner/edit,/admin/actintegralbanner/banner/update', '修改', '2016-07-27 15:36:59', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (626, 623, '/admin/actintegralbanner/banner/up', '使用', '2016-07-27 15:38:19', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (627, 623, '/admin/actintegralbanner/banner/down', '停用', '2016-07-27 15:41:53', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (628, 623, '/admin/actintegralbanner/banner/delete', '删除', '2016-07-27 15:42:52', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (629, 528, '/admin/promotion/integraltype,/admin/promotion/integraltype/list', '积分商城分类', '2016-07-27 16:56:06', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (630, 629, '/admin/promotion/integraltype/add,/admin/promotion/integraltype/create', '添加', '2016-07-27 16:57:24', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (631, 629, '/admin/promotion/integraltype/edit,/admin/promotion/integraltype/update', '修改', '2016-07-27 16:58:02', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (632, 629, '/admin/promotion/integraltype/del', '删除', '2016-07-27 16:58:39', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (633, 629, '/admin/promotion/integraltype/auditYes', '启用', '2016-07-27 16:59:16', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (634, 629, '/admin/promotion/integraltype/auditNo', '停用', '2016-07-27 17:00:34', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (635, 528, '/admin/promotion/actintegral,/admin/promotion/actintegral/list', '积分商城管理', '2016-07-27 17:09:55', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (636, 635, '/admin/promotion/actintegral/edit,/admin/promotion/actintegral/update', '编辑', '2016-07-27 17:12:06', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (637, 635, '/admin/promotion/actintegral/auditYes', '审核通过', '2016-07-27 17:12:44', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (638, 635, '/admin/promotion/actintegral/auditNo', '审核驳回', '2016-07-27 17:14:14', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (639, 635, '/admin/promotion/actintegral/releaseFinal', '结束', '2016-07-27 17:15:09', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (640, 635, '/admin/promotion/actintegral/look', '详情', '2016-07-27 17:18:09', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (641, 505, '/seller/promotion/actintegral,/seller/promotion/actintegral/list', '积分商城管理', '2016-07-27 18:05:15', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (642, 641, '/seller/promotion/actintegral/add,/seller/promotion/actintegral/create,/seller/product/list', '添加', '2016-07-27 18:06:29', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (643, 641, '/seller/promotion/actintegral/edit,/seller/promotion/actintegral/update,/seller/product/list', '编辑', '2016-07-27 18:07:11', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (644, 641, '/seller/promotion/actintegral/auditYes', '提交审核', '2016-07-27 18:07:49', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (645, 641, '/seller/promotion/actintegral/auditNo', '审核撤回', '2016-07-27 18:08:26', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (646, 641, '/seller/promotion/actintegral/release', '发布', '2016-07-27 18:09:06', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (647, 641, '/seller/promotion/actintegral/releaseFinal', '结束', '2016-07-27 18:10:00', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (648, 641, '/seller/promotion/actintegral/look', '详情', '2016-07-27 18:10:42', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (649, 528, '/admin/actflashbanner/banner,/admin/actflashbanner/banner/list', '限时抢购首页轮播图', '2016-08-04 20:56:47', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (650, 649, '/admin/actflashbanner/banner/add,/admin/actflashbanner/banner/create', '添加', '2016-08-04 20:57:57', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (651, 649, '/admin/actflashbanner/banner/edit,/admin/actflashbanner/banner/update', '编辑', '2016-08-04 20:58:58', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (652, 649, '/admin/actflashbanner/banner/delete', '删除', '2016-08-04 20:59:48', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (653, 649, '/admin/actflashbanner/banner/up', '使用', '2016-08-04 21:01:04', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (654, 649, '/admin/actflashbanner/banner/down', '停用', '2016-08-04 21:01:41', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (655, 444, '/admin/pcindex/image,/admin/pcindex/image/list', 'PC端首页相关图片', '2016-08-11 19:20:04', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (656, 655, '/admin/pcindex/image/add,/admin/pcindex/image/create', '新增', '2016-08-11 19:28:53', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (657, 655, '/admin/pcindex/image/edit,/admin/pcindex/image/update', '修改', '2016-08-11 19:29:30', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (658, 655, '/admin/pcindex/image/delete', '删除', '2016-08-11 19:30:07', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (659, 655, '/admin/pcindex/image/up', '使用', '2016-08-11 19:30:49', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (660, 655, '/admin/pcindex/image/pre', '预使用', '2016-08-11 19:31:42', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (661, 655, '/admin/pcindex/image/down', '停用', '2016-08-11 19:34:31', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (662, 403, '/admin/mindex/recommend,/admin/mindex/recommend/list', '移动端多惠部落', '2016-08-16 15:43:57', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (663, 662, '/admin/mindex/recommend/add,/admin/mindex/recommend/create,/admin/product/listnopage', '新加', '2016-08-16 15:45:32', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (664, 662, '/admin/mindex/recommend/edit,/admin/mindex/recommend/update,/admin/product/listnopage', '修改', '2016-08-16 15:46:37', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (665, 662, '/admin/mindex/recommend/delete', '删除', '2016-08-16 15:47:09', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (666, 662, '/admin/mindex/recommend/up', '使用', '2016-08-16 15:47:54', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (667, 662, '/admin/mindex/recommend/down', '停用', '2016-08-16 15:48:49', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (668, 60, '/admin/member/config/gradedown,/admin/member/config/gradedown/update', '经验值减少配置', '2016-08-17 11:50:35', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (670, 145, '/admin/systemNotice,/admin/systemNotice/list', '系统公告', '2016-09-27 10:12:34', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (671, 670, '/admin/systemNotice/add,/admin/systemNotice/doAdd', '新增', '2016-09-27 10:39:05', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (672, 670, '/admin/systemNotice/edit', '编辑', '2016-09-27 10:39:18', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (673, 670, '/admin/systemNotice/totop', '置顶', '2016-09-27 11:43:18', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (674, 670, '/admin/systemNotice/del', '删除', '2016-09-27 11:43:31', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (675, 23, '/seller/systemNotice,/seller/systemNotice/list,/seller/systemNotice/detail', '系统公告', '2016-09-27 15:57:35', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (676, 66, '/admin/memberBalancePayLog,/admin/memberBalancePayLog/list', '会员充值记录', '2016-11-02 16:57:10', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (677, 26, '/seller/operate/sellerTransport/disable', '禁用', '2015-12-13 11:25:07', 2, 1, 1, 'btn-disable', 'icon-edit');
INSERT INTO `system_resources` VALUES (678, 62, '/admin/order/complaint/reset,/admin/order/complaint/doreset', '重置', '2017-02-04 11:07:29', 2, 1, 2, 'btn_reset', 'icon-edit');
INSERT INTO `system_resources` VALUES (679, 16, '/admin/order,/admin/order/list,/admin/orderproduct/listbyorder', '预览', '2017-03-14 16:05:03', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (681, 388, 'admin/order,/admin/order/list,/admin/orderproduct/listbyorder', '预览', '2017-03-14 16:14:34', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (682, 687, '/admin/promotion/specialtype/auditNo', '停用', '2017-03-08 21:47:06', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (683, 687, '/admin/promotion/specialtype/auditYes', '启用', '2017-03-08 21:46:29', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (684, 687, '/admin/promotion/specialtype/del', '删除', '2017-03-08 21:45:55', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (685, 687, '/admin/promotion/specialtype/edit,/admin/promotion/specialtype/update', '编辑', '2017-03-08 21:45:24', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (686, 687, '/admin/promotion/specialtype/add,/admin/promotion/specialtype/create', '添加', '2017-03-08 21:44:46', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (687, 528, '/admin/promotion/specialtype,/admin/promotion/specialtype/list', '专题活动分类', '2017-03-08 21:44:03', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (688, 693, '/admin/actspecialbanner/banner/down', '停用', '2017-03-07 21:47:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (689, 693, '/admin/actspecialbanner/banner/up', '使用', '2017-03-07 21:46:46', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (690, 693, '/admin/actspecialbanner/banner/delete', '删除', '2017-03-07 21:46:07', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (691, 693, '/admin/actspecialbanner/banner/edit,/admin/actspecialbanner/banner/update', '编辑', '2017-03-07 21:45:29', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (692, 693, '/admin/actspecialbanner/banner/add,/admin/actspecialbanner/banner/create', '添加', '2017-03-07 21:44:32', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (693, 528, '/admin/actspecialbanner/banner,/admin/actspecialbanner/banner/list', '专题活动轮播图', '2017-03-07 21:42:37', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (694, 528, '/admin/promotion/special,/admin/promotion/special/list', '专题活动', '2016-05-10 16:30:53', 1, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (695, 694, '/admin/promotion/special/add,/admin/promotion/special/create', '新增', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (696, 694, '/admin/promotion/special/edit,/admin/promotion/special/update', '修改', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (697, 694, '/admin/promotion/special/delete', '删除', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (698, 694, '/admin/promotion/special/specialrecruitstart', '征集商品', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (699, 694, '/admin/promotion/special/specialrecruitend', '征集结束', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (700, 694, '/admin/promotion/special/abolish', '作废', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (701, 694, '/admin/promotion/special/audit,/admin/promotion/special/doaudit,/admin/promotion/special/stage/list,/admin/promotion/special/product/list,/admin/promotion/special/sort', '审核商品', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (702, 694, '/admin/promotion/special/specialup', '上架', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (703, 694, '/admin/promotion/special/specialdown', '下架', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (704, 505, '/seller/promotion/special,/seller/promotion/special/list', '专题活动', '2016-05-11 14:45:35', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (705, 704, '/seller/promotion/special/apply,/seller/promotion/special/saveproduct,/seller/promotion/special/applydelete,/seller/product/list,/seller/product/cate/productCaseTree', '申请', '2016-05-11 14:45:35', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (706, 704, '/seller/promotion/special/detail', '详情', '2016-05-11 14:45:35', 1, 1, 1, '', '');
INSERT INTO `system_resources` VALUES (707, 694, '/admin/promotion/special/auditYes', '启用', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (708, 694, '/admin/promotion/special/auditNo', '停用', '2016-05-10 16:30:53', 2, 1, 2, '', '');
INSERT INTO `system_resources` VALUES (709, 694, '/admin/promotion/special/detail,/admin/promotion/special/list_product,/admin/promotion/special/sortIsTop', '详情', '2018-02-07 15:12:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (710, 145, '/admin/sale/salescale,/admin/sale/salescale/list', '商家三级分销设置', '2018-02-23 17:35:51', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (711, 710, '/admin/sale/salescale/edit,/admin/sale/salescale/update', '设置', '2018-02-24 10:47:30', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (712, 710, '/admin/sale/salescale/freeze', '停用', '2018-02-24 11:44:54', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (713, 710, '/admin/sale/salescale/unfreeze', '启用', '2018-02-24 11:45:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (714, 309, '/admin/sale/salescale/salescaleproduct', '设置分佣', '2018-02-24 17:16:33', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (715, 145, '/admin/sale/salesetting,/admin/sale/salesetting/update', '分销设置', '2018-02-25 09:58:52', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (716, 145, '/admin/sale/salemember,/admin/sale/salemember/list', '分销用户', '2018-02-26 18:22:05', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (717, 716, '/admin/sale/salemember/freeze', '审核驳回', '2018-02-26 18:22:49', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (718, 716, '/admin/sale/salemember/unfreeze', '审核通过', '2018-02-26 18:23:26', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (719, 145, '/admin/sale/saleorder,/admin/sale/saleorder/list', '佣金流水', '2018-03-05 17:33:16', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (720, 145, '/admin/sale/saleapplymoney1,/admin/sale/saleapplymoney1/list', '结算中心', '2018-03-10 23:20:18', 1, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (721, 720, '/admin/sale/saleapplymoney1/updatemoneystate', '打款', '2018-03-10 23:20:56', 2, 1, 2, NULL, NULL);
INSERT INTO `system_resources` VALUES (722, 23, '/seller/sale/saleorder,/seller/sale/saleorder/list', '佣金流水', '2018-03-11 21:09:26', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (723, 23, '/seller/sale/salescale,/seller/sale/salescale/update', '佣金设置', '2018-03-11 22:18:17', 1, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (724, 168, '/seller/sale/salescale/salescaleproduct,/seller/sale/salescale/saleproduct', '佣金设置', '2018-03-11 22:59:55', 2, 1, 1, NULL, NULL);
INSERT INTO `system_resources` VALUES (725, 29, '/admin/system/areamanager/freeze', '测试', '2019-04-24 14:44:29', 1, 1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for system_resources_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_resources_roles`;
CREATE TABLE `system_resources_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_id` int(11) NULL DEFAULT NULL,
  `roles_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3280 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_resources_roles
-- ----------------------------
INSERT INTO `system_resources_roles` VALUES (2945, 29, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2946, 55, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2947, 84, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2948, 85, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2949, 56, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2950, 86, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2951, 87, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2952, 88, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2953, 89, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2954, 57, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2955, 90, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2956, 91, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2957, 92, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2958, 82, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2959, 93, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2960, 94, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2961, 95, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2962, 96, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2963, 399, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2964, 58, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2965, 62, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2966, 97, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2967, 678, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2968, 336, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2969, 392, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2970, 337, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2971, 338, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2972, 339, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2973, 340, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2974, 390, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2975, 341, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2976, 391, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2977, 342, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2978, 343, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2979, 345, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2980, 344, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2981, 59, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2982, 63, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2983, 98, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2984, 99, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2985, 100, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2986, 64, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2987, 101, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2988, 102, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2989, 103, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2990, 65, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2991, 104, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2992, 105, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2993, 106, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2994, 60, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2995, 66, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2996, 107, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2997, 108, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2998, 109, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (2999, 110, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3000, 111, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3001, 112, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3002, 113, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3003, 676, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3004, 69, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3005, 70, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3006, 71, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3007, 72, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3008, 118, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3009, 401, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3010, 402, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3011, 150, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3012, 356, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3013, 357, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3014, 151, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3015, 358, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3016, 359, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3017, 668, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3018, 61, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3019, 301, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3020, 120, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3021, 121, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3022, 122, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3023, 302, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3024, 124, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3025, 125, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3026, 126, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3027, 303, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3028, 130, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3029, 131, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3030, 132, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3031, 304, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3032, 136, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3033, 137, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3034, 138, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3035, 305, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3036, 123, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3037, 306, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3038, 139, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3039, 398, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3040, 308, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3041, 119, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3042, 140, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3043, 141, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3044, 309, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3045, 314, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3046, 315, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3047, 714, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3048, 310, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3049, 73, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3050, 67, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3051, 114, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3052, 115, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3053, 437, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3054, 438, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3055, 68, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3056, 116, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3057, 397, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3058, 145, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3059, 352, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3060, 353, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3061, 354, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3062, 355, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3063, 383, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3064, 670, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3065, 671, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3066, 672, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3067, 673, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3068, 674, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3069, 710, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3070, 711, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3071, 712, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3072, 713, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3073, 715, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3074, 716, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3075, 717, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3076, 718, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3077, 719, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3078, 720, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3079, 721, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3080, 346, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3081, 347, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3082, 351, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3083, 364, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3084, 365, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3085, 542, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3086, 543, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3087, 544, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3088, 545, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3089, 546, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3090, 547, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3091, 554, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3092, 369, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3093, 368, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3094, 370, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3095, 384, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3096, 385, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3097, 386, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3098, 387, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3099, 537, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3100, 538, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3101, 539, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3102, 540, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3103, 541, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3104, 570, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3105, 403, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3106, 404, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3107, 405, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3108, 406, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3109, 407, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3110, 416, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3111, 417, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3112, 408, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3113, 409, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3114, 410, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3115, 411, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3116, 418, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3117, 419, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3118, 412, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3119, 413, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3120, 414, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3121, 415, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3122, 662, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3123, 663, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3124, 664, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3125, 665, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3126, 666, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3127, 667, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3128, 444, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3129, 445, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3130, 446, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3131, 447, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3132, 448, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3133, 449, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3134, 450, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3135, 451, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3136, 452, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3137, 453, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3138, 454, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3139, 455, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3140, 456, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3141, 457, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3142, 458, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3143, 459, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3144, 460, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3145, 461, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3146, 462, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3147, 463, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3148, 464, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3149, 465, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3150, 466, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3151, 467, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3152, 468, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3153, 469, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3154, 470, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3155, 471, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3156, 472, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3157, 473, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3158, 474, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3159, 475, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3160, 476, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3161, 477, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3162, 478, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3163, 479, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3164, 480, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3165, 481, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3166, 482, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3167, 483, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3168, 484, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3169, 655, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3170, 656, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3171, 657, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3172, 658, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3173, 659, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3174, 660, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3175, 661, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3176, 528, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3177, 529, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3178, 530, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3179, 531, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3180, 532, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3181, 533, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3182, 534, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3183, 536, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3184, 555, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3185, 556, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3186, 557, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3187, 558, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3188, 559, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3189, 560, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3190, 561, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3191, 562, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3192, 563, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3193, 564, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3194, 569, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3195, 571, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3196, 572, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3197, 573, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3198, 574, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3199, 575, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3200, 576, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3201, 585, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3202, 586, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3203, 587, 1, '2018-03-10 23:21:20');
INSERT INTO `system_resources_roles` VALUES (3204, 588, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3205, 589, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3206, 590, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3207, 591, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3208, 592, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3209, 593, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3210, 594, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3211, 595, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3212, 596, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3213, 597, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3214, 598, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3215, 599, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3216, 600, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3217, 601, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3218, 602, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3219, 603, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3220, 604, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3221, 605, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3222, 606, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3223, 607, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3224, 608, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3225, 609, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3226, 610, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3227, 611, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3228, 612, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3229, 613, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3230, 614, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3231, 623, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3232, 624, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3233, 625, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3234, 626, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3235, 627, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3236, 628, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3237, 629, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3238, 630, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3239, 631, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3240, 632, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3241, 633, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3242, 634, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3243, 635, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3244, 636, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3245, 637, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3246, 638, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3247, 639, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3248, 640, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3249, 649, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3250, 650, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3251, 651, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3252, 652, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3253, 653, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3254, 654, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3255, 687, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3256, 682, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3257, 683, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3258, 684, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3259, 685, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3260, 686, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3261, 693, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3262, 688, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3263, 689, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3264, 690, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3265, 691, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3266, 692, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3267, 694, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3268, 695, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3269, 696, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3270, 697, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3271, 698, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3272, 699, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3273, 700, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3274, 701, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3275, 702, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3276, 703, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3277, 707, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3278, 708, 1, '2018-03-10 23:21:21');
INSERT INTO `system_resources_roles` VALUES (3279, 709, 1, '2018-03-10 23:21:21');

-- ----------------------------
-- Table structure for system_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_roles`;
CREATE TABLE `system_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(11) NULL DEFAULT NULL COMMENT '1、未删除2、删除',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色code,唯一',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_roles
-- ----------------------------
INSERT INTO `system_roles` VALUES (1, '超级管理员', '平台超级管理员', 1, '2016-03-02 17:34:25', '2017-07-26 11:10:46', 1, 'admin');
INSERT INTO `system_roles` VALUES (2, '测试', '测试', 1, '2019-04-23 19:05:12', '2019-04-23 19:05:12', 1, 'test');
INSERT INTO `system_roles` VALUES (6, '测试24', '测试24', 1, '2019-04-24 13:46:41', '2019-04-24 13:46:41', 1, 'test24');
INSERT INTO `system_roles` VALUES (13, '测试25', '测试25', 1, '2019-04-24 14:13:57', '2019-04-24 14:13:57', 1, 'test25');
INSERT INTO `system_roles` VALUES (14, '测试26', '测试26', 1, '2019-04-24 14:14:11', '2019-04-24 14:14:11', 1, 'test26');

SET FOREIGN_KEY_CHECKS = 1;
