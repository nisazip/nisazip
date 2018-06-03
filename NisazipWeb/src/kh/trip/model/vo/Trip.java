package kh.trip.model.vo;


public class Trip {
	private String t_id;
	private String t_name;
	private String host_id;
	private int t_max_num;
	private String t_type;
	private String language;
	private String t_start_time;
	private String t_end_time;
	private int price;
	private String t_detail;
	private String t_area;
	private String t_addr;
	private String t_loc;
	private String t_start_date;
	private String t_end_date;
	private float score;
	private String t_date;
	
	
	public Trip() {
		super();
	}

	public Trip(String t_id, String t_name, String host_id, int t_max_num, String t_type, String language,
			String t_start_time, String t_end_time, int price, String t_detail, String t_area, String t_addr,
			String t_loc, String t_start_date, String t_end_date, float score, String t_date) {
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
		this.t_date = t_date;
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

	public String getT_start_time() {
		return t_start_time;
	}

	public void setT_start_time(String t_start_time) {
		this.t_start_time = t_start_time;
	}

	public String getT_end_time() {
		return t_end_time;
	}

	public void setT_end_time(String t_end_time) {
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

	public String getT_start_date() {
		return t_start_date;
	}

	public void setT_start_date(String t_start_date) {
		this.t_start_date = t_start_date;
	}

	public String getT_end_date() {
		return t_end_date;
	}

	public void setT_end_date(String t_end_date) {
		this.t_end_date = t_end_date;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

	@Override
	public String toString() {
		return "Trip [t_id=" + t_id + ", t_name=" + t_name + ", host_id=" + host_id + ", t_max_num=" + t_max_num
				+ ", t_type=" + t_type + ", language=" + language + ", t_start_time=" + t_start_time + ", t_end_time="
				+ t_end_time + ", price=" + price + ", t_detail=" + t_detail + ", t_area=" + t_area + ", t_addr="
				+ t_addr + ", t_loc=" + t_loc + ", t_start_date=" + t_start_date + ", t_end_date=" + t_end_date
				+ ", score=" + score + ", t_date=" + t_date + ", getT_id()=" + getT_id() + ", getT_name()="
				+ getT_name() + ", getHost_id()=" + getHost_id() + ", getT_max_num()=" + getT_max_num()
				+ ", getT_type()=" + getT_type() + ", getLanguage()=" + getLanguage() + ", getT_start_time()="
				+ getT_start_time() + ", getT_end_time()=" + getT_end_time() + ", getPrice()=" + getPrice()
				+ ", getT_detail()=" + getT_detail() + ", getT_area()=" + getT_area() + ", getT_addr()=" + getT_addr()
				+ ", getT_loc()=" + getT_loc() + ", getT_start_date()=" + getT_start_date() + ", getT_end_date()="
				+ getT_end_date() + ", getScore()=" + getScore() + ", getT_date()=" + getT_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
