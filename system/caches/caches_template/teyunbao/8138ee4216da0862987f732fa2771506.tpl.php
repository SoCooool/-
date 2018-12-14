<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><div style="clear:both" > </div>
<div class="footer mt20">
	<div class="footer_center w1200">
		<div class="g-guide">
		<?php $category=$this->DB()->GetList("select * from `@#_category` where `parentid`='1'",array("type"=>1,"key"=>'',"cache"=>0)); ?>
		<?php $ln=1;if(is_array($category)) foreach($category AS $help): ?>
		   <dl>
		   	<dt><?php echo $help['name']; ?></dt>
			<?php $article=$this->DB()->GetList("select * from `@#_article` where `cateid`='$help[cateid]'",array("type"=>1,"key"=>'',"cache"=>0)); ?>
			<?php 
			foreach($article as $art){
			echo "<dd><a href='".WEB_PATH.'/help/'.$art['id']."' target='_blank'>".$art['title'].'</a></dd>';}
			 ?>				
		 </dl>   			
			<?php  endforeach; $ln++; unset($ln); ?>
		           	 <?php if(defined('G_IN_ADMIN')) {echo '<div style="padding:8px;background-color:#F93; color:#fff;border:1px solid #f60;text-align:center"><b>This Tag</b></div>';}?>
		   		<div class="new_notice_center">
				<a href="?/single/pleasereg" ><img src="/statics/templates/teyunbao/images/yong.jpg" ></a>
			</div></div>
	<div class="g-service">
	<div class="m-ser u-ser2">
              <ul class="mt10 ml10">
              <li>
                            <img src="/statics/templates/teyunbao/images/hong.jpg" height="75" width="75"></li>
              <li>
              <dl>
                           <dt>关注官方微信领红包</dt>
                           <dt>公众号：妃子</dt>
						   <dt>只需关注即可领取</dt>
                        </dl>
                    </li>
                </ul>
            </div>
			<div class="m-ser u-ser3">
                <ul>
                    <li><s class="u-icons"></s></li>
                    <li>
                        <dl>
                            <dt>服务器时间</dt>
                            <dd id="pServerTime">15:40:27</dd>
                        </dl>
                    </li>
                </ul>
            </div>
	<div class="m-ser u-ser4">
                <ul>
                    <li><s class="u-icons"></s></li>
                    <li>
                        <dl>
                            <dt>夺宝公益基金</dt>
                            <dd><a href="<?php echo WEB_PATH; ?>/single/fund" target="_blank" id="indexFundMoney">0000.00</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
	<div class="m-ser u-ser5">
                <ul>
                    <li><s class="u-icons"></s></li>
                    <li>
                        <dl>
                            <dt>服务咨询</dt>
                            <dd class="c_red u-tel"><?php echo _cfg('cell'); ?></dd>
                            <dd><a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo _cfg("qq"); ?>&site=qq&menu=yes" target="_blank" class="service_img"></a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
<div class="m-ser u-ser2">
              <ul class="mt10 ml10">
              <li><a href="/xi/">
                            <img src="/statics/templates/teyunbao/images/jiang.jpg" height="75" width="75"></a></li>
              <li>
              <dl>
                           <dt>微信小游戏分享</dt>
                           <dt>朋友圈分享游戏加粉丝</dt>
						   <dt>微信游戏大家分享</dt>
                        </dl>
                    </li>
                </ul>
            </div>
		</div>
		<div class="g-special">
            <ul>
                <li>
                   <a href="?/help/26">
                        <em class="u-spc-icon1"></em>
                        <span>100%公平公正</span>
                        参与过程公开透明，用户可随时查看
                    </a>
                </li>
                <li>
                     <a href="?/help/27">
                        <em class="u-spc-icon2"></em>
                        <span>100%正品保证</span>
                        精心挑选优质商家，100%品牌正品
                    </a>
                </li>
                <li>
                    <a href="?/help/29">
                        <em class="u-spc-icon3"></em>
                        <span>全国免运费</span>
                        全场商品全国包邮（港澳台地区除外）
                    </a>
                </li>
            </ul>
        </div>
	</div>
	<div class="g-copyrightCon">
		<div class="w1190">
		<!-- //底部短连接 -->
			<div class="g-links">
				<?php echo Getheader('foot'); ?>
			</div>
			<div class="g-copyright"><?php echo _cfg('web_copyright'); ?>
			<br><br>
			<a href="http://webscan.360.cn/index/checkwebsite/url/bb.teyunbao.cn"><img border="0" src="http://img.webscan.360.cn/status/pai/hash/beee6bff8ac9f9703166e7276018b7af"/></a></div>
		</div>
	</div>
