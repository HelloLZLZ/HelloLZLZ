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
	<link rel="stylesheet" href="<%=basePath%>css/business_expert.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
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
		<h1 class="title_nobtn">首页</h1>
	</div>   

    <div data-role="none" class="home_body">
		<p class="title_classify">行业分类</p>
		
    	<div>
        
        	<a class="btn_business" data-role="none" data-code="1">
				<div class="trade_classify_left">IT|互联网</div>
            </a>
			<a class="btn_business" data-role="none" data-code="2">
            	<div class="trade_classify_center">金融业</div>
            </a>
     		<a class="btn_business" data-role="none" data-code="3">
            	<div class="trade_classify_right">房地产</div>
            </a>
            
            <a class="btn_business" data-role="none" data-code="4">
				<div class="trade_classify_left">商业服务</div>
            </a>
			<a class="btn_business" data-role="none" data-code="5">
            	<div class="trade_classify_center">批发|零售</div>
            </a>
     		<a class="btn_business" data-role="none" data-code="6">
            	<div class="trade_classify_right">文教体育</div>
            </a>
            
            <a class="btn_business" data-role="none" data-code="7">
				<div class="trade_classify_left">生产|加工</div>
            </a>
			<a class="btn_business" data-role="none" data-code="8">
            	<div class="trade_classify_center">交通|运输</div>
            </a>
     		<a class="btn_business" data-role="none" data-code="9">
            	<div class="trade_classify_right">服务业</div>
            </a>
            
            <a class="btn_business" data-role="none" data-code="10">
				<div class="trade_classify_left">文化|传媒</div>
            </a>
			<a class="btn_business" data-role="none" data-code="11">
            	<div class="trade_classify_center">能源|矿产</div>
            </a>
     		<a class="btn_business" data-role="none" data-code="12">
            	<div class="trade_classify_right">农|林|牧</div>
            </a>
            

  
    	</div>
	</div>
    <div class="none"></div>
    
    <div class="footer" data-role="none">
    	<div class="footer_home" style="background:#09C">
        <p class="color">首页</p>
        </div>
        <div class="footer_center">个人</div>
    	<div class="footer_project">项目</div>
  	</div>
    
    <script type="text/javascript">
	$(".btn_business").click(function() {
		var code = $(this).attr("data-code");
		window.location.href = "<%=basePath%>expert/expert_queryBusinessExpert.action?code="+code;
	});
	$(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>business/company_home.jsp";
    });
	
	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>business/business_initProfile.action";
    });

	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>project/project_searchBprojects.action";
    });
	</script>

</div>


</body>
</html>
