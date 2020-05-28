package struts2.vo;

import java.sql.Date;

public class House {
	private int house_id;//主键
	private int f_owner_id;//房主id
	private String housetitle;//房屋标题
	private int province;//省份
	private String city;//所在市
	private String address;//详细地址
	private int room_number;//房间个数
	private int rent_type;//出租方式，整租、合租、不限。
	private int charge;//租金
	private int room_type;//房屋类型，普通住宅、公寓、四合院、商住两用、平房。别墅等。
	private int towards;//房屋朝向，朝南、朝北、朝东、朝西
	private int storey;//所有楼层
	private int area;//房屋面积
	//*********以下为布尔类型********//
	private int elevator;
	private int bed;//提供床
	private int network;//网络
	private int airondition;//空调
	private int balcony;//阳台
	private int refrigerator;//冰箱
	private int toilet;//厕所
	private int kitchen;
	private int bath;//浴室
	private int heating;//供暖
	private int television;//电视
	private int washing_machine;//洗衣机	
	private int water_heater;//热水器
	private int sofa;//沙发
	private int livingroom;//客厅
	private int wardrobe;//衣柜
	private int status;//房屋状态，下架与否
	//*********************//
	private Date release_time;//信息上传时间
	private String comment;//房主描述信息
	private int charge_type;//付款方式，如押一付三、押一付一、押一付二等
	private int decoration;//房屋装修：1精装修，2简装修，3未装修
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public int getF_owner_id() {
		return f_owner_id;
	}
	public void setF_owner_id(int f_owner_id) {
		this.f_owner_id = f_owner_id;
	}
	public String getHousetitle() {
		return housetitle;
	}
	public void setHousetitle(String housetitle) {
		this.housetitle = housetitle;
	}
	public int getProvince() {
		return province;
	}
	public void setProvince(int province) {
		this.province = province;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	public int getRent_type() {
		return rent_type;
	}
	public void setRent_type(int rent_type) {
		this.rent_type = rent_type;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public int getRoom_type() {
		return room_type;
	}
	public void setRoom_type(int room_type) {
		this.room_type = room_type;
	}
	public int getTowards() {
		return towards;
	}
	public void setTowards(int towards) {
		this.towards = towards;
	}
	public int getStorey() {
		return storey;
	}
	public void setStorey(int storey) {
		this.storey = storey;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getNetwork() {
		return network;
	}
	public void setNetwork(int network) {
		this.network = network;
	}
	public int getAirondition() {
		return airondition;
	}
	public void setAirondition(int airondition) {
		this.airondition = airondition;
	}
	public int getBalcony() {
		return balcony;
	}
	public void setBalcony(int balcony) {
		this.balcony = balcony;
	}
	public int getRefrigerator() {
		return refrigerator;
	}
	public void setRefrigerator(int refrigerator) {
		this.refrigerator = refrigerator;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public int getKitchen() {
		return kitchen;
	}
	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}
	public int getBath() {
		return bath;
	}
	public void setBath(int bath) {
		this.bath = bath;
	}
	public int getHeating() {
		return heating;
	}
	public void setHeating(int heating) {
		this.heating = heating;
	}
	public Date getRelease_time() {
		return release_time;
	}
	public void setRelease_time(Date release_time) {
		this.release_time = release_time;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getCharge_type() {
		return charge_type;
	}
	public void setCharge_type(int charge_type) {
		this.charge_type = charge_type;
	}
	public int getLivingroom() {
		return livingroom;
	}
	public void setLivingroom(int livingroom) {
		this.livingroom = livingroom;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getTelevision() {
		return television;
	}
	public void setTelevision(int television) {
		this.television = television;
	}
	public int getWashing_machine() {
		return washing_machine;
	}
	public void setWashing_machine(int washing_machine) {
		this.washing_machine = washing_machine;
	}
	public int getWater_heater() {
		return water_heater;
	}
	public void setWater_heater(int water_heater) {
		this.water_heater = water_heater;
	}
	public int getSofa() {
		return sofa;
	}
	public void setSofa(int sofa) {
		this.sofa = sofa;
	}
	public int getDecoration() {
		return decoration;
	}
	public void setDecoration(int decoration) {
		this.decoration = decoration;
	}
	public int getWardrobe() {
		return wardrobe;
	}
	public void setWardrobe(int wardrobe) {
		this.wardrobe = wardrobe;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
