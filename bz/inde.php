<?php 
function pagination($count, $perlogs, $page, $url, $anchor = '') {
	$pnums = @ceil($count / $perlogs); 
	$re = ''; 
	$urlHome = preg_replace("|[?&/][^./?&=]*page[=/-]|","",$url);
	if($page>1){
		$i = $page - 1;
		$re = '<li><a href="'.$url.$i.'">上一页</a></li>' . $re;
	}
	if($page < $pnums){
		$i = $page + 1;
		$re .= '<li><a href="'.$url.$i.'">下一页</a></li>';
	}
 $re .='<li><a href="'.$url.$pnums.'">尾页</a></li><li><a href="javascript:;" style="background-color:#FF8391;color:#fff">共'.$pnums.'页'.$count.'张壁纸</a></li>';
	return $re;
}
function Getjson($cat,$cnt,$start){
$url = 'http://list.wallpaper.cloud.duba.net/wallpaper/web?photo_type='.$cat.'&photo_cnt='.$cnt.'&photo_id='.$start;
$refer = 'http://list.wallpaper.cloud.duba.net/wallpaper/web?photo_type='.$cat.'&photo_cnt='.$cnt.'&photo_id='.$start;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
curl_setopt($ch, CURLOPT_REFERER, $refer);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.154 Safari/537.36 LBBROWSER');
$output = curl_exec($ch);
curl_close($ch);
$jsoncode = json_decode($output,true);
return $jsoncode;
}
$bizhitype = isset($_GET['type']) ? intval($_GET['type']) : '1';
switch ($bizhitype){
 case '1':
 $title = '风景壁纸列表';
 break;
 case '2':
 $title = '清新壁纸列表';
 break;
 case '3':
 $title = '萌宠壁纸列表';
 break;
 case '4':
 $title = '创意壁纸列表';
 break;
 case '5':
 $title = '美女壁纸列表';
 break;
 case '6':
 $title = '明星壁纸列表';
 break;
 case '7':
 $title = '动漫壁纸列表';
 break;
 case '8':
 $title = '护眼壁纸列表';
 break;
 case '254':
 $title = '精选壁纸列表';
 break;
 case '1004':
 $title = '四季壁纸列表';
 break;
 case '1001':
 $title = '蓝天白云壁纸列表';
 break;
 case '254001':
 $title = '热门壁纸列表';
 break;
 case '253755':
 $title = '星空壁纸列表';
 break;
 case '253743':
 $title = '宇宙壁纸列表';
 break;
}?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $title;?> - 高清壁纸 - 智卓星网</title>
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
<script src="http://cdn.staticfile.org/fancybox/2.1.5/jquery.fancybox.min.js" type="text/javascript"></script>
<link href="http://cdn.staticfile.org/fancybox/2.1.5/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
<style>.pager li{margin-right:15px}.pager li a{color:#FF8391;border-color:#FF8391}.pager li a:hover{background-color:#FF8391;color:#fff}#menu a{color:#fff;font-size:14px;padding:5px;background:#F2707E;border-radius:4px;}#footer{text-align:center;padding:10px 0 15px}</style>
<script>
$(document).ready(function(){
//$("a[href$=jpg],a[href$=png],a[href$=gif],a[href$=jpeg],a[href$=bmp]").attr({"data-fancybox-group":"gallery"}).fancybox();
$("a[href$=jpg],a[href$=png],a[href$=gif],a[href$=jpeg],a[href$=bmp]").attr({"data-fancybox-group":"thumb"}).fancybox({prevEffect:'none',nextEffect:'none',closeBtn:true,arrows:true,nextClick:false,helpers:{thumbs:{width:60,height:60},title:{type:'over'}}});
//$("a[href$=jpg],a[href$=png],a[href$=gif],a[href$=jpeg],a[href$=bmp]").attr({"data-fancybox-group":"button","title":""}).fancybox({openEffect:'none',closeEffect:'none',prevEffect:'none',nextEffect:'none',closeBtn:false,helpers:{title:{type:'inside'},buttons:{}},afterLoad:function(){this.title='Image '+(this.index + 1)+' of ' +this.group.length + (this.title ? ' - ' + this.title : '');}});
});
</script>
</head>
<body style="background-color:#f7f7f7">
<div class="container">
<div class="row">
<div class="alert alert-info" role="alert" style="margin:20px 15px 20px;color:#fff;background-color:#FF8391;border-color:#FF8391;height:50px">
  <div class="col-md-8" id="menu">
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=254">精选</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=1">风景</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=2">清新</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=3">萌宠</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=4">创意</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=5">美女</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=6">明星</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=7">动漫</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=8">护眼</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=254001">热门</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=1001">蓝天</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=1004">四季</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=253755">星空</a>
  <a href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];?>?type=253743">宇宙</a>
  </div>
  <div class="col-md-4" style="text-align:right"> 高清壁纸 - BY <a href="http://www.jianshu.com/p/372de0578126" target="_blank" style="color:#fff">智卓星网</a></div>
</div>
<?php	
//$bizhitype = '1'; //壁纸分类ID 254001热门1001蓝天白云 1004四季 253755星空 253743宇宙 254精选 1风景 2清新 3萌宠 4创意 5美女 6明星 7动漫 8护眼
$totaljson = Getjson($bizhitype,1,0); //解析壁纸总数
$total = $totaljson['total']; //取得壁纸总数
$page_num = '24'; //壁纸每页显示数量
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$start_num = !empty($page) ? ($page - 1) * $page_num : 0;
$pageurl =  pagination($total, $page_num, $page, '?type='.$bizhitype.'&page=');
$bizhijson = Getjson($bizhitype,$page_num,$start_num);
$bizhilist = $bizhijson['pic'];
if (!empty($bizhilist)):
foreach($bizhilist as $row):?>
<div class="col-md-3">
<div class="thumbnail">
<a href="http://wallpaperm.cmcm.com/<?php echo $row['md5'];?>.jpg" target="_blank" title="点击查看大图"><img style="width:252px;height:142px" src="http://wallpaperm.cmcm.com/<?php echo $row['md5'];?>_340_190.jpg" alt="查看大图"></a></div>
</div>
<?php endforeach;else:?>
<h2>7PHP温馨提示：此页面没有内容！</h2>
<?php endif;?>
</div>
<nav><ul class="pager"><li><a href="?type=<?php echo $bizhitype;?>">首页</a></li><?php echo $pageurl;?></ul></nav> 
</div>
<div id="footer">
智云壁纸 BY <a href="http://www.jianshu.com/p/372de0578126" target="_blank" style="color:#333">智云平台</a> 
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
</script>

<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>
<noscript><a href="http://www.51.la/?18759442" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18759442.asp" style="border:none" /></a></noscript>

</body>
</html>
