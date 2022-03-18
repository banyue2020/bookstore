/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : book_shop

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2022-03-18 21:21:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_address
-- ----------------------------
DROP TABLE IF EXISTS `bs_address`;
CREATE TABLE `bs_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `email_code` varchar(10) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `is_default` char(1) DEFAULT '0' COMMENT '0',
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `bs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_address
-- ----------------------------
INSERT INTO `bs_address` VALUES ('13', '5', '河北省', '邢台市', '邢台县', '人民路1号', '524500', '张三', '18219394877', '0');
INSERT INTO `bs_address` VALUES ('14', '5', '北京市', '北京市', '东城区', '寸金路1号', '524666', '李四', '13531113375', '0');

-- ----------------------------
-- Table structure for bs_admin
-- ----------------------------
DROP TABLE IF EXISTS `bs_admin`;
CREATE TABLE `bs_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_admin
-- ----------------------------
INSERT INTO `bs_admin` VALUES ('1', 'admin', 'admin', null);
INSERT INTO `bs_admin` VALUES ('2', 'admin2', 'admin2', null);

-- ----------------------------
-- Table structure for bs_appeal
-- ----------------------------
DROP TABLE IF EXISTS `bs_appeal`;
CREATE TABLE `bs_appeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `appeal_reason` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `state` int(1) DEFAULT '1' COMMENT '1:待审核，2：通过，3：不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_appeal
-- ----------------------------

