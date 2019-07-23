<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<!--#include file="inc/md5.asp" -->
<!--#include file="header.asp" -->
<div id="default_main">
<%IF Request.QueryString("action")="edit" AND memName<>Empty Then%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#b6d8e0">
      <tr>
        <td colspan="2"><h4>编辑个人资料</h4></td>
        </tr>
	<%IF Request.QueryString("edit")="post" Then
	Response.Write("<tr bgcolor=""#FFFFFF""><td colspan=""2"">")
	IF CheckStr(Request.Form("mem_OldPassword"))=Empty Then
		Response.Write("<br><br><center><b>对不起，旧密码必须填写<br><br><a href='javascript:history.go(-1);'>点击返回上一页</a></b></center><br><br>")
	Else
		Dim mem_Edit
		Set mem_Edit=Conn.ExeCute("SELECT * FROM blog_Member WHERE mem_Name='"&memName&"' AND mem_PassWord='"&md5(CheckStr(Request.Form("mem_OldPassword")))&"'")
		SQLQueryNums=SQLQueryNums+1
		IF mem_Edit.EOF AND mem_Edit.BOF Then
			Response.Write("<br><br><center><b>对不起，旧密码不符<br><br><a href='javascript:history.go(-1);'>点击返回上一页</a></b></center><br><br>")
		Else
			IF CheckStr(Request.Form("mem_NewPassword"))<>CheckStr(Request.Form("mem_RePassword"))  Then
				Response.Write("<br><br><center><b>对不起，新密码与确认密码不符<br><br><a href='javascript:history.go(-1);'>点击返回上一页</a></b></center><br><br>")
			ElseIf CheckStr(Request.Form("mem_Email"))<>Empty And IsValidEmail(CheckStr(Request.Form("mem_Email")))=False Then
				Response.Write("<br><br><center><b>Email地址错误<br><br><a href='javascript:history.go(-1);'>点击返回上一页</a></b></center><br><br>")
			ElseIf CheckStr(Request.Form("mem_Msn"))<>Empty And IsValidEmail(CheckStr(Request.Form("mem_Msn")))=False Then
				Response.Write("<br><br><center><b>Msn填写错误<br><br><a href='javascript:history.go(-1);'>点击返回上一页</a></b></center><br><br>")
			Else
				Dim SQL_Add
				IF CheckStr(Request.Form("mem_NewPassword"))<>Empty Then SQL_Add=",mem_Password='"&md5(CheckStr(Request.Form("mem_NewPassword")))&"'"
				Dim memMail,MemMsn,mem_HideEmail
				mem_HideEmail=CheckStr(Request.Form("mem_HideEmail"))
				memMail=CheckStr(Request.Form("mem_Email"))
				MemMsn=CheckStr(Request.Form("mem_Msn"))
				IF mem_HideEmail="1" Then
					mem_HideEmail=True
				Else
					mem_HideEmail=False
				End IF
				Conn.ExeCute("UPDATE blog_Member SET mem_Sex="&CheckStr(Request.Form("mem_Sex"))&",mem_Email='"&MemMail&"',mem_HideEmail="&mem_HideEmail&",mem_QQ='"&CheckStr(Request.Form("mem_QQ"))&"',mem_Msn='"&MemMsn&"',mem_HomePage='"&CheckStr(Request.Form("mem_HomePage"))&"',mem_Intro='"&CheckStr(Request.Form("mem_Intro"))&"'"&SQL_Add&" WHERE mem_Name='"&memName&"'")
				SQLQueryNums=SQLQueryNums+1
				Response.Write("<br><br><center><b>更新资料成功<br><br><a href='member.asp?action=view&memName="&memName&"'>点击查看新资料</a></b></center><br><br>")
			End IF
		End IF
		Set mem_Edit=Nothing
	End IF
	Response.Write("</td></tr>")
