<%
Function IsValidUserName(byVal UserName)
	Dim i,c
	IsValidUserName = True
	For i = 1 To Len(UserName)
		c = Lcase(Mid(UserName, i, 1))
		IF InStr("$!<>?#^%@~`&*(){};:,./+=_'"" 		", c) > 0 Then
				IsValidUserName = False
				Exit Function
		End IF
	Next
End Function

Function IsInteger(Para) '检测是否有效的数字
	IsInteger=False
	If Not (IsNull(Para) Or Trim(Para)="" Or Not IsNumeric(Para)) Then
		IsInteger=True
	End If
End Function

Function CheckLinkStr(Str)
	Str = Replace(Str, "document.cookie", ".")
	Str = Replace(Str, "document.write", ".")
	Str = Replace(Str, "javascript:", "javascript ")
	Str = Replace(Str, "vbscript:", "vbscript ")
	Str = Replace(Str, "javascript :", "javascript ")
	Str = Replace(Str, "vbscript :", "vbscript ")
	Str = Replace(Str, "[", "&#91;")
	Str = Replace(Str, "]", "&#93;")
	Str = Replace(Str, "<", "&#60;")
	Str = Replace(Str, ">", "&#62;")
	Str = Replace(Str, "{", "&#123;")
	Str = Replace(Str, "}", "&#125;")
	Str = Replace(Str, "|", "&#124;")
	Str = Replace(Str, "script", "&#115;cript")
	Str = Replace(Str, "SCRIPT", "&#083;CRIPT")
	Str = Replace(Str, "Script", "&#083;cript")
	Str = Replace(Str, "script", "&#083;cript")
	Str = Replace(Str, "object", "&#111;bject")
	Str = Replace(Str, "OBJECT", "&#079;BJECT")
	Str = Replace(Str, "Object", "&#079;bject")
	Str = Replace(Str, "object", "&#079;bject")
	Str = Replace(Str, "applet", "&#097;pplet")
	Str = Replace(Str, "APPLET", "&#065;PPLET")
	Str = Replace(Str, "Applet", "&#065;pplet")
	Str = Replace(Str, "applet", "&#065;pplet")
	Str = Replace(Str, "embed", "&#101;mbed")
	Str = Replace(Str, "EMBED", "&#069;MBED")
	Str = Replace(Str, "Embed", "&#069;mbed")
	Str = Replace(Str, "embed", "&#069;mbed")
	Str = Replace(Str, "document", "&#100;ocument")
	Str = Replace(Str, "DOCUMENT", "&#068;OCUMENT")
	Str = Replace(Str, "Document", "&#068;ocument")
	Str = Replace(Str, "document", "&#068;ocument")
	Str = Replace(Str, "cookie", "&#099;ookie")
	Str = Replace(Str, "COOKIE", "&#067;OOKIE")
	Str = Replace(Str, "Cookie", "&#067;ookie")
	Str = Replace(Str, "cookie", "&#067;ookie")
	Str = Replace(Str, "event", "&#101;vent")
	Str = Replace(Str, "EVENT", "&#069;VENT")
	Str = Replace(Str, "Event", "&#069;vent")
	Str = Replace(Str, "event", "&#069;vent")
	CheckLinkStr = Str
End Function

Function CheckStr(byVal ChkStr) '检查无效字符
	Dim Str:Str=ChkStr
	Str=Trim(Str)
	If IsNull(Str) Then
		CheckStr = ""
		Exit Function 
	End If
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(\r\n){3,}"
	Str=re.Replace(Str,"$1$1$1")
	Set re=Nothing
	Str = Replace(Str,"'","''")
	Str = Replace(Str, "select", "sel&#101;ct")
	Str = Replace(Str, "join", "jo&#105;n")
	Str = Replace(Str, "union", "un&#105;on")
	Str = Replace(Str, "where", "wh&#101;re")
	Str = Replace(Str, "insert", "ins&#101;rt")
	Str = Replace(Str, "delete", "del&#101;te")
	Str = Replace(Str, "update", "up&#100;ate")
	Str = Replace(Str, "like", "lik&#101;")
	Str = Replace(Str, "drop", "dro&#112;")
	Str = Replace(Str, "create", "cr&#101;ate")
	Str = Replace(Str, "modify", "mod&#105;fy")
	Str = Replace(Str, "rename", "ren&#097;me")
	Str = Replace(Str, "alter", "alt&#101;r")
	Str = Replace(Str, "cast", "ca&#115;t")
    	Str = Replace(Str, "script", "scr&#105;pt")
    	Str = Replace(Str, "src", "&#115;rc")
    	Str = Replace(Str, ">", "&gt;")
	Str = Replace(Str, "<", "&lt;")
	CheckStr=Str
