<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<link rel="stylesheet" type="text/css" href="<?php echo G_TEMPLATES_STYLE; ?>/css/user.css"/>
<div class="groups-stripes"></div>
<div class="layout980" style="margin-top:10px;">
	<div class="groups-left">
		<h2><img src="/statics/templates/teyunbao/images/bbs.png"</a></h2>
		<div class="gr-guild">
			<b>在这里可以做什么?</b>
			<p class="gray01">在这里你可以找到与自己兴致相投的云友，随意申请加入任何你感兴趣的圈子，了解夺宝所发生的“重大事件”，参与到他们的行列之中，一起探论夺宝神奇，看看他们是如何夺宝的，一起分享交流探讨！来！一起加入他们的行列中吧！</p>
		</div>
		<div class="groups-list clearfix">
			<ul>
			<?php $ln=1;if(is_array($quanzi)) foreach($quanzi AS $v): ?>
				<li>
					<div class="groups-img"><a href="<?php echo WEB_PATH; ?>/group/show/<?php echo $v['id']; ?>" class="fl-img">
					<?php if($v['img']==null): ?>
					<img src="<?php echo G_UPLOAD_PATH; ?>/quanzi/prmimg.jpg" title="<?php echo $v['title']; ?>" border="0" alt="">
					<?php  else: ?>
					<img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $v['img']; ?>" title="<?php echo $v['title']; ?>" border="0" alt="">
					<?php endif; ?>
					</a></div>
					<div class="groups-info">
						<p class="groups-name"><a href="<?php echo WEB_PATH; ?>/group/show/<?php echo $v['id']; ?>" title="<?php echo $v['title']; ?>" class="blue"><?php echo $v['title']; ?></a></p>
						<p class="groups-class gray02">成员：<?php echo $v['chengyuan']; ?>&nbsp;&nbsp;&nbsp;&nbsp;话题：<?php echo $v['tiezi']; ?></p>
						<p class="groups-intro gray02"><?php echo $v['jianjie']; ?></p>
					</div>
				</li>
			<?php  endforeach; $ln++; unset($ln); ?>					
			</ul>
		</div>		
	</div>
	<?php include templates("group","right");?>
</div>
<script type="text/javascript">
	$(".yu_ff").mouseover(function(){
	  $(".h_1yyg_eject").show();
	})
	$(".yu_ff").mouseout(function(){
	  $(".h_1yyg_eject").hide();
	})

		     $("#m_all_sort").hide();
	     $(".m_menu_all").mouseenter(function(){
			    $(".m_all_sort").show();
	     })
		 $(".m_menu_all").mouseleave(function(){
			    $(".m_all_sort").hide();
	     })
		 $(".m_all_sort").mouseenter(function(){
			    $(this).show();
	     })
		 $(".m_all_sort").mouseleave(function(){
			    $(this).hide();
	     })
	     $(function(){
	       $(window).scroll(function() {	
	      		
	     		if($(window).scrollTop()>=130&&$(window).scrollTop()<=560){
	     			$(".head_nav").addClass("fixedNav");	
	     			$("#m_all_sort").fadeOut();
	     		}else if($(window).scrollTop()>560){
	     			$(".head_nav").addClass("fixedNav");
	     			$("#m_all_sort").fadeOut();
	     	} else if($(window).scrollTop()<130){
	     			$(".head_nav").removeClass("fixedNav");
	     	}
	           });
	     });
</script>
 <?php include templates("index","footer");?>