Else
	 Dim mem_EditView
	 Set mem_EditView=Conn.ExeCute("SELECT * FROM blog_Member WHERE mem_Name='"&memName&"'")
	 SQLQueryNums=SQLQueryNums+1%>
	 <form action="member.asp?action=edit&edit=post" method="post" name="Submit" id="Submit">
	 <tr bgcolor="#FFFFFF">
        <td width="128" align="right" nowrap>呢称：</td>
        <td>&nbsp;<%=memName%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>旧密码：</td>
        <td>&nbsp;<input name="mem_OldPassword" type="password" id="mem_OldPassword" size="16">
          <span class="htd"><b><font color="#FF0000">&nbsp;*</font></b> 修改资料必须输入原密码</span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>新密码：</td>
        <td>&nbsp;<input name="mem_NewPassword" type="password" id="mem_NewPassword" size="16">
          &nbsp;<span class="htd"><b><font color="#FF0000">*</font></b> 密码必须是6-16位</span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>确认密码：</td>
        <td>&nbsp;<input name="mem_RePassword" type="password" id="mem_RePassword" size="16"></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>性别：</td>
        <td><input name="mem_Sex" type="radio" value="1" <%IF mem_EditView("mem_Sex")=1 Then Response.Write("checked")%>>男
            <input type="radio" name="mem_Sex" value="2" <%IF mem_EditView("mem_Sex")=2 Then Response.Write("checked")%>>女
            <input type="radio" name="mem_Sex" value="0" <%IF mem_EditView("mem_Sex")=0 Then Response.Write("checked")%>>保密
		</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>邮箱：</td>
        <td>&nbsp;<input name="mem_Email" type="text" id="mem_Email" value="<%=mem_EditView("mem_Email")%>" size="30">
          &nbsp;
          <input name="mem_HideEmail" type="checkbox" id="mem_HideEmail" value="1" <%IF mem_EditView("mem_HideEmail")=True Then Response.Write("Checked")%>>
          隐藏邮箱</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>腾讯QQ：</td>
        <td>&nbsp;<input name="mem_QQ" type="text" id="mem_QQ" value="<%=mem_EditView("mem_QQ")%>" maxlength="12"></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>MSN：</td>
        <td>&nbsp;<input name="mem_Msn" type="text" id="mem_Msn" value="<%=mem_EditView("mem_Msn")%>" maxlength="50"></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>个人主页：</td>
        <td>&nbsp;<input name="mem_HomePage" type="text" id="mem_HomePage" value="<%=mem_EditView("mem_HomePage")%>" size="35" maxlength="255"></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>个人简介：</td>
        <td>&nbsp;<textarea name="mem_Intro" cols="50" rows="5" wrap="VIRTUAL" id="mem_Intro"><%=mem_EditView("mem_Intro")%></textarea></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td colspan="2">
          <input type="image" name="Submit" value="" src="images/icon_submit.gif" />
        </td>
        </tr></form><%Set mem_EditView=Nothing
		End IF%>
    </table></td>
  </tr>
