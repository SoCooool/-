<?php
include ('../inc/aik.config.php');
?>
<?php 
function trimall($str){
$qian=array("'");$hou=array('"');
return str_replace($qian,$hou,$str);    
}
function Getjson($id){
$url = 'http://player.kuwo.cn/webmusic/gu/getwebbang?syId='.$id;
$refer = 'http://player.kuwo.cn/webmusic/gu/getwebbang?syId='.$id;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
curl_setopt($ch, CURLOPT_REFERER, $refer);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.154 Safari/537.36 LBBROWSER');
$mp3url = curl_exec($ch);
curl_close($ch); 
$jsondecode = json_decode(trimall($mp3url),true);
return $jsondecode;
}
function Getmusic($id){
$url = 'http://antiserver.kuwo.cn/anti.s?rid='.$id.'&format=mp3&type=convert_url&response=url';
$refer = 'http://www.kuwo.cn/yinyue/'.$id;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
curl_setopt($ch, CURLOPT_REFERER, $refer);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.154 Safari/537.36 LBBROWSER');
$mp3url = curl_exec($ch);
curl_close($ch); 
return $mp3url;
}?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>酷我音乐播放–<?php echo $aik['sitename'];?></title>
<meta name="keywords" content="<?php echo $aik['title'];?>,在线解析,电视直播网站,零八影院快播,高清云影视,云点播,免费看视频,湖南卫视直播,80电影网,最新电影天堂免费在线观看">
<meta name="description" content="<?php echo $aik['sitename'];?>,音乐解析播放" />
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
<style>.table th,.table td{text-align:left}.table td a{color:#777;}.table td a:hover{color:#000}.footer{text-align:center;color:#777;padding:15px 10px}.footer a{color:#777;text-decoration:none}.sharetitle{background-color:#FF8391;border-color:#FF8391;margin:20px auto 10px;color:#fff}.sharetitle a{padding-right:15px;color:#fff}</style>
</head>
<body style="background-color:#f7f7f7">
<div class="container">
<div class="row" style="margin:0 10px">
<div class="alert alert-info sharetitle" role="alert"><a href="kuwoku.php">酷我新歌榜</a> <a href="kuwoku.php?type=1">酷我热歌榜</a> <a href="kuwoku.php?type=5">酷我经典榜</a><a href="kuwoku.php?type=2">酷我日韩榜</a><a href="kuwoku.php?type=3">酷我欧美榜</a><a href="kuwoku.php?type=7">百度新歌榜</a><a href="kuwoku.php?type=6">百度热歌榜</a></div>
<table class="table" style="background:#fff">
<div class="alert alert-info sharetitle" role="alert">试听点击编号在点播放
<embed type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" src="http://bd.kuwo.cn/mpage/pcbaiduhz/swf/dqplay.swf?rid=<?php echo $_GET['hy'] ?>&initplay=1" width="345" height="33" align="none" wmode="transparent" allowfullscreen="true" />

<thead>
<tr>
<th>#</th>
<th>歌曲名称</th>
<th>歌手名称</th>
<th>歌曲编号</th>
</tr>
</thead>
<tbody>
<?php	
$typeid = isset($_GET['type']) ? intval($_GET['type']) : '0';
$getjson = Getjson($typeid);
$jsonlist = $getjson['list'];$i=0;
foreach($jsonlist as $row):$i++;?>
<tr>
<th scope="row"><?php echo $i;?></th>
<td><?php echo $row['name'];?></td>
<td><?php echo $row['art'];?></td>
<td><a href="kuwoku.php?hy=<?php echo $row['rid'];?>" target="_blank"><?php echo $row['rid'];?></a></td>
</tr>
<?php endforeach;?>
</tbody></table>
</div>
</div>
<div class="footer">
</div>
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
<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>

</body>
</html>
