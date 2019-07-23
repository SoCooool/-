<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/cls_main.asp" -->
<!--#include file="inc/upload.inc" -->
<%On Error Resume Next%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
body {
	font-size: 14px;
	font-family: Tahoma, Verdana, "宋体";
}
table {
	font-family: Tahoma, Verdana, "宋体";
	color: #000000;
	font-size: 14px;
	word-break : break-all ;
}
a:link,a:visited {
	text-decoration: none;
	color: #003366;
	font-family: Tahoma, Verdana, "宋体";
}
a:hover {
	text-decoration: none;
	color:#FF0000;
	font-family: Tahoma, Verdana, "宋体";
}
textarea,input,object	{ 
	font-family: Tahoma, Verdana, "宋体"; 
	font-size: 14px;  
	color: #000000; 
	font-weight: normal; 
	background-color: #FFFFFF
}
.input_bg{
	width: auto;
	border: 1px solid #C8C8C8;
	background-image: url(styles/default/input_bg.gif);
    color: #6B6B6B;
}
.submit_bg {
	font-size: 11px;
	font-weight: bold;
	color: #fff;
	background: url(styles/default/signinbtn_bg.gif) #a4e1ae repeat-x 0px 0px;
	border: #1c5425 1px solid;
	height: 22px;
	line-height: 18px
}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
<tr><%
Server.ScriptTimeOut = 999
If (memName<>Empty And MemCanUP=1) Or (memStatus="8" Or memStatus="7") Then
	Dim UP_FileType,UP_FileSize
	If memStatus="8" Or memStatus="7" Then
		UP_FileType=Adm_UP_FileType
		UP_FileSize=Adm_UP_FileSize
	Else
		UP_FileType=Mem_UP_FileType
		UP_FileSize=Mem_UP_FileSize
	End If
	IF Request.QueryString("action")="upload" Then
		Call CheckPost
		Response.Write("<td>")
		Dim FSO,FSOIsOK
		FSOIsOK=1
		Err.Clear
		Set FSO=Server.CreateObject("Scripting.FileSystemObject")
		If Err<>0 Then
			Err.Clear
			FSOIsOK=0
		End If
		Dim D_Name,F_Name
		If FSOIsOK=1 Then
			D_Name="month"&DateToStr(Now(),"ym")
			If FSO.FolderExists(Server.MapPath("attachments/"&D_Name))=False Then
				FSO.CreateFolder Server.MapPath("attachments/"&D_Name)
			End If
		Else
			D_Name="All_Files"
		End If
		Set FSO=Nothing
		Dim FileUP
		Set FileUP=New Upload_File
		FileUP.GetDate(-1)
		Dim F_File,F_FileType,F_FileName
		Set F_File=FileUP.File("File")
		F_FileName = F_File.FileName
		F_FileType = Ucase(F_File.FileExt)
		IF F_File.FileSize > Int(UP_FileSize) Then
			Response.Write("<a href='javascript:history.go(-1);'>文件大小超出，请返回重新上传</a>")
		ElseIF IsvalidFileName(F_FileName) = False Then
			Response.Write("<a href='javascript:history.go(-1);'>文件名称非法，请返回重新上传</a>")
		ElseIF IsvalidFileExt(F_FileType) = False Then
			Response.Write("<a href='javascript:history.go(-1);'>文件格式非法，请返回重新上传</a>")
		Else
			If FSOIsOK=1 Then
				Dim FileIsExists
				Set FSO=Server.CreateObject("Scripting.FileSystemObject")
				FileIsExists=FSO.FileExists(Server.MapPath("attachments/"&D_Name&"/"&F_Name))
				Do
					F_Name=Generator(4)&"_"&F_FileName
				Loop Until FSO.FileExists(Server.MapPath("attachments/"&D_Name&"/"&F_Name)) = False
				Set FSO=Nothing
			Else
				F_Name=Generator(4)&"_"&Hour(Now())&Minute(Now())&Second(Now())&"_"&F_FileName
			End If
			F_File.SaveToFile Server.MapPath("attachments/"&D_Name&"/"&F_Name)
			Select Case F_FileType
			Case "GIF"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[img]attachments/"&D_Name&"/"&F_Name&"[/img]'</SCRIPT>")
			Case "JPG"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[img]attachments/"&D_Name&"/"&F_Name&"[/img]'</SCRIPT>")
			Case "JPEG"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[img]attachments/"&D_Name&"/"&F_Name&"[/img]'</SCRIPT>")
			Case "PNG"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[img]attachments/"&D_Name&"/"&F_Name&"[/img]'</SCRIPT>")
			Case "SWF"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[swf]attachments/"&D_Name&"/"&F_Name&"[/swf]'</SCRIPT>")
			Case "WMA"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[wma]attachments/"&D_Name&"/"&F_Name&"[/wma]'</SCRIPT>")
			Case "MP3"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[wma]attachments/"&D_Name&"/"&F_Name&"[/wma]'</SCRIPT>")
			Case "MIDI"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[mid]attachments/"&D_Name&"/"&F_Name&"[/mid]'</SCRIPT>")
			Case "AVI"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[wmv]attachments/"&D_Name&"/"&F_Name&"[/wmv]'</SCRIPT>")
			Case "WMV"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[wmv]attachments/"&D_Name&"/"&F_Name&"[/wmv]'</SCRIPT>")
			Case "RA"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[ra]attachments/"&D_Name&"/"&F_Name&"[/ra]'</SCRIPT>")
			Case "RM"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[rm]attachments/"&D_Name&"/"&F_Name&"[/rm]'</SCRIPT>")
			Case "RMVB"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[rm]attachments/"&D_Name&"/"&F_Name&"[/rm]'</SCRIPT>")
			Case "MOV"
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[qt]attachments/"&D_Name&"/"&F_Name&"[/qt]'</SCRIPT>")
			Case Else
				Response.Write("<SCRIPT>parent.inputform.message.value+='\n[down=attachments/"&D_Name&"/"&F_Name&"]点击下载此文件[/down]'</SCRIPT>")
			End Select
			Response.Write("<SCRIPT>parent.inputform.message.focus()</SCRIPT><a href='javascript:history.go(-1);'>文件上传成功，请返回继续上传</a><meta http-equiv='refresh' content='1;url=attachment.asp'>")
		End IF
		Set F_File=Nothing
		Set FileUP=Nothing
		Response.Write("</td>")
	Else
		Response.Write("<form enctype=""multipart/form-data"" method=""post"" action=""attachment.asp?action=upload""><td><input name=""File"" class=""input_bg"" type=""File"" size=""50"">&nbsp;<input type=""Submit"" class=""submit_bg"" name=""Submit"" value="" 确定上传 ""></td></form>")
	End IF
Else
	Response.Write("对不起，你没有权限上传附件！")
End  If

Function IsvalidFileName(File_Name)
	IsvalidFileName = False
	Dim re,reStr
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="[^_\.a-zA-Z\d]"
	reStr=re.Replace(File_Name,"")
	If File_Name = reStr Then IsvalidFileName=True
	Set re=Nothing
End Function

Function IsvalidFileExt(File_Type)
	Dim GName,UP_FileTypeArr
	UP_FileTypeArr=Split(UP_FileType,",")
	IsvalidFileExt = False
	For Each GName In UP_FileTypeArr
		If File_Type = GName Then
			IsvalidFileExt = True
			Exit For
		End If
	Next
End Function

%></tr></table>
</body>