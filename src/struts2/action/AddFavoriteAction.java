package struts2.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import struts2.dao.FavoriteDAO;
import struts2.dao.impl.FavoriteDAOImpl;

public class AddFavoriteAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int house_id;
	private int user_id;
	private int star_result;
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession();
    public AddFavoriteAction(){}
    public String execute() throws Exception {   
    	HttpServletRequest request = ServletActionContext.getRequest();
        house_id = Integer.parseInt(request.getParameter("house_id"));
        user_id=Integer.parseInt(request.getParameter("user_id"));
        
        FavoriteDAO dao=new FavoriteDAOImpl();
        star_result=dao.addFavorite(house_id, user_id);
        
        session.put("star_result",star_result);
        System.out.println(star_result);

        
        return "success";
    
    }
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getStar_result() {
		return star_result;
	}
	public void setStar_result(int star_result) {
		this.star_result = star_result;
	} 

}
