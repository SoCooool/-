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
<title><?php echo $aik['title'];?>-在线天气预报查询</title>
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
</div><p style="text-align: center;color: #F00;font-size: 10px;background: #eee;padding: 6px 2px;border-radius: 2px;">提示:左右滑动日历展示部分，可查看上、下个月信息或者年份，点击黄历即可查看黄历详细信息</p>
<!--直播开始-->
<script>
var w = '100%'; //宽度
var h = '600'; //高度
var s = 'no'; //是否显示滚动条，yes显示，no不显示
document.write('<iframe width='+w+' height='+h+' src="./w/rl.html" frameborder=0 border=0 marginwidth=0 marginheight=0 scrolling='+s+'></iframe>');
</script>

<!--直播结束-->
</section>

<?php  include 'footer.php';?>

</body>
</html>
