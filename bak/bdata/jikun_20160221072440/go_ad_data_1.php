<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_ad_data`;");
E_C("CREATE TABLE `go_ad_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` char(10) DEFAULT NULL COMMENT 'code,text,img',
  `content` text,
  `checked` tinyint(1) DEFAULT '0' COMMENT '1表示通过',
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告'");
E_D("replace into `go_ad_data` values('1','1','测试广告','text','阿克苏的解放了卡结算电费垃圾啊塑料袋飞机拉萨决定离开房间阿莱克斯京东方老卡机塑料袋开房间阿联科技的法律框架阿拉斯加的法律','1','0','1610640000');");
E_D("replace into `go_ad_data` values('2','1','图片广告1','text','图片广告1','1','1376841600','1598803200');");
E_D("replace into `go_ad_data` values('3','1','首页跨栏广告','img','admanage/20150823/74096990332074.jpg','1','1440604800','1567008000');");

require("../../inc/footer.php");
?>