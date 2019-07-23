<div id="footer">
	<div id="footer_text">
		<p>Copyright &copy; 2006-2008 (<a href="http://ntzhoubin.com" target="new" style="font-size:11px;color: #333;font-weight:bold;">ntzhoubin.com</a>). <bgsound src=up/gohome.wma loop="-1"><a href="recache.asp" target="new">All</a> Rights Reserved&nbsp;&nbsp;&nbsp;</p>
		<p><a href="http://www.miibeian.gov.cn">苏ICP备06046095号</a>Processed in <%=FormatNumber(Timer()-StartTime,6,-1)%> second(s) <%=SQLQueryNums%> queries</p>
	</div>
</div>
	</body>
</html>
<%IF TypeName(Conn)<>"Nothing" Then
	Conn.Close
	Set Conn=Nothing
End IF
set eblog=nothing
%>