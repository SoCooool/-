<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/md5.asp" -->
<!--#include file="header.asp" -->
<%
dim founderr,errmsg,sucmsg,sucUrl
If eblog.chkiplock() then
	FoundErr=True
	errmsg=errmsg & "<li>对不起!你的IP已被锁定,不允许注册！</li>"
ElseIf Setting(6)="0" Then
	FoundErr=True
	errmsg=errmsg & "<li>暂时不开放注册！</li>"
Else
	IF Request.QueryString("action")="agree" Then%>
		<div id="default">
		<div id="default_bg">
			<div id="register_head"><h4>注册成员</h4></div>
			<div id="register_main">
			<div id="register_bg">
				<div id="register_rl">
				<form name="register" method="post" action="register.asp?action=register">
					<div id="register_left">
						<p>昵称: </p>
						<p>密码: </p>
						<p>确认密码: </p>
						<p>EMail地址: </p>
					</div>
					<div id="register_right">
						<p><input name="Username" type="text" class="input_bg2" id="Username" maxlength="12" />&nbsp;<strong><font color="#FF0000">*</font></strong> 呢称字符必须是2-12位</p>
						<p><input name="Password" type="Password" class="input_bg2" id="Password" maxlength="12" />&nbsp;<strong><font color="#FF0000">*</font></strong> 密码必须是6-12位</p>
						<p><input name="PasswordR" type="Password" class="input_bg2" id="PasswordR" maxlength="12" />&nbsp;<strong><font color="#FF0000">*</font></strong> 请输入确认密码</p>
						<p><input name="Email" type="text" class="input_bg" id="Email" maxlength="52" />&nbsp;<strong><font color="#FF0000">*</font></strong> 请输入有效的电子信箱地址</p>
						<p>&nbsp;</p>
						<p><%=eblog.getcode(4)%></p>
						
						<p>
							<input class="signinbtn" type="submit" name="submit" value="注册" />&nbsp;
							<input class="signinbtn" name="Reset" type="reset" id="Reset" value="重写" />
						</p>
					</div>
				</form>
				</div>
			</div>
			</div>
		</div>
		</div>
	<%ElseIF Request.QueryString("action")="register" Then
		Dim reg_name,reg_password,reg_mail
		reg_name=CheckStr(Request.Form("Username"))
		reg_password=md5(CheckStr(Request.Form("Password")))
		reg_mail=CheckStr(Request.Form("Email"))
		If eblog.chk_regname(reg_name) Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称系统不允许注册!</li>"
		End If
		If eblog.chk_badword(reg_name) Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称含有系统不允许的字符!</li>"
		End If
		IF reg_name=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称不能为空!</li>"
		End if
		If CheckStr(Request.Form("Password"))=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>密码不能为空!</li>"
		End if
		If CheckStr(Request.Form("PasswordR"))=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>确认密码不能为空!</li>"
		End if
		If reg_mail=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>EMail地址不能为空!</li>"
		End if
		If Setting(5)="1" Then
			If not eblog.codepass then
				FoundErr=True
				errmsg=errmsg & "<li>验证码错误!</li>"
			End If
		End If
		If Setting(6)="0" Then
			FoundErr=True
			errmsg=errmsg & "<li>暂时不开放注册！</li>"
		End If
			If FoundErr<>True Then
			IF  CheckStr(Request.Form("Password"))<>CheckStr(Request.Form("PasswordR")) Then
				FoundErr=True
				errmsg=errmsg & "<li>密码与确认密码不符!</li>"
			End If
			IF Len(CheckStr(Request.Form("Password")))<6 OR Len(CheckStr(Request.Form("Password")))>12 Then
				FoundErr=True
				errmsg=errmsg & "<li>密码长度不符合!</li>"
			End If
			IF Len(reg_name)>12 OR Len(reg_name)<2 Then
				FoundErr=True
				errmsg=errmsg & "<li>昵称长度不符合!</li>"
			End If
			IF IsValidUserName(Request.Form("Username"))=False Then
				FoundErr=True
				errmsg=errmsg & "<li>昵称中含有非法字符!</li>"
			End If
			IF IsValidEmail(reg_mail)=False Then
				FoundErr=True
				errmsg=errmsg & "<li>EMail输入错误!</li>"
			End If
			If founderr<>true Then
				Dim memAlready
				Set memAlready=Conn.Execute("SELECT mem_Name FROM blog_Member WHERE mem_Name='"&reg_name&"'")
				SQLQueryNums=SQLQueryNums+1
				IF NOT(memAlready.EOF AND memAlready.BOF) Then
					FoundErr=True
					errmsg=errmsg & "<li>对不起，你所使用的昵称已经注册!</li>"
				Else
					Conn.ExeCute("INSERT INTO blog_Member(mem_Name,mem_Password,mem_Email,mem_RegIP) VALUES ('"&reg_name&"','"&reg_password&"','"&reg_mail&"','"&Guest_IP&"')")
					Conn.ExeCute("UPDATE blog_Info SET blog_MemNums=blog_MemNums+1")
					SQLQueryNums=SQLQueryNums+2
					Response.Cookies(CookieName)("memName")=eblog.CodeCookie(reg_name)
					Response.Cookies(CookieName)("memPassword")=eblog.CodeCookie(reg_password)
					Response.Cookies(CookieName)("memStatus")=eblog.CodeCookie(6)
					sucmsg=sucmsg & "<li>注册成功!</li><li>Welcome to "&eblog.setup(1,0)&"!</li><li><font color=#006633>为了方便以后交流和联系,请及时填写你的详细资料!</font>!</li>"
					sucUrl=sucUrl & "login.asp"
				End IF
				memAlready.close
				Set memAlready=Nothing
			End IF
		End IF
		if founderr<>True then
			eblog.sys_Suc(sucmsg)
		end if
	Else%>
	<div id="default">
	<div id="default_bg">
		<div id="register_head"><h4>注册成员</h4></div>
		<div id="register_main">
		<div id="register_bg">
			<p><h5>用户注册协议</h5></p>
			<p>为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：</p>
			<p>一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：</p>
			<ul>
				<li>（1）煽动抗拒、破坏宪法和法律、行政法规实施的；</li>
				<li>（2）煽动颠覆国家政权，推翻社会主义制度的；</li>
				<li>（3）煽动分裂国家、破坏国家统一的；</li>
				<li>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</li>
				<li>（5）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；</li>
				<li>（6）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；</li>
				<li>（7）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；</li>
				<li>（8）损害国家机关信誉的；</li>
				<li>（9）其他违反宪法和法律行政法规的；</li>
				<li>（10）进行商业广告行为的。</li>
			</ul>
			<p>二、互相尊重，对自己的言论和行为负责。</p>
			<form name="bbrules" method="post" action="register.asp?action=agree">
			<div align="center">
				<input name="rulesubmit" class="signinbtn2" type="button" onclick=GotoUrl() value="我已阅读并同意以上条款">
				<input type="button" class="signinbtn" name="return" value="不同意" onclick="javascript:history.go(-1);">
			</div>
			<SCRIPT language=javascript>
				var strUrl = "register.asp?action=agree";
				function GotoUrl(){location.href=strUrl;}
				function GotoSignIn(){location.href=strUrl;}
			</SCRIPT>
			<script language="javascript">
			var secs = 10;
			var wait = secs * 1000;
			document.bbrules.rulesubmit.value = "我已阅读并同意以上条款 (" + secs + ")";
			document.bbrules.rulesubmit.disabled = true;
			for(i = 1; i <= secs; i++) {
					window.setTimeout("update(" + i + ")", i * 1000);
			}
			window.setTimeout("timer()", wait);
			function update(num, value) {
					if(num == (wait/1000)) {
							document.bbrules.rulesubmit.value = "我已阅读并同意以上条款";
					} else {
							printnr = (wait / 1000)-num;
							document.bbrules.rulesubmit.value = "我已阅读并同意以上条款 (" + printnr + ")";
					}
			}
			function timer() {
					document.bbrules.rulesubmit.disabled = false;
					document.bbrules.rulesubmit.value = "我已阅读并同意以上条款";
			}
			</script>
			</form>
		</div>
		</div>
	</div>
	</div>
	<%End If
End If
if founderr=True then
	eblog.sys_err(errmsg)
end if
%>
<!--#include file="footer.asp" -->