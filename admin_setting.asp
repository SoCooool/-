<!--#include file="inc/inc_sys.asp"-->
<%
dim action
action=trim(request("action"))
if action="saveconfig" then
	call saveconfig()
else
	call showconfig()
end if

sub showconfig()
dim rs
set rs=conn.execute("select * from blog_Info")
dim PerPage,Setting,e_time
PerPage=Split(rs("blog_PerPage"),"|")
Setting=Split(rs("blog_Setting"),"|")
e_time=Split(rs("establish_time"),"-")
%>
<html>
<head>
<title>站点配置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
<br>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" Class="border">
  <tr class="topbg">
	<td height="22" colspan=2 align=center><strong>网 站 配 置</strong></td>
  </tr>
  <tr class="tdbg">
	<td width="70" height="30"><strong>管理导航：</strong></td>      
	<td height="30" align="center"><a href="admin_setting.asp#SiteInfo">网站信息配置</a> | <a href="admin_setting.asp#SiteOption">网站选项配置</a> | <a href="#show">每页显示选项</a> | <a href="#upload">上传选项</a></td>
  </tr>
</table>

<form method="POST" action="admin_setting.asp" id="form1" name="form1">
<a name="SiteInfo"></a>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="2" class="topbg"><strong>网站信息配置</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td width="280" height="25">网站名称：</td>
	<td height="25"> <input name="site_Name" type="text" id="site_Name" value="<%=rs("blog_Name")%>" size="40" maxlength="50"> </td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td>网站地址：<br>
	  重要！请添写完整URL地址,如http://www.fir8.net/blog,<font color="#FF0000">请省略最后的/号</font>,此设置将影响到rss和trackback的正常运行。</td>
	<td height="25"> <input name="site_Url" type="text" id="site_Url" value="<%=rs("blog_URL")%>" size="40" maxlength="255"> </td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''">
    <td height="25">建站时间</td>
    <td height="25"><input name="e_time0" type="text" id="e_time0" value="<%=""&e_time(0)&""%>" size="2" maxlength="4">  
      - <input name="e_time1" type="text" id="e_time1" value="<%=""&e_time(1)&""%>" size="2" maxlength="2"> 
      - <input name="e_time2" type="text" id="e_time2" value="<%=""&e_time(2)&""%>" size="2" maxlength="2">  
      格式:年/月/日</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25">站点关键字（更容易被搜索引擎找到,&quot;,&quot;号隔开,限制为255个字符）</td>
	<td height="25"><input name="site_keyword" type="text" id="site_keyword" size="77" value="<%=rs("blog_Keyword")%>"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25">站长信息（支持Html,为了版面显示建议限制为255个字符）</td>
	<td>
		<textarea name="master_info" cols="60" rows="5" wrap="virtual" id="master_info"><%=rs("master_Info")%></textarea>
		<div align="right"><a href="javascript:chang_size(-3,'master_info')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'master_info')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
	</td>
  </tr>
  <tr>
	<td height="25" colspan="2" class="topbg"><a name="SiteOption"></a><strong>网站选项配置</strong></td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >是否显示站点公告：</td>
	<td height="25" ><input type="hidden" name="Setting0" value="<%=""&Setting(0)&""%>"><input type="radio" name="Setting1" value="1" <%if Setting(1)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting1" value=0 <%if Setting(1)=0 then response.write "checked"%>>否</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >发表日志评论是否需要验证：</td>
	<td height="25" ><input type="radio" name="Setting2" value="1" <%if Setting(2)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting2" value=0 <%if Setting(2)=0 then response.write "checked"%>>否</td>
  </tr>
   <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >发表留言是否需要验证：</td>
	<td height="25" ><input type="radio" name="Setting3" value="1" <%if Setting(3)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting3" value=0 <%if Setting(3)=0 then response.write "checked"%>>否</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >发表相册评论是否需要验证：</td>
	<td height="25" ><input type="radio" name="Setting4" value="1" <%if Setting(4)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting4" value=0 <%if Setting(4)=0 then response.write "checked"%>>否</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >注册新成员是否需要验证：</td>
	<td height="25" ><input type="radio" name="Setting5" value="1" <%if Setting(5)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting5" value=0 <%if Setting(5)=0 then response.write "checked"%>>否</td>
  </tr>
   <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >是否允许新用户注册：</td>
	<td height="25" ><input type="radio" name="Setting6" value="1" <%if Setting(6)=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Setting6" value=0 <%if Setting(6)=0 then response.write "checked"%>>否</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >评论及留言允许字数：</td>
	<td height="25" ><input name="Setting10" type="text" id="Setting10" value="<%=Setting(10)%>" size="2" maxlength="5"> - <input name="Setting11" type="text" id="Setting11" value="<%=Setting(11)%>" size="2" maxlength="5"> 字(英文字符)</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >评论及留言允许http://和[url]标签：</td>
	<td height="25" >普通成员 <input name="Setting12" type="text" id="Setting12" value="<%=Setting(12)%>" size="2" maxlength="5"> 个 &nbsp;&nbsp;&nbsp;&nbsp; 管理员 <input name="Setting13" type="text" id="Setting13" value="<%=Setting(13)%>" size="2" maxlength="5">  个</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >页面防刷新时间：</td>
	<td height="25" ><input name="Setting14" type="text" id="Setting14" value="<%=Setting(14)%>" size="10" maxlength="10"> 秒</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >发表评论日，留言的时间间隔：</td>
	<td height="25" ><input name="Setting15" type="text" id="Setting15" value="<%=Setting(15)%>" size="10" maxlength="10"> 秒</td>
  </tr>
  <tr>
	<td height="25" colspan="2" class="topbg"><a name="show"></a><strong>调用数据选项</strong></td>
  </tr>
   <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >最新日志列表显示：</td>
	<td height="25" ><input name="Setting7" type="text" id="Setting7" value="<%=Setting(7)%>" size="10" maxlength="10"> 篇</td>
  </tr>
   <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >最新日志评论显示：</td>
	<td height="25" ><input name="Setting8" type="text" id="Setting8" value="<%=Setting(8)%>" size="10" maxlength="10"> 篇</td>
  </tr>
   <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >最新相册评论显示：</td>
	<td height="25" ><input name="Setting9" type="text" id="Setting9" value="<%=Setting(9)%>" size="10" maxlength="10"> 篇</td>
  </tr>
  <tr>
	<td height="25" colspan="2" class="topbg"><a name="show"></a><strong>每页显示选项</strong></td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >日志每页显示多少</td>
	<td height="25" ><input name="PerPage0" type="text" id="PerPage0" value="<%=PerPage(0)%>" size="10" maxlength="10"> 篇</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >日志列表显示多少</td>
	<td height="25" ><input name="PerPage1" type="text" id="PerPage1" value="<%=PerPage(1)%>" size="10" maxlength="10"> 篇</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >留言显示多少</td>
	<td height="25" ><input name="PerPage2" type="text" id="PerPage2" value="<%=PerPage(2)%>" size="10" maxlength="10"> 篇</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >下载每页显示多少</td>
	<td height="25" ><input name="PerPage3" type="text" id="PerPage3" value="<%=PerPage(3)%>" size="10" maxlength="10"> 个</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >酷站每页显示多少</td>
	<td height="25" ><input name="PerPage4" type="text" id="PerPage4" value="<%=PerPage(4)%>" size="10" maxlength="10"> 个</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >相册每页显示多少</td>
	<td height="25" ><input name="PerPage5" type="text" id="PerPage5" value="<%=PerPage(5)%>" size="10" maxlength="10"> 张</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >日志评论列表每页显示</td>
	<td height="25" ><input name="PerPage6" type="text" id="PerPage6" value="<%=PerPage(6)%>" size="10" maxlength="10"> 条</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >相册评论列表每页显示</td>
	<td height="25" ><input name="PerPage7" type="text" id="PerPage7" value="<%=PerPage(7)%>" size="10" maxlength="10"> 条</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" >用户列表每页显示</td>
	<td height="25" ><input name="PerPage8" type="text" id="PerPage8" value="<%=PerPage(8)%>" size="10" maxlength="10"> 条</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
	<td height="25" colspan="2" class="topbg"><a name="upload" id="user"></a><strong>上传选项</strong></td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >管理员上传文件类型：</td>
	<td height="25" ><input name="blog_UP_FileTypes" type="text" id="blog_UP_FileTypes" value="<%=rs("blog_UP_FileTypes")%>" size="60" maxlength="200"></td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >管理员上传单个文件大小：</td>
	<td height="25" ><input name="blog_UP_FileSize" type="text" id="blog_UP_FileSize" value="<%=rs("blog_UP_FileSize")%>" size="10" maxlength="10"> bytes 字节计算,20480000=2M</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >是否允许普通会员上传文件：</td>
	<td height="25" ><input type="radio" name="blog_UP_MemCanUP" value="1" <%if rs("blog_UP_MemCanUP")=1 then response.write "checked"%>>是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="blog_UP_MemCanUP" value=0 <%if rs("blog_UP_MemCanUP")=0 then response.write "checked"%>>否</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >普通会员上传文件类型：</td>
	<td height="25" ><input name="blog_UP_Mem_FileTypes" type="text" id="blog_UP_Mem_FileTypes" value="<%=rs("blog_UP_Mem_FileTypes")%>" size="60" maxlength="200"></td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >普通会员上传单个文件大小：</td>
	<td height="25" ><input name="blog_UP_Mem_FileSize" type="text" id="blog_UP_Mem_FileSize" value="<%=rs("blog_UP_Mem_FileSize")%>" size="10" maxlength="10"> bytes</td>
  </tr>
  <tr class="tdbg" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''"> 
	<td height="25" >&nbsp;</td>
	<td height="25" >&nbsp; </td>
  </tr>
  <tr>
	<td height="40" colspan="2" align="center" class="tdbg" > <input name="Action" type="hidden" id="Action" value="saveconfig"> <input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 " ></td>
  </tr>
  </table>
