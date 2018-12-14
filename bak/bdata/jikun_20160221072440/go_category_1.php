<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_category`;");
E_C("CREATE TABLE `go_category` (
  `cateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `parentid` smallint(6) DEFAULT NULL COMMENT '父ID',
  `channel` tinyint(4) NOT NULL DEFAULT '0',
  `model` tinyint(1) DEFAULT NULL COMMENT '栏目模型',
  `name` varchar(255) DEFAULT NULL COMMENT '栏目名称',
  `catdir` char(20) DEFAULT NULL COMMENT '英文名',
  `pic_url` char(200) NOT NULL DEFAULT '' COMMENT '分类图片url',
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `order` smallint(6) unsigned DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`cateid`),
  KEY `name` (`name`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='栏目表'");
E_D("replace into `go_category` values('1','0','0','2','帮助','help','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('2','1','0','2','新手指南','xinshouzhinan','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('3','1','0','2','夺宝保障','yunbaozhang','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:30:\"司法所发射点发射得分\";s:8:\"template\";N;s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('4','1','0','2','商品配送','peisong','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('5','0','0','1','女性时尚','nvxingshishang','cateimg/20150821/22411143158430.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/22411143158430.png\";s:3:\"des\";s:24:\"女性时尚钟表首饰\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"钟表首饰\";s:13:\"meta_keywords\";s:12:\"钟表首饰\";s:16:\"meta_description\";s:12:\"钟表首饰\";}','2');");
E_D("replace into `go_category` values('6','0','0','1','饮食天地','yinshitiandi','cateimg/20150821/10514407158491.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/10514407158491.png\";s:3:\"des\";s:12:\"饮食天地\";s:8:\"template\";N;s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','4');");
E_D("replace into `go_category` values('7','0','0','-1','新手指南','newbie','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:22:\"single_web.newbie.html\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('8','0','0','-1','合作专区','business','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:24:\"single_web.business.html\";s:7:\"content\";s:34:\"<p>输入栏目内容...567678</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('9','0','0','-1','公益基金','fund','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:20:\"single_web.fund.html\";s:7:\"content\";s:28:\"<p>输入栏目内容...</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('10','0','0','-1','夺宝QQ群','qqgroup','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:23:\"single_web.qqgroup.html\";s:7:\"content\";s:40:\"PHA+6L6T5YWl5qCP55uu5YaF5a65Li4uPC9wPg==\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('11','0','0','-1','邀请注册','pleasereg','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:25:\"single_web.pleasereg.html\";s:7:\"content\";s:28:\"<p>输入栏目内容...</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('12','0','0','1','数码影像','shumayingxiang','cateimg/20150821/83980735158378.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/83980735158378.png\";s:3:\"des\";s:12:\"数码相机\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"数码相机\";s:13:\"meta_keywords\";s:12:\"数码相机\";s:16:\"meta_description\";s:12:\"数码相机\";}','3');");
E_D("replace into `go_category` values('13','0','0','1','电脑','diannao','cateimg/20150821/71565047158359.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/71565047158359.png\";s:3:\"des\";s:6:\"电脑\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:6:\"电脑\";s:13:\"meta_keywords\";s:6:\"电脑\";s:16:\"meta_description\";s:6:\"电脑\";}','5');");
E_D("replace into `go_category` values('14','0','0','1','手机平板','shoujipingban','cateimg/20150821/93917600158092.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/93917600158092.png\";s:3:\"des\";s:12:\"手机平板\";s:8:\"template\";N;s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','6');");
E_D("replace into `go_category` values('15','0','0','1','其他商品','qitashangpin','cateimg/20150821/81212741158754.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/81212741158754.png\";s:3:\"des\";s:12:\"其他商品\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"其他商品\";s:13:\"meta_keywords\";s:12:\"其他商品\";s:16:\"meta_description\";s:12:\"其他商品\";}','9');");
E_D("replace into `go_category` values('16','1','0','2','夺宝基金','fund','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('17','0','0','1','潮流新品','chaoliuxinpin','cateimg/20150821/77928723158582.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/77928723158582.png\";s:3:\"des\";s:12:\"潮流新品\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','7');");
E_D("replace into `go_category` values('18','0','0','1','综合购物','zonghegouwu','cateimg/20150821/22065264158707.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20150821/22065264158707.png\";s:3:\"des\";s:12:\"综合购物\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','8');");
E_D("replace into `go_category` values('142','0','0','2','网站公告','wangzhangonggao','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:12:\"网站公告\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"网站公告\";s:13:\"meta_keywords\";s:12:\"网站公告\";s:16:\"meta_description\";s:12:\"网站公告\";}','1');");
E_D("replace into `go_category` values('145','0','0','-1','测试单页','ceshi','cateimg/20151214/75614537058926.png','','a:7:{s:5:\"thumb\";s:35:\"cateimg/20151214/75614537058926.png\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:24:\"single_web.business.html\";s:7:\"content\";s:48:\"PHA+6L6T5YWl5qCP55uu5YaF5a65Li4uMTM0NTQ0NDwvcD4=\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");
E_D("replace into `go_category` values('146','1','0','2','官方媒体','guanfangmeiti','','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}','1');");

require("../../inc/footer.php");
?>