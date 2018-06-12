package kh.trip.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;

import kh.member.model.vo.Member;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.Host_Picture;
import kh.trip.model.vo.T_RESERVATION;
import kh.trip.model.vo.Trip;

import static kh.common.JDBCTemplate.*;

public class TripRegistDao {

	private Properties prop;

	public TripRegistDao() {
		prop = new Properties();

		String fileName = TripRegistDao.class.getResource("/config/trip/trip-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Trip selectOne(Connection con, String tno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Trip tregist = new Trip();

		String query = prop.getProperty("selectOne");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, tno);

			System.out.println("시퀀스 번호 뭐임 ? " + tno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				tregist.setT_id(rset.getString("T_ID"));
				tregist.setT_name(rset.getString("T_NAME"));
				tregist.setHost_id(rset.getString("HOST_ID"));
				tregist.setT_max_num(rset.getInt("T_MAX_NUM"));
				tregist.setT_type(rset.getString("T_TYPE"));
				tregist.setLanguage(rset.getString("LANGUAGE"));
				tregist.setT_start_time(rset.getString("T_START_TIME"));
				tregist.setT_end_time(rset.getString("T_END_TIME"));
				tregist.setPrice(rset.getInt("PRICE"));
				tregist.setT_detail(rset.getString("T_DETAIL"));
				tregist.setT_area(rset.getString("T_AREA"));
				tregist.setT_addr(rset.getString("T_ADDR"));
				//T_loc 추가해야함
				tregist.setT_start_date(rset.getString("T_START_DATE"));
				tregist.setT_end_date(rset.getString("T_END_DATE"));
				tregist.setScore(rset.getFloat("SCORE"));
				tregist.setT_date(rset.getString("T_DATE"));

			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);

		}

