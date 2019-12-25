<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%Dim siteText
	siteText = "编辑日志"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbhelp.js"></script>
<script language="JavaScript" src="inc/ubbcode.js"></script>
<%IF Request.QueryString("action")<>"postedit" Then
	Dim blog_ID
	blog_ID=Trim(Request.QueryString("logID"))
	If IsInteger(blog_ID)=False Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<h4>参数错误</h4>
				<p>&nbsp;</p>
				<div><a href="default.asp">点击返回主页面</a></div>
			</td>
		  </tr>
		</table>
	<%Else
		Dim blog_Edit
		Set blog_Edit=Server.CreateObject("ADODB.Recordset")
		SQL="SELECT L.*,C.cate_Name FROM blog_Content AS L,blog_Category AS C WHERE log_ID="&blog_ID&" AND C.cate_ID=L.log_cateID"
		blog_Edit.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		IF blog_Edit.EOF AND blog_Edit.BOF Then%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td align="center" valign="middle" height="120">
					<h4>错误：你要修改日志的日志不存在</h4>
					<p>&nbsp;</p>
					<div><a href="default.asp">点击返回主页面</a></div>
				</td>
			  </tr>
			</table>
		<%Else
			IF Not((blog_Edit("log_Author")=memName AND memStatus="7") OR memStatus="8") Then%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="120">
						<h4>错误：没有权限修改日志</h4>
						<p>&nbsp;</p>
					  <div><a href="default.asp">点击返回主页面</a> 或者 <a href="logging.asp">重新登陆</a></div>
					</td>
				  </tr>
				</table>
			<%Else
				Dim edit_logWeather,TagName
				edit_logWeather = blog_Edit("log_Weather")
				%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF">
				  <tr>
					<td valign="top">
						<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
						  <tr align="center">
								<td colspan="2" class="msg_head">修改分类&nbsp;<font color="#FF0000">[ <%=blog_Edit("cate_Name")%> ]</font>&nbsp;中的日志</td>
						  </tr>
						  <form name="inputform" method="post" action="blogedit.asp?action=postedit">
						  <tr bgcolor="#FFFFFF">
							<td align="right" nowrap><strong>操作：</strong></td>
							<td>
								作者：<strong><input name="log_Author" type="text" id="log_Author" value="<%=blog_Edit("log_Author")%>"></strong>&nbsp;&nbsp;|&nbsp;&nbsp;
								<input name="blogdele" type="checkbox" id="blogdele" value="1">删除此日志&nbsp;&nbsp;|&nbsp;&nbsp;
								转移日志到：<select name="blogmoveto" id="blogmoveto">
								<option value="0">选择分类</option>
								<%Dim blog_MoveCateNums,blog_MoveCateNumI
								blog_MoveCateNums=Ubound(Arr_Category,2)
								For blog_MoveCateNumI=0 To blog_MoveCateNums
									Response.Write("<option value='"&Arr_Category(0,blog_MoveCateNumI)&"'>"&Arr_Category(1,blog_MoveCateNumI)&"</option>")
								Next%>
								</select>
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right" nowrap><strong>属性：</strong></td>
							<td>
								<input type="radio" name="log_IsShow" value="0" <%IF blog_Edit("log_IsShow")=True Then Response.Write("checked")%>>公开日志
								<input type="radio" name="log_IsShow" value="1" <%IF blog_Edit("log_IsShow")=False Then Response.Write("checked")%>>隐藏日志&nbsp;&nbsp;|&nbsp;&nbsp;
								<input name="log_IsTop" type="checkbox" id="log_IsTop" value="1" <%IF blog_Edit("log_IsTop")=True Then Response.Write("checked")%>>置顶日志&nbsp;&nbsp;|&nbsp;&nbsp;
								<input name="log_DisComment" type="checkbox" id="log_DisComment" value="1" <%IF blog_Edit("log_DisComment")=True Then Response.Write("checked")%>>禁止评论
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td width="112" align="right" nowrap><strong>标题：</strong></td>
							<td width="100%">
								<input name="log_Title" type="text" id="log_Title" value="<%=EditDeHTML(blog_Edit("log_Title"))%>" size="50">
								<select name="log_Weather" id="log_Weather" onload="options[selectedIndex].value=<%=blog_Edit("log_Weather")%>" onChange="document.images['show_Weather'].src='images/weather/'+options[selectedIndex].value.split('|')[0]+'.gif';" size="1">
									<option value="0|Weather" <%If edit_logWeather="0|Weather" Then Response.Write("selected")%>>天气</option>
									<option value="1|晴天" <%If edit_logWeather="1|晴天" Then Response.Write("selected")%>>晴天</option>
									<option value="2|晴间多云" <%If edit_logWeather="2|晴间多云" Then Response.Write("selected")%>>晴间多云</option>	 
									<option value="3|多云" <%If edit_logWeather="3|多云" Then Response.Write("selected")%>>多云</option>
									<option value="4|阵雨" <%If edit_logWeather="4|阵雨" Then Response.Write("selected")%>>阵雨</option>
									<option value="5|雨天" <%If edit_logWeather="5|雨天" Then Response.Write("selected")%>>雨天</option>
									<option value="6|沙暴" <%If edit_logWeather="6|沙暴" Then Response.Write("selected")%>>沙暴</option>
									<option value="7|飞雪" <%If edit_logWeather="7|飞雪" Then Response.Write("selected")%>>飞雪</option>
									<option value="8|疾风" <%If edit_logWeather="8|疾风" Then Response.Write("selected")%>>疾风</option>
									<option value="9|霜冻" <%If edit_logWeather="9|霜冻" Then Response.Write("selected")%>>霜冻</option>
								</select>&nbsp;
								<img id="show_Weather" src="images/weather/<%=Split(edit_logWeather,"|")(0)%>.gif" align="absmiddle">&nbsp;
								<select name="log_emot" id="log_emot" onChange="document.images['show_emot'].src='images/emot/'+options[selectedIndex].value.split('|')[0]+'.gif';" size="1">
									<option value="0" <%If blog_Edit("log_emot")="0" Then Response.Write("selected")%>>心情指数</option>
									<option value="1" <%If blog_Edit("log_emot")="1" Then Response.Write("selected")%>>一星</option>
									<option value="2" <%If blog_Edit("log_emot")="2" Then Response.Write("selected")%>>二星</option>	 
									<option value="3" <%If blog_Edit("log_emot")="3" Then Response.Write("selected")%>>三星</option>
									<option value="4" <%If blog_Edit("log_emot")="4" Then Response.Write("selected")%>>四星</option>
									<option value="5" <%If blog_Edit("log_emot")="5" Then Response.Write("selected")%>>五星</option>
								</select>
								<img id="show_emot" src="images/emot/<%=blog_Edit("log_emot")%>.gif" align="absmiddle">
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right"><strong>来自：</strong></td>
							<td>
								<input name="log_From" type="text" id="log_From" value="<%=blog_Edit("log_From")%>" size="12" />&nbsp;&nbsp;
								<strong>地址：</strong><input name="log_FromURL" type="text" id="log_FromURL" value="<%=blog_Edit("log_FromURL")%>" size="40" />
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right"><strong>日期：</strong></td>
							<td>
								<input type="text" value="<%=EditDeHTML(Year(blog_Edit("log_PostTime")))%>" name="log_PostYear" maxlength="4" size="4" /> - <input type="text" value="<%=EditDeHTML(Month(blog_Edit("log_PostTime")))%>" name="log_PostMonth" maxlength="2" size="2" /> - <input type="text" value="<%=EditDeHTML(Day(blog_Edit("log_PostTime")))%>" name="log_PostDay" maxlength="2" size="2" /> - <input type="text" value="<%=EditDeHTML(Hour(blog_Edit("log_PostTime")))&":"&EditDeHTML(Minute(blog_Edit("log_PostTime")))&":"&EditDeHTML(Second(blog_Edit("log_PostTime")))%>" name="log_Time" maxlength="8" size="8" />
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right" valign="top">
								<strong>内容：</strong>
								<div style="padding: 30px 0 0 8px;" align="left">
									<p><input name="log_DisSM" type="checkbox" id="log_DisSM" value="1" <%IF blog_Edit("log_DisSM")=1 Then Response.Write("checked")%> /> 禁止表情</p>
									<p><input name="log_DisUBB" type="checkbox" id="log_DisUBB" value="1" <%IF blog_Edit("log_DisUBB")=1 Then Response.Write("checked")%> /> 禁止UBB</p>
									<p><input name="log_DisIMG" type="checkbox" id="log_DisIMG" value="1" <%IF blog_Edit("log_DisIMG")=1 Then Response.Write("checked")%> /> 禁止图片</p>
									<p><input name="log_AutoURL" type="checkbox" id="log_AutoURL" value="1" <%IF blog_Edit("log_AutoURL")=1 Then Response.Write("checked")%> /> 识别链接</p>
									<p><input name="log_AutoKEY" type="checkbox" id="log_AutoKEY" value="1" <%IF blog_Edit("log_AutoKEY")=1 Then Response.Write("checked")%> /> 识别关键字</p>
								</div>
							</td>
							<td valign="top">
								<!--#include file="inc/editform.asp" -->
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
								  <tr valign="top">
									<td><textarea name="message" class="textarea_bg" rows="16" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(blog_Edit("log_Content"))%></textarea>
									<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick=document.inputform.message.rows+=8><img src="images/icon_ar2.gif" border="0" align="absbottom" alt="" /></SPAN> <SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.message.rows>=8)document.inputform.message.rows-=6;else return false'><img src="images/icon_al2.gif" border="0" align="absbottom" alt="" /></SPAN></div>
									<div><strong>内容摘要</strong>(可以不输入,摘要将直接显示详细内容):
									<textarea name="log_Intro" class="textarea_bg" rows="8" wrap="VIRTUAL" id="log_Intro" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(blog_Edit("log_Intro"))%></textarea></div>
									<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick=document.inputform.log_Intro.rows+=7><img src="images/icon_ar2.gif" border="0" align="absbottom" alt="" /></SPAN> <SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.log_Intro.rows>=7)document.inputform.log_Intro.rows-=4;else return false'><img src="images/icon_al2.gif" border="0" align="absbottom" alt="" /></SPAN></div>
									</td>
								  </tr>
								</table>
								<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
								  <tr>
									<td bgcolor="#FFFFFF" class="Smilies_main">
										<%Dim log_SmiliesListNums,log_SmiliesListNumI
										log_SmiliesListNums=Ubound(Arr_Smilies,2)
										TempVar=""
										For log_SmiliesListNumI=0 To log_SmiliesListNums
											Response.Write(TempVar&"<img onmouseover=""this.style.cursor='hand';"" onclick=""AddText('"&Arr_Smilies(2,log_SmiliesListNumI)&"');"" src=""images/smilies/"&Arr_Smilies(1,log_SmiliesListNumI)&""" />")
											TempVar=" "
										Next%>
									</td>
								  </tr>
								</table>
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right"><strong>附件：</strong></td>
							<td><iframe border="0" frameborder="0" framespacing="0" height="24" marginheight="0" marginwidth="0" noresize="noResize" scrolling="No" width="100%" vspale="0" src="attachment.asp"></iframe></td>
						  </tr>
						  <tr align="center" bgcolor="#FFFFFF">
							<td colspan="2">
								是否显示编辑信息:<input type="radio" name="log_Modify" value="0" checked>是
								<input type="radio" name="log_Modify" value="1">否 &nbsp;&nbsp;&nbsp;&nbsp;
								<input name="log_ID" type="hidden" id="log_ID" value="<%=blog_Edit("log_ID")%>">
								<input name="editsubmit" type="submit" value=" 确定编辑 " onClick="this.disabled=true;document.inputform.submit();">
								<input name="L_Reset" type="button" id="L_Reset" value="取消编辑" onclick="javascript:history.go(-1);">
							</td>
						  </tr>
						</form>
						</table>
					</td>
				  </tr>
				</table>
			<%End IF
		End IF
		blog_Edit.Close
		Set blog_Edit=Nothing
	End If
Else
	Dim blogEditPost_ID
	blogEditPost_ID=Trim(Request.Form("log_ID"))
	If IsInteger(blogEditPost_ID)=False Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
			  <h4>参数错误</h4>
				<p>&nbsp;</p>
			  <div><a href="default.asp">点击返回主页面</a></div>
			</td>
		  </tr>
		</table>
	<%Else
		Dim blog_EditPost
		Set blog_EditPost=Server.CreateObject("ADODB.Recordset")
		SQL="SELECT log_ID,log_Author FROM blog_Content WHERE log_ID="&blogEditPost_ID
		blog_EditPost.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If blog_EditPost.EOF AND blog_EditPost.BOF Then%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td align="center" valign="middle" height="120">
					<h4>错误：你要修改日志的日志不存在</h4>
					<p>&nbsp;</p>
					<div><a href="default.asp">点击返回主页面</a></div>
				</td>
			  </tr>
			</table>
		<%Else
			If Not((blog_EditPost("log_Author")=memName And memStatus="7") Or memStatus="8") Then%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="120">
						<h4>错误：没有权限修改日志</h4>
						<p>&nbsp;</p>
						<div><a href="default.asp">点击返回主页面</a><br><br><a href="logging.asp">或者重新登陆</a></div>
					</td>
				  </tr>
				</table>
			<%Else%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="160">
						<h4>修改日志成功</h4>
						<p>&nbsp;</p>
						<%IF Request.Form("message")=Empty OR Request.Form("log_Title")=Empty Then
							Response.Write("必须填写日志内容<br><a href='javascript:history.go(-1);'>请返回重新填写</a>")
						ElseIF Request.Form("blogdele")="1" Then
							Conn.ExeCute("DELETE * FROM blog_Content WHERE log_ID="&Request.Form("log_ID"))
							Conn.ExeCute("DELETE * FROM blog_Comment WHERE blog_ID="&Request.Form("log_ID"))
							Conn.ExeCute("UPDATE blog_Category SET cate_Nums=cate_Nums-1 WHERE cate_Name='"&Request.Form("log_CateID")&"'")
							Conn.ExeCute("UPDATE blog_Member SET mem_PostLogs=mem_PostLogs-1 WHERE mem_Name='"&Request.Form("log_Author")&"'")
							Conn.ExeCute("UPDATE blog_Info SET blog_LogNums=blog_LogNums-1")
							SQLQueryNums=SQLQueryNums+4
							Application.Lock
							Application.Contents(CookieName&"_blog_LastComm") = ""
							Application.UnLock
							Response.Write("日志及相关留言删除成功<p>&nbsp;</p><a href='default.asp'>点击返回首页</a>")
						Else
							Dim Log_Title,log_Content,log_From,log_FromURL,log_ID,log_Intro,log_DisSM,log_DisUBB,log_DisIMG,log_AutoURL,log_Modify,log_IsShow,log_AutoKEY,log_IsTop,log_DisComment,log_PostYear,log_PostMonth,log_PostDay,log_PostTime,log_Weather,log_Emot,log_Tags
							log_Title=CheckStr(Request.Form("log_Title"))
							log_Content=CheckStr(Request.Form("message"))
							log_Intro=CheckStr(Request.Form("log_Intro"))
							log_From=CheckStr(Request.Form("log_From"))
							log_FromURL=Request.Form("log_FromURL")
							log_ID=blogEditPost_ID
							log_DisSM=Request.Form("log_DisSM")
							log_DisUBB=Request.Form("log_DisUBB")
							log_DisIMG=Request.Form("log_DisIMG")
							log_AutoURL=Request.Form("log_AutoURL")
							log_AutoKEY=Request.Form("log_AutoKEY")
							log_PostYear=Request.Form("log_PostYear")
							log_PostMonth=Request.Form("log_PostMonth")
							log_PostDay=Request.Form("log_PostDay")
							log_PostTime=Request.Form("log_PostYear") & "-" & Request.Form("log_PostMonth") & "-" & Request.Form("log_PostDay") & " " &  Request.Form("log_Time")
							log_Weather=Request.Form("log_Weather")
							log_emot=Request.Form("log_emot")
							IF Request.Form("log_IsTop")="1" Then
								log_IsTop=True
							Else
								log_IsTop=False
							End IF
							IF Request.Form("log_IsShow")="0" Then
								log_IsShow = True
							Else
								log_IsShow = False
							End IF
							If Request.Form("log_DisComment")="1" Then
								log_DisComment=True
							Else
								log_DisComment=False
							End IF
							IF log_DisSM=Empty Then log_DisSM=0
							IF log_DisUBB=Empty Then log_DisUBB=0
							IF log_DisIMG=Empty Then log_DisIMG=0
							IF log_AutoURL=Empty Then log_AutoURL=0
							IF log_AutoKEY=Empty Then log_AutoKEY=0
							log_Modify=Request.Form("log_Modify")
							IF log_Modify=0 Then
								log_Modify="[ 本日志由 "&memName&" 于 "&DateToStr(Now(),"Y-m-d H:I A")&" 编辑 ]"
							ElseIF log_Modify=1 Then
								log_Modify=""
							End IF
							log_Tags=Request.Form("log_tag")
							Dim log_MoveToSQL
							IF Request.Form("blogmoveto")<>"0" Then
								log_MoveToSQL=",log_CateID="&Request.Form("blogmoveto")&""
							End IF
							Conn.ExeCute("UPDATE blog_Content Set log_Title='"&log_Title&"',log_Intro='"&log_Intro&"',log_Content='"&log_Content&"',log_From='"&log_From&"',log_FromURL='"&log_FromURL&"',log_DisSM="&log_DisSM&",log_DisUBB="&log_DisUBB&",log_DisIMG="&log_DisIMG&",log_AutoURL="&log_AutoURL&",log_AutoKEY="&log_AutoKEY&",log_Modify='"&log_Modify&"',log_IsShow="&log_IsShow&",log_DisComment="&log_DisComment&",log_PostTime='"&log_PostTime&"',log_PostYear="&log_PostYear&",log_PostMonth="&log_PostMonth&",log_PostDay="&log_PostDay&",log_Weather='"&log_Weather&"',log_Emot='"&log_emot&"',log_IsTop="&log_IsTop&log_MoveToSQL&" WHERE log_ID="&log_ID&"")
							SQLQueryNums=SQLQueryNums+1%>
							<a href='default.asp'>点击返回首页</a>
							<p>&nbsp;</p>
							<a href='blogview.asp?logID=<%=""&log_ID&""%>'>或者返回你所修改的日志</a>
							<p>&nbsp;</p>
							或者等待3秒后自动返回你所修改的日志<meta http-equiv='refresh' content='3;url=blogview.asp?logID=<%=""&log_ID&""%>'>
						<%End IF%>
					</td>
				  </tr>
				</table>
			<%End If
		End If
		blog_EditPost.Close
		Set blog_EditPost=Nothing
	End If
End IF%>
<!--#include file="footer.asp" -->