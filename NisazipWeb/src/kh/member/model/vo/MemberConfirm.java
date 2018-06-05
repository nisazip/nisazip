package kh.member.model.vo;

public class MemberConfirm {
	private int user_no;
	private String pic_path;
	private String pic_check;
	public MemberConfirm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberConfirm(int user_no, String pic_path, String pic_check) {
		super();
		this.user_no = user_no;
		this.pic_path = pic_path;
		this.pic_check = pic_check;
	}
	@Override
	public String toString() {
		return "MemberConfirm [user_no=" + user_no + ", pic_path=" + pic_path + ", pic_check=" + pic_check + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_check() {
		return pic_check;
	}
	public void setPic_check(String pic_check) {
		this.pic_check = pic_check;
	}
	
}
