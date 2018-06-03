package kh.manager.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.manager.model.dao.mDao;
import kh.manager.model.vo.MemberList;
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

public class ManagerService {


	
	public ArrayList<MemberList> mList() {
		Connection con = getConnection();
		
		ArrayList<MemberList> list = new mDao().mList(con);
		
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
		System.out.println("servicetList");
		ArrayList<Trip> list = new mDao().tList(con);
		System.out.println("service222tList");
		close(con);
		System.out.println("service : "+list);
		return list;
	}

	public HashMap<String, Object> selectOneMember(int userNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> m = new mDao().selectMember(con, userNo);
		
		close(con);
		

		return m;
	}

	public int updateMember(MemberList m) {
		Connection con = getConnection();
		
		int result = new mDao().updateMember(con, m);
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deleteMember(int mNo) {
		Connection con = getConnection();
		
		int result = new mDao().deleteMember(con, mNo);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public HashMap<String, Object> selectOneRoom(String tno) {
		Connection con = getConnection();
		
		HashMap<String, Object> t = new mDao().selectRoom(con, tno);
		
		close(con);
		

		return t;
	}

	public int updateRoom(Trip t) {
		Connection con = getConnection();
		System.out.println("dao : "+t);
		int result = new mDao().updateRoom(con, t);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deleteRoom(String tno) {
		Connection con = getConnection();
		
		int result = new mDao().deleteMember(con, tno);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

}
