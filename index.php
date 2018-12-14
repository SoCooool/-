<?php ob_start(); ?>
<?php
include ('./inc/aik.config.php');
$link=$aik['pcdomain'];
?>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="cache-control" content="no-siteapp">
<title><?php echo $aik['title'];?></title>
<link rel='stylesheet' id='main-css'  href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='main-css'  href='css/index.css' type='text/css' media='all' />
<script type='text/javascript' src='http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js?ver=0.5'></script>
<meta name="keywords" content="<?php echo $aik['keywords'];?>">
<meta name="description" content="<?php echo $aik['description'];?>">
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->
</head>
<body class="home blog">
<?php  include 'header.php';?>
<div id="homeso">
<form method="get" id="soform" style="text-align: center;float: none" action="<?php echo $link;?>seacher.php">
<?php echo $aik['logo_ss'];?><br><br>
<input tabindex="2" class="homesoin" id="sos" name="sousuo" type="text" placeholder="输入你要观看的视频名或视频网址" value="">
<input type="hidden" name="qiehuan" value="1">
<select class="homesobtn"  id="s1" onchange="valuechange()">
  <option value="q">全网搜索</option>
  <option value="b">网盘搜索</option> 
  <option value="d">磁力搜索</option>
  <option value="m">MV搜索</option>
</select>
<button id="button" tabindex="3" class="homesobtn" type="submit">搜索</button>
</form>
<script>
 function  valuechange(){
 var qiehuan = document.getElementById('s1').value;
  if(qiehuan=='q'){
  document.getElementById('soform').action = '<?php echo $link;?>seacher.php';
  document.getElementById('imgsrc').src = 'images/sologo.png';
  }else if(qiehuan=='b'){
  document.getElementById('soform').action = '<?php echo $link;?>bdpan.php';
  document.getElementById('imgsrc').src = 'images/wp.png';
  }else if(qiehuan=='c'){
  document.getElementById('soform').action = '<?php echo $link;?>yhq.php';
  document.getElementById('imgsrc').src = 'images/yhq.png';
  }else if(qiehuan=='d'){
  document.getElementById('soform').action = '<?php echo $link;?>cili.php';
  document.getElementById('imgsrc').src = 'images/cili.png';
  }else{
  document.getElementById('soform').action = '<?php echo $link;?>mv.php';
  document.getElementById('imgsrc').src = 'images/mv.png';
  }
  }
	var a = document.getElementById('sos');
	var btn = document.getElementById('button');
btn.onclick = function(){
 var reg = /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/;
 if(!reg.test(a.value)){
	 if(!a.value){
		 alert('不能为空');
	 }else{
	 }
 }
 else{
var url = '<?php echo $link;?>splay.php?play='+a.value;
window.location.href=url;
 return false;
 }
}
</script>
</div>
<section class="container">


<div class="single-strong">电影尝鲜<span class="chak"><a href="./movie.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/zwcx.php';?>
</ul>
</div>
</div>
<div class="single-strong">最新影音资源<span class="chak"><a href="./index.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/fbcx.php';?>
</ul>
</div>
</div>

<div class="single-strong">最新热门电影推荐<span class="chak"><a href="./movie.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/newdyjx.php';?>
</ul>
</div>
</div>


<div class="single-strong">最新热门电视剧推荐<span class="chak"><a href="./tv.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/tvjx.php';?>
</ul>
</div>
</div>

<div class="single-strong">最新热门综艺推荐<span class="chak"><a href="./zongyi.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/zydy.php';?>
</ul>
</div>
</div>

<div class="single-strong">最新热门动漫推荐<span class="chak"><a href="./dongman.php">查看更多</a></span></div>
<div class="b-listtab-main">
<div class="s-tab-main">
<ul class="list g-clear">
<?php include './data/dmdy.php';?>
</ul>
</div>
</div>
</section>
<?php  include 'footer.php';?>
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
</body>
</html>
<?php
$info = ob_get_contents(); // 这个是这个页面的所有信息
$filectime = filectime("index.html"); // 这个index.html改成你需要的
if ( !(time() - 60 > $filectime) ) { //  这个设置每天进行更换 3600*24是时间
exit();
}
if ( $handle = @fopen('index.html', 'w') ) { // 这个index.html改成你需要的
@fwrite($handle, $info);
@fclose($handle);
}
?>
