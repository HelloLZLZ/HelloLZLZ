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
    <link rel="stylesheet" href="<%=basePath%>css/profile.css" />
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
    <h1 class="title_nobtn">个人资料</h1>
  </div>
  
  <div data-role="content">
    <ul data-role="none" data-role="none">
       	<div class="profile_field">
        	<div class="profile_class">真实姓名</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="profile_name" name="expert.name">${expert.name}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">手机号码</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="profile_phone" name="expert.phone">${expert.phone}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">所属行业</div>
            <a class="toBusiness" href="#page4" data-rel="dialog">
            	<s:set var="businessid" value="expert.evocation"/>          	
       			<p class="profile_font" id="profile_business">${businessList[businessid-1]}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">专长领域</div>
            <a class="toJob" href="#page5" data-rel="dialog">
            	<s:set var="jobid" value="expert.edomain"/>         	
       			<p class="profile_font" id="profile_job" name="">${jobList[jobid-1]}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">入行年数</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="profile_year" name="expert.eyears">${expert.eyears}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">个人简介</div>
            <a class="toTextarea" href="#page3" data-rel="dialog">            	
       			<p class="profile_font" id="profile_introduction" name="expert.profile">${expert.profile}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">教育背景</div>
            <a class="toTextarea" href="#page3" data-rel="dialog">            	
       			<p class="profile_font" id="profile_education" name="expert.education">${expert.education}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">感兴趣的咨询项目类型</div>
            <a class="toProject" href="#page6" data-rel="dialog">            	
       			<p class="profile_font" id="business">行业：${businessList[businessid]}</p>
                <p class="profile_font" id="job">领域：${jobList[jobid]}</p>
        		<s:set var="budgetid" value="expert.interest"/>
        		<p class="profile_font" id="money">预算：${budgetList[budgetid]}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>
        
        <div class="profile_field">
        	<div class="profile_class">隐私度</div>
            <a class="toPrivate" href="#page7" data-rel="dialog">
            	<s:set var="privacyid" value="expert.privacy"/>           	
       			<p class="profile_font" id="profile_private">${privacyList[privacyid]}</p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

    </ul>
    <div class="btn_green">
  		<button id="submit" class="btn_word" data-role="none">提交</button>
  	</div> 
	<div class="btn_blue">
		<button data-role="none" id="cancel" type="button" onclick="history.go(-1)" class="btn_word">取消</button>
	</div>
        
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
    <div class="btn_blue">
  		<button id="suretext" class="btn_word" data-role="none">确定</button>
  	</div> 
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
    <div class="btn_blue">
  		<button id="surearea" class="btn_word" data-role="none">确定</button>
  	</div>
  </div>

</div>
<div data-role="page" id="page4">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">所属行业</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
    	<label for="BusinessSelect" class="select" class="ui-hidden-accessible">所属行业:</label>
        <select name="BusinessSelectMenu" id="BusinessSelect">
        <s:iterator value="businessList" status="i">
			<option id="b_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.evocation">selected="selected"</s:if>>
				${businessList[i.count-1]}
			</option>
		</s:iterator>
        </select>
    </div>   
    <div class="btn_blue">
  		<button id="surebusiness" class="btn_word" data-role="none">确定</button>
  	</div>   
  </div>
</div>


<div data-role="page" id="page5">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">专长领域</h1>
  </div>
  <div data-role="content" >
  	<div data-role="fieldcontain">
    	<label for="JobSelect">专长领域:</label>
		<select class="combox" id="JobSelect">
		<s:iterator value="jobList" status="i">
			<option id="j_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.edomain">selected="selected"</s:if>>
				${jobList[i.count-1]}
			</option>
		</s:iterator>
		</select>
	</div>    
    <div class="btn_blue">
  		<button id="surejob" class="btn_word" data-role="none">确定</button>
  	</div>  
  </div>
</div>

<div data-role="page" id="page6">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">感兴趣的咨询项目类型</h1>
  </div>
  <div data-role="content">
  	<div data-role="fieldcontain">
    	<label for="ProjectBSelect" class="select">行业:</label>
        <select name="ProjectBSelectMenu" id="ProjectBSelect">
        <s:iterator value="businessList" status="i">
			<option id="pb_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.evocation">selected="selected"</s:if>>
				${businessList[i.count-1]}
			</option>
		</s:iterator>
        </select>
     </div>
     
     <div data-role="fieldcontain">
    	<label for="ProjectJSelect" class="select">领域:</label>
        <select name="ProjectSelectMenu" id="ProjectJSelect">
        <s:iterator value="jobList" status="i">
			<option id="pj_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.edomain">selected="selected"</s:if>>
				${jobList[i.count-1]}
			</option>
		</s:iterator>
        </select>
     </div>
     
       	<div data-role="fieldcontain">
    	<label for="ProjectMSelect" class="select">项目预算:</label>
        <select name="ProjectMSelectMenu" id="ProjectMSelect">
        <s:iterator value="budgetList" status="i">
			<option id="pm_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.interest">selected="selected"</s:if>>
				${budgetList[i.count-1]}
			</option>
		</s:iterator>
        </select>
     </div>    
     <div class="btn_blue">
  		<button id="sureProject" class="btn_word" data-role="none">确定</button>
  	</div> 
  </div>
</div>

<div data-role="page" id="page7">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">资料隐私度</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
      <label for="PrivateSelect" class="select" class="ui-hidden-accessible">资料隐私度:</label>
      <select name="PrivateSelectMenu" id="PrivateSelect">
        <s:iterator value="privacyList" status="i">
			<option id="y_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.privacy">selected="selected"</s:if>>
				${privacyList[i.count-1]}
			</option>
		</s:iterator>
      </select>
    </div>    
    <div class="btn_blue">
  		<button id="surePrivate" class="btn_word" data-role="none">确定</button>
  	</div>
  </div>


<script type="text/javascript">
	var content;
	var which;
	var business, job, private;
	var  project = new Array(3);
	$(".toInput").click(function(e) {
		which = this;
		var headername = $(this).parent(".profile_field").children(".profile_class").text();
		$(".textheader").text(headername);
		$("#ChangeContent").val($(this).children("p").text());
    });
	
	$(".toTextarea").click(function(e) {
		which = this;
		var headername = $(this).parent(".profile_field").children(".profile_class").text();
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
	
	$("#suretext").click(function(e) {		
		content = $("#ChangeContent").val();
		$(which).children("p").text(content);
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#surearea").click(function(e) {		
		content = $("#ChangeArea").val();
		$(which).children("p").text(content);
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#surebusiness").click(function(e) {		
		content = $("#BusinessSelect").val();
		var listcontent = $("#b_"+content).text();
		$(which).children("p").text(listcontent);
		business = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#surejob").click(function(e) {		
		content = $("#JobSelect").val();
		var listcontent = $("#j_"+content).text();
		$(which).children("p").text(listcontent);
		job = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#sureProject").click(function(e) {		
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
	
	$("#surePrivate").click(function(e) {		
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
</div>
</body>
</html>