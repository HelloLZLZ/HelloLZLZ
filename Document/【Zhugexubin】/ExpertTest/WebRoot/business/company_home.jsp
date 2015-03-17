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
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
</head>
<body>
<div data-role="page" id="page">
    <div data-role="header">
    	<h1>首页</h1>
    </div>    

    <div data-role="content">
		<p>行业分类</p>
    	<div>
			<div><a class="btn_business" href="#" data-role="button" data-code="b_0">IT|通信|电子|互联网</a></div>
			<div><a class="btn_business" href="#" data-role="button" data-code="b_1">金融业</a></div>
     		<div><a class="btn_business" href="#" data-role="button" data-coed="b_2">房地产|建筑业</a></div>
      		<div><a class="btn_business" href="#" data-role="button" data-coed="b_3">商业服务</a></div>
      		<div><a class="btn_business" href="#" data-role="button" data-coed="b_4">贸易|批发|零售|租赁业</a></div>
			<div><a class="btn_business" href="#" data-role="button" data-coed="b_5">文教体育|工业美术</a></div>
     	 	<div><a class="btn_business" href="#" data-role="button" data-coed="b_6">生产|加工|制造</a></div>
      		<div><a class="btn_business" href="#" data-role="button" data-coed="b_7">交通|运输|物流|仓储</a></div>
      		<div><a class="btn_business" href="#" data-role="button" data-coed="b_8">服务业</a></div>
            <div><a class="btn_business" href="#" data-role="button" data-coed="b_9">文化|传媒|娱乐|体育</a></div>
            <div><a class="btn_business" href="#" data-role="button" data-coed="b_10">能源|矿产|环保</a></div>
            <div><a class="btn_business" href="#" data-role="button" data-coed="b_11">政府|非盈利机构</a></div>
            <div><a class="btn_business" href="#" data-role="button" data-coed="b_12">农|林|牧|渔|其他</a></div>
    	</div>
	</div>
    
	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="<%=basePath%>common/home.jsp" rel="external" data-icon="home" class="ui-btn-active">首页</a></li>
        		<li><a href="<%=basePath%>business/project_addnew.jsp" rel="external" data-icon="arrow-r">项目</a></li>
        		<li><a href="<%=basePath%>expert/expert_initProfile.action" rel="external" data-icon="star">个人</a></li>
      		</ul>
    	</div>
  	</div>
</div>
<script type="text/javascript">
	$(".btn_business").click(function() {
		var code = $(this).attr("data-code");
		//将行业id传给对应的servlet，并在servlet中通过id在数据库查找行业项目之后，跳转到business_project.jsp进行显示
		window.location.href = "xxxServlet?business="+code;		
	});
</script>
</body>
</html>

  
  


