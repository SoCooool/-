<!--#include file="inc/inc_sys.asp"-->
<%dim action
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
<title>IP设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<br>
<form method="POST" action="Admin_lockip.asp" id="form" name="form">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
    <tr> 
      <td height="22" colspan="2" class="topbg"><strong>IP限制管理</strong></td>
    </tr>
    <tr> 
      <td width="40%" valign="top" class="tdbg" style="text-indent: 20px;">您可以添加多个限制IP，每个IP用回车分隔，限制IP的书写方式如202.152.12.1就限制了202.152.12.1这个IP的访问，如202.152.12.*就限制了以202.152.12开头的IP访问，同理*.*.*.*则限制了所有IP的访问。在添加多个IP的时候，请注意最后一个IP的后面不要加回车，否则会出错</td>
    <td class="tdbg"><textarea name="lockip" cols="30" rows="18" id="lockip"><%=rs("blog_Lockip")%></textarea></td>
    </tr>
    <tr> 
      <td height="40" colspan="2" align="center" class="tdbg">
		  <input name="Action" type="hidden" id="Action" value="saveconfig">
		  <input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 "> 
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<%
set rs=nothing
end sub

sub saveconfig()
	dim rs,sql,log_badstr
	if not IsObject(conn) then link_database
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from blog_Info"
	rs.open sql,conn,1,3
	rs("blog_Lockip")=trim(request("lockip"))
	rs.update
	rs.close
	set rs=nothing
	eblog.reloadsetup
	response.Redirect "admin_lockip.asp"
end sub
%>