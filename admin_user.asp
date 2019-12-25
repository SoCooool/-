<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/md5.asp"-->
<%
const MaxPerPage=20
dim strFileName
dim totalPut,CurrentPage,TotalPages
dim rs
dim UserID,UserSearch,Keyword,strField,ComeUrl
dim Action,FoundErr,ErrMsg
dim tmpDays
keyword=trim(request("keyword"))
if keyword<>"" then 
	keyword=eblog.filt_badstr(keyword)
end if
strField=trim(request("Field"))
UserSearch=trim(request("UserSearch"))
Action=trim(request("Action"))
UserID=trim(Request("UserID"))
'ComeUrl=Request.ServerVariables("HTTP_REFERER")

if UserSearch="" then
	UserSearch=0
else
	UserSearch=Clng(UserSearch)
end if
strFileName="admin_user.asp?UserSearch=" & UserSearch
if strField<>"" then
	strFileName=strFileName&"&Field="&strField
end if
if keyword<>"" then
	strFileName=strFileName&"&keyword="&keyword
end if
if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

%>
<html>
<head>
<title>成员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
<SCRIPT language=javascript>
function unselectall()
{
    if(document.myform.chkAll.checked){
	document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    } 	
}

function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
}
</SCRIPT>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<br>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" Class="border">
  <tr class="topbg"> 
    <td height="22" colspan=2 align=center><strong>注 册 用 户 管 理</strong></td>
  </tr>
  <form name="form1" action="admin_user.asp" method="get">
    <tr class="tdbg"> 
      <td width="100" height="30"><strong>快速查找用户：</strong></td>
      <td width="687" height="30"><select size=1 name="UserSearch" onChange="javascript:submit()">
          <option value=>请选择查询条件</option>
		  <option value="0">最后注册的100个用户</option>
          <option value="1">发表评论最多的前100个用户</option>
          <option value="2">发表评论最少的100个用户</option>
		  <option value="3">所有普通管理员</option>
		  <option value="4">所有超级管理员</option>
          <option value="5">所有被锁住的用户</option>
		  <option value="6">所有没有被锁住的用户</option>
          <option value="7">所有用户</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_user.asp">用户管理首页</a>&nbsp;|&nbsp;<a href="register.asp" target="_blank">添加新用户</a></td>
    </tr>
  </form>
  <form name="form2" method="post" action="admin_user.asp">
  <tr class="tdbg">
	<td width="120"><strong>用户高级查询：</strong></td>
    <td>
      <select name="Field" id="Field">
	  <option value="UserName" selected>用户名</option>
      <option value="UserID" >用户ID</option>
      </select>
      <input name="Keyword" type="text" id="Keyword" size="20" maxlength="30">
      <input type="submit" name="Submit2" value=" 查 询 ">
      <input name="UserSearch" type="hidden" id="UserSearch" value="7"> 
	  若为空，则查询所有用户
	</td>
  </tr>
</form>
</table>
<%
if Action="Add" then
	call AddUser()
elseif Action="SaveAdd" then
	call SaveAdd()
elseif Action="Modify" then
	call Modify()
elseif Action="SaveModify" then
	call SaveModify()
elseif Action="Del" then
	call DelUser()
elseif Action="Lock" then
	call LockUser()
elseif Action="UnLock" then
	call UnLockUser()
elseif Action="Move" then
	call MoveUser()
elseif Action="DoUpdate" then
	call DoUpdate()
else
	call main()
end if
if FoundErr=true then
	call WriteErrMsg()
end if

