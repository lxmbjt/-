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
    
    <title>举报页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/accusation.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
<link rel="stylesheet" href="./me.css" type="text/css">
  </head>
  
  <body>
  
  <s:form method="post" action="Report">
	<div class="main-wrapper">
		
	<div class="titleBar">
	<span class="title logo">蜗蜗租房</span>
	<span class="title">举报中心</span>
	</div>
	
<div class="accuse-info-container">
		<h2>填写举报信息</h2>
		<span class="info">信息内容虚假、违规类问题，点击下方举报原因</span>
		
		<ul class="accuse-info-wrapper">
			<li class="accuse-info"><input type="radio" name="accuse" value="1">房源已出租</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="2">房源不存在</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="3">房源位置虚假</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="4">房源价格虚假</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="5">房源图片虚假</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="6">房源描述虚假</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="7">疑似欺诈</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="8">冒用本人房源</li>
			<li class="accuse-info"><input type="radio" name="accuse" value="9">其他</li>
		</ul>
		<div>
		<span style="color:red;">*温馨提示:</span><br>
		<span>请您详细描述获知房源状态已出租渠道及证据，充足的证据有助于客服采信</span>
		</div>
		
		<textarea class="specific-reason" name="reason"></textarea>
		
		
</div></div>
	
		<s:submit value="提交" style="background:#FC542D;outline:none;color:white;width:180px;
	height:45px;margin-left:210px;border-radius:4px;" id="submit"></s:submit> 
	</s:form>
	
</body>
</html>
