<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
    <link rel="stylesheet" href="<%=basePath%>css/expert.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/center.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <style type="text/css">
    .expert-item{
		border-bottom:none;}
    </style>	
</head>

<body>
<div style="background-color:#E6E6E6" data-role="page" id="page">

	<div data-role="none" class="header">
		<h1 class="title_nobtn">个人中心</h1>
	</div>
    
	<div data-role="none" class="center_body">
  
  	<div class="expert-item" data-id="???">
    	<div class="expert-portait">
    	<img id="frontimg" width="200px" height="200px"
    		src=<s:if test="expert==null || expert.photo==null || expert.photo==''">
				"../resource/img/default.jpg"
				</s:if>
				<s:else>
				"../resource/UploadImages/${expert.photo}"
				</s:else> />
    	</div>        
        <div class="expert-body">
        	<div class="expert-line name">${expert.name}</div>
            <div class="expert-line job">${expert.phone}</div>
            <div class="expert-line company">${expert.education}</div>
            <div class="clear-div"></div>
		</div>
	</div>

    <div class="btn_blue">
    	<p id="modifyPwd" class="btn_word">修改密码</p>
    </div>
        
    <div class="btn_blue">
    	<p id="editProfile" class="btn_word">编辑资料</p>
    </div>
        
    <div class="none_line"></div>

  	<div class="footer" data-role="none">
    	<div class="footer_home">首页</div>
        <div class="footer_center" style="background:#09C">
        <p class="footer_font">个人</p>
        </div>
        <div class="footer_project">项目</div>
  	</div>
    
    <script type="text/javascript">
	$("img").click(function(e) {
		var src = $(this).attr("src");
        window.location.href = "<%=basePath%>expert/expert_enterPhoto.action";
    });
    
	$(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_home.jsp";
    });
	
	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_getProjects.action";
    });

	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_initProfile.action";
    });
    
    $("#editProfile").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_enterProfile.action";
    });
    $("#modifyPwd").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_modifyPwd.jsp";
    });
	</script>
</div>
</body>

</html>