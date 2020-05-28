package struts2.action;

import java.util.Map;   

import struts2.vo.User;
  
import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;
  
public class LogoutAction extends ActionSupport{   
  
   
	private static final long serialVersionUID = 1L;
	private User user;   
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
   // private static final long serialVersionUID = 1L;   
  
    public String execute() throws Exception {   

        // Map session=(Map)ActionContext.getContext().get(ActionContext.SESSION);   
        session.remove("user_name");
        session.remove("user_nickname");  
        session.remove("user");   
        return "success";
    }
    

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}





    
}  

