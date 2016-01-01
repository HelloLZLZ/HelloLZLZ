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
    </div> 

    <div class="content" data-role="none">
    	
    	<div class="project_field">
    		<div class="project_second_title_blue">申请中</div>
    		<s:iterator value="apy_projectList" status="st">
            <div class="project_item_blue" data-id="${pid}" onClick="getId(this)">
            	<div class="project_name_blue">${pname}</div>
                <div class="project_line">
                	<div class='company'>中国科学技术大学</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget}</span></div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="begin_time_number">发布:${starttime}</div>
                	<div class="deadline_time_number">截止:${deadline}</div>
                    <div class="clear"></div>
            	</div>
                <div class="clear"></div>
        	</div>
        	</s:iterator>
        </div>

        
    	<div class="project_field">
        	<div class="project_second_title_green">进行中</div>
        	<s:iterator value="cur_projectList" status="st">
                <div class="project_item_green" data-id="${pid}" onClick="getId(this)">
            	<div class="project_name_green">${pname}</div>
                <div class="project_line">
                	<div class='company'>中国科学技术大学</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget}</span></div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="begin_time_number">发布:${starttime}</div>
                	<div class="deadline_time_number">截止:${deadline}</div>
                    <div class="clear"></div>
            	</div>
                <div class="clear"></div>
                </div>
            </s:iterator>
        </div>
                        
    	<div class="project_field">
        	<div class="project_second_title_red">已完成</div>
        	<s:iterator value="fin_projectList" status="st">
            	<div class="project_item_red" data-id="${pid}" onClick="getId(this)">
            	<div class="project_name_red">${pname}</div>
                <div class="project_line">
                	<div class='company'>中国科学技术大学</div>
                	<div class="clear"></div>
            	</div> 
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget}</span></div>
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
    
    <script type="text/javascript">
	$(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_home.jsp";
    });
	
	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_getProjects.action";
    });

	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_initProfile.action";
    });
    
    function getId(itemId) {
		var project_id = $(itemId).attr("data-id");
		window.location.href = "<%=basePath%>project/project_getDProject.action?pid="+project_id;
	}
	</script>
</div>
</body>
</html>