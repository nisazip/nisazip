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
import kh.manager.model.vo.ReportList;
import kh.manager.model.vo.RoomReservList;
import kh.manager.model.vo.TripReservList;
import kh.report.model.vo.Report;
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

	public HashMap<String, Object> selectOneMember(String userId) {
		Connection con = getConnection();
		
		HashMap<String, Object> m = new mDao().selectMember(con, userId);
		
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

	public int getReportListCount() {
		Connection con = getConnection();
		int result =new mDao().getReportListCount(con);
		
		close(con);
		
		return result;
	}

	public int searchReWriterCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchReWriterCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public int searchReReciverCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchReReciverCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<Report> reList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Report> list =mDao.reList(con, currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<Report> searchReWriter(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Report> list =mDao.searchReWriter(con, currentPage, limit, keyword);
		close(con);
		return list;
	}

	public ArrayList<Report> searchReReciver(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<Report> list =mDao.searchReReciver(con, currentPage, limit, keyword);
		close(con);
		return list;
	}

	public HashMap<String, Object> selectOneReport(int reNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> result = new mDao().selectOneReport(con, reNo);
		
		close(con);
		
		return result;
	}

	public int deleteReport(int reNo) {
		Connection con = getConnection();
		
		int result = new mDao().deleteReport(con, reNo);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public ArrayList<ReportList> reportTop5() {
		Connection con = getConnection();
		
		ArrayList<ReportList> list = new mDao().reportTop5(con); 
		
		close(con);		
		
		return list;
	}

	public int deleteReReport(String userId) {
		Connection con = getConnection();
		
		int result = new mDao().deleteReReport(con, userId);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deleteReMember(String userId) {
		Connection con = getConnection();
		
		int result = new mDao().deleteReMember(con, userId);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public ArrayList<HashMap<String, Object>> recentCnt() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> result = new mDao().recentCnt(con);
		
		if(result !=null) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public ArrayList<HashMap<String, Object>> roomReserv() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> result = new mDao().roomReserv(con);
		
		if(result !=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> tripReserv() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> result = new mDao().tripReserv(con);
		
		if(result !=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int confirm(String userId) {
		Connection con = getConnection();
		
		int result = new mDao().confirm(con, userId);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int deny(String userId) {
		Connection con = getConnection();
		
		int result = new mDao().deny(con, userId);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public ArrayList<HashMap<String, Object>> certifiTop() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> result = new mDao().certifiTop(con);
		
		if(result !=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> visitAllCnt() {
		Connection con = getConnection();
		
		HashMap<String, Object> result = new mDao().visitAllCnt(con);
		
		if(result !=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int getTripReservListCount() {
		Connection con = getConnection();
		int result =new mDao().getTripReservListCount(con);
		
		close(con);
		
		return result;
	}

	public int searchTIdCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchTIdCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<TripReservList> getTripReservList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<TripReservList> list =mDao.getTripReservList(con, currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<TripReservList> searchTId(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<TripReservList> list =mDao.searchTId(con, currentPage, limit, keyword);
		close(con);
		return list;
	}

	public int getRoomReservListCount() {
		Connection con = getConnection();
		int result =new mDao().getRoomReservListCount(con);
		
		close(con);
		
		return result;
	}

	public int searchrIdCount(String keyword) {
		Connection con = getConnection();
		int result =new mDao().searchrIdCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<RoomReservList> getRoomReservList(int currentPage, int limit) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<RoomReservList> list =mDao.getRoomReservList(con, currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<RoomReservList> searchrId(int currentPage, int limit, String keyword) {
		Connection con = getConnection();
		mDao mDao = new mDao();
		
		ArrayList<RoomReservList> list =mDao.searchrId(con, currentPage, limit, keyword);
		close(con);
		return list;
	}

	public int cancelRoom(int roomReservNo) {
		Connection con = getConnection();
		
		int result = new mDao().cancelRoom(con, roomReservNo);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

	public int cancelTrip(String tripReservNo) {
		Connection con = getConnection();
		
		int result = new mDao().cancelTrip(con, tripReservNo);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);

		return result;
	}

}
