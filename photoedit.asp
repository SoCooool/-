<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<script language="JavaScript" src="inc/ubbcode.js" type="text/javascript"></script>
<%If eblog.ChkPost()=false then response.write("<div align=""center""><h4>不允许从外部提交</h4></div>"):response.End()
IF Request.QueryString("action")="editcomm" Then
	Dim ph_commID
	ph_commID=Trim(Request.QueryString("commID"))
	Dim ph_editComm
	Set ph_editComm=Server.CreateObject("ADODB.Recordset")
	SQL="SELECT * FROM photo_Comment WHERE comm_ID="&ph_commID&""
	ph_editComm.Open SQL,Conn,1,1
	SQLQueryNums=SQLQueryNums+1
	IF ph_editComm.EOF AND ph_editComm.BOF Then
%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<h4>错误：你要修改的评论不存在</h4>
				<p>&nbsp;</p>
				<div><a href="default.asp">点击返回主页面</a></div>
			</td>
		  </tr>
		</table>
	<%Else%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF">
		  <tr>
			<td valign="top">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" class="photo_bg">
				  <tr align="center">
					<td colspan="2">修改图片&nbsp;<font color="#FF0000">[ <%=""&ph_commID&""%> ]</font>&nbsp;中的评论</td>
				  </tr>
				<form action="photoedit.asp?action=commedit" method="post" name="inputform" id="inputform">
				  <tr bgcolor="#FFFFFF">
					<td width="112" align="right" nowrap="nowrap"><strong> 作者：</strong></td>
					<td width="100%"><input name="comm_Author" class="input_bg" type="text" id="comm_Author" value="<%=ph_editComm("comm_Author")%>" /></td>
				  </tr>
				  <tr bgcolor="#FFFFFF">
					<td align="right" valign="top"><strong>内容：</strong> </td>
					<td valign="top"><textarea name="message" class="textarea_bg" rows="6" wrap="VIRTUAL" id="Message" onselect="javascript: storeCaret(this);" onclick="javascript: storeCaret(this);" onkeyup="javascript: storeCaret(this);" onkeydown="javascript: ctlent();"><%=EditDeHTML(ph_editComm("comm_Content"))%></textarea>
						<div align="right">缩放输入框: <span title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick="document.inputform.message.rows+=4"><img src="images/icon_ar2.gif" border="0" align="absbottom" alt="" /></span> <span title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.message.rows>=4)document.inputform.message.rows-=4;else return false'><img src="images/icon_al2.gif" border="0" align="absbottom" alt="" /></span></div></td>
				  </tr>
				  <tr align="center" bgcolor="#FFFFFF">
					<td colspan="2">
						相片ID: <input name="ph_ID" type="text" class="input_bg" id="ph_ID" value="<%=ph_editComm("ph_ID")%>" size="2" />
						<input name="comm_ID" type="hidden" value="<%=""&ph_commID&""%>" />
						<input name="commsubmit" type="submit" value="确定编辑[可按Ctrl+Enter发布]" onClick="this.disabled=true;document.inputform.submit();">
						<input name="L_Reset" type="button" id="L_Reset" value="取消编辑" onclick="javascript:history.go(-1);" />
					</td>
				  </tr>
				</form>
			</table></td>
		  </tr>
		</table>
	<%End IF
	ph_editComm.Close
	Set ph_editComm=Nothing%>
<%ElseIf Request.QueryString("action")="commedit" Then
	IF Request.Form("message")=Empty Or Request.Form("comm_Author")=Empty Or Request.Form("ph_ID")=Empty Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<p>1，必须填写评论人名称</p>
				<p>2，必须填写评论内容</p>
				<p>3，必须填写相片ID</p>
				<p>&nbsp;</p>
				<div><a href='javascript:history.go(-1);'>返回上一页</a></div>
			</td>
		  </tr>
		</table>
	<%Else%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<%Dim comm_ID,comm_Author,comm_Content,comm_ph_ID
				comm_ID=CheckStr(Request.Form("comm_ID"))
				comm_Author=CheckStr(Request.Form("comm_Author"))
				comm_Content=CheckStr(Request.Form("message"))
				comm_ph_ID=CheckStr(Request.Form("ph_ID"))
				Conn.ExeCute("UPDATE photo_Comment Set comm_Author='"&comm_Author&"',comm_Content='"&comm_Content&"',ph_ID="&comm_ph_ID&" WHERE comm_ID="&comm_ID&"")
				SQLQueryNums=SQLQueryNums+1%>
				<a href='default.asp'>点击返回首页</a>
				<p>&nbsp;</p>
				<a href="photoshow.asp?photoID=<%=""&comm_ph_ID&""%>">或者返回你所修改的图片</a>
				<p>&nbsp;</p>
				或者等待3秒后自动返回你所修改的图片<meta http-equiv='refresh' content='3;url=photoshow.asp?photoID=<%=""&comm_ph_ID&""%>'>
			</td>
		  </tr>
		</table>
	<%End If
