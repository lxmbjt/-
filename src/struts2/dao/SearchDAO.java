package struts2.dao;

import java.sql.ResultSet;



public interface SearchDAO {
	public String Search(int province,String search) throws Exception;
	public String Pic(int house_id) throws Exception;
	public String SearchByTag(int charg,String roomnum,String rent_type,String housetype,String toward,String chargetype) throws Exception;
}
