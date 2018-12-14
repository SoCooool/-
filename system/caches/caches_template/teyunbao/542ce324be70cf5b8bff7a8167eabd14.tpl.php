<?php defined('G_IN_SYSTEM')or exit('No permission resources.'); ?><?php include templates("index","header");?>
<script type="text/javascript">
$.fn.CloudZoom.defaults = {
	zoomWidth: '400',
	zoomHeight: '310',
	position: 'right',
	tint: false,
	tintOpacity: 0.5,
	lensOpacity: 0.5,
	softFocus: false,
	smoothMove: 7,
	showTitle: false,
	titleOpacity: 0.5,
	adjustX: 0,
	adjustY: 0
};
</script>
<style type="text/css">
.zoom-section{clear:both;margin-top:20px;}
.zoom-small-image{border:2px solid #dedede;float:left;margin-bottom:20px; width:400px; height:400px;}
.zoom-small-image img{ width:400px; height:400px;}
.zoom-desc{float:left;width:404px; height:52px;margin-bottom:20px; overflow:hidden;}
.zoom-desc p{ width:10000px; height:52px; float:left; display:block; position:absolute; top:0; z-index:3; overflow:hidden;}
.zoom-desc label{ width:50px; height:52px; margin:0 5px 0 0; _margin-right:4px; display:block; float:left; overflow:hidden;}
.zoom-tiny-image{border:1px solid #CCC;margin:0px; width:48px; height:50px;}
.zoom-tiny-image:hover{border:1px solid #C00;}
</style>
<div class="Current_nav w1200">
	<a href="<?php echo WEB_PATH; ?>">首页</a> <span>&gt;</span> 
	<a href="<?php echo WEB_PATH; ?>/goods_list/<?php echo $item['cateid']; ?>">
	<?php echo $category['name']; ?>
	</a><span>&gt;</span> 
	<a href="<?php echo WEB_PATH; ?>/goods_list/<?php echo $item['cateid']; ?>e<?php echo $item['brandid']; ?>">
	<?php echo $brand['name']; ?>
	</a> <span>&gt;</span>商品详情 
</div>
<div class="show_content">
	<!-- 商品期数 -->
	<div id="divPeriodList" class="show_Period" style="max-height:99px;">
		<div class="period_Open bt_gray bb_gray bl_gray">
			<a class="gray02" href="javascript:;" id="btnOpenPeriod" click="off">展开<i></i></a>
		</div>	
			<?php echo $loopqishu; ?>
	</div>
	<!-- 商品信息 -->
	<div class="Pro_Details">
		<p style="font-size:24px;padding-bottom: 9px;margin-top: 15px;color:#f00">
		<span class="f24">(第<?php echo $item['qishu']; ?>期)</span>
		<span  class="f24"><?php echo $item['title']; ?></span>
		<span style="<?php echo $item['title_style']; ?>"><?php echo $item['title2']; ?></span>
		</p>
		<div class="Pro_Detleft">
			<div class="zoom-small-image">
				<span href="<?php echo G_UPLOAD_PATH; ?>/<?php echo $item['thumb']; ?>" class = 'cloud-zoom' id='zoom1' rel="adjustX:10, adjustY:-2">
                <img width="80px" height="80px" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $item['thumb']; ?>" /></span>
			</div>

			<div class="zoom-desc"> 
				<div class="jcarousel-prev jcarousel-prev-disabled"></div>
				<div class="jcarousel-clip" style="height:55px;width:384px;">
				<p>
					<?php $ln=1;if(is_array($item['picarr'])) foreach($item['picarr'] AS $imgtu): ?>                  
					<label href="<?php echo G_UPLOAD_PATH; ?>/<?php echo $imgtu; ?>" class='cloud-zoom-gallery'  rel="useZoom: 'zoom1', smallImage: '<?php echo G_UPLOAD_PATH; ?>/<?php echo $imgtu; ?>'">
					<img class="zoom-tiny-image" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $imgtu; ?>" /></label>			
					<?php  endforeach; $ln++; unset($ln); ?> 
				</p>
				</div>
				<div class="jcarousel-next jcarousel-next-disabled"></div>
			</div>
			<script>
				var si=$(".jcarousel-clip label").size();
				var label=si*55;
				$(".jcarousel-clip p").css({width:label,left:"0"});
				if(label>395){
					$(".jcarousel-prev,.jcarousel-next").show();
				}else{
					$(".jcarousel-prev,.jcarousel-next").hide();
				}
				$(".jcarousel-prev").click(function(){
					var le=$(".jcarousel-clip p").css("left");
					var le2=le.replace(/px/,"");
					if(le!='0px'){
						$(".jcarousel-clip p").css({left:le2*1+55});
					}						
				})
				$(".jcarousel-next").click(function(){
					var le=$(".jcarousel-clip p").css("left");
					var le2=le.replace(/px/,"");
					var max_next=-(si-7)*55+"px";
					if(le!=max_next){						
						$(".jcarousel-clip p").css({left:le2*1-55});
					}
				})
			</script>
			
			
			<?php if($sid_code): ?>
			<?php 
				$sid_code['q_user'] = unserialize($sid_code['q_user']);
			 ?>
			<?php if($sid_code['q_showtime']=='N'): ?>
			<div class="Pro_GetPrize">				
				<h2>上期获得者</h2>
				<div class="GetPrize">				    
					<dl>
						<dt><a rel="nofollow" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sid_code['q_uid']); ?>" target="_blank"><img width="80" height="80" alt="" src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $sid_code['q_user']['img']; ?>"></a></dt>
						<dd class="gray02">
							<p>恭喜 <a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($sid_code['q_uid']); ?>" target="_blank" class="blue"><?php echo get_user_name($sid_code['q_uid']); ?></a>获得了本商品</p>
							<?php if($sid_go_record['ip']): ?>
							<?php echo get_ip($sid_go_record['id'],'ipcity'); ?>
							<?php endif; ?>
							<p>揭晓时间：<?php echo microt($sid_code['q_end_time']); ?></p>
							<p>夺宝时间：<?php echo microt($sid_go_record['time']); ?></p>
							<p>幸运夺宝码：<em class="orange Fb"><?php echo $sid_code['q_user_code']; ?></em></p>
						</dd>
					</dl>				
				</div>
			</div>
			<?php endif; ?>
			<?php endif; ?>
		</div>
		<div class="Pro_Detright">
			<p class="Det_money">价值：<span class="rmbgray"><?php echo $item['money']; ?></span></p>
			<!--显示揭晓动画 start-->
			<?php if(($q_showtime=='Y')): ?>
				<?php include templates("index","item_animation");?>
			<?php  else: ?>
				<?php include templates("index","item_contents");?>
			<?php endif; ?>	
			<!--显示揭晓动画 end-->		
			<div class="Security">
				<ul>
					<li><a href="<?php echo WEB_PATH; ?>/help/4" target="_blank"><i></i>100%公平公正</a></li>
					<li><a href="<?php echo WEB_PATH; ?>/help/5" target="_blank"><s></s>100%正品保证</a></li>
					<li><a href="<?php echo WEB_PATH; ?>/help/7" target="_blank"><b></b>全国免费配送</a></li>
				</ul>
			</div>			
			<div class="Pro_Record">
				<ul id="ulRecordTab" class="Record_tit">
					<li class="NewestRec Record_titCur">最新夺宝记录</li>
					<li class="MytRec">我的夺宝记录</li>
					<li class="Explain orange">什么是？</li>
				</ul>
				<div class="Newest_Con hide">
					<ul>
						<?php $ln=1;if(is_array($us)) foreach($us AS $user): ?>
						<li>
						<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($user['uid']); ?>" target="_blank">
						<?php if(!empty($user['uphoto'])): ?>
							<img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $user['uphoto']; ?>" border="0" alt="" width="20" height="20">
						<?php  else: ?>
							<img src="<?php echo G_UPLOAD_PATH; ?>/photo/member.jpg" border="0" alt="" width="20" height="20">
						<?php endif; ?>
						</a>					
						<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($user['uid']); ?>" target="_blank" class="blue"><?php echo $user['username']; ?></a>
						<?php if($user['ip']): ?>
						(<?php echo get_ip($user['id'],'ipcity'); ?>) 
						<?php endif; ?>				
						<?php echo _put_time($user['time']); ?> 夺宝了
						<em class="Fb gray01"><?php echo $user['gonumber']; ?></em>人次</li>
						<?php  endforeach; $ln++; unset($ln); ?>
					</ul>
					<p style=""><a id="btnUserBuyMore" href="javascript:;" class="gray01">查看更多</a></p>					
				</div>
				<div class="My_Record hide" style="display:none;">
					<?php if(uidcookie('uid')): ?>					
					<ul>
						<?php $ln=1;if(is_array($us2)) foreach($us2 AS $user): ?>
						<?php if($user['uid']==uidcookie('uid')): ?>
						<li><?php echo _put_time($user['time']); ?>  夺宝了  <?php echo $user['gonumber']; ?>  个夺宝码</li>
						<?php endif; ?>
						<?php  endforeach; $ln++; unset($ln); ?>
					</ul>
					<?php  else: ?>
					<div class="My_RecordReg">
						<b class="gray01">看不到？是不是没登录或是没注册？ 登录后看看</b>
						<a href="<?php echo WEB_PATH; ?>/member/user/login" class="My_Signbut">登录</a><a href="<?php echo WEB_PATH; ?>/member/user/register" class="My_Regbut">注册</a>
					</div>
					<?php endif; ?>
				</div>
				<div class="Newest_Con hide" style="display:none;">
					<p class="MsgIntro"><?php echo _cfg("web_name_two"); ?>购是指只需1元就有机会买到想要的商品。即每件商品被平分成若干“等份”出售，每份1元，当一件商品所有“等份”售出后，根据夺宝规则产生一名幸运者，该幸运者即可获得此商品。</p>
					<p class="MsgIntro1"><?php echo _cfg("web_name_two"); ?>以“快乐夺宝，惊喜无限”为宗旨，力求打造一个100%公平公正、100%正品保障、寄娱乐与购物一体化的新型购物网站。<a href="<?php echo WEB_PATH; ?>/help/1" class="blue" target="_blank">查看详情&gt;&gt;</a></p>
				</div>
			</div>			
		</div>
	</div>
</div>
<!-- 商品信息导航 -->
<div class="ProductTabNav">
	<div id="divProductNav" class="DetailsT_Tit">
		<div class="DetailsT_TitP">
			<ul>
				<li class="Product_DetT DetailsTCur"><span class="DetailsTCur">商品详情</span></li>
				<li id="liUserBuyAll" class="All_RecordT"><span class="">所有参与记录</span></li>
				<li class="Single_ConT"><span class="">晒单</span></li>
			</ul>
		</div>
	</div>
</div>
<!-- 商品内容 -->
<div id="divContent" class="Product_Content">
	<div class="Product_Con hide" style="display:block;"><?php echo $item['content']; ?></div>
	<div name="bitem" class="AllRecordCon hide" style="display:none;">
		<?php $ln=1;if(is_array($us2)) foreach($us2 AS $user): ?>
		<div class="AllRecW AllRecTime"><p><?php echo microtDate($user['time']); ?></p> <b></b></div>			
		<div class="AllRecW AllReclist">
			<div class="AllRecL fl"><?php echo microt($user['time']); ?><i></i></div>
			<div class="AllRecR fl" style="background:#F8F8F8; border:1px solid #F8F8F8">
			<p class="AllRecR_T"  style="line-height:15px;">
				<span name="spCodeInfo" class="AllRecR_Over">
				<a class="Headpic" href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($user['uid']); ?>" target="_blank"><img src="<?php echo G_UPLOAD_PATH; ?>/<?php echo $user['uphoto']; ?>" border="0" width="20" height="20"></a>
				<a href="<?php echo WEB_PATH; ?>/uname/<?php echo idjia($user['uid']); ?>" target="_blank" class="blue"><?php echo _strcut($user['username'],6); ?></a>
				<?php if($user['ip']): ?>
				(<?php echo get_ip($user['id'],'ipcity'); ?> IP:<?php echo get_ip($user['id'],'ipmac'); ?>)
				<?php endif; ?>
				夺宝了<em class="Fb orange"><?php echo $user['gonumber']; ?></em>人次
				</span>
			</p>
			</div>
		</div>
		<?php  endforeach; $ln++; unset($ln); ?>
	</div>
	
		<!-- 晒单 -->
	<div id="divPost" class="Single_Content">
		<iframe id="iframea" src="<?php echo WEB_PATH; ?>/go/shaidan/itmeifram/<?php echo $itemid; ?>" style="width:1200px; border:none;height:0px;" frameborder="0" scrolling="no"></iframe>
	</div>
	
</div>
<script>  
 $(function(){
	 $("#num_dig").mousemove(function(){
	  $(this).css("border","1px solid #ca1b38");		 
	});
	 $("#num_dig").mouseout(function(){
	  $(this).css("border","1px solid #CFCFCF");		 
	});		
});
</script> 
<script>
$("#btnOpenPeriod").click(function(){
		var ui_obj = $("#divPeriodList > ul");
		if($(this).attr("click")=='off'){
			$("#divPeriodList").css("max-height",ui_obj.length*33+"px");	
			$(this).attr("click","on");
			$(this).html("收起<s></s>");
			
		}else{
			$("#divPeriodList").css("max-height","99px");	
			$(this).attr("click","off");
			$(this).html("展开<i></i>");
		}			
});

//添加购买
$(function(){

var syrs="<?php echo $syrs; ?>";
var shopnum = $("#num_dig");

function baifenshua(aa,n){
	n = n || 2;
	return ( Math.round( aa * Math.pow( 10, n + 2 ) ) / Math.pow( 10, n ) ).toFixed( n ) + '%';
}

shopnum.ready(function(){
	if(shopnum.val()>syrs){
		shopnum.val(syrs);
	}   
});


shopnum.keyup(function(){
	if(isNaN(shopnum.val())){					
	 shopnum.val(1);
	}else{
		if(shopnum.val()<=0){					
		 shopnum.val(1);	
		} 
		if(shopnum.val()>syrs){
			shopnum.val(syrs);
		}
			var numshop=shopnum.val();
			if(numshop==69){
				var baifenbi='100%';
			}else{
				var showbaifen=numshop/69;
				var baifenbi=baifenshua(showbaifen,2);
			}
			$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");   		
	}	
  
});	

$("#shopadd").click(function(){
				var shopnum = $("#num_dig");
				var resshopnump='';				
				var num = parseInt(shopnum.val());
				if(num+1 >syrs){				
					shopnum.val(syrs);
					resshopnump = syrs;
				}else{
					resshopnump=parseInt(shopnum.val())+1;
					// shopnum.val(resshopnump);	
					// if(shopnum.val()>=syrs){
					// 	resshopnump=shopinfo['shenyu'];
					// 	shopnum.val(resshopnump);
					// }
				}
			if(resshopnump==69){
				var baifenbi='100%';
			}else{
				var showbaifen=resshopnump/69;
				var baifenbi=baifenshua(showbaifen,2);
			}
			$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");                			
		});
		
$("#shopsub").click(function(){
		var shopnum = $("#num_dig");
		var num = parseInt(shopnum.val());
		if(num<2){
			shopnum.val(1);			
		}else{
			var shopnums = shopnum.val(parseInt(shopnum.val()));
		}
 		// var shopnums=parseInt(shopnum.val());
		if(shopnums==69){
				var baifenbi='100%';
			}else{
				var showbaifen=shopnums/69;
				var baifenbi=baifenshua(showbaifen,2);
			}
			$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");       
	});		
});

$(function(){
$(".Det_Cart").click(function(){ 
	Cartcookie(false);
});
	$(".Det_Shopbut").click(function(){	
		Cartcookie(true);
	});	
});


function Cartcookie(cook){
	var info = {};
	var shopid=shopinfo['shopid'];
	var cookie_pre="wc_";//cookie配置前缀
	var Cartlist = $.cookie(cookie_pre+'Cartlist');
	if(!Cartlist){
		var info = {};
	}else{
		var info = $.evalJSON(Cartlist);
		if((typeof info) !== 'object'){
			var info = {};
		}
	}		
	if(!info[shopid]){
		var CartTotal=$("#sCartTotal").text();
			$("#sCartTotal").text(parseInt(CartTotal)+1);
			$("#btnMyCart em").text(parseInt(CartTotal)+1);
	}	
	var number=parseInt($("#num_dig").val());	
	info[shopid]={};
	info[shopid]['num']=number;
	info[shopid]['shenyu']=shopinfo['shenyu'];
	info[shopid]['money']=shopinfo['money'];
	info['MoenyCount']='0.00';
	$.cookie(cookie_pre+'Cartlist',$.toJSON(info),{expires:7,path:'/'});	
	if(cook){
		window.location.href="<?php echo WEB_PATH; ?>/member/cart/cartlist/"+new Date().getTime();//+new Date().getTime()
	}
}


</script>			



















<script type="text/javascript">
function set_iframe_height(height){
//	alert(height);
	$("#iframea").css("height",height);
	if(this.divPost!='yes'){
		$("#divPost").hide();this.divPost='yes';
	}
}

$(function(){
	$("#ulRecordTab li").click(function(){
		var add=$("#ulRecordTab li").index(this);
		$("#ulRecordTab li").removeClass("Record_titCur").eq(add).addClass("Record_titCur");
		$(".Pro_Record .hide").hide().eq(add).show();
	});
var fouli=$(".DetailsT_TitP ul li");
	fouli.click(function(){
		var add=fouli.index(this);	
		if(add ==2){
			$("#divPost").show();
		}
		if(add ==0 || add==1){
			$("#divPost").hide();
		}
		
		fouli.removeClass("DetailsTCur").eq(add).addClass("DetailsTCur");
		$("#divContent .hide").hide().eq(add).show();
	});
	$("#btnUserBuyMore").click(function(){
		fouli.removeClass("DetailsTCur").eq(1).addClass("DetailsTCur");
		$("#divContent .hide").hide().eq(1).show();
		$("html,body").animate({scrollTop:941},1500);
		$("#divProductNav").addClass("nav-fixed");
	});
	$(window).scroll(function(){
		if($(window).scrollTop()>=941){
			$("#divProductNav").addClass("nav-fixed");
			var wh = $(document.body).outerWidth(true);
			var w = (wh-1200)/2;
			$("#divProductNav").css("left",w + "px");
			
		}else if($(window).scrollTop()<941){
			$("#divProductNav").removeClass("nav-fixed");
		}
	});
})
var shopinfo={'shopid':<?php echo $item['id']; ?>,'money':<?php echo $item['yunjiage']; ?>,'shenyu':<?php echo $syrs; ?>};

	
$(function(){
	function baifenshua(aa,n){
	n = n || 2;
	return ( Math.round( aa * Math.pow( 10, n + 2 ) ) / Math.pow( 10, n ) ).toFixed( n ) + '%';
}
	var shopnum = $("#num_dig");
	shopnum.keyup(function(){
		if(shopnum.val()><?php echo $syrs; ?>){
			shopnum.val(<?php echo $syrs; ?>);
		}
		var numshop=shopnum.val();
		if(numshop==<?php echo $item['zongrenshu']; ?>){
			var baifenbi='100%';
		}else{
			var showbaifen=numshop/<?php echo $item['zongrenshu']; ?>;
			var baifenbi=baifenshua(showbaifen,2);
		}
		$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");
	});	
	
	$("#shopadd").click(function(){
		var shopnum = $("#num_dig");
			var resshopnump='';
			var num = parseInt(shopnum.val());				
			if(num+1 > 450){				
				shopnum.val(<?php echo $syrs; ?>);
				resshopnump = <?php echo $syrs; ?>;
			}else{
				resshopnump=parseInt(shopnum.val())+1;
				shopnum.val(resshopnump);	
				if(shopnum.val()>=<?php echo $syrs; ?>){
					resshopnump=shopinfo['shenyu'];
					shopnum.val(resshopnump);
				}
			}
			if(resshopnump==<?php echo $item['zongrenshu']; ?>){
				var baifenbi='100%';
			}else{
				var showbaifen=resshopnump/<?php echo $item['zongrenshu']; ?>;
				var baifenbi=baifenshua(showbaifen,2);
			}
			$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");
	});
	
	
	$("#shopsub").click(function(){
		var shopnum = $("#num_dig");
		var num = parseInt(shopnum.val());
		if(num<2){
			shopnum.val(1);			
		}else{
			shopnum.val(parseInt(shopnum.val())-1);
		}
		var shopnums=parseInt(shopnum.val());
		if(shopnums==<?php echo $item['zongrenshu']; ?>){
				var baifenbi='100%';
			}else{
				var showbaifen=shopnums/<?php echo $item['zongrenshu']; ?>;
				var baifenbi=baifenshua(showbaifen,2);
			}
			$("#chance").html("<span style='color:red'>获得机率"+baifenbi+"</span>");
	});
});

$(function(){
$(".Det_Cart").click(function(){ 
	//添加到购物车动画
	var src=$("#zoom1 img").attr('src');  
	var $shadow = $('<img id="cart_dh" style="display: none; border:1px solid #aaa; z-index: 99999;" width="400" height="400" src="'+src+'" />').prependTo("body"); 
	var $img = $(".mousetrap").first("img");
	$shadow.css({ 
	   'width' : $img.css('width'), 
	   'height': $img.css('height'),
	   'position' : 'absolute',      
	   'top' : $img.offset().top,
	   'left' : $img.offset().left, 
	   'opacity' :1    
	}).show();
	var $cart =$("#btnMyCart");
	var numdig=$(".num_dig").val();
	$shadow.animate({   
		width: 1, 
		height: 1, 
		top: $cart.offset().top, 
		left: $cart.offset().left,
		opacity: 0
	},500,function(){
		Cartcookie(false);
	});		
});
	$(".Det_Shopbut").click(function(){	
		Cartcookie(true);
	});	
});


$("#m_all_sort").hide();
$(function(){	
	$(".list_classMore").click(showh);
});

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




function Cartcookie(cook){
	var shopid=shopinfo['shopid'];
	var number=parseInt($("#num_dig").val());
	if(number<=1){number=1;}
	var Cartlist = $.cookie('Cartlist');
	if(!Cartlist){
		var info = {};
	}else{
		var info = $.evalJSON(Cartlist);
		if((typeof info) !== 'object'){
			var info = {};
		}
	}		
	if(!info[shopid]){
		var CartTotal=$("#sCartTotal").text();
			$("#sCartTotal").text(parseInt(CartTotal)+1);
			$("#btnMyCart em").text(parseInt(CartTotal)+1);
	}	
	info[shopid]={};
	info[shopid]['num']=number;
	info[shopid]['shenyu']=shopinfo['shenyu'];
	info[shopid]['money']=shopinfo['money'];
	info['MoenyCount']='0.00';	
	$.cookie('Cartlist',$.toJSON(info),{expires:7,path:'/'});
	if(cook){
		window.location.href="<?php echo WEB_PATH; ?>/member/cart/cartlist/"+new Date().getTime();//+new Date().getTime()
	}
}  
</script> 

<?php include templates("index","footer");?>