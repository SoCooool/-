<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_wxch_cfg`;");
E_C("CREATE TABLE `go_wxch_cfg` (
  `cfg_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `cfg_name` varchar(64) NOT NULL DEFAULT '',
  `cfg_value` text NOT NULL COMMENT '参数值',
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`cfg_id`),
  UNIQUE KEY `cfg_name` (`cfg_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8");
E_D("replace into `go_wxch_cfg` values('1','murl','mobile','yes');");
E_D("replace into `go_wxch_cfg` values('2','baseurl','http://cziyuan.com/','yes');");
E_D("replace into `go_wxch_cfg` values('3','imgpath','http://cziyuan.com//statics/uploads/','yes');");
E_D("replace into `go_wxch_cfg` values('4','plustj','false','yes');");
E_D("replace into `go_wxch_cfg` values('5','userpwd','1234567','yes');");
E_D("replace into `go_wxch_cfg` values('6','cxbd','','yes');");
E_D("replace into `go_wxch_cfg` values('8','oauth','true','yes');");
E_D("replace into `go_wxch_cfg` values('9','goods','','yes');");
E_D("replace into `go_wxch_cfg` values('11','reply','欢迎关注妃子云购网站，我们是一个新型的购物平台，旨在提供更加优质的夺宝服务，是年轻人喜欢的一种购物形式。','yes');");
E_D("replace into `go_wxch_cfg` values('12','share','false','yes');");
E_D("replace into `go_wxch_cfg` values('13','money','11','yes');");
E_D("replace into `go_wxch_cfg` values('14','auto','a:10:{s:2:\"on\";i:1;s:2:\"uf\";i:323;s:2:\"ul\";i:330;s:7:\"mintime\";i:50;s:7:\"maxtime\";i:150;s:6:\"shopid\";s:79:\"176-172-171-159-158-157-145-140-120-113-111-110-106-101-74-68-51-177-179-170-27\";s:7:\"autoadd\";i:0;s:5:\"mshop\";s:1:\"0\";s:10:\"timeperiod\";s:61:\"3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-0-1-2\";s:7:\"runtime\";i:1450180953;}','yes');");
E_D("replace into `go_wxch_cfg` values('15','template_zj','-XAsDjl1OMW_GhxLMUkmJRpNDM5369AGF8ApBEpGvtk','yes');");
E_D("replace into `go_wxch_cfg` values('16','template_fh','GghMlORyOnw-aRI4MpeZ56A3JBJTkpWRwfBoTdKjgJo','yes');");

require("../../inc/footer.php");
?>