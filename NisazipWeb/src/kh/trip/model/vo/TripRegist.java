package kh.trip.model.vo;

public class TripRegist {

	private String trip_name;
	private String trip_address;
	private String trip_category;
	private String trip_language;
	private int trip_maxPeople;
	private String trip_startTime;
	private String trip_endTime;
	private String trip_introduce;
	private String trip_stratReservation;
	private String trip_endReservation;
	private int trip_price;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public TripRegist(){}

	public TripRegist(String trip_name, String trip_address, String trip_category, String trip_language,
			int trip_maxPeople, String trip_startTime, String trip_endTime, String trip_introduce,
			String trip_stratReservation, String trip_endReservation, int trip_price, String pic1, String pic2,
			String pic3) {
		super();
		this.trip_name = trip_name;
		this.trip_address = trip_address;
		this.trip_category = trip_category;
		this.trip_language = trip_language;
		this.trip_maxPeople = trip_maxPeople;
		this.trip_startTime = trip_startTime;
		this.trip_endTime = trip_endTime;
		this.trip_introduce = trip_introduce;
		this.trip_stratReservation = trip_stratReservation;
		this.trip_endReservation = trip_endReservation;
		this.trip_price = trip_price;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
	}

	public String getTrip_name() {
		return trip_name;
	}

	public void setTrip_name(String trip_name) {
		this.trip_name = trip_name;
	}

	public String getTrip_address() {
		return trip_address;
	}

	public void setTrip_address(String trip_address) {
		this.trip_address = trip_address;
	}

	public String getTrip_category() {
		return trip_category;
	}

	public void setTrip_category(String trip_category) {
		this.trip_category = trip_category;
	}

	public String getTrip_language() {
		return trip_language;
	}

	public void setTrip_language(String trip_language) {
		this.trip_language = trip_language;
	}

	public int getTrip_maxPeople() {
		return trip_maxPeople;
	}

	public void setTrip_maxPeople(int trip_maxPeople) {
		this.trip_maxPeople = trip_maxPeople;
	}

	public String getTrip_startTime() {
		return trip_startTime;
	}

	public void setTrip_startTime(String trip_startTime) {
		this.trip_startTime = trip_startTime;
	}

	public String getTrip_endTime() {
		return trip_endTime;
	}

	public void setTrip_endTime(String trip_endTime) {
		this.trip_endTime = trip_endTime;
	}

	public String getTrip_introduce() {
		return trip_introduce;
	}

	public void setTrip_introduce(String trip_introduce) {
		this.trip_introduce = trip_introduce;
	}

	public String getTrip_stratReservation() {
		return trip_stratReservation;
	}

	public void setTrip_stratReservation(String trip_stratReservation) {
		this.trip_stratReservation = trip_stratReservation;
	}

	public String getTrip_endReservation() {
		return trip_endReservation;
	}

	public void setTrip_endReservation(String trip_endReservation) {
		this.trip_endReservation = trip_endReservation;
	}

	public int getTrip_price() {
		return trip_price;
	}

	public void setTrip_price(int trip_price) {
		this.trip_price = trip_price;
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
		return "TripRegist [trip_name=" + trip_name + ", trip_address=" + trip_address + ", trip_category="
				+ trip_category + ", trip_language=" + trip_language + ", trip_maxPeople=" + trip_maxPeople
				+ ", trip_startTime=" + trip_startTime + ", trip_endTime=" + trip_endTime + ", trip_introduce="
				+ trip_introduce + ", trip_stratReservation=" + trip_stratReservation + ", trip_endReservation="
				+ trip_endReservation + ", trip_price=" + trip_price + ", pic1=" + pic1 + ", pic2=" + pic2 + ", pic3="
				+ pic3 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pic1 == null) ? 0 : pic1.hashCode());
		result = prime * result + ((pic2 == null) ? 0 : pic2.hashCode());
		result = prime * result + ((pic3 == null) ? 0 : pic3.hashCode());
		result = prime * result + ((trip_address == null) ? 0 : trip_address.hashCode());
		result = prime * result + ((trip_category == null) ? 0 : trip_category.hashCode());
		result = prime * result + ((trip_endReservation == null) ? 0 : trip_endReservation.hashCode());
		result = prime * result + ((trip_endTime == null) ? 0 : trip_endTime.hashCode());
		result = prime * result + ((trip_introduce == null) ? 0 : trip_introduce.hashCode());
		result = prime * result + ((trip_language == null) ? 0 : trip_language.hashCode());
		result = prime * result + trip_maxPeople;
		result = prime * result + ((trip_name == null) ? 0 : trip_name.hashCode());
		result = prime * result + trip_price;
		result = prime * result + ((trip_startTime == null) ? 0 : trip_startTime.hashCode());
		result = prime * result + ((trip_stratReservation == null) ? 0 : trip_stratReservation.hashCode());
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
		TripRegist other = (TripRegist) obj;
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
		if (trip_address == null) {
			if (other.trip_address != null)
				return false;
		} else if (!trip_address.equals(other.trip_address))
			return false;
		if (trip_category == null) {
			if (other.trip_category != null)
				return false;
		} else if (!trip_category.equals(other.trip_category))
			return false;
		if (trip_endReservation == null) {
			if (other.trip_endReservation != null)
				return false;
		} else if (!trip_endReservation.equals(other.trip_endReservation))
			return false;
		if (trip_endTime == null) {
			if (other.trip_endTime != null)
				return false;
		} else if (!trip_endTime.equals(other.trip_endTime))
			return false;
		if (trip_introduce == null) {
			if (other.trip_introduce != null)
				return false;
		} else if (!trip_introduce.equals(other.trip_introduce))
			return false;
		if (trip_language == null) {
			if (other.trip_language != null)
				return false;
		} else if (!trip_language.equals(other.trip_language))
			return false;
		if (trip_maxPeople != other.trip_maxPeople)
			return false;
		if (trip_name == null) {
			if (other.trip_name != null)
				return false;
		} else if (!trip_name.equals(other.trip_name))
			return false;
		if (trip_price != other.trip_price)
			return false;
		if (trip_startTime == null) {
			if (other.trip_startTime != null)
				return false;
		} else if (!trip_startTime.equals(other.trip_startTime))
			return false;
		if (trip_stratReservation == null) {
			if (other.trip_stratReservation != null)
				return false;
		} else if (!trip_stratReservation.equals(other.trip_stratReservation))
			return false;
		return true;
	}
}