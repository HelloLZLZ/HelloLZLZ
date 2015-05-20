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
    <link rel="stylesheet" href="business_expert.css" />
    <link rel="stylesheet" href="theme.css"/>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1>专家列表</h1>
  </div>
  <div data-role="content">
	<%
	//从返回的数据中取出数据并填写在dom中，？？？表示需要动态添加的数据
	for(int i=0;i < list.size(); i++) {
		Map map = (Map) list.get(i);
	%>
  	<div class="expert-item" data-id="123">
    	<div class="expert-portait">
        	<img src="http://h.hiphotos.baidu.com/image/pic/item/f636afc379310a5594853bf2b44543a982261016.jpg" alt="王美女"/>
            <div class="little-item">
            	<div class="item-up">12 项目</div>
                <div class="item-down">4.5/5</div>
            </div>
    	</div>
        
        <div class="expert-body">
        	<div class="expert-line name">王美女</div>
            <div class="expert-line job">程序员/IT行业</div>
            <div class="expert-line company">中国科学技术大学</div>
			<div class="expert-line">我是一个很牛逼的程序员</div>
            <div class="clear-div"></div>
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