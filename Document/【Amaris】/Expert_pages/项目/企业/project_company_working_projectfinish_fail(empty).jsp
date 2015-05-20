<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
    <link rel="stylesheet" href="theme.css"/>
    <link rel="stylesheet" href="project_expert.css"/>
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">

	<div class="header" data-role="none">项目</div>  
	<div class="addnew_btn"><a href="project_company_addnew" rel="external">添加</a></div>

    <div class="content" data-role="none">
    	<div class="project_field">
    		<div class="project_second_title">申请中</div>
            <div class="list">
            	<div class="project_name">XXX项目</div>
                <div class="begin_time_font">发布时间&nbsp;:&nbsp;</div>
                <div class="begin_time_number">2015-01-01</div>
                <div class="deadline_time_font">截止时间&nbsp;:&nbsp;</div>
                <div class="deadline_time_number">2015-02-01</div>
                <div class="new_expert_font">企业回应&nbsp;:&nbsp;</div>
                <div class="new_expert_number">是</div>
                <div class="clear"></div>
        	</div>
        </div>
    	<div>
        	<div class="project_second_title">进行中</div>
                <div class="list">
            	<div class="project_name">XXX项目</div>
                <div class="time_margin">
                	<div class="begin_time_font">发布时间&nbsp;:&nbsp;</div>
                    <div class="begin_time_number">2015-01-01</div>
                	<div class="deadline_time_font">截止时间&nbsp;:&nbsp;</div>
                    <div class="deadline_time_number">2015-02-01</div>
                </div>
                <div class="clear"></div>
        	</div>
        </div>
    	<div>
        	<div class="project_second_title">已完成</div>
            <div class="list">
            	<div class="project_name">XXX项目</div>
                <div class="time_margin">
                	<div class="begin_time_font">发布时间&nbsp;:&nbsp;</div>
                    <div class="begin_time_number">2015-01-01</div>
                	<div class="deadline_time_font">截止时间&nbsp;:&nbsp;</div>
                    <div class="deadline_time_number">2015-02-01</div>
                </div>
                <div class="clear"></div>
        </div>
    	<div>
        	<div class="project_second_title">已关闭</div>
            <div class="list">
            	<div class="project_name">XXX项目</div>
                <div class="time_margin">
                	<div class="begin_time_font">发布时间&nbsp;:&nbsp;</div>
                    <div class="begin_time_number">2015-01-01</div>
                	<div class="deadline_time_font">截止时间&nbsp;:&nbsp;</div>
                    <div class="deadline_time_number">2015-02-01</div>
                </div>
                <div class="clear"></div>
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