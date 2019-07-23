<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%Dim siteText
	siteText = "下载"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<div id="default">
<div id="default_bg">
	<div id="right">
		<div class="siderbar_head"><span class="gaoliang">下载分类</span></div>
		<div class="siderbar_main">
			<ul>
			<%Dim Arr_DownCates '写入下载分类
			Dim Down_CateList
			Set Down_CateList=Server.CreateObject("ADODB.RecordSet")
			SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM down_Category ORDER BY cate_Order ASC"
			Down_CateList.Open SQL,Conn,1,1
			SQLQueryNums=SQLQueryNums+1
			If Down_CateList.EOF And Down_CateList.BOF Then
				Redim Arr_DownCates(3,0)
			Else
				Arr_DownCates=Down_CateList.GetRows
				Dim Down_CateNums,Down_CateNumI
				Down_CateNums=Ubound(Arr_DownCates,2)
				For Down_CateNumI=0 To Down_CateNums
					Response.Write("<li><a href=""download_class.asp?cateID="&Arr_DownCates(0,Down_CateNumI)&"""><img src="""&Arr_DownCates(3,Down_CateNumI)&""" border=""0"" align=""absmiddle"" /> "&Arr_DownCates(1,Down_CateNumI)&" ("&Arr_DownCates(4,Down_CateNumI)&")</a></li>")
				Next
			End If
			Down_CateList.Close
			Set Down_CateList=Nothing%>
			</ul>
		</div><p></p>
		<%Call NewBlogList
		Call blogSearch
		Call Others%>
	</div>
	<div id="left">
		<%Dim downcate
		Set downcate=Server.CreateObject("Adodb.Recordset")
		SQL="SELECT * FROM down_Category ORDER BY cate_Order Asc"
		downcate.Open SQL,CONN,1,1
		SQLQueryNums=SQLQueryNums+1
		If downcate.EOF AND downcate.BOF Then 
			Response.Write("<h4>None!</h4>")
		Else
			Do Until downcate.EOF OR downcate.BOF
			dim cateID
			cateID=downcate("cate_ID")%>
			<div class="download_class_nav">
			<div class="download_class_nav_bg">
				<div class="download_class_nav_left"><img src="<%=""&downcate("cate_Image")&""%>" align="absbottom" alt="<%=""&downcate("cate_Name")&""%>" /> <h4><a href="download_class.asp?cateID=<%=""&cateID&""%>"><%=""&downcate("cate_Name")&""%></a></h4></div>
				<div class="download_class_nav_right">+ <a href="download_class.asp?cateID=<%=""&cateID&""%>">More...</a></div>
			</div>
			</div>
			<div style="clear: both;"></div>
			<%Dim down
			Set down=Server.CreateObject("Adodb.Recordset")
			SQL="SELECT top 2 * FROM (SELECT top 2 * FROM Download where downl_cate="&cateID&" ORDER BY downl_IsTop ASC,downl_posttime DESC)"
			down.Open SQL,CONN,1,1
			SQLQueryNums=SQLQueryNums+1
			If down.EOF AND down.BOF Then 
				Response.Write("None!")
			Else%>
				<%if downcate("cate_Mode")=0 then%>
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				  <tr>
				<%end if%>		
				<%Dim n,down_main
				n = 0
				Do Until down.EOF OR down.BOF
				Dim down_ID,down_IsShow,downl_Dcomm1,downl_Dcomm2,downl_Dcomm3,downl_Dcomm4,down_ShowURL
				down_ID=down("downl_ID")
				down_IsShow=down("downl_IsShow")
				If down("downl_Dcomm1")<>empty Then
					downl_Dcomm1=""&down("downl_Dcomm1")&""
				else
					downl_Dcomm1=""
				end if
				If down("downl_Dcomm2")<>empty Then
					downl_Dcomm2=""&down("downl_Dcomm2")&""
				else
					downl_Dcomm2=""
				end if
				If down("downl_Dcomm3")<>empty Then
					downl_Dcomm3=""&down("downl_Dcomm3")&""
				else
					downl_Dcomm3=""
				end if
				If down("downl_Dcomm4")<>empty Then
					downl_Dcomm4=""&down("downl_Dcomm4")&""
				else
					downl_Dcomm4=""
				end if
				down_ShowURL="download_show.asp?downID="&down_ID&""

				if downcate("cate_Mode")=1 then%>
				<div class="download_class">
				<div class="download_class_bg">
					<div class="download_class_right">
						<p><a href=download_show.asp?downID=<%=""&down_ID&""%>><h5><%=""&down("downl_Name")&""%></h5></a></p>
						<p><%=""&downl_Dcomm1&""%><%if down("downl_Dcomm1URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm1&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></p>
						<p><%=""&downl_Dcomm2&""%><%if down("downl_Dcomm2URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm2&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></p>
						<p><%=""&downl_Dcomm3&""%><%if down("downl_Dcomm3URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm3&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></p>
						<p><%=""&downl_Dcomm4&""%><%if down("downl_Dcomm4URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm4&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%else%><img src="images/download/none.gif" align="absmiddle" border="0" alt="" /><%end if%></p>
					</div>
					<div class="download_class_left">
					<%if down("downl_Image")<>empty then%>
						<a href="download_show.asp?downID=<%=""&down_ID&""%>" title="[<%=""&down("downl_Name")&""%>] Read More..."><img src="<%=""&down("downl_Image")&""%>" align="absbottom" border="0" /></a>
					<%else%>
						<a href="download_show.asp?downID=<%=""&down_ID&""%>" title="[<%=""&down("downl_Name")&""%>] Read More..."><img src="images/download/nonpreview.gif" align="absbottom"  border="0" alt="" /></a>
					<%end if%>
						<p><%If memStatus="8" then Response.Write("<a href=""downloadedit.asp?downID="&down_ID&""" title=""Edit this Download"" target=""new""><img src=""images/icon_edit_02.gif"" border=""0"" align=""absmiddle"" alt="""" /></a>")%> Download: <strong><%=""&down("downl_Nums")&""%></strong>&nbsp;&nbsp;<%=""&down("downl_PostTime")&""%></p>
					</div>
				</div>
				</div>
				<%else
					If n = 0 then
						down_main = "download_class_a"
					else
						down_main = "download_class_b"
					end if%>
					<td valign="top" class="<%=""&down_main&""%>">
						<div class="download2_class_right">
							<p><a href=download_show.asp?downID=<%=""&down_ID&""%>><h5><%=""&down("downl_Name")&""%></h5></a></p>
							<p><%=""&downl_Dcomm1&""%><%if down("downl_Dcomm1URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm1&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%end if%></p>
							<p><%=""&downl_Dcomm2&""%><%if down("downl_Dcomm2URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm2&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%end if%></p>
							<p><%=""&downl_Dcomm3&""%><%if down("downl_Dcomm3URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm3&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%end if%></p>
							<p><%=""&downl_Dcomm4&""%><%if down("downl_Dcomm4URL")<>empty then%> <a href="<%=""&down_ShowURL&""%>" title="<%=""&downl_Dcomm4&""%>"><img src="images/download/download.gif" align="absmiddle" border="0"></a><%end if%></p>
							<p><%If memStatus="8" then Response.Write("<a href=""downloadedit.asp?downID="&down_ID&""" title=""Edit this Download"" target=""new""><img src=""images/icon_edit_02.gif"" border=""0"" align=""absmiddle"" alt="""" /></a>")%> Download: <strong><%=""&down("downl_Nums")&""%></strong></p>
							<p><%=""&down("downl_PostTime")&""%></p>
						</div>
						<div class="download2_class_left">
						<%if down("downl_Image")<>empty then%>
							<a href="download_show.asp?downID=<%=""&down_ID&""%>" title="[<%=""&down("downl_Name")&""%>] Read More..."><img src="<%=""&down("downl_Image")&""%>" align="absbottom" border="0" alt="" /></a>
						<%else%>
							<a href="download_show.asp?downID=<%=""&down_ID&""%>" title="[<%=""&down("downl_Name")&""%>] Read More..."><img src="images/download/nonpreview.gif" align="absbottom"  border="0" alt="" /></a>
						<%end if%>
						</div>
					</td>
					<%If n = 1 then Response.Write("<tr></tr>")
					n = n + 1
					If n = 2 then n = 0
				end if
				down.MoveNext
			Loop
			End if
			down.Close
			Set down=Nothing%>
			<%if downcate("cate_Mode")=0 then%>
			  </tr>
	  </table>
			<p></p>
			<%end if%>			
		<%downcate.MoveNext
		Loop
	End If
	downcate.Close
	Set downcate=Nothing%>
	</div>
</div>
</div>
<!--#include file="footer.asp" -->