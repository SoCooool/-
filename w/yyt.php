<?php
include ('../inc/aik.config.php');
?>
<?php
//音悦台视频外链解析,直链获取工具
$url=isset($_GET['url'])?trim($_GET['url']):'';
//http://v.yinyuetai.com/video/2740982
$time=$_SERVER['REQUEST_TIME'];
//获取标题
preg_match('/property="og:title"[\s]+content="([^"]*)".*?>/i',$content,$title);
//获取封面
preg_match('/property="og:image" content="([^"]*)".*?>/',$content,$images);
//获取MV的ID
preg_match('/[\d]+/',$url,$song_id);
$title=$title[1];
$images=$images[1];
$song_id=$song_id[0];
//解析json
$songurl = "http://www.yinyuetai.com/api/info/get-video-urls?callback=callback&videoId=".$song_id."&_=".$time;
$data = file_get_contents($songurl);
if (strpos($data, "callback") !== false){
    $lpos = strpos($data, "(");
    $rpos = strrpos($data, ")");
    $data  = substr($data, $lpos + 1, $rpos - $lpos -1);
}
$json= json_decode($data,true);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="GBK">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>音悦台视频外链解析，直链获取工具<?php echo $aik['title'];?></title>

    <!-- Bootstrap -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
 <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
<div class="container-fluid">

<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="w/yyt.php">音悦Tai视频MV解析</a>
</div>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="../dh.html">导航</a></li>
<li class="active"><a href="w/yyt.php">免费看</a></li>
<li class="dropdown">
<a href="yjx.php" class="dropdown-toggle" data-toggle="dropdown">YY神曲解析<span class="caret"></span></a>
<ul class="dropdown-menu" role="menu">
<li><a href="javascript:history.back()">返回上页</a></li>
<li class="divider">
</li><li><a href="../index.php">官方首页</a></li>
</ul>
</li>
</ul>
</div>
</div>
</nav>
<br><br><br><br>
<center>

<div class="panel panel-default" style="width:60%;">
  <div class="panel-body">
<video controls autoplay=true src="<?php ECHO $json['hcVideoUrl']?>" style="width:100%;height:400px"></video>
<p><p>
<form id="contact" action="" method="get" style="width:100%;">

<fieldset>
<div class="form-group">
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-link"></span></div>
      <input placeholder="音乐台地址" class="form-control" name="url" type="text" tabindex="1" required>

      </div>
    </div>
</fieldset>
<fieldset>

<button name="submit" class="btn btn-default" type="submit" id="contact-submit" data-submit="...Sending">提交</button>

</fieldset>
</form>
<div class="form-group has-success has-feedback">
  <label class="control-label" for="inputSuccess2">超清外链</label>
  <input type="text" class="form-control" id="inputSuccess2" value="<?php ECHO $json['heVideoUrl']?>">
  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
</div>
<div class="form-group has-warning has-feedback">
  <label class="control-label" for="inputWarning2">高清外链</label>
  <input type="text" class="form-control" id="inputWarning2" value="<?php ECHO $json['hdVideoUrl']?>">
  <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
</div>
<div class="form-group has-error has-feedback">
  <label class="control-label" for="inputError2">流畅外链</label>
  <input type="text" class="form-control" id="inputError2" value="<?php ECHO $json['hcVideoUrl']?>">
  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
</div>
</div>
</div>
<footer class="container-fluid foot-wrap">
	  <!--换行-->
		  	<table class="table table-bordered">
	<thead>
		<tr>
			<th>使用介绍</th>
		</tr>
	</thead>
	<tbody>
		<tr>
            <td><b>
<ol><h5><b>
<li>本功能系统免费在线解析所有音悦台视频，直接输入MV视频的ID号，即可解析在线播放或者下载哦！</li><br>
<li>解析说明：请到音悦台官方获取选择相关自己需要解析的id号，然后将id直接复制粘贴到解析框框再点击提交进行解析观看！</li><br>

<li>格式说明：<p>比如:http://m2.yinyuetai.com/video.html?id=2829573<p>只需要输入后面的2829573<p>将此全部数字号直接复制粘贴进行解析即可，其他音悦台MV视频都是一样，只要把后面的那些id号直接复制粘贴使用即可！</li><br>
<li>支持手机及电脑在线解析播放哦！<p>音悦台MV视频网址:http://www.yinyuetai.com或http://m.yinyuetai.com</li><br>
</b></h5>
</ol>
			</b>
 </td>
		</tr>
      </tbody>
          </table>

    <!--采用container，使得页尾内容居中 -->

        <p align="center" style="margin-top: 20px;color:#878B91;">
            Copyright &copy;2020 <?php echo $aik['sitename'];?><p>本站地址:<?php
/**
 * 获取当前页面完整URL地址
 */
function get_url() {
    $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
    $php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
    $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
    $relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
    return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
}
 
echo get_url();
?>

        </p>

</footer>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
  </body>
</html>