End Function

Function UnCheckStr(Str)
	Str = Replace(Str, "sel&#101;ct", "select")
	Str = Replace(Str, "jo&#105;n", "join")
	Str = Replace(Str, "un&#105;on", "union")
	Str = Replace(Str, "wh&#101;re", "where")
	Str = Replace(Str, "ins&#101;rt", "insert")
	Str = Replace(Str, "del&#101;te", "delete")
	Str = Replace(Str, "up&#100;ate", "update")
	Str = Replace(Str, "lik&#101;", "like")
	Str = Replace(Str, "dro&#112;", "drop")
	Str = Replace(Str, "cr&#101;ate", "create")
	Str = Replace(Str, "mod&#105;fy", "modify")
	Str = Replace(Str, "ren&#097;me", "rename")
	Str = Replace(Str, "alt&#101;r", "alter")
	Str = Replace(Str, "ca&#115;t", "cast")
	Str = Replace(Str, "scr&#105;pt", "script")
	Str = Replace(Str, "&#115;rc", "src")
	Str = Replace(Str, "&gt;", ">")
	Str = Replace(Str, "&lt;", "<")
	UnCheckStr=Str
End Function

Function HTMLEncode(reString) '转换HTML代码
	Dim Str:Str=reString
	If Not IsNull(Str) Then
		Str = UnCheckStr(Str)
		Str = Replace(Str, "&", "&amp;")
		Str = Replace(Str, ">", "&gt;")
		Str = Replace(Str, "<", "&lt;")
		Str = Replace(Str, CHR(32), "&nbsp;")
		Str = Replace(Str, CHR(9), "&nbsp;&nbsp;&nbsp;&nbsp;")
		Str = Replace(Str, CHR(34),"&quot;")
		Str = Replace(Str, CHR(39),"&#39;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), "<br>")
		HTMLEncode = Str
	End If
End Function

Function EditDeHTML(byVal Content)
	EditDeHTML=Content
	IF Not IsNull(EditDeHTML) Then
		EditDeHTML=UnCheckStr(EditDeHTML)
		EditDeHTML=Replace(EditDeHTML,"&","&amp;")
		EditDeHTML=Replace(EditDeHTML,"<","&lt;")
		EditDeHTML=Replace(EditDeHTML,">","&gt;")
		EditDeHTML=Replace(EditDeHTML,CHR(34),"&quot;")
		EditDeHTML=Replace(EditDeHTML,CHR(39),"&#39;")
	End IF
End Function

Function DateToStr(DateTime,ShowType)  '日期转换函数
	Dim DateMonth,DateDay,DateHour,DateMinute
	DateMonth=Month(DateTime)
	DateDay=Day(DateTime)
	DateHour=Hour(DateTime)
	DateMinute=Minute(DateTime)
	If Len(DateMonth)<2 Then DateMonth="0"&DateMonth
	If Len(DateDay)<2 Then DateDay="0"&DateDay
	Select Case ShowType
	Case "m-d"  
		DateToStr=DateMonth&"-"&DateDay
	Case "Y-m"  
		DateToStr=Year(DateTime)&"-"&DateMonth
	Case "Y-m-d"  
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay
	Case "Y-m-d H:I A"
		Dim DateAMPM
		If DateHour>12 Then 
			DateHour=DateHour-12
			DateAMPM="PM"
		Else
			DateHour=DateHour
			DateAMPM="AM"
		End If
		If Len(DateHour)<2 Then DateHour="0"&DateHour	
		If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute&" "&DateAMPM
	Case "Y-m-d H:I:S"
		Dim DateSecond
		DateSecond=Second(DateTime)
		If Len(DateHour)<2 Then DateHour="0"&DateHour	
		If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute&":"&DateSecond
	Case "YmdHIS"
		DateSecond=Second(DateTime)
		If Len(DateHour)<2 Then DateHour="0"&DateHour	
		If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
		DateToStr=Year(DateTime)&DateMonth&DateDay&DateHour&DateMinute&DateSecond	
	Case "ym"
		DateToStr=Right(Year(DateTime),2)&DateMonth
	Case "d"
		DateToStr=DateDay
	Case Else
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute
	End Select
End Function

Function IsValidEmail(Email) '检测是否有效的E-mail地址
	Dim names, name, i, c
	IsValidEmail = True
	Names = Split(email, "@")
	If UBound(names) <> 1 Then
   		IsValidEmail = False
   		Exit Function
	End If
	For Each name IN names
		If Len(name) <= 0 Then
     		IsValidEmail = False
     		Exit Function
   		End If
   		For i = 1 to Len(name)
     		c = Lcase(Mid(name, i, 1))
     		If InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 And Not IsNumeric(c) Then
       			IsValidEmail = false
       			Exit Function
     		End If
   		Next
   		If Left(name, 1) = "." or Right(name, 1) = "." Then
      		IsValidEmail = false
      		Exit Function
   		End If
	Next
	If InStr(names(1), ".") <= 0 Then
   		IsValidEmail = False
   		Exit Function
	End If
	i = Len(names(1)) - InStrRev(names(1), ".")
	If i <> 2 And i <> 3 Then
   		IsValidEmail = False
   		Exit Function
	End If
	If InStr(email, "..") > 0 Then
   		IsValidEmail = False
	End If
End Function

Function MultiPage(Numbers,Perpage,Curpage,Url_Add) '分页函数
	CurPage=Int(Curpage)
	Dim URL
	URL=Request.ServerVariables("Script_Name")&Url_Add
	MultiPage=""
	Dim Page,Offset,PageI
	If Int(Numbers)>Int(PerPage) Then
		Page=10
		Offset=2
		Dim Pages,FromPage,ToPage
		If Numbers Mod Cint(Perpage)=0 Then
			Pages=Int(Numbers/Perpage)
		Else
			Pages=Int(Numbers/Perpage)+1
		End If
		FromPage=Curpage-Offset
		ToPage=Curpage+Page-Offset-1
		If Page>Pages Then
			FromPage=1
			ToPage=Pages
		Else
			If FromPage<1 Then
				Topage=Curpage+1-FromPage
				FromPage=1
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then ToPage=Page
			ElseIF Topage>Pages Then
				FromPage =Curpage-Pages +ToPage
				ToPage=Pages
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then FromPage=Pages-Page+1
			End If
		End If
		MultiPage="Page: <a href="""&Url&"page=1""><img src=""images/icon_ar.gif"" border=""0"" align=""absmiddle"" /></a> "
		For PageI=FromPage TO ToPage
			If PageI<>CurPage Then
				MultiPage=MultiPage&"<a href="""&Url&"page="&PageI&""">"&PageI&"</a>&nbsp;&nbsp;"
			Else
				MultiPage=MultiPage&"<strong>["&PageI&"]</strong>&nbsp;&nbsp;"
			End If
		Next
		If Int(Pages)>Int(Page) Then
			MultiPage=MultiPage&" ... <a href="""&Url&"page="&Pages&""">"&pages&" <img src=""images/icon_al.gif"" border=""0"" align=""absmiddle"" /></a>&nbsp;&nbsp;<input type=""text"" name=""custompage"" size=""1"" class=""custompage"" onKeyDown=""javascript: if(window.event.keyCode == 13) window.location='"&Url&"page='+this.value;"">"
		Else
			MultiPage=MultiPage&" <a href="""&Url&"page="&Pages&"""><img src=""images/icon_al.gif"" border=""0"" align=""absmiddle"" /></a>"
		End If
	End If
End Function

Function MultiPage_l(Numbers,Perpage,Curpage,Url_Add) '列表模式分页函数
	CurPage=Int(Curpage)
	Dim URL
	URL=Request.ServerVariables("Script_Name")&Url_Add
	MultiPage_l=""
	Dim Page,Offset,PageI
	If Int(Numbers)>Int(PerPage) Then
		Page=10
		Offset=2
		Dim Pages,FromPage,ToPage
		If Numbers Mod Cint(Perpage)=0 Then
			Pages=Int(Numbers/Perpage)
		Else
			Pages=Int(Numbers/Perpage)+1
		End If
		FromPage=Curpage-Offset
		ToPage=Curpage+Page-Offset-1
		If Page>Pages Then
			FromPage=1
			ToPage=Pages
		Else
			If FromPage<1 Then
				Topage=Curpage+1-FromPage
				FromPage=1
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then ToPage=Page
			ElseIF Topage>Pages Then
				FromPage =Curpage-Pages +ToPage
				ToPage=Pages
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then FromPage=Pages-Page+1
			End If
		End If
		MultiPage_l="Page: <a href="""&Url&"sortBy="&sortBy&"&page=1""><img src=""images/icon_ar.gif"" border=""0"" align=""absmiddle"" /></a> "
		For PageI=FromPage TO ToPage
			If PageI<>CurPage Then
				MultiPage_l=MultiPage_l&"<a href="""&Url&"sortBy="&sortBy&"&page="&PageI&""">"&PageI&"</a>&nbsp;"
			Else
				MultiPage_l=MultiPage_l&"<strong>["&PageI&"]</strong>&nbsp;&nbsp;"
			End If
		Next
		If Int(Pages)>Int(Page) Then
			MultiPage_l=MultiPage_l&" ... <a href="""&Url&"sortBy="&sortBy&"&page="&Pages&""">"&pages&"<img src=""images/icon_al.gif"" border=""0"" align=""absmiddle"" /></a>&nbsp;&nbsp;<input type=""text"" name=""custompage"" size=""1"" class=""custompage"" onKeyDown=""javascript: if(window.event.keyCode == 13) window.location='"&Url&"sortBy="&sortBy&"&page='+this.value;"">"
		Else
			MultiPage_l=MultiPage_l&" <a href="""&Url&"sortBy="&sortBy&"&page="&Pages&"""><img src=""images/icon_al.gif"" border=""0"" align=""absmiddle"" /></a>"
		End If
	End If
End Function

Function SplitLines(byVal Content,byVal ContentNums) '切割内容
	Dim ts,i,l
	If IsNull(Content) Then Exit Function
	i=1
	ts = 0
	For i=1 to Len(Content)
      	l=Mid(Content,i,4)
      	If l="<br>" Then
         	ts=ts+1
      	End If
      	If ts>ContentNums Then Exit For 
	Next
	If ts>ContentNums Then
    	Content=Left(Content,i-1)
	End If
	SplitLines=Content
End Function

Function Generator(Length)
	Dim i, tempS
	tempS = "abcdefghijklmnopqrstuvwxyz1234567890" 
	Generator = ""
	If isNumeric(Length) = False Then 
		Exit Function 
	End If 
	For i = 1 to Length 
		Randomize Timer
		Generator = Generator & Mid(tempS,Int((Len(tempS) * Rnd) + 1),1)
	Next 
End Function 

Function CutStr(byVal Str,byVal StrLen)
	Dim l,t,c,i
	l=Len(str)
	t=0
	For i=1 To l
		c=AscW(Mid(str,i,1))
		If c<0 Or c>255 Then t=t+2 Else t=t+1
		IF t>=StrLen Then
			CutStr=left(Str,i)&"..."
			Exit For
		Else
			CutStr=Str
		End If
	Next
End Function

Function Trackback(byVal trackback_url,byVal url,byVal title,byVal excerpt,byVal blog_name) 
	Dim query_string, objXMLHTTP, objDOM
	title = Server.URLEncode(cutStr(title,100))
	excerpt = Server.URLEncode(CutStr(excerpt, 252))
	url = Server.URLEncode(url)
	blog_name = Server.URLEncode(blog_name)
	query_string = "title="&title&"&url="&url&"&blog_name="&blog_name&"&excerpt="&excerpt

	Set objXMLHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
	Set objDom = Server.CreateObject("Microsoft.XMLDOM")

	objXMLHTTP.Open "POST", trackback_url, False
	objXMLHTTP.setRequestHeader "Content-Type","application/x-www-form-urlencoded"

	On Error Resume Next
	
	objXMLHTTP.Send query_string

	If objXMLHTTP.readyState <> 4 Then
		objXMLHTTP.waitForResponse 15
	End If

	If Err.Number <> 0 Then
		Trackback	=  "0$$TrackBack 错误：无法连接服务器"
	Else
		If (objXMLHTTP.readyState <> 4) Or (objXMLHTTP.Status <> 200) Then
			objXMLHTTP.Abort
			Trackback	= "0$$Trackback 错误：超时"
		Else
			objDom.async=False
			objDom.loadXML(objXMLHTTP.ResponseText) 
			If objDom.parseError.errorCode <> 0 Then
				Trackback	= "0$$TrackBack 错误：响应解析错误"
			Else
				If objDom.getElementsByTagName("error")(0).Text="0" Then
					Trackback	= "1$$Trackback 成功"
				Else
					Trackback	= "0$$Trackback 错误："&objDom.getElementsByTagName("message")(0).Text
				End If
			End If
		End If
	End If

	Set objXMLHTTP = Nothing
	Set objDom = Nothing
End Function

Function DelQuote(strContent)
	If IsNull(strContent) Then Exit Function
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(\[quote\])(.*?)(\[\/quote\])"
	strContent= re.Replace(strContent,"")
	re.Pattern="(\[code\])(.*?)(\[\/code\])"
	strContent= re.Replace(strContent,"")
	Set re=Nothing
	DelQuote=strContent
End Function

Function DelUbb(byVal strContent)
	Dim re
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\[)([^\]]*?)(\])"
	strContent=re.Replace(strContent,"")
	set re=nothing
	DelUbb=Trim(strContent)
End Function

Sub CheckPost
	Dim ServerA,ServerB
	ServerA = CStr(Request.ServerVariables("HTTP_REFERER"))
	ServerB = CStr(Request.ServerVariables("SERVER_NAME"))
	If Mid(ServerA,8,Len(ServerB))<>ServerB Then
		Response.Redirect "posterror.htm"
		Response.End
	End If
End Sub

Function RFC822_Date(byVal myDate, byVal TimeZone)
	Dim myDay, myDays, myMonth, myYear
	Dim myHours, myMinutes, mySeconds
	  
	myDate = CDate(myDate)
	myDay = EnWeekDayName(myDate)
	myDays = Right("00" & Day(myDate),2)
	myMonth = EnMonthName(myDate)
	myYear = Year(myDate)
	myHours = Right("00" & Hour(myDate),2)
	myMinutes = Right("00" & Minute(myDate),2)
	mySeconds = Right("00" & Second(myDate),2)
	  
	
	RFC822_Date = myDay&", "& _
	myDays&" "& _
	myMonth&" "& _ 
	myYear&" "& _
	myHours&":"& _
	myMinutes&":"& _
	mySeconds&" "& _ 
	" " & TimeZone
End Function

Function EnWeekDayName(InputDate)
	Dim Result
	Select Case WeekDay(InputDate,1)
		Case 1:Result="Sun"
		Case 2:Result="Mon"
		Case 3:Result="Tue"
		Case 4:Result="Wed"
		Case 5:Result="Thu"
		Case 6:Result="Fri"
		Case 7:Result="Sat"
	End Select
	EnWeekDayName = Result
End Function

Function EnMonthName(InputDate)
	Dim Result
	Select Case Month(InputDate)
		Case 1:Result="Jan"
		Case 2:Result="Feb"
		Case 3:Result="Mar"
		Case 4:Result="Apr"
		Case 5:Result="May"
		Case 6:Result="Jun"
		Case 7:Result="Jul"
		Case 8:Result="Aug"
		Case 9:Result="Sep"
		Case 10:Result="Oct"
		Case 11:Result="Nov"
		Case 12:Result="Dec"
	End Select
	EnMonthName = Result
End Function

Function AspUNHtml(blog_id)
dim strUrl,Item_Classid,id,FileName,FilePath,Do_Url,Html_Temp
'Html_Temp="<UL>"
'For i=180 To 182
'Html_Temp = Html_Temp&"<LI>"
Item_Classid = blog_id
FileName = "GuoBlog"&Item_Classid&".htm"
FilePath = Server.MapPath("/")&"\"&FileName
Html_Temp = Html_Temp&FilePath&"</LI>"
Do_Url = "http://"
Do_Url = Do_Url&Request.ServerVariables("SERVER_NAME")&"/blogview.asp"
Do_Url = Do_Url&"?logid="&Item_Classid

response.write do_url
strUrl = Do_Url
dim objXmlHttp
set objXmlHttp = Server.CreateObject("Microsoft.XMLHTTP")
objXmlHttp.open "GET",strUrl,false
objXmlHttp.send()
Dim binFileData
binFileData = objXmlHttp.responseBody
Dim objAdoStream
set objAdoStream = Server.CreateObject("ADODB.Stream")
objAdoStream.Type = 1
objAdoStream.Open()
'objAdoStream.Write(binFileData)
objAdoStream.SaveToFile FilePath,2 
objAdoStream.Close()

'Next
'AspUNHtml=FileName
End Function

Function FixName(UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	FixName = Ucase(UpFileExt)
	FixName = Replace(FixName,Chr(0),"")
	FixName = Replace(FixName,".","")
	FixName = Replace(FixName,"ASP","")
	FixName = Replace(FixName,"ASA","")
	FixName = Replace(FixName,"ASPX","")
	FixName = Replace(FixName,"CER","")
	FixName = Replace(FixName,"CDX","")
	FixName = Replace(FixName,"HTR","")
End Function
%>