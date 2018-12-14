<?php 
?><?='<div class="foornav">
	<a href="'; echo $aik['pcdomain']?><?='"><span><img src="../images/index.png"/>首页</span></a>
	<a href="./movie.php?m='; echo $do11;?><?='"><span><img src="../images/video.png"/>电影</span></a>
	<a href="./tv.php?u='; echo $do21;?><?='"><span><img src="../images/dianshi.png"/>电视剧</span></a>
	<a href="./zongyi.php?m='; echo $do31;?><?='"><span><img src="../images/dianshiju.png"/>综艺</span></a>
	<a href="./dongman.php?m='; echo $do41;?><?='"><span><img src="../images/y.png"/>动漫</span></a></div>
<footer class="footer">
<div class="branding branding-black">
	<div class="container" style="text-align: center;">
		<h2>'; echo $aik['sitename'];?><?=' - 海量高清VIP视频免费观看</h2>
'; echo $aik['youlian'];?><?='</div>
</div>


<p style="padding: 0 4px;">'; echo $aik['foot'];?><br/>管理员邮箱：<?php echo $aik['admin_email'];?><br/>&copy; 2017 <a href="<?php echo $aik['pcdomain'];?>"><?php echo $aik['sitename'];?><?='</a>&nbsp; <a href="https://github.com/zhizg/b">'; echo $aik['icp'];?><?='</a>&nbsp; 
        本站主题由 '; echo $aik['homelink'];?> 提供 &nbsp; <?php echo $aik['tongji'];?><?=' </footer>
	<div class="rewards-popover-mask" etap="rewards-close"></div>
	<div class="rewards-popover">
		<h3>觉得本站还不错就打赏一下吧！</h3>
				<div class="rewards-popover-item">
			<h4>支付宝扫一扫打赏</h4>
			'; echo $aik['zfb_ad'];?>
<?='		</div>
						<div class="rewards-popover-item">
			<h4>微信扫一扫打赏</h4>
			'; echo $aik['wx_ad'];?>
<?="		</div>
				<span class=\"rewards-popover-close\" etap=\"rewards-close\"></span>
	</div> 

<script type='text/javascript' src='js/main.js'></script>";?>
