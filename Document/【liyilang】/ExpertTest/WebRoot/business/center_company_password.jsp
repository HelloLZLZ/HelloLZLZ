<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
    <link rel="stylesheet" href="<%=basePath%>css/center.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
</head>
<body>
<div data-role="page" style="background-color:#E6E6E6" id="none">
	<div class="header">
		<h1 class="title_nobtn">修改密码</h1>
	</div>
    
    <div class="center_body">
    <form method="post" action="<%=basePath%>login/user_expertRegister.action">
   		<div class="label">
        		<div class="label_tip">
                	<div class="label_font">原密码&nbsp;:&nbsp;</div>
                </div>
        			<input data-role="none" class="text_box" type="text" placeholder="&nbsp&nbsp输入原密码" />
         </div>  
         
         <div class="label">
        		<div class="label_tip">
                	<div class="label_font">新密码&nbsp;:&nbsp;</div>
                </div>
        			<input data-role="none" class="text_box" type="text" placeholder="&nbsp&nbsp输入新密码" />
         </div>  
         
         <div class="label">
        		<div class="label_tip">
                	<div class="label_font">确认新密码&nbsp;:&nbsp;</div>
                </div>
        			<input data-role="none" class="text_box" type="text" placeholder="&nbsp&nbsp再次输入新密码" />
         </div> 
          
    	<div class="btn_blue">
    		<input type="submit" value="提交" style="background-color:transparent" class="btn_word" data-role="none" />
    	</div>
   	</form>
    
        <div class="none_line"></div> 
            
    </div>
</div>
</body>
</html>
