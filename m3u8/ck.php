<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智云影音—云解析调用演示</title>
<style type="text/css">body,html,div{padding: 0;margin: 0;width:100%;height:100%;psotion:relative;"}</style>
</head>
<body>
<div id="a1" style="psotion:relative;"></div>
<script type="text/javascript" src="ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
    var vid='<?php echo $_GET['url'];?>';
	var flashvars={
	    f: '/ckm3u8/ckplayer/m3u8.swf', 		//使用swf向播放器发送视频地址进行播放
		a: vid,     
	    c: 0,		//调用 ckplayer.js 配置播放器
	    p: 1,		//自动播放视频
	    s: 4,		//flash插件形式发送视频流地址给播放器进行播放
	    lv: 0
	};
	var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
	var isiPad = navigator.userAgent.match(/iPad|iPhone|Linux|Android|iPod/i) != null;
    if (isiPad) {
        document.getElementById('a1').innerHTML = '<video src="'+vid+'" controls="controls" autoplay="autoplay" width="100%" height="100%" style="psotion:relative;""></video>'
	}else{
	    CKobject.embedSWF('ckplayer/ckplayer.swf','a1','ckplayer_a1','100%','100%',flashvars,params);
	}
  </script>
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
