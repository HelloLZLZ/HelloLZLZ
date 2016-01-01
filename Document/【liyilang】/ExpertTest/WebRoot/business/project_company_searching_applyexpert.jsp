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
  
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">申请的专家</h1>
  </div>
  <div data-role="content">
	<p>--------Unchecked---------</p>
	<s:iterator value="backList1" status="st">
  	<div class="expert-item" data-id="${eid}" project-id="${project.pid }">
    	<div class="expert-portait">
  			<img src=<s:if test="photo==null || photo==''">
        		"<%=basePath%>resource/img/default.jpg"
			</s:if>
			<s:else>
				"<%=basePath%>resource/UploadImages/${photo}"
			</s:else> />
            <div class="little-item">
            	<div class="item-up">项目：<span>120</span></div>
                <div class="item-down">评价：<span class="evaluate">4.5</span>/5</div>
            </div>
    	</div>
        
        <div class="expert-body">
	        	<div class="expert-line name">${name}</div>
	            <div class="expert-line job">${eyears}</div>
	            <div class="expert-line company">${education}</div>
				<div class="expert-line">${phone}</div>
	            <div class="clear"></div>
		</div>
	</div>
	</s:iterator>
	<p>--------checked---------</p>
	<s:iterator value="backList2" status="st">
  	<div class="expert-item" data-id="${eid}" project-id="${project.pid }">
    	<div class="expert-portait">
  			<img src=<s:if test="photo==null || photo==''">
        		"<%=basePath%>resource/img/default.jpg"
			</s:if>
			<s:else>
				"<%=basePath%>resource/UploadImages/${photo}"
			</s:else> />
            <div class="little-item">
            	<div class="item-up">项目：<span>120</span></div>
                <div class="item-down">评价：<span class="evaluate">4.5</span>/5</div>
            </div>
    	</div>
        
        <div class="expert-body">
	        	<div class="expert-line name">${name}</div>
	            <div class="expert-line job">${eyears}</div>
	            <div class="expert-line company">${education}</div>
				<div class="expert-line">${phone}</div>
	            <div class="clear"></div>
		</div>
	</div>
	</s:iterator>
 </div>
</div>

<script type="text/javascript">
	$(".expert-item").click(function(e) {
        var eid = $(this).attr("data-id");
        var project_id = $(this).attr("project-id");
		location.href = "<%=basePath%>project/project_getApplyedExpert.action?eid="+eid+"&project_id="+project_id;
    });
	
</script>
</body>

</html>