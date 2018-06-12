package kh.report.model.vo;

public class Report {

	private int rp_no;
	private String rp_writer;
	private String rp_receiver;
	private String rp_type;
	private String rp_content;
	private String rp_date;
	
	
	
	
	public Report() {
		super();
	}


	public Report(int rp_no, String rp_writer, String rp_receiver, String rp_type, String rp_content, String rp_date) {
		super();
		this.rp_no = rp_no;
		this.rp_writer = rp_writer;
		this.rp_receiver = rp_receiver;
		this.rp_type = rp_type;
		this.rp_content = rp_content;
		this.rp_date = rp_date;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rp_content == null) ? 0 : rp_content.hashCode());
		result = prime * result + ((rp_date == null) ? 0 : rp_date.hashCode());
		result = prime * result + rp_no;
		result = prime * result + ((rp_receiver == null) ? 0 : rp_receiver.hashCode());
		result = prime * result + ((rp_type == null) ? 0 : rp_type.hashCode());
		result = prime * result + ((rp_writer == null) ? 0 : rp_writer.hashCode());
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
		Report other = (Report) obj;
		if (rp_content == null) {
			if (other.rp_content != null)
				return false;
		} else if (!rp_content.equals(other.rp_content))
			return false;
		if (rp_date == null) {
			if (other.rp_date != null)
				return false;
		} else if (!rp_date.equals(other.rp_date))
			return false;
		if (rp_no != other.rp_no)
			return false;
		if (rp_receiver == null) {
			if (other.rp_receiver != null)
				return false;
		} else if (!rp_receiver.equals(other.rp_receiver))
			return false;
		if (rp_type == null) {
			if (other.rp_type != null)
				return false;
		} else if (!rp_type.equals(other.rp_type))
			return false;
		if (rp_writer == null) {
			if (other.rp_writer != null)
				return false;
		} else if (!rp_writer.equals(other.rp_writer))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Report [rp_no=" + rp_no + ", rp_writer=" + rp_writer + ", rp_receiver=" + rp_receiver + ", rp_type="
				+ rp_type + ", rp_content=" + rp_content + ", rp_date=" + rp_date + "]";
	}


	public int getRp_no() {
		return rp_no;
	}


	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}


	public String getRp_writer() {
		return rp_writer;
	}


	public void setRp_writer(String rp_writer) {
		this.rp_writer = rp_writer;
	}


	public String getRp_receiver() {
		return rp_receiver;
	}


	public void setRp_receiver(String rp_receiver) {
		this.rp_receiver = rp_receiver;
	}


	public String getRp_type() {
		return rp_type;
	}


	public void setRp_type(String rp_type) {
		this.rp_type = rp_type;
	}


	public String getRp_content() {
		return rp_content;
	}


	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}


	public String getRp_date() {
		return rp_date;
	}


	public void setRp_date(String rp_date) {
		this.rp_date = rp_date;
	}
	
	
	
	
	

	
	
	
}
