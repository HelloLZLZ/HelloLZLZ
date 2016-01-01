<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="<%=basePath%>css/project.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/searchbox.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.core.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jqm-datebox-1.4.5.mode.datebox.min.js"></script>
    
    <script type="text/javascript">
	$(document).ready(function(){
 		$(".ui-btn-right").click(function(){
   			$(".searchbox").fadeToggle();
		});
	});
	</script>
    	
    <style type="text/css">
		.project_item_blue {
			border:1px solid #09C;
			margin:0px;
			min-height:30px;
		}
    </style>
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">项目列表</h1>
    <div class="ui-btn-right">搜索</div>
  </div>
  
  <div data-role="content">
  <div class="searchbox" style="display: none;">
  	<div class="searchtitle">搜索条件</div>
        <%-- <form method="post" action="<%=basePath%>project/project_getSearchProjects.action"> --%>
    	<div class="searchbox_line">
        	<div class="tip">所属行业：</div>
            <select data-role="none" class="list" name="selectmenu" id="BusinessSelect">
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
					<option value="12">农|林|牧|渔|其他</option>
      		</select>
        </div>
        <div class="searchbox_line">
        	<div class="tip">项目预算：</div>
            <select data-role="none" class="list" name="selectmenu" id="MoneySelect">
        		<option value="option1">0-50</option>
        		<option value="option2">50-100</option>
        		<option value="option3">100以上</option>
      		</select>
        </div>
        <div class="searchbox_line">
        	<div class="tip">发布时间：</div>
            <div class="input">
            	<a class="toTime" href="#page1" data-rel="dialog">
        			<p id="project_begintime" class="range_time"></p>
      			</a>
            </div>
            <div class="mark_line">-</div>
            <div class="input">
            	<a class="toTime" href="#page2" data-rel="dialog">
        			<p id="project_endtime" class="range_time"></p>
      			</a>
            </div>
        </div>
        <div class="search_btn">
    		<input  id="search" type="submit" value="搜索" class="search_word" data-role="none"/>
    	</div>
        
        </form>
		<div class="clear"></div>
    </div>
  
  
	<s:iterator value="targetList" status="st">
  	<div class="project_item_blue" data-id="${pid}" onClick="getId(this)">
            	<div class="project_name_blue">${pname}</div>
                <div class="project_line">
                	<div class='company'>${business.bname}</div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="reply_star">评价：<span class="evaluate">4</span>/5</div>
                	<div class='price'>¥:&nbsp;<span class='price_text'>${budget}</span></div>
                	<div class="clear"></div>
            	</div>
                <div class="project_line">
                	<div class="begin_time_number">发布:${starttime}</div>
                	<div class="deadline_time_number">截止:${deadline}</div>
                    <div class="clear"></div>
            	</div>
                <div class="brief">简介：${pdescrpt}<div class="clear"></div></div>
                <div class="clear"></div>
        	</div>
   </s:iterator>
  </div>
  <div class="footer" data-role="none">
    	<div class="footer_home" style="background:#09C">
        <p class="footer_font" data-icon="home">首页</p>
        </div>
        <div class="footer_center">个人</div>
    	<div class="footer_project">项目</div>
  </div>
</div>


<div data-role="page" id="page1">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">时间范围</h1>
  </div>
  <div data-role="content">

    <input name="mode2" id="begin" type="text" data-role="datebox" data-options='{"mode":"datebox"}' />

    <div class="search_btn">
  		<button id="suretime_begin" class="search_word" data-role="none">确定</button>
  	</div>
  </div>
  
</div>

<div data-role="page" id="page2">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">时间范围</h1>
  </div>
  <div data-role="content">

    <input name="mode2" id="end" type="text" data-role="datebox" data-options='{"mode":"datebox"}' />

    <div class="search_btn">
  		<button id="suretime_end" class="search_word" data-role="none">确定</button>
  	</div>
  </div>
  
</div>

<script type="text/javascript">
	$(".project_item_blue").click(function(e) {
        var project_id = $(this).attr("data-id");
		//location.href = "../project/project_getBProject.action?project="+project_id;
		location.href="<%=basePath%>project/project_getBProject.action?project_id="+project_id;

    });
	
	$("#suretime_begin").click(function(e) {
        content = $("#begin").val();
		$("#project_begintime").text(content);
		$('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#suretime_end").click(function(e) {
        content = $("#end").val();
		$("#project_endtime").text(content);
		$('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#search").click(function(e) {
		
        var vid = $("#BusinessSelect").val();
        var mid = $("#MoneySelect").val();
        var start=$("#begin").val();
        var end=$("#end").val();
		location.href = "<%=basePath%>project/project_getSearchProjects.action?vid="+vid+"&mid="+mid+"&start="+start+"&end="+end;
    });
    
    $(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_home.jsp";
    });
	
	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_getProjects.action";
    });

	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>expert/expert_initProfile.action";
    });
</script>
</body>

</html>