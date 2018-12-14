<?php 
include('config.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件基地影视管理后台 - Powered by www.vipyh.vip/vip</title>
<meta name="keywords" content="软件基地影视" />
<meta name="description" content="软件基地影视，http://www.vipyh.vip/vip/" />
<link href="./images/woaik.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="./../favicon.ico">
</head>
<body>
<?php $nav = 'home';include('head.php'); ?>
<div id="hd_main">
   <div style="margin:20px;">

      <table width="600" border="0" class="tablecss" cellspacing="0" cellpadding="0" align="center">
   <tr>
    <td colspan="2" align="center">欢迎使用软件基地影视管理系统！</td>
    </tr>
  <tr>
    <td align="right">当前使用版：</td>
    <td><span>V3.6.1</span></td>
  </tr>
  <tr>
    <td align="right">最新版：</td>
    <td><a href="https://shop107536151.taobao.com" target="_blank"><font color="#FF0000">点击查看</font></a></td>
  </tr>
  <tr>
    <td width="213" align="right">服务器操作系统：</td>
    <td width="387"><?php $os = explode(" ", php_uname()); echo $os[0];?> (<?php if('/'==DIRECTORY_SEPARATOR){echo $os[2];}else{echo $os[1];} ?>)</td>
  </tr>
  <tr>
    <td width="213" align="right">服务器解译引擎：</td>
    <td width="387"><?php echo $_SERVER['SERVER_SOFTWARE'];?></td>
  </tr>
  <tr>
    <td width="213" align="right">PHP版本：</td>
    <td width="387"><?php echo PHP_VERSION?></td>
  </tr>
  <tr>
    <td align="right">源码：</td>
    <td>老司机多功能开源版</td>
  </tr>
  <tr>
    <td align="right">allow_url_fopen：</td>
    <td><?php echo ini_get('allow_url_fopen') ? '<span class="green">支持</span>' : '<span class="red">不支持</span>'?></td>
  </tr>
  <tr>
    <td align="right">curl_init：</td>
    <td><?php if ( function_exists('curl_init') ){ echo '<span class="green">支持</span>' ;}else{ echo '<span class="red">不支持</span>';}?></td>
  </tr>

<tr>
    <td align="right">/data/目录权限检测：</td>
    <td><?php echo is_writable('../data/') ? '<span class="green">可写</span>' : '<span class="red">不可写</span>'?></td>
  </tr>  

  <tr>
    <td colspan="2" style="line-height:220%; text-indent:28px;">欢迎使用本程序，源码交流群<font color="red">（①号QQ群:704059525，站长QQ1：804469067）</font></a>，感谢朋友们的支持！</br>更多精品源码发布请移步：<a href="https://www.rjjd6.com" target="_blank">https://www.rjjd6.com</a></font></br></br>
3.6版本更新：</br>
1.增加MV及YY视频分类。增加电视直播页面。</br>
2.增加各大直播网站采集功能，自动更新采集播放，直播采集。</br>
3.电视剧部分增加播放源，电影增加BT下载链接。</br>
4.部分页面重写，修改调用方式，增加页面速度。</br>
5.增加观看历史。</br>
6.首页自动生成静态页面，增加加载速度。</br>
7.线路接口缩减为5个。</br>
8.侵权视频页面修改为跳转404。</br>
9.新增加各种在线工具类及音频解析功能工具源码，新增加导航分类</br>
10.新增加各种采集类源码，采集插件，镜像源码</br>
11.本源码程序为多功能版本源码！修复了其他一些小BUG。</br>
</td> 
    </tr>
   
</table>

   </div>

</div>
<?php include('foot.php'); ?>
</body>
</html>
