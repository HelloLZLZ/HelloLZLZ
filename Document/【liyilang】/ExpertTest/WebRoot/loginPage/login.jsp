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
	<title>专家汇</title>
 	<link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/login.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/home.css"/>
    <link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
</head>

<body>
<div data-role="page" style="background-color:#E6E6E6" id="page">

	<div class="header">
		<h1 class="title_nobtn">登陆</h1>
	</div>
  
	<div data-role="none" class="login_body">
    
  		<form method="post" action="<%=basePath%>login/user_login.action">
          
      		<div data-role="none" class="line">
      			<label data-role="none" class="label" for="username">
                	<div class="label_font">用户名&nbsp;:&nbsp;</div>
                </label>
      			<input data-role="none" class="text" type="text" name="user.username" value="" id="username" placeholder="&nbsp;&nbsp;请输入用户名" />
   	  		</div>
    
      		<div data-role="none" class="line">
      			<label data-role="none" class="label" for="password">
                	<div class="label_font">密码&nbsp;:&nbsp;</div>
                </label>
        		<input data-role="none" class="text" type="password" name="user.password" value="" id="password" placeholder="&nbsp;&nbsp;请输入密码" />
      		</div>
    
	  		<div data-role="none" class="line">
	    		<label data-role="none" class="label" for="usertype">
                	<div class="label_font">用户类型&nbsp;:&nbsp;</div>
                </label>
      			<select data-role="none" class="list" name="user.usertype" id="usertype">
					<option value="1">专家用户</option>
					<option value="2">企业用户</option>
	  			</select>	
      		</div>
            
            <div data-role="none" class="line">
                <div data-role="none" class="line_two_left">
        			<input data-role="none" class="checkbox_box" type="checkbox" name="AutoLoginCheckbox" id="AutoLogin" value="" />
        			<label data-role="none" class="checkbox_label" for="AutoLogin">
                    	<div class="line_two_font">自动登录</div>
                    </label>
      			</div>
                <div data-role="none" class="line_two_right">
                	<a href="#">
                    	<div class="line_two_font">?&nbsp;&nbsp;忘记密码</div>
                    </a>
      			</div>
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
            <div class="none_line"></div>
            
            <div class="btn_blue">
            	<input type="submit" value="登&nbsp;录" style="background-color:transparent" class="btn_word" data-role="none" />
            </div>
            
            <a href="<%=basePath%>loginPage/register.jsp" rel="external">
            	<div class="btn_blue">
                	<div class="btn_word">注&nbsp;册</div>
                </div>
            </a>
            
            <div class="none_line"></div> 
		</form>
	</div>
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

</script>
</body>
</html>
