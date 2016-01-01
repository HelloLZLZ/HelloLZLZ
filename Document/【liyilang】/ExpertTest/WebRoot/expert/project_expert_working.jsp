<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<%=basePath%>css/company.css" />
	<link rel="stylesheet" href="<%=basePath%>css/project_detail.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>    
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <style type="text/css">
	.expert-line {
    	margin: 0 0 5px;
	}

	.expert-body {
    	padding: 10px 0;
	}

	.btn_green{
		margin:5px 0px 10px 0px;;
	}
    </style>	
</head>

<body>
<div data-role="page" id="page">
	<div class="header" data-role="none">
    	<h1 class="title_nobtn">项目详情</h1>
	</div>    

    <div class="content" data-role="none">
    <div class="imformation" user_id="${business.bid }" project_id="${project.pid }">
  		<div class="project-item" data-id="???">  
        	<div class="project-body">
        		<div class="project-name">${business.bname}</div>
            	<div class="project-job">${business.btel}</div>
            	<div class="clear-div"></div>
			</div>
            
            <div class="btn_green">
  				<button id="contact" class="btn_word" data-role="none">联系企业</button>
  			</div>
		</div>
    	<div class="project_profile_field">
        	<div class="project_profile_class">项目名称&nbsp;:&nbsp;</div>
            <div class="project_profile_detail_name">${project.pname }</div>
        </div>
        
        <div class="project_profile_field">
        	<div class="project_profile_class">项目标签&nbsp;:&nbsp;</div>
            <div class="project_profile_detail_tag">${project.tag}</div>
        </div>
        
        <div class="project_profile_field">
        	<div class="project_profile_class">公司名称&nbsp;:&nbsp;</div>
            <div class="project_profile_detail_company">${project.business.bname }</div>
        </div>
        
        <div class="project_profile_field">
        	<div class="project_profile_class">所属行业&nbsp;:&nbsp;</div>
        	<s:set var="pvocation" value="project.pvocation"/>
            <div class="project_profile_detail_trade">${businessList[pvocation-1] }</div>
        </div>
        
    	<div class="project_profile_field">
        	<div class="project_profile_class">发布时间:</div>
            <div class="project_profile_detail_time">${project.starttime }</div>
        </div>
        
                
    	<div class="project_profile_field">
        	<div class="project_profile_class">截止时间:</div>
            <div class="project_profile_detail_time">${project.deadline }</div>
        </div>
        
        <div class="project_profile_field">
        	<div class="project_profile_class">项目预算&nbsp;:&nbsp;</div>
            <div class="project_profile_detail_budget">${project.budget }</div>
        </div>
        
		<div class="project_profile_field">
        	<div class="project_profile_class">项目简介&nbsp;:&nbsp;</div>
            <div class="project_profile_detail_information">${project.pdescrpt}</div>
        </div>
        <div class="btn_blue">
			<button data-role="none" id="cancel" type="button" onclick="history.go(-1)" class="btn_word">返回</button>
		</div>
        
        </div>
    </div>
</div>

</body>
</html>
