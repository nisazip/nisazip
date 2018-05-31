package kh.home.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.home.model.dao.TripDao;

public class TripService {

	public ArrayList<HashMap<String, Object>> selecttList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> tlist = new TripDao().selecttList(con);
		
		close(con);
		
		return tlist;
	}

}
