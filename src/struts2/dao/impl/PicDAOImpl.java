package struts2.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import struts2.dao.PicDAO;
import struts2.db.DBConnect;

public class PicDAOImpl implements PicDAO {

	String pics="";
	String[] pic;
	@Override
	public String getPicByHouse_id(int house_id) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	    String sql="select pic from pics where f_pic_house_id=?";
		pics="";
	    try{
	    	dbc=new DBConnect();
			//‘§±‡“Îsql”Ôæ‰
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, house_id);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()){
				pics+=rs.getString("pic")+" ";
				//System.out.println(pics);
			}
			rs.close();
			pstmt.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			//πÿ±’ ˝æ›ø‚
			dbc.close();
		}
		
		return pics;
	}
public String getAllPics(){
	String[] pic=pics.split(" ");
	String str_all="";
	for(int i=0;i<pic.length;i++){		
		str_all+="<li class=house-pic-list-item><img src=\""+pic[i]+"\"/></li>";
	}

	System.out.println(str_all);
	return str_all;	
}

public String[] getPic(){
	pic=pics.split(" ");
	return pic;
}
public int getPicNum(){
	return pic.length;
}
public String getSixPic(){

	String str="";
	for(int i=0;i<6;i++){		
		str+="<li class=house-pic-list-item><img data-action=\"zoom\" class=house_img src=\""+pic[i]+"\"/></a></li>";
	}
	return str;
}
public String getRemainPic(){
	
	String str="";
	for(int i=6;i<pic.length;i++){		
		str+="<li class=house-pic-list-item><img data-action=\"zoom\" class=house_img src=\""+pic[i]+"\"/></li>";
	}
	return str;
}
}
