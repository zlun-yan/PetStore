/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : petstore

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 10/02/2021 14:38:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_code` int(11) NOT NULL COMMENT 'js中的code',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (3, 1, '湖南省', '长沙市', '岳麓区', 430104, '中南大学', '严梓伦', '15802622176');
INSERT INTO `address` VALUES (5, 1, '湖南省', '长沙市', '天心区', 430103, '铁道学院', '严梓伦', '15802622176');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `item_id` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `checked` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0:未被选中 1:已选中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (18, 1, 7, 2, 0);
INSERT INTO `cart` VALUES (19, 1, 8, 1, 0);
INSERT INTO `cart` VALUES (20, 1, 10, 1, 0);
INSERT INTO `cart` VALUES (21, 1, 9, 1, 0);
INSERT INTO `cart` VALUES (22, 1, 11, 1, 0);
INSERT INTO `cart` VALUES (23, 1, 12, 1, 0);

-- ----------------------------
-- Table structure for clauses
-- ----------------------------
DROP TABLE IF EXISTS `clauses`;
CREATE TABLE `clauses`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称（因为商品可能删除啊）',
  `item_price` decimal(10, 2) NOT NULL COMMENT '商品单价',
  `item_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片url',
  `num` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clauses
-- ----------------------------
INSERT INTO `clauses` VALUES (3, 2, 'Alaskan Malamute', 2499.00, 'static/images/item/dog_alaskan.jpg', 6);
INSERT INTO `clauses` VALUES (4, 2, 'Border Collie', 3200.00, 'static/images/item/dog_collie.jpg', 1);
INSERT INTO `clauses` VALUES (5, 3, 'Siberian Husky', 2488.00, 'static/images/item/dog_husky.jpg', 1);
INSERT INTO `clauses` VALUES (6, 3, 'Golden Retriever', 2499.00, 'static/images/item/dog_golden.jpg', 1);
INSERT INTO `clauses` VALUES (7, 3, 'Corgi', 2999.00, 'static/images/item/dog_corgi.jpg', 1);
INSERT INTO `clauses` VALUES (8, 3, 'Samoyed', 2000.00, 'static/images/item/dog_samoyed.jpg', 1);
INSERT INTO `clauses` VALUES (9, 3, 'Poodle', 2000.00, 'static/images/item/dog_poodle.jpg', 1);
INSERT INTO `clauses` VALUES (10, 3, 'German Shepherd dog', 16000.00, 'static/images/item/dog_shepherd.jpg', 1);
INSERT INTO `clauses` VALUES (11, 3, 'Alaskan Malamute', 2499.00, 'static/images/item/dog_alaskan.jpg', 1);
INSERT INTO `clauses` VALUES (12, 3, 'Bichon Frise', 2000.00, 'static/images/item/dog_frise.jpg', 1);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '剩余数量',
  `user_id` int(11) NOT NULL COMMENT '商家的id',
  `type_id` int(11) NOT NULL COMMENT '种类的id',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标签（便于查找）',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片url',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上架日期',
  `sale` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 'Melopsittacus undulatus(blue)', 32.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_blue.jpg', '2021-1-26', 100);
