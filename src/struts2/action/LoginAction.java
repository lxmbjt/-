package struts2.action;

import java.util.Map;   

import struts2.dao.UserDAO;
import struts2.dao.impl.UserDAOImpl;
import struts2.vo.User;
  
import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;
  
public class LoginAction extends ActionSupport{   
  
   
	private static final long serialVersionUID = 1L;
	private User user;   
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
   // private static final long serialVersionUID = 1L;   
  
    public String execute() throws Exception {   
        UserDAO dao = new UserDAOImpl();   
        User u = dao.Login(user);   
        if(u !=null){   
        	
            // Map session=(Map)ActionContext.getContext().get(ActionContext.SESSION);   
            session.put("user_name", u.getUser_name());   
            session.put("user_nickname", u.getUser_nickname());  
            session.put("user", u);  
            session.put("user_id", u.getUser_id());
           
            
            return "success";
        } else {   
        	this.addActionError("’À∫≈ªÚ√‹¬Î ‰»Î¥ÌŒÛ£¨«Î÷ÿ–¬ ‰»Î£°");
            return "input";   
        }   
    }
   
   

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}





    
}  

