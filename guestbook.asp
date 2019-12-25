<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="inc/md5.asp" -->
<%Dim siteText
	siteText = "留言"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<%
Dim founderr,errmsg,sucmsg,sucUrl
Dim SQLFiltrate,Url_Add,gbAuthor,gbID
gbAuthor=CheckStr(Request.QueryString("memName"))
gbID=CheckStr(Request.QueryString("gbID"))
Url_Add="?"
If gbAuthor<>Empty Then
	SQLFiltrate="WHERE gb_Author='"&gbAuthor&"'"
	Url_Add="?memName="&gbAuthor&""
End If
If gbID<>Empty Then
	SQLFiltrate="WHERE gb_ID="&gbID&""
	Url_Add="?gbID="&gbID&""
End If%>

<%If Request.QueryString("action")="postgb" Then
if eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4>"):response.End()
If eblog.chkiplock() then
	FoundErr=True
	errmsg=errmsg & "<li>对不起!！你的IP已被锁定,不允许发表评论！</li>"
Else
	If DateDiff("s",Request.Cookies(CookieName)("memLastPost"),Now())<cint(Setting(15)) Then
		FoundErr=True
		errmsg=errmsg & "<li>请勿频繁提交数据,"&Setting(15)&"秒后才能操作!</li>"
	Else
		eblog.checkform_Empty(2) '验证是否提交空信息
		eblog.checkform '验证提交的数据
		eblog.userinfo
		Dim AllreadyMemErr
		Dim gb_Content,gb_Title,gb_memName,gb_IsPublic,gb_SaveMem,gb_MemPassword,gb_UserFace
		gb_Content=CheckStr(Request.Form("message"))
		gb_Content=eblog.filt_badword(gb_Content)
		gb_memName=CheckStr(Request.Form("username"))
		gb_SaveMem=Request.Form("SaveMem")
		gb_MemPassword=MD5(CheckStr(Request.Form("MemPassword")))
		gb_IsPublic=Request.Form("hidden_message")
		IF gb_IsPublic=Empty Then gb_IsPublic=1
		gb_UserFace=Request.Form("userface")
		If memName=Empty And eblog.chk_regname(gb_memName) Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称系统不允许注册!</li>"
		ElseIf eblog.chk_badword(gb_memName) Then
			FoundErr=True
			errmsg=errmsg & "<li>昵称含有系统不允许的字符!</li>"
		ElseIf gb_SaveMem=1 And CheckStr(Request.Form("MemPassword"))=Empty Then
			FoundErr=True
			errmsg=errmsg & "<li>密码不能为空!</li>"
		ElseIf FoundErr<>True Then
			IF memName=Empty And AllreadyMemErr<>2 Then
				IF gb_memName<>Empty And gb_SaveMem=1 AND Setting(6)=1 Then
					Conn.ExeCute("INSERT INTO blog_Member(mem_Name,mem_Password,mem_RegIP) VALUES ('"&gb_memName&"','"&gb_memPassword&"','"&Guest_IP&"')")
					Conn.ExeCute("UPDATE blog_Info SET blog_MemNums=blog_MemNums+1")
					SQLQueryNums=SQLQueryNums+2
					Response.Cookies(CookieName)("memName")=eblog.CodeCookie(gb_memName)
					Response.Cookies(CookieName)("memPassword")=eblog.CodeCookie(gb_memPassword)
					Response.Cookies(CookieName)("memStatus")=eblog.CodeCookie(6)
					sucmsg=sucmsg & "<li>"&gb_memName&" 已成功注册!</li>"
				End IF
				Conn.ExeCute("INSERT INTO Guestbook(gb_Content,gb_Author,gb_IsPublic,gb_UserFace,gb_PostIP) VALUES ('"&gb_Content&"','"&gb_Memname&"',"&gb_IsPublic&","&gb_UserFace&",'"&Guest_IP&"')")
				SQLQueryNums=SQLQueryNums+1
			Else
				Conn.ExeCute("INSERT INTO Guestbook(gb_Content,gb_Author,gb_IsPublic,gb_UserFace,gb_PostIP) VALUES ('"&gb_Content&"','"&memName&"',"&gb_IsPublic&","&gb_UserFace&",'"&Guest_IP&"')")
				SQLQueryNums=SQLQueryNums+1
			End IF
			Conn.ExeCute("UPDATE blog_Member SET mem_PostGBNums=mem_PostGBNums+1 WHERE mem_Name='"&gb_memName&"'")
			Conn.ExeCute("UPDATE blog_Info SET GuestbookNums=GuestbookNums+1")
			SQLQueryNums=SQLQueryNums+2
			Response.Cookies(CookieName)("memLastpost")=Now()
			sucmsg=sucmsg & "<li>谢谢参与，您成功发表留言!</li>"
			sucUrl=sucUrl & "guestbook.asp"
		End If
	End If
