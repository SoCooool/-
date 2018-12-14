<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_member_dizhi`;");
E_C("CREATE TABLE `go_member_dizhi` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `sheng` varchar(15) DEFAULT NULL COMMENT '省',
  `shi` varchar(15) DEFAULT NULL COMMENT '市',
  `xian` varchar(15) DEFAULT NULL COMMENT '县',
  `jiedao` varchar(255) DEFAULT NULL COMMENT '街道地址',
  `youbian` mediumint(8) DEFAULT NULL COMMENT '邮编',
  `shouhuoren` varchar(15) DEFAULT NULL COMMENT '收货人',
  `mobile` char(11) DEFAULT NULL COMMENT '手机',
  `tell` varchar(15) DEFAULT NULL COMMENT '座机号',
  `default` char(1) DEFAULT 'N' COMMENT '是否默认',
  `time` int(10) unsigned NOT NULL,
  `qq` char(20) NOT NULL DEFAULT '' COMMENT 'QQ 号码',
  `shifoufahuo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发货！',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='会员地址表'");
E_D("replace into `go_member_dizhi` values('1','10','北京市','北京市','崇文区','四环路四方大厦39303','736729','李冉新','18648928936','','N','1440340281','','0');");
E_D("replace into `go_member_dizhi` values('2','10','重庆市','重庆市','渝中区','四环路四方大厦39303','736729','李冉新','18649625719','','N','1440340297','','0');");
E_D("replace into `go_member_dizhi` values('4','1','澳门','澳门特别行政区','澳门特别行政区','我是奥没事区，我是测试的456！','452370','崔银明123','18649625719',NULL,'N','1441109990','1203116460','0');");
E_D("replace into `go_member_dizhi` values('7','35','上海市','上海市','黄浦区','测试地址','120311','测试','18649625719',NULL,'N','1441426505','1203116460','0');");
E_D("replace into `go_member_dizhi` values('8','1','天津市','天津市','和平区','我是岁银明，我是测试的！','452370','李冉新','18649625719',NULL,'Y','1442034349','1203116460','0');");
E_D("replace into `go_member_dizhi` values('9','85','福建省','厦门市','厦门市','吕厝福隆国际306','316000','周桐春','15160023256',NULL,'N','1443171544','3113569316','1');");
E_D("replace into `go_member_dizhi` values('10','174','上海市','上海市','黄浦区','考虑考虑','522000','林树','13169296710',NULL,'N','1444186082','12321456','0');");
E_D("replace into `go_member_dizhi` values('11','179','河北省','唐山市','路北区','dgghh','522000','vjfhfyc','13112345678',NULL,'N','1444295170','5875288','0');");
E_D("replace into `go_member_dizhi` values('13','337','天津市','天津市','和平区','澄海汇景花园','515800','李汉','18025574870',NULL,'N','1450286680','4511888295','0');");
E_D("replace into `go_member_dizhi` values('14','345','河北省','张家口市','桥西区','河北省张家口赤诚县供销商厦一楼爱信隆银店','75500','林志航','13663138869',NULL,'N','1450700687','642490516','0');");

require("../../inc/footer.php");
?>