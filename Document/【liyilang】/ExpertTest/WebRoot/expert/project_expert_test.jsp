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
	 <link rel="stylesheet" href="<%=basePath%>css/theme.css"/>
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
    	<h1>我的项目</h1>
    </div>    
    
    <a href="<%=basePath%>expert/expert_getExpertList.action">获取专家列表测试</a>
    <a href="<%=basePath%>expert/expert_getExpertEList.action">获取专家列表测试2</a>
    
    <!-- 没有显示结果，原因是没有引入struts-tags -->
    <table class="table" width="99%" layoutH="240">
				<thead>
					<tr>
						<th width="30px">
							<center>
								<input type="checkbox" group="ids" class="checkboxCtrl">
							</center>
						</th>
						<th width="40px">

						</th>
						<th>
							项目名称
						</th>
						<th>
							项目状态
						</th>
						<th>
							发布时间
						</th>
						<th>
							项目描述
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="projectList" status="st">
						<tr target="sid_user" rel="${pid}">
							<td>
							<center>
								<input type="checkbox" group="ids" class="checkboxCtrl">
							</center>
							</td> 
							 
							<td>
								${pname}
							</td>
							<td>
								${schedule}
							</td>
							<td>
								${time}
							</td>
							<td>
								${pdescrpt}
							</td>
						</tr>
					</s:iterator>
				</tbody>
		</table>
	<div data-role="footer" data-position="fixed">
    	<div data-role="navbar">
      		<ul>
        		<li><a href="<%=basePath%>expert/expert_home.jsp" rel="external" data-icon="home">首页</a></li>
        		<li><a href="<%=basePath%>expert/expert_getProjects.action" rel="external" data-icon="arrow-r" class="ui-btn-active">项目</a></li>
        		<li><a href="<%=basePath%>expert/expert_initProfile.action" rel="external" data-icon="star">个人中心</a></li>
      		</ul>
    	</div>
  	</div>
</div>
</script>
</body>
</html>
  


