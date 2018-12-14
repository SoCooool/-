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
<title><?php echo $aik['sitename'];?>-免VIP抢先观看最新好看的电影和电视剧</title>
<link rel='stylesheet' id='main-css'  href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='main-css'  href='css/index.css' type='text/css' media='all' />
<script type='text/javascript' src='http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js?ver=0.5'></script>
<meta name="keywords" content="<?php echo $aik['title'];?>,电视直播网站,零八影院快播,高清云影视,云点播,免费看视频,湖南卫视直播,80电影网,最新电影天堂免费在线观看">
<meta name="description" content="<?php echo $aik['title'];?>,智云影音，热剧快播,最好看的剧情片尽在<?php echo $aik['title'];?>,高清云影视免费为大家提供最新最全的免费电影，电视剧，综艺，动漫无广告在线云点播，以及电视直播">
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->
</head>
<body>
<body class="page-template page-template-pages page-template-posts-film page-template-pagesposts-film-php page page-id-9">
<?php  include 'header.php';?>
<section class="container">
</div><p style="text-align: center;color: #F00;font-size: 10px;background: #eee;padding: 6px 2px;border-radius: 2px;">提示:本直播平台功能仅供手机在线观看哦！请使用手机打开本站观看！如视频播放不全屏，请刷新本直播页即可</p>

<!--智云影音源码开源QQ:2248186422-->
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
		speedTime.buzId = BUSINESSID;speedTime.pageId=2002;speedTime.version = VERSION;speedTime.pageCssTime1 = Date.now();
		</script>
		<link rel="stylesheet" type="text/css" href="http://misc.live.xunlei.com/h5/h5/1.2.7/css/style.css?20161130" />
		<script type="text/javascript">speedTime.pageCssTime2 = Date.now();</script>
		<style type="text/css">
			.playready{
				height: 320px;
			}
			.playready .vedio_wp, .playready .videoposter,.playready video{
				height: 320px;
			}
		</style>
	</head>
	<body>
		
		<div class="wrap">
			<div class="live_room stat-div" id="liveing" style="display:none;">
				<!-- 视频区 -->
				<div class="vedio_wp">
					<div class="vedio" style="width:1px;height: 1px;">
						<!-- 放置视频 -->
						<div id="player-video">
						</div>
						
					</div>	
				</div>
				<!-- 视频区 end -->

				<!-- 互动区 -->
				<div class="live_info">
					<div class="live_info_hd">
						<div class="player">
							<div class="player_dt">
								<div class="avatar"><img src="" alt=""></div>
								<div class="info">
									<p class="name"></p>
									<p id="play-stat"></p>
								</div>
								<a href="javascript:;" item="0" clickid="0.2.2.0" class="btn_focus down-app">关注</a>	
							</div>
							<div class="player_oth">人气<span class="num"></span></div>
						</div>
					</div>
					<i class="ico_play" id="startplay" style=" position: absolute; left: 50%; top:40%; margin-left: -50px;"></i>
					
					<div class="live_info_bd">
						<div class="combofit_box" id="gift-box">
							<!-- 礼物连击浮层 -->		
						</div>


										<!--这里是点赞信息 -->
									</div>
								</li>
							</ul>
		
							<!-- 打开APP -->
						</div>
					</div>
				</div> 
				<!-- 互动区 end -->

			</div>
			
			<!-- 暂停 开始页面 -->
			<!--<div class="live_tip stat-div" id="preVedio" style="display: none;">
				<div class="img_lt"><img class="avator_img" src="" alt="" /></div>
				<div class="msg_lt" id="beforePlay" style="">
					<i class="ico_play" id="startplay"></i>
					<p class="des" style="display:none;"><span class="clr_main"></span>人观看</p>
				</div>
				
				<div class="msg_lt" id="loading" style="display:none;">
					<i class="ico_loading"></i>
				</div>
			</div>-->
			

			<!-- 还未开始 -->
			<div class="live_tip stat-div" id="notLive" style="display: none;">
				<div class="img_lt"><img class="avator_img" src="" alt=""></div>
				<div class="msg_lt">
					<p class="tit">直播即将开始</p>
					<p class="des">稍等一下嘛</p>
					<a class="lnk_goto" href="#hotlistid">去看看其他热门直播&gt;</a>
				</div>

			</div>

			<!-- 播放结束 -->
			<div class="live_tip stat-div" id="overLive" style="display:none;">
				<div class="img_lt"><img class="avator_img" src="" alt=""></div>
				<div class="msg_lt">
					<p class="tit">直播已结束</p>
					<p class="des" id="num"></p>
					<a class="lnk_goto" href="#hotlistid">去看看其他热门直播&gt;</a>
				</div>	
			</div>
			<!-- 播放结束 -->
			

			<!-- 提示消息start -->
			<div class="live_tip stat-div" id="msgerror" style="display: none;">
				<div class="img_lt"><img class="avator_img" src="" alt=""></div>
				<div class="msg_lt">
					<p class="tit">直播结束</p>
					<p class="des">智云影音源码开源联系QQ:2248186422</p>
				</div>	
			</div>
			<!-- 提示消息end -->
			
			<!-- 主播名片 -->
			<div class="anchor_card stat-div" style="sdisplay:none;">
				<div class="avatar"><img class="avator_img1" src="" alt="" /></div>
				<div class="texwrap">
					<p class="name"></p>
					<p class=""><?php echo $aik['sitename'];?>直播平台</p>
				</div>
				<div class="opts">
					<a class="btn_fc down-app" href="javascript:;"><?php echo $aik['sitename'];?></a>
					<!-- 已关注 -->
					<!--<a class="btn_fc focused" href="javascript:;" style="display: none;">已关注</a>-->
				</div>
			</div>
				
				
			
			
			<div id="showmsgsss">
				
			</div>
			
				</div>	
			</div>
			<!-- 热门直播 end -->

			
			
			
			
			<!-- 智卓星网源码开源官方QQ:2248186422 -->

		<div class="pop_msgtip_box" id="showmsg-div" style="display:none;">
			<div class="tex">
				<p></p>
			</div>
		</div>
		<script type="text/javascript">speedTime.pageHtmlTime = Date.now();</script>
		<script type="text/javascript">speedTime.pageJsTime1 = Date.now();</script>
		<script src="http://misc.live.xunlei.com/h5/h5/seajs/sea.js"></script>
		<script src="http://misc.live.xunlei.com/h5/h5/1.2.7/js/public/sea.config.js?v=20180721" id="seajs-config" data-name="room"></script>
		

		<!-- 聊天 -->
