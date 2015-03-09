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
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
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
  	<div class="project-item" data-id="???">
            <div class="project-name">
                ???
            </div>
            <div class="project-body">
                <div class="project-line">
                	<div class='price'>项目预算&nbsp;<span class='price-text'>???</span></div>
                    <div class='name'>???</div>
                    <div class="reply-star">???</div>
                </div>
                <div class="project-line brief">???</div>
                <div class="project-line hospital">
                	<div class="launchtime">???发布</div>
                    <div class="deadline">???截止</div>
                </div>
            </div>
	</div>
    <%
	}
	%>
  </div>

</div>
</body>
<script type="text/javascript">
	$(".project-item").click(function(e) {
        var project_id = $(this).attr("data-id");
		window.location.href = "xxxservlet?project="+project_id;
    });
</script>
</html>