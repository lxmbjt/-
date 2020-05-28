<!-- 黎小曼 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="struts2.vo.House"%>
<%@page import="struts2.vo.User"%>
<%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
 			+ path + "/";
 	House house = (House) session.getAttribute("house");
 	User owner = (User) session.getAttribute("owner");
 	String result = (String) session.getAttribute("result");
 	String recommendHouses=(String)session.getAttribute("recommendHouses");
 	String pics_all=(String)session.getAttribute("pics_all");
	int pics_num=Integer.parseInt(session.getAttribute("pics_num").toString());
	String pics_six=(String)session.getAttribute("pics_six");
	String pics_remain=(String)session.getAttribute("pics_remain");
	String firstpic=(String)session.getAttribute("firstpic");
	String[] slider_pic=(String[])session.getAttribute("slider_pic");
	
	int star=Integer.parseInt(session.getAttribute("star_result").toString());
	int user_id=Integer.parseInt(session.getAttribute("user_id").toString());
	
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
<base href="<%=basePath%>">

<title>房源详细信息页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/house_new.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
<link rel="stylesheet" href="./me.css" type="text/css">
<script src="jquery-3.5.0.min.js"></script>
<link href="css/zoom.css"rel="stylesheet">
<script src="zoom.js"></script>
<script src="js/transition.js"></script>
<script src="bootstrap.js"></script>

<script type="text/javascript">  
    function showRemainPic(){  
    document.getElementById('showImg').style.display = "block";  
    }  
</script>
</head>

