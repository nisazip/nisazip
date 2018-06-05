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

	public ArrayList<Room> rList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Room> list =mDao.rList(con, currentPage, limit);
		close(con);
		
		return list;
	}

	public ArrayList<Trip> tList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Trip> list =mDao.tList(con, currentPage, limit);
		close(con);
		
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

	public HashMap<String, Object> selectOneTrip(String tno) {
		Connection con = getConnection();
		
		HashMap<String, Object> t = new mDao().selectTrip(con, tno);
		
		close(con);
		

		return t;
	}

	public int updateTrip(Trip t) {
		Connection con = getConnection();
		System.out.println("dao : "+t);
		int result = new mDao().updateTrip(con, t);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deleteTrip(String tno) {
		Connection con = getConnection();
		
		int result = new mDao().deleteTrip(con, tno);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public HashMap<String, Object> selectOneRoom(String rNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> t = new mDao().selectRoom(con, rNo);
		close(con);

		return t;
	}

	public int updateRoom(Room r) {
		Connection con = getConnection();
		int result = new mDao().updateRoom(con, r);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deleteRoom(String rno) {
		Connection con = getConnection();
		
		int result = new mDao().deleteRoom(con, rno);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int getMemeberListCount() {
		Connection con = getConnection();
		int result =new mDao().getMemeberListCount(con);
		
		close(con);
		
		return result;
		
	}

	public ArrayList<MemberList> selectMemberList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<MemberList> list =mDao.selectMemberList(con, currentPage, limit);
		
		return list;
	}

	public int getRoomListCount() {
		Connection con = getConnection();
		int result =new mDao().getRoomListCount(con);
		
		close(con);
		
		return result;
	}

	public int getTripListCount() {
		Connection con = getConnection();
		int result =new mDao().getTripListCount(con);
		
		close(con);
		
		return result;
	}

	public int searchIdCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchIdMemeberListCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchNameCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchNameMemeberListCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<MemberList> searchId(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<MemberList> list =mDao.searchId(con, currentPage, limit, keyword);
		
		return list;
	}

	public ArrayList<MemberList> searchName(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<MemberList> list =mDao.searchName(con, currentPage, limit, keyword);
		
		return list;
	}

	public int searchRNameCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchRNameCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchRHostIdCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchRHostIdCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchRAreaCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchRAreaCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<Room> searchRName(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Room> list =mDao.searchRName(con, currentPage, limit, keyword);
		
		return list;
	}

	public ArrayList<Room> searchRHostId(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Room> list =mDao.searchRHostId(con, currentPage, limit, keyword);
		
		return list;
	}

	public ArrayList<Room> searchRArea(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Room> list =mDao.searchRArea(con, currentPage, limit, keyword);
		
		return list;
	}

	public int searchTNameCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchTNameCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchTHostIdCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchTHostIdCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchTAreaCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchTAreaCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<Trip> searchTName(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Trip> list =mDao.searchTName(con, currentPage, limit, keyword);
		
		return list;
	}

	public ArrayList<Trip> searchTHostId(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Trip> list =mDao.searchTHostId(con, currentPage, limit, keyword);
		
		return list;
	}

	public ArrayList<Trip> searchTArea(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Trip> list =mDao.searchTArea(con, currentPage, limit, keyword);
		
		return list;
	}

}
