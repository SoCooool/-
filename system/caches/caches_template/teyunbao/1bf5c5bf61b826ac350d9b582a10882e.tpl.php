<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<link rel="stylesheet" type="text/css" href="<?php echo G_TEMPLATES_STYLE; ?>/css/user.css"/>
<div class="groups-stripes"></div>
<div class="layout980" style="margin-top:10px;">
	<div class="groups-left">	
		<div class="detail-Ltop">
			<div class="detail-Himg">
				<a href="<?php echo WEB_PATH; ?>/group/show/<?php echo $quanzi['id']; ?>" class="fl-img"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $quanzi['img']; ?>" border="0" ></a>
			</div>
			<div class="detail-HC"><div class="detail-Htit gray03">
				<h2><a id="thisGroupName" href="<?php echo WEB_PATH; ?>/group/show/<?php echo $quanzi['id']; ?>" class="orange"><?php echo $quanzi['title']; ?></a></h2> 
				<span class="return"><a href="<?php echo WEB_PATH; ?>/group/show/<?php echo $quanzi['id']; ?>" class="gray02">&lt;&lt; 返回论坛</a></span>
				</div>
				<p class="detail-Hinfo gray02">成员：
				<span class="gray01"><?php echo $quanzi['chengyuan']; ?></span>&nbsp;&nbsp;&nbsp;话题：
				<span class="gray01"><?php echo $quanzi['tiezi']; ?></span>&nbsp;&nbsp;&nbsp;创建时间：
				<span class="gray01"><?php echo date("Y-m-d H:i:s",$quanzi['time']); ?></span></p>
			</div>
		</div>
		<div id="divTopicShow" class="detail-content">
			<div class="detail-Ctitle">
				<div class="detail-Ctimg">
					<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($tiezi['hueiyuan']); ?>" class="fl-img" type="showCard">
					<?php if(userid($tiezi['hueiyuan'],'img')==null): ?>
					<img src="<?php echo G_TEMPLATES_STYLE; ?>/images/prmimg.jpg" width="50" height="50" />
					<?php  else: ?>
					<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo userid($tiezi['hueiyuan'],'img'); ?>" width="50" height="50" border="0"/>
					<?php endif; ?>				
					</a>
				</div>
				<div class="detail-Ctl" style="width:866px;">
					<p class="detail-tit gray"><?php echo $tiezi['title']; ?>
						<?php if($tiezi['zhiding']=='Y'): ?>
						<i class="zhiding"></i>&nbsp;
						<?php endif; ?>
					
						<i id="JingHua" class="jing" style="display:none;"></i></p>
					<div class="detail-Ctit gray03"><a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($tiezi['hueiyuan']); ?>" class="blue" type="showCard"><?php echo userid($tiezi['hueiyuan'],'username'); ?></a> 
						<span class="class-icon07"></span> 
						<span class="time gray02"><?php echo date("Y-m-d H:i:s",$tiezi['time']); ?></span>&nbsp;&nbsp;
						<span class="gray03">人气(<?php echo $tiezi['dianji']; ?>)</span>
					</div>
				</div>
			</div>
			<div id="divTopicContent" class="detail-Con gray01"><?php echo $tiezi['neirong']; ?></div>
		</div>

		<div id="divAdminPower" class="detail-admin" style="display:none;">
			<a href="javascript:;" id="btnSetGood" class="blue Control01"><s></s>话题加精</a>
			<a id="btnUnshow" href="javascript:;" class="blue Control02"><s></s>屏蔽该话题</a>
			<a href="javascript:;" id="btnCancelGood" class="blue Control03" style="display:none;"><s></s>取消加精</a>
		</div>
		<div class="Comment_main" id="commentMain" style="display: block;">
			<div class="Comment-date">
				<span class="gray02">共 <i id="totalNum" class="orange"><?php echo $total; ?></i> 条回复</span> 
				<em><a href="javascript:;" class="blue">回复</a></em>
			</div>
			<?php if($total==0): ?>
			<div class="tips-con"><i></i>暂无回复，快抢沙发吧！</div>
			<?php  else: ?>
			<?php $ln=1;if(is_array($hueifu)) foreach($hueifu AS $hf): ?>
			<div class="Comment_box_con">
				<div class="User_head"><a type="showCard" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($hf['hueiyuan']); ?>" class="fl-img">
				<?php if(userid($hf['hueiyuan'],'img')==null): ?>
				<img src="<?php echo G_TEMPLATES_STYLE; ?>/images/prmimg.jpg" width="50" height="50" />
				<?php  else: ?>
				<img id="imgUserPhoto" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo userid($hf['hueiyuan'],'img'); ?>" width="50" height="50" border="0"/>
				<?php endif; ?>	
				</a></div>
				<div class="Comment_con">
					<div class="Comment_User"><b></b><a type="showCard" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($hf['hueiyuan']); ?>" class="blue"><?php echo userid($hf['hueiyuan'],'username'); ?></a></div>
					<div class="C_summary gray02"><?php echo $hf['hueifu']; ?> 
						<span class="gray03"><?php echo date("Y-m-d H:i:s",$hf['hftime']); ?></span>
					</div>
					<div class="C_detail"><a name="linkReply" href="javascript:;" class="blue"><!-- 回复 --></a></div>
					<div name="ReplyList" class="qcomment_reply_list_module"></div>				
				</div>
			</div>
			<?php  endforeach; $ln++; unset($ln); ?>
			<div class="page_nav">
				<?php if($total>$num): ?>
				<div class="pagesx"><?php echo $page->show('two'); ?></div>
				<?php endif; ?>
			</div>
			<?php endif; ?>
		</div>
		
		<div class="Comment_Box clearfix" style="margin-top:80px; margin-bottom:60px;">
			<div class="Comment_form">
				<div class="Comment_textbox" >
					<?php if(uidcookie('uid')): ?>
					<form action="<?php echo WEB_PATH; ?>/group/group/hueifuinsert" method="post">
					<textarea id="hueifucontent" class="textarea01" name="hueifu" style="display: block;border:1px solid #C2C2C2; height:150px; resize:none;"></textarea>
					<input value="<?php echo $tiezi['id']; ?>" name="tzid" class="hidden"/>
					<div class="Comment_but"><input type="submit" name="submit" id="btnSubmitMsg" class="reply_unbotton" value="立即发送" /></div>
					</form>
					<?php  else: ?>
					<div class="Comment_login" id="notLogin">
						请您<a class="blue" href="<?php echo WEB_PATH; ?>/member/user/login" id="replyLoginBtn">登录</a>或<a class="blue" href="<?php echo WEB_PATH; ?>/member/user/register">注册</a>后再回复评论							
					</div>
					<?php endif; ?>
				</div>
			</div>
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