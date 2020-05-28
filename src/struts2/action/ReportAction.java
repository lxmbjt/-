package struts2.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import struts2.dao.AccusationDAO;
import struts2.dao.impl.AccusationDAOImpl;
import struts2.vo.Accusation;
import struts2.vo.House;
import struts2.vo.User;

public class ReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ActionContext actionContext = ActionContext.getContext(); 
    Map<String, Object> session = actionContext.getSession(); 
	private String accuse;
	private String reason;
	
	
	public String execute() throws Exception { 
		
		User owner=new User();
		House house=new House();
		int user_id;
		int owner_id;
		int house_id;
		HttpServletRequest request = ServletActionContext.getRequest();	
		HttpSession session1 = request.getSession();
		user_id=(int)session1.getAttribute("user_id");
		owner=(User)session1.getAttribute("owner");
		owner_id=owner.getUser_id();
		house=(House)session1.getAttribute("house");
		house_id=house.getHouse_id();
	
		AccusationDAO dao = new AccusationDAOImpl();
		Accusation accusation = new Accusation();
		accusation.setReason(reason);
		accusation.setF_user_id(user_id);
		accusation.setF_house_id(house_id);
		accusation.setF_owner_id(owner_id);
		if(accuse==null) return "fail";
		else{
    switch(Integer.parseInt(accuse)){
    case 1:accusation.setHasRented(1);break;
    case 2:accusation.setHouseNotExist(1);break;
    case 3:accusation.setLocationFake(1);break;
    case 4:accusation.setPriceFake(1);break;
    case 5:accusation.setPictureFake(1);break;
    case 6:accusation.setDescriptionFake(1);break;
    case 7:accusation.setCheated(1);break;
    case 8:accusation.setStealMine(1);break;
    default:accusation.setOthers(1);break;
    
    }}
    	System.out.println("举报类型"+accuse);
    	System.out.println("举报信息"+reason);
    	dao.saveInAccusation(accusation);
    	session.put("accuse", accuse);
    	
    	
    	return "success";
	}

	public String getAccuse() {
		return accuse;
	}

	public void setAccuse(String accuse) {
		this.accuse = accuse;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}



	
}
