<!--#include file="inc_syssite.asp"-->
<!--#include file="cls_main.asp"-->
<!--#include file="class_sys.asp"-->

<%
chk_sysadmin
dim admin_name
sub chk_sysadmin()
	dim admin_password,sql,rs	
	admin_name=eblog.filt_badstr(session("AdminName"))
	admin_password=eblog.filt_badstr(session("AdminPassword"))
	if admin_name="" then
		response.redirect "admin_login.asp"
		exit sub
	end if
	Set Rs=Conn.ExeCute("select id from blog_admin where username='" & admin_name & "' and password='"&admin_password&"'")
	if rs.bof and rs.eof then
		set rs=nothing
		response.redirect "admin_login.asp"
		exit sub
	end if
	rs.close
	set rs=nothing		
end sub
%>
<SCRIPT LANGUAGE="JavaScript">
function CheckSel(Voption,Value)
{
	var obj = document.getElementById(Voption);
	for (i=0;i<obj.length;i++){
		if (obj.options[i].value==Value){
		obj.options[i].selected=true;
		break;
		}
	}
}
function chang_size(num,objname)
{
	var obj=document.getElementById(objname)
	if (parseInt(obj.rows)+num>=3) {
		obj.rows = parseInt(obj.rows) + num;	
	}
	if (num>0)
	{
		obj.width="90%";
	}
}
</script>
<style type="text/css">
div.showpage{
	CLEAR: both;
	text-align: center;
	width: 100%;
}
</style>