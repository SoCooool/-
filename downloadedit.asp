<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbcode.js"></script>
<%IF Request.QueryString("action")<>"postedit" Then
Dim down_ID
down_ID=CheckStr(Request.QueryString("downID"))
Dim down_Edit
Set down_Edit=Server.CreateObject("ADODB.Recordset")
SQL="SELECT L.*,C.cate_Name FROM Download AS L,down_Category AS C WHERE downl_ID="&down_ID&" AND C.cate_ID=L.downl_Cate"
down_Edit.Open SQL,Conn,1,1
SQLQueryNums=SQLQueryNums+1
IF down_Edit.EOF AND down_Edit.BOF Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>不存在该数据</h4>
			<p>&nbsp;</p>
			<div><a href="default.asp">点击返回主页面</a></div>
		</td>
	  </tr>
	</table>
<%Else
IF Not((down_Edit("downl_Author")=memName AND memStatus="7") OR memStatus="8") Then
%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>没有权限修改下载</h4>
			<p>&nbsp;</p>
			<div><a href="default.asp">点击返回主页面</a></div>
		</td>
	  </tr>
	</table>
<%Else%>
<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
  <tr>
    <td width="100%" valign="top">
	<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
        <tr align="center">
          <td colspan="2" class="msg_head">修改分类&nbsp;<font color="#FF0000">[ <%=down_Edit("cate_Name")%> ]</font>&nbsp;中的下载</td></tr>
        <form name="inputform" method="post" action="downloadedit.asp?action=postedit">
          <tr bgcolor="#FFFFFF">
            <td align="right" nowrap>操作：</td>
            <td>作者：<b><input name="log_Author" type="hidden" id="log_Author" value="<%=down_Edit("downl_Author")%>"><%=down_Edit("downl_Author")%></b>&nbsp;&nbsp;|&nbsp;&nbsp;<input name="blogdele" type="checkbox" id="blogdele" value="1">
              删除此下载&nbsp;&nbsp;|&nbsp;&nbsp;转移下载到：
              <select name="blogmoveto" id="blogmoveto">
                <option value="0">选择分类</option>
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
						Response.Write("<option value='"&Arr_DownCates(0,Down_CateNumI)&"'>"&Arr_DownCates(1,Down_CateNumI)&"</option>")
					Next
				End If
				Down_CateList.Close
				Set Down_CateList=Nothing%>
              </select>
		</td></tr>
		<tr bgcolor="#FFFFFF">
		<td align="right" nowrap>属性：</td>
		<td><input type="radio" name="downl_IsShow" value="0" <%IF down_Edit("downl_IsShow")=True Then Response.Write("checked")%>> 公开下载 <input type="radio" name="downl_IsShow" value="1" <%IF down_Edit("downl_IsShow")=False Then Response.Write("checked")%>> 隐藏下载&nbsp;&nbsp;&nbsp;&nbsp;<input name="downl_Istop" type="checkbox" id="downl_Istop" value="1" <%IF down_Edit("downl_Istop")=True Then Response.Write("checked")%>> 置顶下载&nbsp;&nbsp;&nbsp;&nbsp;<input name="downl_TopShow" type="checkbox" id="downl_TopShow" value="1" <%IF down_Edit("downl_TopShow")=True Then Response.Write("checked")%>> 推荐下载&nbsp;&nbsp;&nbsp;&nbsp;推荐图标：<input name="downl_TopShow_Image" type="text" id="downl_TopShow_Image" value="<%=EditDeHTML(down_Edit("downl_TopShow_Image"))%>" size="32" maxlength="255"></td></tr>
		<tr bgcolor="#FFFFFF">
		<td width="112" align="right" nowrap>标题：</td>
		<td width="100%"><input name="downl_Name" type="text" id="downl_Name" value="<%=EditDeHTML(down_Edit("downl_Name"))%>" size="50"></td></tr>
          <tr bgcolor="#FFFFFF">
		<td align="right">来自：</td>
		<td><input name="downl_From" type="text" id="downl_From" value="<%=down_Edit("downl_From")%>" size="12">&nbsp;地址：<input name="downl_FromURL" type="text" id="downl_FromURL" value="<%=down_Edit("downl_FromURL")%>" size="38"></td></tr>
        <tr bgcolor="#FFFFFF">
		<td align="right" valign="top">内容：</td>
		<td valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0">
              <tr valign="top">
		<td><textarea name="message" style="width:100%" rows="8" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(down_Edit("downl_Comment"))%></textarea>
			<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' class='arrow' onclick=document.input.message.rows+=4>6</SPAN> <SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' class='arrow' onclick='if(document.input.message.rows>=4)document.input.message.rows-=4;else return false'>5</SPAN></div></td></tr>
		</table></td></tr>
