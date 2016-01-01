<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//从servlet获取项目数据
	//ArrayList list = (ArrayList)request.getAttribute("xxx");
%>	
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
    <link rel="stylesheet" href="<%=basePath%>css/profile.css"/>
	<link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.core.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.mode.datebox.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/regist_validate.js"></script>
</head>

<body>
<div data-role="page" id="page1">
  
  <div class="header" data-role="none">
  	<h1 class="title_nobtn">发布项目</h1>
  </div>
  
  <div data-role="content">
    <ul data-role="none">    
       	<div class="profile_field">
        	<div class="profile_class">项目名称</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="project_name"></p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

       	<div class="profile_field">
        	<div class="profile_class">项目标签（请用分号;隔开）</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="project_key"></p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

       	<div class="profile_field">
        	<div class="profile_class">截止时间</div>
            <a class="toTime" href="#page4" data-rel="dialog">            	
       			<p class="profile_font" id="project_deadline"></p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

       	<div class="profile_field">
        	<div class="profile_class">项目预算</div>
            <a class="toInput" href="#page2" data-rel="dialog">            	
       			<p class="profile_font" id="project_money"></p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

       	<div class="profile_field">
        	<div class="profile_class">项目详情</div>
            <a class="toTextarea" href="#page3" data-rel="dialog">            	
       			<p class="profile_font" id="project_detail"></p>
                <img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      		</a>
            <div class="clear"></div>
        </div>

    </ul>
    <div class="btn_blue">
  		<button id="submit" class="btn_word" data-role="none">发布</button>
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
    <h1>标题</h1>
  </div>
  <div data-role="content">
  	<div class="ui-field-contain">
    	<label for="mode2">DateBox</label>
        <input name="mode2" id="mode2" type="text" data-role="datebox" data-options='{"mode":"datebox"}' />
    </div>
    <div class="btn_blue">
  		<button id="suretime" class="btn_word" data-role="none">确定</button>
  	</div>
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
	
	$(".toTime").click(function(e) {
        which = this;
		var headername = $(this).parent(".profile_field").children(".profile_class").text();
		$(".areaheader").text(headername);
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
	
	$("#suretime").click(function(e) {
        content = $("#mode2").val();
		$(which).children("p").text(content);
		$('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#submit").click(function(e) {
		if(isNull($("#project_name").text())) {
			e.preventDefault();
			alert("项目名称不能为空");
			return;
		}else if(isNull($("#project_deadline").text())) {
			e.preventDefault();
			alert("截止时间不能为空");
			return;
		}else if(isNull($("#project_money").text())) {
			e.preventDefault();
			alert("项目预算不能为空");
			return;
		}else if(!isInt($("#project_money").text())) {
			e.preventDefault();
			alert("预算格式不合法，请输入正整数");
			return;
		}
		var name = $("#project_name").text();
		var key = $("#project_key").text();
		var deadline = $("#project_deadline").text();
		var money= $("#project_money").text();
		var detail = $("#project_detail").text();
		alert(name+","+key+","+deadline+","+money+","+detail);
		var project={
				"name":name,
				"tag":key,
				"deadline":deadline,
				"money":money,
				"detail":detail
		};
		
    	$.post("../project/project_createProject.action",project,function(data,status){
      			alert(data);
      			location.href="../project/project_searchBprojects.action";
    		});
    	
  		});

</script>
</body>
</html>