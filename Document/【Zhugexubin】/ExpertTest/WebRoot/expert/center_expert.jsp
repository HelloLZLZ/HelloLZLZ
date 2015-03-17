<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	 <script languange="JavaScript"> 
	 
	     function chaxun(){   
    	alert("dsfs");
    	 var imgPath="../resource/UploadImages/";
    	alert(imgPath);
    	 
     };
	 </script>
	 
    <script type="text/javascript">
    
    

    
	$(function() { 
		alert("dsfs");
    	var imgPath="../resource/UploadImages/";
    	alert(imgPath);
    	$('#frontjsonForm').ajaxForm({ 
        	dataType:  'json', 
        	success:   function(data){   	
        	$("#frontimg").attr("src",imgPath+data["imageFileName"]);
        	$("#front").val(data["imageFileName"]);
        } 
    }); 
    $('#myFile1').click(function(){
		$('#upload1').removeAttr('class');
		$('#upload1').addClass('buttonActive');	
		$('#button1').removeAttr('disabled');
		$('#button1').addAttr("disabled", disabled);
	});
    </script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
</head>

<body>
<div data-role="page" id="page">
    <div data-role="header">
    	<h1>个人中心</h1>
    </div>    

    <div data-role="content">
    
   
    <form id="frontjsonForm" action="<%=basePath %>upload/FileUploadAction.action"
		method="post" enctype="multipart/form-data"
		target="hidden_frame" onsubmit="chaxun();">
		<div>
			<input type="file" name="myFile" id="myFile1" class="button">												
		</div>
	
		<div id="upload1">
			<div>
				<input type="submit" value="保存">
				<!--  <button type="submit" id="button1">
						上传
				</button>-->
			    
		</div>
		<iframe id="hidden_frame" name="hidden_frame"
			style="display: none"></iframe>
	</form>
	
	<img id="frontimg" width="330px" height="200px"
			src="../resource/img/default.jpg" />
    
    
    	<form method="post" action="<%=basePath %>login/user_expertRegister.action">
          	 <input type="hidden" id="front" name="expert.photo" value="${expert.photo}">
			
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
      		<div data-role="fieldcontain">
        		<label for="Profile">个人简介:</label>
      			<textarea name="expert.profile" id="Profile" rows="10" cols="80"></textarea>
      		</div>
      		<div data-role="fieldcontain">
        		<label for="Profile">教育背景:</label>
      			<textarea name="expert.profile" id="Profile" rows="10" cols="80"></textarea>
      		</div>
      		<div data-role="fieldcontain">
        		<label for="JobSelect" class="select">感兴趣的咨询项目类型:</label>
        		<select name="expert.edomain" id="JobSelect">
                  <option value="1">计算机</option>
                  <option value="2">dd</option>
                  <option value="3">yyy</option>
                </select>
      		</div>
      		<div data-role="fieldcontain">
      			<label for="sharekub" class="select">隐私度:</label>
      			<select class="required combox" name="sharekub" id="sharekub">
					<option value="">
						==请选择==
					</option>
					<option value="0"
					<s:if test="0==target.trnMid.sharekub">selected="selected"</s:if>>											
						共有
					</option>
					<option value="1"
					<s:if test="1==target.trnMid.sharekub">selected="selected"</s:if>>
						非公有
					</option>
				</select>
			</div>
            <input type="submit" value="保存" />
        </form>
    	
    	
	</div>
    
	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="home.jsp" rel="external" data-icon="home">首页</a></li>
        		<li><a href="project.html" rel="external" data-icon="arrow-r">项目</a></li>
        		<li><a href="#" rel="external" data-icon="star" class="ui-btn-active">个人</a></li>
      		</ul>
    	</div>
  	</div>
</div>

	
</body>
</html>
  


