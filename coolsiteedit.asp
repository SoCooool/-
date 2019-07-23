<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<%
If eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4>"):response.End()
IF Request.QueryString("action")<>"postedit" Then
	Dim C_ID
	C_ID=CheckStr(Request.QueryString("ID"))
	Dim c_Edit
	Set c_Edit=Conn.Execute("SELECT * FROM coolsite WHERE c_ID="&C_ID&"")
	SQLQueryNums=SQLQueryNums+1
	IF c_Edit.EOF AND c_Edit.BOF Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<h4>不存在该酷站</h4>
				<p>&nbsp;</p>
				<div><a href="default.asp">点击返回主页面</a></div>
			</td>
		  </tr>
		</table>
	<%Else
		IF Not((c_Edit("c_Author")=memName AND memStatus="7") OR memStatus="8") Then%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td align="center" valign="middle" height="120">
					<h4>没有权限修改酷站</h4>
					<p>&nbsp;</p>
					<div><a href="default.asp">返回首页</a>或<a href="login.asp">重新登陆</a></div>
				</td>
			  </tr>
			</table>
		<%Else%>
			<script language="JavaScript" src="inc/ubbcode.js"></script>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="4" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td width="100%" valign="top">
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
					  <tr align="center">
						<td colspan="3" class="header2">修改酷站</td>
					  </tr>
					  <form name="input" method="post" action="coolsiteedit.asp?action=postedit">
					  <tr bgcolor="#FFFFFF">
						<td width="120" rowspan="7" align="center" valign="middle">
							<%IF c_Edit("c_Image")<>Empty Then
								Response.Write("<img src="&c_Edit("c_Image")&" width='100' height='100'>")
							else
								Response.Write("<img src='images/nonpreview.gif' width='100' height='100'>")
							end if%>
						</td>
						<td width="100" align="right">站名：</td>
						<td><input name="c_Name" type="text" id="c_Name" value="<%=c_Edit("c_Name")%>" size="40" maxlength="100"></td>
					  </tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right">地址：</td>
						<td><input name="c_URL" type="text" id="c_URL" value="<%=c_Edit("c_URL")%>" size="40" maxlength="255"></td>
					  </tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right">设计：</td>
						<td><input name="c_Designer" type="text" id="c_Designer" value="<%=c_Edit("c_Designer")%>" size="40" maxlength="50"></td>
					  </tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right">说明：</td>
						<td><textarea name="message" cols="60" rows="4" wrap="VIRTUAL" id="message"><%=c_Edit("c_Info")%></textarea></td>
					  </tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right">操作：</td>
						<td><input name="c_Istop" type="checkbox" id="c_Istop" value="1" <%IF c_Edit("c_Istop")=True Then Response.Write("checked")%> /> 置顶酷站 <input name="c_TopShow" type="checkbox" id="c_TopShow" value="1" <%IF c_Edit("c_TopShow")=True Then Response.Write("checked")%> /> 推荐酷站 <input name="delete" type="checkbox" value="1" /> 删除</tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right">站标：</td>
						<td><input name="Image" type="text" id="Image" value="<%=c_Edit("c_Image")%>" size="40" maxlength="255" /></td>
					  </tr>
						<tr bgcolor="#FFFFFF">
						<td align="right">推荐图象：</td>
						<td><input name="c_TopShow_Image" type="text" id="c_TopShow_Image" value="<%=c_Edit("c_TopShow_Image")%>" size="40" maxlength="255" /></td>
					  </tr>
					  <tr bgcolor="#FFFFFF">
						<td align="right"><b>上传站标:</b></td>
						<td colspan="2"><iframe border="0" frameBorder="0" frameSpacing="0" height="23" marginHeight="0" marginWidth="0" noResize scrolling="no" width="100%" vspale="0" src="attachment_e.asp"></iframe></td>
					  </tr>
					  <tr align="center" bgcolor="#FFFFFF">
						<td colspan="3"><input name="c_ID" type="hidden" id="c_ID" value="<%=c_Edit("c_ID")%>">&nbsp;<input name="editsubmit" type="submit" value=" 修改 " onClick="this.disabled=true;document.input.submit();">&nbsp;<input name="L_Reset" type="reset" id="L_Reset" value=" 重置 " /></td>
					  </tr>
					  </form>
					</table>
				</td>
			  </tr>
			</table>
		<%End IF
	End IF
	Set c_Edit=Nothing
Else%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>修改酷站</h4>
			<p>&nbsp;</p>
			<%IF Request.Form("C_Name")=Empty OR Request.Form("c_URL")=Empty Then
				Response.Write("必须填写完整信息! <br /><a href='javascript:history.go(-1);'>返回</a>")
			ElseIF Request.Form("delete")="1" Then
				Conn.ExeCute("DELETE * FROM coolsite WHERE c_ID="&Request.Form("c_ID"))
				Conn.ExeCute("UPDATE blog_Info SET CoolsiteNums=CoolsiteNums-1")
				SQLQueryNums=SQLQueryNums+2
				Application.Lock
				Application.UnLock
				Response.Write("该酷站删除成功<p>&nbsp;</p>")
			Else
				dim cC_ID,c_Info,C_Name,c_URL,c_Image,c_Designer,c_Istop,c_TopShow,c_TopShow_Image
				cC_ID=Request.Form("c_ID")
				C_Name=CheckStr(Request.Form("c_Name"))
				c_URL=Request.Form("c_URL")
				c_Info=CheckStr(Request.Form("message"))
				c_Image=Request.Form("Image")
				c_Designer=Request.Form("c_Designer")
				'Istop=Request.Form("c_Istop")
				'TopShow=Request.Form("TopShow")
				'IF Istop=Empty Then Istop=0
				'IF TopShow=Empty Then TopShow=0
				IF Request.Form("c_Istop")="1" Then
					c_Istop=True
				Else
					c_Istop=False
				End IF
				IF Request.Form("c_TopShow")="1" Then
					c_TopShow=True
				Else
					c_TopShow=False
				End IF
				c_TopShow_Image=Request.Form("c_TopShow_Image")
				Conn.ExeCute("UPDATE coolsite Set c_Name='"&c_Name&"',c_Info='"&c_Info&"',c_URL='"&c_URL&"',c_Image='"&c_Image&"',c_Designer='"&c_Designer&"',c_Istop="&c_Istop&",c_TopShow="&c_TopShow&",c_TopShow_Image='"&c_TopShow_Image&"' WHERE c_ID="&cC_ID&"")
				SQLQueryNums=SQLQueryNums+1
				Response.Write("<a href='coolsite.asp?id="&cC_ID&"'>点击返回所修改酷站，或者等待3秒后自动返回该酷站<meta http-equiv='refresh' content='3;url=coolsite.asp'><br /><br />")
			End IF%>
			<div><a href="coolsite.asp">点击返回</a></div>
		</td>
	  </tr>
	</table>
<%End IF%>
<!--#include file="footer.asp" -->