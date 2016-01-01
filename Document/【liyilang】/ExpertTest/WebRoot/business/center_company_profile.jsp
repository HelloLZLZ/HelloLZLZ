<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,com.opensymphony.xwork2.ActionContext" errorPage="" %>
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
    <link rel="stylesheet" href="<%=basePath%>css/profile.css" />
    <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
	<link rel="stylesheet" href="<%=basePath%>js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
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
    <h1 class="title_nobtn">企业资料</h1>
  </div>
  
  <div data-role="content">
    <ul data-role="none">
    	<div class="profile_field">
			<div class="profile_class">企业名称</div>
           		<a class="toInput" href="#page2" data-rel="dialog">            	
       				<p class="profile_font" id="profile_name">${business.bname}</p>
               		<img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      			</a>
           	<div class="clear"></div>
       	</div>
        
    	<div class="profile_field">
			<div class="profile_class">联系电话</div>
           		<a class="toInput" href="#page2" data-rel="dialog">            	
       				<p class="profile_font" id="profile_phone">${business.btel}</p>
               		<img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      			</a>
           	<div class="clear"></div>
       	</div>
        
    	<div class="profile_field">
			<div class="profile_class">所属行业</div>
           		<a class="toBusiness" href="#page4" data-rel="dialog"> 
                	<s:set var="businessid" value="business.bvocation"/>           	
       				<p class="profile_font" id="profile_business">${businessList[businessid]}</p>
               		<img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      			</a>
           	<div class="clear"></div>
       	</div>
        
    	<div class="profile_field">
			<div class="profile_class">企业网站域名</div>
           		<a class="toInput" href="#page2" data-rel="dialog">        	
       				<p class="profile_font" id="profile_website">${business.bnet}</p>
               		<img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      			</a>
           	<div class="clear"></div>
       	</div>
        
    	<div class="profile_field">
			<div class="profile_class">企业简介</div>
           		<a class="toTextarea" href="#page3" data-rel="dialog">            	
       				<p class="profile_font" id="profile_introduction">${business.bsummary}</p>
               		<img class="pen" src="<%=basePath%>resource/img/profile.png" alt="修改" />
      			</a>
           	<div class="clear"></div>
       	</div>
    </ul>
    <div class="btn_green">
  		<button id="submit" class="btn_word" data-role="none">提交</button>
  	</div> 
    <div class="btn_blue">
		<button data-role="none" id="cancel" type="button" onclick="history.go(-1)" class="btn_word">返回</button>
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
    <h1>所属行业</h1>
  </div>
  <div data-role="content">
    <div data-role="fieldcontain">
    	<label for="BusinessSelect" class="select" class="ui-hidden-accessible">所属行业:</label>
        <select name="BusinessSelectMenu" id="BusinessSelect">
        	<!-- <option id="b_0" value="b_0">IT|通信|电子|互联网</option>
            <option id="b_1" value="b_1">金融业</option>
            <option id="b_2" value="b_2">房地产|建筑业</option>
            <option id="b_3" value="b_3">商业服务</option>
            <option id="b_4" value="b_4">贸易|批发|零售|租赁业</option>
            <option id="b_5" value="b_5">文教体育|工业美术</option>
            <option id="b_6" value="b_6">生产|加工|制造</option>
            <option id="b_7" value="b_7">交通|运输|物流|仓储</option>
            <option id="b_8" value="b_8">服务业</option>
            <option id="b_9" value="b_9">文化|传媒|娱乐|体育</option>
            <option id="b_10" value="b_10">能源|矿产|环保</option>
            <option id="b_11" value="b_11">政府|非盈利机构</option>
            <option id="b_12" value="b_12">农|林|牧|渔|其他</option> -->
        <s:iterator value="businessList" status="i">
				<option id="b_${i.count-1}" value="${i.count-1}"
					<s:if test="#i.count-1==business.bvocation">selected="selected"</s:if>>
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

<script type="text/javascript">
	var content;
	var which;
	var business, job, private;
	var  project = new Array(3);
	$(".toInput").click(function(e) {
		which = this;
		var headername =  $(this).parent(".profile_field").children(".profile_class").text();
		$(".textheader").text(headername);
		$("#ChangeContent").val($(this).children("p").text());
    });
	
	$(".toTextarea").click(function(e) {
		which = this;
		var headername =  $(this).parent(".profile_field").children(".profile_class").text();
		$(".areaheader").text(headername);
		$("#ChangeArea").val("");
		$("#ChangeArea").val($(this).children("p").text());
    });
	
	$(".toBusiness").click(function(e) {
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
		var listcontent = $("#"+content).text();
		$(which).children("p").text(listcontent);
		business = listcontent;
        $('.ui-dialog').dialog('close'); 
		return false;
    });
	
	$("#submit").click(function(e) {
		var name = $("#profile_name").text();
		var phone = $("#profile_phone").text();
		var website = $("#profile_website").text();
		var business = $("#BusinessSelect").val();
		var introduction = $("#profile_introduction").text();
		alert(name+","+phone+","+website+","+introduction+","+business)
		var profile={
			"name":name,
			"phone":phone,
			"business":business,
			"website":website,
			"introduction":introduction
		};
	     $.post("../business/business_saveProfile.action",profile,function(data,status){
	    	alert(data);
	    	location.href="<%=basePath%>business/business_initProfile.action";
	     });
		

    });
</script>
</body>
</html>