package kh.home.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.home.model.dao.RoomDao;
import kh.home.model.vo.Room;

public class RoomService {

	public ArrayList<HashMap<String, Object>> selectrList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> rlist = new RoomDao().selectrList(con);
		
		close(con);
		System.out.println("rlist");
		return rlist;
	}

}
