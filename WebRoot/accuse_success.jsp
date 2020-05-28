<!-- 黎小曼 -->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>举报成功页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/accusation.css">
  </head>
  
  <body>
 
	<div class="main-wrapper">
		
	<div class="titleBar">
	<span class="title logo">蜗蜗租房</span>
	<span class="title">举报中心</span>
	</div>
	<div class="accuse-info-container">
  <p class="accuse_success_text">举报成功，等待管理员审核</p> 
  <a href="main.jsp">点击此处返回主页</a>
  
    </div>
    </div>

    
  </body>
</html>