</div>
			</div>
		</script>

		<!-- 热门直播列表信息 -->
		<script id="hotlive-template" type="text/template">

			<% 
			var flag = 0; 
	
			if (infos.inshoulei ==1) { 
				var product = "shoulei";
			}else{
				product = "share";
			}
			
			_.each(infos, function(info,i) {
				if(info.userid == userid){
					flag = 1;
				} else if((flag == 0 && i < 6)||flag == 1){
			
			%>
			<div class="hot_item">
				<% var url = encodeURIComponent(info.userinfo.avatar);  %>
				<a href="http://h5.live.xunlei.com/h5/room.html?roomid=<%= info.roomid %>&avator=<%=url%>&product=<%=product%>" clickid="0.3.8.0">
					<div class="entry_wp">
						<div class="vedio_pic">
							<img src="<%= info.userinfo.avatar %>" alt="<%= info.userinfo.nickname %>">
						</div>
						<p class="tip"><% if(info.status==2){%>回放<%}else{%>直播<%}%></p>
					</div>
					<div class="player_info">
						<p class="name"><%= info.userinfo.nickname %></p>
						<p class="see"><%= info.onlinenum %></p>
					</div>
				</a>
			</div>
			<%} });%>
		</script>
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
	</body>
	<script type="text/javascript" src="http://misc.live.xunlei.com/h5/h5/tcPlayer/TcPlayer-2.2.1.js"></script>
	<script type="text/javascript">speedTime.pageJsTime2 = Date.now();</script>
	

</div>

<!--智卓星网直播源码开源版权-->
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
