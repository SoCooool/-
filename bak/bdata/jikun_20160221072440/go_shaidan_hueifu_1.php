<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_shaidan_hueifu`;");
E_C("CREATE TABLE `go_shaidan_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdhf_id` int(11) NOT NULL COMMENT '晒单ID',
  `sdhf_userid` int(11) DEFAULT NULL COMMENT '晒单回复会员ID',
  `sdhf_content` text COMMENT '晒单回复内容',
  `sdhf_time` int(11) DEFAULT NULL,
  `sdhf_username` char(20) DEFAULT NULL,
  `sdhf_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8");
E_D("replace into `go_shaidan_hueifu` values('1','1','1','恭喜你啦','1396810591','123456','photo/member.jpg');");
E_D("replace into `go_shaidan_hueifu` values('2','1','3','真心不错的呢！~','1440300922','小明','photo/member.jpg');");
E_D("replace into `go_shaidan_hueifu` values('3','2','1','好羡慕你的啊亲~','1440335413','崔银明','touimg/20150823/48140424264534.jpg');");
E_D("replace into `go_shaidan_hueifu` values('4','4','4','我中奖了~我很开心的啊你们都不知道呢~','1440336053','明の明','photo/member.jpg');");
E_D("replace into `go_shaidan_hueifu` values('5','8','3','扬州时间我喜欢杨柳呢~','1440337160','小明','photo/member.jpg');");
E_D("replace into `go_shaidan_hueifu` values('6','8','5','我也很喜欢你的这个商品的呢~','1440338158','蜘蛛侠','touimg/20150823/15860565337945.jpg');");
E_D("replace into `go_shaidan_hueifu` values('7','16','9','很好，我自己都很喜欢的呢！~','1440341415','包主席','touimg/20150823/89484318339812.jpg');");
E_D("replace into `go_shaidan_hueifu` values('8','21','19','太漂亮了有木有！~','1440388008','劝分党','touimg/20150824/33761840387330.jpg');");
E_D("replace into `go_shaidan_hueifu` values('9','20','19','好好漂亮啊！~','1440388068','劝分党','touimg/20150824/33761840387330.jpg');");
E_D("replace into `go_shaidan_hueifu` values('10','23','1','真好看呢！~','1440388963','崔银明','touimg/20150823/48140424264534.jpg');");
E_D("replace into `go_shaidan_hueifu` values('11','26','20','好漂亮的啊~','1440394066','孤独值班者','touimg/20150824/84089177384514.jpg');");
E_D("replace into `go_shaidan_hueifu` values('12','35','14','很新欢这个分割~','1440397948','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('13','5','14','很好看啊~','1440583435','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('14','5','14','很好看啊~','1440583442','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('15','5','14','很好看啊~','1440583448','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('16','5','14','很好看啊~','1440583454','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('17','5','14','很好看啊~','1440583461','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('18','5','14','很好看啊~','1440583467','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('19','5','14','很好看啊~','1440583473','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('20','5','14','很好看啊~','1440583479','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('21','5','14','很好看啊~','1440583485','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('22','5','14','很好看啊~','1440583492','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('23','5','14','很好看啊~','1440583498','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('24','5','14','很好看啊~','1440583504','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('25','5','14','很好看啊~','1440583510','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('26','5','14','很好看啊~','1440583515','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('27','5','14','很好看啊~','1440583524','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('28','5','14','很好看啊~','1440583531','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('29','5','14','很好看啊~','1440583537','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('30','5','14','很好看啊~','1440583544','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('31','5','14','很好看啊~','1440583550','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('32','5','14','很好看啊~','1440583557','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('33','5','14','很好看啊~','1440583564','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('34','5','14','很好看啊~','1440583573','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('35','5','14','很好看啊~','1440583585','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('36','5','14','很好看啊~','1440583594','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('37','5','14','很好看啊~','1440583602','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('38','5','14','很好看啊~','1440583615','王五','touimg/20150824/25066985385238.png');");
E_D("replace into `go_shaidan_hueifu` values('39','58','373','哈哈哈哈','1451179552',NULL,NULL);");
E_D("replace into `go_shaidan_hueifu` values('40','58','373','哈哈哈哈','1451179589',NULL,NULL);");

require("../../inc/footer.php");
?>