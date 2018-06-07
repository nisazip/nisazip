package kh.member.model.vo;

import java.sql.Date;

public class UserPic {
	private int pno;
	private String user_id;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date upload_date;
	private int file_level;
	public UserPic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPic(int pno, String user_id, String origin_name, String change_name, String file_path, Date upload_date,
			int file_level) {
		super();
		this.pno = pno;
		this.user_id = user_id;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.file_level = file_level;
	}
	@Override
	public String toString() {
		return "UserPic [pno=" + pno + ", user_id=" + user_id + ", origin_name=" + origin_name + ", change_name="
				+ change_name + ", file_path=" + file_path + ", upload_date=" + upload_date + ", file_level="
				+ file_level + "]";
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getChange_name() {
		return change_name;
	}
	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public int getFile_level() {
		return file_level;
	}
	public void setFile_level(int file_level) {
		this.file_level = file_level;
	}
	
}
