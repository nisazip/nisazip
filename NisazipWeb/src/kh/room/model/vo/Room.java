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
	private Date r_start_date;
	private Date r_end_date;
	private float score;
	private Date r_date;
	
	public Room() {
		super();
	}

	public Room(String r_id, String r_name, String host_id, int r_max_num, String r_type, String r_type2,
			String r_option, int room_num, int toilet_num, int bed_num, String r_detail, String r_role, int price,
			String r_area, String r_addr, String r_loc, Date r_start_date, Date r_end_date, float score, Date r_date) {
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

	public Date getR_start_date() {
		return r_start_date;
	}

	public void setR_start_date(Date r_start_date) {
		this.r_start_date = r_start_date;
	}

	public Date getR_end_date() {
		return r_end_date;
	}

	public void setR_end_date(Date r_end_date) {
		this.r_end_date = r_end_date;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bed_num;
		result = prime * result + ((host_id == null) ? 0 : host_id.hashCode());
		result = prime * result + price;
		result = prime * result + ((r_addr == null) ? 0 : r_addr.hashCode());
		result = prime * result + ((r_area == null) ? 0 : r_area.hashCode());
		result = prime * result + ((r_date == null) ? 0 : r_date.hashCode());
		result = prime * result + ((r_detail == null) ? 0 : r_detail.hashCode());
		result = prime * result + ((r_end_date == null) ? 0 : r_end_date.hashCode());
		result = prime * result + ((r_id == null) ? 0 : r_id.hashCode());
		result = prime * result + ((r_loc == null) ? 0 : r_loc.hashCode());
		result = prime * result + r_max_num;
		result = prime * result + ((r_name == null) ? 0 : r_name.hashCode());
		result = prime * result + ((r_option == null) ? 0 : r_option.hashCode());
		result = prime * result + ((r_role == null) ? 0 : r_role.hashCode());
		result = prime * result + ((r_start_date == null) ? 0 : r_start_date.hashCode());
		result = prime * result + ((r_type == null) ? 0 : r_type.hashCode());
		result = prime * result + ((r_type2 == null) ? 0 : r_type2.hashCode());
		result = prime * result + room_num;
		result = prime * result + Float.floatToIntBits(score);
		result = prime * result + toilet_num;
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
		Room other = (Room) obj;
		if (bed_num != other.bed_num)
			return false;
		if (host_id == null) {
			if (other.host_id != null)
				return false;
		} else if (!host_id.equals(other.host_id))
			return false;
		if (price != other.price)
			return false;
		if (r_addr == null) {
			if (other.r_addr != null)
				return false;
		} else if (!r_addr.equals(other.r_addr))
			return false;
		if (r_area == null) {
			if (other.r_area != null)
				return false;
		} else if (!r_area.equals(other.r_area))
			return false;
		if (r_date == null) {
			if (other.r_date != null)
				return false;
		} else if (!r_date.equals(other.r_date))
			return false;
		if (r_detail == null) {
			if (other.r_detail != null)
				return false;
		} else if (!r_detail.equals(other.r_detail))
			return false;
		if (r_end_date == null) {
			if (other.r_end_date != null)
				return false;
		} else if (!r_end_date.equals(other.r_end_date))
			return false;
		if (r_id == null) {
			if (other.r_id != null)
				return false;
		} else if (!r_id.equals(other.r_id))
			return false;
		if (r_loc == null) {
			if (other.r_loc != null)
				return false;
		} else if (!r_loc.equals(other.r_loc))
			return false;
		if (r_max_num != other.r_max_num)
			return false;
		if (r_name == null) {
			if (other.r_name != null)
				return false;
		} else if (!r_name.equals(other.r_name))
			return false;
		if (r_option == null) {
			if (other.r_option != null)
				return false;
		} else if (!r_option.equals(other.r_option))
			return false;
		if (r_role == null) {
			if (other.r_role != null)
				return false;
		} else if (!r_role.equals(other.r_role))
			return false;
		if (r_start_date == null) {
			if (other.r_start_date != null)
				return false;
		} else if (!r_start_date.equals(other.r_start_date))
			return false;
		if (r_type == null) {
			if (other.r_type != null)
				return false;
		} else if (!r_type.equals(other.r_type))
			return false;
		if (r_type2 == null) {
			if (other.r_type2 != null)
				return false;
		} else if (!r_type2.equals(other.r_type2))
			return false;
		if (room_num != other.room_num)
			return false;
		if (Float.floatToIntBits(score) != Float.floatToIntBits(other.score))
			return false;
		if (toilet_num != other.toilet_num)
			return false;
		return true;
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