INSERT INTO `item` VALUES (2, 'Melopsittacus undulatus(green)', 25.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_green.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (3, 'Melopsittacus undulatus(yellow)', 35.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_yellow.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (4, 'Melopsittacus undulatus(white)', 40.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_white.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (5, 'Nymphicus hollandicus(pearl)', 150.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_pearl.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (6, 'Nymphicus hollandicus(gray)', 150.00, 100, 1, 1, NULL, 'The budgerigar is the most common pet bird in the world. It has a wide variety, is naughty and lovely, and is widely loved by the public. The total number of budgerigars in the world is more than 5 million.', 'static/images/item/parrot_gray.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (7, 'Alaskan Malamute', 2499.00, 100, 1, 2, NULL, '\r\nAlaskan dog is one of the oldest polar sled dogs. Its name comes from malamut tribe of Inuit. This tribe lives on the coast of kotzeb in western Alaska. Adult Alaskan dog has a quiet, elegant temperament, very loyal to the owner.', 'static/images/item/dog_alaskan.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (8, 'Bichon Frise', 2000.00, 100, 1, 2, NULL, 'Bichon is a small dog, strong, lively and lovely, with a fluffy tail on the back and a pair of curious black eyes. At the same time, its action is light and elegant, flexible and cute', 'static/images/item/dog_frise.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (9, 'Border Collie', 3200.00, 100, 1, 2, NULL, 'He is tenacious, docile, sharp, alert, sensitive, neither vicious nor shy. He is also intelligent, easy to train, gentle, loyal and obedient. He is intelligent in nature, can observe words and colors, and can really understand his master\'s instructions.', 'static/images/item/dog_collie.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (10, 'Pomeranian', 3999.00, 100, 1, 2, NULL, 'It has alert character, smart expression, brisk behavior and curious nature. Small and cute, suitable for companion dog.', 'static/images/item/dog_pomeranian.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (11, 'Shiba Inu', 3999.00, 100, 1, 2, NULL, 'Originated in Japan, it is an old breed. Chai dog has high alertness. It is used to standing on a high place and looking down. It is smart, independent, strong, agile and has the color of firewood', 'static/images/item/dog_doge.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (12, 'French bulldog', 16000.00, 100, 1, 2, NULL, 'French Bulldog is a strong, compact small dog, excellent family mate, but it does not have a sense of boundary with the owner, and even quarrels to share the owner\'s favorite seat.', 'static/images/item/dog_bulldog.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (13, 'Siberian Husky', 2488.00, 100, 1, 2, NULL, 'Husky is very close to the wolf breed, so it looks like a wolf. It has thicker hair than most dog breeds. It is light footed, graceful in movement, compact in body, with thick fur, erect ears and tail like a brush', 'static/images/item/dog_husky.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (14, 'Golden Retriever', 2499.00, 100, 1, 2, NULL, 'Golden Retriever is one of the most common domestic dogs. It is easy to raise, patient and requires little from its owner. It only needs regular exercise, feeding and veterinary examination', 'static/images/item/dog_golden.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (15, 'Corgi', 2999.00, 100, 1, 2, NULL, 'Welsh Corgi Pembroke is a kind of small dog. They are very brave and alert. They can guard their home with high vigilance. They are one of the most popular small guard dogs', 'static/images/item/dog_corgi.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (16, 'Samoyed', 2000.00, 100, 1, 2, NULL, 'Naughty and smart before the age of one year. It is alert, strong, flexible, beautiful, noble and elegant, clever and lovely, has a very eye-catching appearance, has the \"smiling angel\" title', 'static/images/item/dog_samoyed.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (17, 'Poodle', 2000.00, 100, 1, 2, NULL, 'Lively, good temperament, easy to approach, is a loyal dog. Very agile, smart and elegant dog, square structure, well proportioned, powerful and confident pace', 'static/images/item/dog_poodle.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (18, 'German Shepherd dog', 16000.00, 100, 1, 2, NULL, 'German shepherd dog is of moderate size with slight malleability, strong, with strong and developed muscles and strong bones, compact and harmonious', 'static/images/item/dog_shepherd.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (19, 'British Shorthair Cat', 5500.00, 100, 1, 3, NULL, 'British short haired cat, body fat, limbs thick short developed, short and dense hair, big head, round face, gentle calm, friendly, easy to raise. Large round eyes appear in a variety of colors depending on the coat.', 'static/images/item/cat_shorthair.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (20, 'American Shorthair Cat', 2500.00, 100, 1, 3, NULL, 'American short haired cats are symmetrical, powerful and lively. The young short haired cat has a round head, soft hand and flexible limbs, which are very attractive', 'static/images/item/cat_american.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (21, 'Chinchilla', 3800.00, 100, 1, 3, NULL, 'Chinchilla has short limbs and is slightly smaller than Persian cat, but she is more dexterous. Cat\'s eyes are big and round. The whole body has thick and glossy hair, and the amount of hair is rich.', 'static/images/item/cat_chinchilla.jpg', '2021-1-26', 0);
INSERT INTO `item` VALUES (22, 'Garfield', 1999.00, 100, 1, 3, NULL, 'The only difference between the exotic short haired cat and the Persian cat is that its hair is short, thick and fluffy', 'static/images/item/cat_garfield.jpg', '2021-1-26', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通过id在clauses查找',
  `user_id` int(11) NOT NULL COMMENT '订单的用户id',
  `state` int(11) NOT NULL COMMENT '订单的状态（0待付款1正在送2已送达）',
  `addr_id` int(10) UNSIGNED NOT NULL,
  `totPrice` decimal(10, 2) NOT NULL COMMENT '订单的总消费',
  `start_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单开始的时间',
  `end_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单结束的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, 1, 2, 3, 18194.00, '2021-02-03', '2021-02-03');
INSERT INTO `orders` VALUES (3, 1, 0, 3, 32485.00, '2021-02-09', NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类名',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'parrot', 'parrot', 'static/images/type/parrot.jpg');
INSERT INTO `type` VALUES (2, 'dog', 'dog', 'static/images/type/dog.jpg');
INSERT INTO `type` VALUES (3, 'cat', 'cat', 'static/images/type/cat.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像的url',
  `default_addr_id` int(11) NOT NULL DEFAULT 0,
  `address_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货地址的数量0-5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@petstore.com', 'admin', 'static/images/avatars/boy.png', 3, 2);
INSERT INTO `users` VALUES (2, 'zlun', 'zlun@petstore.com', 'zlun', 'static/images/avatars/boy.png', 0, 0);
INSERT INTO `users` VALUES (3, '8209', '8209@petstore.com', '8209', 'static/images/avatars/boy.png', 0, 0);
INSERT INTO `users` VALUES (4, '82091902', '82091902@petstore.com', '82091902', 'static/images/avatars/boy.png', 0, 0);
INSERT INTO `users` VALUES (5, 'admin_second', 'admin@petstore.org', 'admin', 'static/images/avatars/boy.png', 0, 0);
INSERT INTO `users` VALUES (6, 'admin_third', 'admin@csu.com', 'admin', 'static/images/avatars/boy.png', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
