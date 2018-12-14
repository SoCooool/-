<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<!--晒单详情-->
<div class="clear"></div>
<div class="wrap w1200">
<div class="Current_nav w1200">
	<a href="<?php echo WEB_PATH; ?>">首页</a> &gt; <a href="#">晒单分享</a> &gt; 晒单详请</div>
<div class="share_box b_gray" id="loadingPicBlock">
	<div id="DCMainLeft" class="share_box_left fl br_gray">
		<div class="share_main">
			<!--用户晒单部分-->
			<div class="share_title">
				<h3><?php echo $shaidan['sd_title']; ?></h3>
				<div class="share_time">
					晒单时间：<span><?php echo date("Y-m-d H:i",$shaidan['sd_time']); ?></span></div>
			</div>
			<div class="share_goods b_gray">
				<div class="share-get">
					<a class="fl-img" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($shaidan['sd_userid']); ?>" target="_blank"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo get_user_key($shaidan['sd_userid'],'img','8080'); ?>"></a>
					<div class="share-getinfo">
						<p class="getinfo-name">幸运获得者：<a class="blue Fb" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($shaidan['sd_userid']); ?>" target="_blank"><?php echo userid($shaidan['sd_userid'],'username'); ?></a></p>
						<p>总共夺宝：<b class="orange"><?php echo get_user_goods_num($shaidan['sd_userid'],$shaidan['sd_shopid']); ?></b>人次</p>
						<?php 
						$jikxiao = get_shop_if_jiexiao($shaidan['sd_shopid']);						
						 ?>
						<?php if($jikxiao['q_uid']): ?>
						<p>幸运夺宝码：<?php echo $jikxiao['q_user_code']; ?>	</p>
						<p>揭晓时间：<?php echo microt($jikxiao['q_end_time']); ?></p>
						<?php endif; ?>
					</div>
				</div>
				<div class="share-Conduct bl_gray">
					<a class="fl-img b_gray" href="<?php echo WEB_PATH; ?>/dataserver/<?php echo $shaidan['sd_shopid']; ?>" target="_blank">
					<img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $goods['thumb']; ?>" border="0"></a>
					<div class="share-getinfo">
						<p class="getinfo-title"><a class="gray01" href="<?php echo WEB_PATH; ?>/goods/<?php echo $goods['id']; ?>" target="_blank">(第<?php echo $goods['qishu']; ?>期)<?php echo $goods['title']; ?></a></p>
						<p>价值：<?php echo $goods['money']; ?>元</p>
						<p id="GoToBuy">
						<a class="getbut-a c_red b_gray" href="<?php echo WEB_PATH; ?>/goods/<?php echo $goods['id']; ?>" target="_blank">
						<?php if(!empty($goods['q_uid'])): ?>
						已揭晓
						<?php  else: ?>
						第<?php echo $goods['qishu']; ?>期正在进行中...
						<?php endif; ?>
						</a></p>
					</div>
				</div> 
			</div>
			<div class="share_content">
				<p class="content-pad"><?php echo $shaidan['sd_content']; ?></p>
				<?php $ln=1;if(is_array($sd_photolist)) foreach($sd_photolist AS $sdimg): ?>
				<p><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sdimg; ?>" border="0"></p>
				<?php  endforeach; $ln++; unset($ln); ?>
			</div>
			<!--用户晒单部分结束-->
			<!-- 分享按钮 -->
			<div class="mood">
				<div class="moodwm">
					<div class="moodm fl hidden" style="display: block;">
						 <span class="smile bg_red" id="emHits"><i></i><b>羡慕嫉妒恨(<em><?php echo $shaidan['sd_zhan']; ?></em>)</b></span>
						 <span class="much"> <i></i>评论(<em id="emReplyCount"><?php echo $shaidan['sd_ping']; ?></em>)</span>
					</div>
					<div class="share">
						<span class="fen fl">分享到：</span>
						<!-- Baidu Button BEGIN -->
						<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" style="margin-top:4px;">
						<a class="bds_qzone"></a>
						<a class="bds_tsina"></a>
						<a class="bds_tqq"></a>
						<a class="bds_renren"></a>
						<a class="bds_t163"></a>
						<span class="bds_more"></span>
						</div>
						<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=671207" ></script>
						<script type="text/javascript" id="bdshell_js"></script>
						<script type="text/javascript">
						document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
						</script>
						<!-- Baidu Button END -->
					</div>
				</div>
			</div>
		</div>
		<div id="bottomComment" class="qcomment_bottom_reply clearfix">
			<div class="Comment_Reply clearfix">
				<div class="Comment-pic">
				<?php if(!$member or $member['img']==null): ?>
				<img src="<?php echo G_TEMPLATES_STYLE; ?>/images/prmimg.jpg" width="50" height="50" />
				<?php  else: ?>
				<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo userid($member['uid'],'img'); ?>" width="50" height="50" border="0"/>
				<?php endif; ?>	
				</div>
				<div class="Comment_form">
					<div class="Comment_textbox">
					<?php if(!$member): ?>					
						<div id="notLogin" name="replyLogin" class="Comment_login">
							请您<a href="<?php echo WEB_PATH; ?>/member/user/login" class="blue" name="replyLoginBtn">登录</a>
							或<a href="<?php echo WEB_PATH; ?>/member/user/register" class="blue">注册</a>后再回复评论
						</div>
					<?php  else: ?>
						<form action="" method="post">
						<textarea name="sdhf_content" class="Comment-txt"></textarea>
						<input type="submit" name="submit" value="发表评论" class="reply_unbotton">
						</form>
					<?php endif; ?>
					</div>
				</div>
			</div>
		</div>
		<div id="commentMain" class="qcomment_main">
			<ul>
				<?php $ln=1;if(is_array($shaidan_hueifu)) foreach($shaidan_hueifu AS $sdhf): ?>
				<li class="Comment_single">
					<div class="Comment_box_con clearfix">
						<div class="User_head">
						<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sdhf['sdhf_userid']); ?>" target="_blank" >
							<?php if(userid($sdhf['sdhf_userid'],'img')==null): ?>
							<img src="<?php echo G_TEMPLATES_STYLE; ?>/images/prmimg.jpg" width="50" height="50" />
							<?php  else: ?>
							<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo userid($sdhf['sdhf_userid'],'img'); ?>" width="50" height="50" border="0"/>
							<?php endif; ?>		
						</a>
						</div>
						<div class="Comment_con">
							<div class="Comment_User">
								<span><a class="blue" href="#" target="_blank"><?php echo userid($sdhf['sdhf_userid'],'username'); ?></a></span>
							</div>
							<div class="C_summary"><?php echo $sdhf['sdhf_content']; ?>
								<span class="Summary-time"><?php echo date("Y-m-d H:i",$sdhf['sdhf_time']); ?></span>
							</div>
						</div>
					</div>
				</li>
				<?php  endforeach; $ln++; unset($ln); ?>
			</ul>
		</div>			
		<!--用户评论列表开始-->
		<div class="Comment_main clearfix" id="CommentMain"></div>
		<!--用户评论部分结束-->
	</div>
	<!--晒单左侧结束-->
	<!--晒单右侧-->
	<div class="Comment_right" id="PostDetailRight">
		<div class="Comment_victory">
	<!-- 	<div class="victory-tit">
			<span>
			<a href="javascript:void(0);" class="page-upgray"></a>
			<a href="javascript:void(0);" class="page-updow page-dow"></a>
			</span>
			<h3>其他期数获得者</h3>
		</div>
		<ul>
			<li class="victory_info">
				<div class="victory_head"><a class="blue" href="#" title="长风" target="_blank"><img src="6542.jpg"></a></div>
				<p class="victory_User"><a class="blue" href="#" title="长风" target="_blank">长风</a>获得了第10期</p>
				<p><span class="gray03">暂未晒单</span></p>
			</li>
		</ul> -->	
		<div class="Comment_share">
			<h4>最新晒单</h4>			
			<?php $ln=1;if(is_array($shaidannew)) foreach($shaidannew AS $sd): ?>
			<div class="New-single">
				<p class="New-single-time"><a class="blue" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sd['sd_userid']); ?>" target="_blank"><?php echo userid($sd['sd_userid'],'username'); ?></a><?php echo date("Y年m月d日 H:i",$sd['sd_time']); ?></p>
				<p class="New-single-C"><a href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank"><?php echo _strcut($sd['sd_content'],100); ?></a></p>
				<div class="New-singleImg"><div class="arrow arrow_Rleft"><em>◆</em></div>
					<a href="<?php echo WEB_PATH; ?>/go/shaidan/detail/<?php echo $sd['sd_id']; ?>" target="_blank">
						<img border="0" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sd['sd_thumbs']; ?>">
					</a>
				</div>
			</div>
			<?php  endforeach; $ln++; unset($ln); ?>
		</div>
		</div>
	</div>
</div>
<script>
$(function(){
	if($.cookie('xianmu')==<?php echo $shaidan['sd_id']; ?>){
		$("#emHits").addClass("smile-have");
		return false;
	}
	$("#emHits").click(function(){		
		$.post(
			"<?php echo WEB_PATH; ?>/go/shaidan/xianmu",
			{id:"<?php echo $shaidan['sd_id']; ?>"},
			function(data){
				$("#emHits em").text(data);
				$("#emHits").addClass("smile-have");
				$.cookie("xianmu","<?php echo $shaidan['sd_id']; ?>", { expires:7,path: '/'});
			}
		);
	})
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
<?php include templates("index","footer");?>