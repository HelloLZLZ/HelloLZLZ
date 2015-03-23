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
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/business_expert.css"/>
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">
    <div>
    	<div class="project_company_title">
        	<h1>项目</h1>
        </div>
        <div class="project_company_addnew"><a href="project_company_addnew" rel="external">添加</a></div>
    </div>    

    <div data-role="content">
    	<div>
        	<div class="second_title">寻找专家中</div>
            <div class="list">
            	<div class="project_name">项目名称</div>
                <div class="time_margin">
                	<div class="begin_time_font">发布时间&nbsp;:&nbsp;</div>
                    <div class="begin_time_number">2015-01-01</div>
                	<div class="deadline_time_font">截止时间&nbsp;:&nbsp;</div>
                    <div class="deadline_time_number">2015-02-01</div>
                </div>
				<div class="time_margin">
                	<div class="new_expert_font">新的申请专家&nbsp;:&nbsp;</div>
                    <div class="new_expert_number">3</div>
                </div>
                <div class="clear"></div>
        	</div>
        </div>
    	<div>
        	<div class="second_title"><br>进行中</br></div>
            <div class="list">
            	<div class="project_name">项目名称</div>
                <div><span class="begin_time_font">发布时间:</span><span class="begin_time_number">2015-01-01</span></div>
                <div><span class="deadline_time_font">截止时间:</span><span class="deadline_time_number">2015-02-01</span></div>
        	</div>
        </div>
    	<div>
        	<div class="second_title">已完成</div>
            <div class="list">
            	<div class="project_name">项目名称</div>
        	</div>
        </div>
    	<div>
        	<div class="second_title">已关闭</div>
            <div class="list">
            	<div class="project_name">项目名称</div>
        	</div>
        </div>
	</div>
    
	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="home.html" rel="external" data-icon="home">首页</a></li>
        		<li><a href="project.html" rel="external" data-icon="arrow-r" class="ui-btn-active">项目</a></li>
        		<li><a href="center_expert.html" rel="external" data-icon="star">个人</a></li>
      		</ul>
    	</div>
  	</div>
</div>
</body>
</html>
  


