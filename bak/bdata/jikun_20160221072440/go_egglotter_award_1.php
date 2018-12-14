<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_egglotter_award`;");
E_C("CREATE TABLE `go_egglotter_award` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(11) DEFAULT NULL COMMENT '用户名字',
  `rule_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `subtime` int(11) DEFAULT NULL COMMENT '中奖时间',
  `spoil_id` int(11) DEFAULT NULL COMMENT '奖品等级',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8");
E_D("replace into `go_egglotter_award` values('1','13551','123456www','1','1396793083','3');");
E_D("replace into `go_egglotter_award` values('2','1','cuiyinming','1','1440313377','3');");
E_D("replace into `go_egglotter_award` values('3','1','cuiyinming','1','1440315080','3');");
E_D("replace into `go_egglotter_award` values('4','1','cuiyinming','1','1440315800','3');");
E_D("replace into `go_egglotter_award` values('5','1','cuiyinming','1','1440317386','3');");
E_D("replace into `go_egglotter_award` values('6','1','cuiyinming','1','1440319454','3');");
E_D("replace into `go_egglotter_award` values('7','1','cuiyinming','1','1440319746','3');");
E_D("replace into `go_egglotter_award` values('8','1','崔银明','1','1440420726','3');");
E_D("replace into `go_egglotter_award` values('9','1','崔银明','1','1443235356','3');");
E_D("replace into `go_egglotter_award` values('10','274','银明','1','1452009455','3');");
E_D("replace into `go_egglotter_award` values('11','274','银明','1','1452009517','3');");

require("../../inc/footer.php");
?>