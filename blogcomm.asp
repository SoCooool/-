<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/md5.asp" -->
<!--#include file="header.asp" -->
<%
Dim founderr,errmsg,sucmsg,sucUrl
If eblog.chkiplock() then
	FoundErr=True
	errmsg=errmsg & "<li>对不起!！你的IP已被锁定,不允许发表评论！</li>"
Else
	IF Request.QueryString("action")="postcomm" Then
		If eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4>"):response.End()
		Dim blog_ID
		blog_ID=Request.Form("blog_ID")
		IF IsInteger(blog_ID)=False Then
			FoundErr=True
			errmsg=errmsg & "<li>参数错误!</li>"
		ElseIF (memStatus<>"8" And memStatus<>"7") And DateDiff("s",Request.Cookies(CookieName)("memLastPost"),Now())<cint(Setting(15)) Then
			FoundErr=True
			errmsg=errmsg & "<li>请勿频繁提交数据,"&Setting(15)&"秒后才能操作!</li>"
		Else
			Dim comm_LogQuery,comm_LogISOK
			Set comm_LogQuery=Conn.ExeCute("SELECT log_DisComment,log_IsShow FROM blog_Content WHERE log_ID="&blog_ID&"")
			IF comm_LogQuery.EOF AND comm_LogQuery.BOF Then
				comm_LogISOK=1
			Else
				IF comm_LogQuery(0)=True OR comm_LogQuery(1)=False Then
				comm_LogISOK=2
				End IF
			End IF
			Set comm_LogQuery=Nothing
			eblog.checkform_Empty(1) '验证是否提交空信息
			eblog.checkform '验证提交的数据
			If comm_LogISOK=1 Then
				FoundErr=True
				errmsg=errmsg & "<li>所评论的日志不存在!</li>"
			End If
			If Not(memStatus="8" OR memStatus="7") AND comm_LogISOK=2 Then
				FoundErr=True
				errmsg=errmsg & "<li>所评论的日志不允许发表评论!</li>"
			End If
			eblog.userinfo
			Dim AllreadyMemErr
			Dim comm_Content,comm_memName,comm_SaveMem,comm_MemPassword,comm_DisSM,comm_DisUBB,comm_DisIMG,comm_AutoURL,comm_AutoKEY,comm_memFace,comm_Hide
			comm_Content=CheckStr(Request.Form("message"))
			comm_Content=eblog.filt_badword(comm_Content)
			comm_memName=CheckStr(Request.Form("username"))
			comm_SaveMem=Request.Form("comm_SaveMem")
			comm_memPassword=MD5(CheckStr(Request.Form("memPassword")))
			comm_DisSM=Request.Form("comm_DisSM")
			comm_DisUBB=Request.Form("comm_DisUBB")
			comm_DisIMG=Request.Form("comm_DisIMG")
			comm_AutoURL=Request.Form("comm_AutoURL")
			comm_AutoKEY=Request.Form("comm_AutoKEY")
			comm_Hide=Request.Form("comm_Hide")
			comm_memFace=CheckStr(Request.Form("userface"))
			IF comm_DisSM=Empty Then comm_DisSM=0
			IF comm_DisUBB=Empty Then comm_DisUBB=0
			IF comm_DisIMG=Empty Then comm_DisIMG=0
			IF comm_AutoURL=Empty Then comm_AutoURL=0
			IF comm_AutoKEY=Empty Then comm_AutoKEY=0
			IF comm_Hide=Empty Then comm_Hide=0
			If memName=Empty And eblog.chk_regname(comm_memName) Then
				FoundErr=True
				errmsg=errmsg & "<li>昵称系统不允许注册!</li>"
			ElseIf eblog.chk_badword(comm_memName) Then
				FoundErr=True
				errmsg=errmsg & "<li>昵称含有系统不允许的字符!</li>"
			ElseIf comm_SaveMem=1 And CheckStr(Request.Form("memPassword"))=Empty Then
				FoundErr=True
				errmsg=errmsg & "<li>密码不能为空!</li>"
			ElseIf FoundErr<>True Then
				IF memName=Empty And AllreadyMemErr<>2 Then
					IF comm_memName<>Empty AND comm_SaveMem=1 AND Setting(6)=1 Then
						Conn.ExeCute("INSERT INTO blog_Member(mem_Name,mem_Password,mem_RegIP,mem_LastIP) VALUES ('"&comm_memName&"','"&comm_memPassword&"','"&Guest_IP&"','"&Guest_IP&"')")
						Conn.ExeCute("UPDATE blog_Info SET blog_MemNums=blog_MemNums+1")
						SQLQueryNums=SQLQueryNums+2
						sucmsg=sucmsg & "<li>"&comm_memName&" 已成功注册!</li>"
						Response.Cookies(CookieName)("memName")=eblog.CodeCookie(comm_memName)
						Response.Cookies(CookieName)("memPassword")=eblog.CodeCookie(comm_memPassword)
						Response.Cookies(CookieName)("memStatus")=eblog.CodeCookie(6)
					End IF
					Conn.ExeCute("INSERT INTO blog_Comment(blog_ID,comm_Content,comm_Author,comm_DisSM,comm_DisUBB,comm_DisIMG,comm_AutoURL,comm_AutoKEY,comm_Hide,comm_Face,comm_PostIP) VALUES ("&blog_ID&",'"&comm_Content&"','"&comm_Memname&"',"&comm_DisSM&","&comm_DisUBB&","&comm_DisIMG&","&comm_AutoURL&","&comm_AutoKEY&","&comm_Hide&","&comm_memFace&",'"&Guest_IP&"')")
					SQLQueryNums=SQLQueryNums+1
				Else
					Conn.ExeCute("INSERT INTO blog_Comment(blog_ID,comm_Content,comm_Author,comm_DisSM,comm_DisUBB,comm_DisIMG,comm_AutoURL,comm_AutoKEY,comm_Hide,comm_Face,comm_PostIP) VALUES ("&blog_ID&",'"&comm_Content&"','"&memName&"',"&comm_DisSM&","&comm_DisUBB&","&comm_DisIMG&","&comm_AutoURL&","&comm_AutoKEY&","&comm_Hide&","&comm_memFace&",'"&Guest_IP&"')")
					SQLQueryNums=SQLQueryNums+1
				End IF
				Application.Lock
				Application.Contents(CookieName&"_blog_LastComm") = ""
				Application.UnLock
				Conn.ExeCute("UPDATE blog_Content SET log_CommNums=log_CommNums+1 WHERE log_ID="&blog_ID&"")
				Conn.ExeCute("UPDATE blog_Member SET mem_PostComms=mem_PostComms+1 WHERE mem_Name='"&comm_memName&"'")
				Conn.ExeCute("UPDATE blog_Info SET blog_CommNums=blog_CommNums+1")
				SQLQueryNums=SQLQueryNums+3
				Response.Cookies(CookieName)("memLastpost")=Now()
				sucmsg=sucmsg & "<li>谢谢参与，您成功发表评论!</li>"
				sucUrl=sucUrl & "blogview.asp?logID="&blog_ID&"#commmark"
			End IF
		End IF
	ElseIF Request.QueryString("action")="delecomm" Then
		IF IsInteger(Request.QueryString("commID"))=False OR IsInteger(Request.QueryString("logID"))=False Then
			FoundErr=True
			errmsg=errmsg & "<li>参数出现错误!</li>"
		Else
			Dim log_AuthorQuery
			Set log_AuthorQuery=Conn.ExeCute("SELECT log_Author FROM blog_Content WHERE log_ID="&CheckStr(Request.QueryString("logID")))
			SQLQueryNums=SQLQueryNums+1
			IF log_AuthorQuery.EOF AND log_AuthorQuery.BOF Then
				FoundErr=True
				errmsg=errmsg & "<li>参数出现错误!</li>"
			Else
				IF Not (memStatus="8" OR (memStatus="7" And memName=log_AuthorQuery(0))) Then
					FoundErr=True
					errmsg=errmsg & "<li>没有权限删除!</li>"
				Else
					Dim dele_Comm
					Set dele_Comm=Conn.ExeCute("SELECT blog_ID,comm_Author FROM blog_Comment WHERE comm_ID="&CheckStr(Request.QueryString("commID")))
					SQLQueryNums=SQLQueryNums+1
					IF dele_Comm.EOF AND dele_Comm.BOF Then
						FoundErr=True
						errmsg=errmsg & "<li>没有找到指定数据!</li>"
					Else
						Conn.ExeCute("UPDATE blog_Content SET log_CommNums=log_CommNums-1 WHERE log_ID="&dele_Comm("blog_ID"))
						Conn.ExeCute("UPDATE blog_Info SET blog_CommNums=blog_CommNums-1")
						Conn.ExeCute("UPDATE blog_Member SET mem_PostComms=mem_PostComms-1 WHERE mem_Name='"&CheckStr(dele_Comm("comm_Author"))&"'")
						Conn.Execute("DELETE * FROM blog_Comment WHERE comm_ID="&CheckStr(Request.QueryString("commID")))
						SQLQueryNums=SQLQueryNums+4
						Application.Lock
						Application.Contents(CookieName&"_blog_LastComm") = ""
						Application.UnLock
						sucmsg=sucmsg & "<li>删除成功!</li>"
						sucUrl=sucUrl & "blogview.asp?logID="&CheckStr(Request.QueryString("logID"))&"#commmark"
					End IF
					Set dele_Comm=Nothing
				End IF
			End IF
			Set log_AuthorQuery=Nothing
		End IF
	End IF
End If
if founderr=True then
	eblog.sys_err(errmsg)
end if
if founderr<>True then
	eblog.sys_Suc(sucmsg)
end if
%>
<!--#include file="footer.asp" -->