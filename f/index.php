<?php
error_reporting(0);//屏蔽所有错误
if(!isset($_GET['page'])){$page=1;}else($page=$_GET["page"]);
if(isset($_GET['m']))$title="".$_GET['m']." - 第".$page."页 - ";
?>
<?php 

include('../inc/aik.config.php');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title><?php echo $title; ?>在线福利视频</title>
<style type="text/css">
td{font-size:12px;color:#666699;text-align:center;}
.odd{background-color:#EFF2FF;width:100px;}
.even{background-color:#E8EDFF;width:80px;}
th.head1,.head2{font-size:14px;color:#003399;font-weight:normal;}
th.head1{background:#dce4ff;}
th.head2{background:#d0dafd;}
</style>
 <!-- 尊重作者。留下版权 -->
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="keywords" content="<?php echo $aik['keywords'];?>">
<meta name="description" content="<?php echo $aik['description'];?>">

<style type="text/css">
BODY {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
DIV {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
DL {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
DT {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
DD {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
UL {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
OL {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
LI {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H1 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H2 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H3 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H4 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H5 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
H6 {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
P {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
FORM {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
INPUT {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
BUTTON {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
TEXTAREA {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
TH {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
TD {
	PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px
}
TABLE {
	BORDER-COLLAPSE: collapse; BORDER-SPACING: 0
}
IMG {
	BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-TOP-WIDTH: 0px
}
LI {
	LIST-STYLE-TYPE: none
}
HTML {
	BACKGROUND: #f8f7f5; COLOR: #000
}
BODY {
	FONT-SIZE: 14px; FONT-FAMILY: 'Microsoft Yahei','Simsun'; BACKGROUND: #f8f7f5; OVERFLOW-X: hidden; -webkit-text-size-adjust: none
}
H1 {
	FONT-SIZE: 100%
}
H2 {
	FONT-SIZE: 100%
}
H3 {
	FONT-SIZE: 100%
}
H4 {
	FONT-SIZE: 100%
}
H5 {
	FONT-SIZE: 100%
}
H6 {
	FONT-SIZE: 100%
}
INPUT {
	VERTICAL-ALIGN: middle; OUTLINE-WIDTH: 0px; LINE-HEIGHT: normal; resize: none; -webkit-appearance: none
}
:unknown {
	FONT-SIZE: 14px
}
INPUT:unknown {
	FONT-SIZE: 14px
}
.clear {
	CLEAR: both
}
.clearfix:after {
	HEIGHT: 0px; CONTENT: ' '; CLEAR: both; DISPLAY: block
}
A {
	FONT-SIZE: 14px; COLOR: #545454; TEXT-DECORATION: none
}
.green {
	COLOR: #390
}
.red {
	COLOR: #f00
}
.blue {
	COLOR: #36c
}
.gray {
	COLOR: #454545
}
.orange {
	COLOR: #f60
}
.mtop5 {
	MARGIN-TOP: 5px
}
.mtop10 {
	MARGIN-TOP: 10px
}
.mtop15 {
	MARGIN-TOP: 15px
}
.fr {
	FLOAT: right
}
.mcenter {
	TEXT-ALIGN: center
}
#top {
	HEIGHT: 60px; BORDER-BOTTOM: #59c640 1px solid; BACKGROUND-COLOR: #27a70b
}
#top #logo {
	HEIGHT: 100%; FLOAT: left; WIDTH: 20%
}
#top #logo A {
	HEIGHT: 30px; BACKGROUND: url(../images/logo4.png) no-repeat 0px 0px; MARGIN-LEFT: 10px; MARGIN-TOP: 15px; DISPLAY: block; WIDTH: 128px; TEXT-INDENT: -9999px; -moz-background-size: 128px 29px; -webkit-background-size: 128px 29px; -o-background-size: 128px 29px; background-size: 128px 29px
}
#top #logoright {
	FLOAT: right; PADDING-TOP: 8px; WIDTH: 50%
}
#top #logoright #lrleft {
	FLOAT: left; WIDTH: 40%
}
#top #logoright #lrleft IMG {
	FLOAT: right; MARGIN-TOP: 4px
}
#top #logoright #lrright {
	FLOAT: right; COLOR: #fff; LINE-HEIGHT: 22px; WIDTH: 55%
}
#top #logoright #lrright A {
	COLOR: #fff
}
#nav {
	BORDER-TOP: #28990f 1px solid; HEIGHT: 35px; LINE-HEIGHT: 35px; WIDTH: 100%; BACKGROUND-COLOR: #27a70b
}
#nav LI {
	FLOAT: left; TEXT-ALIGN: center; WIDTH: 25%
}
#nav LI A {
	FONT-SIZE: 16px; HEIGHT: 35px; FONT-WEIGHT: bold; COLOR: #fff; MARGIN: 0px auto; DISPLAY: block
}
#famoussite {
	BORDER-TOP: #e9e9e9 1px solid
}
#famoussite LI {
	HEIGHT: 35px; FLOAT: left; TEXT-ALIGN: center; WIDTH: 20%
}
#famoussite LI A {
	BORDER-RIGHT: #e9e9e9 1px solid; BORDER-BOTTOM: #e9e9e9 1px solid; COLOR: #709375; DISPLAY: block; LINE-HEIGHT: 35px
}
UNKNOWN {
	BORDER-LEFT: #e9e9e9 1px solid
}
#newsnav #newsntop {
	BORDER-TOP: #cecece 1px solid; HEIGHT: 35px; BORDER-BOTTOM: #cecece 1px solid; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr='#FFFFFF',EndColorStr='#EFEFEF'); LINE-HEIGHT: 35px
}
#newsnav #newsntop LI {
	FONT-SIZE: 14px; HEIGHT: 33px; FLOAT: left; COLOR: #657787; TEXT-ALIGN: center; WIDTH: 33%
}
#newsnav #newsntop LI.on {
	BORDER-BOTTOM: #559717 2px solid; COLOR: #559717
}
#newsncontent {
	OVERFLOW: hidden; POSITION: relative; CLEAR: both; MIN-HEIGHT: 104px; WIDTH: 100%
}
#newsnscroll {
	PADDING-BOTTOM: 7px; PADDING-TOP: 7px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; WIDTH: 300%
}
#newsnscroll LI {
	FLOAT: left; WIDTH: 33.33%
}
#newsnscroll LI A {
	HEIGHT: 30px; COLOR: #616365; PADDING-LEFT: 20px; DISPLAY: block; LINE-HEIGHT: 30px
}
#search {
	MARGIN-BOTTOM: 3px; FONT-SIZE: 0px; POSITION: relative; MARGIN-LEFT: 4px; LETTER-SPACING: -4px
}
#search #bdword {
	FONT-SIZE: 16px; BORDER-TOP: #d6d6d6 1px solid; HEIGHT: 28px; BORDER-RIGHT: #d6d6d6 0px solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d6d6d6 1px solid; PADDING-LEFT: 40px; BORDER-LEFT: #d6d6d6 1px solid; LETTER-SPACING: 0px; WIDTH: 80%; border-radius: 0; -webkit-border-top-left-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-topleft: 5px; -moz-border-radius-bottomleft: 5px; border-top-left-radius: 5px; border-bottom-left-radius: 5px
}
#baidubtn {
	CURSOR: pointer; FONT-SIZE: 14px; BORDER-TOP: #d6d6d6 1px solid; HEIGHT: 38px; BORDER-RIGHT: #d6d6d6 1px solid; VERTICAL-ALIGN: middle; BACKGROUND: url(../images/weixin.png) #fff no-repeat 10% 10px; RIGHT: 5px; MIN-WIDTH: 65px; BORDER-BOTTOM: #d6d6d6 1px solid; POSITION: absolute; FONT-WEIGHT: bold; COLOR: #679935; OUTLINE-WIDTH: 0px; TEXT-ALIGN: center; BORDER-LEFT: #d6d6d6 1px solid; Z-INDEX: 1; LETTER-SPACING: 0px; TOP: 0px; WIDTH: 20%; TEXT-INDENT: 12px; -moz-background-size: 17px 225px; -webkit-background-size: 17px 225px; -o-background-size: 17px 225px; background-size: 17px 225px; border-radius: 0; -webkit-border-top-right-radius: 3px; -webkit-border-bottom-right-radius: 3px; -moz-border-radius-topright: 3px; -moz-border-radius-bottomright: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px
}
#seicon {
	CURSOR: pointer; HEIGHT: 32px; BACKGROUND-IMAGE: url(../images/search640.png); BACKGROUND-REPEAT: no-repeat; POSITION: absolute; BACKGROUND-POSITION: 6px -135px; LEFT: 0px; Z-INDEX: 2; TOP: 0px; WIDTH: 40px; -webkit-background-size: 20px 235px; background-size: 20px 235px
}
.google#seicon {
	BACKGROUND-POSITION: 6px -92px
}
.easou#seicon {
	BACKGROUND-POSITION: 6px -49px
}
.roboo#seicon {
	BACKGROUND-POSITION: 6px -173px
}
.yicha#seicon {
	BACKGROUND-POSITION: 6px -207px
}
#seicon I {
	HEIGHT: 32px; BACKGROUND: url(../images/search640.png) no-repeat 0px -18px; RIGHT: 0px; POSITION: absolute; DISPLAY: block; TOP: 0px; WIDTH: 15px; -webkit-background-size: 20px 235px; background-size: 20px 235px
}
#selectse {
	BORDER-TOP: #c1c1c1 1px solid; BORDER-RIGHT: #c1c1c1 1px solid; BORDER-BOTTOM: #c1c1c1 1px solid; POSITION: absolute; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 5px; MARGIN-LEFT: -3px; BORDER-LEFT: #c1c1c1 1px solid; MARGIN-TOP: 10px; DISPLAY: none; LETTER-SPACING: 0px; PADDING-RIGHT: 5px; WIDTH: 310px; BACKGROUND-COLOR: #f5f5f5; border-radius: 5px; -webkit-border-radius: 5px; -moz-border-radius: 5px; -webkit-box-shadow: 1px 2px 3px #ddd; -moz-box-shadow: 1px 2px 3px #ddd; box-shadow: 1px 2px 3px #ddd
}
#selectse DL {
	HEIGHT: 30px; CLEAR: both; MARGIN-TOP: 5px; LINE-HEIGHT: 30px
}
#selectse DT {
	FONT-SIZE: 16px; FLOAT: left; FONT-WEIGHT: bold; COLOR: #282828; MARGIN-RIGHT: 3px
}
#selectse DD {
	FLOAT: left; MARGIN-LEFT: 5px
}
#selectse DD A {
	FONT-SIZE: 16px; BACKGROUND-IMAGE: url(../images/search640.png); BACKGROUND-REPEAT: no-repeat; PADDING-LEFT: 26px; DISPLAY: block; WIDTH: 36px; -webkit-background-size: 20px 235px; background-size: 20px 235px
}
#selectse DD A.on {
	COLOR: #fff; BACKGROUND-COLOR: #36a603
}
#selectse DD A.baidu {
	BACKGROUND-POSITION: 6px -138px
}
#selectse DD A.google {
	BACKGROUND-POSITION: 6px -96px
}
#selectse DD A.easou {
	BACKGROUND-POSITION: 6px -54px
}
#selectse DD A.roboo {
	BACKGROUND-POSITION: 6px -179px
}
#selectse DD A.yicha {
	BACKGROUND-POSITION: 6px -213px
}
#selectse I {
	HEIGHT: 10px; BACKGROUND: url(../images/search640.png) no-repeat 0px 0px; POSITION: absolute; LEFT: 10px; Z-INDEX: 1; DISPLAY: block; TOP: -10px; WIDTH: 20px; -webkit-background-size: 20px 235px; background-size: 20px 235px
}
.icbox {
	PADDING-BOTTOM: 5px
}
.icbox H2 {
	FONT-SIZE: 16px; HEIGHT: 40px; BACKGROUND-IMAGE: url(../images/weixin.png); BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: 13px -20px; COLOR: #fff; PADDING-LEFT: 35px; LINE-HEIGHT: 40px; BACKGROUND-COLOR: #19a5fd; -moz-background-size: 17px 225px; -webkit-background-size: 17px 225px; -o-background-size: 17px 225px; background-size: 17px 225px
}
.icbox H2 A {
	BACKGROUND-IMAGE: url(../images/weixin.png); BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: 13px -50px; FLOAT: right; COLOR: #fff; PADDING-LEFT: 25px; DISPLAY: block; MARGIN-RIGHT: 20px; -moz-background-size: 17px 225px; -webkit-background-size: 17px 225px; -o-background-size: 17px 225px; background-size: 17px 225px
}
.icbox DL {
	OVERFLOW: hidden; HEIGHT: 35px; CLEAR: both
}
.icbox DL:unknown {
	MARGIN-TOP: 5px
}
.icbox DL A {
	FONT-SIZE: 16px
}
.icbox DL DT {
	FLOAT: left; TEXT-ALIGN: center; PADDING-LEFT: 3px; WIDTH: 50px
}
.icbox DL DT A {
	FONT-SIZE: 16px; FONT-WEIGHT: bold; COLOR: #559717; LINE-HEIGHT: 35px
}
.icbox DL DD {
	FLOAT: left; MARGIN-LEFT: 5px
}
.icbox DL DD A {
	MIN-WIDTH: 45px; COLOR: #4b4b4b; DISPLAY: block; LINE-HEIGHT: 35px
}
.icbox H2#icbvideo {
	BACKGROUND-POSITION: 13px -78px; BACKGROUND-COLOR: #fb5d00
}
.icbox H2#icbmall {
	BACKGROUND-POSITION: 13px -110px; BACKGROUND-COLOR: #add655
}
.icbox H2#icbyule {
	BACKGROUND-POSITION: 13px -142px; BACKGROUND-COLOR: #ff9454
}
.icbox H2#icblife {
	BACKGROUND-POSITION: 13px -174px; BACKGROUND-COLOR: #19a5fd
}
H2.sitetitle {
	MARGIN-BOTTOM: 10px; FONT-SIZE: 18px; BORDER-TOP: #e0e0e0 1px solid; HEIGHT: 36px; BORDER-BOTTOM: #e0e0e0 1px solid; POSITION: relative; COLOR: #333; PADDING-LEFT: 10px; LINE-HEIGHT: 36px; -webkit-box-shadow: inset 0 1px #fff,inset 0 -1px #e9e9e9
}
H2.sitetitle:before {
	BORDER-TOP: #e7e7e7 10px solid; HEIGHT: 0px; BORDER-RIGHT: transparent 6px solid; POSITION: absolute; CONTENT: ""; LEFT: 25px; BORDER-LEFT: transparent 6px solid; TOP: 100%; WIDTH: 0px
}
#contentbox {
	FONT-SIZE: 14px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 4px; LINE-HEIGHT: 20px; PADDING-RIGHT: 4px
}
#contentbox #cbtitle {
	FONT-SIZE: 16px; BORDER-BOTTOM: #ccc 1px solid; PADDING-BOTTOM: 3px; MARGIN: 5px auto
}
#foot {
	BORDER-TOP: #e6e6e6 1px solid; COLOR: #999; PADDING-BOTTOM: 7px; TEXT-ALIGN: center; PADDING-TOP: 7px; PADDING-LEFT: 0px; MARGIN-TOP: 10px; LINE-HEIGHT: 25px; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fbfbfb
}
.classtitle {
	BORDER-TOP: #d9d9d9 1px solid; HEIGHT: 35px; BORDER-BOTTOM: #3c8102 2px solid; COLOR: #3b8101; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr='#FFFFFF',EndColorStr='#EEEEEE'); LINE-HEIGHT: 35px
}
.classtitle SPAN {
	BACKGROUND-IMAGE: url(../images/weixin.png); BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: 8px -204px; PADDING-LEFT: 15px; DISPLAY: block; -moz-background-size: 17px 225px; -webkit-background-size: 17px 225px; -o-background-size: 17px 225px; background-size: 17px 225px
}
.urllist {
	MIN-HEIGHT: 100px
}
.urllist LI {
	HEIGHT: 35px; FLOAT: left; LINE-HEIGHT: 35px; WIDTH: 25%
}
.urllist LI A {
	HEIGHT: 35px; BORDER-RIGHT: #e4e4e4 1px solid; BORDER-BOTTOM: #e4e4e4 1px solid; COLOR: #4b4b4b; TEXT-ALIGN: center; DISPLAY: block; LINE-HEIGHT: 35px
}
.recomlist {
	BACKGROUND-COLOR: #f8f7f5
}
.recomlist H3 {
	BORDER-TOP: #d9d9d9 1px solid; HEIGHT: 35px; BORDER-BOTTOM: #3c8102 2px solid; COLOR: #333; PADDING-LEFT: 15px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr='#FFFFFF',EndColorStr='#EEEEEE'); LINE-HEIGHT: 35px
}
.recomlist UL {
	PADDING-TOP: 5px
}
.recomlist LI {
	HEIGHT: 30px; BORDER-BOTTOM: #b8c8c6 1px solid; PADDING-LEFT: 8px; LINE-HEIGHT: 30px
}
.recomlist LI A {
	COLOR: #333
}
.toollist {
	MARGIN-TOP: 10px
}
.toollist UL LI {
	OVERFLOW: hidden; MARGIN-BOTTOM: 5px; FLOAT: left; TEXT-ALIGN: center; LINE-HEIGHT: 22px; WIDTH: 25%
}
.toollist UL LI A {
	FONT-SIZE: 14px; POSITION: relative; COLOR: #36a603; MARGIN: 0px auto; DISPLAY: block; WIDTH: 71px
}
.toollist UL LI A I {
	CURSOR: pointer; HEIGHT: 57px; BACKGROUND: url(../images/round_box.png) no-repeat -75px 0px; POSITION: absolute; LEFT: 7px; TOP: 0px; WIDTH: 57px
}
H2.catlist {
	BORDER-TOP: #d9d9d9 1px solid; HEIGHT: 35px; BORDER-BOTTOM: #3c8102 2px solid; COLOR: #333; LINE-HEIGHT: 35px
}
H2.catlist SPAN {
	FONT-SIZE: 16px; FLOAT: left; MARGIN-LEFT: 5px
}
H2.catlist A {
	FONT-SIZE: 14px; FLOAT: right; FONT-WEIGHT: normal; COLOR: #247400; MARGIN-RIGHT: 5px
}
H2.catlist .fr {
	FONT-SIZE: 14px; FLOAT: right; FONT-WEIGHT: normal; MARGIN-RIGHT: 3px
}
#collectclass UL {
	PADDING-BOTTOM: 6px; PADDING-TOP: 6px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px
}
#collectclass LI {
	FLOAT: left; TEXT-ALIGN: center; LINE-HEIGHT: 25px; WIDTH: 19%
}
#collectclass LI A {
	FONT-SIZE: 16px
}
#softbox UL {
	PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px
}
#softbox LI {
	OVERFLOW: hidden; HEIGHT: 90px; FLOAT: left; TEXT-ALIGN: center; LINE-HEIGHT: 30px; WIDTH: 24%
}
#flink .fr {
	FONT-SIZE: 12px; FLOAT: right; FONT-WEIGHT: normal; COLOR: #666; MARGIN-RIGHT: 3px
}
#flink UL {
	PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px
}
#flink LI {
	HEIGHT: 22px; FLOAT: left; MARGIN-LEFT: 5px; LINE-HEIGHT: 22px; WIDTH: 22%
}
#botnav {
	BORDER-BOTTOM: #d0dae4 1px solid
}
#botnav #bntop {
	BORDER-TOP: #bce46c 1px solid; HEIGHT: 35px; LINE-HEIGHT: 35px; BACKGROUND-COLOR: #f7fdea
}
#botnav #bntop LI {
	FONT-SIZE: 16px; FONT-FAMILY: 'Microsoft Yahei','Simsun'; BORDER-BOTTOM: #c6d1dc 2px solid; FLOAT: left; COLOR: #616365; TEXT-ALIGN: center; WIDTH: 33%
}
#botnav #bntop LI.on {
	BORDER-BOTTOM: #6fa107 2px solid; COLOR: #6fa107
}
#bncontent {
	OVERFLOW: hidden; POSITION: relative; CLEAR: both; MIN-HEIGHT: 104px; WIDTH: 100%
}
#bnscroll {
	PADDING-BOTTOM: 7px; PADDING-TOP: 7px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; WIDTH: 300%
}
#bnscroll LI {
	FLOAT: left; WIDTH: 33%
}
#bnscroll LI A {
	HEIGHT: 30px; FLOAT: left; COLOR: #616365; TEXT-ALIGN: center; LINE-HEIGHT: 30px; WIDTH: 25%
}
#bnscroll LI.bnfav A {
	HEIGHT: 100px; POSITION: relative; DISPLAY: inline-block
}
#bnscroll LI.bnfav A I {
	HEIGHT: 64px; BACKGROUND: url(../images/round_box_1.png) no-repeat -565px 0px; POSITION: absolute; MARGIN-LEFT: -32px; LEFT: 50%; WIDTH: 64px
}
.weixinbox {
	FONT-FAMILY: 'Microsoft Yahei','Simsun'; PADDING-BOTTOM: 5px
}
.weixinbox H3 {
	FONT-SIZE: 16px; HEIGHT: 30px; FONT-WEIGHT: normal; COLOR: #32a900; TEXT-ALIGN: center; LINE-HEIGHT: 30px
}
#resultbox .weixinbox H3 {
	FONT-SIZE: 16px; HEIGHT: 30px; FONT-WEIGHT: normal; COLOR: #32a900; TEXT-ALIGN: center; LINE-HEIGHT: 30px
}
.weixinbox LI {
	FLOAT: left; TEXT-ALIGN: center; WIDTH: 50%
}
.weixinbox LI A {
	FONT-SIZE: 14px; COLOR: #000; LINE-HEIGHT: 25px
}
#resultbox .weixinbox A {
	FONT-SIZE: 14px; COLOR: #000; LINE-HEIGHT: 25px
}

