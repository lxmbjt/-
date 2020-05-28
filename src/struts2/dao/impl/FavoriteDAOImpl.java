package struts2.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import struts2.dao.FavoriteDAO;
import struts2.db.DBConnect;

public class FavoriteDAOImpl implements FavoriteDAO {


	@SuppressWarnings("resource")
	@Override
	public int addFavorite(int house_id,int user_id) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	    int result=0;
	    String sql1="select * from favorite where f_user_id=? and f_house_id=?;";
	    try{
	    	dbc=new DBConnect();
			//预编译sql语句
			pstmt=dbc.getConnection().prepareStatement(sql1);
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, house_id);
			ResultSet rs_query=pstmt.executeQuery();
			if(rs_query.next()){
				//数据库中有记录，说明以收藏，此时将该条记录从数据库中删除
				String sql3="delete from favorite where f_user_id=? and f_house_id=?;";
				pstmt=dbc.getConnection().prepareStatement(sql3);
				pstmt.setInt(1, user_id);
				pstmt.setInt(2, house_id);
				int rs_delete=pstmt.executeUpdate();
				if(rs_delete!=0){
					//System.out.println("删除成功1");
					result=0;
					return result;//删除成功
				}
			}else{
				//数据库中无该项纪录，加入该记录
				String sql2="insert into favorite (f_user_id,f_house_id) VALUES (?,?);";
				pstmt=dbc.getConnection().prepareStatement(sql2);
				pstmt.setInt(1, user_id);
				pstmt.setInt(2, house_id);
				int rs_insert=pstmt.executeUpdate();
				
				if(rs_insert!=0){
					//System.out.println("添加成功2");
					result=1;
					return result;//添加成功
				}
			}
			rs_query.close();
			
	         pstmt.close() ;   
	    }catch (SQLException e){   
            System.out.println(e.getMessage());   
        }finally{   
            // 关闭数据库连接   
            dbc.close() ;   
        }   
	    System.out.println("操作失败0");
	    result=-1;
		return result;//操作失败
	}

	@Override
	public int ifInFavorite(int house_id, int user_id) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	    int result=0;
	    String sql1="select * from favorite where f_user_id=? and f_house_id=?;";
	    try{
	    	dbc=new DBConnect();
			//预编译sql语句
			pstmt=dbc.getConnection().prepareStatement(sql1);
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, house_id);
			ResultSet rs_query=pstmt.executeQuery();
			if(rs_query.next()){
				result=1;
				return result;//数据库有该条记录
			}
			}catch (SQLException e){   
	            System.out.println(e.getMessage());   
	        }finally{   
	            // 关闭数据库连接   
	            dbc.close() ;   
	        }   
		return 0;
	}
	
	

}
