package struts2.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import struts2.db.DBConnect;
import struts2.vo.House;

import struts2.dao.HouseInfoDAO;
import struts2.dao.PicDAO;


public class HouseInfoDAOImpl implements HouseInfoDAO {

	private House house;
	@Override
	public House queryByHousetitle(String housetitle) throws Exception {
		// TODO Auto-generated method stub
		house=new House();	
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	    String sql1="select * from house where housetitle=?";
	    //下面对数据库进行操作
	    try{
	    	
	    	dbc=new DBConnect();
			//预编译sql语句
			pstmt=dbc.getConnection().prepareStatement(sql1);
			pstmt.setString(1, housetitle);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				
				house.setHouse_id(rs.getInt("house_id"));
				house.setF_owner_id(rs.getInt("f_owner_id"));
				house.setHousetitle(rs.getString("housetitle"));
				house.setProvince(rs.getInt("province"));
				house.setCity(rs.getString("city"));
				house.setAddress(rs.getString("address"));
				house.setStorey(rs.getInt("storey"));
				house.setCharge(rs.getInt("charge"));
				house.setCharge_type(rs.getInt("charge_type"));
				house.setRoom_number(rs.getInt("room_number"));
				house.setRent_type(rs.getInt("rent_type"));
				house.setTowards(rs.getInt("towards"));
				house.setRoom_type(rs.getInt("room_type"));
				house.setElevator(rs.getInt("elevator"));
				house.setBed(rs.getInt("bed"));//提供床
				house.setNetwork(rs.getInt("network"));
				house.setAirondition(rs.getInt("airondition"));
				house.setBalcony(rs.getInt("balcony"));
				house.setRefrigerator(rs.getInt("refrigerator"));
				house.setToilet(rs.getInt("toilet"));
				house.setKitchen(rs.getInt("kitchen"));
				house.setBath(rs.getInt("bath"));
				house.setHeating(rs.getInt("heating"));
				house.setLivingroom(rs.getInt("livingroom"));
				house.setTelevision(rs.getInt("television"));
				house.setWashing_machine(rs.getInt("washing_machine"));
				house.setWater_heater(rs.getInt("water_heater"));
				house.setSofa(rs.getInt("sofa"));
				house.setArea(rs.getInt("area"));
				house.setDecoration(rs.getInt("decoration"));
				house.setWardrobe(rs.getInt("wardrobe"));
				house.setComment(rs.getString("comment"));
				house.setStatus(rs.getInt("status"));
				System.out.println("当前房屋"+house.getHouse_id());
		
				
			}
			
			
		
			rs.close();
			pstmt.close();
	    }catch(SQLException e){
			e.printStackTrace();
		}finally{
			//关闭数据库
			dbc.close();
		}
	    
		return house;
	}

public House getHouse(){
		return house;
	}
public void setHouse(House house){
	this.house=house;
}

@Override
public String recommendHouse(String city) throws Exception {
	// TODO Auto-generated method stub
	List<House> houses=new ArrayList<House>();;
	PreparedStatement pstmt = null ;   
    DBConnect dbc = null;   
    PicDAO picdao=new PicDAOImpl();
    String houseItem_detail="";
    String sql="select * from house where city=?";
  //下面对数据库进行操作
    try{
    	
    	dbc=new DBConnect();
		//预编译sql语句
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1, city);
		ResultSet rs=pstmt.executeQuery();
		int count=0;
		while(rs.next()){
			count++;
			House house=new House();
			
			
			house.setHouse_id(rs.getInt("house_id"));
			if(house.getHouse_id()==this.house.getHouse_id()){ count--;continue;}
			house.setCharge(rs.getInt("charge"));
			house.setRent_type(rs.getInt("rent_type"));
			house.setTowards(rs.getInt("towards"));
			house.setRoom_type(rs.getInt("room_type"));
			house.setRoom_number(rs.getInt("room_number"));
			house.setStorey(rs.getInt("storey"));
			house.setHousetitle(rs.getString("housetitle"));
			house.setDecoration(rs.getInt("decoration"));
			house.setArea(rs.getInt("area"));
			houses.add(house);
			String rent_type="";
			String decoration="";
			
			switch(house.getRent_type()){
			case 1:rent_type="整租";break;
			case 2:rent_type="合租";break;
			default:rent_type="无限制";break;
			
			}
			switch(house.getDecoration()){
			case 1:decoration="/精装修";break;
			case 2:decoration="/简装修";break;
			
			default:decoration="/未装修";break;
			
			}
			String pic_url=picdao.getPicByHouse_id(house.getHouse_id());
			String[] pics=pic_url.split(" ");
			String pic="<div class=houseItem><div class=pic><img src=\""+pics[0]+"\"/></div>";
			String housetitle="<div class=houseItem-detail><a class=houseItemtitle href=\"House?housetitle="+house.getHousetitle()+"\">"+house.getHousetitle()+"</a>";
			String HouseItem_specific_info="<div class=HouseItem-specific-info><span class=HouseItem-specific-info-font>"+rent_type+decoration+"</span><br>"+"<span class=HouseItem-specific-info-font>"+house.getArea()+"平</span><br></div>";
			String charge="<div class=HouseItemcharge><p class=HouseItemcharge-font>"+house.getCharge()+"元/月</p></div></div></div>";
			houseItem_detail+=pic+housetitle+HouseItem_specific_info+charge;
			if(count==6)break;
		
		}
		rs.close();
		pstmt.close();
    }catch(SQLException e){
		e.printStackTrace();
	}finally{
		//关闭数据库
		dbc.close();
	}
	
	
	return houseItem_detail;
}

}