End If
	if founderr=True then
		eblog.sys_err(errmsg)
	end if
	if founderr<>True then
		eblog.sys_Suc(sucmsg)
	end if
ElseIf Request.QueryString("action")="delegb" Then
	IF IsInteger(Request.QueryString("gbID"))=False Then
		FoundErr=True
		errmsg=errmsg & "<li>参数出现错误!</li>"
	Else
		IF Not (memStatus="8" OR memStatus="7") Then
			FoundErr=True
			errmsg=errmsg & "<li>没有权限删除!</li>"
		Else
			Dim dele_GB
			Set dele_GB=Conn.ExeCute("SELECT gb_ID,gb_Author FROM Guestbook WHERE gb_ID="&CheckStr(Request.QueryString("gbID")))
			SQLQueryNums=SQLQueryNums+1
			IF dele_GB.EOF AND dele_GB.BOF Then
				FoundErr=True
				errmsg=errmsg & "<li>没有找到指定数据!</li>"
			Else
				Conn.ExeCute("UPDATE blog_Info SET GuestbookNums=GuestbookNums-1")
				Conn.ExeCute("UPDATE blog_Member SET mem_PostGBNums=mem_PostGBNums-1 WHERE mem_Name='"&CheckStr(dele_GB("gb_Author"))&"'")
				Conn.Execute("DELETE * FROM Guestbook WHERE gb_ID="&CheckStr(Request.QueryString("gbID")))
				SQLQueryNums=SQLQueryNums+3
				sucmsg=sucmsg & "<li>删除成功!</li>"
				sucUrl=sucUrl & "guestbook.asp"
			End IF
			Set dele_GB=Nothing
		End If
	End IF
	if founderr=True then
		eblog.sys_err(errmsg)
	end if
	if founderr<>True then
		eblog.sys_Suc(sucmsg)
	end if
ElseIf Request.QueryString("action")="replygb" Then
if eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4>"):response.End()
	IF IsInteger(Request.QueryString("gbID"))=False Then
		FoundErr=True
		errmsg=errmsg & "<li>参数出现错误!</li>"
	Else
		IF Not (memStatus="8" OR memStatus="7") Then
			FoundErr=True
			errmsg=errmsg & "<li>没有权限!</li>"
		Else
			Dim reply_GB
			Set reply_GB=Conn.Execute("SELECT * FROM Guestbook WHERE gb_ID="&Request.QueryString("gbID")&"")
			If reply_GB.Eof And reply_GB.Bof Then
				FoundErr=True
				errmsg=errmsg & "<li>所查看的留言不存在!</li>"
			Else%>
				<div id="guestbook_main">
				<div id="guestbook_main_bg">
				<script language="JavaScript" src="inc/ubbcode.js" type="text/javascript"></script>
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
					  <tr>
						<td width="100%"><strong>回复留言</strong></td>
					  </tr><form action="guestbook.asp?action=reply&gbID=<%=reply_GB("gb_ID")%>" method="post" name="input" id="input">
					  <tr>
						<td bgcolor="#FFFFFF" nowrap="nowrap"><textarea name="message" rows="8" wrap="VIRTUAL" class="textarea_bg" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(reply_GB("gb_Reply"))%></textarea><br />
						  <div align="right">缩放输入框: <span title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onClick="document.input.message.rows+=3"><img src="images/icon_ar2.gif" align="absmiddle" border="0" /></span> <span title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.input.message.rows>=7)document.input.message.rows-=7;else return false'><img src="images/icon_al2.gif" align="absmiddle" border="0" /></span></div>
						</td>
					  </tr>
					  <tr align="center">
						<td nowrap="nowrap" bgcolor="#FFFFFF"><input type="submit" name="replysubmit" value="回复留言" onClick="this.disabled=true;document.input.submit();" />&nbsp;<input name="Reset" type="reset" id="Reset" value="重置回复" /></td>
					  </tr></form>
					  <tr>
						<td nowrap="nowrap"><%Response.Write("<strong>"&reply_GB("gb_Author")&"</strong> 于 "&DateToStr(reply_GB("gb_PostTime"),"Y-m-d H:I A")&" 留言：<br />")%></td>
					  </tr>
					  <tr>
						<td nowrap="nowrap" bgcolor="#FFFFFF" class="wordbreak"><%Response.Write(Ubbcode(HTMLEncode(reply_GB("gb_Content")),0,0,0,1,0))%></td>
					  </tr>
					</table>
				</div>
				</div>
			<%End If
			Set reply_GB=Nothing
		End If
	End If
	if founderr=True then
		eblog.sys_err(errmsg)
	end if
