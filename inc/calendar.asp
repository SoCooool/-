<%Sub Calendar(C_Year,C_Month,C_Day)  'BLOG日历
	ReDim Link_Days(2,0)
	Dim Link_Count
	Link_Count=0
	Dim This_Year,This_Month,This_Day,RS_Month,Link_TF
	IF C_Year=Empty Then C_Year=Year(Now())
	IF C_Month=Empty Then C_Month=Month(Now())
	IF C_Day=Empty Then C_Day=0
	C_Year=Cint(C_Year)
	C_Month=Cint(C_Month)
	C_Day=Cint(C_Day)
	This_Year=C_Year
	This_Month=C_Month
	This_Day=C_Day
	Dim To_Day,To_Month,To_Year
	To_Day=Cint(Day(Now()))
	To_Month=Cint(Month(Now()))
	To_Year=Cint(Year(Now()))
	
	SQL="SELECT log_PostYear,log_PostMonth,log_PostDay FROM blog_Content WHERE log_PostYear="&C_Year&" AND log_PostMonth="&C_Month&" ORDER BY log_PostDay"
	Set RS_Month=Server.CreateObject("ADODB.RecordSet")
	RS_Month.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	Dim the_Day
	the_Day=0
	Do While NOT RS_Month.EOF
		IF RS_Month("log_PostDay")<>the_Day Then
			the_Day=RS_Month("log_PostDay")
			ReDim PreServe Link_Days(2,Link_Count)
			Link_Days(0,Link_Count)=RS_Month("log_PostMonth")
			Link_Days(1,Link_Count)=RS_Month("log_PostDay")
			Link_Days(2,Link_Count)="blog.asp?log_Year="&RS_Month("log_PostYear")&"&log_Month="&RS_Month("log_PostMonth")&"&log_Day="&RS_Month("log_PostDay")
			Link_Count=Link_Count+1
		End IF
		RS_Month.MoveNext
	Loop
	RS_Month.Close
	Set RS_Month=Nothing
	
	Dim Month_Name(12)
	Month_Name(0)=""
	Month_Name(1)="1"
	Month_Name(2)="2"
	Month_Name(3)="3"
	Month_Name(4)="4"
	Month_Name(5)="5"
	Month_Name(6)="6"
	Month_Name(7)="7"
	Month_Name(8)="8"
	Month_Name(9)="9"
	Month_Name(10)="10"
	Month_Name(11)="11"
	Month_Name(12)="12"
	
	Dim Month_Days(12)
	Month_Days(0)=""
	Month_Days(1)=31
	Month_Days(2)=28
	Month_Days(3)=31
	Month_Days(4)=30
	Month_Days(5)=31
	Month_Days(6)=30
	Month_Days(7)=31
	Month_Days(8)=31
	Month_Days(9)=30
	Month_Days(10)=31
	Month_Days(11)=30
	Month_Days(12)=31
	
	If IsDate("February 29, " & This_Year) Then Month_Days(2)=29
	
	Dim Start_Week
	Start_Week=WeekDay(C_Month&"-1-"&C_Year)-1
	
	Dim Next_Month,Next_Year,Pro_Month,Pro_Year
	Next_Month=C_Month+1
	Next_Year=C_Year
	IF Next_Month>12 then 
		Next_Month=1
		Next_Year=Next_Year+1
	End IF
	Pro_Month=C_Month-1
	Pro_Year=C_Year
	IF Pro_Month<1 then 
		Pro_Month=12
		Pro_Year=Pro_Year-1
	End IF
	
	Response.Write("<p><div class=""calendar_head""><span class=""gaoliang"">日历</span> "&C_Year&"/"&Month_Name(C_Month)&"/"&To_Day&"</div>")
	Response.Write("<div class=""calendar_main"">")
	Response.Write("<table width=""100%"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""2"" background=""images/calendar/month"&Month_Name(C_Month)&".gif"">")
	Response.Write("<tr class=""calendar_week"">")
	Response.Write("<td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr><tr>")
	Dim i,j,k,l,m
	For  i=0 TO Start_Week-1
		Response.Write("<td></td>")
	Next
	Dim This_BGColor
	j=1
	While j<=month_Days(This_Month)
	 	For k=start_Week To 6
			This_BGColor="calendar"
			IF j=To_Day AND This_Year=To_Year AND This_Month=To_Month Then This_BGColor="calendar_today"
			IF j=This_Day Then This_BGColor="calendar_thisday"
			Response.Write("<td class="""&This_BGColor&""">")
			Link_TF="Flase"
			For l=0 TO Ubound(Link_Days,2)
				IF Link_Days(0,l)<>"" Then
					IF Link_Days(0,l)=This_Month AND Link_Days(1,l)=j Then
						Response.Write("<a href="""&Link_Days(2,l)&""">")
						Link_TF="True"
					End IF
				End IF
			Next
		IF j<=Month_Days(This_Month) Then Response.Write(j)
		IF Link_TF="True" Then Response.Write("</a>")
        Response.Write("</td>")
		j=j+1
	Next
	Start_Week=0
	Response.Write("</tr>")
	Wend
	Response.Write("</table></div>")
	Response.Write("<div class=""calendar_bottom""><a href=""blog.asp?log_Year="&C_Year-1&""" title=""Previous year""><<</a>&nbsp;Year&nbsp;<a href=""blog.asp?log_Year="&C_Year+1&""" title=""Next year"">>></a>&nbsp;<a href=""blog.asp?log_Year="&Pro_Year&"&log_Month="&Pro_Month&""" title=""Previous Month""><</a>&nbsp;Month&nbsp;<a href=""blog.asp?log_Year="&Next_Year&"&log_Month="&Next_Month&""" title=""Next Month"">></a></div></p>")
End Sub%>