<tr bgcolor="#FFFFFF"><td align="right">下载地址1：</td><td><input name="downl_Dcomm1URL" type="text" id="downl_Dcomm1URL" value="<%=EditDeHTML(down_Edit("downl_Dcomm1URL"))%>" size="50" maxlength="255"> 简要说明：<input name="downl_Dcomm1" type="text" id="downl_Dcomm1" value="<%=EditDeHTML(down_Edit("downl_Dcomm1"))%>" size="30" maxlength="100"> 下载选项：<select name="downl_ImgShow1" id="downl_ImgShow1"><option value="0" <%If down_Edit("downl_ImgShow1")=false Then Response.Write("selected")%>>普通</option><option value="1" <%If down_Edit("downl_ImgShow1")=true Then Response.Write("selected")%>>图像</option></select></td></tr>
<tr bgcolor="#FFFFFF"><td align="right">下载地址2：</td><td><input name="downl_Dcomm2URL" type="text" id="downl_Dcomm2URL" value="<%=EditDeHTML(down_Edit("downl_Dcomm2URL"))%>" size="50" maxlength="255"> 简要说明：<input name="downl_Dcomm2" type="text" id="downl_Dcomm2" value="<%=EditDeHTML(down_Edit("downl_Dcomm2"))%>" size="30" maxlength="100"> 下载选项：<select name="downl_ImgShow2" id="downl_ImgShow2"><option value="0" <%If down_Edit("downl_ImgShow2")=false Then Response.Write("selected")%>>普通</option><option value="1" <%If down_Edit("downl_ImgShow2")=true Then Response.Write("selected")%>>图像</option></select></td></tr>
<tr bgcolor="#FFFFFF"><td align="right">下载地址3：</td><td><input name="downl_Dcomm3URL" type="text" id="downl_Dcomm3URL" value="<%=EditDeHTML(down_Edit("downl_Dcomm3URL"))%>" size="50" maxlength="255"> 简要说明：<input name="downl_Dcomm3" type="text" id="downl_Dcomm3" value="<%=EditDeHTML(down_Edit("downl_Dcomm3"))%>" size="30" maxlength="100"> 下载选项：<select name="downl_ImgShow3" id="downl_ImgShow3"><option value="0" <%If down_Edit("downl_ImgShow3")=false Then Response.Write("selected")%>>普通</option><option value="1" <%If down_Edit("downl_ImgShow3")=true Then Response.Write("selected")%>>图像</option></select></td></tr>
<tr bgcolor="#FFFFFF"><td align="right">下载地址4：</td><td><input name="downl_Dcomm4URL" type="text" id="downl_Dcomm4URL" value="<%=EditDeHTML(down_Edit("downl_Dcomm4URL"))%>" size="50" maxlength="255"> 简要说明：<input name="downl_Dcomm4" type="text" id="downl_Dcomm4" value="<%=EditDeHTML(down_Edit("downl_Dcomm4"))%>" size="30" maxlength="100"> 下载选项：<select name="downl_ImgShow4" id="downl_ImgShow4"><option value="0" <%If down_Edit("downl_ImgShow4")=false Then Response.Write("selected")%>>普通</option><option value="1" <%If down_Edit("downl_ImgShow4")=true Then Response.Write("selected")%>>图像</option></select></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right">图片：</td>
  <td><input name="Image" type="text" id="Image" value="<%=EditDeHTML(down_Edit("downl_Image"))%>" size="50" maxlength="255"></td>
</tr>
<tr bgcolor="#FFFFFF"><td align="right">附件：</td>
<td><iframe border="0" frameBorder="0" frameSpacing="0" height="23" marginHeight="0" marginWidth="0" noResize scrolling="no" width="100%" vspale="0" src="attachment_e.asp"></iframe></td></tr>
	<tr align="center" bgcolor="#FFFFFF"><td colspan="2"><input name="downl_ID" type="hidden" id="downl_ID" value="<%=down_Edit("downl_ID")%>"><input name="editsubmit" type="submit" value="确定编辑" onClick="this.disabled=true;document.inputform.submit();">&nbsp;<input name="L_Reset" type="button" id="L_Reset" value="取消编辑" onclick="javascript:history.go(-1);"></td></tr>
	</form></table></td>
