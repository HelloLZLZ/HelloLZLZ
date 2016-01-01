<%@ page language="java"
	import="java.util.*,com.opensymphony.xwork2.ActionContext"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	<link rel="stylesheet" href="<%=basePath%>css/theme.css" />
    <link rel="stylesheet" href="<%=basePath%>css/center.css" />
    <link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<style type="text/css">
</style>
</head>

<body>
	<div data-role="page" style="background-color:#E6E6E6" id="page1">
		<form method="post" action="<%=basePath%>expert/expert_modifyPwd">
			<div class="header">
				<h1 class="title_nobtn">修改密码</h1>
			</div>
            
			<div class="center_body">
            
            	<div class="label">
        			<label data-role="none" class="label_tip">
                		<div class="label_font">用户名&nbsp;:&nbsp;</div>
                	</label>
        			<input data-role="none" class="text_box" name="username" type="text" readonly value="<s:property value="#session.eusername" />" />
         		</div> 
            
            	<div class="label">
        			<label data-role="none" class="label_tip">
                		<div class="label_font">原密码&nbsp;:&nbsp;</div>
                	</label>
        			<input data-role="none" class="text_box" name="oldpassword" type="password" id="oldpassword" placeholder="&nbsp&nbsp请输入原密码" />
         		</div>
                
                <div class="label">
        			<label data-role="none" class="label_tip">
                		<div class="label_font">新密码&nbsp;:&nbsp;</div>
                	</label>
        			<input data-role="none" class="text_box" name="password" type="password" id="newpassword" minlength="6" placeholder="&nbsp&nbsp请输入新密码" />
         		</div>
                
                <div class="label">
        			<label data-role="none" class="label_tip">
                		<div class="label_font">确认密码&nbsp;:&nbsp;</div>
                	</label>
        			<input data-role="none" class="text_box" name="passwordcheck" type="password" equalto="#newpassword" minlength="6" placeholder="&nbsp&nbsp请再次输入新密码" />
         		</div>
                
                <div class="btn_red">
    				<button data-role="none" id="submit" type="submit" style="background-color:transparent" class="btn_word">保存</button>
    			</div>
                
                <div class="btn_blue">
    				<button data-role="none" id="cancel" type="button" onclick="history.go(-1)" style="background-color:transparent" class="btn_word">取消</button>
    			</div>
			</form>
            <div class="none_line"></div> 
        </div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
        <div class="none_line"></div>
	</div>

	<script type="text/javascript">
	$("#submit").click(function(e) {
		var oldpwd = $("#oldpassword").val();
		var newpwd = $("#newpassword").val();
		alert(oldpwd+","+newpwd);
		var info= {
			"oldpwd":oldpwd,
			"newpwd":newpwd,
		};
	
    	$.post("<%=basePath%>expert/expert_modifyPwd.action",info,function(data,status){
      		alert(data);
      		window.location.href="<%=basePath%>expert/expert_initProfile.action";
		});
	});
	</script>
</body>
</html>