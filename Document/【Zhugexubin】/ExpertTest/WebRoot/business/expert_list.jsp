<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <h1>项目列表</h1>
  </div>
  <div data-role="content">
	<%
	//从返回的数据中取出数据并填写在dom中，？？？表示需要动态添加的数据
	for(int i=0;i < list.size(); i++) {
		Map map = (Map) list.get(i);
	%>
  	<div class="expert-item" data-id="???">
    	<div class="expert-portait">
        	<img src="???" alt="???"/>
    	</div>
        <div class="expert-body">
        	<div class="expert-line name">???</div>
            <div class="expert-line job">???/???</div>
            <div class="expert-line company">???</div>
			<div class="expert-line brief">???</div>
            <div class="expert-line">
				<div class="projectnumber">???项目</div>
                <div class="reply-star">???/5.0</div>
            </div>
		</div>
	</div>
    <%
	}
	%>
  </div>
</div>
<script type="text/javascript">
	$(".expert-item").click(function(e) {
        var project_id = $(this).attr("data-id");
		window.location.href = "xxxservlet?project="+project_id;
    });
</script>
</body>

</html>