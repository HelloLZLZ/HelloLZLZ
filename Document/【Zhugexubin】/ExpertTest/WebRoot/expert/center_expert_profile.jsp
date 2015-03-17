<%@ page language="java" import="java.util.*,com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%
//从servlet获取项目数据
	//ArrayList list = (ArrayList)request.getAttribute("xxx");
%>
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
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>

    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    
    <style type="text/css">
	</style>
</head>

<body>
<div data-role="page" id="page1">
  
  <div class="header" data-role="none">
    <h1>个人资料</h1>
  </div>
  <form action="<%=basePath %>expert/expert_saveProfile.action" method="post">
  <div data-role="content">
    <ul data-role="listview" data-inset="true">
   		<%
			ActionContext ctx = ActionContext.getContext();
			String userid = String.valueOf((ctx.getSession().get("euserid")));
			String username = String.valueOf(ctx.getSession().get("eusername"));
			String pwd = String.valueOf(ctx.getSession().get("epwd"));
		%>									
		<input type="hidden" name="expert.eid" value="<%=userid%>">
		<input type="hidden" name="expert.eusername" value="<%=username%>">	
		<input type="hidden" name="expert.epwd" value="<%=pwd%>">	
    
      <input type="hidden" name="expert.photo" value="${expert.photo}">
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>真实姓名</h3>
        <p id="profile_name" name="expert.name">${expert.name}</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>手机号码</h3>
        <p id="profile_phone" name="expert.phone">${expert.phone}</p>
      </a></li>
      <li><a class="toBusiness" href="#page4" data-rel="dialog">
        <h3>所属行业</h3>
        <p id="profile_business" name="expert.evocation">???</p>
      </a></li>
      <li><a class="toJob" href="#page5" data-rel="dialog">
        <h3>专长领域</h3>
        <p id="profile_job" name="expert.edomain">???</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>入行年数</h3>
        <p id="profile_year" name="expert.eyears">${expert.eyears }</p>
      </a></li>
      <li><a class="toTextarea" href="#page3" data-rel="dialog">
        <h3>个人简介</h3>
        <p id="profile_introduction" name="expert.profile">${expert.profile}</p>
      </a></li>
      <li><a class="toTextarea" href="#page3" data-rel="dialog">
        <h3>教育背景</h3>
        <p id="profile_education" name="expert.education">${expert.education}</p>
      </a></li>
      <li><a class="toProject" href="#page6" data-rel="dialog">
        <h3>感兴趣的咨询项目类型</h3>
        <p id="business">行业：???</p>
        <p id="job">领域：???</p>
        <p id="money">项目预算：???</p>
      </a></li>
      <li><a class="toPrivate" href="#page7" data-rel="dialog">
        <h3>隐私度</h3>
        <p profile_private>???</p>
      </a></li>
    </ul>
    <input type="submit" value="提交">
    <!--  <a id="submit" href="#" data-role="button">提交</a>-->
        
  </div>
</div>
</form>
<div data-role="page" id="page2">
  <div class="header" data-role="none">
    <h1 class="textheader">标题</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
      <label for="ChangeContent" class="ui-hidden-accessible">文本输入:</label>
      <input type="text" name="ChangeContentInput" id="ChangeContent" value=""/>
    </div>  
  </div>
  <div data-role="footer">
  	<a class="suretext" href="#" data-role="button">确定</a>    
  </div>
</div>

<div data-role="page" id="page3">
  <div class="header" data-role="none">
    <h1 class="areaheader">标题</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
      <label for="ChangeArea" class="ui-hidden-accessible">文本区域:</label>
      <textarea cols="40" rows="8" name="ChangeAreaInput" id="ChangeArea"></textarea>
    </div>
  </div>
  <div data-role="footer">
  	<a class="surearea" href="#" data-role="button">确定</a>    
  </div>
</div>

<div data-role="page" id="page4">
  <div class="header" data-role="none">
    <h1>所属行业</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
    	<label for="BusinessSelect" class="select" class="ui-hidden-accessible">所属行业:</label>
        <select name="BusinessSelectMenu" id="BusinessSelect">
        	<option id="b_0" value="0">IT|通信|电子|互联网</option>
            <option id="b_1" value="1">金融业</option>
            <option id="b_2" value="2">房地产|建筑业</option>
            <option id="b_3" value="3">商业服务</option>
            <option id="b_4" value="4">贸易|批发|零售|租赁业</option>
            <option id="b_5" value="5">文教体育|工业美术</option>
            <option id="b_6" value="6">生产|加工|制造</option>
            <option id="b_7" value="7">交通|运输|物流|仓储</option>
            <option id="b_8" value="8">服务业</option>
            <option id="b_9" value="9">文化|传媒|娱乐|体育</option>
            <option id="b_10" value="10">能源|矿产|环保</option>
            <option id="b_11" value="11">政府|非盈利机构</option>
            <option id="b_12" value="12">农|林|牧|渔|其他</option>
        </select>
    </div>  
  </div>
  <div data-role="footer">
  	<a class="surebusiness" href="#" data-role="button">确定</a>    
  </div>
</div>

