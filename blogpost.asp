<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbhelp.js"></script>
<script language="JavaScript" src="inc/ubbcode.js"></script>
<div id="default_main">
<%IF memStatus<>"7" AND memStatus<>"8" Then%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td height="120" align="center" valign="middle">
			<h4>没有权限发表新日志</h4>
			<p>&nbsp;</p>
			<p><a href="default.asp">点击返回主页面</a> 或者 <a href="login.asp">用管理员帐户重新登陆</a></p>
		</td>
	  </tr>
	</table>
<%Else
	IF Request.Form("PostBLOG")=Empty Then%>
		<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
		  <tr align="center">
			<td colspan="2">发表新日志</td>
		  </tr>
		  <form name="inputform" method="post" action="" onsubmit="return CheckInputForm();">
		  <tr bgcolor="#FFFFFF">
			<td align="right" nowrap><strong>日志分类：</strong></td>
			<td>
				<select name="log_CateID" id="log_CateID" class="select_bg">
					<option value="0">-- 请选择分类 --</option>
					<%Dim log_CateNums,log_CateNumI
					log_CateNums=Ubound(Arr_Category,2)
					For log_CateNumI=0 To log_CateNums
					Response.Write("<option value='"&Arr_Category(0,log_CateNumI)&"'>"&Arr_Category(1,log_CateNumI)&"</option>")
					Next%>
				</select>
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
			<td width="112" align="right" nowrap><strong>标题：</strong></td>
			<td width="100%"><input name="log_Title" type="text" class="input_bg" id="log_Title" size="50"></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
			<td align="right"><strong>属性：</strong></td>
			<td>
				<input name="log_IsShow" type="radio" value="0" checked>公开日志
				<input type="radio" name="log_IsShow" value="1">隐藏日志
				<input name="log_IsTop" type="checkbox" id="log_IsTop" value="1">置顶日志
				<input name="log_DisComment" type="checkbox" id="log_DisComment" value="1">禁止评论
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
			<td align="right"><strong>来自：</strong></td>
			<td>
				<input name="log_From" type="text" class="input_bg" id="log_From" value="<%=eblog.setup(1,0)%>" size="12">
				<strong>地址：</strong><input name="log_FromURL" type="text" class="input_bg" id="log_FromURL" value="<%=eblog.setup(2,0)%>" size="40">
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		    <td align="right"><strong>日期/时间：</strong></td>
		    <td><input class="input_bg" type="text" value="<%=Year(now())%>" name="log_PostYear" maxlength="4" size="4" />年
				<input class="input_bg" type="text" value="<%=month(now())%>" name="log_PostMonth" maxlength="2" size="2" />月
				<input class="input_bg" type="text" value="<%=day(now())%>" name="log_PostDay" maxlength="2" size="2" />日&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="log_Weather" size="1" class="select_bg" id="log_Weather" onChange="document.images['show_Weather'].src='images/weather/'+options[selectedIndex].value.split('|')[0]+'.gif';">
					<option value="0|Weather">选择天气</option>
					<option value="1|晴天">晴天</option>
					<option value="2|晴间多云">晴间多云</option>
					<option value="3|多云">多云</option>
					<option value="4|阵雨">阵雨</option>
					<option value="5|雨天">雨天</option>
					<option value="6|沙暴">沙暴</option>
					<option value="7|飞雪">飞雪</option>
					<option value="8|疾风">疾风</option>
					<option value="9|霜冻">霜冻</option>
			  	</select>&nbsp;<img id="show_Weather" src="images/weather/0.gif" align="absmiddle">&nbsp;&nbsp;
				<select name="log_emot" id="log_emot" class="select_bg" onChange="document.images['show_emot'].src='images/emot/'+options[selectedIndex].value.split('|')[0]+'.gif';" size="1">
					<option value="0" selected="selected">心情指数</option>
					<option value="1">一星</option>
					<option value="2">二星</option>
					<option value="3">三星</option>
					<option value="4">四星</option>
					<option value="5">五星</option>
				</select>&nbsp;<img id="show_emot" src="images/emot/0.gif" align="absmiddle">
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		    <td align="right" valign="top">
				<strong>内容：</strong>
				<div style="padding: 30px 0 0 8px;" align="left">
					<p><input name="log_DisSM" type="checkbox" id="log_DisSM" value="1">禁止表情</p>
					<p><input name="log_DisUBB" type="checkbox" id="log_DisUBB" value="1">禁止UBB</p>
					<p><input name="log_DisIMG" type="checkbox" id="log_DisIMG" value="1">禁止图片</p>
					<p><input name="log_AutoURL" type="checkbox" id="log_AutoURL" value="1" checked="CHECKED">识别链接</p>
					<p><input name="log_AutoKEY" type="checkbox" id="log_AutoKEY" value="1" checked="checked">识别关键字</p>
				</div>
			</td>
		    <td valign="top">
				<!--#include file="inc/editform.asp" -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				  <tr valign="top">
					<td>
						<textarea name="message" class="textarea_bg" rows="12" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea>
						<div align="right">缩放输入框: <span title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick="document.inputform.message.rows+=4"><img src="images/icon_ar2.gif" align="absbottom" alt="" /></span><span title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.message.rows>4)document.inputform.message.rows-=4;else return false'><img src="images/icon_al2.gif" align="absbottom" alt="" /></span></div>
						内容摘要：(可不填写项,主要面页将直接显示主要内容)
						<textarea name="log_Intro" class="textarea_bg" rows="6" wrap="VIRTUAL" id="log_Intro" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea>
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
		  <tr bgcolor="#FFFFFF">
			<td align="right"><strong>引用：</strong></td>
			<td>
				<p><input name="log_Quote" class="input_bg" type="text" id="log_Quote" size="90" /></p>
				<p>要引用另一个用户的网络日志项，请输入以上网络日志项的引用通告 URL。用分号;分隔多个地址</p>
			</td>
		  </tr>
		  <tr align="center" bgcolor="#FFFFFF">
			<td colspan="2">
				<input name="PostBlog" type="hidden" value="PostIT" />
				<input name="SubmitBtn" type="submit" class="postbtn" onClick="this.disabled=true;document.inputform.submit();" value="提交日志" />
				<input name="L_Reset" type="reset" class="postbtn" id="L_Reset" value="重置" />
			</td>
		  </tr>
		  </form>
		</table>
	<%Else%>
		<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
		  <tr>
			<td align="center" nowrap><h4>保存日志</h4></td>
		  </tr>
		  <tr>
			<td align="center" valign="middle" bgcolor="#FFFFFF" height="160">
				<%If Request.Form("log_CateID")=0 OR Request.Form("log_CateID")=Empty Then
					Response.Write("<p>必须选择分类</p><p><a href='javascript:history.go(-1);'>请返回</a></p>")
				ElseIF Request.Form("message")=Empty OR Request.Form("log_Title")=Empty Then
					Response.Write("<p>必须填写日志内容</p><p><a href='javascript:history.go(-1);'>请返回重新填写</a></p>")
				Else
					Dim Log_Title,log_Intro,log_Content,log_From,log_FromURL,log_CateID,log_Quote,log_DisSM,log_DisUBB,log_DisIMG,log_AutoURL,log_IsShow,log_AutoKEY,log_IsTop,log_DisComment,log_PostYear,log_PostMonth,log_PostDay,log_Weather,log_Emot
					log_Title=CheckStr(Request.Form("log_Title"))
					log_Content=CheckStr(Request.Form("message"))
					log_Intro=CheckStr(Request.Form("log_Intro"))
					log_From=CheckStr(Request.Form("log_From"))
					log_FromURL=CheckStr(Request.Form("log_FromURL"))
					log_CateID=Request.Form("log_CateID")
					log_Quote=CheckStr(Request.Form("log_Quote"))
					log_DisSM=Request.Form("log_DisSM")
					log_DisUBB=Request.Form("log_DisUBB")
					log_DisIMG=Request.Form("log_DisIMG")
					log_AutoURL=Request.Form("log_AutoURL")
					log_AutoKEY=Request.Form("log_AutoKEY")
					log_Weather=Request.Form("log_Weather")
					IF Request.Form("log_IsTop")="1" Then
						log_IsTop=True
					Else
						log_IsTop=False
					End IF
					IF Request.Form("log_IsShow")="0" Then
						log_IsShow=True
					Else
						log_IsShow=False
					End IF
					If Request.Form("log_DisComment")="1" Then
						log_DisComment=True
					Else
						log_DisComment=False
					End IF
					log_PostYear=Request.Form("log_PostYear")
					log_PostMonth=Request.Form("log_PostMonth")
					log_PostDay=Request.Form("log_PostDay")
					log_emot=Request.Form("log_emot")
					IF log_DisSM=Empty Then log_DisSM=0
					IF log_DisUBB=Empty Then log_DisUBB=0
					IF log_DisIMG=Empty Then log_DisIMG=0
					IF log_AutoURL=Empty Then log_AutoURL=0
					IF log_AutoKEY=Empty Then log_AutoKEY=0
					Conn.ExeCute("INSERT INTO blog_Content(log_CateID,log_Title,log_Author,log_Intro,log_Content,log_From,log_FromURL,log_Quote,log_DisSM,log_DisUBB,log_DisIMG,log_AutoURL,log_AutoKEY,log_IsShow,log_IsTop,log_DisComment,log_PostYear,log_PostMonth,log_PostDay,log_Weather,log_emot) VALUES ("&log_CateID&",'"&log_Title&"','"&memName&"','"&log_Intro&"','"&log_Content&"','"&log_From&"','"&log_FromURL&"','"&log_Quote&"',"&log_DisSM&","&log_DisUBB&","&log_DisIMG&","&log_AutoURL&","&log_AutoKEY&","&log_IsShow&","&log_IsTop&","&log_DisComment&","&log_PostYear&","&log_PostMonth&","&log_PostDay&",'"&log_Weather&"','"&log_emot&"')")
					Dim PostLogID
					PostLogID=Conn.ExeCute("SELECT TOP 1 log_ID FROM blog_Content ORDER BY log_ID DESC")(0)
					Conn.ExeCute("UPDATE blog_Member SET mem_PostLogs=mem_PostLogs+1 WHERE mem_Name='"&memName&"'")
					Conn.ExeCute("UPDATE blog_Info SET blog_LogNums=blog_LogNums+1")
					Conn.ExeCute("UPDATE blog_Category SET cate_Nums=cate_Nums+1 WHERE cate_ID="&Request.Form("log_CateID")&"")
					SQLQueryNums=SQLQueryNums+4
					Response.Write("<p>填写日志成功</p><p>&nbsp;</p><p><a href=""default.asp"">点击返回首页</a></p><p>&nbsp;</p><p><a href='blogview.asp?logID="&PostLogID&"'>返回你所发表的日志</a></p><p>&nbsp;</p><p>等待3秒后自动返回你所发表的日志<meta http-equiv='refresh' content='3;url=blogview.asp?logID="&PostLogID&"'></p>")
					IF log_Quote<>Empty And log_IsShow=True Then
						Dim log_QuoteEvery,log_QuoteArr
						log_QuoteArr=Split(log_Quote,";")
						For Each log_QuoteEvery In log_QuoteArr
							Dim TBlogID,TBlogTmp,tbCode,tbMessage
							TBlogID=Conn.Execute("SELECT TOP 1 log_ID FROM blog_Content WHERE log_Author='"&memName&"' AND log_Quote='"&log_Quote&"' ORDER BY log_PostTime DESC")(0)
							SQLQueryNums=SQLQueryNums+1
							If TBlogID>0 then
								TBlogTmp=Split(Trackback(Trim(log_QuoteEvery), siteURL&"/blogview.asp?logID="&TBlogID, log_Title, CutStr(log_Intro,252), siteName),"$$")
								tbCode=TBlogTmp(0)
								tbMessage=TBlogTmp(1)
								If tbCode="0" Then 
									tbMessage="<br /><font color=""red"">"&tbMessage&"</font>" 
								Else 
									tbMessage="<br /><font color=""blue"">"&tbMessage&"</font>"
								End If
							End if
						Next
					End IF
				End IF%>
			</td>
		  </tr>
		</table>
	<%End IF
End IF%>
</div>
<!--#include file="footer.asp" -->