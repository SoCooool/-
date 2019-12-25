<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%
'eblog最新相册调用
dim url,lockurl
'############以下为修改项######################
url=""&eblog.setup(2,0)&"/" '请填写你网站的正确地址,要以"HTTP://"开头
lockurl=""&eblog.setup(2,0)&"/,http://www.fir8.net/mini/,http://localhost/blog/" '只允许调用网址,要以"HTTP://"开头,为空则不开放此功能.(可允许多网址限制，要以","分隔。)
'############以上为修改项######################
if trim(lockurl)<>"" and checkserver(lockurl)=false then
	response.write "document.write ('Error!!!');"
	response.end	
end if

dim tlen,n
'############以上为显示多少条数##################
if trim(request("n"))<>"" and IsNumeric(request("n")) then
	n=cint(request("n"))
else
	n=10
end if

'############以下为查询数据##################
Dim newphoto
Set newphoto=Server.CreateObject("Adodb.Recordset")
SQL="SELECT Top "&n&" * FROM photo ORDER BY ph_PostTime desc"
newphoto.Open SQL,CONN,1,1
SQLQueryNums=SQLQueryNums+1
if newphoto.EOF AND newphoto.BOF Then
	response.write "document.write('None!!!');"
else
	dim topic
	Do Until newphoto.EOF OR newphoto.BOF
		Topic=Stringhtml(topic)
		
		'打开连接模式
		dim openmode,openm
		openmode=trim(request("openmode"))
		if openmode=1 and isnumeric(openmode) then
			openm= " target=_blank"
		elseIf openmode<>1 then
			openm= " "
		end if

		'############以下为显示数据##################
		topic=newphoto("ph_Name")
		response.write "document.write('<a href="&url&"photoshow.asp?photoID="&newphoto("ph_ID")&""&openm&">');"
		if trim(request("tlen"))=empty then '判别tlen是否为空
			if len(topic)>Cint(18) then
				topic=left(topic,18)&"..."
			end if
			response.write "document.write('"&Stringhtml(topic)&"');"
		else
			'############以下为标题长度##################
			if len(topic)>Cint(request("tlen")) then
				topic=left(topic,request("tlen"))&"..."
			end if
			'############以上为标题长度##################
			Topic=Stringhtml(topic)
			response.write "document.write('"&Topic&"');"
		end if
		response.write "document.write('</a>');"
		response.write "document.write('<br>');"
		newphoto.MoveNext
	loop
end if
newphoto.Close
Set newphoto=Nothing


'############以下判断是否为站地址##################
Private function checkserver(str)
	dim i,servername
	checkserver=false
	if str="" then exit function
	str=split(Cstr(str),",")
	servername=Request.ServerVariables("HTTP_REFERER")
	for i=0 to Ubound(str)
	if right(str(i),1)="/" then str(i)=left(trim(str(i)),len(str(i))-1)
		if Lcase(left(servername,len(str(i))))=Lcase(str(i)) then
			checkserver=true
			exit for
		else
			checkserver=false
		end if
	next
end function

'############以下标题html转换##################
Function Stringhtml(str)
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	're.Pattern="<(.*)>"
	'str=re.replace(str, "")
	're.Pattern="\[(.*)\]"
	'str=re.replace(str, "")
	str = Replace(str, CHR(34), """")
	str = Replace(str, CHR(39), "\'")
	str = Replace(str, CHR(13), "")
	str = Replace(str, CHR(10), "")
	str = replace(str, ">", "&gt;")
	str = replace(str, "<", "&lt;")
	if str="" then str="..."
	Stringhtml=str
End Function
%>