-- ----------------------------
-- Table structure for bs_book
-- ----------------------------
DROP TABLE IF EXISTS `bs_book`;
CREATE TABLE `bs_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `author_loc` varchar(255) DEFAULT NULL,
  `suit` int(2) DEFAULT NULL,
  `category` int(2) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_book
-- ----------------------------
INSERT INTO `bs_book` VALUES ('1', '9787513911139', '北纬78°  ', '陈丹燕', '浙江文艺出版社', '2019-09-02 15:15:33', '39.00', '19.50', '中国', '1', '1', '一个作家，一本书，激起你行走的渴望，改变你旅行的意义。陈丹燕旅行文学。', 'beiwei78.jpg', null);
INSERT INTO `bs_book` VALUES ('2', '9787513911139', '100の东京大人味发现', '吴东龙', ' 民主与建设出版社', '2019-09-02 15:15:33', '50.00', '34.50', '中国', '1', '1', '超文艺、超时尚、很全面的东京旅游指南！台湾销售超火！从文化和设计角度深度解读东京，并提供完美的游览、住宿和美食攻略！', '100dongjindarenweifaxian.jpg', null);
INSERT INTO `bs_book` VALUES ('3', '9787535477101', '别走，万一好笑呢', '银教授', '长江文艺出版社', '2019-09-02 15:15:33', '35.00', '26.30', '中国', '1', '1', '微博人气博主@银教授个人作品集 银教授本人含泪自荐，希望你排着队拿着笑的号码牌，按顺序笑', 'biezouwanyihaoxiaone.jpg', null);
INSERT INTO `bs_book` VALUES ('5', '9787516413999', '洞见', '项保华', '企业管理出版社', '2019-09-02 15:15:33', '48.00', '34.60', '中国', '1', '1', '通过揭示体现在决策初心、判断、选择、落实背后的人性特征与事物规律，为提升个体及组织的决策管理水平与能力提供实用的操作指导。', 'dongjian.jpg', null);
INSERT INTO `bs_book` VALUES ('6', '9787308164207', '腾讯传', '吴晓波', '浙江大学出版社', '2019-09-02 15:15:33', '58.00', '40.10', '中国', '1', '2', '全景式记录腾讯成长轨迹，回望一代人的互联网情怀，解读中国互联网企业领先全球的真正秘密。', 'tenxunchuan.jpg', null);
INSERT INTO `bs_book` VALUES ('7', '9787550293151', '拉普拉斯的魔女', '东野圭吾', '北京联合出版公司', '2019-09-02 15:15:33', '39.80', '28.70', '中国', '1', '2', '东野圭吾：“我想摧毁自己以前写的小说，于是，这部作品就此诞生。”', 'lapulasidemonv.jpg', null);
INSERT INTO `bs_book` VALUES ('8', '9787540478612', '愿你的青春不负梦想', '俞敏洪', '湖南文艺出版社', '2019-09-02 15:15:33', '36.00', '21.60', '中国', '1', '2', '50-心路历程×25-创业思考×80场演讲精华，与不甘平庸的你，谈谈如何度过不悔的青春，实现你心中的梦想。', 'yuannideqingchunbufumengxiang.jpg', null);
INSERT INTO `bs_book` VALUES ('9', '9787540478612', '情商高，就是说话', '朱凌,常清', '延边大学出版社', '2019-09-02 15:15:33', '38.00', '19.00', '中国', '1', '2', '教你洞悉人性、说话动听！所谓情商高，就是会说话。不拆台不揭短，不生硬不伤人，让你的每一句话都说得得体又令人舒服，到哪都受欢迎！', 'qingshanggaojiushishuohuarangrenshufu.jpg', null);
INSERT INTO `bs_book` VALUES ('10', '9787507838992', '销售心理战', '霍金斯', '中国国际广播出版社', '2019-09-02 15:15:33', '36.80', '18.40', '中国', '1', '2', '销售就是察言、观色、攻心，销售就是要搞定人，各界的销售大师们强烈推崇的销售心理学！', 'xiaoshouxinlizhan.jpg', null);
INSERT INTO `bs_book` VALUES ('11', '9787535448569', '小道理：分寸之间', '冯仑', '长江文艺出版社', '2019-09-02 15:15:33', '42.00', '33.10', '中国', '2', '2', '商界精英的时代沉思录，地产导师的人生理想国。', 'xiaodaolifencunzhijian.jpg', null);
INSERT INTO `bs_book` VALUES ('12', '9787508667836', '名创优品没有秘密', '杜博奇', '中信出版社', '2019-09-02 15:15:33', '36.00', '27.00', '中国', '2', '2', ' 经济寒冬中的一匹黑马，关店浪潮下的逆势崛起！全面解读名创优品的商业模式，还原一个真实的零售世界！', 'NO SECRETS.jpg', null);
INSERT INTO `bs_book` VALUES ('13', '9787538890433', '写给-轻人的创业课', '彭帅兴', '黑龙江科学技术出版社', '2019-09-02 15:15:33', '39.80', '19.90', '中国', '2', '2', ' 每一个怀揣梦想的创业者都应该细读的暖心之作“拿来即用”的实战经验，“一针见血”的创业指导！', 'xiegeinianqinrende1.jpg', null);
INSERT INTO `bs_book` VALUES ('14', '9787201111728', '运营笔记', '类延昊', '天津人民出版社', '2019-09-02 15:15:33', '39.80', '19.90', '中国', '2', '3', '猫扑网辉煌时代缔造者之一类类告诉你：如何在互联网运营下半场到来之前，快速成长，实现运营人生的弯道超车。', 'yunyinbiji.jpg', null);
INSERT INTO `bs_book` VALUES ('15', '9787221135506', '太空', '亚历山德拉·米热林斯', '贵州人民出版社', '2019-09-02 15:15:33', '68.00', '45.40', '中国', '2', '3', '浩瀚宇宙万千奇观，《太空》带你探索发现！本书献给喜欢仰望星空的少-科学家和梦想家！', 'taikong.jpg', null);
INSERT INTO `bs_book` VALUES ('16', '9787113215491', '欧洲', '亲历者》编辑部', '中国铁道出版社', '2019-09-02 15:15:33', '38.00', '29.30', '中国', '2', '3', '旅行达人实地感受，29项欧洲体验式旅行；全方位文化解读，你的欧洲之旅*精彩。', 'ouzhou.jpg', null);
INSERT INTO `bs_book` VALUES ('17', '9787519219420', '西藏', '梅里', '世界图书出版公司', '2019-09-02 15:15:33', '39.80', '19.90', '中国', '2', '3', '西藏，一个可以改变人生的地方骑行，一种可以征服世界的方式不出门，你不知道你能走多远；不流泪，你不知道你有多坚强。西藏，一个可以改变人生的地方骑行，一种可以征服世界的方式不出门，你不知道你能走多远；不流泪，你不知道你有多坚强。', 'xizang.jpg', null);
INSERT INTO `bs_book` VALUES ('18', '9787201111735', '我与世界只差一个你', '张皓宸', '天津人民出版社', '2019-09-02 15:15:33', '49.00', '38.70', '中国', '2', '3', '12个温馨治愈的情感故事，给-轻人爱的正能量和信心，让你在面对爱时无惧，怀疑爱时坚定。', 'woyushijiezhichayigeni.jpg', null);
INSERT INTO `bs_book` VALUES ('19', '9787515818122', '卖产品就是卖自己', '梁汉桥', '中华工商联合出版社', '2019-09-02 15:15:33', '35.00', '17.50', '中国', '2', '3', '销售就是要玩转情商，销售就是要有效化解客户问题，销售就是要搞定人', 'maichanpinjiushimaiziji.jpg', null);

-- ----------------------------
-- Table structure for bs_cart
-- ----------------------------
DROP TABLE IF EXISTS `bs_cart`;
CREATE TABLE `bs_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user_id` (`user_id`),
  KEY `fk_cart_book_id` (`book_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `bs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_cart
-- ----------------------------

-- ----------------------------
-- Table structure for bs_comment
-- ----------------------------
DROP TABLE IF EXISTS `bs_comment`;
CREATE TABLE `bs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_comment
-- ----------------------------
INSERT INTO `bs_comment` VALUES ('1', '1', '5', '2022-03-16 23:45:25', 'aaaaaaaaaaaaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊素数是');
INSERT INTO `bs_comment` VALUES ('2', '7', '5', '2022-03-16 23:45:25', 'aaaaaaaaaaaaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊素数是');
INSERT INTO `bs_comment` VALUES ('3', '11', '5', '2022-03-16 23:45:25', 'aaaaaaaaaaaaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊素数是');
INSERT INTO `bs_comment` VALUES ('4', '1', '4', '2022-03-16 23:45:25', 'dddddff的做法都是');

