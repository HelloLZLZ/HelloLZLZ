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
	<title>专家用户注册</title>
	<link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<script type="text/javascript">
		$(document).on("click","a",ClickMe(event));
		var str = decodeURI(window.location.search);
		localStorage.setItem("location_register",str);
	</script>
	<noscript>您的浏览器不支持JavaScript,请使用其它浏览器</noscript>
	<script type="text/javascript" src="<%=basePath %>js/regist_validate.js"></script>
</head>

<body>
<div data-role="page" id="basicinfo_expert">
	<div class="header" data-role="none">   
    	<h1>测试</h1>
  	</div>
    
    <div data-role="content">
		<form method="post" action="<%=basePath%>expert/expert_queryBusinessExpert.action">
		 	
		 	
            <input type="submit" value="提交" />
        </form>
  </div>
	 
</body>
</html>
