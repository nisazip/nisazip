package kh.member.model.vo;

import java.sql.Date;

public class Member {
	
	
	private int user_no;
	private String user_id;
	private String password;
	private String user_name;
	private String email;
	private String phone;
	private char gender;
	private String birthdate;
	private String likerooms;
	private String liketrips;
	private int r_hosting;
	private int t_hosting;
	private Date join_date;
	
	public Member() {
		super();
	}

	public Member(int user_no, String user_id, String password, String user_name, String email, String phone,
			char gender, String birthdate, String likerooms, String liketrips, int r_hosting, int t_hosting,
			Date join_date) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.password = password;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthdate = birthdate;
		this.likerooms = likerooms;
		this.liketrips = liketrips;
		this.r_hosting = r_hosting;
		this.t_hosting = t_hosting;
		this.join_date = join_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getLikerooms() {
		return likerooms;
	}

	public void setLikerooms(String likerooms) {
		this.likerooms = likerooms;
	}

	public String getLiketrips() {
		return liketrips;
	}

	public void setLiketrips(String liketrips) {
		this.liketrips = liketrips;
	}

	public int getR_hosting() {
		return r_hosting;
	}

	public void setR_hosting(int r_hosting) {
		this.r_hosting = r_hosting;
	}

	public int getT_hosting() {
		return t_hosting;
	}

	public void setT_hosting(int t_hosting) {
		this.t_hosting = t_hosting;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birthdate == null) ? 0 : birthdate.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + gender;
		result = prime * result + ((join_date == null) ? 0 : join_date.hashCode());
		result = prime * result + ((likerooms == null) ? 0 : likerooms.hashCode());
		result = prime * result + ((liketrips == null) ? 0 : liketrips.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + r_hosting;
		result = prime * result + t_hosting;
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((user_name == null) ? 0 : user_name.hashCode());
		result = prime * result + user_no;
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
		Member other = (Member) obj;
		if (birthdate == null) {
			if (other.birthdate != null)
				return false;
		} else if (!birthdate.equals(other.birthdate))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender != other.gender)
			return false;
		if (join_date == null) {
			if (other.join_date != null)
				return false;
		} else if (!join_date.equals(other.join_date))
			return false;
		if (likerooms == null) {
			if (other.likerooms != null)
				return false;
		} else if (!likerooms.equals(other.likerooms))
			return false;
		if (liketrips == null) {
			if (other.liketrips != null)
				return false;
		} else if (!liketrips.equals(other.liketrips))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (r_hosting != other.r_hosting)
			return false;
		if (t_hosting != other.t_hosting)
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_name == null) {
			if (other.user_name != null)
				return false;
		} else if (!user_name.equals(other.user_name))
			return false;
		if (user_no != other.user_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_id=" + user_id + ", password=" + password + ", user_name="
				+ user_name + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", birthdate="
				+ birthdate + ", likerooms=" + likerooms + ", liketrips=" + liketrips + ", r_hosting=" + r_hosting
				+ ", t_hosting=" + t_hosting + ", join_date=" + join_date + "]";
	}
	
	
	
	
}
