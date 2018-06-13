package kh.review.model.vo;

import java.sql.Date;

public class Review {

	private int review_no;
	private String hosting_id;
	private String re_content;
	private String user_id;
	private Date re_date;
	private float re_score;
	private String re_date_time; // db 
	

	public Review() {
		super();
	}

	public Review(int review_no, String hosting_id, String re_content, String user_id, Date re_date, float re_score) {
		super();
		this.review_no = review_no;
		this.hosting_id = hosting_id;
		this.re_content = re_content;
		this.user_id = user_id;
		this.re_date = re_date;
		this.re_score = re_score;
	}

	public Review(int review_no, String hosting_id, String re_content, String user_id, Date re_date, float re_score,
			String re_date_time) {
		super();
		this.review_no = review_no;
		this.hosting_id = hosting_id;
		this.re_content = re_content;
		this.user_id = user_id;
		this.re_date = re_date;
		this.re_score = re_score;
		this.re_date_time = re_date_time;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getHosting_id() {
		return hosting_id;
	}

	public void setHosting_id(String hosting_id) {
		this.hosting_id = hosting_id;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public float getRe_score() {
		return re_score;
	}

	public void setRe_score(float re_score) {
		this.re_score = re_score;
	}

	public String getRe_date_time() {
		return re_date_time;
	}

	public void setRe_date_time(String re_date_time) {
		this.re_date_time = re_date_time;
	}



	
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", hosting_id=" + hosting_id + ", re_content=" + re_content
				+ ", user_id=" + user_id + ", re_date=" + re_date + ", re_score=" + re_score + ", re_date_time="
				+ re_date_time + "]\n";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((hosting_id == null) ? 0 : hosting_id.hashCode());
		result = prime * result + ((re_content == null) ? 0 : re_content.hashCode());
		result = prime * result + ((re_date == null) ? 0 : re_date.hashCode());
		result = prime * result + ((re_date_time == null) ? 0 : re_date_time.hashCode());
		result = prime * result + Float.floatToIntBits(re_score);
		result = prime * result + review_no;
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
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
		Review other = (Review) obj;
		if (hosting_id == null) {
			if (other.hosting_id != null)
				return false;
		} else if (!hosting_id.equals(other.hosting_id))
			return false;
		if (re_content == null) {
			if (other.re_content != null)
				return false;
		} else if (!re_content.equals(other.re_content))
			return false;
		if (re_date == null) {
			if (other.re_date != null)
				return false;
		} else if (!re_date.equals(other.re_date))
			return false;
		if (re_date_time == null) {
			if (other.re_date_time != null)
				return false;
		} else if (!re_date_time.equals(other.re_date_time))
			return false;
		if (Float.floatToIntBits(re_score) != Float.floatToIntBits(other.re_score))
			return false;
		if (review_no != other.review_no)
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		return true;
	}

}
