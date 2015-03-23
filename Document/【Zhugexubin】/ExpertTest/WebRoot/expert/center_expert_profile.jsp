<%@ page language="java" import="java.util.*,com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
  
  <div data-role="content">
    <ul data-role="listview" data-inset="true">
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
        <s:set var="businessid" value="expert.evocation"/>
        <p id="profile_business">${businessList[businessid]}</p>
      </a></li>
      <li><a class="toJob" href="#page5" data-rel="dialog">
        <h3>专长领域</h3>
        <s:set var="jobid" value="expert.edomain"/>
        <p id="profile_job" name="">${jobList[jobid]}</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>入行年数</h3>
        <p id="profile_year" name="expert.eyears">${expert.eyears}</p>
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
        <p id="business">行业：${businessList[businessid]}</p>
        <p id="job">领域：${jobList[jobid]}</p>
        <s:set var="budgetid" value="expert.interest"/>
        <p id="money">项目预算：${budgetList[budgetid]}</p>
      </a></li>
      <li><a class="toPrivate" href="#page7" data-rel="dialog">
        <h3>隐私度</h3>
        <s:set var="privacyid" value="expert.privacy"/>
        <p profile_private>${privacyList[privacyid]}</p>
      </a></li>
    </ul>
    <a id="submit" href="#" data-role="button">提交</a>
        
  </div>
</div>
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
        <s:iterator value="businessList" status="i">
			<option id="b_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.evocation">selected="selected"</s:if>>
				${businessList[i.count-1]}
			</option>
		</s:iterator>
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
  <div data-role="content" >
  	<div data-role="fieldcontain">
    	<label for="JobSelect">专长领域:</label>
		<select class="combox" id="JobSelect">
		<s:iterator value="jobList" status="i">
			<option id="j_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.edomain">selected="selected"</s:if>>
				${jobList[i.count-1]}
			</option>
		</s:iterator>
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
        <s:iterator value="businessList" status="i">
			<option id="pb_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.evocation">selected="selected"</s:if>>
				${businessList[i.count-1]}
			</option>
		</s:iterator>
        </select>
     </div>
     
     <div data-role="fieldcontain">
    	<label for="ProjectJSelect" class="select">领域:</label>
        <select name="ProjectSelectMenu" id="ProjectJSelect">
        <s:iterator value="jobList" status="i">
			<option id="pj_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.edomain">selected="selected"</s:if>>
				${jobList[i.count-1]}
			</option>
		</s:iterator>
        </select>
     </div>
     
       	<div data-role="fieldcontain">
    	<label for="ProjectMSelect" class="select">项目预算:</label>
        <select name="ProjectMSelectMenu" id="ProjectMSelect">
        <s:iterator value="budgetList" status="i">
			<option id="pm_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.interest">selected="selected"</s:if>>
				${budgetList[i.count-1]}
			</option>
		</s:iterator>
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
        <s:iterator value="privacyList" status="i">
			<option id="y_${i.count-1}" value="${i.count-1}"
				<s:if test="#i.count-1==expert.privacy">selected="selected"</s:if>>
				${privacyList[i.count-1]}
			</option>
		</s:iterator>
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
	
	$("#submit").click(function(e) {
		var name = $("#profile_name").text();
		var phone = $("#profile_phone").text();
		var business = $("#BusinessSelect").val();
		var job = $("#JobSelect").val();
		var year = $("#profile_year").text();
		var introduction = $("#profile_introduction").text();
		var education = $("#profile_education").text();
		var interest = $("#ProjectMSelect").val();
		alert(name+","+phone+","+business+","+job+","+year+","+introduction+","+education)
		var profile= {
			"name":name,
			"phone":phone,
			"business":business,
			"job":job,
			"years":year,
			"introduction":introduction,
			"education":education,
			"interest":interest 
		};
	
    	$.post("../expert/expert_saveProfile.action",profile,function(data,status){
      		alert(data);
      		location.href="<%=basePath%>expert/expert_initProfile.action";
    	});
    });
</script>
</body>
</html>