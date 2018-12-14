<?php
include ('./inc/aik.config.php');
?>
<header class="header">
	<div class="container">
		<h1 class="logo"><a href="<?php echo $aik['pcdomain'];?>" title="<?php echo $aik['keywords'];?>"><?php echo $aik['logo_dh'];?><span><?php echo $aik['title'];?></span></a></h1>		<div class="sitenav">
		<ul>
		<li class="menu-item"><a href="<?php echo $aik['pcdomain']?>">首页</a></li>


<li class="menu-item"><a href="./movie.php">电影</a></li>
<li class="menu-item"><a href="./tv.php">电视剧</a></li>
<li class="menu-item"><a href="./zongyi.php">综艺</a>
<li class="menu-item"><a href="./dongman.php">动漫</a></li>



<li class="menu-item"><?php echo $aik['top_ad'];?></li>
<li class="menu-item"><?php echo $aik['top1_ad'];?></li>
</ul>
		</div>
		<span class="sitenav-on"><i class="icon-list"></i></span>
		<span class="sitenav-mask"></span>
					<div class="accounts">
					<a class="account-weixin" href="javascript:;"><i class="fa"></i>
						<div class="account-popover"><div class="account-popover-content"><?php echo $aik['weixin_ad'];?></div></div>
					</a>
<script type='text/javascript' src='js/view-history.js'></script>
<script>
var store = $.AMUI.store;
 document.writeln("<a class=\'account-tqq\' target=\'_blank\' href=\'"+store.get('siteurl') +"' tipsy title='"+store.get('site') +"'></a>");
    </script>
					
																			</div>
							<span class="searchstart-on"><i class="icon-search"></i></span>
			<span class="searchstart-off"><i class="icon-search"></i></span>
			<form method="get" class="searchform" action="./seacher.php" >
				<button tabindex="3" class="sbtn" type="submit"><i class="fa"></i></button><input tabindex="2" class="sinput" name="sousuo" type="text" placeholder="输入关键字" value="">
			</form>
              
			</div>
</header>
