<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
//从servlet获取项目数据
	ArrayList list = (ArrayList)request.getAttribute("xxx");
%>	
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
    <link rel="stylesheet" href="business_expert.css" />
    <link rel="stylesheet" href="theme.css"/>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    <style type="text/css">
	.project-item {
		border-bottom: 1px solid #4682B4; min-height: 80px;
    	background-color: #F5F5F5;   
    	position: relative;
	}
	
	.project-name {
		text-align:center;
		padding:10px;
		font-size:20px;
		font-weight:bolder;
		color:#09C;
	}
	
	.project-job {
		text-align:center;
		color:#999		
	}
	</style>
	
</head>

<body>
<div data-role="page" id="page">

  <div class="header" data-role="none">       	
    <h1>个人中心</h1>
  </div>
  <div data-role="content">
  
  	<div class="project-item" data-id="???">  
        <div class="project-body">
        	<div class="project-name">海南医学院附属医院</div>
            <div class="project-job">副主任医师/妇产科</div>
            <div class="clear-div"></div>
		</div>
	</div>
    
	<div class="buttonbox">
	  <a class="changepassword" href="#" data-role="button">修改密码</a>
	  <a class="profile" href="#" data-role="button">个人资料</a>
    </div>
        
  </div>
  
  	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="home.html" rel="external" data-icon="home" >首页</a></li>
        		<li><a href="project.html" rel="external" data-icon="arrow-r">项目</a></li>
        		<li><a href="center_expert.html" rel="external" data-icon="star" class="ui-btn-active">个人</a></li>
      		</ul>
    	</div>
  	</div>
</div>
<script type="text/javascript">
	$(".profile").click(function(e) {
        var project_id = $(this).attr("data-id");
		window.location.href = "xxxservlet?project="+project_id;
    });
</script>
</body>

</html>