sub main()
	dim strGuide
	strGuide="<table width='100%'><tr><td align='left'>您现在的位置：<a href='admin_user.asp'>成员管理</a>&nbsp;&gt;&gt;&nbsp;"
	select case UserSearch
		case 0
			sql="select top 100 * from (select * from blog_Member order by mem_ID desc)"
			strGuide=strGuide & "最后注册的100个用户"
		case 1
			sql="select top 100 * from (select * from blog_Member order by mem_PostComms desc)"
			strGuide=strGuide & "发表评论最多的前100个用户"
		case 2
			sql="select top 100 * from (select * from blog_Member order by mem_PostComms)"
			strGuide=strGuide & "发表评论最少的100个用户"
		case 3
			sql="select * from blog_Member where mem_Status=7 order by mem_ID desc"
			strGuide=strGuide & "所有普通管理员"
		case 4
			sql="select * from blog_Member where mem_Status=8 order by mem_ID desc"
			strGuide=strGuide & "所有超级管理员"
		case 5
			sql="select * from blog_Member where mem_Status=5 order by mem_ID desc"
			strGuide=strGuide & "所有被锁住的用户"
		case 6
			sql="select * from blog_Member where mem_Status>5 order by mem_ID desc"
			strGuide=strGuide & "所有没有被锁住的用户"
		case 7
			if Keyword="" then
				sql="select * from blog_Member order by mem_ID desc"
				strGuide=strGuide & "所有用户"
			else
				select case strField
					case "UserID"
						if IsNumeric(Keyword)=false then
							FoundErr=true
							ErrMsg=ErrMsg & "<br><li>用户ID必须是整数！</li>"
						else
							sql="select * from blog_Member where mem_ID =" & Clng(Keyword)
							strGuide=strGuide & "用户ID等于<font color=red> " & Clng(Keyword) & " </font>的用户"
						end if
					case "UserName"
					sql="select * from blog_Member where mem_Name like '%" & Keyword & "%' order by mem_ID desc"
					strGuide=strGuide & "用户名中含有“ <font color=red>" & Keyword & "</font> ”的用户"
				end select
			end if
		case else
			FoundErr=true
			ErrMsg=ErrMsg & "<br><li>错误的参数！</li>"
	end select
	strGuide=strGuide & "</td><td align='right'>"
	if FoundErr=true then exit sub
	'if not IsObject(conn) then link_database
	Set rs=Server.CreateObject("Adodb.RecordSet")
	rs.Open sql,Conn,1,1
  	if rs.eof and rs.bof then
		strGuide=strGuide & "共找到 <font color=red>0</font> 个用户</td></tr></table>"
		response.write strGuide
	else
    	totalPut=rs.recordcount
		strGuide=strGuide & "共找到 <font color=red>" & totalPut & "</font> 个用户</td></tr></table>"
		response.write strGuide
		if currentpage<1 then
       		currentpage=1
    	end if
    	if (currentpage-1)*MaxPerPage>totalput then
	   		if (totalPut mod MaxPerPage)=0 then
	     		currentpage= totalPut \ MaxPerPage
		  	else
		      	currentpage= totalPut \ MaxPerPage + 1
	   		end if

    	end if
	    if currentPage=1 then
        	showContent
        	response.write eblog.showpage(strFileName,totalput,MaxPerPage,true,true,"个用户")
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	response.write eblog.showpage(strFileName,totalput,MaxPerPage,true,true,"个用户")
        	else
	        	currentPage=1
           		showContent
           		response.write eblog.showpage(strFileName,totalput,MaxPerPage,true,true,"个用户")
	    	end if
		end if
	end if
	rs.Close
	set rs=Nothing
end sub

sub showContent()
   	dim i
    i=0