#idcardbox {
	TEXT-ALIGN: center; PADDING-TOP: 10px
}
#idcardbox H1 {
	FONT-SIZE: 16px; HEIGHT: 35px; FONT-FAMILY: 'Microsoft Yahei','Simsun'; FONT-WEIGHT: normal; COLOR: #333; TEXT-ALIGN: center; LINE-HEIGHT: 35px
}
#idcardbox H2 {
	FONT-SIZE: 14px; HEIGHT: 25px; MARGIN-TOP: 15px; LINE-HEIGHT: 25px
}
.roundinput {
	BORDER-TOP: #ccc 1px solid; HEIGHT: 32px; BORDER-RIGHT: #ccc 1px solid; BORDER-BOTTOM: #ccc 1px solid; PADDING-LEFT: 3px; MARGIN: 10px auto; BORDER-LEFT: #ccc 1px solid; WIDTH: 90%; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; box-shadow: 1px 1px 1px #ddd
}
#resultbox {
	FONT-SIZE: 14px; PADDING-BOTTOM: 5px; TEXT-ALIGN: left; PADDING-TOP: 5px; PADDING-LEFT: 5px; MIN-HEIGHT: 100px; LINE-HEIGHT: 20px; PADDING-RIGHT: 5px; WIDTH: 93%
}
#resultbox A {
	FONT-SIZE: 14px
}
#resultbox H3 {
	FONT-SIZE: 16px
}
#resultbox .green {
	COLOR: #559717
}
.hint {
	COLOR: #999; TEXT-ALIGN: left; MARGIN-LEFT: 5px; LINE-HEIGHT: 22px
}
#fdbox {
	BORDER-TOP: #9dc08d 1px solid; BORDER-RIGHT: #9dc08d 1px solid; BORDER-BOTTOM: #9dc08d 1px solid; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 5px; MARGIN: 5px auto; BORDER-LEFT: #9dc08d 1px solid; PADDING-RIGHT: 5px; WIDTH: 95%; border-radius: 4px
}
.loading {
	HEIGHT: 60px; TEXT-ALIGN: center; LINE-HEIGHT: 60px
}
.loading IMG {
	VERTICAL-ALIGN: middle
}
.hotnews {
	OVERFLOW: hidden; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff
}
.hotnews H3 {
	FONT-SIZE: 18px; BORDER-TOP: #c6c6c6 1px solid; HEIGHT: 40px; BORDER-BOTTOM: #c6c6c6 1px solid; PADDING-LEFT: 10px; FILTER: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FBFBFB',endColorstr='#EFEFEF',GradientType=0); LINE-HEIGHT: 42px
}
.hotnews H3 SPAN {
	BACKGROUND: url(../images/tool.png) no-repeat 0px 10px; PADDING-LEFT: 20px; DISPLAY: block; WIDTH: 100%; -webkit-background-size: 15px 19px; background-size: 15px 19px
}
.hotnews UL LI {
	HEIGHT: 35px; BORDER-BOTTOM: #ddd 1px solid; PADDING-LEFT: 10px; LINE-HEIGHT: 35px
}
.hotnews UL LI A {
	COLOR: #6c6c6c
}
.toollist UL LI {
	OVERFLOW: hidden; MARGIN-BOTTOM: 10px; HEIGHT: 93px; FLOAT: left; TEXT-ALIGN: center; MARGIN-LEFT: 10px; LINE-HEIGHT: 22px; WIDTH: 30%; BACKGROUND-COLOR: #1aa6fe
}
UNKNOWN {
	MARGIN-LEFT: 6px
}
.toollist UL LI A {
	FONT-SIZE: 14px; HEIGHT: 100%; BACKGROUND-REPEAT: no-repeat; POSITION: relative; BACKGROUND-POSITION: center 12px; COLOR: #fff; TEXT-DECORATION: none; MARGIN: 0px auto; DISPLAY: block; WIDTH: 100%; -moz-background-size: 48px 48px; -webkit-background-size: 48px 48px; -o-background-size: 48px 48px; background-size: 48px 48px
}
.toollist UL LI A SPAN {
	FONT-SIZE: 14px; RIGHT: 0px; POSITION: absolute; LEFT: 0px; 
	TOP: 40%;}
