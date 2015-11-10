/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : gov

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-11-10 18:38:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ot_action
-- ----------------------------
DROP TABLE IF EXISTS `ot_action`;
CREATE TABLE `ot_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ot_action
-- ----------------------------
INSERT INTO `ot_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `ot_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `ot_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `ot_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `ot_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `ot_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `ot_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `ot_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `ot_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `ot_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `ot_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for ot_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_action_log`;
CREATE TABLE `ot_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ot_action_log
-- ----------------------------
INSERT INTO `ot_action_log` VALUES ('4', '1', '1', '-1062730068', 'member', '1', 'admin在2015-09-22 15:34登录了后台', '1', '1442907243');
INSERT INTO `ot_action_log` VALUES ('5', '10', '1', '-1062730068', 'Menu', '124', '操作url：/admin.php?s=/Menu/add.html', '1', '1442995569');
INSERT INTO `ot_action_log` VALUES ('6', '1', '2', '0', 'member', '2', '合肥市在2015-09-23 16:18登录了后台', '1', '1442996307');
INSERT INTO `ot_action_log` VALUES ('7', '1', '1', '-1062730068', 'member', '1', 'admin在2015-09-24 09:02登录了后台', '1', '1443056542');
INSERT INTO `ot_action_log` VALUES ('8', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 09:14登录了后台', '1', '1443057247');
INSERT INTO `ot_action_log` VALUES ('9', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 09:15登录了后台', '1', '1443057341');
INSERT INTO `ot_action_log` VALUES ('10', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 09:49登录了后台', '1', '1443059383');
INSERT INTO `ot_action_log` VALUES ('11', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 09:53登录了后台', '1', '1443059580');
INSERT INTO `ot_action_log` VALUES ('12', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 10:05登录了后台', '1', '1443060346');
INSERT INTO `ot_action_log` VALUES ('13', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 10:06登录了后台', '1', '1443060387');
INSERT INTO `ot_action_log` VALUES ('14', '1', '1', '0', 'member', '1', 'admin在2015-09-24 15:24登录了后台', '1', '1443079494');
INSERT INTO `ot_action_log` VALUES ('15', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1443080509');
INSERT INTO `ot_action_log` VALUES ('16', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1443081407');
INSERT INTO `ot_action_log` VALUES ('17', '10', '1', '0', 'Menu', '125', '操作url：/admin.php?s=/Menu/add.html', '1', '1443081608');
INSERT INTO `ot_action_log` VALUES ('18', '10', '1', '0', 'Menu', '126', '操作url：/admin.php?s=/Menu/add.html', '1', '1443082437');
INSERT INTO `ot_action_log` VALUES ('19', '10', '1', '0', 'Menu', '127', '操作url：/admin.php?s=/Menu/add.html', '1', '1443082506');
INSERT INTO `ot_action_log` VALUES ('20', '10', '1', '0', 'Menu', '125', '操作url：/admin.php?s=/Menu/edit.html', '1', '1443082522');
INSERT INTO `ot_action_log` VALUES ('21', '1', '1', '0', 'member', '1', 'admin在2015-09-24 16:15登录了后台', '1', '1443082542');
INSERT INTO `ot_action_log` VALUES ('22', '10', '1', '0', 'Menu', '125', '操作url：/admin.php?s=/Menu/edit.html', '1', '1443082712');
INSERT INTO `ot_action_log` VALUES ('23', '1', '2', '0', 'member', '2', '合肥市在2015-09-24 16:44登录了后台', '1', '1443084252');
INSERT INTO `ot_action_log` VALUES ('24', '1', '1', '0', 'member', '1', 'admin在2015-09-28 08:15登录了后台', '1', '1443399352');
INSERT INTO `ot_action_log` VALUES ('25', '1', '1', '-1062730068', 'member', '1', 'admin在2015-09-28 15:32登录了后台', '1', '1443425541');
INSERT INTO `ot_action_log` VALUES ('26', '10', '1', '-1062730068', 'Menu', '128', '操作url：/admin.php?s=/Menu/add.html', '1', '1443428695');
INSERT INTO `ot_action_log` VALUES ('27', '1', '1', '0', 'member', '1', 'admin在2015-09-30 10:37登录了后台', '1', '1443580673');
INSERT INTO `ot_action_log` VALUES ('28', '1', '1', '0', 'member', '1', 'admin在2015-10-08 08:12登录了后台', '1', '1444263178');
INSERT INTO `ot_action_log` VALUES ('29', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-08 09:14登录了后台', '1', '1444266848');
INSERT INTO `ot_action_log` VALUES ('30', '1', '1', '-1062730160', 'member', '1', 'admin在2015-10-09 11:05登录了后台', '1', '1444359921');
INSERT INTO `ot_action_log` VALUES ('31', '1', '1', '-1062730167', 'member', '1', 'admin在2015-10-09 11:08登录了后台', '1', '1444360105');
INSERT INTO `ot_action_log` VALUES ('32', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:08登录了后台', '1', '1444370937');
INSERT INTO `ot_action_log` VALUES ('33', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:09登录了后台', '1', '1444370990');
INSERT INTO `ot_action_log` VALUES ('34', '10', '1', '0', 'Menu', '129', '操作url：/admin.php?s=/Menu/add.html', '1', '1444371210');
INSERT INTO `ot_action_log` VALUES ('35', '10', '1', '0', 'Menu', '127', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444371288');
INSERT INTO `ot_action_log` VALUES ('36', '10', '1', '0', 'Menu', '130', '操作url：/admin.php?s=/Menu/add.html', '1', '1444371371');
INSERT INTO `ot_action_log` VALUES ('37', '10', '1', '0', 'Menu', '131', '操作url：/admin.php?s=/Menu/add.html', '1', '1444371427');
INSERT INTO `ot_action_log` VALUES ('38', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:27登录了后台', '1', '1444372023');
INSERT INTO `ot_action_log` VALUES ('39', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:29登录了后台', '1', '1444372182');
INSERT INTO `ot_action_log` VALUES ('40', '10', '1', '0', 'Menu', '130', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444372462');
INSERT INTO `ot_action_log` VALUES ('41', '10', '1', '0', 'Menu', '130', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444372471');
INSERT INTO `ot_action_log` VALUES ('42', '10', '1', '0', 'Menu', '131', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444372477');
INSERT INTO `ot_action_log` VALUES ('43', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:34登录了后台', '1', '1444372495');
INSERT INTO `ot_action_log` VALUES ('44', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:49登录了后台', '1', '1444373386');
INSERT INTO `ot_action_log` VALUES ('45', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:50登录了后台', '1', '1444373421');
INSERT INTO `ot_action_log` VALUES ('46', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 14:54登录了后台', '1', '1444373666');
INSERT INTO `ot_action_log` VALUES ('47', '1', '1', '0', 'member', '1', 'admin在2015-10-09 14:58登录了后台', '1', '1444373908');
INSERT INTO `ot_action_log` VALUES ('48', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-09 15:06登录了后台', '1', '1444374382');
INSERT INTO `ot_action_log` VALUES ('49', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-09 15:08登录了后台', '1', '1444374486');
INSERT INTO `ot_action_log` VALUES ('50', '11', '1', '-1062730068', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1444374643');
INSERT INTO `ot_action_log` VALUES ('51', '11', '1', '-1062730068', 'category', '39', '操作url：/admin.php?s=/Category/remove/id/39.html', '1', '1444374674');
INSERT INTO `ot_action_log` VALUES ('52', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-09 15:33登录了后台', '1', '1444376036');
INSERT INTO `ot_action_log` VALUES ('53', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-09 15:34登录了后台', '1', '1444376065');
INSERT INTO `ot_action_log` VALUES ('54', '11', '1', '-1062730068', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1444376874');
INSERT INTO `ot_action_log` VALUES ('55', '10', '1', '-1062730068', 'Menu', '132', '操作url：/admin.php?s=/Menu/add.html', '1', '1444377107');
INSERT INTO `ot_action_log` VALUES ('56', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-09 15:54登录了后台', '1', '1444377252');
INSERT INTO `ot_action_log` VALUES ('57', '1', '2', '0', 'member', '2', '合肥市在2015-10-09 16:08登录了后台', '1', '1444378086');
INSERT INTO `ot_action_log` VALUES ('58', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 09:13登录了后台', '1', '1444439639');
INSERT INTO `ot_action_log` VALUES ('59', '1', '1', '0', 'member', '1', 'admin在2015-10-10 09:14登录了后台', '1', '1444439664');
INSERT INTO `ot_action_log` VALUES ('60', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-10 09:23登录了后台', '1', '1444440186');
INSERT INTO `ot_action_log` VALUES ('61', '9', '1', '-1062730068', 'channel', '5', '操作url：/index.php?s=/Admin/Channel/edit.html', '1', '1444440390');
INSERT INTO `ot_action_log` VALUES ('62', '1', '1', '0', 'member', '1', 'admin在2015-10-10 11:21登录了后台', '1', '1444447276');
INSERT INTO `ot_action_log` VALUES ('63', '10', '1', '0', 'Menu', '133', '操作url：/admin.php?s=/Menu/add.html', '1', '1444447368');
INSERT INTO `ot_action_log` VALUES ('64', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 11:23登录了后台', '1', '1444447398');
INSERT INTO `ot_action_log` VALUES ('65', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 13:20登录了后台', '1', '1444454409');
INSERT INTO `ot_action_log` VALUES ('66', '1', '1', '0', 'member', '1', 'admin在2015-10-10 13:49登录了后台', '1', '1444456144');
INSERT INTO `ot_action_log` VALUES ('67', '9', '1', '0', 'channel', '3', '操作url：/admin.php?s=/Channel/edit.html', '1', '1444456204');
INSERT INTO `ot_action_log` VALUES ('68', '9', '1', '0', 'channel', '0', '操作url：/admin.php?s=/Channel/del/id/3.html', '1', '1444456209');
INSERT INTO `ot_action_log` VALUES ('69', '9', '1', '0', 'channel', '0', '操作url：/admin.php?s=/Channel/del/id/2.html', '1', '1444456214');
INSERT INTO `ot_action_log` VALUES ('70', '10', '1', '0', 'Menu', '134', '操作url：/admin.php?s=/Menu/add.html', '1', '1444456348');
INSERT INTO `ot_action_log` VALUES ('71', '10', '1', '0', 'Menu', '0', '操作url：/admin.php?s=/Menu/del/id/134.html', '1', '1444456374');
INSERT INTO `ot_action_log` VALUES ('72', '10', '1', '0', 'Menu', '135', '操作url：/admin.php?s=/Menu/add.html', '1', '1444456386');
INSERT INTO `ot_action_log` VALUES ('73', '10', '1', '0', 'Menu', '136', '操作url：/admin.php?s=/Menu/add.html', '1', '1444456474');
INSERT INTO `ot_action_log` VALUES ('74', '10', '1', '0', 'Menu', '137', '操作url：/admin.php?s=/Menu/add.html', '1', '1444456526');
INSERT INTO `ot_action_log` VALUES ('75', '10', '1', '0', 'Menu', '138', '操作url：/admin.php?s=/Menu/add.html', '1', '1444456551');
INSERT INTO `ot_action_log` VALUES ('76', '10', '1', '0', 'Menu', '0', '操作url：/admin.php?s=/Menu/del/id/128.html', '1', '1444456616');
INSERT INTO `ot_action_log` VALUES ('77', '10', '1', '0', 'Menu', '135', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444456638');
INSERT INTO `ot_action_log` VALUES ('78', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 13:58登录了后台', '1', '1444456687');
INSERT INTO `ot_action_log` VALUES ('79', '10', '1', '0', 'Menu', '133', '操作url：/admin.php?s=/Menu/edit.html', '1', '1444459566');
INSERT INTO `ot_action_log` VALUES ('80', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 15:12登录了后台', '1', '1444461160');
INSERT INTO `ot_action_log` VALUES ('81', '10', '1', '0', 'Menu', '139', '操作url：/admin.php?s=/Menu/add.html', '1', '1444461211');
INSERT INTO `ot_action_log` VALUES ('82', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 15:25登录了后台', '1', '1444461937');
INSERT INTO `ot_action_log` VALUES ('83', '1', '2', '0', 'member', '2', '合肥市在2015-10-10 15:26登录了后台', '1', '1444462005');
INSERT INTO `ot_action_log` VALUES ('84', '1', '1', '0', 'member', '1', 'admin在2015-10-12 08:27登录了后台', '1', '1444609666');
INSERT INTO `ot_action_log` VALUES ('85', '10', '1', '0', 'Menu', '140', '操作url：/admin.php?s=/Menu/add.html', '1', '1444609727');
INSERT INTO `ot_action_log` VALUES ('86', '1', '2', '0', 'member', '2', '合肥市在2015-10-12 08:31登录了后台', '1', '1444609904');
INSERT INTO `ot_action_log` VALUES ('87', '10', '1', '0', 'Menu', '141', '操作url：/admin.php?s=/Menu/add.html', '1', '1444616925');
INSERT INTO `ot_action_log` VALUES ('88', '1', '2', '0', 'member', '2', '合肥市在2015-10-12 10:29登录了后台', '1', '1444616964');
INSERT INTO `ot_action_log` VALUES ('89', '1', '9', '0', 'member', '9', '巢湖市在2015-10-12 15:50登录了后台', '1', '1444636244');
INSERT INTO `ot_action_log` VALUES ('90', '1', '9', '0', 'member', '9', '巢湖市在2015-10-12 15:51登录了后台', '1', '1444636275');
INSERT INTO `ot_action_log` VALUES ('91', '1', '9', '0', 'member', '9', '巢湖市在2015-10-12 15:52登录了后台', '1', '1444636326');
INSERT INTO `ot_action_log` VALUES ('92', '1', '9', '0', 'member', '9', '巢湖市在2015-10-13 08:50登录了后台', '1', '1444697421');
INSERT INTO `ot_action_log` VALUES ('93', '1', '1', '0', 'member', '1', 'admin在2015-10-13 15:22登录了后台', '1', '1444720954');
INSERT INTO `ot_action_log` VALUES ('94', '10', '1', '0', 'Menu', '142', '操作url：/admin.php?s=/Menu/add.html', '1', '1444721019');
INSERT INTO `ot_action_log` VALUES ('95', '1', '2', '0', 'member', '2', '合肥市在2015-10-13 15:24登录了后台', '1', '1444721061');
INSERT INTO `ot_action_log` VALUES ('96', '1', '9', '0', 'member', '9', '巢湖市在2015-10-13 16:20登录了后台', '1', '1444724419');
INSERT INTO `ot_action_log` VALUES ('97', '1', '1', '0', 'member', '1', 'admin在2015-10-13 16:36登录了后台', '1', '1444725411');
INSERT INTO `ot_action_log` VALUES ('98', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-13 17:17登录了后台', '1', '1444727830');
INSERT INTO `ot_action_log` VALUES ('99', '1', '1', '0', 'member', '1', 'admin在2015-10-14 08:55登录了后台', '1', '1444784138');
INSERT INTO `ot_action_log` VALUES ('100', '10', '1', '0', 'Menu', '143', '操作url：/admin.php?s=/Menu/add.html', '1', '1444784172');
INSERT INTO `ot_action_log` VALUES ('101', '1', '2', '0', 'member', '2', '合肥市在2015-10-14 08:57登录了后台', '1', '1444784224');
INSERT INTO `ot_action_log` VALUES ('102', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-14 15:23登录了后台', '1', '1444807429');
INSERT INTO `ot_action_log` VALUES ('103', '1', '9', '0', 'member', '9', '巢湖市在2015-10-15 14:56登录了后台', '1', '1444892181');
INSERT INTO `ot_action_log` VALUES ('104', '1', '1', '0', 'member', '1', 'admin在2015-10-15 15:04登录了后台', '1', '1444892684');
INSERT INTO `ot_action_log` VALUES ('105', '1', '1', '-1062730167', 'member', '1', 'admin在2015-10-15 15:20登录了后台', '1', '1444893621');
INSERT INTO `ot_action_log` VALUES ('106', '1', '1', '-1062730167', 'member', '1', 'admin在2015-10-15 15:27登录了后台', '1', '1444894023');
INSERT INTO `ot_action_log` VALUES ('107', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-15 15:53登录了后台', '1', '1444895605');
INSERT INTO `ot_action_log` VALUES ('108', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-15 16:08登录了后台', '1', '1444896502');
INSERT INTO `ot_action_log` VALUES ('109', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-15 16:11登录了后台', '1', '1444896716');
INSERT INTO `ot_action_log` VALUES ('110', '1', '1', '-1062730012', 'member', '1', 'admin在2015-10-15 16:54登录了后台', '1', '1444899254');
INSERT INTO `ot_action_log` VALUES ('111', '1', '1', '0', 'member', '1', 'admin在2015-10-19登录了后台', '1', '1445213631');
INSERT INTO `ot_action_log` VALUES ('112', '10', '1', '0', 'Menu', '144', '操作url：/admin.php?s=/Menu/add.html', '1', '1445213668');
INSERT INTO `ot_action_log` VALUES ('113', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445213753');
INSERT INTO `ot_action_log` VALUES ('114', '1', '9', '0', 'member', '9', '巢湖市在2015-10-19登录了后台', '1', '1445213765');
INSERT INTO `ot_action_log` VALUES ('115', '1', '1', '0', 'member', '1', 'admin在2015-10-19登录了后台', '1', '1445215092');
INSERT INTO `ot_action_log` VALUES ('116', '10', '1', '0', 'Menu', '145', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215156');
INSERT INTO `ot_action_log` VALUES ('117', '10', '1', '0', 'Menu', '145', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215169');
INSERT INTO `ot_action_log` VALUES ('118', '10', '1', '0', 'Menu', '146', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215207');
INSERT INTO `ot_action_log` VALUES ('119', '10', '1', '0', 'Menu', '147', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215342');
INSERT INTO `ot_action_log` VALUES ('120', '10', '1', '0', 'Menu', '148', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215388');
INSERT INTO `ot_action_log` VALUES ('121', '10', '1', '0', 'Menu', '149', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215430');
INSERT INTO `ot_action_log` VALUES ('122', '10', '1', '0', 'Menu', '150', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215461');
INSERT INTO `ot_action_log` VALUES ('123', '10', '1', '0', 'Menu', '151', '操作url：/admin.php?s=/Menu/add.html', '1', '1445215497');
INSERT INTO `ot_action_log` VALUES ('124', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445215544');
INSERT INTO `ot_action_log` VALUES ('125', '10', '1', '0', 'Menu', '147', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215745');
INSERT INTO `ot_action_log` VALUES ('126', '10', '1', '0', 'Menu', '148', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215750');
INSERT INTO `ot_action_log` VALUES ('127', '10', '1', '0', 'Menu', '149', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215756');
INSERT INTO `ot_action_log` VALUES ('128', '10', '1', '0', 'Menu', '150', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215769');
INSERT INTO `ot_action_log` VALUES ('129', '10', '1', '0', 'Menu', '151', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215774');
INSERT INTO `ot_action_log` VALUES ('130', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445215804');
INSERT INTO `ot_action_log` VALUES ('131', '10', '1', '0', 'Menu', '147', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215888');
INSERT INTO `ot_action_log` VALUES ('132', '10', '1', '0', 'Menu', '148', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215898');
INSERT INTO `ot_action_log` VALUES ('133', '10', '1', '0', 'Menu', '149', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445215903');
INSERT INTO `ot_action_log` VALUES ('134', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445215934');
INSERT INTO `ot_action_log` VALUES ('135', '10', '1', '0', 'Menu', '147', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445216474');
INSERT INTO `ot_action_log` VALUES ('136', '10', '1', '0', 'Menu', '148', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445216487');
INSERT INTO `ot_action_log` VALUES ('137', '10', '1', '0', 'Menu', '149', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445216497');
INSERT INTO `ot_action_log` VALUES ('138', '10', '1', '0', 'Menu', '152', '操作url：/admin.php?s=/Menu/add.html', '1', '1445217195');
INSERT INTO `ot_action_log` VALUES ('139', '10', '1', '0', 'Menu', '147', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445217222');
INSERT INTO `ot_action_log` VALUES ('140', '10', '1', '0', 'Menu', '148', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445217228');
INSERT INTO `ot_action_log` VALUES ('141', '10', '1', '0', 'Menu', '149', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445217236');
INSERT INTO `ot_action_log` VALUES ('142', '10', '1', '0', 'Menu', '151', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445217409');
INSERT INTO `ot_action_log` VALUES ('143', '10', '1', '0', 'Menu', '150', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445217416');
INSERT INTO `ot_action_log` VALUES ('144', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445217469');
INSERT INTO `ot_action_log` VALUES ('145', '1', '1', '-1062730068', 'member', '1', 'admin在2015-10-19登录了后台', '1', '1445240424');
INSERT INTO `ot_action_log` VALUES ('146', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445241391');
INSERT INTO `ot_action_log` VALUES ('147', '10', '1', '0', 'Menu', '153', '操作url：/admin.php?s=/Menu/add.html', '1', '1445248649');
INSERT INTO `ot_action_log` VALUES ('148', '1', '2', '0', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445248720');
INSERT INTO `ot_action_log` VALUES ('149', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-19登录了后台', '1', '1445248975');
INSERT INTO `ot_action_log` VALUES ('150', '10', '1', '0', 'Menu', '154', '操作url：/admin.php?s=/Menu/add.html', '1', '1445250444');
INSERT INTO `ot_action_log` VALUES ('151', '1', '2', '0', 'member', '2', '合肥市在2015-10-20登录了后台', '1', '1445326250');
INSERT INTO `ot_action_log` VALUES ('152', '10', '1', '0', 'Menu', '0', '操作url：/admin.php?s=/Menu/del/id/132.html', '1', '1445328677');
INSERT INTO `ot_action_log` VALUES ('153', '1', '9', '0', 'member', '9', '巢湖市在2015-10-20登录了后台', '1', '1445333619');
INSERT INTO `ot_action_log` VALUES ('154', '1', '1', '0', 'member', '1', 'admin在2015-10-21登录了后台', '1', '1445389519');
INSERT INTO `ot_action_log` VALUES ('155', '1', '2', '0', 'member', '2', '合肥市在2015-10-21登录了后台', '1', '1445389532');
INSERT INTO `ot_action_log` VALUES ('156', '1', '9', '0', 'member', '9', '巢湖市在2015-10-21登录了后台', '1', '1445392840');
INSERT INTO `ot_action_log` VALUES ('157', '1', '1', '0', 'member', '1', 'admin在2015-10-21登录了后台', '1', '1445393162');
INSERT INTO `ot_action_log` VALUES ('158', '10', '1', '0', 'Menu', '155', '操作url：/admin.php?s=/Menu/add.html', '1', '1445393231');
INSERT INTO `ot_action_log` VALUES ('159', '1', '2', '0', 'member', '2', '合肥市在2015-10-21登录了后台', '1', '1445393528');
INSERT INTO `ot_action_log` VALUES ('160', '1', '9', '0', 'member', '9', '巢湖市在2015-10-21登录了后台', '1', '1445393540');
INSERT INTO `ot_action_log` VALUES ('161', '1', '2', '-1062730068', 'member', '2', '合肥市在2015-10-22登录了后台', '1', '1445498960');
INSERT INTO `ot_action_log` VALUES ('162', '1', '2', '0', 'member', '2', '合肥市在2015-10-23登录了后台', '1', '1445585711');
INSERT INTO `ot_action_log` VALUES ('163', '1', '1', '0', 'member', '1', 'admin在2015-10-26登录了后台', '1', '1445820702');
INSERT INTO `ot_action_log` VALUES ('164', '10', '1', '0', 'Menu', '2', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445822032');
INSERT INTO `ot_action_log` VALUES ('165', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445822050');
INSERT INTO `ot_action_log` VALUES ('166', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445822075');
INSERT INTO `ot_action_log` VALUES ('167', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445822893');
INSERT INTO `ot_action_log` VALUES ('168', '1', '9', '0', 'member', '9', '巢湖市在2015-10-26登录了后台', '1', '1445828481');
INSERT INTO `ot_action_log` VALUES ('169', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445846018');
INSERT INTO `ot_action_log` VALUES ('170', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445846058');
INSERT INTO `ot_action_log` VALUES ('171', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445846094');
INSERT INTO `ot_action_log` VALUES ('172', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445846144');
INSERT INTO `ot_action_log` VALUES ('173', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445846198');
INSERT INTO `ot_action_log` VALUES ('174', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445846214');
INSERT INTO `ot_action_log` VALUES ('175', '10', '1', '0', 'Menu', '124', '操作url：/admin.php?s=/Menu/edit.html', '1', '1445846253');
INSERT INTO `ot_action_log` VALUES ('176', '1', '2', '0', 'member', '2', '合肥市在2015-10-26登录了后台', '1', '1445846343');
INSERT INTO `ot_action_log` VALUES ('177', '1', '1', '0', 'member', '1', 'admin在2015-11-05登录了后台', '1', '1446693288');
INSERT INTO `ot_action_log` VALUES ('178', '1', '2', '-1062730066', 'member', '2', '合肥市在2015-11-05登录了后台', '1', '1446693412');
INSERT INTO `ot_action_log` VALUES ('179', '1', '2', '-1062730066', 'member', '2', '合肥市在2015-11-05登录了后台', '1', '1446693932');
INSERT INTO `ot_action_log` VALUES ('180', '1', '1', '-1062730066', 'member', '1', 'admin在2015-11-05登录了后台', '1', '1446709341');
INSERT INTO `ot_action_log` VALUES ('181', '11', '1', '0', 'category', '40', '操作url：/admin.php?s=/Category/add.html', '1', '1447053374');
INSERT INTO `ot_action_log` VALUES ('182', '11', '1', '0', 'category', '41', '操作url：/admin.php?s=/Category/add.html', '1', '1447053402');
INSERT INTO `ot_action_log` VALUES ('183', '11', '1', '0', 'category', '42', '操作url：/admin.php?s=/Category/add.html', '1', '1447053438');
INSERT INTO `ot_action_log` VALUES ('184', '11', '1', '0', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1447053840');
INSERT INTO `ot_action_log` VALUES ('185', '11', '1', '0', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1447053888');
INSERT INTO `ot_action_log` VALUES ('186', '11', '1', '0', 'category', '2', '操作url：/admin.php?s=/Category/edit.html', '1', '1447053906');
INSERT INTO `ot_action_log` VALUES ('187', '11', '1', '0', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1447053922');
INSERT INTO `ot_action_log` VALUES ('188', '1', '1', '-1062730066', 'member', '1', 'admin在2015-11-09登录了后台', '1', '1447054511');
INSERT INTO `ot_action_log` VALUES ('189', '11', '1', '0', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1447060273');
INSERT INTO `ot_action_log` VALUES ('190', '11', '1', '0', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1447060279');
INSERT INTO `ot_action_log` VALUES ('191', '11', '1', '0', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1447060286');
INSERT INTO `ot_action_log` VALUES ('192', '1', '1', '-1062730048', 'member', '1', 'admin在2015-11-10登录了后台', '1', '1447121817');
INSERT INTO `ot_action_log` VALUES ('193', '1', '1', '-1062730105', 'member', '1', 'admin在2015-11-10登录了后台', '1', '1447122243');
INSERT INTO `ot_action_log` VALUES ('194', '1', '2', '0', 'member', '2', '合肥市在2015-11-10登录了后台', '1', '1447126020');
INSERT INTO `ot_action_log` VALUES ('195', '1', '2', '0', 'member', '2', '合肥市在2015-11-10登录了后台', '1', '1447126093');
INSERT INTO `ot_action_log` VALUES ('196', '10', '1', '0', 'Menu', '127', '操作url：/admin.php?s=/Menu/edit.html', '1', '1447135755');
INSERT INTO `ot_action_log` VALUES ('197', '1', '2', '0', 'member', '2', '合肥市在2015-11-10登录了后台', '1', '1447135819');
INSERT INTO `ot_action_log` VALUES ('198', '1', '1', '-1062730066', 'member', '1', 'admin在2015-11-10登录了后台', '1', '1447138892');
INSERT INTO `ot_action_log` VALUES ('199', '1', '1', '-1062730068', 'member', '1', 'admin在2015-11-10登录了后台', '1', '1447141397');
INSERT INTO `ot_action_log` VALUES ('200', '10', '1', '0', 'Menu', '156', '操作url：/admin.php?s=/Menu/add.html', '1', '1447144738');
INSERT INTO `ot_action_log` VALUES ('201', '10', '1', '0', 'Menu', '156', '操作url：/admin.php?s=/Menu/edit.html', '1', '1447144795');

-- ----------------------------
-- Table structure for ot_addons
-- ----------------------------
DROP TABLE IF EXISTS `ot_addons`;
CREATE TABLE `ot_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ot_addons
-- ----------------------------
INSERT INTO `ot_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_markdownpreview\":\"0\",\"editor_height\":\"460px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `ot_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `ot_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `ot_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `ot_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `ot_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for ot_ask
-- ----------------------------
DROP TABLE IF EXISTS `ot_ask`;
CREATE TABLE `ot_ask` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT ' 提问对象',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(100) NOT NULL DEFAULT '' COMMENT '行为描述',
  `sfz` varchar(150) NOT NULL COMMENT '行为规则',
  `email` varchar(255) DEFAULT NULL COMMENT '日志规则',
  `content` text NOT NULL COMMENT '类型',
  `code` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  `status` int(5) DEFAULT '0' COMMENT '审核类型 （-1审批不通过，1审批通过，2待办理，3办理完成，4退回）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ot_ask
-- ----------------------------
INSERT INTO `ot_ask` VALUES ('35', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('27', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('28', '2', 'asdfas', 'dfasdfas', null, 'fas', 'fasd', 'fasdfa', 'sdfasdf', '0', '4', '1444877007', '1445249657', '0', null);
INSERT INTO `ot_ask` VALUES ('29', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('30', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('31', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('32', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('33', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('34', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('36', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('37', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('38', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('39', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('40', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('41', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('42', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('43', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('44', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('45', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('46', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('47', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('48', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('49', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('50', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('51', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('52', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('53', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('54', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('55', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('56', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('57', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('58', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('59', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('60', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('61', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('62', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('63', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('64', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('65', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('66', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('67', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('68', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('69', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('70', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('71', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('72', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('73', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('74', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('75', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('76', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('77', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('78', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('79', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('80', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('81', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('82', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('83', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('84', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('85', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('86', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('87', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('88', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('89', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('90', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('91', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('92', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('93', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('94', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('95', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('96', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('97', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('98', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('99', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('100', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('101', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('102', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('103', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('104', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('105', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('106', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('107', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('108', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('109', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('110', '9', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '4', '1444876949', '1445844684', '1445828557', null);
INSERT INTO `ot_ask` VALUES ('111', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('112', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '4', '1444876949', '1447151682', '0', null);
INSERT INTO `ot_ask` VALUES ('113', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '0', '1444876949', null, null, null);
INSERT INTO `ot_ask` VALUES ('114', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '5', '1444876949', '1444900119', '1444900119', null);
INSERT INTO `ot_ask` VALUES ('115', '9', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '5', '1444876949', '1444895164', '1444895164', null);
INSERT INTO `ot_ask` VALUES ('116', '4', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '1', '1444876949', '1444879345', null, null);
INSERT INTO `ot_ask` VALUES ('117', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '1', '1444876949', '1445500523', null, null);
INSERT INTO `ot_ask` VALUES ('118', '2', '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '5', '1444876949', '1447151271', '1447151271', null);
INSERT INTO `ot_ask` VALUES ('119', null, '13131313123', '13313131', null, '12313', '123123123', '123123', '123123', '0', '1', '1444876949', '1444879167', null, null);
INSERT INTO `ot_ask` VALUES ('120', '2', '谷', '测试短信验证码', null, '13856090487', '3333', '333', '33', '0', '5', '1445241125', '1445248996', '1445248996', null);
INSERT INTO `ot_ask` VALUES ('121', '2', '13131313123', '12312', null, '312313', '13131', '31313', '11313131', '0', '0', '1445846413', null, null, null);
INSERT INTO `ot_ask` VALUES ('122', null, 'sf', 'A123', null, '1313', '123123', '123123', '123', '0', '0', '1445846425', null, null, null);
INSERT INTO `ot_ask` VALUES ('123', null, 'asdf', 'asdfas', null, 'dfasdf', 'asdfasdf', 'asdfa', 'sdfasf', '0', '0', '1445846573', null, null, null);
INSERT INTO `ot_ask` VALUES ('124', null, 'asdfa', 'sdfasdfa', null, 'sdfasdf', 'asf', 'asdf', 'asdfas', '0', '0', '1445846655', null, null, null);
INSERT INTO `ot_ask` VALUES ('125', null, 'asdfa', 'Adfasfas', null, 'fasf', 'asfafasf', '', 'asdf', '0', '0', '1445846837', null, null, null);
INSERT INTO `ot_ask` VALUES ('126', null, 'asdfasdfs', 'adfafasdds', null, 'fasfsd', 'sdf', 'asdfaasdfasd', 'fasdf', '0', '0', '1445846942', null, null, null);
INSERT INTO `ot_ask` VALUES ('127', null, 'asdfassdfa', 'sdfasdf', null, 'asdfas', 'dfasf', 'asdf', 'asfasdf', '0', '0', '1445846942', null, null, null);
INSERT INTO `ot_ask` VALUES ('128', null, 'asdfad', 'fasdfas', null, 'dfasdfasf', 'asfdas', 'dfasdf', 'asdf', '0', '0', '1445846942', null, null, null);
INSERT INTO `ot_ask` VALUES ('129', null, 'cccc', 'cc', null, 'ccc', 'cc', 'cc', 'cc', '0', '0', '1445846942', null, null, null);
INSERT INTO `ot_ask` VALUES ('130', null, 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '0', '1445846942', null, null, null);
INSERT INTO `ot_ask` VALUES ('131', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '5', '1445846942', '1447151384', '1447151384', null);
INSERT INTO `ot_ask` VALUES ('132', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '5', '1445846942', '1447150006', '1447150006', null);
INSERT INTO `ot_ask` VALUES ('133', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '1', '1445846942', '1447136665', null, null);
INSERT INTO `ot_ask` VALUES ('134', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '1', '1445846942', '1445907539', null, null);
INSERT INTO `ot_ask` VALUES ('135', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '1', '1445846942', '1445849122', null, null);
INSERT INTO `ot_ask` VALUES ('136', '2', 'asdfasdf', 'fasdf', null, 'sf', 'asdfsas', 'dfsf', 'sdfsdf', '0', '1', '1445846942', '1445849106', null, null);
INSERT INTO `ot_ask` VALUES ('137', '15', '张三', '大学生村官政策待遇问题', '安徽省合肥市潜山路', '13966859745', '340104198901012026', null, '尊敬的领导您好：\r\n    请问2013年选聘的大学生村官，至15年考核为称职及以上等次，即聘期满两年，在即将开始的2015年安徽省中小学教师招聘考试中能否享受文件中所说的：合成成绩加2分政策？谢谢！\r\n', '0', '0', '1447122181', null, null, '1');
INSERT INTO `ot_ask` VALUES ('138', null, '王雨', '关于港澳通行证续签建议', '安徽省合肥市', '13896502567', '340122198703024481', null, '尊敬的领导您好!\r\n我家亲戚面临这样一件事:\r\n我舅舅家女儿在国外上学，今年的4月初要回国。她回来想去趟香港但发现通行证过期需要续签，但宿松县出入管理局要求必须要有身份证原件方可续签。因她在国外，身份证自然无法提供，那么就无法办理.目前我的同事们有湖北的、湖南的，都可以在网上直接办理，且不需要身份证原件就可办理，请问为何我们安徽没有落实呢？李克强总理不是都说了要“大道至简吗”？所有行政审批手续都要简化吗？既然是续签，有户口本，有身份证复印件，为什么就一定要原件呢？实在不明白，请领导给予帮助解决，我相信这不是我一个人的心声，这是很多人的想法，但无可奈何罢了！期待我们的家乡发展更好！\r\n \r\n', '0', '0', '1447138495', null, null, '1');
INSERT INTO `ot_ask` VALUES ('139', null, '尤家花园', '玩在阜阳', '1', '13956070164', '340721198901313616', null, 'asfasfsadfs', '0', '0', '1447140504', null, null, '1');

-- ----------------------------
-- Table structure for ot_assist
-- ----------------------------
DROP TABLE IF EXISTS `ot_assist`;
CREATE TABLE `ot_assist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) DEFAULT NULL COMMENT '行为唯一标识',
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `explain` text,
  `reply` text COMMENT '类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_time` int(11) DEFAULT NULL,
  `jbr` varchar(255) DEFAULT NULL,
  `jbr_tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ot_assist
-- ----------------------------
INSERT INTO `ot_assist` VALUES ('39', '110', '8', '2', '协办原因', null, '1445331248', null, null, null);
INSERT INTO `ot_assist` VALUES ('40', '110', '9', '2', '协办原因协办原因协办原因协办原因协办原因', '<span style=\"color:#333333;font-family:\'Microsoft YaHei\', 微软雅黑;font-size:14.6667px;line-height:16px;background-color:#FFFFFF;\">你好！需要把数字证书拿过来做更新。明年还是要继续提交年报。</span>', '1445331472', '1445475343', '经办人', '195456456');

-- ----------------------------
-- Table structure for ot_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ot_attachment`;
CREATE TABLE `ot_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of ot_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for ot_attribute
-- ----------------------------
DROP TABLE IF EXISTS `ot_attribute`;
CREATE TABLE `ot_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of ot_attribute
-- ----------------------------
INSERT INTO `ot_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ot_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ot_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ot_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ot_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ot_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for ot_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_extend`;
CREATE TABLE `ot_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of ot_auth_extend
-- ----------------------------
INSERT INTO `ot_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `ot_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `ot_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `ot_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `ot_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `ot_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `ot_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `ot_auth_extend` VALUES ('1', '37', '1');
INSERT INTO `ot_auth_extend` VALUES ('3', '40', '1');
INSERT INTO `ot_auth_extend` VALUES ('3', '41', '1');
INSERT INTO `ot_auth_extend` VALUES ('3', '42', '1');
INSERT INTO `ot_auth_extend` VALUES ('4', '40', '1');
INSERT INTO `ot_auth_extend` VALUES ('4', '41', '1');
INSERT INTO `ot_auth_extend` VALUES ('4', '42', '1');

-- ----------------------------
-- Table structure for ot_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_group`;
CREATE TABLE `ot_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_auth_group
-- ----------------------------
INSERT INTO `ot_auth_group` VALUES ('1', 'admin', '1', '管理员', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `ot_auth_group` VALUES ('4', 'admin', '1', '二级用户', '省直下属部门，县区', '1', '1,2,7,8,10,11,15,16,18,217,222,223,225,226,228,231,232,233,235,237,238,239,240,241,242,243,245,246,247,248,249');
INSERT INTO `ot_auth_group` VALUES ('3', 'admin', '1', '一级用户', '省直，地市', '1', '1,2,7,8,10,11,15,16,18,195,217,221,223,224,225,226,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,245,246,247,248,249,250');
INSERT INTO `ot_auth_group` VALUES ('5', 'admin', '1', '审核编辑', '审核编辑', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,89,90,91,92,93,100,102,103,205,206,207,208,211,212,213,214,215,216,217,218');

-- ----------------------------
-- Table structure for ot_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_group_access`;
CREATE TABLE `ot_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_auth_group_access
-- ----------------------------
INSERT INTO `ot_auth_group_access` VALUES ('2', '3');
INSERT INTO `ot_auth_group_access` VALUES ('3', '4');
INSERT INTO `ot_auth_group_access` VALUES ('4', '4');
INSERT INTO `ot_auth_group_access` VALUES ('7', '4');
INSERT INTO `ot_auth_group_access` VALUES ('8', '4');
INSERT INTO `ot_auth_group_access` VALUES ('9', '4');
INSERT INTO `ot_auth_group_access` VALUES ('10', '4');
INSERT INTO `ot_auth_group_access` VALUES ('11', '4');
INSERT INTO `ot_auth_group_access` VALUES ('12', '4');
INSERT INTO `ot_auth_group_access` VALUES ('13', '4');
INSERT INTO `ot_auth_group_access` VALUES ('14', '3');
INSERT INTO `ot_auth_group_access` VALUES ('15', '3');
INSERT INTO `ot_auth_group_access` VALUES ('16', '3');
INSERT INTO `ot_auth_group_access` VALUES ('17', '3');
INSERT INTO `ot_auth_group_access` VALUES ('18', '3');
INSERT INTO `ot_auth_group_access` VALUES ('20', '5');
INSERT INTO `ot_auth_group_access` VALUES ('21', '3');
INSERT INTO `ot_auth_group_access` VALUES ('25', '3');
INSERT INTO `ot_auth_group_access` VALUES ('26', '3');
INSERT INTO `ot_auth_group_access` VALUES ('27', '3');
INSERT INTO `ot_auth_group_access` VALUES ('28', '3');
INSERT INTO `ot_auth_group_access` VALUES ('29', '3');
INSERT INTO `ot_auth_group_access` VALUES ('30', '3');
INSERT INTO `ot_auth_group_access` VALUES ('31', '3');
INSERT INTO `ot_auth_group_access` VALUES ('32', '3');
INSERT INTO `ot_auth_group_access` VALUES ('33', '3');
INSERT INTO `ot_auth_group_access` VALUES ('34', '3');
INSERT INTO `ot_auth_group_access` VALUES ('35', '3');
INSERT INTO `ot_auth_group_access` VALUES ('36', '3');
INSERT INTO `ot_auth_group_access` VALUES ('37', '3');
INSERT INTO `ot_auth_group_access` VALUES ('38', '3');
INSERT INTO `ot_auth_group_access` VALUES ('39', '3');

-- ----------------------------
-- Table structure for ot_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_rule`;
CREATE TABLE `ot_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_auth_rule
-- ----------------------------
INSERT INTO `ot_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容投稿', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('219', 'admin', '2', 'Admin/Article/ask_list', '问题', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Ask/index', '全部问题', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Ask/my', '待审批', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('222', 'admin', '2', 'Admin/Ask/index', '办事', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Ask/reply', '答复', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Ask/all', '未认领', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Ask/processing', '办理中', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Ask/done', '已回复', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('227', 'admin', '2', 'Admin/stats/index', '统计', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Ask/unsatisfied', '退回重办', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Ask/sp', ' 审批', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Ask/change', '更改受理单位', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Ask/action', '用户行为', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Ask/detail', '流程明细', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Ask/adopt', '认领', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Ask/assign_to', '指派', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Ask/answer', '审批答复', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Ask/call_back', '退回', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('237', 'admin', '1', 'Admin/Ask/re_do', '重办', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('238', 'admin', '2', 'Admin/Statistics/index', '统计通报', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('239', 'admin', '2', 'Admin/Opinion/index', '舆情研判', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Statistics/info_rank', '信息报送排行', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Statistics/ask_rank', '问政办理排行', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Statistics/satisfaction_rank', '网名满意度排行', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Opinion/collect', '舆情收集', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Opinion/research', '舆情判研', '-1', '');
INSERT INTO `ot_auth_rule` VALUES ('245', 'admin', '1', 'Admin/Statistics/index', '统计通报图表', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('246', 'admin', '1', 'Admin/Opinion/index', '舆情判研', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Ask/assist', '协办问题', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('248', 'admin', '1', 'Admin/Ask/call_assist', '请求协办', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Ask/do_assist', '协助办理', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('250', 'admin', '2', 'Admin/Ask/all', '办事平台', '1', '');
INSERT INTO `ot_auth_rule` VALUES ('251', 'admin', '1', 'Admin/Ask/unpass', '审批未通过', '1', '');

-- ----------------------------
-- Table structure for ot_category
-- ----------------------------
DROP TABLE IF EXISTS `ot_category`;
CREATE TABLE `ot_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of ot_category
-- ----------------------------
INSERT INTO `ot_category` VALUES ('2', 'default_blog', '新闻', '1', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '2', '1', '0', '1', '1', '', '1379475028', '1447053906', '1', '0', '');
INSERT INTO `ot_category` VALUES ('40', 'ahnews', '安徽要闻', '0', '0', '5', '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', '0', '2', '1', '0', '1', '', null, '1447053374', '1447060273', '1', '0', '');
INSERT INTO `ot_category` VALUES ('41', 'zcdt', '政策动态', '0', '0', '5', '', '', '', '', '', '', '', '2', '2', '2', '0', '2', '1', '0', '1', '', null, '1447053402', '1447060279', '1', '0', '');
INSERT INTO `ot_category` VALUES ('42', 'jhzx', '江淮资讯', '0', '0', '5', '', '', '', '', '', '', '', '2', '2', '2', '0', '2', '1', '0', '1', '', null, '1447053438', '1447060286', '1', '0', '');

-- ----------------------------
-- Table structure for ot_channel
-- ----------------------------
DROP TABLE IF EXISTS `ot_channel`;
CREATE TABLE `ot_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_channel
-- ----------------------------
INSERT INTO `ot_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `ot_channel` VALUES ('4', '0', '办事', '/Article/ask/', '0', '1444374692', '1444374692', '1', '0');
INSERT INTO `ot_channel` VALUES ('5', '0', '进度查询', '/Article/ask_list/', '0', '1444440253', '1444440390', '1', '0');

-- ----------------------------
-- Table structure for ot_config
-- ----------------------------
DROP TABLE IF EXISTS `ot_config`;
CREATE TABLE `ot_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_config
-- ----------------------------
INSERT INTO `ot_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '安徽省人民政府政务服务平台', '0');
INSERT INTO `ot_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '安徽省人民政府政务服务平台', '1');
INSERT INTO `ot_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '安徽省人民政府政务服务平台', '8');
INSERT INTO `ot_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `ot_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `ot_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `ot_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:默认\r\n2:厅局\r\n3:各市\r\n4:县区\r\n5:新闻头条', '3');
INSERT INTO `ot_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `ot_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `ot_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `ot_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `ot_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `ot_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `ot_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `ot_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '30', '10');
INSERT INTO `ot_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '0', '3');
INSERT INTO `ot_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `ot_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `ot_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `ot_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `ot_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `ot_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `ot_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `ot_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `ot_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '5', '0');
INSERT INTO `ot_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `ot_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '1', '1');
INSERT INTO `ot_config` VALUES ('38', 'DF_MB', '2', '答复模板', '2', '', '', '1444893694', '1444893694', '1', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '3');

-- ----------------------------
-- Table structure for ot_document
-- ----------------------------
DROP TABLE IF EXISTS `ot_document`;
CREATE TABLE `ot_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `bianji_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of ot_document
-- ----------------------------
INSERT INTO `ot_document` VALUES ('12', '1', '', 'test', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447054447', '1447054447', '-1', '0');
INSERT INTO `ot_document` VALUES ('13', '1', '', '600亿产业基金助皖企“调转促”', '40', '0', '', '0', '0', '2', '2', '2', '0', '1', '1', '0', '0', '143', '0', '0', '0', '1446998400', '1447061071', '1', '0');
INSERT INTO `ot_document` VALUES ('14', '1', '', '1213', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1446998400', '1447055001', '-1', '1');
INSERT INTO `ot_document` VALUES ('15', '1', '', '合肥“米”字高铁网落最后一笔', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1446998400', '1447060627', '1', '0');
INSERT INTO `ot_document` VALUES ('16', '1', '', '安徽将建2400所校园足球学校', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447060492', '1447060492', '2', '0');
INSERT INTO `ot_document` VALUES ('17', '1', '', '安徽元旦后实行新商业车险费率', '41', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447060542', '1447060542', '2', '0');
INSERT INTO `ot_document` VALUES ('18', '1', '', '最低工资上调 收入保障有“底气”', '41', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447060604', '1447060604', '2', '0');
INSERT INTO `ot_document` VALUES ('19', '1', '', '中央巡视工作专项检查组听取安徽巡视工作情况汇报', '40', '0', '', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '6', '0', '0', '0', '1447122446', '1447122446', '1', '0');
INSERT INTO `ot_document` VALUES ('20', '1', '', '济祁高速砀山段年底通车 开启“酥梨之乡”高速时代', '40', '0', '', '0', '0', '2', '2', '9', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1447084800', '1447124923', '1', '0');
INSERT INTO `ot_document` VALUES ('21', '1', '', '安徽省投资结构不断优化 前三季度民间投资占七成多', '40', '0', '', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447123427', '1447123427', '2', '0');
INSERT INTO `ot_document` VALUES ('22', '1', '', '安徽省艺考将全面实行专业课省统考制', '40', '0', '', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447123672', '1447123672', '2', '0');
INSERT INTO `ot_document` VALUES ('23', '1', '', '何必山等先进事迹巡回报告会在歙县举行', '40', '0', '', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1447123735', '1447123735', '2', '0');

-- ----------------------------
-- Table structure for ot_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ot_document_article`;
CREATE TABLE `ot_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of ot_document_article
-- ----------------------------
INSERT INTO `ot_document_article` VALUES ('12', '0', 'estset', '', '0');
INSERT INTO `ot_document_article` VALUES ('13', '0', '&lt;p&gt;\r\n	&lt;p style=&quot;text-align:center;font-family:\'Microsoft YaHei\', Arial;font-size:16px;&quot;&gt;\r\n		&lt;img style=&quot;height:auto;&quot; src=&quot;http://pic.pub.anhuinews.com/0/04/19/92/4199262_336596.jpg&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-align:center;background-color:#ffffff;text-indent:0em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		　全球化的双十一需要全球化的支付工具和支付服务。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		笔者了解到，支付宝已经在为190多个国家的支付宝用户提供支付服务，其中部分国家和地区已能使用本币支付。在原有全球主流支付机构的合作基础上，支付宝今年又新增接入十多个新的国际支付机构，这将使海外用户参与今年的天猫双十一时拥有更好的支付体验，歪果仁也能更方便地买买买了。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		从去年开始，天猫双十一已正式升级为全球化的双十一。今年双十一期间，全球参与热情进一步高涨。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		为了让海外用户可以便利地参与购物，支付宝在今年强化了与国际支付机构之间的合作。尤其在俄罗斯、巴西、印尼等大型新兴经济体，支付宝不仅接入当地最流行的电子支付方式，还提供钱包支付、网银支付和线下支付等多种方式选择。与此同时，在加拿大、欧洲、澳洲等发达市场，支付宝的脚步也在加速，目前已接入了多家本土网银、银行卡等的支付手段，使更多地区的用户可以直接用本地货币进行支付。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		同时，今年支付宝还在全球范围内大力推进国际用户快捷支付，使整体支付成功率提升了5个百分点，短短半年时间，已经有超过800万海外用户使用。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		目前支付宝在中国已经拥有超过4亿实名活跃用户，但对在中国大陆生活的外国人和港澳台人士来说，过去用支付宝只能依靠充值、转账等渠道实现资金进出。为了让海外在华用户也能和本地人一样，直接使用支付宝的各种生活服务，从今年10月的9.2版本开始，外国人和港澳台人士已经可以通过支付宝绑定超过20家中外银行在中国大陆发行的银行卡。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		据悉，11月即将推出的9.3版本还将有针对在中国大陆生活的外国人和台港澳提供更多重要更新。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;background-color:#ffffff;text-indent:2em;font-family:\'Microsoft YaHei\', Arial;color:#333333;font-size:16px;&quot;&gt;\r\n		蚂蚁金服国际事业部首席研究员孙彤表示：“支付宝作为世界上最多人在使用的第三方支付工具，我们要为世界各地的用户提供最优的支付体验和安全保障。同时，也要顺应每一个地区的消费习惯，让用户能用本土方式淘遍全球好货。”\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('16', '0', '&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 足球运动纳入到中考体育考试的选考项目中，同时鼓励学校将其作为学生综合素质评价的参考。近日，安徽省教育厅、省发改委、省财政厅等多部门联合下发加快校园足球发展的实施办法。根据规划，到2020年，全省将建设1000所左右校园足球特色学校，2025年达到2400所，重点建设7个左右高等学校高水平足球运动队。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　目前中考体育科目中，足球很少被列入考试项目，只有合肥等部分城市将足球纳入到选考项目中，但是选考的学生人数并不多。不过，从明年开始，足球在体育中考中所占的比重将加大。实施办法明确，从2016年起，将足球纳入全省初中毕业升学体育考试选考项目。同时，各地在研究制定本区域小学、初中、高中足球特长生招生政策时，还需要考虑与招生制度相适应的、有利于学生运动员成长的激励政策，允许足球特长生在升学录取时在一定范围内合理流动，获得良好的特长发展环境。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　除了纳入到考试中，足球也将作为综合素质评价的参考，写入学生的档案中。幼儿园、小学低年级可组织趣味性足球活动。小学3年级以上各年级，以及初中、高中阶段学校要组织班级、年级联赛，开展校际邀请赛、对抗赛等竞赛交流活动。高等学校要组织开展院系学生足球联赛和校际交流活动等。高校足球竞赛成绩要纳入高校体育工作考核评价体系。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　足球运动在中小学中推广较难，其中最大的一个困扰就是场地的限制，这个困境在今后将得到一定的改善。根据规划，今后校园足球活动的场地建设纳入到行政区域足球场地建设、城镇化和新农村建设总体规划，鼓励建设小型多样化足球场地设施。学校可与体育部门合作，将足球场建在学校或学校周边，各地依托学区建立青少年足球活动中心，同步推进学校足球场地向社会开放和社会体育场地设施向学校开放。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('14', '0', '123123213', '', '0');
INSERT INTO `ot_document_article` VALUES ('15', '0', '&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 近年来合肥高铁建设加速，“米”字形高铁网初步成形，但东北方向的最后一“撇”还没落笔。记者获悉，新建“合肥-宿迁-新沂-青岛铁路合肥-新沂段”项目已进入可行性研究阶段。铁路途经定远、明光、五河、泗县、泗洪、宿迁，在新沂接徐连客运专线至连云港，接在建青连铁路延伸至青岛。这条高铁项目一旦建成，合肥前往苏北、胶东半岛将更加便捷。今后，合肥人只需坐2-3个小时火车就可以到海边逛海滩、吃海鲜。 合肥-宿迁-新沂-青岛铁路 　　合肥到青岛欲建高铁开始可行性研究 　　11月2日，中铁第四勘察设计院专家来到新沂，现场讨论新建合肥至宿迁至青岛铁路合肥至新沂段的线路走向、线路与徐连客运专线的连接点和车站定位等问题。据悉，新建的“合肥-宿迁-新沂-青岛铁路合肥-新沂段”已进入可行性研究阶段。这条线路位于安徽省东北部和江苏省北部。线路起于安徽省合肥市，向北经定远、明光、五河、泗县、泗洪、宿迁后进入新沂，引入徐连客专新沂南站，线路全长317.204公里。线路南连合肥枢纽，与沪汉蓉铁路、合福铁路、商合杭铁路衔接，北段接入徐连客专新沂南站。 　　据规划，该项目全长约317千米，设计行车速度为350千米/小时，起自合肥，途经定远、明光、五河、泗县、泗洪、宿迁，在新沂接入徐连客运专线至连云港，接在建青连铁路延伸至青岛。 　　合肥坐火车2个小时到海边，3个小时到青岛 　　这条铁路修好后，从合肥出发，乘坐火车只要2个小时就能到达沿海城市连云港，这将成为合肥通往大海最快的陆路通道。而目前，合肥到连云港只有普快列车，耗时需要9-10个小时。 　　同时，合肥前往日照、青岛等山东半岛著名的旅游城市时间也将大幅缩短。 　　目前，合肥前往青岛虽然已开行动车，但需要经过济南，路程相对较远，最快也要5个多小时。而这条高铁修好后，合肥到青岛之间将几乎呈直线距离，列车运行时间也将缩短至3个小时左右。同时，合肥前往日照，也将结束不通火车的历史，行程耗时大约在2个半小时左右。 　　合肥“米”字型高铁网将成形 　　合肥-青岛高铁建成后，对合肥来说，“米”字型高铁网络将“写完最后一撇”，成为无死角放射状。 　　打开合肥的铁路版图我们可以看到，目前，合肥往北有合蚌铁路，往西北有即将开工的商合铁路，往西有合武铁路，往西南有即将开工的合安铁路，往南有今年刚刚通车的合福铁路，往东南有合杭铁路，往东边有早已通车多年的合宁铁路，仅东北方向尚为空白。一旦合肥-青岛高铁项目获批，并顺利开工建设，那么合肥高铁网将补上最后一撇，完成‘米’字型的形态。', '', '0');
INSERT INTO `ot_document_article` VALUES ('17', '0', '&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 日前，中国保监会公布全国第二批商业车险改革试点地区，将吉林、安徽、河南、湖北、湖南、广东、四川等12个地方的保监局辖区纳入商业车险费率改革试点。 11月3日，安徽保监局在商业车险改革新闻发布会上表示，安徽自明年元旦后将实行新商业车险条款费率，规范保费收取标准与风险程度相匹配。好车主：无赔款优待最高可享6折优惠\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　我国现行商业车险条款费率主要基于2006年中国保险行业协会制定的三套标准。此次商业车险试点改革将针对现有制度奖优罚劣不显著的特点，实行梯度化的商业车险条款费率。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　据悉，现行普通商业车险的最低折扣为七折，而实行新商业车险条款费率后，费率调整系数包括无赔款优待系数、自主核保系数、自主渠道系数等，其中无赔款优待系数根据车主的出险情况确定优惠折扣，如果车辆在上年没有出险记录，第二年可以享受8.5折优惠；连续2年没出险，享受7折优惠；连续3年没出险，保费可打6折。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　相对的，经常出险的车主将要面临保费梯度上涨的局面。出险1次的，次年保费保持不变；出险理赔超过5次的，次年保费将翻番。“一些出险多的车主为匹配风险程度应缴纳更多的保险费。而一些车主安全意识强、出险情况少，理应获得更为优惠的保费。”省保监局产险处章勇军处长表示，加上渠道系数和保险公司的自主定价折扣，车主还可享受到更大的优惠，当然经常出险的车主也可能面临更大的保费涨幅。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　&lt;strong&gt;选好车：差异化车险费率帮你选出安全车&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　新商业车险条款费率不仅可以发挥车险费率杠杆“奖优罚劣”作用，引导车主安全驾驶，降低出险频率，提升道路交通安全水平。还可以让消费者参考费率价格表，选择安全系数高、出险率低、维修成本低的车型。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　新的车险费率价格表会根据全国车险行业多年理赔数据，反映每款车型的出险率、安全状况、维修成本等信息。每一个车型都会有一个费率表，不同车型因出险率差异保险费率也会不同。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　出现率高、赔付率高的车型，车主在新车投保，或续保时保费会比出险率低、赔付率低的车型高出很多。章勇军介绍，通过车型定价，市民可以在同等价位的车型中选择费率低的车型。同时，也能推动汽车厂家降低零配件价格，提高汽车的易维护性。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　&lt;strong&gt;享实惠：车险保障范围扩大代位求偿不是摆设&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　据保监会统计，第一批试点地区，约77%的保险消费者车险保费比去年同期有所下降，23%的消费者保费同比上升，车险业务的单均保费同比下降约9%。安徽作为第二批试点地区，将于2016年1月1日实行新商业车险条款费率，从车险保障范围、索赔方式、保险金额确定等方面来看，此次车险费率改革对消费者将更加有利。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　现行普通商业车险行业条款中“高保低赔”、“无责不赔”等一直备受诟病，但商业车险改革后，车损险的保险金额、投保时车辆的实际价值以及发生全损时赔偿金额的计算基础将会有统一规定，以解决“高保低赔”问题；车辆未上牌情况下出险、双方事故自身车辆无责任、车上货物或人员意外撞击导致车损等均可获赔；直系亲属也可作为“三责险”的第三者赔付。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　值得一提的是，“代位求偿”将不再是摆设条款，车主车辆受损后即可以向责任方或责任方保险公司索赔，也可以向自己的保险公司申请先支付赔偿款，然后由保险公司代车主追讨保险赔偿金。保险公司不得拒绝车主行使代位求偿权。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　省保监局产险处副处长刘文表示，即将实行的新商业车险条款还扩大了车险的保障范围，将冰雹、台风、暴雪、沙尘暴等自然灾害、驾驶证失效或审验不合格等都纳入保险保障范围。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('18', '0', '&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 最低工资是什么，包不包括五险一金？&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　近日，我省再次调整最低工资标准。我省最低工资标准至少每两年调整一次，上一次调整日期为2013年7月1日。此次调整过后，我省月最低工资标准由原先的1260元、1040元、930元、860元四个档次，调整为1520元、1350元、1250元、1150元四个档次，合肥市区的最低工资标准执行第一档次的1520元/月，16元/小时，领跑全省。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　非全日制用工小时最低工资标准由原先的13元、11元、10元、9元四个档次调整为16元、14元、13元、12元四个档次。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　据了解，截至9月28日，全国各地月最低工资标准中，深圳以每月2030元居首位，上海以2020元位列次席，广东以1895元排名第三。据省人社厅劳动关系处副处长宫为厚介绍，此次调整后，我省最低工资标准大幅提高，在全国范围内排名跃居第16位。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　安徽大学社会学系副教授王云飞认为，最低工资标准并非越高越好，应该综合考虑经济发展水平、物价水平、平均工资水平和失业率等指标，既要与GDP增长保持同步，又不至于因通货膨胀导致劳动者相对收入降低。同时，应该协调劳资双方利益，既要保护低收入职工的基本权益不受侵害，又要考虑企业的承受能力。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　听说合肥市最低工资标准提高到1520元，合肥市某企业员工王军问道：“我每月基本工资扣除五险一金到手只有1200多元，最低工资上调我的工资会涨吗？最低工资是指应发工资还是实发工资？包不包括五险一金？ ”\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　对于王军的疑问，记者查阅了人社部公布的《最低工资规定》后得知，最低工资是指劳动者在法定工作时间或依法签订的劳动合同约定的工作时间内提供了正常劳动的前提下，用人单位依法应支付的最低劳动报酬。根据规定，下列情况不应计入最低工资范围：因延长工作时间支付的加班工资；中班、夜班、高温、低温、井下、有毒有害等特殊工作环境、条件下的津贴；法律、法规和国家规定的劳动者福利待遇等。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　实际上，对于五险一金是否包括在最低工资内，是由各地根据实际情况而定。从各地公布的情况来看，除北京、上海明确最低工资标准不含劳动者个人依法缴纳的社会保险费和住房公积金外，其他省份均将三险一金包含在最低工资内，我省也不例外。 “我省执行的最低工资其实是指应发工资，保险等个人缴付部分都包括在内。 ”宫为厚介绍。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　&lt;strong&gt;最低工资上调哪些人受益，影响几何？&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　“最低工资上调，我们能涨工资啦！ ”10月3日，合肥市蜀山区大学生特岗人员仇铸欣喜地告诉记者，他的工资是按照最低工资标准的两倍确定的，最低工资上调前他月工资2520元，上调后他能拿到3040元，每月收入增加了520元。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　蜀山区人社局就业促进科科长薛凯介绍，最低工资标准上调，直接受益的主要有两类人：一类是仇铸这样的大学生特岗人员，另一类是一些公益性岗位的工作人员，主要包括政府帮助就业的一些“4050”下岗失业人员。雇用了这些劳动者，用人单位和个人都能享受一定岗位补贴。 “因为他们的岗位补贴与最低工资标准挂钩，最低工资标准提高，他们的岗位补贴也会相应提高。”薛凯说，“目前，蜀山区共有公益性岗位就业者3000多人，大学生特岗人员63人。 ”\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　除了这些直接受益者外，最低工资标准的提高，也将间接影响很多企业和个人。“一些企业会把最低工资标准作为制定员工基本工资的参考，失业保险金、加班工资计算基数也常常与最低工资挂钩，实际上最低工资标准成为了一个重要的参考尺度，具有很强的传导性。 ”宫为厚说。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　对于一些参考最低工资标准制定基本工资的企业而言，最低工资标准提高，将相应地提高工资体系中最低档工资标准，从而推动企业中各薪等、薪级的工资水平提高。 提高最低工资标准，对领取失业保险金人员影响也很大，按照相关规定，全省失业保险金计发比例统一按照月最低工资标准的65%执行。最低工资标准提高，必然会相应地带动失业金标准提高。以合肥为例，原来最低工资1260元，失业保险金为819元，调整后最低工资1520元，失业保险随后也将会相应上调为988元，每月增长169元。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　&lt;strong&gt;最低工资仍然偏低，提高标准有何现实意义？&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　实际上，随着人们收入水平的普遍提高，绝大部分劳动者收入均高于最低工资标准。合肥市政务区某家政公司的一位负责人告诉记者，目前在合肥人力资源市场，保洁员的月工资一般不会低于1600元，保安的月工资至少要1800元，如果低于这个薪资水平，企业很难招到人。在广大低薪酬岗位工资水平普遍高于最低工资的情况下，最低工资标准的现实意义在哪？\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　王云飞认为，最低工资标准不断提高，反映了我省社会保障水平不断进步。但是即便提高后的最低工资标准，仍然与人们的实际需求有一定差距，现有的最低工资水平仅能满足低收入者的基本生活需要，还无法保证他们过上体面的生活。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　此外，一些低收入劳动者虽然表面上收入高于最低工资标准，但他的实际工作时间可能远不止8小时。比如一名保安虽然工资高于最低工资，但是他可能要经常上夜班，工作时间超过了12个小时。采访中，还有一些劳动者表示，加班没有加班费的情况很常见。 “完善最低工资制度，应该综合考虑工作时间、劳动强度、行业差距等因素，制定更加符合实际需求的标准。 ”王云飞说。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　宫为厚认为，实行最低工资标准，对于缓和劳资矛盾、保证低收入群体利益有着重要意义。当前人口红利正在消失，低层次的劳动者仍然是供大于求的，如果没有最低工资的保护，这部分人的工资会被压低。最低工资标准作为一种底线的保障，能够起到约束用人单位，保护劳动者基本权利的作用。按照有关规定，用人单位如违反最低工资标准规定，人社部门将责令其限期补发所欠劳动者工资，并可责令其按所欠工资额度的1至5倍支付劳动者赔偿金。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　2011年，省委、省政府印发《关于实施“十二五”居民收入倍增规划的指导意见》，要求“十二五”期间，最低工资标准年均增长15%以上。以合肥市为例，“十二五”期间，该市的月最低工资标准从2011年7月1日开始执行的1010元，上涨到今年11月1日开始执行的1520元，涨幅显著。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;background-color:#fafafa;text-indent:0px;color:#333333;&quot;&gt;\r\n	　　党的十八届五中全会提出了“共享发展”理念，坚持居民收入增长和经济增长同步、劳动报酬提高和劳动生产率提高同步，健全科学的工资水平决定机制、正常增长机制、支付保障机制，完善最低工资增长机制等。 “为了实现居民收入和劳动报酬的增长，让低收入劳动者及其家庭成员共享改革成果，需要结合当地经济社会发展情况，不断提高最低工资标准。同时，通过提高最低工资标准，引导企业随着经济效益和劳动生产率的提高，逐步增加职工工资，推动企业建立健全职工工资正常增长机制，促进企业发展成果共享，构建和谐劳动关系。 ”宫为厚说。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('19', '0', '&lt;p&gt;\r\n	　 &amp;nbsp; 按照中央巡视工作领导小组统一部署，中央巡视工作专项检查组11月7日至10日对我省巡视工作情况开展专项检查，9日上午在合肥听取安徽巡视工作情况汇报。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　省委书记王学军主持汇报会并汇报了省委履行党风廉政建设主体责任和2013年中央第七巡视组巡视反馈意见整改落实情况。中央巡视工作领导小组成员、中央巡视工作领导小组办公室主任黎晓宏讲话。省委常委、纪委书记王宾宜汇报全省巡视工作情况。省委常委、省委秘书长唐承沛，省委常委、组织部部长邓向阳出席汇报会。\r\n&lt;/p&gt;\r\n&lt;!--advertisement code begin--&gt;\r\n &lt;!--advertisement code end--&gt;\r\n&lt;p&gt;\r\n	　　王学军在汇报中说，党的十八大以来，安徽省委坚决贯彻中央决策部署，高度重视党风廉政建设，认真履行主体责任，全面推进从严治党。省委常委会坚持从自身做起，加强组织领导，注重系统谋划。省委主要负责同志认真履行第一责任人的职责，坚持重要工作亲自部署、重大问题亲自过问、重点环节亲自协调、重要案件亲自督办，推动全省上下形成一级抓一级、层层抓责任促落实的工作格局。中央第七巡视组向我省反馈巡视意见以来，省委坚持把整改工作作为重要任务，制定整改措施，严明整改责任，逐条逐项抓好落实。总的看，中央巡视组反馈中指出的问题，能立行立改的，已经基本整改到位；对体制性和需要长期努力解决的问题，已建立相应工作机制，正在全力推进，整改工作取得重要阶段性成果。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　王学军指出，今年以来，省委认真贯彻中央和中纪委决策部署，紧紧围绕落实主体责任和巡视问题的持续整改，重点抓了九个方面工作。一是深入学习贯彻习近平总书记系列重要讲话精神，运用马克思主义中国化最新成果武装头脑，立根固本，强筋补钙，坚定理想信念，进一步拧紧思想“总开关”。二是着眼反腐倡廉任务落实，建立健全制度，实施年度考核，严格责任追究，进一步压紧压实“两个责任”。三是切实加强省委常委班子建设，明确提出“六个坚持”、“九个不要”，大力加强民主集中制建设，严格落实党内组织生活制度，深入推进重大决策规范化，进一步发挥引领带动作用。四是认真贯彻好干部标准，树立正确用人导向，严把选人用人关口，坚决防止干部“带病提拔”，进一步打造对党忠诚、个人干净、敢于担当的干部队伍。五是扎实开展“三严三实”专题教育，突出问题导向，突出典型示范，突出“三个专项行动”，突出学用结合，进一步提振党员干部的精神状态。六是强化权力制约和监督，探索建立惩防并举、标本兼治的长效机制，进一步推进巡视、审计监督、重要岗位干部交流轮岗、制度规范“四个全覆盖”。七是加强纪检监察组织建设，深化纪检体制改革，改革完善纪检监察派驻机构，认真做好纪检监察机关“三转”工作，积极推进党的纪律检查工作双重领导体制，进一步提升监督执纪能力。八是坚持把纪律挺在前面，准确把握监督执纪“四种形态”的要求，大力加强纪律教育，持之以恒贯彻中央八项规定，严肃查处违纪行为，进一步加大监督执纪力度。九是始终高悬反腐利剑，进一步保持严惩腐败高压态势，让人民群众切实感受到反腐倡廉带来的新变化、新气象。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　王学军强调，要以此次专项检查为契机，认真落实全面从严治党主体责任，把抓好党建作为最大政绩，坚持思想建党和制度建党相结合，坚持党建工作和中心工作同谋划、同部署、同考核，真正做到守土有责、守土负责、守土尽责。要高度重视和全力做好巡视工作，认真执行《巡视工作条例》，依法依规开展巡视，创新巡视方式方法，健全巡视工作制度，确保如期实现巡视全覆盖。要坚持不懈加强反腐倡廉建设，坚决贯彻《廉洁自律准则》和《纪律处分条例》，坚持有腐必反、有贪必肃，进一步营造积极向上、风清气正、干事创业的良好政治生态。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　黎晓宏充分肯定了我省巡视工作取得的成效。他指出，安徽省委全面贯彻党的十八大和十八届三中、四中、五中全会精神，深入贯彻中央决策部署和习近平总书记系列重要讲话精神，认真履行全面从严治党主体责任，落实中央巡视工作方针，执行中央巡视工作条例，立场坚定、态度坚决、措施有力，推动巡视工作快速发展、全面进步。坚持把巡视整改作为重要任务，制定整改措施，细化整改任务，严明整改责任，整改成效显著，在落实主体责任、强化成果运用、深化巡视工作等方面积累了一些好的经验。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　黎晓宏强调，要落实主体责任、巩固巡视整改实效，贯彻巡视方针、全面推进巡视工作，聚焦全面从严治党、不断强化利剑作用。他指出，当前巡视工作发展进入了一个新的阶段，要认真学习领会中央要求，以贯彻“一准则、两条例”为契机，采取有力措施，巩固深化巡视工作，不断提高巡视震慑遏制治本作用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　一要找准巡视定位，提升巡视发现力。聚焦全面从严治党，突出党风廉政建设和反腐败斗争，紧扣“六大纪律”和“四个着力”，盯住“三个重点”，发现问题、形成震慑，倒逼改革、促进发展。二要落实主体责任，提升巡视统筹力。认真落实好“两汇报、一报备”等制度，切实把全面从严治党主体责任担当起来。进一步优化领导小组设置，研究巡视成果运用，发挥统筹作用，抓好组织实施，确保巡视工作决策部署落地。三要贯通“三项法规”，提升巡视执行力。贯彻巡视条例要与廉洁准则和纪律处分条例贯通起来，把廉洁准则和纪律处分条例的各项要求落实到巡视工作各环节，坚决维护党规党纪的严肃性、权威性。四要推进全覆盖，提升巡视威慑力。进一步加强组织领导，充实巡视力量，创新工作方式，灵活机动开展巡视，高标准落实全覆盖要求，切实提高巡视威慑力。五要加强机构建设，提高巡视协调力。按照党委工作部门的标准和架构建设巡视办，充分发挥统筹协调指导职能。巡视办要通过适当方式，了解和督促巡视发现问题的整改落实情况，切实推动问题解决，为全面从严治党提供有力支撑。他希望安徽弘扬优秀传统文化，传播不同历史朝代留下的廉政思想和孙叔敖、包拯、张廷玉等廉吏形象，借鉴南宋著名政治思想家吕本中“清、慎、勤”三字箴言，慎守规矩、清廉为官、勤勉尽责，打造忠诚干净担当的巡视干部队伍，锐意进取、改革创新，进一步取得巡视监督新成效，为全面从严治党作出新的更大贡献。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　中央巡视工作领导小组办公室副主任王瑛，中央巡视工作专项检查组成员，省委巡视工作领导小组成员，省委巡视组组长等参加会议。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('20', '0', '&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;div&gt;\r\n	&lt;div style=&quot;text-align:center;&quot;&gt;\r\n		&lt;img alt=&quot;济祁高速砀山段年底通车 开启“酥梨之乡”高速时代&quot; src=&quot;http://pic.anhuinews.com/0/04/19/93/4199383_924153.jpg&quot; /&gt; \r\n	&lt;/div&gt;\r\n	&lt;div style=&quot;text-align:center;&quot;&gt;\r\n		砀山收费站成为当地富民出入口\r\n	&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&amp;nbsp;\r\n	&lt;/div&gt;\r\n	&lt;div style=&quot;text-align:center;&quot;&gt;\r\n		&lt;img alt=&quot;济祁高速砀山段年底通车 开启“酥梨之乡”高速时代&quot; src=&quot;http://pic.anhuinews.com/0/04/19/93/4199384_177861.jpg&quot; /&gt; \r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	　　果类加工企业订单多了，生产积极性更高涨\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　中安在线讯 金秋十月，砀山县远近闻名的砀山梨子又爬满了树头，鲜嫩的要滴出水来，水果加工大户老刘爷迎来了丰收季。今年，老刘心里多了个盼头，听说济祁高速公路砀山段年底就要通车了，老刘和许多合作农户心里乐开了花，往后往外运梨子的交通成本要下降不少，说不定还能吸引一些企业来村里开厂呢。\r\n&lt;/p&gt;\r\n&lt;!--advertisement code begin--&gt;\r\n &lt;!--advertisement code end--&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　老刘名叫刘世礼，是当地水果加工大户。在砀山，和老刘一样靠梨吃饭的有百姓有成千上万名。砀山县以盛产酥梨闻名于世，享有“中国酥梨之乡”美誉，可砀山梨外销障碍之一就是交通不便。位于安徽省最北端的砀山县，地处皖、苏、鲁、豫四省七县交界处，此前一直处于高速公路“空白地带”，近百万亩连片果园年产各类水果30亿斤，其中酥梨年产6亿斤，可年出口量在400万斤左右，只占年产量的0.8%。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　但交通这个拦路虎终于要被赶走了，一提起即将于年底通车的济祁高速公路砀山段，老百姓脸上顿时绽放出喜悦之情。这条全长39.58公里的高速公路，不仅让“中国酥梨之乡”实现了高速公路“零”突破，而且为这座年产30亿斤各类水果的县城，提供了数个通南达北的致富”出入口”。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　“我们的新鲜水果和罐头向外销售时，要耗时2小时，走80多公里县道才能上高速。”提起昔日因交通不畅造成新鲜水果和水果加工品物流费用高的景况，刘世礼不禁皱起了眉头，每天来来回回在这条县道上走，日积月累也是笔不小的费用。“现在济祁高速砀山段就修在家门口，我们只要驱车5公里、10分钟就能驶上高速。并且高速公路开通绿色通道，对新鲜水果运输免费，仅物流成本方面的费用就降低了20%左右。”刘世礼对即将通车的济祁高速公路砀山段充满期待。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　同样充满期待的，还有合肥市民金女士。“砀山酥梨爽口脆甜，可合肥市面上就是买不到。砀山通了高速公路，不仅与省会合肥的距离缩短了一个多小时车程，而且砀山酥梨进入合肥市场也更加便捷”据悉，济祁高速公路砀山段纵贯砀山境内，路线北起鲁皖交界处的马良集，南接皖豫交界的堤湾处西，连接鲁皖豫三省，全线设2座主线收费站、2座匝道收费站和1处服务区，设计时速120公里/小时。通车后，当地果农和水果加工企业通过这条路，向北可至济南、天津、北京，向南可以到达合肥、南京、上海等方向。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　据省交通控股集团相关负责人介绍，目前，济祁高速公路砀山段已经通过交工验收，具备通车条件，计划年底通车运营。届时，合肥市民自驾前往砀山赏梨花品酥梨，可从合徐南高速转到界阜蚌高速、济祁高速永利段(年内通车)、砀山段，快捷到达砀山。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:left;&quot;&gt;\r\n	　　一路通，百业兴。济祁高速砀山段的建成通车，将为砀山带来一个高速时代。当地交通部门负责人表示，因为有了高速公路，县里招商引资步伐迈得更快了，已经有数家水果加工企业、物流公司前来接洽业务。因为有了高速公路，沿线果农、企业物流运输成本大为降低，许多果农一改以往路边摆摊销售开始了网络订单销售。同时，沿线芒砀山等旅游资源也将得到更好地开发。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('21', '0', '&lt;p&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 记者日前从省发改委获悉，今年以来，我省着力发挥投资对经济增长的关键作用，不断优化投资结构，民间投资、技改投资占比提高，投资运行总体平稳，发展活力不断增强。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　省发改委固投处负责人介绍，前三季度全省固定资产投资17677.8亿元，增长13.4%，高于全国3.1个百分点，增幅在全国投资额靠前的10个省份中居第5位，增速较为平稳。在优化投资结构方面，突出表现为民间投资和技改投资占比提高。前三季度全省民间投资12817.7亿元，增长18.8%，高于全部投资增幅5.4个百分点，占比由上年同期的69.2%提高到72.5%。技改投资4248.4亿元，增长18.4%，占比由上年同期的23.2%提高到24%，反映产业升级逐步推进。\r\n&lt;/p&gt;\r\n&lt;!--advertisement code begin--&gt;\r\n &lt;!--advertisement code end--&gt;\r\n&lt;p&gt;\r\n	　　目前，制造业、基础设施、房地产投资占全部投资的75%，三季度以来三大领域投资增速均有所加快。其中，基础设施投资2967.8亿元，增长19.3%，比上半年加快1.6个百分点，对全部投资增长的贡献率达到23%，较好地发挥了投资稳定器的作用。制造业投资7066.2亿元，增长13.8%，比上半年加快1.7个百分点，说明企业投资信心有所恢复。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('22', '0', '&lt;p&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 与往年最大的不同是，根据教育部有关逐步扩大普通高考中省级艺术类统考科类和适用高校范围的要求，我省自2016年开始在原有美术与设计类、音乐类专业省统考的基础上组织实施舞蹈类、戏剧影视类专业省统考，并逐步扩大省统考适用高校范围。这也意味着，自2016年起，我省普通高考艺术类全面实行专业课省统考，共设置八个组考模块，分别对应教育部公布的专业目录中的相关艺术类专业。艺术类考生可兼报文史或理工类，还可以兼报不同模块的专业考试。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　记者从省教育招生考试院获悉，省考试院负责统一制定各模块的考试说明、命制有关试题、组织相关科目的评分评卷工作，各考点承担相关考务组织工作。省统考设置八个组考模块。\r\n&lt;/p&gt;\r\n&lt;!--advertisement code begin--&gt;\r\n &lt;!--advertisement code end--&gt;\r\n&lt;p&gt;\r\n	　　模块一对应的本科专业为播音与主持艺术，专科专业为播音与主持等。 2015年12月26日开始考试，考试地点在安徽师范大学花津校区。考试科目为5个，分别为形象气质、作品朗读、新闻播报、即兴评述和模拟主持，满分300分。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块二对应的本科专业为广播电视编导、戏剧影视文学、艺术史论、戏剧学、电影学，专科专业为影视编导等。 2016年1月1日考试。考试地点在蚌埠学院。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块三对应的本科专业为表演(体育舞蹈、健美操)，专科专业为体育艺术表演等。2016年1月5日开始考试，考试地点在安庆师范学院龙山校区。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块四对应的本科专业为舞蹈表演、舞蹈学、舞蹈编导，专科专业为舞蹈表演、国际标准舞、舞蹈编导、舞蹈教育等。2016年1月23日开始考试，考试地点在阜阳师范学院清河校区。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块五对应的本科专业为戏剧影视导演、表演(影视戏剧表演、戏曲表演)，专科专业为表演艺术、戏剧影视表演等。考试时间为2016年1月15日，考试地点在安徽大学的磬苑校区。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块六对应的本科专业为书法学。 2016年1月3日考试，考试地点在淮北师范大学的相山校区。考试科目有3个，分别为楷书临帖、隶书临帖和创作，满分300分。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块七对应的本科专业为美术学、绘画、雕塑、摄影、中国画、艺术设计学、视觉传达设计、环境设计、产品设计等。考生按其所属地区分片考试，考生于2015年12月11～12日持第二代居民身份证到指定考点报到。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　模块八对应的本科专业为音乐学、音乐表演、作曲与作曲技术理论、录音艺术；专科专业为现代流行音乐、作曲技术等。考试地点在安徽师范大学的赭山校区。考试时间从2016年1月7日开始。\r\n&lt;/p&gt;', '', '0');
INSERT INTO `ot_document_article` VALUES ('23', '0', '&lt;p&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;11月5日，何必山、陈贵春、王宜国同志先进事迹巡回报告总结座谈会在歙县举行，标志着首轮全省“三严三实”专题教育巡回报告会圆满结束。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　“68天里，我常常自言自语，半夜醒来脑海里都是报告会，都在思考怎样才能讲好，才能不负重托不辱使命。”报告团成员刘长卫感慨万千。报告团成立之初，任职霍山县委党校副校长的他，信心不足，担心自己的讲述不能打动人。\r\n&lt;/p&gt;\r\n&lt;!--advertisement code begin--&gt;\r\n &lt;!--advertisement code end--&gt;\r\n&lt;p&gt;\r\n	　　报告团巡讲启动后，每到一处都引起强烈反响，受到热烈欢迎。“专注的眼神、流淌的热泪，都在说明英雄在人们心中，并未远去。我们报告团的所有成员，包括我在内也越来越自信，越来越成熟。 ”刘长卫说。报告团在68天的时间里，试讲百余场，举行25场正式报告，足迹遍布全省16个市，感动数以万计听众。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　和刘长卫感同身受的还有报告团成员钱开铭，他是佛子岭镇佛子岭社区党总支书记，在千余人面前作报告，他有点犯怵。“我没有见过大场面，不太会讲普通话，年纪又大，更担心忘词，是听众给了我信心和勇气。 ”钱开铭说。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　在一次一次的改稿中，在一遍又一遍的讲述中，钱开铭感受到真情实感是报告会最高的技巧。他是英雄遇难时的亲历者。在流泪中感悟，在流泪中追忆，“我这两三个月流的眼泪，比我以前40多年流的泪还要多。 ”钱开铭说。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　何剑锋是英雄何必山的儿子。在淮北师范大学读大二的他，在巡回报告中迅速成长。他告诉记者，父亲去世后，他陷入到了人生最黑暗的日子里，“社会各界的关心关爱，点亮了我心中的明灯，温暖了我的心灵。 ”\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　巡回报告会期间，天气渐渐转凉，何剑锋穿着短袖衬衫没有时间去买秋冬衣服。“宣教处的叔叔，给我买了一件外套，他们像家人一样无微不至地照顾我。 ”何剑锋感动地说。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　从紧张焦虑到自信满满，从拘谨生硬到收放自如，6位报告团成员一次比一次讲得好。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　报告团成员刘妍是霍山县市场监督管理局工作人员，也是“大春子”生前的同事。她坦言，刚开始她有点想不通，为什么大春子那么好，却遭遇如此不幸。她在一次一次地试讲打磨中，感悟到，好人并不是为了得到好报而成为好人，而是他坚信做好人是正确的人生选择。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　“我的材料修改20多次，光题目就修改5次，从8月28日报告团成立以来，每一天我的心都是绷紧的。 ”报告团成员刘晓牧说。报告团每到一处，都受到了听众的热烈欢迎，这让他十分感动。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　霍山县电视台记者江维也是报告团的成员之一，她克服了种种困难，在报告团中发挥着“牵针引线”的重要作用。“我的孩子今年才两岁，刚开始我有点打退堂鼓，也担心自己讲不好，后来真的是被英雄感动，被大家感动，一步一个脚印走到今天。 ”江维说。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　6位报告团成员纷纷表示，参加报告团是他们人生的一笔精神财富，学习英雄就要把英雄的精神带到本职工作中，用自己的实际行动向逝去的英雄致敬。\r\n&lt;/p&gt;', '', '0');

-- ----------------------------
-- Table structure for ot_document_download
-- ----------------------------
DROP TABLE IF EXISTS `ot_document_download`;
CREATE TABLE `ot_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of ot_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for ot_file
-- ----------------------------
DROP TABLE IF EXISTS `ot_file`;
CREATE TABLE `ot_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of ot_file
-- ----------------------------

-- ----------------------------
-- Table structure for ot_hooks
-- ----------------------------
DROP TABLE IF EXISTS `ot_hooks`;
CREATE TABLE `ot_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_hooks
-- ----------------------------
INSERT INTO `ot_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `ot_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `ot_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `ot_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `ot_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `ot_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `ot_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `ot_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `ot_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo', '1');
INSERT INTO `ot_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `ot_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');

-- ----------------------------
-- Table structure for ot_member
-- ----------------------------
DROP TABLE IF EXISTS `ot_member`;
CREATE TABLE `ot_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `pid` int(11) DEFAULT NULL,
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `contact` varchar(255) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `type` int(3) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ot_member
-- ----------------------------
INSERT INTO `ot_member` VALUES ('1', null, 'admin', '0', '0000-00-00', '', '140', '46', '0', '1442801047', '3232237228', '1447141397', '1', null, null, null);
INSERT INTO `ot_member` VALUES ('2', null, '合肥市', '0', '0000-00-00', '', '110', '57', '0', '0', '0', '1447135819', '1', '123', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('3', '2', '肥东县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('4', '2', '肥西县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('8', '2', '庐江县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('7', '2', '长丰县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('9', '2', '巢湖市', '0', '0000-00-00', '', '50', '11', '0', '0', '0', '1445828481', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('10', '2', '瑶海区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('11', '2', '庐阳区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('12', '2', '蜀山区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '3');
INSERT INTO `ot_member` VALUES ('13', '2', '包河区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '12311', '12312313', '3');
INSERT INTO `ot_member` VALUES ('14', null, '省发改委', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '1');
INSERT INTO `ot_member` VALUES ('15', null, '省教育厅', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '1');
INSERT INTO `ot_member` VALUES ('16', null, '省科技厅', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '1');
INSERT INTO `ot_member` VALUES ('17', null, '省经济和信息化委', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '1');
INSERT INTO `ot_member` VALUES ('18', null, '国家统计局安徽调查总队', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', null, null, '1');
INSERT INTO `ot_member` VALUES ('20', '0', '编辑', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', 'asdfa', '0', '4');
INSERT INTO `ot_member` VALUES ('25', null, '淮北市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('26', null, '亳州市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('27', null, '宿州市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('28', null, '蚌埠市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('29', null, '阜阳市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '1254246636', '2');
INSERT INTO `ot_member` VALUES ('30', null, '淮南市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', null);
INSERT INTO `ot_member` VALUES ('31', null, '滁州市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', null);
INSERT INTO `ot_member` VALUES ('32', null, '六安市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('33', null, '马鞍山市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('34', null, '芜湖市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('35', null, '宣城市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('36', null, '铜陵市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('37', null, '池州市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('38', null, '安庆市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('39', null, '黄山市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('43', '25', '相山区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('44', '25', '杜集区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('45', '25', '烈山区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('46', '25', '濉溪县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('47', '26', '谯城区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('48', '26', '蒙城县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('49', '26', '涡阳县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('50', '26', '利辛县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('51', '27', '埇桥区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('52', '27', '砀山县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('55', '27', '泗县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '154513455', '2');
INSERT INTO `ot_member` VALUES ('54', '27', '灵璧县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('56', '27', '萧县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '43513454', '2');
INSERT INTO `ot_member` VALUES ('57', '28', '龙子湖区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('58', '28', '蚌山区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('59', '28', '禹会区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('60', '28', '淮上区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '1435134531', '2');
INSERT INTO `ot_member` VALUES ('61', '28', '五河县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');
INSERT INTO `ot_member` VALUES ('62', '28', '固镇县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '41345345', '2');
INSERT INTO `ot_member` VALUES ('63', '28', '怀远县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '5141345', '2');
INSERT INTO `ot_member` VALUES ('64', '29', '颍州区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '143514355', '2');
INSERT INTO `ot_member` VALUES ('65', '29', '颍泉区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '562566', '2');
INSERT INTO `ot_member` VALUES ('66', '29', '颖东区', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '1534531', '2');
INSERT INTO `ot_member` VALUES ('67', '29', '颍上县', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '5456156', '2');
INSERT INTO `ot_member` VALUES ('68', '29', '界首市', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '张三', '2147483647', '2');

-- ----------------------------
-- Table structure for ot_menu
-- ----------------------------
DROP TABLE IF EXISTS `ot_menu`;
CREATE TABLE `ot_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_menu
-- ----------------------------
INSERT INTO `ot_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('2', '内容投稿', '0', '2', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `ot_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `ot_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `ot_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `ot_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `ot_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `ot_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `ot_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `ot_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `ot_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `ot_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `ot_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('124', '办事平台', '0', '10', 'Ask/all', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('125', '全部问题', '124', '0', 'Ask/index', '0', '', '办事大厅', '0', '1');
INSERT INTO `ot_menu` VALUES ('126', '全部问题', '125', '0', 'Ask/index', '0', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('127', '待审批', '124', '1', 'Ask/my', '0', '', '我的问题', '0', '1');
INSERT INTO `ot_menu` VALUES ('129', '未认领', '124', '0', 'Ask/all', '0', '未认领问题', '办事大厅', '0', '1');
INSERT INTO `ot_menu` VALUES ('130', '办理中', '124', '2', 'Ask/processing', '0', '', '我的问题', '0', '1');
INSERT INTO `ot_menu` VALUES ('131', '已回复', '124', '3', 'Ask/done', '0', '', '我的问题', '0', '1');
INSERT INTO `ot_menu` VALUES ('155', '协助办理', '135', '0', 'Ask/do_assist', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('133', '退回重办', '124', '4', 'Ask/unsatisfied', '0', '', '我的问题', '0', '1');
INSERT INTO `ot_menu` VALUES ('135', '用户行为', '124', '999', 'Ask/action', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('136', ' 审批', '135', '0', 'Ask/sp', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('137', '答复', '135', '0', 'Ask/reply', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('138', '更改受理单位', '135', '0', 'Ask/change', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('139', '流程明细', '135', '0', 'Ask/detail', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('140', '认领', '135', '0', 'Ask/adopt', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('141', '指派', '135', '0', 'Ask/assign_to', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('142', '审批答复', '135', '0', 'Ask/answer', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('143', '退回', '135', '0', 'Ask/call_back', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('144', '重办', '135', '0', 'Ask/re_do', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('145', '统计通报', '0', '11', 'Statistics/index', '0', '统计通报系统', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('146', '舆情研判', '0', '12', 'Opinion/index', '0', '舆情研判系统', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('147', '信息报送排行', '145', '1', 'Statistics/info_rank', '0', '统计通报系统', '统计通报', '0', '1');
INSERT INTO `ot_menu` VALUES ('148', '问政办理排行', '145', '2', 'Statistics/ask_rank', '0', '统计通报系统', '统计通报', '0', '1');
INSERT INTO `ot_menu` VALUES ('149', '网名满意度排行', '145', '3', 'Statistics/satisfaction_rank', '0', '统计通报系统', '统计通报', '0', '1');
INSERT INTO `ot_menu` VALUES ('150', '舆情收集', '146', '1', 'Opinion/collect', '0', '', '舆情研判', '0', '1');
INSERT INTO `ot_menu` VALUES ('151', '舆情判研', '146', '0', 'Opinion/index', '0', '', '舆情研判', '0', '1');
INSERT INTO `ot_menu` VALUES ('152', '统计通报图表', '145', '0', 'Statistics/index', '0', '统计通报图表', '统计通报', '0', '1');
INSERT INTO `ot_menu` VALUES ('153', '协办问题', '124', '0', 'Ask/assist', '0', '协办问题', '协办问题', '0', '1');
INSERT INTO `ot_menu` VALUES ('154', '请求协办', '135', '0', 'Ask/call_assist', '1', '', '', '0', '1');
INSERT INTO `ot_menu` VALUES ('156', '审批未通过', '124', '0', 'Ask/unpass', '0', '', '办事大厅', '0', '1');

-- ----------------------------
-- Table structure for ot_message_num
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_num`;
CREATE TABLE `ot_message_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` char(100) NOT NULL,
  `num` char(6) NOT NULL,
  `lastupdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_message_num
-- ----------------------------
INSERT INTO `ot_message_num` VALUES ('22', '13856090487', '1054', '1445243554');
INSERT INTO `ot_message_num` VALUES ('23', '13856090487', '2175', '1445243622');
INSERT INTO `ot_message_num` VALUES ('24', '13856090487', '8605', '1445243686');
INSERT INTO `ot_message_num` VALUES ('25', '13856090487', '3312', '1445243921');
INSERT INTO `ot_message_num` VALUES ('26', '13856090487', '3280', '1445244133');
INSERT INTO `ot_message_num` VALUES ('27', '1385609487', '8150', '1445248467');
INSERT INTO `ot_message_num` VALUES ('28', '13856090487', '4229', '1445248581');
INSERT INTO `ot_message_num` VALUES ('29', '13856090487', '2728', '1445248687');
INSERT INTO `ot_message_num` VALUES ('30', '13856090487', '6175', '1445248718');
INSERT INTO `ot_message_num` VALUES ('31', '13856090487', '1816', '1445248746');
INSERT INTO `ot_message_num` VALUES ('32', '13856090487', '5628', '1445248755');
INSERT INTO `ot_message_num` VALUES ('33', '13856090487', '3771', '1445248916');
INSERT INTO `ot_message_num` VALUES ('34', '13856090487', '8309', '1445249168');
INSERT INTO `ot_message_num` VALUES ('35', '13856090487', '4704', '1445249297');
INSERT INTO `ot_message_num` VALUES ('36', '13856090487', '9273', '1445249625');
INSERT INTO `ot_message_num` VALUES ('37', '13956070164', '5113', '1445249739');
INSERT INTO `ot_message_num` VALUES ('38', '13956070164', '626', '1445249854');
INSERT INTO `ot_message_num` VALUES ('39', '13956070164', '5979', '1445250027');
INSERT INTO `ot_message_num` VALUES ('40', '13956070164', '6667', '1445250183');
INSERT INTO `ot_message_num` VALUES ('41', '13956070164', '8649', '1445250196');
INSERT INTO `ot_message_num` VALUES ('42', '13956070164', '9344', '1445250467');
INSERT INTO `ot_message_num` VALUES ('43', '13956070164', '108', '1445250471');
INSERT INTO `ot_message_num` VALUES ('44', '13956070164', '5602', '1445250491');
INSERT INTO `ot_message_num` VALUES ('45', '13856090487', '3182', '1445302132');
INSERT INTO `ot_message_num` VALUES ('46', '13856090487', '8654', '1445303206');
INSERT INTO `ot_message_num` VALUES ('47', '13856090487', '7817', '1445303293');
INSERT INTO `ot_message_num` VALUES ('48', '13856090487', '788', '1445303481');
INSERT INTO `ot_message_num` VALUES ('49', '13856090487', '6520', '1445303557');
INSERT INTO `ot_message_num` VALUES ('50', '13856090487', '8830', '1445303656');
INSERT INTO `ot_message_num` VALUES ('51', '13856090487', '4935', '1445303689');
INSERT INTO `ot_message_num` VALUES ('52', '13856090487', '9662', '1445303716');
INSERT INTO `ot_message_num` VALUES ('53', '13856090487', '9545', '1445303743');
INSERT INTO `ot_message_num` VALUES ('54', '13856090487', '7462', '1445304006');
INSERT INTO `ot_message_num` VALUES ('55', '13856090487', '8047', '1445304476');
INSERT INTO `ot_message_num` VALUES ('56', '13856090487', '4465', '1445306164');
INSERT INTO `ot_message_num` VALUES ('57', '13856090487', '5285', '1445306205');
INSERT INTO `ot_message_num` VALUES ('58', '13856090487', '3688', '1445327105');
INSERT INTO `ot_message_num` VALUES ('59', '13856090487', '1481', '1445327124');
INSERT INTO `ot_message_num` VALUES ('60', '13856090487', '7459', '1445327454');
INSERT INTO `ot_message_num` VALUES ('61', '13856090487', '9944', '1445328688');
INSERT INTO `ot_message_num` VALUES ('62', '13856090487', '7910', '1445328716');
INSERT INTO `ot_message_num` VALUES ('63', '13856090487', '3544', '1445328982');
INSERT INTO `ot_message_num` VALUES ('64', '13856090487', '3430', '1445329157');

-- ----------------------------
-- Table structure for ot_model
-- ----------------------------
DROP TABLE IF EXISTS `ot_model`;
CREATE TABLE `ot_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of ot_model
-- ----------------------------
INSERT INTO `ot_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `ot_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `ot_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '0', 'MyISAM');

-- ----------------------------
-- Table structure for ot_picture
-- ----------------------------
DROP TABLE IF EXISTS `ot_picture`;
CREATE TABLE `ot_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_picture
-- ----------------------------
INSERT INTO `ot_picture` VALUES ('1', '/Uploads/Picture/2015-11-09/56404d49c1d73.jpg', '', '4a285ca232e250dcfbc1b5a570e725a0', '037ab04687c80c0246bfca3411fd16bec290ecca', '1', '1447054665');

-- ----------------------------
-- Table structure for ot_process
-- ----------------------------
DROP TABLE IF EXISTS `ot_process`;
CREATE TABLE `ot_process` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '关联用户uid',
  `aid` int(11) DEFAULT NULL COMMENT '关联问题id',
  `status` int(5) NOT NULL COMMENT '审核类型 （0审批不通过，1审批通过，2待办理，3办理完成，4退回）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_uid` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ot_process
-- ----------------------------
INSERT INTO `ot_process` VALUES ('59', '2', '120', '4', '1445248953', '2', '回复成功');
INSERT INTO `ot_process` VALUES ('58', '2', '120', '1', '1445241418', '2', '审核通过');
INSERT INTO `ot_process` VALUES ('57', '2', '28', '60', '1444955559', '2', '合肥市: 退回重办原因');
INSERT INTO `ot_process` VALUES ('56', '2', '114', '5', '1444900119', '2', '合肥市 发布留言到网站');
INSERT INTO `ot_process` VALUES ('55', null, '28', '4', '1444898421', '2', '回复成功');
INSERT INTO `ot_process` VALUES ('54', null, '114', '4', '1444898191', '2', '回复成功');
INSERT INTO `ot_process` VALUES ('53', '9', '115', '5', '1444895164', '2', '合肥市 发布留言到网站');
INSERT INTO `ot_process` VALUES ('50', '4', '116', '1', '1444879345', '2', '合肥市将问题指派到肥西县');
INSERT INTO `ot_process` VALUES ('51', null, '115', '4', '1444893007', '9', '回复成功');
INSERT INTO `ot_process` VALUES ('52', null, '115', '4', '1444895038', '9', '回复成功');
INSERT INTO `ot_process` VALUES ('49', '0', '119', '1', '1444879167', '2', '合肥市将问题指派到');
INSERT INTO `ot_process` VALUES ('48', '2', '118', '10', '1444879076', '2', '审核未通过 未通过原因');
INSERT INTO `ot_process` VALUES ('47', '2', '119', '1', '1444878915', '2', null);
INSERT INTO `ot_process` VALUES ('46', '2', '116', '1', '1444878903', '2', null);
INSERT INTO `ot_process` VALUES ('45', '2', '114', '1', '1444878893', '2', null);
INSERT INTO `ot_process` VALUES ('44', '9', '115', '1', '1444878876', '2', '合肥市将问题指派到巢湖市');
INSERT INTO `ot_process` VALUES ('43', '2', '115', '1', '1444878607', '2', null);
INSERT INTO `ot_process` VALUES ('42', '2', '28', '1', '1444878097', '2', null);
INSERT INTO `ot_process` VALUES ('60', '2', '120', '5', '1445248996', '2', '合肥市 发布留言到网站');
INSERT INTO `ot_process` VALUES ('61', '2', '28', '4', '1445249657', '2', '重新办理成功');
INSERT INTO `ot_process` VALUES ('62', '2', '110', '1', '1445310213', '2', '审核通过');
INSERT INTO `ot_process` VALUES ('63', '8', '110', '1', '1445331248', '2', '合肥市 请求 庐江县 协办该问题！');
INSERT INTO `ot_process` VALUES ('64', '9', '110', '1', '1445331472', '2', '合肥市 请求 巢湖市 协办该问题！');
INSERT INTO `ot_process` VALUES ('65', '9', '110', '1', '1445475343', '9', '巢湖市: 回复协办意见！');
INSERT INTO `ot_process` VALUES ('66', '2', '117', '1', '1445500523', '2', '审核通过');
INSERT INTO `ot_process` VALUES ('67', '9', '110', '1', '1445828520', '2', '合肥市 将留言指派到 巢湖市');
INSERT INTO `ot_process` VALUES ('68', '9', '110', '4', '1445828540', '9', '回复成功');
INSERT INTO `ot_process` VALUES ('69', '9', '110', '5', '1445828557', '2', '合肥市 发布留言到网站');
INSERT INTO `ot_process` VALUES ('70', '9', '110', '60', '1445844628', null, '网友打分：不满意，原因：不满意原因不满意原因不满意原因不满意原因');
INSERT INTO `ot_process` VALUES ('71', '9', '110', '4', '1445844684', '9', '重新办理成功');
INSERT INTO `ot_process` VALUES ('72', '2', '136', '1', '1445849106', '2', '合肥市 认领了该留言');
INSERT INTO `ot_process` VALUES ('73', '2', '135', '1', '1445849122', '2', '合肥市 认领了该留言');
INSERT INTO `ot_process` VALUES ('74', '2', '134', '1', '1445907539', '2', '合肥市 认领了该留言');
INSERT INTO `ot_process` VALUES ('75', '2', '133', '1', '1447136665', '2', '合肥市 认领了该留言');
INSERT INTO `ot_process` VALUES ('76', '2', '132', '0', '1447136776', '2', '合肥市 认领了该留言');
INSERT INTO `ot_process` VALUES ('77', '2', '132', '10', '1447138698', '2', '审批未通过 未通过原因未通过原因未通过原因未通过原因');
INSERT INTO `ot_process` VALUES ('78', '2', '131', '0', '1447140241', '1', '将留言指派到 合肥市');
INSERT INTO `ot_process` VALUES ('79', '2', '132', '5', '1447150006', '1', 'admin 发布留言到网站');
INSERT INTO `ot_process` VALUES ('80', '2', '118', '5', '1447151271', '1', 'admin 发布留言到网站');
INSERT INTO `ot_process` VALUES ('81', '2', '131', '10', '1447151350', '2', '未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因未通过原因');
INSERT INTO `ot_process` VALUES ('82', '2', '131', '5', '1447151384', '1', 'admin 发布留言到网站');
INSERT INTO `ot_process` VALUES ('83', '2', '112', '10', '1447151465', '2', '阿萨德法师打发');
INSERT INTO `ot_process` VALUES ('84', '2', '112', '60', '1447151555', '1', 'admin: 阿萨德法师打发');
INSERT INTO `ot_process` VALUES ('85', '2', '112', '4', '1447151682', '2', '重新办理成功');

-- ----------------------------
-- Table structure for ot_reply
-- ----------------------------
DROP TABLE IF EXISTS `ot_reply`;
CREATE TABLE `ot_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) DEFAULT NULL COMMENT '行为唯一标识',
  `uid` int(11) DEFAULT NULL,
  `explain` text,
  `reply_content` text COMMENT '类型',
  `remarks` text,
  `transactor` varchar(20) DEFAULT NULL,
  `transactor_tel` varchar(15) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ot_reply
-- ----------------------------
INSERT INTO `ot_reply` VALUES ('35', '115', '9', '<p>\r\n	尊敬的用户您好：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	', '<p>\r\n	尊敬的用户您好：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	', '备注', '经办人', '联系方式', '1444893007', null);
INSERT INTO `ot_reply` VALUES ('36', '115', '2', '<p>\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">办理情况：</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">阿萨德法师打发</span> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">阿萨德法师</span> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">201.450</span> \r\n</p>', '<p>\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">办理情况：</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">阿萨德法师打发</span> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">阿萨德法师</span> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<span style=\"color:#404040;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;font-size:14px;font-weight:bold;line-height:30px;background-color:#F6F6F6;\">201.450</span> \r\n</p>', '', '经办人', '联系方式', '1444895164', null);
INSERT INTO `ot_reply` VALUES ('37', '114', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>asdfasdfa</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '经办人', '13956070164', '1444900119', null);
INSERT INTO `ot_reply` VALUES ('38', '28', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '', '经办人', '139560070166', '1444898421', null);
INSERT INTO `ot_reply` VALUES ('39', '120', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '33', '33', '33', '1445248996', null);
INSERT INTO `ot_reply` VALUES ('40', '28', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	11111111111111111111111111111111\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	11111111111111111111111111111111111\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '111111', '经办人111', '139560070166111', '1445249657', null);
INSERT INTO `ot_reply` VALUES ('41', '110', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '123123', '123', '12312', '1445828557', null);
INSERT INTO `ot_reply` VALUES ('42', '110', '9', '<p>\r\n	<strong>尊敬的网友：111111111111111111111111</strong>\r\n</p>\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>1112112121</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	<strong>12321111111111111111111111111</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '撒的发生的是的发生', '发的货', '阿萨德发', '1445844684', null);
INSERT INTO `ot_reply` VALUES ('43', '118', '1', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	', '111', '阿萨德法师打发', '111', '1447151271', null);
INSERT INTO `ot_reply` VALUES ('44', '131', '1', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<strong>尊敬的网友</strong><strong>尊敬的网友</strong><strong>尊敬的网友</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<strong>尊敬的网友</strong><strong>尊敬的网友</strong><strong>尊敬的网友</strong><strong>尊敬的网友</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '1111', '111', '111', '1447151384', null);
INSERT INTO `ot_reply` VALUES ('45', '112', '2', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<div style=\"text-align:center;\">\r\n		<span style=\"line-height:1.5;\"></span>\r\n	</div>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '<p>\r\n	<strong>尊敬的网友：</strong> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您好！\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<h2 style=\"text-align:center;font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n		重新办理\r\n	</h2>\r\n	<div style=\"text-align:center;\">\r\n		<span style=\"line-height:1.5;\"></span>\r\n	</div>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>办理人：XXX</strong> \r\n</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>2015.10.12</strong> \r\n</p>', '重新办理', '重新办理', '重新办理', '1447151682', null);

-- ----------------------------
-- Table structure for ot_score
-- ----------------------------
DROP TABLE IF EXISTS `ot_score`;
CREATE TABLE `ot_score` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ask_id` int(11) unsigned DEFAULT NULL,
  `scores` decimal(3,0) unsigned zerofill DEFAULT NULL,
  `lastupdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_score
-- ----------------------------
INSERT INTO `ot_score` VALUES ('14', '26', '000', '1444640074');
INSERT INTO `ot_score` VALUES ('15', '120', '100', '1445249685');
INSERT INTO `ot_score` VALUES ('16', '110', '000', '1445844628');

-- ----------------------------
-- Table structure for ot_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_admin`;
CREATE TABLE `ot_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ot_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for ot_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_app`;
CREATE TABLE `ot_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of ot_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for ot_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_member`;
CREATE TABLE `ot_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ot_ucenter_member
-- ----------------------------
INSERT INTO `ot_ucenter_member` VALUES ('1', 'admin', 'dba1f2b355020ca960aab274c992cf73', 'wangsong1233276@sina.com', '', '1442801047', '0', '1447141397', '3232237228', '1442801047', '1');
INSERT INTO `ot_ucenter_member` VALUES ('2', '合肥市', '15f61c11ca0ba54277f3841ba11053ee', 'h@zf.com', '', '1443057312', '0', '1447135819', '0', '1443057312', '1');
INSERT INTO `ot_ucenter_member` VALUES ('3', '肥东县', '15f61c11ca0ba54277f3841ba11053ee', 'fd@123.com', '', '1442890436', '0', '0', '0', '1442890436', '1');
INSERT INTO `ot_ucenter_member` VALUES ('4', '肥西县', '15f61c11ca0ba54277f3841ba11053ee', 'fx@1.com', '', '1442913624', '0', '0', '0', '1442913624', '1');
INSERT INTO `ot_ucenter_member` VALUES ('5', 'dfasdfa', '15f61c11ca0ba54277f3841ba11053ee', 'asdf@fsf.com', '', '1442913687', '0', '0', '0', '1442913687', '1');
INSERT INTO `ot_ucenter_member` VALUES ('6', 'tetsteteste', '15f61c11ca0ba54277f3841ba11053ee', 'leibiya110@sinal.com', '', '1442913938', '0', '0', '0', '1442913938', '1');
INSERT INTO `ot_ucenter_member` VALUES ('7', '长丰县', '15f61c11ca0ba54277f3841ba11053ee', '12312@sina.com', '', '1442914024', '0', '0', '0', '1442914024', '1');
INSERT INTO `ot_ucenter_member` VALUES ('8', '庐江县', '15f61c11ca0ba54277f3841ba11053ee', '123121@sina.com', '', '1442914044', '0', '0', '0', '1442914044', '1');
INSERT INTO `ot_ucenter_member` VALUES ('9', '巢湖市', '15f61c11ca0ba54277f3841ba11053ee', '2312@sina.com', '', '1442914063', '0', '1445828481', '0', '1442914063', '1');
INSERT INTO `ot_ucenter_member` VALUES ('10', '瑶海区', '15f61c11ca0ba54277f3841ba11053ee', '123123@sina.com', '', '1442914082', '0', '0', '0', '1442914082', '1');
INSERT INTO `ot_ucenter_member` VALUES ('11', '庐阳区', '15f61c11ca0ba54277f3841ba11053ee', 'S@SINA.COM', '', '1442914111', '0', '0', '0', '1442914111', '1');
INSERT INTO `ot_ucenter_member` VALUES ('12', '蜀山区', '15f61c11ca0ba54277f3841ba11053ee', 'xx12@SINA.COM', '', '1442914142', '0', '0', '0', '1442914142', '1');
INSERT INTO `ot_ucenter_member` VALUES ('13', '包河区', '70318ff390712e475e36884c4e6cfb50', 'wa111csns@sina.com', '11', '1442996066', '0', '0', '0', '1442996066', '1');
INSERT INTO `ot_ucenter_member` VALUES ('14', '省发改委', '15f61c11ca0ba54277f3841ba11053ee', 'fgw@zf.com', '', '1442915220', '0', '0', '0', '1442915220', '1');
INSERT INTO `ot_ucenter_member` VALUES ('15', '省教育厅', '15f61c11ca0ba54277f3841ba11053ee', 'jyt@zf.com', '', '1442915249', '0', '0', '0', '1442915249', '1');
INSERT INTO `ot_ucenter_member` VALUES ('16', '省科技厅', '15f61c11ca0ba54277f3841ba11053ee', 'kjt@zf.com', '', '1442915271', '0', '0', '0', '1442915271', '1');
INSERT INTO `ot_ucenter_member` VALUES ('17', '省经济和信息化委', '15f61c11ca0ba54277f3841ba11053ee', 'xxh@zfw.com', '', '1442915293', '0', '0', '0', '1442915293', '1');
INSERT INTO `ot_ucenter_member` VALUES ('18', '国家统计局安徽调查总队', '15f61c11ca0ba54277f3841ba11053ee', 'tjj@zf.com', '', '1442915317', '0', '0', '0', '1442915317', '1');
INSERT INTO `ot_ucenter_member` VALUES ('19', '法法师', '15f61c11ca0ba54277f3841ba11053ee', 'leibiya110@sina.com', '', '1442996889', '0', '0', '0', '1442996889', '1');
INSERT INTO `ot_ucenter_member` VALUES ('20', '编辑', '15f61c11ca0ba54277f3841ba11053ee', 'leisbiya110@sina.com', '', '1443432685', '0', '0', '0', '1443432685', '1');
INSERT INTO `ot_ucenter_member` VALUES ('21', '其他', '15f61c11ca0ba54277f3841ba11053ee', 'leisbiyca110@sina.com', '', '1443433285', '0', '0', '0', '1443433285', '1');
INSERT INTO `ot_ucenter_member` VALUES ('22', '123123', '15f61c11ca0ba54277f3841ba11053ee', 'wangsoasdfngc1233276@sina.com', '', '1446778603', '0', '0', '0', '1446778603', '1');
INSERT INTO `ot_ucenter_member` VALUES ('23', 'ssss', '15f61c11ca0ba54277f3841ba11053ee', 'wangsongcc1233276@sina.comcss', '', '1446778663', '0', '0', '0', '1446778663', '1');
INSERT INTO `ot_ucenter_member` VALUES ('24', '123123123', '15f61c11ca0ba54277f3841ba11053ee', 'wangsongccccccc1233276@sina.comc', '', '1446778698', '0', '0', '0', '1446778698', '1');
INSERT INTO `ot_ucenter_member` VALUES ('25', '淮北市', '15f61c11ca0ba54277f3841ba11053ee', '2562462456@qq.com', '', '1447139417', '3232237230', '0', '0', '1447139417', '1');
INSERT INTO `ot_ucenter_member` VALUES ('26', '亳州市', '15f61c11ca0ba54277f3841ba11053ee', '2652625245@qq.com', '', '1447139737', '3232237230', '0', '0', '1447139737', '1');
INSERT INTO `ot_ucenter_member` VALUES ('27', '宿州市', '15f61c11ca0ba54277f3841ba11053ee', '35626522@qq.com', '', '1447139780', '3232237230', '0', '0', '1447139780', '1');
INSERT INTO `ot_ucenter_member` VALUES ('28', '蚌埠市', '15f61c11ca0ba54277f3841ba11053ee', '36572567@qq.com', '', '1447139812', '3232237230', '0', '0', '1447139812', '1');
INSERT INTO `ot_ucenter_member` VALUES ('29', '阜阳市', '15f61c11ca0ba54277f3841ba11053ee', '562562476@qq.com', '', '1447139848', '3232237230', '0', '0', '1447139848', '1');
INSERT INTO `ot_ucenter_member` VALUES ('30', '淮南市', '15f61c11ca0ba54277f3841ba11053ee', '256265145@qq.com', '', '1447139933', '3232237230', '0', '0', '1447139933', '1');
INSERT INTO `ot_ucenter_member` VALUES ('31', '滁州市', '15f61c11ca0ba54277f3841ba11053ee', '2453453245@qq.com', '', '1447139987', '3232237230', '0', '0', '1447139987', '1');
INSERT INTO `ot_ucenter_member` VALUES ('32', '六安市', '15f61c11ca0ba54277f3841ba11053ee', '65462456@qq.com', '', '1447140092', '3232237230', '0', '0', '1447140092', '1');
INSERT INTO `ot_ucenter_member` VALUES ('33', '马鞍山市', '15f61c11ca0ba54277f3841ba11053ee', '62456456@qq.com', '', '1447140129', '3232237230', '0', '0', '1447140129', '1');
INSERT INTO `ot_ucenter_member` VALUES ('34', '芜湖市', '15f61c11ca0ba54277f3841ba11053ee', '12341234@qq.com', '', '1447140162', '3232237230', '0', '0', '1447140162', '1');
INSERT INTO `ot_ucenter_member` VALUES ('35', '宣城市', '15f61c11ca0ba54277f3841ba11053ee', '45213543@qq.com', '', '1447140197', '3232237230', '0', '0', '1447140197', '1');
INSERT INTO `ot_ucenter_member` VALUES ('36', '铜陵市', '15f61c11ca0ba54277f3841ba11053ee', '62546456@qq.com', '', '1447140233', '3232237230', '0', '0', '1447140233', '1');
INSERT INTO `ot_ucenter_member` VALUES ('37', '池州市', '15f61c11ca0ba54277f3841ba11053ee', '2556265@qq.com', '', '1447140326', '3232237230', '0', '0', '1447140326', '1');
INSERT INTO `ot_ucenter_member` VALUES ('38', '安庆市', '15f61c11ca0ba54277f3841ba11053ee', '24565425@qq.com', '', '1447140357', '3232237230', '0', '0', '1447140357', '1');
INSERT INTO `ot_ucenter_member` VALUES ('39', '黄山市', '15f61c11ca0ba54277f3841ba11053ee', '365246524@qq.com', '', '1447140417', '3232237230', '0', '0', '1447140417', '1');
INSERT INTO `ot_ucenter_member` VALUES ('40', '1231312', '15f61c11ca0ba54277f3841ba11053ee', 'wangsongasdfs276@sina.com', '', '1447142348', '0', '0', '0', '1447142348', '1');
INSERT INTO `ot_ucenter_member` VALUES ('41', 'asdfasd', '15f61c11ca0ba54277f3841ba11053ee', 'wangso1ngcc1233276@sina.com', '', '1447142593', '0', '0', '0', '1447142593', '1');
INSERT INTO `ot_ucenter_member` VALUES ('42', '1231231', '8e3a422a440a289a42f791d2f74060a1', 'wangsongcc123s3276@sina.comc', '', '1447142658', '0', '0', '0', '1447142658', '1');
INSERT INTO `ot_ucenter_member` VALUES ('43', '相山区', '15f61c11ca0ba54277f3841ba11053ee', '64516156@qq.com', '', '1447143040', '3232237230', '0', '0', '1447143040', '1');
INSERT INTO `ot_ucenter_member` VALUES ('44', '杜集区', '15f61c11ca0ba54277f3841ba11053ee', '56246254@qq.com', '', '1447143239', '3232237230', '0', '0', '1447143239', '1');
INSERT INTO `ot_ucenter_member` VALUES ('45', '烈山区', '15f61c11ca0ba54277f3841ba11053ee', '625245@qq.com', '', '1447143278', '3232237230', '0', '0', '1447143278', '1');
INSERT INTO `ot_ucenter_member` VALUES ('46', '濉溪县', '15f61c11ca0ba54277f3841ba11053ee', '5625454@qq.com', '', '1447143332', '3232237230', '0', '0', '1447143332', '1');
INSERT INTO `ot_ucenter_member` VALUES ('47', '谯城区', '15f61c11ca0ba54277f3841ba11053ee', '6246546345@qq.com', '', '1447143368', '3232237230', '0', '0', '1447143368', '1');
INSERT INTO `ot_ucenter_member` VALUES ('48', '蒙城县', '15f61c11ca0ba54277f3841ba11053ee', '6265254@qq.com', '', '1447143397', '3232237230', '0', '0', '1447143397', '1');
INSERT INTO `ot_ucenter_member` VALUES ('49', '涡阳县', '15f61c11ca0ba54277f3841ba11053ee', '652456@qq.com', '', '1447143444', '3232237230', '0', '0', '1447143444', '1');
INSERT INTO `ot_ucenter_member` VALUES ('50', '利辛县', '15f61c11ca0ba54277f3841ba11053ee', '2452@qq.com', '', '1447143479', '3232237230', '0', '0', '1447143479', '1');
INSERT INTO `ot_ucenter_member` VALUES ('51', '埇桥区', '15f61c11ca0ba54277f3841ba11053ee', '2565462@qq.com', '', '1447143533', '3232237230', '0', '0', '1447143533', '1');
INSERT INTO `ot_ucenter_member` VALUES ('52', '砀山县', '15f61c11ca0ba54277f3841ba11053ee', '624562456@qq.com', '', '1447143575', '3232237230', '0', '0', '1447143575', '1');
INSERT INTO `ot_ucenter_member` VALUES ('55', '泗县', '15f61c11ca0ba54277f3841ba11053ee', '6245624@qq.com', '', '1447144160', '3232237230', '0', '0', '1447144160', '1');
INSERT INTO `ot_ucenter_member` VALUES ('54', '灵璧县', '15f61c11ca0ba54277f3841ba11053ee', '6535645@qq.com', '', '1447143647', '3232237230', '0', '0', '1447143647', '1');
INSERT INTO `ot_ucenter_member` VALUES ('56', '萧县', '15f61c11ca0ba54277f3841ba11053ee', '435134@qq.com', '', '1447144183', '3232237230', '0', '0', '1447144183', '1');
INSERT INTO `ot_ucenter_member` VALUES ('57', '龙子湖区', '15f61c11ca0ba54277f3841ba11053ee', '5461345@qq.com', '', '1447144279', '3232237230', '0', '0', '1447144279', '1');
INSERT INTO `ot_ucenter_member` VALUES ('58', '蚌山区', '15f61c11ca0ba54277f3841ba11053ee', '246525465@qq.com', '', '1447144312', '3232237230', '0', '0', '1447144312', '1');
INSERT INTO `ot_ucenter_member` VALUES ('59', '禹会区', '15f61c11ca0ba54277f3841ba11053ee', '34513451@qq.com', '', '1447144388', '3232237230', '0', '0', '1447144388', '1');
INSERT INTO `ot_ucenter_member` VALUES ('60', '淮上区', '15f61c11ca0ba54277f3841ba11053ee', '5256145@qq.com', '', '1447144444', '3232237230', '0', '0', '1447144444', '1');
INSERT INTO `ot_ucenter_member` VALUES ('61', '五河县', '15f61c11ca0ba54277f3841ba11053ee', '65424@qq.com', '', '1447144483', '3232237230', '0', '0', '1447144483', '1');
INSERT INTO `ot_ucenter_member` VALUES ('62', '固镇县', '15f61c11ca0ba54277f3841ba11053ee', '5154@qq.com', '', '1447144512', '3232237230', '0', '0', '1447144512', '1');
INSERT INTO `ot_ucenter_member` VALUES ('63', '怀远县', '15f61c11ca0ba54277f3841ba11053ee', '6542656@qq.com', '', '1447144541', '3232237230', '0', '0', '1447144541', '1');
INSERT INTO `ot_ucenter_member` VALUES ('64', '颍州区', '15f61c11ca0ba54277f3841ba11053ee', '65265@qq.com', '', '1447144651', '3232237230', '0', '0', '1447144651', '1');
INSERT INTO `ot_ucenter_member` VALUES ('65', '颍泉区', '15f61c11ca0ba54277f3841ba11053ee', '546245@qq.com', '', '1447144746', '3232237230', '0', '0', '1447144746', '1');
INSERT INTO `ot_ucenter_member` VALUES ('66', '颖东区', '15f61c11ca0ba54277f3841ba11053ee', '1345435@qq.com', '', '1447144936', '3232237230', '0', '0', '1447144936', '1');
INSERT INTO `ot_ucenter_member` VALUES ('67', '颍上县', '15f61c11ca0ba54277f3841ba11053ee', '624564@qq.com', '', '1447146481', '3232237230', '0', '0', '1447146481', '1');
INSERT INTO `ot_ucenter_member` VALUES ('68', '界首市', '15f61c11ca0ba54277f3841ba11053ee', '62652@qq.com', '', '1447146513', '3232237230', '0', '0', '1447146513', '1');

-- ----------------------------
-- Table structure for ot_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_setting`;
CREATE TABLE `ot_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of ot_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ot_url
-- ----------------------------
DROP TABLE IF EXISTS `ot_url`;
CREATE TABLE `ot_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of ot_url
-- ----------------------------

-- ----------------------------
-- Table structure for ot_userdata
-- ----------------------------
DROP TABLE IF EXISTS `ot_userdata`;
CREATE TABLE `ot_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_userdata
-- ----------------------------