</tr></table>
<%
End IF
End IF
down_Edit.Close
Set down_Edit=Nothing
Else%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>修改酷站</h4>
			<p>&nbsp;</p>
		<%IF Request.Form("message")=Empty OR Request.Form("downl_Name")=Empty Then
			Response.Write("必须填写下载内容<p>&nbsp;</p><a href='javascript:history.go(-1);'>请返回重新填写</a>")
		ElseIF Request.Form("blogdele")="1" Then
			Conn.ExeCute("DELETE * FROM Download WHERE downl_ID="&Request.Form("downl_ID"))
			Conn.ExeCute("UPDATE down_Category SET cate_Nums=cate_Nums-1 WHERE cate_Name='"&Request.Form("downl_Cate")&"'")
			Conn.ExeCute("UPDATE blog_Info SET DownloadNums=DownloadNums-1")
			SQLQueryNums=SQLQueryNums+3
			Application.UnLock
			Response.Write("<br><br>删除下载成功<br><br><a href='default.asp'>点击返回首页</a><br><br>")
		Else
			dim downl_Name,downl_Comment,downl_From,downl_FromURL,downl_ID,downl_Dcomm1URL,downl_Dcomm2URL,downl_Dcomm3URL,downl_Dcomm4URL,downl_Dcomm1,downl_Dcomm2,downl_Dcomm3,downl_Dcomm4,downl_ImgShow1,downl_ImgShow2,downl_ImgShow3,downl_ImgShow4,downl_Image,downl_Istop,downl_TopShow,downl_TopShow_Image,downl_IsShow
			downl_Name=CheckStr(Request.Form("downl_Name"))
			downl_Comment=CheckStr(Request.Form("message"))
			downl_From=CheckStr(Request.Form("downl_From"))
			downl_FromURL=Request.Form("downl_FromURL")
			downl_ID=Request.Form("downl_ID")
			downl_Dcomm1URL=Request.Form("downl_Dcomm1URL")
			downl_Dcomm2URL=Request.Form("downl_Dcomm2URL")
			downl_Dcomm3URL=Request.Form("downl_Dcomm3URL")
			downl_Dcomm4URL=Request.Form("downl_Dcomm4URL")
			downl_Dcomm1=Request.Form("downl_Dcomm1")
			downl_Dcomm2=Request.Form("downl_Dcomm2")
			downl_Dcomm3=Request.Form("downl_Dcomm3")
			downl_Dcomm4=Request.Form("downl_Dcomm4")
			downl_Image=CheckStr(Request.Form("Image"))
			IF Request.Form("downl_ImgShow1")="1" Then
				downl_ImgShow1=True
			Else
				downl_ImgShow1=False
			End IF
			IF Request.Form("downl_ImgShow2")="1" Then
				downl_ImgShow2=True
			Else
				downl_ImgShow2=False
			End IF
			IF Request.Form("downl_ImgShow3")="1" Then
				downl_ImgShow3=True
			Else
				downl_ImgShow3=False
			End IF
			IF Request.Form("downl_ImgShow4")="1" Then
				downl_ImgShow4=True
			Else
				downl_ImgShow4=False
			End IF
			IF Request.Form("downl_Istop")="1" Then
				downl_Istop=True
			Else
				downl_Istop=False
			End IF
			IF Request.Form("downl_TopShow")="1" Then
				downl_TopShow = True
			Else
				downl_TopShow = False
			End IF
			IF Request.Form("downl_IsShow")="0" Then
				downl_IsShow = True
			Else
				downl_IsShow = False
			End IF
			downl_TopShow_Image=CheckStr(Request.Form("downl_TopShow_Image"))
			Dim down_MoveToSQL
			IF Request.Form("blogmoveto")<>"0" Then
				down_MoveToSQL=",downl_Cate="&Request.Form("blogmoveto")&""
			End IF
			Conn.ExeCute("UPDATE Download Set downl_Name='"&downl_Name&"',downl_Comment='"&downl_Comment&"',downl_From='"&downl_From&"',downl_FromURL='"&downl_FromURL&"',downl_Image='"&downl_Image&"',downl_TopShow="&downl_TopShow&",downl_TopShow_Image='"&downl_TopShow_Image&"',downl_IsShow="&downl_IsShow&",downl_Dcomm1URL='"&downl_Dcomm1URL&"',downl_Dcomm2URL='"&downl_Dcomm2URL&"',downl_Dcomm3URL='"&downl_Dcomm3URL&"',downl_Dcomm4URL='"&downl_Dcomm4URL&"',downl_Dcomm1='"&downl_Dcomm1&"',downl_ImgShow1="&downl_ImgShow1&",downl_ImgShow2="&downl_ImgShow2&",downl_ImgShow3="&downl_ImgShow3&",downl_ImgShow4="&downl_ImgShow4&",downl_Dcomm2='"&downl_Dcomm2&"',downl_Dcomm3='"&downl_Dcomm3&"',downl_Dcomm4='"&downl_Dcomm4&"',downl_Istop="&downl_Istop&down_MoveToSQL&" WHERE downl_ID="&downl_ID&"")
			SQLQueryNums=SQLQueryNums+1
			Response.Write("修改下载成功<p>&nbsp;</p><a href='default.asp'>点击返回首页</a> 或者 <a href='download.asp?downID="&downl_ID&"#id"&downl_ID&"'>返回你所修改的下载</a><p>&nbsp;</p>或者等待3秒后自动返回你所修改的下载<meta http-equiv='refresh' content='3;url=download.asp?downID="&downl_ID&"#id"&downl_ID&"'><br><br>")
		End IF%>
		</td>
	  </tr>
	</table>
<%End IF%>
<!--#include file="footer.asp" -->