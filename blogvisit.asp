<!--#include file="inc/inc_syssite.asp" -->
<%Dim siteText
	siteText = "访问统计"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<div id="default">
<div id="default_bg">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td width="182" rowspan="2" valign="top" nowrap class="siderbar">
	<div class="siderbar_head" align="center">访问统计</div>
	<div class="siderbar_main" align="center">
		<p>&nbsp;</p>
		<p><a href="blogvisit.asp">[ 基本概况 ]</a></p>
		<p>&nbsp;</p>
		<p><a href="blogvisit.asp?type=week">[ 星期流量 ]</a></p>
		<p>&nbsp;</p>
		<p><a href="blogvisit.asp?type=hour">[ 时段流量 ]</a></p>
		<p>&nbsp;</p>
		<p><a href="blogvisit.asp?type=agent">[ 客户软件 ]</a></p>
		<p>&nbsp;</p>
	</div>
	</td>
  </tr>
      <tr><td width="100%" bgcolor="#FFFFFF" align="center">
	 <%Dim viewType,IMGWidth,IMGCount
	viewType=Trim(Request.QueryString("type"))
	If viewType="week" Then%>
	<div align="left"><b>星期流量</b>：
	  <table width="100%" border="0" cellpadding="0" cellspacing="4">
	  <%Dim vWeek,maxWeek,vWeek_Title,vWeek_Nums
	  IMGCount=0
	  maxWeek=Conn.ExeCute("SELECT TOP 1 coun_Char,coun_Nums FROM blog_Counter WHERE coun_Type='Week' ORDER BY coun_Nums DESC")
	  Set vWeek=Server.CreateObject("ADODB.Recordset")
	  SQL="SELECT * FROM blog_Counter WHERE coun_Type='Week' ORDER BY coun_Char ASC"
	  vWeek.Open SQL,Conn,1,1
	  SQLQueryNums=SQLQueryNums+2
	  Do While Not vWeek.Eof
	  		vWeek_Title=vWeek("coun_Char")
			vWeek_Nums=vWeek("coun_Nums")
			Select Case vWeek_Title
			Case "0" : vWeek_Title="星期日"
			Case "1" : vWeek_Title="星期一"
			Case "2" : vWeek_Title="星期二"
			Case "3" : vWeek_Title="星期三"
			Case "4" : vWeek_Title="星期四"
			Case "5" : vWeek_Title="星期五"
			Case "6" : vWeek_Title="星期六"
			End Select
			Response.Write("<tr><td width=""12%"">")
	  		If vWeek("coun_Char")=maxWeek(0) Then
				Response.Write("<b>"&vWeek_Title&"</b>")
			Else
				Response.Write(vWeek_Title)
			End If
			IMGWidth=370*vWeek_Nums\maxWeek(1)
	  		Response.Write("</td><td width=""88%""><img src=""images/counter/bar"&IMGCount&".gif"" width="""&IMGWidth&""" height=""11"" align=""absmiddle"">&nbsp;"&vWeek_Nums&"&nbsp;("&FormatPercent(vWeek_Nums/eblog.setup(12,0))&")</td></tr>")
			If IMGCount=9 Then 
				IMGCount=0
			Else
				IMGCount=IMGCount+1
			End If
	  		vWeek.MoveNext
	  Loop
	  vWeek.Close
	  Set vWeek=Nothing%>
        </table>
	  </div>
	<%ElseIf viewType="hour" Then%>
	<div align="left"><b>时段流量</b>：
	<table width="100%" border="0" cellpadding="4" cellspacing="0">
	<%Dim vHour,maxHour,vHour_Title,vHour_Nums
	  IMGCount=0
	  maxHour=Conn.ExeCute("SELECT TOP 1 coun_Char,coun_Nums FROM blog_Counter WHERE coun_Type='Hour' ORDER BY coun_Nums DESC")
	  Set vHour=Server.CreateObject("ADODB.Recordset")
	  SQL="SELECT * FROM blog_Counter WHERE coun_Type='Hour' ORDER BY coun_Char ASC"
	  vHour.Open SQL,Conn,1,1
	  SQLQueryNums=SQLQueryNums+2
	  Do While Not vHour.Eof
	  		vHour_Title=vHour("coun_Char")
			vHour_Nums=vHour("coun_Nums")
			If CInt(vHour_Title)>12 Then 
				vHour_Title=CInt(vHour_Title)-12
				If Len(vHour_Title)<2 Then vHour_Title="0"&vHour_Title
				vHour_Title=vHour_Title&" PM"
			Else
				vHour_Title=vHour_Title&" AM"
			End If
			Response.Write("<tr><td width=""12%"">")
	  		If vHour("coun_Char")=maxHour(0) Then
				Response.Write("<b>"&vHour_Title&"</b>")
			Else
				Response.Write(vHour_Title)
			End If
			IMGWidth=370*vHour_Nums\maxHour(1)
	  		Response.Write("</td><td width=""88%""><img src=""images/counter/bar"&IMGCount&".gif"" width="""&IMGWidth&""" height=""11"" align=""absmiddle"">&nbsp;"&vHour_Nums&"&nbsp;("&FormatPercent(vHour_Nums/eblog.setup(12,0))&")</td></tr>")
			If IMGCount=9 Then 
				IMGCount=0
			Else
				IMGCount=IMGCount+1
			End If
	  		vHour.MoveNext
	  Loop
	  vHour.Close
	  Set vHour=Nothing%>
        </table></div>
	<%ElseIf viewType="agent" Then%>
		<div align="left"><b>操作系统</b>：
	<table width="100%" border="0" cellpadding="4" cellspacing="0">
	<%Dim vOS,maxOS,vOS_Title,vOS_Nums
	  IMGCount=0
	  maxOS=Conn.ExeCute("SELECT TOP 1 coun_Char,coun_Nums FROM blog_Counter WHERE coun_Type='OS' ORDER BY coun_Nums DESC")
	  Set vOS=Server.CreateObject("ADODB.Recordset")
	  SQL="SELECT * FROM blog_Counter WHERE coun_Type='OS' ORDER BY coun_Char ASC"
	  vOS.Open SQL,Conn,1,1
	  SQLQueryNums=SQLQueryNums+2
	  Do While Not vOS.Eof
	  		vOS_Title=vOS("coun_Char")
			vOS_Nums=vOS("coun_Nums")
			Response.Write("<tr><td width=""12%"">")
	  		If vOS("coun_Char")=maxOS(0) Then
				Response.Write("<b>"&vOS_Title&"</b>")
			Else
				Response.Write(vOS_Title)
			End If
			IMGWidth=370*vOS_Nums\maxOS(1)
	  		Response.Write("</td><td width=""88%""><img src=""images/counter/bar"&IMGCount&".gif"" width="""&IMGWidth&""" height=""11"" align=""absmiddle"">&nbsp;"&vOS_Nums&"&nbsp;("&FormatPercent(vOS_Nums/eblog.setup(12,0))&")</td></tr>")
			If IMGCount=9 Then 
				IMGCount=0
			Else
				IMGCount=IMGCount+1
			End If
	  		vOS.MoveNext
	  Loop
	  vOS.Close
	  Set vOS=Nothing%>
        </table></div><br><div align="left"><b>浏览器</b>：
	<table width="100%" border="0" cellpadding="4" cellspacing="0">
	<%Dim vBrowser,maxBrowser,vBrowser_Title,vBrowser_Nums
	  IMGCount=0
	  maxBrowser=Conn.ExeCute("SELECT TOP 1 coun_Char,coun_Nums FROM blog_Counter WHERE coun_Type='Browser' ORDER BY coun_Nums DESC")
	  Set vBrowser=Server.CreateObject("ADODB.Recordset")
	  SQL="SELECT * FROM blog_Counter WHERE coun_Type='Browser' ORDER BY coun_Char ASC"
	  vBrowser.Open SQL,Conn,1,1
	  SQLQueryNums=SQLQueryNums+2
	  Do While Not vBrowser.Eof
	  		vBrowser_Title=vBrowser("coun_Char")
			vBrowser_Nums=vBrowser("coun_Nums")
			Response.Write("<tr><td width=""12%"">")
	  		If vBrowser("coun_Char")=maxBrowser(0) Then
				Response.Write("<b>"&vBrowser_Title&"</b>")
			Else
				Response.Write(vBrowser_Title)
			End If
			IMGWidth=370*vBrowser_Nums\maxBrowser(1)
	  		Response.Write("</td><td width=""88%""><img src=""images/counter/bar"&IMGCount&".gif"" width="""&IMGWidth&""" height=""11"" align=""absmiddle"">&nbsp;"&vBrowser_Nums&"&nbsp;("&FormatPercent(vBrowser_Nums/eblog.setup(12,0))&")</td></tr>")
			If IMGCount=9 Then 
				IMGCount=0
			Else
				IMGCount=IMGCount+1
			End If
	  		vBrowser.MoveNext
	  Loop
	  vBrowser.Close
	  Set vBrowser=Nothing%>
        </table></div><%Else%>
      <div align="left"><b>站点统计</b>：<div style="font-size:12px;">
	  <table width="100%%"  border="0" cellspacing="0" cellpadding="4">
	  <tr>
		<td>日志：<%=""&eblog.setup(8,0)&""%>&nbsp;篇&nbsp;|&nbsp;评论：<%=""&eblog.setup(9,0)&""%>&nbsp;篇&nbsp;|&nbsp;引用：<%=""&eblog.setup(11,0)&""%>&nbsp;个&nbsp;|&nbsp;会员：<%=""&eblog.setup(10,0)&""%>&nbsp;人</td>
	  </tr>
	  <tr>
		<td>留言：<%=""&eblog.setup(15,0)&""%>&nbsp;个&nbsp;|&nbsp;访问：<%=""&eblog.setup(12,0)&""%>&nbsp;次&nbsp;|&nbsp;建立：<%=""&eblog.setup(3,0)&""%></td>
	  </tr>
	</table>
   <br><div class="ssmalltxt" align="left"><b>月份流量</b>：
      <table width="100%" border="0" cellpadding="4" cellspacing="0"><%Dim vMonth,maxMonth,vMonth_Title,vMonth_Nums
	  IMGCount=0
	  maxMonth=Conn.ExeCute("SELECT TOP 1 coun_Char,coun_Nums FROM blog_Counter WHERE coun_Type='Month' ORDER BY coun_Nums DESC")
	  Set vMonth=Server.CreateObject("ADODB.Recordset")
	  SQL="SELECT * FROM blog_Counter WHERE coun_Type='Month' ORDER BY coun_Char ASC"
	  vMonth.Open SQL,Conn,1,1
	  SQLQueryNums=SQLQueryNums+2
	  Do While Not vMonth.Eof
	  		vMonth_Title=vMonth("coun_Char")
			vMonth_Nums=vMonth("coun_Nums")
			vMonth_Title=Left(vMonth_Title,4)&"&nbsp;-&nbsp;"&Right(vMonth_Title,2)
			Response.Write("<tr><td width=""15%"">")
	  		If vMonth("coun_Char")=maxMonth(0) Then
				Response.Write("<b>"&vMonth_Title&"</b>")
			Else
				Response.Write(vMonth_Title)
			End If
			IMGWidth=370*vMonth_Nums\maxMonth(1)
	  		Response.Write("</td><td width=""88%"">&nbsp;<img src=""images/counter/bar"&IMGCount&".gif"" width="""&IMGWidth&""" height=""11"" align=""absmiddle"">&nbsp;"&vMonth_Nums&"&nbsp;("&FormatPercent(vMonth_Nums/eblog.setup(12,0))&")</td></tr>")
			If IMGCount=9 Then 
				IMGCount=0
			Else
				IMGCount=IMGCount+1
			End If
	  		vMonth.MoveNext
	  Loop
	  vMonth.Close
	  Set vMonth=Nothing%>
        </table></div><%End If%></div></td>
      </tr>
	</table>
</div>
</div>
<!--#include file="footer.asp" -->