package kh.home.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.home.model.dao.RoomDao;
import kh.home.model.dao.TripDao;
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

public class TripService {

	public ArrayList<HashMap<String, Object>> select4tripList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().select4tripList(con);
		
		close(con);
		
		return tlist;
	}
	
	public ArrayList<HashMap<String, Object>> selectAlltripList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().selectAlltripList(con);
		
		close(con);
		
		return tlist;
	}

	public ArrayList<HashMap<String, Object>> searchTrip(String location, String checkin, String checkout, int people) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> tlist = new TripDao().homeTripSearch(con,location,checkin,checkout,people);
		
		close(con);
		
		return tlist;
	}

	public ArrayList<HashMap<String, Object>> searchKeyword(String keyword) {
		Connection con = getConnection();
		
		TripDao tDao = new TripDao();
		
		ArrayList<HashMap<String,Object>> tlist =  new TripDao().searchKeyword(con,keyword);
		
		return tlist;
	}
	
	public ArrayList<HashMap<String, Object>> sortKeyword(String keyword) {
		Connection con = getConnection();
		
		TripDao tDao = new TripDao();
		
		ArrayList<HashMap<String,Object>> tlist =  new TripDao().sortKeyword(con,keyword);
		
		return tlist;
	}

}