</table>
<%ElseIF Request.QueryString("action")="view" AND CheckStr(Request.QueryString("memName"))<>Empty Then%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><%Dim mem_View
	Set mem_View=Conn.ExeCute("SELECT * FROM blog_Member WHERE mem_Name='"&CheckStr(Request.QueryString("memName"))&"'")
	SQLQueryNums=SQLQueryNums+1
	IF mem_View.EOF AND mem_View.BOF Then
		Response.Write("<br /><br /><center><h4>对不起，你所查询的用户不存在</h4><br /><br /><a href='javascript:history.go(-1);'>点击返回上一页</a></center>")
	Else%><table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="#b6d8e0">
      <tr>
        <td colspan="4"><strong>用户 <font color="#FF0000"><%=mem_View("mem_Name")%></font> 的详细资料：</strong></td>
        </tr>
      <tr bgcolor="#FFFFFF">
        <td width="15%" align="right">呢称&nbsp;</td>
        <td colspan="3"><%=mem_View("mem_Name")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>用户组&nbsp;</td>
        <td width="35%">
          <%IF mem_View("mem_Status")="8" Then
			Response.Write("<img src='images/icon_supadmin.gif' border='0' align='absmiddle' alt='超级管理员'>")
		Elseif mem_View("mem_Status")="7" Then
			Response.Write("<img src='images/icon_admin.gif' border='0' align='absmiddle' alt='一般管理员'>")
		ElseIf mem_View("mem_Status")="6" Then
			Response.Write("<img src='images/icon_member.gif' border='0' align='absmiddle' alt='普通用户'>")
		ElseIf mem_View("mem_Status")="5" Then
			Response.Write("<font color=red>锁定用户</font>")
		Else
			Response.Write("<font color=blue>异常用户</font>")
		End IF%></td>
      <td width="15%" align="right">性别</td>
        <td width="35%"><%IF mem_View("mem_Sex")=1 Then
			Response.Write("<img src='images/male.gif' border='0' align='absmiddle'>&nbsp;帅哥")
		ElseIF mem_View("mem_Sex")=2 Then
			Response.Write("<img src='images/female.gif' border='0' align='absmiddle'>&nbsp;美女")
		Else
			Response.Write("<img src='images/secrecy.gif' border='0' align='absmiddle'>&nbsp;保密")
		End IF%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">邮箱</td>
        <td>
          <%IF mem_View("mem_HideEmail")=False Then
				Response.Write("<a href='mailto:"&HTMLEncode(mem_View("mem_Email"))&"' alt='点击发送 Email'>"&HTMLEncode(mem_View("mem_Email"))&"</a>")
			Else
				Response.Write("此用户信箱已隐藏")
			End IF%>
		</td>
		<td align="right">腾讯QQ</td>
        <td><%="<a href='http://friend.qq.com/cgi-bin/friend/user_show_info?ln="&HTMLEncode(mem_View("mem_QQ"))&"' target='_blank' alt='点击查看QQ信息'>"&HTMLEncode(mem_View("mem_QQ"))&"</a>"%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" nowrap>个人主页</td>
		<%Dim HomePage
			HomePage = Trim(HTMLEncode(mem_View("mem_HomePage")))
			If Not (Left(HomePage, 7) = "http://" Or HomePage = "") Then HomePage = "http://" & HomePage
		%>
        <td><%="<a href='"&HomePage&"' target='_blank' alt='点击浏览主页'>"&HTMLEncode(mem_View("mem_HomePage"))&"</a>"%></td>
		<td align="right">MSN</td>
		<td><%=mem_View("mem_Msn")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">发表日志</td>
        <td colspan="3"><%=mem_View("mem_PostLogs")%> 篇</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">发表评论</td>
        <td colspan="3"><%=mem_View("mem_PostComms")%> 篇&nbsp;&nbsp;&nbsp;&nbsp;[<a href="commlist.asp?memName=<%=Server.URLEncode(mem_View("mem_Name"))%>">点击浏览 <%=mem_View("mem_Name")%> 发表的所有评论</a>]</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
        <td align="right">发表留言</td>
        <td colspan="3"><%=mem_View("mem_PostGBNums")%> 篇&nbsp;&nbsp;&nbsp;&nbsp;[<a href="guestbook.asp?memName=<%=Server.URLEncode(mem_View("mem_Name"))%>">点击浏览 <%=mem_View("mem_Name")%> 发表的所有留言</a>]</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">个人介绍</td>
        <td colspan="3"><%=UBBCode(HTMLEncode(mem_View("mem_Intro")),1,0,1,0,0)%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">注册时间</td>
        <td colspan="3"><%=DateToStr(mem_View("mem_RegTime"),"Y-m-d H:I A")%></td>
	  </tr>
	  <tr bgcolor="#FFFFFF">
        <td align="right">注册IP</td>
        <td>
			<%Dim regIP
			If mem_View("mem_RegIP")<>Empty Then
				regIP=split(mem_View("mem_RegIP"),".")
				Response.Write(""&regIP(0)&"."&regIP(1)&"."&regIP(2)&".***")
			Else
				Response.Write("")
			End If
			%>
		</td>
        <td align="right">最后登陆IP</td>
        <td>
			<%Dim LastIP
			If mem_View("mem_LastIP")<>Empty Then
				LastIP=split(mem_View("mem_LastIP"),".")
				Response.Write(""&LastIP(0)&"."&LastIP(1)&"."&LastIP(2)&".***")
			Else
				Response.Write("")
			End If
			%>
		</td>
      </tr>
    </table>
    <%End IF
	Set mem_View=Nothing%>
	</td>
  </tr>
