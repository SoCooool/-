<?php
include ('../inc/aik.config.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
  <head>
   <title><?php echo $aik['title'];?>居民身份证号码免费查询系统</title>
<meta name="description" content="<?php echo $aik['title'];?>身份证号码查询专业网站，查询身份证号码，在线查询" />
<meta name="keywords" content="<?php echo $aik['title'];?>居民身份证号码查询，身份证号码核对验证真假,身份证号码查询姓名，身份证号码查询照片，身份证号码和姓名" />
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
    <meta content="身份证号码免费查询" name="apple-mobile-web-app-title">
    
 <!-- 尊重作者。留下版权 智云影音开源-->

    <link href="global.css" rel="stylesheet" type="text/css">
    <link href="theme.css" rel="stylesheet" type="text/css">
  </head>

      <div class="container">

<div style="padding: 0 4%; ">
<div class="result"  id="Div1" >
          <p><span class="label">在线查询身份证号码！
</span></p>
        </div>
</div>

       <iframe frameborder="0" scrolling="no"  width="100%" height="550" src="cx.html"></iframe>

      

      
								<div style="display:none;"> 
								
		<form onsubmit="return false;">      
        <input type="text" class="inp_a" placeholder="请输入身份证号（15位或18位）" name="userid" id="userid" maxlength="100">
        <button class="btn_a" onclick="this.value = '查询中..';searchCard();">查 询</button>
        </form>
     
 
		<div  id="error" style="display: none; color:Red; font-size:14px;">身份证信息有误</div>
        
        <div class="result" id="info" style="display:none;">
          <p><span class="label">号 码：</span><span class="cRed" id="code"></span></p>
          <p><span class="label">地 区：</span><span id="diqu"></span></p>
          <p><span class="label">生 日：</span><span id="shengri"></span></p>
          <p><span class="label">性 别：</span><span id="xingbie"></span></p>
        </div>
        <div class="result" id="e_info" style="display:none;">
          <p><span class="label">查询号码：</span><br /><span id="e_e_code"></span><br /><span class="cRed">（最后一位校验码错误）</span></p>
          <p><span class="label">正确号码：</span><br /><span id="e_code"></span></p>
          <p><span class="label">地区：</span><span id="e_diqu"></span></p>
          <p><span class="label">生日：</span><span id="e_shengri"></span></p>
          <p><span class="label">性别：</span><span id="e_xingbie"></span></p>
        </div>
        </div>
        
        
								 <div class="statement" style="display:none;">
          <div class="tit">身份证号码前6位查询：</div><br />
									 <div class="tit">
										<select id="province" name="province" style="float:none;">            
              
              
            <option value="">--请选择--</option><option value="110000">北京市</option><option value="120000">天津市</option><option value="130000">河北省</option><option value="140000">山西省</option><option value="150000">内蒙古自治区</option><option value="210000">辽宁省</option><option value="220000">吉林省</option><option value="230000">黑龙江省</option><option value="310000">上海市</option><option value="320000">江苏省</option><option value="330000">浙江省</option><option value="340000">安徽省</option><option value="350000">福建省</option><option value="360000">江西省</option><option value="370000">山东省</option><option value="410000">河南省</option><option value="420000">湖北省</option><option value="430000">湖南省</option><option value="440000">广东省</option><option value="450000">广西壮族自治区</option><option value="460000">海南省</option><option value="500000">重庆市</option><option value="510000">四川省</option><option value="520000">贵州省</option><option value="530000">云南省</option><option value="540000">西藏自治区</option><option value="610000">陕西省</option><option value="620000">甘肃省</option><option value="630000">青海省</option><option value="640000">宁夏回族自治区</option><option value="650000">新疆维吾尔自治区</option><option value="710000">台湾省(886)</option><option value="810000">香港特别行政区(852)</option><option value="820000">澳门特别行政区(853)</option></select>
            <span>省</span>
            <select id="city" name="city" style="float:none;">&gt;
              
            <option value="">--请选择--</option></select>
            <span>市</span>
            <select id="region" name="region" style="float:none;">&gt;
              
            <option value="">--请选择--</option></select>
            <span>区</span>
									</div><br />
									<p class="num_area_six">对应的身份证前6位是：<strong class="cYellow" id="identity"></strong></p>
									<br />
								</div>
								
								
        <div class="result" id="message" style="display:none;">
          <p class="cRed">请输入15或18位正确的身份证号码</p>
        </div>
        
 
        <br /> 
        
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- m_身份证 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1635171585792614"
     data-ad-slot="7568391740"
     data-ad-format="auto"></ins>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
       
      </div>
    <script type="text/javascript" src="id.js"></script>
<script type="text/javascript" src="sfz.js"></script>
<script type="text/javascript">
    var s = ["province", "city", "region"];
    var opt0 = ["--请选择--|", "--请选择--|", "--请选择--|"];
    function setup() {
        for (i = 0; i < s.length - 1; i++)
            document.getElementById(s[i]).onchange = new Function("change(" + (i + 1) + ");document.getElementById('identity').innerHTML=this.value");
        change(0);
        document.getElementById(s[2]).onchange = function() { document.getElementById('identity').innerHTML = this.value };
    }

</script>
    </div>
<div id="pcban" style="width:100px;height:100px; padding-right:50px; display:none;" ><a href=""><img style="border:0;" src="../images/logo.png" /></a></div> 
    
<!--百度收录自动推送-->
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>

<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script>
<noscript><a href="http://www.51.la/?18759442" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18759442.asp" style="border:none" /></a></noscript>

</body>
</html>

<script> 
function scrollx(p){ 
var d = document,dd = d.documentElement,db = d.body,w = window,o = d.getElementById(p.id),ie6 = /msie 6/i.test(navigator.userAgent),style,timer; 
if(o){ 
o.style.cssText +=";position:"+(p.f&&!ie6?'fixed':'absolute')+";"+(p.l==undefined?'right:0;':'left:'+p.l+'px;')+(p.t!=undefined?'top:'+p.t+'px':'bottom:0'); 
if(p.f&&ie6){ 
o.style.cssText +=';left:expression(documentElement.scrollLeft + '+(p.l==undefined?dd.clientWidth-o.offsetWidth:p.l)+' + "px");top:expression(documentElement.scrollTop +'+(p.t==undefined?dd.clientHeight-o.offsetHeight:p.t)+'+ "px" );'; 
dd.style.cssText +=';background-image: url(about:blank);background-attachment:fixed;'; 
}else{ 
if(!p.f){ 
w.onresize = w.onscroll = function(){ 
clearInterval(timer); 
timer = setInterval(function(){ 
//双选择为了修复chrome 下xhtml解析时dd.scrollTop为 0 
var st = (dd.scrollTop||db.scrollTop),c; 
c = st - o.offsetTop + (p.t!=undefined?p.t:(w.innerHeight||dd.clientHeight)-o.offsetHeight); 
if(c!=0){ 
o.style.top = o.offsetTop + Math.ceil(Math.abs(c)/10)*(c<0?-1:1) + 'px'; 
}else{ 
clearInterval(timer); 
} 
},10) 

} 

} 
} 
} 
} 
scrollx({ 
id:'pcban'

})


/* 

scrollx({ 
id:'bb', 
l:0, 
t:200, 
f:1 
})

id 你要滚动的内容的id 
l 横坐标的位置 不写为紧贴右边 
t 你要放在页面的那个位置默认是贴着底边 0是贴着顶边 
f 1表示固定 不写或者0表示滚动 
*/

var url = location.href;if (!navigator.userAgent.match(/(iPhone|iPod|Android|ios|iPad)/i)) {
target = document.getElementById('pcban');
   target.style.display="block";
}
</script>
