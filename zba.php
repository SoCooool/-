<?php
include ('./inc/aik.config.php');
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
<title><?php echo $aik['title'];?>-免VIP抢先观看最新好看的电影和电视剧</title>
<link rel='stylesheet' id='main-css'  href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='main-css'  href='css/index.css' type='text/css' media='all' />
<script type='text/javascript' src='http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js?ver=0.5'></script>
<meta name="keywords" content="<?php echo $aik['title'];?>,电视直播网站,零八影院快播,高清云影视,云点播,免费看视频,湖南卫视直播,80电影网,最新电影天堂免费在线观看">
<meta name="description" content="<?php echo $aik['title'];?>,热剧快播,最好看的剧情片尽在<?php echo $aik['title'];?>,高清云影视免费为大家提供最新最全的免费电影，电视剧，综艺，动漫无广告在线云点播，以及电视直播">
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->
</head>
<body>
<body class="page-template page-template-pages page-template-posts-film page-template-pagesposts-film-php page page-id-9">
<?php  include 'header.php';?>
<section class="container">


<!--智云影音版权-->


<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />

		<script type="text/javascript">speedTime = {} ; speedTime.pageStartTime = Date.now();</script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no, email=no"/>
		 













<script>
	var VERSION = "1.2.7/",
		MISCPATH = "http://misc.live.xunlei.com/h5/h5/1.2.7/",
		SOURCEPATH = "http://misc.live.xunlei.com/h5/h5/",
		LISTPATH = "http://list.live.xunlei.com/",
		BIZPATH = "http://biz.live.xunlei.com/caller",
		REPORTURL = "http://biz.live.xunlei.com/caller",
		H5PATH = "http://h5.live.xunlei.com/",
		SUFFIX = "20180721";
		BUSINESSID = "2";
	var androidUrl = '',
	iosUrl = '';

</script>
		<script type="text/javascript">
		speedTime.buzId = BUSINESSID;speedTime.pageId=2001; speedTime.version = VERSION; speedTime.pageCssTime1 = Date.now();
		</script>
		<link rel="stylesheet" type="text/css" href="http://misc.live.xunlei.com/h5/h5/1.2.7//css/style.css?v=20180721" />
		<script type="text/javascript">speedTime.pageCssTime2 = Date.now();</script>
	</head>
	<body>
		<div class="wrap">
			<div class="showlist_wp">
				<div class="showlist">

				</div>
				<div id="list-tips" class="paging_load">
					<p class="loading" style="display: none;"><i class="it"></i><i class="it"></i><i class="it"></i></p>
					<p class="loaded" style="display: none;">到底了哦！<a href="#">回到顶部<i class="ico_rocket"></i></a></p>
				</div>
			</div>
			
			<div class="pop_download" style="display: none;"><!-- btn_down down-app -->
				<a class="pop_download_m down-app" href="#" clickid="0.1.1.0">
					<div class="appdt">
			</div>
		</div>
		<!-- 智卓星网源码开源 -->
		</div>
		<div class="pop_wp iospop" style="display: none;">
			<div class="pop_box pop_iostip_box" >
				<div class="pop_panel">
					</div>
				</div>
				<a href="#" class="pop_close"></a>
			</div>
		</div>
		<script type="text/javascript">speedTime.pageHtmlTime = Date.now();</script>
		<script type="text/javascript">speedTime.pageJsTime1 = Date.now();</script>
		<script src="http://misc.live.xunlei.com/h5/h5/seajs/sea.js"></script>
		<script src="http://misc.live.xunlei.com/h5/h5/1.2.7/js/public/sea.config.js?v=20180721" id="seajs-config" data-name="index"></script>



		<!-- 热门直播列表信息 -->
		<script id="liveing-template" type="text/template">
			<% _.each(infos, function(info) {%>
				<% var url = encodeURIComponent(info.userinfo.avatar);  %>
				<% if (infos.inshoulei ==1) { 
					var product = "shoulei";
					}else{
						product = "share";
					}
				%>
				<div class="show_item">
				<a class="openurl" href="javascript:void(0);" data-url="live.php?roomid=<%= info.roomid %>&avator=<%=url%>&product=<%=product%>" clickid="0.6.9.0">
					<div class="player_info">
						<div class="player">
							<div class="avatar"><img src="<%= info.userinfo.avatar2 %>" alt="<%= info.userinfo.nickname %>"></div>
							<p class="name"><%= info.userinfo.nickname %></p>
						</div>
						<div class="see">
							<p><span style="color: #f6575f !important;"><%= info.onlinenum %></span>人<% if(info.status==2){%> 看过<%}else{%> 在看<%}%></p>
						</div>
					</div>
					<div class="entry_wp">
						<div class="vedio_pic">
						<img src="<%= info.userinfo.avatar %>">
						</div>
						<p class="tip"><% if(info.status==2){%>回放<%}else{%>直播<%}%></p>
					</div>
					<% if(info.title != ''){ %>
					<div class="des_show">
						<p><%= info.title %></p>
					</div>
					<% } %>
					</a>
				</div>
			<%});%>
		</script>
		<script type="text/javascript">speedTime.pageJsTime2 = Date.now();</script>
		<script type="text/javascript">
	function downloadJSAtOnload() {
		var urls = [
//				SOURCEPATH+'http://h5.live.xunlei.com/h5/player/sewise.player.min.js',
			SOURCEPATH + 'http://h5.live.xunlei.com/h5/tongji/speed.js?v='+SUFFIX,
//			SOURCEPATH + 'http://h5.live.xunlei.com/h5/tongji/md5.js',
			SOURCEPATH + 'http://h5.live.xunlei.com/h5/tongji/pv_click.js?v='+SUFFIX
		];
		for (var i in urls) {
			var url = urls[i];
			var element = document.createElement("script");
			element.src = url;
			document.body.appendChild(element);
		}
	}
	function delayOnload() {
		if (typeof (window.load) == "undefined" || window.load == 3) {
			var intval1 = setInterval(function () {
				if (window.load == 1 || window.load == 2) {
					downloadJSAtOnload();
					try {
						clearInterval(intval1);
					} catch (e) {
					}
				}
			}, 500);
		} else {
			downloadJSAtOnload();
		}
	}
	if (window.addEventListener) {
		window.addEventListener("load", delayOnload, false);
	} else if (window.attachEvent) {
		window.attachEvent("onload", delayOnload);
	} else {
		window.onload = delayOnload;
	}
</script>
</div>
<!--智卓星网官方源码开源-->
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

<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>
<noscript><a href="http://www.51.la/?18759442" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18759442.asp" style="border:none" /></a></noscript>
</div>

</body>
</html>
