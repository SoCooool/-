<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim Action,FoundErr,ErrMsg
Action=trim(request("Action"))
dim dbpath
dim ObjInstalled
if not is_sqldata then dbpath=server.mappath(db)
ObjInstalled=IsObjInstalled("Scripting.FileSystemObject")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据库备份</title>
<link rel="stylesheet" type="text/css" href="styles/admin_style.css">
</head>
<body class="bgcolor">
<br>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
	<td height="22" colspan="2" align="center"><strong>数 据 库 管 理</strong></td>
  </tr>
  <tr class="tdbg">
	<td width="70" height="30"><strong>管理导航：</strong></td>
    <td height="30">&nbsp;&nbsp;<a href="admin_database.asp?Action=Backup">备份数据库</a> | <a href="admin_database.asp?Action=Restore">恢复数据库</a> | <a href="admin_database.asp?Action=Compact">压缩数据库</a> | <a href="admin_database.asp?Action=sqlquery">执行SQL语句</a></td>
  </tr>
</table>
<%
if Action="Backup" or Action="BackupData" then
	if isobject(conn) then conn.close:set conn=nothing
	call ShowBackup()
elseif Action="Compact" or Action="CompactData" then
	if isobject(conn) then conn.close:set conn=nothing
	call ShowCompact()
elseif Action="Restore" or Action="RestoreData" then
	if isobject(conn) then conn.close:set conn=nothing
	call ShowRestore()
elseif Action="sqlquery" or Action="sqlqueryData" then
	call ShowSQL()
	if isobject(conn) then conn.close:set conn=nothing
else
	FoundErr=True
	ErrMsg=ErrMsg & "<li>错误参数！</li>"
	if isobject(conn) then conn.close:set conn=nothing
end if
if FoundErr=True then
	eblog.admin_err(errmsg)
end if

sub ShowBackup()
%>
<form method="post" action="admin_database.asp?action=BackupData">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="border">
  <tr class="title"> 
	<td align="center" height="22" valign="middle">备 份 数 据 库</td>
  </tr>
  <tr class="tdbg"> 
	<td height="150" align="center" valign="middle">
		<%
		if request("action")="BackupData" then
			call backupdata()
		else
		%>
			<table cellpadding="3" cellspacing="1" border="0" width="100%">
			  <tr> 
				<td width="200" height="33" align="right">备份目录：</td>
				<td><input type="text" size="20" name="bkfolder" value="Databackup"></td>
				<td>相对路径目录，如目录不存在，将自动创建</td>
			  </tr>
			  <tr>
				<td width="200" height="34" align="right">备份名称：</td>
				<td height="34"><input type="text" size="20" name="bkDBname" value="<%=date()%>"></td>
				<td height="34">不用输入文件名后缀（默认为“.asa”）。如有同名文件，将覆盖</td>
			  </tr>
			  <tr align="center">
				<td height="40" colspan="3"><input name="submit" type="submit" value=" 开始备份 " <%If ObjInstalled=false Then response.Write "disabled"%>></td>
			  </tr>
			</table>
			<%
			If ObjInstalled=false Then
				Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
			end if
		end if
		%>
	</td>
  </tr>
</table>
</form>
<%
end sub

sub ShowCompact()
%>
<form method="post" action="admin_database.asp?action=CompactData">
<table class="border" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="title"> 
    <td align="center" height="22" valign="middle">数据库在线压缩</td>
  </tr>
  <tr class="tdbg"> 
    <td align="center" height="150" valign="middle"> 
      <%    
if request("action")="CompactData" then
	call CompactData()
else
%>
      <br> 
      <br> 
      <br>
      压缩前，建议先备份数据库，以免发生意外错误。 <br> 
      <br> 
      <br> 
      <input name="submit2" type="submit" value=" 压缩数据库 " <%If ObjInstalled=false Then response.Write "disabled"%>> 
      <br> 
      <br> 
      <%
	If ObjInstalled=false Then
		Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
	end if
end if
%>
    </td>
  </tr>
</table>
</form>
<%
end sub

sub ShowRestore()
%>
<form method="post" action="admin_database.asp?action=RestoreData">
	<table width="98%" class="border" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="title"> 
      		<td align="center" height="22" valign="middle">数据库恢复</td>
        </tr>
        <tr class="tdbg">
            <td align="center" height="150" valign="middle"> 
        <%
