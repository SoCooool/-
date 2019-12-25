<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
Dim c_ID
c_ID=CheckStr(Trim(Request.QueryString("ID")))
If Not IsInteger(c_ID) Then c_ID=0
IF c_ID=Empty Then
	Response.Write("<h4>参数错误,请不要乱提交数据!</h4><br /><br /><a href=""default.asp"">返回首页</a>")
Else
	Dim coolsiteShow
	Set coolsiteShow=Server.CreateObject("ADODB.RecordSet")
	SQL="SELECT c_ID,c_URL FROM coolsite WHERE c_ID="&c_ID&""
	coolsiteShow.Open SQL,Conn,1,3
	If coolsiteShow.EOF AND coolsiteShow.BOF Then
		Response.Write("<h4>参数错误,请不要乱提交数据!</h4><br /><br /><a href=""default.asp"">返回首页</a>")
	Else
		Dim cc_URL
		'修正url前面没有http://访问错误 205/03/29
		cc_URL = Trim(HTMLEncode(coolsiteShow("c_URL")))
		If Not (Left(cc_URL, 7) = "http://" Or cc_URL = "") Then cc_URL = "http://" & cc_URL
		Response.Write("<meta http-equiv='refresh' content='0;URL="&cc_URL&"'>")
		Conn.ExeCute("UPDATE coolsite SET c_viewNums=c_viewNums+1 WHERE c_ID="&c_ID&"")
		coolsiteShow.UPDATE
		coolsiteShow.Close
	End If
End If
set eblog=nothing
%>