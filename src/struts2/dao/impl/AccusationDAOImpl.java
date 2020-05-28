package struts2.dao.impl;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import struts2.dao.AccusationDAO;
import struts2.db.DBConnect;
import struts2.vo.Accusation;

public class AccusationDAOImpl implements AccusationDAO {

	@Override
	public int saveInAccusation(Accusation accusation) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;     
	    String sql="insert into accusation (f_user_id,f_house_id,hasRented,houseNotExist,locationFake,priceFake,pictureFake,descriptionFake,cheated,others,stealMine,f_owner_id,reason) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
	    //下面对数据库进行操作
	    try{
	    	
	    	dbc=new DBConnect();
	    	pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, accusation.getF_user_id());
			pstmt.setInt(2, accusation.getF_house_id());
			pstmt.setInt(3, accusation.getHasRented());
			pstmt.setInt(4, accusation.getHouseNotExist());
			pstmt.setInt(5, accusation.getLocationFake());
			pstmt.setInt(6, accusation.getPriceFake());
			pstmt.setInt(7, accusation.getPictureFake());
			pstmt.setInt(8, accusation.getDescriptionFake());
			pstmt.setInt(9, accusation.getCheated());
			pstmt.setInt(10, accusation.getOthers());
			pstmt.setInt(11, accusation.getStealMine());		
			pstmt.setInt(12, accusation.getF_owner_id());
			pstmt.setString(13, accusation.getReason());
			int rs=pstmt.executeUpdate();
			if(rs!=0){
				return 1;//添加举报记录成功
			}
			 pstmt.close();
	    	}catch (SQLException e){   
	            System.out.println(e.getMessage());   
        }finally{   
	            // 关闭数据库连接   
	            dbc.close() ;   
	        }   
		return 0;
	}

}
