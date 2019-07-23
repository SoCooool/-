<!--#include file="inc/inc_sys.asp"-->
<html>
<head>
<title>上传文件管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body class="bgcolor">
<br>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border" >
  <tr class="title"> 
    <td height="22">上传管理附件管理</td>
  </tr>
  <tr class="tdbg">
    <td style="padding-left: 20px;">
	<%IF Request.QueryString("type")="DeleFile" Then
		IF Request.QueryString("filename")=Empty Then
			Response.Write("<a href=""admin_uploadfile.asp?action=uploadfile"">没有选择要删除的文件，请点击返回</a>")
		Else
			IF DeleteFiles(Server.MapPath("attachments/"&Request.QueryString("filename")))=1 Then
				Response.Write("<a href=""admin_uploadfile.asp?action=uploadfile"">文件删除成功，请点击返回</a>")
			Else
				Response.Write("<a href=""admin_uploadfile.asp?action=uploadfile"">文件删除失败，请点击返回</a>")
			End IF
		End IF
	Else
		Dim fso,Folder
		Set FSO=Server.CreateObject("Scripting.FileSystemObject")
		IF Err<>0 Then
			Err.Clear
			Response.Write("服务器关闭FSO，无法查看附件")
		Else
			If Request.QueryString("FolderName")=Empty Then
				Set Folder=FSO.GetFolder(Server.MapPath("attachments"))
				Dim FolderList
				Set FolderList=Folder.SubFolders
				Dim FolderName,FolderEvery
				For Each FolderEvery IN FolderList
					FolderName=FolderEvery.Name
					Response.Write("<a href=""admin_uploadfile.asp?action=uploadfile&foldername="&FolderName&""">浏览文件夹"&FolderName&"中的附件</a><br><img name=""HideImage"" src="""" width=""2"" height=""5"" alt=""""><br>")
				Next
				Set FolderList=Nothing
			Else
				Set Folder=FSO.GetFolder(Server.MapPath("attachments/"&Request.QueryString("FolderName")))
				Dim FileList
				Set FileList=Folder.Files
				Dim FileName,FileEvery
					Response.Write("浏览文件夹 <strong><font color=red>attachments/"&Request.QueryString("FolderName")&"/</font></strong><br><br>")
				For Each FileEvery IN FileList
					FileName=FileEvery.Name
					Response.Write("&nbsp;&nbsp;浏览附件 <a href=""attachments/"&Request.QueryString("FolderName")&"/"&FileName&""" target=""_blank"">"&FileName&"</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=""admin_uploadfile.asp?action=uploadfile&type=DeleFile&filename="&Request.QueryString("FolderName")&"/"&FileName&""" title=""删除文件"">删除文件</a><br><img name=""HideImage"" src="""" width=""2"" height=""5"" alt=""""><br>")
				Next
				Set FileList=Nothing
			End If
			Set Folder=Nothing
		End If
		Set FSO=Nothing
	End IF%>
	</td>
  </tr>
</table>
</body>
</html>
<%
Function DeleteFiles(FilePath)
    Dim FSO
    Set FSO=Server.CreateObject("Scripting.FileSystemObject")
	IF Err<>0 Then
		Err.Clear
		Response.Write("服务器关闭FSO，无法删除文件")
	Else
		If FSO.FileExists(FilePath) Then
			FSO.DeleteFile FilePath,True
			DeleteFiles = 1
		Else
			DeleteFiles = 0
		End If
	End If
    Set FSO = Nothing
End Function
%>