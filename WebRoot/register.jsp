<%@ page pageEncoding="utf-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %>  

<%   
String user_name = (String)session.getAttribute("user_name"); 
String user_nickname = (String)session.getAttribute("user_nickname");  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>       
    <title>注册</title>  

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
    <s:form action="Register">  
        <s:textfield name="user.user_nickname" label="昵称"></s:textfield>
        <s:textfield name="user.phone" label="电话"></s:textfield>        
        <s:password name="user.password" label="密码"></s:password>
        <s:password name="user.repassword" label="再次输入"></s:password>     
        <s:actionerror/> 
        <s:submit></s:submit>  
    </s:form>  
  </body>  
</html>  
