<!--#include file="inc/inc_sys.asp"-->
<html>
<head>
<title>更新系统数据</title>
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body class="bgcolor">
<%
dim action,rs,trs
action=request("action")
if action="DoUpdate" then
	Set rs=Server.CreateObject("Adodb.RecordSet")
	sql="select * from blog_info"
	rs.Open sql,Conn,1,3
	set trs=conn.execute("select count(log_ID) from [blog_Content]")
	if isNull(trs(0)) then
		rs("blog_LogNums")=0
	else
		rs("blog_LogNums")=trs(0)
	end if
	set trs=conn.execute("select count(comm_ID) from [blog_Comment]")
	if isNull(trs(0)) then
		rs("blog_CommNums")=0
	else
		rs("blog_CommNums")=trs(0)
	end if
	set trs=conn.execute("select count(mem_ID) from [blog_Member]")
	if isNull(trs(0)) then
		rs("blog_MemNums")=0
	else
		rs("blog_MemNums")=trs(0)
	end if
	set trs=conn.execute("select count(c_ID) from [coolsite]")
	if isNull(trs(0)) then
		rs("CoolsiteNums")=0
	else
		rs("CoolsiteNums")=trs(0)
	end if
	set trs=conn.execute("select count(downl_ID) from [Download]")
	if isNull(trs(0)) then
		rs("DownloadNums")=0
	else
		rs("DownloadNums")=trs(0)
	end if
	set trs=conn.execute("select count(gb_ID) from [Guestbook]")
	if isNull(trs(0)) then
		rs("GuestbookNums")=0
	else
		rs("GuestbookNums")=trs(0)
	end if
	set trs=conn.execute("select count(ph_ID) from [photo]")
	if isNull(trs(0)) then
		rs("PhotoNums")=0
	else
		rs("PhotoNums")=trs(0)
	end if
	rs.update
	rs.close
	set rs=nothing
	set trs=nothing

	Dim PostNums_MemList
	SET PostNums_MemList=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT mem_Name,mem_PostLogs,mem_PostComms,mem_PostGBNums FROM blog_Member"
	PostNums_MemList.Open SQL,Conn,1,3
	SQLQueryNums=SQLQueryNums+1
	Do While Not PostNums_MemList.EOF
		PostNums_MemList("mem_PostLogs")=Conn.ExeCute("SELECT COUNT(log_ID) FROM blog_Content WHERE log_Author="""&PostNums_MemList("mem_Name")&"""")(0)
		PostNums_MemList("mem_PostComms")=Conn.ExeCute("SELECT COUNT(comm_ID) FROM blog_Comment WHERE comm_Author="""&PostNums_MemList("mem_Name")&"""")(0)
		PostNums_MemList("mem_PostGBNums")=Conn.ExeCute("SELECT COUNT(gb_ID) FROM Guestbook WHERE gb_Author='"&PostNums_MemList("mem_Name")&"'")(0)
		SQLQueryNums=SQLQueryNums+3
		PostNums_MemList.Update
		PostNums_MemList.MoveNext
	Loop
	PostNums_MemList.Close
	SET PostNums_MemList=Nothing

	Dim Nums_CommList
	Set Nums_CommList=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT log_ID,log_CommNums,log_QuoteNums FROM blog_Content"
	Nums_CommList.Open SQL,Conn,1,3
	SQLQueryNums=SQLQueryNums+1
	Do While Not Nums_CommList.EOF
		Nums_CommList("log_CommNums")=Conn.ExeCute("SELECT COUNT(comm_ID) FROM blog_Comment WHERE blog_ID="&Nums_CommList("log_ID"))(0)
		Nums_CommList("log_QuoteNums")=Conn.ExeCute("SELECT COUNT(tb_ID) FROM blog_TrackBack WHERE blog_ID="&Nums_CommList("log_ID"))(0)
		SQLQueryNums=SQLQueryNums+2
		Nums_CommList.Update
		Nums_CommList.MoveNext
	Loop
	Nums_CommList.Close
	SET Nums_CommList=Nothing

	Dim log_cate
	Set log_cate=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Nums FROM blog_Category"
	log_cate.Open SQL,Conn,1,3
	SQLQueryNums=SQLQueryNums+1
	Do While Not log_cate.EOF
		log_cate("cate_Nums")=Conn.ExeCute("SELECT COUNT(log_ID) FROM blog_Content WHERE log_CateID="&log_cate("cate_ID"))(0)
		SQLQueryNums=SQLQueryNums+1
		log_cate.Update
		log_cate.MoveNext
	Loop
	log_cate.Close
	SET log_cate=Nothing
	
	Dim down_cate
	Set down_cate=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Nums FROM down_Category"
	down_cate.Open SQL,Conn,1,3
	SQLQueryNums=SQLQueryNums+1
	Do While Not down_cate.EOF
		down_cate("cate_Nums")=Conn.ExeCute("SELECT COUNT(downl_ID) FROM Download WHERE downl_Cate="&down_cate("cate_ID"))(0)
		SQLQueryNums=SQLQueryNums+1
		down_cate.Update
		down_cate.MoveNext
	Loop
	down_cate.Close
	SET down_cate=Nothing

	Dim photo_cate
	Set photo_cate=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Nums FROM photo_Category"
	photo_cate.Open SQL,Conn,1,3
	SQLQueryNums=SQLQueryNums+1
	Do While Not photo_cate.EOF
		photo_cate("cate_Nums")=Conn.ExeCute("SELECT COUNT(ph_ID) FROM Photo WHERE ph_CateID="&photo_cate("cate_ID"))(0)
		SQLQueryNums=SQLQueryNums+1
		photo_cate.Update
		photo_cate.MoveNext
	Loop
	photo_cate.Close
	SET photo_cate=Nothing

	Application.Lock
	Application.unLock
	response.Write("<br>已经成功将系统数据进行了更新！")
else%>
	<br>
	<form name="form1" method="post" action="">
	<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
	  <tr align="center" class="title">
		<td height="22" colspan="2"><strong><font color="#FFFFFF">更 新 系 统 数 据</font></strong></td>
	  </tr>
	  <tr class="tdbg">
		<td colspan="2"><p>说明：<br>
			1、本操作将重新计算系统的日志，评论，留言，酷站，下载，相册数及更新缓存和首页。<br>
			2、本操作可能消耗服务器资源，请仔细确认每一步操作后执行。</p>
		</td>
	  </tr>
	  <tr class="tdbg">
		<td height="25">&nbsp;</td>
		<td height="25">
			<input name="Submit" type="submit" id="Submit" value="更新系统数据">
			<input name="Action" type="hidden" id="Action" value="DoUpdate">
		</td>
	  </tr>
	</table>
	</form>
<%end if%>
</body>
</html>