package kh.manager.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import kh.manager.model.vo.MemberList;
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

public class mDao {

	private Properties prop;
	
	public mDao() {
		prop = new Properties();
		String fileName = mDao.class.getResource("/config/manager/manager-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberList> mList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<MemberList> result = new ArrayList<MemberList>();
		MemberList m = null;
		
		String query = prop.getProperty("selectAllMember");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				m = new MemberList();
				m.setUser_no(rset.getInt("USER_NO"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setBirthdate(rset.getString("BIRTH"));
				m.setR_hosting(rset.getInt("R_HOSTING"));
				m.setT_hosting(rset.getInt("T_HOSTING"));
				m.setJoin_date(rset.getDate("JOIN_DATE"));
				m.setrCnt(rset.getInt("RCNT"));
				m.setOauth((rset.getString("OAUTH").charAt(0)));
				result.add(m);
				System.out.println("DAO : "+m);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
				
		return result;
	}

	public ArrayList<Room> rList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Room> result = new ArrayList<Room>();
		Room r = null;
		
		String query = prop.getProperty("selectAllRoom");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				r = new Room();
				
				r.setR_id(rset.getString("R_ID"));
				r.setR_name(rset.getString("R_NAME"));
				r.setHost_id(rset.getString("HOST_ID"));
				r.setR_max_num(rset.getInt("R_MAX_NUM"));
				r.setR_type(rset.getString("R_TYPE"));
				r.setR_type2(rset.getString("R_TYPE2"));
				r.setR_option(rset.getString("R_OPTION"));
				r.setRoom_num(rset.getInt("ROOM_NUM"));
				r.setToilet_num(rset.getInt("TOILET_NUM"));
				r.setBed_num(rset.getInt("BED_NUM"));
				r.setR_detail(rset.getString("R_DETAIL"));
				r.setR_role(rset.getString("R_ROLE"));
				r.setPrice(rset.getInt("PRICE"));
				r.setR_area(rset.getString("R_AREA"));
				r.setR_addr(rset.getString("R_ADDR"));
				r.setR_loc(rset.getString("R_LOC"));
				r.setR_start_date(rset.getDate("R_START_DATE"));
				r.setR_end_date(rset.getDate("R_END_DATE"));
				r.setScore(rset.getFloat("SCORE"));
				r.setR_date(rset.getDate("R_DATE"));
				System.out.println("dao"+r);
				result.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<Trip> tList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Trip> result = new ArrayList<Trip>();
		Trip t = null;
		
		String query = prop.getProperty("selectAllTrip");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				t = new Trip();
				
				t.setT_id(rset.getString("T_ID"));
				t.setT_name(rset.getString("T_NAME"));
				t.setHost_id(rset.getString("HOST_ID"));
				t.setT_max_num(rset.getInt("T_MAX_NUM"));
				t.setT_type(rset.getString("T_TYPE"));
				t.setLanguage(rset.getString("LANGUAGE"));
				t.setPrice(rset.getInt("PRICE"));
				t.setT_area(rset.getString("T_AREA"));
				t.setScore(rset.getFloat("SCORE"));
				t.setT_date(rset.getString("T_DATE"));
				result.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public HashMap<String, Object> selectMember(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> m = null;
		
		String query = prop.getProperty("selectOneMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new HashMap<String, Object>();
				
				m.put("USER_NO", rset.getInt("USER_NO"));
				m.put("USER_ID",rset.getString("USER_ID"));
				m.put("USER_NAME",rset.getString("USER_NAME"));
				m.put("EMAIL",rset.getString("EMAIL"));
				m.put("PHONE",rset.getString("PHONE"));
				m.put("GENDER",rset.getString("GENDER").charAt(0));
				m.put("BIRTH",rset.getString("BIRTH"));
				m.put("R_HOSTING",rset.getInt("R_HOSTING"));
				m.put("T_HOSTING",rset.getInt("T_HOSTING"));
				m.put("JOIN_DATE", rset.getDate("JOIN_DATE"));
				m.put("RCNT",rset.getInt("RCNT"));
				m.put("OAUTH",rset.getString("OAUTH").charAt(0));

				System.out.println("selectOneMemeber : "+m);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return m;
	}

	public int updateMember(Connection con, MemberList m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		String[] a = m.getBirthdate().split(", ");
		String[] b = m.getBirthdate().split(",");
		
		if(b[1].equals(" ")||a[0].equals(" ")){
			//birth가 null일때
			query = prop.getProperty("updateBirthNull");
		}else{
			query = prop.getProperty("UpdateMember");
		}

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUser_id());
			pstmt.setString(2, m.getUser_name());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setInt(5, m.getR_hosting());
			pstmt.setInt(6, m.getT_hosting());
			
			if(b[1].equals(" ")|| a[0].equals(" ")){
				pstmt.setInt(7, m.getUser_no());
			}else{
				pstmt.setString(7, m.getBirthdate());
				pstmt.setInt(8, m.getUser_no());
			}
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int deleteMember(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public HashMap<String, Object> selectRoom(Connection con, String tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> t = null;
		
		String query = prop.getProperty("selectOneTrip");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tno);
			pstmt.setString(2, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new HashMap<String, Object>();
				
				t.put("T_ID", rset.getString("T_ID"));
				t.put("T_NAME",rset.getString("T_NAME"));
				t.put("HOST_ID",rset.getString("HOST_ID"));
				t.put("T_MAX_NUM",rset.getString("T_MAX_NUM"));
				t.put("T_TYPE",rset.getString("T_TYPE"));
				t.put("LANGUAGE",rset.getString("LANGUAGE"));
				t.put("T_START_TIME",rset.getString("T_START_TIME"));
				t.put("T_END_TIME",rset.getString("T_END_TIME"));
				t.put("PRICE",rset.getInt("PRICE"));
				t.put("T_DETAIL", rset.getString("T_DETAIL"));
				t.put("T_AREA",rset.getString("T_AREA"));
				t.put("T_ADDR",rset.getString("T_ADDR"));
				t.put("T_LOC",rset.getString("T_LOC"));
				t.put("T_START_DATE",rset.getString("T_START_DATE"));
				t.put("T_END_DATE",rset.getString("T_END_DATE"));
				t.put("SCORE",rset.getFloat("SCORE"));
				t.put("T_DATE",rset.getString("T_DATE"));
				t.put("RCNT",rset.getInt("RCNT"));
				
				System.out.println("selectOneRoom : "+t);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return t;
	}

	public int updateRoom(Connection con, Trip t) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
			query = prop.getProperty("updateRoom");
/*			 T_NAME =?, T_MAX_NUM =?, T_TYPE =?, LANGUAGE = ?, 
		     T_START_TIME=?, T_END_TIME=?, 
		    		 PRICE=?, T_DETAIL=?, T_AREA=?, T_ADDR=?, T_LOC=?, T_START_DATE=?, T_END_DATE=? 
		    				 WHERE T_ID = ?*/
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, t.getT_name());
			pstmt.setInt(2, t.getT_max_num());
			pstmt.setString(3, t.getT_type());
			pstmt.setString(4, t.getLanguage());
			pstmt.setString(5, t.getT_start_time());
			pstmt.setString(6, t.getT_end_time());
			pstmt.setInt(7, t.getPrice());
			pstmt.setString(8, t.getT_detail());
			pstmt.setString(9, t.getT_area());
			pstmt.setString(10, t.getT_addr());
			pstmt.setString(11, t.getT_loc());
			pstmt.setString(12, t.getT_start_date());
			pstmt.setString(13, t.getT_end_date());
			pstmt.setString(14, t.getT_id());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int deleteMember(Connection con, String tno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRoom");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

}