ElseIf Request.QueryString("action")<>"photoedit" Then
	Dim photo_ID
	photo_ID=Trim(Request.QueryString("photoID"))
	If IsInteger(photo_ID)=False Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
				<h4>参数错误</h4>
				<p>&nbsp;</p>
				<div><a href='javascript:history.go(-1);'>请返回重新填写</a></div>
			</td>
		  </tr>
		</table>
	<%Else
		Dim ph_Edit
		Set ph_Edit=Server.CreateObject("ADODB.Recordset")
		SQL="SELECT L.*,C.cate_Name FROM photo AS L,photo_Category AS C WHERE ph_ID="&photo_ID&" AND C.cate_ID=L.ph_CateID"
		ph_Edit.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		IF ph_Edit.EOF AND ph_Edit.BOF Then%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td align="center" valign="middle" height="120">
					<h4>错误：你要修改的图片不存在</h4>
					<p>&nbsp;</p>
					<div><a href="default.asp">点击返回主页面</a></div>
				</td>
			  </tr>
			</table>
		<%Else
			IF Not((ph_Edit("ph_Author")=memName AND memStatus="7") OR memStatus="8") Then%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="120">
						<h4>错误：没有权限修改</h4>
						<p>&nbsp;</p>
					  <div><a href="default.asp">点击返回主页面</a> 或者 <a href="logging.asp">重新登陆</a></div>
					</td>
				  </tr>
				</table>
			<%Else%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF">
				  <tr>
					<td valign="top">
						<table width="100%" border="0" cellpadding="4" cellspacing="1" class="photo_bg">
						  <tr align="center">
							<td colspan="2">修改分类&nbsp;<font color="#FF0000">[ <%=ph_Edit("cate_Name")%> ]</font>&nbsp;中的图片</td>
						  </tr>
						  <form name="inputform" method="post" action="photoedit.asp?action=photoedit">
						  <tr bgcolor="#FFFFFF">
						    <td align="right" nowrap><strong>作者：</strong></td>
						    <td><input name="ph_Author" class="input_bg" type="text" id="ph_Author" value="<%=ph_Edit("ph_Author")%>" size="10" /></td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right" nowrap><strong>操作：</strong></td>
							<td><input name="phdel" type="checkbox" id="phdel" value="1">删除此图片&nbsp;&nbsp;|&nbsp;&nbsp;
								转移到：
								<select name="Ph_moveto" id="Ph_moveto">
									<option value="0">请选择分类</option>
									<%Dim Arr_phCates '写入分类
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
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right" nowrap><strong>属性：</strong></td>
							<td>
								<input name="Ph_DisVote" type="checkbox" id="Ph_DisVote" value="1" <%IF ph_Edit("Ph_DisVote")=True Then Response.Write("checked")%>>禁止打分&nbsp;&nbsp;|&nbsp;&nbsp;
								<input name="ph_DisComm" type="checkbox" id="ph_DisComm" value="1" <%IF ph_Edit("ph_DisComm")=True Then Response.Write("checked")%>>禁止评论
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td width="112" align="right" nowrap><strong>标题：</strong></td>
							<td width="100%">
								<input name="ph_Name" type="text" class="input_bg" id="ph_Name" value="<%=EditDeHTML(ph_Edit("ph_Name"))%>" size="60">
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right"><strong>缩略图：</strong></td>
							<td><input name="ph_Thumbnail" type="text" class="input_bg" id="ph_Thumbnail" value="<%=EditDeHTML(ph_Edit("ph_Thumbnail"))%>" size="60" maxlength="200"> 推荐缩略图大小为100*100</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right" valign="top">
								<strong>图片地址：</strong>
							</td>
							<td valign="top">
								<textarea name="ph_Image" class="textarea_bg" rows="6" wrap="VIRTUAL" id="ph_Image" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=ph_Edit("ph_Image")%></textarea>
								<div align="right">缩放输入框: <SPAN title='放大输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick=document.inputform.ph_Image.rows+=4><img src="images/icon_ar2.gif" border="0" align="absbottom" alt="" /></SPAN><SPAN title='缩小输入框' style='FONT-SIZE: 12px; CURSOR: hand' onclick='if(document.inputform.ph_Image.rows>=4)document.inputform.ph_Image.rows-=4;else return false'><img src="images/icon_al2.gif" border="0" align="absbottom" alt="" /></SPAN></div>
								<div>1.您可以添加多个图片地址，每张图片用回车分隔。在添加多张图片的时候，请注意<font color=red>最后一张图片的后面不要加回车</font>！</div>
								<div>2.您可以添加多张图片的简要说明，每张图片的简要说明之前用&quot;<font color="blue">@</font>&quot;隔开。而每一个简要说明都对应你所添加的图片。</div>
								<div>3.例如: http://www.fir8.net/blog/test.jpg@这是一张测试图片</div>
								<div style="text-indent: 42px;">http://www.fir8.net/blog/test.jpg@这是第二张测试图片</div>
								<div style="text-indent: 42px;">http://www.fir8.net/blog/test.jpg&nbsp;&nbsp;&nbsp;&nbsp;注: 此图不加说明</div>
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
						    <td align="right" valign="top"><strong>内容：</strong></td>
							<td valign="top"><textarea name="message" class="textarea_bg" rows="6" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyUp="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();"><%=EditDeHTML(ph_Edit("ph_Remark"))%></textarea></td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
							<td align="right"><strong>上传图片：</strong></td>
							<td>
								<iframe border="0" frameborder="0" framespacing="0" height="23" marginheight="0" marginwidth="0" noresize="noResize" scrolling="No" width="100%" vspale="0" src="attachment_e.asp"></iframe>
								<br>仅支持<font color=red>GIF,JPG,BMP,PNG</font>格式
							</td>
						  </tr>
						  <tr bgcolor="#FFFFFF">
						    <td align="right"><strong>打分数目：</strong></td>
						    <td>
								<%Dim phVote
								phVote=split(ph_Edit("ph_Vote"),"|")%>
								<input name="phVote1" type="text" value="<%=""&phVote(0)&""%>" size="2" />
								1分&nbsp;&nbsp;
								<input name="phVote2" type="text" value="<%=""&phVote(1)&""%>" size="2" />
								2分&nbsp;&nbsp;
								<input name="phVote3" type="text" value="<%=""&phVote(2)&""%>" size="2" />
								3分&nbsp;&nbsp;
								<input name="phVote4" type="text" value="<%=""&phVote(3)&""%>" size="2" />
								4分&nbsp;&nbsp;
								<input name="phVote5" type="text" value="<%=""&phVote(4)&""%>" size="2" />
								5分&nbsp;&nbsp;
							</td>
						    </tr>
						  <tr align="center" bgcolor="#FFFFFF">
							<td colspan="2">
								<input name="ph_ID" type="hidden" id="ph_ID" value="<%=ph_Edit("ph_ID")%>">
								<input name="ph_CateID" type="hidden" id="ph_CateID" value="<%=ph_Edit("ph_CateID")%>">
								<input name="editsubmit" type="submit" value="确定编辑" onClick="this.disabled=true;document.inputform.submit();">
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
		ph_Edit.Close
		Set ph_Edit=Nothing
	End If
