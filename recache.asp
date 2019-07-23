<!--#include file="inc/class_sys.asp" -->
<title>更新缓存</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Dim eblog
set eblog=new class_sys
eblog.DelCahe
Application.Contents.RemoveAll()
Response.Write("更新缓存成功!")%>