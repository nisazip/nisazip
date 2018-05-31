package kh.home.model.vo;

import java.sql.Date;

public class Trip {
	private static final long serialVersionUID = 1L;
	
	private String t_id;
	private String t_name;
	private String host_id;
	private int t_max_num;
	private String t_type;
	private String language;
	private Date t_start_time;
	private Date t_end_time;
	private int price;
	private String t_detail;
	private String t_area;
	private String t_addr;
	private String t_loc;
	private Date t_start_date;
	private Date t_end_date;
	private float score;
	private String t_pic;
	
	public Trip() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Trip(String t_id, String t_name, String host_id, int t_max_num, String t_type, String language,
			Date t_start_time, Date t_end_time, int price, String t_detail, String t_area, String t_addr, String t_loc,
			Date t_start_date, Date t_end_date, float score, String t_pic) {
		super();
		this.t_id = t_id;
		this.t_name = t_name;
		this.host_id = host_id;
		this.t_max_num = t_max_num;
		this.t_type = t_type;
		this.language = language;
		this.t_start_time = t_start_time;
		this.t_end_time = t_end_time;
		this.price = price;
		this.t_detail = t_detail;
		this.t_area = t_area;
		this.t_addr = t_addr;
		this.t_loc = t_loc;
		this.t_start_date = t_start_date;
		this.t_end_date = t_end_date;
		this.score = score;
		this.t_pic = t_pic;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public int getT_max_num() {
		return t_max_num;
	}

	public void setT_max_num(int t_max_num) {
		this.t_max_num = t_max_num;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Date getT_start_time() {
		return t_start_time;
	}

	public void setT_start_time(Date t_start_time) {
		this.t_start_time = t_start_time;
	}

	public Date getT_end_time() {
		return t_end_time;
	}

	public void setT_end_time(Date t_end_time) {
		this.t_end_time = t_end_time;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getT_detail() {
		return t_detail;
	}

	public void setT_detail(String t_detail) {
		this.t_detail = t_detail;
	}

	public String getT_area() {
		return t_area;
	}

	public void setT_area(String t_area) {
		this.t_area = t_area;
	}

	public String getT_addr() {
		return t_addr;
	}

	public void setT_addr(String t_addr) {
		this.t_addr = t_addr;
	}

	public String getT_loc() {
		return t_loc;
	}

	public void setT_loc(String t_loc) {
		this.t_loc = t_loc;
	}

	public Date getT_start_date() {
		return t_start_date;
	}

	public void setT_start_date(Date t_start_date) {
		this.t_start_date = t_start_date;
	}

	public Date getT_end_date() {
		return t_end_date;
	}

	public void setT_end_date(Date t_end_date) {
		this.t_end_date = t_end_date;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getT_pic() {
		return t_pic;
	}

	public void setT_pic(String t_pic) {
		this.t_pic = t_pic;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Trip [t_id=" + t_id + ", t_name=" + t_name + ", host_id=" + host_id + ", t_max_num=" + t_max_num
				+ ", t_type=" + t_type + ", language=" + language + ", t_start_time=" + t_start_time + ", t_end_time="
				+ t_end_time + ", price=" + price + ", t_detail=" + t_detail + ", t_area=" + t_area + ", t_addr="
				+ t_addr + ", t_loc=" + t_loc + ", t_start_date=" + t_start_date + ", t_end_date=" + t_end_date
				+ ", score=" + score + ", t_pic=" + t_pic + "]";
	}
	
	
	
	
	
}
