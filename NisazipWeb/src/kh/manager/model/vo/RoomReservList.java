package kh.manager.model.vo;

public class RoomReservList {
	private int r_reser_no;
	private String r_id;
	private String user_id;
	private String check_in;
	private String check_out;
	private int total_price;
	private int people;
	
	public RoomReservList() {
		super();
	}
	public RoomReservList(int r_reser_no, String r_id, String user_id, String check_in, String check_out,
			int total_price, int people) {
		super();
		this.r_reser_no = r_reser_no;
		this.r_id = r_id;
		this.user_id = user_id;
		this.check_in = check_in;
		this.check_out = check_out;
		this.total_price = total_price;
		this.people = people;
	}
	public int getR_reser_no() {
		return r_reser_no;
	}
	public void setR_reser_no(int r_reser_no) {
		this.r_reser_no = r_reser_no;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	@Override
	public String toString() {
		return "RoomReservList [r_reser_no=" + r_reser_no + ", r_id=" + r_id + ", user_id=" + user_id + ", check_in="
				+ check_in + ", check_out=" + check_out + ", total_price=" + total_price + ", people=" + people + "]";
	}
	
	
}
