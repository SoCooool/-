<?php 
?>﻿<?php
include('../inc/aik.config.php');include('./inc/fenye.php');?>
<?='<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="cache-control" content="no-siteapp">
<title>综合视频列表-'; echo $aik['title'];?><?="</title>
<link rel='stylesheet' id='main-css'  href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='main-css'  href='css/gaoxiao.css' type='text/css' media='all' />
<script type='text/javascript' src='http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js?ver=0.5'></script>
<meta name=\"keywords\" content=\"综合排行\">
<meta name=\"description\" content=\""; echo $aik['title'];?><?='-综合排行">
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->
</head>

<body class="page-template page-template-pages page-template-posts-film page-template-pagesposts-film-php page page-id-9">
';  include 'header.php';?>
<?='<section class="container"><div class="fenlei">
<div class="b-listfilter" style="padding: 0px;">
<style>
#noall{
	background-color: #ff6651;
    color: #fff;
}
</style>
<dl class="b-listfilter-item js-listfilter" style="padding-left: 0px;height:auto;padding-right:0px;">
<dd class="item g-clear js-listfilter-content" style="margin: 0;">
';
 $do1='http://list.youku.com/category/video/c_0_d_1_s_2_p_1';$do2='http://list.youku.com/category/video/c_86_d_1_s_2_p_1';$do3='http://list.youku.com/category/video/c_177_d_1_s_2_p_1';$do4='http://list.youku.com/category/video/c_91_d_1_s_2_p_1';$do5='http://list.youku.com/category/video/c_105_d_1_s_2_p_1';$do6='http://list.youku.com/category/video/c_84_d_1_s_2_p_1';$do7='http://list.youku.com/category/video/c_95_d_1_s_1_p_1';$do8='http://list.youku.com/category/video/c_103_d_1_s_2_p_1';$do9='http://list.youku.com/category/video/c_99_d_1_s_2_p_1';$do10='http://list.youku.com/category/video/c_104_d_1_s_2_p_1';$do13='http://list.youku.com/category/video/c_89_d_1_s_1';$do17='http://list.youku.com/category/video/c_171_d_1_s_2_p_1';$do37='http://list.youku.com/category/video/c_88_d_1_s_2_p_1';$do47='http://list.youku.com/category/video/c_90_d_1_s_2_p_1';$do57='http://list.youku.com/category/video/c_87_d_1_s_2_p_1';$do67='http://list.youku.com/category/video/c_vr_d_1_s_1';$do77='http://list.youku.com/category/video/c_174_d_1_s_2_p_1';
$do87='http://list.youku.com/category/video/c_175_d_1_s_2_p_1';
$do97='http://list.youku.com/category/video/c_176_d_1_s_2_p_1';
$do27='http://list.youku.com/category/video/c_102_d_1_s_2_p_1';$do11=base64_encode($do1);$do21=base64_encode($do2);$do31=base64_encode($do3);$do41=base64_encode($do4);$do51=base64_encode($do5);
$do61=base64_encode($do6);$do71=base64_encode($do7);$do81=base64_encode($do8);$do91=base64_encode($do9);$do12=base64_encode($do10);$do14=base64_encode($do13);$do16=base64_encode($do17);$do18=base64_encode($do37);$do19=base64_encode($do47);$do20=base64_encode($do57);$do22=base64_encode($do67);$do24=base64_encode($do77);$do26=base64_encode($do87);$do28=base64_encode($do97);$do29=base64_encode($do27);?>
<a href="?m=<?php echo $do11;?>">最新综合</a>
<a href="?m=<?php echo $do21;?>">娱乐资讯</a>
<a href="?m=<?php echo $do31;?>">儿童频道</a>
<a href="?m=<?php echo $do41;?>">资讯频道</a>
<a href="?m=<?php echo $do51;?>">科技频道</a>
<a href="?m=<?php echo $do61;?>">纪实频道</a>
<a href="?m=<?php echo $do71;?>">音乐频道</a>
<a href="?m=<?php echo $do81;?>">生活频道</a>
<a href="?m=<?php echo $do91;?>">游戏频道</a>
<a href="?m=<?php echo $do12;?>">汽车频道</a>
<a href="?m=<?php echo $do14;?>">时尚频道</a>
<a href="?m=<?php echo $do18;?>">旅游频道</a>
<a href="?m=<?php echo $do19;?>">亲子频道</a>
<a href="?m=<?php echo $do20;?>">教育频道</a>
<a href="?m=<?php echo $do24;?>">拍客频道</a>
<a href="?m=<?php echo $do26;?>">创意频道</a>
<a href="?m=<?php echo $do28;?>">自拍频道</a>
<a href="?m=<?php echo $do29;?>">广告频道</a>
<a href="?m=<?php echo $do22;?>">VR频道</a>
<a href="?m=<?php echo $do16;?>">微电影</a>
<?php
include 'list.php';$page=$_GET['page'];?>
<?='</dd>
</dl>
</div>
</div>
<div class="m-g">
<div class="b-listtab-main">
<div class="box-bd">
<ul class="mod-pic">	
';
$flid1=$_GET['m'];$arr=explode('p_',$flid1);$yourneed=$arr[0];$yema=base64_decode($yourneed);$arr=explode('p_',$yema);$yemama=$arr[0];$mama='p_';$flid2=''.$yemama.$mama.$page.'';$rurl=file_get_contents($flid2);$vname='#<div class="yk-col4 "><div class="yk-pack p-list" taglog=""><div class="p-thumb"><a href="(.*?)" target="_blank" title="(.*?)"></a><i class="bg"></i><img class="quic"  src="(.*?)" alt="(.*?)"/></div><ul class="p-info pos-bottom"><li class="status"><span class="p-time hover-hide"><i class="ibg"></i><span>(.*?)</span></span></li></ul><ul class="info-list"><li class="title"><a href="(.*?)" target="_blank" title="(.*?)">(.*?)</a></li><li class=" ">(.*?)</li></ul></div></div>#';preg_match_all($vname,$rurl,$xarr);preg_match_all($yeshu,$rurl,$xarr1);$xbflist=$xarr[1];$xname=$xarr[2];$ximg=$xarr[3];$shijian=$xarr[5];$lianye=$xarr1[1];$fenye=$xarr1[2];foreach($xname as $key=>$xvau){$do=$xbflist[$key];$do1=base64_encode($do);$cc='./mplay.php?play=';$ccb=$cc.$do1;echo "
	<li>							
<a class='hele-text' href='$cc$do1' target='_blank'>$xname[$key]</a>
<a href='$cc$do1' target='_blank'><img src='$ximg[$key]' border='0' width='120' height='120' alt='$xname[$key]'></a><span>$shijian[$key]</span>								
								</li>
";}?>
<?='  </ul>
      </div>


    </div>
</div> <div class="paging">
';  $b=(strpos($yema,'g_'));$c=(strpos($yema,'_d'));$ye=substr($yema,$b+2,$b-$c-7);if($ye==235){$fenye=('25');}elseif($ye==236){$fenye=('12');}elseif($ye==238){$fenye=('15');}elseif($ye==307){$fenye=('1');}else{$fenye=('25');}echo getPageHtml($page,$fenye,'ga.php?m='.$yourneed.'p_');?><a>共<?php echo $fenye;?><?='页</a></div>
<div class="asst asst-list-footer">'; echo $aik['movie_ad'];?></div></section>
<?php  include 'footer.php';?>
</body></html>
