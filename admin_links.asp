<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/function.asp"-->
<html>
<head>
<title>分类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
<br>
<%Dim rs,link
Set link=Server.CreateObject("ADODB.RecordSet")
rs="select * from blog_Links"
link.Open rs,Conn,1,1
%>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr class="topbg">
	<td height="22" colspan=2 align=center><strong>友 情 连 接</strong></td>
  </tr>
  <tr class="tdbg">
	<td width="70" height="30"><strong>管理导航：</strong></td>      
	<td height="30" align="center"><a href="admin_links.asp?action=mimage">首页图片连接</a> | <a href="admin_links.asp?action=mtext">首页文字连接</a> | <a href="admin_links.asp?action=himage">图片连接</a> | <a href="admin_links.asp?action=htext">文字连接</a></td>
  </tr>
</table>
<br>
<%Dim action
action=trim(request("action"))
if action="mimage" then
	call mimage()
elseif action="save_mimage" then
	call save_mimage()
elseif action="mtext" then
	call mtext()
elseif action="save_mtext" then
	call save_mtext()
elseif action="himage" then
	call himage()
elseif action="save_himage" then
	call save_himage()
elseif action="htext" then
	call htext()
elseif action="save_htext" then
	call save_htext()
else
	call main()
end if
sub main()%>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr class="tdbg">
	<td style="text-indent:20px;"><strong>友情连接</strong>提供四种方式,都支持HTML代码!<br>首页图片连接,首页文字连接只在default.asp页显示<br>links.asp页将显示所有友情连接!也可以自行修改,已提供了接口!<br><font color=red>请也加上<a href="http://www.fir8.net/blog" target="_blank">http://www.fir8.net/blog</a>的连接,万分感谢!</font></td>      
  </tr>
</table>
<%end sub
Sub mimage()%>
<form action="admin_links.asp?action=save_mimage" method="post" name="save_links" id="save_links">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" class="topbg"><strong>首页图片连接</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">
		<textarea name="mimage" style="width:100%;" rows="20" wrap="VIRTUAL" id="mimage"><%=""&link("link_Mimage")&""%></textarea>
		<div align="right"><a href="javascript:chang_size(-3,'mimage')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'mimage')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
	</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="link_ID" type="hidden" value="<%=""&link("link_ID")&""%>"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%end sub
Sub mtext()%>
<form action="admin_links.asp?action=save_mtext" method="post" name="save_links" id="save_links">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" class="topbg"><strong>首页文字连接</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">
		<textarea name="mtext" style="width:100%;" rows="20" wrap="VIRTUAL" id="mtext"><%=""&link("link_Mtext")&""%></textarea>
		<div align="right"><a href="javascript:chang_size(-3,'mtext')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'mtext')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
	</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="link_ID" type="hidden" value="<%=""&link("link_ID")&""%>"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%end sub
Sub himage()%>
<form action="admin_links.asp?action=save_himage" method="post" name="save_links" id="save_links">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" class="topbg"><strong>图片连接</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">
		<textarea name="himage" style="width:100%;" rows="20" wrap="VIRTUAL" id="himage"><%=""&link("link_Himage")&""%></textarea>
		<div align="right"><a href="javascript:chang_size(-3,'himage')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'himage')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
	</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="link_ID" type="hidden" value="<%=""&link("link_ID")&""%>"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%end sub
Sub htext()%>
<form action="admin_links.asp?action=save_htext" method="post" name="save_links" id="save_links">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" class="topbg"><strong>文字连接</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">
		<textarea name="htext" style="width:100%;" rows="20" wrap="VIRTUAL" id="htext"><%=""&link("link_Htext")&""%></textarea>
		<div align="right"><a href="javascript:chang_size(-3,'htext')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'htext')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
	</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="link_ID" type="hidden" value="<%=""&link("link_ID")&""%>"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%End Sub
sub save_mimage()
	Dim Edit_ID,Edit_mimage
	Edit_ID=CheckStr(Request.Form("link_ID"))
	Edit_mimage=CheckStr(Request.Form("mimage"))
	Conn.ExeCute("UPDATE blog_Links SET link_Mimage='"&Edit_mimage&"' WHERE link_ID="&Edit_ID&"")
	SQLQueryNums=SQLQueryNums+1
	Response.Write("添加完成!")
End Sub
sub save_mtext()
	Dim Edit_ID,Edit_mtext
	Edit_ID=CheckStr(Request.Form("link_ID"))
	Edit_mtext=CheckStr(Request.Form("mtext"))
	Conn.ExeCute("UPDATE blog_Links SET link_Mtext='"&Edit_mtext&"' WHERE link_ID="&Edit_ID&"")
	SQLQueryNums=SQLQueryNums+1
	Response.Write("添加完成!")
End Sub

sub save_himage()
	Dim Edit_ID,Edit_himage
	Edit_ID=CheckStr(Request.Form("link_ID"))
	Edit_himage=CheckStr(Request.Form("himage"))
	Conn.ExeCute("UPDATE blog_Links SET link_Himage='"&Edit_himage&"' WHERE link_ID="&Edit_ID&"")
	SQLQueryNums=SQLQueryNums+1
	Response.Write("添加完成!")
End Sub

sub save_htext()
	Dim Edit_ID,Edit_htext
	Edit_ID=CheckStr(Request.Form("link_ID"))
	Edit_htext=CheckStr(Request.Form("htext"))
	Conn.ExeCute("UPDATE blog_Links SET link_Htext='"&Edit_htext&"' WHERE link_ID="&Edit_ID&"")
	SQLQueryNums=SQLQueryNums+1
	Response.Write("添加完成!")
End Sub
link.Close
Set link=Nothing
%>
</body>
</html>