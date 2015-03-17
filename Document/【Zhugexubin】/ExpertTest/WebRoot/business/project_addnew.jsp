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
	 <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.core.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.mode.datebox.min.js"></script>
</head>

<body>
<div data-role="page" id="page1">
  
  <div class="header" data-role="none">
  	<h1>发布项目</h1>
  </div>
  
  <div data-role="content">
    <ul data-role="listview" data-inset="true">
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>项目名称</h3>
        <p id="project_name">???</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>项目标签（请用分号;隔开）</h3>
        <p id="project_key">???</p>
      </a></li>
      <li><a class="toTime" href="#page4" data-rel="dialog">
        <h3>截止时间</h3>
        <p id="project_deadline">???</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>项目预算</h3>
        <p id="project_money">???</p>
      </a></li>
      <li><a class="toTextarea" href="#page3" data-rel="dialog">
        <h3>项目详情</h3>
        <p id="project_detail">???</p>
      </a></li>
    </ul>
    <a id="submit" href="#" data-role="button">发布</a>
        
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
    <h1>标题</h1>
  </div>
  <div data-role="content">
  	<div class="ui-field-contain">
    	<label for="mode2">DateBox</label>
        <input name="mode2" id="mode2" type="text" data-role="datebox" data-options='{"mode":"datebox"}' />
    </div>
  </div>
  <div data-role="footer">
  	<a class="suretime" href="#" data-role="button">确定</a>    
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
	
	$(".toTime").click(function(e) {
        which = this;
		var headername = $(this).children("h3").text();
		$(".areaheader").text(headername);
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
	
	$(".suretime").click(function(e) {
        content = $("#mode2").val();
		$(which).children("p").text(content);
		$('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#submit").click(function(e) {
		var name = $("#project_name").text();
		var key = $("#project_key").text();
		var deadline = $("#project_deadline").text();
		var money= $("#project_money").text();
		var detail = $("#project_detail").text();
		var project = new Array(name,key, deadline, money, detail);
		$("#submit").click(function(){
    		$.post("???",project,function(data,status){
      			alert("提交成功！");
    		});
  		});
    });
</script>
</body>
</html>