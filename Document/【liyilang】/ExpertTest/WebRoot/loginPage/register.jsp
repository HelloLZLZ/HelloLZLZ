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
	<title>专家汇</title>
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/register.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/regist_identity.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
</head>
<body>
<div data-role="page" id="none">
	<div class="header">
		<h1 class="title_nobtn">注册</h1>
	</div>
    <div class="expert" id="expert">
    	<h2 class="identity">我是专家</h2>
    	<h5 class="identity_introduce">专家用户可以提交个人专业领域，寻找企业发布的短期项目</h5>
    </div>
    </a>    
    <div class="company" id="company">
    	<h2 class="identity">我是企业</h2>
        <h5 class="identity_introduce">企业用户可以发布短期项目，并搜索相关领域的专家为企业提供帮助</h5>
    </div>
    </a>
</div>
<script type="text/javascript">
    $("#expert").click(function(e) {
        window.location.href = "<%=basePath%>expert/register_expert.jsp";
    });
    $("#company").click(function(e) {
        window.location.href = "<%=basePath%>business/register_business.jsp";
    });
	</script>
</body>
</html>
