package kh.manager.model.vo;

public class TripReservList {
	private String t_reser_no;
	private String t_id;
	private String user_id;
	private String t_date;
	private int guest_num;
	private int total_price;
	
	public TripReservList() {
		super();
	}
	
	public TripReservList(String t_reser_no, String t_id, String user_id, String t_date, int guest_num,
			int total_price) {
		super();
		this.t_reser_no = t_reser_no;
		this.t_id = t_id;
		this.user_id = user_id;
		this.t_date = t_date;
		this.guest_num = guest_num;
		this.total_price = total_price;
	}
	public String getT_reser_no() {
		return t_reser_no;
	}
	public void setT_reser_no(String t_reser_no) {
		this.t_reser_no = t_reser_no;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public int getGuest_num() {
		return guest_num;
	}
	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	@Override
	public String toString() {
		return "TripReservList [t_reser_no=" + t_reser_no + ", t_id=" + t_id + ", user_id=" + user_id + ", t_date="
				+ t_date + ", guest_num=" + guest_num + ", total_price=" + total_price + "]";
	}
	
	
}
