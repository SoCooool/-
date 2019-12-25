<%class class_sys
	Private LocalCacheName,Cache_Data
	Public Reloadtime,CacheName,CacheData,errstr
	Public setup,comeurl,userip,is_cookies
	private sub class_initialize()
		Reloadtime=28800
		CacheName = Lcase(Replace(Replace(Replace(Server.MapPath("default.asp"),"default.asp",""),":",""),"\",""))
		userip= Request.ServerVariables("HTTP_X_FORWARDED_FOR")
		If userip = "" Then userip = Request.ServerVariables("REMOTE_ADDR")
		comeurl=trim(request.ServerVariables("HTTP_REFERER"))
		is_cookies=1 '是否加密cookies,1为开启,0为关闭
	end sub
	Public Property Let Name(ByVal vNewValue)
		LocalCacheName = LCase(vNewValue)
		Cache_Data=Application(CacheName & "_" & LocalCacheName)
	End Property
	Public Property Let Value(ByVal vNewValue)
		If LocalCacheName<>"" Then 
			ReDim Cache_Data(2)
			Cache_Data(0)=vNewValue
			Cache_Data(1)=Now()
			Application.Lock
			Application(CacheName & "_" & LocalCacheName) = Cache_Data
			Application.unLock
		Else
			Err.Raise vbObjectError + 1, "CacheServer", " please change the CacheName."
		End If
	End Property
	Public Property Get Value()
		If LocalCacheName<>"" Then 	
			If IsArray(Cache_Data) Then
				Value=Cache_Data(0)
			Else		
				Err.Raise vbObjectError + 1, "CacheServer", " The Cache_Data("&LocalCacheName&") Is Empty."
			End If
		Else
			Err.Raise vbObjectError + 1, "CacheServer", " please change the CacheName."
		End If
	End Property
	Public Function ObjIsEmpty()
		ObjIsEmpty=True	
		If Not IsArray(Cache_Data) Then Exit Function
		If Not IsDate(Cache_Data(1)) Then Exit Function
		If DateDiff("s",CDate(Cache_Data(1)),Now()) < (60*Reloadtime) Then ObjIsEmpty=False		
	End Function
	Public Sub DelCahe()
		Application.Lock
		Application.Contents.Remove(""&CacheName&"")
		Application.unLock
	End Sub
	Public Sub ReloadSetup()
		Dim Rs
		Set Rs=Server.CreateObject("Adodb.RecordSet")
		Set Rs =conn.Execute("select * from blog_Info")
		Name="setup"
		value = Rs.GetRows(1)
		Set Rs = Nothing
		Application.Lock
		Application.unLock
	End Sub
	Public is_getcode,Setting
	'取得基本设置数据
	Public Sub start()
		Name="setup"
		If ObjIsEmpty() Then ReloadSetup()
		setup=value
		is_getcode=Trim(setup(5,0))
		is_getcode=Split(is_getcode,"|")
		Setting=Trim(setup(5,0))
		Setting=Split(Setting,"|")
		If is_getcode(0)="0" Then
			Response.Write("暂关闭网站,请稍后再访问!")
		End If
		Application.Lock
		Application.unLock
	End Sub
	
	Public Sub placard()
		If Setting(1)="1" Then
			Response.Write("<div class=placard>"&UnCheckStr(setup(26,0))&"</div>")
		End If
	End Sub
	'验证码显示
	Public Function getcode(i)
		If i=1 AND is_getcode(2)="1" Then
			getcode="验证码: <input name=""CodeStr"" class=""input_bg3"" id=""CodeStr"" maxlength=""4"" /> <img src=""inc/code.asp"" />&nbsp;&nbsp;"
		ElseIf i=2 AND is_getcode(3)="1" Then
			getcode="验证码: <input name=""CodeStr"" class=""input_bg3"" id=""CodeStr"" maxlength=""4"" /> <img src=""inc/code.asp"" />&nbsp;&nbsp;"
		ElseIf i=3 AND is_getcode(4)="1" Then
			getcode="验证码: <input name=""CodeStr"" class=""input_bg3"" id=""CodeStr"" maxlength=""4"" /> <img src=""inc/code.asp"" />&nbsp;&nbsp;"
		ElseIf i=4 AND is_getcode(5)="1" Then
			getcode="验证码: <input name=""CodeStr"" class=""input_bg3"" id=""CodeStr"" maxlength=""4"" /> <img src=""inc/code.asp"" />"
		End If
	End Function
	Public Function getcode2()
		getcode2="<img src=""inc/code.asp"" />"	
	End Function
	'检查验证码是否正确
	Public Function codepass()
		Dim CodeStr
		CodeStr=Trim(Request("CodeStr"))
		If CStr(Session("GetCode"))=CStr(CodeStr) And CodeStr<>""  Then
			codepass=True
			Session("GetCode")=empty
		Else
			codepass=False
			Session("GetCode")=empty
		End If	
	End Function
	'验证是否提交空数据
	Public Function checkform_Empty(i)
		If CheckStr(Request.Form("username"))=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称必须填写!</li>"
		End If
		IF CheckStr(Request.Form("message"))=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>内容必须填写!</li>"
		End If
		If i=1 AND is_getcode(2)="1" Then
			IF not eblog.codepass then
				FoundErr=True
				errmsg=errmsg & "<li>验证码错误!</li>"
			End If
		ElseIf i=2 AND is_getcode(3)="1" Then
			IF not eblog.codepass then
				FoundErr=True
				errmsg=errmsg & "<li>验证码错误!</li>"
			End If
		ElseIf i=3 AND is_getcode(4)="1"  Then
			IF not eblog.codepass then
				FoundErr=True
				errmsg=errmsg & "<li>验证码错误!</li>"
			End If
		End If
	End Function

	Public Function Strurls(str,notes)
		Strurls=ubound(split(LCase(str),notes))
	End Function

	Public AllreadyMem,AllreadyMemErr
	Public Sub userinfo()
		Set AllreadyMem=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT mem_Name,mem_Password,mem_Status,mem_LastIP FROM blog_Member WHERE mem_Name='"&CheckStr(Request.Form("username"))&"'"
		AllreadyMem.Open SQL,Conn,1,3
		SQLQueryNums=SQLQueryNums+1
		IF AllreadyMem.EOF AND AllreadyMem.BOF Then
			AllreadyMemErr=0
		ElseIf AllreadyMem("mem_Status")=5 Then
			AllreadyMemErr=3
		ElseIf AllreadyMem("mem_Password")=MD5(CheckStr(Request.Form("MemPassword"))) Then
			Response.Cookies(CookieName)("memName")=CodeCookie(AllreadyMem("mem_Name"))
			Response.Cookies(CookieName)("memPassword")=CodeCookie(AllreadyMem("mem_Password"))
			Response.Cookies(CookieName)("memStatus")=CodeCookie(AllreadyMem("mem_Status"))
			memName=AllreadyMem("mem_Name")
			AllreadyMem("mem_LastIP")=Guest_IP
			AllreadyMem.Update
			AllreadyMemErr=2
		Else
			AllreadyMemErr=1
		End IF
		AllreadyMem.close
		Set AllreadyMem=Nothing
	End Sub
	'验证提交的数据
	Public Function checkform()
		userinfo()
		IF CheckStr(Request.Form("username"))<>Empty And Len(CheckStr(Request.Form("username")))<2 Or Len(CheckStr(Request.Form("username")))>12 Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称长度为2-12个字符!</li>"
		End If
		IF IsValidUserName(CheckStr(Request.Form("username")))=False Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称中含有非法字符!</li>"
		End If
		If memName=Empty AND AllreadyMemErr=1 Then
			FoundErr=True
			errmsg=errmsg & "<li>所使用的昵称已经注册!</li><li>如果是您注册的昵称,请输入正确密码!</li>"
		End If
		If AllreadyMemErr=3 Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称已经被锁定,请联系网站管理员!</li>"
		End If
		If CheckStr(Request.Form("MemPassword"))<>Empty AND Len(CheckStr(Request.Form("MemPassword")))<6 Or Len(CheckStr(Request.Form("MemPassword")))>12 Then
			FoundErr=True
			errmsg=errmsg & "<li>密码位数为6-12个字符!</li>"
		End If
		IF CheckStr(Request.Form("message"))<>Empty And Len(CheckStr(Request.Form("message")))<cint(Setting(10)) Or Len(CheckStr(Request.Form("message")))>cint(Setting(11)) Then
			FoundErr=True
			errmsg=errmsg & "<li>内容字数为"&Setting(10)&"-"&Setting(11)&"个字符!</li>"
		End If
		Dim MaxUrl
		IF session("memStatus")<>"Admin" AND session("memStatus")<>"SupAdmin" Then
			MaxUrl=cint(Setting(12))
		Else
			MaxUrl=cint(Setting(13))
		End If
		IF Strurls(Request.Form("message"),"[url")>MaxUrl or Strurls(Request.Form("message"),"http://")>MaxUrl then 
			FoundErr=True
			errmsg=errmsg & "<li>输入的内容有非法连接或"&MaxUrl&"个以上连接!</li>"
		End If
	End Function
	'错误信息提示
	Public sub sys_err(errmsg)
		Dim strErr
		strErr=strErr & "<div id=""default"">" & vbcrlf
		strErr=strErr & "<div id=""default_bg"">" & vbcrlf
		strErr=strErr & "<div id=""showmsg_main"">" & vbcrlf
		strErr=strErr & "<div id=""showmsg_bg"">" & vbcrlf
		strErr=strErr & "<div id=""showmsg_head""><h3>错误信息</h3></div>" & vbcrlf
		strErr=strErr & "<div id=""showmsg_msg"">" & vbcrlf
		strErr=strErr & "<p><img src=""images/icon_error.gif"" align=""absbottom"" alt="""" />&nbsp;&nbsp;产生错误的可能原因：</p>" & vbcrlf
		strErr=strErr & "<p></p>" & vbcrlf
		strErr=strErr & "" & errmsg &"" & vbcrlf
		strErr=strErr & "<p></p>" & vbcrlf
		strErr=strErr & "<p></p>" & vbcrlf
		strErr=strErr & "<p><a href='javascript:history.go(-1)'>&lt;&lt; 返回上一页</a></p>" & vbcrlf
		strErr=strErr & "</div>" & vbcrlf
		strErr=strErr & "</div>" & vbcrlf
		strErr=strErr & "</div>" & vbcrlf
		strErr=strErr & "</div>" & vbcrlf
		strErr=strErr & "</div>" & vbcrlf
		response.write strErr
	End Sub
	'成功信息提示
	Public sub sys_Suc(sucmsg)
		Dim strSuc
		strSuc=strSuc & "<div id=""default"">" & vbcrlf
		strSuc=strSuc & "<div id=""default_bg"">" & vbcrlf
		strSuc=strSuc & "<div id=""showmsg_main"">" & vbcrlf
		strSuc=strSuc & "<div id=""showmsg_bg"">" & vbcrlf
		strSuc=strSuc & "<div id=""showmsg_head""><h3>成功信息</h3></div>" & vbcrlf
		strSuc=strSuc & "<div id=""showmsg_msg"">" & vbcrlf
		strSuc=strSuc & "<p><img src=""images/icon_successful.gif"" align=""absbottom"" alt="""" />&nbsp;&nbsp;产生成功的原因：</p>" & vbcrlf
		strSuc=strSuc & "<p></p>" & vbcrlf
		strSuc=strSuc & "" & sucmsg &"" & vbcrlf
		strSuc=strSuc & "<p></p>" & vbcrlf
		strSuc=strSuc & "<p></p>" & vbcrlf
		strSuc=strSuc & "<p><a href='" & sucUrl &"'> 点击返回 或者 3秒后自动返回<meta http-equiv='refresh' content='3;url=" & sucUrl &"'></a></p>" & vbcrlf
		strSuc=strSuc & "</div>" & vbcrlf
		strSuc=strSuc & "</div>" & vbcrlf
		strSuc=strSuc & "</div>" & vbcrlf
		strSuc=strSuc & "</div>" & vbcrlf
		strSuc=strSuc & "</div>" & vbcrlf
		response.write strSuc
	End Sub

	Public Sub showerr()
		If errstr<>"" Then sys_err()
	End Sub

	'友情连接类
	Public sub Links(LMode)
		Dim Link
		Set link=Conn.ExeCute("SELECT link_"&LMode&" FROM blog_Links ORDER BY link_ID DESC")
		IF link.EOF AND link.BOF Then
			Response.Write("None!")
		Else
			Dim strConn
			strConn="link_"&LMode&""
			If link(""&strConn&"")<>Empty Then
				Response.Write(""&UnCheckStr(link(""&strConn&""))&"")
			Else
				Response.Write("")
			End If
		End If
	End Sub

	Public function filt_badstr(str)
		If Isnull(Str) Then
			filt_badstr = ""
			Exit Function 
		End If
		Str = Replace(Str,Chr(0),"")
		filt_badstr = Replace(Str,"'","''")
	end function

	Public sub admin_err(errmsg)
		dim strErr
		strErr=strErr & "<!DOCTYPE html Public '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>" & vbcrlf
		strErr=strErr & "<html xmlns='http://www.w3.org/1999/xhtml'>" & vbcrlf
		strErr=strErr & "<head>" & vbcrlf
		strErr=strErr & "<title>错误信息</title>" & vbcrlf
		strErr=strErr & "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>" & vbcrlf
		strErr=strErr & "<link href='styles/admin_style.css' rel='stylesheet' type='text/css'>" & vbcrlf
		strErr=strErr & "</head>" & vbcrlf
		strErr=strErr & "<body>" & vbcrlf
		strErr=strErr & "<p>&nbsp;<p>" & vbcrlf
		strErr=strErr & "<p>&nbsp;<p>" & vbcrlf
		strErr=strErr & "<table cellpadding=2 cellspacing=1 border=0 width=400 class=""border"" align=center>" & vbcrlf
		strErr=strErr & "  <br><tr align='center'><td height='22' class='title'><strong>错误信息</strong></td>" & vbcrlf
		strErr=strErr & "  </tr>" & vbcrlf
		strErr=strErr & "  <tr><td height='100' class='tdbg' valign='top'><b>产生错误的可能原因：</b><br>" & errmsg &"</td></tr>" & vbcrlf
		strErr=strErr & "  <tr align='center'><td class='tdbg'><a href='javascript:history.go(-1)'>&lt;&lt; 返回上一页</a></td></tr>" & vbcrlf
		strErr=strErr & "</table>" & vbcrlf
		strErr=strErr & "</body>" & vbcrlf
		strErr=strErr & "</html>" & vbcrlf
		response.write strErr
	end sub

	Public function showpage(sfilename,totalnumber,maxperpage,ShowTotal,ShowAllPages,strUnit)
		dim n, i,strTemp,strUrl
		if totalnumber mod maxperpage=0 then
			n= totalnumber \ maxperpage
		else
			n= totalnumber \ maxperpage+1
		end if
		strTemp= "<div class=""showpage"">"
		if ShowTotal=true then 
			strTemp=strTemp & "共 <strong>" & totalnumber & "</strong> " & strUnit & "&nbsp;&nbsp;"
		end if
		strUrl=JoinChar(sfilename)
		if CurrentPage<2 then
				strTemp=strTemp & "首页 上一页&nbsp;"
		else
				strTemp=strTemp & "<a href='" & strUrl & "page=1'>首页</a>&nbsp;"
				strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
		end if
	
		if n-currentpage<1 then
				strTemp=strTemp & "下一页 尾页"
		else
				strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage+1) & "'>下一页</a>&nbsp;"
				strTemp=strTemp & "<a href='" & strUrl & "page=" & n & "'>尾页</a>"
		end if
		strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
		strTemp=strTemp & "&nbsp;<strong>" & maxperpage & "</strong>" & strUnit & "/页"
		if ShowAllPages=True then
			strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange=""javascript:window.location='" & strUrl & "page=" & "'+this.options[this.selectedIndex].value;"">"   
			for i = 1 to n   
				strTemp=strTemp & "<option value='" & i & "'"
				if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
				strTemp=strTemp & ">第" & i & "页</option>"   
			next
			strTemp=strTemp & "</select>"
		end if
		strTemp=strTemp & "</div>"
		showpage=strTemp
	end function

	Public function JoinChar(strUrl)
		if strUrl="" then
			JoinChar=""
			exit function
		end if
		if InStr(strUrl,"?")<len(strUrl) then 
			if InStr(strUrl,"?")>1 then
				if InStr(strUrl,"&")<len(strUrl) then 
					JoinChar=strUrl & "&"
				else
					JoinChar=strUrl
				end if
			else
				JoinChar=strUrl & "?"
			end if
		else
			JoinChar=strUrl
		end if
	end function

	Public sub showok(str,url)
		url=trim(url)
		if url<>"" then
			response.Write "<script language=JavaScript>alert("""&str&""");window.location='"&url&"'</script>"
		else
			if comeurl="" then
				response.Write "<script language=JavaScript>alert("""&str&""");history.go(-1)</script>"
			else
				response.Write "<script language=JavaScript>alert("""&str&""");window.location='"&comeurl&"'</script>"
			end if
		end if
	end sub

	Public function chkiplock()
		Dim IPlock
		IPlock = False
		Dim locklist
		locklist=Trim(setup(23,0))
		If locklist="" Then Exit function
		Dim i,StrUserIP,StrKillIP
		StrUserIP=userip
		locklist=Split(locklist,vbcrlf)
		If StrUserIP="" Then Exit function
		StrUserIP=Split(userip,".")
		If Ubound(StrUserIP)<>3 Then Exit function
		For i= 0 to UBound(locklist)
			locklist(i)=Trim(locklist(i))
			If locklist(i)<>"" Then 
				StrKillIP = Split(locklist(i),".")
				If Ubound(StrKillIP)<>3 Then Exit For
				IPlock = True
				If (StrUserIP(0) <> StrKillIP(0)) And Instr(StrKillIP(0),"*")=0 Then IPlock=False
				If (StrUserIP(1) <> StrKillIP(1)) And Instr(StrKillIP(1),"*")=0 Then IPlock=False
				If (StrUserIP(2) <> StrKillIP(2)) And Instr(StrKillIP(2),"*")=0 Then IPlock=False
				If (StrUserIP(3) <> StrKillIP(3)) And Instr(StrKillIP(3),"*")=0 Then IPlock=False
				If IPlock Then Exit For
			End If
		Next
		chkiplock=iplock
	End function

	Public Function CodeCookie(str)
	if is_cookies=1 then
		Dim i
		Dim StrRtn
		For i = Len(Str) to 1 Step -1
			StrRtn = StrRtn & Ascw(Mid(Str,i,1))
			If (i <> 1) Then StrRtn = StrRtn & "a"
		Next
		CodeCookie = StrRtn
	else
		CodeCookie=str
	end if
	End Function
	
	Public Function DecodeCookie(Str)
	if is_cookies=1 then
		Dim i
		Dim StrArr,StrRtn
		StrArr = Split(Str,"a")
		For i = 0 to UBound(StrArr)
			If isNumeric(StrArr(i)) = True Then
				StrRtn = Chrw(StrArr(i)) & StrRtn
			Else
				StrRtn = Str
				Exit Function
			End If
		Next
		DecodeCookie = StrRtn
	else
		DecodeCookie=str
	end if
	End Function

	'禁止站外提交
	Public Function ChkPost()
		Dim server_v1,server_v2
		Chkpost=False 
		server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
		server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
		If Mid(server_v1,8,len(server_v2))=server_v2 Then Chkpost=True 
	End Function
	'注册过滤字符
	Public function chk_regname(regname)
		dim regbadstr,i
		regbadstr=split(setup(25,0),vbcrlf)
		chk_regname=false
		for i=0 to ubound(regbadstr)
			if trim(regbadstr(i))<>"" then
				if trim(regname)=trim(regbadstr(i)) then
					chk_regname=true
				end if
			end if
			if chk_regname=true then exit for
		next
	end function	
	Public function chk_badword(str)
		dim badstr,i,n
		badstr=split(setup(24,0),vbcrlf)
		n=0
		for i=0 to ubound(badstr)
			if trim(badstr(i))<>"" then
				if instr(str,trim(badstr(i)))>0 then
					n=n+1
				end if
			end if
		next
		chk_badword=n
	end function
	Public function filt_badword(str)
		dim badstr,i
		badstr=split(setup(24,0),vbcrlf)
		for i=0 to ubound(badstr)
			if trim(badstr(i))<>"" then
				str=replace(str,badstr(i),"***")
			end if
		next
		filt_badword=str
	end function
end class
%>