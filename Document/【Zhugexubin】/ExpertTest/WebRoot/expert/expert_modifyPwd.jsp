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
<link rel="stylesheet"
	href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/theme.css" />
<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
<script
	src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>

<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />

<style type="text/css">
</style>
</head>

<body>
	<div data-role="page" id="page1">
		<form method="post" action="<%=basePath%>expert/expert_modifyPwd">
		<div class="header" data-role="none">
			<h1>密码修改</h1>
		</div>
		<div data-role="content">
				<p>
					<label> 用户名： </label> <input name="username" class="required"
						type="text" readonly="readonly"
						value="<s:property value="#session.eusername" />" />
				</p>
				<dl class="nowrap">
					<dt>原密码：</dt>
					<dd>
						<input id="oldpassword" name="oldpassword" type="password" />
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>新密码：</dt>
					<dd>
						<input id="newpassword" name="password"
							class="required alphanumeric" minlength="6" type="password" />
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>确认密码：</dt>
					<dd>
						<input name="passwordcheck" class="required alphanumeric"
							equalto="#newpassword" minlength="6" type="password" />
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>邮箱：</dt>
					<dd>
						<textarea id="email" name="email">${email}</textarea>
					</dd>
				</dl>
		</div>
			<ul>
				<li>
					<div id="submitDiv">
					<button id="submit" type="submit">保存</button>
					</div>
				<li>
					<div>
						<button id="cancel" type="button" >取消</button>
					</div>
				</li>
			</ul>

		</form>
	</div>

	<script type="text/javascript">
	$("#submit").click(function(e) {
		var oldpwd = $("#oldpassword").val();
		var newpwd = $("#newpassword").val();
		var email = $("#email").val();
		alert(oldpwd+","+newpwd+","+email);
		var info= {
			"oldpwd":oldpwd,
			"newpwd":newpwd,
			"email":email,
		};
	
    	$.post("../expert/expert_modifyPwd.action",info,function(data,status){
      		alert(data);
      		location.href="<%=basePath%>expert/expert_initProfile.action";
			});
		});
	</script>
</body>
</html>