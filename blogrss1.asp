<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/cls_main.asp" -->
<%
Response.contentType="application/xml;charset=utf-8"
Response.Expires=0
Response.Write("<?xml version=""1.0"" encoding=""UTF-8""?>")
%>
<!--#include file="inc/ubbcode.asp" -->
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:admin="http://webns.net/mvcb/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns="http://purl.org/rss/1.0/">
<channel rdf:about="<%=eblog.setup(2,0)%>">
<title><%=eblog.setup(1,0)%></title>
<link><%=eblog.setup(2,0)%></link>
<description><%=eblog.setup(1,0)%></description>
<dc:language>zh-cn</dc:language>
<dc:creator>webmaster@fir8.net</dc:creator>
<items>
<rdf:Seq>
<%
Dim cate_ID
cate_ID=Request.QueryString("cateID")
IF IsInteger(cate_ID) = False Then
	SQL="SELECT TOP 10 L.log_ID,L.log_Title,l.log_Author,L.log_PostTime,L.log_Intro,L.log_Content,L.log_IsShow,L.log_DisSM,L.log_DisUBB,L.log_DisIMG,L.log_AutoURL,L.log_AutoKEY,C.cate_Name FROM blog_Content AS L,blog_Category AS C WHERE log_IsShow=True AND C.cate_ID=L.log_cateID ORDER BY log_PostTime DESC"
Else
	SQL="SELECT TOP 10 L.log_ID,L.log_Title,l.log_Author,L.log_PostTime,L.log_Intro,L.log_Content,L.log_IsShow,L.log_DisSM,L.log_DisUBB,L.log_DisIMG,L.log_AutoURL,L.log_AutoKEY,C.cate_Name FROM blog_Content AS L,blog_Category AS C WHERE log_cateID="&cate_ID&" AND log_IsShow=True AND C.cate_ID=L.log_cateID ORDER BY log_PostTime DESC"
End IF
Dim RS
Set RS=Server.CreateObject("ADODB.RecordSet")
RS.Open SQL,Conn,1,1
IF RS.EOF AND RS.BOF Then
	Response.Write("<item></item>")
Else
	Do While NOT RS.EOF
		Response.Write("<item rdf:about="""&eblog.setup(2,0)&"/blogview.asp?logID="&RS("log_ID")&""">")
		Response.Write("<title><![CDATA["&RS("log_Title")&"]]></title>")
		Response.Write("<description><![CDATA["&RS("log_Intro")&"]]></description>")
		Response.Write("<content:encoded><![CDATA["&Ubbcode(HTMLEncode(RS("log_Content")),RS("log_DisSM"),RS("log_DisUBB"),RS("log_DisIMG"),RS("log_AutoURL"),RS("log_AutoKEY"))&"]]></content:encoded>")
		Response.Write("<link>"&eblog.setup(2,0)&"/blogview.asp?logID="&RS("log_ID")&"</link>")
		Response.Write("<dc:subject>"&RS("cate_Name")&"</dc:subject>")
		Response.Write("<dc:creator>"&RS("log_Author")&"</dc:creator>")
		Response.Write("<dc:date>"&RS("log_PostTime")&"</dc:date>")
		Response.Write("</item>")
		RS.MoveNext
	Loop
End IF
RS.Close
Set RS=Nothing
Conn.Close
Set Conn=Nothing
Set eblog=Nothing
%>
</rdf:Seq>
</items>
</channel>
</rdf:RDF>