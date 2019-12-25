<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/md5.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbcode.js"></script>
<script language="JavaScript" src="inc/ubbcode.js"></script>
<%IF memStatus<>"8" Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>没有权限发布新酷站</h4>
			<p>&nbsp;</p>
			<div><a href="default.asp">点击返回主页面</a></div>
		</td>
	  </tr>
	</table>
<%ElseIF Request.Form("Postcoolsite")=Empty Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="4" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
			  <tr align="center">
				<td colspan="3"><strong>发布新酷站</strong></td>
			  </tr>
			  <form action="" method="post" name="inputform" id="inputform">
			  <tr bgcolor="#FFFFFF">
				<td width="112" align="right" nowrap="nowrap">站点名称：</td>
				<td width="100%"><input name="c_Name" type="text" id="c_Name" size="50" maxlength="100"></td></tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right">站点地址：</td>
				<td><input name="c_URL" type="text" id="c_URL" value="" size="50" maxlength="200"></td></tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right">站点设计：</td>
				<td><input name="c_Designer" type="text" id="c_Designer" value="" size="30" maxlength="50"></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right" valign="top">站点介绍：</td>
				<td><textarea name="message" style="width:99%" rows="6" wrap="VIRTUAL" id="message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea><div align="right">缩放输入框: <span title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick="document.input.message.rows+=4"><img src="images/icon_ar2.gif" border="0" align="absmiddle" /></span> <span title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.input.message.rows>=4)document.input.message.rows-=4;else return false'><img src="images/icon_al2.gif" border="0" align="absmiddle" /></span></div></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right">操作：</td>
				<td><input name="c_Istop" type="checkbox" id="c_Istop" value="1">置顶&nbsp;<input name="c_TopShow" type="checkbox" id="c_TopShow" value="1">推荐&nbsp;&nbsp;&nbsp;&nbsp;推荐图片：<input name="c_TopShow_Image" type="text" id="c_TopShow_Image" value="" size="40" maxlength="100"></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right">站点标志：</td>
				<td><input name="Image" type="text" id="Image" value="" size="50" maxlength="255"></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td align="right"><strong>上传站点标志：</strong></td>
				<td><iframe border="0" frameborder="0" framespacing="0" height="23" marginheight="0" marginwidth="0" noresize="noResize" scrolling="No" width="100%" vspale="0" src="attachment_e.asp"></iframe></td>
			  </tr>
			  <tr align="center" bgcolor="#FFFFFF">
				<td colspan="2"><input name="Postcoolsite" type="hidden" value="PostIT"><input name="topicsubmit" type="submit" value="提交" onClick="this.disabled=true;document.inputform.submit();">&nbsp;<input name="L_Reset" type="reset" id="L_Reset" value="重置"></td>
			  </tr>
			  </form>
			</table>
		</td>
	  </tr>
	</table>
<%Else%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>发布新酷站</h4>
			<p>&nbsp;</p>
			<%IF Request.Form("message")=Empty OR Request.Form("c_Name")=Empty OR Request.Form("c_URL")=Empty Then
				Response.Write("<p>必须填写内容</p><p><a href='javascript:history.go(-1);'>请返回重新填写</a></p>")
			Else
				Dim c_Name,c_Info,c_URL,c_Designer,c_Image,c_Istop,c_TopShow,c_TopShow_Image
				c_Name=CheckStr(Request.Form("c_Name"))
				c_Info=CheckStr(Request.Form("message"))
				c_URL=CheckStr(Request.Form("c_URL"))
				c_Designer=CheckStr(Request.Form("c_Designer"))
				c_Image=CheckStr(Request.Form("Image"))
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
				c_TopShow_Image=CheckStr(Request.Form("c_TopShow_Image"))
				Conn.ExeCute("INSERT INTO coolsite(c_Name,c_URL,c_Info,c_Author,c_Image,c_Designer,c_Istop,c_TopShow,c_TopShow_Image) VALUES ('"&c_Name&"','"&c_URL&"','"&c_Info&"','"&memName&"','"&c_Image&"','"&c_Designer&"',"&c_Istop&","&c_TopShow&",'"&c_TopShow_Image&"')")
				Conn.ExeCute("UPDATE blog_Info SET coolsiteNums=coolsiteNums+1")
				SQLQueryNums=SQLQueryNums+2
				Response.Write("<p>点击返回所添加酷站,或者等待3秒后自动返回<meta http-equiv='refresh' content='3;url=coolsite.asp'></p>")
			End IF%>
			<p>&nbsp;</p>
			<div><a href="default.asp">点击返回主页面</a></div>
		</td>
	  </tr>
	</table>
<%End IF%>
<!--#include file="footer.asp" -->