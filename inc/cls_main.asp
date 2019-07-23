<%
Dim blog_Infos,perpage,Setting,Adm_UP_FileSize,Adm_UP_FileType,Mem_UP_FileSize,Mem_UP_FileType,MemCanUP
Set blog_Infos=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM blog_Info"
blog_Infos.Open SQL,Conn,1,1
SQLQueryNums=SQLQueryNums+1
If blog_Infos.EOF And blog_Infos.BOF Then
	Response.Write("站点出错，请检查数据库中的站点基本信息设置……")
	Response.End
Else
	perpage=Split(blog_Infos("blog_PerPage"),"|")
	Dim blogpage,listblogpage,guestbookbpage,downloadpage,coolsitepage,photopage,photoCommpage,commentpage,userpage
	blogpage=cint(perpage(0))
	listblogpage=cint(perpage(1))
	guestbookbpage=cint(perpage(2))
	downloadpage=cint(perpage(3))
	coolsitepage=cint(perpage(4))
	photopage=cint(perpage(5))
	commentpage=cint(perpage(6))
	photoCommpage=cint(perpage(7))
	userpage=cint(perpage(8))
	Setting=Split(blog_Infos("blog_Setting"),"|")
	Dim topwlog,topcomment,topphoto_comm
	topwlog=cint(Setting(7))
	topcomment=cint(Setting(8))
	topphoto_comm=cint(Setting(9))
	Adm_UP_FileSize=blog_Infos("blog_UP_FileSize")
	Adm_UP_FileType=blog_Infos("blog_UP_FileTypes")
	Mem_UP_FileSize=blog_Infos("blog_UP_Mem_FileSize")
	Mem_UP_FileType=blog_Infos("blog_UP_Mem_FileTypes")
	MemCanUP=blog_Infos("blog_UP_MemCanUP")
End If
blog_Infos.Close
Set blog_Infos=Nothing

Dim Guest_IP
Guest_IP=Replace(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),"'","")
If Guest_IP=Empty Then Guest_IP=Replace(Request.ServerVariables("REMOTE_ADDR"),"'","")

'站点统计代码
If Session("GuestIP")<>Guest_IP Then
	Dim Guest_Agent,Guest_Month,Guest_Week,Guest_Hour,Guest_OS,Guest_Browser
	Guest_Agent=Trim(Request.ServerVariables("HTTP_USER_AGENT"))
	Guest_Month=Month(Now())
	If Len(Guest_Month)<2 Then 
		Guest_Month=Year(Now())&"0"&Guest_Month
	Else
		Guest_Month=Year(Now())&Guest_Month
	End If
	Guest_Week=WeekDay(Now())-1
	Guest_Hour=Hour(Now())
	If Len(Guest_Hour)<2 Then Guest_Hour="0"&Guest_Hour
	If InStr(Guest_Agent,"Win") Then
		Guest_OS="Windows"
	ElseIf InStr(Guest_Agent,"Mac") Then
		Guest_OS="Mac"
	ElseIf InStr(Guest_Agent,"Linux") Then
		Guest_OS="Linux"
	ElseIf InStr(Guest_Agent,"FreeBSD") Then
		Guest_OS="FreeBSD"
	ElseIf InStr(Guest_Agent,"SunOS") Then
		Guest_OS="SunOS"
	ElseIf InStr(Guest_Agent,"BeOS") Then
		Guest_OS="BeOS"
	ElseIf InStr(Guest_Agent,"OS/2") Then
		Guest_OS="OS/2"
	ElseIf InStr(Guest_Agent,"AIX") Then
		Guest_OS="AIX"
	ElseIf InStr(Guest_Agent,"search") Or InStr(Guest_Agent,"Spider") Or InStr(Guest_Agent,"Googlebot") Then
		Guest_OS="Search"
	Else
		Guest_OS="Other"
	End If
	If InStr(Guest_Agent,"Maxthon") Or InStr(Guest_Agent,"MyIE") Then
		Guest_Browser="Maxthon"
	ElseIf InStr(Guest_Agent,"MSIE") Then
		Guest_Browser="MSIE"
	ElseIf InStr(Guest_Agent,"Netscape") Then
		Guest_Browser="Netscape"
	ElseIf InStr(Guest_Agent,"Konqueror") Then
		Guest_Browser="Konqueror"
	ElseIf InStr(Guest_Agent,"Firefox") Then
		Guest_Browser="Firefox"
	ElseIf InStr(Guest_Agent,"search") Or InStr(Guest_Agent,"Spider") Or InStr(Guest_Agent,"Googlebot") Then
		Guest_Browser="Search"
	ElseIf InStr(Guest_Agent,"Reader") Or InStr(Guest_Agent,"FeedDemon") Then
		Guest_Browser="RSSReader"
	Else
		Guest_Browser="Other"
	End If
	If Conn.ExeCute("SELECT COUNT(coun_Char) FROM blog_Counter WHERE coun_Type='Month' AND coun_Char='"&Guest_Month&"'")(0)=0 Then
		Conn.ExeCute("INSERT INTO blog_Counter(coun_Type,coun_Char,coun_Nums) VALUES ('Month','"&Guest_Month&"',0)")
		SQLQueryNums=SQLQueryNums+1
	End If
	Conn.ExeCute("UPDATE blog_Counter SET coun_Nums=coun_Nums+1 WHERE (coun_Type='OS' AND coun_Char='"&Guest_OS&"') OR (coun_Type='Browser' AND coun_Char='"&Guest_Browser&"') OR (coun_Type='Week' AND coun_Char='"&Guest_Week&"') OR (coun_Type='Hour' AND coun_Char='"&Guest_Hour&"') OR (coun_Type='Month' AND coun_Char='"&Guest_Month&"')")
	Conn.ExeCute("UPDATE blog_Info SET blog_VisitBaseNums=blog_VisitBaseNums+1")
	SQLQueryNums=SQLQueryNums+3
	Session("GuestIP")=Guest_IP
