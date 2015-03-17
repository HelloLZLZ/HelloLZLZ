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
	<title>专家用户注册</title>
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
	<script type="text/javascript" src="regist_validate.js"></script>
</head>

<body>
<div data-role="page" id="basicinfo_expert">
	<div data-role="header" data-theme="b">
    	<h1>专家注册</h1>
  	</div>
    
    <div data-role="content">
		<form method="post" action="<%=basePath%>login/user_expertRegister.action">
			<div data-role="fieldcontain">
        		<label for="UserName">用户名:</label>
        		<input type="text" name="expert.eusername" id="UserName" value="" placeholder="仅包括数字、字母或下划线" />
            </div>      	      
            <div data-role="fieldcontain">
        		<label for="Password">密码输入:</label>
        		<input type="password" name="expert.epwd" id="Password" value="" placeholder="仅包括数字、字母或下划线"/>
      		</div>
            <div data-role="fieldcontain">
        		<label for="ComfirmPassword">确认密码:</label>
        		<input type="password" name="ComfirmPasswordInput" id="ComfirmPassword" value="" />
      		</div>
            <div data-role="fieldcontain">
       		 	<label for="Name">真实姓名:</label>
      		  	<input type="text" name="expert.name" id="Name" value=""  />
      		</div>
            <div data-role="fieldcontain">
        		<label for="PhoneNumber">手机号码:</label>
        		<input type="number" name="expert.phone" id="PhoneNumber" value=""  />
      		</div>
            <div data-role="fieldcontain">
        		<label for="BusinessSelect" class="select">所属行业:</label>
        		<select name="expert.evocation" id="BusinessSelect">
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
        		<label for="JobSelect" class="select">专长领域:</label>
        		<select name="expert.edomain" id="JobSelect">
                  <option value="1">销售|客服|市场</option>
                  <option value="2">财务|人力资源|行政</option>
                  <option value="3">项目|质量|高级管理</option>
                  <option value="4">IT|互联网|通信</option>
                  <option value="5">房产|建筑|物业管理</option>
                  <option value="6">金融</option>
                  <option value="7">采购|贸易|交通|物流</option>
                  <option value="8">生产|制造</option>
                  <option value="9">传媒|印刷|艺术|设计</option>
                  <option value="10">咨询|法律|教育|翻译</option>
                  <option value="11">服务业</option>
                  <option value="12">能源|环保|农业|科研</option>
                  <option value="13">兼职|实习|社工|其他</option>
                </select>
      		</div>
            <div data-role="fieldcontain">
        		<label for="Year">入行年数:</label>
        		<input type="number" name="expert.eyears" id="Year" value="" placeholder="请输入0~100之间的数字"/>
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
				}else if(isNull($("#Name").val())) {
					e.preventDefault();
					alert("请输入真实姓名");
				}else if(isNull($("#PhoneNumber").val())) {
					e.preventDefault();
					alert("请输入手机号码");
				}else if(isNull($("#Year").val())) {
					e.preventDefault();
					alert("请输入入行年数");
				}else if(!isNumberOr_Letter($("#UserName").val())) {
					e.preventDefault();
					alert("用户名格式不合法，仅包含数字、字母或下划线");
				}else if(!isNumberOr_Letter($("#Password").val())) {
					e.preventDefault();
					alert("密码格式不合法，仅包含数字、字母或下划线");
				}else if(!isSameString($("#ComfirmPassword").val(),$("#Password").val())) {
					e.preventDefault();
					alert("两次密码输入不一致");
				}else if(!isMobile($("#PhoneNumber").val())) {
					e.preventDefault();
					alert("手机号码格式不合法");
				}else if(!isCareerYear($("#Year").val())) {
					e.preventDefault();
					alert("入行年份格式不合法，请输入0-100之间的数");
				}
			});
			$("#UserName").blur(function(e) {
				var name = $(this).val();
	            $.post("../login/user_exist.action", {username:name},function(data,status) {
					alert(data);
			});
        });
	</script>
	
</body>
</html>
