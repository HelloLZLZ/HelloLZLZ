<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>登录</title>
 	<link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" /
</head>

<body>
<div data-role="page" id="page">
  
  <div class="header" data-role="none">
    <h1>登录</h1>
  </div>
  
  <div data-role="content">
  	<form method="post" action="<%=basePath%>login/user_login.action">  
      <div data-role="fieldcontain">
      	<label for="username">用户名:</label>
      	<input type="text" name="user.username"value=""  />
   	  </div>
    
      <div data-role="fieldcontain">
      	<label for="password">密码:</label>
        <input type="password" name="user.password" value=""  />
      </div>
    
	  <div data-role="fieldcontain">
	    <label for="usertype">用户类型:</label>
      	<select name="user.usertype">
			<option value="1">专家用户</option>
			<option value="2">企业用户</option>
	  	</select>	
      </div>
      
      <div data-role="fieldcontain">
        <input type="checkbox" name="AutoLoginCheckbox" id="AutoLogin" class="custom" value="" />
        <label for="AutoLogin">自动登录</label>
      </div>
    
      <a href="#">忘记密码</a>
      <a href="<%=basePath%>loginPage/register.jsp" rel="external">注册</a>
      <input type="submit" value="登录" />    
    </form>
  </div>

</div>
<script type="text/javascript">

</script>
</body>
</html>
