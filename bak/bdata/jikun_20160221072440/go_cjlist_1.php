<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `go_cjlist`;");
E_C("CREATE TABLE `go_cjlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `wxid` char(255) NOT NULL DEFAULT '' COMMENT '推广员或者渠道名称',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `codeid` char(20) NOT NULL DEFAULT '' COMMENT '场景码',
  `come` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0是关注  1是扫描',
  `sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扫描或者关注次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COMMENT='场景关注报表'");
E_D("replace into `go_cjlist` values('180','418','o9xy7t4xA0FE0ee2Gg5vqJleTPNQ','1451994325','','0','1');");
E_D("replace into `go_cjlist` values('181','419','o9xy7t2tteSctnJIMowyhVvtu5Qc','1451996377','','0','1');");
E_D("replace into `go_cjlist` values('182','417','o9xy7t39u3wTTqZKw89VVvIR6vjQ','1452013911','','0','1');");
E_D("replace into `go_cjlist` values('183','420','o9xy7t76KKlLKT8V929FQ6GqzE4g','1452061112','','0','1');");
E_D("replace into `go_cjlist` values('185','422','o9xy7t_B_KPUnHW-joNldLrZ6BXY','1452069872','','0','1');");
E_D("replace into `go_cjlist` values('184','421','o9xy7t8ASHLgmGkL1T9_IqJDJ1Dc','1452069290','','0','1');");
E_D("replace into `go_cjlist` values('186','423','o9xy7t6vQkd4zSNhR1IFkr9zqGRM','1452078208','','0','1');");
E_D("replace into `go_cjlist` values('187','415','o9xy7t0_aBUU-aT7mw9j-7Pasbs8','1452085135','','0','1');");
E_D("replace into `go_cjlist` values('188','424','o9xy7t940aU2wHpp7Y-1NI9e5bxY','1452086380','','0','1');");
E_D("replace into `go_cjlist` values('189','375','o9xy7twMlOxRrgqGMBGeTLhP61oU','1452089191','','0','1');");
E_D("replace into `go_cjlist` values('190','425','o9xy7t6V3bbKR4AaaxhC5sCY5BsU','1452090438','','0','1');");
E_D("replace into `go_cjlist` values('191','407','o9xy7t0pnYKw5uq-AFifBA7l8PT8','1452142830','','0','1');");
E_D("replace into `go_cjlist` values('192','431','o9xy7t_mJ5rcQev4gKaiXlhgXM_I','1452154248','','0','1');");
E_D("replace into `go_cjlist` values('193','432','o9xy7t79rZK428QGk4wyHgx4j1g8','1452164559','','0','1');");
E_D("replace into `go_cjlist` values('194','436','o9xy7tyfxY7KtVmp7e8MMvQuy_04','1452174867','','0','1');");
E_D("replace into `go_cjlist` values('195','437','o9xy7t5RrNFAho2qgQR7gT9uM7vQ','1452188710','','0','1');");
E_D("replace into `go_cjlist` values('196','438','o9xy7t3-nRYcu853jgzjWOnm8DAk','1452204193','','0','1');");
E_D("replace into `go_cjlist` values('197','439','o9xy7twycCDXeVRPBF7pLVv6b5Rg','1452217186','','0','1');");
E_D("replace into `go_cjlist` values('198','440','o9xy7t1Mp_vrYQ72mDydwLhI67Jo','1452230757','','0','1');");
E_D("replace into `go_cjlist` values('199','441','o9xy7twmTetQn3FM1dFHEYBe25As','1452325011','','0','1');");
E_D("replace into `go_cjlist` values('200','447','o9xy7t0x8MajYBu-Hzd58Yn1vxv0','1452356928','','0','1');");
E_D("replace into `go_cjlist` values('201','448','o9xy7t5vbEMw2qc4SLg_OlFOfiC0','1452391698','','0','1');");
E_D("replace into `go_cjlist` values('202','452','o9xy7t8fDJgvZSZTdN7EB06cX40M','1452439677','','0','1');");
E_D("replace into `go_cjlist` values('203','453','o9xy7t_cqDffZnzd-Kb2yoOQK3P8','1452444439','','0','1');");
E_D("replace into `go_cjlist` values('204','457','o9xy7t4DZoKEMYiEmZnkWqY5oTqo','1452505658','','0','1');");
E_D("replace into `go_cjlist` values('205','458','o9xy7tx9lhwwJJgaOdrEJaZFYnW4','1452511062','','0','1');");
E_D("replace into `go_cjlist` values('206','460','o9xy7t-ZwkjZDGJt24Vb2-_F0t24','1452527171','','0','1');");
E_D("replace into `go_cjlist` values('207','461','o9xy7t3ChUh5Cfxuvog-IufSngQc','1452583903','','0','1');");
E_D("replace into `go_cjlist` values('208','465','o9xy7txV7IXhEIGSdPvfgtOXIXNM','1452590685','','0','1');");
E_D("replace into `go_cjlist` values('209','466','o9xy7t2TJ2tWe9uoyTkzLAOE8e_k','1452607328','','0','1');");
E_D("replace into `go_cjlist` values('210','467','o9xy7t9qkQzwZdCjZFzpSC0ueiN8','1452658361','','0','1');");
E_D("replace into `go_cjlist` values('211','468','o9xy7t40Pc-2lymN3K6Jxz7Wb788','1452671771','','0','1');");
E_D("replace into `go_cjlist` values('212','469','o9xy7tyvaVPhXa-bj3USDa2dW3gM','1452680440','','0','1');");
E_D("replace into `go_cjlist` values('213','296','o9xy7t5Q1QD9081DOF4BsmakHBlw','1452683388','','0','1');");
E_D("replace into `go_cjlist` values('214','470','o9xy7t80ZFmDMCyEQqAQ4vlVSSyE','1452738630','','0','1');");
E_D("replace into `go_cjlist` values('215','471','o9xy7t1lPKC3EFuGScXp05nyxIsc','1452743349','','0','1');");
E_D("replace into `go_cjlist` values('216','472','o9xy7t_JVrWBvov5baI-dDEXhFcQ','1452744242','','0','1');");
E_D("replace into `go_cjlist` values('217','414','o9xy7t4pGD0tghMy9boA8_Z-xu2c','1452763113','','0','1');");
E_D("replace into `go_cjlist` values('218','476','o9xy7t4YyY-nkNAyjcgsl5EJUiXE','1452765375','','0','1');");
E_D("replace into `go_cjlist` values('219','482','o9xy7t_ijISyMn41j2AnqnygpI9M','1452783138','','0','1');");
E_D("replace into `go_cjlist` values('220','489','o9xy7twtzsMHZKuEVAoCOOdkFzZE','1452858930','','0','1');");
E_D("replace into `go_cjlist` values('221','379','o9xy7t7m8ZymNu7rS1ue8ctqLKbY','1452867688','','0','1');");
E_D("replace into `go_cjlist` values('223','498','o9xy7t-SFIsLp4v7UluufSnw3i4I','1452950946','','0','1');");
E_D("replace into `go_cjlist` values('224','500','o9xy7tyUHWmTMnt8ERWBEg5jrdGw','1453011127','','0','1');");
E_D("replace into `go_cjlist` values('225','506','o9xy7t30MmbcS-K-PaG8MJngmtGk','1453059696','','0','1');");
E_D("replace into `go_cjlist` values('226','507','o9xy7t_2RH94I0ncjbUGSEfZgXTY','1453080520','','0','1');");
E_D("replace into `go_cjlist` values('227','511','o9xy7t1hvqDLgNi_t-6n0tiuWkHA','1453094831','','0','1');");
E_D("replace into `go_cjlist` values('228','512','o9xy7t-6wxuSCUXXBvz2y-NLOp2A','1453145584','','0','1');");
E_D("replace into `go_cjlist` values('229','513','o9xy7t-PocFoXIOZ-PflEIkc2lyo','1453171930','','0','1');");
E_D("replace into `go_cjlist` values('231','521','o9xy7t0VTWO9CqRlvsJOmJQRgCPU','1453252204','','0','1');");
E_D("replace into `go_cjlist` values('232','522','o9xy7ty3z_NfTuedIIQgQrhIU8N4','1453260197','','0','1');");
E_D("replace into `go_cjlist` values('233','530','o9xy7t0zqo3S64o74sY1u28PGPw4','1453345907','','0','1');");
E_D("replace into `go_cjlist` values('234','531','orYqLwYZ6UG0aG7XvkWgsrYzBxPY','1453370583','','0','3');");
E_D("replace into `go_cjlist` values('235','532','orYqLwQyARDCJB4CC-P-mkz4RnwM','1453368397','','0','1');");
E_D("replace into `go_cjlist` values('236','533','orYqLwZS99k1Nf9cXPhWHQUvqjvM','1453369335','','0','1');");
E_D("replace into `go_cjlist` values('237','534','orYqLwc7T_b1qL62ClID5oCrIxtc','1453379586','','0','1');");
E_D("replace into `go_cjlist` values('238','361','o9xy7tzQBZS-9ssTDNs_l7ii2hTQ','1453382201','','0','1');");
E_D("replace into `go_cjlist` values('239','535','o9xy7txSIrYMRrtXyZG2JHK4UUYw','1453466662','','0','1');");
E_D("replace into `go_cjlist` values('240','536','o9xy7tw1U-3IL0so-TXxpPIVnvXw','1453471246','','0','1');");
E_D("replace into `go_cjlist` values('241','539','o9xy7t8-ihMXrHSAmm9guSmtBdhM','1453531292','','0','1');");
E_D("replace into `go_cjlist` values('242','540','o9xy7t778dGXm6wBfmctLQKy-S4U','1453593928','','0','1');");
E_D("replace into `go_cjlist` values('243','541','o9xy7t-GSCKSI7vHIuGWbTne8ZLM','1453625996','','0','1');");
E_D("replace into `go_cjlist` values('244','542','o9xy7twFe29rEJzokTS3EqISiNCI','1453693129','','0','1');");
E_D("replace into `go_cjlist` values('245','543','o9xy7t5MmwFKz_HJ22n-KfBqtGrQ','1453695338','','0','1');");
E_D("replace into `go_cjlist` values('246','544','o9xy7twef-x4JkxtVUYYoGltzYVY','1453697722','','0','1');");
E_D("replace into `go_cjlist` values('247','366','o9xy7twZ2skQDbea2O-A7TciDbAo','1453712761','','0','1');");
E_D("replace into `go_cjlist` values('248','548','o9xy7t5NMDWJAlRdxr_y5eqSsCO4','1453720335','','0','1');");
E_D("replace into `go_cjlist` values('249','553','o9xy7t5xR8h04uMepZ9AMX9oHuqA','1453812960','','0','1');");
E_D("replace into `go_cjlist` values('250','554','o9xy7t8fQSXPjV4gHzEN38yypccQ','1453818810','','0','1');");
E_D("replace into `go_cjlist` values('251','555','o9xy7t7yY-ulqe5usw3LT7nfuG40','1453871710','','0','1');");
E_D("replace into `go_cjlist` values('252','356','o9xy7t0RULnkToQOQyMmyOxUXqkA','1453951989','','0','1');");
E_D("replace into `go_cjlist` values('253','557','o9xy7t9oq-sFyU7w6_Qn4eVe_bPM','1453971836','','0','1');");
E_D("replace into `go_cjlist` values('254','566','o9xy7t4ZkGFL3XgmKchKMfAJ3mQU','1454127131','','0','1');");
E_D("replace into `go_cjlist` values('256','568','o9xy7t0FIIgNWipqD75d0GuJDV0Y','1454209649','','0','1');");
E_D("replace into `go_cjlist` values('257','569','o9xy7tyoROjfT_ZEh5q13-8U4NOc','1454223589','','0','1');");
E_D("replace into `go_cjlist` values('258','578','o9xy7t4bjVmx41rO0andC4P1lBWY','1454429062','','0','1');");
E_D("replace into `go_cjlist` values('259','586','o9xy7txv4AWbxG8aEjnitg3bR4qc','1454838412','','0','1');");
E_D("replace into `go_cjlist` values('260','587','o9xy7txAnMuWcQiD6SjTdzzW5wxo','1455018733','','0','1');");
E_D("replace into `go_cjlist` values('261','588','o9xy7t7dxMdn8Z2Idh8vd4DidQmQ','1455523250','','0','1');");
E_D("replace into `go_cjlist` values('263','589','o9xy7t8Z_kky0yHv7rXlec7Upw9s','1455612310','','0','1');");
E_D("replace into `go_cjlist` values('264','592','o9xy7tzIIQOQUjgWWMmFHbrtQotk','1455687613','','0','1');");
E_D("replace into `go_cjlist` values('265','595','o9xy7t1ueyg5pslekzwo9ZveTSfY','1455848849','','0','1');");
E_D("replace into `go_cjlist` values('266','596','o9xy7t570TnLT48xCt9J995ycMK0','1455848868','','0','1');");
E_D("replace into `go_cjlist` values('267','597','o9xy7tziHu9ygU4jCauWsNv7Sfnk','1455887392','','0','1');");
E_D("replace into `go_cjlist` values('268','598','o9xy7t96paa9xMX16_Hxm2x5BRQw','1455895214','','0','1');");
E_D("replace into `go_cjlist` values('269','599','o9xy7t7ua68Kv5sfsNb9A9qqTb6c','1455895587','','0','1');");

require("../../inc/footer.php");
?>