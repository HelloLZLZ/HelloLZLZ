<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/tips.css"/>
    <link rel="stylesheet" href="<%=basePath%>js/mobile/jquery.mobile-1.4.5.min.css" />
	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
</head>

<body>
<div style="background-color:#E6E6E6" data-role="page" id="none">

	<div class="header">
		<h1 class="title_nobtn">提示</h1>
	</div>
    

    <div class="tips_content">
    	<p class="tips_content_font">取消申请失败</p>
    	<div class="tips_btn">
    		<a href="<%=basePath%>expert/project_expert.jsp" >
    			<p class="tips_btn_font">返回项目</p>
    		</a>
    	</div>
   	</div>
     
</div>
</body>
</html>
