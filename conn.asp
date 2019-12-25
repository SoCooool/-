<%@ LANGUAGE = VBScript CodePage = 65001%>

<%Option Explicit
Response.Buffer = True
Server.ScriptTimeOut = 90

Session.CodePage=65001

If Trim(Request.QueryString("CP"))="GBK" Then Session.CodePage = 936

'On Error Resume Next
Dim StartTime,SQLQueryNums
StartTime=Timer()
SQLQueryNums=0

Const cookieName="eblog2" 'cookies名
Const cache_name_user="eblog" '系统缓存名前缀
Const db="vcdsvhgfhgfj\fhhjgjhkhj.asp" '主数据库地址
Const is_sqldata=0

Dim SQL,TempVar,siteTitle '定义常用变量

'定义数据库连接
Dim Conn
Set Conn= Server.CreateObject("ADODB.Connection")
Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
Conn.Open
If Err Then
    err.Clear
    Set Conn = Nothing
    Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" />数据库连接出错，请检查连接字串。")
    Response.End
End If
%>