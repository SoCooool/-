<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/md5.asp" -->
<!--#include file="header.asp" -->
<%
dim founderr,errmsg,sucmsg,sucUrl
IF Request.QueryString("action")="logout" Then
	Response.Cookies(CookieName)("memName")=""
	Response.Cookies(CookieName)("memPassword")=""
	Response.Cookies(CookieName)("memStatus")=""
	sucmsg=sucmsg & "<li>已成功登出!</li>"
	sucUrl=sucUrl & "default.asp"
	If founderr<>True Then
		eblog.sys_Suc(sucmsg)
	End If
ElseIF Request.QueryString("action")="login" Then
	If eblog.chkiplock() then
		FoundErr=True
		errmsg=errmsg & "<li>对不起!你的IP已被锁定,不允许登陆！</li>"
	Else
		IF Request.Form("UserName")=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>用户名不能为空!</li>"
		End if
		If Request.Form("Password")=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>密码不能为空!</li>"
		Else
			Dim memLogin
			Set memLogin=Server.CreateObject("ADODB.Recordset")
			SQL="SELECT mem_Name,mem_Password,mem_Status,mem_LastIP FROM blog_Member WHERE mem_Name='"&CheckStr(Request.Form("Username"))&"' AND mem_Password='"&md5(CheckStr(Request.Form("Password")))&"'"
			memLogin.Open SQL,Conn,1,3
			SQLQueryNums=SQLQueryNums+1
			IF memLogin.EOF AND memLogin.BOF Then
				FoundErr=True
				errmsg=errmsg & "<li>用户名或密码错误!</li>"
			Elseif FoundErr<>True then
				Dim login_Name,login_Pass,login_Status
				login_Name=memLogin("mem_Name")
				login_Pass=memLogin("mem_Password")
				login_Status=memLogin("mem_Status")
				Response.Cookies(CookieName)("memName")=eblog.CodeCookie(login_Name)
				Response.Cookies(CookieName)("memPassword")=eblog.CodeCookie(login_Pass)
				Response.Cookies(CookieName)("memStatus")=eblog.CodeCookie(login_Status)
				Select Case Request.Form("CookieTime")
					case 0
					'not save
					Case 1
						Response.Cookies(CookieName).Expires=Date+1
					Case 2
						Response.Cookies(CookieName).Expires=Date+3
					Case 3
						Response.Cookies(CookieName).Expires=Date+7
					Case 4
						Response.Cookies(CookieName).Expires=Date+30
					Case 5
						Response.Cookies(CookieName).Expires=Date+365
				End Select
				memLogin("mem_LastIP")=Guest_IP
				memLogin.Update
				sucmsg=sucmsg & "<li>已成功登入!</li>"
				sucUrl=sucUrl & "default.asp"
			memLogin.Close
			Set memLogin=Nothing
			End IF
		End IF
	End IF
	if founderr<>True then
		eblog.sys_Suc(sucmsg)
	end if
Else%>
	<div id="login">
	<div id="login_bg">
	<div id="login_bg2">
		<div id="login_main">
			<h3>Sign In</h3>
			<form action="login.asp?action=login" method="post" name="Login" id="Login">
			<p>Username: &nbsp;<input name="username" type="text" id="username" class="input_bg2" size="20" maxlength="16" /></p>
			<p>Password: &nbsp;<input name="password" type="password" id="password" class="input_bg2" size="20" maxlength="16" /></p>
			<p><input name="CookieTime" id="CookieTime" type="hidden" value="0" />
			<input name="Login" type="image" src="images/icon_login.gif" id="agree" value="" />&nbsp;&nbsp;
			<a href="register.asp"><img src="images/icon_register.gif" alt="register" border="0" /></a></p>
			</form>
		</div>
	</div>
	</div>
	</div>
<%end if
if founderr=True then
	eblog.sys_err(errmsg)
end if
%>	
<!--#include file="footer.asp" -->