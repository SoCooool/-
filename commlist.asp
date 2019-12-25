<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="header.asp" -->
<div id="default_main">
      <h4><%Dim CurPage,Url_Add
	  IF CheckStr(Request.QueryString("Page"))<>Empty Then
		  Curpage=CheckStr(Request.QueryString("Page"))
		  IF IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
	  Else
		  Curpage=1
	  End IF
	  Dim commMemName,commSearch,memSQL
	  commMemName=CheckStr(Request.QueryString("memName"))
	  commSearch=CheckStr(Request.QueryString("SearchContent"))
	  IF commMemName<>Empty Then
		memSQL="SELECT C.*,L.log_Author,L.log_Title,L.log_IsShow FROM blog_Comment AS C,blog_Content AS L WHERE C.comm_Author='"&commMemName&"' AND L.log_ID=C.blog_ID ORDER BY comm_ID DESC"
	  	Response.Write(commMemName&" 所发表的评论")
	  	Url_Add="?memName="&Server.URLEncode(commMemName)&"&"
	  ElseIF commSearch<>Empty Then
	  	memSQL="SELECT C.*,L.log_Author,L.log_Title,L.log_IsShow FROM blog_Comment AS C,blog_Content AS L WHERE L.log_ID=C.blog_ID AND C.comm_Content LIKE '%"&commSearch&"%' ORDER BY comm_ID DESC"
	  	Response.Write("你所搜索的评论")
	  	Url_Add="?SearchContent="&Server.URLEncode(commSearch)&"&"
	  Else
		memSQL="SELECT C.*,L.log_Author,L.log_Title,L.log_IsShow FROM blog_Comment AS C,blog_Content AS L WHERE L.log_ID=C.blog_ID ORDER BY comm_ID DESC"
	  	Url_Add="?"
	  	Response.Write("所有评论")
	  End IF%>
    </h4><br />
	<%Dim comm_List
		Set comm_List=Server.CreateObject("ADODB.Recordset")
		comm_List.Open memSQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		IF comm_List.EOF AND comm_List.BOF Then
			Response.Write("<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#b6d8e0""><tr bgcolor=""#FFFFFF""><td>暂时没有任何评论！</td></tr></table>")
		Else
			comm_List.PageSize=8
			comm_List.AbsolutePage=CurPage
			Dim comm_Num,MultiPages,PageCount
			comm_Num=comm_List.RecordCount
			MultiPages=""&MultiPage(comm_Num,8,CurPage,Url_Add)&""
			Response.Write(MultiPages)	
			Response.Write("<table width=""100%"" border=""0"" cellpadding=""2"" cellspacing=""0"" class=""wordbreak""><tr><td>")
			Do Until comm_List.EOF OR PageCount=8
				Response.Write("<fieldset class=fieldset><legend class=legend>&nbsp;<b><a href=""member.asp?action=view&memName="&comm_List("comm_Author")&""">"&comm_List("comm_Author")&"</a> 于 "&DateToStr(comm_List("comm_PostTime"),"Y-m-d H:I A")&" 发表评论：</b>")
				IF (memStatus="7" AND memName=comm_List("log_Author")) OR memStatus="8" Then
					Response.Write("&nbsp;<a href=""blogcomm.asp?action=delecomm&logID="&comm_List("blog_ID")&"&commID="&comm_List("comm_ID")&""" title=""删除评论"" onClick=""winconfirm('你真的要删除这个评论吗？','blogcomm.asp?action=delecomm&logID="&comm_List("blog_ID")&"&commID="&comm_List("comm_ID")&"'); return false""><b><font color=""#FF0000"">×</font></b></a>&nbsp;|&nbsp;<a href=""http://whois.pconline.com.cn/whois/?ip="&comm_List("comm_PostIP")&""" title=""点击查看IP地址："&comm_List("comm_PostIP")&" 的来源"" target=""_blank"">IP</a>")
				End IF
				Response.Write("&nbsp;</legend><img name=""HideImage"" src="""" width=""2"" height=""6"" alt="""" style=""background-color: #FFFFFF""><br>")
			
				Response.Write("<table class=""wordbreak""><tr><td>")
				IF comm_List("log_IsShow")=False Then
					'修正管理员不能查看隐藏评论2005/04/23
					If memStatus="8" OR memStatus="7" OR memName=comm_List("comm_Author") Then
						Response.Write(UbbCode(HTMLEncode(comm_List("comm_Content")),comm_List("comm_DisSM"),comm_List("comm_DisUBB"),comm_List("comm_DisIMG"),comm_List("comm_AutoURL"),comm_List("comm_AutoKEY")))
					Else
						Response.Write("<font color=""red"">隐藏日志的评论</font>")
					End If
				Else
					If comm_List("comm_Hide")= 0 OR (memStatus="8" OR memStatus="7" OR memName=comm_List("comm_Author")) Then'评论隐藏/2005/01/19
						Response.Write(UbbCode(HTMLEncode(comm_List("comm_Content")),comm_List("comm_DisSM"),comm_List("comm_DisUBB"),comm_List("comm_DisIMG"),comm_List("comm_AutoURL"),comm_List("comm_AutoKEY")))
					Else
						Response.Write("<font color=red>给管理员的悄悄话,你无权查看!</font>")
					End If
				End IF
				Response.Write("</td></tr></table><img name=""HideImage"" src="""" width=""2"" height=""9"" alt="""" style=""background-color: #FFFFFF""><div align=""right""><a href=""blogview.asp?logID="&comm_List("blog_ID")&""">查看所评论的日志："&comm_List("log_Title")&"</a></div></fieldset><br><img name=""HideImage"" src="""" width=""2"" height=""9"" alt="""" style=""background-color: #FFFFFF""><br>")
				comm_List.MoveNext
				PageCount=PageCount+1
			Loop
			Response.Write("</td></tr></table>")
			Response.Write(MultiPages)	
		End IF
		comm_List.Close
		Set comm_List=Nothing
		%>
	</div>
</div>
<!--#include file="footer.asp" -->