%>
<table width='98%' border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <form name="myform" method="Post" action="admin_user.asp" onsubmit="return confirm('确定要执行选定的操作吗？');">
     <td>
		<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
          <tr class="title"> 
            <td width="30" align="center"><font color="#FFFFFF">选中</font></td>
            <td width="30" align="center"><font color="#FFFFFF">ID</font></td>
            <td width="80" height="22" align="center"><font color="#FFFFFF"> 用户名</font></td>
            <td height="22" align="center"><font color="#FFFFFF">所属用户组</font></td>
            <td height="22" align="center"><font color="#FFFFFF">最后登录IP</font></td>
            <td align="center"><font color="#FFFFFF">最后登录时间</font></td>
            <td width="60" height="22" align="center"><font color="#FFFFFF">性别</font></td>
            <td width="40" height="22" align="center"><font color="#FFFFFF">状态</font></td>
            <td width="120" height="22" align="center"><font color="#FFFFFF">操作</font></td>
          </tr>
          <%do while not rs.EOF %>
          <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
            <td width="30" align="center"><input name='UserID' type='checkbox' onclick="unselectall()" id="UserID" value='<%=cstr(rs("mem_ID"))%>'></td>
            <td width="30" align="center"><%=rs("mem_ID")%></td>
            <td width="80" align="center"><%response.write "<a href='admin_user.asp?Action=Modify&UserID=" & rs("mem_ID") & "'>" & rs("mem_Name") & "</a>"%></td>
            <td align="center">
			<%select case rs("mem_Status")
				case 5
					response.write "锁定用户"
				case 6
					response.write "普通成员"
				case 7
					response.write "<font color=blue>普通管理员</font>"
				case 8
					response.write "<font color=blue>超级管理员</font>"
				case else
					response.write "<font color=red>异常用户</font>"
			end select%></td>
            <td align="center"><%
				if rs("mem_LastIP")<>"" then
					response.write rs("mem_LastIP")
				else
					response.write "&nbsp;"
				end if
			%></td>
            <td align="center"><%
				if rs("mem_RegTime")<>"" then
					response.write rs("mem_RegTime")
				else
					response.write "&nbsp;"
				end if
			%></td>
            <td width="60" align="center"><%
				if rs("mem_Sex")=1 then
					response.write "<font color=blue>男</font>"
				elseif rs("mem_Sex")=2 then
					response.write "<font color=red>女</font>"
				else
					response.write "保密"
				end if
			%></td>
            <td width="40" align="center"><%
			  if rs("mem_Status")=5 then
				response.write "<font color=red>锁定</font>"
			  else
				response.write "正常"
			  end if
			%></td>
            <td width="120" align="center"><%
				response.write "<a href='admin_user.asp?Action=Modify&UserID=" & rs("mem_ID") & "'>修改</a>&nbsp;"
				if rs("mem_Status")<>5 then
					response.write "<a href='admin_user.asp?Action=Lock&UserID=" & rs("mem_ID") & "'>锁定</a>&nbsp;"
				else
					response.write "<a href='admin_user.asp?Action=UnLock&UserID=" & rs("mem_ID") & "'>解锁</a>&nbsp;"
				end if
				response.write "<a href='admin_user.asp?Action=Del&UserID=" & rs("mem_ID") & "' onClick='return confirm(""确定要删除此用户吗？"");'>删除</a>"
			%></td>
          </tr>
		<%
			i=i+1
			if i>=MaxPerPage then exit do
			rs.movenext
		loop
		%>
        </table>  
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="200" height="30"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox">
              选中本页显示的所有用户</td>
            <td> <strong>操作：</strong> 
              <input name="Action" type="radio" value="Del" checked onClick="document.myform.User_Status.disabled=true">
              删除&nbsp;&nbsp;&nbsp;&nbsp; 
              <input name="Action" type="radio" value="Move" onClick="document.myform.User_Status.disabled=false">移动到
              <select name="User_Status" id="User_Status" disabled>
				<option value="5">锁定用户</option>
				<option value="6">普通成员</option>
				<option value="7">普通管理员</option>
				<option value="8">超级管理员</option>
              </select>
              &nbsp;&nbsp; 
              <input type="submit" name="Submit" value=" 执 行 "> </td>
		  </tr>
		</table>
		</td>
	</form>
  </tr>
</table>
<%
end sub


sub Modify()
	dim UserID
	dim rsUser,sqlUser
	UserID=trim(request("UserID"))
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>参数不足！</li>"
		exit sub
	else
		UserID=Clng(UserID)
	end if
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from blog_Member where mem_ID=" & UserID
	if not IsObject(conn) then link_database
	rsUser.Open sqlUser,Conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>找不到指定的用户！</li>"
		rsUser.close
		set rsUser=nothing
		exit sub
	end if
