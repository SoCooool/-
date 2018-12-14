<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('gbk');
E_D("DROP TABLE IF EXISTS `go_qiandao`;");
E_C("CREATE TABLE `go_qiandao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id 值',
  `lianxu` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  `sum` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '总计签到天数',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签到时间',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=gbk");
E_D("replace into `go_qiandao` values('4','1','6','1449144259','1');");
E_D("replace into `go_qiandao` values('9','1','12','1441250479','35');");
E_D("replace into `go_qiandao` values('10','1','2','1441373699','36');");
E_D("replace into `go_qiandao` values('11','1','1','1442314708','43');");
E_D("replace into `go_qiandao` values('12','1','1','1443062643','76');");
E_D("replace into `go_qiandao` values('13','1','2','1448450550','38');");
E_D("replace into `go_qiandao` values('14','1','1','1443148011','80');");
E_D("replace into `go_qiandao` values('15','2','2','1443273087','79');");
E_D("replace into `go_qiandao` values('16','1','1','1443166319','86');");
E_D("replace into `go_qiandao` values('17','1','1','1443168410','84');");
E_D("replace into `go_qiandao` values('18','2','2','1443199607','85');");
E_D("replace into `go_qiandao` values('19','1','1','1443175539','89');");
E_D("replace into `go_qiandao` values('20','1','1','1443278186','101');");
E_D("replace into `go_qiandao` values('21','1','2','1444186109','174');");
E_D("replace into `go_qiandao` values('22','1','1','1444041839','176');");
E_D("replace into `go_qiandao` values('23','1','1','1444295212','179');");
E_D("replace into `go_qiandao` values('24','2','2','1444370866','181');");
E_D("replace into `go_qiandao` values('25','1','1','1444378261','187');");
E_D("replace into `go_qiandao` values('26','1','1','1444551891','211');");
E_D("replace into `go_qiandao` values('27','1','1','1444654015','219');");
E_D("replace into `go_qiandao` values('28','1','1','1444742897','225');");
E_D("replace into `go_qiandao` values('29','1','1','1444801432','230');");
E_D("replace into `go_qiandao` values('30','1','1','1446804513','235');");
E_D("replace into `go_qiandao` values('31','1','1','1446805232','236');");
E_D("replace into `go_qiandao` values('32','1','1','1448450642','245');");
E_D("replace into `go_qiandao` values('33','1','1','1448468996','253');");
E_D("replace into `go_qiandao` values('34','1','1','1449022930','260');");
E_D("replace into `go_qiandao` values('35','1','1','1449713844','266');");
E_D("replace into `go_qiandao` values('36','1','1','1449717621','284');");
E_D("replace into `go_qiandao` values('37','1','1','1449803885','296');");
E_D("replace into `go_qiandao` values('38','1','1','1449843473','299');");
E_D("replace into `go_qiandao` values('39','1','1','1450004689','303');");
E_D("replace into `go_qiandao` values('40','1','1','1450062884','308');");
E_D("replace into `go_qiandao` values('41','1','9','1454381513','274');");
E_D("replace into `go_qiandao` values('42','1','4','1452921146','321');");
E_D("replace into `go_qiandao` values('43','1','4','1451139898','350');");
E_D("replace into `go_qiandao` values('44','1','2','1450844266','354');");
E_D("replace into `go_qiandao` values('45','1','1','1450759489','360');");
E_D("replace into `go_qiandao` values('46','1','2','1453382293','361');");
E_D("replace into `go_qiandao` values('47','1','1','1450875174','366');");
E_D("replace into `go_qiandao` values('48','1','1','1451147964','372');");
E_D("replace into `go_qiandao` values('49','1','1','1451186623','373');");
E_D("replace into `go_qiandao` values('50','1','1','1451309987','379');");
E_D("replace into `go_qiandao` values('51','1','1','1451372651','390');");
E_D("replace into `go_qiandao` values('52','1','1','1451373304','387');");
E_D("replace into `go_qiandao` values('53','1','1','1451376798','383');");
E_D("replace into `go_qiandao` values('54','1','1','1451443297','374');");
E_D("replace into `go_qiandao` values('55','2','2','1451532662','382');");
E_D("replace into `go_qiandao` values('56','1','1','1451730056','408');");
E_D("replace into `go_qiandao` values('57','2','2','1451937509','411');");
E_D("replace into `go_qiandao` values('58','1','1','1452069443','421');");
E_D("replace into `go_qiandao` values('59','1','1','1452078301','420');");
E_D("replace into `go_qiandao` values('60','1','1','1452080160','423');");
E_D("replace into `go_qiandao` values('61','1','1','1452164619','432');");
E_D("replace into `go_qiandao` values('62','1','1','1452743426','471');");
E_D("replace into `go_qiandao` values('63','1','1','1452765490','476');");
E_D("replace into `go_qiandao` values('64','1','1','1452859034','489');");
E_D("replace into `go_qiandao` values('65','1','2','1453363151','511');");
E_D("replace into `go_qiandao` values('66','1','1','1453206114','513');");
E_D("replace into `go_qiandao` values('67','1','1','1453369404','533');");
E_D("replace into `go_qiandao` values('68','1','1','1453697814','544');");
E_D("replace into `go_qiandao` values('69','1','1','1454514040','580');");
E_D("replace into `go_qiandao` values('70','1','2','1455152275','586');");
E_D("replace into `go_qiandao` values('71','1','1','1455445091','587');");
E_D("replace into `go_qiandao` values('72','1','2','1455847997','588');");

require("../../inc/footer.php");
?>