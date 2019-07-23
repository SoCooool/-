<%
Dim oUpFileStream

Class Upload_File

	Dim Form,File,Err

	Private Sub Class_Initialize
		Err=-1
	End Sub

	Private Sub Class_Terminate 
		'Clear Variables & Objects
		If Err < 0 Then
			oUpFileStream.Close
			Form.RemoveAll
			File.RemoveAll
			Set Form=Nothing
			Set File=Nothing
			Set oUpFileStream =Nothing
		End If
	End Sub

	Public Sub GetDate(RetSize)
		'Define Variables
		Dim RequestBinDate,sStart,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
		Dim iFileSize,sFilePath,sFileType,sFormvalue,sFileName
		Dim iFindStart,iFindEnd
		Dim iFormStart,iFormEnd,sFormName

		If Request.TotalBytes < 1 Then
			Err=1
			Exit Sub
		End If
		If RetSize > 0 Then 
			If Request.TotalBytes > RetSize Then
				Err=2
				Exit Sub
			End If
		End If
		Set Form = Server.CreateObject("Scripting.Dictionary")
		Form.CompareMode = 1
		Set File = Server.CreateObject("Scripting.Dictionary")
		File.CompareMode = 1
		Set tStream = Server.CreateObject("Adodb.Stream")
		Set oUpFileStream = Server.CreateObject("Adodb.Stream")
		oUpFileStream.Type = 1
		oUpFileStream.Mode = 3
		oUpFileStream.Open 
		oUpFileStream.Write Request.BinaryRead(Request.TotalBytes)
		oUpFileStream.Position=0
		RequestBinDate = oUpFileStream.Read 
		iFormEnd = oUpFileStream.Size
		bCrLf = chrB(13) & chrB(10)
		'Get Seperators
		sStart = MidB(RequestBinDate,1, InStrB(1,RequestBinDate,bCrLf)-1)
		iStart = LenB (sStart)
		iFormStart = iStart+2
		'Split Items
		Do
			iInfoEnd = InStrB(iFormStart,RequestBinDate,bCrLf & bCrLf)+3
			tStream.Type = 1
			tStream.Mode = 3
			tStream.Open
			oUpFileStream.Position = iFormStart
			oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
			tStream.Position = 0
			tStream.Type = 2
			tStream.Charset = "UTF-8"
			sInfo = tStream.ReadText 
			'Get form item name
			iFormStart = InStrB(iInfoEnd,RequestBinDate,sStart)-1
			iFindStart = InStr(22,sInfo,"name=""",1)+6
			iFindEnd = InStr(iFindStart,sInfo,"""",1)
			sFormName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
			'If it's a file
			If InStr (45,sInfo,"filename=""",1) > 0 Then
				Set oFileInfo= new FileInfo
				'Get File attributes
				iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
				iFindEnd = InStr(iFindStart,sInfo,"""",1)
				sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
				oFileInfo.FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)
				oFileInfo.FilePath = Left (sFileName,InStrRev (sFileName, "\"))
				oFileInfo.FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)
				iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
				iFindEnd = InStr(iFindStart,sInfo,vbCr)
				oFileInfo.FileType = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
				oFileInfo.FileStart = iInfoEnd
				oFileInfo.FileSize = iFormStart -iInfoEnd -2
				oFileInfo.FormName = sFormName
				file.add sFormName,oFileInfo
			Else
				'If it's form item
				tStream.Close
				tStream.Type = 1
				tStream.Mode = 3
				tStream.Open
				oUpFileStream.Position = iInfoEnd 
				oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
				tStream.Position = 0
				tStream.Type = 2
				tStream.Charset = "UTF-8"
				sFormvalue = tStream.ReadText 
				If Form.Exists (sFormName) Then
					Form (sFormName) = Form (sFormName) & ", " & sFormValue
				Else
					Form.Add sFormName,sFormvalue
				End If
			End If
			tStream.Close
			iFormStart = iFormStart+iStart+2
			'Exit at end of file
		Loop Until (iFormStart+2) = iFormEnd 
		RequestBinDate=""
		Set tStream = Nothing
	End Sub

End Class

	'Get File Info
Class FileInfo
	Dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt

	Private Sub Class_Initialize 
		FileName = ""
		FilePath = ""
		FileSize = 0
		FileStart= 0
		FormName = ""
		FileType = ""
		FileExt = ""
	End Sub

	'Save File Method
	Public Function SaveToFile(FullPath)
		Dim oFileStream,ErrorChar,i
		On Error Resume Next
		Set oFileStream=CreateObject("Adodb.Stream")
		oFileStream.Type=1
		oFileStream.Mode=3
		oFileStream.Open
		oUpFileStream.position=FileStart
		oUpFileStream.copyto oFileStream,FileSize
		oFileStream.SaveToFile FullPath,2
		oFileStream.Close
		Set oFileStream=Nothing
	End Function

	'Get File Content
	Public Function GetDate
		oUpFileStream.Position =FileStart
		GetDate=oUpFileStream.Read(FileSize)
	End Function
End Class
%>