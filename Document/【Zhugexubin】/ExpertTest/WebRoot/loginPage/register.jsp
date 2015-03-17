<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>无标题文档</title>
   <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
</head>
<body>
<div data-role="page" id="home">
   		<div class="header" data-role="none">
			<h1>用户认证</h1>
    	</div>
    	<div data-role="content">	

	      <p><a href="<%=basePath%>expert/register_expert.jsp" rel="external" data-role="button" >我是专家</a></p>
	      <p><a href="<%=basePath%>business/register_business.jsp" rel="external" data-role="button">我是企业</a></p>
    	</div>
    	<div data-role="footer">

    	</div>
	</div>
</body>
</html>
