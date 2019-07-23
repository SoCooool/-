<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbhelp.js"></script>
<script language="JavaScript" src="inc/ubbcode.js"></script>
<%IF memStatus<>"8" Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>没有权限发表新下载</h4>
			<p>&nbsp;</p>
			<div><a href="default.asp">点击返回主页面</a></div>
		</td>
	  </tr>
	</table>
<%Else
	IF Request.Form("downl_cate")=Empty Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF">
      <tr bgcolor="#b6d8e0">
        <td align="center" height="24" colspan="2">选择分类</td>
      </tr>
      <form action="" method="post" name="form_C" id="form_C">
        <tr bgcolor="#FFFFFF">
          <td width="300" align="right"><b>分类：</b></td>
          <td><select name="downl_cate" id="downl_cate">
              <option value="">请选择分类</option>
              <%Dim Arr_DownCates
		Dim Down_CateList
		Set Down_CateList=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM down_Category ORDER BY cate_Order ASC"
		Down_CateList.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If Down_CateList.EOF And Down_CateList.BOF Then
			Redim Arr_DownCates(3,0)
		Else
			Arr_DownCates=Down_CateList.GetRows
			Dim down_CateNums,down_CateNumI
			down_CateNums=Ubound(Arr_DownCates,2)
			For down_CateNumI=0 To down_CateNums
				Response.Write("<option value='"&Arr_DownCates(0,down_CateNumI)&"'>"&Arr_DownCates(1,down_CateNumI)&"</option>")
			Next
		End If
		Down_CateList.Close
		Set Down_CateList=Nothing%>
          </select> <input name="C_Submit" type="submit" id="C_Submit" value="确定" /></td>
      </form>
</table>
	<%ElseIF Request.Form("DownPost")=Empty Then%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	<tr><td width="100%" valign="top">
	<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
	<tr align="center">
	<td colspan="2" class="msg_head">在分类&nbsp;<font color="#FF0000">[ <%=Conn.ExeCute("SELECT cate_Name FROM down_Category WHERE cate_ID="&Request.Form("downl_cate")&"")(0)%> ]</font>&nbsp;中发表新下载</td></tr>
	<form name="inputform" method="post" action="">
	<tr bgcolor="#FFFFFF"><td width="112" align="right" nowrap>标题：</td><td width="100%">
	<input name="downl_Name" type="text" id="downl_Name" size="50" maxlength="100">&nbsp;&nbsp;&nbsp;&nbsp;属性：<input name="downl_IsTop" type="checkbox" id="downl_IsTop" value="1">置顶下载 <input name="downl_TopShow" type="checkbox" id="downl_TopShow" value="1">推荐下载</td>
	</tr>
	<tr bgcolor="#FFFFFF"><td align="right">来源：</td>
	<td><input name="downl_From" type="text" id="downl_From" value="<%=eblog.setup(1,0)%>" size="18" maxlength="50">&nbsp;地址：<input name="downl_FromURL" type="text" id="downl_FromURL" value="<%=eblog.setup(2,0)%>" size="50" maxlength="100"></td>
	</tr>
	<tr bgcolor="#FFFFFF"><td align="right" valign="top">内容简介：</td>
	<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
	<td><!--#include file="inc/editform.asp" -->
	<textarea name="message" style="width:99%" rows="6" wrap="VIRTUAL" id="Message"></textarea>
	<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' class='arrow' onclick=document.inputform.message.rows+=6><img src="images/icon_ar2.gif" /></SPAN> <SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' class='arrow' onclick='if(document.inputform.message.rows>=6)document.inputform.message.rows=3;else return false'><img src="images/icon_al2.gif" /></SPAN></div>
	</td>
	</tr></table></td></tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">&nbsp;</td>
	  <td>
		<script language="javascript">
		  function setid()
		  {
		  str='';
		  if(!window.inputform.no.value)
		   window.input.no.value=1;
		  for (i=1;i<=window.inputform.no.value;i++)
			 str+=''+'简要说明：<input type="text" name="downl_Dcomm'+i+'" style="padding-left:1pt" size=12>&nbsp;URL'+i+'：<input type="text" name="downl_Dcomm'+i+'URL" style="padding-left:1pt" size=50 value=""><BR>';
		  window.upid.innerHTML=str+'';
		  }
		</script>设置添加地址的数量:&nbsp;<input name="no" type="text" value="1" size=1 maxlength="1" onKeypress="if (event.keyCode < 49 || event.keyCode > 52) event.returnValue = false;">&nbsp;&nbsp;<input type="button" name="Button" class=button onClick="setid();" value="添加下载地址数"> 只能添加1-4个连接
	</td>
	</tr>
	<tr bgcolor="#FFFFFF"><td align="right"></td>
	<td id="upid"></td></tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right">图片：</td>
	  <td><input name="Image" type="text" id="Image" size="50" maxlength="255"></td>
	</tr>
	<tr bgcolor="#FFFFFF"><td align="right">附件：</td>
	<td><iframe border="0" frameBorder="0" frameSpacing="0" height="23" marginHeight="0" marginWidth="0" noResize scrolling="no" width="100%" vspale="0" src="attachment_e.asp"></iframe></td></tr>
	<tr align="center" bgcolor="#FFFFFF"><td colspan="2"><input name="downl_cate" type="hidden" id="downl_cate" value="<%=Request.Form("downl_cate")%>"><input name="DownPost" type="hidden" value="PostIT"><input name="topicsubmit" type="submit" value="提交" onClick="this.disabled=true;document.inputform.submit();">&nbsp;<input name="L_Reset" type="reset" id="L_Reset" value="重置"></td>