End If

Dim memName,memPassword,memStatus,memRegTime
memName=CheckStr(eblog.DecodeCookie(Request.Cookies(CookieName)("memName")))
memPassword=CheckStr(eblog.DecodeCookie(Request.Cookies(CookieName)("memPassword")))
memStatus=CheckStr(eblog.DecodeCookie(Request.Cookies(CookieName)("memStatus")))
memRegTime=Now()

If memName<>Empty Then
	Dim CheckCookie
	Set CheckCookie=Server.CreateObject("ADODB.RecordSet")
	SQL="SELECT mem_LastIP,mem_RegTime FROM blog_Member WHERE mem_Name='"&memName&"' AND mem_Password='"&memPassword&"' AND mem_Status="&memStatus&""
	CheckCookie.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	If CheckCookie.EOF AND CheckCookie.BOF Then
		Response.Cookies(CookieName)("memName")=""
		memName=Empty
		Response.Cookies(CookieName)("memPassword")=""
		memPassword=Empty
		Response.Cookies(CookieName)("memStatus")=""
		memStatus=Empty
	Else
		If CheckCookie("mem_LastIP")<>Guest_IP Or isNull(CheckCookie("mem_LastIP")) Then
			Response.Cookies(CookieName)("memName")=""
			memName=Empty
			Response.Cookies(CookieName)("memPassword")=""
			memPassword=Empty
			Response.Cookies(CookieName)("memStatus")=""
			memStatus=Empty
		Else
			memRegTime=CheckCookie("mem_RegTime")
		End If
	End If
	CheckCookie.Close
	Set CheckCookie=Nothing
Else
	Response.Cookies(CookieName)("memName")=""
	memName=Empty
	Response.Cookies(CookieName)("memPassword")=""
	memPassword=Empty
	Response.Cookies(CookieName)("memStatus")=""
	memStatus=Empty
End If

'写入日志分类
Dim Arr_Category
If Not IsArray(Application(CookieName&"_blog_Category")) Then
	Dim log_CategoryList
	Set log_CategoryList=Server.CreateObject("ADODB.RecordSet")
	SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM blog_Category ORDER BY cate_Order ASC"
	log_CategoryList.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	If log_CategoryList.EOF And log_CategoryList.BOF Then
		Redim Arr_Category(3,0)
	Else
		Arr_Category=log_CategoryList.GetRows
	End If
	log_CategoryList.Close
	Set log_CategoryList=Nothing
	Application.Lock
	Application(CookieName&"_blog_Category")=Arr_Category
	Application.UnLock
Else
	Arr_Category=Application(CookieName&"_blog_Category")
End IF

'写入表情符号
Dim Arr_Smilies
If Not IsArray(Application(CookieName&"_blog_Smilies")) Then
	Dim log_SmiliesList
	Set log_SmiliesList=Server.CreateObject("ADODB.RecordSet")
	SQL="SELECT sm_ID,sm_Image,sm_Text FROM blog_Smilies ORDER BY sm_ID ASC"
	log_SmiliesList.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	If log_SmiliesList.EOF And log_SmiliesList.BOF Then
		Redim Arr_Smilies(3,0)
	Else
		Arr_Smilies=log_SmiliesList.GetRows
	End If
	log_SmiliesList.Close
	Set log_SmiliesList=Nothing
	Application.Lock
	Application(CookieName&"_blog_Smilies")=Arr_Smilies
	Application.UnLock
Else
	Arr_Smilies=Application(CookieName&"_blog_Smilies")
End If

'写入关键字列表
Dim Arr_Keywords
If Not IsArray(Application(CookieName&"_blog_Keywords")) Then
	Dim log_KeywordsList
	Set log_KeywordsList=Server.CreateObject("ADODB.RecordSet")
	SQL="SELECT key_ID,key_Text,key_URL,key_Image FROM blog_Keywords ORDER BY key_ID ASC"
	log_KeywordsList.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	If log_KeywordsList.EOF And log_KeywordsList.BOF Then
		Redim Arr_Keywords(3,0)
	Else
		Arr_Keywords=log_KeywordsList.GetRows
	End If
	log_KeywordsList.Close
	Set log_KeywordsList=Nothing
	Application.Lock
	Application(CookieName&"_blog_Keywords")=Arr_Keywords
	Application.UnLock
Else
	Arr_Keywords=Application(CookieName&"_blog_Keywords")
End If
%>