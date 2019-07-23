<!--#include file="inc/inc_sys.asp"-->
<%
select case request("action")
case "top"
	call admin_top()
case "left"
	call admin_left()
case "main"
	call admin_main()
case else
	call main()
end select

Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function
sub main()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>清茶道场--后台管理</title>
</head>
<frameset rows="*" cols="181,*" framespacing="0" frameborder="0" border="false" id="frame" scrolling="yes">
  <frame name="left" scrolling="auto" marginwidth="0" marginheight="0" src="admin_index.asp?action=left">
  <frameset framespacing="0" border="false" rows="35,*" frameborder="0" scrolling="yes">
    <frame name="top" scrolling="no" src="admin_index.asp?action=top">
    <frame name="main" scrolling="auto" src="admin_index.asp?action=main">
  </frameset>
</frameset>
<noframes>
  <body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
  <p>你的浏览器版本过低！！！本系统要求IE5及以上版本才能使用本系统。</p>
  </body>
</noframes>
</html>
<%
end sub

sub admin_top()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理页面</title>
<style type="text/css">
a:link {
	color:#000000;
	text-decoration:none;
	font-size: 12px;
}
a:hover {color:#CC3300;}
a:visited {color:#000000;text-decoration:none}

td {FONT-SIZE: 9pt;COLOR: #000000; FONT-FAMILY: "宋体"}
img {filter:Alpha(opacity:100); chroma(color=#FFFFFF)}
</style>
<base target="main">
<script>
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("images/admin_top_open.gif");

var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="images/admin/top_open.gif";
		obj.title="打开左边管理菜单";
	}
	else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="images/admin/top_close.gif";
		obj.title="关闭左边管理菜单";
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="100%" border=0 cellpadding=0 cellspacing=0 bgcolor="#CCCCCC">
  <tr valign=middle> 
    <td width=50> <img onclick="switchBar(this)" src="images/admin/top_close.gif" title="关闭左边管理菜单" style="cursor:hand"></td>
    <td width=40><img src="images/admin/admin_top_icon_1.gif"></td>
    <td width=100><a href="admin_adminmodifypwd.asp">修改密码</a></td>
    <td width=100><a href="admin_login.asp">重新登陆</a></td>
    <td align="right">&nbsp;</td>
    <td width="120" align="right"><div align="center"><a href="default.asp" target="_blank">站点首页</a></div></td>
  </tr>
</table>
</body>
</html>
<%end sub
sub admin_left()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eBlog--管理导航</title>
<STYLE type=text/css>
BODY {
	BACKGROUND: #fff; MARGIN: 0px; FONT: 12px 宋体;
	SCROLLBAR-FACE-COLOR: #6CACCC;	
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #ffffff;
	SCROLLBAR-3DLIGHT-COLOR: #89B8C9;
	SCROLLBAR-ARROW-COLOR: #0099CC;
	SCROLLBAR-TRACK-COLOR: #81BCDB;
	SCROLLBAR-DARKSHADOW-COLOR: #75ACCC;
}
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD {
	FONT: 12px 宋体
}
IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px 宋体; COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #009900; TEXT-DECORATION: underline
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #BAD1DD; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.menu_title {
}
.menu_title SPAN {
	FONT-WEIGHT: normal;
	LEFT: 8px;
	COLOR: #333333;
	POSITION: relative;
	TOP: 2px;
	font-size: 14px;
}
.menu_title2 {
	
}
.menu_title2 SPAN {
	FONT-WEIGHT: normal;
	LEFT: 8px;
	COLOR: #333333;
	POSITION: relative;
	TOP: 2px;
	font-size: 14px;
}
</STYLE>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=100% cellpadding=0 cellspacing=0 border=0 align=left>
  <tr>
	<td valign=top class="menu_title2"> 
    	<table width=158 border="0" align=center cellpadding=0 cellspacing=0>
		  <tr>
			<td height=42 valign=bottom><img src="images/admin/title.gif" width=158 height=38></td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
  		  <tr>
			<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background=images/admin/bg.gif id=menuTitle0> <span><a href="admin_index.asp?action=main" target=main><b>管理首页</b></a> | <a href="admin_logout.asp" target="_top" ><b>退出</b></a></span> </td>
  		  </tr>
  		  <tr>
			<td style="display:" id='submenu0'>
				<div class=sec_menu style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr>
						<td height=20>用户名：<%= session("adminname") %></td>
					  </tr>
					  <tr>
						<td height=20>权&nbsp;&nbsp;限：后台管理员</td>
					  </tr>
					</table>
				</div>
				<div style="width:158"></div>
			</td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
		  <tr>
			<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin/bg.gif" id=menuTitle1 onClick="showsubmenu(1)" style="cursor:hand;"><span>常规设置</span> </td>
		  </tr>
		  <tr>
			<td style="display:display" id='submenu1'>
				<div class=sec_menu style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr> 
						<td width="15" height=20 align="right"><img src="images/admin/bullet.gif"></td>
						<td width="115"><a href="admin_setting.asp" target=main>网站信息配置</a></td>
					  </tr>
					  <tr> 
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_category.asp?action=blog" target="main">日志分类管理</a></td>
					  </tr>
					  <tr>
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_category.asp?action=down" target="main">下载分类管理</a></td>
					  </tr>
					  <tr>
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_category.asp?action=photo" target="main">相册分类管理</a></td>
					  </tr>
					  <tr> 
 						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_filtrate.asp" target="main">敏感字过滤管理</a></td>
					  </tr>
					  <tr> 
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_lockip.asp" target=main>限制IP管理</a></td>
					  </tr>
					  <tr> 
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_links.asp" target=main>修改友情链接代码</a></td>
					  </tr>
					  <tr> 
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_placard.asp target=main>修改网站公告代码</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_smilies.asp target=main>表情管理</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_keywords.asp target=main>关键字管理</a></td>
					  </tr>
					  <tr> 
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href="admin_count.asp" target="main">更新系统数据</a></td>
					  </tr>
					</table>
				</div>
				<div style="width:158"></div>
			</td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
		  <tr>
			<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin/bg.gif" id=menuTitle2 onClick="showsubmenu(2)" style="cursor:hand;"><span>用户管理</span> </td>
		  </tr>
		  <tr>
			<td style="display:display" id='submenu2'>
				<div class=sec_menu style="width:158">
            		<table width=130 align=center cellpadding=0 cellspacing=0 >
					  <tr>
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td><a href=admin_user.asp target=main>用户管理</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_admin.asp?Action=Add target=main>添加后台管理员</a> | <a href=admin_admin.asp target=main>管理</a></td>
					  </tr>
            		</table>
				</div>
				<div  style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr>
						<td height=20></td>
					  </tr>
				</table>
	  			</div>
			</td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
		  <tr>
			<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin/bg.gif" id=menuTitle3 onClick="showsubmenu(3)" style="cursor:hand;"><span>上传文件管理</span> </td>
		  </tr>
		  <tr>
			<td style="display:display" id='submenu3'>
				<div class=sec_menu style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr> 
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td><a href=admin_uploadfile.asp target=main>上传文件清单</a></td>
					  </tr>
					</table>
				</div>
				<div style="width:158"></div>
			</td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
		  <tr>
			<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin/bg.gif" id=menuTitle4 onClick="showsubmenu(4)" style="cursor:hand;"><span>数据库管理</span></td>
		  </tr>
		  <tr>
			<td style="display:display" id='submenu4'>
				<div class=sec_menu style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr>
						<td width="15" height=20><img src="images/admin/bullet.gif"></td>
						<td><a href=admin_database.asp?Action=Compact target=main>压缩数据库</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_database.asp?Action=Backup target=main>备份数据库</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_database.asp?Action=Restore target=main>恢复数据库</a></td>
					  </tr>
					  <tr>
						<td height=20><img src="images/admin/bullet.gif"></td>
						<td height=20><a href=admin_database.asp?Action=sqlquery target=main>执行SQL语句</a></td>
					  </tr>
					</table>
				</div>
				<div style="width:158"></div>
			</td>
		  </tr>
		</table>
		<table cellpadding=0 cellspacing=0 width=158 align=center>
		  <tr>
        	<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin/bg.gif" id=menuTitle9> <span>设计信息</span> 
        	</td>
		  </tr>
		  <tr>
        	<td>
				<div class=sec_menu style="width:158">
					<table cellpadding=0 cellspacing=0 align=center width=130>
					  <tr>
						<td height=20>
						<br />设计制作：&nbsp;<a href='mailto:supper@9960.cn'>晚饭</a>
						<br />技术支持：&nbsp;<a href="http://9960.cn" target=_blank>华艺设计</a>
						<br />美&nbsp;&nbsp;&nbsp;&nbsp;工：&nbsp;<a href="http://9960.cn" target="_blank">老虎豆子</a><br /><br />
						</td>
					  </tr>
					</table>
				</div>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
</body>
</html>
<%
end sub
sub admin_main()
Dim theInstalledObjects(23)
theInstalledObjects(0) = "MSWC.AdRotator"
theInstalledObjects(1) = "MSWC.BrowserType"
theInstalledObjects(2) = "MSWC.NextLink"
theInstalledObjects(3) = "MSWC.Tools"
theInstalledObjects(4) = "MSWC.Status"
theInstalledObjects(5) = "MSWC.Counters"
theInstalledObjects(6) = "IISSample.ContentRotator"
theInstalledObjects(7) = "IISSample.PageCounter"
theInstalledObjects(8) = "MSWC.PermissionChecker"
theInstalledObjects(9) = "Scripting.FileSystemObject"
theInstalledObjects(10) = "adodb.connection"
    
theInstalledObjects(11) = "SoftArtisans.FileUp"
theInstalledObjects(12) = "SoftArtisans.FileManager"
theInstalledObjects(13) = "JMail.SMTPMail"
theInstalledObjects(14) = "CDONTS.NewMail"
theInstalledObjects(15) = "Persits.MailSender"
theInstalledObjects(16) = "LyfUpload.UploadFile"
theInstalledObjects(17) = "Persits.Upload.1"

theInstalledObjects(18) = "Scripting.Dictionary"
theInstalledObjects(19) = "Microsoft.XMLDOM"
theInstalledObjects(20) = "FileUp.upload"
theInstalledObjects(20) = "GflAx190.GflAx"
theInstalledObjects(20) = "easymail.Mailsend"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eBlog后台管理首页</title>
<link rel="stylesheet" href="styles/admin_style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" style="margin-top: 10px;margin-bottom: 10px;">
<table cellpadding="2" cellspacing="1" border="0" width="98%" class="border" align=center>
  <tr align="center">
	<td width="300" height=25 class="topbg"><div align="left"><strong>后台管理首页</strong></div>
  </tr>
</table>
<p style="margin:0px;padding:0px 0px 10px 0px;"></p>
<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr align="center">
	<td height=25 class="topbg"><strong>eBlog 帮助</strong>
  <tr>
    <td class="tdbg">1、将用户锁定以后，此用户将不能发表评论,留言。</td>
  </tr>
  <tr>
    <td height=23 class="tdbg">2、将IP屏蔽以后，此IP用户将不能登陆，且不能发表评论及留言。</td>
  </tr>
  <tr>
    <td height=23 class="tdbg">3、若上传文件不正常，请检查是否文件尺寸过大及服务器是否支持fso。</td>
  </tr>
  <tr>
    <td height=23 class="tdbg">4、有任何问题，请咨询华艺设计人员。</td>
  </tr>
</table>
<p style="margin:0px;padding:0px 0px 10px 0px;"></p>
<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr align="center"> 
    <td height=25 colspan=2 class="topbg"><strong>服 务 器 信 息</strong><tr> 
  <tr> 
    <td width="50%"  class="tdbg" height=23>服务器类型：<%=Request.ServerVariables("OS")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
    <td width="50%" class="tdbg">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr> 
    <td width="50%"  class="tdbg" height=23>服务器CPU数量：<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%></td>
    <td width="50%" class="tdbg">脚本超时设置：<%=Server.ScriptTimeout%></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>站点物理路径：<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
    <td width="50%" class="tdbg">数据库使用：
      <%If Not IsObjInstalled(theInstalledObjects(10)) Then%>
		<font color="red"><b>×</b></font>
      <%else%>
		<b>√</b>
      <%end if%></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>FSO文本读写：
      <%If Not IsObjInstalled(theInstalledObjects(9)) Then%>
		<font color="red"><b>×</b></font>
      <%else%>
      	<b>√</b>
      <%end if%>
	 </td>
    <td width="50%" class="tdbg">XML组件支持：
      <%If Not IsObjInstalled(theInstalledObjects(19)) Then%>
		<font color="red"><b>×</b></font>
      <%else%>
		<b>√</b>
      <%end if%>
	 </td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>Jmail组件支持：
      <%If Not IsObjInstalled(theInstalledObjects(13)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%>
	 </td>
    <td width="50%" class="tdbg">CDONTS组件支持：
      <%If Not IsObjInstalled(theInstalledObjects(14)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%>
	 </td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>GflSDK组件支持：
      <%If Not IsObjInstalled(theInstalledObjects(21)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%>
	 </td>
    <td width="50%" class="tdbg">EasyMail邮件支持：
      <%If Not IsObjInstalled(theInstalledObjects(22)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%></td>
  </tr>
    <td width="50%" class="tdbg" height=23>无组件上传－ADODB.Stream：
      <%If Not IsObjInstalled(theInstalledObjects(18)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%>
	 </td>
    <td width="50%" class="tdbg">FileUp上传组件：
      <%If Not IsObjInstalled(theInstalledObjects(20)) Then%>
      <font color="red"><b>×</b></font>
      <%else%>
      <b>√</b>
      <%end if%></td>
  </tr>
</table>
<p style="margin:0px;padding:0px 0px 10px 0px;"></p>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr align="center"> 
	<td height=25 colspan=6 align="center" class="topbg"><strong>网站设计</strong></td> 
  <tr> 
	<td width="10%" height="23" class="tdbg">设计制作：</td>
	<td width="20%" class="tdbg">&nbsp;华艺设计</td>
	<td width="10%" class="tdbg" >Email：</td>
	<td width="30%" class="tdbg">supper@9960.cn</td>
	<td width="10%" class="tdbg">QQ：</td>
	<td width="20%" class="tdbg">229546</td>
  </tr>
</table>
</body>
</html>
<%end sub%>