</tr></form></table></td></tr></table>
	<%Else%>
	<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
	  <tr>
		<td align="center" valign="middle" height="120">
			<h4>保存下载</h4>
			<p>&nbsp;</p>
			<%IF Request.Form("message")=Empty OR Request.Form("downl_Name")=Empty Then
					Response.Write("必须填写下载内容<p>&nbsp;</p><a href='javascript:history.go(-1);'>请返回重新填写</a>")
				Else
					dim downl_Name,downl_Comment,downl_Intro,downl_From,downl_FromURL,downl_cate2,downl_IsTop,downl_TopShow,downl_Dcomm1URL,downl_Dcomm2URL,downl_Dcomm3URL,downl_Dcomm4URL,downl_Dcomm1,downl_Dcomm2,downl_Dcomm3,downl_Dcomm4,downl_Image
					downl_Name=CheckStr(Request.Form("downl_Name"))
					downl_Comment=CheckStr(Request.Form("message"))
					'downl_Intro=SplitLines(HTMLEncode(downl_Comment),4)
					downl_From=CheckStr(Request.Form("downl_From"))
					downl_FromURL=CheckStr(Request.Form("downl_FromURL"))
					downl_cate2=Request.Form("downl_cate")
					IF Request.Form("downl_IsTop")="1" Then
						downl_IsTop=True
					Else
						downl_IsTop=False
					End IF
					IF Request.Form("downl_TopShow")="1" Then
						downl_TopShow=True
					Else
						downl_TopShow=False
					End IF
					downl_Dcomm1URL=CheckStr(Request.Form("downl_Dcomm1URL"))
					downl_Dcomm2URL=CheckStr(Request.Form("downl_Dcomm2URL"))
					downl_Dcomm3URL=CheckStr(Request.Form("downl_Dcomm3URL"))
					downl_Dcomm4URL=CheckStr(Request.Form("downl_Dcomm4URL"))
					downl_Dcomm1=CheckStr(Request.Form("downl_Dcomm1"))
					downl_Dcomm2=CheckStr(Request.Form("downl_Dcomm2"))
					downl_Dcomm3=CheckStr(Request.Form("downl_Dcomm3"))
					downl_Dcomm4=CheckStr(Request.Form("downl_Dcomm4"))
					downl_Image=CheckStr(Request.Form("Image"))
					Conn.ExeCute("INSERT INTO Download(downl_cate,downl_Name,downl_Author,downl_Comment,downl_From,downl_FromURL,downl_Image,downl_Dcomm1URL,downl_Dcomm2URL,downl_Dcomm3URL,downl_Dcomm4URL,downl_Dcomm1,downl_Dcomm2,downl_Dcomm3,downl_Dcomm4,downl_IsTop,downl_TopShow) VALUES ("&downl_cate2&",'"&downl_Name&"','"&memName&"','"&downl_Comment&"','"&downl_From&"','"&downl_FromURL&"','"&downl_Image&"','"&downl_Dcomm1URL&"','"&downl_Dcomm2URL&"','"&downl_Dcomm3URL&"','"&downl_Dcomm4URL&"','"&downl_Dcomm1&"','"&downl_Dcomm2&"','"&downl_Dcomm3&"','"&downl_Dcomm4&"',"&downl_IsTop&","&downl_TopShow&")")
					Conn.ExeCute("UPDATE down_Category SET cate_Nums=cate_Nums+1 WHERE cate_ID="&Request.Form("downl_cate")&"")
					Conn.ExeCute("UPDATE blog_Info SET DownloadNums=DownloadNums+1")
					SQLQueryNums=SQLQueryNums+3
					Response.Write("<br>填写下载成功<br><br><a href=""default.asp"">点击返回首页</a><br><br><a href='download.asp'>或者返回下载页</a><br><br>或者等待3秒后自动返回返回下载页<meta http-equiv='refresh' content='3;url=download.asp'><br><br>")
		End IF%>
	</td></tr></table>
	<%End IF
End IF%>
<!--#include file="footer.asp" -->