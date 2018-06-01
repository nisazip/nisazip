package kh.home.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.home.model.dao.RoomDao;
import kh.home.model.dao.TripDao;
import kh.home.model.vo.Room;
import kh.home.model.vo.Trip;

public class TripService {

	public ArrayList<HashMap<String, Object>> selecttList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().selecttList(con);
		
		close(con);
		
		return tlist;
	}
/*
	public ArrayList<Trip> searchTrip(String location, String checkin, String checkout, String adults,
			String children) {
		Connection con = getConnection();
		
		ArrayList<Trip> tlist = new TripDao().searchtList(con);
		
		close(con);
		
		return tlist;
	}
*/
	public ArrayList<HashMap<String, Object>> searchKeyword(String keyword) {
		Connection con = getConnection();
		
		RoomDao rDao = new RoomDao();
		
		ArrayList<HashMap<String,Object>> tlist =  new RoomDao().searchKeyword(con,keyword);
		
		return tlist;
	}

}
