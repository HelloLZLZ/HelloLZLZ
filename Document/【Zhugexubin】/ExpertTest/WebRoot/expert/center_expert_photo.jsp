<%@ page language="java" import="java.util.*,com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="<%=basePath%>js/jquery.form.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() { 
    	var imgPath="../resource/UploadImages/";
    	$('#frontjsonForm').ajaxForm({ 
        	dataType:  'json', 
        	success:   function(data){   	
		        	$("#frontimg").attr("src",imgPath+data["imageFileName"]);
		        	$("#front").val(data["imageFileName"]);
        		} 
    	}); 
    });
    $(document).ready(function(){
    	$('#myFile1').click(function(){
    		$('#button1').removeAttr('disabled');
    	})
    });
    </script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>

<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1>头像设置</h1>
  </div>
  <div data-role="content">
  	<div class="photo">
  		<img id="frontimg" width="200px" height="200px"
			src="../resource/UploadImages/${expert.photo}" />
    </div>
    <form id="frontjsonForm" action="<%=basePath %>upload/FileUploadAction.action"
		method="post" enctype="multipart/form-data"
		target="hidden_frame">
    <div class="photo">
		<input type="file" name="myFile" id="myFile1" class="button">												
	</div>
	
	<div class="buttonDisabled" id="upload1">
		<div class="buttonContent">
			<button id="button1" disabled="disabled">上传</button>
		</div>
	</div>
	<iframe id="hidden_frame" name="hidden_frame" style="display: none"></iframe>
	</form>
	
	<input type="hidden" id="front" name="expert.photo" value="${expert.photo}">
	<input id="submit" type="submit" value="确认修改">
		
	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="<%=basePath%>expert/expert_home.jsp" rel="external" data-icon="home" class="ui-btn-active">首页</a></li>
        		<li><a href="<%=basePath%>common/project.html" rel="external" data-icon="arrow-r">项目</a></li>
        		<li><a href="<%=basePath%>expert/expert_initProfile.action" rel="external" data-icon="star">个人中心</a></li>
      		</ul>
    	</div>
  	</div>
  </div>      
</div>

<script type="text/javascript">
    $("#submit").click(function(){
    	var imgName = $("#front").val();
    	alert(imgName);
   		$.post("../expert/expert_savePhoto.action",{imgName:imgName},function(data,status){
     		alert(data);
   		});
  	});
</script>

</body>
</html>