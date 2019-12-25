<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="header.asp" -->
<div id="default_main">
<h4>引用列表</h4>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<%Dim CurPage,Url_Add,memSQL
	  IF CheckStr(Request.QueryString("Page"))<>Empty Then
		  Curpage=CheckStr(Request.QueryString("Page"))
		  IF IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
	  Else
		  Curpage=1
	  End IF
	  memSQL="SELECT T.*,L.log_Author,L.log_Title,L.log_IsShow FROM blog_Trackback AS T,blog_Content AS L WHERE L.log_ID=T.blog_ID ORDER BY tb_PostTime DESC"
	  Url_Add="?"%>
    <td valign="top" bgcolor="#FFFFFF">
	<%Dim tb_List
		Set tb_List=Server.CreateObject("ADODB.Recordset")
		tb_List.Open memSQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		IF tb_List.EOF AND tb_List.BOF Then
			Response.Write("<table width=""98%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#b6d8e0""><tr bgcolor=""#FFFFFF""><td>暂时没有任何引用！</td></tr></table>")
		Else
			tb_List.PageSize=8
			tb_List.AbsolutePage=CurPage
			Dim tb_Num,MultiPages,PageCount
			tb_Num=tb_List.RecordCount
			MultiPages=""&MultiPage(tb_Num,8,CurPage,Url_Add)&""
			Response.Write(MultiPages)	
			Response.Write("<table width=""100%"" border=""0"" cellpadding=""2"" cellspacing=""0"" class=""wordbreak""><tr><td>")
			Do Until tb_List.EOF OR PageCount=8
				Response.Write("<fieldset align=""center"" style=""width:98%; padding:6px;border: 1px solid #b6d8e0;""><legend style=""background: #b6d8e0;padding:2px;"">&nbsp;<b>引用通告：<a href="""&tb_List("tb_URL")&""" target=""_blank"">"&HTMLEncode(tb_List("tb_Site"))&"</a> 于 "&DateToStr(tb_List("tb_PostTime"),"Y-m-d H:I A")&"</b>")
				IF (memStatus="Admin" AND memName=tb_List("log_Author")) OR memStatus="SupAdmin" Then
					Response.Write("&nbsp;<a href=""trackback.asp?action=deltb&logID="&tb_List("blog_ID")&"&tbID="&tb_List("tb_ID")&""" title=""删除引用"" onClick=""winconfirm('你真的要删除这个引用吗？','trackback.asp?action=deltb&logID="&tb_List("blog_ID")&"&tbID="&tb_List("tb_ID")&"'); return false""><b><font color=""#FF0000"">×</font></b></a>")
				End IF
				Response.Write("&nbsp;</legend><img name=""HideImage"" src="""" width=""2"" height=""6"" alt="""" style=""background-color: #FFFFFF"" border=""0""><br><table class=""wordbreak""><tr><td>")
				IF tb_List("log_IsShow")=False Then
					Response.Write("<font color=""red"">隐藏日志的引用</font>")
				Else
					Response.Write("标题："&HTMLEncode(tb_List("tb_Title"))&"<br>链接：<a href="""&HTMLEncode(tb_List("tb_URL"))&""" target=""_blank"">"&HTMLEncode(tb_List("tb_URL"))&"</a><br>摘要："&HTMLEncode(tb_List("tb_Intro")))
				End IF
				Response.Write("</td></tr></table><img name=""HideImage"" src="""" width=""2"" height=""9"" alt="""" style=""background-color: #FFFFFF"" border=""0""><div align=""right""><a href=""blogview.asp?logID="&tb_List("blog_ID")&""">查看所引用的日志："&tb_List("log_Title")&"</a></div></fieldset><br><img name=""HideImage"" src="""" width=""2"" height=""9"" alt="""" style=""background-color: #FFFFFF"" border=""0""><br>")
				tb_List.MoveNext
				PageCount=PageCount+1
			Loop
			Response.Write("</td></tr></table>")
			Response.Write(MultiPages)	
		End IF
		tb_List.Close
		Set tb_List=Nothing
		%>
	</td>
  </tr>
</table>
</div>
<!--#include file="footer.asp" -->