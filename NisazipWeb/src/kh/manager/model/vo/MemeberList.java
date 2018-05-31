package kh.manager.model.vo;

import java.sql.Date;

import kh.member.model.vo.Member;

public class MemeberList extends Member{
	private int rCnt;
	private char oAuth;
	
	public MemeberList() {
		super();
	}

	public MemeberList(int user_no, String user_id, String password, String user_name, String email, String phone,
			char gender, String birthdate, String likerooms, String liketrips, int r_hosting, int t_hosting,
			Date join_date, int rCnt, char oAuth) {
		super(user_no, user_id, password, user_name, email, phone, gender, birthdate, likerooms, liketrips, r_hosting, t_hosting, join_date);
		this.rCnt = rCnt;
		this.oAuth = oAuth;
	}

	public int getrCnt() {
		return rCnt;
	}

	public void setrCnt(int rCnt) {
		this.rCnt = rCnt;
	}

	public char getOauth() {
		return oAuth;
	}

	public void setOauth(char oAuth) {
		this.oAuth = oAuth;
	}

	@Override
	public String toString() {
		return "MemeberList [rCnt=" + rCnt + ", oAhth=" + oAuth + ", getUser_no()=" + getUser_no() + ", getUser_id()="
				+ getUser_id() + ", getPassword()=" + getPassword() + ", getUser_name()=" + getUser_name()
				+ ", getEmail()=" + getEmail() + ", getPhone()=" + getPhone() + ", getGender()=" + getGender()
				+ ", getBirthdate()=" + getBirthdate() + ", getLikerooms()=" + getLikerooms() + ", getLiketrips()="
				+ getLiketrips() + ", getR_hosting()=" + getR_hosting() + ", getT_hosting()=" + getT_hosting()
				+ ", getJoin_date()=" + getJoin_date() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + "]";
	}
	
	
	
	
	
}
