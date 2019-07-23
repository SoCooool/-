<!--#include file="commond.asp" -->
<!--#include file="include/function.asp" -->
<%
IF IsInteger(Request.QueryString("tbID")) And Request.QueryString("action")<>"deltb" Then
	Dim tbID,tbTitle,tbURL,tbExcerpt,tbBlog,tbCP
	tbID = CheckStr(Request.QueryString("tbID"))
	tbCP="UTF-8"
	If Trim(Request.QueryString("CP"))="GBK" Then tbCP="GB2312"
	If Trim(Request.QueryString("TM"))="RSS" Then
		Set tbBlog=Conn.Execute("SELECT tb_Title,tb_URL,tb_Intro FROM blog_Trackback WHERE blog_ID="&tbID)
		SQLQueryNums=SQLQueryNums+1
		If Not (tbBlog.BOF and tbBlog.EOF) Then
			Response.contentType="text/xml"
			%>
			<?xml version="1.0" encoding="<%=tbCP%>"?>
			<response>
			<error>0</error>
			<rss version="0.91"><channel>
			<title><%=SiteName%></title>
			<link><%=SiteURL%></link>
			<description><%=SiteName%></description>
			<language>zh-cn</language>
			<item>
			<% do while not tbBlog.eof %>
			<title><%=tbBlog(0)%></title>
			<link><%=tbBlog(1)%></link>
			<description><%=tbBlog(2)%></description>
			<% tbBlog.MoveNext
			Loop
		Else
			Call tbResponseXML(1,"无效参数，日志不存在！",tbCP)
		End If
		Set tbBlog=Nothing
		%>
		</item>
		</channel>
		</rss></response>
		<%
	Else
		'Trackback entry mode
		If Request.QueryString("url")<>Empty Then
			tbURL = CheckStr(Request.QueryString("url"))
			tbTitle = CheckStr(Request.QueryString("title"))
			tbExcerpt = HTMLEncode(CheckStr(Request.QueryString("excerpt")))
			tbBlog = CheckStr(Request.QueryString("blog_name"))
		ElseIf Request.Form("url")<>Empty Then
			tbURL = CheckStr(Request.Form("url"))
			tbTitle = CheckStr(Request.Form("title"))
			tbExcerpt = CheckStr(Request.Form("excerpt"))
			tbBlog = CheckStr(Request.Form("blog_name"))
		Else
			Call tbResponseXML(1,"无效参数，URL地址不存在！",tbCP)
		End If
		tbURL=CutStr(tbURL,100)
		if tbTitle="" Then
			tbTitle=tbURL
		Else
			tbTitle=CutStr(tbTitle,100)
		End If
		tbExcerpt=CutStr(tbExcerpt,252)
		If tbExcerpt="" Then Call tbResponseXML(1,"无效内容，出现非法字符！",tbCP)
		tbBlog=CutStr(tbBlog,100)
		tbURL=HTMLEncode(tbURL)
		tbTitle=HTMLEncode(tbTitle)
		tbExcerpt=HTMLEncode(tbExcerpt)
		tbBlog=HTMLEncode(tbBlog)

		'Check if allow trackback
		If Conn.Execute("SELECT count(log_ID) FROM blog_Content WHERE log_IsShow=True And log_DisComment=False AND log_ID="&tbID)(0)>0 AND Conn.Execute("SELECT count(tb_ID) FROM blog_Trackback WHERE blog_ID="&tbID&" AND tb_URL='"&tbURL&"' AND tb_Title='"&tbTitle&"' AND tb_Intro='"&tbExcerpt&"' AND tb_Site='"&tbBlog&"'")(0)<1 Then
			Conn.Execute("INSERT INTO blog_TrackBack (blog_ID, tb_URL, tb_Title, tb_Intro, tb_Site, tb_PostTime) VALUES ("&tbID&",'"&tbURL&"','"&tbTitle&"','"&tbExcerpt&"','"&tbBlog&"',Now())")
			Conn.Execute("UPDATE blog_Content SET log_QuoteNums=log_QuoteNums+1 WHERE log_ID="&tbID)
			Conn.ExeCute("UPDATE blog_Info SET blog_QuoteNums=blog_QuoteNums+1")
			SQLQueryNums=SQLQueryNums+2
		Else
			Call tbResponseXML(1,"此日志是隐藏日志不允许引用，或者此引用通告已发送！",tbCP)
		End If
		SQLQueryNums=SQLQueryNums+2
	End If
