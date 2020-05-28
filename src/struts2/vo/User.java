package struts2.vo;

public class User {
	//private String username;
	private String password;
	private String repassword;
	private String user_name;
	private int user_id;
	private String user_nickname;
	private int gender;
	private String user_avatar;
	private String phone;
	private String wechat;
	private String e_mail;
	private String idcard_number;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getGender() {
		return gender;
	}

	public void setUser_avatar(String user_avatar) {
		this.user_avatar = user_avatar;
	}

	public String getUser_avatar() {
		return user_avatar;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setIdcard_number(String idcard_number) {
		this.idcard_number = idcard_number;
	}

	public String getIdcard_number() {
		return idcard_number;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getWechat() {
		return wechat;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getRepassword() {
		return repassword;
	}
}
