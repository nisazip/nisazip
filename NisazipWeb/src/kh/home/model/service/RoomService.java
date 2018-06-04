package kh.home.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.home.model.dao.RoomDao;
import kh.home.model.vo.RecRoom;
import kh.home.model.vo.Room;

public class RoomService {

	public ArrayList<HashMap<String, Object>> select4roomList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> rlist = new RoomDao().select4roomList(con);
		
		close(con);
		return rlist;
	}
	
	public ArrayList<HashMap<String, Object>> select8roomList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> rlist = new RoomDao().select8roomList(con);
		
		close(con);
		return rlist;
	}
	
	public ArrayList<RecRoom> recRoom(){
		Connection con = getConnection();
		
		ArrayList<RecRoom> reclist = new RoomDao().recRoom(con);
		
		close(con);
		
		return reclist;
	}

	public ArrayList<HashMap<String, Object>> searchRoom(String location, String checkin, String checkout, String adults) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> rlist = new RoomDao().homeRoomSearch(con,location,checkin,checkout,adults);
		
		close(con);
		
		return rlist;
	}

	public ArrayList<HashMap<String, Object>> searchKeyword(String keyword) {
		Connection con = getConnection();
		
		RoomDao rDao = new RoomDao();
		
		ArrayList<HashMap<String,Object>> rlist =  new RoomDao().searchKeyword(con,keyword);
		
		close(con);
		
		return rlist;
	}

}
