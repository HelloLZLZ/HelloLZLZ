<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<%
String userName = request.getParameter("UserNameInput"); 
if(userName == "123") {%>
<jsp:forward page="regist_fail.html"/>
<%}else{%>
<jsp:forward page="regist_success.html"/>
<%}%>
	
