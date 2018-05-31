package kh.trip.model.vo;

import java.sql.Date;

public class Trip {
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
	private Date t_date;
	
	public Trip() {
		super();
	}
	
	public Trip(String t_id, String t_name, String host_id, int t_max_num, String t_type, String language,
			Date t_start_time, Date t_end_time, int price, String t_detail, String t_area, String t_addr, String t_loc,
			Date t_start_date, Date t_end_date, float score, Date t_date) {
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

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((host_id == null) ? 0 : host_id.hashCode());
		result = prime * result + ((language == null) ? 0 : language.hashCode());
		result = prime * result + price;
		result = prime * result + Float.floatToIntBits(score);
		result = prime * result + ((t_addr == null) ? 0 : t_addr.hashCode());
		result = prime * result + ((t_area == null) ? 0 : t_area.hashCode());
		result = prime * result + ((t_date == null) ? 0 : t_date.hashCode());
		result = prime * result + ((t_detail == null) ? 0 : t_detail.hashCode());
		result = prime * result + ((t_end_date == null) ? 0 : t_end_date.hashCode());
		result = prime * result + ((t_end_time == null) ? 0 : t_end_time.hashCode());
		result = prime * result + ((t_id == null) ? 0 : t_id.hashCode());
		result = prime * result + ((t_loc == null) ? 0 : t_loc.hashCode());
		result = prime * result + t_max_num;
		result = prime * result + ((t_name == null) ? 0 : t_name.hashCode());
		result = prime * result + ((t_start_date == null) ? 0 : t_start_date.hashCode());
		result = prime * result + ((t_start_time == null) ? 0 : t_start_time.hashCode());
		result = prime * result + ((t_type == null) ? 0 : t_type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Trip other = (Trip) obj;
		if (host_id == null) {
			if (other.host_id != null)
				return false;
		} else if (!host_id.equals(other.host_id))
			return false;
		if (language == null) {
			if (other.language != null)
				return false;
		} else if (!language.equals(other.language))
			return false;
		if (price != other.price)
			return false;
		if (Float.floatToIntBits(score) != Float.floatToIntBits(other.score))
			return false;
		if (t_addr == null) {
			if (other.t_addr != null)
				return false;
		} else if (!t_addr.equals(other.t_addr))
			return false;
		if (t_area == null) {
			if (other.t_area != null)
				return false;
		} else if (!t_area.equals(other.t_area))
			return false;
		if (t_date == null) {
			if (other.t_date != null)
				return false;
		} else if (!t_date.equals(other.t_date))
			return false;
		if (t_detail == null) {
			if (other.t_detail != null)
				return false;
		} else if (!t_detail.equals(other.t_detail))
			return false;
		if (t_end_date == null) {
			if (other.t_end_date != null)
				return false;
		} else if (!t_end_date.equals(other.t_end_date))
			return false;
		if (t_end_time == null) {
			if (other.t_end_time != null)
				return false;
		} else if (!t_end_time.equals(other.t_end_time))
			return false;
		if (t_id == null) {
			if (other.t_id != null)
				return false;
		} else if (!t_id.equals(other.t_id))
			return false;
		if (t_loc == null) {
			if (other.t_loc != null)
				return false;
		} else if (!t_loc.equals(other.t_loc))
			return false;
		if (t_max_num != other.t_max_num)
			return false;
		if (t_name == null) {
			if (other.t_name != null)
				return false;
		} else if (!t_name.equals(other.t_name))
			return false;
		if (t_start_date == null) {
			if (other.t_start_date != null)
				return false;
		} else if (!t_start_date.equals(other.t_start_date))
			return false;
		if (t_start_time == null) {
			if (other.t_start_time != null)
				return false;
		} else if (!t_start_time.equals(other.t_start_time))
			return false;
		if (t_type == null) {
			if (other.t_type != null)
				return false;
		} else if (!t_type.equals(other.t_type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Trip [t_id=" + t_id + ", t_name=" + t_name + ", host_id=" + host_id + ", t_max_num=" + t_max_num
				+ ", t_type=" + t_type + ", language=" + language + ", t_start_time=" + t_start_time + ", t_end_time="
				+ t_end_time + ", price=" + price + ", t_detail=" + t_detail + ", t_area=" + t_area + ", t_addr="
				+ t_addr + ", t_loc=" + t_loc + ", t_start_date=" + t_start_date + ", t_end_date=" + t_end_date
				+ ", score=" + score + ", t_date=" + t_date + "]";
	}
	
	
}
