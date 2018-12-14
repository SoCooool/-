<?php defined('G_IN_ADMIN')or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<script src='http://www.ichartjs.com/ichart.latest.min.js'></script>
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/global.css" type="text/css">
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/style.css" type="text/css">
<style>
	 body{ background-color:#fefeff; font:12px/1.5 arial,宋体b8b\4f53,sans-serif;}

	.width30{ width:25%; font-size:12px; border-radius:5px 2px 20px 2px;  }

	.title{ font-size:15px; font-weight:bold; color:#444; line-height:30px; border-bottom:1px solid #ccc;}

	.div-news{ height:50px; background-color:#fff}

	.div-user span{ display:block; font-size:12px; font: 12px/1.5 arial,宋体b8b\4f53,sans-serif; line-height:20px; color:#999}

	.div-user{ background-color:#fff; padding:20px;width:30%;float:left;  border-bottom:1px solid #eee }

	.div-button{float:left;background-color:#F2F2F2; float:left;  width:100%; height: 400px;margin-top: 10px; margin-left:10px;margin-right: 10px;}

	.div-button ul li{ float:left; margin:0px 25px;}

	.div-button li a{  cursor:pointer; text-decoration:none}

	.div-button li span{ display:block; width:60px; text-align:center; line-height:32px;} 

	.div-system{background-color:#fff; float:left; padding:20px; margin:0 10px;border:1px solid #ccc; box-shadow: 0px 0px 5px #888;}

	.div-webinfo{background-color:#fff; float:left; padding:20px; margin:0 10px; width:27%;border:1px solid #ccc; box-shadow: 0px 0px 5px #888;}

	.div-about{background-color:#fff; float:left; padding:20px; margin:0 10px; overflow:hidden;border:1px solid #ccc; box-shadow: 0px 0px 5px #888;}

	 li{font:12px/1.5 arial,宋体b8b\4f53,sans-serif;}

	.div-system ul li{height:30px; line-height:30px;color:#6b6b6b;border-bottom:1px dashed #ddd;}

	.div-system ul li i{width:90px;height:30px; line-height:30px; display:inline-block; color:#666;}

	.div-about ul li{height:30px; line-height:30px;color:#6b6b6b;border-bottom:1px dashed #ddd;}

	.div-about ul li i{width:90px;height:30px; line-height:30px; display:inline-block; color:#666;}
	
	.div-webinfo ul li{height:30px; line-height:30px;color:#6b6b6b;border-bottom:1px dashed #ddd;}

	.div-webinfo ul li i{width:90px;height:30px; line-height:30px; display:inline-block; color:#666;}

	.job{width: 100%; float: left; padding-bottom: 20px; border-bottom: 1px dashed #DDD;}
	.job .left{width: 200px;float: left; color: #3C8DBC;}
	.job .right{width: 100px;float: left; }
	.job span{font-weight: 700; font-size: 14px;}
	.div-button img{display: block;float: left;}
</style>
<script type="text/javascript">
$(function() {
	var data = [
                  {
                  name:"01-02",
                  value:20,
                  color:"rgba(130,127,191,0.80)"
            },{
                  name:"02-03",
                  value:24,
                  color:"rgba(228,190,77,0.80)"
            },{
                  name:"03-04",
                  value:30,
                  color:"rgba(145,170,81,0.80)"
            },{
                  name:"04-05",
                  value:26,
                  color:"rgba(161,69,69,0.80)"
            },{
                  name:"05-06",
                  value:14,
                  color:"#eda5a5"
            },{
                  name:"06-07",
                  value:11,
                  color:"#f07171"
            },{
                  name:"07-08",
                  value:22,
                  color:"#89f069"
            },{
                  name:"08-09",
                  value:26,
                  color:"#98c3f5"
            },{
                  name:"09-10",
                  value:6,
                  color:"#a418c7"
            },{
                  name:"10-11",
                  value:19,
                  color:"#eb581e"
            },{
                  name:"11-12",
                  value:33,
                  color:"#51065e"
            },{
                  name:"12-01",
                  value:27,
                  color:"#1ad4b8"
            }
            ];

	var chart = new iChart.Column2D({
		render : 'ichart-render',
		data : data,
		title:{
		                  text:"销售数据统计报告",
		                  color:"#3c8dbc",
		                  fontsize:20,
		                  font:"微软雅黑",
		                  textAlign:"center",
		                  height:38,
		                  offsetx:0,
		                  offsety:0
		},
		width : 700,
		height : 400,
		label : {
			fontsize:11,
			color : '#666666'
		},
		animation : true,//开启过渡动画
		animation_duration:800,//800ms完成动画
		shadow : true,
		shadow_blur : 2,
		shadow_color : '#aaaaaa',
		shadow_offsetx : 1,
		shadow_offsety : 0,
		column_width : 22,
		sub_option : {
			listeners : {
				parseText : function(r, t) {
					return t + "%";
				}
			},
			label : {
				fontsize:11,
				fontweight:600,
				color : '#4572a7'
			},
			border : {
				width : 2,
				color : '#ffffff'
			}
		},
	            coordinate:{
	                  width:"88%",
	                  height:"80%",
	                  background_color:"rgba(240,130,130,0.1)",
	                  axis:{
	                        color:"#666791",
	                        width:["","",2,""]
	                  },
	                  grid_color:"#c0c0c0",
	                  label:{
	                        fontweight:600,
	                        color:"#666666",
	                        fontsize:11
	                  }
	            },
	});
	
	/**
	 *利用自定义组件构造左侧说明文本。
	 */
	chart.plugin(new iChart.Custom({
			drawFn:function(){
				var coo = chart.getCoordinate(),
					x = coo.get('originx'),
					y = coo.get('originy'),
					H = coo.height;
				chart.target.textAlign('center')
				.textBaseline('middle')
				.textFont('600 13px Verdana')
				.fillText('',x-40,y+H/2,false,'#6d869f', false,false,false,-90);
				
			}
	}));
	
	chart.draw();
});


$(function() {
/****************饼状图开始******************/
	var data1 = [
	        	{name : '支付宝',value : 0.73,color:'#6f83a5'},
	        	{name : '微信扫码',value : 35.75,color:'#a5c2d5'},
	        	{name : '微信手机',value : 29.84,color:'#cbab4f'},
	        	{name : '手机支付宝',value : 24.88,color:'#76a871'},
	        	{name : '转账',value : 6.77,color:'#9f7961'},
	        	{name : '财付通',value : 2.02,color:'#a56f8f'}
        	];
      	
	new iChart.Pie2D({
		render : 'ichart-b',
		data: data1,
		title : '充值方式统计分布',
		legend : {
			enable : true
		},
		sub_option : {
			label : {
				background_color:null,
				sign:true,//设置禁用label的小图标
				padding:'0 4',
				border:{
					enable:false,
					color:'#ccc'
				},
				fontsize:11,
				fontweight:600,
				color : '#4572a7'
			},
			border : {
				width : 2,
				color : '#ffffff'
			}
		},
		animation:true,
		showpercent:true,
		decimalsnum:2,
		width : 400,
		height : 180,
		radius:70
	}).draw();
});


	$(function(){
		var flow=[];
		for(var i=0;i<25;i++){
			flow.push(Math.floor(Math.random()*(10+((i%16)*5)))+10);
		}
		
		var data = [
		         	{
		         		name : 'PV',
		         		value:flow,
		         		color:'#ec4646',
		         		line_width:2
		         	}
		         ];
        
		var labels = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
		
		var chart = new iChart.LineBasic2D({
			render : 'canvasDiv',
			data: data,
			align:'center',
			title : {
				text:'过去七天基本流量',
				font : '微软雅黑',
				fontsize:12,
				color:'#b4b4b4'
			},
			width : 400,
			height : 200,
			shadow:true,
			shadow_color : '#c0c0c0',
			shadow_blur : 4,
			shadow_offsetx : 0,
			shadow_offsety : 0,
			background_color:'#fcf1f1',
			animation : true,//开启过渡动画
			animation_duration:900,//600ms完成动画
			tip:{
				enable:true,
				shadow:true,
				listeners:{
					 //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
					parseText:function(tip,name,value,text,i){
						 return "<span style='color:#005268;font-size:12px;'>"+labels[i]+":00访问量约:<br/>"+
							"</span><span style='color:#005268;font-size:20px;'>"+value+"万</span>";
					}
				}
			},
			crosshair:{
				enable:true,
				line_color:'#ec4646'
			},
			sub_option : {
				smooth : true,
				label:false,
				hollow:false,
				hollow_inside:false,
				point_size:6
			},
			coordinate:{
				width:450,
				height:120,
				striped_factor : 0.18,
				grid_color:'#ccc',
				axis:{
					color:'#ccc',
					width:[0,0,2,2]
				},
				scale:[{
					 position:'left',	
					 start_scale:0,
					 end_scale:80,
					 scale_space:10,
					 scale_size:1,
					 scale_enable : false,
					 label : {color:'#ccc',font : '微软雅黑',fontsize:11},
					 scale_color:'#ccc'
				},{
					 position:'bottom',	
					 label : {color:'#ccc',font : '微软雅黑',fontsize:11},
					 scale_enable : false,
					 labels:labels
				}]
			}
		});
		//利用自定义组件构造左侧说明文本
		chart.plugin(new iChart.Custom({
				drawFn:function(){
					//计算位置
					var coo = chart.getCoordinate(),
						x = coo.get('originx'),
						y = coo.get('originy'),
						w = coo.width,
						h = coo.height;
					//在左上侧的位置，渲染一个单位的文字
					chart.target.textAlign('start')
					
				}
		}));
	//开始画图
	chart.draw();
});




</script>
</head>

<body>


<div class="div-button" style="width:95%;  max-width:1024px;">

<div id='ichart-render' style="float:left; width:65%;"></div>
 <div id='ichart-b' style="float:right; margin-left:20px;width:30%;"></div>
 <div id='canvasDiv' style="float:right; margin-left:20px;margin-top:20px;width:30%;"></div>
</div>

<div class="bk10"></div>

<div class="bk10"></div>

<script type="text/javascript">

(function(A){

   function _ROLL(obj){

      this.ele = document.getElementById(obj);

	  this.interval = false;

	  this.currentNode = 0;

	  this.passNode = 0;

	  this.speed = 100;

	  this.childs = _childs(this.ele);

	  this.childHeight = parseInt(_style(this.childs[0])['height']);

	      addEvent(this.ele,'mouseover',function(){

				                               window._loveYR.pause();

											});

		  addEvent(this.ele,'mouseout',function(){

				                               window._loveYR.start(_loveYR.speed);

											});

   }

   function _style(obj){

     return obj.currentStyle || document.defaultView.getComputedStyle(obj,null);

   }

   function _childs(obj){

	  var childs = [];

	  for(var i=0;i<obj.childNodes.length;i++){

		 var _this = obj.childNodes[i];

		 if(_this.nodeType===1){

			childs.push(_this);

		 }

	  }   

	  return childs;

   }

	function addEvent(elem,evt,func){

	   if(-[1,]){

		   elem.addEventListener(evt,func,false);   

	   }else{

		   elem.attachEvent('on'+evt,func);

	   };

	}

	function innerest(elem){

      var c = elem;

	  while(c.childNodes.item(0).nodeType==1){

	      c = c.childNodes.item(0);

	  }

	  return c;

	}


</script>

<div style="overflow:hidden">

<!------------>

    <div class="div-system width30">

        <div class="title">系统信息</div>

        	<div class="bk10"></div>

            <ul>        

                <li><i>操作系统: </i><?php echo $SysInfo['os'];?></li>

                <li><i>服务器版本: </i><?php echo $SysInfo['web_server'];?></li>

                <li><i>PHP版本: </i><?php echo $SysInfo['phpv'];?></li>

                <li><i>MYSQL版本: </i><?php echo $SysInfo['MysqlVersion'];?></li>

                <li><i>上传限制: </i><?php echo $SysInfo['fileupload'];?></li>

                <li><i>时区: </i><?php echo $SysInfo['timezone'];?></li>

                <li><i>GD库: </i><?php echo showResult('imageline');?></li>

                <li><i>POST限制: </i><?php echo get_cfg_var('post_max_size'); ?></li>

                <li><i>脚本超时时间: </i><?php echo ini_get('max_execution_time').'秒'; ?></li>

				<li><i>set_time_limit: </i><?php echo showResult('set_time_limit'); ?></li>

				<li><i>fsockopen: </i><?php echo showResult('fsockopen'); ?></li>

                <li style="border-bottom:none;"><i>ZEND支持: </i><?php echo showResult('zend_version'); ?> </li>

      

            </ul>      

    </div>

	<?php

	$tj_category=$this->db->GetList("SELECT cateid FROM `@#_category` WHERE `model` = '1'");

	$tj_brand=$this->db->GetList("SELECT id FROM `@#_brand`");

	$tj_article=$this->db->GetList("SELECT * FROM `@#_article`");

	$tj_shoplist=$this->db->GetList("SELECT id FROM `@#_shoplist`");	

	$time=time();

	$tj_shoplist_xsjx=$this->db->GetList("SELECT id FROM `@#_shoplist` where `xsjx_time`>'$time'");

	$tj_member=$this->db->GetList("SELECT uid FROM `@#_member`");

	

	$tm=time()-24*3600;

	$tj_member_new=$this->db->GetList("SELECT uid FROM `@#_member` where `time`>'$tm' ");

	$tj_shoplist_new=$this->db->GetList("SELECT id FROM `@#_shoplist` where `time`>'$tm' ");

	$tj_member_account=$this->db->GetList("SELECT money FROM `@#_member_account` where `pay`='账户' and `type`=1 and `time`>'$tm'");

	$today_money=0;

	foreach ($tj_member_account as $account){

		$today_money=$account['money']+$today_money;

	}

	?>

    <div class="div-webinfo width30">

        <div class="title">网站信息统计</div>

        <div class="bk10"></div>

        <ul>

           <li><i>栏目:</i><?php echo count($tj_category); ?></li>

           <li><i>品牌:</i><?php echo count($tj_brand); ?></li>

           <li><i>文章:</i><?php echo count($tj_article); ?></li>

           <li><i>商品数量:</i><?php echo count($tj_shoplist); ?></li>

           <li><i>限时揭晓:</i><?php echo count($tj_shoplist_xsjx); ?></li>

           <li style="border-bottom:none;"><i>会员人数:</i><?php echo count($tj_member); ?></li>

           <li class="bk30"></li>

           <li><i>今日新增会员:</i><?php echo count($tj_member_new); ?></li>

           <li><i>今日新增商品:</i><?php echo count($tj_shoplist_new); ?></li>

           <li style="border-bottom:none;"><i>今日账户收入:</i><?php echo $today_money; ?></li>

        </ul>

    </div>

    

    <div class="div-about width30">

        <div class="title">关于我们</div>
	
	<div class="bk15"></div>
		
	<div class="job">
		<div class="right">
			<img src="<?php echo G_WEB_PATH ?>/statics/plugin/style/global/image/u93.png" >
		</div>
		<div class="left">
			<span><?php echo $info['username'] ;?></span><br><br>
	    		<span>所属角色: 超级管理员</span>
	    	</div>

	</div>
	<div class="job" style="padding-top:15px;">
		<p>上次登录时间: <?php echo date("Y-m-d H:i:s",$info['logintime']); ?></p><br>

	    	<p>上次登录IP: <?php echo $info['loginip']; ?></p>
	</div>
	<div class="job" style="padding-top:15px;color:#999;">

		<p>程序版本: 妃子云购B版本</p>
		<p>更新时间: 2017年4月11日</p>
		<p>程序开发：泸州特云宝网络科技有限公司</p>
        <p>官网地址：<a href="http://www.teyunbao.cn" target="_blank">www.teyunbao.cn </a></p>
		
		
	</div>

	</div>

        <div class="bk10"></div>

    </div>

<!------------>

</div>

</body>

</html> 

