<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%
'eblog������־����
dim url,lockurl,picurl
'############����Ϊ�޸���######################
url=""&eblog.setup(2,0)&"/" '����д����վ����ȷ��ַ,Ҫ��"HTTP://"��ͷ
lockurl=""&eblog.setup(2,0)&"/" 'ֻ���������ַ,Ҫ��"HTTP://"��ͷ,Ϊ���򲻿��Ŵ˹���.(���������ַ���ƣ�Ҫ��","�ָ���)
picurl=""&eblog.setup(2,0)&"/images/weather/" '����ͼ��Ŀ¼��ַ
'############����Ϊ�޸���######################
if trim(lockurl)<>"" and checkserver(lockurl)=false then
	response.write "document.write ('Error!!!');"
	response.end	
end if

dim orders,tlen,n,cateid,cate
'############����Ϊ���򷽷��ж�######################
select case trim(request("orders"))
case 1
	orders="log_IsTop asc,log_PostTime desc"
case 2
	orders="log_PostTime desc"
case 3
	orders="log_ViewNums desc"
case 4
	orders="log_CommNums desc"
case else
	response.write "document.write ('Error! (orders)');"
	response.end
end select

'############����Ϊ��ʾ��������##################
if trim(request("n"))<>"" and IsNumeric(request("n")) then
	n=cint(request("n"))
else
	n=10
end if

'############����Ϊ�����ж�##################
cateid=trim(request("cateid"))
if cateid<>"all" and isnumeric(cateid) then
	if cateid=444 then
		response.write "document.write ('Error!');"
		response.end
	else
		cate="and log_CateID="&cint(cateid)&""
	end if
end if

'############����Ϊ��ѯ����##################
Dim newtopic
Set newtopic=Server.CreateObject("Adodb.Recordset")
SQL="SELECT Top "&n&" * FROM (SELECT * FROM blog_Content WHERE log_IsShow=True "&cate&" ORDER BY "&orders&")"
newtopic.Open SQL,CONN,1,1
SQLQueryNums=SQLQueryNums+1
if newtopic.EOF AND newtopic.BOF Then
	response.write "document.write('None!!!');"
else
	dim log_Intro,nums,close_nums
	nums =0
	Do Until newtopic.EOF OR newtopic.BOF
		Dim log_Weather
		log_Weather=Split(newtopic("log_Weather"),"|")
		
		Topic=Stringhtml(topic)
		log_Intro=DelUbb(DelQuote(HTMLEncode(newtopic("log_Content"))))
		'############����Ϊ�����������############
		close_nums=trim(request("nums"))
		if close_nums=1 then
			nums=nums+1
			response.write "document.write('"&nums&". ');"
		elseIf close_nums>1 then
			response.write "document.write ('Error! (nums)');"
			response.end
		end if
		'############����Ϊ��������ͼƬ############
		dim weather
		weather=trim(request("weather"))
		if weather=1 and isnumeric(weather) then
			response.write "document.write('<img src="&picurl&""&log_Weather(0)&".gif align=absmiddle alt="&log_Weather(1)&"> ');"
		elseIf weather>1 then
			response.write "document.write ('Error! (weather)');"
			response.end
		end if
		
		'������ģʽ
		dim openmode,openm
		openmode=trim(request("openmode"))
		if openmode=1 and isnumeric(openmode) then
			openm= " target=_blank"
		elseIf openmode<>1 then
			openm= " "
		end if

		'��ʾʱ��
		dim time,psottime
		time=trim(request("time"))
		if time=1 and isnumeric(time) then
			psottime= " [ "&DateToStr(newtopic("log_posttime"),"m-d")&" ]"
		elseIf openmode<>1 then
			psottime= ""
		end if

		'############����Ϊ��ʾ����##################
		response.write "document.write('<li><a href="&url&"blogview.asp?logID="&newtopic("log_ID")&""&openm&">');"
		if trim(request("tlen"))=empty then '�б�tlen�Ƿ�Ϊ��
			response.write "document.write('"&Stringhtml(newtopic("log_Title"))&"');"
		else
			dim topic
			topic=newtopic("log_Title")
			'############����Ϊ���ⳤ��##################
			if len(topic)>Cint(request("tlen")) then
				topic=left(topic,request("tlen"))&"..."
			end if
			'############����Ϊ���ⳤ��##################
			Topic=Stringhtml(topic)
			response.write "document.write('"&Topic&"');"
		end if
		response.write "document.write('</a>');"
		response.write "document.write('"&psottime&"');"
		response.write "document.write('</li>');"
		newtopic.MoveNext
	loop
end if
newtopic.Close
Set newtopic=Nothing
set eblog=nothing

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