</table>
<%Else%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
	<table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="#b6d8e0">
      <tr>
        <td width="10%" align="center" nowrap><strong>编号</strong></td>
        <td width="22%" nowrap><strong>名称</strong></td>
        <td width="7%" align="center"><strong>邮箱</strong></td>
        <td width="7%" align="center"><strong>QQ</strong></td>
        <td width="7%" align="center"><strong>MSN</strong></td>
        <td width="7%" align="center"><strong>主页</strong></td>
        <td width="10%" align="center"><strong>日志</strong></td>
        <td width="10%" align="center"><strong>评论</strong></td>
		<td width="10%" align="center"><strong>留言</strong></td>
		<td width="22%"><strong>注册时间</strong></td>
      </tr><%Dim CurPage
	  IF CheckStr(Request.QueryString("Page"))<>Empty Then
			Curpage=Cint(CheckStr(Request.QueryString("Page")))
			IF Curpage<0 Then Curpage=1
	  Else
			Curpage=1
	  End IF
	  Dim blog_Member
	  Set blog_Member=Server.CreateObject("Adodb.Recordset")
	  SQL="SELECT * FROM blog_Member ORDER BY mem_ID DESC"
	  blog_Member.Open SQL,CONN,1,1
	  SQLQueryNums=SQLQueryNums+1
	  IF blog_Member.EOF AND blog_Member.BOF Then
	  		Response.Write("<tr bgcolor=""#FFFFFF""><td colspan=""9"" align=""center"" height=""48"">暂时没有用户</td></tr>")
	  Else
	  		Dim list_MemName
	  		blog_Member.Pagesize=15
			blog_Member.AbsolutePage=CurPage
			Dim Member_Nums,PageCount,MultiPages
			Member_Nums=blog_Member.RecordCount
			MultiPages="<span class=""smalltxt"">"&MultiPage(Member_Nums,15,CurPage,"?")&"</span>"
	  		Do Until blog_Member.EOF OR PageCount=15
				list_MemName=blog_Member("mem_Name")
				Response.Write("<tr bgcolor=""#FFFFFF""><td>"&blog_Member("mem_ID")&"</td>")
				If blog_Member("mem_Status")="SupAdmin" then
					Response.Write("<td nowrap><img src='images/icon_supadmin.gif' border='0' align='absmiddle'> <a href=""member.asp?action=view&memName="&Server.URLEncode(list_MemName)&""" alt=""点击查看成员 "&list_MemName&" 的详细资料""><font color=red>"&list_MemName&"</font></a></td><td align=""center"">")
				ElseIF blog_Member("mem_Status")="Admin" then
					Response.Write("<td nowrap><img src='images/icon_admin.gif' border='0' align='absmiddle'> <a href=""member.asp?action=view&memName="&Server.URLEncode(list_MemName)&""" alt=""点击查看成员 "&list_MemName&" 的详细资料""><font color=blue>"&list_MemName&"</a></font></td><td align=""center"">")
				Else
					Response.Write("<td nowrap><a href=""member.asp?action=view&memName="&Server.URLEncode(list_MemName)&""" alt=""点击查看成员 "&list_MemName&" 的详细资料"">"&list_MemName&"</a></td><td align=""center"">")
				End if
				If blog_Member("mem_HideEmail")=False And blog_Member("mem_Email")<>Empty Then Response.Write("<a href=""mailto:"&HtmlEncode(blog_Member("mem_Email"))&"""><img src=""images/icon_email.gif"" border=""0"" align=""absmiddle"" alt=""点击给成员 "&list_MemName&" 发送 Email""></a>")
				Response.Write("</td><td nowrap align=""center"">")
				If blog_Member("mem_QQ")<>Empty Then Response.Write("<a href=""http://friend.qq.com/cgi-bin/friend/user_show_info?ln="&HtmlEncode(blog_Member("mem_QQ"))&""" target=""_blank""><img src=""images/icon_qq.gif"" border=""0"" align=""absmiddle"" alt=""点击查看成员 "&list_MemName&" 的QQ资料""></a>")
				Response.Write("</td><td nowrap align=""center"">")
				If blog_Member("mem_Msn")<>Empty Then Response.Write("<a href=""mailto:"&HtmlEncode(blog_Member("mem_Msn"))&"""><img src=""images/icon_msn.gif"" border=""0"" align=""absmiddle"" alt=""点击查看成员 "&list_MemName&" 的MSN资料""></a>")
				Response.Write("</td><td align=""center"">")
				Dim EHomePage
					EHomePage = Trim(HTMLEncode(blog_Member("mem_HomePage")))
					If Not (Left(EHomePage, 7) = "http://" Or EHomePage = "") Then EHomePage = "http://" & EHomePage
				If blog_Member("mem_Homepage")<>Empty Then Response.Write("<a href='"&EHomePage&"' target=""_blank""><img src=""images/icon_home.gif"" border=""0"" align=""absmiddle"" alt=""点击访问成员 "&list_MemName&" 的个人主页""></a>")
				Response.Write("</td><td>"&blog_Member("mem_PostLogs")&"</td><td nowarp>"&blog_Member("mem_PostComms")&"</td><td nowarp>"&blog_Member("mem_PostGBNums")&"</td><td width=""100%"" nowrap>"&DateToStr(blog_Member("mem_RegTime"),"Y-m-d H:I A")&"</td></tr>")
				blog_Member.MoveNext
				PageCount=PageCount+1
			Loop
			Response.Write("<tr bgcolor=""#FFFFFF""><td colspan=""10"">"&MultiPages&"</td></tr>")
		End IF
		blog_Member.Close
		Set blog_Member=Nothing%>
    </table></td>
  </tr>
</table>
<%End IF%>
</div>
<!--#include file="footer.asp" -->