Else%>
<!--#include file="header.asp" -->
<table width="<%=BlogWidth%>" border="0" align="center" cellpadding="0" cellspacing="4" bgcolor="#FFFFFF">
  <tr>
    <td width="128" valign="top" bgcolor="#F8F8F8" nowrap align="center"><br /><br /><font color="#FF0000"><b>引用通告</b></font></td>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		<%If Request.QueryString("action")="deltb" Then
				If Not (IsInteger(Request.QueryString("tbID")) AND IsInteger(Request.QueryString("logID"))) Then
					Response.write("无效参数， <a href='javascript:history.go(-1);'>请点击返回</a>")
				Else
					Dim dele_tb
						Set dele_tb=Conn.ExeCute("SELECT T.blog_ID,C.log_Author FROM blog_TrackBack as T,blog_Content as C WHERE T.blog_ID=C.log_ID AND T.tb_ID="&CheckStr(Request.QueryString("tbID")))
						SQLQueryNums=SQLQueryNums+1
						IF dele_tb.EOF AND dele_tb.BOF Then
							Response.write("引用通告不存在，<a href='javascript:history.go(-1);'>请点击返回</a>")
						Else
							If (memStatus="Admin" AND dele_tb("log_Author")=memName) or memStatus="SupAdmin" Then
								Conn.ExeCute("UPDATE blog_Content SET log_QuoteNums=log_QuoteNums-1 WHERE log_ID="&dele_tb("blog_ID"))
								Conn.ExeCute("UPDATE blog_Info SET blog_QuoteNums=blog_QuoteNums-1")
								Conn.Execute("DELETE * FROM blog_TrackBack WHERE tb_ID="&CheckStr(Request.QueryString("tbID")))
								SQLQueryNums=SQLQueryNums+3
								Response.write("引用通告删除成功<br /><a href='blogview.asp?logID="&CheckStr(Request.QueryString("logID"))&"'>请点击返回，或者3秒后自动返回</a><meta http-equiv='refresh' content='3;url=blogview.asp?logID="&CheckStr(Request.QueryString("logID"))&"'>")
							Else
								Response.write("你没有权限删除引用通告，<a href='javascript:history.go(-1);'>请点击返回</a>")
							End If
						End IF
					End If
				Else
					If IsInteger(Request.QueryString("logID"))=False Then
						Response.Write("<a href=""default.asp"">非法参数，请返回主页</a>")
					Else
						Dim blogRS, tbRS
						Set blogRS=Conn.Execute("SELECT * FROM blog_Content WHERE log_ID="&CheckStr(Request.QueryString("logID")))
						SQLQueryNums=SQLQueryNums+1
						If Not (blogRS.bof and blogRS.eof) Then%>
		<table width="99%" border="0" align="center" cellpadding="8" cellspacing="1" class="comment_post_main">
			<tr><td>
			<%Response.Write("<a href='blogview.asp?logID="&blogRS("log_ID")&"'><b>"&blogRS("log_Title")&"</b></a>&nbsp;&nbsp;&nbsp;[ "&DateToStr(blogRS("log_PostTime"),"Y-m-d")&" | 作者：<a href='member.asp?action=view&memName="&blogRS("log_Author")&"'>"&blogRS("log_Author")&"</a> | 来自：<a href='"&blogRS("log_FromURL")&"' target='_blank'>"&blogRS("log_From")&"</a> ]")%>
			</td></tr>
			<tr><td bgcolor="#FFFFFF">
			<%If blogRS("log_IsShow")=False Then
					Response.Write("<b>此日志为隐藏日志，禁止引用通告</b>")
			Else%><b>引用地址：</b><br /><img src="images/utf8.png" border="0" align="absmiddle"> <%=SiteURL%>/trackback.asp?tbID=<%=blogRS("log_ID")%><br /><img src="images/gbk.png" border="0" align="absmiddle"> <%=SiteURL%>/trackback.asp?tbID=<%=blogRS("log_ID")%>&CP=GBK<br /><br />
				<b>RSS引用地址：</b><br /><img src="images/utf8.png" border="0" align="absmiddle">  <%=SiteURL%>/trackback.asp?tbID=<%=blogRS("log_ID")%>&TM=RSS<br /><img src="images/gbk.png" border="0" align="absmiddle"> <%=SiteURL%>/trackback.asp?tbID=<%=blogRS("log_ID")%>&TM=RSS&CP=GBK<br /><br />
				<%Set tbRS=Server.CreateObject("Adodb.Recordset")
					SQL="SELECT * FROM blog_TrackBack WHERE blog_ID="&CheckStr(Request.QueryString("logID"))&" ORDER BY tb_PostTime DESC"
					tbRS.Open SQL,CONN,1,1
					SQLQueryNums=SQLQueryNums+1%>
				<b>相关文章 (<%=tbRS.Recordcount%>):</b><hr size="1" noshade color="#CCCCCC">
				<%Do While Not tbRS.eof
						Response.write("<a href='"&HTMLEncode(tbRS("tb_URL"))&"' target='_blank'>- "&HTMLEncode(tbRS("tb_Title"))&" [ "&tbRS("tb_PostTime")&" | <b>"&HTMLEncode(tbRS("tb_Site"))&"</b> ]</a><br />")
					tbRS.MoveNext
					Loop
					tbRS.Close
					Set tbRS=nothing
				End If%>
				<br /><br /></td>
				</tr>
			</table>
		<%Else
			Response.Write("无效参数， <br /><br /><a href=""javascript:history.go(-1);"">请点击返回</a>")
			End If
		Set blogRS=nothing
		End If
	End If%>
		  </td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp" -->
<%
End If

'Trackback response function
Sub tbResponseXML(intFlag, strMessage,codePage)
	Response.contentType="text/xml"
	Response.write "<?xml version=""1.0"" encoding="""&codePage&"""?><response><error>"&intFlag&"</error>"
	If intFlag=1 Then Response.write "<message>"&strMessage&"</message>"
	Response.write "</response>"
	Response.End
End Sub%>