ElseIf Request.QueryString("action")="reply" Then
	Conn.ExeCute("UPDATE Guestbook SET gb_Reply='"&CheckStr(Request.Form("message"))&"',gb_ReplyAuthor='"&memName&"',gb_ReplyTime='"&Now()&"' WHERE gb_ID="&Request.QueryString("gbID")&"")
	SQLQueryNums=SQLQueryNums+1
	Response.Cookies(CookieName)("LastgbookDate") = Now()'Cookie
	If CheckStr(Request.Form("message"))=Empty Then
		sucmsg=sucmsg & "<li>置回复内容为空!</li>"
	Else
		sucmsg=sucmsg & "<li>回复留言成功!</li>"
	End If
	sucUrl=sucUrl & "guestbook.asp"
	eblog.sys_Suc(sucmsg)
ElseIf Request.QueryString("action")="editgb" Then
	IF IsInteger(Request.QueryString("gbID"))=False Then
		FoundErr=True
		errmsg=errmsg & "<li>参数出现错误!</li>"
	Else
		IF Not (memStatus="8" OR memStatus="7") Then
			FoundErr=True
			errmsg=errmsg & "<li>没有权限!</li>"
		Else
			If CheckStr(Request.Form("message"))<>Empty Then
			Dim IsPublic
			IsPublic=Request.Form("IsPublic")
			IF IsPublic=Empty Then IsPublic=1
				Conn.ExeCute("UPDATE Guestbook SET gb_Content='"&CheckStr(Request.Form("message"))&"',gb_IsPublic="&IsPublic&" WHERE gb_ID="&Request.QueryString("gbID")&"")
				SQLQueryNums=SQLQueryNums+1
				sucmsg=sucmsg & "<li>留言编辑成功!</li>"
				sucUrl=sucUrl & "guestbook.asp"
				eblog.sys_Suc(sucmsg)
			Else
				Dim edit_GB
				Set edit_GB=Conn.Execute("SELECT * FROM Guestbook WHERE gb_ID="&Request.QueryString("gbID")&"")
				If edit_GB.Eof And edit_GB.Bof Then
					FoundErr=True
					errmsg=errmsg & "<li>没有找到数据!</li>"
				Else%>
					<div id="guestbook_main">
					<div id="guestbook_main_bg">
						<script language="JavaScript" src="inc/ubbcode.js" type="text/javascript"></script>
						<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
						  <tr>
							<td width="100%"><strong>留言编辑</strong></td>
						  </tr><form action="guestbook.asp?action=editgb&gbID=<%=edit_GB("gb_ID")%>" method="post" name="input" id="input">
						  <tr>
							<td bgcolor="#FFFFFF" nowrap="nowrap"><textarea name="message" rows="8" wrap="VIRTUAL" class="textarea_bg" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(edit_GB("gb_Content"))%></textarea><br />
							<div align="right">缩放输入框: <span title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onClick="document.input.message.rows+=3"><img src="images/icon_ar2.gif" align="absmiddle" border="0" /></span> <span title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.input.message.rows>=7)document.input.message.rows-=7;else return false'><img src="images/icon_al2.gif" align="absmiddle" border="0" /></span></div>
						  </td>
						  </tr>
						  <tr align="center">
							<td nowrap="nowrap" bgcolor="#FFFFFF">
							<!-- 修正编辑留言时不能编辑是否悄悄话的问题2005/05/21 -->
							<input name="IsPublic" type="checkbox" id="IsPublic" value="0" <%IF edit_GB("gb_IsPublic")=0 Then Response.Write("checked")%>>给管理员的悄悄话
							<input type="submit" name="replysubmit" value="编辑" onClick="this.disabled=true;document.input.submit();" />&nbsp;<input name="Reset" type="reset" id="Reset" value="重置" /></td>
						  </tr></form>
						  <tr>
							<td nowrap="nowrap"><%Response.Write("<strong>"&edit_GB("gb_Author")&"</strong> 于 "&DateToStr(edit_GB("gb_PostTime"),"Y-m-d H:I A")&" 留言：<br />")%></td>
						  </tr>
						  <tr>
							<td nowrap="nowrap" bgcolor="#FFFFFF" class="wordbreak"><%Response.Write(Ubbcode(HTMLEncode(edit_GB("gb_Content")),0,0,0,1,0))%></td>
						  </tr>
						</table>
					</div>
					</div>
				<%End If
				Set edit_GB=Nothing
			End If
		End If
	End If
	if founderr=True then
		eblog.sys_err(errmsg)
	end if
