<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_send`;");
E_C("CREATE TABLE `go_send` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT '0',
  `gid` int(11) unsigned DEFAULT '0' COMMENT '商品ID',
  `username` char(50) CHARACTER SET gbk DEFAULT '' COMMENT '用户名',
  `shoptitle` char(120) CHARACTER SET gbk DEFAULT '' COMMENT '商品名称',
  `send_type` tinyint(4) unsigned DEFAULT '0' COMMENT '发送类型',
  `send_time` int(10) unsigned DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='中奖信息发送列表'");
E_D("replace into `go_send` values('1','532','234','银明','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453372763');");
E_D("replace into `go_send` values('2','532','236','银明','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453373565');");
E_D("replace into `go_send` values('3','532','237','银明','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453374184');");
E_D("replace into `go_send` values('4','532','238','银明','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453374420');");
E_D("replace into `go_send` values('5','533','239','至尊改号','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453374656');");
E_D("replace into `go_send` values('6','533','240','至尊改号','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453374956');");
E_D("replace into `go_send` values('7','533','241','至尊改号','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453374988');");
E_D("replace into `go_send` values('8','533','242','至尊改号','苹果（Apple）iPad Air 2 9.7英寸平板电脑 16G WiFi版薄至6.1mm','4','1453375050');");

require("../../inc/footer.php");
?>