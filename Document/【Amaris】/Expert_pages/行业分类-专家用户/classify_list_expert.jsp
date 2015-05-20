<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
//从servlet获取项目数据
	ArrayList list = (ArrayList)request.getAttribute("xxx");
%>	
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
    <link rel="stylesheet" href="theme.css"/>
    <link rel="stylesheet" href="business_company.css"/>
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1>项目列表</h1>
  </div>
  <div data-role="content">
	<%
	//从返回的数据中取出数据并填写在dom中，？？？表示需要动态添加的数据
	for(int i=0;i < list.size(); i++) {
		Map map = (Map) list.get(i);
	%>
  	<div class="project-item" data-id="???">
    	<div class="project-name">如何构建高质量的应用</div>
        <div class="project-body">
        	<div class="project-line">
            	<div class='price'>￥:&nbsp;<span class='price-text'>2000</span></div>
                <div class='company'>中国科学技术大学</div>
                <div class="reply-star">5.0/5.0</div>
                <div class="clear-div"></div>
            </div>
            <div class="brief">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Panorama强调多种数据源的聚合，具有一副大于屏幕大小的底图，用户可以通过轻击和平移来选择不同的信息，呈现当前item的时候，同时也显示旁边item的一部分信息，Windows Phone内置的People和Music+Videos界面就是典型的。<div class="clear-div"></div></div>
            <div class="project-line">
            	<div class="launchtime">发布时间：2015-3-16</div>
                <div class="deadline">截止时间：2015-8-8</div>
                <div class="clear-div"></div>
            </div>
        </div>
        <div class="clear-div"></div>
	</div>
    <%
	}
	%>
  </div>
</div>
<script type="text/javascript">
	$(".project-item").click(function(e) {
        var project_id = $(this).attr("data-id");
		window.location.href = "xxxservlet?project="+project_id;
    });
</script>
</body>

</html>