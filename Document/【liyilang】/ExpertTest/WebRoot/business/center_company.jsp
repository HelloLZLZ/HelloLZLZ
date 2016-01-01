<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
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
	<link rel="stylesheet" href="<%=basePath%>css/profile.css" />
    <link rel="stylesheet" href="<%=basePath%>css/company.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/center.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    <style type="text/css">
    .project-item{
		border-bottom:none;}
    </style>
</head>

<body>
<div data-role="page" style="background-color:#E6E6E6" id="page">

	<div data-role="none" class="header">
		<h1 class="title_nobtn">个人中心</h1>
	</div>

  	<div data-role="none" class="center_body">
  
  	<div class="project-item" data-id="???">  
        <div class="project-body">
        	<div class="project-name">${business.bname}</div>
            <div class="project-job">${business.btel}</div>
            <div class="clear-div"></div>
		</div>
	</div>
 	<div class="btn_blue">
    	<a href="<%=basePath%>business/business_modifyPwd.jsp" >
    		<p class="btn_word">修改密码</p>
    	</a>
    </div>
        
    <div class="btn_blue">
    	<a href="<%=basePath%>business/business_enterProfile.action" >
    		<p class="btn_word">编辑资料</p>
    	</a>
    </div>
        
    <div class="none_line"></div>

  	<div class="footer" data-role="none">
    	<div class="footer_home">首页</div>
        <div class="footer_center" style="background:#09C">
        <p class="footer_font">个人</p>
        </div>
        <div class="footer_project">项目</div>
  	</div>
    </div>
    
    <script type="text/javascript">

    $(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>business/company_home.jsp";
    });
	
	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>business/business_initProfile.action";
    });

	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>project/project_searchBprojects.action";
    });
	</script>
</div>
</body>

</html>