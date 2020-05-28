<%@ page language="java"  pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@page import="struts2.vo.House" %> 
<%@page import="struts2.vo.User" %> 
<%   
String user_name = (String)session.getAttribute("user_name"); 
String user_nickname = (String)session.getAttribute("user_nickname");  

//String houseInfo = (String)session.getAttribute("houseresult"); 
//String owner=(String)session.getAttribute("userresult");

//String[] info=houseInfo.split(" ");
//String[] ownerInfo=owner.split(" ");
House house=(House)session.getAttribute("house");
User owner=(User)session.getAttribute("owner");
String firstpic=(String)session.getAttribute("firstpic");
int house_id=(int)session.getAttribute("house_id");
int user_id=(int)session.getAttribute("user_id");

String recommendHouses=(String)session.getAttribute("recommendHouses");
String result=(String)session.getAttribute("result");
String pics_all=(String)session.getAttribute("pics_all");
int pics_num=(int)session.getAttribute("pics_num");
String pics_six=(String)session.getAttribute("pics_six");
String pics_remain=(String)session.getAttribute("pics_remain");

String rent_type="";
String room_type="";
String decoration="";
String room_number="";
String towards="";
String livingroom="";
String toilet="";

%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>Struts2 Person Login Result</title>  
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
       <link rel="stylesheet" href="./me.css" type="text/css">
       <link rel="stylesheet" href="./houseInfo.css" type="text/css">
      <script type="text/javascript" src="jquery.js"></script>
      
      <script type="text/javascript" >  
    function showRemainPic(){  
    document.getElementById('showImg').style.display = "block";  
    }  
    </script>
    
    <script>
    function imgShow(outerdiv, innerdiv, bigimg, _this){
    var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
    $(bigimg).attr("src", src);//设置#bigimg元素的src属性

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
    $("<img/>").attr("src", src).load(function(){
        var windowW = $(window).width();//获取当前窗口宽度
        var windowH = $(window).height();//获取当前窗口高度
        var realWidth = this.width;//获取图片真实宽度
        var realHeight = this.height;//获取图片真实高度
        var imgWidth, imgHeight;
        var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
         
        if(realHeight>windowH*scale) {//判断图片高度
            imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
            imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
            if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                imgWidth = windowW*scale;//再对宽度进行缩放
            }

        } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
            imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
            imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
        } else {//如果图片真实高度和宽度都符合要求，高宽不变
            imgWidth = realWidth;
            imgHeight = realHeight;
        }
                $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放

         

        var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
        var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
        $(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
        document.getElementById('outerdiv').style.display = "block"; 
        document.getElementById('innerdiv').style.display = "block"; 
        $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
        
    });

     

    $(outerdiv).click(function(){//再次点击淡出消失弹出层
        $(this).fadeOut("fast");

    });

}
    
 </script> 
    
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
   
<div class=main-wrap>
  
  <!-- 标题 -->
  <p class=toptitle>  <%= house.getHousetitle() %></p>
 
  <div class="house-basic-info">
  <div class="house-basic-pic">
  <img src="<%= firstpic %>"></img>
  </div>
  <div class="house-basic-right">
  <div class=house-basic-description>
  <div class=desc-item>
  	<div class="pay-way">
  	<%= house.getCharge() %>元/月
  	</div>
  
	<div class="basic-content">
	<%
	switch(house.getRent_type())
	{
	case 1:rent_type="租赁方式：整租";break;
	case 2:rent_type="租赁方式：合租";break;
	case 3:rent_type="租赁方式：无限制";break;			
	default:rent_type="租赁方式：无";break;			
	}
	switch(house.getRoom_type()){
	case 1:room_type="房屋类型：普通住宅";break;
	case 2:room_type="房屋类型：公寓";break;
	case 3:room_type="房屋类型：别墅";break;
	case 4:room_type="房屋类型：四合院";break;
	case 5:room_type="房屋类型：商住两用";break;
	case 6:room_type="房屋类型：新里洋房";break;
	case 7:room_type="房屋类型：老公房";break;
	case 8:room_type="房屋类型：平房";break;
	case 9:room_type="房屋类型：其他";break;
						
	}
	switch(house.getDecoration()){
	case 1:decoration="精装修";break;
	case 2:decoration="简装修";break;	
	default:decoration="未装修";break;
	}
	switch(house.getRoom_number()){
	case 1:room_number="1室";break;
	case 2:room_number="2室";break;
	case 3:room_number="3室";break;
	case 4:room_number="4室";break;
	default:room_number="大于等于5室";break;
	}
	switch(house.getTowards()){
	case 1:towards="朝向：朝南";break;
	case 2:towards="朝向：朝北";break;
	case 3:towards="朝向：朝东";break;
	case 4:towards="朝向：朝西";break;
	}
	switch(house.getLivingroom()){
	case 1:livingroom="1厅";break;
	case 2:livingroom="2厅";break;
	case 3:livingroom="3厅";break;
	default:livingroom="多余3厅";break;
	}
	switch(house.getToilet()){
	case 1:toilet="1卫";break;
	case 2:toilet="2卫";break;
	case 3:toilet="3卫";break;
	default:toilet="多余3卫";break;
	}
	
	%>
	<p><%= rent_type %></p>
	<p>房屋类型：<%= room_number %><%=livingroom %><%=toilet %> <%=house.getArea() %>平 <%= decoration %></p>
	<p><%= towards %></p>
	<p>楼层：<%= house.getStorey() %>层</p>
	<p>详细地址：<%= house.getAddress() %></p>
	</div></div>
	
	  <div class=house-owner-info>
		<div class=owner-head-portrait>
			<a href="userInfo.jsp">
				<img src="<%= owner.getUser_avatar()%>"/>
			</a>
		</div>
		<div class=owner-info-text>
		<p><%=owner.getUser_name() %></p>
		<p>邮箱：<%=owner.getE_mail() %></p>
		<p>微信：<%=owner.getWechat() %></p>
		
		<div class=reserve>
		<a href="reserve.jsp">
		<p class=reserveInfo>预约看房</p>
		</a>
		</div>
		</div>
		
	  
	</div>
	

	 <div class=star-house>
	<a id="starlink"  href="AddFavorite?house_id=<%= house_id %>&user_id=<%= user_id %>" onclick="javascript:setTimeout(alert('<%= result %>'),1000)">

	 <p class=star-text>收藏该房屋</p>
	
	</a>
	 </div>
	</div>
	
	
	</div>
