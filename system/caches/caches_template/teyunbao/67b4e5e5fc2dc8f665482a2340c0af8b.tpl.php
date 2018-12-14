<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<!--晒单-->
<div class="wrap w1200">
	<div class="Current_nav w1200">
		<a href="<?php echo WEB_PATH; ?>">首页</a> &gt; 晒单分享</div>
	<div id="current" class="share_Curtit">
		<h1 class="fl">
			晒单分享</h1>
		<span id="spTotalCount">(共<em class="c_red"><?php echo $total; ?></em>个幸运获得者晒单)</span>
	</div>
	<div id="loadingPicBlock" class="share_list">
		<div class="goods_share_listC">
			<ul>				
				<li>
					<?php $ln=1;if(is_array($sa_one)) foreach($sa_one AS $sd): ?>
					<div class="share_list_content">
						<dl>
							<dt><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sd['sd_thumbs']; ?>"></a></dt>
							<dd class="share-name gray02"> 
								<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="name-img">								
									<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo get_user_key($sd['sd_userid'],'img','3030'); ?>" width="50" height="50" border="0"/>									
								</a>
								<div class="share-name-r"> 
									<span class="gray03"> <a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="blue"><?php echo get_user_name($sd['sd_userid'],'username'); ?></a><?php echo date("Y-m-d H:i",$sd['sd_time']); ?></span>
									<a class="Fb gray01" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank"><?php echo $sd['sd_title']; ?></a>
								</div> 
							</dd> 
							<dd class="share_info gray01"><p><?php echo _strcut($sd['sd_content'],50); ?></p></dd> 
							<dd class="message hidden" style="display: block;"> 
								<span class="smile gray03"><i></i><b>羡慕(<em num="1282"><?php echo $sd['sd_zhan']; ?></em>)</b></span>
								<span class="much"><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" class="gray03"><i></i>评论<em>(<?php echo $sd['sd_ping']; ?>)</em></a></span>
							</dd>
						</dl>
						<p class="text-h10"></p>
					</div>	
					<?php  endforeach; $ln++; unset($ln); ?>
				</li>
				<li>
					<?php $ln=1;if(is_array($sa_two)) foreach($sa_two AS $sd): ?>
					<div class="share_list_content">
						<dl>
							<dt><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sd['sd_thumbs']; ?>"></a></dt>
							<dd class="share-name gray02"> 
								<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="name-img">
								
								<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo get_user_key($sd['sd_userid'],'img','3030'); ?>" width="50" height="50" border="0"/>
									
								</a>
								<div class="share-name-r"> 
									<span class="gray03"> <a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="blue"><?php echo get_user_name($sd['sd_userid'],'username'); ?></a><?php echo date("Y-m-d H:i",$sd['sd_time']); ?></span>
									<a class="Fb gray01" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank"><?php echo $sd['sd_title']; ?></a>
								</div> 
							</dd> 
							<dd class="share_info gray01"><?php echo _strcut($sd['sd_content'],50); ?></dd> 
							<dd class="message hidden" style="display: block;"> 
								<span class="smile gray03"><i></i><b>羡慕(<em num="1282"><?php echo $sd['sd_zhan']; ?></em>)</b></span>
								<span class="much"><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" class="gray03"><i></i>评论<em>(<?php echo $sd['sd_ping']; ?>)</em></a></span>
							</dd>
						</dl>
						<p class="text-h10"></p>
					</div>	
					<?php  endforeach; $ln++; unset($ln); ?>
				</li>
				<li>
					<?php $ln=1;if(is_array($sa_tree)) foreach($sa_tree AS $sd): ?>
					<div class="share_list_content">
						<dl>
							<dt><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sd['sd_thumbs']; ?>"></a></dt>
							<dd class="share-name gray02"> 
								<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="name-img">
								
								<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo get_user_key($sd['sd_userid'],'img','3030'); ?>" width="50" height="50" border="0"/>
								
								</a>
								<div class="share-name-r"> 
									<span class="gray03"> <a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="blue"><?php echo get_user_name($sd['sd_userid'],'username'); ?></a><?php echo date("Y-m-d H:i",$sd['sd_time']); ?></span>
									<a class="Fb gray01" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank"><?php echo $sd['sd_title']; ?></a>
								</div> 
							</dd> 
							<dd class="share_info gray01"><?php echo _strcut($sd['sd_content'],50); ?></dd> 
							<dd class="message hidden" style="display: block;"> 
								<span class="smile gray03"><i></i><b>羡慕(<em num="1282"><?php echo $sd['sd_zhan']; ?></em>)</b></span>
								<span class="much"><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" class="gray03"><i></i>评论<em>(<?php echo $sd['sd_ping']; ?>)</em></a></span>
							</dd>
						</dl>
						<p class="text-h10"></p>
					</div>	
					<?php  endforeach; $ln++; unset($ln); ?>
				</li>
				<li class="share-liR">	
					<?php $ln=1;if(is_array($sa_for)) foreach($sa_for AS $sd): ?>
					<div class="share_list_content">
						<dl>
							<dt><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sd['sd_thumbs']; ?>"></a></dt>
							<dd class="share-name gray02"> 
								<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="name-img">								
								<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo get_user_key($sd['sd_userid'],'img','3030'); ?>" width="50" height="50" border="0"/>
								
								</a>
								<div class="share-name-r"> 
									<span class="gray03"> <a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" class="blue"><?php echo get_user_name($sd['sd_userid'],'username'); ?></a><?php echo date("Y-m-d H:i",$sd['sd_time']); ?></span>
									<a class="Fb gray01" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank"><?php echo $sd['sd_title']; ?></a>
								</div> 
							</dd> 
							<dd class="share_info gray01"><?php echo _strcut($sd['sd_content'],50); ?></dd> 
							<dd class="message hidden" style="display: block;"> 
								<span class="smile gray03"><i></i><b>羡慕(<em num="1282"><?php echo $sd['sd_zhan']; ?></em>)</b></span>
								<span class="much"><a target="_blank" href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" class="gray03"><i></i>评论<em>(<?php echo $sd['sd_ping']; ?>)</em></a></span>
							</dd>
						</dl>
						<p class="text-h10"></p>
					</div>	
					<?php  endforeach; $ln++; unset($ln); ?>
				</li>				
			</ul>				
		</div>
		<?php if($total>$num): ?>
		<div class="pagesx"><?php echo $page->show('two'); ?></div>
		<?php endif; ?>
	</div>
</div>
<script type="text/javascript">
$(".mobile").mouseover(function(){
	$(".h_mobile").show();
	$(".h_mobile  s").css("background","../images/headbg11.png").css("background-position","5px -64px");
})
$(".h_mobile").mouseout(function(){
	$(".h_mobile").hide();
})
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
<script src="http://jq22.qiniudn.com/masonry-docs.min.js"></script>
<?php include templates("index","footer");?>