Else%>
<div id="guestbook_main">
<div id="guestbook_main_bg">
	<div id="left">
		<%eblog.placard%>
		<%Dim CurPage
		If CheckStr(Request.QueryString("Page"))<>Empty Then
			Curpage=CheckStr(Request.QueryString("Page"))
			If IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
		Else
			Curpage=1
		End If

		Dim RS_GB
		Set RS_GB=Server.CreateObject("Adodb.Recordset")
		SQL="SELECT * FROM Guestbook "&SQLFiltrate&" ORDER BY gb_PostTime DESC"
		RS_GB.Open SQL,CONN,1,1
		SQLQueryNums=SQLQueryNums+1
		If RS_GB.EOF AND RS_GB.BOF Then 
			Response.Write("暂时没有留言")
		Else
			Dim GB_Nums,gbview_ID,gbview_Author,gbview_Reply,gbview_UserFace
			RS_GB.PageSize=guestbookbpage
			RS_GB.AbsolutePage=CurPage
			GB_Nums=RS_GB.RecordCount
			Dim MultiPages,PageCount
			MultiPages=""&MultiPage(GB_Nums,guestbookbpage,CurPage,Url_Add)&""
			Response.Write("<div>"&MultiPages&"</div>")
			Dim gb_bg,gb_main
			gb_bg = 0
			Do Until RS_GB.EOF OR PageCount=guestbookbpage
				gbview_ID=RS_GB("gb_ID")
				gbview_Author=RS_GB("gb_Author")
				gbview_Reply=RS_GB("gb_Reply")
				gbview_UserFace=RS_GB("gb_UserFace")
				If gb_bg = 0 then
					gb_main = "gb_main_a"
				else
					gb_main = "gb_main_b"
				end if%>
				<a name="gb<%=""&gbview_ID&""%>"></a>
				<div class="<%=""&gb_main&""%>">
				<div class="<%=""&gb_main&""%>_bg">
					<div class="gb_left">
						<strong><a href="member.asp?action=view&memName=<%=""&Server.URLEncode(gbview_Author)&""%>" target="new"><%=""&gbview_Author&""%></a></strong><br />
						<%If gbview_UserFace<>Empty Then Response.Write("<img src=""images/face/"&RS_GB("gb_UserFace")&".gif"" align=""absmiddle"" alt="""" />")%>
					</div>
					<div class="gb_right">
						<%If RS_GB("gb_IsPublic")=1 OR (memStatus="8" OR memStatus="7" OR memName=RS_GB("gb_Author")) Then
							Response.Write(Ubbcode(HTMLEncode(RS_GB("gb_Content")),0,0,0,1,0))%><br />
							<strong><%=""&DateToStr(RS_GB("gb_PostTime"),"Y-m-d H:I A")&""%></strong>
							<%If memStatus=8 OR memStatus=7 Then Response.Write("&nbsp;&nbsp;<a href=""guestbook.asp?action=delegb&gbID="&gbview_ID&""" title=""删除留言"" onClick=""winconfirm('你真的要删除这个留言吗？','guestbook.asp?action=delegb&gbID="&gbview_ID&"'); return false""><strong><font color=""#FF0000"">×</font></strong></a>&nbsp;|&nbsp;<a href=""http://whois.pconline.com.cn/whois/?ip="&RS_GB("gb_PostIP")&""" title=""点击查看IP地址："&RS_GB("gb_PostIP")&" 的来源"" target=""new"">IP</a>&nbsp;|&nbsp;<a href=""guestbook.asp?action=replygb&gbID="&gbview_ID&""" title=""点击回复"">Reply</a>&nbsp;|&nbsp;<a href=""guestbook.asp?action=editgb&gbID="&gbview_ID&""" title=""点击编辑"">Edit</a>")
							If gbview_Reply<>Empty Then%>
								<div class="gb_reply">
									<div class="gb_reply_head"><strong><%=""&RS_GB("gb_ReplyAuthor")&""%></strong> Reply At：<%=""&DateToStr(RS_GB("gb_ReplyTime"),"Y-m-d H:I A")&""%></div>
									<div class="gb_reply_main"><%=""&Ubbcode(HTMLEncode(RS_GB("gb_Reply")),0,0,0,1,0)&""%></div>
								</div>
							<%End If
						Else
							If gbview_Reply<>Empty Then
								Response.Write("(<font color=red>已回复</font>)此留言仅管理员以及发表人可以浏览")
							Else
								Response.Write("此留言仅管理员以及发表人可以浏览")
							End If
						End If%>
					</div>
				</div>
				</div>
				<%RS_GB.MoveNext
				gb_bg = gb_bg + 1
				If gb_bg = 2 then gb_bg = 0
				PageCount=PageCount+1
			Loop
		End If
		RS_GB.Close
		Set RS_GB=Nothing
		Response.Write(MultiPages)%>
		<%If eblog.chkiplock() then
			Response.Write("<br><br><div align=""center""><h4>对不起!你的IP已被锁定,不允许发表留言！</h4></div>")
		Else%>
			<script language="JavaScript" src="inc/ubbcode.js" type="text/javascript"></script>
			<script language="JavaScript" src="inc/face.js" type="text/javascript"></script>
			<div class="gbpost_head"><h4>Post Message</h4></div>
			<div class="gbpost_main">
			<div class="gbpost_main_bg"><form name="inputform" method="post" action="guestbook.asp?action=postgb" onSubmit="return Verifycomment();">
				<div class="gbpost_left">
					<table border="0" cellPadding="0" cellSpacing="1" bgcolor="#b6d8e0">
					  <tr>
						<td width="60" height="60" align="center" bgcolor="#FFFFFF"><IMG id="FacePic" src="images/face/1.gif"></td>
						<td align="center" vAlign="top" class="tablelayer">
							<div id="Face" class="face_show"><!--#include file="inc/face.asp" --></div>
							<div style="padding-top:4px;"><img src="images/face_show.gif" alt="Choose other face" border="0" onClick="yagu()" onMouseOver="this.className='FaceDown'"></div>
						</td>
					  </tr>
					  <tr>
						<td colspan="2" align="center" bgcolor="#FFFFFF">选择头像</td>
					  </tr>
					</table>
				</div>
				<div class="gbpost_right">
					<p>昵称：
					<%IF memName<>Empty Then%>
						<input name="username" type="text" id="username" value="<%=""&memName&""%>" class="input_bg2" size="12" readonly />
					<%Else%>
						<input name="username" type="text" id="username" class="input_bg2" size="12" maxlength="10" onMouseOver="this.focus();" />&nbsp;&nbsp;
						密码：<input name="MemPassword" type="password" id="MemPassword" class="input_bg2" size="12" maxlength="12" />&nbsp;&nbsp;
						<%If Setting(6)="1" Then%>
							<input name="SaveMem" type="checkbox" id="SaveMem" class="input_bg1" value="1" /> 注册成员?
						<%End If%>
					<%End IF%>
					</p>
					<p><textarea name="message" class="textarea_bg" rows="6" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"></textarea></p>
					<div style="float: right">缩放输入框: <span title="放大" style="cursor:hand" onClick="document.inputform.message.rows+=5"><img src="images/icon_ar2.gif" align="absmiddle" border="0" /></span> <span title="缩小" style="cursor:hand" onclick='if(document.inputform.message.rows>=5)document.inputform.message.rows-=5;else return false'><img src="images/icon_al2.gif" align="absmiddle" border="0" /></span></div>
					<p><%=eblog.getcode(2)%><input name="hidden_message" type="checkbox" id="hidden_message" value="0" /> 隐藏内容</p>
					<p>
						<input id="userface" type="hidden" value="1" name="userface" />
						<input class="postbtn" type="submit" name="replysubmit" onClick="this.disabled=true;document.inputform.submit();" value="发表" />&nbsp;&nbsp;
						<input class="postbtn" name="Reset" type="reset" id="Reset" value="重置" /></p>
				</div></form>
			</div>
			</div>
		<%End If%>
	</div>
	<div id="right">
		<%Call CategoryList(2)
		Call NewBlogList%>
		<div class="siderbar_head"><span class="gaoliang">最新评论</span></div>
		<div class="siderbar_main">
			<%Call NewCommList(20)%>
		</div>
		<%Call blogSearch
		Call Others%>
	</div>
</div>
</div>
<%End If%>
<!--#include file="footer.asp" -->