<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="header.asp" -->
<div id="default">
<div id="default_bg">
	<%Dim downID
	downID=CheckStr(Trim(Request.QueryString("downID")))
	Dim errMSG
	IF IsInteger(downID)=False Then
		errMSG="<div class=""message""><a href=""default.asp"">对不起，无效的参数，点击返回首页重新操作</a></div>"
	Else
		Dim down_Show
		Set down_Show=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT * FROM Download WHERE downl_ID="&downID&""
		down_Show.Open SQL,Conn,1,3
		SQLQueryNums=SQLQueryNums+1
		IF down_Show.EOF AND down_Show.BOF Then
			errMSG="<a href=""default.asp"">对不起，没有找到相关下载，点击返回首页重新操作</a>"
			down_Show.Close
			Set down_Show=Nothing
		Else
			Dim down_ID,down_IsShow,downl_Dcomm1,downl_Dcomm2,downl_Dcomm3,downl_Dcomm4,down_ImgShow1,down_ImgShow2,down_ImgShow3,down_ImgShow4,down_ShowURL1,down_ShowURL2,down_ShowURL3,down_ShowURL4
			down_ID=down_Show("downl_ID")
			down_IsShow=down_Show("downl_IsShow")
			If down_Show("downl_Dcomm1")<>empty Then
				downl_Dcomm1=""&down_Show("downl_Dcomm1")&""
			else
				downl_Dcomm1=""
			end if
			If down_Show("downl_Dcomm2")<>empty Then
				downl_Dcomm2=""&down_Show("downl_Dcomm2")&""
			else
				downl_Dcomm2=""
			end if
			If down_Show("downl_Dcomm3")<>empty Then
				downl_Dcomm3=""&down_Show("downl_Dcomm3")&""
			else
				downl_Dcomm3=""
			end if
			If down_Show("downl_Dcomm4")<>empty Then
				downl_Dcomm4=""&down_Show("downl_Dcomm4")&""
			else
				downl_Dcomm4=""
			end if			
			down_ImgShow1=down_Show("downl_ImgShow1")
			down_ImgShow2=down_Show("downl_ImgShow2")
			down_ImgShow3=down_Show("downl_ImgShow3")
			down_ImgShow4=down_Show("downl_ImgShow4")
			If down_ImgShow1=False Then
				down_ShowURL1="down.asp?downID="&down_ID&"&action="
			Else
				down_ShowURL1="down_ImgShow.asp?downID="&down_ID&"&action="
			End If
			If down_ImgShow2=False Then
				down_ShowURL2="down.asp?downID="&down_ID&"&action="
			Else
				down_ShowURL2="down_ImgShow.asp?downID="&down_ID&"&action="
			End If
			If down_ImgShow3=False Then
				down_ShowURL3="down.asp?downID="&down_ID&"&action="
			Else
				down_ShowURL3="down_ImgShow.asp?downID="&down_ID&"&action="
			End If
			If down_ImgShow4=False Then
				down_ShowURL4="down.asp?downID="&down_ID&"&action="
			Else
				down_ShowURL4="down_ImgShow.asp?downID="&down_ID&"&action="
			End If
			if down_IsShow=true then
	%>
	<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1">
	  <tr>
		<td>
			<%If down_Show("downl_image")<>Empty then%>
				<img src="<%=""&down_Show("downl_image")&""%>" align="absbottom" border="0" alt="" />
			<%else%>
				<img src="images/download/nonpreview.gif" align="absbottom" border="0" alt="" />
			<%end if%>
			<p></p>
			<p><img src="images/download/download_page.gif" align="absbottom" border="0" alt="" /></p>
		</td>
		<td valign="top">
			<p><h4><%=""&down_Show("downl_Name")&""%></h4></p>
			<p>UpdateTime: <%=""&DateToStr(down_Show("downl_PostTime"),"Y-m-d H:I A")&""%></p>
			<p>Downloads: <%=""&down_Show("downl_Nums")&""%></p>
			<table width="300" border="0" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
			  <tr align="right" bgcolor="#FFFFFF">
				<td><%=""&downl_Dcomm1&""%>&nbsp;&nbsp;<%if down_Show("downl_Dcomm1URL")<>empty then%><a href="<%=""&down_ShowURL1&"Url_1"%>" target="new" title="<%=""&downl_Dcomm1&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></td>
				<td><%=""&downl_Dcomm2&""%>&nbsp;&nbsp;<%if down_Show("downl_Dcomm2URL")<>empty then%><a href="<%=""&down_ShowURL2&"Url_2"%>" target="new" title="<%=""&downl_Dcomm2&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></td>
			  </tr>
			  <tr align="right" bgcolor="#FFFFFF">
				<td><%=""&downl_Dcomm3&""%>&nbsp;&nbsp;<%if down_Show("downl_Dcomm3URL")<>empty then%><a href="<%=""&down_ShowURL3&"Url_3"%>" target="new" title="<%=""&downl_Dcomm3&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></td>
				<td><%=""&downl_Dcomm4&""%>&nbsp;&nbsp;<%if down_Show("downl_Dcomm4URL")<>empty then%><a href="<%=""&down_ShowURL4&"Url_4"%>" target="new" title="<%=""&downl_Dcomm4&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></td>
			  </tr>
			</table>
		</td>
		</tr>
	  <tr>
		<td colspan="2" style="border-bottom: 1px solid #b6d8e0; width: 99%;"><h5>下载说明<h5></td>
	  </tr>
	  <tr>
		<td valign="top" colspan="2" style="padding:4px;"><%Response.Write(Ubbcode(HTMLEncode(down_Show("downl_Comment")),0,0,0,1,0)&"")%></td>
	  </tr>
</table>
<%else
	Response.write("禁止下载")
	end if
down_Show.Close
	Set down_Show=Nothing
	End If
End If%>
</div>
</div>
<!--#include file="footer.asp" -->