<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%
'eblog����������
dim url,lockurl
'############����Ϊ�޸���######################
url=""&eblog.setup(2,0)&"/" '����д����վ����ȷ��ַ,Ҫ��"HTTP://"��ͷ
lockurl=""&eblog.setup(2,0)&"/,http://www.fir8.net/mini/,http://localhost/blog/" 'ֻ���������ַ,Ҫ��"HTTP://"��ͷ,Ϊ���򲻿��Ŵ˹���.(���������ַ���ƣ�Ҫ��","�ָ���)
'############����Ϊ�޸���######################
if trim(lockurl)<>"" and checkserver(lockurl)=false then
	response.write "document.write ('Error!!!');"
	response.end	
end if

dim tlen,n
'############����Ϊ��ʾ��������##################
if trim(request("n"))<>"" and IsNumeric(request("n")) then
	n=cint(request("n"))
else
	n=10
end if

'############����Ϊ��ѯ����##################
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
		
		'������ģʽ
		dim openmode,openm
		openmode=trim(request("openmode"))
		if openmode=1 and isnumeric(openmode) then
			openm= " target=_blank"
		elseIf openmode<>1 then
			openm= " "
		end if

		'############����Ϊ��ʾ����##################
		topic=newphoto("ph_Name")
		response.write "document.write('<a href="&url&"photoshow.asp?photoID="&newphoto("ph_ID")&""&openm&">');"
		if trim(request("tlen"))=empty then '�б�tlen�Ƿ�Ϊ��
			if len(topic)>Cint(18) then
				topic=left(topic,18)&"..."
			end if
			response.write "document.write('"&Stringhtml(topic)&"');"
		else
			'############����Ϊ���ⳤ��##################
			if len(topic)>Cint(request("tlen")) then
				topic=left(topic,request("tlen"))&"..."
			end if
			'############����Ϊ���ⳤ��##################
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


'############�����ж��Ƿ�Ϊվ��ַ##################
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

'############���±���htmlת��##################
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