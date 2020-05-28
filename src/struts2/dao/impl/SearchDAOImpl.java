package struts2.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import struts2.dao.SearchDAO;
import struts2.db.DBConnect;

public class SearchDAOImpl implements SearchDAO  {

	@Override
	public String Search(int province,String search) throws Exception{
		// TODO Auto-generated method stub
		
		//String sql = "select * from userinfo where username=?";
		String sql = "select * from house where province=? && housetitle like ?";
		
		System.out.println(province);
		System.out.println(search);
		String[] towards={"","朝南","朝北 ","朝东","朝西"};
		String[] renttypes={"","整租","合租 ","整租合租均可"};
		PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
        String str="";
        // 下面是针对数据库的具体操作   
        try{   
            // 连接数据库   
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;  
           // pstmt.setString(1,user.getUsername()) ;  
            pstmt.setInt(1, province);
            pstmt.setString(2,  '%'+search+'%');
            System.out.println(pstmt);
            System.out.println(pstmt);
            // 进行数据库查询操作   
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){   
                // 查询出内容，之后将查询出的内容赋值给person对象   
            	 int id = rs.getInt("house_id");
    	         String title = rs.getString("housetitle");
    	         String add=rs.getString("address");
    	         String date=rs.getDate("release_time").toString();
    	         int storey=rs.getInt("storey");
    	         int charge=rs.getInt("charge");
    	         String to=towards[rs.getInt("towards")];
    	         String renttype=renttypes[rs.getInt("rent_type")];
    	         String pic=Pic(id);
    	         System.out.println(pic);
    	         String img="<div class=\"ui center aligned divided items\"  ><div class=\"item\"><div class=\"image\" style=\"width:230px; \"><img src=\""+pic+"\"></div>";
    	         String chargestr="<div class=\"content\"><a class=\"header\">"+title+"</a><div class=\"meta\"><span class=\"price\" style=\"color:#00B5AD ;font-family:微软雅黑 ; font-size:16px font-weight:bold\">"+charge+"</span>"
    	         +"<span class=\"stay\" style=\"color:#00B5AD ;font-family:微软雅黑 ; font-size:13px;font-weight:bold\" >元/月</span></div>";
    	         String description=" <div class=\"description\"><p>"+add+"</p><p>发布日期："+date+"</p><p>楼层："+storey+"层</p></div>";
    	         String extra="<div class=\"extra\" style=\"font-family:微软雅黑 ;\" ><div class=\"ui label\">"+to+"</div><div class=\"ui label\" >"+renttype+"</div>";
    	         String button=" <input type=\"submit\"   style=\"background-color:#00B5AD;width:70px;height:25px;font-family:微软雅黑 ;color:white;border-top-right-radius:0.3em!important;"
    	        	+ "border-bottom-right-radius:0.3em!important;\" value=\"详细信息\"id=\""+title+"\"  onclick=\"state(this.id)\" /></div></div></div></div>" ;
    	        	
    	         
    	         str+=img+chargestr+description+extra+button;
    	     
    	         
    	         System.out.println(str);
    	         
                } 
            
            rs.close() ; 
            pstmt.close() ;   
        }catch (SQLException e){   
            System.out.println(e.getMessage());   
        }finally{   
            // 关闭数据库连接   
            dbc.close() ;   
        }   
		return str;
	}

	public String Pic(int house_id) throws Exception{
		// TODO Auto-generated method stub
		
		//String sql = "select * from userinfo where username=?";
		String sql = "select * from pics where f_pic_house_id=? limit 1";
	
		PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
        
        // 下面是针对数据库的具体操作   
        try{   
            // 连接数据库   
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;  
           // pstmt.setString(1,user.getUsername()) ;  
            pstmt.setInt(1,house_id);
           
            System.out.println(pstmt);
            System.out.println(pstmt);
            // 进行数据库查询操作   
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()){   
                // 查询出内容，之后将查询出的内容赋值给person对象   
            	String pic=rs.getString("pic");
            		
                	return pic;//返回用户i
                } 
            
            rs.close() ; 
            pstmt.close() ;   
        }catch (Exception e){   
            System.out.println(e.getMessage());   
        }finally{   
            // 关闭数据库连接   
            dbc.close() ;   
        }   
		return "";
	}
	public String SearchByTag(int charg,String roomnum,String rent_type,String housetype,String toward,String chargetype) throws Exception{
		
        String sql = "select * from house where charge between ? and ? && room_number  like ? &&rent_type like ? && " +
        		"room_type like ? && towards like ? && charge_type like ?";
		
		String[] towards={"","朝南","朝北 ","朝东","朝西"};
		String[] renttypes={"","整租","合租 ","整租合租均可"};
		int[][] chargepair={{0,50000},{0,500},{500,1000},{1000,1500},{1500,2000},{2000,3000},{3000,100000}};
		PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
        String str="";
        // 下面是针对数据库的具体操作   
        try{   
            // 连接数据库   
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;  
           // pstmt.setString(1,user.getUsername()) ;  
            pstmt.setInt(1, chargepair[charg][0]);
            pstmt.setInt(2, chargepair[charg][1]);
            pstmt.setString(3,'%'+roomnum+'%');
            pstmt.setString(4,'%'+rent_type+'%');
            pstmt.setString(5,'%'+housetype+'%');
            pstmt.setString(6,'%'+toward+'%');
            pstmt.setString(7,'%'+chargetype+'%');
            System.out.println(pstmt);
        
            // 进行数据库查询操作   
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){   
                // 查询出内容，之后将查询出的内容赋值给person对象   
            	 int id = rs.getInt("house_id");
    	         String title = rs.getString("housetitle");
    	         String add=rs.getString("address");
    	         String date=rs.getDate("release_time").toString();
    	         int storey=rs.getInt("storey");
    	         int charge=rs.getInt("charge");
    	         String to=towards[rs.getInt("towards")];
    	         String renttype=renttypes[rs.getInt("rent_type")];
    	         String pic=Pic(id);
    	         System.out.println(pic);
    	         String img="<div class=\"ui center aligned divided items\"  ><div class=\"item\"><div class=\"image\" style=\"width:230px; \"><img src=\""+pic+"\"></div>";
    	         String chargestr="<div class=\"content\"><a class=\"header\">"+title+"</a><div class=\"meta\"><span class=\"price\" style=\"color:#00B5AD ;font-family:微软雅黑 ; font-size:16px font-weight:bold\">"+charge+"</span>"
    	         +"<span class=\"stay\" style=\"color:#00B5AD ;font-family:微软雅黑 ; font-size:13px;font-weight:bold\" >元/月</span></div>";
    	         String description=" <div class=\"description\"><p>"+add+"</p><p>发布日期："+date+"</p><p>楼层："+storey+"层</p></div>";
    	         String extra="<div class=\"extra\" style=\"font-family:微软雅黑 ;\" ><div class=\"ui label\">"+to+"</div><div class=\"ui label\" >"+renttype+"</div>";
    	         String button=" <input type=\"submit\"   style=\"background-color:#00B5AD;width:70px;height:25px;font-family:微软雅黑 ;color:white;border-top-right-radius:0.3em!important;"
    	        	+ "border-bottom-right-radius:0.3em!important;\" value=\"详细信息\"id=\""+title+"\"  onclick=\"state(this.id)\" /></div></div></div></div>" ;
    	        	
    	         
    	         str+=img+chargestr+description+extra+button;
    	     
    	         
    	         System.out.println(str);
    	         
                } 
            
            rs.close() ; 
            pstmt.close() ;   
        }catch (SQLException e){   
            System.out.println(e.getMessage());   
        }finally{   
            // 关闭数据库连接   
            dbc.close() ;   
        }   
		return str;
		
	}
      
}
