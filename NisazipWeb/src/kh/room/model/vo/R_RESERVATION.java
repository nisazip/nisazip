package kh.room.model.vo;

import java.io.Serializable;

public class R_RESERVATION implements Serializable {
	 
	private static final long serialVersionUID = 774L;
	private int r_reser_no;
	private String r_id;
	private String user_id;
	private String check_in;
	private String check_out;
	private int people;
	private int total_price;

	public R_RESERVATION(){
		
	}
	
	public R_RESERVATION(int r_reser_no, String r_id, String user_id, String check_in, String check_out, int people,
			int total_price) {
		super();
		this.r_reser_no = r_reser_no;
		this.r_id = r_id;
		this.user_id = user_id;
		this.check_in = check_in;
		this.check_out = check_out;
		this.people = people;
		this.total_price = total_price;
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

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	@Override
	public String toString() {
		return "R_RESERVATION [r_reser_no=" + r_reser_no + ", r_id=" + r_id + ", user_id=" + user_id + ", check_in="
				+ check_in + ", check_out=" + check_out + ", people=" + people + ", total_price=" + total_price + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((check_in == null) ? 0 : check_in.hashCode());
		result = prime * result + ((check_out == null) ? 0 : check_out.hashCode());
		result = prime * result + people;
		result = prime * result + ((r_id == null) ? 0 : r_id.hashCode());
		result = prime * result + r_reser_no;
		result = prime * result + total_price;
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
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
		R_RESERVATION other = (R_RESERVATION) obj;
		if (check_in == null) {
			if (other.check_in != null)
				return false;
		} else if (!check_in.equals(other.check_in))
			return false;
		if (check_out == null) {
			if (other.check_out != null)
				return false;
		} else if (!check_out.equals(other.check_out))
			return false;
		if (people != other.people)
			return false;
		if (r_id == null) {
			if (other.r_id != null)
				return false;
		} else if (!r_id.equals(other.r_id))
			return false;
		if (r_reser_no != other.r_reser_no)
			return false;
		if (total_price != other.total_price)
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		return true;
	}

	
	
}
