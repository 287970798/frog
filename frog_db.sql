/*
Navicat MySQL Data Transfer

Source Server         : frog_db@aliyun
Source Server Version : 50718
Source Host           : dev.uniteedu.cn:3306
Source Database       : frog_db

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-07-17 20:55:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `multilingual` tinyint(1) unsigned DEFAULT '2' COMMENT '是否开启多语 1 开启 2 关闭',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'FROG内容管理系统', '通用平台,模块化', '一个通用的模块化内容管理平台', '2', null, '1553680587', null);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(8) DEFAULT NULL,
  `language_id` int(5) DEFAULT '1',
  `name` varchar(255) DEFAULT '',
  `content` text,
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT NULL,
  `list_order` int(5) unsigned DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '3', '1', '这里是文章题目ccc', '文章内容', '关键字', '描述', '1', '100', '1541991551', '1542079595', '1542079595');
INSERT INTO `content` VALUES ('2', '4', '1', '文章标题2', '内容2', '关键字2', '描述2', '1', '100', '1541991551', '1542079595', '1542079595');
INSERT INTO `content` VALUES ('3', '11', '1', 'asdfsd', 'asdf', '', '', '1', '103', '1542074468', '1542079580', '1542079580');
INSERT INTO `content` VALUES ('4', '4', '2', 'A Englist content', 'Englist content', '', '', '1', '100', '1542075004', '1542075004', null);
INSERT INTO `content` VALUES ('5', '6', '1', '测试', '测试内容', '', '', '1', '100', '1542080182', '1542080182', null);
INSERT INTO `content` VALUES ('6', '4', '1', '测试编辑器', '', '', '', '1', '100', '1542174621', '1542174621', null);
INSERT INTO `content` VALUES ('7', '2', '1', 'ddd', '', '', '', '1', '100', '1542174739', '1542174739', null);
INSERT INTO `content` VALUES ('8', '11', '1', 'ttt', '', '', '', '1', '100', '1542175342', '1542175342', null);
INSERT INTO `content` VALUES ('9', '29', '1', 'asdf', '', '', '', '1', '100', '1542175550', '1542175550', null);
INSERT INTO `content` VALUES ('10', '11', '1', '幽幽幽幽幽幽幽幽比', '<p>xxx</p>', '', '', '1', '100', '1542175769', '1542187585', null);
INSERT INTO `content` VALUES ('11', '4', '1', 'test', '<p>dddasdf</p><p>adsfasd</p><p><img src=\"http://frog.uniteedu.cn/uploads/20181114/735103a515af24d353175b9921816870.jpg\"/></p><p>asdf</p><p><iframe class=\"ueditor_baidumap\" src=\"http://frog.uniteedu.cn/static/neditor/dialogs/map/show.html#center=117.151625,36.681132&zoom=18&width=600&height=363&markers=117.151625,36.681132&markerStyles=l,A\" frameborder=\"0\" width=\"604\" height=\"367\"></iframe></p>', '', '', '1', '100', '1542185088', '1542187598', null);
INSERT INTO `content` VALUES ('12', '11', '1', '小白兔', '<p>小白兔</p><p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-music\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://box.baidu.com/widget/flash/bdspacesong.swf?from=tiebasongwidget&url=&name=%E5%B0%8F%E7%99%BD%E5%85%94&artist=%E8%94%A1%E7%AC%91%E4%BC%A6&extra=&autoPlay=false&loop=true\" width=\"400\" height=\"95\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '', '', '1', '100', '1542245030', '1542245114', null);

-- ----------------------------
-- Table structure for content_category
-- ----------------------------
DROP TABLE IF EXISTS `content_category`;
CREATE TABLE `content_category` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(8) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `list_order` int(3) unsigned DEFAULT '100',
  `note` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_category
-- ----------------------------
INSERT INTO `content_category` VALUES ('1', '0', '头条', '1', '10', '', null, '1542076361', null);
INSERT INTO `content_category` VALUES ('2', '1', '留学', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('3', '1', 'UI设计', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('4', '1', '趣读', '1', '10', '', null, '1541738447', null);
INSERT INTO `content_category` VALUES ('5', '1', '考研', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('6', '1', '中学教育', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('7', '0', '使用帮助', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('8', '7', '学生使用帮助', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('9', '7', '联创团使用帮助', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('10', '7', '联创人使用帮助', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('11', '0', '快讯', '1', '10', '', null, null, null);
INSERT INTO `content_category` VALUES ('12', '0', '这是一个新栏目', '1', '100', '好的啊', '1541726790', '1541736476', '1541736476');
INSERT INTO `content_category` VALUES ('13', '0', 'sa', '1', '100', 'adfasd', '1541726818', '1541735980', '1541735980');
INSERT INTO `content_category` VALUES ('14', '0', 'asdfd', '2', '100', 'ddd', '1541726851', '1541735977', '1541735977');
INSERT INTO `content_category` VALUES ('15', '0', 'ccccccc', '2', '99', 'cccccccccc', '1541726978', '1541735643', '1541735643');
INSERT INTO `content_category` VALUES ('16', '0', 'asdfd', '1', '100', 'ddd', '1541733002', '1541735555', '1541735555');
INSERT INTO `content_category` VALUES ('17', '0', 'asdfdx', '1', '88', 'dddxx', '1541733013', '1541735481', '1541735481');
INSERT INTO `content_category` VALUES ('18', '0', 'asdfdxxxxxxxxxxxx', '2', '1001', 'dddxxx', '1541733031', '1541735439', '1541735439');
INSERT INTO `content_category` VALUES ('19', '0', 'xxxxxxxx', '1', '100', 'xxxxxxx', '1541736488', '1541739077', '1541739077');
INSERT INTO `content_category` VALUES ('20', '19', '这是一个二级', '1', '100', '', '1541738799', '1541739071', '1541739071');
INSERT INTO `content_category` VALUES ('21', '2', '泰国', '1', '100', '', '1541739159', '1541739260', '1541739260');
INSERT INTO `content_category` VALUES ('22', '21', '暹罗大学', '1', '100', '', '1541739176', '1541739248', '1541739248');
INSERT INTO `content_category` VALUES ('29', '0', '一个多语的栏目x', '1', '100', '', '1541747628', '1542077958', null);
INSERT INTO `content_category` VALUES ('30', '11', 'hhhhh', '1', '100', 'dddd', '1542075550', '1542075577', '1542075577');
INSERT INTO `content_category` VALUES ('31', '1', '史记', '1', '100', '谈古论今', '1542075962', '1542075962', null);

-- ----------------------------
-- Table structure for content_multilingual_category
-- ----------------------------
DROP TABLE IF EXISTS `content_multilingual_category`;
CREATE TABLE `content_multilingual_category` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(5) DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_multilingual_category
-- ----------------------------
INSERT INTO `content_multilingual_category` VALUES ('7', '2', '29', '一个多语栏目的英文名x', null, '1541747628', '1542077958', null);
INSERT INTO `content_multilingual_category` VALUES ('8', '3', '29', '一个多语栏目俄语名x', null, '1541747628', '1542077958', null);
INSERT INTO `content_multilingual_category` VALUES ('9', '2', '29', '一个多语的栏目的英文名', null, '1541750072', '1541750072', null);
INSERT INTO `content_multilingual_category` VALUES ('10', '3', '29', '一个多语的栏目俄语名', null, '1541750072', '1541750072', null);
INSERT INTO `content_multilingual_category` VALUES ('11', '2', '29', '一个多语的栏目的英文名x', null, '1541750077', '1541750077', null);
INSERT INTO `content_multilingual_category` VALUES ('12', '3', '29', '一个多语的栏目俄语名', null, '1541750077', '1541750077', null);

-- ----------------------------
-- Table structure for file_center
-- ----------------------------
DROP TABLE IF EXISTS `file_center`;
CREATE TABLE `file_center` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `note` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_center
-- ----------------------------
INSERT INTO `file_center` VALUES ('1', '教学环境', 'a/b/c/pic.png', '这是一个图片说明', null, '1542166377', '1542166377');
INSERT INTO `file_center` VALUES ('2', '团队活动', '1/2/3/teem.jpg', '团队照', null, '1542166380', '1542166380');
INSERT INTO `file_center` VALUES ('5', 'asdf', 'asd', 'asdf', '1542158407', '1542158511', '1542158511');
INSERT INTO `file_center` VALUES ('6', '团队活动2', '1/2/3/teem2.jpg', '团队照2', '1542158706', '1542166383', '1542166383');
INSERT INTO `file_center` VALUES ('7', '这是一个测试1', 'uploads/20181114/b80d7fe157bc334e052428e4ca9ce517.txt', '测试的备注', '1542164283', '1542166680', null);
INSERT INTO `file_center` VALUES ('8', '这是一个测试', 'uploads/20181115/4859385c3ad582223aea4dbef673a5cf.png', '测试的备注', '1542166557', '1542245230', null);
INSERT INTO `file_center` VALUES ('9', '报名表', 'uploads/20181114/e42a2ac23072c3db0ce646595fff5cb4.txt', '研究生报名表', '1542187646', '1542187646', null);
INSERT INTO `file_center` VALUES ('10', '暹罗大学', 'uploads/20181115/efbb04b66c5c17db3a3db9bd644ff28c.JPG', '', '1542253133', '1542253133', null);

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `flag` varchar(50) DEFAULT '' COMMENT '标识 cn en jp等等',
  `name` varchar(50) DEFAULT '' COMMENT '语言中文名称',
  `realname` varchar(50) DEFAULT '' COMMENT '真实名称 Chinese / English /Japanese ...',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'cn', '中文', 'Chinese', null, null, null);
INSERT INTO `language` VALUES ('2', 'en', '英语', 'English', null, null, null);
INSERT INTO `language` VALUES ('3', 'ru', '俄语', 'Russian', null, null, null);

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '// 默认为0 没有分类',
  `name` varchar(100) NOT NULL DEFAULT '',
  `m` varchar(100) NOT NULL DEFAULT '' COMMENT '// module',
  `c` varchar(100) NOT NULL DEFAULT '' COMMENT '// controller',
  `a` varchar(100) NOT NULL DEFAULT '' COMMENT 'action',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '// 是否显示 1 显示 2 不显示',
  `note` varchar(255) NOT NULL DEFAULT '',
  `list_order` mediumint(3) unsigned NOT NULL DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '1', '权限分类', 'admin', 'PrivilegeCategory', 'all', '1', '', '100', '1520496775', '1520864546', '1520864546');
INSERT INTO `privilege` VALUES ('2', '1', '权限分类修改', 'admin', 'PrivilegeCategory', 'edit', '2', '', '100', '1520496856', '1520864549', '1520864549');
INSERT INTO `privilege` VALUES ('3', '1', '权限分类删除', 'admin', 'PrivilegeCategory', 'del', '2', '', '100', '1520496927', '1520864384', '1520864384');
INSERT INTO `privilege` VALUES ('4', '1', '权限分类详情', 'admin', 'PrivilegeCategory', 'detail', '2', '', '100', '1520497644', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('5', '1', '权限分类添加', 'admin', 'PrivilegeCategory', 'add', '1', '', '100', '1520497744', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('6', '1', 'aaaa', 'm', 'c', 'a', '1', '', '100', '1520497801', '1520506084', '1520506084');
INSERT INTO `privilege` VALUES ('7', '2', 'b', 'm', 'c', 'a', '1', '', '100', '1520497926', '1520502252', '1520502252');
INSERT INTO `privilege` VALUES ('8', '2', 'b', 'a', 'a', 'a', '2', '', '100', '1520502269', '1520502369', '1520502369');
INSERT INTO `privilege` VALUES ('9', '2', 'c', 'c', 'c', 'c', '2', '', '100', '1520502487', '1520506063', '1520506063');
INSERT INTO `privilege` VALUES ('10', '2', 'd', 'd', 'd', 'd', '2', '', '100', '1520502500', '1520505938', '1520505938');
INSERT INTO `privilege` VALUES ('11', '3', 'd', 'd', 'd', 'd', '1', '', '100', '1520502515', '1520502734', '1520502734');
INSERT INTO `privilege` VALUES ('12', '1', '权限分类2', 'admin', 'PrivilegeCategory', 'all', '2', '2', '100', '1520504019', '1520505935', '1520505935');
INSERT INTO `privilege` VALUES ('13', '2', '学员新增', 'student', 'Student', 'add', '1', '', '100', '1520584687', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('14', '2', '学员修改', 'student', 'Student', 'edit', '1', '', '100', '1520584717', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('15', '4', '项目新增', 'project', 'Project', 'add', '1', '', '100', '1520584755', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('16', '3', '积分查看', 'Point', 'point', 'all', '1', '', '100', '1520584792', '1520864552', '1520864552');
INSERT INTO `privilege` VALUES ('17', '1', '用户管理', 'admin', 'user', 'all', '1', '显示所有用户及用户管理', '1', '1520865162', '1520865169', null);
INSERT INTO `privilege` VALUES ('18', '1', '角色管理', 'admin', 'role', 'all', '1', '所有角色及管理', '100', '1520865214', '1520865214', null);
INSERT INTO `privilege` VALUES ('19', '2', '权限分类', 'admin', 'PrivilegeCategory', 'all', '1', '所有权限分类及管理', '3', '1520865273', '1520865459', null);
INSERT INTO `privilege` VALUES ('20', '2', '权限管理', 'admin', 'Privilege', 'all', '1', '', '4', '1520865337', '1520865473', null);
INSERT INTO `privilege` VALUES ('21', '3', '文章管理', 'admin', 'content', 'all', '1', '', '1', '1520866486', '1546656278', null);
INSERT INTO `privilege` VALUES ('22', '4', '产品管理', 'admin', 'product', 'all', '1', '', '100', '1520866508', '1542079822', null);
INSERT INTO `privilege` VALUES ('23', '67', '系统设置', 'admin', 'config', 'index', '1', '', '1', '1520867829', '1520867829', null);
INSERT INTO `privilege` VALUES ('24', '1', '用户详情', 'admin', 'user', 'detail', '2', '', '100', '1521025946', '1521025946', null);
INSERT INTO `privilege` VALUES ('25', '1', '用户修改', 'admin', 'user', 'edit', '2', '', '100', '1521026065', '1521026065', null);
INSERT INTO `privilege` VALUES ('26', '1', '用户删除', 'admin', 'user', 'del', '2', '', '100', '1521026111', '1521026111', null);
INSERT INTO `privilege` VALUES ('27', '2', '权限查看', 'admin', 'privilege', 'detail', '2', '', '100', '1521026168', '1521026168', null);
INSERT INTO `privilege` VALUES ('28', '2', '权限修改', 'admin', 'privilege', 'edit', '2', '', '100', '1521026231', '1521026231', null);
INSERT INTO `privilege` VALUES ('29', '2', '权限删除', 'admin', 'privilege', 'del', '2', '', '100', '1521026261', '1521026261', null);
INSERT INTO `privilege` VALUES ('30', '2', '权限分类查看', 'admin', 'privilegeCategory', 'detail', '2', '', '100', '1521026309', '1521026309', null);
INSERT INTO `privilege` VALUES ('31', '2', '权限分类修改', 'admin', 'privilegeCategory', 'edit', '2', '', '100', '1521026452', '1521026452', null);
INSERT INTO `privilege` VALUES ('32', '2', '权限分类删除', 'admin', 'privilegeCategory', 'del', '2', '', '100', '1521026490', '1521026490', null);
INSERT INTO `privilege` VALUES ('33', '1', '角色查看', 'admin', 'role', 'detail', '2', '', '100', '1521026543', '1521026543', null);
INSERT INTO `privilege` VALUES ('34', '1', '角色修改', 'admin', 'role', 'edit', '2', '', '100', '1521026563', '1521026563', null);
INSERT INTO `privilege` VALUES ('35', '1', '角色删除', 'admin', 'role', 'del', '2', '', '100', '1521026580', '1521026580', null);
INSERT INTO `privilege` VALUES ('36', '3', '文章栏目管理', 'admin', 'ContentCategory', 'index', '1', '', '100', '1541652493', '1546656289', null);
INSERT INTO `privilege` VALUES ('37', '4', '产品栏目管理', 'admin', 'ProductCategory', 'index', '1', '', '100', '1542077742', '1542077742', null);
INSERT INTO `privilege` VALUES ('38', '68', '文件管理', 'admin', 'FileCenter', 'all', '1', '', '100', '1542094758', '1542094758', null);

-- ----------------------------
-- Table structure for privilege_category
-- ----------------------------
DROP TABLE IF EXISTS `privilege_category`;
CREATE TABLE `privilege_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '// 是否显示 1 显示 2 不显示',
  `position` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '// 分类所在位置 1 左侧 2 顶部 3 右侧',
  `note` varchar(200) NOT NULL DEFAULT '',
  `list_order` mediumint(3) unsigned NOT NULL DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege_category
-- ----------------------------
INSERT INTO `privilege_category` VALUES ('1', '用户', '1', '2', '用户内容', '100', '1520404205', '1542099522', null);
INSERT INTO `privilege_category` VALUES ('2', '权限', '1', '1', '权限相关的功能', '100', '1520404409', '1520867952', null);
INSERT INTO `privilege_category` VALUES ('3', '文章', '1', '1', '', '3', '1520404437', '1546656254', null);
INSERT INTO `privilege_category` VALUES ('4', '产品', '1', '1', '这个放在顶部导航', '100', '1520409498', '1527122662', null);
INSERT INTO `privilege_category` VALUES ('13', '用户2', '1', '1', '', '100', '1520414729', '1520415999', '1520415999');
INSERT INTO `privilege_category` VALUES ('14', '招生', '1', '2', '', '100', '1520414891', '1520415999', '1520415999');
INSERT INTO `privilege_category` VALUES ('15', 'adsf', '1', '1', '', '100', '1520416109', '1520419248', '1520419248');
INSERT INTO `privilege_category` VALUES ('16', '234', '1', '1', '', '100', '1520416120', '1520419248', '1520419248');
INSERT INTO `privilege_category` VALUES ('17', '4567', '1', '1', '', '100', '1520416250', '1520418511', '1520418511');
INSERT INTO `privilege_category` VALUES ('18', '789', '1', '1', '', '100', '1520416292', '1520418511', '1520418511');
INSERT INTO `privilege_category` VALUES ('19', '458', '1', '1', '', '100', '1520416322', '1520418388', '1520418388');
INSERT INTO `privilege_category` VALUES ('20', '951', '1', '1', '', '100', '1520416337', '1520418388', '1520418388');
INSERT INTO `privilege_category` VALUES ('21', '753', '1', '1', '', '100', '1520416353', '1520418437', '1520418437');
INSERT INTO `privilege_category` VALUES ('22', '962', '1', '1', '', '100', '1520416414', '1520418437', '1520418437');
INSERT INTO `privilege_category` VALUES ('23', '4578', '1', '1', '', '100', '1520417585', '1520418487', '1520418487');
INSERT INTO `privilege_category` VALUES ('24', '456', '1', '1', '', '100', '1520418325', '1520418487', '1520418487');
INSERT INTO `privilege_category` VALUES ('25', '456', '1', '1', '', '100', '1520419363', '1520419503', '1520419503');
INSERT INTO `privilege_category` VALUES ('26', '79', '1', '1', '', '100', '1520419369', '1520419503', '1520419503');
INSERT INTO `privilege_category` VALUES ('27', '456', '1', '1', '', '100', '1520419559', '1520420119', '1520420119');
INSERT INTO `privilege_category` VALUES ('28', '123', '1', '1', '', '100', '1520419575', '1520419588', '1520419588');
INSERT INTO `privilege_category` VALUES ('29', '485', '1', '1', '', '100', '1520419581', '1520419588', '1520419588');
INSERT INTO `privilege_category` VALUES ('30', '125', '1', '1', '', '100', '1520419694', '1520419964', '1520419964');
INSERT INTO `privilege_category` VALUES ('31', '111', '1', '1', '', '100', '1520419699', '1520419757', '1520419757');
INSERT INTO `privilege_category` VALUES ('32', '1', '1', '1', '', '100', '1520419705', '1520419733', '1520419733');
INSERT INTO `privilege_category` VALUES ('33', '2', '1', '1', '', '100', '1520419709', '1520419724', '1520419724');
INSERT INTO `privilege_category` VALUES ('34', '1', '1', '1', '', '100', '1520420216', '1520421075', '1520421075');
INSERT INTO `privilege_category` VALUES ('35', '2', '1', '1', '', '100', '1520420220', '1520420270', '1520420270');
INSERT INTO `privilege_category` VALUES ('36', '3', '1', '1', '', '100', '1520420224', '1520420247', '1520420247');
INSERT INTO `privilege_category` VALUES ('37', '2', '1', '1', '', '100', '1520420284', '1520420293', '1520420293');
INSERT INTO `privilege_category` VALUES ('38', '3', '1', '1', '', '100', '1520420288', '1520420293', '1520420293');
INSERT INTO `privilege_category` VALUES ('39', '2', '1', '1', '', '100', '1520420366', '1520420925', '1520420925');
INSERT INTO `privilege_category` VALUES ('40', '3', '1', '1', '', '100', '1520420371', '1520420925', '1520420925');
INSERT INTO `privilege_category` VALUES ('41', '2', '1', '1', '', '100', '1520421070', '1520421075', '1520421075');
INSERT INTO `privilege_category` VALUES ('42', '1', '1', '1', '', '100', '1520421191', '1520484422', '1520484422');
INSERT INTO `privilege_category` VALUES ('43', '2', '1', '1', '', '100', '1520421195', '1520484390', '1520484390');
INSERT INTO `privilege_category` VALUES ('44', '3', '1', '1', '', '100', '1520421199', '1520421206', '1520421206');
INSERT INTO `privilege_category` VALUES ('45', '3', '1', '1', '', '100', '1520421804', '1520484177', '1520484177');
INSERT INTO `privilege_category` VALUES ('46', '5', '1', '1', '', '100', '1520421809', '1520483140', '1520483140');
INSERT INTO `privilege_category` VALUES ('47', '6', '1', '1', '', '100', '1520421884', '1520421936', '1520421936');
INSERT INTO `privilege_category` VALUES ('48', '9', '1', '1', '', '100', '1520421900', '1520421936', '1520421936');
INSERT INTO `privilege_category` VALUES ('49', '67', '1', '1', '667', '100', '1520483362', '1520483580', '1520483580');
INSERT INTO `privilege_category` VALUES ('50', '6', '2', '2', '66', '100', '1520484402', '1520484416', '1520484416');
INSERT INTO `privilege_category` VALUES ('51', '7', '2', '2', '77', '100', '1520484411', '1520484422', '1520484422');
INSERT INTO `privilege_category` VALUES ('52', '权限', '1', '1', '', '100', '1520496659', '1520496686', '1520496686');
INSERT INTO `privilege_category` VALUES ('53', '1', '1', '1', '', '100', '1520505296', '1520505334', '1520505334');
INSERT INTO `privilege_category` VALUES ('54', '2', '1', '1', '', '100', '1520505301', '1520505306', '1520505306');
INSERT INTO `privilege_category` VALUES ('55', '1', '1', '1', '', '100', '1520505401', '1520505537', '1520505537');
INSERT INTO `privilege_category` VALUES ('56', '2', '1', '1', '', '100', '1520505407', '1520505521', '1520505521');
INSERT INTO `privilege_category` VALUES ('57', '3', '1', '1', '', '100', '1520505532', '1520505537', '1520505537');
INSERT INTO `privilege_category` VALUES ('58', '1', '1', '1', '', '100', '1520505551', '1520505555', '1520505555');
INSERT INTO `privilege_category` VALUES ('59', '1', '1', '1', '', '100', '1520505563', '1520505571', '1520505571');
INSERT INTO `privilege_category` VALUES ('60', '2', '1', '1', '', '100', '1520505567', '1520505571', '1520505571');
INSERT INTO `privilege_category` VALUES ('61', '1', '1', '1', '', '100', '1520505843', '1520505853', '1520505853');
INSERT INTO `privilege_category` VALUES ('62', '2', '1', '1', '', '100', '1520505846', '1520505849', '1520505849');
INSERT INTO `privilege_category` VALUES ('63', '1', '1', '1', '', '100', '1520506152', '1520506163', '1520506163');
INSERT INTO `privilege_category` VALUES ('64', '2', '1', '1', '', '100', '1520506156', '1520506159', '1520506159');
INSERT INTO `privilege_category` VALUES ('65', '1', '1', '1', '', '100', '1520506226', '1520506236', '1520506236');
INSERT INTO `privilege_category` VALUES ('66', '2', '1', '1', '', '100', '1520506229', '1520506233', '1520506233');
INSERT INTO `privilege_category` VALUES ('67', '设置', '1', '2', '系统设置', '5', '1520867784', '1520867839', null);
INSERT INTO `privilege_category` VALUES ('68', '文件中心', '1', '1', '', '9', '1542088568', '1542099530', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(8) DEFAULT NULL,
  `language_id` int(5) DEFAULT '1',
  `name` varchar(255) DEFAULT '',
  `content` text,
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT NULL,
  `list_order` int(5) unsigned DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '3', '1', '这里是文章题目ccc', '文章内容', '关键字', '描述', '1', '100', '1541991551', '1542079595', '1542079595');
INSERT INTO `product` VALUES ('2', '4', '1', '文章标题2', '内容2', '关键字2', '描述2', '1', '100', '1541991551', '1542079595', '1542079595');
INSERT INTO `product` VALUES ('3', '11', '1', 'asdfsd', 'asdf', '', '', '1', '103', '1542074468', '1542079580', '1542079580');
INSERT INTO `product` VALUES ('4', '4', '2', 'A Englist content', 'Englist content', '', '', '1', '100', '1542075004', '1542080227', '1542080227');
INSERT INTO `product` VALUES ('5', '29', '1', '新的产品', '<p>新的产品内空xxasdf</p>', '', '', '1', '100', '1542080221', '1542249813', null);
INSERT INTO `product` VALUES ('6', '11', '1', '这里是名称', '<p>内容</p>', '', '', '1', '100', '1542256123', '1542256123', null);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(8) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `list_order` int(3) unsigned DEFAULT '100',
  `note` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '0', '头条', '1', '10', '', null, '1541733158', null);
INSERT INTO `product_category` VALUES ('2', '1', '留学', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('3', '1', 'UI设计', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('4', '1', '趣读', '1', '10', '', null, '1541738447', null);
INSERT INTO `product_category` VALUES ('5', '1', '考研', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('6', '1', '中学教育', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('7', '0', '使用帮助', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('8', '7', '学生使用帮助', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('9', '7', '联创团使用帮助', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('10', '7', '联创人使用帮助', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('11', '0', '快讯', '1', '10', '', null, null, null);
INSERT INTO `product_category` VALUES ('12', '0', '这是一个新栏目', '1', '100', '好的啊', '1541726790', '1541736476', '1541736476');
INSERT INTO `product_category` VALUES ('13', '0', 'sa', '1', '100', 'adfasd', '1541726818', '1541735980', '1541735980');
INSERT INTO `product_category` VALUES ('14', '0', 'asdfd', '2', '100', 'ddd', '1541726851', '1541735977', '1541735977');
INSERT INTO `product_category` VALUES ('15', '0', 'ccccccc', '2', '99', 'cccccccccc', '1541726978', '1541735643', '1541735643');
INSERT INTO `product_category` VALUES ('16', '0', 'asdfd', '1', '100', 'ddd', '1541733002', '1541735555', '1541735555');
INSERT INTO `product_category` VALUES ('17', '0', 'asdfdx', '1', '88', 'dddxx', '1541733013', '1541735481', '1541735481');
INSERT INTO `product_category` VALUES ('18', '0', 'asdfdxxxxxxxxxxxx', '2', '1001', 'dddxxx', '1541733031', '1541735439', '1541735439');
INSERT INTO `product_category` VALUES ('19', '0', 'xxxxxxxx', '1', '100', 'xxxxxxx', '1541736488', '1541739077', '1541739077');
INSERT INTO `product_category` VALUES ('20', '19', '这是一个二级', '1', '100', '', '1541738799', '1541739071', '1541739071');
INSERT INTO `product_category` VALUES ('21', '2', '泰国', '1', '100', '', '1541739159', '1541739260', '1541739260');
INSERT INTO `product_category` VALUES ('22', '21', '暹罗大学', '1', '100', '', '1541739176', '1541739248', '1541739248');
INSERT INTO `product_category` VALUES ('29', '0', '一个多语的产品栏目x', '1', '100', '', '1541747628', '1554189046', null);
INSERT INTO `product_category` VALUES ('30', '11', 'hhhhh', '1', '100', 'dddd', '1542075550', '1542075577', '1542075577');
INSERT INTO `product_category` VALUES ('31', '1', '史记', '1', '100', '谈古论今', '1542075962', '1542075962', null);

-- ----------------------------
-- Table structure for product_multilingual_category
-- ----------------------------
DROP TABLE IF EXISTS `product_multilingual_category`;
CREATE TABLE `product_multilingual_category` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(5) DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_multilingual_category
-- ----------------------------
INSERT INTO `product_multilingual_category` VALUES ('7', '2', '29', '一个多语的产品栏目的英文名x', null, '1541747628', '1542077890', null);
INSERT INTO `product_multilingual_category` VALUES ('8', '3', '29', '一个多语的产品栏目俄语名x', null, '1541747628', '1542077890', null);
INSERT INTO `product_multilingual_category` VALUES ('9', '2', '29', '一个多语的栏目的英文名', null, '1541750072', '1541750072', null);
INSERT INTO `product_multilingual_category` VALUES ('10', '3', '29', '一个多语的栏目俄语名', null, '1541750072', '1541750072', null);
INSERT INTO `product_multilingual_category` VALUES ('11', '2', '29', '一个多语的栏目的英文名x', null, '1541750077', '1541750077', null);
INSERT INTO `product_multilingual_category` VALUES ('12', '3', '29', '一个多语的栏目俄语名', null, '1541750077', '1541750077', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1 是 2 否',
  `note` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '1', '1', '', '1520508075', '1520508509', '1520508509');
INSERT INTO `role` VALUES ('2', '联创人', '2', '', '1520508366', '1522636210', null);
INSERT INTO `role` VALUES ('3', '123', '1', '', '1520508616', '1520508643', '1520508643');
INSERT INTO `role` VALUES ('4', '管理员', '2', 'administrator', '1520508679', '1520868725', null);
INSERT INTO `role` VALUES ('5', '网站编辑', '2', 'editor2', '1520508706', '1520593740', null);
INSERT INTO `role` VALUES ('6', '1', '2', '', '1520508719', '1520556290', '1520556290');
INSERT INTO `role` VALUES ('7', '2', '2', '', '1520508723', '1520508731', '1520508731');
INSERT INTO `role` VALUES ('8', '3', '2', '', '1520508727', '1520508731', '1520508731');
INSERT INTO `role` VALUES ('9', '运营', '2', '', '1520559059', '1520593689', null);
INSERT INTO `role` VALUES ('10', '财务', '2', '2', '1520559062', '1522655228', null);
INSERT INTO `role` VALUES ('11', '人事', '2', '3', '1520559067', '1520593748', null);
INSERT INTO `role` VALUES ('12', '销售', '2', '', '1520559964', '1520593679', null);
INSERT INTO `role` VALUES ('14', '招生老师', '2', '', '1520578522', '1520578522', null);
INSERT INTO `role` VALUES ('15', '代理商', '1', '', '1520578534', '1520581715', null);
INSERT INTO `role` VALUES ('16', '助理', '2', '助理备注', '1520585899', '1520590022', null);
INSERT INTO `role` VALUES ('17', 'test', '2', 'testetset', '1520586110', '1522056843', null);
INSERT INTO `role` VALUES ('18', 'test2', '2', '', '1520586414', '1522056741', '1522056741');
INSERT INTO `role` VALUES ('19', 'test3', '2', '', '1520586893', '1520586893', null);
INSERT INTO `role` VALUES ('21', 'test4', '2', '', '1520588189', '1520588189', null);
INSERT INTO `role` VALUES ('22', 'test5', '2', '', '1520588302', '1522056746', '1522056746');
INSERT INTO `role` VALUES ('23', 'test6', '2', '', '1520588475', '1522056746', '1522056746');
INSERT INTO `role` VALUES ('24', 'test7', '2', '', '1520588854', '1520588854', null);
INSERT INTO `role` VALUES ('25', 'test8', '2', '', '1520588937', '1520588937', null);

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `privilege_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '16', '15');
INSERT INTO `role_privilege` VALUES ('2', '17', '15');
INSERT INTO `role_privilege` VALUES ('3', '18', '15');
INSERT INTO `role_privilege` VALUES ('4', '19', '15');
INSERT INTO `role_privilege` VALUES ('5', '21', '14');
INSERT INTO `role_privilege` VALUES ('6', '22', '15');
INSERT INTO `role_privilege` VALUES ('7', '23', '16');
INSERT INTO `role_privilege` VALUES ('8', '24', '16');
INSERT INTO `role_privilege` VALUES ('9', '25', '1');
INSERT INTO `role_privilege` VALUES ('10', '25', '3');
INSERT INTO `role_privilege` VALUES ('11', '25', '4');
INSERT INTO `role_privilege` VALUES ('12', '25', '14');
INSERT INTO `role_privilege` VALUES ('13', '25', '16');
INSERT INTO `role_privilege` VALUES ('14', '25', '15');
INSERT INTO `role_privilege` VALUES ('15', '16', '13');
INSERT INTO `role_privilege` VALUES ('16', '16', '14');
INSERT INTO `role_privilege` VALUES ('17', '16', '1');
INSERT INTO `role_privilege` VALUES ('18', '16', '16');
INSERT INTO `role_privilege` VALUES ('19', '16', '5');
INSERT INTO `role_privilege` VALUES ('20', '12', '1');
INSERT INTO `role_privilege` VALUES ('21', '12', '14');
INSERT INTO `role_privilege` VALUES ('22', '12', '16');
INSERT INTO `role_privilege` VALUES ('23', '12', '15');
INSERT INTO `role_privilege` VALUES ('24', '9', '1');
INSERT INTO `role_privilege` VALUES ('25', '9', '3');
INSERT INTO `role_privilege` VALUES ('26', '9', '4');
INSERT INTO `role_privilege` VALUES ('27', '9', '14');
INSERT INTO `role_privilege` VALUES ('28', '9', '16');
INSERT INTO `role_privilege` VALUES ('29', '9', '15');
INSERT INTO `role_privilege` VALUES ('34', '5', '3');
INSERT INTO `role_privilege` VALUES ('35', '5', '14');
INSERT INTO `role_privilege` VALUES ('36', '5', '16');
INSERT INTO `role_privilege` VALUES ('37', '11', '3');
INSERT INTO `role_privilege` VALUES ('38', '11', '14');
INSERT INTO `role_privilege` VALUES ('39', '11', '16');
INSERT INTO `role_privilege` VALUES ('40', '2', '1');
INSERT INTO `role_privilege` VALUES ('42', '4', '2');
INSERT INTO `role_privilege` VALUES ('44', '2', '2');
INSERT INTO `role_privilege` VALUES ('45', '2', '3');
INSERT INTO `role_privilege` VALUES ('46', '4', '3');
INSERT INTO `role_privilege` VALUES ('47', '4', '4');
INSERT INTO `role_privilege` VALUES ('52', '2', '21');
INSERT INTO `role_privilege` VALUES ('53', '2', '22');
INSERT INTO `role_privilege` VALUES ('54', '4', '17');
INSERT INTO `role_privilege` VALUES ('55', '4', '18');
INSERT INTO `role_privilege` VALUES ('56', '4', '19');
INSERT INTO `role_privilege` VALUES ('57', '4', '20');
INSERT INTO `role_privilege` VALUES ('58', '4', '21');
INSERT INTO `role_privilege` VALUES ('59', '4', '22');
INSERT INTO `role_privilege` VALUES ('60', '4', '23');
INSERT INTO `role_privilege` VALUES ('61', '2', '23');
INSERT INTO `role_privilege` VALUES ('62', '17', '25');
INSERT INTO `role_privilege` VALUES ('63', '17', '26');
INSERT INTO `role_privilege` VALUES ('64', '2', '17');
INSERT INTO `role_privilege` VALUES ('65', '10', '22');
INSERT INTO `role_privilege` VALUES ('66', '10', '21');

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_id` int(10) unsigned DEFAULT NULL,
  `model` varchar(50) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thumb
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(40) NOT NULL DEFAULT '',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1 锁定 2 未锁定',
  `note` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '123456', '1520565817', '1520565817', null);
INSERT INTO `user` VALUES ('13', 'yyloon', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520578336', '1521027228', null);
INSERT INTO `user` VALUES ('14', 'tony', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '这是tony', '1520578581', '1520578581', null);
INSERT INTO `user` VALUES ('15', 'jack', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520579310', '1520579310', null);
INSERT INTO `user` VALUES ('16', 'kvstone', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520579323', '1520579323', null);
INSERT INTO `user` VALUES ('17', 'john2', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', 'john note2', '1520579355', '1520581366', null);
INSERT INTO `user` VALUES ('19', 'test', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', 'test', '1520582968', '1520583110', '1520583110');
INSERT INTO `user` VALUES ('20', 'test', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520583221', '1520583242', '1520583242');
INSERT INTO `user` VALUES ('21', 'test1', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520583236', '1520583242', '1520583242');
INSERT INTO `user` VALUES ('22', 'test', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520583267', '1520583281', '1520583281');
INSERT INTO `user` VALUES ('23', 'test1', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1520583276', '1520583281', '1520583281');
INSERT INTO `user` VALUES ('24', 'test', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '123', '1520587982', '1520587982', null);
INSERT INTO `user` VALUES ('25', 'caiwu', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '', '1522636263', '1522636263', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '12', '2');
INSERT INTO `user_role` VALUES ('2', '12', '4');
INSERT INTO `user_role` VALUES ('9', '13', '2');
INSERT INTO `user_role` VALUES ('10', '13', '14');
INSERT INTO `user_role` VALUES ('11', '14', '5');
INSERT INTO `user_role` VALUES ('12', '14', '9');
INSERT INTO `user_role` VALUES ('13', '15', '10');
INSERT INTO `user_role` VALUES ('14', '15', '11');
INSERT INTO `user_role` VALUES ('15', '16', '4');
INSERT INTO `user_role` VALUES ('16', '16', '14');
INSERT INTO `user_role` VALUES ('17', '17', '9');
INSERT INTO `user_role` VALUES ('18', '17', '12');
INSERT INTO `user_role` VALUES ('19', '24', '2');
INSERT INTO `user_role` VALUES ('20', '24', '4');
INSERT INTO `user_role` VALUES ('21', '24', '5');
INSERT INTO `user_role` VALUES ('22', '25', '10');
INSERT INTO `user_role` VALUES ('23', '25', '2');
INSERT INTO `user_role` VALUES ('24', '15', '2');
INSERT INTO `user_role` VALUES ('25', '13', '17');
