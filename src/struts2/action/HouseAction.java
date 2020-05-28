package struts2.action;


import java.util.Map;   

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import struts2.dao.FavoriteDAO;
import struts2.dao.PicDAO;
import struts2.dao.UserDAO;
import struts2.dao.impl.FavoriteDAOImpl;
import struts2.dao.impl.HouseInfoDAOImpl;
import struts2.dao.impl.PicDAOImpl;
import struts2.dao.impl.UserDAOImpl;
import struts2.vo.House;
import struts2.vo.User;

import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;
  
public class HouseAction extends ActionSupport{   
  
	private static final long serialVersionUID = 1L;
	
	private String housetitle;
	private int user_id;
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
    private static String recommendHouses;
    private String pics_all;
    private String pics_six;
    private String pics_remain;
    private String[] pic;
    private House house;
    private User owner;
    private User user; 
    
    
  
	


	public String execute() throws Exception {   
    	HttpServletRequest request = ServletActionContext.getRequest();
        housetitle = request.getParameter("housetitle");

        HttpSession session1 =request.getSession();
        user_id=(int)session1.getAttribute("user_id");
        System.out.println("当前登录用户："+user_id);
        
        HouseInfoDAOImpl dao=new HouseInfoDAOImpl();
        PicDAOImpl picdao=new PicDAOImpl();
        UserDAO userdao=new UserDAOImpl();
        FavoriteDAO fdao=new FavoriteDAOImpl();
        
  
		String re = housetitle;
		int result=0;
		
		
		
				
		house=dao.queryByHousetitle(re);
		recommendHouses=dao.recommendHouse(house.getCity());//获取同一城市房源作为推荐房源
		owner=userdao.queryById(house.getF_owner_id());
//	    User u = userdao.Login(user);   
//	    user_id=u.getUser_id();
		String str=picdao.getPicByHouse_id(house.getHouse_id());
		pics_all=picdao.getAllPics();
		System.out.println(pics_all);
		pic=picdao.getPic();
		if(pic.length>6){
			pics_six=picdao.getSixPic();
			pics_remain=picdao.getRemainPic();
			
		}
		result=fdao.ifInFavorite(house.getHouse_id(), user_id);
		System.out.println("收藏结果"+result);
	
		if (re !=""){   
	            
	            //session.put("houseresult", infos[0]); 
	            //session.put("userresult",infos[1]);
				session.put("recommendHouses",recommendHouses);           
	            session.put("pics_all", pics_all);
	            session.put("pics_num",pic.length);
	            session.put("pics_six", pics_six);
	            session.put("pics_remain", pics_remain);
	            session.put("house",house);
	            session.put("firstpic",pic[0]);
	            session.put("slider_pic",pic);
	            session.put("owner",owner);
	            session.put("star_result",result);

	           
	        } else {   
	        	session.put("houseresult", "<div>搜索结果为空</div>");   
	        }   
	    

		return "success";
            
    
    }
      
  
   

	public void setHousetitle(String housetitle) {
		this.housetitle = housetitle;
	}


	public String getHousetitle() {
		return housetitle;
	}

public void setRecommendHouses(String recommendHouses){
	HouseAction.recommendHouses=recommendHouses;
}

public String getRecommendHouses(){
	return recommendHouses;
}




public String[] getPic() {
	return pic;
}




public void setPic(String[] pic) {
	this.pic = pic;
}




public String getPics_six() {
	return pics_six;
}




public void setPics_six(String pics_six) {
	this.pics_six = pics_six;
}




public String getPics_remain() {
	return pics_remain;
}




public void setPics_remain(String pics_remain) {
	this.pics_remain = pics_remain;
}




public House getHouse() {
	return house;
}




public void setHouse(House house) {
	this.house = house;
}




public User getOwner() {
	return owner;
}




public void setOwner(User owner) {
	this.owner = owner;
}




public int getUser_id() {
	return user_id;
}




public void setUser_id(int user_id) {
	this.user_id = user_id;
}




public User getUser() {
	return user;
}




public void setUser(User user) {
	this.user = user;
}


}  
