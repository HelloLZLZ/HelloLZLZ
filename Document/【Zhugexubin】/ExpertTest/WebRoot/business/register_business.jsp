<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>企业用户注册</title>
	<link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<script type="text/javascript">
		$(document).on("click","a",ClickMe(event));
		var str = decodeURI(window.location.search);
		localStorage.setItem("location_register",str);
	</script>
	<noscript>您的浏览器不支持JavaScript,请使用其它浏览器</noscript>
    <script type="text/javascript" src="<%=basePath %>js/regist_validate.js"></script>
</head>

<body>
	<div data-role="page" id="page">
		 <div class="header" data-role="none">   
			<h1>企业认证</h1>
		</div>
		<div data-role="content">
			<form method="post" action="<%=basePath %>login/user_businessRegister.action">
				<div data-role="fieldcontain">
					<label for="busername">用户名:</label> <input type="text"
						name="business.busername" id="UserName" class="required" value=""
						placeholder="仅包括数字、字母或下划线" />
				</div>
				<div data-role="fieldcontain">
					<label for="bpwd">密码输入:</label> <input type="password"
						name="business.bpwd" id="Password" value=""
						placeholder="仅包括数字、字母或下划线" />
				</div>
				<div data-role="fieldcontain">
					<label for="ComfirmPassword">确认密码:</label> <input type="password"
						name="ComfirmPasswordInput" id="ComfirmPassword" value="" />
				</div>
				<div data-role="fieldcontain">
					<label for="bname">企业名称:</label> <input type="text"
						name="business.bname" id="CompanyName" value="" />
				</div>
				<div data-role="fieldcontain">
					<label for="bnet">企业域名:</label> <input type="text"
						name="business.bnet" id="CompanySite" value="" />
				</div>
				<div data-role="fieldcontain">
					<label for="bnet">企业电话:</label> <input type="text"
						name="business.btel" id="CompanyTel" value="" />
				</div>
				<div data-role="fieldcontain">
					<label for="BusinessSelect" class="select">所属行业:</label> <select
						name="business.bvocation" id="BusinessSelect">
						<option value="1">IT|通信|电子|互联网</option>
						<option value="2">金融业</option>
						<option value="3">房地产|建筑业</option>
						<option value="4">商业服务</option>
						<option value="5">贸易|批发|零售|租赁业</option>
						<option value="6">文教体育|工业美术</option>
						<option value="7">生产|加工|制造</option>
						<option value="8">交通|运输|物流|仓储</option>
						<option value="9">服务业</option>
						<option value="10">文化|传媒|娱乐|体育</option>
						<option value="11">能源|矿产|环保</option>
						<option value="12">政府|非盈利机构</option>
						<option value="13">农|林|牧|渔|其他</option>
					</select>
				</div>
				<div data-role="fieldcontain">
					<label for="CompanyIntroduction">企业简介:</label>
					<textarea cols="40" rows="8" name="business.bsummary"
						id="CompanyIntroduction" placeholder="至少15个字"></textarea>
				</div>
				<input type="submit" value="注册" />
			</form>
		</div>

	  <div data-role="footer"> </div>
	 	</div>
	<script type="text/javascript">
  
			$("form").submit(function(e) {
				if(isNull($("#UserName").val())) {
					e.preventDefault();
					alert("用户名不能为空");
				}else if(isNull($("#Password").val())) {
					e.preventDefault();
					alert("密码不能为空");
				}else if(isNull($("#ComfirmPassword").val())) {
					e.preventDefault();
					alert("请确认密码");
				}else if(isNull($("#CompanyName").val())) {
					e.preventDefault();
					alert("企业名称不能为空");
				}else if(isNull($("#CompanyIntroduction").val())) {
					e.preventDefault();
					alert("企业简介不能为空");
				}else if(!isNumberOr_Letter($("#UserName").val())) {
					e.preventDefault();
					alert("用户名格式不合法，仅包含数字、字母或下划线");
				}else if(!isNumberOr_Letter($("#Password").val())) {
					e.preventDefault();
					alert("密码格式不合法，仅包含数字、字母或下划线");
				}else if(!isSameString($("#ComfirmPassword").val(),$("#Password").val())) {
					e.preventDefault();
					alert("两次密码输入不一致");
				}else if(!IsURL($("#CompanySite").val())) {
					e.preventDefault();
					alert("域名不合法");
				}else if($("#CompanyIntroduction").val().length<15) {
					e.preventDefault();
					alert("企业简介至少15个字");
				}
			});
		
			$("#UserName").blur(function(e) {
				var name = $(this).val();
	            $.post("../login/user_businessExist.action", {username:name},function(data,status) {
					alert(data);
			});
	 });

</script>
</body>
</html>