if request("action")="RestoreData" then
	call RestoreData()
else
%>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%" height="30" align="right">备份数据库路径（相对）：</td>
            <td height="30"><input name="backpath" type="text" id="backpath" value="DataBackup\eblog.mdb" size="50" maxlength="200"></td>
          </tr>
          <tr align="center"> 
            <td height="40" colspan="2"><input name="submit" type="submit" value=" 恢复数据 " <%If ObjInstalled=false Then response.Write "disabled"%>></td>
          </tr>
        </table>
<%
	If ObjInstalled=false Then
		Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
	end if
end if
%>
            </td>
        </tr>
  </table>
</form>
<%end sub

sub showsql()
%>
<form method="post" action="admin_database.asp?action=sqlqueryData">
	<table width="98%" class="border" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="title"> 
      		<td align="center" height="22" valign="middle">执行SQL语句</td>
        </tr>
        <tr class="tdbg">
            <td align="center" height="150" valign="middle"> 
        <%
if request("action")="sqlqueryData" then
	call sqlqueryData()
else
%>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%" height="30" align="right">SQL 查询执行(一次执行一个查询)：</td>
            <td height="30"><input name="sqlquery" type="text" id="sqlquery" value="" size="50" maxlength="200"></td>
          </tr>
          <tr align="center"> 
            <td height="40" colspan="2"><input name="submit" type="submit" value=" 执行 " <%If ObjInstalled=false Then response.Write "disabled"%>></td>
          </tr>
        </table>
<%
	If ObjInstalled=false Then
		Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
	end if
end if
%>
            </td>
        </tr>
  </table>
</form>
<%end sub%>
</body>
</html>
<%
sub BackupData()
	dim bkfolder,bkdbname,fso
	bkfolder=trim(request("bkfolder"))
	bkdbname=trim(request("bkdbname"))
	if bkfolder="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<li>请指定备份目录！"
	end if
	if bkdbname="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<li>请指定备份文件名</li>"
	end if
	if FoundErr=True then exit sub
	bkfolder=server.MapPath(bkfolder)
	Set Fso=server.createobject("scripting.filesystemobject")
	if fso.FileExists(dbpath) then
		If fso.FolderExists(bkfolder)=false Then
			fso.CreateFolder(bkfolder)
		end if
		fso.copyfile dbpath,bkfolder & "\" & bkdbname & ".asa"
		response.write "<center>备份数据库成功，备份的数据库为 " & bkfolder & "\" & bkdbname & ".asa</center>"
	Else
		response.write "<center>找不到源数据库文件，请检查inc/conn.asp中的配置。</center>"
	End if
end sub

sub CompactData()
	Dim fso, Engine, strDBPath
	strDBPath = left(dbPath,instrrev(DBPath,"\"))
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	If fso.FileExists(dbPath) Then
		Set Engine = CreateObject("JRO.JetEngine")
		Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbpath," Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
		fso.CopyFile strDBPath & "temp.mdb",dbpath
		fso.DeleteFile(strDBPath & "temp.mdb")
		Set fso = nothing
		Set Engine = nothing
		response.write "数据库压缩成功!"
	Else
		response.write "数据库没有找到!"
	End If
end sub

sub RestoreData()
	dim backpath,fso
	backpath=request.form("backpath")
	if backpath="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<li>请指定原备份的数据库文件名！</li>"
		exit sub	
	end if
	backpath=server.mappath(backpath)
	Set Fso=server.createobject("scripting.filesystemobject")
	if fso.fileexists(backpath) then  					
		fso.copyfile Backpath,Dbpath
		response.write "成功恢复数据！"
	else
		response.write "找不到指定的备份文件！"
	end if
end sub

sub sqlqueryData()
	Dim SQL_Query
	SQL_Query=Request.Form("sqlquery")
	IF SQL_Query=Empty Then
		Response.Write "请填写正确的SQL语句"
	Else
		Conn.ExeCute(SQL_Query)
		SQLQueryNums=SQLQueryNums+1
		Response.Write "SQL语句执行成功"
	End If
end sub

'**************************************************
'函数名：IsObjInstalled
'作  用：检查组件是否已经安装
'参  数：strClassString ----组件名
'返回值：True  ----已经安装
'        False ----没有安装
'**************************************************
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function
%>