.toollist UL LI.tblue {
	BACKGROUND-COLOR: #1aa6fe
}
.toollist UL LI.tgreen {
	BACKGROUND-COLOR: #339933
}
.toollist UL LI.torange {
	BACKGROUND-COLOR: #ff7f19
}
</style>
 <!-- 尊重作者。留下版权 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<script type="text/javascript">
		    WeixinJSBridge.on('menu:share:timeline', function(argv) {
		        WeixinJSBridge.invoke('shareTimeline', {
		            "img_url": window.shareData.imgUrl,
		            "img_width": "640",
		            "img_height": "640",
		            "link": window.shareData.timeLineLink,
		            "desc": window.shareData.tContent,
		            "title": document.title
		        }, function(res) {
		        	document.location.href = aboutus;
		        });
		    });
		}, false);

      </script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="apple-touch-icon" href="http://h5wap.sinaapp.com/tools_files/apple-touch-icon.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="GENERATOR" content="MSHTML 10.00.9200.16721"><link rel="shortcut icon" href="http://h5wap.sinaapp.com/tools_files/apple-touch-icon.png"></head>

<body>
 <!-- 富文本内容区域 -->
<div class="custom-richtext">
<p style="text-align: center;"><strong><span style="font-size: 16px; background-color: rgb(255, 0, 0); color: rgb(255, 255, 255);">智卓星网联盟开放平台</span></strong></p></div>
       <!-- 富文本内容区域 -->
