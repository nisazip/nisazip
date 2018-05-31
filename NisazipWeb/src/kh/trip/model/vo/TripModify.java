package kh.trip.model.vo;

public class TripModify {

	private String title;
	private int price;
	private String language;
	private String category;
	private int people;
	private String introduce;
	private String zip;
	private String addr;
	private String addr_detail;
	private String startTime;
	private String endTime;
	private String startReservation;
	private String endReservation;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public TripModify(){
		
	}

	public TripModify(String title, int price, String language, String category, int people, String introduce,
			String zip, String addr, String addr_detail, String startTime, String endTime, String startReservation,
			String endReservation, String pic1, String pic2, String pic3) {
		super();
		this.title = title;
		this.price = price;
		this.language = language;
		this.category = category;
		this.people = people;
		this.introduce = introduce;
		this.zip = zip;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.startTime = startTime;
		this.endTime = endTime;
		this.startReservation = startReservation;
		this.endReservation = endReservation;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getcategory() {
		return category;
	}

	public void setcategory(String category) {
		this.category = category;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartReservation() {
		return startReservation;
	}

	public void setStartReservation(String startReservation) {
		this.startReservation = startReservation;
	}

	public String getEndReservation() {
		return endReservation;
	}

	public void setEndReservation(String endReservation) {
		this.endReservation = endReservation;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	@Override
	public String toString() {
		return "TripModify [title=" + title + ", price=" + price + ", language=" + language + ", category=" + category
				+ ", people=" + people + ", introduce=" + introduce + ", zip=" + zip + ", addr=" + addr
				+ ", addr_detail=" + addr_detail + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", startReservation=" + startReservation + ", endReservation=" + endReservation + ", pic1=" + pic1
				+ ", pic2=" + pic2 + ", pic3=" + pic3 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr == null) ? 0 : addr.hashCode());
		result = prime * result + ((addr_detail == null) ? 0 : addr_detail.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((endReservation == null) ? 0 : endReservation.hashCode());
		result = prime * result + ((endTime == null) ? 0 : endTime.hashCode());
		result = prime * result + ((introduce == null) ? 0 : introduce.hashCode());
		result = prime * result + ((language == null) ? 0 : language.hashCode());
		result = prime * result + people;
		result = prime * result + ((pic1 == null) ? 0 : pic1.hashCode());
		result = prime * result + ((pic2 == null) ? 0 : pic2.hashCode());
		result = prime * result + ((pic3 == null) ? 0 : pic3.hashCode());
		result = prime * result + price;
		result = prime * result + ((startReservation == null) ? 0 : startReservation.hashCode());
		result = prime * result + ((startTime == null) ? 0 : startTime.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((zip == null) ? 0 : zip.hashCode());
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
		TripModify other = (TripModify) obj;
		if (addr == null) {
			if (other.addr != null)
				return false;
		} else if (!addr.equals(other.addr))
			return false;
		if (addr_detail == null) {
			if (other.addr_detail != null)
				return false;
		} else if (!addr_detail.equals(other.addr_detail))
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (endReservation == null) {
			if (other.endReservation != null)
				return false;
		} else if (!endReservation.equals(other.endReservation))
			return false;
		if (endTime == null) {
			if (other.endTime != null)
				return false;
		} else if (!endTime.equals(other.endTime))
			return false;
		if (introduce == null) {
			if (other.introduce != null)
				return false;
		} else if (!introduce.equals(other.introduce))
			return false;
		if (language == null) {
			if (other.language != null)
				return false;
		} else if (!language.equals(other.language))
			return false;
		if (people != other.people)
			return false;
		if (pic1 == null) {
			if (other.pic1 != null)
				return false;
		} else if (!pic1.equals(other.pic1))
			return false;
		if (pic2 == null) {
			if (other.pic2 != null)
				return false;
		} else if (!pic2.equals(other.pic2))
			return false;
		if (pic3 == null) {
			if (other.pic3 != null)
				return false;
		} else if (!pic3.equals(other.pic3))
			return false;
		if (price != other.price)
			return false;
		if (startReservation == null) {
			if (other.startReservation != null)
				return false;
		} else if (!startReservation.equals(other.startReservation))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (zip == null) {
			if (other.zip != null)
				return false;
		} else if (!zip.equals(other.zip))
			return false;
		return true;
	}
	
	
}
