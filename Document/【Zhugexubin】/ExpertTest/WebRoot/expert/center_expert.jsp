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
	
    <link rel="stylesheet" href="<%=basePath%>css/business_expert.css" />
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
    <h1>个人中心</h1>
  </div>
  <div data-role="content">
  
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
    
	<div class="buttonbox">
	  <a class="changepassword" href="#" data-role="button">修改密码</a>
	  <a class="profile" href="#" data-role="button">个人资料</a>
    </div>
        
  </div>
  
  	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="<%=basePath%>expert/expert_home.jsp" rel="external" data-icon="home">首页</a></li>
        		<li><a href="<%=basePath%>common/project.html" rel="external" data-icon="arrow-r">项目</a></li>
        		<li><a href="<%=basePath%>expert/expert_initProfile.action" rel="external" data-icon="star" class="ui-btn-active">个人中心</a></li>
      		</ul>
    	</div>
  	</div>
</div>
<script type="text/javascript">
	$("img").click(function(e) {
		var src = $(this).attr("src");
        window.location.href = "<%=basePath%>expert/expert_enterPhoto.action";
    });
	$(".profile").click(function(e) {
		window.location.href = "<%=basePath%>expert/expert_enterProfile.action";
    });
    $(".changepassword").click(function(e) {
		window.location.href = "<%=basePath%>expert/expert_modifyPwd.jsp";
    });
</script>
</body>

</html>