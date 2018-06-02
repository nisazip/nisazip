package kh.manager.model.service;

import static kh.common.JDBCTemplate.*;
import static kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.manager.model.dao.mDao;
import kh.manager.model.vo.MemeberList;
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

public class ManagerService {


	
	public ArrayList<MemeberList> mList() {
		Connection con = getConnection();
		
		ArrayList<MemeberList> list = new mDao().mList(con);
		
		close(con);
		return list;
	}

	public ArrayList<Room> rList() {
		Connection con = getConnection();
		
		ArrayList<Room> list = new mDao().rList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Trip> tList() {
		Connection con = getConnection();
		
		ArrayList<Trip> list = new mDao().tList(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectOneMember(int userNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> m = new mDao().selectMember(con, userNo);
		
		close(con);
		

		return m;
	}

	public int updateMemeber(MemeberList m) {
		Connection con = getConnection();
		
		int result = new mDao().updateMember(con, m);
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

}
