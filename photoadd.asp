<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<%
If eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4></div>"):response.End()
%>
<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#ffffff">
  <tr>
	<td>
		<%IF memStatus<>"7" AND memStatus<>"8" Then%>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td height="120" align="center" valign="middle">
					<h4>没有权限添加图片</h4>
					<p>&nbsp;</p>
					<a href="default.asp">点击返回主页面</a> 或者 <a href="login.asp">用管理员帐户重新登陆</a>
				</td>
			  </tr>
			</table>
		<%Else
			IF Request.Form("PhAdd")=Empty Then%>
				<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="photo_bg">
				  <tr align="center">
					<td colspan="2">添加图片</td>
				  </tr>
					<form name="inputform" method="post" action="" onSubmit="return CheckInputForm();">
				  <tr bgcolor="#FFFFFF">
					<td align="right" nowrap><strong>图片分类：</strong></td>
					<td>
						<select name="ph_CateID" id="ph_CateID">
							<option value="0">-- 请选择分类 --</option>
							<%Dim Arr_phCates '写入下载分类
							Dim ph_CateList
							Set ph_CateList=Server.CreateObject("ADODB.RecordSet")
							SQL="SELECT cate_ID,cate_Name FROM photo_Category ORDER BY cate_Order ASC"
							ph_CateList.Open SQL,Conn,1,1
							SQLQueryNums=SQLQueryNums+1
							If ph_CateList.EOF And ph_CateList.BOF Then
								Redim Arr_phCates(3,0)
							Else
								Arr_phCates=ph_CateList.GetRows
								Dim ph_CateNums,ph_CateNumI
								ph_CateNums=Ubound(Arr_phCates,2)
								For ph_CateNumI=0 To ph_CateNums%>
									<option value="<%=""&Arr_phCates(0,ph_CateNumI)&""%>"><%=""&Arr_phCates(1,ph_CateNumI)&""%></option>
								<%Next
							End If
							ph_CateList.Close
							Set ph_CateList=Nothing%>
						</select>
						<font color=red>*</font>
					</td>
				  </tr>
				  <tr bgcolor="#FFFFFF">
					<td width="112" align="right" nowrap><strong>图片名称：</strong></td>
					<td width="100%"><input name="ph_Name" type="text" class="input_bg" id="ph_Name" size="40"></td>
				  </tr>
				  <tr bgcolor="#FFFFFF">
					<td align="right"><strong>设置属性：</strong></td>
					<td>
						<input name="Ph_DisVote" type="checkbox" id="Ph_DisVote" value="1">禁止打分
						<input name="ph_DisComm" type="checkbox" id="ph_DisComm" value="1">禁止评论
					</td>
				  </tr>
					<script language="JavaScript" src="inc/ubbcode.js"></script>
					<tr bgcolor="#FFFFFF">
					  <td align="right"><strong>缩略图：</strong></td>
					  <td><input name="ph_Thumbnail" type="text" class="input_bg" id="ph_Thumbnail" value="" size="60" maxlength="200"> 推荐缩略图大小为100*100</td>
					</tr>
					<tr bgcolor="#FFFFFF">
					<td align="right" valign="top"><strong>图片地址：</strong></td>
					<td>
						<textarea name="Image" style="width:99%" rows="8" wrap="VIRTUAL" id="Image" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea>
						<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick=document.inputform.Image.rows+=4><img src="images/icon_ar2.gif" border="0" align="absbottom" alt="" /></SPAN><SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.Image.rows>=4)document.inputform.Image.rows-=4;else return false'><img src="images/icon_al2.gif" border="0" align="absbottom" alt="" /></SPAN></div>
						<div>1.您可以添加多个图片地址，每张图片用回车分隔。在添加多张图片的时候，请注意<font color=red>最后一张图片的后面不要加回车</font>！</div>
						<div>2.您可以添加多张图片的简要说明，每张图片的简要说明之前用&quot;<font color="blue">@</font>&quot;隔开。而每一个简要说明都对应你所添加的图片。</div>
						<div>3.例如: http://www.fir8.net/blog/test.jpg@这是一张测试图片</div>
						<div style="text-indent: 42px;">http://www.fir8.net/blog/test.jpg@这是第二张测试图片</div>
						<div style="text-indent: 42px;">http://www.fir8.net/blog/test.jpg&nbsp;&nbsp;&nbsp;&nbsp;注: 此图不加说明</div>
						<div>4.注意: <font color=red>每个组图,前面不允许有回车,而每一张图间隔的时候也不需要用回车,最后一张图片的后面不要加回车</font></div>
					</td>
				  </tr>
				  <tr bgcolor="#FFFFFF">
					<td align="right" valign="top"><strong>简要内容：</strong></td>
					<td>
						<textarea name="message" style="width:99%" rows="6" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea>
					</td>
				  </tr>
				  <tr bgcolor="#FFFFFF">
					<td align="right"><strong>上传图片：</strong></td>
					<td>
						<iframe border="0" frameborder="0" framespacing="0" height="23" marginheight="0" marginwidth="0" noresize="noResize" scrolling="No" width="100%" vspale="0" src="attachment_e.asp"></iframe>
						<br>仅支持<font color=red>GIF,JPG,BMP,PNG</font>格式
					</td>
				  </tr>
				  <tr align="center" bgcolor="#FFFFFF">
					<td colspan="2">
						<input name="PhAdd" type="hidden" value="Post">
						<input name="ph_Vote" type="hidden" value="0|0|0|0|0">
						<input name="SubmitBtn" type="submit" value=" 提交 " onClick="this.disabled=true;document.inputform.submit();">
						<input name="L_Reset" type="reset" id="L_Reset" value=" 重置 ">
					</td>
				  </tr>
				  </form>
				</table>
			<%Else%>
				<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="photo_bg">
				  <tr>
					<td align="center" nowrap><h4>保存</h4></td>
				  </tr>
				  <tr>
					<td align="center" height="120" valign="middle" bgcolor="#FFFFFF">
						<%IF Request.Form("message")=Empty OR Request.Form("ph_CateID")=0 OR Request.Form("ph_Name")=Empty OR Request.Form("Image")=Empty Then
							Response.Write("<p>1.必须选择图片分类</p><p>2.必须填写图片名称</p><p>3.必须填写图片地址</p><p>4.必须填写图片简介</p><p>&nbsp;</p><p><a href='javascript:history.go(-1);'>请返回重新填写</a></p>")
						Else
							Dim ph_CateID,ph_Name,ph_Remark,ph_Thumbnail,ph_Image,Ph_DisVote,ph_DisComm,ph_Vote
							ph_CateID=CheckStr(Request.Form("ph_CateID"))
							ph_Name=CheckStr(Request.Form("ph_Name"))
							ph_Remark=CheckStr(Request.Form("message"))
							ph_Thumbnail=CheckStr(Request.Form("ph_Thumbnail"))
							ph_Image=CheckStr(Request.Form("Image"))
							IF Request.Form("Ph_DisVote")="1" Then
								Ph_DisVote=True
							Else
								Ph_DisVote=False
							End IF
							IF Request.Form("ph_DisComm")="1" Then
								ph_DisComm=True
							Else
								ph_DisComm=False
							End IF
							ph_Vote=CheckStr(Request.Form("ph_Vote"))
							Conn.ExeCute("INSERT INTO photo(ph_CateID,ph_Name,ph_Author,ph_Thumbnail,ph_Image,ph_Remark,ph_DisComm,Ph_DisVote,ph_Vote) VALUES ("&ph_CateID&",'"&ph_Name&"','"&memName&"','"&ph_Thumbnail&"','"&ph_Image&"','"&ph_Remark&"',"&ph_DisComm&","&Ph_DisVote&",'"&ph_Vote&"')")
							Conn.ExeCute("UPDATE photo_Category SET cate_Nums=cate_Nums+1 WHERE cate_ID="&ph_CateID&"")
							Dim PhID
							PhID=Conn.ExeCute("SELECT TOP 1 ph_ID FROM photo ORDER BY ph_ID DESC")(0)
							SQLQueryNums=SQLQueryNums+2
							Response.Write("<p>提交成功</p><p>&nbsp;</p><p><a href=""default.asp"">点击返回首页</a></p><p>&nbsp;</p><p><a href='photoshow.asp?photoID="&PhID&"'>返回你所发表的图片</a></p><p>&nbsp;</p><p>或者等待3秒后自动返回你所发表的图片<meta http-equiv='refresh' content='3;url=photoshow.asp?photoID="&PhID&"'>")
						End IF%>
					</td>
				  </tr>
				</table>
			<%End IF
		End IF%>
	</td>
  </tr>
</table>
<!--#include file="footer.asp" -->