</div>

<div class=half-bottom>
<!-- 分割线 -->
<hr color="DarkGray" />
<!-- 房屋有的家具 -->
<div class="details" id="details">
<p><font size="4" face="arial" color="black" >房源详情</font></p>
<ul class=house-faciliy>
<%if(house.getElevator()==1){ %>
<li class=facility>
<img src="image/elevator.jpg">
<p>电梯</p>
</li>
<% }%>
<%if(house.getBed()==1){ %>
<li class="facility">
<img src="image/bed.jpg">
<p>床</p>
</li>
<% }%>
<%if(house.getNetwork()==1){ %>
<li class="facility">
<img src="image/network.jpg">
<p>网络</p>
</li>
<% }%>
<%if(house.getAirondition()==1){ %>
<li class="facility">
<img src="image/aircondition.jpg">
<p>空调</p>
</li>
<% }%>
<%if(house.getBalcony()==1){ %>
<li class="facility">
<img src="image/balcony.jpg">
<p>阳台</p>
</li>
<% }%>
<%if(house.getRefrigerator()==1){ %>
<li class="facility">
<img src="image/refrigerator.jpg">
<p>冰箱</p>
</li>
<% }%>
<%if(house.getToilet()==1){ %>
<li class="facility">
<img src="image/toilet.jpg">
<p>厕所</p>
</li>
<% }%>
<%if(house.getKitchen()==1){ %>
<li class="facility">
<img src="image/kitchen.jpg">
<p>厨房</p>
</li>
<% }%>
<%if(house.getBath()==1){ %>
<li class="facility">
<img src="image/bath.jpg">
<p>浴室</p>
</li>
<% }%>
<%if(house.getHeating()==1){ %>
<li class="facility">
<img src="image/heating.jpg">
<p>供暖</p>
</li>
<% }%>
<%if(house.getSofa()==1){ %>
<li class="facility">
<img src="image/sofa.jpg">
<p>沙发</p>
</li>
<% }%>
<%if(house.getTelevision()==1){ %>
<li class="facility">
<img src="image/tv.jpg">
<p>电视</p>
</li>
<% }%>
<%if(house.getWashing_machine()==1){ %>
<li class="facility">
<img src="image/washing_machine.jpg">
<p>洗衣机</p>
</li>
<% }%>
<%if(house.getWater_heater()==1){ %>
<li class="facility">
<img src="image/water_heater.PNG">
<p>热水器</p>
</li>
<% }%>
<%if(house.getWardrobe()==1){ %>
<li class="facility">
<img src="image/wardrobe.PNG">
<p>衣柜</p>
</li>
<% }%>

 </ul>
 
  <div class="info">
房屋描述：<%=house.getComment() %><br/>
  <br/>
  </div>
</div>

<div class=recommendHouses>
<p>推荐房源</p>

<%= recommendHouses %>

</div> 


<ul class=house-pic-list id="house_pic_list">

<%if(pics_num<6){ %>
<%=pics_all %><%}else{ %>
<%=pics_six %>
<div class=hiddenimg id="showImg">
<%=pics_remain %>
 </div>
 <% } %>
<li class=button><input class=button  type="button" value='显示全部图片' onclick="showRemainPic()"></li>
</ul>
 



</div></div>
<script>
    var intElemOffsetHeight = document.getElementById("details").offsetHeight;
        document.getElementById("house_pic_list").style.marginTop=intElemOffsetHeight+"px";
   
   </script>
   
  

  </body>  
</html> 
