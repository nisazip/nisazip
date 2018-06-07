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

	
	

}
