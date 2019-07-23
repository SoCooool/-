<!--#include file="conn.asp"-->
<!--#include file="inc/class_sys.asp"-->
<!--#include file="inc/md5.asp"-->
<%
dim eblog
set eblog=new class_sys
eblog.start
if request("action")<>"login" then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>清茶道场管理员登陆</title>
<link href="styles/admin_style.css" rev="stylesheet" rel="stylesheet" type="text/css" media="all" />
<script language=javascript>
<!--
function SetFocus()
{
if (document.Login.usernames.value=="")
	document.Login.usernames.focus();
else
	document.Login.usernames.select();
}
function CheckForm()
{
	if(document.Login.usernames.value=="")
	{
		alert("请输入用户名！");
		document.Login.usernames.focus();
		return false;
	}
	if(document.Login.passwords.value == "")
	{
		alert("请输入密码！");
		document.Login.passwords.focus();
		return false;
	}
	if (document.Login.CodeStr.value==""){
       alert ("请输入您的验证码！");
       document.Login.CodeStr.focus();
       return(false);
    }
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("提示：\n    你使用的是Netscape浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}
//-->
</script>

</head>
<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form name="Login" action="admin_login.asp?action=login" method="post" target="_parent" onSubmit="return CheckForm();">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#E9E9E9">
  <tr>
    <td width="35%">&nbsp;</td>
    <td height="40" colspan="2" align="center"><font size="3"><strong>eblog后台管理登录</strong></font></td>
    <td width="35%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="10%" align="right">用户名称：</td>
    <td><input name="usernames"  type="text"  id="usernames" maxlength="20" class="Input" onmouseover="this.style.background='#F8F8F8';" onmouseout="this.style.background='#FFFFFF'" onfocus="this.select(); " /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right">用户密码：</td>
    <td><input name="passwords"  type="password" id="passwords" class="Input" onfocus="this.select(); " onmouseover="this.style.background='#F8F8F8';" onmouseout="this.style.background='#FFFFFF'" maxlength="20" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right">验 证 码：</td>
    <td><input name="CodeStr" class="Input" id="CodeStr" onfocus="this.select(); " onmouseover="this.style.background='#F8F8F8';" onmouseout="this.style.background='#FFFFFF'" size="10" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;<%=eblog.getcode2%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="40" colspan="2" align="center">
		<input name="Submit" type="submit" value=" 确&nbsp;认 " />&nbsp;&nbsp;
		<input name="reset" type="reset" id="reset" value=" 清&nbsp;除 " />
	</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<script language="JavaScript" type="text/JavaScript">
SetFocus(); 
</script>
</body>
</html>
<%
else
	dim rs
	dim username,password
	dim founderr,errmsg
	if not eblog.codepass then
		FoundErr=True
		errmsg=errmsg & "<br><li>验证码错误!</li>"
	end if
	username=eblog.filt_badstr(trim(request("usernames")))
	password=trim(request("passwords"))
	if username="" then
		FoundErr=True
		errmsg=errmsg & "<br><li>用户名不能为空！</li>"
	end if
	if password="" then
		FoundErr=True
		errmsg=errmsg & "<br><li>密码不能为空！</li>"
	end if
	if FoundErr<>True then
		password=md5(password)
		set rs=server.createobject("adodb.recordset")
		sql="select * from blog_admin where username='"&username&"'"
		if not IsObject(conn) then link_database
		rs.open sql,conn,1,3
		if rs.bof and rs.eof then
			FoundErr=True
			errmsg=errmsg & "<br><li>用户名或密码错误！</li>"
		else
			if password<>rs("password") then
				FoundErr=True
				errmsg=errmsg & "<br><li>用户名或密码错误！</li>"
			else
				rs("LastLoginIP")=Request.ServerVariables("REMOTE_ADDR")
				rs("LastLoginTime")=now()
				rs("LoginTimes")=rs("LoginTimes")+1
				rs.update
				session.Timeout=60
				session("adminname")=rs("username")
				session("adminpassword")=rs("password")
				rs.close
				set rs=nothing
				response.redirect "admin_index.asp"
			end if
		end if
		rs.close
		set rs=nothing
	end if
	if founderr=True then
		eblog.admin_err(errmsg)
	end if
end if
%>