%>
<FORM name="Form1" action="admin_user.asp" method="post">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <TR class='title'> 
	<TD height=22 colSpan=2 align="center"><strong><font color="#FFFFFF">修改成员信息</font></strong></TD>
  </TR>
  <TR class="tdbg" > 
	<TD width="40%">用户名：</TD>
	<TD width="60%"><%=rsUser("mem_Name")%></TD>
  </TR>
  <TR class="tdbg" > 
	<TD width="40%">密码(至少6位)：<BR>请输入密码，区分大小写。 请不要使用任何类似 '*'、' ' 或 HTML 字符 </TD>
	<TD width="60%"><INPUT type=password maxLength=16 size=30 name=Password> <font color="#FF0000">如果不想修改，请留空</font></TD>
  </TR>
  <TR class="tdbg"> 
	<TD>确认密码(至少6位)：<br>请再输一遍确认</TD>
	<TD><INPUT name=PwdConfirm type=password id="PwdConfirm" size=30 maxLength=12> <font color="#FF0000">如果不想修改，请留空</font></TD>
  </TR>
  <TR class="tdbg"> 
	<TD width="40%">性别：</TD>
	<TD width="60%">
		<INPUT type=radio value="1" name=sex <%if rsUser("mem_Sex")=1 then response.write "CHECKED"%>>男
		<INPUT type=radio value="2" name=sex <%if rsUser("mem_Sex")=2 then response.write "CHECKED"%>>女
		<INPUT type=radio value="0" name=sex <%if rsUser("mem_Sex")=0 then response.write "CHECKED"%>>保密
	</TD>
  </TR>
  <TR class="tdbg" > 
	<TD width="40%">Email地址：</TD>
	<TD width="60%"><INPUT name=Email value="<%=rsUser("mem_Email")%>" size=30 maxLength=50> <a href="mailto:<%=rsUser("mem_Email")%>">给此用户发一封电子邮件</a></TD>
  </TR>
  <TR class="tdbg"> 
	<TD width="40%">OICQ号码：</TD>
	<TD width="60%"><INPUT name=OICQ value="<%=rsUser("mem_QQ")%>" size=30 maxLength=20></TD>
  </TR>
  <TR class="tdbg"> 
	<TD width="40%">MSN：</TD>
	<TD width="60%"><INPUT name=msn value="<%=rsUser("mem_Msn")%>" size=30 maxLength=50></TD>
  </TR>
  <TR class="tdbg"> 
	<TD width="40%">用户级别：</TD>
	<TD width="60%">
		<select name="User_Status" id="User_Status">
          <option value="6" <%if rsUser("mem_Status")=6 then response.Write("selected")%>>普通成员</option>
		  <option value="5" <%if rsUser("mem_Status")=5 then response.Write("selected")%>>锁定用户！</option>
          <option value="7" <%if rsUser("mem_Status")=7 then response.Write("selected")%>>普通管理员</option>
          <option value="8" <%if rsUser("mem_Status")=8 then response.Write("selected")%>>超级管理员</option>
        </select>
	</TD>
  </TR>
  <TR class="tdbg" > 
	<TD height="40" colspan="2" align="center">
		<input name="Action" type="hidden" id="Action" value="SaveModify">
		<input name=Submit type=submit id="Submit" value="保存修改结果">
		<input name="UserID" type="hidden" id="UserID" value="<%=rsUser("mem_ID")%>">
	</TD>
  </TR>
  </TABLE>
</form>
<%
	rsUser.close
	set rsUser=nothing
end sub
%>
</body>
</html>
<%

