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

	@Override
	public String toString() {
		return "Report [rp_no=" + rp_no + ", rp_writer=" + rp_writer + ", rp_receiver=" + rp_receiver + ", rp_type="
				+ rp_type + ", rp_content=" + rp_content + ", rp_date=" + rp_date + "]";
	}
	
	
}