		return tregist;

	}

	public int updateTrip(Connection con, Trip tregist) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateTrip");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, tregist.getT_name());
			pstmt.setInt(2, tregist.getT_max_num());
			pstmt.setString(3, tregist.getT_type());
			pstmt.setString(4, tregist.getLanguage());
			pstmt.setString(5, tregist.getT_start_time());
			pstmt.setString(6, tregist.getT_end_time());
			pstmt.setInt(7, tregist.getPrice());
			pstmt.setString(8, tregist.getT_detail());
			pstmt.setString(9, tregist.getT_area());
			pstmt.setString(10, tregist.getT_addr());
			pstmt.setString(11, tregist.getT_start_date());
			pstmt.setString(12, tregist.getT_end_date());
			pstmt.setString(13, tregist.getT_id());

			result = pstmt.executeUpdate();

			System.out.println("updateTrip Dao단 result : " + result);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;

	}

	public int updatePicture(Connection con, ArrayList<Attachment> fileList) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateTripRegist");
		System.out.println(fileList);

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOrigin_name());
				pstmt.setString(2, fileList.get(i).getChange_name());
				pstmt.setString(3, fileList.get(i).getFile_path());
				pstmt.setString(4, fileList.get(i).getPno());

				result += pstmt.executeUpdate();
			}
			System.out.println("result : " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Trip selectRecent(Connection con, String tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Trip tregist = new Trip();

		String query = prop.getProperty("selectRecent");

		try {

			pstmt = con.prepareStatement(query);

			System.out.println("시퀀스 번호 뭐임 ? " + tregist.getT_id());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				tregist.setT_id(rset.getString("T_ID"));
				tregist.setT_name(rset.getString("T_NAME"));
				tregist.setHost_id(rset.getString("HOST_ID"));
				tregist.setT_max_num(rset.getInt("T_MAX_NUM"));
				tregist.setT_type(rset.getString("T_TYPE"));
				tregist.setLanguage(rset.getString("LANGUAGE"));
				tregist.setT_start_time(rset.getString("T_START_TIME"));
				tregist.setT_end_time(rset.getString("T_END_TIME"));
				tregist.setPrice(rset.getInt("PRICE"));
				tregist.setT_detail(rset.getString("T_DETAIL"));
				tregist.setT_area(rset.getString("T_AREA"));
				tregist.setT_addr(rset.getString("T_ADDR"));
				tregist.setT_start_date(rset.getString("T_START_DATE"));
				tregist.setT_end_date(rset.getString("T_END_DATE"));
				tregist.setScore(rset.getFloat("SCORE"));
				tregist.setT_date(rset.getString("T_DATE"));

			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);

		}

		return tregist;
	}

	public int insertThumbnailContent(Connection con, Trip tr, Member m) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertTrip");
		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tr.getT_name());
			pstmt.setString(2, m.getUser_id());
			pstmt.setInt(3, tr.getT_max_num());
			pstmt.setString(4, tr.getT_type());
			pstmt.setString(5, tr.getLanguage());
			pstmt.setString(6, tr.getT_start_time());
			pstmt.setString(7, tr.getT_end_time());
			pstmt.setInt(8, tr.getPrice());
			pstmt.setString(9, tr.getT_detail());
			pstmt.setString(10, tr.getT_area());
			pstmt.setString(11, tr.getT_addr());
			pstmt.setString(12, tr.getT_loc());
			pstmt.setString(13, tr.getT_start_date());
			pstmt.setString(14, tr.getT_end_date());
			pstmt.setFloat(15, tr.getScore());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int tno = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				tno = rset.getInt("currval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return tno;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		

		String query = prop.getProperty("insertAttachment");
		System.out.println(fileList);

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getHosting_id());
				pstmt.setString(2, fileList.get(i).getOrigin_name());
				pstmt.setString(3, fileList.get(i).getChange_name());
				pstmt.setString(4, fileList.get(i).getFile_path());

				int level = 0;
				if (i != 0)
					level = 1;

				pstmt.setInt(5, level);

				result += pstmt.executeUpdate();
			}
			System.out.println("result : " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertTrip(Connection con, String tno, int price, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		System.out.println("Dao 에서 tno : " + tno);
		System.out.println("Dao 에서 price : " + price);

		String query = prop.getProperty("updatePrice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, price);
			pstmt.setString(2, tno);

			result = pstmt.executeUpdate();

			System.out.println("result : " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String selectVal(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String tno = "";

		String query = prop.getProperty("selectNext");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				tno = rset.getString("SELECTNEX");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return tno;
	}

	public Trip getTrip(Connection con, String userId) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Trip tregist = new Trip();

		String query = prop.getProperty("getTrip");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, userId);

			System.out.println("userId: " + userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				tregist.setT_id(rset.getString("T_ID"));
				tregist.setT_name(rset.getString("T_NAME"));
				tregist.setT_max_num(rset.getInt("T_MAX_NUM"));
				tregist.setT_type(rset.getString("T_TYPE"));
				tregist.setLanguage(rset.getString("LANGUAGE"));
				tregist.setT_start_time(rset.getString("T_START_TIME"));
				tregist.setT_end_time(rset.getString("T_END_TIME"));
				tregist.setPrice(rset.getInt("PRICE"));
				tregist.setT_detail(rset.getString("T_DETAIL"));
				tregist.setT_area(rset.getString("T_AREA"));
				tregist.setT_addr(rset.getString("T_ADDR")); 
				tregist.setT_start_date(rset.getString("T_START_DATE"));
				tregist.setT_end_date(rset.getString("T_END_DATE"));
				tregist.setScore(rset.getFloat("SCORE"));
				tregist.setT_date(rset.getString("T_DATE"));
				System.out.println(tregist);
				System.out.println("T_ADDR : " + rset.getString("T_ADDR"));
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);

		}

		return tregist;
	}

	public ArrayList<Attachment> getPicture(Connection con, String userId) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Attachment> list = null;
		Attachment pic = null;

		String query = prop.getProperty("getPic");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, userId);

			System.out.println("userId: " + userId);

			list = new ArrayList<Attachment>();
			rset = pstmt.executeQuery();

			while (rset.next()) {
				pic = new Attachment();
				pic.setPno(rset.getString("PNO"));
				pic.setHosting_id(rset.getString("HOSTING_ID"));
				pic.setOrigin_name(rset.getString("ORIGIN_NAME"));
				pic.setChange_name(rset.getString("CHANGE_NAME"));
				pic.setFile_path(rset.getString("FILE_PATH"));
				pic.setUpload_date(rset.getDate("UPLOAD_DATE"));
				pic.setFile_level(rset.getInt("FILE_LEVEL"));

				list.add(pic);
			}

			System.out.println("list : " + list);
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);

		}

		return list;

	}

	public T_RESERVATION selectTwo(Connection con, String tripNumber) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		T_RESERVATION trip_reservation = null;

		String query = prop.getProperty("TripReservationselectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tripNumber);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				trip_reservation = new T_RESERVATION();
				trip_reservation.setT_reser_no(Integer.parseInt(tripNumber));
				trip_reservation.setT_id(rset.getString("T_ID"));
				trip_reservation.setUser_id(rset.getString("USER_ID"));
				trip_reservation.setT_date(rset.getString("T_DATE"));
				trip_reservation.setGuest_num(rset.getInt("GUEST_NUM"));
				trip_reservation.setTotal_price(rset.getInt("TOTAL_PRICE"));

				System.out.println("Dao단 trip_reservation : " + trip_reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return trip_reservation;
	}

	public ArrayList<T_RESERVATION> selectReservation(Connection con) {

		ArrayList<T_RESERVATION> trip_list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectReservation");

		try {

			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			trip_list = new ArrayList<T_RESERVATION>();

			while (rset.next()) {
				T_RESERVATION t = new T_RESERVATION();
				t.setT_reser_no(rset.getInt(1));
				t.setT_id(rset.getString(2));
				t.setUser_id(rset.getString(3));
				t.setT_date(rset.getString(4));
				t.setGuest_num(rset.getInt(5));
				t.setTotal_price(rset.getInt(6));

				trip_list.add(t);

				System.out.println("Dao trip_list : " + trip_list);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return trip_list;
	}

	public int ReservationPrice(Connection con, T_RESERVATION trip_reservation) {
		System.out.println("Dao전달: " + trip_reservation);
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertReservation");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, trip_reservation.getT_id());
			pstmt.setString(2, trip_reservation.getUser_id());
			pstmt.setString(3, trip_reservation.getT_date());
			pstmt.setInt(4, trip_reservation.getGuest_num());
			pstmt.setInt(5, trip_reservation.getTotal_price());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public T_RESERVATION selectTripRecent(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectTripRecent");

		T_RESERVATION t = new T_RESERVATION();

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				t.setT_reser_no(rset.getInt(1));
				t.setT_id(rset.getString(2));
				t.setUser_id(rset.getString(3));
				t.setT_date(rset.getString(4));
				t.setGuest_num(rset.getInt(5));
				t.setTotal_price(rset.getInt(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;
	}

	public ArrayList<T_RESERVATION> selectReservationList(Connection con) {

		ArrayList<T_RESERVATION> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectReservation");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<T_RESERVATION>();

			while (rset.next()) {
				T_RESERVATION t = new T_RESERVATION();
				t.setT_reser_no(rset.getInt(1));
				t.setT_id(rset.getString(2));
				t.setUser_id(rset.getString(3));
				t.setT_date(rset.getString(4));
				t.setGuest_num(rset.getInt(5));
				t.setTotal_price(rset.getInt(6));

				list.add(t);
			}
			System.out.println("통계 Dao단에서의 list : " + list);

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int deleteTrip(Connection con, String tripNum) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteTrip");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, tripNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int tripTotalCount(Connection con, String t_id, String t_date) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("tripTotalCount");
		System.out.println("t_date 는 dao에서:"+t_date);
		System.out.println("t_id 는 dao에서 : " + t_id);
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, t_date);
			pstmt.setString(2, t_id);
		
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("GUEST_NUM");
			}
			
			System.out.println("예약 인원 제한 Dao : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Trip> selectList(Connection con, Member m) {
		
		ArrayList<Trip> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Trip>();
			
			while(rset.next()){
				Trip tr = new Trip();
				
				tr.setT_id(rset.getString("T_ID"));
				tr.setT_name(rset.getString("T_NAME"));
				tr.setHost_id(rset.getString("HOST_ID"));
				tr.setPrice(rset.getInt("PRICE"));
				tr.setT_max_num(rset.getInt("T_MAX_NUM"));
				tr.setT_addr(rset.getString("T_ADDR"));
				
				if(rset.getString("T_DATE") == null){
					tr.setT_date(new SimpleDateFormat("YY/MM/DD").format(Calendar.getInstance().getTime()));
				} else {
					tr.setT_date(rset.getString("T_DATE"));
				}
				
				list.add(tr);
			}
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int maxPeople(Connection con, String t_id) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("maxPeople");
		System.out.println("t_id 는 dao에서 : " + t_id);
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, t_id);
		
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("T_MAX_NUM");
			}
			
			System.out.println("최대 인원 제한 Dao : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteSearch(Connection con, String tripNum) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("deleteSearch");
		System.out.println("Delete Dao 단에서 t_id  : " + tripNum);
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, tripNum);
		
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("CNT");
			}
			
			System.out.println("남아있는 예약 수 Dao : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int modifySearch(Connection con, String tripNum) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("modifySearch");
		System.out.println("modify Dao 단에서 t_id  : " + tripNum);
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, tripNum);
		
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("CNT");
			}
			
			System.out.println("modify 남아있는 예약 수 Dao : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int cancelTrip(Connection con, String tripNumber, Trip delTrip, T_RESERVATION delRes) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		

		String query = prop.getProperty("cancelTripSearch");
		System.out.println("cancelTrip Dao 단에서 t_id  : " + tripNumber);
		System.out.println("cancelTrip Dao 단에서 delTrip  : " + delTrip);
		System.out.println("cancelTrip Dao 단에서 delRes  : " + delRes);
		
		try {
			pstmt = con.prepareStatement(query);	
			
			pstmt.setString(1, delRes.getT_date());
			pstmt.setString(2, tripNumber);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				delRes.setT_id(rset.getString("T_ID"));
				delRes.setT_date(rset.getString("T_DATE"));
				delRes.setTotal_price(rset.getInt("TOTAL_PRICE"));
				delRes.setUser_id(rset.getString("USER_ID"));
				delTrip.setT_name(rset.getString("T_NAME"));
				delTrip.setHost_id(rset.getString("HOST_ID"));
				
				
				System.out.println("T_ADDR : " + rset.getString("T_ADDR"));
			}

			
			System.out.println("cancelTrip Dao : " + rset);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
}
