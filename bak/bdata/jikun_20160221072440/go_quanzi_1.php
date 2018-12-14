<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_quanzi`;");
E_C("CREATE TABLE `go_quanzi` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(15) NOT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `chengyuan` mediumint(8) unsigned DEFAULT '0' COMMENT '成员数',
  `tiezi` mediumint(8) unsigned DEFAULT '0' COMMENT '帖子数',
  `guanli` mediumint(8) unsigned NOT NULL COMMENT '管理员',
  `jinhua` smallint(5) unsigned DEFAULT NULL COMMENT '精华帖',
  `jianjie` varchar(255) DEFAULT '暂无介绍' COMMENT '简介',
  `gongao` varchar(255) DEFAULT '暂无' COMMENT '公告',
  `jiaru` char(1) DEFAULT 'Y' COMMENT '申请加入',
  `glfatie` char(1) DEFAULT 'N' COMMENT '发帖权限',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8");
E_D("replace into `go_quanzi` values('1','夺宝官方讨论圈','quanzi/20150823/58998114320321.jpg','14','6','1',NULL,'夺宝官方讨论圈','夺宝官方讨论圈','Y','Y','1440320324');");
E_D("replace into `go_quanzi` values('2','美女圈','quanzi/20150823/90306731323857.jpg','12','6','2',NULL,'美女，一般解释为容貌美丽的女子。中国古代关于美女的形容词和诗词歌赋众多','南朝·梁江淹《青苔赋》：“妖童出郑，美女生燕。”\n唐·陈子昂《谏雅州讨生羌书》：“﹝秦惠王﹞乃用张仪计，饰美女，谲金牛，因间以啖蜀。”\n《东周列国志》第二回 ：“赵叔带乃上表谏曰：‘山崩川竭，其象为脂血俱枯，高危下坠，乃国家不祥之兆。况岐山王业所基，一旦崩颓，事非小故。及今勤政恤民，求贤辅政，尚可望消弭天变。奈何不访贤才而访美女乎？”','Y','Y','1440330397');");
E_D("replace into `go_quanzi` values('3','代购圈','quanzi/20150823/93847035323830.jpg','6','3','3',NULL,'请代购人员迅速到群主的碗里来，我们将不不定期发红包的哦~','代购，通俗一点来说就是找人帮忙购买你需要的商品，原因可以是你在当地买不到这件商品，可以是当地这件商品的价格比其他地区的贵，也可以是为了节省个人时间成本，请人帮忙买好送货上门。帮人从香港，澳门，台湾，甚至美国，日本，法国，韩国购买商品，然后通过快递发货或者直接携带回来，又或者从国内携带商品到国外给别人，就是常见的代购形式。还有一种代购，由于消费者对想要购买商品的相关信息的匮乏，自已无法确定其实际价值而又不想被商家宰，只好委托中介机构帮其讲价，或者干脆让中介机构代买','Y','Y','1440323833');");
E_D("replace into `go_quanzi` values('4','逻辑思维','quanzi/20150823/96103410340558.jpg','5','1','8',NULL,'逻辑思维线下交流群，欢迎测试使用','由于江青在毛泽东去世前后的一系列恶行已经重重得罪了汪东兴,叶剑英对此也非常...毛主席逝世是一件很不幸的大事,我们都很悲痛,可是还有人不顾大局多方','Y','Y','1440340608');");
E_D("replace into `go_quanzi` values('5','帮宝适','quanzi/20150823/44161700340635.jpg','6','1','9',NULL,'天津海河闸岸现大面积死鱼暂无介绍','天津海河闸岸现大面积死鱼 官方回应已赴现场或与大潮有关 2015年8月20日,天津港“8·12”瑞海公司危险品仓库特别重大火灾爆炸事故第11场新闻发布会','Y','Y','1440340663');");
E_D("replace into `go_quanzi` values('6','公益群','quanzi/20150823/73545593340684.jpg','4','1','10',NULL,'牙鲤鱼现身美国臭名昭著长相恐怖','牙鲤鱼现身美国臭名昭著长相恐怖 揭如何处理外来物种 2006年6月,这条锯腹脂鲤在亚利桑那州尤玛部落附近被捕获','Y','Y','1440340708');");

require("../../inc/footer.php");
?>