<div data-role="page" id="page5">
  <div class="header" data-role="none">
    <h1>专长领域</h1>
  </div>
  <div data-role="content">
  	<div data-role="fieldcontain">
    	<label for="JobSelect" class="select" class="ui-hidden-accessible">专长领域:</label>
        <select name="JobSelectMenu" id="JobSelect">
        	<option id="j_0" value="0">销售|客服|市场</option>
            <option id="j_1" value="1">财务|人力资源|行政</option>
            <option id="j_2" value="2">项目|质量|高级管理</option>
            <option id="j_3" value="3">IT|互联网|通信</option>
            <option id="j_4" value="4">房产|建筑|物业管理</option>
            <option id="j_5" value="5">金融</option>
            <option id="j_6" value="6">采购|贸易|交通|物流</option>
            <option id="j_7" value="7">生产|制造</option>
            <option id="j_8" value="8">传媒|印刷|艺术|设计</option>
            <option id="j_9" value="9">咨询|法律|教育|翻译</option>
            <option id="j_10" value="10">服务业</option>
            <option id="j_11" value="11">能源|环保|农业|科研</option>
            <option id="j_12" value="12">兼职|实习|社工|其他</option>
        </select>
	</div>
  </div>
  <div data-role="footer">
  	<a class="surejob" href="#" data-role="button">确定</a>    
  </div>
</div>
<div data-role="page" id="page6">
  <div class="header" data-role="none">
    <h1>感兴趣的咨询项目类型</h1>
  </div>
  <div data-role="content">
  	<div data-role="fieldcontain">
    	<label for="ProjectBSelect" class="select">行业:</label>
        <select name="ProjectBSelectMenu" id="ProjectBSelect">
        	<option id="pb_0" value="0">计算机</option>
            <option id="pb_1" value="1">dd</option>
            <option id="pb_2" value="2">yyy</option>
        </select>
     </div>
     
     <div data-role="fieldcontain">
    	<label for="ProjectJSelect" class="select">领域:</label>
        <select name="ProjectSelectMenu" id="ProjectJSelect">
        	<option id="pj_0" value="0">计算机</option>
            <option id="pj_1" value="1">dd</option>
            <option id="pj_2" value="2">yyy</option>
        </select>
     </div>
     
       	<div data-role="fieldcontain">
    	<label for="ProjectMSelect" class="select">项目预算:</label>
        <select name="ProjectMSelectMenu" id="ProjectMSelect">
        	<option id="pm_0" value="0">0~1000</option>
            <option id="pm_1" value="1">1000~2000</option>
            <option id="pm_2" value="2">2000以上</option>
        </select>
     </div>
  </div>
  <div data-role="footer">
  	<a class="sureProject" href="#" data-role="button">确定</a>    
  </div>
</div>

<div data-role="page" id="page7">
  <div class="header" data-role="none">
    <h1>资料隐私度</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
      <label for="PrivateSelect" class="select" class="ui-hidden-accessible">资料隐私度:</label>
      <select name="PrivateSelectMenu" id="PrivateSelect">
        <option id="y_0" value="0">公开</option>
        <option id="y_1" value="1">只公开部分信息</option>
        <option id="y_2" value="2">完全不公开</option>
      </select>
    </div>
  </div>
  <div data-role="footer">
  	<a class="surePrivate" href="#" data-role="button">确定</a>    
  </div>
</div>

<script type="text/javascript">
	var content;
	var which;
	var business, job, private;
	var  project = new Array(3);
	$(".toInput").click(function(e) {
		which = this;
		var headername = $(this).children("h3").text();
		$(".textheader").text(headername);
		$("#ChangeContent").val($(this).children("p").text());
    });
	
	$(".toTextarea").click(function(e) {
		which = this;
		var headername = $(this).children("h3").text();
		$(".areaheader").text(headername);
		$("#ChangeArea").val($(this).children("p").text());
    });
	
	$(".toBusiness").click(function(e) {
        which = this;
    });
	
	$(".toJob").click(function(e) {
        which = this;
    });
	
	$(".toProject").click(function(e) {
        which = this;
    });
	
	$(".toPrivate").click(function(e) {
        which = this;
    });
	
	$(".suretext").click(function(e) {		
		content = $("#ChangeContent").val();
		$(which).children("p").text(content);
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$(".surearea").click(function(e) {		
		content = $("#ChangeArea").val();
		$(which).children("p").text(content);
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$(".surebusiness").click(function(e) {		
		content = $("#BusinessSelect").val();
		var listcontent = $("#b_"+content).text();
		$(which).children("p").text(listcontent);
		business = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$(".surejob").click(function(e) {		
		content = $("#JobSelect").val();
		var listcontent = $("#j_"+content).text();
		$(which).children("p").text(listcontent);
		job = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$(".sureProject").click(function(e) {		
		content = $("#ProjectBSelect").val();
		var listcontent = "行业：" + $("#pb_"+content).text();
		$(which).children("p#business").text(listcontent);
		project[0] = listcontent;
		content = $("#ProjectJSelect").val();
		listcontent = "领域：" + $("#pj_"+content).text();
		$(which).children("p#job").text(listcontent);
		project[1] = listcontent;
		content = $("#ProjectMSelect").val();
		listcontent = "项目预算：" + $("#pm_"+content).text();
		$(which).children("p#money").text(listcontent);
		project[2] = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$(".surePrivate").click(function(e) {		
		content = $("#PrivateSelect").val();
		var listcontent = $("#y_"+content).text();
		$(which).children("p").text(listcontent);
		private = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	/*
	$("#submit").click(function(e) {
		var name = $("#profile_name").text();
		var phone = $("#profile_phone").text();
		var year = $("#profile_year").text();
		var introduction = $("#profile_introduction").text();
		var education = $("#profile_education").text();
		var profile=new Array(name,phone,business,job,year,introduction,education,project,private);
		$("#submit").click(function(){
    		$.post("../expert_center",profile,function(data,status){
      			alert("提交成功！");
    		});
  		});
    });*/
</script>
</body>
</html>