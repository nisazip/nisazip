package kh.home.model.vo;

import java.sql.Date;

public class RecRoom extends Room{
	private int cntRoom;
	private String area;
	
	public RecRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecRoom(String r_id, String r_name, String host_id, int r_max_num, String r_type, String r_type2,
			String r_option, int room_num, int toilet_num, int bed_num, String r_detail, String r_role, int price,
			String r_area, String r_addr, String r_loc, Date r_start_date, Date r_end_date, float score,int cntRoom,String area) {
		super(r_id, r_name, host_id, r_max_num, r_type, r_type2, r_option, room_num, toilet_num, bed_num, r_detail, r_role,
				price, r_area, r_addr, r_loc, r_start_date, r_end_date, score);
		this.cntRoom= cntRoom;
		this.area = area;
	}
	public RecRoom(int cntRoom, String area) {
		super();
		this.cntRoom = cntRoom;
		this.area = area;
	}
	public int getCntRoom() {
		return cntRoom;
	}
	public void setCntRoom(int cntRoom) {
		this.cntRoom = cntRoom;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "RecRoom [cntRoom=" + cntRoom + ", area=" + area + "]";
	}
	
	
}