sub SaveModify()
	dim UserID,Password,PwdConfirm,Sex,Email,Homepage,OICQ,MSN,mem_Status
	dim rsUser,sqlUser
	Action=trim(request("Action"))
	UserID=trim(request("UserID"))
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>参数不足！</li>"
		exit sub
	else
		UserID=Clng(UserID)
	end if
	Password=trim(request("Password"))
	PwdConfirm=trim(request("PwdConfirm"))
	Sex=trim(Request("Sex"))
	Email=trim(request("Email"))
	Homepage=trim(request("Homepage"))
	OICQ=trim(request("OICQ"))
	MSN=trim(request("MSN"))
	mem_Status=trim(request("User_Status"))
	if Password<>"" then
		if eblog.strLength(Password)>12 or eblog.strLength(Password)<6 then
			founderr=true
			errmsg=errmsg & "<br><li>密码不能大于12小于6，如果你不想修改密码，请保持为空。</li>"
		end if
		if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"")>0 or Instr(Password,"$")>0 then
			errmsg=errmsg+"<br><li>密码中含有非法字符，如果你不想修改密码，请保持为空。</li>"
			founderr=true
		end if
	end if
	if Password<>PwdConfirm then
		founderr=true
		errmsg=errmsg & "<br><li>密码和确认密码不一致</li>"
	end if
	if Sex="" then
		founderr=true
		errmsg=errmsg & "<br><li>性别不能为空</li>"
	else
		sex=cint(sex)
		if Sex<>0 and Sex<>1 then
			Sex=2
		end if
	end if

	if founderr=true then
		set rsuser=nothing
		exit sub
	end if
	
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from blog_Member where mem_ID=" & UserID
	if not IsObject(conn) then link_database
	rsUser.Open sqlUser,Conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>找不到指定的用户！</li>"
		rsUser.close
		set rsUser=nothing
		exit sub
	end if
	if Password<>"" then
		rsUser("mem_Password")=md5(Password)
	end if
	rsUser("mem_Sex")=Sex
	rsUser("mem_Email")=Email
	rsUser("mem_QQ")=OICQ
	rsUser("mem_Msn")=MSN
	rsUser("mem_Status")=mem_Status
	rsUser.update
	rsUser.Close
	set rsUser=nothing
	eblog.showok "修改成功!",""
end sub


sub DelUser()
	dim rs,i
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请指定要删除的用户</li>"
		exit sub
	end if
	if instr(UserID,",")>0 then
		UserID=split(UserID,",")
		for i=0 to ubound(userid)
			deloneuser(userid(i))
		next
	else
		deloneuser(userid)
	end if
	'response.redirect "admin_user.asp"
end sub

sub deloneuser(userid)
	userid=clng(userid)
	dim rs,uname,udir
	set rs=Conn.execute("select mem_ID,mem_Name from blog_Member where mem_ID="&userid)
	if not rs.eof then
		udir=rs(0)
		uname=rs(1)
		Conn.execute("delete from blog_Member where mem_ID="&userid)
		Conn.execute("update blog_Info set blog_MemNums=blog_MemNums-1")
	end if
	set rs=nothing
	eblog.showok "删除成功!",""
end sub

sub LockUser()
	dim rs,udir
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请选择要锁定的用户</li>"
		exit sub
	end if
	userid=clng(userid)
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select mem_Status from blog_Member where mem_ID="&userid,conn,1,3
	if not rs.eof then
		rs(0)=5
		udir=rs(0)
		rs.update
	end if
	rs.close
	set rs=nothing
	eblog.showok "锁定用户成功",""
end sub

sub UnLockUser()
	dim rs,udir
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请选择要锁定的用户</li>"
		exit sub
	end if
	userid=clng(userid)
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select mem_Status from blog_Member where mem_ID="&userid,conn,1,3
	if not rs.eof then
		rs(0)=6
		udir=rs(0)
		rs.update
	end if
	rs.close
	set rs=nothing
	eblog.showok "解锁用户成功,并设置为普通成员",""
end sub

