<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="org.expert.model.Project"%>
<%@page import="org.expert.service.impl.ProjectServiceBean"%>
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
	<link rel="stylesheet" href="<%=basePath%>css/project.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">

	<div class="header" data-role="none">
    	<h1 class="title_nobtn">项目</h1>
        <div class="ui-btn-right">+</div>
    </div> 

    <div class="content" data-role="none">
    	
    	<div class="project_field">
    		<div class="project_second_title_blue">寻找专家中</div>
    		<s:iterator value="projects0" status="st">
            <div class="project_item_blue" data-id="${pid }" onClick="getSId(this)">
            	<div class="project_name_blue">${pname }</div>
                <div class="project_line">
                	<div class='company'>${business.bname }</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget}</span></div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="begin_time_number">发布:${starttime }</div>
                	<div class="deadline_time_number">截止:${deadline }</div>
                    <div class="clear"></div>
            	</div>
                <div class="clear"></div>
        	</div>
        	</s:iterator>
        </div>

        
    	<div class="project_field">
        	<div class="project_second_title_green">进行中</div>
        	<s:iterator value="projects1" status="st">
            <div class="project_item_green" data-id="${pid }" onClick="getWId(this)">
            	<div class="project_name_green">${pname }</div>
                <div class="project_line">
                	<div class='company'>${business.bname }</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget }</span></div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="begin_time_number">发布:${starttime }</div>
                	<div class="deadline_time_number">截止:${deadline }</div>
                    <div class="clear"></div>
            	</div>
                <div class="clear"></div>
                </div>
        	</s:iterator>
        </div>
                        
    	<div class="project_field">
        	<div class="project_second_title_red">已完成</div>
        	<s:iterator value="projects2" status="st">
           <div class="project_item_red" data-id="${pid }" onClick="getCId(this)">
            	<div class="project_name_red">${pname }</div>
                <div class="project_line">
                	<div class='company'>${business.bname }</div>
                	<div class="clear"></div>
            	</div> 
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget }</span></div>
                	<div class="clear"></div>
            	</div>                               
                <div class="clear"></div>
                </div>
        	 </s:iterator>
        </div>
                
        
    	<div class="project_field">
        	<div class="project_second_title_grey">已关闭</div>
        	<s:iterator value="projects3" status="st">
            <div class="project_item_grey" data-id="${pid }" onClick="getCId(this)">
            	<div class="project_name_grey">${pname }</div>
                <div class="project_line_grey">
                	<div class='company'>${business.bname }</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line_grey">
                	<div class="reply_star_grey">评价：<span class="evaluate_grey">4</span>/5</div>
                	<div class='price_grey'>¥:&nbsp;<span class="price_text_grey">${budget }</span></div>
                	<div class="clear"></div>
            	</div>                
                <div class="clear"></div>
           		</div>
        	</s:iterator>
        </div>
    </div>
        
  	<div class="footer" data-role="none">
    	<div class="footer_home">首页</div>
        <div class="footer_center">个人</div>
    	<div class="footer_project"  style="background:#09C"> 
    	<p class="footer_font" data-icon="home">项目</p></div>
  	</div>
</div>

    <script type="text/javascript">
	 $(".ui-btn-right").click(function(){
   		location.href = "../business/project_addnew.jsp";
	});
		
	function getSId(itemId) {
		var project_id = $(itemId).attr("data-id");
		
		location.href = "<%=basePath%>project/project_getSProject.action?project_id="+project_id;
	}
	
	function getWId(itemId) {
		var project_id = $(itemId).attr("data-id");
		
		location.href = "<%=basePath%>project/project_getWProject.action?project_id="+project_id;
	}
	
	function getCId(itemId) {
		var project_id = $(itemId).attr("data-id");
		
		location.href = "<%=basePath%>project/project_getCProject.action?project_id="+project_id;
	}
	
	$(".ui-btn-right").click(function(e) {
        window.location.href = "<%=basePath%>project/project_getDProject.action?pid="+project_id;
    });
    
	$(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>business/company_home.jsp";
    });
	
	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>project/project_searchBprojects.action";
    });

	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>business/business_initProfile.action";
    });
	</script>
</body>
</html>