package kh.trip.model.vo;

import java.sql.Date;

public class Attachment {

	// 사진 DB와 관련된 
	private String pno;
	private String hosting_id;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date upload_date;
	private int file_level;
	
	public Attachment() {
		
	}

	public Attachment(String pno, String hosting_id, String origin_name, String change_name, String file_path,
			Date upload_date, int file_level) {
		super();
		this.pno = pno;
		this.hosting_id = hosting_id;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.file_level = file_level;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getHosting_id() {
		return hosting_id;
	}

	public void setHosting_id(String hosting_id) {
		this.hosting_id = hosting_id;
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

	@Override
	public String toString() {
		return "Attachment [pno=" + pno + ", hosting_id=" + hosting_id + ", origin_name=" + origin_name
				+ ", change_name=" + change_name + ", file_path=" + file_path + ", upload_date=" + upload_date
				+ ", file_level=" + file_level + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((change_name == null) ? 0 : change_name.hashCode());
		result = prime * result + file_level;
		result = prime * result + ((file_path == null) ? 0 : file_path.hashCode());
		result = prime * result + ((hosting_id == null) ? 0 : hosting_id.hashCode());
		result = prime * result + ((origin_name == null) ? 0 : origin_name.hashCode());
		result = prime * result + ((pno == null) ? 0 : pno.hashCode());
		result = prime * result + ((upload_date == null) ? 0 : upload_date.hashCode());
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
		Attachment other = (Attachment) obj;
		if (change_name == null) {
			if (other.change_name != null)
				return false;
		} else if (!change_name.equals(other.change_name))
			return false;
		if (file_level != other.file_level)
			return false;
		if (file_path == null) {
			if (other.file_path != null)
				return false;
		} else if (!file_path.equals(other.file_path))
			return false;
		if (hosting_id == null) {
			if (other.hosting_id != null)
				return false;
		} else if (!hosting_id.equals(other.hosting_id))
			return false;
		if (origin_name == null) {
			if (other.origin_name != null)
				return false;
		} else if (!origin_name.equals(other.origin_name))
			return false;
		if (pno == null) {
			if (other.pno != null)
				return false;
		} else if (!pno.equals(other.pno))
			return false;
		if (upload_date == null) {
			if (other.upload_date != null)
				return false;
		} else if (!upload_date.equals(other.upload_date))
			return false;
		return true;
	}

	
}
