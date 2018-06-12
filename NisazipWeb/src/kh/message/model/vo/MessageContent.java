package kh.message.model.vo;

import java.sql.Date;

public class MessageContent {

	private int ms_no;
	private int m_no;
	private String ms_writer;
	private String ms_receiver;
	private String ms_content;
	private Date ms_date;
	private String ms_date_time; // db x 시간 때문

	public MessageContent() {
		super();
	}

	
	
	
	public MessageContent(int ms_no, int m_no, String ms_writer, String ms_receiver, String ms_content, Date ms_date) {
		super();
		this.ms_no = ms_no;
		this.m_no = m_no;
		this.ms_writer = ms_writer;
		this.ms_receiver = ms_receiver;
		this.ms_content = ms_content;
		this.ms_date = ms_date;
	}




	public MessageContent(int ms_no, int m_no, String ms_writer, String ms_receiver, String ms_content, Date ms_date,
			String ms_date_time) {
		super();
		this.ms_no = ms_no;
		this.m_no = m_no;
		this.ms_writer = ms_writer;
		this.ms_receiver = ms_receiver;
		this.ms_content = ms_content;
		this.ms_date = ms_date;
		this.ms_date_time = ms_date_time;
	}




	@Override
	public String toString() {
		return "MessageContent [ms_no=" + ms_no + ", m_no=" + m_no + ", ms_writer=" + ms_writer + ", ms_receiver="
				+ ms_receiver + ", ms_content=" + ms_content + ", ms_date=" + ms_date + ", ms_date_time=" + ms_date_time
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + m_no;
		result = prime * result + ((ms_content == null) ? 0 : ms_content.hashCode());
		result = prime * result + ((ms_date == null) ? 0 : ms_date.hashCode());
		result = prime * result + ((ms_date_time == null) ? 0 : ms_date_time.hashCode());
		result = prime * result + ms_no;
		result = prime * result + ((ms_receiver == null) ? 0 : ms_receiver.hashCode());
		result = prime * result + ((ms_writer == null) ? 0 : ms_writer.hashCode());
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
		MessageContent other = (MessageContent) obj;
		if (m_no != other.m_no)
			return false;
		if (ms_content == null) {
			if (other.ms_content != null)
				return false;
		} else if (!ms_content.equals(other.ms_content))
			return false;
		if (ms_date == null) {
			if (other.ms_date != null)
				return false;
		} else if (!ms_date.equals(other.ms_date))
			return false;
		if (ms_date_time == null) {
			if (other.ms_date_time != null)
				return false;
		} else if (!ms_date_time.equals(other.ms_date_time))
			return false;
		if (ms_no != other.ms_no)
			return false;
		if (ms_receiver == null) {
			if (other.ms_receiver != null)
				return false;
		} else if (!ms_receiver.equals(other.ms_receiver))
			return false;
		if (ms_writer == null) {
			if (other.ms_writer != null)
				return false;
		} else if (!ms_writer.equals(other.ms_writer))
			return false;
		return true;
	}

	public int getMs_no() {
		return ms_no;
	}

	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getMs_writer() {
		return ms_writer;
	}

	public void setMs_writer(String ms_writer) {
		this.ms_writer = ms_writer;
	}

	public String getMs_receiver() {
		return ms_receiver;
	}

	public void setMs_receiver(String ms_receiver) {
		this.ms_receiver = ms_receiver;
	}

	public String getMs_content() {
		return ms_content;
	}

	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}

	public Date getMs_date() {
		return ms_date;
	}

	public void setMs_date(Date ms_date) {
		this.ms_date = ms_date;
	}

	public String getMs_date_time() {
		return ms_date_time;
	}

	public void setMs_date_time(String ms_date_time) {
		this.ms_date_time = ms_date_time;
	}

	
}
