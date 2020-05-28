package struts2.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {  
	private final String DBDRIVER="com.mysql.cj.jdbc.Driver";
	private final String DBURL="jdbc:mysql://localhost:3306/snail";
	private final String DBUSER="root";
	private final String DBPASSWORD="lxm,0026";
	private Connection conn=null;
	
	public DBConnect(){
		try{
			Class.forName(DBDRIVER);
			this.conn=DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	//获得数据库连接
	public Connection getConnection(){
		return this.conn;
	}
	//关闭数据库连接
	public void close(){
		try{
			this.conn.close();
		}catch(Exception e){}
	}
}  
