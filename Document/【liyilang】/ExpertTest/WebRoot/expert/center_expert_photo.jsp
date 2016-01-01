<%@ page language="java" import="java.util.*,com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/photo.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="<%=basePath%>js/jquery.form.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() { 
    	var imgPath="<%=basePath%>resource/UploadImages/";
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

<div data-role="page" style="background-color:#E6E6E6" id="page">
  	<div class="header">
		<h1 class="title_nobtn">修改头像</h1>
	</div>
    
	<div data-role="none" class="photo_body">
  		<div class="photo_preview">
  			<img id="frontimg" width="100px" height="100px"
            	src=<s:if test="expert.photo==null || expert.photo==''">
				"<%=basePath%>resource/img/default.jpg"
				</s:if>
				<s:else>
				"../resource/UploadImages/${expert.photo}" 
				</s:else>>
            </img>
    	</div>

		<form id="frontjsonForm" action="<%=basePath %>upload/FileUploadAction.action" method="post" enctype="multipart/form-data" target="hidden_frame">
    		<div class="photo_chose">
				<input data-role="none" type="file" name="myFile" id="myFile1" class="button">												
			</div>
	
			<div class="btn_blue" id="upload1">
				<button data-role="none" id="button1" disabled="disabled">
                	<p class="btn_word">上传</p> 
                </button>
			</div>
    
			<iframe id="hidden_frame" name="hidden_frame" style="display: none"></iframe>
	</form>
	
			<input type="hidden" id="front" name="expert.photo" value="${expert.photo}" />
            
            <div class="btn_blue">
				<input data-role="none" id="submit" type="submit" style="background-color:transparent" class="btn_word" value="确认修改" />
            </div>
            <div class="none_line"></div>
			<div class="footer" data-role="none">
    			<div class="footer_home" data-icon="home">首页</div>
        		<div class="footer_center" style="background:#09C">
        		<p class="footer_font">个人</p>
        		</div>
        		<div class="footer_project">项目</div>
  			</div>     
	</div>
</div>
<script type="text/javascript">
    $("#submit").click(function(){
    	var imgName = $("#front").val();
   		$.post("../expert/expert_savePhoto.action",{imgName:imgName},function(data,status){
     		alert(data);
   		});
  	});
</script>

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
</script>

</body>
</html>