</form>
</body>
</html>
<%
set rs=nothing
end sub

sub saveconfig()
dim rs,sql
set rs=server.CreateObject("adodb.recordset")
sql="select * from blog_info"
rs.open sql,conn,1,3
rs("blog_Name")=trim(request("site_Name"))
rs("blog_URL")=trim(request("site_Url"))
rs("blog_Keyword")=trim(request("site_Keyword"))
rs("master_info")=trim(request("master_info"))
Dim Setting,i
for i = 0 to 15
	Setting = Setting & Request.form("Setting" & i) & "|"
next
Setting=trim(Replace(Setting,",",""))
rs("blog_Setting")=Setting
Dim PerPage,cnt
for cnt = 0 to 9
	PerPage = PerPage & Request.form("PerPage" & cnt) & "|"
next
PerPage=trim(Replace(PerPage,",",""))
rs("blog_PerPage")=PerPage
Dim e_time,e_time0,e_time1,e_time2
e_time0=CheckStr(Request.Form("e_time0"))
e_time1=CheckStr(Request.Form("e_time1"))
e_time2=CheckStr(Request.Form("e_time2"))
e_time=""&e_time0&"-"&e_time1&"-"&e_time2&""
rs("establish_time")=e_time
rs("blog_UP_FileTypes")=trim(request("blog_UP_FileTypes"))
rs("blog_UP_FileSize")=trim(request("blog_UP_FileSize"))
rs("blog_UP_MemCanUP")=trim(request("blog_UP_MemCanUP"))
rs("blog_UP_Mem_FileTypes")=trim(request("blog_UP_Mem_FileTypes"))
rs("blog_UP_Mem_FileSize")=trim(request("blog_UP_Mem_FileSize"))
rs.update
rs.close
set rs=nothing
eblog.reloadsetup
response.Redirect "admin_setting.asp"
end sub
%>