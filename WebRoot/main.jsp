<%@ page pageEncoding="utf-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String user_name = (String)session.getAttribute("user_name"); 
String user_nickname = (String)session.getAttribute("user_nickname");  
%>  


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
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
  
 

<div class="ui center aligned container">
 
<s:form action="Search" theme="simple" method="post">  




<!-- 下拉列表 -->


<select name="province"  style="width:80px;height:40px;font-family:微软雅黑 ;border-top-right-radius:0.3em!important;
    border-bottom-right-radius:0.3em!important;"  >
<option value="1">北京市</option>
<option value="2">天津市</option>
<option value="3">上海市</option>
<option value="4">重庆市</option>
<option value="5">河北省</option>
<option value="6">山西省</option>
<option value="7">辽宁省</option>
<option value="8">吉林省</option>
<option value="9">黑龙江省</option>
<option value="10">江苏省</option>
<option value="11">浙江省</option>
<option value="12">安徽省</option>
<option value="13">福建省</option>
<option value="14">江西省</option>
<option value="15">山东省</option>
<option value="16">河南省</option>
<option value="17">湖北省</option>
<option value="18">湖南省</option>
<option value="19">广东省</option>
<option value="20">海南省</option>
<option value="21">四川省</option>
<option value="22">贵州省</option>
<option value="23">云南省</option>
<option value="24">陕西省</option>
<option value="25">甘肃省</option>
<option value="26">青海省</option>
<option value="27">内蒙古</option>
<option value="28">广西</option>
<option value="29">西藏</option>
<option value="30">宁夏</option>
<option value="31">新疆</option>
<option value="32">香港</option>
<option value="33">澳门</option>
<option value="34">台湾</option>

</select>



  <!-- 搜索框 -->
	 <div class="ui action left icon input">

  	<i class="small search icon"></i>
  	<input type="text" placeholder="Search..." name="search">
  	<s:submit style="background-color:#00B5AD;width:100px;height:40px;font-family:微软雅黑 ;color:white;border-top-right-radius:0.3em!important;
    border-bottom-right-radius:0.3em!important;"  align="center" value="搜索"></s:submit> 
	</div>   

  
  </s:form>
   </div>
 Hi:<br>  
    <%=user_name%><br>  
    <%=user_nickname%><br> 
    Welcome... <br>  

 <br>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
 

<script type="text/javascript">
	window.onload = function(){
		$("option").click(function(){
			$("#select").removeAttr("size");
			$("#select").blur();
			this.attr("selected","");
		});
 
		$("#select").focus(function(){
			$("#select").attr("size","5");
		})
	}
</script>

  </body>
</html>