</div>
<div style="right: 281.5px;" id="divRighTool" class="quickBack">
	
	<dl class="quick_But">
		<dd class="quick_service"><a id="btnRigQQ" href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo _cfg("qq"); ?>&site=qq&menu=yes" target="_blank" class="quick_serviceA"><b>在线客服</b><s></s></a></dd>
		<dd class="quick_Collection"><a id="btnFavorite" href="javascript:;" class="quick_CollectionA"><b>收藏本站</b><s></s></a></dd>
		<dd class="quick_Return"><a id="btnGotoTop" href="javascript:;" class="quick_ReturnA"><b>返回顶部</b><s></s></a></dd>
	</dl>
	
	
</div>
<script type="text/javascript">
(function(){				
		var week = '日一二三四五六';
		var innerHtml = '{0}:{1}:{2}';
		var dateHtml = "{0}月{1}日 &nbsp;周{2}";
		var timer = 0;
		var beijingTimeZone = 8;				
				function format(str, json){
					return str.replace(/{(\d)}/g, function(a, key) {
						return json[key];
					});
				}				
				function p(s) {
					return s < 10 ? '0' + s : s;
				}			

				function showTime(time){
					var timeOffset = ((-1 * (new Date()).getTimezoneOffset()) - (beijingTimeZone * 60)) * 60000;
					var now = new Date(time - timeOffset);
					document.getElementById('pServerTime').innerHTML = format(innerHtml, [p(now.getHours()), p(now.getMinutes()), p(now.getSeconds())]);				
					//document.getElementById('date').innerHTML = format(dateHtml, [ p((now.getMonth()+1)), p(now.getDate()), week.charAt(now.getDay())]);
				}				
				
				window.yungou_time = 	function(time){						
					showTime(time);
					timer = setInterval(function(){
						time += 1000;
						showTime(time);
					}, 1000);					
				}
	window.yungou_time(<?php echo time(); ?>*1000);
				
})();

	$(".weixinload").click(function(){
		$(".yun_mobile").fadeIn();
	})
	$(".yun_close").click(function(){
		$(".yun_mobile").fadeOut();
	})
	
	
</script>
<div style="display:none"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_4669835'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/stat.php%3Fid%3D4669835%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script></div>
<script>

$("#divRighTool").show(); 
var wids=($(window).width()-1200)/2-70;
if(wids>0){
	$("#divRighTool").css("right",wids);
}else{
	$("#divRighTool").css("right",10);
}
$(function(){
	$("#btnGotoTop").click(function(){
		$("html,body").animate({scrollTop:0},1500);
	});
	$("#btnFavorite,#addSiteFavorite").click(function(){
		var ctrl=(navigator.userAgent.toLowerCase()).indexOf('mac')!=-1?'Command/Cmd': 'CTRL';
		if(document.all){
			window.external.addFavorite('<?php echo G_WEB_PATH; ?>','<?php echo _cfg("web_name"); ?>');
		}
		else if(window.sidebar){
		   window.sidebar.addPanel('<?php echo _cfg("web_name"); ?>','<?php echo G_WEB_PATH; ?>', "");
		}else{ 
			alert('您可以通过快捷键' + ctrl + ' + D 加入到收藏夹');
		}
    });
	$("#divRighTool a").hover(		
		function(){
			$(this).addClass("Current");
		},
		function(){
			$(this).removeClass("Current");
		}
	)
});
//夺宝基金
$.ajax({
	url:"<?php echo WEB_PATH; ?>/api/fund/get",
	success:function(msg){
		$("#indexFundMoney").text(msg);
	}
});
</script>

<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"妃子云购，收获惊喜的网站！1元就购iphone6S","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"2","bdPos":"right","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<br><br>



</body></html>