sub MoveUser()
	dim msg
	if UserID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请指定要移动的用户</li>"
		exit sub
	end if
	dim mem_Status
	mem_Status=trim(request("User_Status"))
	if mem_Status="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请指定目标用户组</li>"
		exit sub
	else
		mem_Status=Clng(mem_Status)
	end if
	if instr(UserID,",")>0 then
		UserID=replace(UserID," ","")
		if mem_Status=6 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>普通成员</font>”！"
			sql="Update blog_Member set mem_Status=6 where mem_ID in (" & UserID & ")"
		elseif mem_Status=7 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>普通管理员</font>”！"
			sql="Update blog_Member set mem_Status=7 where mem_ID in (" & UserID & ")"
		elseif mem_Status=8 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>超级管理员</font>”！"
			sql="Update blog_Member set mem_Status=8 where mem_ID in (" & UserID & ")"
		elseif mem_Status=5 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>锁定成员</font>”！"
			sql="Update blog_Member set mem_Status=5 where mem_ID in (" & UserID & ")"
		end if
	else
		if mem_Status=6 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>普通成员</font>”！"
			sql="Update blog_Member set mem_Status=6 where mem_ID=" & UserID 
		elseif mem_Status=7 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>普通管理员</font>”！"
			sql="Update blog_Member set mem_Status=7 where mem_ID="& UserID
		elseif mem_Status=8 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>超级管理员</font>”！"
			sql="Update blog_Member set mem_Status=8 where mem_ID=" & UserID 
		elseif mem_Status=5 then
			msg="&nbsp;&nbsp;&nbsp;&nbsp;已经成功将选定用户设为“<font color=blue>锁定成员</font>”！"
			sql="Update blog_Member set mem_Status=9 where mem_ID=" & UserID
		end if
	end if
	Conn.Execute sql
	response.Redirect "admin_user.asp"
	'call WriteSuccessMsg(msg)
end sub

sub DoUpdate()
	Server.ScriptTimeOut=999999999
	dim BeginID,EndID,p1,rsUser,blog,i
	BeginID=trim(request("BeginID"))
	EndID=trim(request("EndID"))
	if BeginID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请指定开始ID</li>"
	else
		BeginID=Clng(BeginID)
	end if
	if EndID="" then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>请指定结束ID</li>"
	else
		EndID=Clng(EndID)
	end if
	if FoundErr=true then exit sub
	set rsuser=eblog.execute("select count(userid) from blog_Member where userID>=" & clng(BeginID) & " and userID<=" & clng(EndID))
	p1=rsuser(0)
	set rsuser=eblog.execute("select userid from blog_Member where userID>=" & clng(BeginID) & " and userID<=" & clng(EndID))
	set blog=new class_blog
	response.Write("<div style=""text-align: center;"">")
	response.Write("<div class=""progress1""><div class=""progress2"" id=""progress1""></div></div><span id=""pstr1""></span><br><br>")
	i=1
	blog.progress_init
	do while not rsUser.eof
		Response.Write "<script>progress1.style.width ="""&int(i/p1*100)&"%"";progress1.innerHTML="""&int(i/p1*100)&"%"";pstr1.innerHTML=""全部进度：当前用户ID:"&rsuser(0)&""";</script>" & VbCrLf
		Response.Flush
		blog.userid=rsUser(0)
		blog.update_alllog(rsUser(0))
		rsUser.movenext
		i=i+1
	loop
	response.Write("</div>")
	set rsUser=nothing
	set blog=nothing
end sub

sub WriteErrMsg()
	dim strErr
	strErr=strErr & "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>" & vbcrlf
	strErr=strErr & "<html xmlns='http://www.w3.org/1999/xhtml'>" & vbcrlf
	strErr=strErr & "<head>" & vbcrlf
	strErr=strErr & "<title>错误信息</title>" & vbcrlf
	strErr=strErr & "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>" & vbcrlf
	strErr=strErr & "<link href='styles/admin_style.css' rel='stylesheet' type='text/css'>" & vbcrlf
	strErr=strErr & "</head>" & vbcrlf
	strErr=strErr & "<body>" & vbcrlf
	strErr=strErr & "<br/><br/>" & vbcrlf
	strErr=strErr & "<table cellpadding=2 cellspacing=1 border=0 width=400 class='border' align=center>" & vbcrlf
	strErr=strErr & "  <tr align='center' class='title'><td height='22'><strong>错误信息</strong></td></tr>" & vbcrlf
	strErr=strErr & "  <tr class='tdbg'><td height='100' valign='top'><b>产生错误的可能原因：</b>" & errmsg &"</td></tr>" & vbcrlf
	strErr=strErr & "  <tr align='center' class='tdbg'><td><a href='javascript:history.go(-1)'>&lt;&lt; 返回上一页</a></td></tr>" & vbcrlf
	strErr=strErr & "</table>" & vbcrlf
	strErr=strErr & "</body></html>" & vbcrlf
	response.write strErr
end sub

%>