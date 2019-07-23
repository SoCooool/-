<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%Dim siteText
	siteText = "文章"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<script language="javascript" type="text/javascript">
var flag=false; 
function DrawImage(ImgD){ 
	var image=new Image(); 
	image.src=ImgD.src; 
	if(image.width>0 && image.height>0){ 
		flag=true; 
		if(image.width>=592){ 
			ImgD.width=592; 
			ImgD.height=(image.height*592)/image.width; 
		}else{ 
			ImgD.width=image.width; 
			ImgD.height=image.height; 
		}  
	} 
} 
</script>
<%
Dim log_Year,log_Month,log_Day,cateID,view,SQLFiltrate,Url_Add,sortBy
log_Year=CheckStr(Trim(Request.QueryString("log_Year")))
log_Month=CheckStr(Trim(Request.QueryString("log_Month")))
log_Day=CheckStr(Trim(Request.QueryString("log_Day")))
cateID=CheckStr(Trim(Request.QueryString("cateID")))
view=CheckStr(Trim(Request.QueryString("view")))
SQLFiltrate="WHERE "
Url_Add="?"
IF IsInteger(cateID)=True Then
	SQLFiltrate=SQLFiltrate&" log_CateID="&cateID&" AND"
	Url_Add=Url_Add&"cateID="&CateID&"&"
End IF
IF IsInteger(log_Year)=True Then
	SQLFiltrate=SQLFiltrate&" log_PostYear="&log_Year&" AND"
	Url_Add=Url_Add&"log_Year="&log_Year&"&"
End IF
IF IsInteger(log_Month)=True Then
	SQLFiltrate=SQLFiltrate&" log_PostMonth="&log_Month&" AND"
	Url_Add=Url_Add&"log_Month="&log_Month&"&"
End IF
IF IsInteger(log_Day)=True Then
	SQLFiltrate=SQLFiltrate&" log_PostDay="&log_Day&" AND"
	Url_Add=Url_Add&"log_Day="&log_Day&"&"
End IF
sortBy=Session("sortBy")
If CheckStr(Trim(Request.QueryString("sortBy")))="" Then
	sortBy="log_IsTop ASC,log_PostTime"
	Session("sortBy")="log_IsTop ASC,log_PostTime"
ElseIf CheckStr(Trim(Request.QueryString("sortBy")))="log_PostTime" Then
	sortBy="log_PostTime"
	Session("sortBy")="log_PostTime"
ElseIf CheckStr(Trim(Request.QueryString("sortBy")))="log_CateID" Then
	sortBy="log_CateID"
	Session("sortBy")="log_CateID"
ElseIf CheckStr(Trim(Request.QueryString("sortBy")))="log_ViewNums" Then
	sortBy="log_ViewNums"
Session("sortBy")="log_ViewNums"
ElseIf CheckStr(Trim(Request.QueryString("sortBy")))="log_CommNums" Then
	sortBy="log_CommNums"
	Session("sortBy")="log_CommNums"
