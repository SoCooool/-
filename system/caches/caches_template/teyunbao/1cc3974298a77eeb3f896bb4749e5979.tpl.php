<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<link rel="stylesheet" type="text/css" href="<?php echo G_TEMPLATES_STYLE; ?>/css/user.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo G_TEMPLATES_STYLE; ?>/css/user.message.css"/>
<div class="layout980 clearfix"> 

	<div class="sidebar">
		<div style="height:140px;">
		<a href=""><?php include templates("us","left");?></a>
		</div>  
	</div>	
	<div class="content clearfix" style="width:799px; padding-top:20px;">
		<div class="per-info">
			<ul>
				<li class="info-mane gray02">
					<b class="gray01"><?php echo get_user_name($member,'username'); ?></b>
				</li>
				<li class="info-address gray02"><span></span></li>
             				 <li class="info-intro gray02">
             				 <?php if($member['qianming']!=null): ?>
             				 <?php echo $member['qianming']; ?>
            				  <?php  else: ?>
            				  这家伙很懒，什么都没留下。
            				  <?php endif; ?>
             				 </li>
			</ul>
		</div>
		<div class="su_s">
			<span>经验值：</span><b><?php echo $member['jingyan']; ?></b>
			<div class="yun_zj"></div>
			<span>主页：</span><a href="" class="blue"><s></s><?php echo WEB_PATH; ?>/uname/<?php echo idjia($member['uid']); ?></a>
		</div>
	</div>
	<div class="clear"></div>

	<?php include templates("us","tab");?>
	<?php if($membergo): ?>
	<div id="divInfo0" class="ugoods_show">
	<ul class="ugtitle">
		<li>商品图片</li>
		<li class="gname">商品名称</li>
		<li class="yg_status">YGV4状态</li>
		<li class="joinInfo">参与人次</li>
		<li class="do">操作</li>
	</ul>
		<?php $ln=1;if(is_array($membergo)) foreach($membergo AS $go): ?>
				<?php 
        				$jiexiao = get_shop_if_jiexiao($go['shopid']);
						 if ($jiexiao['q_uid']){
							$url = "dataserver";
						 }else{
							$url = "goods";
						 }
    			 ?>
		<ul class="ugoods_list">
		    <li><a target="_blank" href="<?php echo WEB_PATH; ?>/<?php echo $url; ?>/<?php echo $go['shopid']; ?>"><img class="pic"  src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $jiexiao['thumb']; ?>"></a></li>
		                    <li class="gname" style="margin:15px 0 0 0;">
		        <a target="_blank" href="<?php echo WEB_PATH; ?>/<?php echo $url; ?>/<?php echo $go['shopid']; ?>" class="blue">(第<?php echo $go['shopqishu']; ?>期)<?php echo $go['shopname']; ?></a>
		        <p class="gray02">购买时间：<?php echo microt($go['time'],"r"); ?></p>
		        <p class="gray02">购买人：<?php echo get_user_name($member,'username'); ?></p>
		    </li>
		    	<?php if($jiexiao['q_uid']): ?>
		                    <li class="yg_status" style="margin:23px 0 0 0;">幸运一块壕码：<br><span class="c_red"><?php echo $jiexiao['q_user_code']; ?></span></li>
		                    <li class="joinInfo" style="margin:23px 0 0 0;"><p><em><?php echo $go['gonumber']; ?></em>人次</p></li>
		                      <li class="do" style="margin:23px 0 0 0;"><a href="<?php echo WEB_PATH; ?>/dataserver/<?php echo $go['shopid']; ?>"  class="blue" title="详情">详情</a></li>
			<?php  else: ?>
			<li class="yg_status" style="margin:23px 0 0 0;">揭晓时间：<br><span class="c_red">项目正在进行中...</span></li>
			<li class="joinInfo" style="margin:23px 0 0 0;"><p><em><?php echo $go['gonumber']; ?></em>人次</p></li>
			  <li class="do" style="margin:23px 0 0 0;"><a href="<?php echo WEB_PATH; ?>/goods/<?php echo $go['shopid']; ?>" class="blue" title="详情">详情</a></li>
			<?php endif; ?>			                                    
		</ul>
		<?php  endforeach; $ln++; unset($ln); ?>		
	</div>
	<?php  else: ?>
	<div class="New-content"><div class="tips-con"><i></i>TA还没有一块壕商品哦</div></div> 
	<?php endif; ?>   
</div>


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