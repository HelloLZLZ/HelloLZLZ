<%@ page language="java" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<%=basePath%>css/expert.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/searchbox.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />  
  
</head>

<body>
<div data-role="page" id="page">
  <div class="header" data-role="none">
    <h1 class="title_nobtn">专家列表</h1>
    <div class="ui-btn-right">搜索</div>
  </div>
  <div data-role="content">
  
  	<div class="searchbox" style="display: none;">
        <div class="searchtitle">搜索条件</div>
        
       <!--  <form method="post" action="<%=basePath%>expert/expert_searchExpert.action"> -->
    	<div class="searchbox_line">
        	<div class="tip">所属行业：</div>
        	<select  data-role="none" class="list" name="expert.evocation" id="BusinessSelect">
       		<s:iterator value="businessList" status="i">
			<option id="b_${i.count}" value="${i.count}"
				<s:if test="#i.count==expert.evocation">selected="selected"</s:if>>
				${businessList[i.count-1]}
			</option>
			</s:iterator>
	        </select>
        	     
        </div>
        <div class="searchbox_line">
        	<div class="tip">专长领域：</div>
        	<select data-role="none" class="list" name="expert.edomain"  id="JobSelect">
			<s:iterator value="jobList" status="i">
				<option id="j_${i.count}" value="${i.count}"
					<s:if test="#i.count==expert.edomain">selected="selected"</s:if>>
					${jobList[i.count-1]}
				</option>
			</s:iterator>
			</select>
            
        </div>
        <div class="searchbox_line">
        	<div class="tip">行业经验：</div>
            <select data-role="none" class="list" name="selectmenu" id="JobExperience">
        		<option value="option1">0~5年</option>
        		<option value="option2">5~10年</option>
        		<option value="option3">10~20年</option>
      		</select>
        </div>
        <div class="searchbox_line">
        	<div class="tip">评价星级：</div>
            <select data-role="none" class="list" name="selectmenu" id="StarSelect">
        		<option value="option1">1星</option>
        		<option value="option2">2星</option>
        		<option value="option3">3星</option>
      		</select>
        </div>
        <div class="search_btn">
    		<input id="search" type="submit" value="搜索" class="search_word" data-role="none"/>
    	</div>
        
        <!-- </form> -->
		<div class="clear"></div>
    </div>

	<s:iterator value="targetList" status="st">
  	<div class="expert-item" data-id="${eid}">
    	<div class="expert-portait">
        	<img src=<s:if test="photo==null || photo==''">
        		"<%=basePath%>resource/img/default.jpg"
			</s:if>
			<s:else>
				"<%=basePath%>resource/UploadImages/${photo}"
			</s:else> />

            <div class="little-item">
            	<div class="item-up">项目：<span>120</span></div>
                <div class="item-down">评价：<span class="evaluate">4.5</span>/5</div>
            </div>
    	</div>
        
        <div class="expert-body">
	        	<div class="expert-line name">${name}</div>
	            <div class="expert-line job">${eyears}</div>
	            <div class="expert-line company">${education}</div>
				<div class="expert-line">${phone}</div>
	            <div class="clear"></div>
		</div>
	</div>
	</s:iterator>

	<div class="footer" data-role="none">
    	<div class="footer_home" style="background:#09C">
        <p class="footer_font" data-icon="home">首页</p>
        </div>
        <div class="footer_center">个人</div>
    	<div class="footer_project">项目</div>
  </div>
  </div>
<script type="text/javascript">
	$(document).ready(function(){
 		$(".ui-btn-right").click(function(){
   			$(".searchbox").fadeToggle();
		});
	});
	$("#search").click(function(e) {
	
        var bid = $("#BusinessSelect").val();
        var jid = $("#JobSelect").val();
        var jexp = $("#JobExperience").val();
        
        
		location.href = "<%=basePath%>expert/expert_searchExpert.action?bid="+bid+"&jid="+jid+"&jexp="+jexp;
    });
	$(".expert-item").click(function(e) {
        var eid = $(this).attr("data-id");
		location.href = "<%=basePath%>expert/expert_getDExpert.action?eid="+eid;
    });
    
    $(".footer_home").click(function(e) {
        window.location.href = "<%=basePath%>business/company_home.jsp";
    });
	
	$(".footer_center").click(function(e) {
        window.location.href = "<%=basePath%>business/business_initProfile.action";
    });

	$(".footer_project").click(function(e) {
        window.location.href = "<%=basePath%>project/project_searchBprojects.action";
    });
</script>	
</div>
</body>

</html>