<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_pay`;");
E_C("CREATE TABLE `go_pay` (
  `pay_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` char(20) NOT NULL,
  `pay_class` char(20) NOT NULL,
  `pay_type` tinyint(3) NOT NULL,
  `pay_thumb` varchar(255) DEFAULT NULL,
  `pay_des` text,
  `pay_start` tinyint(4) NOT NULL,
  `pay_key` text,
  `pay_mobile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8");
E_D("replace into `go_pay` values('1','财付通','tenpay','1','photo/cft.gif','腾讯财付通	','1','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"财付通商户号:\";s:3:\"val\";s:0:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"财付通密钥:\";s:3:\"val\";s:0:\"\";}}','0');");
E_D("replace into `go_pay` values('2','易宝支付','yeepay','1','photo/20130929/93656812450898.jpg','易宝支付','1','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:16:\"易宝商户号:\";s:3:\"val\";s:8:\"45646546\";}s:3:\"key\";a:2:{s:4:\"name\";s:13:\"易宝密钥:\";s:3:\"val\";s:12:\"456464131313\";}}','0');");
E_D("replace into `go_pay` values('3','汇潮支付','ecpss','1','photo/20130929/ecpss.jpg','汇潮支付','1','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:16:\"汇潮商户号:\";s:3:\"val\";s:10:\"1531456446\";}s:3:\"key\";a:2:{s:4:\"name\";s:13:\"汇潮密钥:\";s:3:\"val\";s:10:\"4536131313\";}}','0');");
E_D("replace into `go_pay` values('4','支付宝','alipay','2','photo/20150817/30078855798842.jpg','支付宝支付','1','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"支付宝商户号:\";s:3:\"val\";s:16:\"2088611087053070\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"支付宝密钥:\";s:3:\"val\";s:32:\"4gnknh2v1vc3rjsjpukxuk6e1j22htso\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"支付宝账号:\";s:3:\"val\";s:17:\"lnhome123@163.com\";}}','0');");
E_D("replace into `go_pay` values('5','手机支付宝支付','wapalipay','1','photo/20150817/43563230798865.jpg','支付宝转账接口\n','1','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"支付宝商户号:\";s:3:\"val\";s:16:\"2088611087053070\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"支付宝密钥:\";s:3:\"val\";s:32:\"4gnknh2v1vc3rjsjpukxuk6e1j22htso\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"支付宝账号:\";s:3:\"val\";s:17:\"lnhome123@163.com\";}}','1');");
E_D("replace into `go_pay` values('6','网银在线','chinabank','0','photo/20130929/82028078450753.jpg','网银在线','0','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:9:\"商户号\";s:3:\"val\";s:8:\"15315313\";}s:3:\"key\";a:2:{s:4:\"name\";s:6:\"密匙\";s:3:\"val\";s:12:\"103214354687\";}}','0');");
E_D("replace into `go_pay` values('7','网银在线wap','chinabankwap','0','photo/20141222/99919905216901.jpg','网银手机支付','0','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:9:\"商户号\";s:3:\"val\";s:0:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:6:\"密匙\";s:3:\"val\";s:0:\"\";}}','1');");
E_D("replace into `go_pay` values('8','微信扫码支付','weixin','0','photo/weixin.gif','微信扫码支付','1','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:9:\"商户号\";s:3:\"val\";s:10:\"1242516702\";}s:3:\"key\";a:2:{s:4:\"name\";s:6:\"密匙\";s:3:\"val\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";}}','0');");
E_D("replace into `go_pay` values('9','微信支付微信端','wxpay_web','0','photo/weixin.gif','微信支付微信端','1','a:4:{s:5:\"APPID\";a:2:{s:4:\"name\";s:5:\"APPID\";s:3:\"val\";s:18:\"wxb7b1e35c7f1e3aaa\";}s:5:\"MCHID\";a:2:{s:4:\"name\";s:11:\"受理商ID\";s:3:\"val\";s:10:\"1242516702\";}s:3:\"KEY\";a:2:{s:4:\"name\";s:9:\"密钥Key\";s:3:\"val\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";}s:9:\"APPSECRET\";a:2:{s:4:\"name\";s:9:\"APPSECRET\";s:3:\"val\";s:32:\"401ed68ca72198e11ff7ac0caa3e3eff\";}}','1');");
E_D("replace into `go_pay` values('10','银联在线支付','unionpay','0','photo/ylzx.gif','银联在线支付','0','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:16:\"银联商户号:\";s:3:\"val\";s:36:\"深圳市抢宝城贸易有限公司\";}s:3:\"key\";a:2:{s:4:\"name\";s:13:\"银联密钥:\";s:3:\"val\";s:13:\"rftyuikopfghj\";}s:4:\"user\";a:2:{s:4:\"name\";s:13:\"银联账号:\";s:3:\"val\";s:20:\"44201610900052519476\";}}','0');");
E_D("replace into `go_pay` values('11','银联手机在线支付','unionpay_web','0','photo/ylzx.gif','银联手机在线支付','0','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:16:\"银联商户号:\";s:3:\"val\";s:36:\"深圳市抢宝城贸易有限公司\";}s:3:\"key\";a:2:{s:4:\"name\";s:13:\"银联密钥:\";s:3:\"val\";s:9:\"tfgyhujik\";}s:4:\"user\";a:2:{s:4:\"name\";s:13:\"银联账号:\";s:3:\"val\";s:20:\"44201610900052519476\";}}','1');");
E_D("replace into `go_pay` values('12','盛付通','shengpay','0','photo/shengpay.gif','盛付通','0','a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:9:\"商户号\";s:3:\"val\";s:12:\"sduisudiauso\";}s:3:\"key\";a:2:{s:4:\"name\";s:6:\"密匙\";s:3:\"val\";s:18:\"djusoaiudjoasdjaso\";}}','0');");
E_D("replace into `go_pay` values('14','云支付','yunpay','0','photo/myun.png','云支付','0','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"云支付商户号:\";s:3:\"val\";s:14:\"17341450324130\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"云支付密钥:\";s:3:\"val\";s:32:\"TMq2kkxTXNLdXAdYgbkbwbGb3THYTtAh\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"云支付账号:\";s:3:\"val\";s:16:\"582224344@qq.com\";}}','0');");
E_D("replace into `go_pay` values('15','云支付手机','yunpay','0','photo/myun.png','云支付手机','0','a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"云支付商户号:\";s:3:\"val\";s:14:\"17341450324130\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"云支付密钥:\";s:3:\"val\";s:32:\"TMq2kkxTXNLdXAdYgbkbwbGb3THYTtAh\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"云支付账号:\";s:3:\"val\";s:16:\"582224344@qq.com\";}}','1');");

require("../../inc/footer.php");
?>