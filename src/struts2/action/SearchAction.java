


package struts2.action;

import java.util.Map;   

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import struts2.dao.SearchDAO;

import struts2.dao.impl.SearchDAOImpl;

  
import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;
  
public class SearchAction extends ActionSupport{   
  
	private static final long serialVersionUID = 1L;
	
	private String province;
	private String search;
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
   // private static final long serialVersionUID = 1L;   
    
    public String execute() throws Exception {   
    	HttpServletRequest request = ServletActionContext.getRequest();
        province = request.getParameter("province");
        search=request.getParameter("search");
        System.out.println("province in action"+province);
        System.out.println("search in action"+search);
    	SearchDAO dao = new SearchDAOImpl();   
  
		String re = dao.Search(Integer.parseInt(province),search)  ; 
		
		if (re !=""){   
	            
	            session.put("searchresult", re);   

	           
	        } else {   
	        	session.put("searchresult", "<div>ËÑË÷½á¹ûÎª¿Õ</div>");   
	        }   
	    

		return "success";
            
    
    }
      
  
   



	public void setprovince(String province) {
		this.province = province;
	}



	public String getprovince() {
		return province;
	}



	public void setSearch(String search) {
		this.search = search;
	}



	public String getSearch() {
		return search;
	}





    
}  

