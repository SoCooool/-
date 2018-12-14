<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_quanzi_hueifu`;");
E_C("CREATE TABLE `go_quanzi_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tzid` int(11) DEFAULT NULL COMMENT '帖子ID匹配',
  `hueifu` text COMMENT '回复内容',
  `hueiyuan` varchar(255) DEFAULT NULL COMMENT '会员',
  `hftime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8");
E_D("replace into `go_quanzi_hueifu` values('1','1','大家不要着急很快就会有活动出来的了！~','1','1440321866');");
E_D("replace into `go_quanzi_hueifu` values('2','1','我自己在定下吧~','1','1440321891');");
E_D("replace into `go_quanzi_hueifu` values('3','1','我在自己支持下自己吧！感谢大家关注我们~','1','1440322563');");
E_D("replace into `go_quanzi_hueifu` values('4','6','终于抢到沙发了！真实悲催的一代人呢~！','3','1440337759');");
E_D("replace into `go_quanzi_hueifu` values('5','6','虽然很穷，但是没啥用呢~','3','1440337780');");
E_D("replace into `go_quanzi_hueifu` values('6','6','我买房了，这夺宝家具也有了，真开心呢~','2','1440337858');");
E_D("replace into `go_quanzi_hueifu` values('7','6','我也凑个热闹，希望下次能汇总~！','5','1440338116');");
E_D("replace into `go_quanzi_hueifu` values('8','7','我们留给历史的往往是一门手艺，建议您度一本书，那里面有更加详尽的理论推导~','6','1440338436');");
E_D("replace into `go_quanzi_hueifu` values('10','5','我们喜欢做代购呢~','7','1440339022');");
E_D("replace into `go_quanzi_hueifu` values('11','6','我是国家税务局主席！~','8','1440339406');");
E_D("replace into `go_quanzi_hueifu` values('12','5','开始了！~','8','1440339726');");
E_D("replace into `go_quanzi_hueifu` values('13','10','大家好，我是美女，有事儿加我啊！~','9','1440339858');");
E_D("replace into `go_quanzi_hueifu` values('14','6','说的太好了，我喜欢~！','10','1440340412');");
E_D("replace into `go_quanzi_hueifu` values('15','13','愿你们一路走好，真心谢谢您的贡献~！','9','1440341048');");
E_D("replace into `go_quanzi_hueifu` values('16','6','没事抢一个沙发吧，很高兴呢~','20','1440384551');");
E_D("replace into `go_quanzi_hueifu` values('17','5','很好的夺宝平台，我自己是比价喜欢的呢~','11','1440384955');");
E_D("replace into `go_quanzi_hueifu` values('18','6','辞职了。求好心热工作~','12','1440385093');");
E_D("replace into `go_quanzi_hueifu` values('19','6','快快来我的碗里来~','14','1440385267');");
E_D("replace into `go_quanzi_hueifu` values('20','16','很好的~','14','1440385584');");
E_D("replace into `go_quanzi_hueifu` values('21','13','谢谢你对国家的贡献！~','16','1440385829');");
E_D("replace into `go_quanzi_hueifu` values('22','16','习大大珍惜威武啊~','16','1440385894');");
E_D("replace into `go_quanzi_hueifu` values('23','16','国家越来越强大了！','17','1440386137');");
E_D("replace into `go_quanzi_hueifu` values('24','17','自己想要沙发！你们来抢啊~','17','1440386220');");
E_D("replace into `go_quanzi_hueifu` values('25','16','我也要赞一个！开心的不得了的呢~','18','1440386455');");
E_D("replace into `go_quanzi_hueifu` values('26','14','我也是上海人，很高兴认识你~','18','1440386485');");
E_D("replace into `go_quanzi_hueifu` values('27','17','你们才是真正的英雄啊~','19','1440387379');");
E_D("replace into `go_quanzi_hueifu` values('28','13','国家越来越强大了，珍惜高兴地呢！~','19','1440387672');");
E_D("replace into `go_quanzi_hueifu` values('29','17','真心英雄一路走好的~','19','1440388114');");
E_D("replace into `go_quanzi_hueifu` values('30','16','真惹毛~','1','1440389120');");
E_D("replace into `go_quanzi_hueifu` values('31','16','支持下下~','14','1440582468');");
E_D("replace into `go_quanzi_hueifu` values('32','16','好的哦~','14','1440582483');");
E_D("replace into `go_quanzi_hueifu` values('33','16','自己给自己顶下下呢~','14','1440582700');");
E_D("replace into `go_quanzi_hueifu` values('34','16','在顶下~','14','1440582721');");
E_D("replace into `go_quanzi_hueifu` values('35','16','再顶下呢~','14','1440582951');");
E_D("replace into `go_quanzi_hueifu` values('36','16','再顶下~','14','1440582965');");
E_D("replace into `go_quanzi_hueifu` values('37','16','再顶下~','14','1440582971');");
E_D("replace into `go_quanzi_hueifu` values('38','16','再顶下~','14','1440582976');");
E_D("replace into `go_quanzi_hueifu` values('39','16','在致辞下~','14','1440583106');");

require("../../inc/footer.php");
?>