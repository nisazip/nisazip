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

	public ArrayList<HashMap<String, Object>> select4tripList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().select4tripList(con);
		
		close(con);
		
		return tlist;
	}
	
	public ArrayList<HashMap<String, Object>> select8tripList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().select8tripList(con);
		
		close(con);
		
		return tlist;
	}

	public ArrayList<HashMap<String, Object>> searchTrip(String location, String checkin, String checkout, String adults) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> tlist = new TripDao().homeTripSearch(con,location,checkin,checkout,adults);
		
		close(con);
		
		return tlist;
	}

	public ArrayList<HashMap<String, Object>> searchKeyword(String keyword) {
		Connection con = getConnection();
		
		TripDao tDao = new TripDao();
		
		ArrayList<HashMap<String,Object>> tlist =  new TripDao().searchKeyword(con,keyword);
		
		return tlist;
	}

}
