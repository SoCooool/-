<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbhelp.js"></script>
<script language="JavaScript" src="inc/ubbcode.js"></script>
<%
dim founderr,errmsg,sucmsg,sucUrl
dim action
action=trim(request("action"))
if action="save_comment" then
	call save_comment()
else
	call main()
end if
sub main()
	Dim comms_ID
	comms_ID=CheckStr(Request.QueryString("commID"))
	Dim comm_Edit
	Set comm_Edit=Conn.Execute("SELECT * FROM blog_Comment WHERE comm_ID="&comms_ID&"")
	SQLQueryNums=SQLQueryNums+1
	IF comm_Edit.EOF AND comm_Edit.BOF Then
		FoundErr=True
		errmsg=errmsg & "<li>不存在该评论!</li>"
	Else
		IF Not((comm_Edit("comm_Author")=memName OR memStatus="7") OR memStatus="8") Then
			FoundErr=True
			errmsg=errmsg & "<li>没有权限修改评论!</li>"
		ElseIF Not((comm_Edit("comm_EditNums")<=2 OR memStatus="7") OR memStatus="8") Then
			FoundErr=True
			errmsg=errmsg & "<li>修改评论次数不能超过3次!</li>"
		Else%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF">
				<tr><td width="100%" valign="top">
				<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
				<tr align="center"><td colspan="2" class="header2">修改评论</td></tr>
				<form name="inputform" method="post" action="commedit.asp?action=save_comment">
				<tr bgcolor="#FFFFFF"><td align="right" width="40"><strong>内容：</strong>
			</td>
				<td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr><td width="100%"><!--#include file="inc/editform.asp" -->
				  </td></tr>
				<tr valign="top"><td><textarea name="message" style="width:99%;" rows="8" wrap="VIRTUAL" id="message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(comm_Edit("comm_Content"))%></textarea></td>
				</tr></table>
				<select name="comm_Face" id="comm_Face" onChange="document.images['show_face'].src=options[selectedIndex].value;" size="1">
				<option value="1" <%If comm_Edit("comm_Face")="1" Then Response.Write("selected")%>>头像1</option>
				<option value="2" <%If comm_Edit("comm_Face")="2" Then Response.Write("selected")%>>头像2</option>	 
				<option value="3" <%If comm_Edit("comm_Face")="3" Then Response.Write("selected")%>>头像3</option>
				<option value="4" <%If comm_Edit("comm_Face")="4" Then Response.Write("selected")%>>头像4</option>
				<option value="5" <%If comm_Edit("comm_Face")="5" Then Response.Write("selected")%>>头像5</option>
				<option value="6" <%If comm_Edit("comm_Face")="6" Then Response.Write("selected")%>>头像6</option>
				<option value="7" <%If comm_Edit("comm_Face")="7" Then Response.Write("selected")%>>头像7</option>
				<option value="8" <%If comm_Edit("comm_Face")="8" Then Response.Write("selected")%>>头像8</option>
				<option value="9" <%If comm_Edit("comm_Face")="9" Then Response.Write("selected")%>>头像9</option>
				<option value="10" <%If comm_Edit("comm_Face")="10" Then Response.Write("selected")%>>头像10</option>
				<option value="11" <%If comm_Edit("comm_Face")="11" Then Response.Write("selected")%>>头像11</option>
				<option value="12" <%If comm_Edit("comm_Face")="12" Then Response.Write("selected")%>>头像12</option>
				<option value="13" <%If comm_Edit("comm_Face")="13" Then Response.Write("selected")%>>头像13</option>
				<option value="14" <%If comm_Edit("comm_Face")="14" Then Response.Write("selected")%>>头像14</option>
				<option value="15" <%If comm_Edit("comm_Face")="15" Then Response.Write("selected")%>>头像15</option>
				<option value="16" <%If comm_Edit("comm_Face")="16" Then Response.Write("selected")%>>头像16</option>
				<option value="17" <%If comm_Edit("comm_Face")="17" Then Response.Write("selected")%>>头像17</option>
				<option value="18" <%If comm_Edit("comm_Face")="18" Then Response.Write("selected")%>>头像18</option>
				<option value="19" <%If comm_Edit("comm_Face")="19" Then Response.Write("selected")%>>头像19</option>
				<option value="20" <%If comm_Edit("comm_Face")="20" Then Response.Write("selected")%>>头像20</option>
				<option value="22" <%If comm_Edit("comm_Face")="22" Then Response.Write("selected")%>>头像22</option>
				<option value="22" <%If comm_Edit("comm_Face")="22" Then Response.Write("selected")%>>头像22</option>
				<option value="23" <%If comm_Edit("comm_Face")="23" Then Response.Write("selected")%>>头像23</option>
				<option value="24" <%If comm_Edit("comm_Face")="24" Then Response.Write("selected")%>>头像24</option>
				</select>&nbsp;<img id="show_face" src="images/face/<%=comm_Edit("comm_Face")%>.gif" align="absmiddle" />
				<input name="comm_DisSM" type="checkbox" id="comm_DisSM" value="1" <%IF comm_Edit("comm_DisSM")=1 Then Response.Write("checked")%>>禁止表情
				<input name="comm_DisUBB" type="checkbox" id="comm_DisUBB" value="1" <%IF comm_Edit("comm_DisUBB")=1 Then Response.Write("checked")%>>禁止 UBB
				<input name="comm_DisIMG" type="checkbox" id="comm_DisIMG" value="1" <%IF comm_Edit("comm_DisIMG")=1 Then Response.Write("checked")%>>禁止图像
				<input name="comm_AutoURL" type="checkbox" id="comm_AutoURL" value="1" <%IF comm_Edit("comm_AutoURL")=1 Then Response.Write("checked")%>>识别URL
				<input name="comm_AutoKEY" type="checkbox" id="comm_AutoKEY" value="1" <%IF comm_Edit("comm_AutoKEY")=1 Then Response.Write("checked")%>>识别关键字
				<input name="comm_Hide" type="checkbox" id="comm_Hide" value="1" <%IF comm_Edit("comm_Hide")=1 Then Response.Write("checked")%>>隐藏评论</td></tr>
				<tr bgcolor="#FFFFFF">
				  <td align="right"><strong>表情：</strong></td>
				  <td>
				<%Dim log_SmiliesListNums,log_SmiliesListNumI
					log_SmiliesListNums=Ubound(Arr_Smilies,2)
					TempVar=""
					For log_SmiliesListNumI=0 To log_SmiliesListNums
						Response.Write(TempVar&"<img onmouseover=""this.style.cursor='hand';"" onclick=""AddText('"&Arr_Smilies(2,log_SmiliesListNumI)&"');"" src=""images/smilies/"&Arr_Smilies(1,log_SmiliesListNumI)&""" />")
						TempVar=" "
					Next%></td>
				  </tr>
				<tr bgcolor="#FFFFFF">
				<td align="right"><strong>附件：</strong></td>
				<td valign="middle"><iframe border="0" frameBorder="0" frameSpacing="0" height="23" marginHeight="0" marginWidth="0" noResize="noResize" scrolling="no" width="100%" vspale="0" src="attachment.asp"></iframe></td></tr>
				<tr align="center" bgcolor="#FFFFFF">
				<td colspan="2">
					<%IF memStatus="7" OR memStatus="8" Then%>
						 所在日志：<input name="blog_ID" type="text" id="blog_ID" value="<%=""&comm_Edit("blog_ID")&""%>" size="2" maxlength="4" />
					<%Else%>
						<input name="blog_ID" type="hidden" id="blog_ID" value="<%=""&comm_Edit("blog_ID")&""%>" />
					 <%End If%>
					 &nbsp;<input name="comm_ID" type="hidden" id="comm_ID" value="<%=comm_Edit("comm_ID")%>"><input name="editsubmit" type="submit" value="修改评论[Ctrl+Enter]" onClick="this.disabled=true;document.inputform.submit();">&nbsp;<input name="L_Reset" type="button" id="L_Reset" value=" 重置评论 " onclick="javascript:history.go(-1);"></td></tr>
				</form></table></td>
			  </tr>
			</table>
		<%End IF
	End IF
	Set comm_Edit=Nothing
End Sub
Sub save_comment()
	IF Request.Form("message")=Empty Then
		FoundErr=True
		errmsg=errmsg & "<li>必须填写评论内容!</li>"
	End If
	IF CheckStr(Request.Form("message"))<>Empty And Len(CheckStr(Request.Form("message")))<cint(Setting(10)) Or Len(CheckStr(Request.Form("message")))>cint(Setting(11)) Then
		FoundErr=True
		errmsg=errmsg & "<li>内容字数为"&Setting(10)&"-"&Setting(11)&"个字符!</li>"
	End If
	If founderr<>True Then
		Dim comm_Content,comm_ID,blog_ID,comm_DisSM,comm_DisUBB,comm_DisIMG,comm_Modify,comm_IsShow,comm_AutoURL,comm_AutoKEY,comm_Hide,comm_IsTop,comm_Disent,comm_Face
		comm_Content=CheckStr(Request.Form("message"))
		comm_Content=eblog.filt_badword(comm_Content)
		comm_ID=Request.Form("comm_ID")
		blog_ID=Request.Form("blog_ID")
		comm_DisSM=Request.Form("comm_DisSM")
		comm_DisUBB=Request.Form("comm_DisUBB")
		comm_DisIMG=Request.Form("comm_DisIMG")
		comm_AutoURL=Request.Form("comm_AutoURL")
		comm_AutoKEY=Request.Form("comm_AutoKEY")
		comm_Hide=Request.Form("comm_Hide")
		comm_Face=Request.Form("comm_Face")
		IF comm_DisSM=Empty Then comm_DisSM=0
		IF comm_DisUBB=Empty Then comm_DisUBB=0
		IF comm_DisIMG=Empty Then comm_DisIMG=0
		IF comm_AutoURL=Empty Then comm_AutoURL=0
		IF comm_AutoKEY=Empty Then comm_AutoKEY=0
		IF comm_Hide=Empty Then comm_Hide=0
		Dim comm_MoveToSQL
		Conn.ExeCute("UPDATE blog_Comment Set blog_ID='"&blog_ID&"',comm_Content='"&comm_Content&"',comm_DisSM="&comm_DisSM&",comm_DisUBB="&comm_DisUBB&",comm_DisIMG="&comm_DisIMG&",comm_AutoURL="&comm_AutoURL&",comm_AutoKEY="&comm_AutoKEY&",comm_Hide="&comm_Hide&",comm_Face="&comm_Face&" WHERE comm_ID="&comm_ID&"")
		Conn.ExeCute("UPDATE blog_Comment Set comm_editnums=comm_editnums+1 WHERE comm_ID="&comm_ID&"")
		SQLQueryNums=SQLQueryNums+2
		Application.Lock
		Application.Contents(CookieName&"_blog_LastComm") = ""
		Application.UnLock
		sucmsg=sucmsg & "<li>修改评论成功!</li>"
		sucUrl=sucUrl & "blogview.asp?logID="&blog_ID&"#"&comm_ID&""
		if founderr<>True then
			eblog.sys_Suc(sucmsg)
		end if
	End IF%>
<%End Sub%>
<%
if founderr=True then
	eblog.sys_err(errmsg)
end if
%>
<!--#include file="footer.asp" -->