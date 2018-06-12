package kh.home.model.service;

import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import kh.home.model.vo.Room;

public class HomeSearchService {
	public ArrayList<Room> searchRoom(String location, Date checkin,Date checkout, int adults,int children){
		Connection con = getConnection();
		ArrayList<Room> rlist = null;
		
		SearchDao sDao = new SearchDao();
		
		if(location.equals(""))
	}
}
