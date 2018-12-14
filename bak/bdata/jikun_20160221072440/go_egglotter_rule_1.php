<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_egglotter_rule`;");
E_C("CREATE TABLE `go_egglotter_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(200) DEFAULT NULL,
  `starttime` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `subtime` int(11) DEFAULT NULL COMMENT '活动编辑时间',
  `lotterytype` int(11) DEFAULT NULL COMMENT '抽奖按币分类',
  `lotterjb` int(11) DEFAULT NULL COMMENT '每一次抽奖使用的金币',
  `ruledesc` text COMMENT '规则介绍',
  `startusing` tinyint(4) DEFAULT NULL COMMENT '启用',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8");
E_D("replace into `go_egglotter_rule` values('1','1','1440259200','1472054400','1440320179','1','1','三国之刃美女都有哪些玩法及玩法大全，在游戏中对于玩家来说现在的美女系统都是非常不错的吧。要知道在战斗中玩家可以通过美女获取到很多的属性加成与道具，那么在游戏中对于玩家来说美女玩法都有哪些呢，玩家要如何玩好美女系统呢。','1');");

require("../../inc/footer.php");
?>