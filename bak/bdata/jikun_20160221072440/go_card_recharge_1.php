<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_card_recharge`;");
E_C("CREATE TABLE `go_card_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `money` int(10) unsigned DEFAULT NULL COMMENT '卡密金额',
  `code` varchar(21) DEFAULT NULL COMMENT '卡号',
  `codepwd` varchar(20) DEFAULT NULL COMMENT '卡号密码',
  `isrepeat` varchar(1) DEFAULT 'N' COMMENT '是否一次性',
  `rechargecount` int(10) DEFAULT '0' COMMENT '充值次数',
  `maxrechargecout` int(10) DEFAULT '0' COMMENT '多最可重复多少次',
  `rechargetime` int(10) DEFAULT NULL COMMENT '充值期限',
  `time` int(10) DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='卡密表'");
E_D("replace into `go_card_recharge` values('166',NULL,'20','LC8083dc8eceb2b3f60a1','060288','Y','0','0','1447171200',NULL);");
E_D("replace into `go_card_recharge` values('167',NULL,'20','LC267467fb6d2e184ba24','215279','Y','0','0','1447171200',NULL);");
E_D("replace into `go_card_recharge` values('168',NULL,'20','LC07e5c78a09268b80deb','195027','Y','0','0','1447171200',NULL);");
E_D("replace into `go_card_recharge` values('169',NULL,'20','LC1ecb71779e61142802e','900521','Y','0','0','1447171200',NULL);");
E_D("replace into `go_card_recharge` values('170','21493','30','LC92bcf1b827663ba0575','372374','Y','1','0','1447257600','1447131402');");
E_D("replace into `go_card_recharge` values('173','22012','30','LCcee2e9d2eb1fe466b92','401436','Y','1','0','1447257600','1447135081');");
E_D("replace into `go_card_recharge` values('174','22012','30','LC20aae6c2dc577b5ffca','971501','Y','1','0','1447257600','1447136319');");
E_D("replace into `go_card_recharge` values('175','22012','30','LCe94dfddd778e384ac08','950329','Y','1','0','1447257600','1447147491');");
E_D("replace into `go_card_recharge` values('176','22012','30','LC7324f9a70fab69e0c1c','207201','Y','1','0','1447257600','1447141528');");
E_D("replace into `go_card_recharge` values('177','22012','30','LC86995f265ef28936204','562865','Y','1','0','1447257600','1447141356');");
E_D("replace into `go_card_recharge` values('178','20440','30','LC2e89d8023fbd3f9f22b','944005','Y','1','0','1447257600','1447132466');");
E_D("replace into `go_card_recharge` values('179','17524','30','LC480a78cb2ee5d28f995','305154','Y','1','0','1447257600','1447131975');");
E_D("replace into `go_card_recharge` values('180',NULL,'30','LC28fce72b75b5012086e','642626','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('181','22012','30','LC9f471431e59dbed3a7a','700834','Y','1','0','1447257600','1447158678');");
E_D("replace into `go_card_recharge` values('182',NULL,'30','LC22f667edfe48b8f8587','801130','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('183',NULL,'30','LC777d3682f02ca7fd51e','282559','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('184',NULL,'30','LC0f44efe054e35403112','543390','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('185',NULL,'30','LC1deda909ca5ab28e832','463409','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('186',NULL,'30','LC15329b4554c860a1dc3','185530','Y','0','0','1447257600',NULL);");
E_D("replace into `go_card_recharge` values('187','22012','30','LC6e72bab5740f7416019','791943','Y','1','0','1447257600','1447158290');");
E_D("replace into `go_card_recharge` values('188','22012','30','LC36952583cd50305e02d','016958','Y','1','0','1447257600','1447161402');");
E_D("replace into `go_card_recharge` values('189','22012','30','LC7dc125644110ed2090d','483548','Y','1','0','1447257600','1447159512');");

require("../../inc/footer.php");
?>