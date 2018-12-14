<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_member_recodes`;");
E_C("CREATE TABLE `go_member_recodes` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '收取1//充值-2/提现-3',
  `content` varchar(255) NOT NULL COMMENT '详情',
  `shopid` int(11) DEFAULT NULL COMMENT '商品id',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `time` char(20) NOT NULL,
  `ygmoney` decimal(8,2) NOT NULL COMMENT '夺宝金额',
  `cashoutid` int(11) DEFAULT NULL COMMENT '申请提现记录表id',
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细'");
E_D("replace into `go_member_recodes` values('116','1','(第59期)苹果（Apple）iMac ME086CH/A 21.5英寸一体电脑','107','0.06','1443445324','1.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第1期)苹果（Apple）iMac ME086CH/A 21.5英寸一体电脑','8','45.96','1443446979','766.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第59期)苹果（Apple）iMac ME086CH/A 21.5英寸一体电脑','107','0.06','1443446979','1.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第1期)佳能（Canon） EOS 70D 单反套机','9','0.06','1443447040','1.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第1期)佳能（Canon） EOS 70D 单反套机','9','51.96','1443447058','866.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第1期)佳能（Canon） EOS 70D 单反套机','5','0.06','1443447099','1.00',NULL);");
E_D("replace into `go_member_recodes` values('118','1','(第2期)佳能（Canon） EOS 70D 单反套机','112','53.94','1443447193','899.00',NULL);");
E_D("replace into `go_member_recodes` values('1','-3','提现',NULL,'100.00','1443447238','0.00','1');");
E_D("replace into `go_member_recodes` values('1','-2','使用佣金充值到夺宝账户',NULL,'50.00','1443447332','0.00',NULL);");
E_D("replace into `go_member_recodes` values('1','-2','使用佣金充值到夺宝账户',NULL,'1.00','1448428137','0.00',NULL);");

require("../../inc/footer.php");
?>