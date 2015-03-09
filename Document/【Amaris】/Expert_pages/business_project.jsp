<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
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
  	<div class="doctor-item" data-did="clinic_web_27367e8474d9f220">
            <div class="doctor-portait">
                <img src="http://media.chunyuyisheng.com/media/images/2015/02/06/e4cf6960364c_w295_h295_.jpg" alt="黄勇医生"/>
            </div>
            <div class="doctor-body">
                <div class="doctor-line"><div class='name'>黄勇</div>
                    
                        
                        <div class='price'>服务价格&nbsp;<span class='price-text'>￥50</span></div>
                        
                    

                </div>
                <div class="doctor-line department">主治医师/小儿科</div>
                <div class="doctor-line hospital">四川省人民医院</div>

                <div class="doctor-line">从事儿科临床工作十六年，具有丰富的临床经验，对儿科常见病及多发病十分熟悉，尤其擅长儿科急重症的处理</div>
                <div class="doctor-line"><span class='reply-info'>21&nbsp;解答<span class="reply-sep">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class='reply-star'>5.0</span>/5&nbsp;星</span></div>
                <div class="clear-div"></div>
            </div>
		</div>
  </div>

</div>
</body>
<script type="text/javascript">
/*	$(document).ready(function(e) {
        var str = decodeURI(window.location.search);
		alert(str);
		var codeArray = str.split("=");
		var code = codeArray[1];
		alert(code);
    });
	*/
</script>
</html>