<!--#include file="inc/inc_syssite.asp" -->
<%
Response.ContentType="application/xml"
Response.Expires=0
Response.Write("<?xml version=""1.0"" encoding=""UTF-8"" ?>")
%>
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/cls_main.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
<channel>
<title><%=eblog.setup(1,0)%></title>
<link><%=eblog.setup(2,0)%></link>
<description><%=eblog.setup(1,0)%></description>
<language>zh-cn</language>
<webMaster>evanlove@gmail.com</webMaster>
<pubDate><%=RFC822_Date(Now(),"+0800")%></pubDate>
<copyright>Copyright 2005 by evan. All rights reserved.</copyright>
<generator>L-Blog AIO 1.0</generator>
<image>
	<title><%=eblog.setup(1,0)%></title>
	<url><%=eblog.setup(2,0)%>/images/logo.gif</url>
	<link><%=eblog.setup(2,0)%></link>
</image>
<%
Dim cate_ID
cate_ID=Request.QueryString("cateID")
If IsInteger(cate_ID) = False Then cate_ID=0
If cate_ID=0 Then
	SQL="SELECT TOP 10 L.log_ID,L.log_Title,l.log_Author,L.log_PostTime,L.log_Intro,L.log_Content,L.log_DisSM,L.log_DisUBB,L.log_DisIMG,L.log_AutoURL,L.log_AutoKEY,C.cate_Name FROM blog_Content AS L,blog_Category AS C WHERE log_IsShow=True AND C.cate_ID=L.log_cateID ORDER BY log_PostTime DESC"
Else
	SQL="SELECT TOP 10 L.log_ID,L.log_Title,l.log_Author,L.log_PostTime,L.log_Intro,L.log_Content,L.log_DisSM,L.log_DisUBB,L.log_DisIMG,L.log_AutoURL,L.log_AutoKEY,C.cate_Name FROM blog_Content AS L,blog_Category AS C WHERE log_cateID="&cate_ID&" AND log_IsShow=True AND C.cate_ID=L.log_cateID ORDER BY log_PostTime DESC"
End If
Dim RS
Set RS=Server.CreateObject("ADODB.RecordSet")
RS.Open SQL,Conn,1,1
If RS.Eof And RS.Bof Then
	Response.Write("<item></item>")
Else
	Dim log_ID
	Do While Not RS.Eof
		log_ID=RS("log_ID")
		Response.Write("<item>")
		Response.Write("<link>"&eblog.setup(2,0)&"/blogview.asp?logID="&log_ID&"</link>")
		Response.Write("<title><![CDATA["&RS("log_Title")&"]]></title>")
		Response.Write("<author>"&RS("log_Author")&"</author>")
		Response.Write("<category>"&RS("cate_Name")&"</category>")
		Response.Write("<pubDate>"&RFC822_Date(RS("log_PostTime"),"+0800")&"</pubDate>")
		Response.Write("<description><![CDATA["&Ubbcode(RS("log_Intro"),RS("log_DisSM"),RS("log_DisUBB"),RS("log_DisIMG"),RS("log_AutoURL"),RS("log_AutoKEY"))&"]]></description>")
		Response.Write("<content:encoded><![CDATA["&Ubbcode(HTMLEncode(RS("log_Content")),RS("log_DisSM"),RS("log_DisUBB"),RS("log_DisIMG"),RS("log_AutoURL"),RS("log_AutoKEY"))&"]]></content:encoded>")
		Response.Write("<guid>"&eblog.setup(2,0)&"/blogview.asp?logID="&log_ID&"</guid>")
		Response.Write("<trackback:ping>"&eblog.setup(2,0)&"/trackback.asp?tbID="&log_ID&"</trackback:ping>")
		Response.Write("<comments>"&eblog.setup(2,0)&"/blogview.asp?logID="&log_ID&"#comment</comments>")
		Response.Write("<wfw:commentRss>"&eblog.setup(2,0)&"/blogfeed.asp?logID="&log_ID&"</wfw:commentRss>")
		Response.Write("</item>")
		RS.MoveNext
	Loop
End If
RS.Close
Set RS=Nothing
Conn.Close
Set Conn=Nothing
Set eblog=Nothing
%>
</channel>
</rss>