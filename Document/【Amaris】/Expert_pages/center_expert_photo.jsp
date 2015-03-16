<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
    <link rel="stylesheet" href="theme.css"/>
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>

<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1>头像设置</h1>
  </div>
  <div data-role="content">
  	<div class="photo">
  		<img id="frontimg" width="330px" height="200px" src="../resource/img/default.jpg" /> 
    </div>
    <div class="photo">
		<input type="file" name="myFile" id="myFile1" class="button">												
	</div>
	
	<div class="buttonDisabled" id="upload1">
		<div class="buttonContent">
			<button id="button1">上传</button>
		</div>
	</div>
	<iframe id="hidden_frame" name="hidden_frame" style="display: none"></iframe>
  </div>      
</div>

<script type="text/javascript">
	$(document).ready(function(e) {
		var str = decodeURI(window.location.search);
		var stritem = str.split("=");
        $("img").attr("src",stritem[1]);
    });
</script>
</body>
</html>