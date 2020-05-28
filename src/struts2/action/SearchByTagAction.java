


package struts2.action;

import java.util.Map;   

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import struts2.dao.SearchDAO;

import struts2.dao.impl.SearchDAOImpl;

  
import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;
  
public class SearchByTagAction extends ActionSupport{   
  
	private static final long serialVersionUID = 1L;
	
	private String charge;
	private String roomnum;
	private String renttype;
	private String housetype;
	private String toward;
	private String chargetype;
	
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
   // private static final long serialVersionUID = 1L;   
    
    public String execute() throws Exception {   
    	HttpServletRequest request = ServletActionContext.getRequest();
        setCharge(request.getParameter("menu1"));
        setRoomnum(request.getParameter("menu2"));
        setRenttype(request.getParameter("menu3"));
        setHousetype(request.getParameter("menu4"));
        setToward(request.getParameter("menu5"));
        setChargetype(request.getParameter("menu6"));
        System.out.println(charge);
    	SearchDAO dao = new SearchDAOImpl();   
  
		String re = dao.SearchByTag(Integer.parseInt(charge),roomnum,renttype,housetype,toward,chargetype)  ; 
		
		if (re !=""){   
	            
	            session.put("searchresult", re);   

	           
	        } else {   
	        	session.put("searchresult", "<div>ËÑË÷½á¹ûÎª¿Õ</div>");   
	        }   
	    

		return "success";
            
    
    }

	public void setChargetype(String chargetype) {
		this.chargetype = chargetype;
	}

	public String getChargetype() {
		return chargetype;
	}

	public void setToward(String toward) {
		this.toward = toward;
	}

	public String getToward() {
		return toward;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}

	public String getRoomnum() {
		return roomnum;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getCharge() {
		return charge;
	}

	public void setRenttype(String renttype) {
		this.renttype = renttype;
	}

	public String getRenttype() {
		return renttype;
	}
      
  
   



	





    
}  

