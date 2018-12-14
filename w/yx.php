<?php
include ('../inc/aik.config.php');
?>
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo $aik['sitename'];?>在线HTML游戏</title>
	<meta name="keywords" content="<?php echo $aik['title'];?>,电视直播网站,零八影院快播,高清云影视,云点播,免费看视频,湖南卫视直播,80电影网,最新电影天堂免费在线观看">
<meta name="description" content="<?php echo $aik['title'];?>,热剧快播,最好看的剧情片尽在<?php echo $aik['title'];?>,高清云影视免费为大家提供最新最全的免费电影，电视剧，综艺，动漫无广告在线云点播，以及电视直播">
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

<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>
<noscript><a href="http://www.51.la/?18759442" target="_blank"></a></noscript>
</div>
	<!--必要js-->
	<script type="text/javascript" src="cs/jquery-1.11.2.min.js" ></script>
	<!--必要样式-->
	<link rel="stylesheet" href="cs/style.css" />
  	<!--菜单-->
  	<link rel="stylesheet" href="cs/menu.css">
	<script type="text/javascript" src="cs/materialMenu.min.js"></script>
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
	<script>
		$(function(){
			$('#vip_menu').load('menu.html');
			
		});
	</script>
	</head>
	<body>
	<div id="vip_menu"></div>
	<div id="wrapper" class=""><!-- /wrapper -->
		<marquee style="border:solid 2px #a1d9f2;" direction="left"><span style="color:#009CDA; font-weight: bold;">公告：<?php echo $aik['sitename'];?>在线HTML游戏体验功能，更多精彩资源请关注官方发布信息哦。</span></marquee>
		<iframe id="calls" src="http://h5.qq.com" width="100%" height="95%" style="position: absolute;top: 5%;"></iframe>
	</div><!-- /wrapper -->
	</body>
</html>
