<%@ page pageEncoding="utf-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="struts2.vo.User" %>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

   
String user_name = (String)session.getAttribute("user_name"); 
String user_nickname = (String)session.getAttribute("user_nickname");  
User owner=(User)session.getAttribute("owner");
%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
         <link rel="stylesheet" href="./me.css">
  </head>
  
  
 <body>
 	<div class="ui menu">
 	<div class="left aligned menu">
 	<h4 class="ui teal header item">蜗蜗租房</h4><!--teal 颜色-->
 	 
 	</div>
    <div class="right aligned menu">
         <a href="./main.jsp" class="m-padded-mini item"><i class="tini home icon"></i>首页</a>
   	<s:if test="null==#session.user||#session.user.isEmpty()">
   	 <a href="./login.jsp" class="m-padded-mini item"><i class="tini user icon"></i>登录</a>
      <a href="./register.jsp" class="m-padded-mini item"><i class="tini add user icon"></i>注册</a>
      <a href="./upload.jsp" class="m-padded-mini item"><i class="tini upload icon"></i>上传房源</a>
    
	</s:if>
	
	<s:else>
	  <a href="./personalcenter.jsp" class="m-padded-mini item"><i class="tini info icon"></i>个人中心</a>
      <a href="./upload.jsp" class="m-padded-mini item"><i class="tini upload icon"></i>上传房源</a>
      <a href="Logout!execute" class="m-padded-mini item"><i class="tini remove user icon"></i>注销</a>

	</s:else>
    </div>
  </div>
  <div><br></div> 
    个人中心页<br>
  </body>
</html>
