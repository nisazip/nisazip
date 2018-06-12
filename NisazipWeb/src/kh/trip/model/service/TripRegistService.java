package kh.trip.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.member.model.vo.Member;
import kh.trip.model.dao.TripRegistDao;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.T_RESERVATION;
import kh.trip.model.vo.Trip;

import static kh.common.JDBCTemplate.*;

public class TripRegistService {

	public String insertThumbnail(Trip tr, ArrayList<Attachment> fileList, Member m) {

		Connection con = getConnection();
		int result = 0;
		int tno = 0;
		int result1 = new TripRegistDao().insertThumbnailContent(con, tr, m);

		if (result1 > 0) {
			String selectVal = new TripRegistDao().selectVal(con);
			tno = new TripRegistDao().selectCurrval(con);
			System.out.println("시퀀스 번호 : " + tno);

			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setPno("T" + (tno - 1));
				fileList.get(i).setHosting_id(m.getUser_id());
			}
		}

		int result2 = new TripRegistDao().insertAttachment(con, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return "T" + (tno - 1);
	}

	public Trip selectOne(String tno) {

		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();

		Trip tregist = tDao.selectOne(con, tno);

		close(con);
		return tregist;

	}

	public int updateTrip(Trip tregist) {

		Connection con = getConnection();
		int result = new TripRegistDao().updateTrip(con, tregist);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public Trip selectRecent(String tno) {
		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();

		Trip tregist = tDao.selectRecent(con, tno);

		System.out.println("tno 찍힘 ? " + tno);

		close(con);
		return tregist;
	}

	public int insertTrip(String tno, int price, Member m) {
		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();

		int result = tDao.insertTrip(con, tno, price, m);

		System.out.println("commit 값 : " + result);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int updatePicture(ArrayList<Attachment> fileList) {

		Connection con = getConnection();

		System.out.println("서비스전달:" + fileList);

		int result = new TripRegistDao().updatePicture(con, fileList);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public Trip getTrip(String userId) {
		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();

		Trip tregist = tDao.getTrip(con, userId);

		System.out.println("수정 서비스 부분 tregist : " + tregist);
		
		close(con);
		return tregist;
	}

	public ArrayList<Attachment> getPicture(String userId) {
		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();

		ArrayList<Attachment> at = tDao.getPicture(con, userId);

		System.out.println("at : " + at);

		close(con);
		return at;
	}

	public T_RESERVATION selectTwo(String tripNumber) {
		Connection con = getConnection();

		T_RESERVATION trip_reservation = new TripRegistDao().selectTwo(con, tripNumber);

		System.out.println("Service단 trip_reservation : " + trip_reservation);

		close(con);

		return trip_reservation;
	}

	public ArrayList<T_RESERVATION> selectReservation() {
		Connection con = getConnection();
		ArrayList<T_RESERVATION> trip_list = new TripRegistDao().selectReservation(con);

		System.out.println("Service trip_list : " + trip_list);

		close(con);
		return trip_list;
	}

	public int ReservationPrice(T_RESERVATION trip_reservation) {
		Connection con = getConnection();

		int result = new TripRegistDao().ReservationPrice(con, trip_reservation);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public T_RESERVATION selectTripRecent() {

		Connection con = getConnection();

		T_RESERVATION t = new TripRegistDao().selectTripRecent(con);

		close(con);

		return t;
	}

	public ArrayList<T_RESERVATION> selectReservationList() {

		Connection con = getConnection();

		ArrayList<T_RESERVATION> list = new TripRegistDao().selectReservationList(con);

		System.out.println("통계 Service단에서의 list : " + list);

		close(con);

		return list;
	}

	public int deleteTrip(String tripNum) {
		Connection con = getConnection();

		int result = new TripRegistDao().deleteTrip(con, tripNum);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int tripTotalCount(String t_id, String t_date) {
		Connection con = getConnection();

		int result = new TripRegistDao().tripTotalCount(con, t_id, t_date);

		System.out.println("예약 인원 제한 Service : " + result);

		close(con);

		return result;
	}

	public ArrayList<Trip> selectList(Member m) {
		Connection con = getConnection();

		ArrayList<Trip> list = new TripRegistDao().selectList(con, m);

		close(con);

		return list;
	}

	public int maxPeople(String t_id) {
		Connection con = getConnection();

		int result = new TripRegistDao().maxPeople(con, t_id);
		System.out.println("서비스단 단ㄷ ㄷ낟나t_id" + t_id);
		close(con);

		return result;
	}

	public int deleteSearch(String tripNum) {
		Connection con = getConnection();

		int result = new TripRegistDao().deleteSearch(con, tripNum);
		System.out.println("DeleteSearch 서비스단에서 t_id : " + tripNum);
		close(con);

		return result;
	}

	public int modifySearch(String tripNum) {
		Connection con = getConnection();

		int result = new TripRegistDao().modifySearch(con, tripNum);
		System.out.println("modifySearch 서비스단에서 t_id : " + tripNum);
		close(con);

		return result;
	}

	public int cancelTrip(String tripNumber, Trip delTrip, T_RESERVATION delRes) {
		Connection con = getConnection();

		int result = new TripRegistDao().cancelTrip(con, tripNumber, delTrip, delRes);
		System.out.println("cancelTrip 서비스단에서 result : " + result);
		close(con);

		return result;
	}
}
