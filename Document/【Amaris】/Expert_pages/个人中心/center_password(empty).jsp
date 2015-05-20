<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
//从servlet获取项目数据
	ArrayList list = (ArrayList)request.getAttribute("xxx");
%>	
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content=" initial-scale=1.0,user-scalable=no" />
	<title>专家汇</title>
	<link rel="stylesheet" href="jquery/mobile/jquery.mobile-1.4.5.min.css" />
    <link rel="stylesheet" href="theme.css"/>
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="jquery/mobile/jquery.mobile-1.4.5.min.js"></script>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />	
    
    <style type="text/css">
	</style>
</head>

<body>
<div data-role="page" id="page1">
  
  <div class="header" data-role="none">
    <h1>企业资料</h1>
  </div>
  
  <div data-role="content">
    <ul data-role="listview" data-inset="true">
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>企业名称</h3>
        <p id="profile_name">???</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>联系电话</h3>
        <p id="profile_phone">???</p>
      </a></li>
      <li><a class="toBusiness" href="#page4" data-rel="dialog">
        <h3>所属行业</h3>
        <p id="profile_business">???</p>
      </a></li>
      <li><a class="toInput" href="#page2" data-rel="dialog">
        <h3>企业网站域名</h3>
        <p id="profile_website">???</p>
      </a></li>
      <li><a class="toTextarea" href="#page3" data-rel="dialog">
        <h3>企业简介</h3>
        <p id="profile_introduction">???</p>
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
        	<option id="b_0" value="b_0">IT|通信|电子|互联网</option>
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
            <option id="b_12" value="b_12">农|林|牧|渔|其他</option>
        </select>
    </div>  
  </div>
  <div data-role="footer">
  	<a class="surebusiness" href="#" data-role="button">确定</a>    
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
		$("#ChangeContent").val("");
    });
	
	$(".toTextarea").click(function(e) {
		which = this;
		var headername = $(this).children("h3").text();
		$(".areaheader").text(headername);
		$("#ChangeArea").val("");
    });
	
	$(".toBusiness").click(function(e) {
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
		var introduction = $("#profile_introduction").text();
		var profile=new Array(name,phone,business,website,introduction);	
		alert(profile);	
		$("#submit").click(function(){
    		$.post("???",profile,function(data,status){
      			alert("提交成功！");
    		});
  		});
		

    });
</script>
</body>
</html>