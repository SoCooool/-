<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%Dim downID
downID=CheckStr(Trim(Request.QueryString("downID")))
If Not IsInteger(downID) Then downID=0
	IF downID=Empty Then
		Response.Write("<h4>参数错误,请不要乱提交数据!</h4><br><a href='default.asp'>返回首页</a>")
	Else
		Dim down
		Set down=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT downl_ID,downl_Dcomm1URL,downl_Dcomm2URL,downl_Dcomm3URL,downl_Dcomm4URL,downl_Nums FROM Download WHERE downl_ID="&downID&""
		down.Open SQL,Conn,1,3
		Dim downl_Nums,downURL1,downURL2,downURL3,downURL4
		downURL1=down("downl_Dcomm1URL")
		downURL2=down("downl_Dcomm2URL")
		downURL3=down("downl_Dcomm3URL")
		downURL4=down("downl_Dcomm4URL")
		downl_Nums=down("downl_Nums")
		if Request.QueryString("action")="Url_1" then
			Response.Write("<meta http-equiv='refresh' content='0;URL="&downURL1&"'>")
		elseif Request.QueryString("action")="Url_2" then
			Response.Write("<meta http-equiv='refresh' content='0;URL="&downURL2&"'>")
		elseif Request.QueryString("action")="Url_3" then
			Response.Write("<meta http-equiv='refresh' content='0;URL="&downURL3&"'>")
		elseif Request.QueryString("action")="Url_4" then
			Response.Write("<meta http-equiv='refresh' content='0;URL="&downURL4&"'>")
		end if
	Conn.ExeCute("UPDATE Download SET downl_Nums=downl_Nums+1 WHERE downl_ID="&downID&"")
	Conn.ExeCute("UPDATE blog_Info SET DownBaseNums=DownBaseNums+1")
	down.UPDATE
	down.Close
end if
set eblog=nothing
%>