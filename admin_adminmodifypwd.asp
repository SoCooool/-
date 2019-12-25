<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/md5.asp"-->
<%
dim Action,FoundErr,ErrMsg
dim rs
Action=trim(request("Action"))
sql="Select * from blog_Admin where UserName='" & Admin_Name & "'"
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open sql,conn,1,3
if rs.Bof and rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>不存在此用户！</li>"
else
	if Action="Modify" then
		call ModifyPwd()
	else
		call main()
	end if
end if
rs.close
set rs=nothing
if FoundErr=True then
	call WriteErrMsg()
end if

sub ModifyPwd()
	dim password,PwdConfirm,username
	password=trim(Request("Password"))
	PwdConfirm=trim(request("PwdConfirm"))
	if password="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>新密码不能为空！</li>"
	end if
	if PwdConfirm<>Password then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>确认密码必须与新密码相同！</li>"
		exit sub
	end if
	UserName=rs("UserName")
	if Password<>"" then
		rs("password")=md5(password)
	end if
   	rs.update
	Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">密码修改成功，请重新登陆！")
end sub

sub main()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改管理员密码</title>
<link rel="stylesheet" type="text/css" href="styles/admin_style.css">
<script language=javascript>
function check()
{
  if(document.form1.Password.value=="")
    {
      alert("密码不能为空！");
	  document.form1.Password.focus();
      return false;
    }
    
  if((document.form1.Password.value)!=(document.form1.PwdConfirm.value))
    {
      alert("初始密码与确认密码不同！");
	  document.form1.PwdConfirm.select();
	  document.form1.PwdConfirm.focus();	  
      return false;
    }
}
</script>
</head>
<body class="bgcolor">
<br>
<br>
<form method="post" action="admin_adminmodifypwd.asp" name="form1" onsubmit="javascript:return check();">
<table width="300" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border" >
  <tr class="title"> 
	<td height="22" colspan="2" align="center">修 改 管 理 员 密 码</td>
  </tr>
  <tr> 
	<td width="100" align="right" class="tdbg">用 户 名：</td>
	<td class="tdbg"><%=rs("UserName")%></td>
  </tr>
  <tr> 
	<td width="100" align="right" class="tdbg">新 密 码：</td>
	<td class="tdbg"><input type="password" name="Password"></td>
  </tr>
  <tr> 
	<td width="100" align="right" class="tdbg">确认密码：</td>
	<td class="tdbg"><input type="password" name="PwdConfirm"></td>
  </tr>
  <tr> 
	<td height="40" colspan="2" align="center" class="tdbg">
		<input name="Action" type="hidden" id="Action" value="Modify"> 
		<input type="submit" name="Submit" value=" 确 定 " style="cursor:hand;">&nbsp;
		<input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="reset()" style="cursor:hand;">
	</td>
  </tr>
</table>
</form>
</body>
</html>
<%
end sub

sub WriteErrMsg()
	dim strErr
	strErr=strErr & "<html><head><title>错误信息</title><meta http-equiv='Content-Type' content='text/html; charset=utf-8'>" & vbcrlf
	strErr=strErr & "<link href='styles/admin_style.css' rel='stylesheet' type='text/css'></head><body><br><br>" & vbcrlf
	strErr=strErr & "<table cellpadding=2 cellspacing=1 border=0 width=400 class='border' align=center>" & vbcrlf
	strErr=strErr & "  <tr align='center' class='title'><td height='22'><strong>错误信息</strong></td></tr>" & vbcrlf
	strErr=strErr & "  <tr class='tdbg'><td height='100' valign='top'><b>产生错误的可能原因：</b>" & errmsg &"</td></tr>" & vbcrlf
	strErr=strErr & "  <tr align='center' class='tdbg'><td><a href='javascript:history.go(-1)'>&lt;&lt; 返回上一页</a></td></tr>" & vbcrlf
	strErr=strErr & "</table>" & vbcrlf
	strErr=strErr & "</body></html>" & vbcrlf
	response.write strErr
end sub
%>