package kh.board.model.vo;

import java.sql.Date;

public class BoardComment {
	
	private int c_no;
	private int b_no;
	private String c_content;
	private String c_writer;
	private Date c_date;
	private String delflag;
	private String c_date_time; // 시간
	
	
	
	public BoardComment() {
		super();
	}



	public BoardComment(int c_no, int b_no, String c_content, String c_writer, Date c_date, String delflag,
			String c_date_time) {
		super();
		this.c_no = c_no;
		this.b_no = b_no;
		this.c_content = c_content;
		this.c_writer = c_writer;
		this.c_date = c_date;
		this.delflag = delflag;
		this.c_date_time = c_date_time; 
	}



	@Override
	public String toString() {
		return "BoardComment [c_no=" + c_no + ", b_no=" + b_no + ", c_content=" + c_content + ", c_writer=" + c_writer
				+ ", c_date=" + c_date + ", delflag=" + delflag + ", c_date_time=" + c_date_time + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + b_no;
		result = prime * result + ((c_content == null) ? 0 : c_content.hashCode());
		result = prime * result + ((c_date == null) ? 0 : c_date.hashCode());
		result = prime * result + ((c_date_time == null) ? 0 : c_date_time.hashCode());
		result = prime * result + c_no;
		result = prime * result + ((c_writer == null) ? 0 : c_writer.hashCode());
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
		BoardComment other = (BoardComment) obj;
		if (b_no != other.b_no)
			return false;
		if (c_content == null) {
			if (other.c_content != null)
				return false;
		} else if (!c_content.equals(other.c_content))
			return false;
		if (c_date == null) {
			if (other.c_date != null)
				return false;
		} else if (!c_date.equals(other.c_date))
			return false;
		if (c_date_time == null) {
			if (other.c_date_time != null)
				return false;
		} else if (!c_date_time.equals(other.c_date_time))
			return false;
		if (c_no != other.c_no)
			return false;
		if (c_writer == null) {
			if (other.c_writer != null)
				return false;
		} else if (!c_writer.equals(other.c_writer))
			return false;
		if (delflag == null) {
			if (other.delflag != null)
				return false;
		} else if (!delflag.equals(other.delflag))
			return false;
		return true;
	}



	public int getC_no() {
		return c_no;
	}



	public void setC_no(int c_no) {
		this.c_no = c_no;
	}



	public int getB_no() {
		return b_no;
	}



	public void setB_no(int b_no) {
		this.b_no = b_no;
	}



	public String getC_content() {
		return c_content;
	}



	public void setC_content(String c_content) {
		this.c_content = c_content;
	}



	public String getC_writer() {
		return c_writer;
	}



	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}



	public Date getC_date() {
		return c_date;
	}



	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}



	public String getDelflag() {
		return delflag;
	}



	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}



	public String getC_date_time() {
		return c_date_time;
	}



	public void setC_date_time(String c_date_time) {
		this.c_date_time = c_date_time;
	}
	
	
	
	
	
}