End If
%>
<div id="default">
<div id="default_bg">
	<div id="left">
		<%eblog.placard%>
		<%Dim viewMode,pageMode'查看模式
		IF IsInteger(cateID)=True Then
			Dim log_Cate
			Set log_Cate=Conn.Execute("SELECT cate_viewMode FROM blog_Category WHERE cate_ID="&cateID&"")
			IF log_Cate.EOF AND log_Cate.BOF Then
				viewMode=0
			Else
				viewMode=log_Cate(0)
			End IF
			log_Cate.close
			Set log_Cate=Nothing
		Else
			viewMode=0
		End If
		Dim CurPage
		If CheckStr(Request.QueryString("Page"))<>Empty Then
			Curpage=CheckStr(Request.QueryString("Page"))
			If IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
			Else
				Curpage=1
			End If
			Dim webLog
			Set webLog=Server.CreateObject("Adodb.Recordset")
			SQL="SELECT L.*,C.cate_Name,C.cate_Image,C.cate_viewMode FROM blog_Content AS L,blog_Category AS C "&SQLFiltrate&" C.cate_ID=L.log_CateID ORDER BY "&sortBy&" DESC"
			webLog.Open SQL,CONN,1,1
			SQLQueryNums=SQLQueryNums+1
			If webLog.EOF AND webLog.BOF Then 
				Response.Write("<h4>暂无日志!</h4>")
			Else
				Dim log_Author,weblog_ID,log_Title,log_Intro,log_IsShow,log_ShowURL,log_IsTop,log_Weather,log_Emot
				
				If viewMode=0 Then
					pageMode=blogpage
				ElseIf viewMode=1 Then
					pageMode=listblogpage
				End If
				webLog.PageSize=pageMode
				webLog.AbsolutePage=CurPage
				Dim Log_Num
				Log_Num=webLog.RecordCount
				Dim MultiPages,PageCount,list_Color
				If viewMode=0 Then'修正列表分页2005/01/18
					MultiPages=""&MultiPage(Log_Num,blogpage,CurPage,Url_Add)&""
				Else
					MultiPages=""&MultiPage_l(Log_Num,listblogpage,CurPage,Url_Add)&""
				End if%>
				<div id="blog_nav">
					<div id="blog_nav_bg">
						<div id="blog_nav_left"><%=""&MultiPages&""%></div>
						<div id="blog_nav_right">
							排序方式：<a href="<%=""&url_add&""%>sortBy=log_PostTime">发表时间</a>,<a href="<%=""&url_add&""%>sortBy=log_CommNums">评论数</a>,<a href="<%=""&url_add&""%>sortBy=log_ViewNums">查看数</a>
						</div>
					</div>
				</div>
				<%If viewMode=1 Then Response.Write("<TABLE cellSpacing=""1"" cellPadding=""4"" width=""100%"" align=""center"" border=""0"" style=""font-family: Verdana;font-size: 11px;color: #666666;""><tr class=""list_color_a""><td align=center>分类</td><td align=center>日志标题</td><td align=center>作者</td><td align=center>发表时间</td><td align=center>评论|引用|浏览</td></tr>")
				
				Dim color
				color=1
				Do Until webLog.EOF OR PageCount=pageMode
				weblog_ID=weblog("log_ID")
				log_Title=weblog("log_Title")
				log_Intro=weblog("log_Intro")
				log_IsShow=weblog("log_IsShow")
				log_Author=webLog("log_Author")
				log_IsTop=weblog("log_IsTop")
				log_Weather=Split(weblog("log_Weather"),"|")
				log_Emot=weblog("log_Emot")
				If color mod 2=0 then
					list_Color = "list_color_a"
				else
					list_Color = "list_color_b"
				end if

				If viewMode=0 Or view="normal" Then
					If IsInteger(cateID)=False Then
						log_ShowURL="<a href=""blogview.asp?logID="&weblog_ID&""">"
					Else
						log_ShowURL="<a href=""blogview.asp?logID="&weblog_ID&"&cateID="&cateID&""">"
					End If
					Dim cateImg'修正日志分类图片05/01/18
					If webLog("cate_Image")<>Empty Then cateImg="<img src="""&webLog("cate_Image")&""" align=""absmiddle"" alt="""&webLog("cate_Name")&""">&nbsp;"
					Dim AdminEdit
					If (memStatus="7" AND memName=log_Author) OR memStatus="8" Then AdminEdit="&nbsp;<a href=""blogedit.asp?logID="&weblog_ID&""" target=""new""><img src=""images/icon_edit.gIf"" border=""0"" align=""absmiddle"" alt=""Edit""></a>&nbsp;"
					If log_IsShow = True OR (log_IsShow=False And (memStatus="8" OR (memStatus="7" And memName=log_Author))) Then%>
						<div class="content_head"><%=""&AdminEdit&""%><%=""&cateImg&""%>
							<%If log_IsTop=True Then%>
								<span style="cursor:hand;" onclick="showIntro('log_<%=""&weblog_ID&""%>');" title="点击查看详细介绍"><img src="images/blogtop.gif" border="0" align="absmiddle" /></span> <%=""&log_ShowURL&""%><h4><%=""&webLog("log_Title")&""%></h4></a></div>
								<div style="display:none;" id="log_<%=""&weblog_ID&""%>">
							<%Else%>
								<%=""&log_ShowURL&""%><h4><%=""&webLog("log_Title")&""%></h4></a></div>
							<%End IF%>
							<div class="content_info">Update time：<%=""&webLog("log_Posttime")&""%>&nbsp;
								<%IF log_Weather(0)>"0" Then Response.Write("<img src=""images/weather/"&log_Weather(0)&".gif"" alt="""&log_Weather(1)&""" align=""absmiddle"">")
								IF log_Emot>"0" Then Response.Write("&nbsp;<img src=""images/emot/"&log_Emot&".gif"" alt="""&log_Emot&"星"" align=""absmiddle"">")%>
							</div>
						<%
						Dim content
						If log_Intro<>Empty Then
							content="log_Intro"
						Else
							content="log_Content"
						End if%>
						<div class="content_main">
							<%Response.Write(""&Ubbcode(HtmlEncode(webLog(""&content&"")),weblog("log_DisSM"),weblog("log_DisUBB"),weblog("log_DisIMG"),weblog("log_AutoURL"),weblog("log_AutoKEY")))
							If log_Intro=Empty Then
								Response.Write("")
							ElseIf log_Intro<>Empty And HtmlEncode(webLog("log_Content"))<>HtmlEncode(webLog("log_Intro")) Then
								Response.Write(" <strong>…… "&log_ShowURL&"[ 点击阅读全文 ]</a></strong>")
							End If%>
						</div>
						<%If log_IsTop=True Then
							IF log_IsShow = True OR (log_IsShow=False And (memStatus="8" OR (memStatus="7" And memName=log_Author))) Then
								Response.Write("</div>")
							End If
						End If
					Else%>
						<div class="content_hide"><%=""&cateImg&""%><%=""&log_ShowURL&""%><h4>嘿嘿,这是我的秘密噢!</h4></a></div>
					<%End If
				ElseIf viewMode=1 Or view="list" Then
					Dim list_IsShow
					If log_IsShow = True OR (log_IsShow=False And (memStatus="8" OR (memStatus="7" And memName=log_Author))) Then
						list_IsShow=""&left(webLog("log_Title"),20)&""
					Else
						list_IsShow="嘿嘿,这是我的秘密噢!"
					End If%>
					<tr class=<%=""&list_Color&""%> onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
						<td align="center"><A href="blog.asp?CateID=<%=""&webLog("log_CateID")&""%>"><%=""&webLog("cate_Name")&""%></a></td>
						<td> <A href="blogview.asp?logID=<%=""&webLog("log_ID")&""%>"><%=""&list_IsShow&""%></a></td>
						<td align="center"><a href="member.asp?action=view&memName=<%=""&log_Author&""%>"><%=""&log_Author&""%></a></td>
						<td><%=""&webLog("log_PostTime")&""%></td>
						<td align="center"><a href="blogview.asp?logID=<%=""&webLog("log_ID")&""%>#commmark" title="评论"><%=""&webLog("log_CommNums")&""%></a>|<a href="trackback.asp?logID=<%=""&weblog_ID&""%>" title="引用"><%=""&webLog("log_QuoteNums")&""%></a>|<%=""&webLog("log_ViewNums")&""%></td>
					</tr>
				<%End If
				webLog.MoveNext
				color=color+1

			PageCount=PageCount+1
			If viewMode=1 Then
				If webLog.EOF OR PageCount=listblogpage then
					Response.Write("</Table>")
				End IF
			Else
				Response.Write("<p></p>")
			End IF
			Loop
		End If
		webLog.Close
		Set webLog=Nothing
		%>
	<div id="blog_nav">
		<div id="blog_nav_bg">
			<div id="blog_nav_left"><%=""&MultiPages&""%></div>
			<div id="blog_nav_right"><a href="javascript:void(0);" onClick="parent.scroll(1,1);" onFocus="this.blur();">Top <img src="images/icon_gotop.gif" alt="回到网页顶部" border="0" align="absmiddle" /></a></div>
		</div>
		</div>
	</div>
	<div id="right">
		<!--#include file="inc/calendar.asp"-->
		<%Call Calendar(log_Year,log_Month,log_Day)
		Call CategoryList(2)
		Call NewBlogList%>
		<div class="siderbar_head"><span class="gaoliang">最新评论</span></div>
		<div class="siderbar_main">
			<%Call NewCommList(20)%>
		</div>
		<div class="siderbar_head"><span class="gaoliang">文章归档</span></div>
		<div class="siderbar_main">
			<%dim y,m,nowy,nowm,n,i,j
			y = 2004
			m = 7
			nowy=year(now) '当前年份
			nowm=month(now) '当前月份
			n = (nowy - y + 1) * 12 - (12 - (12 - m + 1)) - (12 - nowm)
			for i = 1 to n
				response.write"<p><a href='blog.asp?log_Year="&nowy&"&log_Month="&nowm&"&view=list'>"&nowy&"年"&nowm&"月</a><p>"
				nowm=nowm-1
				if nowm<1 then
					nowm=12
					nowy=nowy-1
				end if
			next%>
		</div>
	</div>
	</div>
</div>
<!--#include file="footer.asp" -->