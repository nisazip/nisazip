package kh.trip.model.vo;

public class T_RESERVATION {

	private int t_reser_no;
	private String t_id;
	private String user_id;
	private String t_date; // ?
	private int guest_num;
	private int total_price;
	
	public T_RESERVATION(){
		
	}

	public T_RESERVATION(int t_reser_no, String t_id, String user_id, String t_date, int guest_num, int total_price) {
		super();
		this.t_reser_no = t_reser_no;
		this.t_id = t_id;
		this.user_id = user_id;
		this.t_date = t_date;
		this.guest_num = guest_num;
		this.total_price = total_price;
	}

	public int getT_reser_no() {
		return t_reser_no;
	}

	public void setT_reser_no(int t_reser_no) {
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
		return "T_RESERVATION [t_reser_no=" + t_reser_no + ", t_id=" + t_id + ", user_id=" + user_id + ", t_date="
				+ t_date + ", guest_num=" + guest_num + ", total_price=" + total_price + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + guest_num;
		result = prime * result + ((t_date == null) ? 0 : t_date.hashCode());
		result = prime * result + ((t_id == null) ? 0 : t_id.hashCode());
		result = prime * result + t_reser_no;
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
		T_RESERVATION other = (T_RESERVATION) obj;
		if (guest_num != other.guest_num)
			return false;
		if (t_date == null) {
			if (other.t_date != null)
				return false;
		} else if (!t_date.equals(other.t_date))
			return false;
		if (t_id == null) {
			if (other.t_id != null)
				return false;
		} else if (!t_id.equals(other.t_id))
			return false;
		if (t_reser_no != other.t_reser_no)
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
