package kh.room.model.vo;

import java.sql.Date;

public class Room {
	private String r_id;
	private String r_name;
	private String host_id;
	private int r_max_num;
	private String r_type;
	private String r_type2;
	private String r_option;
	private int room_num;
	private int toilet_num;
	private int bed_num;
	private String r_detail;
	private String r_role;
	private int price;
	private String r_area;
	private String r_addr;
	private String r_loc;
	private String r_start_date;
	private String r_end_date;
	private float score;
	private String r_date;
	
	public Room() {
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public int getR_max_num() {
		return r_max_num;
	}

	public void setR_max_num(int r_max_num) {
		this.r_max_num = r_max_num;
	}

	public String getR_type() {
		return r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public String getR_type2() {
		return r_type2;
	}

	public void setR_type2(String r_type2) {
		this.r_type2 = r_type2;
	}

	public String getR_option() {
		return r_option;
	}

	public void setR_option(String r_option) {
		this.r_option = r_option;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getToilet_num() {
		return toilet_num;
	}

	public void setToilet_num(int toilet_num) {
		this.toilet_num = toilet_num;
	}

	public int getBed_num() {
		return bed_num;
	}

	public void setBed_num(int bed_num) {
		this.bed_num = bed_num;
	}

	public String getR_detail() {
		return r_detail;
	}

	public void setR_detail(String r_detail) {
		this.r_detail = r_detail;
	}

	public String getR_role() {
		return r_role;
	}

	public void setR_role(String r_role) {
		this.r_role = r_role;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getR_area() {
		return r_area;
	}

	public void setR_area(String r_area) {
		this.r_area = r_area;
	}

	public String getR_addr() {
		return r_addr;
	}

	public void setR_addr(String r_addr) {
		this.r_addr = r_addr;
	}

	public String getR_loc() {
		return r_loc;
	}

	public void setR_loc(String r_loc) {
		this.r_loc = r_loc;
	}

	public String getR_start_date() {
		return r_start_date;
	}

	public void setR_start_date(String r_start_date) {
		this.r_start_date = r_start_date;
	}

	public String getR_end_date() {
		return r_end_date;
	}

	public void setR_end_date(String r_end_date) {
		this.r_end_date = r_end_date;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public Room(String r_id, String r_name, String host_id, int r_max_num, String r_type, String r_type2,
			String r_option, int room_num, int toilet_num, int bed_num, String r_detail, String r_role, int price,
			String r_area, String r_addr, String r_loc, String r_start_date, String r_end_date, float score,
			String r_date) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.host_id = host_id;
		this.r_max_num = r_max_num;
		this.r_type = r_type;
		this.r_type2 = r_type2;
		this.r_option = r_option;
		this.room_num = room_num;
		this.toilet_num = toilet_num;
		this.bed_num = bed_num;
		this.r_detail = r_detail;
		this.r_role = r_role;
		this.price = price;
		this.r_area = r_area;
		this.r_addr = r_addr;
		this.r_loc = r_loc;
		this.r_start_date = r_start_date;
		this.r_end_date = r_end_date;
		this.score = score;
		this.r_date = r_date;
	}

	public Room(String r_id, String r_name, int r_max_num, String r_type, String r_type2, String r_option, int room_num,
			int toilet_num, int bed_num, String r_detail, String r_role, int price, String r_area, String r_addr,
			String r_start_date, String r_end_date) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.r_max_num = r_max_num;
		this.r_type = r_type;
		this.r_type2 = r_type2;
		this.r_option = r_option;
		this.room_num = room_num;
		this.toilet_num = toilet_num;
		this.bed_num = bed_num;
		this.r_detail = r_detail;
		this.r_role = r_role;
		this.price = price;
		this.r_area = r_area;
		this.r_addr = r_addr;
		this.r_start_date = r_start_date;
		this.r_end_date = r_end_date;
	}

	@Override
	public String toString() {
		return "Room [r_id=" + r_id + ", r_name=" + r_name + ", host_id=" + host_id + ", r_max_num=" + r_max_num
				+ ", r_type=" + r_type + ", r_type2=" + r_type2 + ", r_option=" + r_option + ", room_num=" + room_num
				+ ", toilet_num=" + toilet_num + ", bed_num=" + bed_num + ", r_detail=" + r_detail + ", r_role="
				+ r_role + ", price=" + price + ", r_area=" + r_area + ", r_addr=" + r_addr + ", r_loc=" + r_loc
				+ ", r_start_date=" + r_start_date + ", r_end_date=" + r_end_date + ", score=" + score + ", r_date="
				+ r_date + "]";
	}

	
	
	
}