<body>
	<div class="ui attached menu" >
 	<div class="left aligned menu">
 	<img src="./image/wowo.png"alt="" style="height:25px;margin-top:10px;margin-left:20px">
 	<h4 class="ui teal header item"     style="font-family:'微软雅黑'!important;font-size:17px">蜗蜗租房</h4><!--teal 颜色-->
 	 
 	</div>
    <div class="right aligned menu">
         <a href="./main.jsp" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini home icon"></i>首页</a>
   	<s:if test="null==#session.user||#session.user.isEmpty()">
   	 <a href="./login.jsp" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini user icon"></i>登录</a>
      <a href="./register.jsp" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini add user icon"></i>注册</a>
      <a href="./upload.jsp" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini upload icon"></i>上传房源</a>
    
	</s:if>
	
	<s:else>
	  <a href="<s:url action="Person"/>" class="m-padded-small item" style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini info icon"></i>个人中心</a>
      <a href="./upload.jsp" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini upload icon"></i>上传房源</a>
      <a href="Logout!execute" class="center aligned m-padded-small item"  style="font-family:'微软雅黑'!important;font-size:13px"><i class="tini remove user icon"></i>注销</a>

	</s:else>
     
      
      
    </div>
  </div>
	<%
	switch(house.getRent_type())
	{
	case 1:rent_type="整租";break;
	case 2:rent_type="合租";break;
	case 3:rent_type="无限制";break;			
	default:rent_type="无";break;			
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
	case 1:towards="朝南";break;
	case 2:towards="朝北";break;
	case 3:towards="朝东";break;
	case 4:towards="朝西";break;
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



	<div id="main-wrap">
		<div id="main-slider">
			<%if(pics_num==1){ %>
			<div class="slide">
				<img src="<%= slider_pic[0] %>" alt="Slide" id="pic1">
			</div>

			<%} %>
			<%if(pics_num==2){ %>
			<div class="slide">
				<img src="<%= slider_pic[0] %>" alt="Slide" id="pic1">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[1] %>" alt="Slide" id="pic2">
			</div>
			<script type="text/javascript">
			$("#pic1").click(function(){
				$("#pic1").fadeOut(1000);
				$("#pic2").fadeIn(1000);
							
			})
			
			$("#pic2").click(function(){
				$("#pic2").fadeOut(1000);
				$("#pic1").fadeIn(1000);
			})
			</script>
			<%} %>
			<%if(pics_num==3){ %>
			<div class="slide">
				<img src="<%= slider_pic[0] %>" alt="Slide" id="pic1">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[1] %>" alt="Slide" id="pic2">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[2] %>" alt="Slide" id="pic3">
			</div>
			<script type="text/javascript">
			$("#pic1").click(function(){
				$("#pic1").fadeOut(1000);
				$("#pic2").fadeIn(1000);
							
			})
			
			$("#pic2").click(function(){
				$("#pic2").fadeOut(1000);
				$("#pic3").fadeIn(1000);
			})
			$("#pic3").click(function(){
				$("#pic3").fadeOut(1000);
				$("#pic1").fadeIn(1000);
			})
			</script>
			<%} %>
			<%if(pics_num>=4){ %>
			<div class="slide">
				<img src="<%= slider_pic[0] %>" alt="Slide" id="pic1">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[1] %>" alt="Slide" id="pic2">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[2] %>" alt="Slide" id="pic3">
			</div>
			<div class="slide">
				<img src="<%= slider_pic[3] %>" alt="Slide" id="pic4">
			</div>
			<script type="text/javascript">
			$("#pic1").click(function(){
				$("#pic1").fadeOut(1000);
				$("#pic2").fadeIn(1000);
							
			})
			
			$("#pic2").click(function(){
				$("#pic2").fadeOut(1000);
				$("#pic3").fadeIn(1000);
			})
			$("#pic3").click(function(){
				$("#pic3").fadeOut(1000);
				$("#pic4").fadeIn(1000);
			})
			$("#pic4").click(function(){
				$("#pic4").fadeOut(1000);
				$("#pic1").fadeIn(1000);
			})
			</script>

			<% }%>

		</div>
		<div id="arr">
			<span id="left" onmouseover="over()" onmouseout="out()"> <img
				src="image/arrow.png" />
			</span> <span id="right" onmouseover="over1()" onmouseout="out1()">
				<img src="image/arrow.png" />
			</span>
		</div>
		<script type="text/javascript">
			var left=document.getElementById("left");
			var right=document.getElementById("right");
			var imgarr = [ "#pic1", "#pic2", "#pic3", "#pic4" ];
			var index = 0;
			var click_left=0;
			var click_right=0;
			$("#left").click(function(){
			click_left++;
						
						if(click_left%2==1){
						for(var i=0;i<imgarr.length;i++){
						$(imgarr[i]).fadeOut(1000);					
						}$("#main-slider").fadeOut(1000);}
						else{
						$("#main-slider").fadeIn(1000);
						$("#pic1").fadeIn(1000);
						$("#pic1").css("display","block")}
					
			})		
			$("#right").click(function(){
			index++;
						click_right++;
				
						if (index >imgarr.length-1) {
							index = 0;
							//目的是可以实现循环切换
						}
					
						if(click_right%2==1){
						for(var i=0;i<imgarr.length;i++){
						$(imgarr[i]).fadeOut(1000);					
						}$("#main-slider").fadeOut(1000);}
						else{
						$("#main-slider").fadeIn(1000);
						$("#pic1").fadeIn(1000);
						$("#pic1").css("display","block")}
			})
			</script>

		<script type="text/javascript">
			function over(){
			 document.getElementById("left").style.opacity=1;
			};
			function out(){
			document.getElementById("left").style.opacity=0.5;
			};
			function over1(){
			 document.getElementById("right").style.opacity=1;
			};
			function out1(){
			document.getElementById("right").style.opacity=0.5;
			};
			
			</script>



		<div class="house-and-owner">
			<div class="houseinfo-container">
				<div class="house-info">
					<div class="house-info-wrapper">

						<h3 class="entry-title"><%=house.getHousetitle() %></h3>

						<div class="property-single-meta">
							<div class="house-info-pic">
								<img src="<%= firstpic %>" />
							</div>
							<ul class="clearfix">
								<li class="clearfix-li"><span
									class="property-single-meta-span">租赁方式 :</span><span
									class="property-single-meta-span2"> <%=rent_type %></span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">房屋类型 :</span><span
									class="property-single-meta-span2"><%= room_number %><%=livingroom %><%=toilet %></span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">面积 :</span><span
									class="property-single-meta-span2"><%=house.getArea() %>平</span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">装修 :</span><span
									class="property-single-meta-span2"><%=decoration %></span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">朝向 :</span><span
									class="property-single-meta-span2"><%= towards %></span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">楼层 :</span><span
									class="property-single-meta-span2"><%=house.getStorey() %>层</span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">详细地址 :</span><span
									class="property-single-meta-span2"> <%= house.getAddress() %></span></li>
								<li class="clearfix-li"><span
									class="property-single-meta-span">租金 :</span><span
									class="property-single-meta-span2"> <%= house.getCharge() %>元/月
								</span></li>
							</ul>
							<div class="sharHouseWrapper">
								<div class="starHouse-container">
									<a id="starlink"
										href="AddFavorite?house_id=<%=house.getHouse_id()%>&user_id=<%=user_id%>">
										<p id="star" class=star-text>收藏该房屋</p>
									</a>
								</div>
								<%if (star == 1) {
								%>
								<!--<p class=show-star-text>已收藏</p>	-->
								<script type="text/javascript">
								
									document.getElementById("star").innerHTML = "已收藏";
								</script>
								<%
								}
								%>
								<%if(house.getStatus()==1){ %>
							<p class="status">已下架</p>	
							<%} %>
							</div>
						</div>

					</div>
				</div>
			</div>

			
			
			<div class="house-owner-container">
				<h3 class="entry-title2">房主</h3>
				<div class="owner-head-portrait">
					<a href="userInfo.jsp"> <img src="<%=owner.getUser_avatar()%>" />
					</a>
					<div class="owner-info-text">
						<p class="owner-name"><%=owner.getUser_name()%>
						</p>
						<p>
							<span class="property-single-meta-span">邮箱：</span><span
								class="property-single-meta-span2"><%=owner.getE_mail()%></span>
						</p>
						<p>
							<span class="property-single-meta-span">微信：</span><span
								class="property-single-meta-span2"><%=owner.getWechat()%></span>
						</p>
						<div class="reserve">
							<a href="reserve.jsp">
								<p class="reserveInfo">预约看房</p>
							</a>
							<a href="accusation.jsp">
			<div class="report-container"><p class="report">举报</p></div>
			</a>
						</div>
					</div>
					<div class="recommendHousesContainer">
					<div class=recommendHouses>
						<h3 class="entry-title2">推荐房源</h3>
						<%=recommendHouses%>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="house-facility-container">
			<div class="house-facility">
				<h3 class="entry-title">家具设备</h3>
				<ul class=house-faciliy>
					<%
						if (house.getElevator() == 1) {
					%>
					<li class=facility><img src="image/facility/elevator.jpg">
						<p>电梯</p></li>
					<%
						}
					%>
					<%
						if (house.getBed() == 1) {
					%>
					<li class="facility"><img src="image/facility/bed.jpg">
						<p>床</p></li>
					<%
						}
					%>
					<%
						if (house.getNetwork() == 1) {
					%>
					<li class="facility"><img src="image/facility/network.jpg">
						<p>网络</p></li>
					<%
						}
					%>
					<%
						if (house.getAirondition() == 1) {
					%>
					<li class="facility"><img
						src="image/facility/aircondition.jpg">
						<p>空调</p></li>
					<%
						}
					%>
					<%
						if (house.getBalcony() == 1) {
					%>
					<li class="facility"><img src="image/facility/balcony.jpg">
						<p>阳台</p></li>
					<%
						}
					%>
					<%
						if (house.getRefrigerator() == 1) {
					%>
					<li class="facility"><img
						src="image/facility/refrigerator.jpg">
						<p>冰箱</p></li>
					<%
						}
					%>
					<%
						if (house.getToilet() == 1) {
					%>
					<li class="facility"><img src="image/facility/toilet.jpg">
						<p>厕所</p></li>
					<%
						}
					%>
					<%
						if (house.getKitchen() == 1) {
					%>
					<li class="facility"><img src="image/facility/kitchen.jpg">
						<p>厨房</p></li>
					<%
						}
					%>
					<%
						if (house.getBath() == 1) {
					%>
					<li class="facility"><img src="image/facility/bath.jpg">
						<p>浴室</p></li>
					<%
						}
					%>
					<%
						if (house.getHeating() == 1) {
					%>
					<li class="facility"><img src="image/facility/heating.jpg">
						<p>供暖</p></li>
					<%
						}
					%>
					<%
						if (house.getSofa() == 1) {
					%>
					<li class="facility"><img src="image/facility/sofa.jpg">
						<p>沙发</p></li>
					<%
						}
					%>
					<%
						if (house.getTelevision() == 1) {
					%>
					<li class="facility"><img src="image/facility/tv.jpg">
						<p>电视</p></li>
					<%
						}
					%>
					<%
						if (house.getWashing_machine() == 1) {
					%>
					<li class="facility"><img
						src="image/facility/washing_machine.jpg">
						<p>洗衣机</p></li>
					<%
						}
					%>
					<%
						if (house.getWater_heater() == 1) {
					%>
					<li class="facility"><img
						src="image/facility/water_heater.PNG">
						<p>热水器</p></li>
					<%
						}
					%>
					<%
						if (house.getWardrobe() == 1) {
					%>
					<li class="facility"><img src="image/facility/wardrobe.PNG">
						<p>衣柜</p></li>
					<%
						}
					%>

				</ul>
			</div>
		</div>
		<div class="house-description-container">
			<div class="house-description">
				<h3 class="entry-title">房屋描述</h3>
				<div class="house-description-wrapper">
					<%=house.getComment()%>

				</div>

			</div>

		</div>
		<div class="house-pic-container">
			<h3 class="entry-title">房源图片</h3>
			<ul class=house-pic-list id="house_pic_list">

				<%if(pics_num<6){ %>
				<%=pics_all %>
				<%}else{ %>
				<%=pics_six %>
				<div class=hiddenimg id="showImg">
					<%=pics_remain %>
				</div>
				<% } %>
				<li class=button><input class=button style="outline:none;"
					type="button" value='显示全部图片' onclick="showRemainPic()"></li>
			</ul>

		</div>
		<!--底部footer-->
<footer  class="ui center aligned  vertical segment m-padded-tb-massive" style="background-color: #e0f3f1;font-family:'微软雅黑'!important"><!--vertical 取消圆角不留缝隙 css定义上下宽度-->
<div class="ui center aligned container"><!--内容居中-->
    <div class="ui  divided  grid">
        <div class="three wide column" style="background-color: #e0f3f1">
            <div class="ui link list">
                <div class="item">
                    <img src="./image/wowowechat.png" class="ui rounded image" alt="" style="width: 110px">
                </div>
            </div>
        </div>
        <div class="three wide column" style="background-color: #e0f3f1">
           
            <div class="ui  link list">
                 <i class="big user  icon" style="opacity: 0.8"></i>
                <a href="./rentguide.jsp" class="item" style="font-weight: 700;">房客指南</a>
                <br>
                   <i class="big building icon" style="opacity: 0.8"></i>
                <a href="./ownerguide.jsp" class="item " style="font-weight: 700;">房东指南</a>
                
            </div>
        </div>
                <div class="five wide column" style="background-color: #e0f3f1">
            <h4 class="ui  header m-text-thin m-text-spaced"></h4>
            <div class="image" style="background-color:transparent" >
        <img src="./image/wowo.png" style="width:70px">
      </div>
            <p class="m-text-spaced m-opacity-mini" style="font-size:16px;font-weight: 600;color:rgba(0,0,0,.6)">蜗蜗租房，为你寻觅温暖的家</p>
        </div>
      
        <div class="four wide column" style="background-color: #e0f3f1">
            <p class="m-text-spaced m-opacity-mini" style="font-size:16px;font-weight: 600;color:rgba(0,0,0,.6)">联系我们</p>
           
            <div class="ui link list">
                <a  class="item"style="height:20px">客服电话: 400 - 010 - 1234</a>
                <a  class="item" style="height:20px">客服邮箱: service@wowo.com</a>
            </div>
        </div>
    </div>
    <div class="ui  divider"  ></div><!--分割线-->
    <p class="m-text-thin m-text-spaced m-opacity-tiny" style="background-color: #e0f3f1"> 京ICP备12035936号-1   许可证号：京ICP证140510号    安全联盟    北京快跑信息科技有限公司    营业执照号 103613118
京公网安备 11010802020380号  </p>
  <p class="m-text-thin m-text-spaced m-opacity-tiny" style="background-color: #e0f3f1"> 违法和不良信息举报电话：4000107890转6    举报邮箱：jubao@wowo.com</p>
    <p class="m-text-thin m-text-spaced m-opacity-tiny" style="background-color: #e0f3f1">Copyright  2020 - 2100 TBY Designed by TBY</p>

</div>

</footer>
	</div>
</body>
</html>
