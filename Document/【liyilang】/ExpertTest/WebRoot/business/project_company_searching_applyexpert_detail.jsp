<%@ page language="java" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<%=basePath%>css/expert.css" />
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

    </style>
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">专家详情</h1>
  </div>
  <div data-role="content">
  	<div class="expert-item" data-id="${project.pid }" expert-id="${expert.eid }">
    	<div class="expert-portait">
        	<img src=<s:if test="expert.photo==null || expert.photo==''">
				"<%=basePath%>resource/img/default.jpg"
				</s:if>
				<s:else>
				"../resource/UploadImages/${expert.photo}" 
				</s:else> />
        </div>
        
        <div class="expert-body">
        	<div class="expert-line name">${expert.name}</div>
            <div class="expert-line job">程序员/IT行业</div>
            <div class="expert-line company">${expert.education}</div>
			<div class="item-line company">评价：<span class="evaluate">4.5</span>/5</div>
            <div class="clear-div"></div>
		</div>
        
        <div class="project_number">已参与项目数：<span>120</span></div>
	</div>  
    <div class="expert_profile_field">
    	<div class="expert_profile_title">详细介绍：</div>
        <div class="expert_profile_detail">${expert.profile}</div>
    </div>
    <div class="btn_green">
  			<button id="suretime" class="btn_word" data-role="none">${expert.phone}</button>
  	</div>	
    
    <div class="tip_grey">在开始项目前可以通过微信与专家联系，了解更多专家的信息，以便确定专家是否符合您的要求.</div>
    
    <div class="btn_red">
  			<button id="chose_expert" class="btn_word" data-role="none">选择此专家</button>
  	</div>	
    
    <div class="tip_grey">如果希望此专家参与您的项目，请点击上方按钮，待专家确认后，即可开始您的项目.</div>
  </div>


</div>
<script type="text/javascript">
	$("#chose_expert").click(function(e) {
		alert("sdf");
        var project_id = $(".expert-item").attr("data-id");
        var expert_id = $(".expert-item").attr("expert-id");
		window.location.href = "<%=basePath%>project/project_dealProject.action?project_id="+project_id+"&expert_id="+expert_id;
    });
</script>
</body>

</html>