<div class="custom-richtext">
<p style="text-align: center;"><strong><span style="color: rgb(255, 255, 255); background-color: rgb(255, 0, 0);">智卓星网平台，收藏并分享朋友圈哦</span></strong></p>
<p style="text-align: right;padding-top: 5px;padding-right: 15px;">
    <strong><a href="https://github.com/zhizg/b" target="_blank"></a><span style="color:#ff0000">收藏/分享</span> <span style="color:#00b050">↑↑↑</span></strong>
</p>

<div class="toollist wid clearfix" style="margin-right: 10px;margin-bottom: 10px;">
<ul>
<!--常用-->
      </div>
      <div class="display:block">
<?php
require("api/api.php");
      //** 视频 **//
if ($_GET['m']) {
	if (isset($m["" . $_GET['m'] . ""])) {
		echo "<center><h1>" . $_GET['m'] . " 第 " . $page . "页</h1></center>";
		for ($i = $page*10-9;$i <= $page * 10;$i++) {
			$url = "http://k.syasn.com/" . $m["" . $_GET['m'] . ""] . "/" . $m["" . $_GET['m'] . ""] . $i . ".mp4";//视频接口
			echo "<video width='100%' height='100%' controls><source src='" . $url . "' type='video/mp4' /><source src='" . $url . "' type='video/ogg' /><source src='$url' type='video/webm' /><object data='" . $url . "' width='100%' height='100%'><embed src='$url' width='100%' height='100%' /></object></video>";
			echo "<center><hr><h4>" . $_GET['m'] . " 视频ID：" . $i . "</h4><hr><center>";
		}
		echo "<ul class='pagination pagination-lg'>";
		if ($page != 1) { //页数不等于1
			echo "<li><a href='?m=" . $_GET['m'] . "&paeg=" . ($page - 1) . "'>上一页</a></li>";
		}
		for ($i = $page;$i < $page + 10;$i++) { //循环显示出页面
			echo "<li><a href='?m=" . $_GET['m'] . "&page=$i'>$i</a></li>";
		}
		if ($page < 1000) { //如果page小于总页数,显示下一页链接
			echo "<li><a href='?m=" . $_GET['m'] . "&page=" . ($page + 1) . "'>下一页</a></li>";
		}
		echo "</ul>";
	} else {
		echo "<script>alert('找不到视频分类 " . $_GET['m'] . " !');window.location.href='/';</script>";
	};
}else{
?>
        <form action="" method="get">
          <button class="btn btn-info" type="submit" name="m" value="Beautyleg">
            <img src="http://m.beautylegmm.com/usr/themes/mm/timthumb.php?src=/photo/beautyleg/2017/1492/beautyleg-1492-0000.jpg" width="160" height="160">
            <br>Beautyleg</button>
          <button class="btn btn-info" type="submit" name="m" value="3AGirL">
            <img src="http://image.huajiao.com/ea24e21bb9c3cc6671dd37eb039e961d.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>3AGirL</button>
          <button class="btn btn-info" type="submit" name="m" value="4K-STAR">
            <img src="http://www.rq-star.org/d/file/Photo_album/Race_Queen/2015-05-17/4b7d4cddc30b2a7c1dd3812ed023b9ce.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>4K-STAR</button>
          <button class="btn btn-info" type="submit" name="m" value="RQ-STAR">
            <img src="http://wx2.sinaimg.cn/mw690/c82213b6gy1fjzewmnlszj20dc0hs0t4.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>RQ-STAR</button>
          <button class="btn btn-info" type="submit" name="m" value="经典写真">
            <img src="http://picstat.feixun.tv/is/smallimg/zv1kqmhbq6nk2jxh.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>经典写真</button>
          <button class="btn btn-info" type="submit" name="m" value="Rosimm">
            <img src="http://picstat.feixun.tv/is/smallimg/bzhcp2q9y6wz4g2k.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Rosimm</button>
          <button class="btn btn-info" type="submit" name="m" value="Siyamm">
            <img src="http://bsyimg5.cdn.krcom.cn/stream/Z2oixpFvMIwdjO5TrmLmgQ___m.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Siyamm</button>
          <button class="btn btn-info" type="submit" name="m" value="Ru1mm">
            <img src="http://imgkaka.ke12345.net/picss/2017/img/170221/1-1F221155KS13.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Ru1mm</button>
          <button class="btn btn-info" type="submit" name="m" value="Showgirl">
            <img src="http://imgkaka.ke12345.net/picss/2016/img/161204/1-161204135131516.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Showgirl</button>
          <button class="btn btn-info" type="submit" name="m" value="Pantyhose">
            <img src="http://aliv.weipai.cn/201412/19/15/985B1DB6-05F7-4539-ADCA-9132E0E77934.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Pantyhose</button>
          <button class="btn btn-info" type="submit" name="m" value="丽柜Ligui">
            <img src="http://aliv.weipai.cn/201607/20/21/ABE6E983-0358-43F3-9CEA-4F10CC5FCCDF.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>丽柜Ligui</button>
          <button class="btn btn-info" type="submit" name="m" value="细高跟">
            <img src="http://image.huajiao.com/29d7957774df3ba39f3cadce037d659a.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>细高跟</button>
          <button class="btn btn-info" type="submit" name="m" value="微拍福利">
            <img src="http://image.huajiao.com/c3fee5cbec05d445b2e3479d653edad6.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>微拍福利</button>
          <button class="btn btn-info" type="submit" name="m" value="学院派私拍">
            <img src="http://aliv.weipai.cn/direct/video/201708/23/17/5586f6515220f25e028b457f/f4c663e0-f2c2-4fb4-b25e-18493ce5910e.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>学院派私拍</button>
          <button class="btn btn-info" type="submit" name="m" value="性感车模">
            <img src="http://ww2.sinaimg.cn/large/7f050d85gw1etgf3vlw6kj21hc0lc101.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>性感车模</button>
          <button class="btn btn-info" type="submit" name="m" value="PANS写真">
            <img src="http://pic.tesetu.com/2017/0214/14/03.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>PANS写真</button>
          <button class="btn btn-info" type="submit" name="m" value="动感小站">
            <img src="http://image.huajiao.com/4b200d02ac458c7566a1fd87c702593b.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>动感小站</button>
          <button class="btn btn-info" type="submit" name="m" value="锦尚天舞">
            <img src="http://picstat.feixun.tv/is/smallimg/wwm9roel7qgem78e.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>锦尚天舞</button>
          <button class="btn btn-info" type="submit" name="m" value="国产私拍">
            <img src="http://www.goodyyw.com/uploads/allimg/201606/7c2641ec07bc3ab5.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>国产私拍</button>
          <button class="btn btn-info" type="submit" name="m" value="国产私拍II">
            <img src="http://vimg.dwstatic.com/1707/3554636/9-220x124.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>国产私拍II</button>
          <button class="btn btn-info" type="submit" name="m" value="韩国饭拍">
            <img src="http://vimg.dwstatic.com/1716/4439301/9-220x124.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>韩国饭拍</button>
          <button class="btn btn-info" type="submit" name="m" value="韩国饭拍II">
            <img src="http://image.vlook.cn/static/pic/snap_1001/alig.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>韩国饭拍II</button>
          <button class="btn btn-info" type="submit" name="m" value="韩国饭拍III">
            <img src="http://image.huajiao.com/6ab0af88eaa366743db3fd10a6337b9a.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>韩国饭拍III</button>
          <button class="btn btn-info" type="submit" name="m" value="韩国MV">
            <img src="http://image.huajiao.com/35c9b8080b0655367968d921efd78a0a.jpg
" class="img-rounded bg-info" width="160" height="160">
            <br>韩国MV</button>
          <button class="btn btn-info" type="submit" name="m" value="韩国女主播">
            <img src="http://image.huajiao.com/69f999e47534096ff254fe5ccea24526.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>韩国女主播</button>
          <button class="btn btn-info" type="submit" name="m" value="街拍美女">
            <img src="http://image.huajiao.com/0444eab9f2d427f14d2f0ca7780be2d1.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>街拍美女</button>
          <button class="btn btn-info" type="submit" name="m" value="街拍美女II">
            <img src="http://image.huajiao.com/450839f340d438be891f560173d1dbe9.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>街拍美女II</button>
          <button class="btn btn-info" type="submit" name="m" value="街拍美女III">
            <img src="http://bsyimg5.cdn.krcom.cn/stream/2ICRC6wzteuwwrK1FnHkwA___m.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>街拍美女III</button>
          <button class="btn btn-info" type="submit" name="m" value="街拍美女IV">
            <img src="http://t1.hddhhn.com/uploads/tu/201710/31/7b768d43cd.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>街拍美女IV</button>
          <button class="btn btn-info" type="submit" name="m" value="街拍美女V">
            <img src="http://41.javps.com/pic/20160601/11319.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>街拍美女V</button>
          <button class="btn btn-info" type="submit" name="m" value="爱丝AISS">
            <img src="http://image.huajiao.com/36cc5c3d99495a0805bd73b129d19320.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>爱丝AISS</button>
          <button class="btn btn-info" type="submit" name="m" value="推女郎">
            <img src="http://image.huajiao.com/2eb56db1177539d48a5ff3f6b6219265.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>推女郎</button>
          <button class="btn btn-info" type="submit" name="m" value="瑜伽美女">
            <img src="http://image.huajiao.com/26e2e16231cfe7960d4aba8dd1142f99.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>瑜伽美女</button>
          <button class="btn btn-info" type="submit" name="m" value="秀人写真">
            <img src="http://image.huajiao.com/a1d5c6b9dddf897c5a2cbe142d18fa0b.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>秀人写真</button>
          <button class="btn btn-info" type="submit" name="m" value="Ru1mm-vip">
            <img src="http://picstat.feixun.tv/is/smallimg/pk5br9zjqsrgs21c.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Ru1mm-vip</button>
          <button class="btn btn-info" type="submit" name="m" value="Allure Girls">
            <img src="http://image.huajiao.com/4f8246d551d170186d4049636e5c2b4d.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Allure Girls</button>
          <button class="btn btn-info" type="submit" name="m" value="中高艺">
            <img src="http://mvimg10.meitudata.com/570873b72aad970.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>中高艺</button>
          <button class="btn btn-info" type="submit" name="m" value="芬妮玉足">
            <img src="http://img.souutu.com/2017/0819/20170819061653473.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>芬妮玉足</button>
          <button class="btn btn-info" type="submit" name="m" value="Ugirls尤果">
            <img src="http://img.juemei.com/dimg/2017-11-16/5a0cf7ed36411_s.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>Ugirls尤果</button>
          <button class="btn btn-info" type="submit" name="m" value="赤足者">
            <img src="http://image.huajiao.com/f30a4acc09d968f5a203c1702ee169fc.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>赤足者</button>
          <button class="btn btn-info" type="submit" name="m" value="BL时尚写真">
            <img src="https://k.sinaimg.cn/n/ent/4_img/upload/d411fbc6/20171117/qTKO-fynwnws0451525.jpg/w640slw.jpg" class="img-rounded bg-info" width="160" height="160">
            <br>BL时尚写真</button></form>
<?php }; ?>
      </div>
      <hr>
      <div class="panel panel-default">
        <div class="panel-body"></div>
      </div>
    </div>
  <div style="display:none;">
      
        </div>
      </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </div>
<div style="text-align:center;">

	<span style="line-height:1.5;color:#E53333;"><?php echo $title; ?></span><span style="line-height:1.5;color:#009900;">版权所有</span><span style="line-height:1.5;"> - </span><a href="https://github.com/zhizg/b" target="_blank"><span style="color:#337FE5;">官方网站</span></a>
</div>
<div style="text-align:center; display:none">
';  include 'footer.php';?>
<!-- ShareTo Button BEGIN -->
<!--百度收录自动推送-->
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
<a class="shareto_button" href="http://shareto.com.cn/share.html"><img src="http://s.shareto.com.cn/btn/lg-share-cn.gif" width="125" height="21" alt="分享道" style="border:0"/></a>
<script type="text/javascript" src="http://s.shareto.com.cn/js/shareto_button.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>
<noscript><a href="http://www.51.la/?18759442" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18759442.asp" style="border:none" /></a></noscript>
</body></html>
</div>
</body>
</html>
