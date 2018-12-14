<?php
//在此修改网页通用部分
function pagepart($name,$style=0){
////////////////////////////////
	//头部
	if ($name=='header') {
		if ($style==0) {
print <<<EOT
	<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">展开</span>
				</a>
			</li>
		</ul>
		<a class="header-logo margin-left-no" href="./">☜点击左侧列表</a>
		</header>

EOT;
		}
	if ($style==1) {
print <<<EOT
	<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">展开</span>
				</a>
			</li>
		</ul>
		<a class="header-logo margin-left-no" href="../">动漫搜索</a>
		</header>

EOT;
	}
	}

////////////////////////////////
	//菜单
	if ($name=='menu') {
		if ($style==0) {
print <<<EOT
		<nav aria-hidden="true" class="menu" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="./">动漫搜索</a>
				<ul class="nav">
					<li>
						<a class="collapsed waves-attach" href="./">Home</a>
					</li>
					<li>
						<a class="collapsed waves-attach" href="./pages/about.php">关于</a>
					</li>
					<li>
						<a class="collapsed waves-attach" data-toggle="collapse" href="#ui_menu_extras">--点击展开列表</a>
						<ul class="menu-collapse collapse" id="ui_menu_extras">
							<li>
								<a class="waves-attach" href="./pages/start.php">使用说明</a>
							</li>
							<li>
								<a class="waves-attach" href="./pages/if.php">数据源可用性</a>
							</li>
							<li>
								<a class="waves-attach" href="./pages/srhcode.php">搜索指令</a>
							</li>
						</ul>
					</li>
EOT;
		}
		if ($style==1) {
print <<<EOT
		<nav aria-hidden="true" class="menu" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="../">展开</a>
				<ul class="nav">
					<li>
						<a class="collapsed waves-attach" href="../">Home</a>
					</li>
					<li>
						<a class="collapsed waves-attach" href="../pages/about.php">About</a>
					</li>
					<li>
						<a class="collapsed waves-attach" data-toggle="collapse" href="#ui_menu_extras">--Docs</a>
						<ul class="menu-collapse collapse" id="ui_menu_extras">
							<li>
								<a class="waves-attach" href="../pages/start.php">使用说明</a>
							</li>
							<li>
								<a class="waves-attach" href="../pages/if.php">数据源可用性</a>
							</li>
							<li>
								<a class="waves-attach" href="../pages/srhcode.php">搜索指令</a>
							</li>
						</ul>
					</li>
EOT;
		}

print <<<EOT
					<li>
						<a class="collapsed waves-attach" data-toggle="collapse" href="#ui_menu_xinfan">--新番</a>
						<ul class="menu-collapse collapse" id="ui_menu_xinfan">
							<li><a class="waves-attach" href="https://res.animen.com.tw/NewsArea/NewsItemDetail?NewsId=23836&categoryId=300&tagName=none&keyword=%E6%96%B0%E7%95%AA&realCategoryId=1&subCategoryId=9" target="_blank">2018年01月冬季</a></li>
							<li><a class="waves-attach" href="https://res.animen.com.tw/NewsArea/NewsItemDetail?NewsId=22223&categoryId=300&tagName=none&keyword=%E6%96%B0%E7%95%AA&realCategoryId=1&subCategoryId=9" target="_blank">2017年10月秋季</a></li>
							<li><a class="waves-attach" href="https://www.animen.com.tw/NewsArea/NewsItemDetail?NewsId=20746&categoryId=600&tagName=%E6%96%B0%E7%95%AA%E5%88%97%E8%A1%A8&realCategoryId=1&subCategoryId=9" target="_blank">2017年07月夏季</a></li>
							<li><a class="waves-attach" href="https://www.animen.com.tw/NewsArea/NewsItemDetail?NewsId=19811&categoryId=600&tagName=%E6%96%B0%E7%95%AA%E5%88%97%E8%A1%A8&realCategoryId=1&subCategoryId=5" target="_blank">2017年04月春季</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		</nav>

EOT;
	}

////////////////////////////////
	//尾
	if ($name=='footer') {
print <<<EOT
	<footer class="ui-footer">
		<div class="container">
			<p>Created by 动漫搜索❤</p>
		</div>
		</footer>

EOT;
	}

////////////////////////////////
	//悬浮球
	if ($name=='ball') {
print <<<EOT
	<div class="fbtn-container">
		<div class="fbtn-inner">
			<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" data-toggle="dropdown"><span class="fbtn-text fbtn-text-left">Links</span><span class="fbtn-ori icon">展开</span><span class="fbtn-sub icon">close</span></a>
			<div class="fbtn-dropup">
				<a class="fbtn waves-attach waves-circle" href="./pages/srhcode.php" target="_blank"><span class="fbtn-text fbtn-text-left">搜索指令</span><span class="icon">code</span></a>
				<a class="fbtn fbtn-brand waves-attach waves-circle waves-light" href="../pages/start.php" target="_blank"><span class="fbtn-text fbtn-text-left">使用说明</span><span class="icon">share</span></a>
				<a class="fbtn fbtn-green waves-attach waves-circle" href="../../index.php" target="_blank"><span class="fbtn-text fbtn-text-left">返回首页</span><span class="icon">link</span></a>
			</div>
		</div>
		</div>

EOT;
	}
}
function ads(){
print <<<EOT
           	<div class="card" id="ads">
               	<div class="card-main">
                   	<div class="card-header">
                       	<div class="card-header-side pull-left">
                       	</div>
                       	<div class="card-inner">
                           	<span class="card-heading">我的项目推广</span>
                       	</div>
                   	</div>
                   	<div class="card-img">
                       	<img alt="alt text" src="" style="width: 100%;">
                       	<p class="card-img-heading">CRH Shadowsocks</p>
                   	</div>
                   	<div class="card-inner">
                       	<p>
                       	全球顶级智云影音开源源码
                       	<br>参与的项目，所以提供专门针对来自用户的特殊平台
                       	<br>官方联系方式QQ:248186422
                       	</p>
                   	</div>
                   	<div class="card-action">
                       	<div class="card-action-btn pull-left">
             
                       	</div>
                   	</div>
               	</div>
           	</div>
			<div class="card" id="price" style="display: none;">
    			<div class="card-main">
        			<nav class="tab-nav tab-nav-brand margin-top-no">
            			<ul class="nav nav-justified">
                			<li class="active">
  
                			</div>
            			</div>
        			</div>
    			</div>
			</div>
                        
EOT;
}
?>
