<!--#include file="inc/inc_sys.asp"-->
<%
dim action
Action=trim(request("Action"))
if Action="saveconfig" then
	call saveconfig()
else
	call showconfig()
end if

sub showconfig()
dim rs
Set rs=Server.CreateObject("Adodb.RecordSet")
set rs=conn.execute("select * from blog_Info")	
%>
<html>
<head>
<title>过滤设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<br>
<form method="POST" action="Admin_filtrate.asp" id="form1" name="form1">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr> 
	<td height="22" colspan="2" class="topbg"> <strong>敏感字过滤：</strong></td>
  </tr>
  <tr> 
	<td width="40%" valign="top" class="tdbg" style="text-indent:20px;">此处设置影响到日志，评论和留言的过滤。过滤字符将过滤内容中包含以下字符的内容，请您将要过滤的字符串添入，如果有多个字符串，请用回车分隔开。</td>
  <td class="tdbg"><textarea style="width: 80%" name="log_badstr" rows="10" id="log_badstr"><%=rs("log_badstr")%></textarea></td>
  </tr>
  <tr> 
	<td height="25" colspan="2" class="tdbg">&nbsp;</td>
  </tr>
  <tr> 
	<td height="25" colspan="2" class="topbg"><strong>注册过滤字符</strong></td>
  </tr>
  <tr> 
	<td valign="top" class="tdbg" style="text-indent:20px;">注册过滤字符将不允许用户注册包含以下字符的内容，请您将要过滤的字符串添入，如果有多个字符串，请用回车隔开。</td>
  <td class="tdbg"><textarea style="width: 80%" name="reg_badstr" rows="10" id="reg_badstr"><%=rs("reg_badstr")%></textarea></td>
  </tr>
  <tr> 
	<td height="40" colspan="2" align="center" class="tdbg">
		<input name="Action" type="hidden" id="Action" value="saveconfig"> 
		<input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 " >
	</td>
  </tr>
</table>
</form>
<br>
</body>
</html>
<%
set rs=nothing
end sub

sub saveconfig()
	dim rs,log_badstr
	if not IsObject(conn) then link_database
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from blog_Info"
	rs.open sql,conn,1,3
	rs("log_badstr")=trim(request("log_badstr"))
	rs("reg_badstr")=trim(request("reg_badstr"))
	rs.update
	rs.close
	set rs=nothing
	eblog.reloadsetup
	response.Redirect "admin_filtrate.asp"
end sub
%>