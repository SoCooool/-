<%Function UBBCode(strContent,DisSM,DisUBB,DisIMG,AutoURL,AutoKEY)
	If isEmpty(strContent) Or isNull(strContent) Then
        Exit Function
	ElseIF DisUBB=1 Then
		strContent=Replace(strContent,"[#seperator#]","")
		UBBCode=strContent
		Exit Function
	Else
		strContent=Replace(strContent,"[#seperator#]","")
		Dim re, strMatches,strMatches2, strMatch,strMatch2, tmpStr1, tmpStr2, tmpStr3, tmpStr4, RNDStr
		Set re=new RegExp
		re.IgnoreCase =True
		re.Global=True

		IF AutoURL=1 Then
			re.Pattern="([^=\]][\s]*?|^)(https?|ftp|gopher|news|telnet|mms|rtsp|ed2k)://([a-z0-9/\-_+=.~!%@?#%&;:$\\()|]+)"
			StrContent=re.Replace(StrContent,"$1[url]$2://$3[/url]")
		End IF

		IF Not DisIMG=1 Then
			re.Pattern="\[img\](.*?)\[\/img\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch In strMatches
				tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
				strContent=Replace(strContent,strMatch.Value,"<img src="""&tmpStr1&""" border=""0"" onload=""javascript:DrawImage(this);"" alt=""按此在新窗口打开图片"" onmouseover=""this.style.cursor='hand';"" onclick=""window.open(this.src);"" />")
			Next
			Set strMatches=Nothing

			re.Pattern="\[image\](.*?)\[\/image\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch In strMatches
				tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
				strContent=Replace(strContent,strMatch.Value,"<img src="""&tmpStr1&""" border=""0"" />")
			Next
			Set strMatches=Nothing

			re.Pattern="\[img=(left|right|center|absmiddle)\](.*?)\[\/img\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch In strMatches
				tmpStr1=strMatch.SubMatches(0)
				tmpStr2=CheckLinkStr(strMatch.SubMatches(1))
				strContent=Replace(strContent,strMatch.Value,"<img src="""&tmpStr2&""" align="""&tmpStr1&"""  onload=""javascript:DrawImage(this);""  border=""0"" alt=""按此在新窗口打开图片"" onmouseover=""this.style.cursor='hand';"" onclick=""window.open(this.src);"" />")
			Next
			Set strMatches=Nothing

			re.Pattern="\[images\](.*?)\[\/images\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch In strMatches
				tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
				strContent=Replace(strContent,strMatch.Value,"<table border=""0"" cellpadding=""0"" cellspacing=""0""><tr><td class=""Ubb_image""><img src="""&tmpStr1&""" border=""0"" onload=""javascript:DrawImage(this);""  alt=""按此在新窗口打开图片"" onmouseover=""this.style.cursor='hand';"" onclick=""window.open(this.src);"" /></td></tr></table>")
			Next
			Set strMatches=Nothing

			re.Pattern="\[mp3\](.*?)\[\/mp3\]"
			strContent= re.Replace(strContent,"<object classid=""CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"" id=""MediaPlayer""><param name=""uiMode"" value=""mini""><param name=""ShowStatusBar"" value=""-1""><param name=""AutoStart"" value=""ture""><param name=""Filename"" value=""$1""><param name=""enableContextMenu"" value=""false""></object>")

			strContent=replace(strContent,"[swf]","[swf=520,400]")
			strContent=replace(strContent,"[wmv]","[wmv=520,400]")
			strContent=replace(strContent,"[wma]","[wma=300,50]")
			'strContent=replace(strContent,"[mp3]","[mp3=300,50]")
			strContent=replace(strContent,"[mid]","[mid=300,50]")
			strContent=replace(strContent,"[rm]","[rm=520,400]")
			strContent=replace(strContent,"[ra]","[ra=450,60]")
			strContent=replace(strContent,"[qt]","[qt=450,60]")
			're.Pattern="\[(swf|wmv|wma|mp3|mid|rm|ra|qt)=(\d*?|),(\d*?|)\](.*?)\[\/(swf|wmv|wma|mp3|mid|rm|ra|qt)\]"
			re.Pattern="\[(swf|wmv|wma|mid|rm|ra|qt)=(\d*?|),(\d*?|)\](.*?)\[\/(swf|wmv|wma|mid|rm|ra|qt)\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch in strMatches
				RNDStr=Int(7999 * Rnd + 2000)
				tmpStr1=CheckLinkStr(strMatch.SubMatches(3))
				strContent= Replace(strContent,strMatch.Value,"<div class='media'><input id=""VOBJ_"&RNDStr&""" type=""hidden"" value=""-1"" /><a href=""javascript:UBBShowObj('"&strMatch.SubMatches(0)&"','OBJ_"&RNDStr&"','"&strMatch.SubMatches(3)&"','"&strMatch.SubMatches(1)&"','"&strMatch.SubMatches(2)&"');""><img src=""images/icon_media.gif"" alt=""显示影视文件"" align=""absmiddle"" border=""0"" /> 点击显示/隐藏影视文件</a> <div id=""OBJ_"&RNDStr&""">影音源文件地址：<a href="""&strMatch.SubMatches(3)&""" target=""_blank"">"&strMatch.SubMatches(3)&"</a></div></div>")
			Next
			Set strMatches=Nothing
		End IF

		re.Pattern = "\[url=(.[^\]]*)\](.*?)\[\/url]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			tmpStr1=CheckLinkStr(Trim(strMatch.SubMatches(0)))
			tmpStr2=strMatch.SubMatches(1)
			strContent=Replace(strContent,strMatch.Value,"<a target=""_blank"" href="""&tmpStr1&""" rel=""nofollow"">"&tmpStr2&"</a>")
		Next
		Set strMatches=Nothing

		re.Pattern = "\[url](.*?)\[\/url]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			tmpStr1=CheckLinkStr(Trim(strMatch.SubMatches(0)))
			If InStr(tmpStr1,"&nbsp;")>0 Then
				tmpStr1=Replace(tmpStr1,"&nbsp;","")
				tmpStr3="&nbsp;"
			End If
			tmpStr2=CutURL(tmpStr1)
			strContent=Replace(strContent,strMatch.Value,"<a target=""_blank"" href="""&tmpStr1&""" rel=""nofollow"">"&tmpStr2&"</a>")
		Next
		Set strMatches=Nothing

		re.Pattern = "\[email=(.[^\]]*)\](.*?)\[\/email]"
		strContent = re.Replace(strContent,"<a href=""mailto:$1"">$2</a>")
		re.Pattern = "\[email](.*?)\[\/email]"
		strContent = re.Replace(strContent,"<a href=""mailto:$1"">$1</a>")

		strContent = Replace(strContent,"[musicbar]","<a target=""new"" href=""musicbar.htm""><img src=""images/musicbar.gif"" alt=""MusicBar"" border=""0""></a>")

		strContent = Replace(strContent,"[efont]","<span class=first>")
		strContent = Replace(strContent,"[/efont]","</span>")
		strContent = Replace(strContent,"[list]","<ul>")
		strContent = Replace(strContent,"[list=1]","<ol type=""1"">")
		strContent = Replace(strContent,"[list=a]","<ol type=""a"">")
		strContent = Replace(strContent,"[list=A]","<ol type=""A"">")
		strContent = Replace(strContent,"[*]","<li>")
		strContent = Replace(strContent,"[/list]","</ul></ol>")
		re.Pattern="\[rainbow\](.*?)\[\/rainbow]"
		strContent=re.Replace(strContent,"<span class=rainbow>$1</span>")	
		re.Pattern="\[fly\](.*?)\[\/fly]"
		strContent=re.Replace(strContent,"<marquee width=""95%"" behavior=""alternate"" scrollamount=""3"">$1</marquee>")	
		re.Pattern="\[font=([^<>\]]*?)\](.*?)\[\/font]"
		strContent=re.Replace(strContent,"<font face=""$1"">$2</font>")
		re.Pattern="\[color=([^<>\]]*?)\](.*?)\[\/color]"
		strContent=re.Replace(strContent,"<font color=""$1"">$2</font>")
		re.Pattern="\[align=([^<>\]]*?)\](.*?)\[\/align]"
		strContent=re.Replace(strContent,"<div align=""$1"">$2</div>")
		re.Pattern="\[size=(\d*?)\](.*?)\[\/size]"
		strContent=re.Replace(strContent,"<font size=""$1"">$2</font>")
		re.Pattern="\[b\](.*?)\[\/b]"
		strContent=re.Replace(strContent,"<strong>$1</strong>")	
		re.Pattern="\[i\](.*?)\[\/i]"
		strContent=re.Replace(strContent,"<em>$1</em>")	
		re.Pattern="\[u\](.*?)\[\/u]"
		strContent=re.Replace(strContent,"<u>$1</u>")
		re.Pattern="\[s\](.*?)\[\/s\]"
		strContent=re.Replace(strContent,"<del>$1</del>")

		re.Pattern = "\[iframe=(.[^\]]*)\,(.[^\]]*)\](.*?)\[\/iframe]"
		If memStatus="7" OR memStatus="8" Then
			strContent = re.Replace(strContent,"<iframe border=""0"" frameBorder=""0"" frameSpacing=""0"" height=""$2"" marginHeight=""0"" marginWidth=""0"" noResize scrolling=""no"" width=""$1"" vspale=""0"" src=""$3""></iframe>")
		Else
			strContent = re.Replace(strContent,"<font color=#FF0000>请不要乱提交参数!</font>")
		End If
	
		re.Pattern = "\[down=(.[^\]]*)\](.*?)\[\/down]"
		strContent = re.Replace(strContent,"<img src=""images/download.gif"" align=""absmiddle"" /> <a href=""$1"" target=""_blank"">$2</a>")
		re.Pattern = "\[download=(.[^\]]*)\](.*?)\[\/download]"
		If memStatus="7" OR memStatus="8" OR memStatus="6" Then
			strContent = re.Replace(strContent,"<img src=""images/download.gif"" align=""absmiddle"" /> <a href=""$1"" target=""_blank"">$2</a>")
		Else
			strContent = re.Replace(strContent,"<img src=""images/download.gif"" align=""absmiddle"" /> $2 <a href=""register.asp""><font color=#FF0000>注册成员</font></a><font color=#FF0000>才可以下载!</font>")
		End if

		re.Pattern="\[text\](<br>)+"
		strContent=re.Replace(strContent,"[text]")
		re.Pattern="\[text\](.*?)\[\/text\]"
		strContent= re.Replace(strContent,"<div class=""text_main"">$1</div>")

		re.Pattern="\[quote\](<br>)+"
		strContent=re.Replace(strContent,"[quote]")
		re.Pattern="\[quote\](.*?)\[\/quote\]"
		strContent= re.Replace(strContent,"<fieldset class=""fieldset""><legend class=""legend"">&nbsp;Quote：</legend><div class=""code_main"">$1</div></fieldset>")

		re.Pattern="\[code\](<br>)+"
		strContent=re.Replace(strContent,"[code]")
		re.Pattern="\[code\](.*?)\[\/code\]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			RNDStr=Int(7999 * Rnd + 2000)
			tmpStr1=strMatch.SubMatches(0)
			strContent= Replace(strContent,strMatch.Value,"<script type='text/javascript'>window.attachEvent('onload',function (){AutoSizeDIV('CODE_"&RNDStr&"')})</script><fieldset class=""fieldset""><legend class=""legend"">&nbsp;Code：</legend><div class=""code_main"" id='CODE_"&RNDStr&"' style='overflow-y:auto;overflow-x:hidden;height:120px;'>"&tmpStr1&"</div></fieldset><div><input type=""button"" name=""CodeCopy"" onclick='javascript:CopyText(document.all.CODE_"&RNDStr&");' value="" Copy ""></div>")
		Next
		Set strMatches=Nothing

		'05/03/03加上[html]标签
		re.Pattern="\[html\](<br>)+"
		strContent=re.Replace(strContent,"[html]")
		re.Pattern="\[html\](.*?)\[\/html\]"
            Set strMatches=re.Execute(strContent)
            For Each strMatch in strMatches
                RNDStr=Int(1999 * Rnd + 1000)
                tmpStr1=strMatch.SubMatches(0)		
                strContent= Replace(strContent,strMatch.Value,"<script type='text/javascript'>window.attachEvent('onload',function (){AutoSizeDIV('CODE_"&RNDStr&"')})</script><fieldset class=""fieldset""><legend class=""legend"">&nbsp;Html：</legend><div class=""code_main"" id='CODE_"&RNDStr&"' style='overflow-y:auto;overflow-x:hidden;height:120px;'>"&tmpStr1&"</div></fieldset><div><input type=""button"" name=""CodeCopy"" onclick='javascript:CopyText(document.all.CODE_"&RNDStr&");' value="" Copy ""> <input type=""button"" name=""RunCode"" onclick='javascript:runCode(document.all.CODE_"&RNDStr&");' value="" RunCode ""></div>")
            Next
            Set strMatches=Nothing

		IF Not DisSM=1 Then
			Dim log_SmiliesListNums,log_SmiliesListNumI
			log_SmiliesListNums=Ubound(Arr_Smilies,2)
			For log_SmiliesListNumI=0 To log_SmiliesListNums
				strContent=Replace(strContent,Arr_Smilies(2,log_SmiliesListNumI)," <img src=""images/smilies/"&Arr_Smilies(1,log_SmiliesListNumI)&""" border=""0"" align=""absmiddle"" />")
			Next
		End IF

		IF AutoKEY=1 Then
			Dim log_KeywordsListNums,log_KeywordsListNumI
			log_KeywordsListNums=Ubound(Arr_Keywords,2)
			For log_KeywordsListNumI=0 To log_KeywordsListNums
				IF Arr_Keywords(3,log_KeywordsListNumI)<>Empty Then
					strContent=Replace(strContent,Arr_Keywords(1,log_KeywordsListNumI),"<a href="""&Arr_Keywords(2,log_KeywordsListNumI)&""" target=""_blank""><img src=""images/keywords/"&Arr_Keywords(3,log_KeywordsListNumI)&""" border=""0"" align=""absmiddle""> "&Arr_Keywords(1,log_KeywordsListNumI)&"</a>")
				Else
					strContent=Replace(strContent,Arr_Keywords(1,log_KeywordsListNumI),"<a href="""&Arr_Keywords(2,log_KeywordsListNumI)&""" target=""_blank"">"&Arr_Keywords(1,log_KeywordsListNumI)&"</a>")
				End IF
			Next
		End IF

		Set re=Nothing

		UBBCode=strContent

	End IF
End Function

Function CheckLinkStr(Str)
	Str = Replace(Str, "document.cookie", ".")
	Str = Replace(Str, "document.write", ".")
	Str = Replace(Str, "javascript:", "javascript ")
	Str = Replace(Str, "vbscript:", "vbscript ")
	Str = Replace(Str, "javascript :", "javascript ")
	Str = Replace(Str, "vbscript :", "vbscript ")
	Str = Replace(Str, "[", "&#91;")
	Str = Replace(Str, "]", "&#93;")
	Str = Replace(Str, "<", "&#60;")
	Str = Replace(Str, ">", "&#62;")
	Str = Replace(Str, "{", "&#123;")
	Str = Replace(Str, "}", "&#125;")
	Str = Replace(Str, "|", "&#124;")
	Str = Replace(Str, "script", "&#115;cript")
	Str = Replace(Str, "SCRIPT", "&#083;CRIPT")
	Str = Replace(Str, "Script", "&#083;cript")
	Str = Replace(Str, "script", "&#083;cript")
	Str = Replace(Str, "object", "&#111;bject")
	Str = Replace(Str, "OBJECT", "&#079;BJECT")
	Str = Replace(Str, "Object", "&#079;bject")
	Str = Replace(Str, "object", "&#079;bject")
	Str = Replace(Str, "applet", "&#097;pplet")
	Str = Replace(Str, "APPLET", "&#065;PPLET")
	Str = Replace(Str, "Applet", "&#065;pplet")
	Str = Replace(Str, "applet", "&#065;pplet")
	Str = Replace(Str, "embed", "&#101;mbed")
	Str = Replace(Str, "EMBED", "&#069;MBED")
	Str = Replace(Str, "Embed", "&#069;mbed")
	Str = Replace(Str, "embed", "&#069;mbed")
	Str = Replace(Str, "document", "&#100;ocument")
	Str = Replace(Str, "DOCUMENT", "&#068;OCUMENT")
	Str = Replace(Str, "Document", "&#068;ocument")
	Str = Replace(Str, "document", "&#068;ocument")
	Str = Replace(Str, "cookie", "&#099;ookie")
	Str = Replace(Str, "COOKIE", "&#067;OOKIE")
	Str = Replace(Str, "Cookie", "&#067;ookie")
	Str = Replace(Str, "cookie", "&#067;ookie")
	Str = Replace(Str, "event", "&#101;vent")
	Str = Replace(Str, "EVENT", "&#069;VENT")
	Str = Replace(Str, "Event", "&#069;vent")
	Str = Replace(Str, "event", "&#069;vent")
	Str = Replace(Str, "on", "&#111;n")
	Str = Replace(Str, "ON", "&#079;N")
	Str = Replace(Str, "On", "&#079;n")
	Str = Replace(Str, "on", "&#111;n")
	CheckLinkStr = Str
End Function

Function CutURL(URLStr)
	Dim URLLen
	URLLen=Len(URLStr)
	If URLLen>65 Then
		CutURL=Left(URLStr,URLLen*0.5)&" ... "&Right(URLStr,URLLen*0.3)
	Else
		CutURL=URLStr
	End If
End Function
%>