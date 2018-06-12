package kh.board.model.vo;

import java.sql.Date;

public class Board {

	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private int b_count;
	private Date b_date;
	private String delflag;
	
	
	private String b_date_time;  // DB x 시간받을 때만.
	

	
	public Board() {
		super();
	}
	public Board(int b_no, String b_title, String b_content, String b_writer, int b_count, Date b_date,
			String delflag) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writer = b_writer;
		this.b_count = b_count;
		this.b_date = b_date;
		this.delflag = delflag;
	}
	
	public Board(int b_no, String b_title, String b_content, String b_writer, int b_count, Date b_date, String delflag,
			String b_date_time) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writer = b_writer;
		this.b_count = b_count;
		this.b_date = b_date;
		this.delflag = delflag;
		this.b_date_time = b_date_time;
	}
	public String getB_date_time() {
		return b_date_time;
	}
	public void setB_date_time(String b_date_time) {
		this.b_date_time = b_date_time;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_writer=" + b_writer
				+ ", b_count=" + b_count + ", b_date=" + b_date + ", delflag=" + delflag + "]\n";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((b_content == null) ? 0 : b_content.hashCode());
		result = prime * result + b_count;
		result = prime * result + ((b_date == null) ? 0 : b_date.hashCode());
		result = prime * result + b_no;
		result = prime * result + ((b_title == null) ? 0 : b_title.hashCode());
		result = prime * result + ((b_writer == null) ? 0 : b_writer.hashCode());
		result = prime * result + ((delflag == null) ? 0 : delflag.hashCode());
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
		Board other = (Board) obj;
		if (b_content == null) {
			if (other.b_content != null)
				return false;
		} else if (!b_content.equals(other.b_content))
			return false;
		if (b_count != other.b_count)
			return false;
		if (b_date == null) {
			if (other.b_date != null)
				return false;
		} else if (!b_date.equals(other.b_date))
			return false;
		if (b_no != other.b_no)
			return false;
		if (b_title == null) {
			if (other.b_title != null)
				return false;
		} else if (!b_title.equals(other.b_title))
			return false;
		if (b_writer == null) {
			if (other.b_writer != null)
				return false;
		} else if (!b_writer.equals(other.b_writer))
			return false;
		if (delflag == null) {
			if (other.delflag != null)
				return false;
		} else if (!delflag.equals(other.delflag))
			return false;
		return true;
	}
	
	
	
	
}
