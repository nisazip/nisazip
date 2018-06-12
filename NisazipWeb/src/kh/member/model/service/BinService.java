package kh.member.model.service;

import kh.member.model.dao.BinDao;
import kh.member.model.vo.Member;
import kh.room.model.vo.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static kh.common.JDBCTemplate.*;

public class BinService {
	private BinDao bDao;
	
	public BinService() {
		bDao = new BinDao();
	}
	
	
	public ArrayList<HashMap<String, Object>> myTripsListP(String id){
		
		Connection con = getConnection();
		
		 ArrayList<HashMap<String,Object>> tCompleteList = bDao.myTripsListP(con,id);
		
		return tCompleteList;
	}


	public ArrayList<HashMap<String, Object>> myTripsListW(String id) {
		Connection con = getConnection();
		
		 ArrayList<HashMap<String,Object>> tGoingtoList = bDao.myTripsListW(con,id);
		
		return tGoingtoList;
	}


	public ArrayList<HashMap<String, Object>> myRoomsListP(String id) {
		Connection con = getConnection();
		
		 ArrayList<HashMap<String,Object>> rCompleteList = bDao.myRoomsListP(con,id);
		
		return rCompleteList;
	}


	public ArrayList<HashMap<String, Object>> myRoomsListW(String id) {
		Connection con = getConnection();
		
		 ArrayList<HashMap<String,Object>> rGoingtoList = bDao.myRoomsListW(con,id);
		
		return rGoingtoList;
	}

	
	

}
