<!--#include file="inc/cls_Main.asp" -->
<!--#include file="inc/library.asp" -->
<!--#include file="inc/class_sys.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="supper@lwcn.cn,supper" />
<meta name="keywords" content="<%=""&eblog.setup(6,0)&""%>" />
<meta name="Description" content="evan life" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="Bookmark" href="favicon.ico" /> 
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<title><%=siteTitle&" "&eblog.setup(1,0)&""%></title>
<noscript><iframe src=*></iframe></noscript>
<link rel="alternate" type="application/rss+xml" href="<%=""&eblog.setup(2,0)&""%>/blogfeed.asp" title="evan life" />
<link href="styles/default.css" rev="stylesheet" rel="stylesheet" type="text/css" media="all" />
<script language="JavaScript" src="inc/common.js" type="text/javascript"></script>
</head>
<body>
<div id="header">
	<div id="header_logo"></div>
	<div id="nav">
		<div id="nav_right"><%MemberCenter%></div>
		<div id="nav_left">
			<li id="home"><a href="default.asp">首页</a>
			<li><a href="blog.asp?cateID=8">休闲</a></li>
			<li><a href="blog.asp?cateID=4">音乐</a></li>
			<li><a href="photo.asp" class="active">图片</a></li>
			<li><a href="download.asp" class="active">下载</a></li>
			<li><a href="coolsite.asp" class="active">酷站</a></li>
			<li><a href="guestbook.asp" class="active">留言</a></li>
		</div>
	</div>
	<div style="display:none;" onmouseover="showIntro('show_cate');" onmouseout="showIntro('show_cate');" id="show_cate" class="cate_show"><%Call CategoryList(1)%></div>
</div>