Else
	Dim editPost_ID
	editPost_ID=Trim(Request.Form("ph_ID"))
	If IsInteger(editPost_ID)=False Then%>
		<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
		  <tr>
			<td align="center" valign="middle" height="120">
			  <h4>参数错误</h4>
				<p>&nbsp;</p>
			  <div><a href='javascript:history.go(-1);'>请返回重新填写</a></div>
			</td>
		  </tr>
		</table>
	<%Else
		Dim ph_editPost
		Set ph_editPost=Server.CreateObject("ADODB.Recordset")
		SQL="SELECT ph_ID,ph_Author FROM photo WHERE ph_ID="&editPost_ID
		ph_editPost.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If ph_editPost.EOF AND ph_editPost.BOF Then%>
			<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
			  <tr>
				<td align="center" valign="middle" height="120">
					<h4>错误：你要修改的图片不存在</h4>
					<p>&nbsp;</p>
					<div><a href="default.asp">点击返回主页面</a></div>
				</td>
			  </tr>
			</table>
		<%Else
			If Not((ph_editPost("ph_Author")=memName And memStatus="7") Or memStatus="8") Then%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="120">
						<h4>错误：没有权限修改</h4>
						<p>&nbsp;</p>
						<div><a href="default.asp">点击返回主页面</a><br><br><a href="logging.asp">或者重新登陆</a></div>
					</td>
				  </tr>
				</table>
			<%Else%>
				<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#FFFFFF" class="wordbreak">
				  <tr>
					<td align="center" valign="middle" height="160">
						<h4>修改成功</h4>
						<p>&nbsp;</p>
						<%IF Request.Form("message")=Empty OR Request.Form("ph_Name")=Empty OR Request.Form("ph_Image")=Empty Then
							Response.Write("必须填写完整内容<br><a href='javascript:history.go(-1);'>请返回重新填写</a>")
						ElseIF Request.Form("phdel")="1" Then
							Conn.ExeCute("DELETE * FROM photo WHERE ph_ID="&Request.Form("ph_ID"))
							Conn.ExeCute("DELETE * FROM photo_Comment WHERE ph_ID="&Request.Form("ph_ID"))
							Conn.ExeCute("UPDATE photo_Category SET cate_Nums=cate_Nums-1 WHERE cate_ID="&Request.Form("ph_CateID")&"")
							SQLQueryNums=SQLQueryNums+3
							Application.Lock
							'Application.Contents(CookieName&"_ph_LastComm") = ""
							Application.UnLock
							Response.Write("图片及相关评论删除成功<p>&nbsp;</p><a href='photo.asp'>点击返回相册</a>")
						Else
							Dim ph_Author,ph_Name,ph_Remark,ph_Thumbnail,ph_Image,ph_ID,Ph_DisVote,ph_DisComm,phVoteAll,phVote1,phVote2,phVote3,phVote4,phVote5
							ph_Author=CheckStr(Request.Form("ph_Author"))
							ph_Name=CheckStr(Request.Form("ph_Name"))
							ph_Remark=CheckStr(Request.Form("message"))
							ph_Thumbnail=CheckStr(Request.Form("ph_Thumbnail"))
							ph_Image=CheckStr(Request.Form("ph_Image"))
							ph_ID=editPost_ID
							IF Request.Form("Ph_DisVote")="1" Then
								Ph_DisVote=True
							Else
								Ph_DisVote=False
							End IF
							IF Request.Form("ph_DisComm")="1" Then
								ph_DisComm = True
							Else
								ph_DisComm = False
							End IF
							phVote1=CheckStr(Request.Form("phVote1"))
							phVote2=CheckStr(Request.Form("phVote2"))
							phVote3=CheckStr(Request.Form("phVote3"))
							phVote4=CheckStr(Request.Form("phVote4"))
							phVote5=CheckStr(Request.Form("phVote5"))
							phVoteAll=""&phVote1&"|"&phVote2&"|"&phVote3&"|"&phVote4&"|"&phVote5&""
							Dim ph_MoveToSQL
							IF Request.Form("Ph_moveto")<>"0" Then
								ph_MoveToSQL=",ph_CateID="&Request.Form("Ph_moveto")&""
							End IF
							Conn.ExeCute("UPDATE photo Set ph_Author='"&ph_Author&"',ph_Name='"&ph_Name&"',ph_Thumbnail='"&ph_Thumbnail&"',ph_Image='"&ph_Image&"',ph_Remark='"&ph_Remark&"',ph_Vote='"&phVoteAll&"',ph_DisComm="&ph_DisComm&",Ph_DisVote="&Ph_DisVote&ph_MoveToSQL&" WHERE ph_ID="&ph_ID&"")
							SQLQueryNums=SQLQueryNums+1%>
							<a href='default.asp'>点击返回首页</a>
							<p>&nbsp;</p>
							<a href='photoshow.asp?photoID=<%=""&ph_ID&""%>'>或者返回你所修改的图片</a>
							<p>&nbsp;</p>
							或者等待3秒后自动返回你所修改的图片<meta http-equiv='refresh' content='3;url=photoshow.asp?photoID=<%=""&ph_ID&""%>'>
						<%End IF%>
					</td>
				  </tr>
				</table>
			<%End If
		End If
		ph_editPost.Close
		Set ph_editPost=Nothing
	End If
End IF%>
<!--#include file="footer.asp" -->