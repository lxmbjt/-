package struts2.dao;

import java.util.List;

import struts2.vo.House;

public interface HouseInfoDAO {
	public House queryByHousetitle(String housetitle) throws Exception;
	public String recommendHouse(String city) throws Exception;
	//public House  queryByHouseid(int house_id) throws Exception;
//	public String gethousePic(String house_id) throws Exception;


}
