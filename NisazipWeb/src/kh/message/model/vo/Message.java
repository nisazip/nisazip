package kh.message.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Message {

	private int m_no;
	private String m_writer;
	private String m_receiver;
	private String hosting_id;
	// private Date checkin;
	// private Date checkout;
	private String checkin;
	private String checkout;
	private int guest_num;
	private String m_content;
	private String m_date;
	private int m_read;
	
	
	
	
	
	
	public int getM_read() {
		return m_read;
	}

	public void setM_read(int m_read) {
		this.m_read = m_read;
	}

	public Message(int m_no, String m_writer, String m_receiver, String hosting_id, String checkin, String checkout,
			int guest_num, String m_content, String m_date, int m_read) {
		super();
		this.m_no = m_no;
		this.m_writer = m_writer;
		this.m_receiver = m_receiver;
		this.hosting_id = hosting_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.guest_num = guest_num;
		this.m_content = m_content;
		this.m_date = m_date;
		this.m_read = m_read;
	}

	public Message(int m_no, String m_writer, String m_receiver, String hosting_id, String checkin, String checkout,
			int guest_num, String m_content, String m_date) {
		super();
		this.m_no = m_no;
		this.m_writer = m_writer;
		this.m_receiver = m_receiver;
		this.hosting_id = hosting_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.guest_num = guest_num;
		this.m_content = m_content;
		this.m_date = m_date;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public Message() {
		super();
	}

	public Message(String m_writer, String m_receiver, String hosting_id, String checkin, String checkout,
			int guest_num, String m_content) {
		super();
		this.m_writer = m_writer;
		this.m_receiver = m_receiver;
		this.hosting_id = hosting_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.guest_num = guest_num;
		this.m_content = m_content;
	}

	public Message(int m_no, String m_writer, String m_receiver, String hosting_id, String checkin, String checkout,
			int guest_num, String m_content) {
		super();
		this.m_no = m_no;
		this.m_writer = m_writer;
		this.m_receiver = m_receiver;
		this.hosting_id = hosting_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.guest_num = guest_num;
		this.m_content = m_content;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_writer() {
		return m_writer;
	}

	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}

	public String getM_receiver() {
		return m_receiver;
	}

	public void setM_receiver(String m_receiver) {
		this.m_receiver = m_receiver;
	}

	public String getHosting_id() {
		return hosting_id;
	}

	public void setHosting_id(String hosting_id) {
		this.hosting_id = hosting_id;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkin == null) ? 0 : checkin.hashCode());
		result = prime * result + ((checkout == null) ? 0 : checkout.hashCode());
		result = prime * result + guest_num;
		result = prime * result + ((hosting_id == null) ? 0 : hosting_id.hashCode());
		result = prime * result + ((m_content == null) ? 0 : m_content.hashCode());
		result = prime * result + m_no;
		result = prime * result + ((m_receiver == null) ? 0 : m_receiver.hashCode());
		result = prime * result + ((m_writer == null) ? 0 : m_writer.hashCode());
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
		Message other = (Message) obj;
		if (checkin == null) {
			if (other.checkin != null)
				return false;
		} else if (!checkin.equals(other.checkin))
			return false;
		if (checkout == null) {
			if (other.checkout != null)
				return false;
		} else if (!checkout.equals(other.checkout))
			return false;
		if (guest_num != other.guest_num)
			return false;
		if (hosting_id == null) {
			if (other.hosting_id != null)
				return false;
		} else if (!hosting_id.equals(other.hosting_id))
			return false;
		if (m_content == null) {
			if (other.m_content != null)
				return false;
		} else if (!m_content.equals(other.m_content))
			return false;
		if (m_no != other.m_no)
			return false;
		if (m_receiver == null) {
			if (other.m_receiver != null)
				return false;
		} else if (!m_receiver.equals(other.m_receiver))
			return false;
		if (m_writer == null) {
			if (other.m_writer != null)
				return false;
		} else if (!m_writer.equals(other.m_writer))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Message [m_no=" + m_no + ", m_writer=" + m_writer + ", m_receiver=" + m_receiver + ", hosting_id="
				+ hosting_id + ", checkin=" + checkin + ", checkout=" + checkout + ", guest_num=" + guest_num
				+ ", m_content=" + m_content + "]";
	}

	
	
	
	// 날짜 차이계산
	public int dateCalculation(String chkIn, String chkOut){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	
    	Date d1 = new Date();
    	Date d2 =new Date();
    	try {
			d1 =sdf.parse(chkIn);
			d2= sdf.parse(chkOut);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	Calendar c1 = Calendar.getInstance();
    	Calendar c2 = Calendar.getInstance();

    	c1.setTime(d1);
		c2.setTime(d2);
		
		long day = (c2.getTimeInMillis() -c1.getTimeInMillis())/(1000 * 60 * 60 *24);
		if(day==0) day=1;
		
		return (int)day;
	}

}