-- ----------------------------
-- Table structure for bs_order
-- ----------------------------
DROP TABLE IF EXISTS `bs_order`;
CREATE TABLE `bs_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `order_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_id` (`user_id`),
  KEY `fk_order_addr_id` (`address_id`),
  CONSTRAINT `fk_order_addr_id` FOREIGN KEY (`address_id`) REFERENCES `bs_address` (`id`),
  CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `bs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_order
-- ----------------------------
INSERT INTO `bs_order` VALUES ('41', '202203162110430001', '2022-03-16 21:10:43', '5', '13', '2');
INSERT INTO `bs_order` VALUES ('44', '202203162143580001', '2022-03-16 21:43:58', '5', '13', '3');

-- ----------------------------
-- Table structure for bs_order_item
-- ----------------------------
DROP TABLE IF EXISTS `bs_order_item`;
CREATE TABLE `bs_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_order_id` (`order_id`),
  KEY `fk_book_id` (`book_id`),
  CONSTRAINT `fk_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `bs_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_order_item
-- ----------------------------
INSERT INTO `bs_order_item` VALUES ('51', '41', '3', '1');
INSERT INTO `bs_order_item` VALUES ('58', '44', '1', '1');
INSERT INTO `bs_order_item` VALUES ('59', '44', '7', '4');
INSERT INTO `bs_order_item` VALUES ('60', '44', '11', '1');

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(1) DEFAULT '1' COMMENT '状态',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('3', 'jack1', '123456', '1', '2037086512@qq.com', '15250420158', '苏州市姑苏区');
INSERT INTO `bs_user` VALUES ('4', 'jack2', '123456', '1', '1104975916@qq.com', '15250420158', '苏州市姑苏区');
INSERT INTO `bs_user` VALUES ('5', 'locus', '520wei', '1', '994783520@qq.com', '18219394877', '凯通科技有限公司');
